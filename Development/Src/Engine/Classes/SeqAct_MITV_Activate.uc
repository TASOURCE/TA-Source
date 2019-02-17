/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_MITV_Activate extends SequenceAction;


/** This is how long this MITV should last **/
var() float DurationOfMITV;


static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}


/**
 * Called when this event is activated.
 */
event Activated()
{
	local SeqVar_Object ObjVar;
	local MaterialInstanceTimeVaryingActor MITVA;

	// find the possibly linked ChaosZoneInfo 
	foreach LinkedVariables( class'SeqVar_Object', ObjVar, "MITV" )
	{
		MITVA = MaterialInstanceTimeVaryingActor(ObjVar.GetObjectValue());
		
		if( MITVA != None )
		{
			if( MITVA.MatInst != None )
			{
				MITVA.MatInst.SetDuration( DurationOfMITV );
			}
		}
	}	
}

defaultproperties
{
   bCallHandler=False
   VariableLinks(0)=(LinkDesc="MITV")
   ObjName="MITV Activate"
   ObjCategory="Actor"
   Name="Default__SeqAct_MITV_Activate"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
