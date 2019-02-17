class TrVehicleInput_Flying extends PlayerInput
	config(Input);

function AdjustMouseSensitivity(float FOVScale)
{
	// Apply mouse sensitivity.
	aMouseX *= FlyingYawSensitivity * FOVScale;
	aMouseY *= FlyingPitchSensitivity * FOVScale;
}

defaultproperties
{
   Bindings(0)=(Name="G",Command="Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(1)=(Name="N",Command="Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(2)=(Name="A",Command="GBA_TurnLeft_Gamepad")
   Bindings(3)=(Name="F4",Command="Playersonly")
   Bindings(4)=(Name="F5",Command="set D3DRenderDevice UsePostProcessEffects False")
   Bindings(5)=(Name="F6",Command="set D3DRenderDevice UsePostProcessEffects True")
   Bindings(6)=(Name="F7",Command="NextViewMode")
   Bindings(7)=(Name="F8",Command="PrevViewMode")
   Bindings(8)=(Name="M",Command="BasePath 0")
   Bindings(9)=(Name="N",Command="BasePath 1")
   Name="Default__TrVehicleInput_Flying"
   ObjectArchetype=PlayerInput'Engine.Default__PlayerInput'
}
