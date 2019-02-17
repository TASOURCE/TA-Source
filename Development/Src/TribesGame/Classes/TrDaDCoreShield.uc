class TrDaDCoreShield extends DynamicSMActor
	notplaceable;

/** Team index for the pawns that may pass through. */
var() byte m_DefenderTeamIndex;

/** Material instance for this blocker. */
var transient array<MaterialInstanceConstant> m_MICs;

/** Base material. */
var() Material m_BaseMaterial;

/** The core to which this shield belongs. */
var transient TrDaDCore m_Core;

/** The index for this shield. */
var int m_nShieldIndex;

/** Shell on which this shield is based. */
var TrDaDShell m_Shell;

/** Initialization. */
simulated function Init(int ShieldIndex, optional TrDaDCore Core, optional TrDaDShell Shell)
{
	m_Core = Core;
	m_nShieldIndex = ShieldIndex;
	m_Shell = Shell;

	// Set up the static mesh based on the shield index.
	switch( ShieldIndex )
	{
		case 0:     
			StaticMeshComponent.SetStaticMesh(StaticMesh'OBJ_DnD.Models.ASE_OBJ_DnD_CoreShieldPanel_01', true);
			break;
		case 1:     
			StaticMeshComponent.SetStaticMesh(StaticMesh'OBJ_DnD.Models.ASE_OBJ_DnD_CoreShieldPanel_02', true);
			break;
		case 2:     
			StaticMeshComponent.SetStaticMesh(StaticMesh'OBJ_DnD.Models.ASE_OBJ_DnD_CoreShieldPanel_03', true);
			break;
	}
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	CreateMICs();
}

simulated function DisableBlocking()
{
	SetCollision(false, false, false);
	SetHidden(true);
	SetCollisionType(COLLIDE_NoCollision);
}

simulated function EnableBlocking()
{
	SetCollision(true, true, false);
	SetHidden(false);
	SetCollisionType(COLLIDE_BlockAll);
}

simulated function UpdateMaterialForPawn(TrPawn P)
{
	local int i;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( m_MICs.Length == 0 )
		{
			// We haven't cached our MICs yet, so do that now.
			CreateMICs();
		}

		// Set the color of the materials based on the team membership of P.
		for( i = 0; i < m_MICs.Length; i++ )
		{
			m_MICs[i].SetScalarParameterValue('bBlocker', P.GetTeamNum() == m_DefenderTeamIndex ? 0 : 1);
		}
	}
}

simulated function CreateMICs()
{
	local int i;

	if( m_MICs.Length > 0 )
	{
		// We already have our material instance constants.
		return;
	}

	if( StaticMeshComponent != none )
	{
		for( i = 0; i < StaticMeshComponent.GetNumElements(); i++ )
		{
			// Set the base material.
			StaticMeshComponent.SetMaterial(i,m_BaseMaterial);

			// Create the material instance constants.
			m_MICs.AddItem(StaticMeshComponent.CreateAndSetMaterialInstanceConstant(i));
		}	
	}
}

defaultproperties
{
   m_nShieldIndex=-1
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDCoreShield:MyLightEnvironment'
      CastShadow=False
      bCastDynamicShadow=False
      bAcceptsLights=False
      bAcceptsDynamicLights=False
      BlockRigidBody=False
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   RemoteRole=ROLE_None
   bWorldGeometry=True
   bAlwaysRelevant=True
   bReplicateMovement=False
   bProjTarget=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__TrDaDCoreShield"
   ObjectArchetype=DynamicSMActor'Engine.Default__DynamicSMActor'
}
