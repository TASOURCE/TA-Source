/**
 *	Controller used by hoverboard for moving lower part in response to wheel movements.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_HoverboardSuspension extends SkelControlSingleBone
	hidecategories(Translation,Rotation)
	native(Animation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var()	float	TransIgnore;
var()	float	TransScale;
var()	float	TransOffset;
var()	float	MaxTrans;
var()	float	MinTrans;
var()	float	RotScale;
var()	float	MaxRot;
var()	float	MaxRotRate;
var		float	CurrentRot;

defaultproperties
{
   MaxRotRate=0.500000
   bApplyTranslation=True
   bApplyRotation=True
   bAddTranslation=True
   bAddRotation=True
   BoneTranslationSpace=BCS_BoneSpace
   BoneRotationSpace=BCS_BoneSpace
   Name="Default__UDKSkelControl_HoverboardSuspension"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
