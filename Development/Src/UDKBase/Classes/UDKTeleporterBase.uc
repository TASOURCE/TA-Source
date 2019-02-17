/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKTeleporterBase extends Teleporter
	native
	abstract
	config(Game);

/** the component that captures the portal scene */
var(SceneCapture) editconst SceneCaptureComponent PortalCaptureComponent;

/** the texture that the component renders to */
var TextureRenderTarget2D TextureTarget;

/** resolution parameters */
var(SceneCapture) int TextureResolutionX, TextureResolutionY;

/** actor that the portal view is based on (used for updating Controllers' VisiblePortals array) */
var Actor PortalViewTarget;

/** materials for the portal effect */
var MaterialInterface PortalMaterial;
var MaterialInstanceConstant PortalMaterialInstance;

/** material parameter that we assign the rendered texture to */
var name PortalTextureParameter;

/** Sound to be played when someone teleports in*/
var SoundCue TeleportingSound;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event PostBeginPlay()
{
	local Teleporter Dest;

	Super.PostBeginPlay();

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		// try to find a teleporter to view
		foreach WorldInfo.AllNavigationPoints(class'Teleporter', Dest)
		{
			if (string(Dest.Tag) ~= URL && Dest != Self)
			{
				break;
			}
		}
		if (WorldInfo.IsConsoleBuild(CONSOLE_PS3))
		{
			SetHidden(Dest == None);
		}
		else
		{
			InitializePortalEffect(Dest);
		}
	}
}

simulated function InitializePortalEffect(Actor Dest)
{
	local bool bStaticCapture;

	if (PortalCaptureComponent != None)
	{
		if (Dest != None)
		{
			// only get realtime capture in high detail mode
			bStaticCapture = (WorldInfo.GetDetailMode() < DM_High);

			PortalViewTarget = Dest;
			// set up the portal effect
			PortalMaterialInstance = new(self) class'MaterialInstanceConstant';
			PortalMaterialInstance.SetParent(PortalMaterial);

			TextureTarget = class'TextureRenderTarget2D'.static.Create( TextureResolutionX, TextureResolutionY,,
									MakeLinearColor(0.0, 0.0, 0.0, 1.0), bStaticCapture );

			if (bStaticCapture)
			{
				PortalCaptureComponent.SetFrameRate(0);
			}
			PortalMaterialInstance.SetTextureParameterValue(PortalTextureParameter, TextureTarget);

			AttachComponent(PortalCaptureComponent);
		}
		else
		{
			SetHidden(true);
		}
	}
}

simulated event bool Accept( actor Incoming, Actor Source )
{
	if (Super.Accept(Incoming,Source))
	{
		PlaySound(TeleportingSound);
		return true;
	}
	else
	{
		return false;
	}
}

defaultproperties
{
   TextureResolutionX=256
   TextureResolutionY=256
   PortalTextureParameter="RenderToTextureMap"
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Teleporter:CollisionCylinder'
      CollisionHeight=30.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      CollideActors=True
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
   bStatic=False
   bMovable=False
   CollisionComponent=CollisionCylinder
   Name="Default__UDKTeleporterBase"
   ObjectArchetype=Teleporter'Engine.Default__Teleporter'
}
