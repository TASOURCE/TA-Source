/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SkyLightComponent extends LightComponent
	native(Light)
	hidecategories(Object)
	editinlinenew;

/** The brightness for the lower hemisphere of the sky light. */
var() const float LowerBrightness;

/** The color of the lower hemisphere of the sky light. */
var() const color LowerColor;

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
// (cpptext)

cpptext
{
	/**
	 * Called when a property is being changed.
	 *
	 * @param PropertyThatChanged	Property that changed or NULL if unknown or multiple
	 */
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	/**
	 * Called after data has been serialized.
	 */
	virtual void PostLoad();

	// ULightComponent interface.
	virtual FLightSceneInfo* CreateSceneInfo() const;
	virtual FVector4 GetPosition() const;
	virtual ELightComponentType GetLightType() const;

}


defaultproperties
{
   LowerColor=(B=255,G=255,R=255,A=0)
   CastShadows=False
   Name="Default__SkyLightComponent"
   ObjectArchetype=LightComponent'Engine.Default__LightComponent'
}
