class TrSeqAct_TrainingMessage extends SequenceAction
	dependson(TrHelpTextManager_Training);

var() EHelpTextTrainingType m_MessageType;

event Activated()
{
	local TrPlayerController_Training TrPC;
	local TrHelpTextManager_Training HelpTextManager;

	TrPC = TrPlayerController_Training(GetWorldInfo().GetALocalPlayerController());
	if( TrPC != None )
	{
		HelpTextManager = TrHelpTextManager_Training(TrPC.m_HelpTextManager);
		if( HelpTextManager != none )
		{
			HelpTextManager.RequestHelpText_Training(m_MessageType);
		}
	}
}

defaultproperties
{
   bCallHandler=False
   ObjName="Training Message"
   ObjCategory="Training"
   Name="Default__TrSeqAct_TrainingMessage"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
