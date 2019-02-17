/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeDensityInfo extends Info
	showcategories(Movement)
	AutoExpandCategories(FogVolumeDensityInfo)
	ClassGroup(Fog)
	native(FogVolume)
	abstract;

/** The fog component which stores data specific to each density function. */
var() FogVolumeDensityComponent	DensityComponent;

/**
 * The automatic mesh component, which sizes with this fog volume actor.  This mesh component gets rendered with FogMaterial.
 * It is optional, and individual actors can be specified using the FogVolumeActors array instead.
 */
var() StaticMeshComponent AutomaticMeshComponent;

/** replicated copy of HeightFogComponent's bEnabled property */
var repnotify bool bEnabled;

struct CheckpointRecord
{
	var bool bEnabled;
};

replication
{
	if (Role == ROLE_Authority)
		bEnabled;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event PostBeginPlay()
{
	Super.PostBeginPlay();

	if( DensityComponent != none )
	{
		bEnabled = DensityComponent.bEnabled;
	}
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'bEnabled')
	{
		DensityComponent.SetEnabled(bEnabled);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/* epic ===============================================
* ::OnToggle
*
* Scripted support for toggling height fog, checks which
* operation to perform by looking at the action input.
*
* Input 1: turn on
* Input 2: turn off
* Input 3: toggle
*
* =====================================================
*/
simulated function OnToggle(SeqAct_Toggle action)
{
	if (action.InputLinks[0].bHasImpulse)
	{
		// turn on
		DensityComponent.SetEnabled(TRUE);
	}
	else if (action.InputLinks[1].bHasImpulse)
	{
		// turn off
		DensityComponent.SetEnabled(FALSE);
	}
	else if (action.InputLinks[2].bHasImpulse)
	{
		// toggle
		DensityComponent.SetEnabled(!DensityComponent.bEnabled);
	}
	bEnabled = DensityComponent.bEnabled;
	ForceNetRelevant();
	SetForcedInitialReplicatedProperty(Property'Engine.FogVolumeDensityInfo.bEnabled', (bEnabled == default.bEnabled));
}

function bool ShouldSaveForCheckpoint()
{
	return (RemoteRole != ROLE_None);
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.bEnabled = bEnabled;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	bEnabled = Record.bEnabled;
	DensityComponent.SetEnabled(bEnabled);
	ForceNetRelevant();
	SetForcedInitialReplicatedProperty(Property'Engine.FogVolumeDensityInfo.bEnabled', (bEnabled == default.bEnabled));
}

cpptext
{
public:
	virtual void Serialize(FArchive& Ar);
	virtual void PostLoad();
	virtual void PostEditImport();
	virtual void SetupDefaultFogVolume();

}


defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=AutomaticMeshComponent0
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      WireframeColor=(B=200,G=100,R=100,A=255)
      ReplacementPrimitive=None
      bIgnoreOwnerHidden=True
      bUseAsOccluder=False
      bSelectable=False
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      CastShadow=False
      bCastDynamicShadow=False
      bAcceptsLights=False
      bAcceptsDynamicLights=False
      BlockRigidBody=False
      Name="AutomaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   AutomaticMeshComponent=AutomaticMeshComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=AutomaticMeshComponent0
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   Name="Default__FogVolumeDensityInfo"
   ObjectArchetype=Info'Engine.Default__Info'
}
