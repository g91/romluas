function Yuyu_GuildWarBuliding_2_01() -- ���|�ԮɡA�i�M�Ҽt�B�A�СB���t�j�\��  --------------------------------------���x��o��

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 31)  then
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

		SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( TargetID() , "touch" , "Yuyu_GuildWarBuliding_2_02" , 100 )	--���|���Ԯ�
	end
end

function Yuyu_GuildWarBuliding_2_02() -- ���|�ԮɡA�i�M�Ҽt�B�A�СB���t�j

--	Say( TargetID() ,"TargetID"..1 )--�ؿv��
--	Say( OwnerID() ,"OwnerID"..1 )--���a

	if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return	
	end
-- 2011.11.23 �����Z���A�Z���~�A�����۰����� -- �o�� Target busy
--	local Buffed = CheckBuff( OwnerID() , 621751 )
--	SysCastSpellLv( TargetID() , OwnerID() , 496587 , 0 )
--	if Buffed== false then
--		CallPlot( OwnerID() , "Lua_GuildWar_Ranger" , 50 )  --�ˬdNPC�P���a���Z��
--	end
---------------------------------------------------------------------------
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	local Record = 500 --��s�һݾ��Z
	local Energy = 500 --��s�һݯ�q

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

		local BuildingOrgID_1 = {112703,112704,112705,112706,112707,112708,112709,112710,112711,112712} --�i�M�Ҽt�j 10���Ť�OrgID---------------------------------------------/*�ܼơ�
		local BuildingOrgID_2 = {112810,112811,112812,112813,112814,112815,112816,112817,112818,112819} --�i�A�Сj10���Ť�OrgID
		local BuildingOrgID_3 = {113141,113142,113143,113144,113145,113146,113147,113148,113149,113150} --�i���t�j10���Ť�OrgID
		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2 , BuildingOrgID_3 }---------------------------------------------------------------------------------------/*�ܼơ�
		local BuildingNum = 0

		local BuildStr = {
				  "[SC_YU_GUILDWAR_W6_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�M�Ҽt

			                  "[SC_YU_GUILDWAR_W7_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�A��

			                  "[SC_YU_GUILDWAR_W8_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" --���t
											  }--��޻�����

		local BStr_A = 0	

		local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID

--Say( OwnerID() ,"TargetOrgID="..TargetOrgID )

		local BuildingLV = 0 --�ؿv������
		--*/

-- 2011.11.21 ���t�ӭn�D�A�ƼƦP�ؿvBuff���i���|�A���M��ӫؿv�̰����� --
	--	�w���� Server Script 701642 243�檺�a�϶}���@����
	--	if Z402_AreaBuff == nil then	-- �M�Ҽt�B�A�СB�@���
	--		Z402_AreaBuff = {}
	--	end
	--	if Z402_AreaBuff[RoomID] == nil then				-- �ŧi�� Room 
	--		Z402_AreaBuff[RoomID] = {}
	--	end
		if Z402_AreaBuff[RoomID][BuildingGuildID] == nil then		-- �ŧi�Ӱ}��
			Z402_AreaBuff[RoomID][BuildingGuildID] = {}
		end	
		if Z402_AreaBuff[RoomID][BuildingGuildID][505420] == nil then	-- �M�Ҽt ���K����
			Z402_AreaBuff[RoomID][BuildingGuildID][505420] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505421] == nil then	-- �M�Ҽt �j�ƨ���
			Z402_AreaBuff[RoomID][BuildingGuildID][505421] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505418] == nil then	-- �A�� �_�ݤ���
			Z402_AreaBuff[RoomID][BuildingGuildID][505418] = 0 			
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505419] == nil then	-- �A�� �G�k����
			Z402_AreaBuff[RoomID][BuildingGuildID][505419] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505422] == nil then	-- ���� �j�ƨ���
			Z402_AreaBuff[RoomID][BuildingGuildID][505422] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505423] == nil then	-- ���� �]�k�@��
			Z402_AreaBuff[RoomID][BuildingGuildID][505423] = 0
		end
--
		for i= 1 , 10 do

			if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�
				BuildingLV = i  --�ؿv������
				BuildingNum = 1
				BStr_A = BuildStr[1]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --�M�Ҽt ���`�@��

			elseif TargetOrgID == BuildingOrgID[2][i] then 
				BuildingLV = i  --�ؿv������
				BuildingNum = 2
				BStr_A = BuildStr[2]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --�A�� ���`�@��

			elseif TargetOrgID == BuildingOrgID[3][i] then 
				BuildingLV = i  --�ؿv������
				BuildingNum = 3
				BStr_A = BuildStr[3]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --���t ���`�@��

			end
		end
--Say( OwnerID() ,"BuildingLV="..BuildingLV )

		--*\���q�P�_�ؿv������

		local Technology = {  } --�ӫؿv���i�Ǥ�Buff�ޯู�X�M��
		-- 2011.11.21  �s�W�A²�ƥ����ܼƦW�� -- 
		local UpdataLv = {}
		--
		if  BuildingNum == 1 then
			Technology = {  505420 , 505421  } --�i�M�Ҽt�j�i�Ǥ�Buff�ޯู�X�M��
			UpdataLv = { Z402_AreaBuff[RoomID][BuildingGuildID][Technology[1]] , Z402_AreaBuff[RoomID][BuildingGuildID][Technology[2]] }
		elseif  BuildingNum == 2 then
			Technology = {  505418 , 505419 } --�i�A�Сj�i�Ǥ�Buff�ޯู�X�M��
			UpdataLv = { Z402_AreaBuff[RoomID][BuildingGuildID][Technology[1]] , Z402_AreaBuff[RoomID][BuildingGuildID][Technology[2]] }
		elseif  BuildingNum == 3 then
			Technology = {  505422 , 505423  } --�i���t�j�i�Ǥ�Buff�ޯู�X�M��
			UpdataLv = { Z402_AreaBuff[RoomID][BuildingGuildID][Technology[1]] , Z402_AreaBuff[RoomID][BuildingGuildID][Technology[2]] }
		end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�

		local NowBuff_A_LV = 0	--�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
		local NowBuff_B_LV = 0	--�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��

		local BuffType = 0
		local Count = BuffCount ( TargetID())---------------------------------------------------------****���BBUFF���b�ؿv�����W(���x��o��)

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

				local BuffID = BuffInfo ( TargetID() , j , EM_BuffInfoType_BuffID )  -- �򥻪k�NID
				local BuffLv = BuffInfo( TargetID() , j , EM_BuffInfoType_Power )  --�ӫؿv�� j ��BUFF������

				if CountMagic == 1 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --�ӫؿv�ثe�߱o��BUFF_A_�ޯ൥��
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --�ӫؿv�ثe�߱o��BUFF_B_�ޯ൥��

					end

				elseif  CountMagic == 2 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --�ӫؿv�ثe�߱o��BUFF_A_�ޯ൥��
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --�ӫؿv�ثe�߱o��BUFF_B_�ޯ൥��

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
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		local CountMagic = table.getn(Technology)--�`�@�i�Ǫ���޼ƶq
		-- 2011.11.21  �s�W�A²�ƥ����ܼƦW�� -- 
		local Title = {} 
			Title[1] = UpdataLv[1]+1
			Title[2] = UpdataLv[2]+1			
		--
--Say( OwnerID() ,"CountMagic="..CountMagic )
		if CheckBuff( OwnerID() , 501570) == false then
		--	if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then
			if CountMagic == 1 and (BuildingLV >= UpdataLv[1]+1 ) then
--Say( OwnerID() ,"D="..1 )		
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(Title[1]) } --��o���-��ަW��LV1
				TransferSelect[1] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) then
			elseif CountMagic == 1 and (BuildingLV < Title[1]) then
--Say( OwnerID() ,"D="..2 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SO_EXIT]" }

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end	
		--	elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV >= Title[1]) and (BuildingLV >= Title[2]) then
--Say( OwnerID() ,"D="..3 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(Title[1]) }	-- ��o�޳N�G LV 
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(Title[2]) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV >= Title[2]) then
--Say( OwnerID() ,"D="..4 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(Title[2]) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV >= Title[1]) and (BuildingLV < Title[2]) then
--Say( OwnerID() ,"D="..5 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..Title[1] }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
				TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV < Title[2]) then
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
				return 0
			end

			while true do
				RunTime = RunTime + 1
				if RunTime  > 300 then -- ���L�a�j��A600 = �@����
					DebugMsg( 0 , RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				end
				-- 2013.08.27 ���E:�[�J�Z���˴��A�L���ɦ۰���������
				local Distance = GetDistance( PlayerID , TargetID() )	-- �d�ߪ��a�P�𤧶����Z��
				if Distance >= 50 then
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
			--	Say( PlayerID , DialogStatus )
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
			--	elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) and DialogStatus == 0 then
				elseif CountMagic == 1 and (BuildingLV < Title[1]) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --�ǲߵ��ŹF�W��
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) and DialogStatus == 0 then
				elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV >= Title[2]) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
				elseif CountMagic == 2 and (BuildingLV >= Title[1]) and (BuildingLV < Title[2]) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 0 then
				elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV < Title[2]) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
				elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV < Title[2]) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif DialogStatus == 0 then
					if (Now_R >= Record) and (Now_E >= Energy) then
					--	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_A_LV  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 ,  BuildingNum  ) --2011.11.24 �O���ҭn��o���ؿv��	
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  Title[1]  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[1]  ) --�O���ҭn��o���޳N
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_2_03", 0 )
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
					--	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_B_LV  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 ,  BuildingNum  ) --2011.11.24 �O���ҭn��o���ؿv��	
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  Title[2]  ) --�O���ҭn��o���޳N����
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[2]  ) --�O���ҭn��o���޳N
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_2_03", 0 )
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
				Sleep(1)
			end
		
		else--���p�S��buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		end

	end --�n�P�_�O�_�����|�����ɸѰ���end

end

function Yuyu_GuildWarBuliding_2_03() -- ���|�ԮɡA�i�M�Ҽt�B�A�СB���t�j
--	Say( OwnerID() ,"OwnerID") --�ؿv��
--	Say( TargetID() ,"TargetID") -- ���a
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_2_04", 0 )

end

function Yuyu_GuildWarBuliding_2_04() -- ���|�ԮɡA�i�M�Ҽt�B�A�СB���t�j

--	Say( OwnerID() ,"OwnerID") --���a
--	Say( TargetID() ,"TargetID") -- �ؿv��
	local Player = OwnerID()
	local Energy = 500--��q
	local Record = 500--���Z

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
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
--	Say(OwnerID() , "ZoneID = "..ZoneID )

	local truecast = 60			--/*��ެ�o�һݮɶ�
	local BookMagicID = 505308		--/*����motion

	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --��o��w��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --��o��w��

	if BeginCastBar( OwnerID(), "["..Technology.."]".." [U_LV]"..TechLV , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*�}�l�I�k
--	if BeginCastBar( OwnerID(), "["..Technology.."]".." [U_LV]"..TechLV+1 , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*�}�l�I�k

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
	--			CancelBuff( OwnerID() , Technology )
	--			CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff_Tech" , Technology , 0)--������o����ޡA�i�|�[�L�������e�@��
				Lua_GUILDWAR_ShareBuff(Technology , -1 , 1)
				local BUOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID
				local BU = LuaFunc_SearchRoomNPCbyOrgID( TargetID() , BUOrgID , 1 )--�j�M����NPC
				local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
				-- 2011.11.24 �ؿv���W Buff
				local BuildingNum = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )
				local BuildGuildID
				local BuildingOrgID = {}
				local ALLBUOrgID
					if BuildingNum == 1 then
						BuildingOrgID = {112703,112704,112705,112706,112707,112708,112709,112710,112711,112712} --�i�M�Ҽt�j 10���Ť�OrgID
					elseif BuildingNum == 2 then
						BuildingOrgID = {112810,112811,112812,112813,112814,112815,112816,112817,112818,112819} --�i�A�Сj10���Ť�OrgID
					elseif BuildingNum == 3 then
						BuildingOrgID = {113141,113142,113143,113144,113145,113146,113147,113148,113149,113150} --�i���t�j10���Ť�OrgID
					end
				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				local NPCCount = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
				local NPCObj
				local NPC = { ObjID }
				local Max = 0
				local FeedBack
		
				if NPCCount ~= 0 then
					for i = 1 , NPCCount , 1 do
						FeedBack = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
						NPCObj=Role:New(FeedBack)
						if NPCObj:IsNPC() == true then
							BuildGuildID = GetRoleCampID(FeedBack)--�ؿv�����}��
							if PlayerGuildID == BuildGuildID then
								ALLBUOrgID = ReadRoleValue( FeedBack , EM_RoleValue_OrgID )
								for j = 1 , table.getn(BuildingOrgID) , 1 do
									if ALLBUOrgID == BuildingOrgID[j] then
									--	Say( FeedBack , "["..Technology.."]"..TechLV )
									--	Say( OwnerID() , "ObjID = "..ALLBUOrgID.."Reg+7 = "..BuildingNum )
										if j >= TechLV then
											CancelBuff( FeedBack , Technology )
											AddBuff( FeedBack , Technology , TechLV-1 , -1 )	--������o�����
											Max = Max + 1
											break
										end
									end
								end
							end
						end
					end
				--	Say( OwnerID() , "Max = "..Max )
				end
				
				--GuildItem �@���d��зǪ�����ID
				--NPCOrgID �n�j�M��NPC�˪OID
				--Type �� 0 �u��@�ӡA�S���^�� -1
				--     1 ������d�򤺪��x�}
				--     �i����A �w�]��0
				--	for i=0,table.getn(BU)-1 do	
				--		local BuildGuildID = GetRoleCampID(BU[i])--�ؿv�����}��
				--		if PlayerGuildID == BuildGuildID then
				--			AddBuff( BU[i] , Technology , 0 , -1)	--������o�����
				--		end
				--	end


				if PlayerGuildID == 7 then --�Ŧ�}��
					local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

					ScriptMessage( OwnerID(),-1,2,Str.."|cff00ffff".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					ScriptMessage( OwnerID(),-1,0,Str.."|cff00ffff".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

				elseif PlayerGuildID == 8 then --����}��
					local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

					ScriptMessage( OwnerID(),-1,2,Str.."|cffff3232".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					ScriptMessage( OwnerID(),-1,0,Str.."|cffff3232".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

				end

				WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			end

			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 , 0  ) --2011.11.24 �M�ũҭn��o���ؿv��
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --�M�ŭn��o���޳N����
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --�M�ŭn��o���޳N

		elseif ( result == "DAME" ) then	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 , 0  ) --2011.11.24 �M�ũҭn��o���ؿv��
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --�M�ŭn��o���޳N����
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --�M�ŭn��o���޳N
			CancelBuff( OwnerID() , BookMagicID )
			-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--��o����
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
			--
		--	ScriptMessage( OwnerID(),OwnerID(),1,back,C_SYSTEM)	--��o���_�A�k�ٹw�s�귽�G��q250�B���Z500
		--	ScriptMessage( OwnerID(),OwnerID(),0,back,C_SYSTEM)
		--	GiveBodyItem( OwnerID() , 206685 , Record ) --���پ��Z50
		--	AddGuildWarEnergy( OwnerID() , Energy ) --���ٯ�q50
		end

	end
end

function Lua_GuildWar_Recall_BuildLv( Select , EnterZone )	-- 2011.11.22 �s�W���ի��O�A�^���M�Ҽt�B�A�СB������s�k�N�ɯŪ��A
								-- 2011.11.23 �s�W�i�J���|���ԮɡA�����������a�A�M�Ҽt�B�A�СB������e��ޤɯŪ� Buff�C
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local BuildingGuildID = ReadRoleValue( Player , EM_RoleValue_GuildID )
	local Buff = { 505420 , 505421 , 505418 , 505419 , 505422 , 505423 }
	
	if Select == nil then
		Select = 0
	end

	if Z402_AreaBuff[RoomID][BuildingGuildID] ~= nil then	-- �M�Ҽt�B�A�СB����
		if Select ~= 0 then
			if Z402_AreaBuff[RoomID][BuildingGuildID][Select] ~= nil then
				Say( Player , "["..Select.."]".." Lv = "..Z402_AreaBuff[RoomID][BuildingGuildID][Select] )
			end
		else
	    		for i = 1 , table.getn(Buff) , 1 do
	    			if Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]] ~= nil then
	    				Say( Player , "["..Buff[i].."]".." Lv = "..Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]] )
	    			end
	    			if EnterZone ~= nil and Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]] > 0 then
					AddBuff( Player , Buff[i] , Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]]-1 , -1 )
				end
	    		end
	    	end
	else
		DebugMsg( Player , RoomID , "Nothing Happens" )
	--	Say( Player , "Nothing Happens" )
	end
end

function Lua_GuildWar_Get_Energy(num)	-- 2011.11.22 �s�W���ի��O ���o��q

	local Player = OwnerID()
	if num <= 10000 then
		AddGuildWarEnergy( Player , Num )
	end
end

function Lua_GuildWar_Get_Merit(num)	-- 2011.11.22 �s�W���ի��O ���o���|���Z

	local Player = OwnerID()
	local Maximum = 1000
	local Count = math.ceil( num / Maximum )	-- �L����i��
	local Integer = math.floor( num / Maximum )	-- ���
	local Remainder = num % Maximum		-- �l��

	if num <= 10000 then
		if Count > 1 then
			for i = 1 , Count , 1 do
				if i == Count and Remainder ~= 0 then
					GiveBodyItem( Player , 206685 , Remainder )
				else
					GiveBodyItem( Player , 206685 , Maximum )
				end
			end
		else
			GiveBodyItem( Player , 206685 , num )
		end
	end
end

function Lua_GuildWar_Ranger( dis )	--  2011.11.22 �s�W���ի��O �Z���W�L�Y������ܵ���

	local Player = OwnerID()
	local BuffID = 621751
	local BuffIDPos , NpcGuid
	while true do
		BuffIDPos = Lua_BuffPosSearch( Player , BuffID )			-- �� Buff ����m
		NpcGuid = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- �� Buff �I�i��
	--	Say( NpcGuid , "Pos = "..BuffIDPos.." Npc = "..NpcGuid.." Dis = "..dis )
		if GetDistance( Player , NpcGuid )  >= dis then
			CancelBuff_NoEvent( Player , 501570 )
			DialogClose( Player )
			WriteRoleValue( NpcGuid , EM_RoleValue_Register+2 , 1 ) --�Ѱ���w�i�A����o
		--	WriteRoleValue( NpcGuid , EM_RoleValue_Register , 0 ) --�Ѱ���w�i�A����o
		--	WriteRoleValue( NpcGuid , EM_RoleValue_PID , 0 ) --�Ѱ���w�i�A����o
			break
		end
		sleep(1)
	end
	CancelBuff_NoEvent( Player , BuffID )
end