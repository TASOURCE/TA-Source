/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class FluidSurfaceActorMovable extends FluidSurfaceActor
	native(Fluid)
	placeable;


// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=FluidSurfaceComponent Name=NewFluidComponent Archetype=FluidSurfaceComponent'Engine.Default__FluidSurfaceActor:NewFluidComponent'
      ReplacementPrimitive=None
      Name="NewFluidComponent"
      ObjectArchetype=FluidSurfaceComponent'Engine.Default__FluidSurfaceActor:NewFluidComponent'
   End Object
   FluidComponent=NewFluidComponent
   Components(0)=NewFluidComponent
   Physics=PHYS_Interpolating
   bMovable=True
   Name="Default__FluidSurfaceActorMovable"
   ObjectArchetype=FluidSurfaceActor'Engine.Default__FluidSurfaceActor'
}
