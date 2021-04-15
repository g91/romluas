function Lua_na_Z163_bat() --玩家觸碰後產生蝙蝠  123221
	local Owner = OwnerID()
--	WriteRoleValue( Owner , EM_RoleValue_Register1 , 1)
	local Reg1 = ReadRoleValue( Owner, EM_RoleValue_Register1) 
	while true do
		local Player = SearchRangePlayer( Owner , 30 )
		if #Player > 0 then
			Lua_na_Z163_bat_1()
			sleep(600)
		end
		sleep(10)
	end
end

function Lua_na_Z163_bat_1()
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue( Owner , EM_RoleValue_ZoneID)
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
	local bat = {}
	local BatID = { 108274, 108457 , 108470 } -- 船穴吸血蝠
	local BatLevel
	local FlagNum = {	[1] = { 0 , 5 } ,	[2] = { 6 , 11} ,	[3] = { 12 , 17}	} 
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	if ZoneID == 163 then
		BatLevel = BatID[1]
	elseif ZoneID == 164 then
		BatLevel = BatID[2]
	else
		BatLevel = BatID[3]	
	end
	
	for i = 1 , 3 do
		if PID == i then
			for j = FlagNum[i][1] ,  	FlagNum[i][2] , 1 do
			--	DebugMsg(0 , 0,  "Bat 1"..FlagNum[i][1])
			--	DebugMsg(0 , 0,  "Bat 2"..FlagNum[i][2])
				local x,y,z,dir=DW_Location( 781377 , j )	--根據旗子位置
				bat[i] =CreateObj( BatLevel ,x,y,z,dir,1 )
				SetModeEx( bat[i], EM_SetModeType_Gravity, true)
				BeginPlot( bat[i] , "Lua_na_Z163_bat_Check" , 20)
				AddToPartition( bat[i] , Room)
			end		
		end	
	end
end


function Lua_na_Z163_bat_Check() --蝙蝠檢查劇情，離開戰鬥刪除自己
	local Owner = OwnerID()
	local Count = 0
	while true do 
		local Player = SearchRangePlayer( Owner , 100 )
		if #Player == 0 then
			Count = Count+1
			if Count > 3 then
				DelObj( Owner)
			end
		else
			Count = 0
		end
		sleep(10)
	end
end

function Lua_na_Z163_treasurebox0()
	BeginPlot( OwnerID() , "Lua_na_Z163_treasurebox", 30)
end


function Lua_na_Z163_treasurebox()
	local Owner = OwnerID()
	PlayMotionEX( Owner ,ruFUSION_ACTORSTATE_SLEEP_BEGIN , ruFUSION_ACTORSTATE_SLEEP_LOOP ) 
end


--小怪技能相關
--殭屍技能
function Lua_na_Z163_zombie()
	local Owner = OwnerID()
	local Target = ReadRoleValue( Owner ,  EM_RoleValue_AttackTargetID)
	local BuffLv = FN_CountBuffLevel(Target, 625167)  
--	Say( Owner, "Owner")
	if CheckBuff( Target  , 625168 ) == true then
		return
	elseif BuffLv == 3 then
		AddBuff( Target  , 625168 , 0 , - 1 ) 
		CancelBuff( Target , 625167)
	else
		AddBuff( Target  , 625167 , 0 , - 1 ) 
	end	
end

--腐臭沼泥
function Lua_na_Z163_dirt_born()
	local Owner = OwnerID()
	local Target = TargetID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x,y,z,dir=DW_Location(Target)--根據物件位置
	local Obj=CreateObj(108343,x,y,z,dir,1)
	AddToPartition(Obj,Room)
end

function Lua_na_Z163_dirt()
	local Owner = OwnerID()
	local Target = TargetID()
	for i = 1 , 5 do
		SysCastSpellLv(Owner,Owner,851423,0) 
		sleep(10)	
	end
	DelObj( Owner)
end