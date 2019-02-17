/**
 * 
 */
class TrDeployable_TargetingBeacon extends TrDeployable_RadarSensor;

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local float Distance;

	super.PostRenderFor(PC, Canvas, CameraPosition, CameraDir);

	Distance = Round(Abs(VSize(Location - CameraPosition)) / 16.0f);

	// Don't draw for enemies.
	if (PC == none || PC.GetTeamNum() != GetTeamNum())
	{
		return;
	}

	RenderForTeammate(PC, Canvas, CameraPosition, CameraDir, Distance);
}

private simulated function RenderForTeammate(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir, float Distance)
{
	local bool bAlongScreenEdges, bAlongScreenEdges2, bIsShotPossible;
	local class<UTProjectile> ProjectileClass;
	local float TargetRange;
	local rotator TargetRot;
	local Texture2D laserAimPointer;
    local Texture2D laserPointer;
	local UTWeapon Weap;
	local vector HitScreenLoc, AimScreenLoc, TargetPos, TargetDir;

	if (UTPawn(PC.Pawn) == none)
		return;

	// Fetch the markers and weapon.
	laserAimPointer = Class'TrHUD'.default.HUDMarkerLaserTargetAimPoint;
	laserPointer = Class'TrHUD'.default.HUDMarkerLaserTarget;
	Weap = UTWeapon(UTPawn(PC.Pawn).Weapon);
	ProjectileClass = class<UTProjectile>(Weap.WeaponProjectiles[Weap.CurrentFireMode]);

	// Fetch screen position.
	bAlongScreenEdges = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, Location, HitScreenLoc);

	// Don't cover the weapon if on-screen, so render initial contact point.
	if (bAlongScreenEdges || !Weap.CoversScreenSpace(HitScreenLoc, Canvas))
	{
		HitScreenLoc.Z = VSize(CameraPosition - Location);
		TrHUD(PC.myHUD).DrawMarker(laserPointer, HitScreenLoc, Canvas, string(Round(Distance)));
	}

	// No projectile weapon equipped or it isn't affected by gravity, no need to assist aim.
	if (ProjectileClass == none || ProjectileClass.default.Physics != PHYS_Falling)
		return;

	// Determine the toss direction, if possible.
	bIsShotPossible = SuggestTossVelocity(TargetDir, Location, CameraPosition, ProjectileClass.default.Speed, ProjectileClass.default.TossZ,,, ProjectileClass.Default.MaxSpeed, ProjectileClass.default.CustomGravityScaling * WorldInfo.GetGravityZ());

	// Calculate the projection.
	TargetRange = VSize(Location - CameraPosition);
	TargetRot = rotator(TargetDir);
	TargetPos = CameraPosition + vector(TargetRot) * TargetRange;

	// Fetch screen position for aim.
	bAlongScreenEdges2 = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, TargetPos, AimScreenLoc);

	// Don't cover the weapon if on-screen, so render initial contact point.
	if (bAlongScreenEdges2 || !Weap.CoversScreenSpace(AimScreenLoc, Canvas))
	{
		AimScreenLoc.Z = VSize(CameraPosition - TargetPos);
		TrHUD(PC.myHUD).DrawMarker(laserAimPointer, AimScreenLoc, Canvas, "A");
	}

	// Only draw a line connecting the two points if they are both not along screen edges.
	if (!bAlongScreenEdges || !bAlongScreenEdges2)
	{
		Canvas.Draw2DLine(AimScreenLoc.X, AimScreenLoc.Y, HitScreenLoc.X, HitScreenLoc.Y, bIsShotPossible ? Class'TrHUD'.default.LaserTargetTracePossible : Class'TrHUD'.default.LaserTargetTraceImprobable);
	}
}

simulated function Texture2D GetMarker()
{
	return class'TrHUD'.default.DeployableShield;
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_RadarSensor:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_RadarSensor:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   m_nIconStackId=41
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_RadarSensor:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_RadarSensor:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_RadarSensor:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployable_RadarSensor:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployable_RadarSensor:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_TargetingBeacon:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      AnimSets(1)=None
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_TargetingBeacon:MyLightEnvironment'
      Scale=2.000000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_RadarSensor:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=800
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_RadarSensor:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_RadarSensor:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Targeting Beacon"
   m_bIsUpgradeable=False
   m_bIsRepairable=False
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_RadarSensor:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable_RadarSensor:CollisionCylinder'
      CollisionHeight=65.000000
      CollisionRadius=80.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockRigidBody=True
      Translation=(X=0.000000,Y=0.000000,Z=65.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable_RadarSensor:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable_RadarSensor:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable_RadarSensor:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable_RadarSensor:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable_RadarSensor:PathRenderer'
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
   CollisionComponent=CollisionCylinder
   Name="Default__TrDeployable_TargetingBeacon"
   ObjectArchetype=TrDeployable_RadarSensor'TribesGame.Default__TrDeployable_RadarSensor'
}
