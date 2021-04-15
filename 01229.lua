function AI_MOCA()

	local CheckTime = 10	-- 每秒判斷
	local SkillDelay = 2		-- 技能延遲時間
	local BuffID = 502851	-- 食物保鮮
	local SkillID = { 492601, 492602, 492603 }	-- 招式ID	
	-- 三連砍擊, 冰塊投擲, 食物保鮮
	local SkillLV = { 1, 1, 1 }			-- 招式LV
	local SkillSay = { "[SC_101587_01]", "[SC_101587_02]", "[SC_101587_03]" }	-- 招式說話
	-- 切！切！切切切！
	-- 喂～冷靜一下，請你吃塊冰！
	-- 新鮮的食物，最好馬上冰起來！

	local FireLuID = 112373
	local FireLu = LuaFunc_SearchNPCbyOrgID( OwnerID() , FireLuID , 1000 )	-- 搜尋火爐
	--if FireLu ~= -1 then
	--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , FireLu )
	--end

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

			if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 1 then
				WriteRoleValue( FireLu , EM_RoleValue_PID , 1 )
			end

			local SkillRND =  Rand( 100 )+1	-- 產生亂數
			local SkillShow = 1
			local MOCATarget = AttackTarget

			if SkillRND <= 100 and SkillRND > 60 then
				SkillShow = 1
				MOCATarget = AttackTarget		-- 打當前目標
			elseif SkillRND <= 60 and SkillRND > 30 then
				SkillShow = 2
				MOCATarget = HateTargetID()	-- 打仇恨表隨機一個目標
			elseif SkillRND <= 30 and SkillRND > 0 then
				SkillShow = 3
				MOCATarget = HateTargetID()	-- 打仇恨表隨機一個目標
			end

			if CheckBuff( MOCATarget , BuffID ) == false then	-- 食物保鮮後被攻擊優先降低
				Say( OwnerID() , SkillSay[SkillShow] )
				CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay * CheckTime )
			end

		else

			if FireLu ~= -1 then
				if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 0 then
					WriteRoleValue( FireLu , EM_RoleValue_PID , 0 )
				end
			end

		end

		Sleep( CheckTime )
	end

end

function AI_MOCA_FIRELU()

	local FireTime = 10 * 12		-- 每12秒爆一次
	local BombDistance = 500
	local FireMagicID = 492604		-- 火爐爆發
	local FireMagicLV = 1000
	local FireShow = "[SC_101587_04]"
	-- 毛腳火爐噴發火焰，你受到了火焰的灼燒！

	SetPlot( OwnerID() , "Range" , "LuaS_MOCA_FIRELU_Range" , 25 )

	while true do

		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 0 then
			ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_DEFAULT )
			CastSpellLV( OwnerID() , OwnerID() , FireMagicID , FireMagicLV )
		end

	Sleep( FireTime )

	end

end

function LuaS_MOCA_FIRELU_Range()

	local BuffID = 502853	-- 火爐火燒
	local BuffLV = 1
	local BuffTime = 10
	local FireShow = "[SC_101587_05]"
	-- 你被毛腳火爐的火焰灼燒，這種火焰可以破壞食物保鮮。

	ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_SYSTEM )
	AddBuff( OwnerID() , BuffID , BuffLV , BuffTime )

end

function LuaS_FireToIce_Do()	-- 破壞保鮮

	local IceBuffID = 502851	-- 食物保鮮
	local FireBuffID = 502853	-- 火爐火燒
	local Range = 50		-- 可以解冰的範圍
	local HaveNoIce = false	-- 還沒解冰過

	local Player = SearchRangePlayer( OwnerID() , Range )
	for i = 0 , table.getn( Player ) do
		if Player[i] == -1 then 
			break
		end
		if Player[i] ~= OwnerID() then
--			Say( OwnerID() , GetName(Player[i]) )
			if CheckBuff( Player[i] , IceBuffID ) == true then
				CancelBuff( Player[i] , IceBuffID )
				HaveNoIce = true		-- 有解冰過，做旗標
			end
		end
	end
	
	if HaveNoIce == true then
		if CheckBuff( OwnerID() , FireBuffID ) == true then
			CancelBuff( OwnerID() , FireBuffID )
			HaveNoIce = false	-- 歸回旗標
		end
	end

end

function LuaS_MOCA_NoIce()	-- 破壞保鮮

	local IceBuffID = 502851	-- 食物保鮮

	if CheckBuff( OwnerID() , IceBuffID ) == true then
		CancelBuff( OwnerID() , IceBuffID )
	end

end

function AI_MOCA_Hero()

	local CheckTime = 10	-- 每秒判斷
	local SkillDelay = 2		-- 技能延遲時間
	local BuffID = 502851	-- 食物保鮮
	local SkillID = { 492601, 492602, 493241}	-- 招式ID	
	-- 三連砍擊, 冰塊投擲, 食物保鮮
	local SkillLV = { 1, 1, 1 }			-- 招式LV
	local SkillSay = { "[SC_101587_01]", "[SC_101587_02]", "[SC_101587_03]" }	-- 招式說話
	-- 切！切！切切切！
	-- 喂～冷靜一下，請你吃塊冰！
	-- 新鮮的食物，最好馬上冰起來！

	local FireLuID = 112806
	local FireLu = LuaFunc_SearchNPCbyOrgID( OwnerID() , FireLuID , 1000 )	-- 搜尋火爐
	--if FireLu ~= -1 then
	--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , FireLu )
	--end

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

			if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 1 then
				WriteRoleValue( FireLu , EM_RoleValue_PID , 1 )
			end

			local SkillRND =  Rand( 100 )+1	-- 產生亂數
			local SkillShow = 1
			local MOCATarget = AttackTarget

			if SkillRND <= 100 and SkillRND > 60 then
				SkillShow = 1
				MOCATarget = AttackTarget		-- 打當前目標
				if CheckBuff( MOCATarget , BuffID ) == false then	-- 食物保鮮後被攻擊優先降低
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay * CheckTime )
				end
			elseif SkillRND <= 60 and SkillRND > 30 then
				SkillShow = 2
				MOCATarget = HateTargetID()	-- 打仇恨表隨機一個目標
				if CheckBuff( MOCATarget , BuffID ) == false then	-- 食物保鮮後被攻擊優先降低
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay * CheckTime )
				end
			elseif SkillRND <= 30 and SkillRND > 0 then
				SkillShow = 3
				local PlayerNum = HateListCount( OwnerID() )
				if PlayerNum >= 2 then
					local HateListRand = HateListRandom( OwnerID() )
					-- 冰 2 個人
					if CheckBuff( HateListRand[1], BuffID ) == false then	-- 食物保鮮後被攻擊優先降低
						Say( OwnerID() , SkillSay[SkillShow] )
						if CastSpellLV( OwnerID() , HateListRand[1], SkillID[SkillShow] , SkillLV[SkillShow] ) then
							-- AddBuff( HateListRand[2] , 502851 , 1 , 600 )
							Sleep( SkillDelay * CheckTime )
						end
					end
				else
					MOCATarget = HateTargetID()	-- 打仇恨表隨機一個目標
					if CheckBuff( MOCATarget , BuffID ) == false then	-- 食物保鮮後被攻擊優先降低
						Say( OwnerID() , SkillSay[SkillShow] )
						CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay * CheckTime )
					end
				end
			end

		else

			if FireLu ~= -1 then
				if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 0 then
					WriteRoleValue( FireLu , EM_RoleValue_PID , 0 )
				end
			end

		end

		Sleep( CheckTime )
	end

end

function AI_MOCA_FIRELU_Hero()

	local FireTime = 10 * 12		-- 每12秒爆一次
	local BombDistance = 500
	local FireMagicID = 493184		-- 火爐爆發，將492604改成493184，區分出35級和50級的不同
	local FireMagicLV = 2000                       --將原本的3000修改成2000
	local FireShow = "[SC_101587_04]"
	-- 毛腳火爐噴發火焰，你受到了火焰的灼燒！

	SetPlot( OwnerID() , "Range" , "LuaS_MOCA_FIRELU_Range_Hero" , 25 )

	while true do

		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 0 then
			ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_DEFAULT )
			CastSpellLV( OwnerID() , OwnerID() , FireMagicID , FireMagicLV )
		end

	Sleep( FireTime )

	end

end

function LuaS_MOCA_FIRELU_Range_Hero()

	local BuffID = 502853	-- 火爐火燒
	local BuffLV = 60
	local BuffTime = 10
	local FireShow = "[SC_101587_05]"
	-- 你被毛腳火爐的火焰灼燒，這種火焰可以破壞食物保鮮。

	ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_SYSTEM )
	AddBuff( OwnerID() , BuffID , BuffLV , BuffTime )

end