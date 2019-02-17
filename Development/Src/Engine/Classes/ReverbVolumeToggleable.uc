/**
 * 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ReverbVolumeToggleable extends ReverbVolume
	showcategories(Toggle);

simulated function OnToggle(SeqAct_Toggle Action)
{
	// Turn ON
	if (Action.InputLinks[0].bHasImpulse)
	{
		bEnabled = true;
	}
	// Turn OFF
	else if (Action.InputLinks[1].bHasImpulse)
	{
		bEnabled = false;
	}
	// Toggle
	else if (Action.InputLinks[2].bHasImpulse)
	{
		bEnabled = !bEnabled;
	}

	ForceNetRelevant();

	SetForcedInitialReplicatedProperty(Property'Engine.ReverbVolume.bEnabled', (bEnabled == default.bEnabled));
}

defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__ReverbVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__ReverbVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   bStatic=False
   CollisionComponent=BrushComponent0
   Name="Default__ReverbVolumeToggleable"
   ObjectArchetype=ReverbVolume'Engine.Default__ReverbVolume'
}
