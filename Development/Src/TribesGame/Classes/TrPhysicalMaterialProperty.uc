class TrPhysicalMaterialProperty extends PhysicalMaterialPropertyBase
	native;

/** Type of material this is (dirt, gravel, brick, etc) used for looking up material specific effects */
var() name MaterialType;

defaultproperties
{
   Name="Default__TrPhysicalMaterialProperty"
   ObjectArchetype=PhysicalMaterialPropertyBase'Engine.Default__PhysicalMaterialPropertyBase'
}
