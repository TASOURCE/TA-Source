/**
 * AnimNodeBlendByBase.uc
 * Looks at the base of the Pawn that owns this node and blends accordingly.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AnimNodeBlendByBase extends AnimNodeBlendList
		native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

enum EBaseBlendType
{
	BBT_ByActorTag,
	BBT_ByActorClass,
};

/** Type of comparison to do */
var() EBaseBlendType	Type;
/** Actor tag that will match the base */
var() Name				ActorTag;
/** Actor class that will match the base */
var() class<Actor>		ActorClass<AllowAbstract>;
/** Duration of blend */
var() float				BlendTime;
/** Cached Base Actor */
var	transient Actor		CachedBase;

cpptext
{
	virtual	void TickAnim(FLOAT DeltaSeconds);

}


defaultproperties
{
   BlendTime=0.200000
   Children(0)=(Name="Normal")
   Children(1)=(Name="Based")
   bFixNumChildren=True
   Name="Default__AnimNodeBlendByBase"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
