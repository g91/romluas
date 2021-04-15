function lua_LivingSkillLimitAdd_check(rank)--使用物品檢查
	local player = OwnerID()
	local Crafting = {}

	Crafting[1] = {}	-- 學徒
	Crafting[2] = { "[SC_CRAFTING_01]" , "[SC_CRAFTING_05]" , 548066, 548067, 548068  }	-- 工匠
	Crafting[3] = { "[SC_CRAFTING_02]" , "[SC_CRAFTING_06]" , 548069, 548070, 548071, 548072, 548073, 548074  }	-- 專精
	Crafting[4] = { "[SC_CRAFTING_03]" , "[SC_CRAFTING_07]" , 548075, 548076, 548077, 548078, 548079, 548080, 548081 }	-- 大師
	Crafting[5] = { "[SC_CRAFTING_04]" , "[SC_CRAFTING_08]" , 548082, 548083, 548084, 548085, 548086, 548087, 548088 }	-- 傳奇
	-- 無法使用，可學習的 _ _ 資格已達上限。　增加可學習的 _ _ 資格。
	for pos=3 , #Crafting[rank] , 1 do
		if CheckFlag( player , Crafting[rank][pos] ) == false then
			SysCastSpellLv( player , player , 491010 , 0 )
			SetFlag( player , Crafting[rank][pos] , 1 )
			ScriptMessage( player , player , 3 , Crafting[rank][2] , C_SYSTEM )	-- 對話視窗與畫面中央同時顯示
			return true
		end
	end
	ScriptMessage( player , player , 3 , Crafting[rank][1] , C_SYSTEM )	-- 對話視窗
	return false
end

function Hao_Crafting_Set_Value()	-- 調整生活技能

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return
	end
	
	local Time = 0
	local DialogStatus
	local Crafting_Code = ""

	local Msg = {}
	Msg[0] = "[SC_CRAFTING_MSG_03]"	-- 請於欄位中輸入以下代號：
	Msg[1] ="[SC_CRAFTING_10]"	-- 刪除各階段生活技能擴充券增加的學習資格。		
	Msg[2] ="[SC_CRAFTING_09]"	-- 取得各階段生活技能擴充券增加的學習資格。
	Msg[3] ="[SC_CRAFTING_11]"		-- 刪除所有生活技能
	Msg[4] ="[SC_CRAFTING_12]"		-- 取得所有生活技能
	Msg[5] ="[SYS_SKILLNAME_BLACKSMITH]"	-- 打鐵技能
	Msg[6] ="[SYS_SKILLNAME_CARPENTER]"	-- 木工技能
	Msg[7] ="[SYS_SKILLNAME_MAKEARMOR]"	-- 製甲技能
	Msg[8] ="[SYS_SKILLNAME_TAILOR]"		-- 裁縫技能
	Msg[9] ="[SYS_SKILLNAME_COOK]"		-- 烹飪技能
	Msg[10] ="[SYS_SKILLNAME_ALCHEMY]"	-- 煉金技能
	Msg[11] ="[SYS_SKILLNAME_MINING]"	-- 挖礦技能
	Msg[12] ="[SYS_SKILLNAME_LUMBERING]"	-- 伐木技能
	Msg[13] ="[SYS_SKILLNAME_HERBLISM]"	-- 採藥技能
	Msg[14] ="[SYS_SKILLNAME_PLANT]"		-- 種植技能

	if ReadRoleValue( Player , EM_RoleValue_PID ) == 0 then
		ScriptMessage( Player , Player , 0 , Msg[0] , C_SYSTEM )
		for Pos = 1 , #Msg , 1 do
			ScriptMessage( Player , Player , 0 , Pos.." = "..Msg[Pos] , C_SYSTEM )
		end
	end

	AddBuff( Player , 501570 , 0 , -1 )  
	DialogCreate( Player , EM_LuaDialogType_Input , "[SC_CRAFTING_MSG_01]" )	-- 請輸入代號：
	DialogSelectStr( Player , "[BG_DLG_SURE_ENTER_ROOM]" )	-- 確定
	DialogSelectStr( Player , "[BG_DLG_CANCEL_JOIN_ROOM]" )	-- 取消

	if DialogSendOpen(Player) == false then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 不等於初始化及中斷時
			Crafting_Code = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- 有填入字串
				if tonumber(Crafting_Code) == nil or Crafting_Code == "" or Msg[tonumber(Crafting_Code)] == nil then	-- 輸入欄位時，不等於字串、空白、或Table不存在時..
					ScriptMessage( player , player , 0 , "[SC_209462_3]" , C_SYSTEM )	-- 輸入錯誤
					break
				else
				--	ScriptMessage( Player , Player , 0 , Msg[tonumber(Crafting_Code)] , C_SYSTEM )	-- 顯示選擇項目
					CancelBuff( Player, 501570 )
					DialogClose( Player )
					WriteRoleValue( Player , EM_RoleValue_PID , 1 )
					return Hao_Crafting_Set_Value_01( Player , tonumber(Crafting_Code) , Msg[tonumber(Crafting_Code)] )
				end
			else
				break
			end
		elseif DialogStatus == -1 then	-- 中斷
			break
		end
	end
	WriteRoleValue( Player , EM_RoleValue_PID , 0 )
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_Crafting_Set_Value_01( Player , Crafting_Code , String )

	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]" , 0 )	--視窗已經打開了
		return
	end

	if String == nil then
		String = ""
	end

	local Time = 0
	local DialogStatus
	local Skill_Volume = ""	-- 等級

	local Crafting = {}
	-- 額外擴充的生活技能資格
	Crafting[1] = {
			[1] = { 548066, 548067, 548068  } ,					-- 工匠
			[2] = { 548069, 548070, 548071, 548072, 548073, 548074  } ,		-- 專精
			[3] = { 548075, 548076, 548077, 548078, 548079, 548080, 548081 } ,	-- 大師
			[4] = { 548082, 548083, 548084, 548085, 548086, 548087, 548088 }	-- 傳奇			
				}

	Crafting[5] = { 540268 , 540343 , 540352 , 540361 , 540369 }	-- 打鐵(學徒、工匠、專精、大師、傳奇)
	Crafting[6] = { 540334 , 540344 , 540353 , 540362 , 540368 }	-- 木工
	Crafting[7] = { 540335 , 540345 , 540354 , 540363 , 544329 }	-- 製甲
	Crafting[8] = { 540336 , 540346 , 540355 , 540364 , 540374 }	-- 裁縫
	Crafting[9] = { 540337 , 540347 , 540356 , 540365 , 540373 }	-- 烹飪
	Crafting[10] = { 540338 , 540348 , 540357 , 540366 , 540375 }	-- 煉金
	Crafting[11] = { 540269 , 540340 , 540349 , 540358 , 540371 }	-- 挖礦
	Crafting[12] = { 540270 , 540341 , 540350 , 540359 , 540370 }	-- 伐木
	Crafting[13] = { 540333 , 540342 , 540351 , 540360 , 540372 }	-- 採藥
	Crafting[14] = { 542886 , 542887 , 542888 , 542889 , 543535 }	-- 種植

	Crafting[3] = {				-- 所有生活技能
			Crafting[5] ,
			Crafting[6] ,
			Crafting[7] ,
			Crafting[8] ,
			Crafting[9] ,
			Crafting[10] ,
			Crafting[11] ,
			Crafting[12] ,
			Crafting[13] ,
			Crafting[14]
					}

	local Skill = {}
	Skill[5] = EM_RoleValue_Skill_BlackSmith	-- 打鐵
	Skill[6] = EM_RoleValue_Skill_Carpenter	-- 木工
	Skill[7] = EM_RoleValue_Skill_MakeArmor	-- 製甲
	Skill[8] = EM_RoleValue_Skill_Tailor		-- 裁縫
	Skill[9] = EM_RoleValue_Skill_Cook		-- 烹飪
	Skill[10] = EM_RoleValue_Skill_Alchemy	-- 煉金
	Skill[11] = EM_RoleValue_Skill_Mining		-- 挖礦
	Skill[12] = EM_RoleValue_Skill_Lumbering	-- 伐木
	Skill[13] = EM_RoleValue_Skill_Herblism	-- 採藥
	Skill[14] = EM_RoleValue_Skill_Plant		-- 種植

	if Crafting_Code == 1 then	-- 刪除各階段生活技能擴充券增加的學習資格。
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_10]" , 0 )
		for Rank = 1 , #Crafting[1] , 1 do
			for Pos = 1 , #Crafting[1][Rank] , 1 do 
				if CheckFlag( Player , Crafting[1][Rank][Pos] ) == true then
					SetFlag( Player , Crafting[1][Rank][Pos] , 0 )
				end
			end
		end
		return Hao_Crafting_Set_Value()
	elseif Crafting_Code == 2 then	-- 取得各階段生活技能擴充券增加的學習資格。
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_09]" , 0 )
		for Rank = 1 , #Crafting[1] , 1 do
			for Pos = 1 , #Crafting[1][Rank] , 1 do 
				if CheckFlag( Player , Crafting[1][Rank][Pos] ) == false then
					SetFlag( Player , Crafting[1][Rank][Pos] , 1 )
				end
			end
		end
		return Hao_Crafting_Set_Value()
	elseif Crafting_Code == 3 then	-- 刪除所有生活技能
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_11]" , 0 )
		-- 刪除生活技能資格	
		for Rank = 1 , #Crafting[3] , 1 do
			for Pos = 1 , #Crafting[3][Rank] , 1 do
				if CheckFlag( Player , Crafting[3][Rank][Pos] ) == true then
					SetFlag( Player , Crafting[3][Rank][Pos] , 0 )
				end
			end
		end		
		--
		for Choise , Value in pairs(Skill) do
			WriteRoleValue( Player , Skill[Choise] , 0 )
		end
		return Hao_Crafting_Set_Value()
	elseif Crafting_Code == 4 then	-- 取得所有生活技能
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_12]" , 0 )
		-- 取得生活技能資格
		for Rank = 1 , #Crafting[3] , 1 do
			for Pos = 1 , #Crafting[3][Rank] , 1 do
				if CheckFlag( Player , Crafting[3][Rank][Pos] ) == false then
					SetFlag( Player , Crafting[3][Rank][Pos] , 1 )
				end
			end
		end
		--
		for Choise , Value in pairs(Skill) do
			WriteRoleValue( Player , Skill[Choise] , 100 )
		end	
		return Hao_Crafting_Set_Value()
	end

	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "[SC_CRAFTING_MSG_02][$SETVAR1="..String.."]" )	-- 請輸入想要調整的 _ _ 等級：
	DialogSelectStr( Player , "[BG_DLG_SURE_ENTER_ROOM]" )	-- 確定
	DialogSelectStr( Player , "[BG_DLG_CANCEL_JOIN_ROOM]" )	-- 取消

	if DialogSendOpen(Player) == false then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 不等於初始化及中斷時
			Skill_Volume = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- 有填入字串
				if Type(Skill_Volume) ~= "string" or Skill_Volume == ""  or tonumber(Skill_Volume) < 0 then	-- 輸入欄位時，不等於字串、空白時則...
					ScriptMessage( Player , Player , 0 , "[SC_209462_3]" , C_SYSTEM )	-- 輸入錯誤
				else
					local Ceil = math.ceil(tonumber(Skill_Volume)/20)	-- 無條件進位
				--	ScriptMessage( Player , Player , 0 , Skill_Volume , C_SYSTEM )	-- 顯示輸入值
					for Pos = 1 , #Crafting[Crafting_Code] , 1 do	-- 重置後重新給予
							SetFlag( Player , Crafting[Crafting_Code][Pos] , 0 )
					end
					if Ceil ~= 0 then	-- 當輸入等級不等於 0 時才執行
						for Pos = 1 , Ceil , 1 do
							if Crafting[Crafting_Code][Pos] ~= nil then
								if CheckFlag( Player , Crafting[Crafting_Code][Pos] ) == false then	-- 取整數
									SetFlag( Player , Crafting[Crafting_Code][Pos] , 1 )
								end
							end
						end
					end
					WriteRoleValue( Player , Skill[Crafting_Code] , tonumber(Skill_Volume) )	-- 修改選擇的生活技能
				end
				CancelBuff( Player , 501570 )
				DialogClose( Player )
				return Hao_Crafting_Set_Value()
			else
				break
			end
		elseif DialogStatus == -1 then	-- 中斷
			break
		end
	end
	WriteRoleValue( Player , EM_RoleValue_PID , 0 )	
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_Check_Buff_State(BuffID)	-- 確認玩家身上是否已持有該物品提供的效果

	local Player = OwnerID()
	if CheckBuff( Player , BuffID ) == true then
		ScriptMessage( Player , Player , 1 , "[MSG_EFFECT_HAVE]" , C_DEFAULT )	-- 物品使用失敗，此效果已存在。
		return false
	end
end