function Yuyu_GuildWarBuliding_1_01() -- ���|�ԮɡA�i�ǰ|�B�ճ��B�Ϯ��]�B���\�j�\��

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

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
	
		AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--�QNPC�����ˮ`�W�[ �k�N���� 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
		SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_2",0 )     --�Ϯ��]���`�@��
		SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_1_02" , 125 )	--���|���Ԯ�
	end
end

function Yuyu_GuildWarBuliding_1_02() -- ���|�ԮɡA�i�ǰ|�B�ճ��B�Ϯ��]�B���\�j

--	Say( TargetID() ,"TargetID"..3 ) --�ؿv��
--	Say( OwnerID() ,"OwnerID"..3 ) --���a

	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end

	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	local Record = 50 --��s�һݾ��Z
	local Energy = 50 --��s�һݯ�q

--	local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
--	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z

--	Say(  OwnerID() ,"Now_R ="..Now_R )
--	Say(  OwnerID() ,"Now_E ="..Now_E )

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

--	Say(  OwnerID() ,"SetA  BuffLv ="..SetA )
--	Say(  OwnerID() ,"SetB  BuffLv ="..SetB )

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
--		Say(  OwnerID() ,"Record ="..Record )
		Record = math.ceil(Record)--�p���I�H�U���˥h
--		Say(  OwnerID() ,"math.ceil(Record) ="..Record )
	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
--		Say(  OwnerID() ,"Energy ="..Energy )
		Energy = math.ceil(Energy)--�p���I�H�U���˥h
--		Say(  OwnerID() ,"math.ceil(Energy) ="..Energy )
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

		local BuildingOrgID_1 = {112916,112917,112918,112919,112920,112921,112922,112923,112924,112925} --�i�ǰ|�j 10���Ť�OrgID---------------------------------------------/*�ܼơ�
		local BuildingOrgID_2 = {112896,112897,112898,112899,112900,112901,112902,112903,112904,112905} --�i�ճ��j10���Ť�OrgID
		local BuildingOrgID_3 = {112688,112689,112690,112691,112692,112693,112694,112695,112696,112697} --�i�Ϯ��]�j10���Ť�OrgID
		local BuildingOrgID_4 = {112467,112468,112469,112470,112471,112472,112473,112474,112475,112476} --�i���\�j10���Ť�OrgID
		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2 , BuildingOrgID_3, BuildingOrgID_4  }--------------------------------------------------------------------/*�ܼơ�
		local BuildingNum = 0


		local BuildStr = {
				  "[SC_YU_GUILDWAR_W1_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�ǰ|

			                  "[SC_YU_GUILDWAR_W2_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�ճ�

			                  "[SC_YU_GUILDWAR_W3_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�Ϯ��]

			                  "[SC_YU_GUILDWAR_W4_02][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" --���\
											  }--��޻�����

		local BStr_A = 0	

		local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID

--Say( OwnerID() ,"TargetOrgID="..TargetOrgID )

		local BuildingLV = 0 --�ؿv������

		--*/

		for i= 1 , 10 do

			if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�
				BuildingLV = i  --�ؿv������
				BuildingNum = 1
				BStr_A = BuildStr[1]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_2",0 )     --�ǰ|���`�@��

			elseif TargetOrgID == BuildingOrgID[2][i] then 
				BuildingLV = i  --�ؿv������
				BuildingNum = 2
				BStr_A = BuildStr[2]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --�ճ����`�@��

			elseif TargetOrgID == BuildingOrgID[3][i] then 
				BuildingLV = i  --�ؿv������
				BuildingNum = 3
				BStr_A = BuildStr[3]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_2",0 )     --�Ϯ��]���`�@��

			elseif TargetOrgID == BuildingOrgID[4][i] then 
				BuildingLV = i  --�ؿv������
				BuildingNum = 4
				BStr_A = BuildStr[4]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --���\���`�@��
			end
		end
--Say( OwnerID() ,"BuildingLV="..BuildingLV )

		--*\���q�P�_�ؿv������

		local Technology = {  } --�ӫؿv���i�Ǥ�Buff�ޯู�X�M��

		if  BuildingNum == 1 then
			Technology = {  505309 , 505310  } --�i�ǰ|�j�i�Ǥ�Buff�ޯู�X�M��

		elseif  BuildingNum == 2 then
			Technology = {  505317 , 505318  } --�i�ճ��j�i�Ǥ�Buff�ޯู�X�M��

		elseif  BuildingNum == 3 then
			Technology = {  505312 , 505313  } --�i�Ϯ��]�j�i�Ǥ�Buff�ޯู�X�M��

		elseif  BuildingNum == 4 then
			Technology = {  505315 } --�i���\�j�i�Ǥ�Buff�ޯู�X�M��

		end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�


		local NowBuff_A_LV = 0 --�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
		local NowBuff_B_LV = 0	--�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��

		--*/

--Say( OwnerID() ,"NowBuff_A_LV_1="..NowBuff_A_LV )
--Say( OwnerID() ,"NowBuff_B_LV_1="..NowBuff_B_LV )

		local BuffType = 0
		local Count = BuffCount ( OwnerID())

--Say( OwnerID() ,"Count="..Count )
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

--Say( OwnerID() ,"CountMagic="..CountMagic )

				local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )  -- �򥻪k�NID
				local BuffLv = BuffInfo( OwnerID() , j , EM_BuffInfoType_Power )  --�Ӫ��a�� j ��BUFF������

--Say( OwnerID() ,"j="..j )
--Say( OwnerID() ,"BuffID="..BuffID )
--Say( OwnerID() ,"Technology[CountMagic]="..Technology[1] )
--Say( OwnerID() ,"Technology[CountMagic]="..Technology[2] )
--Say( OwnerID() ,"BuffLv="..BuffLv )


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
		--*\���q�P�_���a�ثe���W����޵���

		--************************************************************ �Ƶ�
		--BuildingLV --�ؿv������
		--NowBuff_A_LV = BuffLv--�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
		--NowBuff_B_LV = BuffLv--�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��
		--Technology[1]--�i��o���1
		--Technology[2]--�i��o���2
		--************************************************************	

		local Techa = Technology[1]
		local Techb = Technology[2]
--		BuildingLV = BuildingLV-1

--Say( OwnerID() ,"BuildingLV="..BuildingLV )
--Say( OwnerID() ,"NowBuff_A_LV_2="..NowBuff_A_LV )
--Say( OwnerID() ,"NowBuff_B_LV_2="..NowBuff_B_LV )
--Say( OwnerID() ,"["..Techa.."]".."="..Techa )
--Say( OwnerID() ,"["..Techb.."]".."="..Techb )

		local PlayerID = OwnerID()
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		local CountMagic = table.getn(Technology)--�`�@�i�Ǫ���޼ƶq

--Say( OwnerID() ,"CountMagic="..CountMagic )
		if CheckBuff( OwnerID() , 501570) == false then
			if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then

				--Say( OwnerID() ,"D="..1 )		

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) } --��o���-��ަW��LV1
				TransferSelect[1] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) then
				--Say( OwnerID() ,"D="..2 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SO_EXIT]" }

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end	

			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..3 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..4 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..5 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..6 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			end


			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
				CancelBuff( OwnerID(), 501570 );--
				return 0
			end

			while true do
				Sleep(2)
				RunTime = RunTime + 1
				if RunTime  > 100 then -- ���L�a�j��A600 = �@����
					DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
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
				elseif CountMagic == 1 and DialogStatus == 1 then
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and DialogStatus == 2 then
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break

				elseif DialogStatus == -1 then
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break

				elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --�ǲߵ��ŹF�W��
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break


				elseif DialogStatus == 0 then

					if (Now_R >= Record) and (Now_E >= Energy) then
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_A_LV  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[1]  ) --�O���ҭn��o���޳N
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_03", 0 )
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--��o�һݤ���q����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break
					end

				elseif CountMagic == 2 and DialogStatus == 1 then

					if (Now_R >= Record) and (Now_E >= Energy) then

						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_B_LV  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[2]  ) --�O���ҭn��o���޳N
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_03", 0 )
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--��o�һݤ���q�B���Z����
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--��o�һݤ���q����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--��o�һݤ����Z����
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break
					end
				end
			end
		
		else--���p�S��buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		end

	end --�n�P�_�O�_�����|�����ɸѰ���end

end

function Yuyu_GuildWarBuliding_1_03() -- ���|�ԮɡA�i�ǰ|�B�[�u�t�B�ճ��B�Ϯ��]�B���\�j

	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_04", 0 )

end

function Yuyu_GuildWarBuliding_1_04() -- ���|�ԮɡA�i�ǰ|�B�[�u�t�B�ճ��B�Ϯ��]�B���\�j

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
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�Ӫ��a�� j ��BUFF������

			SetA = BuffLv

		elseif BuffID == 505312 then--�`���
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

--	Say(  TargetID() ,"SetA  BuffLv ="..SetA )
--	Say(  TargetID() ,"SetB  BuffLv ="..SetB )

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
--		Say(  TargetID() ,"Record ="..Record )
		Record = math.ceil(Record)--�p���I�H�U���˥h
--		Say(  TargetID() ,"math.ceil(Record) ="..Record )
	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
--		Say(  TargetID() ,"Energy ="..Energy )
		Energy = math.ceil(Energy)--�p���I�H�U���˥h
--		Say(  TargetID() ,"math.ceil(Energy) ="..Energy )
	end

---*---��
	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( OwnerID(),OwnerID(),1,str,C_SYSTEM)	--��o�}�l�A�w�����s�һݸ귽�G��q50�B���Z50
--	ScriptMessage( OwnerID(),OwnerID(),0,str,C_SYSTEM)	
--	AddGuildWarEnergy( OwnerID() , -Energy ) --������q50
--	DelBodyItem( OwnerID() , 206685 , Record ) --�������Z50
	local TechLV = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+8 ) --�ҭn��o���޳N����
	local Technology = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) --�ҭn��o���޳N
	-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--��o�}�l
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
--	Say( TargetID() ,"TargetID" )
--	Say( OwnerID() ,"OwnerID" )
--	Say( OwnerID() ,"TechLV="..TechLV )
--	Say( OwnerID() ,"Technology="..Technology )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
--	Say(OwnerID() , "ZoneID = "..ZoneID )
--	local Torch =  CountBodyItem( OwnerID() , 203025 )    
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
				break
			--
			else
				AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--�ϥή�
			end
		end

		if ( result == "OKOK" ) then
--			Say( TargetID() ,"TechLV="..TechLV )
--			Say( OwnerID() ,"Technology="..Technology )
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

function Yuyu_GuildWarBuliding_Sampol() -- ���|�ԮɡA�i�@�ΰѦ�NPC�j

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	ScriptMessage( OwnerID() , -1 , 0 , "Npc StartPlot" , C_RED )	-- ���հT��

	if (ZoneID == 402) or (ZoneID == 951)  then

		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��

	end

end


function Yuyu_GuildWarBuliding_TowerX() -- ���|�ԮɡA�i�a�A�����u�@��j

	SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
	SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V

	AddBuff( OwnerID() , 505921 , 49, -1 )		--50%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( OwnerID() , 505517 , 49, -1 )		--50%	--�QNPC�����ˮ`�馩 �k�N���� 0 = 1%
	AddBuff( OwnerID() , 505923 , 299, -1 )	--300%--����NPC�ˮ`�W�[ �k�N���� 0 = 1%

end

function Yuyu_GB_Sampol_NPC() -- ���|�ԮɡA�i�@�ΰѦ�NPC-�j�������j

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 31)  then
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		AddBuff( OwnerID() , 505513 , 79, -1 )	--80%--����NPC�ˮ`��z �k�N���� 0 = 1%
	end

end

function Yuyu_GB_Sampol_NPC_01() -- ���|�ԮɡA�i���I�u�@��(���ź�^)�j

	AddBuff( OwnerID() , 505517 , 94, -1 )		--95%	--�QNPC�����ˮ`�馩 �k�N���� 0 = 1%
	AddBuff( OwnerID() , 505923 , 599, -1 )	--600%--����NPC�ˮ`�W�[ �k�N���� 0 = 1%

end

function Yuyu_GB_Sampol_NPC_02() -- ���|�ԮɡA�i���I�u�@��(��^)�j

	AddBuff( OwnerID() , 505517 , 89, -1 )		--90%	--�QNPC�����ˮ`�馩 �k�N���� 0 = 1%
	AddBuff( OwnerID() , 505923 , 499, -1 )	--500%--����NPC�ˮ`�W�[ �k�N���� 0 = 1%

end