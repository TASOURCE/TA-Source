/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** special actor that only blocks weapons fire */
class UDKWeaponShield extends Actor
	native
	abstract;

/** If true, doesn't block projectiles flagged as bNotBlockedByShield */
var bool bIgnoreFlaggedProjectiles;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=True
   bProjTarget=True
   Name="Default__UDKWeaponShield"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
