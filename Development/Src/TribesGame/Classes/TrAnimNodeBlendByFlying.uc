/**
 * Blends based on flying direction.
 */

class TrAnimNodeBlendByFlying extends TrAnimNodeBlendList
    native;

enum EFlyDirTypes
{
	FLY_Forward,
	FLY_Back,
	FLY_Left,
	FLY_Right,
	FLY_Up,
	FLY_Down,
	FLY_UpMidair,
	FLY_None
};

/** Holds the last used direction */
var const EFlyDirTypes  LastDirection;

/** TrPawn owner */
var transient TrPawn	m_TrPawn;

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
   LastDirection=FLY_None
   bPlayActiveChild=True
   Children(0)=(Name="Forward")
   Children(1)=(Name="back")
   Children(2)=(Name="Left")
   Children(3)=(Name="Right")
   Children(4)=(Name="Up")
   Children(5)=(Name="Down",Weight=1.000000)
   Children(6)=(Name="UpMidair")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByFlying"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
