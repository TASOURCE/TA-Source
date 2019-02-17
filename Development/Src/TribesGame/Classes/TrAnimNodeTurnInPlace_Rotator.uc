/** 
 * Node to to rotate mesh based on counteracting a turn in place yaw offset.
 */
class TrAnimNodeTurnInPlace_Rotator extends AnimNodeBlendBase
    native;

/** TrPawn owner */
var transient TrPawn m_TrPawn;

/** Array of TgAnimTurnInPlace nodes */
var const array<TrAnimNodeTurnInPlace> c_TurnInPlaceNodes;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Children(0)=(Name="Input",Weight=1.000000)
   bFixNumChildren=True
   Name="Default__TrAnimNodeTurnInPlace_Rotator"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
