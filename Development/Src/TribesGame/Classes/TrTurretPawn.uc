/**
 Really light dummy pawn that used by Turret, for directing weapon logic
 Use m_OwnerDeployable location/rotation to do the calculation, its own location/rot might not be reliable
 TrTurretPawn is not relevant in the client
 TrTurretPawn needs to extend from TrPawn, not Pawn, otherwise, there will be mismatch in InvManager or Weapon code
 */

class TrTurretPawn extends TrPawn
	native;

var TrDeployable m_OwnerDeployable;         //who ownes this turrent pawn

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function vector GetValidAimTarget(vector PawnLocation, vector PawnTargetLocation);

simulated function PostBeginPlay()
{
    //`log(self@"PostBeginPlay");
	Super(Pawn).PostBeginPlay();

	if (InvManager!=None)
	{
		TrInventoryManager(InvManager).bInfiniteAmmo = true;
	}
}


simulated function Destroyed()
{
    //`log(self@"Destroyed");
    super.Destroyed();
}

simulated function WeaponFired(Weapon InWeapon, bool bViaReplication, optional vector HitLocation)
{
	// force update LastRenderTime so attachment doesn't cull effects due to its mesh being hidden
	LastRenderTime = WorldInfo.TimeSeconds;

    // Play fire effects on owning turret.
    if( m_OwnerDeployable != None )
    {
        m_OwnerDeployable.PlayFireEffects(InWeapon, bViaReplication, HitLocation);
    }
	
    Super.WeaponFired(InWeapon, bViaReplication, HitLocation);

}

simulated function vector GetAimVectorFor(Weapon InWeapon, vector ProjStart, Actor enemy)
{
	local Box BBox;
	local float timeToImpact;
	local float lastTimeToImpact;
	local float projectileSpeed;
	local vector muzzleToTarget, TargetLocation;
	local TrPawn aPawn;
	local int nGiveUp;

	aPawn = TrPawn(enemy);

	if (TrDevice(Weapon).WeaponProjectiles[0]==None) return vect(0,0,0);

	projectileSpeed = TrDevice(Weapon).WeaponProjectiles[0].default.Speed;
	timeToImpact=0;
	lastTimeToImpact=-1;
	nGiveUp=0;

    // Aim towards the target's center of mass.
    enemy.GetComponentsBoundingBox(BBox);
	TargetLocation = (BBox.Min + BBox.Max) * 0.5f;

	// Players are targeted at their head.
	if (aPawn != none)
		TargetLocation.Z = BBox.Max.Z;

	while (abs(timeToImpact-lastTimeToImpact)>0.05)
	{
		lastTimeToImpact = timeToImpact;

        // figure out how long it will take for our projectile to impact the target
		muzzleToTarget = (TargetLocation + enemy.Velocity*timeToImpact) - ProjStart;
		timeToImpact = VSize(muzzleToTarget)/projectileSpeed;

		nGiveUp++;
		if (nGiveUp>10) 
		{
			// aiming diverged... pawn is moving too fast
			return Vector(m_OwnerDeployable.Rotation);
		}
	}

	muzzleToTarget = GetValidAimTarget(TargetLocation, ProjStart + muzzleToTarget) - ProjStart;

	//`log("Aiming Converged after"@nGiveUp@"iterations, attacking "@enemy@" on team "@enemy.GetTeamNum()@"(I am team "@GetTeamNum()@")---------------------------------------");

	return muzzleToTarget;
}

simulated function rotator GetAdjustedAimFor(Weapon InWeapon, vector ProjStart)
{
	if( m_OwnerDeployable != None )
	{
        if( m_OwnerDeployable.r_TargetPawn == None )
        {
		    return m_OwnerDeployable.Rotation;
        }
        else
        {
            return rotator(GetAimVectorFor(InWeapon,ProjStart,m_OwnerDeployable.r_TargetPawn));
        }
	}

    // Shouldn't get here.
    return Rotation;
}

simulated function vector LeadingAimLocation(Actor enemy)
{
	return GetAimVectorFor(Weapon, GetWeaponStartTraceLocation(), enemy);
}

simulated function vector GetWeaponStartTraceLocation(optional Weapon CurrentWeapon)
{
	return m_OwnerDeployable.GetWeaponStartTraceLocation(CurrentWeapon);
}

//////////////////OVERWRITE PARENT VERSION INTENTIONALLY//////////////////////////////////
function Reset()    //IMPORTANT for level placed deployables
{
    //DO NOT RESET, which is called when reset level, it will destroy the actor
    //HOWABOUT THE WEAPON?
    super(Actor).Reset();
}

event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    //`log(self@"SkipTakeDamage"@Health@Location@Rotation);
    //donothing, the dummy pawn doesn't take damage
}

simulated function TakeRadiusDamage
(
	Controller			EventInstigator,
	float				BaseDamage,
	float				DamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor               DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{
    //`log(self@"SkipTakeRadiusDamage"@Health@Location@Rotation);
    //donothing, the dummy pawn doesn't take damage
}

simulated function RefreshPlayer()
{
}

simulated function RefreshInventory(bool bIsRespawn, optional bool bCallin = false)
{
}

simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info, optional bool bForce=false)
{
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
}

simulated function IncrementFlashCount( Weapon W, byte FireModeNum )
{
    Super.IncrementFlashCount(W, FireModeNum);
    if( m_OwnerDeployable == None )
    {
        return;
    }

    m_OwnerDeployable.IncrementFlashCount(W, FireModeNum);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

defaultproperties
{
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyMesh'
      FOV=90.000000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrTurretPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Translation=(X=0.000000,Y=0.000000,Z=-52.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyMesh'
   End Object
   m_FirstPersonBodyMesh=FirstPersonBodyMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyOverlayMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyOverlayMesh'
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="FirstPersonBodyOverlayMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyOverlayMesh'
   End Object
   m_FirstPersonBodyOverlayMesh=FirstPersonBodyOverlayMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrTurretPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyShadowMesh'
   End Object
   m_FirstPersonBodyShadowMesh=FirstPersonBodyShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonWeaponShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonWeaponShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrTurretPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      BoundsScale=5.000000
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonWeaponShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonWeaponShadowMesh'
   End Object
   m_FirstPersonWeaponShadowMesh=FirstPersonWeaponShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonFlagShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonFlagShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrTurretPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonFlagShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonFlagShadowMesh'
   End Object
   m_FirstPersonFlagShadowMesh=FirstPersonFlagShadowMesh
   Begin Object Class=UTParticleSystemComponent Name=SkiDust Archetype=UTParticleSystemComponent'TribesGame.Default__TrPawn:SkiDust'
      bAutoActivate=False
      ReplacementPrimitive=None
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Name="SkiDust"
      ObjectArchetype=UTParticleSystemComponent'TribesGame.Default__TrPawn:SkiDust'
   End Object
   m_GroundSkiPSC=SkiDust
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   FallingDamageWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrTurretPawn:ForceFeedbackWaveformFall'
   CustomGravityScaling=0.000000
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent Archetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent'
      Name="AmbientSoundComponent"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent'
   End Object
   PawnAmbientSound=AmbientSoundComponent
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent2 Archetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent2'
      Name="AmbientSoundComponent2"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent2'
   End Object
   WeaponAmbientSound=AmbientSoundComponent2
   Begin Object Class=SkeletalMeshComponent Name=OverlayMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrPawn:OverlayMeshComponent0'
      bShouldIgnoreParentAnimComponent=True
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOwnerNoSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="OverlayMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPawn:OverlayMeshComponent0'
   End Object
   OverlayMesh=OverlayMeshComponent0
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceA Archetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms.MeshSequenceA'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrTurretPawn:FirstPersonArms.MeshSequenceA'
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      AbsoluteRotation=True
      AbsoluteScale=True
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonArms"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms'
   End Object
   ArmsMesh(0)=FirstPersonArms
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms2 Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms2'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceB Archetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms2.MeshSequenceB'
         Name="MeshSequenceB"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms2.MeshSequenceB'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrTurretPawn:FirstPersonArms2.MeshSequenceB'
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      HiddenGame=True
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      AbsoluteRotation=True
      AbsoluteScale=True
      Scale3D=(X=1.000000,Y=-1.000000,Z=1.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonArms2"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms2'
   End Object
   ArmsMesh(1)=FirstPersonArms2
   ControllerClass=Class'TribesGame.TrDeployableController'
   Mesh=None
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrPawn:CollisionCylinder'
      CollisionHeight=2.000000
      CollisionRadius=2.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   RemoteRole=ROLE_None
   bOnlyRelevantToOwner=True
   bReplicateMovement=False
   bSkipActorPropertyReplication=True
   bUpdateSimulatedPosition=False
   bGameRelevant=True
   bCollideActors=False
   bCollideWorld=False
   bProjTarget=False
   CollisionComponent=None
   Name="Default__TrTurretPawn"
   ObjectArchetype=TrPawn'TribesGame.Default__TrPawn'
}
