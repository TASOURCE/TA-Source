/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTextureSampleParameterCube extends MaterialExpressionTextureSampleParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

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
	virtual FString GetCaption() const;
	virtual UBOOL TextureIsValid( UTexture* InTexture );
	virtual const TCHAR* GetRequirements();
	
	/**
	 *	Sets the default texture if none is set
	 */
	virtual void SetDefaultTexture();

}


defaultproperties
{
   Texture=TextureCube'EngineResources.DefaultTextureCube'
   MenuCategories(0)="Texture"
   MenuCategories(1)="Parameters"
   Name="Default__MaterialExpressionTextureSampleParameterCube"
   ObjectArchetype=MaterialExpressionTextureSampleParameter'Engine.Default__MaterialExpressionTextureSampleParameter'
}