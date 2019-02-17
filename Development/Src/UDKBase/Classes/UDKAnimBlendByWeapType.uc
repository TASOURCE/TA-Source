/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 * This node blends in the 'Weapon' branch when anything other than the rifle is being used.
 */

class UDKAnimBlendByWeapType extends AnimNodeBlendPerBone
	native(Animation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Children(0)=(Name="Default")
   Children(1)=(Name="Weapon")
   Name="Default__UDKAnimBlendByWeapType"
   ObjectArchetype=AnimNodeBlendPerBone'Engine.Default__AnimNodeBlendPerBone'
}
