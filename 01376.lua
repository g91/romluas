--------------------------------新增校場副本注意事項---------------------------------
--搜尋 function LuaFN_GuildGame_PlayAgain 在此事件內添加你所新增的校場副本的KEYITEM--

function LuaYu_clock_close01() -- 關閉範圍內玩家之計時器
	SetPlot( OwnerID() ,"range",  "LuaYu_clock_close02" , 40 )  
end
function LuaYu_clock_close02() 
	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )
end
function LuaYU_TRainertransport_start()
--Say(OwnerID(),"3")
--Say(TargetID(),"4")	
	SetPlot( TargetID() , "Touch" , "LuaYU_Trainertransport_00" , 150 )	

end
function LuaDan_Trainermotion_0()
	SetPlot( OwnerID() , "Range" , "LuaDan_Trainermotion_1" , 200 )		
end
function LuaDan_Trainermotion_1()
	Say(TargetID(), "Welcome! Welcome!")
	PlayMotion( TargetID(), 112) 
end

function LuaYU_Trainertransport_00()
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
--Say(OwnerID(),"1")
--Say(TargetID(),"2")

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

		SetModeEx( TargetID()   , EM_SetModeType_Mark, true )--標記
		SetModeEx( TargetID()  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( TargetID() , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( TargetID() , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( TargetID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( TargetID() , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( TargetID()  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( TargetID() , EM_SetModeType_DisableRotate, false )--轉向
		SetModeEx( TargetID() , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( TargetID() , EM_SetModeType_NotShowHPMP, false )--顯示血條
	
		AddBuff( TargetID() , 505921 , 39 , -1 )	--40%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( TargetID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

--	Say( TargetID() ,"TargetID" )--校場
--	Say( OwnerID() ,"OwnerID" )--玩家
--		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(),"[GUILD_REMINDER]")
--		else
			CloseSpeak( OwnerID() )  
			SetPlot( TargetID() , "touch" , "Yuyu_GuildWarBuliding_1_02" , 60 )
--		end

	elseif PlayerGuildID ~= BuildingGuildID then
		SetSpeakDetail(OwnerID(),"[GUILD_REMINDER]")
		--ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		--ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
--Say(OwnerID(),"1")players
--Say(TargetID(),"2") building
		--SetPlot( TargetID() , "Touch" , "" , 150 )
		LoadQuestOption(OwnerID())	-- 載入該 NPC 的任務 ( 包括對話及任務 )
		--sleep(10)
		--SetSpeakDetail( TargetID(), "[GUILD_NEWGUILDGETREADY]" )
		--AddSpeakOption( TargetID(), OwnerID(), GetString("GUILD_NEWGUILD"), "Sys_CreateGuild_Open", 0 );	--創立公會
		AddSpeakOption(OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainertransport_01", 0 )--確定
		--AddSpeakOption( TargetID(), OwnerID(), "YES" , "",0 )
		BeginPlot( TargetID() , "LuaYU_TRainertransport_start" , 0)
	end
end

function LuaYU_Trainertransport_01()

	local NPCOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID  ) --該怪在資料庫的統一ID

	local NpcID= {		112896,			--校場級別 LV1 以此類推
				112897,
				112898,
				112899,
				112900,
				112901,
				112902,
				112903,
				112904,
				112905
					}

	local NpcLV = 0--紀錄校場等級
	local Countflag = 0--記錄玩家旗標數

	local NpcFlag= {	542745,--眼明手快		--校場活動旗標
				542748,--我要活下去
				542244,--命運好好玩
				542175,--針刺試煉
				542176,--號角響起
				542177,--神鬼戰士
				542178,--救傷試煉
				542247,--進階救傷試煉
				542248,--全面衝突
				542249 -- LV 10 狼來了(4.0.2 推出)
					}
	for i = 1 , 10 do
		if NPCOrgID == NpcID[i] then
			NpcLV = i
		end
	end

	for j = 1,NpcLV do
		local play =  CheckFlag( OwnerID()  , NpcFlag[j] ) --旗標
		if play == true then
			Countflag = Countflag+1
		end
	end


	if NpcLV > Countflag then  --如果 校場等級(可玩數量) > 目前旗標數量  表示還有可玩的活動
		CloseSpeak( OwnerID() )  
		WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  NPCOrgID  ) --校場等級
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+9  ,  6688  ) --今日是否有進行過任何活動了
	
		BeginPlot( OwnerID() , "LuaYU_Trainertransport_02" , 0 )  
	else
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
	end

end

function LuaYU_Trainertransport_02()

	if ChangeZone( OwnerID(), 354 , -1 , 5121.3, 13.4, 2515.2, 269.9 ) then   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			--取得玩家副職等級
		DesignLog(OwnerID(),354," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次

	end
end


------------------以下為 校場副本內的劇情-------------------------

function LuaYU_GuildTrainer_00()

	PlayMotion( TargetID(), 112) 

	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業
  	local GuildGameLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --校場等級
	local PlayerRegister = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9  ) --今日是否有進行過任何活動了
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	if PlayerRegister == 6688 then

		WriteRoleValue(  TargetID()  , EM_RoleValue_PID  ,  GuildGameLV ) --記住該玩家之公會校場的等級
		sleep(10)
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+9  ,  0 ) --註此標記後，該玩家公會等級已被記住

	end

	local SchoolLV = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) --校場等級
	----------------
	if GuildGameLVArea == nil then
		GuildGameLVArea = {}
	end
	GuildGameLVArea[RoomID] = (SchoolLV - 112895)
	----------------

	local NpcLV= {		112896,		
				112897,
				112898,
				112899,
				112900,
				112901,
				112902,
				112903,
				112904,
				112905
					}
	if CheckBuff(OwnerID(),502941) ~= TRUE then
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME00] "   ) --尊貴的會員你好！我是[112066]，請問你想要進行什麼活動？

--		if PlayerVoc == 0 then   --GM

			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME01] " , "LuaYU_GuildTrainer_G01", 0 ) --1.眼明手快
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME02] " , "LuaYU_GuildTrainer_G02", 0 ) --2.我要活下去
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME03] " , "LuaYU_GuildTrainer_G03", 0 ) --3.命運好好玩
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME04] " , "LuaYU_GuildTrainer_G04", 0 ) --4.針刺試煉
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME_05] " , "LuaYU_GuildTrainer_G05", 0 ) --5.號角響起
			
			AddSpeakOption( OwnerID(), TargetID(), "[SC_DAN_112698_34]" , "LuaYU_GuildTrainer_01", 0 ) --下一頁
			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --離開校場返回公會城
--		else
--			if SchoolLV >= NpcLV[1] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME01] " , "LuaYU_GuildTrainer_G01", 0 ) --1.眼明手快
--			end
--			if SchoolLV >= NpcLV[2] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME02] " , "LuaYU_GuildTrainer_G02", 0 ) --2.我要活下去
--			end
--			if SchoolLV >= NpcLV[3] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME03] " , "LuaYU_GuildTrainer_G03", 0 ) --3.命運好好玩
--			end
--			if SchoolLV >= NpcLV[4] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME04] " , "LuaYU_GuildTrainer_G04", 0 ) --4.針刺試煉
--			end
--			if SchoolLV >= NpcLV[5] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME_05]" , "LuaYU_GuildTrainer_G05", 0 ) --5.號角響起
--			end
--			if SchoolLV >= NpcLV[6] then
--				AddSpeakOption( OwnerID(), TargetID(), "[SC_DAN_112698_34]" , "LuaYU_GuildTrainer_01", 0 ) --下一頁
--			end
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --離開校場返回公會城
--		end
	else
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME00_STOP] "   ) --很抱歉，您現在身為現行犯的身分無法參與校場的特訓。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) 
	end
end

function LuaYU_GuildTrainer_01()

	PlayMotion( TargetID(), 112) 

	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	local SchoolLV = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) -- 校場等級

	local NpcLV= {		112896,		
				112897,
				112898,
				112899,
				112900,
				112901,
				112902,
				112903,
				112904,
				112905
					}

	SetSpeakDetail( OwnerID(), " [SC_GUILDGAME00] "   ) --尊貴的會員你好！我是[112066]，請問你想要進行什麼活動？


--	if PlayerVoc == 0 then   --GM

		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_06]" , "LuaYU_GuildTrainer_G06", 0 ) --6.神鬼戰士
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_07]" , "LuaYU_GuildTrainer_G07", 0 ) --7.救傷試煉
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_08]" , "LuaYU_GuildTrainer_G08", 0 ) --8.進階救傷試煉
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_09]" , "LuaYU_GuildTrainer_G09", 0 ) --9.全面衝突
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_10]" , "LuaYU_GuildTrainer_G10", 0 ) --10. 狼來了！ (4.0.2 推出)
		
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --離開校場返回公會城
--	else
--		if SchoolLV >= NpcLV[6]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_06]" , "LuaYU_GuildTrainer_G06", 0 ) --6.神鬼戰士
--		end
--		if SchoolLV >= NpcLV[7]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_07]" , "LuaYU_GuildTrainer_G07", 0 ) --7.救傷試煉
--		end
--		if SchoolLV >= NpcLV[8]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_08]" , "LuaYU_GuildTrainer_G08", 0 ) --8.進階救傷試煉
--		end
--		if SchoolLV >= NpcLV[9]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_09]" , "LuaYU_GuildTrainer_G09", 0 ) --9.全面衝突
--		end
--		if SchoolLV >= NpcLV[10]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_10]" , "LuaYU_GuildTrainer_G10", 0 ) --10. 狼來了 (4.0.2推出)
--		end
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --離開校場返回公會城
--	end
	
end

-----------------------------------第二層--------------------------------------------確認選項-------------------------------------------

function LuaYU_GuildTrainer_G01() --眼明手快

	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542745 ) --今天已經來過
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業


	if CheckBuff (OwnerID(), 503783) == true then 
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

	else	
		If play == true and PlayerVoc ~= 0 then

			SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

		else
			SetSpeakDetail(OwnerID(), "[GUILD_TC_HITPLATYPUS]" )                                   --校場教官對話內容
			AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_1]", "LuaDan_113034_Teleportion6", 0) --關於遊戲內容
			AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_2]", "LuaDan_113034_Teleportion5", 0) --進入遊戲
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

		end
	end
	

end
-----------------------------------------
function LuaYU_GuildTrainer_G02() --我要活下去

	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542748 ) --今天已經來過
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	If play == true and PlayerVoc ~= 0 then

		SetSpeakDetail( OwnerID(), "[SC_112502_END]") --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

	else

		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME05]  "   ) --你所選擇的特訓活動是：我要活下去 你是否確定進行？
		AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_1]", "LuaDan_SurvivalGame_Info", 0) --關於遊戲內容
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "Lua_TC_TalkScript2", 0 ) --確定
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G03() --命運好好玩

	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542244 ) --今天已經來過
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	If play == true and PlayerVoc ~= 0 then

		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

	else
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME03_1] "   ) --你所選擇的特訓活動是：命運好好玩 你是否確定進行？
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "LuaYU_ClickFunGo", 0 )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start03", 0 ) --確定
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁

	end

end
-----------------------------------------
function LuaYU_GuildTrainer_G04() --針刺試煉
	
	PlayMotion( TargetID(), 112)
	
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	if CheckFlag( OwnerID()  , 542175 ) == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME04_1] "   ) --噢！你選擇的是 針刺試煉 你想要測試自己的反應嗎？
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_FN_DDR_teach", 0 )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start04", 0 ) --確定
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G05() --號角響起
	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542176) --今天已經來過
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	If play == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else
			SetSpeakDetail( OwnerID(), "[SC_SW_CHOSEONE]" )--你想選擇哪一邊？
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_SW_JOINWHITE]" , "Lua_SW_TalkScript1", 0 ) --我想幫白
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_SW_JOINBLACK]" , "Lua_SW_TalkScript2", 0 ) --我想幫黑
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G06() --神鬼戰士
	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542177 ) --今天已經來過
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	if CheckBuff (OwnerID(), 503783) == true then 
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else	
		If play == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
		else
		SetSpeakDetail( OwnerID(), " [SC_GUILD_WARRIOR_6] "   ) -- 你確定要參加試鍊活動 - 神鬼戰士嗎？
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_Hao_GuildwarriorGo", 0 ) -- 遊戲教學
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start06", 0 ) --確定　傳送至NPC
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
		end
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G07()--救傷試煉
	PlayMotion( TargetID(), 112)
	
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	if CheckFlag( OwnerID()  , 542178 ) == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else
		SetSpeakDetail( OwnerID(), " [SC_RESCUE_STRING_NAME] "   ) --噢！你選擇的是 救傷試煉 你想要測試自己的反應嗎？
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_FN_RESCUE_RULE", 0 ) -- 遊戲教學
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start07", 0 ) --確定
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G08()--進階救傷試煉
	PlayMotion( TargetID(), 112)
	
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	if CheckFlag( OwnerID()  , 542247 ) == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else
		SetSpeakDetail( OwnerID(), " [SC_RESCUEII_STRING_NAME] "   ) --噢！你選擇的是 進階救傷試煉 你想要測試自己的反應嗎？
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_FN_RESCUEII_RULE", 0 ) -- 遊戲教學
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start08", 0 ) --確定
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G09()--全面衝突

	PlayMotion( TargetID() , 112 ) 

	local play =  CheckFlag( OwnerID()  , 542248 ) --今天已經來過
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	if CheckBuff ( OwnerID() , 503783 ) == true then 
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else	
		If play == true and PlayerVoc ~= 0 then
			SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
		else
			SetSpeakDetail( OwnerID(), " [SC_GUILD_BARRAGE_11] "   ) -- 你確定要參加試煉活動 - 全面衝突嗎？
			AddSpeakOption( OwnerID() , TargetID() , "[GUILD_TC_HITPLATYPUS_1]" , "Lua_Hao_Guild_Barrage", 0 ) -- 遊戲教學
			AddSpeakOption( OwnerID() , TargetID() , "[SC_202800_2]" , "LuaYU_Trainer_Start09", 0 ) --確定　傳送至NPC
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
		end
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G10()  -- 等級10 狼來了 (4.0.2)

	PlayMotion( TargetID() , 112 ) 

	local play =  CheckFlag( OwnerID()  , 542249 ) --今天已經來過 (LV10的 KEY )
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業

	if CheckBuff ( OwnerID() , 503783 ) == true then 
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
	else	
		If play == true and PlayerVoc ~= 0 then
			SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --今天玩過囉!
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --回上一頁
		else
			SetSpeakDetail( OwnerID(), "[SC_TRAIN10_NPC_SPEAK00]"   ) -- 教場10 教官對話內容
			AddSpeakOption( OwnerID() , TargetID() , "[GUILD_TC_HITPLATYPUS_1]" , "lua_mika_wolfcome_intro", 0 ) -- 遊戲教學 
			AddSpeakOption( OwnerID() , TargetID() , "[SC_202800_2]" , "LuaYU_Trainer_Start10", 0 ) --確定　傳送至活動NPC
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
		end
	end

end

function LuaYU_ClickFunGo()

		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID(), 112) 
		SetSpeakDetail(  OwnerID(), " [SC_CLICKFUNGO08] "  ) 
--『命運好好玩』課程注意事項，
	--1.遊戲時間5分鐘。
	--2.10回合內每回合出現數量不同的寶箱，開中正確的[112068]將獲得<CB>獎勵勳章</CB>。
	--3.獎勵勳章分為<CB>[205017]</CB>與<CB>[205018]</CB>在遊戲結束後將可兌換獎勵禮品。
--另外，在遊戲過程中我也會給予相對的提示協助，請特別注意，祝您好運！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G03", 0 )--回上一頁

end

function Lua_Hao_GuildwarriorGo() -- 神鬼戰士教學

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(  OwnerID(), " [SC_GUILD_WARRIOR_4] " ) 
--	『神鬼戰士』課程注意事項：
--	1.遊戲時間<CS>15</CS>分鐘，請在時限內，擊倒更多的目標。
--	2.善用<CM>劍、盾、杖姿態</CM>技能做轉換，隨自己的適應性做調整。
--	3.在各種姿態下，擊敗更多的目標，可以獲得更多的<CM>技能</CM>或<CM>強化法術</CM>。
--	4.當遊戲時間結束，將以累積的分數換取獎勵。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G06", 0 )--回上一頁
end

function Lua_Hao_Guild_Barrage() -- 全面衝突教學

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 112 ) 
	SetSpeakDetail( OwnerID() , " [SC_GUILD_BARRAGE_7]" ) 
--『全面衝突』課程注意事項：
--　試煉時間為<CY>2</CY>分鐘，試煉開始後會獲得<CY>[507593]</CY>，並且開始出現<CY>紅色、藍色、黃色</CY>三種會移動的球。
--　　(1).每次碰觸到<CY>紅色球</CY>時，會減少<CR>1</CR>點<CY>[507593]</CY>，當<CY>[507593]</CY>減少至<CR>0</CR>時，試煉即結束。
--　　(2).每次碰觸到<CY>藍色球</CY>時，會獲得<CY>分數</CY>及<CY>藍球效果</CY>，效果時間內重覆碰觸藍色球時，會依照藍球效果的等級獲得額外的分數及速度。
--　　(3).每次碰觸到<CY>黃色球</CY>時，會獲得<CY>一種黃球效果</CY>，效果時間內重覆碰觸黃色球時，會獲得<CY>10</CY>點分數，但不會觸發其它黃球效果。
--　試煉結束時，會依照遊戲時取得的分數，換算為<CY>榮譽點數</CY>做為獎勵
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G09", 0 )--回上一頁
end

-- 教場10 狼來了 規則 (用於教官npc 活動npc選項)
function lua_mika_wolfcome_intro()

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 112 ) 
	SetSpeakDetail( OwnerID(), "[SC_TRAIN10_MSG_00]"   ) -- 規則說明
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G10", 0 )--回上一頁
end

-----------------------------------＊第三層-------------------------------------------傳送並開啟所有NPC------------------------------------------

function LuaYU_Trainer_Start01()

	CloseSpeak( OwnerID() )  



end
function LuaYU_Trainer_Start02()

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TC_JOINGAME]" , "Lua_TC_TalkScript2", 0 ) --我想報名	

end

function LuaYU_Trainer_Start03() -- 命運好好玩

	CloseSpeak( OwnerID() )  

--	Say(OwnerID() ,"0")
--	Say(TargetID() ,"1")

	BeginPlot(  TargetID()   , "LuaYU_Trainer_Start03_2" , 0 )  	
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	PlayMotion( TargetID(), 111) 

end

function LuaYU_Trainer_Start03_2()

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local CenterNPC = CreateObjByFlag( 112067 , 780308 , 0 , 1 );	--中間NPC   校場教官
	
	SetModeEx( CenterNPC   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( CenterNPC , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( CenterNPC  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( CenterNPC    , EM_SetModeType_Move, false )--移動
	SetModeEx( CenterNPC  , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( CenterNPC, RoomID) 

	Hide( CenterNPC )
	Show( CenterNPC , RoomID)

	AddBuff( TargetID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	ChangeZone( TargetID(), 354 , RoomID , 2092.4, 13.4, 3436.4, 270.0)
	SetFlag( TargetID()  , 542244 , 1 ) -- 重要物品

end
function LuaYU_Trainer_Start04() --針刺試煉
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)

	AddBuff( OwnerID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	ChangeZone( OwnerID(), 354 , RoomID , 2052.6, 44.5, 2604.1, 91.5)
	CloseSpeak( OwnerID())  
end
function LuaYU_Trainer_Start05()

	CloseSpeak( OwnerID() )  


end
function LuaYU_Trainer_Start06() --神鬼戰士

	CloseSpeak( OwnerID() )  
	BeginPlot(  TargetID()   , "LuaYU_Trainer_Start06_2" , 0 )  	
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	PlayMotion( TargetID(), 111) 
end
function LuaYU_Trainer_Start06_2() --神鬼戰士

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local QNPC = CreateObjByFlag( 114332 , 780371 , 0 , 1 )	--中間NPC   校場教官

	SetModeEx( QNPC , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( QNPC , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( QNPC , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( QNPC , EM_SetModeType_Move, false )--移動
	SetModeEx( QNPC , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( QNPC , RoomID) 

	Hide( QNPC )
	Show( QNPC , RoomID)

	Beginplot( QNPC , "Lua_Hao_Guildwarrior_Clear" , 0 )

	AddBuff( TargetID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	ChangeZone( TargetID() , 354 , RoomID , 4110.1 , 16.3 , 3337.4 , 269.7 )	
end
function LuaYU_Trainer_Start07() --救傷試煉
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)

	AddBuff( OwnerID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)
	ChangeZone( OwnerID(), 354 , RoomID , 3101.6 ,20.8 ,2455.4, 273.2)
	CloseSpeak( OwnerID())  
end
function LuaYU_Trainer_Start08() --進階救傷試煉
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)

	AddBuff( OwnerID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)
	ChangeZone( OwnerID(), 354 , RoomID , 4097.9 ,13.4 ,2451.8, 270.2)
	CloseSpeak( OwnerID() ) 
end
function LuaYU_Trainer_Start09()

	CloseSpeak( OwnerID() )  
	BeginPlot( TargetID() , "LuaYU_Trainer_Start09_2" , 0 )  	
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID(), 111) 
end
function LuaYU_Trainer_Start09_2()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local QNPC = CreateObjByFlag( 116472 , 780373 , 0 , 1 )	--中間NPC   校場教官

	SetModeEx( QNPC , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( QNPC , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( QNPC , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( QNPC , EM_SetModeType_Move, false )--移動
	SetModeEx( QNPC , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( QNPC , RoomID)

	AddBuff( TargetID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	ChangeZone( TargetID() , 354 , RoomID , 4110.1 , 16.3 , 3468.4 , 269.7 )
end

function LuaYU_Trainer_Start10()  --教場10 傳送 (4.0.2)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)
	local Xpos = 5385
	local Ypos = 40
	local Zpos = 4942
	local dir = 160

	CloseSpeak( OwnerID())  
	AddBuff( OwnerID() ,507602 ,1 , 1 ); --傳送特效
	sleep(10)
	ChangeZone( OwnerID(), 354 , RoomID , Xpos , Ypos, Zpos, dir )
end

function LuaYU_Guild_House_Enter2()


	--Say(OwnerID() ,"OwnerID=".." 1 "  )
	--Say(TargetID() ,"TargetID=".." 1 "  )

	local GuildStateID = GuildState( OwnerID() )			-- 0 沒有公會 1 連署公會 2 一般公會(還要判斷是否有公會城，以及公會等級)

	if ( GuildStateID >= 2 ) then

		if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) ==1 then   ---公會城

			OpenVisitGuildHouse( true ); --回自己房屋
			CloseSpeak( OwnerID() )		-- 關閉對話視窗
	--Say(OwnerID() ,"OwnerID=".." 2 " .."G="..GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) )
	--Say(TargetID() ,"TargetID=".." 2 ".."G="..GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) )
		else
			SetSpeakDetail( OwnerID(), "[GUILD_BUILD_5]" )

	--Say(OwnerID() ,"OwnerID=".." 3 "  )
	--Say(TargetID() ,"TargetID=".." 3 "  )
		end
			
	else
		SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )
		AddBuff( OwnerID() ,507602 ,1 , 1 )
		sleep(10)	
		ChangeZone( OwnerID(), 2, 0, 4745.0, 115.7, -1968.0, 51.0)

	--Say(OwnerID() ,"OwnerID=".." 4 "  )
	--Say(TargetID() ,"TargetID=".." 4 "  )

	end
end

function LuaDan_SurvivalGame_Info() --我要活下去遊戲說明

	SetSpeakDetail( OwnerID(), "[SC_GUILDGAME08]"   ) --你所選擇的特訓活動是：我要活下去 你是否確定進行？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_G02", 0 ) --回上一頁
end

function LuaFN_GuildGame_PlayAgain( Option )      -- 公會校場重置券
	if ( Option == "USE" ) then
		SetFlag( OwnerID() , 542745 , 0 ) -- 眼明手快
		SetFlag( OwnerID() , 542244 , 0 ) -- 命運好好玩
		SetFlag( OwnerID() , 542748 , 0 ) -- 我要活下去
		SetFlag( OwnerID() , 542176 , 0 ) -- 號角響起
		SetFlag( OwnerID() , 542177 , 0 ) -- 神鬼戰士
		SetFlag( OwnerID() , 542175 , 0 ) -- 針刺試煉
		SetFlag( OwnerID() , 542178 , 0 ) -- 救傷試煉
		SetFlag( OwnerID() , 542247 , 0 ) -- 救傷試煉2
		SetFlag( OwnerID() , 542248 , 0 ) -- 全面衝突
		SetFlag( OwnerID() , 542249 , 0 ) -- 狼來了 (4.0.2 開放 )
		Sleep(10)

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_GUILDGAME_11]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_GUILDGAME_11]" , C_SYSTEM )  --重置OK
	end
end

function FN_GuildGame_Honor( Player, Score )
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local GuildGameLV = GuildGameLVArea[RoomID]
	Score = Score * (0.9+(0.1*GuildGameLV))
	CallPlot( Player , "YOYO_GetTokenValue" , 7 , Score ) --增加榮譽點數
	--ScriptMessage( Player, Player, 3, "[GUILD_TC_HITPLATYPUS_REWARD]"..Score, C_SYSTEM)	--舊的訊息
end