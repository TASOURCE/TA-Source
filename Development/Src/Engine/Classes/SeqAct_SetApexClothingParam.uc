class SeqAct_SetApexClothingParam extends SequenceAction
	native(Sequence);

var() bool bEnableApexClothingSimulation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Activated();

}


defaultproperties
{
   ObjName="Set Apex Clothing Parameter"
   ObjCategory="Physics"
   Name="Default__SeqAct_SetApexClothingParam"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
