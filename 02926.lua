-------------------------------
-- LV3 的 第13隻寵物

-- 使用寵物物品時執行劇情
function lua_mika_starpet_lv3_mon13()
	local PlayerID = OwnerID()

	local magicid = 850297  	-- lv3 召喚寵物法術集合id   
	local count = 10
	local mon13key = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }   -- 10種技能key

	for i = 1 , count do
		if CheckFlag(PlayerID, mon13key[i] )  == true then  -- 
			CastSpell(PlayerID, PlayerID, magicid )  -- 召喚出寵物
			break
		end
		if i  == count  then
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_step1" , 0 )
		end
	end
end	

function lua_mika_starpet_lv3_mon13_step1()
	local PlayerID = OwnerID()

	if CheckBuff( PlayerID , 501570) == true then 
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0

	local TransferSelect = {}
	TransferSelect[0] = { "[SC_STARPET_BUFF01]" }  
	TransferSelect[1] = { "[SC_STARPET_BUFF02]"  }
	TransferSelect[2] = { "[SC_STARPET_BUFF03]"  }
	TransferSelect[3] = { "[SC_STARPET_BUFF04]"  }
	TransferSelect[4] = { "[SC_STARPET_BUFF05]"  }
	TransferSelect[5] = { "[SC_STARPET_BUFF06]"  }
	TransferSelect[6] = { "[SC_STARPET_BUFF07]"  }
	TransferSelect[7] = { "[SC_STARPET_BUFF08]"  }
	TransferSelect[8] = { "[SC_STARPET_BUFF09]"  }
	TransferSelect[9] = { "[SC_STARPET_BUFF10]" }	
	TransferSelect[10] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_01]" )  -- SC_STARPETS_01  選擇想要這隻寵物為你增加的能力吧。
	AddBuff( PlayerID , 501570,0,-1);

	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end

	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end

	WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 0   ) 

	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 20 then -- 防無窮迴圈 , 10秒後關閉
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 0 then  -- 選項1
		--	Say(PlayerID, "choice1")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 10   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 1 then -- 選項2
		--	Say(PlayerID, "choice2")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 20   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 2 then  -- 選項3
	--		Say(PlayerID, "choice3")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 30   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 3 then --  選項4
	--		Say(PlayerID, "choice4")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 40   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 4 then -- 選項5
	--		Say(PlayerID, "choice5")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 50   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 5 then -- 選項6
	--		Say(PlayerID, "choice6")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 60   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 6 then -- 選項7
	--		Say(PlayerID, "choice7")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 70   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 7 then -- 選項8
	--		Say(PlayerID, "choice8")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 80   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 8 then -- 選項9
	--		Say(PlayerID, "choice9")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 90   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )
			break
		elseif DialogStatus == 9 then -- 選項10
	--		Say(PlayerID, "choice9")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 100   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )
			break
		elseif DialogStatus == 9 then --  Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end


function lua_mika_starpet_lv3_mon13_sure() -- 確定是否產生
	local PlayerID = OwnerID()

	if CheckBuff( PlayerID , 501570) == true then 
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID ) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0

	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_02]" ) --確定要選擇這個能力嗎？選擇後將無法變更！

	AddBuff(PlayerID , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end
	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 20 then -- 防無窮迴圈 , 10秒後關閉
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 0 then  --sure
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_ok" , 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function lua_mika_starpet_lv3_mon13_ok()   --最後步驟
	local PlayerID = OwnerID()
	local choice = ReadRoleValue(PlayerID , EM_RoleValue_PID  )

	local mon13key = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }   -- 10種技能key
	local mon13buff = { 622786, 622787, 622788, 622789, 622790, 622791, 622792, 622793, 622794, 622795 }   -- 10種buff

	DesignLog( OwnerID() , 120926 , "got lv3 month-speical " ) -- 兌換獎勵
	CastSpell(PlayerID, PlayerID, 850123 )  -- 特效

	for i = 1, #mon13key do   -- 10
		if( i*10) == choice then   -- i 的 10 倍 =玩家的pid
		--	Say(PlayerID, "Choice"..i )
			Setflag(PlayerID, mon13key[i], 1 )
			ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..mon13buff[i].."]".."]" , C_SYSTEM ) 
			-- 星座寵物回應了你的請求，現在召喚寵物可以獲得[$VAR1]的效果。

		end
	end
end


------------ 下列劇情掛在 基本法術 - 寵物被召喚出來 初始lua  

function mika_starpet_mon13_bufflv3_1()
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local todaykeyid = 546483  -- Lv3星座寵每日key
	local petlist = 106949

--	say(pet, "petorgid ="..petid )
--	say(master, "master")
	Callplot(OwnerID(), "Hao_Pet_SetModeEx", 0 )
	if CheckFlag( master, todaykeyid ) == true then
		CastSpell(pet, pet, 499363 )  -- 寵物登場效果
		return false
	else
		CallPlot( Pet , "mika_starpet_mon13_bufflv3_2" , 0 )	
	end
end

function mika_starpet_mon13_bufflv3_2()
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local keycount = 10
	local todaykeyid = 546483  -- Lv3星座寵每日key

	local mon13key = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }   -- 10種技能key
	local mon13buff = { 622786, 622787, 622788, 622789, 622790, 622791, 622792, 622793, 622794, 622795 }   -- 10種buff

	sleep(10)
	for i = 1 , keycount do
		if CheckFlag( master, mon13key[i] ) == true then
			CastSpell(Pet, master, 850124 )  -- 外觀特效
			AddBuff( master, mon13buff[i], 0,10800)  -- 給效果buff   3hr 
		--	Say(master, "mon13key = "..i..","..mon13key[i]..", mon13buff ="..mon13buff[i] )
			break
		end

	end
	Setflag( master, todaykeyid, 1 )   --   給予  Lv3星座寵每日key

end