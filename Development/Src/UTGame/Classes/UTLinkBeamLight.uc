/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTLinkBeamLight extends Actor;

var PointLightComponent BeamLight;

defaultproperties
{
   Begin Object Class=PointLightComponent Name=LightComponentB
      Radius=130.000000
      Brightness=3.000000
      LightColor=(B=200,G=211,R=173,A=255)
      CastShadows=False
      Name="LightComponentB"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   BeamLight=LightComponentB
   Components(0)=LightComponentB
   bGameRelevant=True
   Name="Default__UTLinkBeamLight"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
