/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 */

class GameCrowdInteractionPoint extends Actor
	native
	abstract
	hidecategories(Advanced)
	hidecategories(Collision)
	hidecategories(Display)
	hidecategories(Actor)
	hidecategories(Movement)
	hidecategories(Physics)
	ClassGroup(Crowd)
	placeable;

/** If this interactionpoint is currently enabled */
var()	bool			bIsEnabled;

/** Cylinder component  */
var()	CylinderComponent	CylinderComponent;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNoDelete)
		bIsEnabled;
}

function OnToggle(SeqAct_Toggle action)
{
	if (action.InputLinks[0].bHasImpulse)
	{
		// turn on
		bIsEnabled = TRUE;
	}
	else if (action.InputLinks[1].bHasImpulse)
	{
		// turn off
		bIsEnabled = FALSE;
	}
	else if (action.InputLinks[2].bHasImpulse)
	{
		// toggle
		bIsEnabled = !bIsEnabled;
	}

	// Make this actor net relevant, and force replication, even if it now does not differ from class defaults.
	ForceNetRelevant();
}

defaultproperties
{
   bIsEnabled=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=40.000000
      CollisionRadius=200.000000
      CylinderColor=(B=0,G=255,R=0,A=255)
      bDrawBoundingBox=False
      bDrawNonColliding=True
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Behavior'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bNoDelete=True
   CollisionComponent=CollisionCylinder
   Name="Default__GameCrowdInteractionPoint"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
