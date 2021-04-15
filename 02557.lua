function un_RangeSkill_498744() --靜電共鳴
	Lua_CDtime_set(OwnerID(),491156,0)	--調整ObjID的技能MagicID的冷卻時間，Time如果填0或是大於0，會直接把技能的CD設為Time；如果設負數則是讓技能CD減少Time	
end
function un_RangeSkill_498758() --深層啟發
	Lua_CDtime_set(OwnerID(),490251,0) --能量之井
	Lua_CDtime_set(OwnerID(),490225,0) --增幅
end

function un_RangeSkill_498759()
	local own = OwnerID()
	local tar = TargetID()
	CallPlot(own,"un_RangeSkill_498759_plot",tar)
end
function un_RangeSkill_498759_plot(tar) --雷燄迸發
	local own = OwnerID()
	Sleep(5)
	if ReadRoleValue( tar , EM_RoleValue_IsDead)==0  and checkbuff(own,621514)== false then
		Lua_CDtime_set(own,498759,0) --雷燄迸發
		addbuff(own,621514,0,6)
	end
end
------------------------------------------------------------------------影/工
function un_RangeSkill_498826() --迷惑機關
	local own = OwnerID()
	local tar = TargetID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local monster = LuaFunc_CreateObjByObj ( 106517 , tar )
	WriteRoleValue(monster,EM_RoleValue_register2,tar)
	WriteRoleValue(monster,EM_RoleValue_register3,own)
	addbuff(monster,621602,0,-1) 					   --給減傷buff
	WriteRoleValue(monster,EM_RoleValue_register1,tar) --目標寫給陷阱
	WriteRoleValue(monster,EM_RoleValue_Livetime,4)
		SetModeEx(monster,EM_SetModeType_Mark,true)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, true) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	AddToPartition( monster, RoomID)
	beginplot(monster,"un_RangeSkill_498826_2",0)
end
function un_RangeSkill_498826_2() --迷惑機關2
	local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_register1)
	local master =ReadRoleValue(own,EM_RoleValue_register3)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+88 )

	while 1 do
		sleep(10)
		SysCastSpellLv(own,tar,498827,skilllv)
	end
end
function un_RangeSkill_498828() --翼足機關1
	SetPlot( OwnerID(),"range","un_RangeSkill_498828_1",20 ) --觸發35碼
end
function un_RangeSkill_498828_1() --翼足機關2--此時的「OwnerID」是指玩家，「TargetID」是翼足機關
	local tar = TargetID()
	local point = ReadRoleValue(tar,EM_RoleValue_register1)
	local own = OwnerID()
	local master = ReadRoleValue ( tar , EM_RoleValue_OwnerGUID )
	SetPlot( tar,"range","",0 )
	SysCastSpellLv(master,own,498829,0)
	sleep(5)
	WriteRoleValue(tar,EM_RoleValue_register1,point+1)
	point = ReadRoleValue(tar,EM_RoleValue_register1)
	--say(tar,"point = "..point)
	if point == 6 then
		delobj(tar)
	end
	BeginPlot(tar , "un_RangeSkill_498828" , 0)
end
function un_RangeSkill_498830()--步枷機關
	local own = OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )-- 抓到主人
	local x = ReadRoleValue(own,EM_RoleValue_X)
	local y = ReadRoleValue(own,EM_RoleValue_Y)
	local z = ReadRoleValue(own,EM_RoleValue_Z)
	local monster = CreateObj ( 106524 , x , y , z, 0 , 1)
	--local monster = LuaFunc_CreateObjByObj ( 106524 , own ) 
		SetModeEx(monster,EM_SetModeType_Mark,false)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, false) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,true)           ---不顯示血條
	AddToPartition(monster,RoomID)
	WriteRoleValue(monster,EM_RoleValue_register1,Master)
	WriteRoleValue(monster,EM_RoleValue_Livetime,5)
	Beginplot(monster,"un_RangeSkill_498830_1",0)
end
function un_RangeSkill_498830_1()--步枷機關效果
	local own = OwnerID()
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+90 )
	while 1 do
		sleep(10)
		SysCastSpellLv(master,own,498832,skilllv)
	end
end