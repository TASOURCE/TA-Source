//=============================================================================
// used to force UDKVehicles [of a certain class if wanted] in a certain direction
//
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class UDKForcedDirectionVolume extends PhysicsVolume
	placeable
	native;

/** Allows the ForceDirectionVolume to be limited to certain types of vehicles */
var() class<UDKVehicle> TypeToForce;

/** If true, doesn't affect hoverboards */
var() bool bIgnoreHoverboards;

/** For editing - specifies the forced direction */
var() const ArrowComponent Arrow;

/** if the vehicle is being affected by a force volume with this flag set, the player cannot exit the vehicle. */
var() bool bDenyExit; 

/** Whether non-vehicle pawns should be blocked by this volume */
var() bool bBlockPawns;

/** Whether spectators should be blocked by this volume. */
var() bool bBlockSpectators;

/** Direction arrow is pointing */
var vector ArrowDirection;

/** Array of vehicles currently touching this volume */
var array<UDKVehicle> TouchingVehicles;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	
	if ( !bBlockSpectators && (BrushComponent != None) )
	{
		BrushComponent.SetTraceBlocking(false,true);
	}
}

event ActorEnteredVolume(Actor Other)
{
	if ( PlayerController(Other) != None )
	{
		Other.FellOutOfWorld(None);
	}
}

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local UDKVehicle V;

	Super.Touch(Other, OtherComp, HitLocation, HitNormal);

	V = UDKVehicle(Other);
	if ((V != None) && ClassIsChildOf(V.Class, TypeToForce) && V.OnTouchForcedDirVolume(self))
	{
		TouchingVehicles.AddItem(V);
		if (bDenyExit)
		{
			V.bAllowedExit = false;
		}
	}
}

simulated event UnTouch(Actor Other)
{
	local bool bInAnotherVolume;
	local UDKForcedDirectionVolume AnotherVolume;

	if (ClassIsChildOf(Other.class, TypeToForce))
	{
		TouchingVehicles.RemoveItem(UDKVehicle(Other));
		if (bDenyExit)
		{
			foreach Other.TouchingActors(class'UDKForcedDirectionVolume', AnotherVolume)
			{
				if (AnotherVolume.bDenyExit)
				{
					bInAnotherVolume = true;
					break;
				}
			}
			if (!bInAnotherVolume)
			{
				UDKVehicle(Other).bAllowedExit = UDKVehicle(Other).default.bAllowedExit;
			}
		}
	}
}

simulated function bool StopsProjectile(Projectile P)
{
	return false;
}

defaultproperties
{
   TypeToForce=Class'UDKBase.UDKVehicle'
   bBlockSpectators=True
   Begin Object Class=ArrowComponent Name=AC
      ArrowColor=(B=150,G=100,R=150,A=255)
      ArrowSize=5.000000
      ReplacementPrimitive=None
      AbsoluteRotation=True
      Name="AC"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Arrow=AC
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_Untitled4
      bAcceptsLights=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   Components(1)=AC
   CollisionType=COLLIDE_CustomDefault
   bStatic=False
   bPushedByEncroachers=False
   bMovable=False
   bBlockActors=True
   CollisionComponent=BrushComponent0
   Name="Default__UDKForcedDirectionVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}