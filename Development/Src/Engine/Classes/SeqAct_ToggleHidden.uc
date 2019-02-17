/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ToggleHidden extends SeqAct_Toggle;

var() bool bToggleBasedActors;
var() array< class<Actor> > IgnoreBasedClasses;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Hide")
   InputLinks(1)=(LinkDesc="UnHide")
   InputLinks(2)=()
   ObjName="Toggle Hidden"
   Name="Default__SeqAct_ToggleHidden"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
}