// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
class UTMutator_SlowTimeKills extends UTMutator;

var float SlowTime;
var float RampUpTime;
var float SlowSpeed;

function bool MutatorIsAllowed()
{
	return (WorldInfo.NetMode == NM_Standalone);
}


function ScoreKill(Controller Killer, Controller Killed)
{
	if ( PlayerController(Killer) != None )
	{
		WorldInfo.Game.SetGameSpeed(SlowSpeed);
		SetTimer(SlowTime, false);
	}
	if ( NextMutator != None )
	{
		NextMutator.ScoreKill(Killer,Killed);
	}
}

function Timer()
{
	GotoState('Rampup');
}

state Rampup
{
	function Tick(float DeltaTime)
	{
		local float NewGameSpeed;

		NewGameSpeed = WorldInfo.Game.GameSpeed + DeltaTime/RampUpTime;
		if ( NewGameSpeed >= 1 )
		{
			WorldInfo.Game.SetGameSpeed(1.0);
			GotoState('');
		}
		else
		{
			WorldInfo.Game.SetGameSpeed(NewGameSpeed);
		}
	}
}

defaultproperties
{
   SlowTime=0.300000
   RampUpTime=0.100000
   SlowSpeed=0.250000
   GroupNames(0)="GAMESPEED"
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__UTMutator_SlowTimeKills"
   ObjectArchetype=UTMutator'UTGame.Default__UTMutator'
}
