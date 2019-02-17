/**
 * 
 */
class TrDeployable_DropJammer extends TrDeployable_Sensor;

function bool ShouldDetectPawn(Pawn P)
{
	// We detect both teams.
	return P != none && P.IsA('TrPawn') && P.IsAliveAndWell();
}

simulated function OnPowerStatusChanged()
{
	local Pawn P;
	local TrPawn TrP;

	super.OnPowerStatusChanged();

	// Loop through all detected pawns.
	foreach m_DetectedPawns(P)
	{
		TrP = TrPawn(P);
		if (TrP != none)
		{
			// If we are powered, simulate re-entering the drop jammer.
			if (r_bIsPowered)
			{
				TrP.OnEnteredDropJammer(self);
			}
			// If we aren't powered, simulate exiting the drop jammer.
			else
			{
				TrP.OnExitedDropJammer(self);
			}
		}
	}
}

function AddDetectedPawn(Pawn DetectedPawn)
{	local TrPawn TrP;

	TrP = TrPawn(DetectedPawn);
	if (TrP != none) TrP.OnEnteredDropJammer(self);

	super.AddDetectedPawn(DetectedPawn);
}

/** Removes detected enemy. */
function RemoveDetectedPawn(Pawn DetectedPawn)
{
	local TrPawn TrP;

	TrP = TrPawn(DetectedPawn);
	if (TrP != none) TrP.OnExitedDropJammer(self);

	super.RemoveDetectedPawn(DetectedPawn);
}

simulated state Blownup
{
ignores AddDetectedPawn;
	simulated function BeginState(Name PreviousStateName)
	{
		local int i;

		// When blowing up remove all pawns in case the collision proxy doesn't handle them.
		for(i = 0; i < m_DetectedPawns.Length; i++ )
		{
			if( m_DetectedPawns[i] != none )
			{
				OnPawnExitedCollisionProxy(m_DetectedPawns[i]);
			}
		}

        super.BeginState(PreviousStateName);
	}
}

simulated function Texture2D GetMarker()
{
	return class'TrHud'.default.DeployableJammer;
}

defaultproperties
{
   m_bRequireLOS=False
   m_fDamageRadius=1000.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   m_nIconStackId=42
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_DropJammer:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_DropJammer:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      Scale=1.500000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=1200
   m_nCriticalHealthThreshold=200
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Drop Jammer"
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable_Sensor:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable_Sensor:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable_Sensor:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable_Sensor:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable_Sensor:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable_Sensor:PathRenderer'
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
   Name="Default__TrDeployable_DropJammer"
   ObjectArchetype=TrDeployable_Sensor'TribesGame.Default__TrDeployable_Sensor'
}
