//=============================================================================
// LiftExit.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class LiftExit extends NavigationPoint
	placeable
	native;

var()	LiftCenter				MyLiftCenter;
var()	bool					bExitOnly;			// if true, can only get off lift here.

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function bool CanBeReachedFromLiftBy(Pawn Other)
{
	return ( (Location.Z < Other.Location.Z + Other.GetCollisionHeight())
			 && Other.LineOfSightTo(self) );
}

function WaitForLift(Pawn Other)
{
	if (MyLiftCenter != None)
	{
		Other.SetDesiredRotation(rotator(Location - Other.Location));
		Other.Controller.WaitForMover(MyLiftCenter.MyLift);
	}
}

event bool SuggestMovePreparation(Pawn Other)
{
	local Controller C;

	if ( (MyLiftCenter == None) || (Other.Controller == None) )
		return false;
	if ( Other.Physics == PHYS_Flying )
	{
		if ( Other.AirSpeed > 0 )
			Other.Controller.MoveTimer = 2+ VSize(Location - Other.Location)/Other.AirSpeed;
		return false;
	}
	if ( (Other.Base == MyLiftCenter.Base) || Other.ReachedDestination(MyLiftCenter) )
	{
		// if pawn is on the lift, see if it can get off and go to this lift exit
		if ( CanBeReachedFromLiftBy(Other) )
		{
			return false;
		}

		// make pawn wait on the lift
		WaitForLift(Other);
		return true;
	}
	else if (MyLiftCenter != None)
	{
		foreach WorldInfo.AllControllers(class'Controller', C)
		{
			if ( (C.Pawn != None) && (C.PendingMover == MyLiftCenter.MyLift) && WorldInfo.GRI.OnSameTeam(C,Other.Controller) && C.Pawn.ReachedDestination(self) )
			{
				WaitForLift(Other);
				return true;
			}
		}
		Other.Controller.ReadyForLift();
	}
	return false;
}

cpptext
{
	virtual void ReviewPath(APawn* Scout);

}


defaultproperties
{
   bNeverUseStrafing=True
   bForceNoStrafing=True
   bSpecialMove=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.lift_exit'
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
   Name="Default__LiftExit"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
