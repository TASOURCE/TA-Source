class TrSeqEvent_Generator extends SequenceEvent;

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
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Online")
   OutputLinks(1)=(LinkDesc="Offline")
   OutputLinks(2)=(LinkDesc="Critical")
   ObjName="Generator Event"
   Name="Default__TrSeqEvent_Generator"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
