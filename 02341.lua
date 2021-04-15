function Lua_na_egrass_attack() --憤怒的古代蝕魂草技能
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local random= Rand(2)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then --當仙人掌進入戰鬥
			if  random <1 then --1/2 的機會施放攻擊法術
				PlayMotion( OwnerID(), 31 )
				sleep(20)
				say( OwnerID(), "CORRODE!!") -- 腐蝕吧！
				CastSpell( OwnerID(), OwnerID(), 496849) -- 古代蝕魂草技能 / 腐蝕汁液
				sleep(50)
			end
		end
	sleep(100)
	end
end



function Lua_na_sflower_attack() --暴躁的古代腐靈花
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local random= Rand(2)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then --當仙人掌進入戰鬥
			if  random <1 then --1/2 的機會施放攻擊法術
				PlayMotion( OwnerID(), 31 )
				sleep(20)
				say( OwnerID(), "BOMB") -- 爆炸吧！
				CastSpell( OwnerID(), OwnerID(), 496850) -- 果果仙人掌技能 / 果實炸彈
				sleep(50)
			end
		end
	sleep(100)
	end
end