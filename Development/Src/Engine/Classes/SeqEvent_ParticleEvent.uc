/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_ParticleEvent extends SequenceEvent
	native(Sequence);

/************************************************************************/
/* Enums, consts, structs, etc.                                         */
/************************************************************************/
enum EParticleEventOutputType
{
	ePARTICLEOUT_Spawn,
	ePARTICLEOUT_Death,
	ePARTICLEOUT_Collision,
	ePARTICLEOUT_Kismet
};

/** The type of event. */
var	EParticleEventOutputType	EventType;
/** The particle position of the event. */
var	vector						EventPosition;
/** The emitter time of the event. */
var	float						EventEmitterTime;
/** The particle velocity of the event. */
var	vector						EventVelocity;
/** The particle time of the event. */
var	float						EventParticleTime;
/** The collision normal of the event. */
var	vector						EventNormal;

/** If TRUE, use the impact direction reflected about the hit normal as the normal. */
var() bool						UseRelfectedImpactVector;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 0;
}

cpptext
{
	virtual void OnCreated();
	virtual UBOOL CheckActivate(AActor *InOriginator, AActor *InInstigator, UBOOL bTest=FALSE, TArray<INT>* ActivateIndices = NULL, UBOOL bPushTop = FALSE);

	/** Called via PostEditChange(), lets ops create/remove dynamic links based on data. */
	virtual void UpdateDynamicLinks();

	/** Helper function for filling in the output links according to the assigned emitter. */
	virtual void SetupOutputLinks(UBOOL bPreserveExistingLinks = TRUE);

}


defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Type",PropertyName="EventType",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Pos",PropertyName="EventPosition",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="ETime",PropertyName="EventEmitterTime",bWriteable=True)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Vel",PropertyName="EventVelocity",bWriteable=True)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="PTime",PropertyName="EventParticleTime",bWriteable=True)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Normal",PropertyName="EventNormal",bWriteable=True)
   ObjName="ParticleEvent"
   ObjCategory="Particles"
   Name="Default__SeqEvent_ParticleEvent"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
