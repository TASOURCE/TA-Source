/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTRotatingDroppedPickup extends UTDroppedPickup;

var() float YawRotationRate;

simulated event Tick(float DeltaTime)
{
	Local Rotator NewRotation;

	if( PickupMesh != None && WorldInfo.NetMode != NM_DedicatedServer && (WorldInfo.TimeSeconds - LastRenderTime < 0.2) )
	{
		NewRotation = PickupMesh.Rotation;
		NewRotation.Yaw += DeltaTime * YawRotationRate;
		PickupMesh.SetRotation(NewRotation);

		if ( PickupParticles != None )
		{
			NewRotation = PickupParticles.Rotation;
			NewRotation.Yaw += DeltaTime * YawRotationRate;
			PickupParticles.SetRotation(NewRotation);
		}
	}
}

defaultproperties
{
   YawRotationRate=32768.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=DroppedPickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTDroppedPickup:DroppedPickupLightEnvironment'
      AmbientGlow=(R=0.200000,G=0.200000,B=0.200000,A=1.000000)
      bCastShadows=False
      bDynamic=False
      Name="DroppedPickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTDroppedPickup:DroppedPickupLightEnvironment'
   End Object
   MyLightEnvironment=DroppedPickupLightEnvironment
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTDroppedPickup:Sprite'
      Sprite=Texture2D'EditorResources.S_Inventory'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTDroppedPickup:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTDroppedPickup:CollisionCylinder'
      CollisionHeight=20.000000
      CollisionRadius=30.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTDroppedPickup:CollisionCylinder'
   End Object
   Components(1)=CollisionCylinder
   Components(2)=DroppedPickupLightEnvironment
   CollisionComponent=CollisionCylinder
   Name="Default__UTRotatingDroppedPickup"
   ObjectArchetype=UTDroppedPickup'UTGame.Default__UTDroppedPickup'
}
