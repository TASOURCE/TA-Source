/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines a delay
 */ 
 
class SoundNodeDelay extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

var( Delay )			float					DelayMin<ToolTip=The lower bound of delay time in seconds>;
var( Delay )			float					DelayMax<ToolTip=The upper bound of delay time in seconds>;

var			deprecated	rawdistributionfloat	DelayDuration;

defaultproperties
{
   DelayDuration=(Distribution=DistributionDelayDuration,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Name="Default__SoundNodeDelay"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
