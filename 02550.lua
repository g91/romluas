function Lua_Job10_Skill1_Check()--�޽ë��A(498562)
	local OID = OwnerID()

	if CheckBuff( OID, 621218 ) then
		CancelBuff( OID, 621216 )--�@�[��
		CancelBuff( OID, 621217 )--�@�[��
		--CancelBuff( OID, 621219 )--�O�I��
		--CancelBuff( OID, 621221 )--�O�I��

		CancelBuff( OID, 621228)--�̲ר��u
		CancelBuff( OID, 621222 )--ű�K�Ť�u��
		CancelBuff( OID, 621218 )--��ܪ��A
		return false
	end
	Lua_Job10_Skill1_State()
	return true
end

function Lua_Job10_Skill1_State()
	local OID = OwnerID()
	local Lv = ReadRoleValue( OID , EM_RoleValue_MagicPowerLv_SP+4 )--�޽ë��A
	local baseStr = ReadRoleValue( OID, EM_RoleValue_BaseEQ_Str )--str����Buff���ƭ�
	local changeStr = KS_CheckBuffLV( OID, 621217 ) + KS_CheckBuffLV( OID, 621216 )*100		--���o���w���󨭤WBUFF����
	local rate = 0.1+Lv*0.014--���ūY��
	local compute = math.floor( baseStr*rate)--�ഫ��

	if BaseStr  == 0 or changeStr ~= compute then
		CancelBuff( OID, 621216 )--�ഫ100N
		CancelBuff( OID, 621217 )--�ഫN
		CancelBuff( OID, 624377 )--�ഫ100N	��ѧκA
		CancelBuff( OID, 624378 )--�ഫN	��ѧκA

		local x100 = math.floor(compute/100)
		if x100 > 0 then
			AddBuff( OID, 621216, x100-1, -1 )--�ഫ100N
		end

		local x1 = math.floor(compute%100)
		if x1 > 0 then
			AddBuff( OID, 621217, x1-1, -1 )--�[�@
		end
		
		Lv = ReadRoleValue( OID , EM_RoleValue_MagicPowerLv_SP+5 )--ű�K�Ť�u��
		if Lv >= 0 then--ű�K�Ť�u��
			AddBuff( OID, 621222, Lv, -1 )
		end

		if ReadRoleValue( OID , EM_RoleValue_MagicPowerLv_SP+11 ) > 0 then--�̲ר��u
			AddBuff( OID, 621228, 0, -1 )
		end
	end
end

function Lua_Job10_Skill2_Check()--�ů�o��(498564)
	local OID = OwnerID()
	local TID = TargetID()

	if ReadRoleValue( TID, EM_RoleValue_IsNPC ) == 1 then
		if GetModeEx(TID,EM_SetModeType_Strikback)==false or GetModeEx(TID,EM_SetModeType_Move)==false then--������or�����ʪ�����L��
			return;
		end
		local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		for i=1, 5 do
			if GameObjInfo_Int( OrgID, "AvoidMagicType"..i ) == 101 then
				return;
			end
		end
	end

	local Dis = 20
	local PosX = ReadRoleValue( OID, EM_RoleValue_X )
	local PosY = ReadRoleValue( OID, EM_RoleValue_Y )
	local PosZ = ReadRoleValue( OID, EM_RoleValue_Z )
	local PosDir = ReadRoleValue( OID, EM_RoleValue_Dir )
	
	local radian = (math.pi/180)*( PosDir )--�|��
	PosX = PosX  +(Dis*math.cos(radian))
	PosZ = PosZ - (Dis*math.sin(radian))
	PosY  = GetHeight( PosX, PosY, PosZ )
	SetPos( TID, PosX, PosY, PosZ, PosDir )
end

function Lua_PP_Elite50_HealCheck()--��^�ޯ� ��/�F50 �v���ˬd(498798)
	local Oid = OwnerID();
	local Summon = ReadRoleValue( Oid , EM_LuaValueFlag_EliteSummon )
	--Say( Oid, "SummonID = "..Summon.."; Name = "..getName(Summon) )
	if Summon > 0 then
		local Tid = Oid;
		local percent = math.floor( (ReadRoleValue( Tid, EM_RoleValue_HP )/ReadRoleValue( Tid, EM_RoleValue_MaxHP ))*100 );
		local PartyNum = GetPartyID( Oid, -1 );
		--DebugMsg(0,0,"PartyNum = "..PartyNum)
		if PartyNum > 0 then
			for i=1, PartyNum do
				local Tmp = GetPartyID( Oid, i );
				if ReadRoleValue( Tmp, EM_RoleValue_IsDead ) ~= 1 then
					TmpPercent = math.floor( (ReadRoleValue( Tmp, EM_RoleValue_HP )/ReadRoleValue( Tmp, EM_RoleValue_MaxHP ))*100 );
					if TmpPercent < percent then
						Tid = Tmp;
						percent = TmpPercent;
					end
				end
			end
		end
		if percent < 100 then
			sysCastSpellLv( Oid, Tid, 498516, ReadRoleValue( Oid , EM_RoleValue_MagicPowerLv_SP+80 ) )
		end
		--Say( Oid, "Tid = "..Tid.."; Name = "..GetName(Tid) )
		return true
	end
	return false
end

function Lua_PP_Elite50_CreateSummon()--�۳�
	local Oid = OwnerID( )
	local Summon = LuaFunc_CreateObjByObj(  106689, Oid )
	Hide(Summon)
	WriteRoleValue( Summon, EM_RoleValue_IsWalk, 1 )
	SetModeEx( Summon , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( Summon , EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Summon , EM_SetModeType_Fight, false )			-- �i�������
	SetModeEx( Summon , EM_SetModeType_Searchenemy , false )	-- ����
	Show(Summon, ReadRoleValue(Oid, EM_RoleValue_RoomID ) )
	SetFollow( Summon, Oid)
	WriteRoleValue( Oid, EM_LuaValueFlag_EliteSummon, Summon )
	CallPlot( Summon, "Lua_PP_Elite50_SummonAI", Oid )
end

function Lua_PP_Elite50_SummonAI( Master )--�۴����˹�
	local Oid = OwnerID()
	for i=1, 30 do
		Sleep(10)
		if not CheckID(Master) or ReadRoleValue( Master, EM_RoleValue_IsDead ) == 1 then
			break
		end
	end
	WriteRoleValue( Master, EM_LuaValueFlag_EliteSummon, 0 )
	DelObj(Oid)
end