/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Used for attracting agents to an area.  If too strong, agents won't continue to destination
 *
 */

class GameCrowdForcePoint extends GameCrowdInteractionPoint
	native
	abstract;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** 
  * Add to touching agent's RelevantAttractors list, even if not enabled
  * (because might get enabled while still touching agent
  */
event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local GameCrowdAgent Agent;
	local int i;
	
	Agent = GameCrowdAgent(Other);
	if ( Agent != None )
	{
		// check if already in list - shouldn't happen!!!
		for ( i=0; i<Agent.RelevantAttractors.length; i++ )
		{
			if ( Agent.RelevantAttractors[i] == self )
			{
				;
				return;
			}
		}
		
		// find empty spot
		for ( i=0; i<Agent.RelevantAttractors.length; i++ )
		{
			if ( Agent.RelevantAttractors[i] == None )
			{
				Agent.RelevantAttractors[i] = self;
				return;
			}
		}
		
		Agent.RelevantAttractors[Agent.RelevantAttractors.Length] = self;
	}
}

/** 
  * Remove from touching agent's RelevantAttractors list
  */
event UnTouch( Actor Other )
{
	local GameCrowdAgent Agent;
	local int i;
	
	Agent = GameCrowdAgent(Other);
	if ( Agent != None )
	{
		// should always be in list!
		for ( i=0; i<Agent.RelevantAttractors.length; i++ )
		{
			if ( Agent.RelevantAttractors[i] == self )
			{
				Agent.RelevantAttractors[i] = None;
				return;
			}
		}
			
		;
	}
}

/** 
  * Returns force applied to Agent by this force point.
  */
event vector AppliedForce(GameCrowdAgent Agent);

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GameCrowdInteractionPoint:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=200.000000
      CylinderColor=(B=0,G=255,R=0,A=255)
      bDrawBoundingBox=False
      bDrawNonColliding=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'GameFramework.Default__GameCrowdInteractionPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'GameFramework.Default__GameCrowdInteractionPoint:Sprite'
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Attractor'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'GameFramework.Default__GameCrowdInteractionPoint:Sprite'
   End Object
   Components(1)=Sprite
   bCollideActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__GameCrowdForcePoint"
   ObjectArchetype=GameCrowdInteractionPoint'GameFramework.Default__GameCrowdInteractionPoint'
}
