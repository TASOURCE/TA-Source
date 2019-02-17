/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeLODQuad extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** This controls how far away this region will change to a simple quad, as a scale of the SimpleMeshMassiveLODDistance of the lowest LOD mesh. Should be less than 1.0 */
var()   float   MassiveLODDistanceScale;

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
	// PBRuleNodeBase interface
	virtual void ProcessScope(FPBScope2D& InScope, INT TopLevelScopeIndex, AProcBuilding* BaseBuilding, AProcBuilding* ScopeBuilding, UStaticMeshComponent* LODParent);
	
	// Editor
	virtual FString GetRuleNodeTitle();	

}


defaultproperties
{
   MassiveLODDistanceScale=0.700000
   Name="Default__PBRuleNodeLODQuad"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
