//=============================================================================
// RB_ForceFieldExcludeVolume:  a bounding volume which removes the effect of a physical force field.
// * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class RB_ForceFieldExcludeVolume extends Volume
	native(ForceField)
	placeable;

/** Used to identify which force fields this excluder applies to, ie if the channel ID matches then the excluder
excludes this force field*/
var()	int ForceFieldChannel;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);

}


defaultproperties
{
   ForceFieldChannel=1
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__RB_ForceFieldExcludeVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
