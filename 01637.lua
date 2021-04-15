function Yuyu_GuildWarBuliding_4_01() -- ���|�ԮɡA�i�[�u�t�B�L�u�t�j�\��

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 31)  then
		local BuildingOrgID_1 = {113151,113152,113153,113154,113155,113156,113157,113158,113159,113160}  --�i�[�u�t�j 10���Ť�OrgID---------------------------------------------/*�ܼơ�
		local BuildingOrgID_2 = {112934,112935,112936,112937,112938,112939,112940,112941,112942,112943} --�i�L�u�t�j10���Ť�OrgID

		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2  }--------------------------------------------------------------------/*�ܼơ�
		local TargetOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID


		for i= 1 , 10 do

			if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+5 ,  1  ) --�O����ؿv���ݩ�G�[�u�t
				SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  );
				SetShop( OwnerID() , 600177 , "Test_Shop_Close" );--�[�u�t��ؿv
				SetCursorType( OwnerID() , eCursor_Shop ); --����ܦ� ����
				SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_4_01_2" , 125 )	--���|���Ԯ�
				SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --�[�u�t���`�@��

			elseif TargetOrgID == BuildingOrgID[2][i] then 
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+5 ,  2  ) --�O����ؿv���ݩ�G�L�u�t
				SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon  );
				SetShop( OwnerID() , 600180 , "Test_Shop_Close" );--�L�u�t�����
				SetCursorType( OwnerID() , eCursor_Shop ); --����ܦ� ����
				SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_4_01_2" , 125 )	--���|���Ԯ�
				SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --�L�u�t���`�@��

			end
		end

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--����
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--�QNPC�����ˮ`�W�[ �k�N���� 0 = 1%
		AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
	end

end

function Yuyu_GuildWarBuliding_4_01_2()

	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end

	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local Kind = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) --�P�_�ؿv���ݩ�[�u�tor�L�u�t

	local Record = 50 --��s�һݾ��Z
	local Energy = 50 --��s�һݯ�q

	local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z

---*---�H�U�P�_���a�O�_���ǲߧ馩�޳N
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505313 then--�Z�ľ�
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������

			SetA = BuffLv

		elseif BuffID == 505312 then--�`���
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
		Record = math.ceil(Record)--�p���I�H�U���˥h

	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
		Energy = math.ceil(Energy)--�p���I�H�U���˥h

	end
	local judge = 0 --�P�_�O�_�OGM �� �P���| ...��

	if (PassCard > 0) then
		judge = 1

	elseif PlayerGuildID ~= BuildingGuildID then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --�A���O�����|������
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 

		judge = 0

	else
		judge = 1
	end

	if judge == 1 then

		local PlayerID = OwnerID()
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		if CheckBuff( OwnerID() , 501570) == false then
			if Kind == 1 then	--�ؿv���ݩ�G�[�u�t
				TransferSelect[0] = { "[SC_YU_GUILDWAR_W5_01]" }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_W5_02]" }
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_W5_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
				if( DialogSendOpen( OwnerID() ) == false ) then 
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
					return 0
				end
				while true do
					Sleep(5)
					RunTime = RunTime + 1
					if RunTime  > 100 then -- ���L�a�j��A600 = �@����
						DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
					-- 2013.08.27 ���E:�[�J�Z���˴��A�L���ɦ۰���������
					local Distance = GetDistance( PlayerID , TargetID() )	-- �d�ߪ��a�P�𤧶����Z��
					if Distance >= 125 then
						CancelBuff( PlayerID , 501570 )
						DialogClose( PlayerID )
						break
					end
					--					
					DialogStatus = DialogGetResult( PlayerID )
					--Say( PlayerID , DialogStatus )

					if DialogStatus == -2 then
						-- DO nothing
					elseif DialogStatus == 2 or DialogStatus == -1 then
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 0 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_5", 0 ) --�ӽЫؿv���ƥ]
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 1 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_3", 0 ) -- �[�u�t���޳N��s
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				end

			elseif Kind == 2 then	--�ؿv���ݩ�G�L�u�t

				TransferSelect[0] = { "[SC_YU_GUILDWAR_W9_01]" }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_W5_02]" }
				TransferSelect[2] = { "[SC_YU_GUILDWAR_W9_03]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_W9_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
				if( DialogSendOpen( OwnerID() ) == false ) then 
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
					return 0
				end
				while true do
					Sleep(2)
					RunTime = RunTime + 1
					if RunTime  > 100 then -- ���L�a�j��A600 = �@����
						DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
					-- 2013.08.27 ���E:�[�J�Z���˴��A�L���ɦ۰���������
					local Distance = GetDistance( PlayerID , TargetID() )	-- �d�ߪ��a�P�𤧶����Z��
					if Distance >= 125 then
						CancelBuff( PlayerID , 501570 )
						DialogClose( PlayerID )
						break
					end
					--					
					DialogStatus = DialogGetResult( PlayerID )
					--Say( PlayerID , DialogStatus )

					if DialogStatus == -2 then
						-- DO nothing
					elseif DialogStatus == 3 or DialogStatus == -1 then
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 0 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_5", 0 ) --�ӽЫؿv���ƥ]
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 1 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_3", 0 ) -- �[�u�t���޳N��s
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif DialogStatus == 2 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_7", 0 ) -- �Ͳ����ؤɯ�
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				end
			end
		
		else--���p�S��buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		end
	end

end

function Yuyu_GuildWarBuliding_4_01_5() --�ഫTargetID�BOwnerID��--�ӽЫؿv���ƥ]
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_02_1_shop", 0 )
end

function Yuyu_GuildWarBuliding_4_02_1_shop() --�i�[�u�t�B�L�u�t�j�}�Ұө�

	OpenShop()

end

function Yuyu_GuildWarBuliding_4_01_6()--�ഫTargetID�BOwnerID��
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_2", 0 )
end

function Yuyu_GuildWarBuliding_4_01_7() --�ഫTargetID�BOwnerID��-- �Ͳ����ؤɯ�
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_8", 0 )
end

function Yuyu_GuildWarBuliding_4_01_8() --�ഫTargetID�BOwnerID��-- �Ͳ����ؤɯ�
--TargetID�ؿv��

	if CheckBuff( TargetID() , 505937 ) == true then -- ���T�����Ͳ�BUFF

		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_33]",0)	--�ثe�i�Ͳ������ؤw�O�̰����šI
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_33]",0)	--

	else
		if CheckBuff( OwnerID() , 501570) == false then 
			local Record = 200 --��s�һݾ��Z
			local Energy = 200 --��s�һݯ�q
		--	local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
		--	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z

			local PlayerID = OwnerID()
			local CheckTime = 1
			local RunTime = 1
			local DialogStatus = 0
			local TransferSelect = {}
			local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
			TransferSelect[0] = { "[SC_OKAY]" }
			TransferSelect[1] = { "[SC_CANCEL]" }				-- ���}���
			
			
			DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_W9_04][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )--�ɯŧL�u�t�Ͳ��𫰾��㪺�s�y���ءC
			AddBuff(OwnerID() , 501570,0,-1);
			for i = 0, table.getn( TransferSelect ) do
				DialogSelectStr( OwnerID() , TransferSelect[i][1] )
			end
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
				return 0
			end
			while true do
				Sleep(2)
				RunTime = RunTime + 1
				if RunTime  > 100 then -- ���L�a�j��A600 = �@����
					DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				end
				-- 2013.08.27 ���E:�[�J�Z���˴��A�L���ɦ۰���������
				local Distance = GetDistance( PlayerID , TargetID() )	-- �d�ߪ��a�P�𤧶����Z��
				if Distance >= 125 then
					CancelBuff( PlayerID , 501570 )
					DialogClose( PlayerID )
					break
				end
				--				
				--2013.07.19 ���E�G�N�ˬd��q�P���Z�Ѱj��~�ܧ󬰰j�餺�A�ץ����a�I���ɡA�b��q�ξ��Z���������p�U�A�̵M�����ܫؿv�A�ɭP��q���t�Ȫ����D�C
				local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
				local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z				
				--

				DialogStatus = DialogGetResult( PlayerID )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif DialogStatus == 1 or DialogStatus == -1 then
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif DialogStatus == 0 then

					if (Now_R >= Record) and (Now_E >= Energy) then

						if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
							ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
							CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
							return
						else
							Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_9", 0 ) --�Ͳ����ؤɯ�
							CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
							break
						end

					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--��o�һݤ���q����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end

				end
			end
		
		else--���p�S��buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		end
	end
end

function Yuyu_GuildWarBuliding_4_01_9() -- ���|�ԮɡA�i�ǰ|�B�[�u�t�B�ճ��B�Ϯ��]�B���\�j
--	Say( OwnerID() ,"OwnerID") --�ؿv��
--	Say( TargetID() ,"TargetID") -- ���a
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_10", 0 )

end

function Yuyu_GuildWarBuliding_4_01_10() -- ���|�ԮɡA-- �Ͳ����ؤɯ�
	
	local Player = OwnerID()
	local Energy = 200--��q
	local Record = 200--���Z

	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( OwnerID(),OwnerID(),1,str,C_SYSTEM)	--��o�}�l�A�w�����s�һݸ귽�G��q50�B���Z50
--	ScriptMessage( OwnerID(),OwnerID(),0,str,C_SYSTEM)	
--	AddGuildWarEnergy( OwnerID() , -Energy ) --������q50
--	DelBodyItem( OwnerID() , 206685 , Record ) --�������Z50
	-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--��o�}�l
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 90			--/*��ެ�o�һݮɶ�
	local BookMagicID = 505308		--/*����motion


	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --��o��w��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --��o��w��


	if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_W9_03]" , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*�}�l�I�k

	AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--�ϥή�

		while true do
			sleep(2)
			local CastBarStatus = CheckCastBar( OwnerID() );
			-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			local Now_E = GetGuildWarEnergy( Player ) --�ثe��q
			local Now_R = CountBodyItem( Player , 206685 ) --�ثe���Z
			--
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C					
			elseif (CheckID( TargetID() ) == false) or Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			else
				AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--�ϥή�
			end
		end

		if ( result == "OKOK" ) then
			if CheckID( TargetID() ) == true then
				-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
				AddGuildWarEnergy( Player , -Energy )	--������q
				DelBodyItem( Player , 206685 , Record )	--�������Z
				ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	--��o�����G���ӯ�q[$VAR1]�B���Z[$VAR2]
				ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
				--		
				CastSpell( OwnerID(), OwnerID() ,491010) -- ��o�����@�ίS��
				CancelBuff( OwnerID() , BookMagicID )

				if CheckBuff( TargetID() , 505936 ) == true then -- ���G�����Ͳ�BUFF
					AddBuff( TargetID() , 505937 , 0 , -1 )		--���T��BUFF
					CancelBuff( TargetID() , 505936 )
					SetMinimapIcon ( TargetID(), EM_MapIconType_Weapon  );
					SetShop( TargetID() , 600182 , "Test_Shop_Close" );--�L�u�t�����
					local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

					if PlayerGuildID == 7 then --�Ŧ�}��
						local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( OwnerID(),-1,2,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( OwnerID(),-1,0,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

					elseif PlayerGuildID == 8 then --����}��
						local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( TargetID(),-1,2,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( TargetID(),-1,0,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

					end
				else
					AddBuff( TargetID() , 505936 , 0 , -1 )		--���G��BUFF

					SetMinimapIcon ( TargetID(), EM_MapIconType_Weapon  );
					SetShop( TargetID() , 600181 , "Test_Shop_Close" );--�L�u�t�����
					local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

					if PlayerGuildID == 7 then --�Ŧ�}��
						local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( TargetID(),-1,2,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( TargetID(),-1,0,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					elseif PlayerGuildID == 8 then --����}��

						local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( TargetID(),-1,2,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( TargetID(),-1,0,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					end

				end

				WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --�M�ŭn��o���޳N����
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --�M�ŭn��o���޳N

		elseif ( result == "DAME" ) then	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  0  ) --�M�ŭn��o���޳N����
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --�M�ŭn��o���޳N
			CancelBuff( OwnerID() , BookMagicID )
			-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--��o����
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
			--
		--	ScriptMessage( OwnerID(),OwnerID(),1,back,C_SYSTEM)	--��o���_�A�k�ٹw�s�귽�G��q50�B���Z50
		--	ScriptMessage( OwnerID(),OwnerID(),0,back,C_SYSTEM)
		--	GiveBodyItem( OwnerID() , 206685 , Record ) --���پ��Z50
		--	AddGuildWarEnergy( OwnerID() , Energy ) --���ٯ�q50
		end
	end
end

function Yuyu_GuildWarBuliding_5_build_00()--�i�[�u�t�B�L�u�t--�ϥ�(�ˬd)�j

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--���a�O�_�b����W

	if (ZoneID == 402) or (ZoneID == 951) or (PassCard > 0) then

		if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return false

		elseif (PlayerIsSit == true) then --���a�b����W
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) -- ����W�L�k�ϥ�
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) 
			return false
		else
			return true
		end

	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
			return false
	end

end

-->*===============================================================================================*<--

function Yuyu_GuildWarBuliding_4_01_3() --�ഫTargetID�BOwnerID��
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_02_2", 0 )
end

function Yuyu_GuildWarBuliding_4_01_4()--�ഫTargetID�BOwnerID��
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_2", 0 )
end

function Yuyu_GuildWarBuliding_4_02_2() -- ���|�ԮɡA�i�[�u�t�B�L�u�t�j�޳N
--	Say( TargetID() ,"TargetID"..3 ) --�ؿv��
--	Say( OwnerID() ,"OwnerID"..3 ) --���a
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	local Record = 50 --��s�һݾ��Z
	local Energy = 50 --��s�һݯ�q

--	local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
--	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z

---*---�H�U�P�_���a�O�_���ǲߧ馩�޳N
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505313 then--�Z�ľ�
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������

			SetA = BuffLv

		elseif BuffID == 505312 then--�`���
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
		Record = math.ceil(Record)--�p���I�H�U���˥h

	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
		Energy = math.ceil(Energy)--�p���I�H�U���˥h

	end

---*---��

	local judge = 0 --�P�_�O�_�OGM �� �P���| ...��

	if (PassCard > 0) then
		judge = 1

	elseif PlayerGuildID ~= BuildingGuildID then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --�A���O�����|������
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
		judge = 0

	else
		judge = 1
	end

	if judge == 1 then

		local BuildingOrgID_1 = {113151,113152,113153,113154,113155,113156,113157,113158,113159,113160}  --�i�[�u�t�j 10���Ť�OrgID---------------------------------------------/*�ܼơ�
		local BuildingOrgID_2 = {112934,112935,112936,112937,112938,112939,112940,112941,112942,112943} --�i�L�u�t�j10���Ť�OrgID

		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2  }--------------------------------------------------------------------/*�ܼơ�
		local BuildingNum = 0

		local BuildStr = {
				  "[SC_YU_GUILDWAR_W5_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�[�u�t

			                  "[SC_YU_GUILDWAR_W9_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"--�L�u�t
											  }--��޻�����
		local BStr_A = 0

		local StrBuild = {
				  "[SC_YU_GUILDWAR_W5_04]",	--�[�u�t

			                  "[SC_YU_GUILDWAR_W9_02]"	--�L�u�t
											  }--��޻�����
		local StrB_X = 0

		local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID

		local BuildingLV = 0 --�ؿv������

		--*/

		for i= 1 , 10 do------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�

			if TargetOrgID == BuildingOrgID[1][i] then		--�[�u�t
				BuildingLV = i  --�ؿv������
				BuildingNum = 1
				BStr_A = BuildStr[1]
				StrB_X = StrBuild[1]
			elseif TargetOrgID == BuildingOrgID[2][i] then 	--�L�u�t
				BuildingLV = i  --�ؿv������
				BuildingNum = 2
				BStr_A = BuildStr[2]
				StrB_X = StrBuild[2]
			end
		end

		--*\���q�P�_�ؿv������

		local Technology = {  } --�ӫؿv���i�Ǥ�Buff�ޯู�X�M��

		if  BuildingNum == 1 then
			Technology = {  505314  } --�i�[�u�t�j�i�Ǥ�Buff�ޯู�X�M��

		elseif  BuildingNum == 2 then
			Technology = {  505316 } --�i�L�u�t�j�i�Ǥ�Buff�ޯู�X�M��

		end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�

		local NowBuff_A_LV = 0 --�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
		local NowBuff_B_LV = 0	--�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��

		--*/
		local BuffType = 0
		local Count = BuffCount ( OwnerID())

		if Count ~= 0 then

			for j = 0 , Count do

				local CountMagic = table.getn(Technology)--�`�@�i�Ǫ���޼ƶq

				--*/
				if j+1 == 1 then
					CountMagic = 1
				elseif j+1 >= 2 and CountMagic == 2 then
					CountMagic = 2
				else
					CountMagic = 1
				end
				--*\���q�P�_��ޤ��}�C���

				local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )  -- �򥻪k�NID
				local BuffLv = BuffInfo( OwnerID() , j , EM_BuffInfoType_Power )  --�Ӫ��a�� j ��BUFF������

				if CountMagic == 1 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��

					end

				elseif  CountMagic == 2 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��

					end
			
				end

			end

		else
			NowBuff_A_LV = 0
			NowBuff_B_LV = 0
		end
		local Techa = Technology[1]
		local Techb = Technology[2]

		local PlayerID = OwnerID()
		local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		local CountMagic = table.getn(Technology)--�`�@�i�Ǫ���޼ƶq

		if CheckBuff( OwnerID() , 501570) == false then
			if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) } --��o���-��ަW��LV1
				TransferSelect[1] = { "[SC_111352_2]" }				--�^�W�@��
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , StrB_X )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SC_111352_2]" }
				TransferSelect[2] = { "[SO_EXIT]" }

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end	
			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			end

			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
				return 0
			end
			while true do
				Sleep(2)
				RunTime = RunTime + 1
				if RunTime  > 100 then -- ���L�a�j��A600 = �@����
					DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				end
				-- 2013.08.27 ���E:�[�J�Z���˴��A�L���ɦ۰���������
				local Distance = GetDistance( PlayerID , TargetID() )	-- �d�ߪ��a�P�𤧶����Z��
				if Distance >= 125 then
					CancelBuff( PlayerID , 501570 )
					DialogClose( PlayerID )
					break
				end
				--
				--2013.07.19 ���E�G�N�ˬd��q�P���Z�Ѱj��~�ܧ󬰰j�餺�A�ץ����a�I���ɡA�b��q�ξ��Z���������p�U�A�̵M�����ܫؿv�A�ɭP��q���t�Ȫ����D�C
				local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
				local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z				
				DialogStatus = DialogGetResult( PlayerID )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif CountMagic == 1 and DialogStatus == 2 then --���}
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and DialogStatus == 3 then --���}
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break

				elseif CountMagic == 1 and DialogStatus == 1 then --�^�W�@��
					Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_4", 0 ) 
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and DialogStatus == 2 then --�^�W�@��
					Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_4", 0 ) 
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif DialogStatus == -1 then
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --�ǲߵ��ŹF�W��
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif DialogStatus == 0 then
					if (Now_R >= Record) and (Now_E >= Energy) then
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_A_LV  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[1]  ) --�O���ҭn��o���޳N
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_03", 0 )
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--��o�һݤ���q����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				elseif CountMagic == 2 and DialogStatus == 1 then

					if (Now_R >= Record) and (Now_E >= Energy) then
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_B_LV  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[2]  ) --�O���ҭn��o���޳N
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_03", 0 )
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--��o�һݤ���q����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				end
			end
		
		else--���p�S�����abuff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		end

	end --�n�P�_�O�_�����|�����ɸѰ���end

end

function Yuyu_GuildWarBuliding_4_03() -- ���|�ԮɡA�i�[�u�t�j
--	Say( OwnerID() ,"OwnerID") --�ؿv��
--	Say( TargetID() ,"TargetID") -- ���a
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_04", 0 )

end

function Yuyu_GuildWarBuliding_4_04() -- ���|�ԮɡA�i�[�u�t�j

	local Player = OwnerID()
	local Energy = 50--��q
	local Record = 50--���Z

---*---�H�U�P�_���a�O�_���ǲߧ馩�޳N
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505313 then--�Z�ľ�
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������

			SetA = BuffLv

		elseif BuffID == 505312 then--�`���
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
		Record = math.ceil(Record)--�p���I�H�U���˥h

	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
		Energy = math.ceil(Energy)--�p���I�H�U���˥h

	end

---*---��

	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( OwnerID(),OwnerID(),1,str,C_SYSTEM)	--��o�}�l�A�w�����s�һݸ귽�G��q50�B���Z50
--	ScriptMessage( OwnerID(),OwnerID(),0,str,C_SYSTEM)	
--	AddGuildWarEnergy( OwnerID() , -Energy ) --������q50
--	DelBodyItem( OwnerID() , 206685 , Record ) --�������Z50
	-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--��o�}�l
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local TechLV = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+8 ) --�ҭn��o���޳N����
	local Technology = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) --�ҭn��o���޳N
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 60			--/*��ެ�o�һݮɶ�
	local BookMagicID = 505308		--/*����motion


	if (ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --��o��w��

	if BeginCastBar( OwnerID(), "["..Technology.."]".." [U_LV]"..TechLV+1 , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*�}�l�I�k

	AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--�ϥή�

		while true do
			sleep( 2 );
			local CastBarStatus = CheckCastBar( OwnerID() );
			-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			local Now_E = GetGuildWarEnergy( Player ) --�ثe��q
			local Now_R = CountBodyItem( Player , 206685 ) --�ثe���Z
			--
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			-- 2013.10.23 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			elseif (CheckID( TargetID() ) == false) or Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			--
			else
				AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--�ϥή�
			end
		end

		if ( result == "OKOK" ) then
			if CheckID( TargetID() ) == true then
				-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
				AddGuildWarEnergy( Player , -Energy )	--������q
				DelBodyItem( Player , 206685 , Record )	--�������Z
				ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	--��o�����G���ӯ�q[$VAR1]�B���Z[$VAR2]
				ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
				--			
				CastSpell( OwnerID(), OwnerID() ,491010) -- ��o�����@�ίS��
				CancelBuff( OwnerID() , BookMagicID )
				CancelBuff( OwnerID() , Technology )
				AddBuff( OwnerID() , Technology , TechLV , -1 )	--������o�����	

				local TechNAME = "|cffffff00".."["..Technology.."]".."[U_LV]"..(TechLV+1).."|r"
--Say(OwnerID(),TechNAME)
				local str = "[SC_YU_GUILDWAR_BUILD_04][$SETVAR1=".."]"--[$VAR1] �w���\����o�����C
--Say(OwnerID(),str)

				ScriptMessage( OwnerID(),OwnerID(),1,TechNAME..str,0)	--��o����
				ScriptMessage( OwnerID(),OwnerID(),0,TechNAME..str,0)	--��o����

				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --�M�ŭn��o���޳N����
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --�M�ŭn��o���޳N

		elseif ( result == "DAME" ) then	
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  0  ) --�M�ŭn��o���޳N����
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --�M�ŭn��o���޳N
			CancelBuff( OwnerID() , BookMagicID )
			-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--��o����
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
			--			
		--	ScriptMessage( OwnerID(),OwnerID(),1,back,C_SYSTEM)	--��o���_�A�k�ٹw�s�귽�G��q50�B���Z50
		--	ScriptMessage( OwnerID(),OwnerID(),0,back,C_SYSTEM)
		--	GiveBodyItem( OwnerID() , 206685 , Record ) --���پ��Z50
		--	AddGuildWarEnergy( OwnerID() , Energy ) --���ٯ�q50
		end

	end
end

-->*===============================================================================================*<--