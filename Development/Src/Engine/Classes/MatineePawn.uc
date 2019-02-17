/**
 * MatineePawn - used only to preview in Matinee
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class MatineePawn extends Pawn
	native(Pawn);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

// Preview Mesh
var() editoronly SkeletalMesh PreviewMesh;

cpptext
{
	// Sets Mesh to PreviewMesh
	void ReplacePreviewMesh(USkeletalMesh * NewPreviewMesh);

}


defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=PawnMesh
      ReplacementPrimitive=None
      Translation=(X=0.000000,Y=0.000000,Z=-72.000000)
      Name="PawnMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   Mesh=PawnMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Pawn:CollisionCylinder'
      CollisionHeight=72.000000
      CollisionRadius=30.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Pawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Pawn:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Pawn:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__Pawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__Pawn:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=PawnMesh
   Physics=PHYS_Falling
   CollisionComponent=CollisionCylinder
   Name="Default__MatineePawn"
   ObjectArchetype=Pawn'Engine.Default__Pawn'
}
