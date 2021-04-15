--廠商共用活動- 怪物召喚類

function Lua_mika_monstersum_0()
	Beginplot( OwnerID() ,"Lua_mika_monstersum_step1", 0 )
end

function Lua_mika_monstersum_step1()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_MOSTERSUMEVENT_S1_1]"  } -- LV 10
	TransferSelect[1] = { "[SC_MOSTERSUMEVENT_S1_2]"  } -- LV 20
	TransferSelect[2] = { "[SC_MOSTERSUMEVENT_S1_3]"  } -- LV 30
	TransferSelect[3] = { "[SC_MOSTERSUMEVENT_S1_4]"  } -- LV 40
	TransferSelect[4] = { "[SC_MOSTERSUMEVENT_S1_5]"  } -- LV 50
	TransferSelect[5] = { "[SC_MOSTERSUMEVENT_S1_6]"  } -- LV 60
	TransferSelect[6] = { "[SC_MOSTERSUMEVENT_S1_7]"  } -- LV 70
	TransferSelect[7] = { "[SC_MOSTERSUMEVENT_S1_8]"  } -- LV 75
	TransferSelect[8] = { "[SC_MOSTERSUMEVENT_DEL01]" }
	TransferSelect[9] = { "[SC_MOSTERSUMEVENT_DEL02]" }
	TransferSelect[10] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_TITLE1]" )
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		WriteRoleValue(OwnerID() , EM_RoleValue_Register, 0 )   
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0 )
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		elseif DialogStatus == 0 then  --lv10
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  1 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break
		elseif DialogStatus == 1 then --lv20
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID , 2   ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break

		elseif DialogStatus == 2 then  --lv30
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  3 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break

		elseif DialogStatus == 3 then -- lv40
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  4 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break

		elseif DialogStatus == 4 then --lv50
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  5 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break

		elseif DialogStatus == 5 then --lv60
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  6 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break
		elseif DialogStatus == 6 then --lv70
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  7 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break

		elseif DialogStatus == 7 then --lv75
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  8 ) 
			local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "monsterlv is "..Monlv.."" )
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step2", 0 )
			break
		elseif DialogStatus == 8 then -- KILL monster
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_delsure1", 0 )  --怪物
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 9 then -- KILL treasure
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_delsure2", 0 )  --寶箱
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 10 then -- Close
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
	end
end

function Lua_mika_monstersum_step2() -- 強度
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_MOSTERSUMEVENT_S2_1]" }
	TransferSelect[1] = { "[SC_MOSTERSUMEVENT_S2_2]"  }
	TransferSelect[2] = { "[SC_MOSTERSUMEVENT_S2_3]"  }
	TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_TITLE2]" )
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
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
		elseif DialogStatus == 0 then  --strength buff lv1
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 1 )
			local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
		--	Say (OwnerID(), "buffA is "..BuffA.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step3", 0 )
			DialogClose( PlayerID )
			
			break
		elseif DialogStatus == 1 then --strength buff lv2
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 2 )
			local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
		--	Say (OwnerID(), "buffA is "..BuffA.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step3", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then  --strength buff lv3
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 3 )
			local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
		--	Say (OwnerID(), "buffA is "..BuffA.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step3", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 3 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_monstersum_step3() -- 外觀
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_MOSTERSUMEVENT_S3_01]" }
	TransferSelect[1] = { "[SC_MOSTERSUMEVENT_S3_02]"  }
	TransferSelect[2] = { "[SC_MOSTERSUMEVENT_S3_03]"  }
	TransferSelect[3] = { "[SC_MOSTERSUMEVENT_S3_04]" }
	TransferSelect[4] = { "[SC_MOSTERSUMEVENT_S3_05]"  }
	TransferSelect[5] = { "[SC_MOSTERSUMEVENT_S3_06]"  }
	TransferSelect[6] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_TITLE3]" )
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

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
		elseif DialogStatus == 0 then  --Look buff lv1
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 1 )
			local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
		--	Say (OwnerID(), "buffB is "..BuffB.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step4", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then --Look buff lv2
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 2 )
			local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
		--	Say (OwnerID(), "buffB is "..BuffB.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then  --Look buff lv3
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 3 )
			local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
		--	Say (OwnerID(), "buffB is "..BuffB.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 3 then  --Look buff lv1
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 4 )
			local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
		--	Say (OwnerID(), "buffB is "..BuffB.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step4", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then --Look buff lv2
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 5 )
			local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
		--	Say (OwnerID(), "buffB is "..BuffB.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 5 then  --Look buff lv3
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 6 )
			local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
		--	Say (OwnerID(), "buffB is "..BuffB.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 6 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_monstersum_step4() -- 掉寶
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_MOSTERSUMEVENT_S4_01]" }
	TransferSelect[1] = { "[SC_MOSTERSUMEVENT_S4_02]"  }
	TransferSelect[2] = { "[SC_MOSTERSUMEVENT_S4_03]"  }
	TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_TITLE4]" )
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

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
		elseif DialogStatus == 0 then  --treasure buff lv1
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 1 )
			local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )
		--	Say (OwnerID(), "treasure is "..treasure.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_stepok", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then --treasure buff lv2
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 2 )
			local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )
		--	Say (OwnerID(), "treasure is "..treasure.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_stepok", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then  --treasure buff lv3
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 3 )
			local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )
		--	Say (OwnerID(), "treasure is "..treasure.."" )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_monstersum_stepok", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 3 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_monstersum_stepok() -- 確定是否產生
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_SURE01]" ) --確定要建立設定的怪物嗎？
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

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
			Beginplot( OwnerID() ,"Lua_mika_monstersum_step5", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_monstersum_step5()   --最後步驟
	local Monlv = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )  --強度
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )  -- 外觀
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  ) -- 寶物type
 
	Callplot( OwnerID() ,"Lua_mika_monstersum_born", Monlv, BuffA, BuffB, treasure  )

end
-----------------------------------------------------------------------------------------------------
function Lua_mika_monstersum_born(Monlv, BuffA, BuffB, treasure )
	local OID = OwnerID()
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OID , EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	local Dir  = ReadRoleValue( OID, EM_RoleValue_Dir )
	local monsterlist =  {
		{ 103925, 103926, 103927, 103928, 103929, 103930 } ,  -- LV10
		{ 104023, 104024, 104025, 104026, 104027, 104028 } ,  -- LV20
		{ 104029, 104030, 104031, 104032, 104033, 104034 } ,  -- LV30
		{ 104017, 104018, 104019, 104020, 104021, 104022 } ,   -- LV40
		{ 104113, 104114, 104115, 104116, 104117, 104118 } ,  -- LV 50
		{ 104119, 104120, 104121, 104122, 104123, 104124 } ,  -- LV 60
		{ 104127, 104128, 104129, 104130, 104131, 104132 } ,  -- LV 70
		{ 107376, 107377, 107378, 107379, 107380, 107381 }   -- LV 75
			}
	local monsterid = monsterlist[Monlv][BuffB]

	local bufflist = {506607, 506608, 506609 }
	local buffid = bufflist[BuffA]

--	say(OID, "Monlv ="..Monlv..", power ="..BuffA..",  kind "..BuffB.." , treasure "..treasure)
--	say(OID, "monsterid = "..monsterid..", buffid = "..buffid )

	local monster = CreateObj( monsterid , X+20 , Y , Z-20 , Dir  , 1 )
	SetModeEx( monster    , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( monster    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( monster    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( monster    , EM_SetModeType_Mark, true )--標記
	SetModeEx( monster    , EM_SetModeType_Move, true )--移動
	SetModeEx( monster    , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( monster   , EM_SetModeType_HideName, false )--名稱
	SetModeEx( monster , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( monster, EM_SetModeType_Fight , true )--可砍殺攻擊
	AddToPartition(monster , RoomID) 

	BeginPlot(monster, "Lua_mika_monstersum_move" , 0 )
	Hide(monster)
	Addbuff( monster, buffid, 0, -1) -- power lv
	sleep(10)

	if treasure == 1 then
	--	say(OID, "Treasure 1")
		SetPlot( monster , "dead","Lua_mika_monstersum_lv10trea",0 )  --寶箱1
	elseif treasure == 2 then
	--	say(OID, "Treasure 2")
		SetPlot( monster , "dead","Lua_mika_monstersum_lv20trea",0 )  --寶箱2
	elseif treasure == 3 then
	--	say(OID, "Treasure 3")
		SetPlot( monster , "dead","Lua_mika_monstersum_lv30trea",0 )  --寶箱3
	end
	sleep(10)
	Show( monster, RoomID )
end

function Lua_mika_monstersum_delsure1() -- 確定是否刪除怪物
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_SURE02]" ) --確定要刪除周圍所有的召喚怪物嗎？
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

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
			Beginplot( OwnerID() ,"Lua_mika_monstersum_del", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

-----------------------------------------------------------------------------------------------------
function Lua_mika_monstersum_delsure2() -- 確定是否刪除寶箱
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_MOSTERSUMEVENT_SURE03]" ) -- 確定要刪除周圍所有的寶箱嗎？
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

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
			Beginplot( OwnerID() ,"Lua_mika_monstersum_delbox", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

-----------------------------------------------------清除所有召喚怪-----------------------------------------------------------
function Lua_mika_monstersum_del()
	local OID = OwnerID()
	local OrgID = { 
		103925, 103926, 103927, 103928, 103929, 103930 ,  -- LV10
		104023, 104024, 104025, 104026, 104027, 104028 ,  -- LV20
		104029, 104030, 104031, 104032, 104033, 104034 ,  -- LV30
		104017, 104018, 104019, 104020, 104021, 104022,   -- LV40
		104113, 104114, 104115, 104116, 104117, 104118 ,  -- LV 50
		104119, 104120, 104121, 104122, 104123, 104124 ,  -- LV 60
		104127, 104128, 104129, 104130, 104131, 104132 ,  -- LV 70
		107376, 107377, 107378, 107379, 107380, 107381    -- LV 75
		}

	Lua_DavisDelObj(OrgID)
 
end

-----------------------------------------------------清除所有寶箱-----------------------------------------------------------
function Lua_mika_monstersum_delbox()  
	local OID = OwnerID()
	local OrgID = { 114989, 114990, 114991 }

	Lua_DavisDelObj(OrgID)

end
----------------------------------------------------------------------------------
--測試用指令

function Lua_mika_monstersum_show()   -- 顯示各個選項數值
	local OID = OwnerID()
	local Monlv = ReadRoleValue(OID , EM_RoleValue_PID  )
	local BuffA = ReadRoleValue(OID , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OID , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OID , EM_RoleValue_Register+3  )

	say(OID, "Monlv ="..Monlv..", power ="..BuffA..",  kind "..BuffB.." , treasure "..treasure)

end