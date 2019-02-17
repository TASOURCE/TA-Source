/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Used to affect reverb settings in the game and editor.
 */
class ReverbVolume extends Volume
	native
	placeable
	dontsortcategories(ReverbVolume)
	hidecategories(Advanced, Attachment, Collision, Volume, Toggle);

/**
 * Indicates a reverb preset to use.
 */
enum ReverbPreset
{
    REVERB_Default,
    REVERB_Bathroom,
    REVERB_StoneRoom,
    REVERB_Auditorium,
    REVERB_ConcertHall,
    REVERB_Cave,
    REVERB_Hallway,
    REVERB_StoneCorridor,
    REVERB_Alley,
    REVERB_Forest,
    REVERB_City,
    REVERB_Mountains,
    REVERB_Quarry,
    REVERB_Plain,
    REVERB_ParkingLot,
    REVERB_SewerPipe,
    REVERB_Underwater,
    REVERB_SmallRoom,
    REVERB_MediumRoom,
    REVERB_LargeRoom,
    REVERB_MediumHall,
    REVERB_LargeHall,
    REVERB_Plate,
};

/** Struct encapsulating settings for reverb effects. */
struct native ReverbSettings
{
	var() bool			bApplyReverb<ToolTip=Whether to apply the reverb settings below>;

	/** The reverb preset to employ. */
	var() ReverbPreset	ReverbType;

	/** Volume level of the reverb affect. */
	var() float			Volume;

	/** Time to fade from the current reverb settings into this setting, in seconds. */
	var() float			FadeTime;

	structdefaultproperties
	{
		bApplyReverb=true
		ReverbType=REVERB_Default
		Volume=0.5
		FadeTime=2.0
	}
};

/** Struct encapsulating settings for interior areas. */
//@warning: manually mirrored in UnActorComponent.h
struct InteriorSettings
{
	var	  bool			bIsWorldInfo;

	var() float			ExteriorVolume;
	var() float			ExteriorTime;

	var() float			ExteriorLPF;
	var() float			ExteriorLPFTime;

	var() float			InteriorVolume;
	var() float			InteriorTime;

	var() float			InteriorLPF;
	var() float			InteriorLPFTime;

	structdefaultproperties
	{
		bIsWorldInfo=false
		ExteriorVolume=1.0f
		ExteriorTime=0.5f
		InteriorVolume=1.0f
		InteriorTime=0.5f
		ExteriorLPF=1.0f
		ExteriorLPFTime=0.5f
		InteriorLPF=1.0f
		InteriorLPFTime=0.5f
	}
};

/**
 * Priority of this volume. In the case of overlapping volumes the one with the highest priority
 * is chosen. The order is undefined if two or more overlapping volumes have the same priority.
 */
var() float Priority;
/** whether this volume is currently enabled and able to affect sounds */
var(Toggle) bool bEnabled;

/** Reverb settings to use for this volume. */
var() ReverbSettings Settings;
/** Interior settings used for this volume */
var() InteriorSettings AmbientZoneSettings;

/** Next volume in linked listed, sorted by priority in descending order. */
var const noimport transient ReverbVolume NextLowerPriorityVolume;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty)
		bEnabled;
}

cpptext
{
	/**
	 * Removes the reverb volume to world info's list of reverb volumes.
	 */
	virtual void ClearComponents();

	/**
	 * callback for changed property
	 */
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

protected:
	/**
	 * Adds the reverb volume to world info's list of reverb volumes.
	 */
	virtual void UpdateComponentsInternal( UBOOL bCollisionUpdate = FALSE );
public:

}


defaultproperties
{
   bEnabled=True
   Settings=(bApplyReverb=True,Volume=0.500000,FadeTime=2.000000)
   AmbientZoneSettings=(ExteriorVolume=1.000000,ExteriorTime=0.500000,ExteriorLPF=1.000000,ExteriorLPFTime=0.500000,InteriorVolume=1.000000,InteriorTime=0.500000,InteriorLPF=1.000000,InteriorLPFTime=0.500000)
   BrushColor=(B=0,G=255,R=255,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__ReverbVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
