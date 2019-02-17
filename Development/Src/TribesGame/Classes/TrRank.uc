class TrRank extends Object
    abstract;

/** Rank number for quick lookup */
var int Rank;

/** Index for the icon to use for this rank */
var int IconIndex;

/** Experience required to have attained this rank */
var int RequiredXP;

/** Name for this rank */
var localized string FriendlyName;

defaultproperties
{
   Name="Default__TrRank"
   ObjectArchetype=Object'Core.Default__Object'
}
