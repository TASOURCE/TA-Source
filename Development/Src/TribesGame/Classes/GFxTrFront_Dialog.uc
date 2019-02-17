class GFxTrFront_Dialog extends GFxTrFront_View;
/* DEPRECATED

var GFxObject DialogMC;         // Reference to the dialog MovieClip which contains the dialog animations.
var GFxObject TitleTxt;         // Reference to the title text at the bottom within the footer.
var GFxObject InfoTxt;          // Reference to the info/description text area.

var GFxClikWidget BackBtn;      // Reference to Back button, primarily for returning to previous screen.
var GFxClikWidget AcceptBtn;    // Reference to the Accept button, clicked when the user accepts the option presented.

delegate AcceptDelegate(GFxClikWidget.EventData ev);

// Fired when a dialog is popped from the stack.
function OnViewClosed();

// Mutator for enable/disable sub-components of the dialog.
function DisableSubComponents(bool bDisableComponents);

/** 
 *  Update the view.  
 *  Called whenever the view becomes the topmost view on the viewstack. 
 */
function OnTopMostView(optional bool bPlayOpenAnimation = FALSE)
{
    Super.OnTopMostView(bPlayOpenAnimation);       
}

/** Plays the view's open animation. */
function PlayOpenAnimation();

/** Plays the view's close animation. */
function PlayCloseAnimation();

private function SetBackButton(GFxObject InBackButton) 
{     
    ActionScriptVoid("setBackBtn"); 
}

function SetBackButton_OnPress(delegate<GFxClikWidget.EventListener> EventListener)
{    
    BackBtn.RemoveAllEventListeners("CLIK_press");
    BackBtn.RemoveAllEventListeners("press");
    BackBtn.AddEventListener('CLIK_press', EventListener);
}

/**
 * User has selected "Back".
 * Pop the dialog from the view stack. 
 */
function Select_Back(GFxClikWidget.EventData ev)
{    
    if (MenuManager != none)
    {
//        PlayCloseAnimation();
//        MenuManager.PopView();        
    }
}

/** Callback when a CLIK widget with enableInitCallback set to TRUE is initialized.  Returns TRUE if the widget was handled, FALSE if not. */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget) 
{
    local bool bResult;

    //`log("Dialog: WidgetInitialized():: WidgetName: " @ WidgetName @ " : " @ WidgetPath @ " : " @ Widget);
    switch(WidgetName)
    {
    // Dialgo's title.
    case ('popup_title'):    
        if (TitleTxt == none)
        {
            TitleTxt = Widget.GetObject("textField");   
            bResult = true;
        }            
        break;

    // Dialog's info / message textField.
    case ('popup_info'): 
        if (InfoTxt == none)
        {
            InfoTxt = Widget.GetObject("textField");   
            bResult = true;
        }
        break;

    // Dialog's "Back" button
    case ('back'):   
        BackBtn = GFxClikWidget(Widget.GetObject("btn", class'GFxClikWidget'));
        SetBackButton_OnPress(Select_Back);
        BackBtn.SetString("label", "BACK");
        SetBackButton(BackBtn);                                  
        bResult = true;                        
        break;

    // @todo sf: fix naming here. accept != exit.
    // Dialog's "Exit" button.
    case ('exit'):
        if (AcceptBtn == none)
        {
            AcceptBtn = GFxClikWidget(Widget.GetObject("btn", class'GFxClikWidget'));         
            bResult = true;
        }
        break;

    // Dialog itself. 
    case ('popup'):
        if (DialogMC == none)
        {
            DialogMC = Widget;
            bResult = true;
        }
        break;

    default:
        return (true);
    }

    return bResult;
}

defaultproperties
{
	// General
	SubWidgetBindings.Add((WidgetName="list",WidgetClass=class'GFxClikWidget'))
	SubWidgetBindings.Add((WidgetName="back",WidgetClass=class'GFxClikWidget'))
}*/

defaultproperties
{
   Name="Default__GFxTrFront_Dialog"
   ObjectArchetype=GFxTrFront_View'TribesGame.Default__GFxTrFront_View'
}
