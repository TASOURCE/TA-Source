/**
 * Interface for path objects which need to interface with the navmesh
 * - mostly provides a linkage from edges in the mesh to an object in the game.  Useful for specifc edges which
 *   need special handling (e.g. ladders).  This interface does not provide methods for altaring the mesh at runtime, for that 
 *   see Interface_navMeshPathObstacle (which can be used in conjunction with this interface)
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
interface Interface_NavMeshPathObject
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/************************************************************************
	 * Runtime Edge Query interface                                         *
	 ************************************************************************/

	virtual void InitGuid( TArray<FGuid>& ExistingNavGuids )
	{
		AActor* Actor = Cast<AActor>(GetUObjectInterfaceInterface_NavMeshPathObject());
		if( Actor != NULL )
		{
			FGuid* pGuid = Actor->GetGuid();
			if( pGuid )
			{
				if( !pGuid->IsValid() || ExistingNavGuids.ContainsItem(*pGuid) )
				{
					*pGuid = appCreateGuid();
				}
				else
				{
					// save the existing guid to check for duplicates
					ExistingNavGuids.AddItem(*pGuid);
				}
			}
		}
	}

	/** 
	 *  Called from edges linked to this PO
	 *  @param Interface     - the navhandle interface of the entity pathing 
	 *  @param PreviousPoint - the previous point in the path search (e.g. the point along the predecessor edge)
	 *  @param out_PathEdgePoint - the point we used along this edge to determine the cost 
	 *  @param Edge - the edge linked to this PO which needs to compute cost	 
	 *  @return     - the cost for traversing this edge
	 */
	virtual INT CostFor( const FNavMeshPathParams& PathParams, const FVector& PreviousPoint, FVector& out_PathEdgePoint, FNavMeshPathObjectEdge* Edge, FNavMeshPolyBase* SourcePoly )
	{
		return Edge->FNavMeshEdgeBase::CostFor(PathParams, PreviousPoint, out_PathEdgePoint, SourcePoly);
	}
	
	/**
	 * passthru function from edge to determine if the passed searcher supports this pathobject's movement
	 * @param Interface - the interface of the searcher
	 * @param CurPoly   - the poly being checked for support
	 * @param Edge      - the edge linked to this path object which is being considered
	 * @return TRUE if this path object supports the searcher
	 */
	virtual UBOOL Supports( const FNavMeshPathParams& PathParams,
							FNavMeshPolyBase* CurPoly,
							FNavMeshPathObjectEdge* Edge )
	{
		return Edge->FNavMeshEdgeBase::Supports(PathParams,CurPoly);
	}

	/** 
	 *  called when an entity is about to move through an edge linked to this path object.  Allows the path object to 
	 *  trigger animations, etc related to this PO
	 *  @param Interface - the entity which is traversing this PO
	 *  @param out_MovePt - the point generated by GetEdgeDestination which the entity is moving toward 
	 *  @param Edge      - the edge linked to this PathObject which is being moved through
	 *  @return          - whether or not the move was successful (true means we're done with this edge, remove it from path)
	 */
	virtual UBOOL PrepareMoveThru( class IInterface_NavigationHandle* Interface,
									FVector& out_MovePt,
									FNavMeshPathObjectEdge* Edge )
	{
		return FALSE;
	}

	/**
	 * called to determine the optimal position along this edge for the passed parameters (e.g. string pulling)
	 * @param EntityRadius - the radius of the entity we are computing the position for
	 * @param InfluencePosition - the position we are trying to get close to (e.g. previous point in path)
	 * @param EntityPosition    - the current position of the entity (e.g. starting position of bot)
	 * @param Edge              - the edge which is associated with this PO which we're being asked about
	 * @param out_EdgeDest      - the destination we want to use
	 * @return whether this PO modified the destination or not (FALSE indicates the default edge functionality should be used)
	 */
	virtual UBOOL GetEdgeDestination( const FNavMeshPathParams& PathParams,
										FLOAT EntityRadius,
										const FVector& InfluencePosition,
										const FVector& EntityPosition,
										FVector& out_EdgeDest,
										FNavMeshPathObjectEdge* Edge,
										UNavigationHandle* Handle)
	{
		return FALSE;
	}

	/**
	 * called to allow this PO to draw custom stuff for edges linked to it
	 * @param DRSP          - the sceneproxy we're drawing for
	 * @param DrawOffset    - offset from the actual location we should be drawing 
	 * @param Edge          - the edge we're drawing
	 * @return - whether this PO is doing custom drawing for the passed edge (FALSE indicates the default edge drawing functionality should be used)
	 */
	virtual UBOOL DrawEdge( FDebugRenderSceneProxy* DRSP, FColor C, FVector DrawOffset, FNavMeshPathObjectEdge* Edge )
	{
		return FALSE;		
	}

	/**
	 * allows path objects to dictate when it's OK for GetNextMoveLocation to push the current edge past this one in the AI's path.
	 * (normally the edge the AI is running to is figured out automatically based on which polygon the AI is in)
	 * @param PathParams - the parameters associated with the AI wondering if it is OK to run normal behavior
	 * @param bInPoly0 - whether the AI is currently in poly0 of this edge
	 * @param bInPoly1 - whether the AI is currently in poly1 of this edge
	 * @return - TRUE if it's OK to automatically progress the edge past this one 
	 */
	virtual UBOOL AllowMoveToNextEdge(FNavMeshPathParams& PathParams, UBOOL bInPoly0, UBOOL bInPoly1){ return TRUE; }

	/**
	 * this function is called after a poly linked to this edge is replaced with a submesh for a pathobstacle
	 * allows special edges to have a chance to add extra data after the mesh is split
	 * @param Poly - the poly that was just disabled and replaced with a submesh
	 * @param NewSubMesh - the submesh that now represents the poly
	 */
	virtual void PostSubMeshUpdateForOwningPoly(FNavMeshPolyBase* Poly, UNavigationMeshBase* New_SubMesh){}

	/**
	 * This is a helper function which is useful when this pathobject is being used in conjunction with the pathobstacle interface
	 * - just does all the work normally done in AddObstacleEdge, except convenienty tuned for use with pathobjects
	 * @param Status - current status of edges (e.g. what still needs adding)	 
	 * @param inV1 - vertex location of first vert in the edge
	 * @param inV2 - vertex location of second vert in the edge
	 * @param ConnectedPolys - the polys this edge links
	 * @param bEdgesNeedToBeDynamic - whether or not added edges need to be dynamic (e.g. we're adding edges between meshes)
	 * @param PolyAssocatedWithThisPO - the index into the connected polys array of the poly which is associated with this path object
	 * @param POOwner - the owner of the pathobject interface (e.g. the actor that implements interface)
	 * @param SupportedEdgeWidth - widht of unit this edge supports (defaults to -1.0 in which case the length of the edge will be used)
	 * @return returns an enum describing what just happened (what actions did we take) - used to determien what accompanying actions need to be taken 
	 *         by other obstacles and calling code
	 */
	EEdgeHandlingStatus AddObstacleEdgeForObstacle( EEdgeHandlingStatus Status, const FVector& inV1, const FVector& inV2, TArray<FNavMeshPolyBase*>& ConnectedPolys, UBOOL bEdgesNeedToBeDynamic, INT PolyAssocatedWithThisPO, AActor* POOwner, FLOAT SupportedEdgeWidth=-1.0f)
	{
		// if an edge has already been added in the direction we want to add an edge then there is probably a conflicting pathobstacle (e.g. we're butted
		// up against another obstacle which has already added an edge.. so just bail)
		if(Status == EHS_AddedBothDirs)
		{
			return Status;
		}

		// if there is already an edge point back into this PO from the other poly, bail
		if( (PolyAssocatedWithThisPO == 0 && Status == EHS_Added1to0) || 
			(PolyAssocatedWithThisPO == 1 && Status == EHS_Added0to1) )
		{
			return Status;
		}

		TArray<FNavMeshPolyBase*> ReversedConnectedPolys=ConnectedPolys;

		// so we want to add an edge back into the poly associated with this PO, so swap the order if we need to
		if(PolyAssocatedWithThisPO == 0)
		{
			ReversedConnectedPolys.SwapItems(0,1);
		}

		UNavigationMeshBase* Mesh = ReversedConnectedPolys(0)->NavMesh;

		if( Mesh == NULL )
		{
			return Status;
		}

		FNavMeshPathObjectEdge* NewEdge = NULL;
		if( bEdgesNeedToBeDynamic )
		{
			TArray<FNavMeshPathObjectEdge*> CreatedEdges;
			Mesh->AddDynamicCrossPylonEdge<FNavMeshPathObjectEdge>(inV1,inV2,ReversedConnectedPolys,SupportedEdgeWidth,TRUE, &CreatedEdges);

			NewEdge = (CreatedEdges.Num() > 0) ? CreatedEdges(0) : NULL;
			checkSlowish(CreatedEdges.Num() <2);
		}
		else
		{
			Mesh->AddOneWayCrossPylonEdgeToMesh<FNavMeshPathObjectEdge>(inV1,inV2,ReversedConnectedPolys,SupportedEdgeWidth,&NewEdge);
		}

		if(NewEdge == NULL)
		{
			return Status;
		}
		
		// bind new edge to this avoidance vol
		if(NewEdge != NULL)
		{
			NewEdge->PathObject = POOwner;
			NewEdge->InternalPathObjectID = 0;
		}

		// indicate that we added an edge from dest poly to src poly
		if(Status == EHS_AddedNone)
		{
			if(PolyAssocatedWithThisPO == 0)
			{
				return EHS_Added1to0;
			}
			else
			{
				return EHS_Added0to1;
			}
		}
		else
		{
			// if we get here that means someone should have already added an edge in the opposite direction
			return EHS_AddedBothDirs;
		}
	}


	/************************************************************************
	 * Mesh generation interface                                            *
	 ************************************************************************/

	/**
	 * this function describes a 'cookie cutter' edge that will be used to split the mesh beneath it
	 * for example if you have a cost inflicting volume that needs to conform the mesh to itself
	 * you could return an array of verts along the bottom boundary of the volume, and a height up to the top of the volume
	 * and then you have poly boundaries exactly along the border of the volume with which you can add 
	 * edges which affect cost
	 * @param Poly - array of vectors that describe bottom of 'cookie cutter' volume (should be CW and convex)
	 * @param PolyHeight - height above the poly within which polys should be split (extrude passed poly up by this amount and use faces for clip)
	 * @return - TRUE if this shape should be used to split the mesh FALSE if no splitting is necessary
	 */
	virtual UBOOL GetMeshSplittingPoly( TArray<FVector>& Poly, FLOAT& PolyHeight ){ return FALSE; }

	/**
	 * called for each pylon's exploration to see if this path object needs to be consulted during exploration
	 * @param Py - the pylon being explored that we need to know if this PO should be asked about
	 * @return - TRUE if this path object needs to have its IsExplorationAllowed function considered during path exploration
	 */
	virtual UBOOL NeedsForbidExploreCheck(APylon* Py) { return FALSE; }

	/**
	 * called during mesh exploration, allows this PO to forbid exploration through specific areas
	 * @param Py - the pylon being explored right now
	 * @param TestPosition - the position of the new poly we are asking about
	 * @return - TRUE if exploration is allowed
	 */
	virtual UBOOL IsExplorationAllowed( APylon* Py, const FVector& TestPosition) { return TRUE; }

	/**
	 * called after initial exploration, gives this PO a chance to add seeds to the exploration process
	 * @param SeedPointList - reference to the main array of seeds that need to be expanded after initial explore
	 * @param Py            - the pylon which is being expanded
	 */
	virtual void AddAuxSeedPoints( APylon* Py ){}

	/**
	 * called after edge creation is complete for each pylon to allow this PO to add edges for itself
	 * @param Py - the pylon which we are creating edges for
	 */
	virtual void CreateEdgesForPathObject( APylon* Py ){}

	/**
	 *  Function to be used from within CreateEdgesForPathObject
	 *  @param Interface_Owner - the actor which owns this interface
	 *  @param StartPoly - Source poly for edge
	 *  @param EndPoly   - Destination poly for edge
	 *  @param Vert0     - One end point of the edge
	 *  @param Vert1     - Another end point of the edge
	 *  @param InternalPOID - optional param for extra identifier which is attached to the edge being added (to distinguish between edges linked to this PO)
	 *  @return - T/F indicating success
	 */
	UBOOL AddEdgeForThisPO(AActor* Interface_Owner, 
						    APylon* Py,
						    FNavMeshPolyBase* StartPoly,
						    FNavMeshPolyBase* EndPoly,
							const FVector& Vert0,
							const FVector& Vert1,
							INT InternalPOID=-1,
							UBOOL bForce=FALSE)
	{
		UNavigationMeshBase* Mesh = Py->GetNavMesh();
		if( Mesh == NULL )
		{
			return FALSE;
		}

		if( StartPoly == EndPoly || StartPoly == NULL || EndPoly == NULL )
		{
			warnf(NAME_Warning,TEXT("WARNING! A pathobject (%s) tried to add an edge that links a poly to itself, or links a poly to nothing.  This add is being IGNORED!"), *Interface_Owner->GetName());
			return FALSE;
		}
		TArray<FNavMeshPolyBase*> ConnectedPolys;
		ConnectedPolys.AddItem(StartPoly);
		ConnectedPolys.AddItem(EndPoly);

		FNavMeshPathObjectEdge* NewEdge = NULL;
		if( Mesh->AddOneWayCrossPylonEdgeToMesh<FNavMeshPathObjectEdge>(Vert0,Vert1,ConnectedPolys,-1.0f,&NewEdge,bForce) )
		{
			if(NewEdge != NULL)
			{
				NewEdge->PathObject = Interface_Owner;
				NewEdge->InternalPathObjectID = InternalPOID;
			}

			// still want to return true if newedge is null, false indicates we ran out of vert indices
			return TRUE;
		}
		
		return FALSE;
	}

	/**
	 * Allows this path object to modify the final path generated for a bot when the path 
	 * uses an edge linked to this path object.. default is to do nothing
	 * @param Handle - the navigation handle whose path we are molesting
	 * @param Idx - the index into the pathcache that the edge associated with this path object is at
	 * @return - TRUE if we modified the path
	 */
	virtual UBOOL ModifyFinalPath( UNavigationHandle* Handle, INT Idx )
	{
		return FALSE;
	}

	/**
	 * For debugging.  Verifies that this pathobject is still alive and well and not orphaned or deleted
	 * @return - TRUE If this path object is in good working order
	 */
	virtual UBOOL Verify()
	{
		return FALSE;
	}

}


defaultproperties
{
   Name="Default__Interface_NavMeshPathObject"
   ObjectArchetype=Interface'Core.Default__Interface'
}
