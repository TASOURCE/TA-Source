/*
 * 
 */
class TrDeployable_BackupGenerator extends TrDeployable;

var TrGameObjective m_PoweredFriend;

simulated function DeployComplete()
{
	super.DeployComplete();
	PowerNearestFriend();
}

function bool MainGeneratorIsOnline()
{
	if (m_MyMainGenerator!=None) 
		return m_MyMainGenerator.IsGeneratingPower();

	return true;
}

//
function PowerNearestFriend()
{
	local TrGameObjective dep, friendDep;
	local float dist, closestDist;

	if (!m_bIsDeployed || Role != ROLE_Authority || r_bInDestroyedState) return;

	if (m_PoweredFriend!=None)
	{
		return;
	}

	if (MainGeneratorIsOnline())
	{
		// main generator is working - do nothing
		return;
	}

    // main is down - find nearest friend
	closestDist=-1;
    ForEach WorldInfo.AllNavigationPoints(class'TrGameObjective',dep)
    {
		if( (dep.DefenderTeamIndex == DefenderTeamIndex) && 
			 TrDeployable_BackupGenerator(dep)==None && 
			 TrPowerGenerator(dep)==None && 
			 !dep.r_bIsPowered && 
			 (TrDeployable(dep)==None || !TrDeployable(dep).r_bInDestroyedState) )
        {
			dist = VSize(Location-dep.Location);
			if (closestDist<0 || dist<closestDist)
			{
				friendDep = dep;
				closestDist = dist;
			}
        }
    }

	// found one close enough?  power him up
	if (friendDep!=None && closestDist<=m_fDamageRadius)
	{
		m_PoweredFriend = friendDep;
		//`log(self@"Providing backup power to "@m_PoweredFriend);
		m_PoweredFriend.SetPowered(true);
	}
}

function ReleasePoweredFriend()
{
	if (m_PoweredFriend!=None)
	{
		//`log(self@"Removing backup power from "@m_PoweredFriend);
		if (!MainGeneratorIsOnline()) 
			m_PoweredFriend.SetPowered(false);

		m_PoweredFriend = None;
	}
}

//
//	Override - we are a backup generator - no need to pulse ourself
//
function PulseBackupGenerators();

//
//	schedule a power check when we are notified of changes in the power system
//	Otherwise you get re-entrant with deployables notifying that their power changed in responses to changes made here
//
function AsynchPowerCheck()
{
	if (Role==ROLE_Authority && !IsTimerActive('DoPowerCheck'))
	{
		SetTimer(0.1,false,'DoPowerCheck');
	}
}
function DoPowerCheck()
{
	ReleasePoweredFriend();
	if (!MainGeneratorIsOnline())
	{
		PowerNearestFriend();
	}
}
//
// react to power changes from the main generator
//
simulated function OnPowerStatusChanged()
{
	super.OnPowerStatusChanged();
	AsynchPowerCheck();
}
//
// deployable notifying us that its power status has changed
//
function DoPowerUpdate(TrDeployable dep)
{
	AsynchPowerCheck();
}

simulated function Destroyed()
{
	// in case we are powering someone when we get destroyed...
	ReleasePoweredFriend();
	Super.Destroyed();
}

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Set the animation tree
        m_Mesh.SetAnimTreeTemplate(AnimTree'DEP_Generator_3p.AnimTree.AT_DEP_Generator_3p');
    }
}

defaultproperties
{
   m_fTimeToDeploySecs=1.000000
   m_bRequireLOS=False
   m_fDamageRadius=3000.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
      Materials(0)=None
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
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_BackupGenerator:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_BackupGenerator:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=800
   m_nCriticalHealthThreshold=200
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Backup Generator"
   m_bInstantOnlineSound=True
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
   Name="Default__TrDeployable_BackupGenerator"
   ObjectArchetype=TrDeployable'TribesGame.Default__TrDeployable'
}
