--====================================================================================================================

function Yuyu_GW_Siege_eq_1_00(Option,ObjID,ItemID) --�i�����k�N�j�𫰾���

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local BuildingGuildID = GetRoleCampID( TargetID() )
	local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--���a�O�_�b����W
--	Say(OwnerID(),"PlayerGuildID="..PlayerGuildID)


	local Arsenal = {112934,112935,112936,112937,112938,112939,112940,112941,112942,112943} --�i�L�u�t�j10���Ť�OrgID

	local Control = 0

	for i=1 , table.getn(Arsenal) do	
		local Arsenal_X = LuaFunc_SearchNPCbyOrgID( OwnerID() , Arsenal[i], 150 , 1)

		if CheckID(Arsenal_X[0]) == true then

			BuildingGuildID = GetRoleCampID( Arsenal_X[0] )


--	Say(OwnerID(),"BuildingGuildID="..BuildingGuildID)

			if PlayerGuildID == BuildingGuildID then
				Control = 1
			end
		end
	end	

	if Control == 1 then
		if ( Option == "CHECK" ) then
			if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
				if (PlayerIsSit == true) then --���a�b����W
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

		elseif ( Option == "USE" ) then
			BeginPlot( OwnerID()  , "Yuyu_GW_Siege_eq_1_01" , 0 )  
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 ,  ObjID  ) --�O���n�Ͳ�������
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 ,  ItemID  ) --�O���n�Ͳ������~�]ID
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_34]", 0 ) --�ݦb�L�u�t����~��ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_34]", 0 ) 
		return false

	end

end

function Yuyu_GW_Siege_eq_1_01() --�i�����k�N�j�𫰾���s�y

	local Kind = ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 ) 
	local Item = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) 

--	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+7) == 1 then
--		ScriptMessage( TargetID(),TargetID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
--		return
--	end
--	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 1 ) --��o��w��

		if BeginCastBar( OwnerID(),"["..Kind.."]", 150 , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		sleep( 4 ) 
			while true do
			sleep( 1 )
				local CastBarStatus = CheckCastBar( OwnerID() )
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
				end
			end

			if ( result == "OKOK" ) then
				
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 ,  0  ) --�M�ŭn�Ͳ�������
--				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )--�O���n�Ͳ������~�]ID
--				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 ) --�Ѱ���w�i�A����o

				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

				local StageNpc = CreateObj( Kind , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
				
				-- 2013.06.14 ���㵥�ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ���
				local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- Ū�����A���]�w�����a���ŤW��
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )

				AddBuff( StageNpc ,505013 ,1 ,1 ); --�Y�p 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
				AddToPartition( StageNpc , RoomID )  
				SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--����
				SetModeEx( StageNpc , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
				AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
				SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��


			---*---�H�U�P�_���a�O�_���ǲ߸˥ҧ޳N�B���b�޳N�����
				local SetA = -1
				local SetB = -1		
				local Count = BuffCount ( OwnerID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
					if BuffID == 505316 then--�˥ҧ޳N
						local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
						SetA = BuffLv
					elseif BuffID == 505315 then--���b�޳N
						local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
						SetB = BuffLv
					end
				end

				if SetA>-1 then
					AddBuff( StageNpc , 505935 , SetA , -1 )--�˥ҧ޳N
				end

				if SetB>-1 then
					SetB=SetB+1
					AddBuff( StageNpc , 506149 , SetB , -1 )--���b�޳N
				end

				BeginPlot( OwnerID() , "Yuyu_GW_Siege_eq_1_02" , 0 )  --�R�����~
				sleep(8)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--���

			elseif ( result == "DAME" ) then	

				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 ,  0  ) --�M�ŭn�Ͳ�������
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )--�O���n�Ͳ������~�]ID
--				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 ) --�Ѱ���w�i�A����o
			end
		end
end

function Yuyu_GW_Siege_eq_1_02() --�i�����k�N�j�R�����~

	local Item = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�O���n�Ͳ������~�]ID

	DelBodyItem(OwnerID() ,Item,1)

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )--�O���n�Ͳ������~�]ID
end

--====================================================================================================================

function Yuyu_GW_Siege_eq_2_note( Option ) --�i�𫰾���j-- ��ۥx�B�����x���s�@ �J�ê����ϥή�

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	if ( Option == "CHECK" ) then
		if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then

				return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
				return false
		end

	elseif ( Option == "USE" ) then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_59]", C_SYSTEM ) --���ઽ���զX
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_59]", C_SYSTEM ) 
	end

end



function Yuyu_GW_Siege_eq_2_00() --�i�𫰾���j-- ��ۥx�B�����x���s�@

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951 )  then
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
		SetModeEx( OwnerID(), EM_SetModeType_Show, true )--���
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��

		SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GW_Siege_eq_2_01" , 60 )	--���|���Ԯ�
		-- 2013.06.28 ���E�G�l�[���`�@���A�d�ֱ߽����o�ۥx�ؿv�I(113695)�A�l�ܵo�ۥx�ؿv�I�L�G���`�����D�A�ñN���`�@�� return false
		SetPlot( OwnerID() , "dead" , "Hao_GuildWar_CatapultPoint_Dead" , 0 )	--���`�@��
		--		
	end
end
-- 2013.06.28 ���E�G�l�[���`�@��
function Hao_GuildWar_CatapultPoint_Dead()	-- �o�ۥx�ؿv�I���`�@��

	local CatapultPoint = OwnerID()
	local Count = HateListCount(CatapultPoint)	-- Ū������C��

	for i = 1 , Count , 1 do	-- �v�@��Ѥ���C��W��
			local Killer = HateListInfo( CatapultPoint , i-1 , EM_HateListInfoType_GItemID )
			local OrgID = ReadRoleValue( Killer , EM_RoleValue_OrgID )
			DesignLog( Killer , 113695 , "Killer = "..OrgID )	-- ������^�Ǧۤv��OrgID��Designlog��
	end
	local MaxHP = ReadRoleValue( CatapultPoint , EM_RoleValue_MaxHP )	-- �N�����ؿv�I��q�ɺ�
	WriteRoleValue( CatapultPoint , EM_RoleValue_HP , MaxHP )
	return false
end

function Yuyu_GW_Siege_eq_2_01() --�i�𫰾���j-- ��ۥx�B�����x���s�@

	local PlayerID = OwnerID()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local BuildingGuildID = GetRoleCampID( TargetID() )

	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID

	local Record = 0 --�Ͳ��һݾ��Z
	local Energy = 0 --�Ͳ��һݯ�q

	local PackBag =  0

	if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
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
		if CheckBuff( OwnerID() , 501570) == true then 
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
			return
		end
		if TargetOrgID == 113694 then   --�����x�ؿv�I
			PackBag =  CountBodyItem( OwnerID() , 206760 ) --�����x(�զX�])
			Record = 30 --�Ͳ��һݾ��Z
			Energy = 100 --�Ͳ��һݯ�q
			ItemID = 102756 --�Ͳ����e�G�����x
			PageItemID = 206760 --�����x�զX�]
		elseif TargetOrgID == 113695 then   --�o�ۥx�ؿv�I
			PackBag =  CountBodyItem( OwnerID() , 206766 ) --�����x(�զX�])
			Record = 50 --�Ͳ��һݾ��Z
			Energy = 150 --�Ͳ��һݯ�q
			ItemID = 102762 --�Ͳ����e�G�o�ۥx
			PageItemID = 206766 --�o�ۥx�զX�]
		end

		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		TransferSelect[0] = { "[SC_OKAY]" }
		TransferSelect[1] = { "[SC_CANCEL]" }				-- ���}���

		if PackBag == 0 then
			DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_BUILD_35][$SETVAR1=".."["..ItemID.."]".."][$SETVAR2="..Energy.."][$SETVAR3="..Record.."]" )
			AddBuff(OwnerID() , 501570,0,-1);
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_BUILD_36][$SETVAR1=".."["..ItemID.."]".."][$SETVAR2=".."["..PageItemID.."]".."]" )
			AddBuff(OwnerID() , 501570,0,-1);
		end

		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
			return 0
		end
		while true do
			Sleep( 5 )
			RunTime = RunTime + 1
			if RunTime  > 60 then
				ScriptMessage( PlayerID , PlayerID , 0 , "[SC_BK_BUFFNPC_08]", 0 )	-- ���m�W�L30��,�۰����������C
				CancelBuff( OwnerID(), 501570 )
				DialogClose( PlayerID )				
				break
			end
			-- 2013.07.19 ���E�G�N�ˬd��q�P���Z�Ѱj��~�ܧ󬰰j�餺�A�ץ����a�I�������x�ؿv�I(113694)�εo�ۥx�ؿv�I(113695)�ɡA�b��q�ξ��Z���������p�U�A�̵M�����ܫؿv�A�ɭP��q���t�Ȫ����D�C
			local Player = OwnerID()
			local Now_E = GetGuildWarEnergy( Player ) --�ثe��q
			local Now_R =  CountBodyItem( Player , 206685 ) --�ثe���Z
			--
			-- 2013.06.28 ���E:�[�J�Z���˴��A�L���ɦ۰���������
			local Distance = GetDistance( PlayerID , TargetID() )	-- �d�ߪ��a�P�𤧶����Z��
			if Distance >= 50 then
				CancelBuff( PlayerID , 501570 )
				DialogClose( PlayerID )
				break
			end
			--			
			DialogStatus = DialogGetResult( PlayerID )
			--Say( PlayerID , DialogStatus )

			if DialogStatus == -2 then
				-- DO nothing
			elseif DialogStatus == 1 or DialogStatus == -1 then
				CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
				break
			elseif DialogStatus == 0 then
				if PackBag == 0 then
					if (Now_R >= Record) and (Now_E >= Energy) then
						Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_02_0", 0 ) --�Ͳ����~
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  Energy  ) --�O���ӫؿv������O
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
				else
					Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_03_0", 0 ) --�Ͳ����~
					WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  Energy  ) --�O���ӫؿv������O
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
			
				end
			end
		end
	end
end

function Yuyu_GW_Siege_eq_2_02_0() --�i�𫰾���j-- ���O�귽�Ͳ����~
	Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_02", 0 ) --�Ͳ����~
end

function Yuyu_GW_Siege_eq_2_02() --�i�𫰾���j-- ���O�귽�Ͳ����~
--OwnerID ���a
--TargetID �ؿv
	-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	local Player = OwnerID()
	local Npc = TargetID()
	--
	local Energy = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --��q
	local Record = Energy--���Z
	
	local Kind = 0
	local item = 0
	if Energy == 100 then
		Kind = 113694--�����x
		item =102756
		Record = 30
	elseif Energy == 150 then
		Kind = 113695--�o�ۥx
		item =102762
		Record = 50
	end

	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 150			--/*��ެ�o�һݮɶ�

	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --��o��w��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --��o��w��
	-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )	-- �}�l�ؿv
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )
	--
	if BeginCastBar( OwnerID(),"["..item.."]", truecast , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		sleep( 4 ) 
		while true do
			sleep( 1 );
			local CastBarStatus = CheckCastBar( OwnerID() );
			-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
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
			elseif (CheckID( TargetID() ) == false) then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break
			-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
			elseif Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( Player , CastBarStatus )
				break
				--						
			end
		end

		if ( result == "OKOK" ) then
			AddGuildWarEnergy( Player , -Energy )	--������q
			DelBodyItem( Player , 206685 , Record )	--�������Z
			-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C			
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	-- �ؿv�����A���ӯ�q[$VAR1]�B���Z[$VAR2]
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
			--
			local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
			local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 
			local PlayerGuildID = GetRoleCampID( TargetID() )--���a���}��

			local StageNpc = CreateObj( item , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
			
			-- 2013.06.14 ���㵥�ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ���
			local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- Ū�����A���]�w�����a���ŤW��
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )
			AddBuff( StageNpc ,505013 ,1 ,1 ); --�Y�p 
			SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
			AddToPartition( StageNpc , RoomID )  
			SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--����
			SetModeEx( StageNpc , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
			AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

		---*---�H�U�P�_���a�O�_���ǲ߸˥ҧ޳N�B���b�޳N�����
			local SetA = -1
			local SetB = -1		
			local Count = BuffCount ( OwnerID())
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
				if BuffID == 505316 then--�˥ҧ޳N
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
					SetA = BuffLv
				elseif BuffID == 505315 then--���b�޳N
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
					SetB = BuffLv
				end
			end

			if SetA>-1 then
				AddBuff( StageNpc , 505935 , SetA , -1 )--�˥ҧ޳N
			end

			if SetB>-1 then
				AddBuff( StageNpc , 506149 , SetB+1 , -1 )--���b�޳N
			end

			WriteRoleValue( StageNpc , EM_RoleValue_Register, TargetID() ) --�O��ؿv��a���X
			SetPlot(  StageNpc, "dead","Yuyu_GW_Siege_eq_2_05",0 )     

			sleep(8)
			--�����ð�a
			SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( TargetID()  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( TargetID() , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( TargetID() , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( TargetID()  , EM_SetModeType_Move, false )--����
			SetModeEx( TargetID() , EM_SetModeType_Obstruct, false )--����
			SetModeEx( TargetID(), EM_SetModeType_Show, false )--���
			SetPlot( TargetID() , "touch" , "" , 0 )	--���|���Ԯ�
			--�����ð�a
			SetModeEx( StageNpc, EM_SetModeType_Show, true )--���	


			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o

			if Energy == 100 then--�����x
				Delobj(TargetID())
			end

		elseif ( result == "DAME" ) then
			-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C		
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )	-- �ؿv����
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )
			--
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --�M�ŭn��o���޳N����
		end

	end
end

function Yuyu_GW_Siege_eq_2_03_0() --�i�𫰾���j-- ���O�귽�Ͳ����~
	Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_03", 0 ) --�Ͳ����~
end

function Yuyu_GW_Siege_eq_2_03() --�i�𫰾���j-- ���ӥͲ����~
--OwnerID���a
--TargetID�ؿv
	-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	local Player = OwnerID()
	local Npc = TargetID()
	local ItemID
	--
	local Energy = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --��q
	local Record = Energy --���Z
	
	local Kind = 0
	local item = 0
	if Energy == 100 then
		Kind = 113694--�����x
		item =102756
		Record = 30
		ItemID = 206760	-- �����x(�զX�])
	elseif Energy == 150 then
		Kind = 113695--�o�ۥx
		item =102762
		Record = 50
		ItemID = 206766	-- �o�ۥx(�զX�])
	end

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 150			--/*��ެ�o�һݮɶ�

	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --��o��w��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --��o��w��
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --��o��w��
	-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )	-- �}�l�ؿv
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )
	--
	if BeginCastBar( OwnerID(),"["..item.."]", truecast , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		sleep( 4 ) 
		while true do
			sleep( 1 );
			local CastBarStatus = CheckCastBar( OwnerID() );
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				end
			elseif (CheckID( TargetID() ) == false) then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			-- 2013.08.26 ���E�A�ץ����a�ϥΩ����x(�զX�])(206760)�B�o�ۥx(�զX�])(206766)�ؿv�����x(�o�ۥx)��A��ؿv��Ū���������ɡA�b�Ӫ��~���s�b�����p�U�A�̵M�i�H���\�ؿv�����D�C					
			elseif CountBodyItem( Player , ItemID ) < 1 then
				result = "DAME"
				EndCastBar( Player , CastBarStatus )
				break
			--
			end
		end

		if ( result == "OKOK" ) then

			local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
			local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 
			local PlayerGuildID = GetRoleCampID( TargetID() )--���a���}��

			local StageNpc = CreateObj( item , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
			
			-- 2013.06.14 ���㵥�ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ���
			local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- Ū�����A���]�w�����a���ŤW��
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )

			AddBuff( StageNpc ,505013 ,1 ,1 ); --�Y�p 
			SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
			AddToPartition( StageNpc , RoomID )  

		---*---�H�U�P�_���a�O�_���ǲ߸˥ҧ޳N�B���b�޳N�����
			local SetA = -1
			local SetB = -1		
			local Count = BuffCount ( OwnerID())
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
				if BuffID == 505316 then--�˥ҧ޳N
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
					SetA = BuffLv
				elseif BuffID == 505315 then--���b�޳N
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
					SetB = BuffLv
				end
			end

			if SetA>-1 then
				AddBuff( StageNpc , 505935 , SetA , -1 )--�˥ҧ޳N
			end

			if SetB>-1 then
				AddBuff( StageNpc , 506149 , SetB+1 , -1 )--���b�޳N
			end

			SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--����
			SetModeEx( StageNpc , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
			AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

			Beginplot( OwnerID() ,"Yuyu_GW_Siege_eq_2_04", 0 ) --�R�����~
			WriteRoleValue( StageNpc , EM_RoleValue_Register, TargetID() ) --�O��ؿv��a���X
			SetPlot(  StageNpc, "dead","Yuyu_GW_Siege_eq_2_05",0 )     

			sleep(8)
			--�����ð�a
			SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( TargetID()  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( TargetID() , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( TargetID() , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( TargetID()  , EM_SetModeType_Move, false )--����
			SetModeEx( TargetID() , EM_SetModeType_Obstruct, false )--����
			SetModeEx( TargetID(), EM_SetModeType_Show, false )--���
			SetPlot( TargetID() , "touch" , "" , 0 )	--���|���Ԯ�
			--�����ð�a
			SetModeEx( StageNpc, EM_SetModeType_Show, true )--���	

			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o

		elseif ( result == "DAME" ) then
			-- 2013.08.26 ���E�A�ؿv�ɮ��Ӫ���q�P���Z�A�ѹw�������վ㬰�سy�����ɦ����C		
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )	-- �ؿv����
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )
			--		
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����o
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --�M�ŭn��o���޳N����
		end

	end
end

function Yuyu_GW_Siege_eq_2_04() --�i�𫰾���j-- ���ӥͲ����~

	local Energy = ReadRoleValue( TargetID() , EM_RoleValue_Register+3 ) --��q
	local item = 0
	if Energy == 100 then
		item =206760
	elseif Energy == 150 then
		item =206766
	end

	DelBodyItem( OwnerID() , item , 1 )

end

function Yuyu_GW_Siege_eq_2_05() --�i�u�ƫؿv�����`�@���j
	local Base = ReadRoleValue( OwnerID() , EM_RoleValue_Register) --��a���X
	Beginplot( Base ,"Yuyu_GW_Siege_eq_2_06", 0 ) 
end

function Yuyu_GW_Siege_eq_2_06() --�i�ؿv��a���͡j
	sleep(30)
	Beginplot( OwnerID() ,"Yuyu_GW_Siege_eq_2_00", 0 ) 
end


--==============================================================================



function Yu_GWSBDDD(NA,AA,ND,BB,PA,CC,PD,DD) --�i����𨾥[�I��l�@���j
Say(OwnerID() ,"111")
	if NA == 0 then 				--����NPC�[��% 
		AddBuff( OwnerID() ,505513 ,AA ,-1 );
	elseif NA == 1 then
		AddBuff( OwnerID() ,505923 ,AA ,-1 );
	end

	if ND == 0 then				--�QNPC�����[��% 
		AddBuff( OwnerID() ,505516 ,BB ,-1 );  
	elseif ND == 1 then
		AddBuff( OwnerID() ,505517 ,BB ,-1 );  
	end

	if PA == 0 then					--�������a�[��%
		AddBuff( OwnerID() ,505514 ,CC ,-1 ); 
	elseif PA == 1 then
		AddBuff( OwnerID() ,505515 ,CC ,-1 );  
	end

	if PD == 0 then
		AddBuff( OwnerID() ,505921 ,DD ,-1 ); --�Q���a�����[��% 
	elseif PD == 1 then
		AddBuff( OwnerID() ,505512 ,DD ,-1 ); --�Q���a�����[��% 
	end

end

function Yuyu_GW_Siege_Born() --�i����𨾥[�I��l�@���j
--�� OrgID�P�_ ���n��PCALL

	local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --�ثe���㤧OrgID
	local Siege = {102756,--�����x
			 102757,--�s����
			 102758,--�X�v������
			 102759,--�Ī���
			 102760,--�K���Ĩ�
			 102761,--�L�ȶ�����
			 102762,--�o�ۥx
			 102763,--��ۨ�
			 102764}--�P�K������

	local BuffKind = 0 

	for i = 1,9 do

		if Siege[i]==OwnerIDOrgID then
			BuffKind = i
		end
	end

	local SiegeA={505513,80,505516,300,505514,100,505512,25}--�����x 		��NPC�I�z�B�W��NPC�B�𪱮a�W�ˡB�Q���a��I�z
	local SiegeB={505513,75,505516,300,505514,100,505512,25}--�s����
	local SiegeC={505513,70,505516,300,505514,100,505512,25}--�X�������� 
	--{ ��NPC�˴�B�QNPC��[�B�𪱮a�˥[�B�Q���a��[ }
	local SiegeD={505923,160,505516,300,505515,70,505921,5}--�Ī���
	local SiegeE={505923,180,505516,300,505515,65,505921,5}--�K���Ĩ�
	local SiegeF={505923,200,505516,300,505515,60,505921,5}--�L�ȶ����� 
	--{ ��NPC�˥[�B�QNPC��[�B�𪱮a�˴�B�Q���a��� }
	local SiegeG={505923,160,505516,300,505514,80,505512,25}--�o�ۥx
	local SiegeH={505923,160,505516,300,505514,80,505512,25}--��ۨ� 
	local SiegeI={505923,180,505516,300,505514,80,505512,25}--�P�K������
	--{ ��NPC�˥[�B�QNPC��[�B�𪱮a�˥[�B�Q���a��[ }
	local Buff ={SiegeA,SiegeB,SiegeC,SiegeD,SiegeE,SiegeF,SiegeG,SiegeH,SiegeI}

	AddBuff( OwnerID() ,Buff[BuffKind][1] ,Buff[BuffKind][2] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][3] ,Buff[BuffKind][4] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][5] ,Buff[BuffKind][6] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][7] ,Buff[BuffKind][8] ,-1 );  
	AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	if BuffKind == 1 then
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
		local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

		local StageNpc = CreateObj( 113694 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)--�����x�ؿv�I
		AddToPartition( StageNpc , RoomID )  
		SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

		sleep(5)
		SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
		SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
		SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
		SetPlot( StageNpc , "touch" , "" , 0 )	--���|���Ԯ�
		WriteRoleValue( OwnerID() , EM_RoleValue_Register, StageNpc ) --�O��ؿv��a���X
		SetPlot(  OwnerID(), "dead","Yuyu_GW_Siege_eq_2_05",0 )     
	end
end