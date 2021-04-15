--========================================================
--				傳送NPC對話劇情
--========================================================
function Lua_jiyi_116716_talk() 	--傳送NPC對話劇情
	local Player = OwnerID() 	--玩家
	local Npc = TargetID() 
	local GameFlag = 548009	--扭轉動力_已完成
	local Buff = 624164		--報名BUFF

	if CheckFlag( Player , GameFlag ) == true then	--如果玩家已經領過獎勵
		SetSpeakDetail( Player , "[SC_2013TWISTPOWER_116716_01]" )   
	elseif CheckBuff( Player , Buff ) == true then		--玩家有已報名BUFF
		SetSpeakDetail( Player , "[SC_2013TWISTPOWER_116716_02]" )	--要到活動場地嗎?
		AddSpeakOption( Player , Npc , "[SC_2013TWISTPOWER_116716_03]" , "Lua_jiyi_116716_talk02" , 0 )	--要
	else 
		SetSpeakDetail( Player , "[SC_2013TWISTPOWER_116716_04]" )	--說明文(包含解說活動報名時段、活動開始時間)
		AddSpeakOption( Player , Npc , "[SC_2013TWISTPOWER_116716_05]" , "Lua_jiyi_116716_talk02" , 0 )	--去看看	
	end
	CloseSpeak( Player )	
end

function Lua_jiyi_116716_talk02()
	local Player = OwnerID()	--玩家
--	Say( Player ,"good luck to me" )
	CloseSpeak( Player )		
	SetPos( Player , 2125.3 , 67.4 , 1924 , 0 )	--傳送玩家
end
----------------------------------------------------------------------------隱藏野外怪劇情
function Lua_jiyi_121397_HideNpc()--掛在任務NPC的物件產生劇情
	local Owner = OwnerID() 
	local NPC = SearchRangeNPC( Owner , 400 )
	local OrgID = { 100212 , 100211 }	--黑皮豬 , 草原土狼
	CallPlot( Owner , "Lua_twist_power_reminder" )
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID[1] or ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID[2] then
			DelFromPartition( NPC[i] )
		end
	end
	LuaN_miyon_action02() --給NPC節慶標誌
end

function GM_twist_power_delete()
	local me = AddyPlayer:new(OwnerID())
	local npc_amount = SetSearchAllNPC(me.room_id)
	for index = 1, npc_amount do
		local npc = AddyNpc:new(GetSearchResult())
		if npc.ORGID == 103890 or	-- 能量母體
		   npc.ORGID == 121108 or 	-- 活動範圍魔法陣
		   npc.ORGID == 121109 or 	-- 能源裝置基座
		   npc.ORGID == 121479 or 	-- 能源晶體
		   npc.ORGID == 121991 or 	-- 能源符文球
--		   npc.ORGID == 121992 or 	-- 冷卻符文球
--		   npc.ORGID == 103357 or 	-- 聯盟戰士 
--		   npc.ORGID == 103358 or  	-- 聯盟戰士
--		   npc.ORGID == 103359 or 	-- 聯盟戰士
--		   npc.ORGID == 103030 or	-- 飢餓的監軍蟻
--		   npc.ORGID == 103031 or	-- 憤怒的工蟻
--		   npc.ORGID == 103362 or	-- 迅捷的工蟻
		   npc.ORGID == 121992 then	-- 冷卻符文球
			npc:delete()
		end
	end
end
----------------------------------------------------------------
function Lua_jiyi_twistpower_DeleteBuff()
	local Player = OwnerID() 
	local Buff = { 501308 , 501309 , 501477 , 501568 , 501569 }
	
	for i = 1 , 5 do
	--	Say( Player , "Buff="..Buff[i] )
		CancelBuff( Player , Buff[i] )
	end
end
-------------------------------------------------------------
function Lua_jiyi_twistpower_CheckId()
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local Crystal = 103899 
	if TOrgID == Crystal then	 
		return true
	else 
		return false
	end
end