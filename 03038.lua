
-- ���ȦW�� 426509 ��h�b���h
-- �ϥΪ��~ ���y��÷ 242966 �@��
function Z27_LuaI_242966_01()
	local TargetOrgID = ReadRoleValue(TargetID(), EM_RoleValue_OrgID)
	if TargetOrgID ~= 107933  then-- �D���T�ϥΥؼ�
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421249_4]" , 0 ) --�ؼп��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421249_4]" , 0 )
		return false
	elseif ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --�ؼФw�g���F�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	else
		return true
	end
end

function Z27_LuaI_242966_02()
	local PlayerID = OwnerID()
	local orgid = 107933
	local Target = TargetID()

	ScriptMessage( PlayerID, PlayerID, 1, "[SC_Z27_426509_01][$SETVAR1=".."["..orgid.."]".."]", C_SYSTEM ); -------�A���[$VAR1]�F�I
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	GiveBodyItem(PlayerID, 242967, 1 )
end

function Z27_Lua_NPC_122863_talk()
	local PlayerID = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(PlayerID)
	PlayMotion(NPC ,ruFUSION_ACTORSTATE_EMOTE_CRY)
end

function Hao_Zone27_HooLu_Ethnic()	-- �I�P�ڦ��`�@��

	SetPlot( OwnerID() , "Dead" , "Hao_Zone27_HooLu_Ethnic_Dead" , 0 )
end

function Hao_Zone27_HooLu_Ethnic_Dead()	-- �I�P�ڦ��`�@��
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- �����I�P�ګ�A���a�o�쪺�S��
	Effect["P_GetBuff"] = { 625199, 86400 }	-- �����I�P�ګ�A���a�o�쪺���|Buff�P����ɶ�
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- �����I�|�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�|Ĳ�o�A�G��Buff�P����ɶ�(Ĵ�p�G�w�t�ĪG��)
	Effect["N_GetMagic"] = 491259 		-- �����I�P�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�I�P�o�쪺�S��(Ĵ�p�G�z���S�ĵ�)
	Effect["MonsterID"] = { 108449, 10 }	-- �����I�|�ګ�A���a�޵o�A�GBuff�ɡA�b�Ǫ����W�X�{���Ǫ��Φs�b�ɶ�
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end
function Hao_Zone28_Ethnic_Dead()	-- ���`�@��
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- �����I�P�ګ�A���a�o�쪺�S��
	Effect["P_GetBuff"] = { 625200, 86400 }	-- �����I�P�ګ�A���a�o�쪺���|Buff�P����ɶ�
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- �����I�|�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�|Ĳ�o�A�G��Buff�P����ɶ�(Ĵ�p�G�w�t�ĪG��)
	Effect["N_GetMagic"] = 491259 		-- �����I�P�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�I�P�o�쪺�S��(Ĵ�p�G�z���S�ĵ�)
	Effect["MonsterID"] = { 108450, 10 }	-- �����I�|�ګ�A���a�޵o�A�GBuff�ɡA�b�Ǫ����W�X�{���Ǫ��Φs�b�ɶ�
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end
function Hao_Zone29_Ethnic_Dead()	-- ���`�@��
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- �����I�P�ګ�A���a�o�쪺�S��
	Effect["P_GetBuff"] = { 625201, 86400 }	-- �����I�P�ګ�A���a�o�쪺���|Buff�P����ɶ�
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- �����I�|�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�|Ĳ�o�A�G��Buff�P����ɶ�(Ĵ�p�G�w�t�ĪG��)
	Effect["N_GetMagic"] = 491259 		-- �����I�P�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�I�P�o�쪺�S��(Ĵ�p�G�z���S�ĵ�)
	Effect["MonsterID"] = { 108451, 10 }	-- �����I�|�ګ�A���a�޵o�A�GBuff�ɡA�b�Ǫ����W�X�{���Ǫ��Φs�b�ɶ�
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end
function Hao_Zone30_Ethnic_Dead()	-- ���`�@��
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- �����I�P�ګ�A���a�o�쪺�S��
	Effect["P_GetBuff"] = { 625202, 86400 }	-- �����I�P�ګ�A���a�o�쪺���|Buff�P����ɶ�
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- �����I�|�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�|Ĳ�o�A�G��Buff�P����ɶ�(Ĵ�p�G�w�t�ĪG��)
	Effect["N_GetMagic"] = 491259 		-- �����I�P�ګ�A���a���W��Effect["P_GetBuff"]�|�ܤ@�w�h�ƮɡA�I�P�o�쪺�S��(Ĵ�p�G�z���S�ĵ�)
	Effect["MonsterID"] = { 108452, 10 }	-- �����I�|�ګ�A���a�޵o�A�GBuff�ɡA�b�Ǫ����W�X�{���Ǫ��Φs�b�ɶ�
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end

function Hao_Zone_Bodo_Ethnic_Dead( P_GetMagic , N_GetMagic , P_GetBuff , P_CurseBuff , MonsterID )	-- �i�h�ڦ��`�@�μ@��

	local Npc = OwnerID()
	local Room = ReadRoleValue(Npc , EM_RoleValue_RoomID )
	local PlayerList = KS_GetHateList( Npc , 3 )	-- ����� , 3 = ���a
	WriteRoleValue( Npc , EM_RoleValue_PID , 0 )	-- �N PID �ȭ��m�A�קK�Ǫ����ͫ�APID�Ȩ̵M�Q�мg��1�����D
	if #(PlayerList) ~= 0 then	-- ����������a�s�b�ɡA�h...
		for Num = 1 , #(PlayerList) , 1 do 
			if GetDistance( Npc , PlayerList[Num] ) <= 250 then	-- ��ؼлPNpc���Z�� <= ...
				SysCastSpellLv( Npc , PlayerList[Num] , P_GetMagic , 0 )
				AddBuff( PlayerList[Num] , P_GetBuff[1] , 0 , P_GetBuff[2] )
				local BuffLv = Lua_Hao_Return_Buff_Lv( PlayerList[Num] , P_GetBuff[1] )	-- �d��Buff���|������
				if BuffLv >= 4 then	-- ��A�GBuff���|5�h��
					SysCastSpellLv( Npc , Npc , N_GetMagic , 0 )
					--AddBuff( PlayerList[Num] , P_CurseBuff[1] , 0 , P_CurseBuff[2] )
					CancelBuff_NoEvent( PlayerList[Num] , P_GetBuff[1] )
					if ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
						local Monster = CreateObjByObj( MonsterID[1] , Npc , 1 )
						SetModeEx( Monster , EM_SetModeType_Searchenemy , false )	-- ����v  
						SetModeEx( Monster , EM_SetModeType_Strikback , false )	-- ����
						SetModeEx( Monster , EM_SetModeType_Fight , false )		-- ���
						SetModeEx( Monster , EM_SetModeType_ShowRoleHead , false )	-- �Y����
						SetAttack( Monster , PlayerList[Num] )
						WriteRoleValue( Npc , EM_RoleValue_PID , 1 )
						CallPlot( Monster , "Hao_Zone_Bodo_Ethnic_DelObj" , MonsterID[2]*10 )
					end
				end
				DebugMsg( PlayerList[Num] , Room , "BuffLv = "..BuffLv.." , You've been cursed ...A_A" )
			end
		end
	end
end

function Hao_Zone_Bodo_Ethnic_DelObj(Time)

	Sleep(Time)
	DelObj(OwnerID())
end