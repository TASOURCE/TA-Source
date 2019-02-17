/**
 * 
 */
class TrPlayerController_Training extends TrPlayerController;

auto state PlayerWaiting
{
	simulated event BeginState(Name PreviousStateName)
	{
		// Skip all the pick team logic.
		ClientStartSpawnTimer();
	}
}

defaultproperties
{
   Begin Object Class=AudioComponent Name=LowHealthLoop Archetype=AudioComponent'TribesGame.Default__TrPlayerController:LowHealthLoop'
      bShouldRemainActiveIfDropped=True
      Name="LowHealthLoop"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerController:LowHealthLoop'
   End Object
   m_AudioComponentLowHealthLoop=LowHealthLoop
   Begin Object Class=AudioComponent Name=RechargeHealth Archetype=AudioComponent'TribesGame.Default__TrPlayerController:RechargeHealth'
      bShouldRemainActiveIfDropped=True
      Name="RechargeHealth"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerController:RechargeHealth'
   End Object
   m_AudioComponentRechargeHealth=RechargeHealth
   Begin Object Class=AudioComponent Name=CreditsSound Archetype=AudioComponent'TribesGame.Default__TrPlayerController:CreditsSound'
      bShouldRemainActiveIfDropped=True
      Name="CreditsSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerController:CreditsSound'
   End Object
   m_AudioComponentCreditsSound=CreditsSound
   m_CameraShakes(0)=(Shake=CameraShake'TribesGame.Default__TrPlayerController_Training:SmallShake')
   m_CameraShakes(1)=(Shake=CameraShake'TribesGame.Default__TrPlayerController_Training:MediumShake')
   m_CameraShakes(2)=(Shake=CameraShake'TribesGame.Default__TrPlayerController_Training:LargeShake')
   m_CameraShakes(3)=(Shake=CameraShake'TribesGame.Default__TrPlayerController_Training:Zinged')
   m_CameraShakes(4)=(Shake=CameraShake'TribesGame.Default__TrPlayerController_Training:ConcussionShake')
   m_HelpTextManagerClass=Class'TribesGame.TrHelpTextManager_Training'
   CameraShakeShortWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPlayerController_Training:ForceFeedbackWaveform7'
   CameraShakeLongWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPlayerController_Training:ForceFeedbackWaveform8'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=LowHealthLoop
   Components(2)=RechargeHealth
   Components(3)=CreditsSound
   CollisionComponent=CollisionCylinder
   Name="Default__TrPlayerController_Training"
   ObjectArchetype=TrPlayerController'TribesGame.Default__TrPlayerController'
}
