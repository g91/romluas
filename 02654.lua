---------------------------------------------------可成長-------------------------------
function cl_skill_Ridicule_up(LV,Skill_UP,Value,Value_2) ----可隨技能成長LV內填入職業列表技能位置，Skill_UP填入成長系數，Value填入初始值，Value_2填入一般0，主職專屬1，副職一般2
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local hateTargetID , hateID = cl_ReadTarget_hatelist_Up( TargetID , OwnerID )
	local powerLV = nil
	if Value_2 == 0 then
		powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_Normal+LV )
		--say ( OwnerID , "Value_2=0")
	elseif Value_2 == 1 or  Value_2 == nil then
		powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+LV )
		--say ( OwnerID , "Value_2=1 or = nil")
	elseif Value_2 == 2 then
		powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SubJob+LV )
		--say ( OwnerID , "Value_2=2")
	end
	local SkillLV = Value + ( Value * Skill_UP * powerLV )
	local hate = hateTargetID + ( hateTargetID * SkillLV )
	SetHateListPoint( TargetID , hateID , hate )
	SetAttack( TargetID , OwnerID)  ----避免BOSS離開戰鬥要將當前目標給BOSS
end
function cl_ReadTarget_hatelist_Up( TargetGID , OwnerID ) ---->嘲諷技能讀取仇恨表以及仇恨表位置---
	local hate_table = HateListCount( TargetGID )
	local maxhate = 0
	local TempHate = 0
	local TempGID = 0
	local hateID = 0
	for i=0 , hate_table-1 do
		TempGID = HateListInfo( TargetGID,i,EM_HateListInfoType_GItemID)
		if TempGID == OwnerID then
			hateID = i
		end
		TempHate = HateListInfo( TargetGID , i , EM_HateListInfoType_HatePoint )
		if maxhate < TempHate then
			maxhate = TempHate
		end
	end
	return maxhate , hateID
end
------------------不可成長------------
function cl_skill_Ridicule(Lv) ----不會隨技能等級成長，LV內填入初始值   ----------wdb\dungeon\dgn_qrich_cadaver_den.wdb
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local hateTargetID , hateID = cl_ReadTarget_hatelist( TargetID , OwnerID )
	local hate = hateTargetID + ( hateTargetID * Lv )
	SetHateListPoint( TargetID , hateID , hate )
	SetAttack( TargetID , OwnerID)  ----避免BOSS離開戰鬥要將當前目標給BOSS
end
function cl_ReadTarget_hatelist( TargetGID , OwnerID ) ---->嘲諷技能讀取仇恨表以及仇恨表位置
	local hate_table = HateListCount( TargetGID )
	local maxhate = 0
	local TempHate = 0
	local TempGID = 0
	local hateID = 0
	for i=0 , hate_table-1 do
		TempGID = HateListInfo( TargetGID , i , EM_HateListInfoType_GItemID )
		if TempGID == OwnerID then
			hateID = i
		end
		TempHate = HateListInfo( TargetGID , i , EM_HateListInfoType_HatePoint )
		if maxhate < TempHate then
			maxhate = TempHate
		end
	end
	return maxhate , hateID
end
---------------------------------