class TrDaDShell extends InterpActor
    placeable;

var StaticMeshComponent c_ShieldMesh0;
var StaticMeshComponent c_ShieldMesh1;
var StaticMeshComponent c_ShieldMesh2;

var repnotify bool r_bShield0Up;
var repnotify bool r_bShield1Up;
var repnotify bool r_bShield2Up;
var repnotify bool r_bIsRotating;

replication
{
	if( Role == ROLE_Authority )
		r_bShield0Up, r_bShield1Up, r_bShield2Up, r_bIsRotating;
}

simulated event ReplicatedEvent(name VarName)
{
	if( VarName == 'r_bShield0Up' )
	{
		c_ShieldMesh0.SetHidden(!r_bShield0Up);
	}
	if( VarName == 'r_bShield1Up' )
	{
		c_ShieldMesh1.SetHidden(!r_bShield1Up);
	}
	if( VarName == 'r_bShield2Up' )
	{
		c_ShieldMesh2.SetHidden(!r_bShield2Up);
	}
	if( VarName == 'r_bIsRotating' )
	{
		r_bIsRotating ? StartRotation() : StopRotation();
	}
	super.ReplicatedEvent(VarName);
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if( Role < ROLE_Authority )
	{
		AttachComponent(c_ShieldMesh0);
		AttachComponent(c_ShieldMesh1);
		AttachComponent(c_ShieldMesh2);
	}
}

simulated function StartRotation()
{
	r_bIsRotating = true;
	RotationRate = default.RotationRate;
	bNetDirty = true;
}

simulated function StopRotation()
{
	r_bIsRotating = false;
	RotationRate = rot(0,0,0);
	bNetDirty = true;
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1
      ReplacementPrimitive=None
      AlwaysLoadOnServer=False
      Name="StaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   c_ShieldMesh0=StaticMeshComponent1
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent2
      ReplacementPrimitive=None
      AlwaysLoadOnServer=False
      Name="StaticMeshComponent2"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   c_ShieldMesh1=StaticMeshComponent2
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent3
      ReplacementPrimitive=None
      AlwaysLoadOnServer=False
      Name="StaticMeshComponent3"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   c_ShieldMesh2=StaticMeshComponent3
   r_bShield0Up=True
   r_bShield1Up=True
   r_bShield2Up=True
   r_bIsRotating=True
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__InterpActor:StaticMeshComponent0'
      WireframeColor=(B=255,G=0,R=255,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDShell:MyLightEnvironment'
      BlockRigidBody=False
      RBCollideWithChannels=(Default=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__InterpActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__InterpActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__InterpActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   Physics=PHYS_Rotating
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_BlockAll
   bNoDelete=False
   bProjTarget=True
   CollisionComponent=StaticMeshComponent0
   RotationRate=(Pitch=0,Yaw=35536,Roll=0)
   Name="Default__TrDaDShell"
   ObjectArchetype=InterpActor'Engine.Default__InterpActor'
}
