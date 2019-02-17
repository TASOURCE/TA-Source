/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PortalTeleporter extends SceneCapturePortalActor
	native
	abstract
	notplaceable;

/** destination portal */
var() PortalTeleporter SisterPortal;
/** resolution for texture render target; must be a power of 2 */
var() int TextureResolutionX, TextureResolutionY;
/** marker on path network for AI */
var PortalMarker MyMarker;
/** whether or not encroachers (movers, vehicles, and such) can move this portal */
var() bool bMovablePortal;
/** if true, non-Pawn actors are always teleporter, regardless of their bCanTeleport flag */
var bool bAlwaysTeleportNonPawns;
/** whether or not this PortalTeleporter works on vehicles */
var bool bCanTeleportVehicles;

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

/** teleport an actor to be relative to SisterPortal, including transforming its velocity, acceleration, and rotation
 * @param A the Actor to teleport
 * @return whether the teleport succeeded
 */
native final function bool TransformActor(Actor A);
/** transform the given movement vector to be relative to SisterPortal */
native final function vector TransformVectorDir(vector V);
/** transform the given location to be relative to SisterPortal */
native final function vector TransformHitLocation(vector HitLocation);
/** creates and initializes a TextureRenderTarget2D with size equal to our TextureResolutionX and TextureResolutionY properties */
native final function TextureRenderTarget2D CreatePortalTexture();

/* epic ===============================================
* ::StopsProjectile()
*
* returns true if Projectiles should call ProcessTouch() when they touch this actor
*/
simulated function bool StopsProjectile(Projectile P)
{
	return !TransformActor(P);
}

cpptext
{
	virtual APortalTeleporter* GetAPortalTeleporter() { return this; };
	virtual void Spawned();
	virtual void PostLoad();
#if WITH_EDITOR
	virtual void CheckForErrors();
	virtual INT AddMyMarker(AActor* S);
#endif
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void TickSpecial(FLOAT DeltaTime);
	UBOOL CanTeleport(AActor* A);

}


defaultproperties
{
   TextureResolutionX=256
   TextureResolutionY=256
   bAlwaysTeleportNonPawns=True
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent2 Archetype=StaticMeshComponent'Engine.Default__SceneCapturePortalActor:StaticMeshComponent2'
      StaticMesh=StaticMesh'EditorMeshes.TexPropPlane'
      ReplacementPrimitive=None
      CastShadow=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="StaticMeshComponent2"
      ObjectArchetype=StaticMeshComponent'Engine.Default__SceneCapturePortalActor:StaticMeshComponent2'
   End Object
   StaticMesh=StaticMeshComponent2
   Begin Object Class=SceneCapturePortalComponent Name=SceneCapturePortalComponent0 Archetype=SceneCapturePortalComponent'Engine.Default__SceneCapturePortalActor:SceneCapturePortalComponent0'
      Name="SceneCapturePortalComponent0"
      ObjectArchetype=SceneCapturePortalComponent'Engine.Default__SceneCapturePortalActor:SceneCapturePortalComponent0'
   End Object
   SceneCapture=SceneCapturePortalComponent0
   Components(0)=SceneCapturePortalComponent0
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1 Archetype=StaticMeshComponent'Engine.Default__SceneCapturePortalActor:StaticMeshComponent1'
      StaticMesh=StaticMesh'EditorMeshes.MatineeCam_SM'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale3D=(X=-1.000000,Y=1.000000,Z=1.000000)
      Name="StaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__SceneCapturePortalActor:StaticMeshComponent1'
   End Object
   Components(1)=StaticMeshComponent1
   Components(2)=StaticMeshComponent2
   bWorldGeometry=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   CollisionComponent=StaticMeshComponent2
   Name="Default__PortalTeleporter"
   ObjectArchetype=SceneCapturePortalActor'Engine.Default__SceneCapturePortalActor'
}
