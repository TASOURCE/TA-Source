class GFxTrDialog_Error extends GFxTrFront_Dialog;
/* DEPRECATED
function OnTopMostView(optional bool bPlayOpenAnimation = FALSE)
{
    Super.OnTopMostView(bPlayOpenAnimation);   
//    MenuManager.SetSelectionFocus(BackBtn);
}

function SetTitle(string Title)
{
    TitleTxt.SetText(Title);
}

function SetInfo(string Info)
{
    InfoTxt.SetText(Info);
}

function SetButtonLabel(string ButtonLabel)
{
    BackBtn.SetString("label", ButtonLabel);
}

/** Fired when a dialog is popped from the stack. */
function OnViewClosed()
{
    Super.OnViewClosed();
    DisableSubComponents(false);
}

/** Mutator for enable/disable sub-components of the view. */
function DisableSubComponents(bool bDisableComponents)
{
    BackBtn.SetBool("disabled", bDisableComponents);
}


defaultproperties
{

}*/

defaultproperties
{
   Name="Default__GFxTrDialog_Error"
   ObjectArchetype=GFxTrFront_Dialog'TribesGame.Default__GFxTrFront_Dialog'
}
