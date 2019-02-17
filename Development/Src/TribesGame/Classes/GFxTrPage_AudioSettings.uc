class GFxTrPage_AudioSettings extends GFxTrPage;

var int  AudioIndex;
var bool bWaitingForAudioEntry;

function Initialize()
{
    local int i;

    for (i = ESL_AUDIO_START+1; i < ESL_AUDIO_END; i++)
    {
        AddActionNumber(i);
    }
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionIndex == GoBack)
    {
        super.SpecialAction(Action);
    }
	else if (Action.ActionNumber == ESL_BASSBOOST)
	{
		if (SettingsManager.AudioSettings.GetCurrentSettingValue(ESL_BASSBOOST) > 0)
		{
			SettingsManager.AudioSettings.SetBassBoost(false);
		}
		else
		{
			SettingsManager.AudioSettings.SetBassBoost(true);
		}

		RefreshButtons();
	}
    else
    {
        AudioIndex = Action.ActionNumber;
        bWaitingForAudioEntry = true;
        QueuePopup();
    }    
}

function GFxObject FillOption(int ActionIndex)
{
    local int val;
    local GFxObject obj;

	if (PageActions[ActionIndex].ActionNumber == ESL_BASSBOOST)
	{
		obj = super.FillOption(ActionIndex);

		if (SettingsManager.AudioSettings.GetCurrentSettingValue(ESL_BASSBOOST) > 0)
		{
            obj.SetString("itemRibbonLabel", Strings.Enabled);
            obj.SetString("itemSubTitle", "");
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
		}
		else
		{
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", Strings.Disabled);
            obj.SetFloat("hasRibbon", 0);
		}
	}
	else
	{
		obj = CreateObject("Object");
		obj.SetFloat("actionID", ActionIndex);

		val = SettingsManager.AudioSettings.GetCurrentSettingValue(ESettingsList(PageActions[ActionIndex].ActionNumber));

		SetSubTitle(ActionIndex, val, obj);

		obj.SetString("itemTitle", OptionTitles[ActionIndex]);
	}

    return obj;
}

function SetSubTitle(int Index, int Val, GFxObject Obj)
{
    if (Val > 0)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 1);
        obj.SetString("itemRibbonLabel", string(Val));
        obj.SetString("itemSubTitle", "");
    }
    else
    {
        obj.SetFloat("hasRibbon", 0);
        obj.SetString("itemRibbonLabel", "");
        obj.SetString("itemSubTitle", Strings.Off);
    }
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForAudioEntry)
    {
        Obj.SetString("popupTitle", Strings.SetAudioLevel@"(0-100)");
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 2);
    }
}

function PopupComplete(int Action, string TextInput)
{
    local int newVal;

    newVal = int(TextInput);

    if (bWaitingForAudioEntry)
    {
        bWaitingForAudioEntry = false;

        if (Action == 1)
        {
            if (newVal < 0)   
            {
                newVal = 0;
            }
            else if (newVal > 100)
            {
                newVal = 100;
            }

            SettingsManager.AudioSettings.ApplyAudioSetting(AudioIndex, newVal);
        
            RefreshButtons();
        }
    }
}

defaultproperties
{
   PageLabel="AUDIO SETTINGS"
   OptionTitles(0)="MASTER VOLUME"
   OptionTitles(1)="EFFECTS VOLUME"
   OptionTitles(2)="MUSIC VOLUME"
   OptionTitles(3)="VGS VOLUME"
   OptionTitles(4)="ANNOUNCER VOLUME"
   OptionTitles(5)="HEADPHONE BASS BOOST"
   Name="Default__GFxTrPage_AudioSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
