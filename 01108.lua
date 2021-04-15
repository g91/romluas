function Discowood_Colddowns(Sec)
	local BasicCD = 5
	local TargetCastingSpell = ReadRoleValue(TargetID() , EM_RoleValue_SpellMagicID ) --抓目標正在施的法術
	local TargetCastingSpell_ColdownType
	local TargetRoleValue_CastingSpell_Coldown

	if TargetCastingSpell ~= 0 then -- 如果正在施法

		TargetCastingSpell_ColdownType  = GameObjInfo_Int( TargetCastingSpell ,"ColdownType") -- 抓這個法術的冷卻類別
--		Say(OwnerID()  ,  TargetCastingSpell_ColdownType )
		TargetRoleValue_CastingSpell_Coldown = GameObjInfo_Int( TargetCastingSpell ,"ColdownTime") --抓這個法術的冷卻時間
--		Say(OwnerID() , TargetRoleValue_CastingSpell_Coldown )
		
		if Sec ~= nil then
			if TargetCastingSpell_ColdownType == 0 then
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_All , Sec )
			else
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType , TargetRoleValue_CastingSpell_Coldown)
				--Say(OwnerID()  , ReadRoleValue( TargetID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType ) )
			end
		else
			if TargetCastingSpell_ColdownType == 0 then
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_All ,  BasicCD  )
				--Say(OwnerID()  ,  ReadRoleValue(TargetID() , EM_RoleValue_Coldown_All   )  )
			else
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType , TargetRoleValue_CastingSpell_Coldown ) --將冷卻時間寫入目標正在放的法術的冷卻
				--Say(OwnerID()  , ReadRoleValue( OwnerID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType ) )
			end
		end
	end
end

function DW_CheckUse(ObjID,MagicID)  -- 回傳ObjID的MagicID冷卻值，如果MagicID沒有冷卻類別則回傳0，回傳0代表這個法術可以用了
	local Class = GameObjInfo_Int(MagicID,"ColdownClass")-- 抓這個法術的分類冷卻類別
	local Type  = GameObjInfo_Int( MagicID,"ColdownType") -- 抓這個法術的次分類冷卻類別
	return ReadRoleValue(ObjID , EM_RoleValue_Coldown_Job + Type  ) 
end

function DW_SetColdown(ObjID,MagicID,CD)  -- 將MagicID的法術冷卻設定為CD
	local Class = GameObjInfo_Int(MagicID,"ColdownClass")-- 抓這個法術的分類冷卻類別
	local Type  = GameObjInfo_Int( MagicID,"ColdownType") -- 抓這個法術的次分類冷卻類別
	WriteRoleValue(ObjID , EM_RoleValue_Coldown_Job + Type ,  CD) 
end