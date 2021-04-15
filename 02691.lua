--星座寵物劇情


---------------------------LV1 使用星座寵物物品 -----------------------------------------------

-- 當天召喚寵物後劇情lv1 掛在
function Lua_mika_starpet_bufflv1()
	local PlayerID = OwnerID()
	local todaykeyid = 546481
	if CheckFlag( PlayerID, todaykeyid ) == true then
		return false
	else
		Setflag( PlayerID, todaykeyid, 1 )   --   給予  Lv1星座寵每日key
		AddBuff( PlayerID, 622523, 0,10800 )  -- 給效果buff   3hr exp tp drop +20%
	end
end


---------------------------LV2 使用星座寵物物品 -----------------------------------------------

-- 使用寵物物品時執行劇情
function lua_mika_starpet_lv2(month)
	local PlayerID = OwnerID()
	local magicid = {
		850273, 850274, 850275, 850276, 850277, 850278,
		850279, 850280, 850281, 850282, 850283, 850284
			}  -- lv2 召喚寵物法術集合id    13種

	local count = 6
	-- lv2 --13個月 X 6種技能 對應Key
	local lv2key = { 
		 { 546301 ,546302 ,546303, 546304, 546305, 546306  },
		 { 546307, 546308 ,546309, 546310, 546311, 546312  },
		 { 546313 ,546314 ,546315, 546316, 546317, 546318  },
	 	 { 546319, 546320, 546321, 546322, 546323, 546324  },
		 { 546325, 546326, 546327, 546328, 546329, 546330  },
		 { 546331, 546332, 546333, 546334, 546335, 546336  },
		 { 546337, 546338, 546339, 546340, 546341, 546342  },
		 { 546343, 546344, 546345, 546346, 546347, 546348 },
		 { 546349, 546350, 546351, 546352, 546353, 546354 },
		 { 546355, 546356, 546357, 546358, 546359, 546360 },
		 { 546361, 546362, 546363, 546364, 546365, 546366 },
		 { 546367, 546368, 546369, 546370, 546371, 546372 }
			}  

	for i = 1 , count do
		if CheckFlag(PlayerID, lv2key[month][i] )  == true then  -- 
			CastSpell(PlayerID, PlayerID, magicid[month] )  -- 召喚出寵物
			break
		end
		if i  == 6 then
			-- 開啟選單
		--	Say(PlayerID, "Open menu")

			CallPlot( PlayerID , "lua_mika_starpet_lv2_step1" , month )
		end
	end
end	

function lua_mika_starpet_windowcheck()
	local PlayerID = OwnerID()
	if CheckBuff( PlayerID , 501570) == true then 
		-- 對話視窗無法同時重複開啟
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_STARPET_06]", 0 )
		ScriptMessage( PlayerID , PlayerID , 1, "[SC_STARPET_06]", 0 )
		return false
	end
end


function lua_mika_starpet_lv2_step1(month)
	local PlayerID = OwnerID()

--	if CheckBuff( PlayerID , 501570) == true then 
--		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
--		return 0
--	end

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
	TransferSelect[6] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_01]" )  -- SC_STARPETS_01  選擇想要這隻寵物為你增加的能力吧。
	AddBuff( PlayerID , 501570,0, 10 );

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
			CancelBuff( PlayerID, 501570 )
			CallPlot( PlayerID , "lua_mika_starpet_lv2_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv2 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 1 then -- 選項2
		--	Say(PlayerID, "choice2")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 20   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv2 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 2 then  -- 選項3
	--		Say(PlayerID, "choice3")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 30   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv2 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 3 then --  選項4
	--		Say(PlayerID, "choice4")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 40   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv2 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 4 then -- 選項4
	--		Say(PlayerID, "choice5")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 50   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv2 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 5 then -- 選項5 
	--		Say(PlayerID, "choice6")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 60   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv2 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 6 then --  Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end



function lua_mika_starpet_lv2_sure(month) -- 確定是否產生
	local PlayerID = OwnerID()

	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID ) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0

	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_02]" ) --確定要選擇這個能力嗎？選擇後將無法變更！

	AddBuff(PlayerID , 501570,0, 10 );
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
			CallPlot( PlayerID , "lua_mika_starpet_lv2_ok" , month )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function lua_mika_starpet_lv2_ok(month)   --最後步驟
	local PlayerID = OwnerID()
	local choice = ReadRoleValue(PlayerID , EM_RoleValue_PID  )

	local lv2key = { 
		 { 546301 ,546302 ,546303, 546304, 546305, 546306  },
		 { 546307, 546308 ,546309, 546310, 546311, 546312  },
		 { 546313 ,546314 ,546315, 546316, 546317, 546318  },
	 	 { 546319, 546320, 546321, 546322, 546323, 546324  },
		 { 546325, 546326, 546327, 546328, 546329, 546330  },
		 { 546331, 546332, 546333, 546334, 546335, 546336  },
		 { 546337, 546338, 546339, 546340, 546341, 546342  },
		 { 546343, 546344, 546345, 546346, 546347, 546348 },
		 { 546349, 546350, 546351, 546352, 546353, 546354 },
		 { 546355, 546356, 546357, 546358, 546359, 546360 },
		 { 546361, 546362, 546363, 546364, 546365, 546366 },
		 { 546367, 546368, 546369, 546370, 546371, 546372 }
			}  

	local lv2buff = {622524, 622525, 622526, 622527 , 622528, 622529,  }   -- 6種

	CastSpell(PlayerID, PlayerID, 850123 )
	if choice == 10 then
	--	Say(PlayerID, "Choice1")
		-- 星座寵物回應了你的請求，現在召喚寵物可以獲得[$VAR1]的效果。
		Setflag(PlayerID, lv2key[month][1], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv2buff[1].."]".."]" , C_SYSTEM ) 
	elseif choice == 20 then
	--	Say(PlayerID, "Choice2")
		Setflag(PlayerID, lv2key[month][2], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv2buff[2].."]".."]" , C_SYSTEM ) 
	elseif choice == 30 then
	--	Say(PlayerID, "Choice3")
		Setflag(PlayerID, lv2key[month][3], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv2buff[3].."]".."]" , C_SYSTEM ) 
	elseif choice == 40 then
	--	Say(PlayerID, "Choice4")
		Setflag(PlayerID, lv2key[month][4], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv2buff[4].."]".."]" , C_SYSTEM ) 
	elseif choice == 50 then
	--	Say(PlayerID, "Choice5")
		Setflag(PlayerID, lv2key[month][5], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv2buff[5].."]".."]" , C_SYSTEM ) 
	elseif choice == 60 then
	--	Say(PlayerID, "Choice6")
		Setflag(PlayerID, lv2key[month][6], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv2buff[6].."]".."]" , C_SYSTEM ) 
	end

end


---------------------------LV3 使用星座寵物物品 -----------------------------------------------

-- 使用寵物物品時執行劇情
function lua_mika_starpet_lv3(month)
	local PlayerID = OwnerID()

 	-- lv3 召喚寵物法術集合id    13種
	local magicid = {
		850285, 850286, 850287, 850288, 850289, 850290,
		850291, 850292, 850293, 850294, 850295,850296
			} 
	local count = 9

	-- lv3 --12個月 X 6種技能 對應Key
	local lv3key = { 
		{ 546373, 546374, 546375, 546376, 546377, 546378, 546379, 546380, 546381 },
		{ 546382, 546383, 546384, 546385, 546386, 546387, 546388, 546389, 546390 },
		{ 546391, 546392, 546393, 546394, 546395, 546396, 546397, 546398, 546399 },
		{ 546400, 546401, 546402, 546403, 546404, 546405, 546406, 546407, 546408 },
		{ 546409, 546410, 546411, 546412, 546413, 546414, 546415, 546416, 546417 },
		{ 546418, 546419, 546420, 546421, 546422, 546423, 546424, 546425, 546426 },
		{ 546427, 546428, 546429, 546430, 546431, 546432, 546433, 546434, 546435 },
		{ 546436, 546437, 546438, 546439, 546440, 546441, 546442, 546443, 546444 },
		{ 546445, 546446, 546447, 546448, 546449, 546450, 546451, 546452, 546453 },
		{ 546454, 546455, 546456, 546457, 546458, 546459, 546460, 546461, 546462 },
		{ 546463, 546464, 546465, 546466, 546467, 546468, 546469, 546470, 546471 },
		{ 546472, 546473, 546474, 546475, 546476, 546477, 546478, 546479, 546480 }
			}  

	for i = 1 , count do
		if CheckFlag(PlayerID, lv3key[month][i] )  == true then  -- 
			CastSpell(PlayerID, PlayerID, magicid[month] )  -- 召喚出寵物
			break
		end
		if i  == count  then
			CallPlot( PlayerID , "lua_mika_starpet_lv3_step1" , month )
		end
	end
end	

function lua_mika_starpet_lv3_step1(month)
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
	TransferSelect[9] = { "[SO_EXIT]" }				-- 離開對話

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
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 1 then -- 選項2
		--	Say(PlayerID, "choice2")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 20   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 2 then  -- 選項3
	--		Say(PlayerID, "choice3")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 30   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 3 then --  選項4
	--		Say(PlayerID, "choice4")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 40   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 4 then -- 選項5
	--		Say(PlayerID, "choice5")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 50   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 5 then -- 選項6
	--		Say(PlayerID, "choice6")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 60   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 6 then -- 選項7
	--		Say(PlayerID, "choice7")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 70   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 7 then -- 選項8
	--		Say(PlayerID, "choice8")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 80   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 8 then -- 選項9
	--		Say(PlayerID, "choice9")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 90   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_sure" , month )
			DesignLog( OwnerID() , 120926 , "got lv3 month-"..month.."starpet. " ) -- 兌換獎勵
			break
		elseif DialogStatus == 9 then --  Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end



function lua_mika_starpet_lv3_sure(month) -- 確定是否產生
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
			CallPlot( PlayerID , "lua_mika_starpet_lv3_ok" , month )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function lua_mika_starpet_lv3_ok(month)   --最後步驟
	local PlayerID = OwnerID()
	local choice = ReadRoleValue(PlayerID , EM_RoleValue_PID  )

	local lv3key = { 
		{ 546373, 546374, 546375, 546376, 546377, 546378, 546379, 546380, 546381 },
		{ 546382, 546383, 546384, 546385, 546386, 546387, 546388, 546389, 546390 },
		{ 546391, 546392, 546393, 546394, 546395, 546396, 546397, 546398, 546399 },
		{ 546400, 546401, 546402, 546403, 546404, 546405, 546406, 546407, 546408 },
		{ 546409, 546410, 546411, 546412, 546413, 546414, 546415, 546416, 546417 },
		{ 546418, 546419, 546420, 546421, 546422, 546423, 546424, 546425, 546426 },
		{ 546427, 546428, 546429, 546430, 546431, 546432, 546433, 546434, 546435 },
		{ 546436, 546437, 546438, 546439, 546440, 546441, 546442, 546443, 546444 },
		{ 546445, 546446, 546447, 546448, 546449, 546450, 546451, 546452, 546453 },
		{ 546454, 546455, 546456, 546457, 546458, 546459, 546460, 546461, 546462 },
		{ 546463, 546464, 546465, 546466, 546467, 546468, 546469, 546470, 546471 },
		{ 546472, 546473, 546474, 546475, 546476, 546477, 546478, 546479, 546480 },
			}  

	local lv3buff = { 622530, 622531, 622532, 622533, 622534, 622535, 622536, 622537, 622538 }   -- 9種

	CastSpell(PlayerID, PlayerID, 850123 )
	if choice == 10 then
	--	Say(PlayerID, "Choice1")
		Setflag(PlayerID, lv3key[month][1], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[1].."]".."]" , C_SYSTEM ) 
		-- 星座寵物回應了你的請求，現在召喚寵物可以獲得[$VAR1]的效果。
	elseif choice == 20 then
	--	Say(PlayerID, "Choice2")
		Setflag(PlayerID, lv3key[month][2], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[2].."]".."]" , C_SYSTEM ) 
	elseif choice == 30 then
	--	Say(PlayerID, "Choice3")
		Setflag(PlayerID, lv3key[month][3], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[3].."]".."]" , C_SYSTEM ) 
	elseif choice == 40 then
	--	Say(PlayerID, "Choice4")
		Setflag(PlayerID, lv3key[month][4], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[4].."]".."]" , C_SYSTEM ) 
	elseif choice == 50 then
	--	Say(PlayerID, "Choice5")
		Setflag(PlayerID, lv3key[month][5], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[5].."]".."]" , C_SYSTEM ) 
	elseif choice == 60 then
	--	Say(PlayerID, "Choice6")
		Setflag(PlayerID, lv3key[month][6], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[6].."]".."]" , C_SYSTEM ) 
	elseif choice == 70 then
	--	Say(PlayerID, "Choice6")
		Setflag(PlayerID, lv3key[month][7], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[7].."]".."]" , C_SYSTEM ) 
	elseif choice == 80 then
	--	Say(PlayerID, "Choice6")
		Setflag(PlayerID, lv3key[month][8], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[8].."]".."]" , C_SYSTEM ) 
	elseif choice == 90 then
	--	Say(PlayerID, "Choice6")
		Setflag(PlayerID, lv3key[month][9], 1 )
		ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..lv3buff[9].."]".."]" , C_SYSTEM ) 

	end

end
