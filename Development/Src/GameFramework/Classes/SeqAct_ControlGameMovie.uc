/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ControlGameMovie extends SeqAct_Latent
	native;


/** Which movie to play */
var(Movie) string MovieName;

/** When the fading in from just audio to audio and video should occur **/
var(Movie) int StartOfRenderingMovieFrame;

/** When the fading from audio and video to just audio should occur **/
var(Movie) int EndOfRenderingMovieFrame;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   StartOfRenderingMovieFrame=-1
   EndOfRenderingMovieFrame=-1
   bAutoActivateOutputLinks=False
   InputLinks(0)=(LinkDesc="Play")
   InputLinks(1)=(LinkDesc="Stop")
   OutputLinks(0)=(LinkDesc="Out")
   OutputLinks(1)=(LinkDesc="Movie Completed")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="MovieName",PropertyName="MovieName")
   Name="Default__SeqAct_ControlGameMovie"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
