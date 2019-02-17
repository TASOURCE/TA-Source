/**
 * 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MobileMenuPlayerController extends GamePlayerController;

defaultproperties
{
   InputClass=Class'GameFramework.MobilePlayerInput'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GamePlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'GameFramework.Default__GamePlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__MobileMenuPlayerController"
   ObjectArchetype=GamePlayerController'GameFramework.Default__GamePlayerController'
}
