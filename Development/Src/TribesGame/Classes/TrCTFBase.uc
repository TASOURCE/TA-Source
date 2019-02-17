class TrCTFBase extends UTCTFBase
	abstract;

/** Flag stand mesh. */
var SkeletalMeshComponent m_FlagStandMesh;

/** Controls the flag stand animation state. */
var TrAnimNodeBlendList m_OpenCloseBlendList;

/** MIC used for the HUD marker */
var transient MaterialInstanceConstant m_MarkerMIC;

/** Flag base index used for CTF Blitz. Must be unique per team. Valid values: 0-4. */
var() int CTFBlitzIndex;

/** Is this flag stand active? (Blitz only!) */
var transient repnotify bool r_bIsActive;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		r_bIsActive;
}

simulated event ReplicatedEvent(name VarName)
{
	if ( VarName == 'r_bIsActive' )
	{
		SetBlitzStandActive(r_bIsActive);
	}

	super.ReplicatedEvent(VarName);
}

simulated function SetBlitzStandActive(bool bActive)
{
	if( Role == ROLE_Authority )
	{
		r_bIsActive = bActive;
	}

	if( bActive )
	{
		SetHidden(false);
	}
	else
	{
		SetHidden(true);
	}
}

simulated function PostBeginPlay()
{
	local TrGame_TrCTFBlitz BlitzGame;

	if( CTFBlitzIndex > 0 )
	{
		SetHidden(true);
	}

    Super.PostBeginPlay();

    if( Role == ROLE_Authority )
    {
		BlitzGame = TrGame_TrCTFBlitz(WorldInfo.Game);
		if( BlitzGame != none && CTFBlitzIndex >= 0 && CTFBlitzIndex < 5 )
		{
			BlitzGame.RegisterFlagBase(self);
			
			// Set the first base active.
			if( CTFBlitzIndex == 0 )
			{
				SetBlitzStandActive(true);
			}
			else
			{
				SetBlitzStandActive(false);
			}
		}

		if( TrGame_TRCTF(WorldInfo.Game) != None && (CTFBlitzIndex == INDEX_NONE || CTFBlitzIndex == 0) )
		{
			myFlag = Spawn(FlagType, self);

			if (myFlag==None)
			{
				;
				return;
			}
			else
			{
				TrGame_TRCTF(WorldInfo.Game).RegisterFlag(myFlag, DefenderTeamIndex);
				myFlag.HomeBase = self;
			}
		}
    }
}


simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
    local bool isFriendly;
    local int teamNum;
	local vector ScreenLoc;
	local TrHUD HUD;

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		if( !TrPlayerController(PC).m_bShowSpectatorHUD )
		{
			return;
		}
	}

	// BZ 9764: As per Sean and Scott, hide flag stand caret if the flag is at home.
    if (myFlag == none || myFlag.bHome)
    {
        return;
    }
    
    //if (!HUD.bShowObjectives) return;

	ScreenLoc = Canvas.Project(Location);

    // Do not draw if we are not facing it.
    if ((CameraDir dot (Location - CameraPosition)) <= 0.f)
    {
        return;
    }

	if (m_markerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
		m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', class'TrHUD'.default.FlagEmptyBase);
	}

    teamNum = GetTeamNum();
	isFriendly = PC.IsSpectating() ? GetTeamNum() == 1 : (PC.GetTeamNum() == teamNum);
	ScreenLoc.Z = VSize(CameraPosition - Location);

	m_MarkerMIC.SetVectorParameterValue('HudItem_Color', isFriendly ? class'TrHUD'.default.MarkerColorFriendly : class'TrHUD'.default.MarkerColorEnemy);

	HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, vect2d(class'TrHUD'.default.FlagEmptyBase.SizeX, class'TrHUD'.default.FlagEmptyBase.SizeY));
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	if( SkelComp == m_FlagStandMesh )
	{
		m_OpenCloseBlendList = TrAnimNodeBlendList(m_FlagStandMesh.Animations.FindAnimNode('OpenCloseBlendList'));
	}
	Super.PostInitAnimTree(SkelComp);
}

simulated function OnFlagComesHome()
{
	if( m_OpenCloseBlendList != none && m_OpenCloseBlendList.ActiveChildIndex != 1 )
	{
		m_OpenCloseBlendList.SetActiveChild(1, 0.0);
	}
}

simulated function OnFlagTaken()
{
	if( m_OpenCloseBlendList != none && m_OpenCloseBlendList.ActiveChildIndex != 0 )
	{
		m_OpenCloseBlendList.SetActiveChild(0, 0.0);
	}
}

simulated function SpawnHelpTextCollisionProxy(EHelpTextType HelpTextType)
{
	local TrCollisionProxy_HelpText SpawnedCollisionProxy;

	SpawnedCollisionProxy = Spawn(class'TrCollisionProxy_HelpText', self,, Location,,,true);
	if( SpawnedCollisionProxy != none )
	{
		SpawnedCollisionProxy.m_HelpTextType = HelpTextType;
		SpawnedCollisionProxy.m_CylinderComponent.SetCylinderSize(700.0, 160.0);
	}
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=FlagStand
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrCTFBase:FlagBaseLightEnvironment'
      MaxDrawDistance=7000.000000
      CachedMaxDrawDistance=7000.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      LightingChannels=(Dynamic=True)
      Translation=(X=0.000000,Y=0.000000,Z=-60.000000)
      Name="FlagStand"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_FlagStandMesh=FlagStand
   CTFBlitzIndex=-1
   BaseExitTime=8.000000
   bHasSensor=True
   IconCoords=(U=377.000000,V=438.000000,UL=45.000000,VL=44.000000)
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTCTFBase:CollisionCylinder'
      CollisionHeight=60.000000
      CollisionRadius=60.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTCTFBase:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UTGame.Default__UTCTFBase:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UTGame.Default__UTCTFBase:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UTGame.Default__UTCTFBase:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UTGame.Default__UTCTFBase:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Begin Object Class=DynamicLightEnvironmentComponent Name=FlagBaseLightEnvironment
      bCastShadows=False
      bDynamic=False
      Name="FlagBaseLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   Components(3)=FlagBaseLightEnvironment
   Components(4)=FlagStand
   RemoteRole=ROLE_SimulatedProxy
   bStatic=False
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrCTFBase"
   ObjectArchetype=UTCTFBase'UTGame.Default__UTCTFBase'
}
