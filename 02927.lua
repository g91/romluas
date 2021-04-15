-------------------------------
-- LV2 �� ��13���d��

-- �ϥ��d�����~�ɰ���@��
function lua_mika_starpet_lv2_mon13()
	local PlayerID = OwnerID()

	local magicid =  850299  -- lv2 �l���d���k�N���Xid   
	local count = 6
	local mon13key = { 547543, 547544, 547545, 547546, 547547, 547548 }

	for i = 1 , count do
		if CheckFlag(PlayerID, mon13key[i] )  == true then  
			CastSpell(PlayerID, PlayerID, magicid )  -- �l��X�d��
			break
		end
		if i  == 6 then
			-- �}�ҿ��
		--	Say(PlayerID, "Open menu")

			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_step1" , 0 )
		end
	end
end	


function lua_mika_starpet_lv2_mon13_step1()
	local PlayerID = OwnerID()

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
	TransferSelect[6] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_01]" )  -- SC_STARPETS_01  ��ܷQ�n�o���d�����A�W�[����O�a�C
	AddBuff( PlayerID , 501570,0, 10 );

	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end

	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end

	WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 0   ) 

	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 20 then -- ���L�a�j�� , 10�������
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
		elseif DialogStatus == 0 then  -- �ﶵ1
		--	Say(PlayerID, "choice1")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 10   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 )
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_sure" , 0 )
			break
		elseif DialogStatus == 1 then -- �ﶵ2
		--	Say(PlayerID, "choice2")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 20   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_sure" , 0 )
			break
		elseif DialogStatus == 2 then  -- �ﶵ3
	--		Say(PlayerID, "choice3")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 30   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_sure" , 0 )
			break
		elseif DialogStatus == 3 then --  �ﶵ4
	--		Say(PlayerID, "choice4")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 40   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_sure" , 0 )
			break
		elseif DialogStatus == 4 then -- �ﶵ4
	--		Say(PlayerID, "choice5")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 50   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_sure" , 0 )
			break
		elseif DialogStatus == 5 then -- �ﶵ5 
	--		Say(PlayerID, "choice6")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 60   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_sure" , 0 )
			break
		elseif DialogStatus == 6 then --  Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );
			break
		end
	end
end

			

function lua_mika_starpet_lv2_mon13_sure() -- �T�w�O�_����
	local PlayerID = OwnerID()

	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID ) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0

	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --�T�w
	TransferSelect[1] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_02]" ) --�T�w�n��ܳo�ӯ�O�ܡH��ܫ�N�L�k�ܧ�I

	AddBuff(PlayerID , 501570,0, 10 );
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end
	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end

	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 20 then -- ���L�a�j�� , 10�������
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
			CallPlot( PlayerID , "lua_mika_starpet_lv2_mon13_ok" , 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function lua_mika_starpet_lv2_mon13_ok()   --�̫�B�J
	local PlayerID = OwnerID()
	local choice = ReadRoleValue(PlayerID , EM_RoleValue_PID  )

	local mon13key = { 547543, 547544, 547545, 547546, 547547, 547548 }
	local mon13buff = { 622530, 622531, 622532, 622533, 622534, 622535 }   -- 6��

	DesignLog( OwnerID() , 120926 , "got lv2 month-speical " ) -- �I�����y
	CastSpell(PlayerID, PlayerID, 850123 )  -- �S��

	for i = 1, #mon13key do
		if (i*10) == choice then
		--	Say(PlayerID, "Choice"..i )
			Setflag(PlayerID, mon13key[i], 1 )
			ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..mon13buff[i].."]".."]" , C_SYSTEM ) 
			-- �P�y�d���^���F�A���ШD�A�{�b�l���d���i�H��o[$VAR1]���ĪG�C
			break
		end
	end
end