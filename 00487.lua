---------------騙子的請求（在神像祭壇上掛初始劇情判斷玩家是否進入該範圍）-------------------------------------------------------
function LuaI_420604_range()
	SetPlot(OwnerID(),"Range","LuaS_420604_flag",180);
end
---------------若是玩家進入範圍則執行該段--------------------------------------
function LuaS_420604_flag()
	if(CheckAcceptQuest(OwnerID(), 420604) == true )then --改成檢查任務，避免放棄任務的人也可拿到旗標
		if(CheckFlag(OwnerID(), 540798) == false)then
			SetFlag(OwnerID(), 540798, 1);
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420604_0"), 0 ); --給個訊息讓玩家知道他調查完成
		end
	end
end
-----------------點擊昂貴的符文後觸發--------------------------------
function LuaS_420605_range()
	local m=LuaFunc_SearchNPCbyOrgID( OwnerID(), 100075,30, 1);
	if m[0]== -1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420605_0"), 0 ); --/*你必須在遺跡守護者附近使用它！。
		return false
	else
-----------若是偵測到附近有守護者執行該段-----------------------
		if CountBodyItem( OwnerID(), 201276 ) >0 then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420605_1"), 0 ); --/*去找吉納再拿張羊皮紙！
			return false
		end
	end
end

function LuaS_420605_Effect()
		if CountBodyItem( OwnerID(), 201276 ) >0 then
			DelBodyItem( OwnerID(), 201276,1);
			GiveBodyItem( OwnerID(), 201277, 1 );
		end
end
----------------------------------------------------------------------------------------
function LuaQ_420605_Complete()
	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( OwnerID() , False)
	LuaFunc_MoveToFlag( OwnerID(), 780016 , 1 ,0 )
	local tar = LuaFunc_SearchNPCbyOrgID(OwnerID(),110217,60,0);
	PlayMotion( tar , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	SAY( tar , GetString("SAY_420605_1") )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	SAY( OwnerID() , GetString("SAY_420605_2"))
	sleep(30)
	PlayMotion( tar , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	SAY( tar , GetString("SAY_420605_3"))
	sleep(10)
	SAY( tar , GetString("SAY_420605_6"))
	sleep(20)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL )
	SAY( OwnerID() , GetString("SAY_420605_4"))
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	SAY( OwnerID() , GetString("SAY_420605_5"))
	sleep( 30 )
	LuaFunc_MoveToFlag( OwnerID(), 780016 , 0 ,0 )
	MoveToFlagEnabled( OwnerID() , True)
	DisableQuest( OwnerID() , false )
end