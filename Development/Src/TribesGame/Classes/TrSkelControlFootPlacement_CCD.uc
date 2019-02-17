class TrSkelControlFootPlacement_CCD extends SkelControl_CCD_IK
	native;

/** Vertical offset to apply to foot bone. This is applied along the vector between the hip position and the foot bone position. */
var(FootPlacement) float FootOffset;

/** Axis of the foot bone to align to ground normal (if bOrientFootToGround is true). */
var(FootPlacement) EAxis FootUpAxis;

/** Rotation offset applied to foot matrix before taking the FootUpAxis. */
var(FootPlacement) rotator FootRotOffset;

/** If we should invert the axis used for aligning the foot to the floor, defined by FootUpAxis. */
var(FootPlacement) bool bInvertFootUpAxis;

/** If we should attempt to align the foot bone with the surface normal of the ground. */
var(FootPlacement) bool bOrientFootToGround;

/** This control should be completely disabled if we are not doing an upwards adjustment on the foot. */ 
var(FootPlacement) bool	bOnlyEnableForUpAdjustment;

/** Maximum distance from animated post that foot will be moved up. */
var(FootPlacement) float MaxUpAdjustment;

/** Maximum distance from animated post that foot will be moved down. */
var(FootPlacement) float MaxDownAdjustment;

/** Maximum angle (in degrees) that we will rotate the foot from the animated orientation in an attempt to match the ground normal. */
var(FootPlacement) float MaxFootOrientAdjust;

/** How fast to interpolate the foot to the target orientation. */
var(FootPlacement) float FootOrientInterpSpeed;

/** Internal for interpolation. Was the foot on the ground last tick? */
var transient bool bFootOnGroundLastTick;

/** Internal for interpolation. Direction of the foot up vector last tick. */
var transient vector FootUpDirLastTick;

/** Interp speed for blending into a foot placement on the ground. */
var(FootPlacement) float OnContactFootAdjustInterpSpeed;

/** Interp speed for blending out of a foot placement on the ground. */
var(FootPlacement) float OffContactFootAdjustInterpSpeed;

/** Internal for interpolation. Keep track of last tick's height for interpolation.*/
var transient float FootAdjustHeightLastTick;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   FootUpAxis=AXIS_X
   bOrientFootToGround=True
   MaxUpAdjustment=50.000000
   MaxFootOrientAdjust=45.000000
   FootOrientInterpSpeed=2.200000
   OnContactFootAdjustInterpSpeed=300.000000
   OffContactFootAdjustInterpSpeed=100.000000
   Name="Default__TrSkelControlFootPlacement_CCD"
   ObjectArchetype=SkelControl_CCD_IK'Engine.Default__SkelControl_CCD_IK'
}
