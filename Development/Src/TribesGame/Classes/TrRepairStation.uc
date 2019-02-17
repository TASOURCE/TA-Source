class TrRepairStation extends TrStation;

var bool m_bIsStationOpen;
var float m_fStationOpenDelay;

var TrAnimNodeBlendList m_RepairStationBlendList;
var SkelControlSingleBone m_RepairGunControl;

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        // Set the animation tree containing morph targets.
		m_Mesh.SetAnimTreeTemplate(default.m_Mesh.AnimTreeTemplate);
    }
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	if (SkelComp == m_Mesh && m_Mesh.Animations != none)
	{
		m_RepairStationBlendList = TrAnimNodeBlendList(SkelComp.Animations.FindAnimNode('RepairStationBlendList'));
		m_RepairGunControl = SkelControlSingleBone(SkelComp.FindSkelControl('RepairGunControl'));
	}
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    if (SeqNode != None && SeqNode.AnimSeqName == 'CloseWGun' && SeqNode.NodeTotalWeight > 0.0f && m_Collision.GetPawnsInStation() > 1)
    {
		m_bIsStationOpen = true;

		if (m_RepairStationBlendList != none)
			m_RepairStationBlendList.SetActiveChild(1, 0);

		if (m_RepairGunControl != none)
			m_RepairGunControl.SetSkelControlActive(false);
    }
}

simulated function PlayStationEnteredEffects()
{
	// If we aren't open, open up.
	if (!m_bIsStationOpen)
	{
		m_bIsStationOpen = true;

		if (m_RepairStationBlendList != none)
			m_RepairStationBlendList.SetActiveChild(1, 0);

		if (m_RepairGunControl != none)
			m_RepairGunControl.SetSkelControlActive(false);
	}
}

simulated function PlayStationLeftEffects()
{
	SetTimer(m_fStationOpenDelay, false, 'CloseStation');
}

simulated function PawnGrabbedRepairTool()
{
	bForceNetUpdate = true;

	m_bIsStationOpen = false;

	if (m_RepairStationBlendList != none)
		m_RepairStationBlendList.SetActiveChild(0, 0);

	if (m_RepairGunControl != none)
		m_RepairGunControl.SetSkelControlActive(true);
}

simulated function CloseStation()
{
	if (m_Collision.GetPawnsInStation() <= 0 && m_bIsStationOpen)
	{
		bForceNetUpdate = true;

		m_bIsStationOpen = false;

		if (m_RepairStationBlendList != none)
			m_RepairStationBlendList.SetActiveChild(0, 0);
	}
}

simulated function Texture2D GetMarker()
{
	return class'TrHUD'.default.BaseRepairStation;
}

defaultproperties
{
   m_fStationOpenDelay=3.000000
   StationCollisionClass=Class'TribesGame.TrRepairStationCollision'
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ObjectiveMesh'
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrRepairStation:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=0
   m_sScreenName="Repair Station"
   m_bReceivesPowerFromGenerator=False
   m_bHasPromptText=True
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrStation:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrStation:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrStation:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrStation:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrStation:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   m_fPromptMessageTime=3.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrStation:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrStation:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrStation:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrStation:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrStation:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrStation:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bPostRenderIfNotVisible=True
   CollisionComponent=CollisionMesh
   Name="Default__TrRepairStation"
   ObjectArchetype=TrStation'TribesGame.Default__TrStation'
}
