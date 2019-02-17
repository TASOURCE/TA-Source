class TrInventoryStation extends TrStation
	native;

/** The length of time it takes to complete a visit. */
var float m_fStationAnimTime;
var float m_fStationReleaseTime;
var PointLightComponent m_PowerLight;
var Color m_PowerOnColor;
var Color m_PowerOffColor;

/** Force a health regen? */
var bool m_bForceHealthRegen;

/** The pawn getting the inventory */
var TrPawn m_PawnToRefresh;

function PawnEnteredStation(TrPawn P)
{
	local Vector Loc;
	local TrPlayerController C;
	local Rotator R;

    if( r_CurrentPawn == None )
    {
        SetTimer(m_fStationReleaseTime, false);
    }

    Super.PawnEnteredStation(P);

    if( r_CurrentPawn != None )
    {
        // Make sure pawn is standing directly inside the station.
		Loc = Location;
		Loc.Z = r_CurrentPawn.Location.Z;
		r_CurrentPawn.SetBase(self);
		r_CurrentPawn.SetSkiing(false);
		r_CurrentPawn.SetLocation(Loc);
		r_CurrentPawn.Move(vect(0.0, 0.0, -100.0));
		r_CurrentPawn.Velocity = vect(0,0,0);
        r_CurrentPawn.Acceleration = vect(0,0,0);
		r_CurrentPawn.SetPhysics(PHYS_NONE);
		R.Yaw = r_CurrentPawn.Rotation.Yaw;
		r_CurrentPawn.SetRotation(R);

		// Store off the pawn.
		m_PawnToRefresh = r_CurrentPawn;

		if( m_bForceHealthRegen )
		{
			r_CurrentPawn.ForceHealthRegen();
		}

		C = TrPlayerController(r_CurrentPawn.Controller);
		if( C != None )
		{
            if (C.Stats != none)
            {
                C.Stats.InvStationVisited(C);
            }

			C.IgnoreMoveInput(true);
			C.ClientIgnoreMoveInput(true);
			C.SetTimer(m_fStationReleaseTime, false, 'RestoreMoveInput');
		}

		r_CurrentPawn.m_fLastInventoryStationVisitTime = WorldInfo.TimeSeconds;
    }
}

simulated function OnPowerStatusChanged()
{
	super.OnPowerStatusChanged();

	if (WorldInfo.NetMode!=NM_DedicatedServer)
	{
		if( m_PowerLight != none )
		{
			m_PowerLight.SetLightProperties(m_PowerLight.default.Brightness, r_bIsPowered ? m_PowerOnColor : m_PowerOffColor);
		}
	}
}
 
simulated function PlayStationEnteredEffects()
{
	local TrHUD TrH;
    local TrPlayerController C;
	local Rotator R;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	super.PlayStationEnteredEffects();

    // Play animation.
    m_Mesh.PlayAnim('Deploy', m_fStationAnimTime);

	if (r_CurrentPawn != none)
	{
		r_CurrentPawn.SetBase(self);
		r_CurrentPawn.SetSkiing(false);
		r_CurrentPawn.Velocity = vect(0,0,0);
		r_CurrentPawn.Acceleration = vect(0,0,0);
		r_CurrentPawn.SetPhysics(PHYS_NONE);
		R.Yaw = r_CurrentPawn.Rotation.Yaw;
		r_CurrentPawn.SetRotation(R);

		C = TrPlayerController(r_CurrentPawn.Controller);
		if( C != None )
		{
			C.ClientIgnoreMoveInput(true);
			C.SetTimer(m_fStationReleaseTime, false, 'ClientRestoreMoveInput');
			C.m_bLoadoutChangeAlerted = false;
		}

		TrH = r_CurrentPawn.GetTrHud();
		if( TrH != None )
		{
			TrH.ClearPromptPanel();
		}
	}
}

function Timer()
{
    local bool bCallin;

	// Force an update when the station is finished.
	bForceNetUpdate=true;

	if (m_PawnToRefresh != none)
	{
        if (Owner != none) bCallin = true;

		m_PawnToRefresh.ActivatePendingClass(false, bCallin);
	}

    r_CurrentPawn = none;
	m_PawnToRefresh = none;
}

simulated function Texture2D GetMarker()
{
	if (r_bIsPowered)
		return class'TrHUD'.default.BaseInventoryStation;
	else
		return class'TrHUD'.default.BaseNoPower;
}

defaultproperties
{
   m_fStationAnimTime=1.666700
   m_fStationReleaseTime=1.000000
   m_bForceHealthRegen=True
   StationCollisionClass=Class'TribesGame.TrInventoryStationCollision'
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrStation:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrStation:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrInventoryStation:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrInventoryStation:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Inventory Station"
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrStation:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrStation:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrStation:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrStation:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrStation:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrStation:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrStation:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrStation:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrStation:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrStation:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrStation:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bPostRenderIfNotVisible=True
   s_bThrottleNetRelevancy=True
   NetUpdateFrequency=1.000000
   CollisionComponent=CollisionMesh
   Name="Default__TrInventoryStation"
   ObjectArchetype=TrStation'TribesGame.Default__TrStation'
}
