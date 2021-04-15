function aaaLuaPG_TheyareComing()	--範圍
	DebugMsg(0,0,"aaaLuaPG_TheyareComing")
	local Center = OwnerID()

	SetPlot(Center,"Range","aaaLuaPG_TheyareComing_02",80);
end

function aaaLuaPG_TheyareComing_02()
	DebugMsg(0,0,"aaaLuaPG_TheyareComing_02")
	local Player = OwnerID()
	local Center = TargetID()
	local Num03 = ReadRoleValue( Center, EM_RoleValue_Register3 );
	if ( Num03 == 0 ) then
		SetPlot(Center,"Range",0,0);
		CallPlot(Center,"aaaLuaPG_TheyareComing_03",Player,Center)
	end
end

function aaaLuaPG_TheyareComing_03(Player,Center)	--中控
	DebugMsg(0,0,"aaaLuaPG_TheyareComing_03")
	local RoomID =ReadRoleValue( Player, EM_RoleValue_RoomID );
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	local Monster = 107079
	
	-- 生成隱形球做特效用 --	
	local x,y,z,dir=DW_Location(Center)
	local Ball = CreateObj(119875, x, y, z , dir, 1 )					
	SetModeEx(Ball, EM_SetModeType_Mark,FALSE)
	SetModeEx(Ball, EM_SetModeType_Move,FALSE)
	AddToPartition(Ball, RoomID)
		
	Sleep(20)
	ScriptMessage( Player, Player, 1,"[SC_Z24Q425558_01]", 0 )
	Sleep(20)
	CastSpell(Ball, Ball, 850419)	--掛上特效	
	Sleep(50)
	
	local CreateMon = CreateObj( Monster, x, y, z, dir, 1)					--生成
	WriteRoleValue(CreateMon, EM_RoleValue_Register2, Center)				--把中控寫在怪物上
	WriteRoleValue(CreateMon , EM_RoleValue_IsWalk , 1 )
	DelObj(Ball)
	AddToPartition( CreateMon, RoomID)
	CallPlot(Center,"aaaLuaPG_VanishfromEye",Center)
end

function aaaLuaPG_VanishfromEye(Center)
	DebugMsg(0,0,"aaaLuaPG_VanishfromEye")
	while 1 do
		Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
		if Num03==0	then
			Sleep(300)
			SetPlot(Center,"Range","aaaLuaPG_TheyareComing_02",80);
			break
		end
		Sleep(50)
	end
end

function aaaLuaPG_DeleteorNot()	--怪物的產生劇情
	DebugMsg(0,0,"aaaLuaPG_DeleteorNot")
	local CreateMon = OwnerID()
	local Center = ReadRoleValue(CreateMon, EM_RoleValue_Register2)
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	BeginPlot( CreateMon, "aaaLuaPG_107079_HangingAround", 2)
	while 1 do
		sleep(600)
		if HateListCount(CreateMon)==0	then		----檢查仇很列表，沒有人的話
			WriteRoleValue(Center,EM_RoleValue_Register3, 0)
			DelObj(CreateMon)				----刪掉自己			
			break
		end
	end
end

function aaaLuaPG_107079_HangingAround()
	DebugMsg(0,0,"aaaLuaPG_107079_HangingAround")
	local CreateMon = OwnerID()
	local x,y,z,dir = DW_Location(CreateMon)
	while 1 do
		sleep(50)
		if HateListCount(CreateMon)==0	then		----檢查有沒有在攻擊
			WriteRoleValue(CreateMon , EM_RoleValue_IsWalk , 1)  
			Move(CreateMon ,x+Rand(50) ,y,z+Rand(50))
		end
	end
end

function aaaLuaPG_WhenTheyDie()
	DebugMsg(0,0,"aaaLuaPG_WhenTheyDie")
	local CreateMon = OwnerID()
	local Center = ReadRoleValue(CreateMon, EM_RoleValue_Register2)
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	if Num03 ~= 0	then
		Num03 =  0				
		WriteRoleValue(Center,EM_RoleValue_Register3,Num03)
	end
	DelObj(CreateMon)				----刪掉自己	
end