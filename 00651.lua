
function voc_lv(voc,who)--voc�n�g�J�A�Q�d���Ū�¾�~�N�� who�n��J�A�Q�d����H��DBID

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