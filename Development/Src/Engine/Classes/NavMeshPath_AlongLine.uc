/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshPath_AlongLine extends NavMeshPathConstraint
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Direction to move in */
var Vector	Direction;

static function bool AlongLine( NavigationHandle NavHandle, Vector Dir )
{
	local NavMeshPath_AlongLine Con;

	if( NavHandle != None && !IsZero( Dir ) )
	{
		Con = NavMeshPath_AlongLine(NavHandle.CreatePathConstraint(default.class));
		if( Con != None )
		{
			Con.Direction = Dir;
			NavHandle.AddPathConstraint( Con );
			return TRUE;
		}
	}

	return FALSE;
}

function Recycle()
{
	Super.Recycle();
	Direction=vect(0,0,0);
}

cpptext
{
	// Interface
	virtual UBOOL EvaluatePath( FNavMeshEdgeBase* Edge, FNavMeshPolyBase* SrcPoly, FNavMeshPolyBase* DestPoly, const FNavMeshPathParams& PathParams, INT& out_PathCost, INT& out_HeuristicCost, const FVector& EdgePoint );

}


defaultproperties
{
   Name="Default__NavMeshPath_AlongLine"
   ObjectArchetype=NavMeshPathConstraint'Engine.Default__NavMeshPathConstraint'
}
