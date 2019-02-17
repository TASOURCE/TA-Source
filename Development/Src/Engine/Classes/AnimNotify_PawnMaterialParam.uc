/**
 * AnimNotify_PawnMaterialParam
 * 
 * Control MaterialInstanceConstant Scalar parameters through AnimNotifies
 * 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AnimNotify_PawnMaterialParam extends AnimNotify_Scripted
	native(Anim);

var() Array<ScalarParameterInterpStruct> ScalarParameterInterpArray;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event Notify(Actor Owner, AnimNodeSequence AnimSeqInstigator)
{
	local Pawn P;
	local INT i;
	local ScalarParameterInterpStruct ScalarParam;

	P = Pawn(Owner);
	if( P != None )
	{
		for(i=0; i<ScalarParameterInterpArray.Length; i++)
		{
			ScalarParam = ScalarParameterInterpArray[i];
			P.SetScalarParameterInterp(ScalarParam);
		}
	}
}

cpptext
{
	virtual FString GetEditorComment() { return TEXT("MatParam"); }

}


defaultproperties
{
   Name="Default__AnimNotify_PawnMaterialParam"
   ObjectArchetype=AnimNotify_Scripted'Engine.Default__AnimNotify_Scripted'
}
