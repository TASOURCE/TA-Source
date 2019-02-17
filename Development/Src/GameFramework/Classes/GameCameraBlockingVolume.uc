//=============================================================================
// GameCameraBlockingVolume:  
// used to block the camera only (all other types of collision are ignored)
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class GameCameraBlockingVolume extends BlockingVolume
	hidecategories(Collision)
	native
	placeable;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__BlockingVolume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_BlockingVolume
      bAcceptsLights=True
      CollideActors=True
      BlockActors=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__BlockingVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   bWorldGeometry=False
   CollisionComponent=BrushComponent0
   Name="Default__GameCameraBlockingVolume"
   ObjectArchetype=BlockingVolume'Engine.Default__BlockingVolume'
}
