/**
 * used by SeqAct_DummyWeaponFire to hold the weapon 
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTDummyPawn extends UTPawn;

/** pointer back to the Kismet action that created us */
var UTSeqAct_DummyWeaponFire FireAction;

simulated function PostBeginPlay()
{
	Super(Pawn).PostBeginPlay();

	UTInventoryManager(InvManager).bInfiniteAmmo = true;
}

simulated function WeaponFired(Weapon InWeapon, bool bViaReplication, optional vector HitLocation)
{
	// force update LastRenderTime so attachment doesn't cull effects due to its mesh being hidden
	LastRenderTime = WorldInfo.TimeSeconds;

	Super.WeaponFired(InWeapon, bViaReplication, HitLocation);

	FireAction.NotifyDummyFire();
}

simulated function SetPawnAmbientSound(SoundCue NewAmbientSound)
{
	if (!FireAction.bSuppressSounds)
	{
		Super.SetPawnAmbientSound(NewAmbientSound);
	}
}

simulated function SetWeaponAmbientSound(SoundCue NewAmbientSound)
{
	if (!FireAction.bSuppressSounds)
	{
		Super.SetWeaponAmbientSound(NewAmbientSound);
	}
}

simulated function rotator GetAdjustedAimFor(Weapon InWeapon, vector ProjStart)
{
	local rotator BaseRotation;

	if (FireAction.Target != None)
	{
		BaseRotation = rotator(FireAction.Target.Location - ProjStart);
	}
	else
	{
		BaseRotation = Rotation;
	}
	return (BaseRotation + (FireAction.MaxSpread * (1.0 - 2.0 * FRand())));
}

simulated function WeaponAttachmentChanged()
{
	if ((CurrentWeaponAttachment == None || CurrentWeaponAttachment.Class != CurrentWeaponAttachmentClass))
	{
		// Detach/Destroy the current attachment if we have one
		if (CurrentWeaponAttachment!=None)
		{
			CurrentWeaponAttachment.DetachFrom(Mesh);
			CurrentWeaponAttachment.Destroy();
		}

		// Create the new Attachment.
		if (CurrentWeaponAttachmentClass!=None)
		{
			CurrentWeaponAttachment = Spawn(CurrentWeaponAttachmentClass,self);
			CurrentWeaponAttachment.Instigator = self;
		}
		else
			CurrentWeaponAttachment = none;

		// If all is good, attach it to the Pawn's Mesh.
		if (CurrentWeaponAttachment != None)
		{
			CurrentWeaponAttachment.bSuppressSounds = FireAction.bSuppressSounds;
			CurrentWeaponAttachment.AttachTo(self);

			// hide the weapon attachment mesh, but leave effects visible
			CurrentWeaponAttachment.SetHidden(false);
			CurrentWeaponAttachment.Mesh.SetRotation(rot(0, -16384, 0)); // all are weapon attachments are sideways
			CurrentWeaponAttachment.AttachComponent(CurrentWeaponAttachment.Mesh);
			CurrentWeaponAttachment.Mesh.SetHidden(true);
		}
	}
}

simulated function vector GetWeaponStartTraceLocation(optional Weapon CurrentWeapon)
{
	return GetPawnViewLocation();
}

simulated function vector GetPawnViewLocation()
{
	if (CurrentWeaponAttachment != None && CurrentWeaponAttachment.MuzzleFlashPSC != None)
	{
		return CurrentWeaponAttachment.MuzzleFlashPSC.GetPosition();
	}
	else
	{
		return Super.GetPawnViewLocation();
	}
}

simulated event Tick(float DeltaTime)
{
	// move the weapon attachment to the right location each frame
	if (CurrentWeaponAttachment != None && FireAction.Origin != None && FireAction.Target != None)
	{
		CurrentWeaponAttachment.SetLocation(FireAction.Origin.Location);
		CurrentWeaponAttachment.SetRotation(rotator(FireAction.Target.Location - FireAction.Origin.Location));
	}
}

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPawn:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPawn:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   FallingDamageWaveForm=ForceFeedbackWaveform'UTGame.Default__UTDummyPawn:ForceFeedbackWaveformFall'
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent Archetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent'
      Name="AmbientSoundComponent"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent'
   End Object
   PawnAmbientSound=AmbientSoundComponent
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent2 Archetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent2'
      Name="AmbientSoundComponent2"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent2'
   End Object
   WeaponAmbientSound=AmbientSoundComponent2
   Begin Object Class=SkeletalMeshComponent Name=OverlayMeshComponent0 Archetype=SkeletalMeshComponent'UTGame.Default__UTPawn:OverlayMeshComponent0'
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOwnerNoSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      Scale=1.015000
      TickGroup=TG_PostAsyncWork
      Name="OverlayMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTPawn:OverlayMeshComponent0'
   End Object
   OverlayMesh=OverlayMeshComponent0
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms Archetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceA Archetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceA'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'UTGame.Default__UTDummyPawn:FirstPersonArms.MeshSequenceA'
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
      ObjectArchetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms'
   End Object
   ArmsMesh(0)=FirstPersonArms
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms2 Archetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms2'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceB Archetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceB'
         Name="MeshSequenceB"
         ObjectArchetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceB'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'UTGame.Default__UTDummyPawn:FirstPersonArms2.MeshSequenceB'
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
      ObjectArchetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms2'
   End Object
   ArmsMesh(1)=FirstPersonArms2
   Mesh=None
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTPawn:CollisionCylinder'
      CollisionHeight=44.000000
      CollisionRadius=21.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   RemoteRole=ROLE_None
   bGameRelevant=True
   bCollideActors=False
   CollisionComponent=None
   Name="Default__UTDummyPawn"
   ObjectArchetype=UTPawn'UTGame.Default__UTPawn'
}
