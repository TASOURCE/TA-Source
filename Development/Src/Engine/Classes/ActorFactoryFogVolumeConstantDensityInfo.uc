/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryFogVolumeConstantDensityInfo extends ActorFactory
	config(Editor)
	native(FogVolume);

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

var	MaterialInterface SelectedMaterial;
var bool bNothingSelected;

cpptext
{
	/**
	 * If the ActorFactory thinks it could create an Actor with the current settings.
	 * Used to determine if we should add to context menu for example.
	 *
	 * @param	OutErrorMsg		Receives localized error string name if returning FALSE.
	 * @param	bFromAssetOnly	If true, the actor factory will check that a valid asset has been assigned from selection.  If the factory always requires an asset to be selected, this param does not matter
	 */
	virtual UBOOL CanCreateActor( FString& OutErrorMsg, UBOOL bFromAssetOnly );
	virtual AActor* CreateActor( const FVector* const Location, const FRotator* const Rotation, const class USeqAct_ActorFactory* const ActorFactoryData );
	virtual void AutoFillFields(class USelection* Selection);

}


defaultproperties
{
   MenuName="Add FogVolumeConstantDensityInfo"
   NewActorClass=Class'Engine.FogVolumeConstantDensityInfo'
   Name="Default__ActorFactoryFogVolumeConstantDensityInfo"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
