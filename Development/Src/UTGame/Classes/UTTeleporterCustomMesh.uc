/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** version of Teleporter that has a custom mesh/material */
class UTTeleporterCustomMesh extends Teleporter;

var() StaticMeshComponent Mesh;

/** Sound to be played when someone teleports in*/
var SoundCue TeleportingSound;

var UTPawn LastPawn;
var float LastTime;

simulated event bool Accept( actor Incoming, Actor Source )
{
	local UTPlayerReplicationInfo PRI;

	PRI = (Pawn(Incoming) != None) ? UTPlayerReplicationInfo(Pawn(Incoming).PlayerReplicationInfo) : None;
	if ( (PRI != None) && (PRI.GetFlag() != None) )
	{
		PRI.GetFlag().Drop();
	}

	if (Super.Accept(Incoming,Source))
	{
		PlaySound(TeleportingSound);
		if ( UTPawn(Incoming) != None )
		{
			LastPawn = UTPawn(Incoming);
			LastTime = WorldInfo.TimeSeconds;
		}
		return true;
	}
	else
	{
		return false;
	}
}

event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if ( (Other == LastPawn) && (WorldInfo.TimeSeconds - LastTime < 0.2) )
	{
		return;
	}
	super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=PortalMesh
      StaticMesh=StaticMesh'EditorMeshes.TexPropPlane'
      Materials(0)=Material'EngineMaterials.ScreenMaterial'
      ReplacementPrimitive=None
      BlockActors=False
      BlockRigidBody=False
      Translation=(X=0.000000,Y=0.000000,Z=125.000000)
      Name="PortalMesh"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Mesh=PortalMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Teleporter:CollisionCylinder'
      CollisionHeight=30.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Teleporter:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Teleporter:Sprite'
      Sprite=Texture2D'EditorResources.S_Teleport'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Teleporter:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__Teleporter:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__Teleporter:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__Teleporter:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__Teleporter:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__Teleporter:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__Teleporter:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=PortalMesh
   CollisionComponent=PortalMesh
   Name="Default__UTTeleporterCustomMesh"
   ObjectArchetype=Teleporter'Engine.Default__Teleporter'
}
