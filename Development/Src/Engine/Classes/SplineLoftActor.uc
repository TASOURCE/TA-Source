/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class SplineLoftActor extends SplineActor
	placeable
	native(Spline);
	

/** Size that mesh should be along its local X axis at this node on spline. */
var()   interp float   ScaleX;

/** Size that mesh should be along its local Y axis at this node on spline. */
var()   interp float   ScaleY;

/** Components used to render deformed meshes along each connection spline to other nodes */
var     array<SplineMeshComponent>  SplineMeshComps;

/** 
 *  Mesh to deform along spline 
 *  This must be set to have a visual mesh viewable in the world
 *  @TODO: make a map check for errors for this being None
 */
var() const StaticMesh                  DeformMesh;

/** Materials to override with for this instance */
var() const array<MaterialInterface>	DeformMeshMaterials;


/** Roll around spline at this node, in degrees */
var()   interp float   Roll;

/** Axis (in world space) used to determine the X axis for the mesh along the spline */
var()   Vector  WorldXDir;

/** Offset in X and Y for the mesh along the spline.  Note the offset is applied BEFORE scaling and roll */
var()   Vector2D Offset;

/** If TRUE, will use smooth interpolation (ease in/out) for Scale and Roll along this section of spline. If FALSE, uses linear */
var()   bool    bSmoothInterpRollAndScale;

/** If TRUE, generated SplineMeshComponents will accept lights */
var()   bool    bAcceptsLights;

/** Light environment used to light dynamically moving spline */
var() const editconst DynamicLightEnvironmentComponent MeshLightEnvironment;

/** The maximum distance at which these meshes will be drawn */
var()   float   MeshMaxDrawDistance;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Clear any static mesh assigned to this spline actor */
native function ClearLoftMesh();

/** Quick function that updates params/positions of the spline mesh components  */
native function UpdateSplineParams();

cpptext
{
	virtual void PostLoad();		
	virtual void UpdateComponentsInternal(UBOOL bCollisionUpdate = FALSE);

    virtual void UpdateSplineComponents();	

}


defaultproperties
{
   ScaleX=1.000000
   ScaleY=1.000000
   WorldXDir=(X=1.000000,Y=0.000000,Z=0.000000)
   bSmoothInterpRollAndScale=True
   bAcceptsLights=True
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SplineActor:Sprite'
      Sprite=Texture2D'EditorResources.Spline.T_Loft_Spline'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SplineActor:Sprite'
   End Object
   Components(0)=Sprite
   bStatic=True
   bWorldGeometry=True
   bGameRelevant=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   bEdShouldSnap=True
   Name="Default__SplineLoftActor"
   ObjectArchetype=SplineActor'Engine.Default__SplineActor'
}
