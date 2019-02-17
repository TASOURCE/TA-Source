class TrVehicleSimChopper extends UDKVehicleSimChopper
	native;

/** How fast to turn. */
var()   float       HoverHeight;
var()   float       ReverseSpeed;
var	    int	        m_nLastPitchInput;
var	    int	        m_nLastYawInput;
var     bool        m_bInvertFlight;
var     AnglePID    PitchGain;
var     AnglePID    RollGain;
var     bool        bShouldStabilizeRotation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function SetVehicleControls(bool bInvert);

defaultproperties
{
   HoverHeight=500.000000
   Name="Default__TrVehicleSimChopper"
   ObjectArchetype=UDKVehicleSimChopper'UDKBase.Default__UDKVehicleSimChopper'
}
