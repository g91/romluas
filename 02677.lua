function lua_skwerl_AOE_FX()--範圍法術特效
local Player = TargetID()
local Mine = OwnerID()
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置

	SysCastSpellLv( Player, Mine, 499371,1 )

	sleep ( 10 )
end



function lua_skwerl_mobius_aoe_attack()-- AOE 攻擊
	local target= TargetID()
	local Player=OwnerID()
	local hp= FN_CountBuffLevel(target, 622401)+1
	local speed=FN_CountBuffLevel(target, 622403)+1
	local modifier=2^speed
	local score= modifier*2
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local hit= ReadRoleValue( target , EM_RoleValue_Register+2  ) --檢查目標是否以中彈 


	if hit==1 then ---如果判斷目標已經中彈，法術無用
		return false
	end

	if tgtid~=106881 then  --只攻擊活動目標 
		return false
	end
	if checkbuff (target, 622606)== true then
		return false
	end

	SysCastSpellLv(target, Player, 499386, 1 )

	if hp<=2 then
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- 避免被擊中多次
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


function lua_skwerl_mobius_slow_attack() --緩速攻擊
	local target= TargetID()
	local Player=OwnerID()
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local speed= FN_CountBuffLevel(Target, 623108)+1
	local j= ReadRoleValue( target , EM_RoleValue_Register+8  )  --讀取自己的目標
	local i=ReadRoleValue( target , EM_RoleValue_Register+9  ) --讀取自己的目標
	if tgtid~=106881 and tgtid~=106882 and tgtid~=106883 and tgtid~= 106884 and tgtid~=106885 then  --只攻擊活動目標
		return false
	end
	if checkbuff (target, 622606)== true then
		return false
	end
	AddBuff(target , 623108, speed+550 , -1) --緩速
	StopMove(target, true)
	ReCalculate(target) --重新計算目標速度
	callplot(target, "lua_skwerl_mobius_move", j, i)
end



---------------------------------------------------------------
---cheat---

---------------------------------控制用彈量的script--------------------------------------------------

Function lua_skwerl_mobius_aoe_ammo() --AOE 技能
local Player= OwnerID()
local bufflv= FN_CountBuffLevel(Player, 622646)+1 --叫出殘餘彈量
	if bufflv+1 ==2 then  --如果彈藥量為0，刪除技能
		Cancelbuff(Player, 622601) --攻擊技能
		Cancelbuff(Player, 622646) 
	else
	local newbuff= bufflv-1  --重新計算玩家的殘於彈量
		Cancelbuff(Player, 622646) 
		Addbuff(Player, 622646, newbuff-1, -1)
	end

return true
	
end

--------------------------------------------------------
Function lua_skwerl_mobius_slow_ammo() --緩速技能
local Player= OwnerID()
local bufflv= FN_CountBuffLevel(Player, 622647)+1 --叫出殘餘彈量
	if bufflv+1 ==2 then  --如果彈藥量為0，刪除技能
		Cancelbuff(Player, 622602)--攻擊技能
		Cancelbuff(Player, 622647) 
	else
	local newbuff= bufflv-1  --重新計算玩家的殘於彈量
		Cancelbuff(Player, 622647) 
		Addbuff(Player, 622647, newbuff-1, -1)
	end

return true
	
end

--------------------------------------------------------------
