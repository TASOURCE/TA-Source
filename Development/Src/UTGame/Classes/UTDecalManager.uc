/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDecalManager extends DecalManager;

function bool CanSpawnDecals()
{
	return (!class'Engine'.static.IsSplitScreen() && Super.CanSpawnDecals());
}

defaultproperties
{
   Begin Object Class=DecalComponent Name=BaseDecal Archetype=DecalComponent'Engine.Default__DecalManager:BaseDecal'
      ReplacementPrimitive=None
      bIgnoreOwnerHidden=True
      Name="BaseDecal"
      ObjectArchetype=DecalComponent'Engine.Default__DecalManager:BaseDecal'
   End Object
   DecalTemplate=BaseDecal
   DecalDepthBias=-0.000120
   Name="Default__UTDecalManager"
   ObjectArchetype=DecalManager'Engine.Default__DecalManager'
}
