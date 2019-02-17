/** 
 *	Base one of these on an Actor using PHYS_RigidBody and it will apply a force down the negative-X direction
 *	ie. point X in the direction you want the thrust in.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class RB_Thruster extends RigidBodyBase
	placeable
	native(Physics);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
	

/** If thrust should be applied at the moment. */
var()			bool	bThrustEnabled;

/** Strength of thrust force applied to the base object. */
var()	interp	float	ThrustStrength;

/** Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle action)
{
	// Turn ON
	if (action.InputLinks[0].bHasImpulse)
	{
		bThrustEnabled = true;
	}
	// Turn OFF
	else if (action.InputLinks[1].bHasImpulse)
	{
		bThrustEnabled = false;
	}
	// Toggle
	else if (action.InputLinks[2].bHasImpulse)
	{
		bThrustEnabled = !bThrustEnabled;
	}
}

cpptext
{
	virtual UBOOL Tick( FLOAT DeltaSeconds, ELevelTick TickType );

}


defaultproperties
{
   ThrustStrength=100.000000
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=0,G=180,R=255,A=255)
      ArrowSize=1.700000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(0)=ArrowComponent0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Thruster'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   bHardAttach=True
   bEdShouldSnap=True
   Name="Default__RB_Thruster"
   ObjectArchetype=RigidBodyBase'Engine.Default__RigidBodyBase'
}
