class TrHelpTextManager_Training extends TrHelpTextManager;

/** On-screen help text. */
var localized string m_TrainingHelpTextExample1;
var localized string m_TrainingHelpTextExample2;
var localized string m_TrainingHelpTextSkiMessage1;
var localized string m_TrainingHelpTextSkiMessage2;
var localized string m_TrainingHelpTextSkiMessage3;
var localized string m_TrainingHelpTextSkiMessage4;
var localized string m_TrainingHelpTextSkiMessage5;
var localized string m_TrainingHelpTextSkiAdvMessage1;
var localized string m_TrainingHelpTextSkiAdvMessage2;
var localized string m_TrainingHelpTextSkiAdvMessage3;
var localized string m_TrainingHelpTextSkiAdvMessage4;
var localized string m_TrainingHelpTextSkiAdvMessage5;

/** On-screen help text menu title. */
var localized string m_TrainingHelpTextExample1MenuTitle;
var localized string m_TrainingHelpTextExample2MenuTitle;
var localized string m_TrainingHelpTextSki1MenuTitle;
var localized string m_TrainingHelpTextSki2MenuTitle;
var localized string m_TrainingHelpTextSki3MenuTitle;
var localized string m_TrainingHelpTextSki4MenuTitle;
var localized string m_TrainingHelpTextSki5MenuTitle;
var localized string m_TrainingHelpTextSkiAdv1MenuTitle;
var localized string m_TrainingHelpTextSkiAdv2MenuTitle;
var localized string m_TrainingHelpTextSkiAdv3MenuTitle;
var localized string m_TrainingHelpTextSkiAdv4MenuTitle;
var localized string m_TrainingHelpTextSkiAdv5MenuTitle;

/** List of help texts (make sure any new entries here have corresponding entries for localized strings!) */
enum EHelpTextTrainingType
{
	HelpTextTraining_None,
	HelpTextTraining_Example1,
	HelpTextTraining_Example2,
	HelpTextTraining_Ski1,
	HelpTextTraining_Ski2,
	HelpTextTraining_Ski3,
	HelpTextTraining_Ski4,
	HelpTextTraining_Ski5,
	HelpTextTraining_SkiAdv1,
	HelpTextTraining_SkiAdv2,
	HelpTextTraining_SkiAdv3,
	HelpTextTraining_SkiAdv4,
	HelpTextTraining_SkiAdv5
};

var EHelpTextTrainingType m_CurrentHelpTextTrainingType;

function InitHelpTextManager();
function UpdateTypesToRemoveOnTimers(float DeltaTime);
function bool CheckDestroy()
{
	// Never destroy for training.
	return false;
}
function bool RequestHelpText(EHelpTextType RequestedType)
{
	return false;
}
function RemoveHelpText(EHelpTextType TypeToRemove, optional float Time, optional bool bDoNotSuppress);

/** Display the help text to the player. */
function RequestHelpText_Training(EHelpTextTrainingType RequestedType)
{
	m_CurrentHelpTextTrainingType = RequestedType;
	UpdateHUD();
}

/** Forward help texts to the HUD. */
function UpdateHUD()
{
	local string BodyText, TitleText;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(Owner);

	if( TrPC == none )
	{
		return;
	}

	switch( m_CurrentHelpTextTrainingType )
	{
		case HelpTextTraining_Example1:
			BodyText = m_TrainingHelpTextExample1;
			TitleText = m_TrainingHelpTextExample1MenuTitle;
			break;
		case HelpTextTraining_Example2:
			BodyText = m_TrainingHelpTextExample2;
			TitleText = m_TrainingHelpTextExample2MenuTitle;
			break;
		case HelpTextTraining_Ski1:
			BodyText = m_TrainingHelpTextSkiMessage1;
			TitleText = m_TrainingHelpTextSki1MenuTitle;
			break;
		case HelpTextTraining_Ski2:
			BodyText = m_TrainingHelpTextSkiMessage2;
			TitleText = m_TrainingHelpTextSki2MenuTitle;
			break;
		case HelpTextTraining_Ski3:
			BodyText = m_TrainingHelpTextSkiMessage3;
			TitleText = m_TrainingHelpTextSki3MenuTitle;
			break;
		case HelpTextTraining_Ski4:
			BodyText = m_TrainingHelpTextSkiMessage4;
			TitleText = m_TrainingHelpTextSki4MenuTitle;
			break;
		case HelpTextTraining_Ski5:
			BodyText = m_TrainingHelpTextSkiMessage5;
			TitleText = m_TrainingHelpTextSki5MenuTitle;
			break;
		case HelpTextTraining_SkiAdv1:
			BodyText = m_TrainingHelpTextSkiAdvMessage1;
			TitleText = m_TrainingHelpTextSkiAdv1MenuTitle;
			break;
		case HelpTextTraining_SkiAdv2:
			BodyText = m_TrainingHelpTextSkiAdvMessage2;
			TitleText = m_TrainingHelpTextSkiAdv2MenuTitle;
			break;
		case HelpTextTraining_SkiAdv3:
			BodyText = m_TrainingHelpTextSkiAdvMessage3;
			TitleText = m_TrainingHelpTextSkiAdv3MenuTitle;
			break;
		case HelpTextTraining_SkiAdv4:
			BodyText = m_TrainingHelpTextSkiAdvMessage4;
			TitleText = m_TrainingHelpTextSkiAdv4MenuTitle;
			break;
		case HelpTextTraining_SkiAdv5:
			BodyText = m_TrainingHelpTextSkiAdvMessage5;
			TitleText = m_TrainingHelpTextSkiAdv5MenuTitle;
			break;
		default: // No help text.
			TrHUD(TrPC.myHUD).ClearHelpText();
			return;
	}

	BodyText = FormatText(BodyText);
	TrHUD(TrPC.myHUD).AddToHelpText(TitleText, BodyText, -1, "", "");
}

defaultproperties
{
   m_TrainingHelpTextExample1="You can press @$Suicide@ at any time to respawn and reload."
   m_TrainingHelpTextExample2="This is another test training message."
   m_TrainingHelpTextSkiMessage1="Move forward onto the platform using @$GBA_MoveForward@,@$GBA_Backward@,@$GBA_StrafeLeft@,@$GBA_StrafeRight@."
   m_TrainingHelpTextSkiMessage2="Press @$GBA_ToggleJumpJetpack@ to use your Jetpack and fly up to the highlighted ledge."
   m_TrainingHelpTextSkiMessage3="Press and hold @$GBA_DoSki@ to Ski down the hill."
   m_TrainingHelpTextSkiMessage4="When ready, use @$GBA_ToggleJumpJetpack@ to Jetpack up to the next ledge."
   m_TrainingHelpTextSkiMessage5="Use @$GBA_DoSki@ and @$GBA_ToggleJumpJetpack@ to traverse the course before time runs."
   m_TrainingHelpTextSkiAdvMessage1="Welcome to the Ski Challenge! How high can you jump?"
   m_TrainingHelpTextSkiAdvMessage2="Shoot the targets for bonus points."
   m_TrainingHelpTextSkiAdvMessage3="Hit your peak height as you cross the finish for maximum score."
   m_TrainingHelpTextSkiAdvMessage4="Press @$Suicide@ to restart the course."
   m_TrainingHelpTextSkiAdvMessage5="Can you can beat your best run?"
   m_TrainingHelpTextExample1MenuTitle="Respawn"
   m_TrainingHelpTextExample2MenuTitle="Example 2 Title"
   m_TrainingHelpTextSki1MenuTitle="Movement"
   m_TrainingHelpTextSki2MenuTitle="Jetpack"
   m_TrainingHelpTextSki3MenuTitle="Skiing"
   m_TrainingHelpTextSki4MenuTitle="Jetpack"
   m_TrainingHelpTextSki5MenuTitle="Time Trial"
   Name="Default__TrHelpTextManager_Training"
   ObjectArchetype=TrHelpTextManager'TribesGame.Default__TrHelpTextManager'
}
