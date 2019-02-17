/**
 * Base class for data providers which provide data retrieved from the engine's config cache.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UIConfigProvider extends UIDataProvider
	native(inherit)
	transient
	abstract;

defaultproperties
{
   Name="Default__UIConfigProvider"
   ObjectArchetype=UIDataProvider'Engine.Default__UIDataProvider'
}
