function lua_bico_delbuff_500662()
	local own = OwnerID()
	if CheckBuff( own , 500662 ) == true then
	CancelBuff( own, 500662 )
	end
end

function lua_bico_buffcheckuse()
	local own = OwnerID()
	local tar = TargetID()
	if  CheckBuff( own , 506690 ) == true then
	CancelBuff( own, 506690 )
	CancelBuff( tar, 506690 )
	end
end

function lua_bivo_buffcheckcancel()
	local own = OwnerID()
	if  CheckBuff( own , 623383 ) == false then
	CancelBuff( own, 623384 )
	--say(own, "hi")
	CancelBuff(own, 623385)
	end
end

function lua_bico_buffcheck_623383()
	local own = OwnerID()
	if  CheckBuff( own , 623383 ) == true then
	return false
	else
	return true
	end
end

function lua_bico_checkbuff_622940()  ----�����R�ʶ����ˬd
	local	own = OwnerID()
	if CheckBuff( own , 623383 ) == true then
	CancelBuff( own , 506690 )
	end
end

function lua_star_DelEliteSkill6070()			-------�R��6070��^�ޯ�
	local LV6070FlagNum1 = 546730 --Dy0524�s�W6070���ŭ��n���~
	for k=1,65 do
		SetFlag( OwnerID()  , LV6070FlagNum1 , 0 )
		LV6070FlagNum1 = LV6070FlagNum1 + 1
	end	
	local LV6070FlagNum2 = 546796
	for k=1,67 do
		SetFlag( OwnerID()  , LV6070FlagNum2 , 0 )
		LV6070FlagNum2 = LV6070FlagNum2 + 1
	end	
end

function bico_Z24_pickpet() --�ư�GM&�d��
	local tar = TargetID()
	local race = ReadRoleValue( tar , EM_RoleValue_IsPlayer)
	local job = ReadRoleValue( tar , EM_RoleValue_VOC )
	if race ~= 1 or job == 0 then 
		return false
	else
		return true
	end
end

function bico_check_Gm_Pet()  --�ư�GM&�d��
	local own = OwnerID()
	local tar = TargetID()
	local AttackTarget = ReadRoleValue( own , EM_RoleValue_AttackTargetID )
	local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
	local Rolejob = ReadRoleValue ( tar , EM_RoleValue_VOC )  		--�P�_�O�_��GM
	local TargetID_Player = ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer)	--�P�_�O�_�����a
	if TargetID_Player ~= 1 and Rolejob == 0 then
	say(TargetID_Player,"pet")
		return false
	else
		return true
	end
end 

function lua_bico_notself()
	local own = OwnerID()
	local tar = TargetID()
	if own == tar then
	
	return false
	else
	return true
	end
end
