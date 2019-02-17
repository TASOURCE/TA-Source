/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Used to define areas of a map by portal
 */
class PortalVolume extends Volume
	native
	placeable
	hidecategories( Advanced, Attachment, Collision, Volume );

/** List of teleporters residing in this volume */
var				array<PortalTeleporter>		Portals;

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
	 * Removes the portal volume to world info's list of portal volumes.
	 */
	virtual void ClearComponents( void );

protected:
	/**
	 * Adds the portal volume to world info's list of portal volumes.
	 */
	virtual void UpdateComponentsInternal( UBOOL bCollisionUpdate = FALSE );
public:

}


defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
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
   Name="Default__PortalVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
