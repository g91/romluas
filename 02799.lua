function DW_Homework_20121210()--先執行蛇行去，再走弧形回來
	local Player=OwnerID();
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID);
	local BoxTable=DW_Homework_BuildTenBox(Player);
	local NpcTable=DW_Homework_NpcOnBox(Player,BoxTable);
	local x,y,z,dir
	local DirectPaN_Value=1;
	local Distance=20;
	x,y,z,dir=DW_Location(Player);
	local Mushroom=CreateObj(100052,x,y,z,dir,1);
	WriteRoleValue(Mushroom,EM_RoleValue_IsWalk,0);
	--AddBuff(Mushroom,506984,5,-1);
	SetModeEx(Mushroom,EM_SetModeType_Searchenemy,false);
	MoveToFlagEnabled(Mushroom,false);
	AddtoPartition(Mushroom,RoomID);
	for SN=1,10,1 do
		x,y,z,dir=DW_Location(BoxTable[SN]);
		x,y,z,dir=DW_NewLocation(90*DirectPaN_Value,Distance,x,y,z,dir);
		sleep(Move(Mushroom,x,y,z));
		DirectPaN_Value=DirectPaN_Value*(-1)
	end
	DirectPaN_Value=-1;
	local InitialAngle=90
	local Unit=30
	for SN=10,1,-1 do
		x,y,z,dir=DW_Location(BoxTable[SN]);
		for Angle=( InitialAngle*DirectPaN_Value ),( 150*DirectPaN_Value ),( Unit*DirectPaN_Value ) do
			local PiValue=( math.pi/180 )*( Dir+Angle )
			--local tBox=CreateObj(110987,x,y,z,dir,1);
			--WriteRoleValue(tBox,EM_RoleValue_LiveTime,3)
			--AddtoPartition(tBox,RoomID);
			sleep(Move(Mushroom, x+( Distance*math.cos(PiValue) ) ,y, z-( Distance*math.sin(PiValue) ) ));
		end
		DirectPaN_Value=DirectPaN_Value*(-1)
		InitialAngle=Unit;
	end
	for BoxSN,Box in pairs(BoxTable) do
		DelObj(Box);
	end
	for NpcSN,Npc in pairs(NpcTable) do
		DelObj(Npc);
	end
	DelObj(Mushroom);
end
function DW_Homework_BuildTenBox(Player)--建立箱子，回傳table
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(Player);
	local Distance=50;
	local BoxTable={};
	for SN=1,10,1 do
		x,y,z,dir=DW_NewLocation(0,Distance,x,y,z,Dir)
		BoxTable[SN]=CreateObj(110987,x,y,z,dir,1);
		SetModeEx(BoxTable[SN],EM_SetModeType_Mark,false);
		AddtoPartition(BoxTable[SN],RoomID);
	end
	return BoxTable;
end
function DW_Homework_NpcOnBox(Player,BoxTable)--產生npc坐著，回傳table
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID);
	local Candidate={110025,110026,110027,110028,110034,110038,110044,110062,110097,110106};
	local NpcTable={};
	local x,y,z,dir;
	local NpcSN=0;
	for BoxSN,Box in pairs(BoxTable) do
		if CheckID(Box)==true then
			x,y,z,dir=DW_Location(Box);
			local CanSN=DW_Rand(#Candidate);
			local Npc=CreateObj(Candidate[CanSN],x,y+10,z,dir,1);
			SetModeEx(Npc,EM_SetModeType_Gravity,false);
			SetModeEx(Npc,EM_SetModeType_Searchenemy,false);
			AddtoPartition(Npc,RoomID);
			SetDefIdleMotion(Npc,ruFUSION_MIME_SIT_CHAIR_LOOP);
			table.remove(Candidate,CanSN);
			NpcTable[NpcSN+1]=Npc
			NpcSN=NpcSN+1;
		end
	end
	return NpcTable;
end
function DW_Homework_Test()
	local Player=OwnerID();
	local x,y,z,dir=DW_Location(Player);
	for Angle=0,180,30 do
		local PiValue=(math.pi/180)*(dir+Angle)
		x=x+( 50*math.cos(PiValue))
		z=z-( 50*math.sin(PiValue))
		y=GetHeight(x,y,z);
		local tBox=CreateObj(110987,x,y,z,dir,1);
		WriteRoleValue(tBox,EM_RoleValue_LiveTime,5)
		AddtoPartition(tBox,0)
	end
end