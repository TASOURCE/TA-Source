/**
 * CCD IK or "Cyclic-Coordinate Descent Inverse kinematics"
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SkelControl_CCD_IK extends SkelControlBase
	native(Anim);

/** Where you want the controlled bone to be. Will be placed as close as possible within the constraints of the limb. */
var(Effector)	vector					EffectorLocation;
/** Reference frame that the DesiredLocation is defined in. */
var(Effector)	EBoneControlSpace		EffectorLocationSpace;
/** Name of bone used if DesiredLocationSpace is BCS_OtherBoneSpace. */
var(Effector)	name					EffectorSpaceBoneName;
/** Translation from bone */
var(Effector)	vector					EffectorTranslationFromBone;

/** Number of bones above the active one in the hierarchy to modify and apply CCD IK. */
var(CCD)		int						NumBones;
/** Loop MaxPerBoneIterations per bone in the chain. */
var(CCD)		INT						MaxPerBoneIterations;
/** Iterations count for last render. Read only. */
var		const	INT						IterationsCount;
/** Error tolerance to consider IK Target reached, in squared units. */
var(CCD)		FLOAT					Precision;
/** By default CCD starts at end of chain and goes backwards. If TRUE, do the opposite.  */
var(CCD)		bool					bStartFromTail;
/** Joint Angle Constraint */
var(CCD) const	Array<FLOAT>			AngleConstraint;
/** Max Angle Steps */
var(CCD)		FLOAT					MaxAngleSteps;
/** if TRUE, skip update when turn is negligible. */
var(CCD)		bool					bNoTurnOptimization;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// USkelControlBase interface
	virtual void GetAffectedBones(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<INT>& OutBoneIndices);
	virtual void CalculateNewBoneTransforms(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<FBoneAtom>& OutBoneTransforms);	

	virtual INT GetWidgetCount();
	virtual FBoneAtom GetWidgetTM(INT WidgetIndex, USkeletalMeshComponent* SkelComp, INT BoneIndex);
	virtual void HandleWidgetDrag(INT WidgetIndex, const FVector& DragVec);

}


defaultproperties
{
   NumBones=2
   MaxPerBoneIterations=3
   Precision=0.100000
   MaxAngleSteps=0.400000
   Name="Default__SkelControl_CCD_IK"
   ObjectArchetype=SkelControlBase'Engine.Default__SkelControlBase'
}
