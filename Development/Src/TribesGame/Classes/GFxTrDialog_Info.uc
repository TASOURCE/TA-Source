class GFxTrDialog_Info extends GFxTrFront_Dialog;
/* DEPRECATED
/** Fired when a dialog is popped from the stack. */
public function OnViewClosed()
{
    Super.OnViewClosed();
    DisableSubComponents(false);
}

/** 
 *  Update the view.  
 *  Called whenever the view becomes the topmost view on the viewstack. 
 */
function OnTopMostView(optional bool bPlayOpenAnimation = FALSE)
{
    Super.OnTopMostView(bPlayOpenAnimation);
//    MenuManager.SetSelectionFocus( BackBtn );
}

function DisableSubComponents(bool bDisableComponents)
{
    AcceptBtn.SetBool("disabled", bDisableComponents);
    BackBtn.SetBool("disabled", bDisableComponents);
}

public function SetTitle(string Title)
{
    TitleTxt.SetText(Title);
}

public function SetInfo(string Info)
{
    InfoTxt.SetText(Info);
}

public function SetAcceptButtonLabel( string Label )
{
    AcceptBtn.SetString( "label", Label );
}

public function SetBackButtonLabel( string Label )
{
    BackBtn.SetString( "label", Label );
}

function SetAcceptButton_OnPress( delegate<GFxClikWidget.EventListener> EventListener )
{    
    AcceptBtn.RemoveAllEventListeners("CLIK_press");
    AcceptBtn.RemoveAllEventListeners("press");
    AcceptBtn.AddEventListener('CLIK_press', EventListener); 
}

defaultproperties
{

}*/

defaultproperties
{
   Name="Default__GFxTrDialog_Info"
   ObjectArchetype=GFxTrFront_Dialog'TribesGame.Default__GFxTrFront_Dialog'
}
