class TrTeamBlockerStaticMeshActor extends StaticMeshActor
	native
	placeable;

/** Team index for the pawns that may pass through. */
var() byte m_DefenderTeamIndex;

/** Should blocking be disabled when phase 0 of siege is over? */
var() bool m_bDisableBlockingOnSiegePhase0Ends;

/** Material instance for this blocker. */
var transient array<MaterialInstanceConstant> m_MICs;

/** Base material. */
var() Material m_BaseMaterial;

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

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_bDisableBlockingOnSiegePhase0Ends=True
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
      StaticMesh=StaticMesh'EditorMeshes.TexPropCube'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      CastShadow=False
      bCastDynamicShadow=False
      bAcceptsLights=False
      bAcceptsDynamicLights=False
      bUsePrecomputedShadows=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Components(0)=StaticMeshComponent0
   RemoteRole=ROLE_SimulatedProxy
   bStatic=False
   bNoDelete=True
   bWorldGeometry=False
   bAlwaysRelevant=True
   bReplicateMovement=False
   bProjTarget=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__TrTeamBlockerStaticMeshActor"
   ObjectArchetype=StaticMeshActor'Engine.Default__StaticMeshActor'
}
