/**
 * 
 */
class TrProj_StickyGrenade extends TrProj_Grenade
	native;

/** Have we stuck onto a target? */
var bool m_bHasStuckToTarget;

/** Keep track of our base-most actor. */
var Actor	m_OldBase;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * override so we don't start he timer until stick
 */
simulated function PostBeginPlay()
{
	Super(TrProjectile).PostBeginPlay();
}

/**
 * Stick
 */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	bBlockedByInstigator = true;

	// Pawns are handled in ProcessTouch().
	if ( Pawn(Wall) == none || TrVehicle(Wall)!=none )
	{
		StickToTarget(Wall, Location, HitNormal);
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( Role == ROLE_Authority )
	{
		StickToTarget(Other, HitLocation, HitNormal);
	}
}

/** Sticks this grenade to a target actor. */
function bool StickToTarget(Actor Target, Vector HitLocation, Vector HitNormal)
{
	if (m_bHasStuckToTarget)
		return false;

	if( super.StickToTarget(Target, HitLocation, HitNormal) )
	{
		m_bHasStuckToTarget = true;
		return true;
	}
	return false;
}

simulated event OnBaseChanged()
{
	local TrPawn TrP;

	PlayStuckOnEffects();

	Velocity = vect(0,0,0);
	ImpactedActor = Base;
	SetPhysics(PHYS_None);

	if( Role != ROLE_Authority )
	{
		// Authority already stuck grenade to pawn.
		TrP = TrPawn(ImpactedActor);
		if( TrP != none )
		{
			m_bStuckOnPlayer = true;
			TrP.StickGrenadeToPawn(self);
		}
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_StickyGrenade:MyLightEnvironment'
      bUseAsOccluder=False
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      bCastDynamicShadow=False
      CollideActors=False
      BlockActors=False
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      bDisableAllRigidBody=True
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      Scale=0.100000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   bImportantAmbientSound=True
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
      Radius=128.000000
      Brightness=10.000000
      LightColor=(B=0,G=15,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   TerminalVelocity=7000.000000
   Speed=1200.000000
   Damage=1200.000000
   DamageRadius=600.000000
   MyDamageType=Class'TribesGame.TrDmgType_StickyGrenade'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_Grenade:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_Grenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   bBounce=False
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_StickyGrenade"
   ObjectArchetype=TrProj_Grenade'TribesGame.Default__TrProj_Grenade'
}
