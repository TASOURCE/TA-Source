/**
 * Node to play a transition animation referenced by transition type.
 */
class TrAnimNodeTurnInPlace_Player extends AnimNodeSequence
    native;

struct native TIP_Transition
{
	var		Name	TransName;
	var()	Name	AnimName;
};

var()	Array<TIP_Transition>	TIP_Transitions;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   TIP_Transitions(0)=(TransName="Rt_90",AnimName="TurnR90")
   TIP_Transitions(1)=(TransName="Rt_180",AnimName="TurnR180")
   TIP_Transitions(2)=(TransName="Lt_90",AnimName="TurnL90")
   TIP_Transitions(3)=(TransName="Lt_180",AnimName="TurnL180")
   RootRotationOption(2)=RRO_Discard
   Name="Default__TrAnimNodeTurnInPlace_Player"
   ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
}
