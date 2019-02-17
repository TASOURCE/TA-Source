/**
 * Activated when an receives the OnRigidBodyCollision notification from the physics system.
 * Originator: the actor that was just sitting there
 * Instigator: the actor that did the colliding
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_RigidBodyCollision extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Minimum impact speed (along contact normal) for this event to fire. */
var()	float	MinCollisionVelocity;

cpptext
{
	void CheckRBCollisionActivate( const FRigidBodyCollisionInfo& OriginatorInfo, const FRigidBodyCollisionInfo& InstigatorInfo1,
					const TArray<FRigidBodyContactInfo>& ContactInfos, FLOAT VelMag );

}


defaultproperties
{
   bPlayerOnly=False
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="ImpactVelocity",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="ImpactLocation",bWriteable=True)
   ObjName="Rigid Body Collision"
   ObjCategory="Physics"
   Name="Default__SeqEvent_RigidBodyCollision"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
