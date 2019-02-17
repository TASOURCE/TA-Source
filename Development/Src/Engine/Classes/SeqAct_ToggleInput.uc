/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ToggleInput extends SeqAct_Toggle;

var() bool bToggleMovement;
var() bool bToggleTurning;

defaultproperties
{
   bToggleMovement=True
   bToggleTurning=True
   ObjName="Toggle Input"
   Name="Default__SeqAct_ToggleInput"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
}
