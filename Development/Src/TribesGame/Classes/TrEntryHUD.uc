class TrEntryHUD extends HUD
    native;

native function CreateMainMenu();

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    // Run the create here so we know our entry player has had time to initialize
    CreateMainMenu();
}

defaultproperties
{
   Name="Default__TrEntryHUD"
   ObjectArchetype=HUD'Engine.Default__HUD'
}
