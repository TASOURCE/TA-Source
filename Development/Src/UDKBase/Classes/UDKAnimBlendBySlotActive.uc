/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKAnimBlendBySlotActive extends AnimNodeBlendPerBone
	native(Animation);


/** Cached pointer to slot node that we'll be monitoring. */
var AnimNodeSlot	ChildSlot;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Children(0)=(Name="Default")
   Children(1)=(Name="Slot")
   Name="Default__UDKAnimBlendBySlotActive"
   ObjectArchetype=AnimNodeBlendPerBone'Engine.Default__AnimNodeBlendPerBone'
}
