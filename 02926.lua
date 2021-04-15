-------------------------------
-- LV3 �� ��13���d��

-- �ϥ��d�����~�ɰ���@��
function lua_mika_starpet_lv3_mon13()
	local PlayerID = OwnerID()

	local magicid = 850297  	-- lv3 �l���d���k�N���Xid   
	local count = 10
	local mon13key = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }   -- 10�اޯ�key

	for i = 1 , count do
		if CheckFlag(PlayerID, mon13key[i] )  == true then  -- 
			CastSpell(PlayerID, PlayerID, magicid )  -- �l��X�d��
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
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
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
	TransferSelect[10] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_01]" )  -- SC_STARPETS_01  ��ܷQ�n�o���d�����A�W�[����O�a�C
	AddBuff( PlayerID , 501570,0,-1);

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
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 1 then -- �ﶵ2
		--	Say(PlayerID, "choice2")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 20   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 2 then  -- �ﶵ3
	--		Say(PlayerID, "choice3")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 30   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 3 then --  �ﶵ4
	--		Say(PlayerID, "choice4")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 40   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 4 then -- �ﶵ5
	--		Say(PlayerID, "choice5")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 50   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 5 then -- �ﶵ6
	--		Say(PlayerID, "choice6")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 60   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 6 then -- �ﶵ7
	--		Say(PlayerID, "choice7")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 70   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 7 then -- �ﶵ8
	--		Say(PlayerID, "choice8")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 80   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )

			break
		elseif DialogStatus == 8 then -- �ﶵ9
	--		Say(PlayerID, "choice9")
			WriteRoleValue(  PlayerID  , EM_RoleValue_PID , 90   ) 
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			CallPlot( PlayerID , "lua_mika_starpet_lv3_mon13_sure" , 0 )
			break
		elseif DialogStatus == 9 then -- �ﶵ10
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


function lua_mika_starpet_lv3_mon13_sure() -- �T�w�O�_����
	local PlayerID = OwnerID()

	if CheckBuff( PlayerID , 501570) == true then 
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID ) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0

	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --�T�w
	TransferSelect[1] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( PlayerID , EM_LuaDialogType_Select , "[SC_STARPET_02]" ) --�T�w�n��ܳo�ӯ�O�ܡH��ܫ�N�L�k�ܧ�I

	AddBuff(PlayerID , 501570,0,-1);
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

function lua_mika_starpet_lv3_mon13_ok()   --�̫�B�J
	local PlayerID = OwnerID()
	local choice = ReadRoleValue(PlayerID , EM_RoleValue_PID  )

	local mon13key = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }   -- 10�اޯ�key
	local mon13buff = { 622786, 622787, 622788, 622789, 622790, 622791, 622792, 622793, 622794, 622795 }   -- 10��buff

	DesignLog( OwnerID() , 120926 , "got lv3 month-speical " ) -- �I�����y
	CastSpell(PlayerID, PlayerID, 850123 )  -- �S��

	for i = 1, #mon13key do   -- 10
		if( i*10) == choice then   -- i �� 10 �� =���a��pid
		--	Say(PlayerID, "Choice"..i )
			Setflag(PlayerID, mon13key[i], 1 )
			ScriptMessage( PlayerID , PlayerID , 1 , "[SC_STARPET_03][$SETVAR1=".."["..mon13buff[i].."]".."]" , C_SYSTEM ) 
			-- �P�y�d���^���F�A���ШD�A�{�b�l���d���i�H��o[$VAR1]���ĪG�C

		end
	end
end


------------ �U�C�@�����b �򥻪k�N - �d���Q�l��X�� ��llua  

function mika_starpet_mon13_bufflv3_1()
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local todaykeyid = 546483  -- Lv3�P�y�d�C��key
	local petlist = 106949

--	say(pet, "petorgid ="..petid )
--	say(master, "master")
	Callplot(OwnerID(), "Hao_Pet_SetModeEx", 0 )
	if CheckFlag( master, todaykeyid ) == true then
		CastSpell(pet, pet, 499363 )  -- �d���n���ĪG
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
	local todaykeyid = 546483  -- Lv3�P�y�d�C��key

	local mon13key = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }   -- 10�اޯ�key
	local mon13buff = { 622786, 622787, 622788, 622789, 622790, 622791, 622792, 622793, 622794, 622795 }   -- 10��buff

	sleep(10)
	for i = 1 , keycount do
		if CheckFlag( master, mon13key[i] ) == true then
			CastSpell(Pet, master, 850124 )  -- �~�[�S��
			AddBuff( master, mon13buff[i], 0,10800)  -- ���ĪGbuff   3hr 
		--	Say(master, "mon13key = "..i..","..mon13key[i]..", mon13buff ="..mon13buff[i] )
			break
		end

	end
	Setflag( master, todaykeyid, 1 )   --   ����  Lv3�P�y�d�C��key

end