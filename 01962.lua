function bk_133_104093_mfin()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local magic={507099,507100,507101,507102}----------
	local mam=0   
	local m1=DW_Rand(3)-----���
	local m2=DW_Rand(3)-----���
	local m3=DW_Rand(3)-----���
	local m4=DW_Rand(3)-----���
	local magco={1,2,3,4,5,6,7,8,9,10,11,12} -----------���
	local mac=0
	local Temp = Lua_bk_BornByMultilateral( 104093 , 12 , 100 )	--�b�ۤv���W�X8��
	SetModeEx( Temp[1] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[1] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[1] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[1] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[1] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[1] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[1] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[1] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[1] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[1] , RoomID )
	WriteRoleValue( Temp[1] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[1], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[2] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[2] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[2] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[2] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[2] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[2] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[2] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[2] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[2] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[2] , RoomID )
	WriteRoleValue( Temp[2] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[2], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[3] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[3] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[3] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[3] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[3] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[3] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[3] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[3] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[3] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[3] , RoomID )
	WriteRoleValue( Temp[3] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[3], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[4] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[4] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[4] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[4] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[4] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[4] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[4] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[4] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[4] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[4] , RoomID )
	WriteRoleValue( Temp[4] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[4], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[5] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[5] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[5] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[5] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[5] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[5] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[5] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[5] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[5] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[5] , RoomID )
	WriteRoleValue( Temp[5] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[5], EM_RoleValue_Livetime,8)

	
	SetModeEx( Temp[6] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[6] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[6] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[6] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[6] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[6] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[6] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[6] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[6] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[6] , RoomID )
	WriteRoleValue( Temp[6] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[6], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[7] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[7] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[7] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[7] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[7] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[7] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[7] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[7] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[7] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[7] , RoomID )
	WriteRoleValue( Temp[7] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[7], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[8] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[8] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[8] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[8] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[8] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[8] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[8] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[8] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[8] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[8] , RoomID )
	WriteRoleValue( Temp[8] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[8], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[9] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[9] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[9] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[9] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[9] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[9] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[9] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[9] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[9] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[9] , RoomID )
	WriteRoleValue( Temp[9] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[9], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[10] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[10] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[10] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[10] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[10] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[10] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[10] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[10] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[10] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[10] , RoomID )
	WriteRoleValue( Temp[10] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[10], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[11] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[11] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[11] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[11] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[11] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[11] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[11] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[11] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[11] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[11] , RoomID )
	WriteRoleValue( Temp[11] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[11], EM_RoleValue_Livetime,8)
	
	SetModeEx( Temp[12] , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Temp[12] , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Temp[12] , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Temp[12] , EM_SetModeType_Move, false) ---����	
	SetModeEx( Temp[12] , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Temp[12] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Temp[12] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Temp[12] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Temp[12] , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(Temp[12] , RoomID )
	WriteRoleValue( Temp[12] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue(Temp[12], EM_RoleValue_Livetime,8)
	for i =1 ,12 ,1 do 
		local maco=DW_Rand(table.getn(magco))
		say(maco,"xx"..maco)
		mac=mac+1
		if mac==1 then 
		mam=1
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==2 then 
		mam=1
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==3 then 
		mam=1
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		AddBuff(Temp[magco[maco]],507479,1,600)
		elseif mac==4 then 
		mam=2
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==5 then 
		mam=2
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==6 then 
		mam=2
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		AddBuff(Temp[magco[maco]],507480,1,600)
		elseif mac==7 then 
		mam=3
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==8 then 
		mam=3
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==9 then 
		mam=3
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		AddBuff(Temp[magco[maco]],507481,1,600)
		elseif mac==10 then 
		mam=4
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==11 then 
		mam=4
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		elseif mac==12 then 
		mam=4
		AddBuff(Temp[magco[maco]],magic[mam],1,600)
		AddBuff(Temp[magco[maco]],507482,1,600)
		end
		table.remove (magco, maco)
		table.getn (magco)	
	end
end