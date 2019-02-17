class RB_RadialImpulseActor extends RigidBodyBase
	native(Physics)
	placeable;

/**
 *	Encapsulates a RB_RadialImpulseComponent to let a level designer place one in a level.
 *	When toggled from Kismet, will apply a kick to surrounding physics objects within blast radius.
 *	@see AddRadialImpulse
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

var						DrawSphereComponent			RenderComponent;
var() const editconst	RB_RadialImpulseComponent	ImpulseComponent;
var repnotify byte ImpulseCount;

replication
{
	if (bNetDirty)
		ImpulseCount;
}

/** Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle inAction)
{
	if (inAction.InputLinks[0].bHasImpulse)
	{
		ImpulseComponent.FireImpulse( Location );
		ImpulseCount++;
		bForceNetUpdate = TRUE;
	}
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'ImpulseCount')
	{
		ImpulseComponent.FireImpulse(Location);
	}
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	// AActor interface.
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif

}


defaultproperties
{
   Begin Object Class=DrawSphereComponent Name=DrawSphere0
      bDrawOnlyIfSelected=True
      ReplacementPrimitive=None
      Name="DrawSphere0"
      ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
   End Object
   RenderComponent=DrawSphere0
   Begin Object Class=RB_RadialImpulseComponent Name=ImpulseComponent0
      PreviewSphere=DrawSphereComponent'Engine.Default__RB_RadialImpulseActor:DrawSphere0'
      ReplacementPrimitive=None
      Name="ImpulseComponent0"
      ObjectArchetype=RB_RadialImpulseComponent'Engine.Default__RB_RadialImpulseComponent'
   End Object
   ImpulseComponent=ImpulseComponent0
   Components(0)=DrawSphere0
   Components(1)=ImpulseComponent0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadImpulse'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(2)=Sprite
   RemoteRole=ROLE_SimulatedProxy
   bNoDelete=True
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   bEdShouldSnap=True
   NetUpdateFrequency=0.100000
   Name="Default__RB_RadialImpulseActor"
   ObjectArchetype=RigidBodyBase'Engine.Default__RigidBodyBase'
}
