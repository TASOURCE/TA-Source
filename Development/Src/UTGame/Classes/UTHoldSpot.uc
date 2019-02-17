/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTHoldSpot extends UTDefensePoint
	notplaceable;

var UTVehicle HoldVehicle;

/** since HoldSpots aren't part of the prebuilt nav network we need to hook them to another NavigationPoint */
var NavigationPoint LastAnchor;

function PreBeginPlay()
{
	Super(NavigationPoint).PreBeginPlay();
}

function Actor GetMoveTarget()
{
	if ( HoldVehicle != None )
	{
		if ( HoldVehicle.Health <= 0 )
			HoldVehicle = None;
		if ( HoldVehicle != None )
			return HoldVehicle.GetMoveTargetFor(None);
	}

	return self;
}

function FreePoint()
{
	Destroy();
}

event NavigationPoint SpecifyEndAnchor(Pawn RouteFinder)
{
	if ( (LastAnchor != None) && !LastAnchor.IsUsableAnchorFor(RouteFinder) )
	{
		LastAnchor = None;
	}
	return LastAnchor;
}

event NotifyAnchorFindingResult(NavigationPoint EndAnchor, Pawn RouteFinder)
{
	LastAnchor = EndAnchor;
}

defaultproperties
{
   bScriptSpecifyEndAnchor=True
   bScriptNotifyAnchorFindingResult=True
   bAnchorMustBeReachable=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTDefensePoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTDefensePoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTDefensePoint:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTDefensePoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'UTGame.Default__UTDefensePoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTDefensePoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UTGame.Default__UTDefensePoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UTGame.Default__UTDefensePoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UTGame.Default__UTDefensePoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UTGame.Default__UTDefensePoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   bStatic=False
   bNoDelete=False
   bCollideWhenPlacing=False
   CollisionComponent=CollisionCylinder
   Name="Default__UTHoldSpot"
   ObjectArchetype=UTDefensePoint'UTGame.Default__UTDefensePoint'
}
