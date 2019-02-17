class TrOrientedBoxComponent extends PrimitiveComponent
	native;

// Z-axis, height of the box.
var() const export float	BoxHeight;

// Y-axis, width of the box.
var() const export float	BoxWidth;

// X-axis, length of the box.
var() const export float    BoxLength;

native final function SetBoxSize(float NewHeight, float NewLength, float NewWidth, optional bool IsRadii = true);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__TrOrientedBoxComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
