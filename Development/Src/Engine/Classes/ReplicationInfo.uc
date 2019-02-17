//=============================================================================
// ReplicationInfo.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ReplicationInfo extends Info
	abstract
	native(ReplicationInfo);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	INT* GetOptimizedRepList( BYTE* Recent, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );

}


defaultproperties
{
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   Name="Default__ReplicationInfo"
   ObjectArchetype=Info'Engine.Default__Info'
}
