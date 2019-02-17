/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeRepeat extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object)	
	dependson(ProcBuildingRuleset);


var()   EProcBuildingAxis   RepeatAxis;

var()   float               RepeatMaxSize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

cpptext
{
	virtual void ProcessScope(FPBScope2D& InScope, INT TopLevelScopeIndex, AProcBuilding* BaseBuilding, AProcBuilding* ScopeBuilding, UStaticMeshComponent* LODParent);
	
	// Editor
	virtual FString GetRuleNodeTitle();	

}


defaultproperties
{
   RepeatAxis=EPBAxis_Z
   RepeatMaxSize=512.000000
   Name="Default__PBRuleNodeRepeat"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
