--====================================================================================================================

function Yuyu_GW_witchgood_1_01( Option ) --�i�����k�N�j���Ԥ��C

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	if ( Option == "CHECK" ) then
	-- 2013.06.27 ���E:��XLua �ϥΫe�ˬd�A�[�J�ϥή��ˬd���� --
		BeginPlot( OwnerID() , "Hao_GuildWar_Place_Tower_Check" , 0 )
	--
	--	if (ZoneID == 402) or (ZoneID == 51) or (PassCard > 0) then
	--		return true
	--	else
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
	--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
	--		return false
	--	end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_1_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_1_02() --�i�����k�N�j���Ԥ��C�I�k

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_13]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
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
				
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

				local StageNpc = CreateObj( 102366 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
				
				AddBuff( StageNpc ,505013 ,1 ,1 ); --�Y�p 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
				-- 2013.02.21 �s�W�A�ץ����a�󤽷|���Ԫ����ϥθ��Ԥ��C(206666)�ɡA���Ԥ��C�|�缾�a�Ϋؿv���y������ˮ`�����D
				SetModeEx( StageNpc , EM_SetModeType_Strikback , false )	--����
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy , false )	-- ����
				SetStopAttack( StageNpc )
				-- 2013.02.23 ���Ԥ��C���������ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ���
				local Player = OwnerID()
				local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū�����A���]�w�����a���ŤW��
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )
				--
				AddToPartition( StageNpc , RoomID )  
				AddBuff( StageNpc , 505921 , 39 , -1 )	--40%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
				SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

				AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

				BeginPlot( OwnerID() , "Yuyu_GW_witchgood_delitem_01" , 0 )  
				SetPlot(  StageNpc, "dead","Yuyu_GW_witchgood_dead_01",0 )     
				SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
				sleep(10)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--���	

				BeginPlot( StageNpc , "Yuyu_GW_witchgood_1_03" , 0 )  

			end
		end
end

function Yuyu_GW_witchgood_1_03() --�i�����k�N�j���Ԥ��C�I�k

	local OID = OwnerID()

	while true do 
		CastSpelllv( OID , OID , 494821 , 0 )	--���Ԫ��T�� : �w�t(502583)�B�˦a(509973)�B����˦a(509978)
		sleep(70)
	end

end


------------------------- 494821 ���Ԫ��T�� �򥻪k�N �ˬdBUFF  -------------------------

--- 509978 �L��
function lua_509978_check()	-- ����˦a�e�ˬd
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	DebugMsg( TargetID() , RoomID , "Caster = "..OwnerID().." ,I am = "..TargetID() )
	if CheckBuff( TargetID() , 509973 ) == true then  -- �O�_���˦a
		return true
	else
		return false
	end
end

-- 509973 �˦a�ĪG
function lua_509973_check()	-- �˦a�e�ˬd
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	DebugMsg( TargetID() , RoomID , "Caster = "..OwnerID().." ,I am = "..TargetID() )
	if CheckBuff( TargetID() , 509978 ) == true then  -- �O�_������˦a
		return false
	else
		return true
	end
end
-----------------------------------------------------------------------

--====================================================================================================================

function Yuyu_GW_witchgood_2_01( Option ) --�i�����k�N�j���\����

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	if ( Option == "CHECK" ) then
	-- 2013.06.27 ���E:��XLua �ϥΫe�ˬd�A�[�J�ϥή��ˬd���� --
		BeginPlot( OwnerID() , "Hao_GuildWar_Place_Tower_Check" , 0 )
	--
	--	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
	--
	--			return true
	--	else
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
	--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
	--			return false
	--	end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_2_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_2_02() --�i�����k�N�j���\����

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_13]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
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
				
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

				local StageNpc = CreateObj( 102367 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

				AddBuff( StageNpc ,505013 ,1 ,1 ); --�Y�p 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
				-- 2013.02.21 �s�W�A�ץ����a�󤽷|���Ԫ����ϥή��\����(206667)�ɡA���\���۷|�缾�a�Ϋؿv���y������ˮ`�����D
				SetModeEx( StageNpc , EM_SetModeType_Strikback , false )	--����
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy , false )	-- ����
				SetStopAttack( StageNpc )
				-- 2013.02.23 ���\���۪��������ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ���
				local Player = OwnerID()
				local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū�����A���]�w�����a���ŤW��
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )				
				--
				AddToPartition( StageNpc , RoomID )  
				AddBuff( StageNpc , 505921 , 39 , -1 )	--40%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
				SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

				AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

				BeginPlot( OwnerID() , "Yuyu_GW_witchgood_delitem_02" , 0 )  
				SetPlot(  StageNpc, "dead","Yuyu_GW_witchgood_dead_01",0 )     
				SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
				sleep(10)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--���	

				BeginPlot( StageNpc , "Yuyu_GW_witchgood_2_03" , 0 )  


			end
		end
end


function Yuyu_GW_witchgood_2_03() --�i�����k�N�j���\����

	local OID = OwnerID()

	while true do 
		CastSpelllv( OID , OID , 494820 , 0 )	--�c�]���T��(�T��)
		sleep(50)
	end

end


--====================================================================================================================

function Yuyu_GW_witchgood_3_01( Option ) --�i�����k�N�j�u������

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	if ( Option == "CHECK" ) then
	-- 2013.06.27 ���E:��XLua �ϥΫe�ˬd�A�[�J�ϥή��ˬd���� --
		BeginPlot( OwnerID() , "Hao_GuildWar_Place_Tower_Check" , 0 )
	--	
	--
	--
	--	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
	--
	--		return true
	--	else
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
	--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
	--			return false
	--	end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_3_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_3_02() --�i�����k�N�j�u������

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_13]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
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
				
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

				local StageNpc = CreateObj( 102370 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

				AddBuff( StageNpc ,505013 ,1 ,1 ); --�Y�p 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
				-- 2013.02.21 �s�W�A�ץ����a�󤽷|���Ԫ����ϥίu������(206668)�ɡA�u�������|�缾�a�Ϋؿv���y������ˮ`�����D
				SetModeEx( StageNpc , EM_SetModeType_Strikback , false )	--����
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy , false )	-- ����
				SetStopAttack( StageNpc )
				-- 2013.02.23 �u���������������ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ���
				local Player = OwnerID()
				local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū�����A���]�w�����a���ŤW��
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )				
				--			
				AddToPartition( StageNpc , RoomID )  
				AddBuff( StageNpc , 505921 , 39 , -1 )	--40%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
				SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

				AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

				BeginPlot( OwnerID() , "Yuyu_GW_witchgood_delitem_03" , 0 )  
				SetPlot(  StageNpc, "dead","Yuyu_GW_witchgood_dead_01",0 )     
				SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
				sleep(10)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--���	

				BeginPlot( StageNpc , "Yuyu_GW_witchgood_3_03" , 0 )  

			end
		end
end


function Yuyu_GW_witchgood_3_03() --�i�����k�N�j���Ԥ��C�I�k

	local OID = OwnerID()

	while true do 
		CastSpelllv( OID , OID , 494822 , 0 )	--��檺�T��(�Ѱ�����)
		sleep(30)
	end

end


function Yuyu_GW_witchgood_3_04() --�i�����k�N�j���Ԥ��C�I�k�ĪG
	
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local TargetIDGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	if PlayerGuildID ~= BuildingGuildID then

		local Count = BuffCount ( TargetID())
		for i = 1 , Count do
			local BuffID = BuffInfo ( TargetID() ,Count- i , EM_BuffInfoType_BuffID )-- �򥻪k�NID
			if GameObjInfo_int ( BuffID , "AssistType" ) == 52 then --���U�k�N�����G����
				CancelBuff(TargetID(),BuffID)
				AddBuff( TargetID() ,503141 ,0 ,3 ); --��Y
				ScriptMessage( TargetID() , TargetID() , 2 , "[SC_YU_GUILDWAR_BUILD_40]", 1 ) 
				AddBuff( TargetID() ,502574 ,0 ,5 ); --�_�w5��
			--	break
			end
		end
	end

end




function Yuyu_GW_witchgood_dead_01()  --�������`�@��

	-- 2013.08.14 ���E�G�ץ�Npc������������ɡA�|�]�����`�@���Q return false �����l�v�Z�����W�L��Ʈw���]�w�Ȫ����D�C
	DelObj( OwnerID() )
	--
--	BeginPlot( OwnerID() , "Yuyu_GW_witchgood_dead_02" , 0 )  
--	return false
end

function Yuyu_GW_witchgood_dead_02()  --�������`�@��

	AddBuff( OwnerID() , 503605 , 0 , -1 )		--�_���U�N
	PlayMotion( OwnerID() , 19) 
	sleep(10)
	PlayMotion( OwnerID() , 19) 
	sleep(10)
	PlayMotion( OwnerID() , 19) 
	sleep(20)
	CastSpell( OwnerID(), OwnerID(), 491002)
	sleep(30)
	AddBuff( OwnerID() , 506150 , 0 , -1 )		--�~��_��
	sleep(5)
	Delobj(OwnerID())
end	

function Yuyu_GW_witchgood_delitem_01()  --�ϥΫ�R�����~ ���Ԥ��C
	DelBodyItem( OwnerID() , 206666 , 1 )
end

function Yuyu_GW_witchgood_delitem_02()  --�ϥΫ�R�����~ ���\����
	DelBodyItem( OwnerID() , 206667 , 1 )
end

function Yuyu_GW_witchgood_delitem_03()  --�ϥΫ�R�����~ �u������
	DelBodyItem( OwnerID() , 206668 , 1 )
end

function Yuyu_GW_witchgood_delitem_04()  --�ϥΫ�R�����~ ���Ϩ��y
	DelBodyItem( OwnerID() , 206681 , 1 )
end