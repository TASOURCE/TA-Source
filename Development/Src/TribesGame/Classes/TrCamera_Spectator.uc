class TrCamera_Spectator extends Camera
	config(Game);

/** Wrapper for FreeCamDistance to smoothly interpolate to varying distances. */
var transient float m_fInterpedCameraDistance;

/** Speed to interpolate the camera when zooming in and out of a view target. */
var() float m_fCameraDistanceInterpSpeed;

/** Z offsets when viewing an actor. */
var() float m_fPawnZOffset;

/** The fastest we can go when spectating. */
var config float m_fMaxSpeed;

/** The farthest/closest we can go from an actor that we're spectating. */
var config float m_MaxCamDistance;
var() float m_MinCamDistance;

var() float m_fMaxFixedViewCamDistance;

/** Should we view a camera bookmark on next/previous view? */
var transient bool m_bViewCameraBookmarks;

/** Should we view a generator on next/previous view? */
var transient bool m_bViewGenerators;

/** Should we view a flag stand on next/previous view? */
var transient bool m_bViewFlagStands;

/** Should we view a flag on next/previous view? */
var transient bool m_bViewFlags;

/** Should we view a vehicle on next/previous view? */
var transient bool m_bViewVehicles;

/** Should we view the fastest player on next/previous view? */
var transient bool m_bFastestPlayer;

/** Should we view through the view target's eyes? */
var() transient bool m_bViewTargetEyes;

var() transient bool m_bViewFixed3p;

/** Keep track of which pawn we are currently hiding, if any.*/
var TrPawn m_HiddenViewTargetPawn;

/** Keep track of hidden flag in case we're holding it. */
var TrFlagBase m_HiddenFlag;

function InitializeFor(PlayerController PC)
{
	super.InitializeFor(PC);

	// Start off at the base FreeCamDistance.
	m_fInterpedCameraDistance = FreeCamDistance;
}

simulated event UpdateCamera(float DeltaTime)
{
	local Vector CamLoc;
	local Rotator CamRot;
	local TPOV		NewPOV;
	local float		DurationPct, BlendPct;

	PCOwner.GetPlayerViewPoint(CamLoc, CamRot);

	CamRot.Roll = 0;

	// update color scale interpolation
	if (bEnableColorScaleInterp)
	{
		BlendPct = FClamp((WorldInfo.TimeSeconds - ColorScaleInterpStartTime)/ColorScaleInterpDuration,0.f,1.f);
		ColorScale = VLerp(OriginalColorScale,DesiredColorScale,BlendPct);
		// if we've maxed
		if (BlendPct == 1.f)
		{
			// disable further interpolation
			bEnableColorScaleInterp = FALSE;
		}
	}

	// Reset aspect ratio and postprocess override associated with CameraActor.
	bConstrainAspectRatio = FALSE;
	CamOverridePostProcessAlpha = 0.f;

	// Don't update outgoing viewtarget during an interpolation when bLockOutgoing is set.
	if( PendingViewTarget.Target == None || !BlendParams.bLockOutgoing )
	{
		// Update current view target
		CheckViewTarget(ViewTarget);
		UpdateViewTarget(ViewTarget, DeltaTime);
	}

	// our camera is now viewing there
	NewPOV					= ViewTarget.POV;
	ConstrainedAspectRatio	= ViewTarget.AspectRatio;

	// if we have a pending view target, perform transition from one to another.
	if( PendingViewTarget.Target != None )
	{
		BlendTimeToGo -= DeltaTime;

		// Reset aspect ratio.  The call to UpdateViewTarget() may turn this back on.
		bConstrainAspectRatio = FALSE;

		// Update pending view target
		CheckViewTarget(PendingViewTarget);
		UpdateViewTarget(PendingViewTarget, DeltaTime);

		// Blend, but only if we have LOS
		if( BlendTimeToGo > 0 && FastTrace(CamLoc, PendingViewTarget.Target.Location,,true) )
		{
			DurationPct	= (BlendParams.BlendTime - BlendTimeToGo) / BlendParams.BlendTime;

			switch (BlendParams.BlendFunction)
			{
			case VTBlend_Linear:
				BlendPct = Lerp(0.f, 1.f, DurationPct);
				break;
			case VTBlend_Cubic:
				BlendPct = FCubicInterp(0.f, 0.f, 1.f, 0.f, DurationPct);
				break;
			case VTBlend_EaseIn:
				BlendPct = FInterpEaseIn(0.f, 1.f, DurationPct, BlendParams.BlendExp);
				break;
			case VTBlend_EaseOut:
				BlendPct = FInterpEaseOut(0.f, 1.f, DurationPct, BlendParams.BlendExp);
				break;
			case VTBlend_EaseInOut:
				BlendPct = FInterpEaseInOut(0.f, 1.f, DurationPct, BlendParams.BlendExp);
				break;
			}

			// Update pending view target blend
			NewPOV = BlendViewTargets(ViewTarget, PendingViewTarget, BlendPct);
		}
		else
		{
			// we're done blending, set new view target
			ViewTarget = PendingViewTarget;

			// clear pending view target
			PendingViewTarget.Target		= None;
			PendingViewTarget.Controller	= None;

			BlendTimeToGo = 0;

			// our camera is now viewing there
			NewPOV = PendingViewTarget.POV;
		}

		if( bConstrainAspectRatio )
		{
			// NOTE: We don't interpolate aspect ratio since either the prior or pending view target's AspectRatio
			//       may be the default value (1.3333) unless the view target has a camera actor set to override
			//       the aspect ratio.  We'll just use the pending view target's aspect.
			ConstrainedAspectRatio = PendingViewTarget.AspectRatio;
		}
	}

	// Cache results
	FillCameraCache(NewPOV);

	if (bEnableFading && FadeTimeRemaining > 0.0)
	{
		FadeTimeRemaining = FMax(FadeTimeRemaining - DeltaTime, 0.0);
		if (FadeTime > 0.0)
		{
			FadeAmount = FadeAlpha.X + ((1.f - FadeTimeRemaining/FadeTime) * (FadeAlpha.Y - FadeAlpha.X));
		}
	}
}

function UpdateViewTarget(out TViewTarget OutVT, float DeltaTime)
{
	local vector Loc, Pos, HitLocation, HitNormal, CamDist;
	local rotator Rot;
	local Actor HitActor;
	local CameraActor CamActor;
	local TrPawn TPawn;
	local TrVehicle V;
	local bool bShowOldHiddenPawn;
	local TrFlagBase FlagActor;

	bShowOldHiddenPawn = true;

	// Interpolate the camera distance.
	if( m_fInterpedCameraDistance != FreeCamDistance )
	{
		m_fInterpedCameraDistance = FInterpTo(m_fInterpedCameraDistance, FreeCamDistance, DeltaTime, m_fCameraDistanceInterpSpeed);
	}

	// Don't update outgoing viewtarget during an interpolation, but allow the rotation to continue to update.
	if( PendingViewTarget.Target != None && OutVT == ViewTarget && BlendParams.bLockOutgoing )
	{
		OutVT.POV.Rotation = Owner.Rotation;
	}
	else
	{
		// Default FOV on viewtarget
		OutVT.POV.FOV = DefaultFOV;

		CamActor = CameraActor(OutVT.Target);
		if( CamActor != None )
		{
			// Viewing through a camera actor.
			CamActor.GetCameraView(DeltaTime, OutVT.POV);

			// Grab aspect ratio from the CameraActor.
			bConstrainAspectRatio	= bConstrainAspectRatio || CamActor.bConstrainAspectRatio;
			OutVT.AspectRatio		= CamActor.AspectRatio;
			OutVT.POV.FOV           = CamActor.FOVAngle;

			// See if the CameraActor wants to override the PostProcess settings used.
			CamOverridePostProcessAlpha = CamActor.CamOverridePostProcessAlpha;
			CamPostProcessSettings = CamActor.CamOverridePostProcess;
		}
		else if( OutVT.Target == Owner )
		{
			OutVT.POV.Location = OutVT.Target.Location;
			OutVT.POV.Rotation = OutVT.Target.Rotation;
		}
		else
		{
			V = TrVehicle(OutVT.Target);
			TPawn = TrPawn(OutVT.Target);

			if( TPawn != none && V == none )
			{
				// Try to see if the pawn is riding in a vehicle.
				V = TrVehicle(TPawn.GetVehicleBase());
			}

			// Starting locations.
			if( V != none )
			{
				Loc = V.Location;
			}
			else if( TPawn != none )
			{
				if( m_bViewFixed3p )
				{
					TPawn.m_bUseSmoothNetReceiveRotation = true;
					if( FreeCamDistance == m_MinCamDistance )
					{
						if( m_HiddenViewTargetPawn == none )
						{
							m_HiddenViewTargetPawn = TPawn;
						}
						else if( m_HiddenViewTargetPawn != TPawn )
						{
							// Show the old one.
							ShowHiddenPawn();

							// Update and hide the new one.
							m_HiddenViewTargetPawn = TPawn;
						}
						TPawn.Mesh.SetHidden(true);
						TPawn.Mesh.SetOwnerNoSee(true);
						TPawn.SetOverlayMeshHidden(true);

						// Hide flag if pawn is holding it.
						if( TPawn.GetTribesReplicationInfo().bHasFlag )
						{
							foreach TPawn.BasedActors(class'TrFlagBase', FlagActor)
							{
								m_HiddenFlag = FlagActor;
								break;
							}
							if( m_HiddenFlag != none )
							{
								m_HiddenFlag.SetHidden(true);
							}
						}

						bShowOldHiddenPawn = false;

						Loc = TPawn.Mesh == none ? TPawn.Location : TPawn.Mesh.GetBoneLocation('Pelvis');
						Loc.Z += m_fPawnZOffset;

						OutVT.POV.Location = Loc;
						OutVT.POV.Rotation.Yaw = TPawn.Rotation.Yaw;
						OutVT.POV.Rotation.Pitch = TPawn.m_nSmoothedRemoteViewPitch;
					}
					else
					{
						bShowOldHiddenPawn = true;

						OutVT.POV.Rotation.Yaw = TPawn.Rotation.Yaw;
						OutVT.POV.Rotation.Pitch = TPawn.m_nSmoothedRemoteViewPitch;

						Loc = TPawn.Mesh == none ? TPawn.Location : TPawn.Mesh.GetBoneLocation('Pelvis');
						Loc.Z += m_fPawnZOffset;

						CamDist.X = FMax(-m_fInterpedCameraDistance,-m_fMaxFixedViewCamDistance);
						Loc += CamDist >> OutVT.POV.Rotation;

						HitActor = Trace(HitLocation, HitNormal, Loc, TPawn.Location, FALSE, vect(12,12,12));
						OutVT.POV.Location = (HitActor == None) ? Loc : HitLocation;
					}
				}
				else
				{
					bShowOldHiddenPawn = true;
					TPawn.m_bUseSmoothNetReceiveRotation = false;
					if( TPawn.DrivenVehicle != none )
					{
						Loc = TPawn.DrivenVehicle.Location;
					}
					else if( TPawn.m_RidingVehicle != none )
					{
						Loc = TPawn.m_RidingVehicle.Location;
					}
					else
					{
						Loc = TPawn.Mesh == none ? TPawn.Location : TPawn.Mesh.GetBoneLocation('Pelvis');
						Loc.Z += m_fPawnZOffset;
					}
				}
			}
			else 
			{
				Loc = OutVT.Target.Location;
			}
			
			if( TPawn == none || V != none || (!m_bViewTargetEyes && !m_bViewFixed3p) )
			{
				// Transform location into rotation space.
				Rot = Owner.Rotation;
				Loc += FreeCamOffset >> Rot;
				Pos = Loc - Vector(Rot) * m_fInterpedCameraDistance;
				HitActor = Trace(HitLocation, HitNormal, Pos, Loc, FALSE, vect(12,12,12));
				OutVT.POV.Location = (HitActor == None) ? Pos : HitLocation;
				OutVT.POV.Rotation = Rot;
			}
		}

		// Apply camera modifiers at the end (view shakes for example)
		ApplyCameraModifiers(DeltaTime, OutVT.POV);
	}

	if( bShowOldHiddenPawn )
	{
		ShowHiddenPawn();
	}
	
	//`log( WorldInfo.TimeSeconds  @ GetFuncName() @ OutVT.Target @ OutVT.POV.Location @ OutVT.POV.Rotation @ OutVT.POV.FOV );
}

function ShowHiddenPawn()
{
	if( m_HiddenViewTargetPawn != none )
	{
		// We are no longer in a mode that needs this pawn hidden.
		m_HiddenViewTargetPawn.Mesh.SetHidden(false);
		m_HiddenViewTargetPawn.Mesh.SetOwnerNoSee(false);
		m_HiddenViewTargetPawn.SetOverlayMeshHidden(false);
		m_HiddenViewTargetPawn = none;
	}

	if( m_HiddenFlag != none )
	{
		m_HiddenFlag.SetHidden(false);
		m_HiddenFlag = none;
	}
}

function SetFOV(float NewFOV)
{
	super.SetFOV(NewFOV);

	// Never lock the FOV for the spectator.
	bLockedFOV = false;
}

defaultproperties
{
   m_fCameraDistanceInterpSpeed=8.000000
   m_fPawnZOffset=50.000000
   m_fMaxSpeed=21000.000000
   m_MaxCamDistance=2000.000000
   m_MinCamDistance=75.000000
   m_fMaxFixedViewCamDistance=250.000000
   bEnableFading=True
   BlendParams=(BlendTime=0.300000,bLockOutgoing=True)
   Name="Default__TrCamera_Spectator"
   ObjectArchetype=Camera'Engine.Default__Camera'
}
