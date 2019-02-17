/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ExponentialHeightFog extends Info
	showcategories(Movement)
	ClassGroup(Fog)
	placeable;

var() const editconst ExponentialHeightFogComponent Component;

/** replicated copy of ExponentialHeightFogComponent's bEnabled property */
var repnotify bool bEnabled;

replication
{
	if (Role == ROLE_Authority)
		bEnabled;
}

event PostBeginPlay()
{
	Super.PostBeginPlay();

	bEnabled = Component.bEnabled;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'bEnabled')
	{
		Component.SetEnabled(bEnabled);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/* epic ===============================================
* ::OnToggle
*
* Scripted support for toggling height fog, checks which
* operation to perform by looking at the action input.
*
* Input 1: turn on
* Input 2: turn off
* Input 3: toggle
*
* =====================================================
*/
simulated function OnToggle(SeqAct_Toggle action)
{
	if (action.InputLinks[0].bHasImpulse)
	{
		// turn on
		Component.SetEnabled(TRUE);
	}
	else if (action.InputLinks[1].bHasImpulse)
	{
		// turn off
		Component.SetEnabled(FALSE);
	}
	else if (action.InputLinks[2].bHasImpulse)
	{
		// toggle
		Component.SetEnabled(!Component.bEnabled);
	}
	bEnabled = Component.bEnabled;
	ForceNetRelevant();
	SetForcedInitialReplicatedProperty(Property'Engine.ExponentialHeightFog.bEnabled', (bEnabled == default.bEnabled));
}

defaultproperties
{
   Begin Object Class=ExponentialHeightFogComponent Name=HeightFogComponent0
      Name="HeightFogComponent0"
      ObjectArchetype=ExponentialHeightFogComponent'Engine.Default__ExponentialHeightFogComponent'
   End Object
   Component=HeightFogComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=HeightFogComponent0
   DrawScale=5.000000
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bNoDelete=True
   Name="Default__ExponentialHeightFog"
   ObjectArchetype=Info'Engine.Default__Info'
}
