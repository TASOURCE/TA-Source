/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshGoalFilter_NotNearOtherAI extends NavMeshGoal_Filter
	native(AI);



/** This is how far we are going to check around our spawn location. **/
var transient float DistanceToCheck;

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


static function bool NotNearOtherAI( NavMeshGoal_GenericFilterContainer FilterContainer , const float InDistanceToCheck )
{
	local NavMeshGoalFilter_NotNearOtherAI	Eval;

	if( FilterContainer != None )
	{
		Eval = NavMeshGoalFilter_NotNearOtherAI(FilterContainer.GetFilterOfType(default.class));

		if( Eval != None )
		{
			Eval.DistanceToCheck = InDistanceToCheck;
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
   Name="Default__NavMeshGoalFilter_NotNearOtherAI"
   ObjectArchetype=NavMeshGoal_Filter'Engine.Default__NavMeshGoal_Filter'
}
