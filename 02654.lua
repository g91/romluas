---------------------------------------------------�i����-------------------------------
function cl_skill_Ridicule_up(LV,Skill_UP,Value,Value_2) ----�i�H�ޯন��LV����J¾�~�C��ޯ��m�ASkill_UP��J�����t�ơAValue��J��l�ȡAValue_2��J�@��0�A�D¾�M��1�A��¾�@��2
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
	SetAttack( TargetID , OwnerID)  ----�קKBOSS���}�԰��n�N��e�ؼе�BOSS
end
function cl_ReadTarget_hatelist_Up( TargetGID , OwnerID ) ---->�J�اޯ�Ū�������H�Τ�����m---
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
------------------���i����------------
function cl_skill_Ridicule(Lv) ----���|�H�ޯ൥�Ŧ����ALV����J��l��   ----------wdb\dungeon\dgn_qrich_cadaver_den.wdb
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local hateTargetID , hateID = cl_ReadTarget_hatelist( TargetID , OwnerID )
	local hate = hateTargetID + ( hateTargetID * Lv )
	SetHateListPoint( TargetID , hateID , hate )
	SetAttack( TargetID , OwnerID)  ----�קKBOSS���}�԰��n�N��e�ؼе�BOSS
end
function cl_ReadTarget_hatelist( TargetGID , OwnerID ) ---->�J�اޯ�Ū�������H�Τ�����m
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