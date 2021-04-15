function un_zone25doormonster() --門口機關
--106123 門
--107516 無息巨影
--107517 腐爛巨影
--781252 旗標  1：無息 、 2：腐爛 、 3：門
local own = OWnerID()
local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID ) --151困難 、152普通 、153簡單 、939測試
local monster = {}
	if ZoneID == 151 or ZoneID == 939 then
		monster = {107517,107516,106123}  --2：無息 、 1：腐爛 、 3：門
	elseif 	ZoneID ==152 then
		monster = {107601,107600,106123}  --2：無息 、 1：腐爛 、 3：門
	elseif 	ZoneID ==153 then
		monster = {107617,107616,106123}  --2：無息 、 1：腐爛 、 3：門
	end
local create = {}
local monsterdie1 = 0 --判斷怪是不是死了
local monsterdie2 = 0 --判斷怪是不是死了
	for i = 1 , #monster do
		create[i] = CreateObjByFlag( monster[i], 781252 , i , 1 )
		un_zone25doormonster_1(create[i],i)
	end
	WriteRoleValue(create[1],EM_RoleValue_register1,create[2])  --把2寫給1
	WriteRoleValue(create[2],EM_RoleValue_register1,create[1])
	while 1 do
		sleep(10)
		--say(own,"hihihihihhiihihihihhihihi")
		if ReadRoleValue( create[1] , EM_RoleValue_IsDead)==1 or checkID(create[1]) == false then
			monsterdie1 = 1 
		end
		if ReadRoleValue( create[2] , EM_RoleValue_IsDead)==1 or checkID(create[2]) == false then
			monsterdie2 = 1
		end
		if monsterdie1 == 1 and monsterdie2 == 1 then
			Delobj(create[3])
			ScriptMessage( own, -1 , 2 , "[SC_ZONE25_MONSTER_01]" , 2 )
			sleep(10)
			return
		end
	end
end
function un_107516() --無息巨影進戰鬥AI
local own = OwnerID()
local timer = 0
	while 1 do
	sleep(30)
		if HateListCount(own) ~=0 then
		timer=timer+1
		--say(own,"timer = " ..timer)
			if timer >= 7 then
				while ReadRoleValue(own,EM_RoleValue_SpellMagicID)~=0 do
					sleep(2)
				end
				CastSpelllv( own, own,850521 ,0 )
				timer = 0 
			end
		end
	end
end
function un_zone25doormonster_1(obj,num) --生產參數
	local RoomID=ReadRoleValue(obj,EM_RoleValue_RoomID)
	if num == 3 then
		SetModeEx(obj,EM_SetModeType_Mark, false)
		SetModeEx(obj,EM_SetModeType_HideName, false)
		SetModeEx(obj,EM_SetModeType_NotShowHPMP, true)
		SetModeEx(obj,EM_SetModeType_Strikback, false)
		SetModeEx(obj,EM_SetModeType_Move, false)
		SetModeEx(obj,EM_SetModeType_Fight, false)
		SetModeEx(obj,EM_SetModeType_Searchenemy, false)
		SetModeEx(obj,EM_SetModeType_Obstruct, true)
	elseif num == 2 then
		BeginPlot(obj , "un_zone25doormonster_2" , 0)
	elseif num == 1 then	
		BeginPlot(obj , "un_zone25doormonster_3" , 0)
	end
	AddToPartition( obj, RoomID)
end

function un_zone25doormonster_2() --無息AI
local own = OwnerID()
local target
local create
local monstar = {}
local timmer = 0
Setplot(own,"dead","un_zone25doormonster_6",0)
--say(own," say  yessss")
	while 1 do
		timmer = timmer +1
		sleep(40)
		target=ReadRoleValue(own,EM_RoleValue_AttackTargetID) --目標
		if target ~=0 then
			local x,y,z = ReadRoleValue(own,EM_RoleValue_X),ReadRoleValue(own,EM_RoleValue_Y),ReadRoleValue(own,EM_RoleValue_Z)
			for i = 1 , 3 do
				create = Az_RND_Ary(-100,100,2)  --隨機生怪點用
				monstar[i] = CreateObj ( 107515 , x+(create[1]) , y , z+(create[2]) , 0 , 1) 
				un_zone25doormonster_1(monstar[i],3)
				BeginPlot(monstar[i], "un_zone25doormonster_4" , 0)
			end	
		end
	end
end

function un_zone25doormonster_3() --腐爛AI
local own = OwnerID()
local monster = ReadRoleValue(own,EM_RoleValue_register1)
Addbuff(own,623875,0,-1)
LockHP( own , ReadRoleValue(own,EM_RoleValue_MaxHP) , "" )
	while true do
	sleep(20)
		if hatelistcount(own) == 0 and hatelistcount(monster) ~= 0 then
			local Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
			SetAttack( own, Targ )
		end
	end
--say(own," say  nooooooooo")
end

function un_zone25doormonster_4() --爆炸包子的劇情
	local own = OwnerID()
	local timee = 0 
	while 1 do
		timee = timee +1
		sleep(10)
		if timee == 5 then
			sysCastSpellLv(own,own,850519,4)
		elseif timee == 6 then
			Delobj(own)
		end
	end
end

function un_zone25doormonster_5() --胞子粉塵重壓
	local own = OwnerID()
	local people = {}
	local x,y,z = ReadRoleValue(own,EM_RoleValue_X),ReadRoleValue(own,EM_RoleValue_Y),ReadRoleValue(own,EM_RoleValue_Z)
	local dir	
	addbuff(own,500596,0,3)
		sleep(5)
		people = SearchRangePlayer  ( own, 300 )
		for i=0 , table.getn(people) do
			dir = ReadRoleValue(people[i],EM_RoleValue_Dir)
			SetPos( people[i], x, y, z , dir ) 
		end		
	return true
end
function un_zone25doormonster_6() --無錫死亡劇情
local monster = ReadRoleValue(OWnerID(),EM_RoleValue_register1)
LockHP( monster , -1 , "" )
end

-----------*********---------*********------------*************------------***********------------**********
 -- 胞子陷阱
 --旗標：781252  4~15
-----------*********---------*********------------*************------------***********------------**********
function un_zone25doormonster_7() --掛中控
local monster = {}
local num = {4,5,6,7,8,9,10,11,12,13,14,15}
local rnd
	for a = 1 , 20 do 	
		table.insert(num,table.remove(num,DW_rand(#num)))
	end
	while 1 do
		sleep(10)
		for i = 1 , 12 do
			sleep(15)
			monster[i]=CreateObjByFlag( 107515, 781252 , num[i] , 1 )
			un_zone25doormonster_1(monster[i],3)
			BeginPlot(monster[i], "un_zone25doormonster_4" , 0)
		end
	end	
end
-----------*********---------*********------------*************------------***********------------**********
--原生吸血
-----------*********---------*********------------*************------------***********------------**********
function un_107519()  --吸血
local own = OwnerID()
local player = {}
player = SearchRangePlayer ( own , 200 ) 
	if #player>0 then
		sysCastSpellLv (own , own, 850526 , #player )
	end

end
function un_107520_1()
SetPlot( OwnerID(),"dead","un_107520_2",0 )
end
function un_107520_2()
local monster
monster = LuaFunc_CreateObjByObj ( 107521 , OwnerID() ) 
un_zone25doormonster_1(monster,3)
WriteRoleValue(monster,EM_RoleValue_Livetime,2)
sysCastSpellLv (monster , monster, 850527 , 0 )
end
function un_107520()  --死亡酸爆
local own = OwnerID()
sysCastSpellLv (own , own, 850527 , 0 )
end