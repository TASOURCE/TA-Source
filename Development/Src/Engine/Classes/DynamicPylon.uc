//=============================================================================
// DynamicPylon
//
// Represents a navigation mesh which is based on a moveable actor
//
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class DynamicPylon extends Pylon
	placeable
	native(inherit);

// indicates this Pylon is moving (and thus not connected to the rest of the mesh)
var bool bMoving;

function PostBeginPlay()
{
	super.PostBeginPlay();
	RebuildDynamicEdges();
}
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 *  will wipe all dynamic edges for this pylon, and rebuild them from the currently position (use this sparingly, it's not cheap)
 *  good time to call this is after the pylon is finished moving, or comes to rest
 */
native function RebuildDynamicEdges();

/**
 * will remove all dynamic edges associated with this pylon
 */
native function FlushDynamicEdges();

event StartedMoving()
{
	;
	bMoving=true;
	FlushDynamicEdges();
}

event StoppedMoving()
{
	;
	bMoving=false;
	RebuildDynamicEdges();
}

cpptext
{
   /**
	 * indicates whether static cross-pylon edges should be built for this pylon (pylons that move should return false)
	 */
	virtual UBOOL NeedsStaticCrossPylonEdgesBuilt(){ return FALSE; } 

	
	/**
	 * Called from UpdateComponentsInternal when a transform update is needed (when this pylon has moved)
	 */
	virtual void PylonMoved();

	virtual void PreBeginPlay();

	virtual void FindBase();

}


defaultproperties
{
   Begin Object Class=DrawPylonRadiusComponent Name=DrawPylonRadius0 Archetype=DrawPylonRadiusComponent'Engine.Default__Pylon:DrawPylonRadius0'
      ReplacementPrimitive=None
      Name="DrawPylonRadius0"
      ObjectArchetype=DrawPylonRadiusComponent'Engine.Default__Pylon:DrawPylonRadius0'
   End Object
   PylonRadiusPreview=DrawPylonRadius0
   Begin Object Class=NavMeshRenderingComponent Name=NavMeshRenderer Archetype=NavMeshRenderingComponent'Engine.Default__Pylon:NavMeshRenderer'
      ReplacementPrimitive=None
      Name="NavMeshRenderer"
      ObjectArchetype=NavMeshRenderingComponent'Engine.Default__Pylon:NavMeshRenderer'
   End Object
   RenderingComp=NavMeshRenderer
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Pylon:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Pylon:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Pylon:Sprite'
      Sprite=Texture2D'EditorResources.DynamicPylon'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Pylon:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__Pylon:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__Pylon:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__Pylon:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__Pylon:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__Pylon:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__Pylon:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=NavMeshRenderer
   Components(6)=DrawPylonRadius0
   Begin Object Class=SpriteComponent Name=Sprite3 Archetype=SpriteComponent'Engine.Default__Pylon:Sprite3'
      Sprite=Texture2D'EditorResources.BadPylon'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite3"
      ObjectArchetype=SpriteComponent'Engine.Default__Pylon:Sprite3'
   End Object
   Components(7)=Sprite3
   bStatic=False
   CollisionComponent=CollisionCylinder
   Name="Default__DynamicPylon"
   ObjectArchetype=Pylon'Engine.Default__Pylon'
}
