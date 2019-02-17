/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKAnimBlendByHoverboardTilt extends AnimNodeBlendBase
	native(Animation);


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

var		vector UpVector;

var()	float TiltScale;
var()	float TiltDeadZone;
var()	float TiltYScale;
var		name UpperBodyName;

defaultproperties
{
   TiltYScale=1.000000
   UpperBodyName="UpperBody"
   Children(0)=(Name="Flat",Weight=1.000000)
   Children(1)=(Name="Forward")
   Children(2)=(Name="Backward")
   Children(3)=(Name="Left")
   Children(4)=(Name="Right")
   bFixNumChildren=True
   Name="Default__UDKAnimBlendByHoverboardTilt"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
