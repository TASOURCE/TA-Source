class TrSeqAct_EndMatch extends SequenceAction;

event Activated()
{
	GetWorldInfo().Game.EndGame(none, "kismet");
}

defaultproperties
{
   bCallHandler=False
   ObjName="End Match"
   ObjCategory="Level"
   Name="Default__TrSeqAct_EndMatch"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
