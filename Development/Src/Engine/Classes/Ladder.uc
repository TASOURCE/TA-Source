/*=============================================================================
// Ladders are associated with the LadderVolume that encompasses them, and provide AI navigation
// support for ladder volumes.  Direction should be the direction that climbing pawns
// should face
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
============================================================================= */

class Ladder extends NavigationPoint
	placeable
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var LadderVolume MyLadder;
var Ladder LadderList;

/*
Check if ladder is already occupied
*/
event bool SuggestMovePreparation(Pawn Other)
{
	if ( MyLadder == None )
		return false;

	if ( !MyLadder.InUse(Other) )
	{
		MyLadder.PendingClimber = Other;
		return false;
	}

	Other.Controller.bPreparingMove = true;
	Other.Acceleration = vect(0,0,0);
	return true;
}

cpptext
{
#if WITH_EDITOR
	virtual UBOOL CanConnectTo(ANavigationPoint* Dest, UBOOL bCheckDistance);
	void addReachSpecs(AScout *Scout, UBOOL bOnlyChanged=0);
#endif
	void InitForPathFinding();
	void ClearPaths();
	virtual UBOOL ReachedBy(APawn* P, const FVector& TestPosition, const FVector& Dest);

}


defaultproperties
{
   bSpecialMove=True
   bNotBased=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_Ladder'
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
   Name="Default__Ladder"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
