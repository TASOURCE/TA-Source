class GFxTrFront_View extends GFxUIView
    dependsOn(Settings);
/* DEPRECATED
`include(TrOnlineConstants.uci)

var GFxTrFront  MenuManager;        // Reference to the manager which drives the front end.
var name        ViewName;           // A unique name for this view which can be used to discern it from others.


/** Configures the view when it is first loaded. */
function OnViewLoaded();

/** 
 *  Update the view.  
 *  Called whenever the view becomes the topmost view on the view stack. 
 */
function OnTopMostView(optional bool bPlayOpenAnimation = false)
{
	DisableSubComponents(false);  
    
	if (bPlayOpenAnimation)
    {        
        PlayOpenAnimation();
    }       

    if (MenuManager != none)
    {
        MenuManager.SetEscapeDelegate(none);
        MenuManager.SetEscapeDelegate(OnEscapeKeyPress);   
    }  
}

///////////////////////////////////////////////////////////////////////////////
/** Fired when a view is pushed on to the stack. */
function OnViewActivated()
{
    Advance(0);
    ASonActivated();
}

/** Fired when a view is popped from the stack. */
function OnViewClosed()
{
    DisableSubComponents(true);
}

/** 
 *  Enable/disable sub-components of the view. 
 *  Because almost everything in the menu takes focus on rollOver, this is necessary to avoid 
 *  undesirable focus changes when screens are tweened in and out. This could and should be replaced
 *  using a proper ActionScript extension once one is implemented.
 */
function DisableSubComponents(bool bDisableComponents);

/** Plays the view's open animation. */
function PlayOpenAnimation();

/** Plays the view's close animation. */
function PlayCloseAnimation();

/**
 * User has selected "Back". Pop a view and move on.
 */
function Select_Back(GFxClikWidget.EventData ev)
{
    MoveBackImpl();
}

/** Moves the user backward on the view stack by popping the topmost view / dialog. */
function MoveBackImpl()
{
    if (MenuManager != none)
    {
//        PlayCloseAnimation();
//        MenuManager.PopView();        
    }
}

/** This method is tied to Escape / Back user input. Can be overriden by sub-classes for custom behavior per view. */
function OnEscapeKeyPress()
{
    MoveBackImpl(); 
}

/** Callback when a CLIK widget with enableInitCallback set to TRUE is initialized.  Returns TRUE if the widget was handled, FALSE if not. */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget) 
{
    return false;
}

///////////////////////////////////////////////////////////////////////////////
// Action script wrappers
final function AsShowCursor(bool bShowCursor)
{
    ActionScriptVoid("showCursor");
}

function ASonActivated() 
{     
    ActionScriptVoid("onActivated"); 
}

function ASonDeactivated() 
{     
    ActionScriptVoid("onDeactivated"); 
}

function noticeViewReady();     // Called when the view is set to take input.
function noticeViewClosed();    // Called when the view has completed its closing.

///////////////////////////////////////////////////////////////////////////////
defaultproperties
{
    
}*/

defaultproperties
{
   Name="Default__GFxTrFront_View"
   ObjectArchetype=GFxUIView'UTGame.Default__GFxUIView'
}
