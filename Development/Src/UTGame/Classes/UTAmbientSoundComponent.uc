/** used for gameplay-relevant ambient sounds (e.g. weapon loading sounds) 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTAmbientSoundComponent extends AudioComponent;

event OcclusionChanged(bool bNowOccluded)
{
	Super.OcclusionChanged(bNowOccluded);
}

defaultproperties
{
   bStopWhenOwnerDestroyed=True
   bShouldRemainActiveIfDropped=True
   OcclusionCheckInterval=1.000000
   Name="Default__UTAmbientSoundComponent"
   ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
}
