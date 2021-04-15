
function voc_lv(voc,who)--voc要寫入你想查等級的職業代號 who要填入你想查的對象的DBID

	if voc==1 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Warrior)
	end
	
	if voc==2 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Ranger)
	end

	if voc==3 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Rogue)
	end

	if voc==4 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Wizard)
	end

	if voc==5 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Priest)
	end

	if voc==6 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Knight)
	end

	if voc==7 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_RuneDancer)
	end

	if voc==8 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Druid)
	end
	if voc==9 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Harpsyn)
	end
	if voc==10 then
		return ReadRoleValue(who,EM_RoleValue_VOCLV_Psyron)
	end
	return 1
end