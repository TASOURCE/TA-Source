//=============================================================================
// MassiveLODOverrideVolume:  Forces lowest detail massive LOD's to be displayed when the viewer is inside the volume.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class MassiveLODOverrideVolume extends Volume
	native
	hidecategories(Collision,Brush,Attachment,Physics,Volume)
	placeable;

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
	 * Removes the volume from world info's list of volumes.
	 */
	virtual void ClearComponents();

protected:
	/**
	 * Adds the volume to world info's list of volumes.
	 */
	virtual void UpdateComponentsInternal( UBOOL bCollisionUpdate = FALSE );
public:

}


defaultproperties
{
   BrushColor=(B=80,G=80,R=120,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_Nothing
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__MassiveLODOverrideVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
