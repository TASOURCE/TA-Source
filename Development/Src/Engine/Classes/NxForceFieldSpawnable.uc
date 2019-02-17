/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldSpawnable extends Actor
	native(ForceField)
	dependson(PrimitiveComponent);
	
var() NxForceFieldComponent ForceFieldComponent;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle inAction)
{
	if(inAction.InputLinks[0].bHasImpulse)
	{
		ForceFieldComponent.bForceActive = true;
	}
	else if(inAction.InputLinks[1].bHasImpulse)
	{
		ForceFieldComponent.bForceActive = false;
	}
	else if(inAction.InputLinks[2].bHasImpulse)
	{
		ForceFieldComponent.bForceActive = !ForceFieldComponent.bForceActive;
	}
}

cpptext
{


}


defaultproperties
{
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   NetUpdateFrequency=0.100000
   Name="Default__NxForceFieldSpawnable"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
