/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxRadialCustomForceField extends NxRadialForceField
	native(ForceField)
	placeable;


/** */
var()	interp float	SelfRotationStrength;

/** custom force field kernel */
var const native transient pointer		Kernel{class NxForceFieldKernelRadial};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void DefineForceFunction(FPointer ForceFieldDesc);
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);

}


defaultproperties
{
   Begin Object Class=DrawSphereComponent Name=DrawSphere0 Archetype=DrawSphereComponent'Engine.Default__NxRadialForceField:DrawSphere0'
      SphereColor=(B=255,G=70,R=64,A=255)
      SphereRadius=200.000000
      ReplacementPrimitive=None
      Name="DrawSphere0"
      ObjectArchetype=DrawSphereComponent'Engine.Default__NxRadialForceField:DrawSphere0'
   End Object
   RenderComponent=DrawSphere0
   Components(0)=DrawSphere0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NxRadialForceField:Sprite'
      Sprite=Texture2D'EditorResources.S_RadForce'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NxRadialForceField:Sprite'
   End Object
   Components(1)=Sprite
   Name="Default__NxRadialCustomForceField"
   ObjectArchetype=NxRadialForceField'Engine.Default__NxRadialForceField'
}
