/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ImageBasedReflectionComponent extends StaticMeshComponent
	native(Mesh)
	hidecategories(StaticMeshComponent)
	placeable
	editinlinenew;

/** Whether to render the reflection. */
var() bool bEnabled;

/** Whether the reflection should be visible from the back. */
var() bool bTwoSided;

/** 
 * Texture that will be applied to this reflection. 
 * This texture will be used in a texture array and therefore must have the same size, number of mips, texture group settings and format 
 * As the ReflectionTexture of every LightComponent and ImageBasedReflectionComponent that can be loaded at the same time.
 */
var() Texture2D ReflectionTexture;

/** Color that will be multiplied against ReflectionTexture.  Alpha is a brightness control. */
var() LinearColor ReflectionColor;

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

cpptext
{
protected:
	// ActorComponent interface.
	virtual UBOOL IsValidComponent() const { return ReflectionTexture != NULL; }
	virtual void Attach();
	virtual void UpdateTransform();
	virtual void Detach( UBOOL bWillReattach = FALSE );
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

	virtual void PostLoad();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   bEnabled=True
   ReflectionTexture=Texture2D'Engine_MI_Shaders.Textures.DefaultReflectionTexture_IBR'
   ReflectionColor=(R=1.000000,G=1.000000,B=1.000000,A=1.000000)
   StaticMesh=StaticMesh'EditorMeshes.TexPropPlane'
   WireframeColor=(B=200,G=100,R=100,A=255)
   Materials(0)=Material'EditorMaterials.Utilities.ImageReflectionPreview'
   ReplacementPrimitive=None
   HiddenGame=True
   bUseAsOccluder=False
   bAcceptsStaticDecals=False
   bAcceptsDynamicDecals=False
   CastShadow=False
   bCastDynamicShadow=False
   bAcceptsLights=False
   bAcceptsDynamicLights=False
   CollideActors=False
   BlockRigidBody=False
   Name="Default__ImageBasedReflectionComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
