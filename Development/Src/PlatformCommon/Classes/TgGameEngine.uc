class TgGameEngine extends GameEngine
    native
    transient;

// Add these back in when needed.
//`include(..\FrameWork\FrameCommon\MarshalFunctions.h)
//`include(..\FrameWork\FrameCommon\MarshalTokens.h)

struct native MAR_EVENT
{
    var bool    bSuccess;
    var int     nFunction;
    var QWORD   qwId;
    var QWORD   qwInfo;
    var int     nStmMsgId;
    var String  fsMessage;
    var const pointer pMarshal{class CMarshal};

	structdefaultproperties
	{
		bSuccess = true;
	}

	structcpptext
	{
                    FMAR_EVENT(void)            { appMemzero(this, sizeof(FMAR_EVENT)); bSuccess = true; }
                    FMAR_EVENT(EEventParm)      { appMemzero(this, sizeof(FMAR_EVENT)); bSuccess = true; };
                    FMAR_EVENT(CMarshal* pMar)  { appMemzero(this, sizeof(FMAR_EVENT)); bSuccess = true; pMarshal = pMar; }

        MFUNCTION   GetFunction(void)           { return (pMarshal ? pMarshal->GetFunction() : MFUNC_UNKNOWN); }
        FString     GetMessage(void);
        PCWSTR      GetMessage(PWSTR pwzBuffer, DWORD dwMaxCount);
        void        SetMessage(MFIELD_TOKEN eMsgToken);
        void        SetMessage(int nStmMsgId);
	}
};

var array<delegate<OnMarshalEvent> > MarshalEventDelegates;

var const native pointer pOutgoingMarshal{class CMarshal};              // Marshal that can be setup in UC or code and then sent out.
var const native pointer pEventMarshal{class CMarshal};                 // Current marshal being dispatched to delegate(s).

///////////////////////////////////////
// These calls work against the root of the pending outgoing marshal being dispatched.
// The send calls send the outgoing marshal then clear it.
native function bool SetFunction(int nFunction);
native function bool SetFieldInt(int nToken, int IntValue);
native function bool SetFieldFloat(int nToken, float FloatValue);
native function bool SetFieldString(int nToken, String StrValue);

native function      ClearMarshal();
native function      SendMarshal(UniqueNetId qwPlayerId, bool bLowPriority);
native function      SendMarshalAll(bool bLowPriority);

///////////////////////////////////////
// These calls work against the root of the current marshal being dispatched.
native function bool GetFieldInt(int nToken, out int IntValue);
native function bool GetFieldFloat(int nToken, out float FloatValue);
native function bool GetFieldString(int nToken, out String StrValue);

///////////////////////////////////////
delegate OnMarshalEvent(pointer pMarEvent{FMAR_EVENT});

native function      AddMarshalEventDelegate(delegate<OnMarshalEvent> MarshalEventDelegate);
native function      ClearMarshalEventDelegate(delegate<OnMarshalEvent> MarshalEventDelegate);

///////////////////////////////////////
native function      SendCtrlRequest(string fsRequest);
native function      SendGameRequest(string fsRequest);

native function bool HandlePlayerCommandInput(string fsCommand, optional PlayerController PC);

///////////////////////////////////////
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TgGameEngine"
   ObjectArchetype=GameEngine'Engine.Default__GameEngine'
}
