/**
 * Structure defining all available class types. Update whenever a new class is added
 */

class TrFamilyInfoList extends Object
    abstract;

var array<string> ClassList;

defaultproperties
{
   ClassList(0)="TrFamilyInfo_Light_Pathfinder"
   ClassList(1)="TrFamilyInfo_Light_Sentinel"
   ClassList(2)="TrFamilyInfo_Light_Infiltrator"
   ClassList(3)="TrFamilyInfo_Medium_Soldier"
   ClassList(4)="TrFamilyInfo_Medium_Raider"
   ClassList(5)="TrFamilyInfo_Medium_Technician"
   ClassList(6)="TrFamilyInfo_Heavy_Juggernaught"
   ClassList(7)="TrFamilyInfo_Heavy_Doombringer"
   ClassList(8)="TrFamilyInfo_Heavy_Brute"
   Name="Default__TrFamilyInfoList"
   ObjectArchetype=Object'Core.Default__Object'
}
