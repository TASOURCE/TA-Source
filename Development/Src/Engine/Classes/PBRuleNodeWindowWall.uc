/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeWindowWall extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** How large each repeat of the texture is allowed to be along X. */
var()   float               CellMaxSizeX;
/** How large each repeat of the texture is allowed to be along Z. */
var()   float               CellMaxSizeZ;
/** X dimension of window within cell */
var()	float				WindowSizeX;
/** Z dimension of window within cell */
var()	float				WindowSizeZ;
/** X location of window within cell - 0 means left, 1 means right, 0.5 is middle */
var()	float				WindowPosX;
/** Z location of window within cell - 0 means left, 1 means right, 0.5 is middle */
var()	float				WindowPosZ;
/** If TRUE, window is scaled down as cell is */
var()	bool				bScaleWindowWithCell;
/** Amount to offset mesh along Y */
var()	float				YOffset;

/** Material to apply to created quad. */
var()   MaterialInterface   Material;

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
	// PBRuleNodeBase interface
	virtual void ProcessScope(FPBScope2D& InScope, INT TopLevelScopeIndex, AProcBuilding* BaseBuilding, AProcBuilding* ScopeBuilding, UStaticMeshComponent* LODParent);
	
	// Editor
	virtual FString GetRuleNodeTitle();	
	virtual FColor GetRuleNodeTitleColor();	

}


defaultproperties
{
   CellMaxSizeX=512.000000
   CellMaxSizeZ=512.000000
   WindowSizeX=128.000000
   WindowSizeZ=232.000000
   WindowPosX=0.500000
   WindowPosZ=0.500000
   Name="Default__PBRuleNodeWindowWall"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
