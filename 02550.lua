function Lua_Job10_Skill1_Check()--盾衛型態(498562)
	local OID = OwnerID()

	if CheckBuff( OID, 621218 ) then
		CancelBuff( OID, 621216 )--耐加成
		CancelBuff( OID, 621217 )--耐加成
		--CancelBuff( OID, 621219 )--力衰減
		--CancelBuff( OID, 621221 )--力衰減

		CancelBuff( OID, 621228)--最終防線
		CancelBuff( OID, 621222 )--鑄鐵符文工藝
		CancelBuff( OID, 621218 )--顯示狀態
		return false
	end
	Lua_Job10_Skill1_State()
	return true
end

function Lua_Job10_Skill1_State()
	local OID = OwnerID()
	local Lv = ReadRoleValue( OID , EM_RoleValue_MagicPowerLv_SP+4 )--盾衛型態
	local baseStr = ReadRoleValue( OID, EM_RoleValue_BaseEQ_Str )--str不算Buff的數值
	local changeStr = KS_CheckBuffLV( OID, 621217 ) + KS_CheckBuffLV( OID, 621216 )*100		--取得指定物件身上BUFF等級
	local rate = 0.1+Lv*0.014--等級係數
	local compute = math.floor( baseStr*rate)--轉換值

	if BaseStr  == 0 or changeStr ~= compute then
		CancelBuff( OID, 621216 )--轉換100N
		CancelBuff( OID, 621217 )--轉換N
		CancelBuff( OID, 624377 )--轉換100N	拆解形態
		CancelBuff( OID, 624378 )--轉換N	拆解形態

		local x100 = math.floor(compute/100)
		if x100 > 0 then
			AddBuff( OID, 621216, x100-1, -1 )--轉換100N
		end

		local x1 = math.floor(compute%100)
		if x1 > 0 then
			AddBuff( OID, 621217, x1-1, -1 )--加耐
		end
		
		Lv = ReadRoleValue( OID , EM_RoleValue_MagicPowerLv_SP+5 )--鑄鐵符文工藝
		if Lv >= 0 then--鑄鐵符文工藝
			AddBuff( OID, 621222, Lv, -1 )
		end

		if ReadRoleValue( OID , EM_RoleValue_MagicPowerLv_SP+11 ) > 0 then--最終防線
			AddBuff( OID, 621228, 0, -1 )
		end
	end
end

function Lua_Job10_Skill2_Check()--符能牽引(498564)
	local OID = OwnerID()
	local TID = TargetID()

	if ReadRoleValue( TID, EM_RoleValue_IsNPC ) == 1 then
		if GetModeEx(TID,EM_SetModeType_Strikback)==false or GetModeEx(TID,EM_SetModeType_Move)==false then--不反擊or不移動的物件無效
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
	
	local radian = (math.pi/180)*( PosDir )--徑度
	PosX = PosX  +(Dis*math.cos(radian))
	PosZ = PosZ - (Dis*math.sin(radian))
	PosY  = GetHeight( PosX, PosY, PosZ )
	SetPos( TID, PosX, PosY, PosZ, PosDir )
end

function Lua_PP_Elite50_HealCheck()--精英技能 祭/靈50 治療檢查(498798)
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

function Lua_PP_Elite50_CreateSummon()--招喚
	local Oid = OwnerID( )
	local Summon = LuaFunc_CreateObjByObj(  106689, Oid )
	Hide(Summon)
	WriteRoleValue( Summon, EM_RoleValue_IsWalk, 1 )
	SetModeEx( Summon , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( Summon , EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Summon , EM_SetModeType_Fight, false )			-- 可砍殺攻擊
	SetModeEx( Summon , EM_SetModeType_Searchenemy , false )	-- 索敵
	Show(Summon, ReadRoleValue(Oid, EM_RoleValue_RoomID ) )
	SetFollow( Summon, Oid)
	WriteRoleValue( Oid, EM_LuaValueFlag_EliteSummon, Summon )
	CallPlot( Summon, "Lua_PP_Elite50_SummonAI", Oid )
end

function Lua_PP_Elite50_SummonAI( Master )--招換物檢察
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