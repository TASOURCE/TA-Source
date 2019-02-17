//=============================================================================
// ForcedDirVolume
// used to force UTVehicles [of a certain class if wanted] in a certain direction
//
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class ForcedDirVolume extends UDKForcedDirectionVolume;

defaultproperties
{
   Begin Object Class=ArrowComponent Name=AC Archetype=ArrowComponent'UDKBase.Default__UDKForcedDirectionVolume:AC'
      ArrowColor=(B=150,G=100,R=150,A=255)
      ArrowSize=5.000000
      ReplacementPrimitive=None
      AbsoluteRotation=True
      Name="AC"
      ObjectArchetype=ArrowComponent'UDKBase.Default__UDKForcedDirectionVolume:AC'
   End Object
   Arrow=AC
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'UDKBase.Default__UDKForcedDirectionVolume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_Untitled4
      bAcceptsLights=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'UDKBase.Default__UDKForcedDirectionVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   Components(1)=AC
   CollisionComponent=BrushComponent0
   Name="Default__ForcedDirVolume"
   ObjectArchetype=UDKForcedDirectionVolume'UDKBase.Default__UDKForcedDirectionVolume'
}
