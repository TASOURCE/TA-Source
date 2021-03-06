//=============================================================================
// PrecomputedVisibilityOverrideVolume:  Overrides visibility for a set of actors
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class PrecomputedVisibilityOverrideVolume extends Volume
	native
	hidecategories(Collision,Brush,Attachment,Physics,Volume)
	placeable;

/** Array of actors that will always be considered visible by Precomputed Visibility when viewed from inside this volume. */
var() array<actor> OverrideVisibleActors;

/** Array of actors that will always be considered invisible by Precomputed Visibility when viewed from inside this volume. */
var() array<actor> OverrideInvisibleActors;

defaultproperties
{
   BrushColor=(B=90,G=120,R=25,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_Nothing
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__PrecomputedVisibilityOverrideVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
