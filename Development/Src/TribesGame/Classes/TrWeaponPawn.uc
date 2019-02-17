class TrWeaponPawn extends UTWeaponPawn
	native;

var float		m_fCurrentAccuracy;				// current weapon firing accuracy - use GetAccuracy() to access

/** Used for simulated clients to play reload anim. */
var repnotify byte  r_nFlashReload;

var AudioComponent FiringLoopAudio;
var repnotify bool r_bFiringLoopSound;
var SoundCue r_scFiringLoop;

replication
{
	// replicated properties
    if (Role == ROLE_Authority)
        r_nFlashReload,r_bFiringLoopSound,r_scFiringLoop;
}

simulated event ReplicatedEvent(name VarName)
{
    if( VarName == 'r_nFlashReload' )
    {
        PlayReload();
    }
	else if (VarName == 'r_bFiringLoopSound')
	{
		ClientPlayLoopSound();
	}
	
	super.ReplicatedEvent(VarName);
}

simulated function PlayReload()
{
	if (MyVehicleWeapon != none && MyVehicleWeapon.IsA('TrVehicleWeapon'))
	{
		TrVehicleWeapon(MyVehicleWeapon).OnClientReloaded();
	}
}

simulated function ProcessViewRotation(float DeltaTime, out rotator out_ViewRotation, out rotator out_DeltaRot)
{
	// Let the vehicle decide the camera for this weapon pawn.
	if (MySeatIndex > 0 && TrVehicle(MyVehicle) != None && MySeatIndex < MyVehicle.Seats.length)
	{
		TrVehicle(MyVehicle).ProcessViewRotationBasedOnSeat(MySeatIndex, DeltaTime, out_ViewRotation, out_DeltaRot);
	}
}

simulated function ClientPlayLoopSound()
{
	// Play the audio.
	if (r_bFiringLoopSound)
	{
		if (FiringLoopAudio == none)
		{
			FiringLoopAudio = CreateAudioComponent(r_scFiringLoop, false, true);
		}

		if (FiringLoopAudio != none && (!FiringLoopAudio.bWasPlaying || FiringLoopAudio.bFinished))
		{
			if (MyVehicle.IsLocalOnVehicle())
				FiringLoopAudio.bAllowSpatialization = false;

			FiringLoopAudio.FadeIn(0.1f, 1.0f);
		}
	}
	// Stop the audio.
	else
	{
		if (FiringLoopAudio != none)
		{
			FiringLoopAudio.FadeOut(0.1f, 0.0f);
			FiringLoopAudio = none;
		}
	}
}

simulated function PlayLoopingSound(SoundCue InSound, bool play)
{
	r_scFiringLoop = InSound;
	r_bFiringLoopSound = play;
	bNetDirty = true;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		ClientPlayLoopSound();
	}
}

defaultproperties
{
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'UTGame.Default__UTWeaponPawn:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'UTGame.Default__UTWeaponPawn:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrWeaponPawn:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'UTGame.Default__UTWeaponPawn:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'UTGame.Default__UTWeaponPawn:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrWeaponPawn:MyStayUprightConstraintInstance'
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTWeaponPawn:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Vehicle
      MotionBlurScale=0.000000
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bNotifyRigidBodyCollision=True
      RBCollideWithChannels=(Default=True,Vehicle=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      ScriptRigidBodyCollisionThreshold=250.000000
      Name="SVehicleMesh"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTWeaponPawn:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTWeaponPawn:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTWeaponPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   bOnlyRelevantToOwner=False
   CollisionComponent=SVehicleMesh
   Name="Default__TrWeaponPawn"
   ObjectArchetype=UTWeaponPawn'UTGame.Default__UTWeaponPawn'
}
