/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_PlayMusicTrack extends SequenceAction
	native(Sequence)
	dependson(MusicTrackDataStructures);


var() MusicTrackStruct MusicTrack;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Activated();
	virtual void PreSave();

}


defaultproperties
{
   MusicTrack=(FadeInTime=5.000000,FadeInVolumeLevel=1.000000,FadeOutTime=5.000000)
   ObjName="Play Music Track"
   ObjCategory="Sound"
   Name="Default__SeqAct_PlayMusicTrack"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
