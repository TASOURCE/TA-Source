class TrGameObjectiveUpgrade extends Object
	native;

/** NOTE! Do not use this directly! Use one of the children! */
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** The property name to modify the value of  */
var name m_nmClassPropertyName;

/** The new value to assign. */
var float m_fNewValue;

/** DO NOT USE - NATIVE CODE ONLY */
var const pointer m_ClassPropertyPointer;

/** DO NOT USE - NATIVE CODE ONLY */
var TrGameObjective m_Owner;

native function InitUpgrade(TrGameObjective OwnerObject);

defaultproperties
{
   Name="Default__TrGameObjectiveUpgrade"
   ObjectArchetype=Object'Core.Default__Object'
}
