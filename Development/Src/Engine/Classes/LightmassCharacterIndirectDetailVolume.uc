//=============================================================================
// LightmassCharacterIndirectDetailVolume:  Defines areas where Lightmass should place more indirect lighting samples than normal.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class LightmassCharacterIndirectDetailVolume extends Volume
	native
	hidecategories(Collision,Brush,Attachment,Physics,Volume)
	placeable;

defaultproperties
{
   BrushColor=(B=25,G=185,R=155,A=255)
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
   Name="Default__LightmassCharacterIndirectDetailVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
