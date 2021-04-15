function AI_UZALIAN()

	local CheckTime = 10	-- 每秒判斷
	local WiDiMark = 0
	local WuDiTime = 10 *30	-- 無敵30秒
	local IceMark = 0
	local IceTime = 10 *15	-- 每15秒冰一個
	local SkillTime = 2.5		-- 技能延遲時間
	local HammerFlagID = 780286
	local HammerFlag = {}
	local Hammer = {}
	local HammerID = 112324
	local IceDistance = 500
	local BuffID = 502826	-- 水汽凝結
	local StartHammer = 0

	local SkillID = { 492379, 492380, 492381, 492382, 502826, 492573 }
	local SkillLV = { 15, 30 , 300 , 20 , 1 , 1 }
	local SkillSay = { "[SC_101501_01]", "[SC_101501_02]", "[SC_101501_03]", "[SC_101501_04]", "[SC_101501_05]", "[SC_101501_06]" }
	--local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	--local HammerFlagStr = ""
	for f = 1, 	GetMoveFlagCount( HammerFlagID )-1 do
		table.insert( HammerFlag , f )
	--	HammerFlagStr = HammerFlagStr.." , "..HammerFlag[f]
	end
	--Say( OwnerID() , HammerFlagStr )

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

			if StartHammer == 0 then
				HammerFlag = Lua_MixTable( HammerFlag )
				local thisHammerFlag = HammerFlag[1]
				local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag , 1 , 1 )	--CreateObjByFlag( HammerID, HammerFlagID , thisHammerFlag , 1 )
				table.insert( Hammer  , thisHammerID )
				SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
				AddBuff( thisHammerID , 502840 , 1 , 600 )		-- 亮晶晶
				StartHammer = 1
			end

			if IceMark >= 15 then
				local SkillShow = 5
				local IceTarget = 0
				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime  )
				if HateListCount( OwnerID() ) > 1 then	-- 不冰坦克
					---------------- 如果 AttackTarget 已經被冰了，那就另外找一個仇恨最高又沒被冰的 --------------
					if CheckBuff( AttackTarget , 502826 ) == true then
						for i = 0 , HateListCount( OwnerID() ) -1 , 1 do
							if CheckBuff( HateListInfo( OwnerID() , i , EM_HateListInfoType_GItemID ) , 502826 ) == false then
								AttackTarget =  HateListInfo( OwnerID() , i , EM_HateListInfoType_GItemID ) 
								break
							end
						end
					end
					------------------------------------------------------------------------------------------------------------------------------
					IceTarget = HateListNoAttackTarget( OwnerID(), AttackTarget )
				else	-- 一個人必冰
					IceTarget = AttackTarget 
				end

				if GetDistance( OwnerID() , IceTarget ) <= IceDistance and CheckBuff( IceTarget , BuffID ) == false then
					local HammerNow = LuaFunc_SearchNPCbyOrgID( OwnerID() , HammerID , IceDistance )	-- 搜尋破冰之鎚
					if HammerNow == -1 then

						HammerFlag = Lua_MixTable( HammerFlag )
						local thisHammerFlag = HammerFlag[1]
						local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag , 1 , 1 )	--CreateObjByFlag( HammerID, HammerFlagID , thisHammerFlag , 1 )
						table.insert( Hammer  , thisHammerID )
						--WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
						SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
						AddBuff( thisHammerID , 502840 , 1 , 600 )		-- 亮晶晶
					end

					ScriptMessage( OwnerID() , IceTarget , 1 ,  SkillSay[SkillShow], C_SYSTEM )
					--CastSpellLV( OwnerID() , IceTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					AddBuff( IceTarget , SkillID[SkillShow] , 1 , 600 )		-- 10 分鐘
				end
				--Sleep( IceTime )
				IceMark = 0
			end

			if WiDiMark >= 30 then
				local SkillShow = 6	-- 無敵
				local IceTarget = 0

				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime*2 )
				WuDiTime = HateListCount( OwnerID() )*50 			--以人數決定無敵時間長短  (小鑫修正)
				Buff_WuDiTime = WuDiTime / 10				--無敵Buff時間 (小鑫修正)

				ScriptMessage( OwnerID() , 0 , 2 ,  SkillSay[SkillShow], C_SYSTEM )		-- 開始無敵
				SetFightMode(  OwnerID() , 1, 0, 1, 1 )		-- 不移動
				Sleep( 2 )
				--CastSpellLV( OwnerID() , OwnerID(), SkillID[SkillShow] , SkillLV[SkillShow] )
				AddBuff( OwnerID() , 502827 , 1 , Buff_WuDiTime  )					-- 皮膚硬化 (小鑫修正,防止無敵有時候施放失敗)				
				for i = 1, table.getn( Hammer ) do	-- 先刪掉場上的的破冰之鎚
					if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		DelObj( Hammer[i] )	end
				end
				if ( Hammer ~= nil ) then	Hammer = {}	end

				HammerFlag = Lua_MixTable( HammerFlag )
				local HateListRand = HateListRandom( OwnerID() )
				for t = 1, table.getn( HateListRand ) - 1 do	-- -1 就是(最後)一個不冰
--Say(OwnerID() , GetName(HateListRand[t]) )
					local SkillShow = 5	-- 冰
					local thisHammerFlag = HammerFlag[t]
					local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag , 1 , 1 )	--CreateObjByFlag( HammerID, HammerFlagID , thisHammerFlag , 1 )
					table.insert( Hammer  , thisHammerID )
					SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
					AddBuff( thisHammerID , 502840 , 1 , 600 )		-- 亮晶晶

					IceTarget = HateListRand[t]
					if GetDistance( OwnerID() , IceTarget ) <= IceDistance then
						ScriptMessage( OwnerID() , IceTarget , 1 ,  SkillSay[SkillShow], C_SYSTEM )	-- 冰人
						--CastSpellLV( OwnerID() , IceTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						AddBuff( IceTarget , SkillID[SkillShow] , 1 , 600 )		-- 10 分鐘
					end
				end
				------檢查是不是全冰了，是的話隨機一個解冰--------
				sleep(10)
				local AllIceCheck = 0
				local Freeman = 0
				for i = 1 , table.getn( HateListRand ) , 1 do
					if CheckBuff( HateListRand[i] , 502826 ) == true then
						AllIceCheck = AllIceCheck + 1
					end
				end
				if HateListCount( OwnerID() ) > 1 and AllIceCheck == table.getn( HateListRand ) then
					Freeman = HateListRand[ table.getn( HateListRand )]
					for i = 1 , table.getn( HateListRand ) -2 , 1 do -------檢查一定要是活的人才放掉，但如果只有一個活人，冰給他死
						if ReadRoleValue( Freeman , EM_RoleValue_IsDead ) == 1 then
							Freeman = HateListRand[ table.getn( HateListRand )-i]
						else
							break
						end
					end							
					CancelBuff( Freeman , 502826 )
				end				
				-----------------------------------------------------------------------
				Sleep( WuDiTime-20 )
				ScriptMessage( OwnerID() , 0 , 2 ,  "[SC_101501_07]", C_SYSTEM )		-- 解除無敵
				WiDiMark  = 0			
				SetFightMode(  OwnerID() , 1, 1, 1, 1 )						-- 恢復正常				
				SkillShow = 4
				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime - 10 )
				CastSpellLV( OwnerID() , HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )	-- 無敵清場

				
				
			end

			--local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			--local HPPercent = ( NowHP / MaxHP ) * 100

			-- 血 100% 處置
			--    if ( HPPercent <= 100 ) and ( HPPercent >= 75 ) then
			--	local SkillRND =  Rand( 50 )+1	-- 產生亂數
				--Say( OwnerID() , SkillRND .." %" )
			--	local SkillShow = 1
			--	if SkillRND <= 50 and SkillRND > 25 then
			--		SkillShow = 1
			--	elseif SkillRND <= 25 and SkillRND > 0 then
			--		SkillShow = 2
			--	end
			--	WiDiMark = WiDiMark + SkillTime
			--	IceMark = IceMark + SkillTime
			--	Sleep( SkillTime*CheckTime )
				--Say( OwnerID() ,  SkillSay[SkillShow] )
			--	CastSpellLV( OwnerID() , AttackTarget , SkillID[SkillShow] , SkillLV[SkillShow] )

			-- 血 75% 處置
			--elseif ( HPPercent < 75 ) and ( HPPercent >= 50 ) then
			--	local SkillRND =  Rand( 50 )+1	-- 產生亂數
				--Say( OwnerID() , SkillRND .." %" )
			--	local SkillShow = 1
			--	if SkillRND <= 50 and SkillRND > 25 then
			--		SkillShow = 1
			--	elseif SkillRND <= 25 and SkillRND > 0 then
			--		SkillShow = 2
			--	end
			--	WiDiMark = WiDiMark + SkillTime
			--	IceMark = IceMark + SkillTime
			--	Sleep( SkillTime*CheckTime )
				--Say( OwnerID() ,  SkillSay[SkillShow] )
			--	CastSpellLV( OwnerID() , AttackTarget , SkillID[SkillShow] , SkillLV[SkillShow] )

			-- 血 50% 處置
			--elseif ( HPPercent < 50 ) and ( HPPercent >= 25 ) then
			--	local SkillRND =  Rand( 80 )+1	-- 產生亂數
				--Say( OwnerID() , SkillRND .." %" )
			--	local SkillShow = 1
			--	if SkillRND <= 80 and SkillRND > 50 then
			--		SkillShow = 1
			--	elseif SkillRND <= 20 and SkillRND > 25 then
			--		SkillShow = 2
			--	elseif SkillRND <= 25 and SkillRND > 0 then
			--		SkillShow = 3
			--	end
			--	WiDiMark = WiDiMark + SkillTime
			--	IceMark = IceMark + SkillTime
			--	Sleep( SkillTime*CheckTime )
				--Say( OwnerID() ,  SkillSay[SkillShow] )
			--	CastSpellLV( OwnerID() ,  HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )

			-- 血 25% 處置
			--elseif ( HPPercent < 25 ) and ( HPPercent > 0 ) then
				local SkillRND =  Rand( 100 )+1	-- 產生亂數
				--Say( OwnerID() , SkillRND .." %" )
				local SkillShow = 1
				if SkillRND <= 100 and SkillRND > 75 then
					SkillShow = 1
				elseif SkillRND <= 75 and SkillRND > 50 then
					SkillShow = 2
				elseif SkillRND <= 50 and SkillRND > 5 then
					SkillShow = 3
				elseif SkillRND <= 5 and SkillRND > 0 then
					SkillShow = 1
					--SkillShow = 4
				end

				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime )
				--Say( OwnerID() ,  SkillSay[SkillShow] )
				CastSpellLV( OwnerID() , HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )

			--end
			WiDiMark = WiDiMark + 1
			IceMark = IceMark + 1

		else

			WiDiMark = 0
			IceMark = 0
			StartHammer = 0

			for i = 1, table.getn( Hammer ) do	-- 離開戰鬥刪破冰之鎚
				if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		DelObj( Hammer[i] )	end
			end
			if ( Hammer ~= nil ) then	Hammer = {}	end

		end

		Sleep( CheckTime )
	end

end

function HateTargetID()	-- 仇恨表隨機
	return HateListInfo( OwnerID() , Rand( HateListCount( OwnerID() ) ) , EM_HateListInfoType_GItemID )
end

function HateListNoAttackTarget( Player , AttackTarget )	-- 不打仇恨表中的當前目標

	local HateTable = {}
	for i = 0, HateListCount( Player )-1 do
		local HateList = HateListInfo( OwnerID() , i , EM_HateListInfoType_GItemID )
		if HateList ~= AttackTarget then
			table.insert( HateTable , HateList )
		end
	end

	--for i = 1, table.getn(HateTable) do
	--	Say( OwnerID() , HateTable[i] )
	--end

	return HateTable[Rand( table.getn( HateTable ) )+1]

end

function HateListRandom( Player )	-- 仇恨表全部隨機

	local HateTableRand = {}
	for i = 0, HateListCount( Player )-1 do
		local HateList = HateListInfo( OwnerID() , i , EM_HateListInfoType_GItemID )
		table.insert( HateTableRand , HateList )
	end

	return Lua_MixTable( HateTableRand )

end

function LuaS_203869_Check()	-- 破冰之鎚
	local BuffID = 502826	-- 水汽凝結
	if CheckBuff( TargetID() , BuffID ) == true then	-- 水汽凝結
		return true
	end
		return false
end

function LuaS_203869_Do()	-- 破冰之鎚
	local BuffID = 502826	-- 水汽凝結
	if CheckBuff( TargetID() , BuffID ) == true then
		CancelBuff( TargetID(), BuffID )
	end
end

function LuaS_112324_GetHammer()		-- 拿槌子
	if CheckBuff( OwnerID() , 502826 ) == true then
		return
	end
	local HammerID = 203869
	SetPlot( TargetID() , "touch" , "" , 0 )
	Sleep( 2 )
	GiveBodyItem( OwnerID() , HammerID , 1 )
	Sleep( 3 )
	DelObj( TargetID() )
end
