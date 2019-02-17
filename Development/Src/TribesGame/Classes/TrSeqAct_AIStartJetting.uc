class TrSeqAct_AIStartJetting extends SequenceAction;

var() float Magnitude;
var() Vector Direction;
var() bool m_bResetVelocity;

defaultproperties
{
   ObjName="Start Jetting"
   ObjCategory="AI"
   Name="Default__TrSeqAct_AIStartJetting"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
