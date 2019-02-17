/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//$$ Modified from base

class TrRabbitBase extends UTGameObjective
	placeable;

/** audio component that should play when the flag has been taken */
var() AudioComponent TakenSound;

var		TrFlagRabbit        myFlag; //$$ML: Changed to UTCarriedObject
var()	float				MidFieldHighZOffset;
var()	float				MidFieldLowZOffset;
var()	float				NearBaseRadius;
var()	float				BaseExitTime;		// how long it takes to get entirely away from the base

/** Particles to play while the flag is gone */
var		ParticleSystemComponent	FlagEmptyParticles;

/**
 * The MICs for the flag base.  We need to store the MIC we are referencing and then the one we
 * spawn at runtime.
 **/
var MaterialInstanceConstant FlagBaseMaterial;
var MaterialInstanceConstant MIC_FlagBaseColor;

/** Reference to the actual mesh base so we can modify it with a different material **/
var StaticMeshComponent FlagBaseMesh;

var class<UTLocalMessage> CTFAnnouncerMessagesClass;

var Array<SoundNodeWave> NearLocationSpeech;
var Array<SoundNodeWave> MidfieldHighSpeech;
var Array<SoundNodeWave> MidfieldLowSpeech;

/** Flag stand mesh. */
var SkeletalMeshComponent m_FlagStandMesh;

/** Controls the flag stand animation state. */
var TrAnimNodeBlendList m_OpenCloseBlendList;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	if ( Role < ROLE_Authority )
		return;

	if (myFlag == None && TrGame_TRRabbit(WorldInfo.Game) != None )
	{
		myFlag = Spawn(class'TrFlagRabbit', self);

		if (myFlag==None)
		{
			;
			return;
		}
		else
		{
			TrGame_TRRabbit(WorldInfo.Game).RegisterFlag(myFlag);
			myFlag.HomeBase = self;
		}
	}

	MIC_FlagBaseColor = new(Outer) class'MaterialInstanceConstant';
	MIC_FlagBaseColor.SetParent( FlagBaseMaterial );
	FlagBaseMesh.SetMaterial( 0, MIC_FlagBaseColor );
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	if( SkelComp == m_FlagStandMesh )
	{
		m_OpenCloseBlendList = TrAnimNodeBlendList(m_FlagStandMesh.Animations.FindAnimNode('OpenCloseBlendList'));
	}
	Super.PostInitAnimTree(SkelComp);
}

event actor GetBestViewTarget()
{
	if (myFlag.Holder != none)
	{
		return myFlag.Holder;
	}
	else if (!myFlag.bHome)
	{
		return MyFlag;
	}
	else
	{
		return super.GetBestViewTarget();
	}
}

simulated function int GetLocationMessageIndex(UTBot B, Pawn StatusPawn)
{
	local float Dist, ZDiff;

	Dist = VSize(StatusPawn.Location - Location);
	if ( Dist < BaseRadius )
	{
		return 0;
	}
	if ( Dist < NearBaseRadius )
	{
		return 1;
	}

	// Midfield high or low?
	ZDiff = StatusPawn.Location.Z - Location.Z;
	if ( ZDiff > MidFieldHighZOffset )
	{
		return 2;
	}
	if ( ZDiff < MidFieldLowZOffset )
	{
		return 3;
	}

	return 10;
}

simulated function SoundNodeWave GetLocationSpeechFor(PlayerController PC, int LocationSpeechOffset, int MessageIndex)
{
	if ( MessageIndex == 0 )
	{
		// inside the base
		return (LocationSpeechOffset < LocationSpeech.Length) ? LocationSpeech[LocationSpeechOffset] : None;
	}
	else if ( MessageIndex == 1 )
	{
		// near the base
		return (LocationSpeechOffset < NearLocationSpeech.Length) ? NearLocationSpeech[LocationSpeechOffset] : None;
	}
	else if ( MessageIndex == 2 )
	{
		// Midfield High
		return (LocationSpeechOffset < MidFieldHighSpeech.Length) ? MidFieldHighSpeech[LocationSpeechOffset] : None;
	}
	else if ( MessageIndex == 3 )
	{
		// Midfield Low
		return (LocationSpeechOffset < MidFieldLowSpeech.Length) ? MidFieldLowSpeech[LocationSpeechOffset] : None;
	}

	return None;
}

/**
 * Handle flag events.
 */
function ObjectiveChanged()
{
	local PlayerController PC;

	if (myFlag != None)
	{
		// Look to change the spectator
		foreach WorldInfo.AllControllers(class'PlayerController', PC)
		{
			if ( (PC.ViewTarget == self) || (PC.ViewTarget == myFlag) || ((PC.ViewTarget != None) && (PC.ViewTarget == myFlag.Holder)) )
				PC.SetViewTarget(GetBestViewTarget());
		}
	}
}

function UTCarriedObject GetFlag()
{
	return myFlag;
}

simulated event bool IsActive()
{
	return true;
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
   MidFieldHighZOffset=250.000000
   MidFieldLowZOffset=-250.000000
   NearBaseRadius=4000.000000
   BaseExitTime=8.000000
   Begin Object Class=SkeletalMeshComponent Name=FlagStand
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrRabbitBase:FlagBaseLightEnvironment'
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
   bHasSensor=True
   MinimapIconScale=7.000000
   IconCoords=(U=377.000000,V=438.000000,UL=45.000000,VL=44.000000)
   DefenderTeamIndex=0
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTGameObjective:CollisionCylinder'
      CollisionHeight=60.000000
      CollisionRadius=60.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTGameObjective:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UTGame.Default__UTGameObjective:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UTGame.Default__UTGameObjective:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UTGame.Default__UTGameObjective:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UTGame.Default__UTGameObjective:PathRenderer'
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
   Name="Default__TrRabbitBase"
   ObjectArchetype=UTGameObjective'UTGame.Default__UTGameObjective'
}
