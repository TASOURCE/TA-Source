/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactorySkeletalMesh extends ActorFactory
	config(Editor)
	native;

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

var()	SkeletalMesh	SkeletalMesh;
var()	AnimSet			AnimSet;
var()	name			AnimSequenceName;

cpptext
{
	virtual AActor* CreateActor( const FVector* const Location, const FRotator* const Rotation, const class USeqAct_ActorFactory* const ActorFactoryData );
	
	/**
	 * If the ActorFactory thinks it could create an Actor with the current settings.
	 * Can Used to determine if we should add to context menu or if the factory can be used for drag and drop.
	 *
	 * @param	OutErrorMsg		Receives localized error string name if returning FALSE.
	 * @param	bFromAssetOnly	If true, the actor factory will check that a valid asset has been assigned from selection.  If the factory always requires an asset to be selected, this param does not matter
	 * @return	True if the actor can be created with this factory
	 */
	virtual UBOOL CanCreateActor( FString& OutErrorMsg, UBOOL bFromAssetOnly = FALSE );

	virtual void AutoFillFields(class USelection* Selection);
	virtual FString GetMenuName();

}


defaultproperties
{
   GameplayActorClass=Class'Engine.SkeletalMeshActorSpawnable'
   MenuName="Add SkeletalMesh"
   MenuPriority=13
   NewActorClass=Class'Engine.SkeletalMeshActor'
   Name="Default__ActorFactorySkeletalMesh"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
