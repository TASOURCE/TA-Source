/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 * only allows edges which have a corresponding edge back (filters out one-way situations)
 */
class NavMeshPath_EnforceTwoWayEdges extends NavMeshPathConstraint
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static function bool EnforceTwoWayEdges( NavigationHandle NavHandle )
{
	local NavMeshPath_EnforceTwoWayEdges Con;

	if( NavHandle != None )
	{
		Con = NavMeshPath_EnforceTwoWayEdges(NavHandle.CreatePathConstraint(default.class));
		if( Con != None )
		{
			NavHandle.AddPathConstraint( Con );
			return TRUE;
		}
	}

	return FALSE;
}

cpptext
{
	// Interface
	virtual UBOOL EvaluatePath( FNavMeshEdgeBase* Edge, FNavMeshPolyBase* SrcPoly, FNavMeshPolyBase* DestPoly, const FNavMeshPathParams& PathParams, INT& out_PathCost, INT& out_HeuristicCost, const FVector& EdgePoint );

}


defaultproperties
{
   Name="Default__NavMeshPath_EnforceTwoWayEdges"
   ObjectArchetype=NavMeshPathConstraint'Engine.Default__NavMeshPathConstraint'
}
