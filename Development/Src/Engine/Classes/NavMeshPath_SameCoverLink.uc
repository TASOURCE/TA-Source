/** 
 * only allows polys that contain cover from the specified CoverLink 
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshPath_SameCoverLink extends NavMeshPathConstraint
	native(AI);

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var CoverLink TestLink;

static final function SameCoverLink(NavigationHandle NavHandle, CoverLink InLink)
{
	local NavMeshPath_SameCoverLink NewConstraint;

	NewConstraint = NavMeshPath_SameCoverLink(NavHandle.CreatePathConstraint(default.class));
	NewConstraint.TestLink = InLink;
	NavHandle.AddPathConstraint(NewConstraint);
}

function Recycle()
{
	Super.Recycle();
	TestLink = None;
}

cpptext
{
	virtual UBOOL EvaluatePath( FNavMeshEdgeBase* Edge, FNavMeshPolyBase* SrcPoly, FNavMeshPolyBase* DestPoly,
					const FNavMeshPathParams& PathParams, INT& out_PathCost, INT& out_HeuristicCost, const FVector& EdgePoint )
	{
		for (INT i = 0; i < DestPoly->PolyCover.Num(); i++)
		{
			if (*DestPoly->PolyCover(i) == TestLink)
			{
				return TRUE;
			}
		}

		return FALSE;
	}

}


defaultproperties
{
   Name="Default__NavMeshPath_SameCoverLink"
   ObjectArchetype=NavMeshPathConstraint'Engine.Default__NavMeshPathConstraint'
}
