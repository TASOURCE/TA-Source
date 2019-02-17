/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshGoalFilter_OutSideOfDotProductWedge extends NavMeshGoal_Filter
	native(AI);

/** Location to compare from **/
var transient vector Location;

var transient vector Rotation;

var transient float Epsilon;

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
// (cpptext)
// (cpptext)


static function bool OutsideOfDotProductWedge( NavMeshGoal_GenericFilterContainer FilterContainer , vector InLocation, rotator InRotation, float InEpsilon )
{
	local NavMeshGoalFilter_OutSideOfDotProductWedge	Eval;

	if( FilterContainer != None )
	{
		Eval = NavMeshGoalFilter_OutSideOfDotProductWedge(FilterContainer.GetFilterOfType(default.class));

		if( Eval != None )
		{
			Eval.Location = InLocation;
			Eval.Rotation = vector(InRotation);
			Eval.Epsilon = InEpsilon;
			FilterContainer.GoalFilters.AddItem(Eval);
			return TRUE;
		}
	}

	return FALSE;
}

cpptext
{
	// Interface
	/**
	 * Called on each Goal_Filter that is in the list of a generic filter container to determine a goal's fitness for being 'the one'
	 * @param PossibleGoal - the chosen (cheapest) successor from the open list
	 * @param PathParams   - the cached pathfinding params for the pathing entity
	 * @return - TRUE indicates according to this filter's criteria this goal is valid
	 */
	virtual UBOOL IsValidFinalGoal( FNavMeshPolyBase* PossibleGoal,
								const FNavMeshPathParams& PathParams);

}


defaultproperties
{
   Name="Default__NavMeshGoalFilter_OutSideOfDotProductWedge"
   ObjectArchetype=NavMeshGoal_Filter'Engine.Default__NavMeshGoal_Filter'
}
