/* epic ===============================================
* class EdCoordSystem
*
* A custom coordinate system used by the editor.
*
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class EdCoordSystem extends Object
	hidecategories(Object)
	editinlinenew
	native;

/** The matrix that defines this coordinate system. */
var()	matrix	M;

/* A human readable description for use in the editor UI. */
var()	string	Desc;

defaultproperties
{
   M=(XPlane=(W=0.000000,X=1.000000,Y=0.000000,Z=0.000000),YPlane=(W=0.000000,X=0.000000,Y=1.000000,Z=0.000000),ZPlane=(W=0.000000,X=0.000000,Y=0.000000,Z=1.000000),WPlane=(W=1.000000,X=0.000000,Y=0.000000,Z=0.000000))
   Desc="Coord System"
   Name="Default__EdCoordSystem"
   ObjectArchetype=Object'Core.Default__Object'
}
