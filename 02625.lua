-------------------------------------------------------------------�Ĥ@�qĵ��
function un_zone212_monsterdie_1() -- �s��1~8
	SetPlot( OwnerID(),"dead","lua_zone212_NPCplay",0 )
end

function lua_zone212_NPCplay()  --���b�Ǩ��W�����`�@��Ĳ�o
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local NPC = {}
	for i= 1 , 4 do
		NPC[i] = CreateObjByFlag( 106586, 781106 , i , 1 )
		WriteRoleValue(NPC[i],EM_RoleValue_Register1,i+4)
		AddToPartition(NPC[i],RoomID)
		beginplot(NPC[i],"Un_212_monster_walk",0)
	end
		NPCSay( NPC[1], "[SC_ZONE190_02]" )
end

function Un_212_monster_walk()--���X��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
local flag = 781106
local flagnum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , flag ,flagnum,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				sleep(10)
				end
			end
		end	
		sleep(10)
	end
end
-------------------------------------------------------------------�ĤG�qĵ��
function un_zone212_monsterdie_2() -- �s��1~8
	SetPlot( OwnerID(),"dead","lua_zone212_NPCplay_2",0 )
end

function lua_zone212_NPCplay_2()  --���b�Ǩ��W�����`�@��Ĳ�o
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local NPC = {}
	for i= 9 , 12 do
		NPC[i] = CreateObjByFlag( 106586, 781106 , i , 1 )
		WriteRoleValue(NPC[i],EM_RoleValue_Register1,i+4)
		AddToPartition(NPC[i],RoomID)
		beginplot(NPC[i],"Un_212_monster_walk_2",0)
	end
		NPCSay( NPC[9], "[SC_ZONE190_02]" )
end

function Un_212_monster_walk_2()--���X��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
local flag = 781106
local flagnum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , flag ,flagnum,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				sleep(10)
				end
			end
		end	
		sleep(10)
	end
end
-------------------------------------------------------------------�ĤT�qĵ��
function un_zone212_monsterdie_3() -- �s��1~8
	SetPlot( OwnerID(),"dead","lua_zone212_NPCplay_3",0 )
end

function lua_zone212_NPCplay_3()  --���b�Ǩ��W�����`�@��Ĳ�o
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local NPC = {}
	for i= 17 , 20 do
		NPC[i] = CreateObjByFlag( 106586, 781106 , i , 1 )
		WriteRoleValue(NPC[i],EM_RoleValue_Register1,i+4)
		AddToPartition(NPC[i],RoomID)
		beginplot(NPC[i],"Un_212_monster_walk_3",0)
	end
		NPCSay( NPC[17], "[SC_ZONE190_02]" )
end

function Un_212_monster_walk_3()--���X��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
local flag = 781106
local flagnum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , flag ,flagnum,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				sleep(10)
				end
			end
		end	
		sleep(10)
	end
end