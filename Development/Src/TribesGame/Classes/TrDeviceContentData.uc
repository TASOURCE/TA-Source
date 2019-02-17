/**
 *  This object contains references to the assets that will load when needed by the gameplay code.
 */

class TrDeviceContentData extends Object
	native;

var const SkeletalMesh  m_SkeletalMesh1p;
var const PhysicsAsset  m_PhysicsAsset1p;
var array<AnimSet>      m_AnimSets1p;
var const AnimTree      m_AnimTreeTemplate1p;
var AnimSet             m_PaperDollAnimSet;
var class<TrDevice>     m_TrDeviceClass;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TrDeviceContentData"
   ObjectArchetype=Object'Core.Default__Object'
}
