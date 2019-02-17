/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class Route extends Info
	placeable
	native
	ClassGroup(Navigation)
	implements(EditorLinkSelectionInterface);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

enum ERouteFillAction
{
	RFA_Overwrite,
	RFA_Add,
	RFA_Remove,
	RFA_Clear,
};
enum ERouteDirection
{
	ERD_Forward,
	ERD_Reverse,
};
enum ERouteType
{
	/** Move from beginning to end, then stop */
	ERT_Linear,
	/** Move from beginning to end and then reverse */
	ERT_Loop,
	/** Move from beginning to end, then start at beginning again */
	ERT_Circle,
};
var() ERouteType RouteType;

/** List of move targets in order */
var() array<ActorReference> RouteList;
/** Fudge factor for adjusting to next route position faster */
var() float	FudgeFactor;
/** routeindex offset (if you want the routeindex to be offset from the 'closest' route point you can plug an offset in here) */
var() int RouteIndexOffset;

final native function int ResolveRouteIndex( int Idx, ERouteDirection RouteDirection, out byte out_bComplete, out byte out_bReverse );

/**
 *	Find the closest navigation point in the route
 *	(that is also within tether distance)
 */
final native function int MoveOntoRoutePath( Pawn P, optional ERouteDirection RouteDirection = ERD_Forward, optional float DistFudgeFactor = 1.f );

cpptext
{
	void AutoFillRoute( ERouteFillAction RFA, TArray<AActor*>& Points );
	virtual void GetActorReferences(TArray<FActorReference*> &ActorRefs, UBOOL bIsRemovingLevel);
#if WITH_EDITOR
	virtual void CheckForErrors();
	virtual UBOOL HasRefToActor( AActor* A, INT* out_Idx = NULL );
#endif

	////// EditorLinkSelectionInterface
	virtual void LinkSelection(USelection* SelectedActors);


}


defaultproperties
{
   FudgeFactor=1.000000
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      Sprite=Texture2D'EditorResources.S_Route'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=Sprite
   Begin Object Class=RouteRenderingComponent Name=RouteRenderer
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="RouteRenderer"
      ObjectArchetype=RouteRenderingComponent'Engine.Default__RouteRenderingComponent'
   End Object
   Components(2)=RouteRenderer
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   Name="Default__Route"
   ObjectArchetype=Info'Engine.Default__Info'
}
