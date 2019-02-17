/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTUIDataStore_StringList extends UDKUIDataStore_StringList;

defaultproperties
{
   StringData(0)=(Tag="ServerType",ColumnHeaderText="Match Type",DefaultValueIndex=1,Strings=("LAN","Internet"))
   StringData(1)=(Tag="ServerType360",ColumnHeaderText="Match Type",DefaultValueIndex=1,Strings=("System Link","Player","Ranked"))
   StringData(2)=(Tag="MatchType",ColumnHeaderText="Match Type",DefaultValueIndex=1,Strings=("LAN","Internet"))
   StringData(3)=(Tag="MatchType360",ColumnHeaderText="Match Type",DefaultValueIndex=1,Strings=("System Link","Player","Ranked"))
   StringData(4)=(Tag="BotTeams",ColumnHeaderText="Bot Team",Strings=("Random","Iron Guard","Ronin","Krall","Liandri","Necris"))
   StringData(5)=(Tag="RecordDemo",ColumnHeaderText="Demo Recording",Strings=("No","Yes"))
   StringData(6)=(Tag="PlayerName",ColumnHeaderText="Fullscreen",Strings=("Fullscreen","Windowed"))
   StringData(7)=(ColumnHeaderText="Resolution",Strings=("800x600","960x720","1024x768","1280x720","1600x1200"))
   StringData(8)=(ColumnHeaderText="Button Preset",Strings=("Preset 1","Preset 2","Preset 3"))
   StringData(9)=(ColumnHeaderText="Splitscreen",Strings=("No","Yes"))
   StringData(10)=(ColumnHeaderText="Uniform",Strings=("Facemask","Helmet","Goggles","Torso","Shoulder Pads","Arms","Thighs","Boots"))
   Name="Default__UTUIDataStore_StringList"
   ObjectArchetype=UDKUIDataStore_StringList'UDKBase.Default__UDKUIDataStore_StringList'
}
