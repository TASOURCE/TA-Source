class TrAnimNodeSequencePose extends AnimNodeSequence
	native;

var transient const array<AnimNode.BoneAtom> m_PoseSpaceBases;

native function FillWithPose(TrPawn P);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TrAnimNodeSequencePose"
   ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
}
