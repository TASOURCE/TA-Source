class GFxTrPage_Extras extends GFxTrPage;

var int ClaimPromotionAction;
var int CheatCodeAction;
var bool bWaitingForCheatCodePopup;
var bool bWaitingForClaimPromoPopup;
var string C1P1;
var string C1P2;
var string C1P3;
var localized string PromoPopupTitle;

function Initialize()
{
    super.Initialize();

    C1P1="GOTTA"; C1P2="GO"; C1P3="FAST";

    AddActionNumber(ClaimPromotionAction);
    AddActionNumber(CheatCodeAction);
}

function ShowModel()
{
    //local TrEntryPlayerController TrEPC;

    //TrEPC = TrEntryPlayerController(GetPC());
    //TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Login);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionNumber == ClaimPromotionAction)
    {
        bWaitingForClaimPromoPopup = true;
        QueuePopup();
    }
    else if (Action.ActionNumber == CheatCodeAction)
    {
        bWaitingForCheatCodePopup = true;
        QueuePopup();
    }
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForClaimPromoPopup)
    {
        Obj.SetFloat("type", 2);
        Obj.SetString("popupTitle", PromoPopupTitle);
        Obj.SetString("popupBody", "");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);   
        Obj.SetFloat("enterKeyIndex", 1);             
    }    
    else if (bWaitingForCheatCodePopup)
    {
        Obj.SetFloat("type", 2);
        Obj.SetString("popupTitle", Strings.EnterCode$":");
        Obj.SetString("popupBody", "");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);   
        Obj.SetFloat("enterKeyIndex", 1);             
    }    
}

function PopupComplete(int Action, string TextInput)
{
    local string cheat;
    local TrPlayerController TrPC;

    if (bWaitingForClaimPromoPopup)
    {
        bWaitingForClaimPromoPopup = false;        
        
        if (Action == 1) 
        {
            if(TextInput == "")
            {

            }
            else
            {
                TrPC = TrPlayerController(GetPC());
                if(TrPC != None) 
                {   
                    TrPC.ClaimPromotion(TextInput);
                }
            }
        }
    }    
    else if (bWaitingForCheatCodePopup)
    {
        bWaitingForClaimPromoPopup = false;        
        
        if (Action == 1) 
        {
            cheat = C1P1$C1P2$C1P3;

            if (TextInput == cheat)
            {
                UpdateStatus(Strings.CodeAccepted);
                MatchSummaryScene.bUseSNS=true;
                PlayerSummaryScene.bUseSNS=true;
            }
        }
    }  
}

defaultproperties
{
   ClaimPromotionAction=1
   CheatCodeAction=2
   PromoPopupTitle="ENTER PROMOTION CODE"
   PageLabel="EXTRAS"
   OptionTitles(0)="REDEEM PROMOTION"
   OptionTitles(1)="ENTER SECRET CODE"
   Name="Default__GFxTrPage_Extras"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
