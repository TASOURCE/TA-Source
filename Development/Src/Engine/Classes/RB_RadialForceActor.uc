/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 * DO NOT USE, try the NxForceField classes instead!
 */
class RB_RadialForceActor extends RigidBodyBase
	native(ForceField)
	placeable;

enum ERadialForceType
{
	RFT_Force,		// Use as a force
	RFT_Impulse,	// Use as an impulse, gets deactivated when applied once
};

/** Used to preview the radius of the force. */
var	DrawSphereComponent			RenderComponent;

/** Strength of the force applied by this actor. Positive forces are applied outwards. */
var()	interp float	ForceStrength;

/** Radius of influence of the force. */
var()	interp float	ForceRadius;

/** How strongly objects orbit around Z axis of actor. */
var()	interp float	SwirlStrength;

/** How strongly to spin objects around their local Z. */
var()	interp float	SpinTorque;

/** Way in which the force falls off as objects are further away from the location. */
var()	PrimitiveComponent.ERadialImpulseFalloff	ForceFalloff;

/** Indicates whether the force is active at the moment. */
var()	bool	bForceActive;

/** Indicates which type of force mode is used. */
var()	ERadialForceType	RadialForceMode;

/** Apply force field to cloth */
var()	bool	bForceApplyToCloth;

/** Apply force field to fluid */
var()	bool	bForceApplyToFluid;

/** Apply force field to rigid bodies */
var()	bool	bForceApplyToRigidBodies;

/** Apply force field to projectiles like rockets */
var()	bool	bForceApplyToProjectiles;

//TODO: Remove the above booleans and just use the channels
/** Which types of object to apply this force field to */
var()	const RBCollisionChannelContainer CollideWithChannels;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty)
		bForceActive;
}

/** Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle inAction)
{
	if(inAction.InputLinks[0].bHasImpulse)
	{
		bForceActive = true;
	}
	else if(inAction.InputLinks[1].bHasImpulse)
	{
		bForceActive = false;
	}
	else if(inAction.InputLinks[2].bHasImpulse)
	{
		bForceActive = !bForceActive;
	}

	SetForcedInitialReplicatedProperty(Property'Engine.RB_RadialForceActor.bForceActive', (bForceActive == default.bForceActive));
}

cpptext
{
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void TickSpecial(FLOAT DeltaSeconds);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif

}


defaultproperties
{
   Begin Object Class=DrawSphereComponent Name=DrawSphere0
      SphereColor=(B=255,G=70,R=64,A=255)
      SphereRadius=200.000000
      bDrawOnlyIfSelected=True
      ReplacementPrimitive=None
      Name="DrawSphere0"
      ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
   End Object
   RenderComponent=DrawSphere0
   ForceStrength=10.000000
   ForceRadius=200.000000
   bForceApplyToCloth=True
   bForceApplyToFluid=True
   bForceApplyToRigidBodies=True
   CollideWithChannels=(Default=True,Pawn=True,Vehicle=True,Water=True,GameplayPhysics=True,EffectPhysics=True,Untitled1=True,Untitled2=True,Untitled3=True,Untitled4=True,Cloth=True,FluidDrain=True)
   Components(0)=DrawSphere0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadForce'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   RemoteRole=ROLE_SimulatedProxy
   bNoDelete=True
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   NetUpdateFrequency=0.100000
   Name="Default__RB_RadialForceActor"
   ObjectArchetype=RigidBodyBase'Engine.Default__RigidBodyBase'
}
