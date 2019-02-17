/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PotentialClimbWatcher extends Info
	native;

simulated event Tick(float DeltaTime)
{
	local rotator PawnRot;
	local LadderVolume L;
	local bool bFound;

	if ( (Owner == None) || Owner.bDeleteMe || !Pawn(Owner).CanGrabLadder() )
	{
		destroy();
		return;
	}

	PawnRot = Owner.Rotation;
	PawnRot.Pitch = 0;
	ForEach Owner.TouchingActors(class'LadderVolume', L)
		if ( L.Encompasses(Owner) )
		{
			if ( (vector(PawnRot) Dot L.LookDir) > 0.9 )
			{
				Pawn(Owner).ClimbLadder(L);
				destroy();
				return;
			}
			else
				bFound = true;
		}

	if ( !bFound )
		destroy();
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__PotentialClimbWatcher"
   ObjectArchetype=Info'Engine.Default__Info'
}
