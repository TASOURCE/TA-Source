/**
 * Provides data for a UT3 map.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class TrUIDataProvider_MapInfo extends UDKUIDataProvider_MapInfo
	PerObjectConfig;

/** Script interface for determining whether or not this provider should be filtered */
event bool ShouldBeFiltered()
{
	return (false);
}

defaultproperties
{
   Name="Default__TrUIDataProvider_MapInfo"
   ObjectArchetype=UDKUIDataProvider_MapInfo'UDKBase.Default__UDKUIDataProvider_MapInfo'
}
