/**
 * 
 * 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKGameObjective extends NavigationPoint
	abstract
	hidecategories(VehicleUsage)
	native
	nativereplication;

/** pre-calculated list of nearby NavigationPoints this objective is shootable from */
var array<NavigationPoint> ShootSpots;

/** if true, allow this objective to be unreachable as long as we could find some ShootSpots for it */
var bool bAllowOnlyShootable;

/** HUD Rendering (for minimap) - updated in SetHUDLocation() */
var vector HUDLocation;

/** Texture from which minimap icon for this objective should be grabbed */
var const Texture2D IconHudTexture;

/** Coordinates on IconHudTextures for this objective's minimap icon */
var TextureCoordinates IconCoords;

/** TeamIndex of team which defends this objective */
var		repnotify byte	DefenderTeamIndex;	

/** Replicated notification of whether this objective is currently under attack */
var repnotify bool bUnderAttack;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if ( (Role==ROLE_Authority) && bNetDirty )
		DefenderTeamIndex, bUnderAttack;
}

/**
 * Used for a notification chain when an objective changes
 */
function ObjectiveChanged();

/**
 * Returns the actual viewtarget for this actor.  Should be subclassed
 */
event actor GetBestViewTarget()
{
	return self;
}

/**
  * Should return true if bot controlled by C is considered "near" this objective
  */
function bool BotNearObjective(AIController C);

function TriggerFlagEvent(name EventType, Controller EventInstigator);

/** function used to update where icon for this actor should be rendered on the HUD
 *  @param NewHUDLocation is a vector whose X and Y components are the X and Y components of this actor's icon's 2D position on the HUD
 */
simulated native function SetHUDLocation(vector NewHUDLocation);

/**
  * Draw this objective's icon on the HUD minimap
  */
simulated native function DrawIcon(Canvas Canvas, vector IconLocation, float IconWidth, float IconAlpha, UDKPlayerController PlayerOwner, LinearColor DrawColor);

/**
  * Returns TeamIndex of Team currently associated with (defending) this objective.
  */
simulated native function byte GetTeamNum();

defaultproperties
{
   bMustBeReachable=True
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
   Name="Default__UDKGameObjective"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
