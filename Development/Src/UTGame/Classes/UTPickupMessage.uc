/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//
// OptionalObject is an Pickup class
//
class UTPickupMessage extends UTLocalMessage;

static simulated function ClientReceive( 
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local UTHUDBase HUD;
	local UTHUD MyUTHUD;

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	HUD = UTHUDBase(P.MyHUD);
	if ( HUD != None )
	{
		HUD.LastPickupTime = HUD.WorldInfo.TimeSeconds;
		MyUTHUD = UTHUD(HUD);
		if ( MyUTHUD != None )
		{
			if ( class<UTPickupFactory>(OptionalObject) != None )
			{
				class<UTPickupFactory>(OptionalObject).static.UpdateHUD(MyUTHUD);
			}
			else if ( class<UTWeapon>(OptionalObject) != None )
			{
				MyUTHUD.LastWeaponBarDrawnTime = HUD.WorldInfo.TimeSeconds + 2.0;
			}
		}
	}		
}

defaultproperties
{
   MessageArea=5
   bIsUnique=True
   bIsConsoleMessage=False
   bCountInstances=True
   DrawColor=(B=128,G=255,R=255,A=255)
   FontSize=1
   Name="Default__UTPickupMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
