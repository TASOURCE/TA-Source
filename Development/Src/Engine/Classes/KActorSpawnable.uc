/**
 * Version of KActor that can be dynamically spawned and destroyed during gameplay
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 **/
class KActorSpawnable extends KActor
	native(Physics)
	notplaceable;


/** If this is true then the KActor will scale to zero before hiding self */
var bool bRecycleScaleToZero;

/** Whether or not we are scaling to zero (in C++ TickSpecial()) */
var protected bool bScalingToZero;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


simulated function Initialize()
{
	bScalingToZero = FALSE;
	SetDrawScale( default.DrawScale );

	ClearTimer('Recycle');
	SetHidden(FALSE);
	StaticMeshComponent.SetHidden(FALSE);
	SetTickIsDisabled(false); 
	SetPhysics(PHYS_RigidBody);
	SetCollision(true, false);
}

/** This will reset the KActorSpawnable to its default state either first scaling to zero or by just hiding the object. **/
simulated function Recycle()
{
	if( bRecycleScaleToZero == TRUE )
	{
		bScalingToZero = TRUE;
	}
	else
	{
		RecycleInternal();
	}
}

/** This will reset the KActorSpawnable to its default state.  This is useful for pooling. **/
simulated event RecycleInternal()
{
	SetHidden(TRUE);
	StaticMeshComponent.SetHidden(TRUE);
	SetPhysics(PHYS_None);
	SetCollision(false, false);
	ClearTimer('Recycle');
	SetTickIsDisabled(true);
}



/** Used when the actor is pulled from a cache for use. */
native final function ResetComponents();

cpptext
{
	virtual void TickSpecial(FLOAT DeltaSeconds);

}


defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__KActor:StaticMeshComponent0'
      WireframeColor=(B=128,G=255,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__KActorSpawnable:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__KActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__KActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__KActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   bNoDelete=False
   CollisionComponent=StaticMeshComponent0
   Name="Default__KActorSpawnable"
   ObjectArchetype=KActor'Engine.Default__KActor'
}
