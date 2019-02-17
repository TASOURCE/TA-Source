class TrDeployable_PrismMine extends TrDeployable
	implements(Interface_TrTripNotifier)
	native;

var array<TrTripActor> m_aTripActors;
var float m_fPrismRadius;
var name m_nSocketTraceName;

var class<TrDmgType_Base> m_DamageType;
var float m_fSleepTimeAfterHit;
var int m_DamageAmount;

var ParticleSystem      m_LaserTemplate;
var(Sounds) SoundCue    m_ActivateSound;
var(Sounds) SoundCue    m_DeactivateSound;
var(Sounds) SoundCue    m_HitSound;

simulated function CreateTripActor(TrDeployable_PrismMine Right, vector LeftLocation, vector RightLocation)
{
	local TrTripActor NewTrip;
	local vector TripLocation, LookDirection;

	// Calculate the direction of the trip, and the mid-point for bounds purposes.
	LookDirection = RightLocation - LeftLocation;
	TripLocation = LeftLocation + (LookDirection) / 2.0f;

	// Spawn and initialize the trip actor.
	NewTrip = Spawn(class'TrTripActor',,, TripLocation, rotator(Normal(LookDirection)),,true);
	NewTrip.m_fSleepTime = m_fSleepTimeAfterHit;
	NewTrip.InitializeTripPhysics(self, Right);
}

simulated function DestroyTripActor(TrTripActor DestroyTrip)
{
	// Destroy the trip actor.
	DestroyTrip.DestroyNotify(self);
}

/** Add a trip actor to our list */
simulated function AddTripActor(TrTripActor NewTrip)
{
	local int Index;

	// Add the trip actor.
	Index = m_aTripActors.Find(NewTrip);
	if (Index == INDEX_NONE)
		m_aTripActors.AddItem(NewTrip);
}

/** Remove a trip actor from our list */
simulated function RemoveTripActor(TrTripActor RemoveTrip)
{
	local int Index;

	// Remove the trip actor.
	Index = m_aTripActors.Find(RemoveTrip);
	if (Index != INDEX_NONE)
		m_aTripActors.Remove(Index, 1);
}

/** Notify the owner of the trip being activated */
simulated function TripActivated(Pawn Other, vector ActivateLocation, TrTripActor TripActor)
{
	// Ignore trip if pointers don't line up or we aren't powered.
	if (Other == none || TripActor == none || !r_bIsPowered)
		return;

	// Ignore trip if we are on the same team.
	if (m_Controller != none && m_Controller.GetTeamNum() == Other.GetTeamNum())
		return;

	// Play the 'hit' sound.
	PlaySound(m_HitSound,,,,ActivateLocation);

	// Apply damage to the enemy.
	Other.TakeDamage(m_DamageAmount, m_Controller, ActivateLocation, vect(0,0,0), m_DamageType);

	// Tell the trip actor to sleep for a bit.
	TripActor.GoToSleep(r_bIsPowered);
}

/** Called to get the ParticleSystem used for effects */
simulated function ParticleSystem GetParticleSystemName()
{
	return m_LaserTemplate;
}

/** Fetch the socket position in world-space where the trip starts */
simulated event bool GetTripSocketPosition(bool bIsLeft, out vector SocketPosition)
{
	local bool bSocketFound;

	bSocketFound = m_Mesh.GetSocketWorldLocationAndRotation(m_nSocketTraceName, SocketPosition);

	return bSocketFound;
}

/** Called when the trip actor is awake */
simulated event OnTripAwake()
{
	if (m_ActivateSound != none)
		PlaySound(m_ActivateSound);

    if( m_OnlineSound != None && m_OnlineSound.SoundCue != None && !m_bInstantOnlineSound && !m_bAutoPlayOnlineSound )
    {
        m_OnlineSound.Play();
    }
}

/** Called when the trip actor is asleep */
simulated event OnTripSleep()
{
	if (m_DeactivateSound != none)
		PlaySound(m_DeactivateSound);

    if( m_OnlineSound != None )
    {
        m_OnlineSound.FadeOut(1.f, 0.f);
    }
}

simulated function DeployComplete()
{
	local TrDeployable_PrismMine AdjacentMine;
	local vector TraceStart, TraceEnd;

	super.DeployComplete();

	if (Role == ROLE_Authority)
	{
		GetTripSocketPosition(true, TraceStart);

		// BE_TODO: Connect to adjacent prism mines.
		// Loop through all adjacent prism mines we have a clear trace to.
		foreach VisibleCollidingActors(class'TrDeployable_PrismMine', AdjacentMine, m_fPrismRadius, TraceStart)
		{
			AdjacentMine.GetTripSocketPosition(false, TraceEnd);

			// Make sure we have line-of-sight to the prism mine and that it is deployed.
			if (AdjacentMine.m_bIsDeployed && NoConnectionExists(AdjacentMine) && IsInLOS(AdjacentMine, TraceStart, TraceEnd))
				CreateTripActor(AdjacentMine, TraceStart, TraceEnd);
		}
	}
}

simulated function bool NoConnectionExists(TrDeployable_PrismMine AdjacentMine)
{
	local TrTripActor CurrTrip;

	// Loop through all trip actors.
	foreach m_aTripActors(CurrTrip)
	{
		// Make sure we don't have an existing connection to this mine.
		if ((CurrTrip.r_Left == self && CurrTrip.r_Right == AdjacentMine) || 
			(CurrTrip.r_Left == AdjacentMine && CurrTrip.r_Right == self))
		{
			return false;
		}
	}

	return true;
}

simulated function OnPowerStatusChanged()
{
	local TrTripActor CurrActor;

	super.OnPowerStatusChanged();

	// Notify our trip actors of the power status.
	foreach m_aTripActors(CurrActor)
	{
		CurrActor.GoToSleep(r_bIsPowered);
	}
}

simulated state Blownup
{
	simulated function BeginState(Name PreviousStateName)
	{
		local TrTripActor CurrentTrip;

		// Loop through all of our trip actor's, and destroy them.
		foreach m_aTripActors(CurrentTrip)
		{
			DestroyTripActor(CurrentTrip);
		}

		// Clear trip actor array.
		m_aTripActors.Remove(0, m_aTripActors.Length);

        super.BeginState(PreviousStateName);
	}
}

defaultproperties
{
   m_fPrismRadius=750.000000
   m_nSocketTraceName="WSO_Emit_01"
   m_DamageType=Class'TribesGame.TrDmgType_PrismMine'
   m_fSleepTimeAfterHit=8.000000
   m_DamageAmount=650
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Scale=1.400000
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployable:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployable:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_PrismMine:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_PrismMine:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      Scale=1.400000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_bAutoPlayOnlineSound=False
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=ShieldMesh
   Components(6)=OnlineSound
   Components(7)=CriticalSound
   Components(8)=ShieldHitSound
   Components(9)=PowerDownSound
   Components(10)=DestroyedSound
   CollisionComponent=ObjectiveMesh
   Name="Default__TrDeployable_PrismMine"
   ObjectArchetype=TrDeployable'TribesGame.Default__TrDeployable'
}
