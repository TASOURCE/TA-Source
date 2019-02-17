class GFxTrPage_NameChange extends GFxTrPage_VendorTable;

var localized string NamePopupTitle;
var bool   bWaitingForNewNameInput;

function GFxObject FillDescription(GFxObject DataList)
{
    local GFxObject obj;
    obj = CreateObject("Object");    
    obj.SetString("descTitle", Caps(PageLabel));
    obj.SetString("description", Caps(DescriptionLabel));
    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    SelectedVendorItemId = PageActions[ActionIndex].ActionNumber;
    bWaitingForNewNameInput = true;
    QueuePopup();  

    return 0;  
}

function PopupData(GFxObject Obj)
{
    local bool bHasGoldCost;
    local int GPAmount;
    local string itemName;
    local string itemDesc;
    local string ribbonDesc;

    //TAG=CURRENTLY_GOLD_ONLY
    if(bWaitingForCurrencyPopup)
    {
        bHasGoldCost = EquipInterface.GetVendorItemPrice(vendorId,SelectedVendorItemId, 0, GPAmount);
        EquipInterface.GetVendorItemInfo(vendorId, SelectedVendorItemId, itemName, itemDesc, ribbonDesc);
        if(!bHasGoldCost)
            bWaitingForCurrencyPopup = false; //hack

        Obj.SetFloat("type", 0);
        Obj.SetString("popupTitle", Caps(itemName));
        Obj.SetString("popupBody", Strings.ChangeNameTo@"'"$UserInputString$"'"@Strings.TrFor@GPAmount@Strings.Gold$"?");
        //Obj.SetString("buttonLabel1", "ADD GOLD");
        Obj.SetString("buttonLabel2", Strings.Purchase);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);             
    }
    else if(bWaitingForNewNameInput)
    {
        Obj.SetFloat("type", 2);
        Obj.SetString("popupTitle", NamePopupTitle);
        Obj.SetString("popupBody", NameRulesMessage);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.cancel);   
        Obj.SetFloat("enterKeyIndex", 1);
    }    
}

function PopupComplete(int Action, string TextInput)
{
    if (bWaitingForNewNameInput)
    {
        bWaitingForNewNameInput = false;

        if (Action == 1)
        {
            if (TextInput == "")
            {
                PlayerNameNotAllowed(false);
                UserInputString = "";
            }
            else
            {
                UserInputString = TextInput;
                bWaitingForCurrencyPopup = true;
                QueuePopup();
            }
        }
        else
        {
            
        }
    }
    else 
    {   
        Super.PopupComplete(Action,TextInput);
    }
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_ChangeName);
}

defaultproperties
{
   NamePopupTitle="ENTER NEW NAME"
   VendorId=512
   DollMeshId=27
   DescriptionLabel="If you change your name, no other player will be able to claim your old name for 15 days.  However, you will be able to change back during that time."
   PageLabel="CHANGE GAMER NAME"
   Name="Default__GFxTrPage_NameChange"
   ObjectArchetype=GFxTrPage_VendorTable'TribesGame.Default__GFxTrPage_VendorTable'
}
