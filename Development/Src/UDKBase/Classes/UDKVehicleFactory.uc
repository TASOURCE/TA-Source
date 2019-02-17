/**
 * Vehicle spawner.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKVehicleFactory extends NavigationPoint
	ClassGroup(Vehicles)
	abstract
	native
	nativereplication
	placeable;

/** full package.class for the vehicle class. You should set this in the default properties, NOT VehicleClass.
 * this indirection is needed for the cooker, so it can fully clear references to vehicles that won't be spawned on the target platform
 * if the direct class reference were in the default properties, this wouldn't be possible without deleting the factory outright,
 * which we can't do without breaking paths
 */
var string VehicleClassPath;

/** Whether vehicles spawned at this factory are initially team locked */
var		bool			bHasLockedVehicle;

/** actual vehicle class to spawn. DO NOT SET THIS IN DEFAULT PROPERTIES - set VehicleClassPath instead */
var		class<UDKVehicle>	VehicleClass;
var		UDKVehicle			ChildVehicle;

/** if set, replicate ChildVehicle reference */
var bool bReplicateChildVehicle;

/** Timer for determining when to spawn vehicles */
var		float			RespawnProgress;		

/** HUD Rendering (for minimap) - updated in SetHUDLocation() */
var		vector			HUDLocation;

var     int             TeamNum;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		bHasLockedVehicle;
	if (bNetDirty && Role == ROLE_Authority && bReplicateChildVehicle)
		ChildVehicle;
}

event SpawnVehicle();

/** function used to update where icon for this actor should be rendered on the HUD minimap
 *  @param NewHUDLocation is a vector whose X and Y components are the X and Y components of this actor's icon's 2D position on the HUD minimap
 */
simulated native function SetHUDLocation(vector NewHUDLocation);

simulated native function byte GetTeamNum();

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__UDKVehicleFactory"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
