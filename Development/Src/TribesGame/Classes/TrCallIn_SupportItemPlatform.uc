class TrCallIn_SupportItemPlatform extends Actor
	native;

/** The game objective that is placed on us */
var TrGameObjective r_DeployedItem;

/** Mesh */
var() SkeletalMeshComponent m_Mesh;
var	CylinderComponent CylinderComponent;

/** The name on the platform skeletal mesh to attach to */
var name ItemAttachPointName;

/** The team we are on */
var	repnotify byte DefenderTeamIndex;

native function GetBoundingCylinder(out float CollisionRadius, out float CollisionHeight) const;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		r_DeployedItem, DefenderTeamIndex;
}

function Init(Actor DeployableOwner, class<TrGameObjective> GameObjectiveClass)
{
	DefenderTeamIndex = DeployableOwner.GetTeamNum();

	// Spawn the deployable.
	r_DeployedItem = Spawn(GameObjectiveClass, DeployableOwner);
	if (r_DeployedItem != none)
	{
		// Set the initial positioning and team number.
		r_DeployedItem.SetBase(self, , m_Mesh, ItemAttachPointName);
		r_DeployedItem.DefenderTeamIndex = DeployableOwner.GetTeamNum();

		// Setup relative positioning.
		r_DeployedItem.SetRelativeLocation(r_DeployedItem.CallInPosition);
		r_DeployedItem.SetRelativeRotation(r_DeployedItem.CallInRotation);
	}
}

simulated event byte ScriptGetTeamNum()
{
	if (r_DeployedItem == none)
	{
		return 255;
	}

	return r_DeployedItem.DefenderTeamIndex;
}

simulated function HideMesh()
{
	local MeshComponent ComponentIt;

    //hide mesh as well psc etc
	foreach ComponentList(class'MeshComponent',ComponentIt)
	{
		ComponentIt.SetHidden(true);
	}
}

simulated event Tick(float DeltaTime)
{
	if (r_DeployedItem == none)
	{
		Destroy();
	}

	super.Tick(DeltaTime);
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=PlatformMesh
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="PlatformMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_Mesh=PlatformMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=32.000000
      CollisionRadius=80.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CylinderComponent=CollisionCylinder
   ItemAttachPointName="spawnSocket"
   Components(0)=PlatformMesh
   Components(1)=CollisionCylinder
   Physics=PHYS_Falling
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   bCanBeDamaged=True
   bCollideActors=True
   bCollideWorld=True
   bCollideComplex=True
   bBlockActors=True
   bProjTarget=True
   NetUpdateFrequency=25.000000
   TickFrequency=0.500000
   CollisionComponent=PlatformMesh
   Name="Default__TrCallIn_SupportItemPlatform"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
