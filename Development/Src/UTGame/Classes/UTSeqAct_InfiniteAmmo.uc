/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
/** activates/deactivates infinite ammo for the target(s) */
class UTSeqAct_InfiniteAmmo extends SequenceAction;

var() bool bInfiniteAmmo;

defaultproperties
{
   bInfiniteAmmo=True
   ObjName="Infinite Ammo"
   ObjCategory="Pawn"
   Name="Default__UTSeqAct_InfiniteAmmo"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
