class TrDestroyableTarget extends UTSimpleDestroyable
	placeable;

simulated function TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int idx;
	local TrSeqEvent_TakeDamage dmgEvent;

	Super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	// search for any damage events
	for (idx = 0; idx < GeneratedEvents.Length; idx++)
	{
		dmgEvent = TrSeqEvent_TakeDamage(GeneratedEvents[idx]);
		if (dmgEvent != None)
		{
			// notify the event of the damage received
			dmgEvent.HandleDamage(self, EventInstigator, DamageType, DamageAmount);
		}
	}
}

simulated function OnToggle(SeqAct_Toggle action)
{
	RespawnDestructible();
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'UTGame.Default__UTSimpleDestroyable:StaticMeshComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDestroyableTarget:MyLightEnvironment'
      CastShadow=False
      BlockActors=False
      BlockRigidBody=False
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'UTGame.Default__UTSimpleDestroyable:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTSimpleDestroyable:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTSimpleDestroyable:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   CollisionComponent=StaticMeshComponent0
   SupportedEvents(4)=Class'TribesGame.TrSeqEvent_TakeDamage'
   Name="Default__TrDestroyableTarget"
   ObjectArchetype=UTSimpleDestroyable'UTGame.Default__UTSimpleDestroyable'
}
