/**
 * volume that kills Kismet created bots that leave it
 * 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTScriptedBotVolume extends PhysicsVolume;

event PawnLeavingVolume(Pawn Other)
{
	local UTBot Bot;

	Bot = UTBot(Other.Controller);
	if (Bot != None && Bot.bSpawnedByKismet)
	{
        //TGFIXUP
//		Other.Died(None, class'UTDmgType_Instagib', Other.Location);
	}
}

defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__UTScriptedBotVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
