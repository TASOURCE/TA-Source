class TrDeployable_MotionSensor extends TrDeployable_Sensor;

struct MotionSensorEnemyInfo
{
	var TrPawn SensedPawn;
	var Vector LastLocation;
	var float LastDetectedTimeStamp;
};

var array<MotionSensorEnemyInfo> m_EnemyPawnsInRange;

/** The sound to play locally when the alarm is active */
var(Sounds) AudioComponent m_AlarmSound;

/** Amount of time a pawn needs to be motionless in order to be stopped being sensed. */
var float m_fMotionSenseExpireTime;

/** Amount of time detection being able to trigger again (to prevent constant spamming of alarms). */
var float m_fTimeBetweenAlarms;

/** Last detection trigger timestamp. */
var float m_fLastAlarmTimestamp;

/** Is this deployable currently sounding an alarm for the HUD? */
var transient bool m_bDrawHUDAlarm;

/** Time for the sensor to remain on the HUD when the alarm sounds. */
var float m_fHUDAlarmTime;

/** Current alpha of the icon fade */
var private float m_IconAlpha;

/** Last screen location and camera direction/position */
var vector  LastScreenLoc;
var vector  LastCameraDir;
var vector  LastCameraPos;

/** Icon marker to show when the motion sensor detects an enemy. */
var Texture2D m_AlarmIcon;

simulated function DeployComplete()
{
	Super.DeployComplete();

	// Setup a timer to see if any nearby enemy pawns have moved.
	if ( Role == ROLE_Authority )
	{
		SetTimer(0.5, true, 'UpdateInRangeEnemyPawns');
	}
}

function OnPawnDetectedByCollisionProxy(Pawn P)
{
	local MotionSensorEnemyInfo MotionSensorInfo;
	
	super.OnPawnDetectedByCollisionProxy(P);

	// Add the enemy to our detected list.
	if( IsEnemy(P) )
	{
		MotionSensorInfo.SensedPawn = TrPawn(P);
		if( MotionSensorInfo.SensedPawn != none )
		{
			MotionSensorInfo.LastLocation = MotionSensorInfo.SensedPawn.Location;
			MotionSensorInfo.LastDetectedTimeStamp = WorldInfo.TimeSeconds;
			m_EnemyPawnsInRange.AddItem(MotionSensorInfo);
			PlayAlarm();
		}
	}
}

function OnPawnExitedCollisionProxy(Pawn P)
{
	local int i;

	super.OnPawnExitedCollisionProxy(P);

	// Find the index with the detected enemy and remove it from the list.
	for( i = 0; i < m_EnemyPawnsInRange.Length; i++ )
	{
		if( P == m_EnemyPawnsInRange[i].SensedPawn )
		{
			m_EnemyPawnsInRange.Remove(i, 1);
			break;
		}
	}
}

/** Called on a timer to determine if in-range enemies need to set off the motion sensor alarm. */
function UpdateInRangeEnemyPawns()
{
	local int i;
	local TrPlayerController TrPC;
	local bool bEnemyDetected;

	for( i = 0; i < m_EnemyPawnsInRange.Length; i++ )
	{
		if( CanSetOffAlarm(m_EnemyPawnsInRange[i].SensedPawn) )
		{
			TrPC = TrPlayerController(m_EnemyPawnsInRange[i].SensedPawn.Controller);
			if( TrPC != none )
			{
				if( m_EnemyPawnsInRange[i].LastLocation != m_EnemyPawnsInRange[i].SensedPawn.Location )
				{								
					m_EnemyPawnsInRange[i].LastDetectedTimeStamp = WorldInfo.TimeSeconds;
					m_EnemyPawnsInRange[i].LastLocation = m_EnemyPawnsInRange[i].SensedPawn.Location;
					bEnemyDetected = true;
				}
			}
		}
	}

	if (bEnemyDetected)
	{
		PlayAlarm();
	}
}

/** Returns TRUE if TrPawn P is eligible for setting off the alarm. */
function bool CanSetOffAlarm(TrPawn P)
{
	if( (P.r_bIsStealthed && !(P.IsPulseStealthed())) || P.IsJammedByFriendOrSelf() || P.r_bIsJamming )
	{
		return false;
	}
	return true;
}

/** This sensor does not modify the specific sensor status of victims. */
function ModifyDetectedPawn(Pawn DetectedPawn, bool detected);

/** Tells clients to play an alarm for this sensor. */
function PlayAlarm()
{
	local TrPlayerController TrPC;

	if( (WorldInfo.TimeSeconds - m_fLastAlarmTimestamp) >  m_fTimeBetweenAlarms )
	{
		// Play the local sound spatialized.
		m_AlarmSound.Play();

		// Tell owner to play an alarm for this sensor even if they aren't nearby.
		TrPC = TrPlayerController(m_Controller);
		if( TrPC != none )
		{
			TrPC.ClientOnMotionSensorAlarmSounded(self);
		}

		m_fLastAlarmTimestamp = WorldInfo.TimeSeconds;
	}
}

simulated state Blownup
{
	simulated function BeginState(Name PreviousStateName)
	{
		// Alarm when this sensor is destroyed.
		PlayAlarm();

		// Have the actor stick around so that the HUD can tell friendlies about the alarm.
		m_fLifeAfterDeathSecs = m_fHUDAlarmTime;

		super.BeginState(PreviousStateName);
	}
}

simulated function TriggerHUDAlarm()
{
	m_bDrawHUDAlarm = true;
	bPostRenderIfNotVisible = true;
	SetTimer(m_fHUDAlarmTime, false, 'HideHUDAlarm');
}

simulated function HideHUDAlarm()
{
	m_bDrawHUDAlarm = false;
	bPostRenderIfNotVisible = false;
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local bool friendly;
	local vector ScreenLoc;
	local TrHUD HUD;
	local int xPixelBlock, yPixelBlock;
	local bool bAlongScreenEdges;

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		if( !TrPlayerController(PC).m_bShowSpectatorHUD )
		{
			return;
		}
	}

	if( m_bDrawHUDAlarm )
	{
		HUD = TrHUD(PC.MyHUD);

		xPixelBlock = (Canvas.ClipX / 2) * 0.08f;
		yPixelBlock = (Canvas.ClipY / 2) * 0.08f;

		//if (!HUD.bShowObjectives) return;

		bAlongScreenEdges = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, Location + 112 * vect(0,0,1), ScreenLoc);

		// If a large difference in screen positions happens and there wasn't a huge difference in camera direction and position, go with the previous screen pos.
		// If the flag was recently returned, jump to it's new location.
		if (bAlongScreenEdges && VSize(ScreenLoc - LastScreenLoc) > 200.0f && VSize(CameraDir * 200 - LastCameraDir * 200) < 100.0f && VSize(CameraPosition - LastCameraPos) < 200.0f)
			ScreenLoc = LastScreenLoc;
		// Save the new location.
		else
		{
			LastScreenLoc = ScreenLoc;
			LastCameraDir = CameraDir;
			LastCameraPos = CameraPosition;
		}

		// Block out the flag inside a certain pixel range.
		if (ScreenLoc.X > (Canvas.ClipX/2 - xPixelBlock) && ScreenLoc.X < (Canvas.ClipX/2 + xPixelBlock) &&
			ScreenLoc.Y > (Canvas.ClipY/2 - yPixelBlock) && ScreenLoc.Y < (Canvas.ClipY/2 + yPixelBlock))
		{
			m_IconAlpha -= WorldInfo.DeltaSeconds * 2.0f;
			m_IconAlpha = FMax(m_IconAlpha, 0.0f);
		}
		else
		{
			m_IconAlpha = m_IconAlpha + WorldInfo.DeltaSeconds*4.0f*(1.0f-m_IconAlpha);
			m_IconAlpha = FMin(m_IconAlpha, 1.0f);
		}

		friendly = PC.IsSpectating() ? GetTeamNum() == 1 : (PC.GetTeamNum() == GetTeamNum());

		ScreenLoc.Z = VSize(CameraPosition - Location);
		HUD.DrawMarker(m_AlarmIcon, ScreenLoc, Canvas, "", friendly, m_IconAlpha, 1.0f);
	}

	super.PostRenderFor(PC, Canvas, CameraPosition, CameraDir);
}

/** Get the marker to use for the HUD. */
simulated function Texture2D GetMarker()
{
	if( !m_bDrawHUDAlarm )
	{
		return super.GetMarker();
	}
	else
	{
		// PostRenderFor() handles the marker (in order to show on screen edges, etc).
		return none;
	}
}

defaultproperties
{
   Begin Object Class=AudioComponent Name=AlarmSound
      bShouldRemainActiveIfDropped=True
      Name="AlarmSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AlarmSound=AlarmSound
   m_fMotionSenseExpireTime=2.000000
   m_fTimeBetweenAlarms=3.000000
   m_fHUDAlarmTime=6.000000
   m_bRequireLOS=False
   m_fDamageRadius=3000.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_MotionSensor:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_MotionSensor:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=1200
   m_nCriticalHealthThreshold=200
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Motion Sensor"
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable_Sensor:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable_Sensor:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable_Sensor:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable_Sensor:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable_Sensor:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable_Sensor:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=ShieldMesh
   Components(6)=OnlineSound
   Components(7)=CriticalSound
   Components(8)=ShieldHitSound
   Components(9)=PowerDownSound
   Components(10)=DestroyedSound
   Components(11)=AlarmSound
   CollisionComponent=ObjectiveMesh
   Name="Default__TrDeployable_MotionSensor"
   ObjectArchetype=TrDeployable_Sensor'TribesGame.Default__TrDeployable_Sensor'
}
