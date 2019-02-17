/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines how a sound loops; either indefinitely, or for a set number of times
 */
  
class SoundNodeLooping extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

var( Looping )			bool					bLoopIndefinitely;
var( Looping )			float					LoopCountMin<ToolTip=The lower bound of number of times to loop>;
var( Looping )			float					LoopCountMax<ToolTip=The upper bound of number of times to loop>;

var			deprecated	rawdistributionfloat	LoopCount;

defaultproperties
{
   bLoopIndefinitely=True
   LoopCountMin=1000000.000000
   LoopCountMax=1000000.000000
   LoopCount=(Distribution=DistributionLoopCount,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1000000.000000,1000000.000000,1000000.000000,1000000.000000))
   Name="Default__SoundNodeLooping"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
