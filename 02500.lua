function Lua_FN_119366()	--吟遊詩人 阿若特
	local StringTable={[1]="[SC_Z21_FN_NPCSTRING_02]";
				[2]="[SC_Z21_FN_NPCSTRING_03]";
				[3]="[SC_Z21_FN_NPCSTRING_04]";
				[4]="[SC_Z21_FN_NPCSTRING_05]";
				[5]="[SC_Z21_FN_NPCSTRING_06]";
				[6]="[SC_Z21_FN_NPCSTRING_07]";
				[7]="[SC_Z21_FN_NPCSTRING_08]";
				[8]="[SC_Z21_FN_NPCSTRING_09]";}
	BeginPlot(OwnerID(), "LuaYU_PlayMusic_2", 0)
	while TRUE do
		for i=1,8 do
			Sleep(60)
			NPCSay( OwnerID(), StringTable[i] )
		end
		Sleep(250)
	end
end

function Lua_FN_119366_talk()	--吟遊詩人 阿若特 對話
	SetSpeakDetail(OwnerID(), "[SC_Z21_FN_NPCSTRING_11]")
end

function Lua_FN_119368_talk()	--偽裝的反抗軍 昂格沙特
	SetSpeakDetail(OwnerID(), "[SC_Z21_FN_NPCSTRING_12]")
end

function Lua_FN_119378()	--王國宣傳人員 波莫夏
	local StringTable={[1]="[SC_Z21_FN_NPCSTRING_13_1]";
				[2]="[SC_Z21_FN_NPCSTRING_13_2]";
				[3]="[SC_Z21_FN_NPCSTRING_13_3]";
				[4]="[SC_Z21_FN_NPCSTRING_13_4]" }
	Sleep(30)
	for i=1,2 do
		for j=1,4 do
			NPCSay( OwnerID(), StringTable[j] )
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
			Sleep(35)
		end
		Sleep(85)
	end
end

function Lua_FN_119372()	--女孩 秘兒
	MoveToFlagEnabled( OwnerID(), FALSE )
	Sleep(10)
	MoveToFlagEnabled( OwnerID(), TRUE )
end

function Lua_FN_cat()
	local girl = LuaFunc_createObjByObj(110009, OwnerID())
	SetModeEx( OwnerID() , EM_SetModeType_Mark , FALSE )
	SetModeEx( girl  , EM_SetModeType_Mark , FALSE )
	SetFollow( girl, OwnerID() )
	--
	BeginPlot( girl, "Lua_FN_FollowCatGirl", 0 )
end

function Lua_FN_FollowCatGirl()	--追貓小女孩
	while TRUE do
		Sleep(150)
		NPCSay( OwnerID(), "[SC_Z21_FN_NPCSTRING_01]" )
	end	
end

function Lua_FN_GuardString()	--守衛的一般對話
	local PID = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	
	if PID == 1 then
		SetSpeakDetail(OwnerID(), "[SC_Z21_FN_NPCSTRING_10_1]")
	elseif PID ==2 then
		SetSpeakDetail(OwnerID(), "[SC_Z21_FN_NPCSTRING_10_2]")
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_FN_NPCSTRING_GUARD]")
	end
end
------------------------------------------------------------------------------
function Lua_FN_HideNPC()
	SetModeEx(  OwnerID(), EM_SetModeType_Show, FALSE )
end

function Lua_FN_ShowNPC()
	SetModeEx(  OwnerID(), EM_SetModeType_Show, TRUE )
end

function Lua_FN_NPC_ShortTalk()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
end
