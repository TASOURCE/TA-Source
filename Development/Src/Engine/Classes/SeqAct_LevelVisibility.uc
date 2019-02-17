/**
 * SeqAct_LevelVisibility
 *
 * Kismet action exposing associating/ dissociating of levels.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_LevelVisibility extends SeqAct_Latent
	native(Sequence);

/** LevelStreaming object that is going to be associated/ dissociated on request */
var() LevelStreaming Level;

/** LevelStreaming object name */
var() Name LevelName<autocomment=true>;

var transient bool bStatusIsOk;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	void Activated();
	UBOOL UpdateOp(FLOAT DeltaTime);
	virtual void DrawExtraInfo(FCanvas* Canvas, const FVector& BoxCenter);
	virtual void UpdateStatus();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   InputLinks(0)=(LinkDesc="Make Visible")
   InputLinks(1)=(LinkDesc="Hide")
   ObjName="Change Level Visibility"
   ObjCategory="Level"
   Name="Default__SeqAct_LevelVisibility"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
