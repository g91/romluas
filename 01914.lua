--���@�u�f���ʨ��b
function Lua_Hao_Korea_ICafes_Transfer_Check()

	local Attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )	--�P�_�O�_�i�J�԰� 1= �O 0= �_
	local Dead = ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Zone = ZoneID - 1000*math.floor( ZoneID / 1000 )

	if Attack == 0 and Dead == 0 and Zone <= 99 then
		return true
	elseif Zone > 99 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 0 ) -- �A����b���ϥ�
		return false
	elseif Attack ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_1]" , 0 ) -- �A����b�԰����ϥΦ����~
		return false
	end

end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_ICafes_Transfer_00()
	BeginPlot( OwnerID() , "Lua_Hao_Korea_ICafes_Transfer_01" , 0 )
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_ICafes_Transfer_01()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	--DialogClose( OwnerID() )
	--CancelBuff( OwnerID(), 501570 );--
	
--	Sleep(1)	-- ��������ߧY����

	local Zone = {}
		Zone[0] = { "[ZONE_ROGSHIRE]" , 1 , -1154.7 , 36.2 , -5547.8 , 227.5 }			-- Zone 1 ù����
		Zone[1] = { "[ZONE_VARANAS]" , 2 , 2297.8 , -1.0 , 1153.1 , 39 }			-- Zone 2 �Z��R����
		Zone[2] = { "[ZONE_ARGENFALL]" , 4 , -5917 , 592.8 , 2887 , 105 }			-- Zone 4 ���r��
		Zone[3] = { "[ZONE_HAROLFE TRADING POST]" , 5 , -14466.2 , 755.7 , -170 , 284.6 }	-- Zone 5 �����ҥ����
		Zone[4] = { "[ZONE_OBSIDIAN BASTION]" , 6 , -20460 , -190.2 , 6506.9 , 280.1 }	-- Zone 6 ���`�ۭn��
		Zone[5] = { "[ZONE_AYEN CARAVAN]" , 10 , -38719.2 , 4.1 , 1572.4 , 128.4 }		-- Zone 10 �㺸���Ӷ�
		Zone[6] = { "[ZONE_LAGO]" , 11 , -29447.8 , 251.3 , -17651.8 , 19.6 }			-- Zone 11 �p�J��
		Zone[7] = { "[ZONE_STONES FURLOUGH]" ,  12 , 28502 , 295.6 , 3465.1 , 351.4}	-- Zone 12 ���椧�I
		Zone[8] = { "[SC_205764_2]" }							-- �U�@��
		Zone[9] = { "[SO_EXIT]" }								-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[Sys110530_szquestnpctext]" )   -- �A�Q�ǰe�����?
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0 , table.getn(Zone) , 1 do
 		DialogSelectStr( OwnerID() , Zone[i][1] )
	end

	if ( DialogSendOpen(OwnerID() ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
--		Time = Time+1
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������
--	 	if Time > 300 then  -- 30��L�ʧ@�A������ܵ���
--			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
--			DialogClose( OwnerID() )
--			CancelBuff( OwnerID(), 501570 );--
--			break
--		end
			if DialogStatus == -1 or DialogStatus == 9 then -- ���_
				CancelBuff( OwnerID(), 501570 );--
				DialogClose( OwnerID() )
				Step = 1
			elseif DialogStatus == 8 then
				CancelBuff( OwnerID(), 501570 );--
				DialogClose( OwnerID() )
				BeginPlot( OwnerID() , "Lua_Hao_Korea_ICafes_Transfer_02" , 0 )
				Step = 1
			elseif DialogStatus ~= -2 then	-- -2 = ��l��
				CancelBuff( OwnerID(), 501570 );--
				DialogClose( OwnerID() )
				ChangeZone( OwnerID() , Zone[DialogStatus][2] , 0 , Zone[DialogStatus][3], Zone[DialogStatus][4] , Zone[DialogStatus][5] , Zone[DialogStatus][6] )
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_ICafes_Transfer_02()
	BeginPlot( OwnerID() , "Lua_Hao_Korea_ICafes_Transfer_03" , 0 )
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_ICafes_Transfer_03()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	--DialogClose( OwnerID() )
	--CancelBuff( OwnerID(), 501570 );--
--	Sleep(1)	-- ��������ߧY����

	local Zone = {}
		Zone[0] = { "[ZONE_DUST HOLD]" , 3 , 13855 , 26.7 , 6748 , 301.9 }			-- Zone 3 �o�󫰹�
		Zone[1] = { "[ZONE_BOULDERWIND]" , 7 , 19672 , 11 , 21907 , 195.7 }		-- Zone 7 ������
		Zone[2] = { "[ZONE_THE GREEN TOWER]" , 8 , 5915.7 , 220.8 , 20614.6 , 32.9 }		-- Zone 8 �񤧶�
		Zone[3] = { "[ZONE_TITANS HILL]" , 9 , -11306.9 , 972.1 , 26315 , 175.6 }		-- Zone 9 �������C
		Zone[4] = { "[SO_BACK]" }								--�W�@��
		Zone[5] = { "[SO_EXIT]" }								-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[Sys110530_szquestnpctext]" )   -- �A�Q�h����?
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0 , table.getn(Zone) , 1 do
 		DialogSelectStr( OwnerID() , Zone[i][1] )
	end

	if ( DialogSendOpen(OwnerID() ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
--		Time = Time+1
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������
--	 	if Time > 300 then  -- 30��L�ʧ@�A������ܵ���
--			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
--			DialogClose( OwnerID() )
--			CancelBuff( OwnerID(), 501570 );--
--			break

--		end
			if DialogStatus == -1 or DialogStatus == 5 then -- ���_
				CancelBuff( OwnerID(), 501570 );--
				DialogClose( OwnerID() )
				Step = 1
			elseif DialogStatus == 4 then
				CancelBuff( OwnerID(), 501570 );--
				DialogClose( OwnerID() )
				BeginPlot( OwnerID() , "Lua_Hao_Korea_ICafes_Transfer_00" , 0 )
				Step = 1
			elseif DialogStatus ~= -2 then	-- -2 = ��l��
				CancelBuff( OwnerID(), 501570 );--
				DialogClose( OwnerID() )
				ChangeZone( OwnerID() , Zone[DialogStatus][2] , 0 , Zone[DialogStatus][3], Zone[DialogStatus][4] , Zone[DialogStatus][5] , Zone[DialogStatus][6] )
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end