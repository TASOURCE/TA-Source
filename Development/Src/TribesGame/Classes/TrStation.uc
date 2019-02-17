class TrStation extends TrGameObjective
	native;

/** Z offset for the collision */
var float m_fStationZOffset;

/** Handles touch events for this actor. */
var transient TrStationCollision m_Collision;

/** The pawn that's currently at the station. */
var repnotify TrPawn r_CurrentPawn;

/** The class name we use for collision */
var class<TrStationCollision> StationCollisionClass;

/** Station entered sound. */
var SoundCue m_StationEnteredSoundCue;
var AudioComponent m_StationEnteredAudioComponent;

/** Station left sound. */
var SoundCue m_StationLeftSoundCue;
var AudioComponent m_StationLeftAudioComponent;

var transient TrCaHCapturePoint m_OwningCaHCapturePoint;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
        r_CurrentPawn;
}

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    // Spawn a collision actor to forward touch events to this actor. We do this as a 
    // seperate actor so that we can maintain a blocking collision around the mesh itself.
    m_Collision = Spawn(StationCollisionClass, self,, Location);
    m_Collision.SetBase(self);
	m_Collision.SetRelativeLocation(vect(0,0,1) * m_fStationZOffset);
}

simulated event ReplicatedEvent(name VarName)
{
	Super.ReplicatedEvent(VarName);

	if (VarName == 'r_CurrentPawn')
	{
        if( r_CurrentPawn != None )
        {
            PlayStationEnteredEffects();
        }
        else
        {
            PlayStationLeftEffects();
        }
    }
}

simulated function Destroyed()
{
	Super.Destroyed();

	if (m_Collision != none)
	{
		m_Collision.Destroy();
	}
}

// Authority only.
function PawnEnteredStation(TrPawn P)
{
    local TrPlayerController C;

	// Force an update when someone enters.
	bForceNetUpdate=true;

    if( r_CurrentPawn == None )
    {
        C = TrPlayerController(P.Controller);
        if( C != None )
        {
            C.m_CurrentStation = self;
        }

        r_CurrentPawn = P;
        PlayStationEnteredEffects();
    }
}

// Authority only.
function PawnLeftStation(TrPawn P)
{
    local TrPlayerController C;

	// Force an update when someone leaves.
	bForceNetUpdate=true;

    C = TrPlayerController(P.Controller);
    if( C != None )
    {
        C.m_CurrentStation = None;
    }
    r_CurrentPawn = None;
    PlayStationLeftEffects();
}

simulated function PlayStationEnteredEffects()
{
	local TrPlayerController C, LocalC;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	// Play the sound (do it through code rather than with animnotifiy so that
	// we can determine if we need to spatialize it).
	if( r_CurrentPawn != none && m_StationEnteredSoundCue != none )
	{
		C = TrPlayerController(r_CurrentPawn.Controller);
		LocalC = TrPlayerController(GetALocalPlayerController());

		// Play sound non-spatialized if local, otherwise play spatialized.
		m_StationEnteredAudioComponent = CreateAudioComponent(m_StationEnteredSoundCue, true, true);
		m_StationEnteredAudioComponent.bAutoDestroy = true;
		m_StationEnteredAudioComponent.bAllowSpatialization = !(LocalC == C && LocalC != none);
	}
}

simulated function PlayStationLeftEffects();

// Inventory stations aren't part of IsBlockedByBlocker
simulated event bool BlocksLineChecksFromSourceActor(Actor SourceActor)
{
	return false;
}

defaultproperties
{
   StationCollisionClass=Class'TribesGame.TrStationCollision'
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrStation:ObjectiveMesh.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=48
   m_bReceivesPowerFromGenerator=True
   m_bPostRenderForEnemy=False
   m_bAlwaysRelevantToSameTeam=True
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bCanBeDamaged=False
   CollisionComponent=CollisionMesh
   Name="Default__TrStation"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
