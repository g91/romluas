function Lua_mika_losttreasure_insideNPC5() --開始遊戲
	--	Say(OwnerID(), "ownerID")
	--	Say(TargetID(), "targetID")
-------------------------------------- 
		local NPC = OwnerID()
		local Player = TargetID() 
		local range = 2000
--		local box3 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114120, 3000 , 0)       --1
--		local box5 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114316, 3000 , 0)       --2
--		local box8 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114319, 3000 , 0)       --3
--		local box11 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114322, 3000 , 0)       --4
--		local box14 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114325, 3000 , 0)       --5
--		local box18 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114329, 3000 , 0)       --6

--		local door1 = LuaFunc_SearchNPCbyOrgID( Player , 113620, range , 0)       --遺跡大門
--		local door2 = LuaFunc_SearchNPCbyOrgID( Player , 114086, range , 0)       --遺跡大門
--		local door3 = LuaFunc_SearchNPCbyOrgID( Player , 114082, range , 0)       --遺跡大門
--		local door4 = LuaFunc_SearchNPCbyOrgID( Player , 114085, range , 0)       --遺跡大門
--		local door5 = LuaFunc_SearchNPCbyOrgID( Player , 114083, range , 0)       --遺跡大門
--		local door6 = LuaFunc_SearchNPCbyOrgID( Player , 114084, range , 0)       --遺跡大門

		SetFlag( Player  , 543406 , 1 ) -- 今天確定參加(免費)
		SetFlag( Player  , 543573 , 1 ) -- 古代秘寶進行中
		SetFlag( Player  , 543497 , 0 ) --刪 沙漏祝福
		DelBodyItem( Player , 203038 , 30 ) --刪 必爾汀代幣
		WriteRoleValue(Player , EM_RoleValue_Register+9, 0)
		WriteRoleValue(Player , EM_RoleValue_Register+8, 0)

		mika_losttreasure_objdel()   --殺上次物件.怪物
		mika_losttreasure_objborn()  -- 產生新的物件
		mika_losttreasure_mosterborn(Player) -- 產生所有怪物
		BeginPlot( Player, "lua_mika_ResetColdown_trasure01" , 0 )    -- 清除法術的CD時間
		BeginPlot( Player, "lua_mika_losttreasure_count" , 0 )    -- --時間倒數

		-----  開大門------
		local doorkey = { 543491, 543492, 543493, 543494, 543495, 543496 }
		local doorlist = {113620, 114086, 114082, 114085 , 114083, 114084 }
		for i = 1,  #doorkey do
			local door = LuaFunc_SearchNPCbyOrgID( Player , doorlist[i], range , 0)       --遺跡大門
			if CheckFlag(Player, doorkey[i] ) == true then
				PlayMotion(door, 145) 
			end
		end

		sleep(10)
		ScriptMessage( OwnerID() ,  TargetID(), 1, "[SC_LOSTTREASURE_20]" , C_SYSTEM )  --大門已經開啟，請在時限內點燃3座燭臺抵達中央藏寶庫吧！
		ScriptMessage( OwnerID() ,  TargetID(), 0, "[SC_LOSTTREASURE_20]" , C_SYSTEM )  --大門已經開啟，請在時限內點燃3座燭臺抵達中央藏寶庫吧！
		ClockOpen( TargetID() ,EM_ClockCheckValue_7, 600 ,600,0,"Lua_mika_losttreasure_chanzone","Lua_mika_losttreasure_timeup") --10分鐘 倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
		AddBuff( TargetID() , 505278 , 1, 900)  --15分鐘
		Sleep(1)
		AddBuff(TargetID() , 505279 , 1, 900)  --15分鐘  
		Sleep(1)
		AddBuff( TargetID() , 505280 , 1, 900)  --15分鐘 
		Sleep(1)
		AddBuff( TargetID() , 505281 , 1, 900)  --15分鐘

end

--del 所有上次物件
function mika_losttreasure_objdel()  --清除物件
	local NPC = OwnerID()
	--刪物件
	local TempObj = {113614,114117,114118,113615,113616,114310,114080,113617,113618,113619,114079,114081,101699,101700,101701,101702}
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
--	Say(NPC, "del all obj and monster")
end

-- 產生所有物件
function mika_losttreasure_objborn()
	local NPC = OwnerID()
	BeginPlot (NPC, "Lua_mika_losttreasure_iceborn1" , 0 )  --生冰燄燭台1
	BeginPlot (NPC, "Lua_mika_losttreasure_iceborn2" , 0)  --生冰燄燭台2
	BeginPlot (NPC, "Lua_mika_losttreasure_iceborn3" , 0 )  --生冰燄燭台3
	BeginPlot (NPC, "Lua_mika_losttreasure_cureborn" , 0 )  --生淨化燭台
	BeginPlot (NPC, "Lua_mika_losttreasure_stoneborn" , 0 )  --生石版
	BeginPlot (NPC, "Lua_mika_losttreasure_desborn" , 0 )  --生命運盒子
	BeginPlot (NPC, "Lua_mika_losttreasure_hallborn" , 0 )  --生黑洞
--	Say(NPC, "obj born")
end

-- 產生所有怪物
function mika_losttreasure_mosterborn(Player)
	local NPC = OwnerID()
--	Say(Player, "Player")
	Callplot(NPC, "mika_LostTreasure_dog", Player )
	Callplot(NPC, "mika_LostTreasure_Soldier", Player )
	Callplot(NPC, "mika_LostTreasure_Arrow", Player )
	Callplot(NPC, "mika_LostTreasure_Boss1", Player )
--	Say(NPC, "Monster born")
end