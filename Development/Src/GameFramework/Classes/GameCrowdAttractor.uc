/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Used for attracting agents to an area.  If too strong, agents won't continue to destination
 *
 */

class GameCrowdAttractor extends GameCrowdForcePoint
	native;

/** How desireable this attractor is. */
var()	interp float	Attraction;

/** If attraction should falloff over the radius */
var()	bool			bAttractionFalloff;

/**
  *  bIsEnabled assumed checked before calling
  */
event vector AppliedForce(GameCrowdAgent Agent)
{
	local vector ToAttractor;
	local float CurrentAttraction, Distance;
	
	ToAttractor = Location - Agent.Location;
	Distance = VSize(ToAttractor);

	// Normalize vector from location to actor.
	ToAttractor = ToAttractor/Distance;

	CurrentAttraction = Attraction;

	// If desired, do falloff
	if( bAttractionFalloff )
	{
		CurrentAttraction *= FMax(0.f,(1.f - Distance/CylinderComponent.CollisionRadius));
	}

	return ToAttractor * CurrentAttraction;
}

defaultproperties
{
   Attraction=100.000000
   bAttractionFalloff=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GameCrowdForcePoint:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=200.000000
      CylinderColor=(B=0,G=255,R=0,A=255)
      bDrawBoundingBox=False
      bDrawNonColliding=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'GameFramework.Default__GameCrowdForcePoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'GameFramework.Default__GameCrowdForcePoint:Sprite'
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Attractor'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'GameFramework.Default__GameCrowdForcePoint:Sprite'
   End Object
   Components(1)=Sprite
   CollisionComponent=CollisionCylinder
   Name="Default__GameCrowdAttractor"
   ObjectArchetype=GameCrowdForcePoint'GameFramework.Default__GameCrowdForcePoint'
}
