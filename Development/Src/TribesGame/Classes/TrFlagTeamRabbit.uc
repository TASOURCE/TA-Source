/**
* Generic class for all TrFlagCTF flags.
*/
class TrFlagTeamRabbit extends TrFlagBase;

function SetHolder(Controller C)
{
	TrGame_TrTeamRabbit(WorldInfo.Game).PickedUpFlag(C);
	Super.SetHolder(C);
}

function ClearHolder()
{
	TrGame_TrTeamRabbit(WorldInfo.Game).DroppedFlag();
    Super.ClearHolder();
}

function SendHome(Controller Returner)
{
	TrGame_TrTeamRabbit(WorldInfo.Game).FlagDestoyed();
	Destroy();
}

function BroadcastReturnedMessage()
{
	if ( !WorldInfo.GRI.bMatchIsOver )
	{
		BroadcastLocalizedMessage(MessageClass, 10);
	}
}

// States
state Home
{
	function BeginState(Name PreviousStateName);
	function EndState(Name NextStateName);
}

auto state Dropped
{
	function CheckFit();
}

state Held
{
}

simulated function ClientReturnedHome();

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=FlagLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagBase:FlagLightEnvironment'
      bDynamic=False
      Name="FlagLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagBase:FlagLightEnvironment'
   End Object
   LightEnvironment=FlagLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrFlagTeamRabbit:ForceFeedbackWaveformPickUp'
   Begin Object Class=SkeletalMeshComponent Name=TheFlagSkelMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrFlagBase:TheFlagSkelMesh'
      AnimSets(0)=None
      bUpdateSkelWhenNotRendered=False
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bEnableClothSimulation=True
      ClothWind=(X=20.000000,Y=10.000000,Z=0.000000)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagTeamRabbit:FlagLightEnvironment'
      RBChannel=RBCC_Nothing
      BlockRigidBody=True
      RBCollideWithChannels=(Vehicle=True,Cloth=True)
      Translation=(X=0.000000,Y=0.000000,Z=-40.000000)
      Name="TheFlagSkelMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrFlagBase:TheFlagSkelMesh'
   End Object
   SkelMesh=TheFlagSkelMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrFlagBase:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrFlagBase:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=FlagLightEnvironment
   Components(2)=TheFlagSkelMesh
   CollisionComponent=CollisionCylinder
   MessageClass=Class'TribesGame.TrRabbitScoreMessage'
   Name="Default__TrFlagTeamRabbit"
   ObjectArchetype=TrFlagBase'TribesGame.Default__TrFlagBase'
}
