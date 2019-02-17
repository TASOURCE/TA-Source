/**
 * a path that opens and closes via some trigger, usually Kismet controlled
 * this differs from triggering a normal NavigationPoint in that the AI
 * considers these to always be traversible, but may need to do something before using them,
 * whereas normal NavigationPoints are considered off limits when Kismet toggles them off
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class TriggeredPath extends NavigationPoint
	placeable;

/** whether the path is currently usable */
var() bool bOpen;

/** the trigger, button, etc that will make this path usable */
var() Actor MyTrigger;

function OnToggle(SeqAct_Toggle InAction)
{
	if (InAction.InputLinks[0].bHasImpulse)
	{
		bOpen = true;
	}
	else if (InAction.InputLinks[1].bHasImpulse)
	{
		bOpen = false;
	}
	else if (InAction.InputLinks[2].bHasImpulse)
	{
		bOpen = !bOpen;
	}

	WorldInfo.Game.NotifyNavigationChanged(self);
}

event Actor SpecialHandling(Pawn Other)
{
	local Actor TouchActor;

	if (bOpen || MyTrigger == None)
	{
		return self;
	}
	else
	{
		TouchActor = MyTrigger.SpecialHandling(Other);
		if (TouchActor == None)
		{
			TouchActor = MyTrigger;
		}
		return TouchActor;
	}
}

event bool SuggestMovePreparation(Pawn Other)
{
	if (bOpen)
	{
		return false;
	}
	else if (MyTrigger != None && Other.Controller.ActorReachable(MyTrigger))
	{
		// go to trigger instead
		if (Other.Controller.Focus == Other.Controller.MoveTarget)
		{
			Other.Controller.Focus = MyTrigger;
		}
		Other.Controller.MoveTarget = MyTrigger;
		Other.Controller.CurrentPath = None;
		Other.Controller.NextRoutePath = None;
		return false;
	}
	else
	{
		// wait for path to open
		Other.Controller.MoveTimer = 1.0;
		Other.Controller.bPreparingMove = true;
		Other.Velocity = vect(0,0,0);
		Other.Acceleration = vect(0,0,0);
		return true;
	}
}

defaultproperties
{
   bSpecialMove=True
   ExtraCost=100
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
   Name="Default__TriggeredPath"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
