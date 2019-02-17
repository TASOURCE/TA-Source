/*=============================================================================
	ActorFactoryApexDestructible.uc: Apex integration for Destructible Assets
	Copyright 2008-2009 NVIDIA corporation..
=============================================================================*/

class ActorFactoryApexDestructible extends ActorFactory
	config(Editor)
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
/** Starts the actor in an awake(dynamic) state */
var() bool bStartAwake;

/** Allows setting the RBChannel flag on the spawned rigid body's StaticMeshComponent. */
var() ERBCollisionChannel		RBChannel;

/** Define the channels with which this actor will collide. */
var() const RBCollisionChannelContainer CollideWithChannels;

var()	ApexDestructibleAsset		DestructibleAsset;

cpptext
{
	virtual AActor* CreateActor( const FVector* const Location, const FRotator* const Rotation, const class USeqAct_ActorFactory* const ActorFactoryData );
	virtual UBOOL CanCreateActor(FString& OutErrorMsg, UBOOL bFromAssetOnly = FALSE);
	virtual void AutoFillFields(class USelection* Selection);
	virtual FString GetMenuName();

}


defaultproperties
{
   RBChannel=RBCC_EffectPhysics
   CollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
   GameplayActorClass=Class'Engine.ApexDestructibleActorSpawnable'
   MenuName="Add ApexDestructibleActor"
   NewActorClass=Class'Engine.ApexDestructibleActor'
   Name="Default__ActorFactoryApexDestructible"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
