--���ͨk�ʰѥ[��
function lua_mika_dancefes_dancerborn1() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC1��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn101a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC1��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn101b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC1��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn101c", 10) 
	end
end

function lua_mika_dancefes_dancerborn2() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC2��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn102a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC2��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn102b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC2��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn102c", 10) 
	end
end

function lua_mika_dancefes_dancerborn3() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC3��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn103a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC3��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn103b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC3��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn103c", 10) 
	end
end

function lua_mika_dancefes_dancerborn4()
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC4��m1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn104a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC4��m2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn104b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC4��m3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn104c", 10) 
	end 
end

--�k01---
function Lua_mika_dancefes_manborn101a() --�k�ͲĤ@�� 01 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114713, 780320,1 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn101b() --�k�ͲĤ@�� 01 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114713, 780320,2 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn101c() --�k�ͲĤ@�� 01 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114713, 780320,3 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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
function Lua_mika_dancefes_manborn102a() --�k�ͲĤ@�� 02 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114714, 780320,4 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn102b() --�k�ͲĤ@�� 02 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114714, 780320,5 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn102c() --�k�ͲĤ@�� 02 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114714, 780320,6 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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
function Lua_mika_dancefes_manborn103a() --�k�ͲĤ@�� 03 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114715, 780320,7 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn103b() --�k�ͲĤ@�� 03 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114715, 780320,8 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn103c() --�k�ͲĤ@�� 03 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114715, 780320,9 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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
function Lua_mika_dancefes_manborn104a() --�k�ͲĤ@�� 04 ��ma
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114716, 780320,10 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn104b() --�k�ͲĤ@�� 04 ��mb
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114716, 780320,11 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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

function Lua_mika_dancefes_manborn104c() --�k�ͲĤ@�� 04 ��mc
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114716, 780320,12 ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
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