/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class CoverMeshComponent extends StaticMeshComponent
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

struct native CoverMeshes
{
	var StaticMesh Base;
	var StaticMesh LeanLeft, LeanRight;
	var StaticMesh Climb, Mantle;
	var StaticMesh SlipLeft, SlipRight;
	var StaticMesh SwatLeft, SwatRight;
	var StaticMesh PopUp;
	var StaticMesh PlayerOnly;
};
var editoronly array<CoverMeshes> Meshes;

/** Base offset applied to all meshes */
var vector LocationOffset;

var editoronly StaticMesh AutoAdjustOn, AutoAdjustOff;
var editoronly StaticMesh Disabled;

/** Allows the LDs to show all cover in a level without editing the cover */
var editoronly transient bool bShowWhenNotSelected;

cpptext
{
	void UpdateBounds();
	virtual FPrimitiveSceneProxy* CreateSceneProxy();
	virtual UBOOL ShouldRecreateProxyOnUpdateTransform() const;
	virtual void UpdateMeshes() {};

}


defaultproperties
{
   Meshes(0)=(Base=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy__BASE_TALL')
   Meshes(1)=(Base=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy__BASE_TALL',LeanLeft=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_LeanLeftS',LeanRight=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_LeanRightS',SlipLeft=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_CoverSlipLeft',SlipRight=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_CoverSlipRight',SwatLeft=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_SwatLeft',SwatRight=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_SwatRight',PlayerOnly=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_PlayerOnlyS')
   Meshes(2)=(Base=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy__BASE_SHORT',LeanLeft=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_LeanLeftM',LeanRight=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_LeanRightM',Climb=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_Climb',Mantle=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_Mantle',SlipLeft=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_CoverSlipLeft',SlipRight=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_CoverSlipRight',SwatLeft=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_SwatLeft',SwatRight=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_SwatRight',PopUp=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_PopUp',PlayerOnly=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_PlayerOnlyM')
   LocationOffset=(X=0.000000,Y=0.000000,Z=-60.000000)
   AutoAdjustOn=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_AutoAdjust'
   AutoAdjustOff=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_AutoAdjustOff'
   Disabled=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_Enabled'
   StaticMesh=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy__BASE_TALL'
   ReplacementPrimitive=None
   HiddenGame=True
   bAcceptsStaticDecals=False
   bAcceptsDynamicDecals=False
   CastShadow=False
   bAcceptsLights=False
   CollideActors=False
   BlockActors=False
   BlockZeroExtent=False
   BlockNonZeroExtent=False
   BlockRigidBody=False
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__CoverMeshComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
