function Yuyu_GuildWarBuliding_5_00()--�i�A�����ߡj

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (ZoneID == 402) or (ZoneID == 31)  then

		local BuildingOrgID = {112906,112907,112908,112909,112910,112911,112912,112913,112914,112915}  --�i�A�����ߡj 10���Ť�OrgID
		local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID

		for i= 1 , 10 do

			if OwnerIDOrgID == BuildingOrgID[i] then ------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�

				if i == 1 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600167 , "Test_Shop_Close" );

				elseif i == 2 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600168 , "Test_Shop_Close" );

				elseif i == 3 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600169 , "Test_Shop_Close" );

				elseif i == 4 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600170 , "Test_Shop_Close" );

				elseif i == 5 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600171 , "Test_Shop_Close" );

				elseif i == 6 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600172 , "Test_Shop_Close" );

				elseif i == 7 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600173 , "Test_Shop_Close" );

				elseif i == 8 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600174 , "Test_Shop_Close" );

				elseif i == 9 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600175 , "Test_Shop_Close" );

				elseif i == 10 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600176 , "Test_Shop_Close" );
				end

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
		
		AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--�QNPC�����ˮ`�W�[ �k�N���� 0 = 1%
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
		SetCursorType( OwnerID() , eCursor_Shop ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_5_01" , 125 )	--���|���Ԯ�
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --�[�u�t���`�@��
	end
end


function Yuyu_GuildWarBuliding_5_01()--�i�A�����ߡj

		local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
		local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
		local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
		local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
		local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

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
			OpenShop()
		end

end

function Yuyu_GuildWarBuliding_5_water_00(ItemMagic)--�i�A������--�Ĥ�(�ˬd)�j

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	local Type = Davis_CheckUse(OwnerID(),ItemMagic) --  �Ǧ^ 0 �N��N�o�����i�ϥ�

	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
--		Say(OwnerID() ,Type)
		if Type  == 0 then --�D�N�o��
			UseItemDestroy()--�R���ϥΤ������~
			return true
		else
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
			return false
	end

end

--=============================================================================================================*****

function Yuyu_GuildWarBuliding_BigSP_00()--�i�j���I�j

	SetMinimapIcon ( OwnerID(), EM_MapIconType_GuildMan );
	SetShop( OwnerID() , 600179 , "Test_Shop_Close" );

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (ZoneID == 402) or (ZoneID == 31)  then
		SetCursorType( OwnerID() , eCursor_Shop ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_BigSP_01" , 60 )	--���|���Ԯ�
	end

end

function Yuyu_GuildWarBuliding_BigSP_01()--�i�j���I�j

		local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
		local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
		local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

		local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
		local BuildingGuildID = GetRoleCampID( TargetID() )--�ؼа}��

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
			OpenShop()
		end

end

function Yuyu_GuildWarBuliding_BigSP2_00()--�i�p���I�j

	SetMinimapIcon ( OwnerID(), EM_MapIconType_GuildMan );
	SetShop( OwnerID() , 600178 , "Test_Shop_Close" );

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (ZoneID == 402) or (ZoneID == 31)  then
		SetCursorType( OwnerID() , eCursor_Shop ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_BigSP2_01" , 60 )	--���|���Ԯ�
	end

end

function Yuyu_GuildWarBuliding_BigSP2_01()--�i�p���I�j

		local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
		local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
		local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

		local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
		local BuildingGuildID = GetRoleCampID( TargetID() )--�ؼа}��

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
			OpenShop()
		end

end

--=============================================================================================================*****


function Yuyu_GuildWarBuliding_3_02() -- ���|�ԮɡA�i�\���j

--	Say( TargetID() ,"TargetID"..1 )--��
--	Say( OwnerID() ,"OwnerID"..1 )--���a

	if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
	local BuildingGuildID = GetRoleCampID( TargetID() )--�ؼа}��
	local judge = 0 --�P�_�O�_�OGM �� �P���| ...��
	local judge_2 = 0 --�P�_�O�_�O���i�@�Τ��ؿv��	

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

	
--�P�_0�@�O�_���i�@�ΰϰ�
	if (ZoneID == 402) or (ZoneID == 31) or ZoneID == 951 then

--�P�_1�@�O�_���P�}��
		if (PassCard > 0) then
			judge = 1

		elseif PlayerGuildID == BuildingGuildID then

			judge = 1

		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --�A���O�����|������
			ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
			judge = 0
		end

--�P�_3�@�O�_�����m���ؿv��
		if (judge == 1) then


			local BuildingOrgID_1 = {102481} --�i�V���j��OrgID----------------------------------------------------------------------------------------------------------------------/*�ܼơ�
			local BuildingOrgID_2 = {102482} --�i��ı����j��OrgID
			local BuildingOrgID_3 = {102483} --�i�a�A���ߡj��OrgID
			local BuildingOrgID_4 = {102484} --�i�t����j��OrgID
			local BuildingOrgID_5 = {102485} --�i�]�V��j��OrgID
			local BuildingOrgID_6 = {102486} --�i�q���j��OrgID
			local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2 , BuildingOrgID_3 , BuildingOrgID_4 , BuildingOrgID_5 , BuildingOrgID_6 }-------------------------------/*�ܼơ�
			local BuildingNum = 0


			local BuildStr = {
				                  "[SC_YU_GUILDWAR_WT05_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --�V���
				                  "[SC_YU_GUILDWAR_WT06_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --��ı����
				                  "[SC_YU_GUILDWAR_WT04_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --�a�A����
				                  "[SC_YU_GUILDWAR_WT03_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --�t����
					  "[SC_YU_GUILDWAR_WT01_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--�]�V��
				                  "[SC_YU_GUILDWAR_WT02_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"--�q���
												  }--��޻�����

			local BStr_A = 0

			local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID



			local BuildingLV = 0 --�ؿv������

			--*/

			for i= 1 , 1 do

				if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�

					BuildingLV = i  --�ؿv������
					BuildingNum = 1
					BStr_A = BuildStr[1]

				elseif TargetOrgID == BuildingOrgID[2][i] then 

					BuildingLV = i  --�ؿv������
					BuildingNum = 2
					BStr_A = BuildStr[2]

				elseif TargetOrgID == BuildingOrgID[3][i] then 

					BuildingLV = i  --�ؿv������
					BuildingNum = 3
					BStr_A = BuildStr[3]

				elseif TargetOrgID == BuildingOrgID[4][i] then 

					BuildingLV = i  --�ؿv������
					BuildingNum = 4
					BStr_A = BuildStr[4]

				elseif TargetOrgID == BuildingOrgID[5][i] then 

					BuildingLV = i  --�ؿv������
					BuildingNum = 5
					BStr_A = BuildStr[5]

				elseif TargetOrgID == BuildingOrgID[6][i] then 

					BuildingLV = i  --�ؿv������
					BuildingNum = 6
					BStr_A = BuildStr[6]

				end
			end
	--Say( OwnerID() ,"BuildingLV="..BuildingLV )

			--*\���q�P�_�ؿv������

			local Technology = {  } --�ӫؿv���i�Ǥ�Buff�ޯู�X�M��

			if  BuildingNum == 1 then
				Technology = {  505251 } --�i�V���j�i�Ǥ�Buff�ޯู�X�M��

			elseif  BuildingNum == 2 then
				Technology = {  505251 } --�i��ı����j�i�Ǥ�Buff�ޯู�X�M��

			elseif  BuildingNum == 3 then
				Technology = {  505251  } --�i�a�A���ߡj�i�Ǥ�Buff�ޯู�X�M��

			elseif  BuildingNum == 4 then
				Technology = {  505255 , 505251 } --�i�t����j�i�Ǥ�Buff�ޯู�X�M��

			elseif  BuildingNum == 5 then
				Technology = {  505249 , 505786  } --�i�]�V��j�i�Ǥ�Buff�ޯู�X�M��

			elseif  BuildingNum == 6 then
				Technology = {  505253 , 505787 } --�i�q���j�i�Ǥ�Buff�ޯู�X�M��

			end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*�ܼơ�


			local NowBuff_A_LV = 0 --�Ӫ��a�ثe�߱o��BUFF_A_�ޯ൥��
			local NowBuff_B_LV = 0	--�Ӫ��a�ثe�߱o��BUFF_B_�ޯ൥��

			--*/

	--Say( OwnerID() ,"NowBuff_A_LV_1="..NowBuff_A_LV )
	--Say( OwnerID() ,"NowBuff_B_LV_1="..NowBuff_B_LV )

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

			if CheckBuff( OwnerID() , 501570) == false then  
				if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then

					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]" } --��o���-��ަW��LV1
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

					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]" }
					TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]" }
					TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

					DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
					AddBuff(OwnerID() , 501570,0,-1);
					for i = 0, table.getn( TransferSelect ) do
						DialogSelectStr( OwnerID() , TransferSelect[i][1] )
					end

				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
		--Say( OwnerID() ,"D="..4 )

					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --��o���-��ަW��(��o����)
					TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]" }
					TransferSelect[2] = { "[SO_EXIT]" }				-- ���}���

					DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
					AddBuff(OwnerID() , 501570,0,-1);
					for i = 0, table.getn( TransferSelect ) do
						DialogSelectStr( OwnerID() , TransferSelect[i][1] )
					end

				elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
		--Say( OwnerID() ,"D="..5 )
					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]" }
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
					return 0
				end
				while true do
					Sleep(2)
					RunTime = RunTime + 1
					if RunTime > 60 then -- ���m�W�L30��,�۰����������C
						ScriptMessage( PlayerID , PlayerID , 0 , "[SC_BK_BUFFNPC_08]", 0 )
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break
					end
					--2013.07.19 ���E�G�N�ˬd��q�P���Z�Ѱj��~�ܧ󬰰j�餺�A�ץ����a�I���ɡA�b��q�ξ��Z���������p�U�A�̵M�����ܫؿv�A�ɭP��q���t�Ȫ����D�C
					local Now_E = GetGuildWarEnergy(OwnerID()) --�ثe��q
					local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z				
					--					
					-- 2013.06.28 ���E:�[�J�Z���˴��A�L���ɦ۰���������
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
							Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_3_03", 0 )
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
							Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_3_03", 0 )
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
			
			else--���p�S�����abuff 501570
				ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
			end

		end --�n�P�_�O�_�����|�����ɸѰ���end
	end
end

function Yuyu_GuildWarBuliding_3_03() -- ���|�ԮɡA�i�\���j
--	Say( OwnerID() ,"OwnerID") --�ؿv��
--	Say( TargetID() ,"TargetID") -- ���a

	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_3_04", 0 )

end

function Yuyu_GuildWarBuliding_3_04() -- ���|�ԮɡA�i�\���j

--	Say( OwnerID() ,"OwnerID") -- ���a
--	Say( TargetID() ,"TargetID") --�ؿv��
	----- 2011.11.11 �ץ��}�ҹ�ܵ�����A�IĲ���I����q�����A�I�k���s�b���P�ɡA���U��o�޳N��A
	--�y���ӫؿv���L�k�A�}�ҹ�ܵ��������D�A�H�ά�o�޳N�S���ɯšA�B��������q�P���|�Ծ��Z���|�k�٪����D�C�{�b�w�Q�ץ��C
	local Player = OwnerID()
	local Tower = TargetID()
	local Step = 0
	-----
	local Energy = 50--��q
	local Record = 50--���Z

---*---�H�U�P�_���a�O�_���ǲߧ馩�޳N
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505313 then--�Z�ľ�
			local BuffLv = BuffInfo ( Player , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		elseif BuffID == 505312 then--�`���
			local BuffLv = BuffInfo ( Player , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		end
	end

--	Say(  Tower ,"SetA  BuffLv ="..SetA )
--	Say(  Tower ,"SetB  BuffLv ="..SetB )

	if SetA>-1 then

		Record = Record*(1-((SetA+1)*0.05))
--		Say(  Tower ,"Record ="..Record )
		Record = math.ceil(Record)--�p���I�H�U���˥h
--		Say(  Tower ,"math.ceil(Record) ="..Record )
	end
	if SetB>-1 then

		Energy = Energy*(1-((SetB+1)*0.05))
--		Say(  Tower ,"Energy ="..Energy )
		Energy = math.ceil(Energy)--�p���I�H�U���˥h
--		Say(  Tower ,"math.ceil(Energy) ="..Energy )
	end

---*---��
	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( Player,Player,1,str,C_SYSTEM)	--��o�}�l�A�w�����s�һݸ귽�G��q50�B���Z50
--	ScriptMessage( Player,Player,0,str,C_SYSTEM)	
--	AddGuildWarEnergy( Player , -Energy ) --������q50
--	DelBodyItem( Player , 206685 , Record ) --�������Z50
	-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--��o�}�l
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local TechLV = ReadRoleValue( Player  ,EM_RoleValue_Register+8 ) --�ҭn��o���޳N����
	local Technology = ReadRoleValue( Player  ,EM_RoleValue_Register+9 ) --�ҭn��o���޳N

	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID ) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local truecast = 60			--/*��ެ�o�һݮɶ�
	local BookMagicID = 505308		--/*����motion

	if (ReadRoleValue( Player , EM_RoleValue_Register ) ~= 0) or (ReadRoleValue( Tower , EM_RoleValue_Register ) == 1) then
		ScriptMessage( Player,Player,1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end

	WriteRoleValue( Player , EM_RoleValue_Register, Tower ) --��o��w��
	WriteRoleValue( Tower , EM_RoleValue_Register, 1 ) --��o��w��
	WriteRoleValue( Player , EM_RoleValue_PID, 1 ) --��o��w��
	WriteRoleValue( Tower , EM_RoleValue_PID, 1 ) --��o��w��
	
	if BeginCastBar( Player, "["..Technology.."]" , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*�}�l�I�k

		AddBuff( Player , BookMagicID , 0 , -1 )		--�ϥή�		
			
			while true do		
				sleep( 2 );		
				local CastBarStatus = CheckCastBar( Player );
				-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
				local Now_E = GetGuildWarEnergy( Player ) --�ثe��q
				local Now_R = CountBodyItem( Player , 206685 ) --�ثe���Z
				--					
				if ( CastBarStatus ~= 0 ) then 		
					if ( CastBarStatus > 0) then -- ���\		
						result = "OKOK"		
						EndCastBar( Player , CastBarStatus )		
						break;		
					elseif ( CastBarStatus < 0 ) then -- ����		
						result = "DAME"		
						EndCastBar( Player , CastBarStatus )		
						break;		
					end
				-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
				elseif (CheckID( Tower ) == false) or Now_E < Energy or Now_R < Record then		
					result = "DAME"		
					EndCastBar( Player , CastBarStatus )		
					break;		
				else		
					AddBuff( Player , BookMagicID , 0 , -1 )		--�ϥή�		
				end		
			end	
				
			if ( result == "OKOK" ) then		
				if CheckID( Tower ) == true then
					-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
					AddGuildWarEnergy( Player , -Energy )	--������q
					DelBodyItem( Player , 206685 , Record )	--�������Z
					ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	--��o�����G���ӯ�q[$VAR1]�B���Z[$VAR2]
					ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
					--	
					CastSpell( Player, Player ,491010) -- ��o�����@�ίS��		
					CancelBuff( Player , BookMagicID )		
					CancelBuff( Tower , Technology )		
					AddBuff( Tower , Technology , TechLV , -1 )	--������o�����		

					local TechNAME = "|cffffff00".."["..Technology.."]".."[U_LV]"..(TechLV+1).."|r"		
					--Say(Player,TechNAME)		
					local str = "[SC_YU_GUILDWAR_BUILD_04][$SETVAR1=".."]"--[$VAR1] �w���\����o�����C		
					--Say(Player,str)		
					ScriptMessage( Player,Player,1,TechNAME..str,0)	--��o����		
					ScriptMessage( Player,Player,0,TechNAME..str,0)	--��o����		
					WriteRoleValue( Tower , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o		
					WriteRoleValue( Tower , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o		
				end		
				WriteRoleValue( Player , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o		
				WriteRoleValue( Player , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o		
				WriteRoleValue( Player  , EM_RoleValue_Register+8 , 0  ) --�M�ŭn��o���޳N����		
				WriteRoleValue( Player  , EM_RoleValue_Register+9 , 0  ) --�M�ŭn��o���޳N		

			elseif ( result == "DAME" ) then
				Step = 1
			end		
	--	end	-- 2011.11.11 �B��
	else	-- 2011.11.11
		Step = 2
	end
	
	if Step >= 1 then
		WriteRoleValue( Player , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o		
		WriteRoleValue( Tower , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o		
		WriteRoleValue( Player , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o		
		WriteRoleValue( Tower , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o		
		WriteRoleValue( Tower , EM_RoleValue_Register+8 ,  0  ) --�M�ŭn��o���޳N����		
		WriteRoleValue( Player , EM_RoleValue_Register+9 ,  0  ) --�M�ŭn��o���޳N		
		CancelBuff( Player , BookMagicID )
		-- 2013.08.27 ���E:��o�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
		ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--��o����
		ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
		--						
	--	ScriptMessage( Player,Player,1,back,C_SYSTEM)	--��o���_�A�k�ٹw�s�귽�G��q50�B���Z50		
	--	ScriptMessage( Player,Player,0,back,C_SYSTEM)		
	--	GiveBodyItem( Player , 206685 , Record ) --���پ��Z50	
	--	AddGuildWarEnergy( Player , Energy ) --���ٯ�q50
	--	if Step > 1 then
	--		ScriptMessage( Player , Player , 1 , "[SC_BEER_2011_FN09]" , 0 )	-- �A�L�k�o�˰�
	--		ScriptMessage( Player , Player , 0 , "[SC_BEER_2011_FN09]" , 0 )	-- �A�L�k�o�˰�
	--	end
	end
end

--==================================================================================================================

-- 2012.0711 �s�W���yid ( 5.0.2 )
function Yuyu_GuildWarBuliding_king_01() -- ���|�ԮɡA�i���y�j�\��

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	
--	local objid = { 111780 }   -- lv1  lv2 , lv3
--	local mallid =  { 120879, 121242  , 121247,  121252}  -- mall01 , mall02 , mall03, mall04
		
	if ZoneID == 402 then
		local TargetOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID
		-- 2013.10.24 ���E:�ץ�6.0.3��s�W�������~�[�A�b���|���Զ}�l��A�I�����y�ɤ��|�X�{�ө������D
		-- ���y
		local Throne = {
				111780 ,	-- �@�G�T��
				120879 ,	-- �ӫ��~�[1
				121242 ,	-- �ӫ��~�[2
				121247 ,	-- �ӫ��~�[3
				121252 ,	-- �ӫ��~�[4
				122264 ,	-- �ӫ��~�[5
				122269 ,	-- �ӫ��~�[6
				122274		-- �ӫ��~�[7
						}

		for i = 1 , #Throne , 1 do
			if TargetOrgID == Throne[i] then
	--	if TargetOrgID == objid[1]  or  TargetOrgID == mallid[1]  or  TargetOrgID == mallid[2] or  TargetOrgID == mallid[3] or  TargetOrgID == mallid[4] then ---------------------------------------------------------------------/*�ܼơ�
	  			SetMinimapIcon ( OwnerID(), EM_MapIconType_GuildMan );
				SetShop( OwnerID() , 600179 , "Test_Shop_Close" );--���yshop
				SetCursorType( OwnerID() , eCursor_Shop ); --����ܦ� ����
				SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_king_02" , 100 )	--���|���Ԯ�
				SetModeEx( OwnerID() , EM_SetModeType_Mark, true )--�аO
				SetModeEx( OwnerID() , EM_SetModeType_HideName, false )--�W��
				SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( OwnerID() , EM_SetModeType_Move, false )--����
				SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--����
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, false )--����
				SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
				AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
				AddBuff( OwnerID() , 502707 , 1 , -1 ) --�D�԰������^�媺buff (ownerID,buff,LV,Time)
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
				break
			end
		end
	end
end
function Yuyu_GuildWarBuliding_king_02() -- ���|�ԮɡA�i���y�j�\��
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	if PlayerGuildID ~= BuildingGuildID then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --�A���O�����|������
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
		OpenShop()
	end
end