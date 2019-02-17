/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ModelComponent extends PrimitiveComponent
	native
	noexport;


/** These mirror the C++ side properties. I'm making a class here so
    ModelComponent will get the defaultprops from the PrimitiveComponent base class */
var transient native const noexport object Model;
var transient native const noexport int ZoneIndex;
var transient native const noexport int ComponentIndex; // (note that this is a WORD in C++, but alignment will make everything line up okay)
var transient native const noexport array<pointer> Nodes;
var transient native const noexport array<pointer> Elements;

defaultproperties
{
   ReplacementPrimitive=None
   bUseAsOccluder=True
   bAcceptsDecals=True
   bAcceptsStaticDecals=True
   CastShadow=True
   bAcceptsLights=True
   bUsePrecomputedShadows=True
   bCullModulatedShadowOnBackfaces=True
   bCullModulatedShadowOnEmissive=True
   LightingChannels=(bInitialized=True,BSP=True)
   Name="Default__ModelComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
