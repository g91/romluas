--副本內NPC.副本流程

--副本入口NPC-------------------------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC0()
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_11]"   ) -- 隊長找來的新冒險者嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_12]" , "Lua_mika_losttreasure_insideNPC1", 0 ) --開啟指南書
--	if CheckFlag(OwnerID(), 543573) == false then --古代秘寶進行中
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_43]" , "Lua_mika_losttreasure_insideNPC6", 0 ) --取得沙漏的祝福
--	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_14]" , "Lua_mika_losttreasure_insideNPC2", 0 ) --還是讓我出去吧
	if CheckFlag(OwnerID(), 543573) == false then --古代秘寶進行中
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_13]" , "Lua_mika_losttreasure_insideNPC3", 0 ) --我準備好了
	end
end
--------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC1()--開啟指南書
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_15]"   ) -- 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_PAGE1]"  , "Lua_mika_losttreasure_insideNPC_page1", 0 ) --第一頁 關於遺跡內出沒的亡靈
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_PAGE2]"  , "Lua_mika_losttreasure_insideNPC_page2", 0 ) --第二頁 關於遺跡內擺設的機關
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_PAGE3]"  , "Lua_mika_losttreasure_insideNPC_page3", 0 ) --第三頁 關於考察隊提供的技能效果
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC0", 0 )--回上一頁
end

function Lua_mika_losttreasure_insideNPC_page1()--第一頁 關於遺跡內出沒的亡靈
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_PAGE11]"   ) -- 內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC1", 0 )--回上一頁
end

function Lua_mika_losttreasure_insideNPC_page2()--第二頁 關於遺跡內擺設的機關
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_PAGE21]"   ) -- 內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC1", 0 )--回上一頁
end

function Lua_mika_losttreasure_insideNPC_page3()--第三頁 關於考察隊提供的技能效果
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_PAGE31]"   ) -- 內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC1", 0 )--回上一頁
end
------------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC2()--還是讓我出去吧
	CloseSpeak( OwnerID() )   
	BeginPlot(  OwnerID()  , "Lua_mika_losttreasure_exit02" , 0 )  
end
--------------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC3()--
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_16]"   ) -- 要開啟這扇門的機關需有30個<CN>[203038]</CN>，我想你應該有準備好吧？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_17]" , "Lua_mika_losttreasure_insideNPC4", 0 ) --交付30個[203038]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC0", 0 )--回上一頁
end

function Lua_mika_losttreasure_insideNPC4()--交付30個[203038]
	CloseSpeak( OwnerID() )    
	if CountBodyItem( OwnerID(), 203038 ) >= 30 then                            --必爾汀代幣
--		Say(OwnerID(), "Normal ")
		BeginPlot(  TargetID()  , "Lua_mika_losttreasure_insideNPC5" , 0 ) --開始遊戲
	else
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣  (  *  共用字串   )
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣
	end
end

function Lua_mika_losttreasure_insideNPC7() --使用1個[202903]取得沙漏祝福效果
	local rune = CountBodyItem(OwnerID(), 202903) --傳送者符文
	if CheckFlag(OwnerID(), 543497) == true then --如果已經有沙漏祝福旗標
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_49]" ,C_SYSTEM   ) --你已經持有沙漏祝福效果。
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_49]" ,C_SYSTEM   ) --你已經持有沙漏祝福效果。
	else
		if rune >= 1 then 
			SetFlag(OwnerID(),543497, 1) --給使用沙漏祝福旗標
			DelBodyItem(OwnerID(), 202903, 1)
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_46]" ,C_SYSTEM  )--你已取得沙漏祝福效果，現在請與[113622]對話開啟遊戲吧！
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_46]" ,C_SYSTEM  )--你已取得沙漏祝福效果，現在請與[113622]對話開啟遊戲吧！
		else
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
		end
	end
end
--------------------------------------------------------------------
function Lua_mika_losttreasure_count() --時間倒數
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9,  600 )    
	while true do
		AddRoleValue(OwnerID() , EM_RoleValue_Register+9,  -1 )    
		local A = ReadRoleValue(OwnerID() , EM_RoleValue_Register+9)   
--		Say(OwnerID(),A)
		if CheckFlag(OwnerID(), 543489 ) == true then
			break
		end
		sleep(10)
	end
end

-----------------------------------------------------------
--關寶庫大門
function Lua_mika_losttreasure_indoorclose() --藏寶窟大門close  開啟遊戲時  --ok
	local treasuredoor = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113621, 3000 , 0)       --寶庫大門
	PlayMotion(treasuredoor, 147) 
end

-----------------------------------------------------------
--時間到執行
function Lua_mika_losttreasure_timeup()
	local range = 2000
	local door1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113620, range , 0)       --遺跡大門
	local door2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114086, range , 0)       --遺跡大門
	local door3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114082, range , 0)       --遺跡大門
	local door4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114085, range , 0)       --遺跡大門
	local door5 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114083, range , 0)       --遺跡大門
	local door6 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114084, range , 0)       --遺跡大門
	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )   --呼叫clockclose
	ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_TIMEUP]" ,0  )--時間到，你被一股強制的力量傳送出去。
	ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_TIMEUP]" ,0  )--時間到，你被一股強制的力量傳送出去。
	PlayMotion(door1, 147)  -- 關入口大門 
	PlayMotion(door2, 147) 
	PlayMotion(door3, 147) 
	PlayMotion(door4, 147) 
	PlayMotion(door5, 147) 
	PlayMotion(door6, 147) 
	BeginPlot(OwnerID()  , "Lua_mika_losttreasure_indoorclose" , 0 )   --藏寶大門close
	ChangeZone( OwnerID() , 10 , 0 , -35785.7,147.5, 5438.2, 213) -- 副本外NPC位置 ot
	sleep(50)
	ScriptMessage( OwnerID(), TargetID()  , 1 ,"[SC_LOSTTREASURE_TIMEUP2]" ,0  )--你在光芒中失去了意識，回到了遺跡外。
	ScriptMessage( OwnerID(),TargetID()  , 0 ,"[SC_LOSTTREASURE_TIMEUP2]" ,0  )--你在光芒中失去了意識，回到了遺跡外。
	if CheckFlag(OwnerID(), 543489) == TRUE then
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 1 )   --稱號記次
		local passtime = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5  )   --稱號累積次數
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數：[$VAR1] 。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
	end
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0)
	SetFlag(OwnerID(),543573 , 0 ) -- 刪 古代秘寶進行中
end
-----------------------------------------------------------
--換區消失
function Lua_mika_losttreasure_chanzone()
--	Say(OwnerID(), "O" )
--	Say(TargetID(), "T" )
	local range = 2000
	local door1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113620, range , 0)       --遺跡大門
	local door2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114086, range , 0)       --遺跡大門
	local door3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114082, range , 0)       --遺跡大門
	local door4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114085, range , 0)       --遺跡大門
	local door5 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114083, range , 0)       --遺跡大門
	local door6 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114084, range , 0)       --遺跡大門
	BeginPlot( OwnerID()  , "Lua_Clockending" , 0 )   --呼叫clockclose
	PlayMotion(door1, 147)  -- 關入口大門 
	PlayMotion(door2, 147) 
	PlayMotion(door3, 147) 
	PlayMotion(door4, 147) 
	PlayMotion(door5, 147) 
	PlayMotion(door6, 147) 
	BeginPlot(OwnerID()  , "Lua_mika_losttreasure_indoorclose" , 0 )   --藏寶大門close
	SetFlag(OwnerID(),543573 , 0 ) -- 刪 古代秘寶進行中
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0)
end
-----------------------------------------------------------
--離開副本火焰燭臺
function Lua_mika_losttreasure_exit00()   --產生離開副本用傳送陣  --ok
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_24]" ,0  )--藏寶庫門口出現可傳送離開這裡的燭臺。
	ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_24]" ,0  )--藏寶庫門口出現可傳送離開這裡的燭臺。
	local EXIT = CreateObjByFlag( 113615, 780486, 1 , 1 )
	AddToPartition( EXIT,RoomID )
	SetPlot( EXIT, "touch", "Lua_mika_losttreasure_exit02", 10 );
end

function Lua_mika_losttreasure_exit02() --ok
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_LOSTTREASURE_LEAVE]")  --你確定要離開這裡嗎？
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );  --確定
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );  --取消
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題
		return
	end
	for i = 0 , 100 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
			if ( SelectID == 0 ) then
				BeginPlot( OwnerID() , "Lua_mika_losttreasure_exit03" , 0 )  
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )
				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		elseif i == 100 then
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )		
			break
		end
	end
end

function Lua_mika_losttreasure_exit03()  --成功離開副本
--	Say(OwnerID(), "O" )
--	Say(TargetID(), "T" )
	local range = 2000
	local door1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113620, range , 0)       --遺跡大門
	local door2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114086, range , 0)       --遺跡大門
	local door3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114082, range , 0)       --遺跡大門
	local door4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114085, range , 0)       --遺跡大門
	local door5 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114083, range , 0)       --遺跡大門
	local door6 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114084, range , 0)       --遺跡大門
	BeginPlot(OwnerID()  , "Lua_Clockending" , 0 )   --呼叫clockclose
	ChangeZone( OwnerID() , 10 , 0 , -35785.7,147.5, 5438.2, 213) -- 副本外NPC位置
	PlayMotion(door1, 147)  -- 關入口大門 
	PlayMotion(door2, 147) 
	PlayMotion(door3, 147) 
	PlayMotion(door4, 147) 
	PlayMotion(door5, 147) 
	PlayMotion(door6, 147) 
	BeginPlot(OwnerID()  , "Lua_mika_losttreasure_indoorclose" , 0 )   --藏寶大門close
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0)
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_LOSTTREASURE_PASS]", C_SYSTEM )--你在光芒中失去了意識，回到了遺跡外。
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_LOSTTREASURE_PASS]", C_SYSTEM )--你在光芒中失去了意識，回到了遺跡外。
	if CheckFlag(OwnerID(), 543489) == TRUE then
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 1 )   --稱號記次
		local passtime = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5  )   --稱號累積次數
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數：[$VAR1] 。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
	end
	SetFlag(OwnerID(),543573 , 0 ) -- 刪 古代秘寶進行中
end
-----------------------------------------------------------

function Lua_mika_losttreasure_givebuff1() --入口隱形物件
	While true do
		SetPlot( OwnerID(), "range", "Lua_mika_losttreasure_givebuff2", 200 )  
		Sleep(50)
	end
end

function Lua_mika_losttreasure_givebuff2() --給詛咒buff
--	Say(OwnerID(), "OwnerID") --player
--	Say(TargetID(), "TargetID")  --box
	Sleep(10)
	if CheckBuff(OwnerID(), 505590) == false then
--		Say(OwnerID(), "OwnerID2") --player
--		Say(TargetID(), "TargetID2") --box
--		AddBuff(OwnerID(), 505589, 1, 30) --清除正面法術
		local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
		DelObj ( MyPet ) ---刪除寵物
		AddBuff(OwnerID(), 505590, 1, -1 ) --亡靈詛咒
		CancelBuff(OwnerID(), 500675 ) --盜賊 潛行
		CancelBuff(OwnerID(), 500535 ) --祭司 聖靈誓約
		ScriptMessage( OwnerID() , -1, 1 , "[SC_LOSTTREASURE_48]" , C_SYSTEM )	--你受到遺跡內亡靈的詛咒影響，暫時遺忘了原本的職業技能。
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_LOSTTREASURE_48]"  , C_SYSTEM )
	end
end

function Lua_mika_losttreasure_delnpc2() --點燃三個燭臺後 刪除寶庫周圍npc
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local range = 200
	local ToDel = {}
	ToDel[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101699, range , 1)     
	ToDel[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101700, range , 1)     
	ToDel[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101701, range , 1)     
	ToDel[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101702, range , 1) 
	for i=1 , table.getn(ToDel) do	
		if ToDel[i] ~= -1 then
			for j = 0 ,table.getn(ToDel[i])  do
				local PID = ReadRoleValue( ToDel[i][j] , EM_RoleValue_PID) 
				if PID == 555 then
					Delobj(ToDel[i][j])
				end
			end
		end
	end
--	Say(OwnerID(), "Del monster ! ")
end