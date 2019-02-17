//=============================================================================
// BrushShape: A brush that acts as a template for geometry mode modifiers like "Lathe"
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class BrushShape extends Brush
	placeable
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual UBOOL IsABrushShape() const {return TRUE;}

}


defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Brush:BrushComponent0'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Brush:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__BrushShape"
   ObjectArchetype=Brush'Engine.Default__Brush'
}
