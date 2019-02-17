/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTPortal extends PortalTeleporter
	placeable;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent2 Archetype=StaticMeshComponent'Engine.Default__PortalTeleporter:StaticMeshComponent2'
      StaticMesh=StaticMesh'EditorMeshes.TexPropPlane'
      ReplacementPrimitive=None
      CastShadow=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="StaticMeshComponent2"
      ObjectArchetype=StaticMeshComponent'Engine.Default__PortalTeleporter:StaticMeshComponent2'
   End Object
   StaticMesh=StaticMeshComponent2
   Begin Object Class=SceneCapturePortalComponent Name=SceneCapturePortalComponent0 Archetype=SceneCapturePortalComponent'Engine.Default__PortalTeleporter:SceneCapturePortalComponent0'
      Name="SceneCapturePortalComponent0"
      ObjectArchetype=SceneCapturePortalComponent'Engine.Default__PortalTeleporter:SceneCapturePortalComponent0'
   End Object
   SceneCapture=SceneCapturePortalComponent0
   Components(0)=SceneCapturePortalComponent0
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1 Archetype=StaticMeshComponent'Engine.Default__PortalTeleporter:StaticMeshComponent1'
      StaticMesh=StaticMesh'EditorMeshes.MatineeCam_SM'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale3D=(X=-1.000000,Y=1.000000,Z=1.000000)
      Name="StaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__PortalTeleporter:StaticMeshComponent1'
   End Object
   Components(1)=StaticMeshComponent1
   Components(2)=StaticMeshComponent2
   bEdShouldSnap=True
   CollisionComponent=StaticMeshComponent2
   Name="Default__UTPortal"
   ObjectArchetype=PortalTeleporter'Engine.Default__PortalTeleporter'
}
