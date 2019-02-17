/**
 * An actor used to generate collision events (touch/untouch), and
 * interactions events (ue) as inputs into the scripting system.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class Trigger extends Actor
	placeable
	ClassGroup(Common)
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

struct CheckpointRecord
{
    var bool bCollideActors;
};

/** Base cylinder component for collision */
var() editconst const CylinderComponent	CylinderComponent;
/** for AI, true if we have been recently triggered (so AI doesn't try to trigger it again) */
var bool bRecentlyTriggered;
/** how long bRecentlyTriggered should stay set after each triggering */
var() float AITriggerDelay;

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	if (FindEventsOfClass(class'SeqEvent_Touch'))
	{
		NotifyTriggered();
	}
}

/** called when this trigger has successfully been used to activate a Kismet event */
function NotifyTriggered()
{
	bRecentlyTriggered = true;
	SetTimer( AITriggerDelay, false, nameof(UnTrigger) );
}

function UnTrigger()
{
	bRecentlyTriggered = false;
}

simulated function bool StopsProjectile(Projectile P)
{
	return bBlockActors;
}

function bool ShouldSaveForCheckpoint()
{
	return (bStatic || bNoDelete);
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
    // actor collision is the primary method of toggling triggers apparently
    Record.bCollideActors = bCollideActors;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
    SetCollision(Record.bCollideActors,bBlockActors,bIgnoreEncroachers);
	ForceNetRelevant();
}

cpptext
{
#if WITH_EDITOR
	// AActor interface.
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif

}


defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=40.000000
      CollisionRadius=40.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CylinderComponent=CollisionCylinder
   AITriggerDelay=2.000000
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Trigger'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionType=COLLIDE_CustomDefault
   bHidden=True
   bNoDelete=True
   bCollideActors=True
   bProjTarget=True
   CollisionComponent=CollisionCylinder
   SupportedEvents(4)=Class'Engine.SeqEvent_Used'
   Name="Default__Trigger"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
