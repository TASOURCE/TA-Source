/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 *  Used for repelling crowd agents from an area
 */

class GameCrowdRepulsor extends GameCrowdForcePoint
	native;

/** How repulsive this repulsor is. */
var()	interp float	Repulsion;

/** If attraction should falloff over the radius */
var()	bool			bAttractionFalloff;

/**
  *  bIsEnabled assumed checked before calling
  */
event vector AppliedForce(GameCrowdAgent Agent)
{
	local vector FromAttractor;
	local float CurrentRepulsion, Distance;
	
	FromAttractor = Agent.Location - Location;
	Distance = VSize(FromAttractor);

	// Normalize vector from location to actor.
	FromAttractor = FromAttractor/Distance;

	CurrentRepulsion = Repulsion;

	// If desired, do falloff
	if( bAttractionFalloff )
	{
		CurrentRepulsion *= FMax(0.f,(1.f - Distance/CylinderComponent.CollisionRadius));
	}

	return FromAttractor * CurrentRepulsion;
}

defaultproperties
{
   Repulsion=180.000000
   bAttractionFalloff=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GameCrowdForcePoint:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=200.000000
      CylinderColor=(B=255,G=0,R=0,A=255)
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
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'
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
   Name="Default__GameCrowdRepulsor"
   ObjectArchetype=GameCrowdForcePoint'GameFramework.Default__GameCrowdForcePoint'
}
