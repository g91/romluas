function lua_skwerl_AOE_FX()--�d��k�N�S��
local Player = TargetID()
local Mine = OwnerID()
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m

	SysCastSpellLv( Player, Mine, 499371,1 )

	sleep ( 10 )
end



function lua_skwerl_mobius_aoe_attack()-- AOE ����
	local target= TargetID()
	local Player=OwnerID()
	local hp= FN_CountBuffLevel(target, 622401)+1
	local speed=FN_CountBuffLevel(target, 622403)+1
	local modifier=2^speed
	local score= modifier*2
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local hit= ReadRoleValue( target , EM_RoleValue_Register+2  ) --�ˬd�ؼЬO�_�H���u 


	if hit==1 then ---�p�G�P�_�ؼФw�g���u�A�k�N�L��
		return false
	end

	if tgtid~=106881 then  --�u�������ʥؼ� 
		return false
	end
	if checkbuff (target, 622606)== true then
		return false
	end

	SysCastSpellLv(target, Player, 499386, 1 )

	if hp<=2 then
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- �קK�Q�����h��
 		SysCastSpellLv( target, target, 497005,1 )
 		AddBuff(target , 621826 , 1 , -1)
		Addbuff(player, 622402, score-1, -1)
		Addbuff(player, 622543, 0, -1)
	--	say(target, score)
 		Callplot(target, "lua_skwerl_mobius_death")
	else
		Cancelbuff(target,  622401)
		local hp2=hp-3
		Addbuff(player, 622402, score-1, -1)
	--	say(target, score)
		addbuff(target, 622401, hp2, -1)
	end

end


function lua_skwerl_mobius_slow_attack() --�w�t����
	local target= TargetID()
	local Player=OwnerID()
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local speed= FN_CountBuffLevel(Target, 623108)+1
	local j= ReadRoleValue( target , EM_RoleValue_Register+8  )  --Ū���ۤv���ؼ�
	local i=ReadRoleValue( target , EM_RoleValue_Register+9  ) --Ū���ۤv���ؼ�
	if tgtid~=106881 and tgtid~=106882 and tgtid~=106883 and tgtid~= 106884 and tgtid~=106885 then  --�u�������ʥؼ�
		return false
	end
	if checkbuff (target, 622606)== true then
		return false
	end
	AddBuff(target , 623108, speed+550 , -1) --�w�t
	StopMove(target, true)
	ReCalculate(target) --���s�p��ؼгt��
	callplot(target, "lua_skwerl_mobius_move", j, i)
end



---------------------------------------------------------------
---cheat---

---------------------------------����μu�q��script--------------------------------------------------

Function lua_skwerl_mobius_aoe_ammo() --AOE �ޯ�
local Player= OwnerID()
local bufflv= FN_CountBuffLevel(Player, 622646)+1 --�s�X�ݾl�u�q
	if bufflv+1 ==2 then  --�p�G�u�Ķq��0�A�R���ޯ�
		Cancelbuff(Player, 622601) --�����ޯ�
		Cancelbuff(Player, 622646) 
	else
	local newbuff= bufflv-1  --���s�p�⪱�a���ݩ�u�q
		Cancelbuff(Player, 622646) 
		Addbuff(Player, 622646, newbuff-1, -1)
	end

return true
	
end

--------------------------------------------------------
Function lua_skwerl_mobius_slow_ammo() --�w�t�ޯ�
local Player= OwnerID()
local bufflv= FN_CountBuffLevel(Player, 622647)+1 --�s�X�ݾl�u�q
	if bufflv+1 ==2 then  --�p�G�u�Ķq��0�A�R���ޯ�
		Cancelbuff(Player, 622602)--�����ޯ�
		Cancelbuff(Player, 622647) 
	else
	local newbuff= bufflv-1  --���s�p�⪱�a���ݩ�u�q
		Cancelbuff(Player, 622647) 
		Addbuff(Player, 622647, newbuff-1, -1)
	end

return true
	
end

--------------------------------------------------------------
