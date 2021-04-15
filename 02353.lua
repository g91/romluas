function LuaS_424071()
	if	CountBodyItem(OwnerID(),209275) > 0	then
		return	true
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424071_false]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424071_false]" ,  "0xFFFFFF00" )	
		return false
	end

end

function LuaS_424071_1()
	DelBodyItem(OwnerID(),209275,1)
	return	true	
end

function LuaS_424071_Speak()	--阿信包的函式 可判斷多人劇情
	local T_ID = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家	
	local Total = CountBodyItem(O_ID,209275) + CountBodyItem(O_ID,209276)
	LoadQuestOption( O_ID )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	if CheckAcceptQuest( O_ID, 424071 ) == true and Total < 5 then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_424071_WantBag]", "Lua_424071_Speak_1",0) --我準備好了。
	end
end

function Lua_424071_Speak_1()
	local T_ID = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家	
	local Total = 5 - CountBodyItem(O_ID,209275) - CountBodyItem(O_ID,209276)
	SetSpeakDetail( O_ID, "[SC_424071_GIVEBAG]" ) --請稍等我一下。
	GiveBodyItem(O_ID,209275,Total)
end

function LuaS_424075()	--阿信包的函式 可判斷多人劇情
	local T_ID = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家	
	LoadQuestOption( O_ID )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	if CheckAcceptQuest( O_ID, 424075 ) == true and CheckFlag( OwnerID(), 544877 ) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_424075_1]", "Lua_424075_1",0) --我準備好了。
	end
		if	CheckCompleteQuest(O_ID,424087) == true	then
		AddSpeakOption( O_ID, T_ID, "[SC_424088_01]", "LuaS_424087_GotoZone_7_start",0) --我準備好了。		
	end
end

function Lua_424075_1()
	local T_ID = TargetID() 
	local O_ID = OwnerID() 
	if	ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_424075_0]" ) --請稍等我一下。
	else
		CloseSpeak( OwnerID() )	--關閉所有對話視窗
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
		BeginPlot( T_ID, "Lua_424075_2", 0 )	--呼叫下一段函式
	end
end

function Lua_424075_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424075				--任務編號 (只要改動此編號)
	local FinishFlagID = 544877			--完成任務獲得的旗標	(只要改動此編號)
	local CheckBuffID = 509411			--檢查是否正在演戲的BUFF(只要改動此編號)
	local CheckRange = 150				--演戲的檢查範圍(只要改動此範圍)
	local DoScript = "Lua_424075_break"	--當劇情結束或者沒人在看戲時作的處理
			
	--演戲中
	local eric = LuaFunc_CreateObjByObj ( 117794 , OwnerID() ) 
	local core = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117804, 300, 0 )
	core = LuaFunc_CreateObjByObj ( 117795 , core ) 
	local machine = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117582, 300, 0 )	
	
	ks_ActSetMode( eric )	--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)
	ks_ActSetMode( core )

	Sleep(5)
	CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
	Sleep(10)
	AdjustFaceDir ( eric , machine ,0 )
	sleep(5)
	PlayMotionEX( eric, ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(30)
	PlayMotion( eric,ruFUSION_ACTORSTATE_CRAFTING_END )	
	local girl = Lua_DW_CreateObj("flag" ,117793,780847,1)
	ks_ActSetMode( girl )
	sleep(20)
	AdjustFaceDir ( girl , eric ,0 )	
	sleep(3)
	AdjustFaceDir ( eric, girl ,0 )		
	sleep(3)
	PlayMotion(girl,ruFUSION_ACTORSTATE_EMOTE_CRY)
	Yell(girl,"[SC_424075_2]",3)
	sleep(30)
	PlayMotion(girl,ruFUSION_ACTORSTATE_EMOTE_CRY)
	Yell(girl,"[SC_424075_3]",3)	
	sleep(40)
	PlayMotion(girl,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(girl,"[SC_424075_4]",3)
	sleep(40)
	SetRoleCamp( girl , "Monster" )	
	SetIdleMotion( girl,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	Yell(girl,"[SC_424075_5]",3)	
	CastSpell(girl,girl,497492)
	PlayMotion( eric,ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
	sleep(10)
	Yell(core,"[SC_424075_7]",3)
	AdjustFaceDir ( core , girl ,0 )
	sleep(20)
	Yell(eric,"[SC_424075_6]",3)
	sleep(10)
	SetIdleMotion( core,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	Yell(core,"[SC_424075_8]",3)
	sleep(30)
	Yell(core,"[SC_424075_9]",3)	
	CastSpell(core,girl,497481)	
	sleep(30)
	sleep(30)
	PlayMotion(eric , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell(eric,"[SC_424075_11]",3)
	sleep(10)
	local sps = Lua_DW_CreateObj("flag" ,117796,780847,2)		
	ks_ActSetMode( sps )	
	sleep(5)
	DW_MoveToFlag(sps,780847 , 3 ,0 ,1)
	sleep(5)
	AdjustFaceDir ( sps, eric ,0 )	
	sleep(3)	
	Yell(sps,"[SC_424075_12]",3)
	sleep(5)
	AdjustFaceDir ( eric, sps ,0 )		
	sleep(35)
	PlayMotion(sps , ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(2)
	Yell(sps,"[SC_424075_13]",3)	
	sleep(30)
	PlayMotion(eric ,ruFUSION_ACTORSTATE_SHIELD_BASH)
	Yell(eric,"[SC_424075_14]",3)	
	sleep(40)
	Yell(sps,"[SC_424075_15]",3)
	DW_MoveToFlag(sps,780847 , 4 ,0 ,1)
	sleep(3)
	local player = {}
	player = SearchRangePlayer ( OwnerID(), CheckRange ) 
	local playerCount = 0
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckID(player[i]) == true and  CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i] , CheckBuffID ) == true then 
			ScriptMessage(player[i],player[i],1,"[SC_424075_17]",0)
			ScriptMessage(player[i],player[i],0,"[SC_424075_17]",0)
		end
	end	
	PlayMotion(sps, ruFUSION_ACTORSTATE_PARRY_BOW)	
	sleep(3)
	PlayMotion( eric,ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
	sleep(20)
	callplot(sps,"DW_MoveToFlag",sps,780847 , 5 ,0 ,1)
	sleep(10)	
	PlayMotion(eric, ruFUSION_ACTORSTATE_EMOTE_SURRENDER)		
	Yell(eric , "[SC_424075_16]",3)
	sleep(55)
	CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
end

function Lua_424075_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local girl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117793, 300, 0 )--搜尋附近參加的NPC演員
	local eric = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117794, 300, 0 )
	local core = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117795, 300, 0 )
	local sps = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117796, 300, 0 )
	
	if girl ~= nil then delobj(girl) end							--如果存在 則刪除
	if eric ~= nil then delobj(eric) end
	if core ~= nil then delobj(core) end
	if sps ~= nil then delobj(sps) end
	ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
end

function Lua_424075_light()
	Local T_ID = TargetID()
	Yell(T_ID,"[SC_424075_10]",3)	
	delobj(T_ID)
end

function LuaS_424083()	--阿信包的函式 可判斷多人劇情
	local T_ID = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家	
	LoadQuestOption( O_ID )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	if CheckAcceptQuest( O_ID, 424083 ) == true and CheckFlag( O_ID, 544898 ) == false and CheckBuff(O_ID,509412) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_424083_1]", "Lua_424083_1",0) --我準備好了。
	end
	if CheckAcceptQuest( O_ID, 424084 ) == true and CheckFlag( OwnerID(), 544899 ) == false and CheckBuff(O_ID,509413) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_424084_1]", "Lua_424084_1",0) --我準備好了。
	end
	if 	CheckAcceptQuest(OwnerID(),424080) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424080_01]","LuaAS_424080_02",0) 	--我想知道記憶符石詳細的狀況。
	end

end

function Lua_424083_1()
	local T_ID = TargetID() 
	local O_ID = OwnerID() 
	if	ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_424083_0]" ) --請稍等我一下。
	else
		CloseSpeak( OwnerID() )	--關閉所有對話視窗
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
		BeginPlot( T_ID, "Lua_424083_2", 0 )	--呼叫下一段函式
	end
end

function Lua_424083_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424083				--任務編號 (只要改動此編號)
	local FinishFlagID = 544898			--完成任務獲得的旗標	(只要改動此編號)
	local CheckBuffID = 509412			--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
	local CheckRange = 150				--演戲的檢查範圍(只要改動此範圍)
	local DoScript = "Lua_424083_break"	--當劇情結束或者沒人在看戲時作的處理	(423519要改為自己的任務編號)
			
	--演戲中
	local sps = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117802, 300, 0 )

	local x = ReadRoleValue ( sps, EM_RoleValue_X)
	local y = ReadRoleValue ( sps,  EM_RoleValue_Y)
	local z = ReadRoleValue ( sps,  EM_RoleValue_Z)
	local sps = LuaFunc_CreateObjByObj ( 117811 , sps ) 	
	local esak = Lua_DW_CreateObj("flag" ,117810,780848,1)	
	ks_ActSetMode( sps)	--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)
	ks_ActSetMode( esak )

	Sleep(5)
	CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
	Sleep(10)

	CallPlot(sps,"DW_MoveToFlag",sps,780848,3,0,1)	
	DW_MoveToFlag(esak,780848, 2 ,0 ,1)	
	AdjustFaceDir ( esak , sps ,0 )	
	sleep(3)
	AdjustFaceDir ( sps, esak ,0 )
	PlayMotion(esak,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Yell(esak,"[SC_424083_2]",3)	
	sleep(30)
	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Yell(sps,"[SC_424083_3]",3)
	sleep(50)	
	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(sps,"[SC_424083_4]",3)
	sleep(60)
	PlayMotion(esak,ruFUSION_ACTORSTATE_SHIELD_BASH)
	Yell(esak,"[SC_424083_5]",3)
	sleep(40)
	Yell(sps,"[SC_424083_6]",3)
	sleep(60)
	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(sps,"[SC_424083_7]",3)
	sleep(60)
	PlayMotion(esak,ruFUSION_ACTORSTATE_EMOTE_ROCK)
	Yell(esak,"[SC_424083_8]",3)
	sleep(50)
--	AdjustFaceDir ( sps, esak ,0 )
	Yell(sps,"[SC_424083_9]",3)
	sleep(50)
	Yell(sps,"[SC_424083_10]",3)
	sleep(60)
	AdjustFaceDir ( esak , sps ,90 )
	Yell(esak,"[SC_424083_11]",3)
	sleep(30)
	AdjustFaceDir ( esak , sps ,0 )
	Yell(esak,"[SC_424083_12]",3)
	sleep(40)
	CallPlot(esak,"Lua_424083_esak_end")
	sleep(10)
	DW_WaitMoveTo(sps,x,y,z)
	CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
end

function Lua_424083_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local esak = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117810, 300, 0 )--搜尋附近參加的NPC演員
	local sps = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117811, 300, 0 )

	if esak ~= nil then delobj(esak) end							--如果存在 則刪除
	if sps ~= nil then delobj(sps) end

	ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
end

function Lua_424083_esak_end()
	local O_ID = OwnerID()
	CallPlot(O_ID,"DW_MoveToFlag",O_ID,780848,4,0,1)
	sleep(30)
	delobj(O_ID)
end

function Lua_424084_1()
	local T_ID = TargetID() 
	local O_ID = OwnerID() 
	if	ReadRoleValue( T_ID, EM_RoleValue_Register2 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_424084_0]" ) --請稍等我一下。
	else
		CloseSpeak( OwnerID() )	--關閉所有對話視窗
		WriteRoleValue( T_ID, EM_RoleValue_Register2, 1 )	--讓NPC變忙碌
		BeginPlot( T_ID, "Lua_424084_2", 0 )	--呼叫下一段函式
	end
end

function Lua_424084_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424084				--任務編號 (只要改動此編號)
	local FinishFlagID = 544899			--完成任務獲得的旗標	(只要改動此編號)
	local CheckBuffID = 509413			--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
	local CheckRange = 150				--演戲的檢查範圍(只要改動此範圍)
	local DoScript = "Lua_424084_break"	--當劇情結束或者沒人在看戲時作的處理	(423519要改為自己的任務編號)
			
	--演戲中
	local sps = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117802, 300, 0 )

	local x = ReadRoleValue ( sps, EM_RoleValue_X)
	local y = ReadRoleValue ( sps,  EM_RoleValue_Y)
	local z = ReadRoleValue ( sps,  EM_RoleValue_Z)
	sps = LuaFunc_CreateObjByObj ( 117962 , sps ) 	
	local esak = Lua_DW_CreateObj("flag" ,117961,780848,1)	
	ks_ActSetMode( sps)	--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)
	ks_ActSetMode( esak )

	Sleep(5)
	CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
	Sleep(10)

	CallPlot(sps,"DW_MoveToFlag",sps,780849,3,0,1)	
	DW_MoveToFlag(esak,780849, 2 ,0 ,1)	
	AdjustFaceDir ( esak , sps ,0 )	
	sleep(3)
	AdjustFaceDir ( sps, esak ,0 )

	PlayMotion(esak,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Yell(esak,"[SC_424084_2]",3)	
	sleep(60)
	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Yell(sps,"[SC_424084_3]",3)
	sleep(60)	
	Yell(sps,"[SC_424084_4]",3)
	sleep(60)
	PlayMotion(esak,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(esak,"[SC_424084_5]",3)
	sleep(40)

	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(sps,"[SC_424084_6]",3)
	sleep(60)
	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(sps,"[SC_424084_7]",3)
	sleep(50)
	PlayMotion(sps,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(sps,"[SC_424084_8]",3)
	sleep(50)
	PlayMotion(esak,ruFUSION_ACTORSTATE_SHIELD_BLOCK)
	PlayMotion(sps, ruFUSION_ACTORSTATE_PARRY_BOW)	
	local player = {}
	local playerCount = 0
	player = SearchRangePlayer ( OwnerID(), CheckRange ) 
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckID(player[i]) == true and  CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i] , CheckBuffID ) == true then 
			ScriptMessage(player[i],player[i],1,"[SC_424084_9]",0)
			ScriptMessage(player[i],player[i],0,"[SC_424084_9]",0)
		end
	end	
	sleep(40)
	PlayMotion(esak,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(esak,"[SC_424084_10]",3)
	sleep(50)
	CallPlot(esak,"DW_MoveToFlag",esak,780848,4,0,1)
	DW_WaitMoveTo(sps,x,y,z)	
	CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
end

function Lua_424084_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local esak = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117961, 300, 0 )--搜尋附近參加的NPC演員
	local sps = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117962, 300, 0 )

	if esak ~= nil then delobj(esak) end							--如果存在 則刪除
	if sps ~= nil then delobj(sps) end

	ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
end

function LuaS_424087_GotoZone_7_start()
	SysCastSpellLv(OwnerID(),OwnerID(),495735,1)  	
	ChangeZone(OwnerID() , 7 , 0 , 16680.7 , 63.0 , 15827.4 , 295.5)
end
