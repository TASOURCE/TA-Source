class GFxTrPage_ClanTagChange extends GFxTrPage_VendorTable;

var int PopupNum;
var int EntryNum;
var int ConfirmNum;
var int CurrencyNum;

var int GPPrice;
var int XPPrice;
var int ChangeItem;
var int RemoveItem;

var localized string ChangePopupBody;
var localized string RemovePopupBody;
var localized string ChangePopupTitle;
var localized string RemovePopupTitle;

function FillData(GFxObject DataList)
{
    if (User.NeedsToSeeClanTags())
    {
        User.SeenClanTags();
    }

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (!HaveClanTag())
    {
        if (PageActions[ActionIndex].ActionNumber == ChangeItem)
        {
            obj.SetString("itemTitle", Strings.AddClanTag);
        }
        else if (PageActions[ActionIndex].ActionNumber == RemoveItem)
        {
            obj.SetFloat("bLocked", 1);
        }
    }
    else
    {
        obj.SetFloat("bLocked", 0);
    }

    return obj;
}

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
    if (PageActions[ActionIndex].ActionNumber == RemoveItem)
    {
        if (!HaveClanTag())
        {
            return 0;
        }
    }

    SelectedVendorItemId = PageActions[ActionIndex].ActionNumber;

    PopupNum = EntryNum;
    QueuePopup();

    return 0;
}

function bool CheckPricing(GFxObject DataList)
{
    if (Pages.FocusIndex == 1)
    {
        return false;
    }

    return super.CheckPricing(DataList);
}

function PopupData(GFxObject Obj)
{
    local string itemName;
    local string itemDesc;
    local string ribbonDesc;

    if (PopupNum == EntryNum)
    {
        if (SelectedVendorItemId == ChangeItem)
        {
            Obj.SetFloat("type", 2);
            Obj.SetString("popupTitle", ChangePopupTitle);
            Obj.SetString("popupBody", ChangePopupBody);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetString("buttonLabel3", Strings.cancel);   
            Obj.SetFloat("enterKeyIndex", 1);
        }
        else if (SelectedVendorItemId == RemoveItem)
        {
            Obj.SetFloat("type", 0);
            Obj.SetString("popupTitle", RemovePopupTitle);
            Obj.SetString("popupBody", RemovePopupBody);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetString("buttonLabel3", Strings.cancel);   
            Obj.SetFloat("enterKeyIndex", 1);
        }
    }
    else if (PopupNum == CurrencyNum)
    {
        EquipInterface.GetVendorItemPrice(vendorId,SelectedVendorItemId, 0, GPPrice);
        EquipInterface.GetVendorItemPrice(vendorId,SelectedVendorItemId, 1, XPPrice);
        EquipInterface.GetVendorItemInfo(vendorId, SelectedVendorItemId, itemName, itemDesc, ribbonDesc);

        if (GPPrice > 0 && XPPrice > 0)
        {
            Obj.SetString("popupTitle", Caps(itemName));
            Obj.SetFloat("type", 1);
            Obj.SetString("orLabel", Strings.Or);
            Obj.SetString("goldCopy", Strings.Use@Strings.Gold);
            Obj.SetString("goldCost", string(GPPrice));
            Obj.SetString("xpCopy", Strings.Use@Strings.XP);
            Obj.SetString("xpCost", string(XPPrice));
            Obj.SetString("buttonLabel2", Strings.Cancel);
            Obj.SetFloat("enterKeyIndex", -1);

            return;
        }

        PopupNum = ConfirmNum;
    
        if (GPPrice > 0)
        {
            PurchasingCurrency = 0;
        }
        else if (XPPrice > 0)
        {
            PurchasingCurrency = 1;
        }           
    }
    
    if (PopupNum == ConfirmNum)
    {
        if (SelectedVendorItemId == ChangeItem)
        {
            EquipInterface.GetVendorItemInfo(vendorId, SelectedVendorItemId, itemName, itemDesc, ribbonDesc);

            Obj.SetFloat("type", 0);
            Obj.SetString("popupTitle", Strings.Confirm@Strings.Purchase);
            Obj.SetString("buttonLabel2", Strings.Purchase);
            Obj.SetString("buttonLabel3", Strings.Cancel);
            Obj.SetFloat("enterKeyIndex", 1);       

            if (PurchasingCurrency > 0)
            {
                Obj.SetString("popupBody", Strings.ChangeClanTagTo@"'["$UserInputString$"]'"@Strings.TrFor@XPPrice@Strings.XP$"?");
            }
            else
            {
                Obj.SetString("popupBody", Strings.ChangeClanTagTo@"'["$UserInputString$"]'"@Strings.TrFor@GPPrice@Strings.Gold$"?");
            }
        }
        else
        {
            Obj.SetFloat("type", 0);
            Obj.SetString("popupTitle", RemovePopupTitle);
            Obj.SetString("popupBody", RemovePopupBody);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetString("buttonLabel3", Strings.cancel);   
            Obj.SetFloat("enterKeyIndex", 1);
        }
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (PopupNum == EntryNum)
    {
        PopupNum = 0;

        if (Action == 1)
        {
            if (SelectedVendorItemId == ChangeItem)
            {
                if (TextInput == "")
                {
                    PlayerNameNotAllowed(false);
                    UserInputString = "";
                }
                else
                {
                    UserInputString = TextInput;
                    PopupNum = CurrencyNum;
                    QueuePopup();
                }
            }
            else if (SelectedVendorItemId == RemoveItem)
            {
                EquipInterface.RequestPurchaseGeneral(VendorId, SelectedVendorItemId, PurchasingCurrency, "");
            }
        }
    }
    else if (PopupNum == CurrencyNum)
    {
        if (Action == 3)
        {
            PopupNum = ConfirmNum;
            PurchasingCurrency = 0;
            QueuePopup();
        }
        else if (Action == 4)
        {
            PopupNum = ConfirmNum;
            PurchasingCurrency = 1;
            QueuePopup();
        }
        else
        {
            PopupNum = 0;
        }
    }
    else if (PopupNum == ConfirmNum)
    {
        PopupNum = 0;

        if (Action == 1)
        {
            EquipInterface.RequestPurchaseGeneral(VendorId, SelectedVendorItemId, PurchasingCurrency, UserInputString);
        }
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
   ConfirmNum=1
   CurrencyNum=2
   ChangeItem=9425
   RemoveItem=9426
   ChangePopupBody="Please enter a new tag that is at most 4 characters."
   RemovePopupBody="Are you sure you want to remove your clan tag?"
   ChangePopupTitle="CHANGE CLAN TAG"
   RemovePopupTitle="REMOVE CLAN TAG"
   VendorId=545
   DollMeshId=27
   DescriptionLabel="Your clan tag will prefix your name wherever you may go."
   PageLabel="CHANGE CLAN TAG"
   Name="Default__GFxTrPage_ClanTagChange"
   ObjectArchetype=GFxTrPage_VendorTable'TribesGame.Default__GFxTrPage_VendorTable'
}
