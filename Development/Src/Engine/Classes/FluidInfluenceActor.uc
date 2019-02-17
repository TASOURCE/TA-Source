/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class FluidInfluenceActor extends Actor
	dependson(FluidInfluenceComponent)
	native(Fluid)
	ClassGroup(Fluid)
	placeable;


/** Direction of a flow influence. */
var private ArrowComponent FlowDirection;

var private SpriteComponent Sprite;

var() editconst const FluidInfluenceComponent InfluenceComponent;

/** replicated flags to pass to component */
var repnotify bool bActive, bToggled;

replication
{
	if (bNetDirty)
		bActive, bToggled;
}

/**
 * Handling Toggle event from Kismet.
 */
simulated function OnToggle( SeqAct_Toggle inAction )
{
	// Turn ON
	if( inAction.InputLinks[0].bHasImpulse )
	{
		InfluenceComponent.bActive = true;
	}
	// Turn OFF
	else if( inAction.InputLinks[1].bHasImpulse )
	{
		InfluenceComponent.bActive = false;
	}
	// Toggle
	else if( inAction.InputLinks[2].bHasImpulse )
	{
		InfluenceComponent.bActive = !InfluenceComponent.bActive;
		InfluenceComponent.bIsToggleTriggered = true;
	}

	bActive = InfluenceComponent.bActive;
	bToggled = InfluenceComponent.bIsToggleTriggered;
	bForceNetUpdate = true;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(bActive))
	{
		InfluenceComponent.bActive = bActive;
	}
	else if (VarName == nameof(bToggled))
	{
		InfluenceComponent.bIsToggleTriggered = bToggled;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

defaultproperties
{
   Begin Object Class=ArrowComponent Name=NewArrowComponent
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="NewArrowComponent"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   FlowDirection=NewArrowComponent
   Begin Object Class=SpriteComponent Name=NewSprite
      Sprite=Texture2D'EditorResources.S_FluidSurfOsc'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="NewSprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Sprite=NewSprite
   Begin Object Class=FluidInfluenceComponent Name=NewInfluenceComponent
      ReplacementPrimitive=None
      Name="NewInfluenceComponent"
      ObjectArchetype=FluidInfluenceComponent'Engine.Default__FluidInfluenceComponent'
   End Object
   InfluenceComponent=NewInfluenceComponent
   Components(0)=NewSprite
   Components(1)=NewArrowComponent
   Components(2)=NewInfluenceComponent
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   NetUpdateFrequency=0.100000
   Name="Default__FluidInfluenceActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
