/*
 *	base class for sensor deployables
 */
class TrDeployable_Sensor extends TrDeployable
	native;

var array<Pawn> m_DetectedPawns;
var float m_fDetectionZOffset;

function bool CheckLOS(Pawn target)
{
	local Box BBox;
	local Vector StartTrace, EndTrace;

	// Get the targets bounding box.
	target.GetComponentsBoundingBox(BBox);

	// Calculate the sensor detection point.
	StartTrace = GetWeaponStartTraceLocation();
	StartTrace.Z += m_fDetectionZOffset;

	// Calculate the end trace position.
	EndTrace = (BBox.Min + BBox.Max) * 0.5f;

	return IsInLOS(target, StartTrace, EndTrace);
}

simulated function DeployComplete()
{
	Super.DeployComplete();

	// setup a timer to release pawns for scanners that require LOS
	if ( Role == ROLE_Authority )
	{
		SetTimer(1, true, 'ManageEnemiesOutOfSight');
	}
}

function ModifyDetectedPawn(Pawn DetectedPawn, bool detected)
{
	local bool isInDetectedList;
	local TrPawn TrP;
	local TrVehicle TrV;

	isInDetectedList = (m_DetectedPawns.Find(DetectedPawn)!=-1);

	if (!detected)
	{
		if (isInDetectedList)
		{
			if( IsEnemy(DetectedPawn) )
			{
				TrP = TrPawn(DetectedPawn);
				if (TrP != none) TrP.SetScannerDetect(false);
				TrV = TrVehicle(DetectedPawn);
				if (TrV != none) TrV.SetScannerDetect(false);
			}

			RemoveDetectedPawn(DetectedPawn);
		}
	}
	else
	{
		if (!isInDetectedList && r_bIsPowered)
		{
			if( IsEnemy(DetectedPawn) )
			{
				TrP = TrPawn(DetectedPawn);
				if (TrP != none) TrP.SetScannerDetect(true);
				TrV = TrVehicle(DetectedPawn);
				if (TrV != none) TrV.SetScannerDetect(true);
			}
			AddDetectedPawn(DetectedPawn);
		}
	}
}

function SetPowered(bool bEnabled)
{
	if( bEnabled )
	{
		// When the sensor comes online perform a scan for any currently encroaching pawns.
		if (m_CollisionProxy != none)
		{
			m_CollisionProxy.ForceProximityScan(r_fNewDetectionRadius);
		}
	}

	super.SetPowered(bEnabled);
}

/** Adds detected enemy. */
function AddDetectedPawn(Pawn DetectedPawn)
{
	local int i;
	
	// Make sure we aren't already tracking this pawn.
	for( i = 0; i < m_DetectedPawns.Length; i++ )
	{
		if( m_DetectedPawns[i] == DetectedPawn )
		{
			return;
		}
	}
	m_DetectedPawns.AddItem(DetectedPawn);
}

/** Removes detected enemy. */
function RemoveDetectedPawn(Pawn DetectedPawn)
{
	m_DetectedPawns.RemoveItem(DetectedPawn);
}

function ReleaseAllDetectedPawns()
{
	while (m_DetectedPawns.length>0)
	{
		ModifyDetectedPawn(m_DetectedPawns[0], false);
	}
}

//
//	On a timer, manage enemies inside our distance reach but possibly out of sight
//
function ManageEnemiesOutOfSight()
{
	if( r_Health > 0 )
	{
		ScanTargets();
		ReleaseOutOfSightEnemies();
	}
}

function ReleaseOutOfSightEnemies()
{
	local array<Pawn> OldPawns;
	local Pawn DetectedPawn;

	foreach m_DetectedPawns(DetectedPawn)
	{
		if (DetectedPawn == None || 
			(m_bRequireLOS && !CheckLOS(DetectedPawn)) || 
			!DetectedPawn.IsAliveAndWell())
		{
			OldPawns.AddItem(DetectedPawn);
		}
	}

	foreach OldPawns(DetectedPawn)
	{
		ModifyDetectedPawn(DetectedPawn, false);
	}
}

function bool ShouldDetectPawn(Pawn P)
{
	return IsEnemy(P);
}

//
//	collision has detected a pawn
//
function OnPawnDetectedByCollisionProxy(Pawn P)
{
	local Box BBox;

	// Invalid pawn, abort.
	if (P == none)
	{
		return;
	}

	P.GetComponentsBoundingBox(BBox);

	if ( r_bIsPowered && ShouldDetectPawn(P) && P.GetTeamNum() != 255 && P.IsAliveAndWell() )
	{
		if( !IsInRange(P) )
		{
			// If enemy is not in range, make sure they are not in our detected list.
			ModifyDetectedPawn(P, false);
		}
		else if ( !m_bRequireLOS || CheckLOS(P) )
		{
			// make sure we can see the enemy now (if required)
			ModifyDetectedPawn(P,true);
		}
	}
}

function bool IsInRange(Pawn P)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float Radius;

	TrPRI = TrPlayerReplicationInfo(P.PlayerReplicationInfo);
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none && VM.m_fSensorDistancePctBuff > 0.0 )
		{
			Radius = m_fDamageRadius * (1.0 - VM.m_fSensorDistancePctBuff);

			// The target has a distance buff applied. Check how close they are.
			if( VSizeSq(Location - P.Location) > (Radius * Radius) )
			{
				// Pawn is too far away.
				return false;
			}
		}
	}

	return true;
}

function OnPawnExitedCollisionProxy(Pawn P)
{
	if ( ShouldDetectPawn(P) )
	{
		ModifyDetectedPawn(P,false);
	}
}

simulated function bool IsDeployed()
{
	return m_bIsDeployed;
}

//
//	scan for targets.  used at startup and when power comes on, or to check for pawns that have come into line of sight
//
simulated function ScanTargets()
{
    local Pawn aPawn;

	if (!IsDeployed() || !r_bIsPowered || r_Health == 0) return;

	// get new pawns
    if (m_CollisionProxy != None)
    {
		m_CollisionProxy.ForceProximityScan(m_fDamageRadius);
        foreach m_CollisionProxy.m_NearByPawns(aPawn)
        {
			OnPawnDetectedByCollisionProxy(aPawn);
        }
    }
}

simulated function OnPowerStatusChanged()
{
	super.OnPowerStatusChanged();

	if (Role==ROLE_Authority)
	{
		if (r_bIsPowered)
		{
			ScanTargets();
		}
		else
		{
			ReleaseAllDetectedPawns();
		}
	}
}

simulated state Blownup
{
ignores ManageEnemiesOutOfSight;
	simulated function BeginState(Name PreviousStateName)
	{
        ClearTimer('ManageEnemiesOutOfSight');
		ReleaseAllDetectedPawns();
        super.BeginState(PreviousStateName);
	}

	simulated event EndState( Name NextStateName )
    {
		ScanTargets();
		super.EndState(NextStateName);
    }
}

simulated function Texture2D GetMarker()
{
	return class'TrHud'.default.DeployableSensor;
}

defaultproperties
{
   m_fTimeToDeploySecs=1.000000
   m_fDamageRadius=160.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
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
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
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
   m_sScreenName="Sensor"
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
   Name="Default__TrDeployable_Sensor"
   ObjectArchetype=TrDeployable'TribesGame.Default__TrDeployable'
}
