--���ͤk�ʰѥ[��
function lua_mika_dancefes_dancerborn5() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC1��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn101a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC1��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn101b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC1��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn101c", 10) 
	end
end

function lua_mika_dancefes_dancerborn6() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC2��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn102a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC2��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn102b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC2��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn102c", 10) 
	end
end

function lua_mika_dancefes_dancerborn7() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC3��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn103a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC3��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn103b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC3��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn103c", 10) 
	end
end

function lua_mika_dancefes_dancerborn8()
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC4��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn104a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC4��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn104b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC4��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn104c", 10) 
	end 
end

--�k01---
function Lua_mika_dancefes_girlborn101a() --�k�ͲĤ@�� 01 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114709, 780320,31 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn101b() --�k�ͲĤ@�� 01 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114709, 780320,32 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn101c() --�k�ͲĤ@�� 01 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114709, 780320,33 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

--�k02---
function Lua_mika_dancefes_girlborn102a() --�k�ͲĤ@�� 02 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114710, 780320,34 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn102b() --�k�ͲĤ@�� 02 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114710, 780320,35 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn102c() --�k�ͲĤ@�� 02 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114710, 780320,36 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

--�k03---
function Lua_mika_dancefes_girlborn103a() --�k�ͲĤ@�� 03 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114711, 780320,37 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn103b() --�k�ͲĤ@�� 03 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114711, 780320,38 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn103c() --�k�ͲĤ@�� 03 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114711, 780320,39 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

--�k04---
function Lua_mika_dancefes_girlborn104a() --�k�ͲĤ@�� 04 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114712, 780320,40 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn104b() --�k�ͲĤ@�� 04 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114712, 780320,41 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn104c() --�k�ͲĤ@�� 04 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114712, 780320,42 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--����
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( cust    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( cust    , EM_SetModeType_Move, true )--����
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( cust    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( cust , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( cust,RoomID )	--�����󲣥�
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end