class TrStormCarrierShield extends DynamicSMActor
    ClassGroup(Objective)
	placeable;

/** Are the shields up? */
var bool m_bAreShieldsUp;

/** Determines which team to associate this shield with. */
var() TrStormCore m_AssociatedCarrierCore;

function OnShieldsDestroyed()
{
	SetHidden(true);
	m_bAreShieldsUp = false; 

	// Kismet
	TriggerEventClass(class'TrSeqEvent_StormShield', self, 0);
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local TrPawn TrP;

	if( !m_bAreShieldsUp )
	{
		return;
	}

	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	if( Role == ROLE_Authority )
	{
		TrP = TrPawn(Other);
		if( TrP != none && TrP.Controller != none && (TrP.Controller.GetTeamNum() == 0 || TrP.Controller.GetTeamNum() == 1) && m_AssociatedCarrierCore != none && m_AssociatedCarrierCore.DefenderTeamIndex != TrP.GetTeamNum() )
		{
			TrP.FellOutOfWorld(class'TrDmgType_StormShield');
		}
	}
}

defaultproperties
{
   m_bAreShieldsUp=True
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
      Materials(0)=None
      ReplacementPrimitive=None
      BlockRigidBody=False
      Scale3D=(X=21.000000,Y=4.200000,Z=4.200000)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   bPawnCanBaseOn=False
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   bNoDelete=True
   bAlwaysRelevant=True
   bReplicateMovement=False
   bCollideActors=True
   bNoEncroachCheck=True
   CollisionComponent=StaticMeshComponent0
   SupportedEvents(4)=Class'TribesGame.TrSeqEvent_StormShield'
   Name="Default__TrStormCarrierShield"
   ObjectArchetype=DynamicSMActor'Engine.Default__DynamicSMActor'
}
