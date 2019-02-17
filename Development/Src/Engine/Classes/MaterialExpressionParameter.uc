/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionParameter extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** The name of the parameter */
var() name			ParameterName;

/** GUID that should be unique within the material, this is used for parameter renaming. */
var	  const	guid	ExpressionGUID;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
	/** 
	 * Generates a GUID for this expression if one doesn't already exist. 
	 *
	 * @param bForceGeneration	Whether we should generate a GUID even if it is already valid.
	 */
	void ConditionallyGenerateGUID(UBOOL bForceGeneration=FALSE);

	/** Tries to generate a GUID. */
	virtual void PostLoad();

	/** Tries to generate a GUID. */
	virtual void PostDuplicate();

	/** Tries to generate a GUID. */
	virtual void PostEditImport();

	/**
	 * MatchesSearchQuery: Check this expression to see if it matches the search query
	 * @param SearchQuery - User's search query (never blank)
	 * @return TRUE if the expression matches the search query
     */
	virtual UBOOL MatchesSearchQuery( const TCHAR* SearchQuery );

}


defaultproperties
{
   bIsParameterExpression=True
   MenuCategories(0)="Parameters"
   Name="Default__MaterialExpressionParameter"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
