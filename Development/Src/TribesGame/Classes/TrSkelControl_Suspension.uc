/* 
 * TrSkelControl_Suspension 
 */

class TrSkelControl_Suspension extends SkelControlSingleBone
	native
    hidecategories(Adjustments);

var()   bool    m_bApplyRotation;
var()   bool    m_bApplyTranslation;

var()	float	TransIgnore;
var()	float	TransScale;
var()	float	TransOffset;
var()	float	MaxTrans;
var()	float	MinTrans;

var()   float   RotIgnore;
var()	float	RotScale;
var()	float	MaxRot;
var()	float	MinRot;
var()	float	MaxRotRate;
var		float	CurrentRot;
var()   int     WheelIndex;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MaxRotRate=0.500000
   bApplyTranslation=True
   bApplyRotation=True
   bAddTranslation=True
   bAddRotation=True
   BoneTranslationSpace=BCS_BoneSpace
   BoneRotationSpace=BCS_BoneSpace
   Name="Default__TrSkelControl_Suspension"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
