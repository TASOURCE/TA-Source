class TrDataStore_GameSearch extends UTDataStore_GameSearchDM
	config(UI);

defaultproperties
{
   HistoryGameSearchDataStoreClass=Class'UTGame.UTDataStore_GameSearchHistory'
   GameSearchCfgList(0)=(GameSearchClass=Class'TribesGame.TrGameSearchTrCTF',DefaultGameSettingsClass=Class'TribesGame.TrGameSettingsTrCTF',SearchResultsProviderClass=Class'UTGame.UTUIDataProvider_SearchResult',SearchName="TrGameSearchCTF")
   GameSearchCfgList(1)=(GameSearchClass=Class'TribesGame.TrGameSearchTrTDM',DefaultGameSettingsClass=Class'TribesGame.TrGameSettingsTrTDM',SearchResultsProviderClass=Class'UTGame.UTUIDataProvider_SearchResult',SearchName="TrGameSearchTDM")
   GameSearchCfgList(2)=(GameSearchClass=Class'TribesGame.TrGameSearchTrRabbit',DefaultGameSettingsClass=Class'TribesGame.TrGameSettingsTrRabbit',SearchResultsProviderClass=Class'UTGame.UTUIDataProvider_SearchResult',SearchName="TrGameSearchRabbit")
   Tag="UTGameSearch"
   Name="Default__TrDataStore_GameSearch"
   ObjectArchetype=UTDataStore_GameSearchDM'UTGame.Default__UTDataStore_GameSearchDM'
}
