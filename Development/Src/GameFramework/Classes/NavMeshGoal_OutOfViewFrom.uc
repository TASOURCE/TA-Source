/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshGoal_OutOfViewFrom extends NavMeshPathGoalEvaluator
	native;


// the polygon that contains our goal point
var private native pointer GoalPoly{FNavMeshPolyBase};

var vector OutOfViewLocation;

/** show debug lines **/
// TODO: prob should promote this
var bool bShowDebug;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)



native function RecycleNative();


static function bool MustBeHiddenFromThisPoint( NavigationHandle NavHandle, Vector InOutOfViewLocation )
{
	local NavMeshGoal_OutOfViewFrom Eval;

	if( NavHandle != None )
	{
		Eval = NavMeshGoal_OutOfViewFrom(NavHandle.CreatePathGoalEvaluator(default.class));

		if( Eval != None )
		{
			Eval.OutOfViewLocation = InOutOfViewLocation;
			NavHandle.AddGoalEvaluator( Eval );
			return TRUE;
		}
	}

	return FALSE;
}


function Recycle()
{
	RecycleNative();
	Super.Recycle();
}

defaultproperties
{
   Name="Default__NavMeshGoal_OutOfViewFrom"
   ObjectArchetype=NavMeshPathGoalEvaluator'Engine.Default__NavMeshPathGoalEvaluator'
}
