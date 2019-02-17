/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// UTAvoidMarker.
// Bots avoid these spots when moving - used for very short term stationary hazards like bio goo or sticky grenades
//=============================================================================
class UTAvoidMarker extends Actor
	notPlaceable;

var CylinderComponent CollisionCylinder;

event Touch( actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if ( (Pawn(Other) != None) && (UTBot(Pawn(Other).Controller) != None) && !WorldInfo.GRI.OnSameTeam(self,Other) )
		UTBot(Pawn(Other).Controller).FearThisSpot(self);
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=Cylinder
      CollisionHeight=40.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="Cylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CollisionCylinder=Cylinder
   Begin Object Class=SpriteComponent Name=Sprite
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Components(1)=Cylinder
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=True
   CollisionComponent=Cylinder
   Name="Default__UTAvoidMarker"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
