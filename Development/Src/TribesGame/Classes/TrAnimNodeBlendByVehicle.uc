/**
 * Blends pawn based on if it is in a vehicle or not.
 */

class TrAnimNodeBlendByVehicle extends TrAnimNodeBlendList
    native;

enum EVehicleAnims
{
    VANIM_NoVehicle,
    VANIM_Driving,
    VANIM_Enter,
    VANIM_Exit,
    VANIM_ChangeSeat,
};

/** TrPawn owner */
var		transient TrPawn	m_TrPawn;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function PlayNoVehicleAnim();
native function PlayDrivingAnim();
native function PlayEnterAnim();
native function PlayExitAnim();
native function PlayChangeSeatAnim();

defaultproperties
{
   Children(0)=(Name="Not In Vehicle",Weight=1.000000)
   Children(1)=(Name="Driving")
   Children(2)=(Name="Enter")
   Children(3)=(Name="Exit")
   Children(4)=(Name="Change Seat")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByVehicle"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
