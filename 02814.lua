function Q6_BOSS_Summon4()
	local Center = OwnerID();

 	SetPlot( Center, "range", "Q6_Check", 100 );
end

function Q6_Check()
	local ply = OwnerID();		-- Ĳ�osetplot���O���a�A�ҥHowner�O���a
	local Center = TargetID();
		
	if ReadRoleValue( Center, EM_RoleValue_Register1 ) == 0 then
		CallPlot( Center, "Q6_initShow", ply, Center );
	end
end

function Q6_initShow( ply, Center )
	SetPlot( Center , "range","",0 );
	
	WriteRoleValue( Center, EM_RoleValue_Register1, 999 );	-- center reg1   �Ψ�lock�@���}�l
	WriteRoleValue( ply, EM_RoleValue_Register2, 0);	-- center reg10 �Ψ�count�����Ǫ��ƶq
	CallPlot( Center, "Q6_Show", ply, Center );
end

function Q6_Show( ply, Center )
	sleep(1);
	
	MoveToFlagEnabled( Center, false ); 	-- ����
	AdjustFaceDir( Center , ply, 0 );		-- ���V���a
	PlayMotion( Center, ruFUSION_ACTORSTATE_HURT_CRITICAL );	--�������~
	NPCSay( Center, "[Z953_Q6_1]" );		-- �O�L�� Q_Q
	Sleep(20);
	
	NPCSay( Center, "[Z953_Q6_2]" );	--�ڴN���O�L�ӤF�ڰڰ�!!! Q_Q
	AdjustFaceDir( Center , ply, 180 );	-- �I�缾�a
	WriteRoleValue( Center , EM_RoleValue_IsWalk, 0 );	-- ��npc�}�l�k«
	MoveToFlagEnabled( Center, true ); 
	Sleep(30);	
	
	local transNPC = Q6_Transformation( ply, Center );	-- npc�ܨ�	
	Sleep(10);
	
 	NPCSay( transNPC, "[Z953_Q6_3]" );		-- �o�N�O�S��ڪ��U��!!!	
 	sleep(5);
 	SetAttack( transNPC, ply ); 
 	
 	local count = 0;

	while count< 10 do
		count = ReadRoleValue( ply, EM_RoleValue_Register2 );
		
		if count == 4 then 
			local roomID = ReadRoleValue( ply, EM_RoleValue_RoomID );
			
	 		NPCSay( transNPC, "[Z953_Q6_4]" );		-- �A�H���o�򰵴N���ΤF��?
	 		Q6_Summon( transNPC, ply,  roomID );	-- �۴��p��
	 		WriteRoleValue( ply, EM_RoleValue_Register2, 5 );	
		end
		
		Sleep(10);
	end
 
 	DebugMsg( ply , ReadRoleValue(ply , EM_RoleValue_RoomID), "misson complete" );
 		
 	sleep(50);
	Q6_ResetPlot( Center );		-- debug���m��	
end

function Q6_Transformation( ply, Center )
	MoveToFlagEnabled( Center, false ); 	--��npc�����U
	SetModeEx( Center , EM_SetModeType_Show , false );	--��npc����
	
		
	local transID = 107550;	-- Q5�]�� newID
	local roomID = ReadRoleValue( Center, EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location(Center);	
	
	local transNPC = CreateObj( transID, x, y, z, dir, 1 );
		
	if ply ~= 0 then	
		--DelFromPartition( Center, roomID );	
		
		WriteRoleValue( transNPC, EM_RoleValue_Register, ply );	-- �Ǫ�reg10�A����ply��ID
		SetPlot( transNPC, "dead", "Q6_BossDead", 0 );		

		AddToPartition( transNPC, roomID );
		AdjustFaceDir( transNPC , ply, 0 );
				
		CallPlot( transNPC, "Q6_Summon", transNPC, ply, roomID );	-- �۴��p��
		
		SetAttack( transNPC, ply );	
		return transNPC; 
	else
		Q6_ResetPlot( Center );
		return nil;
 	end
	return nil;
end


function Q6_Summon( transNPC, ply, roomID )
	local monsterTable = {};
	local monsterID = 107541;	-- new monsterID

	local x,y,z,dir = DW_Location( transNPC );		

	monsterTable[1] = CreateObj( monsterID, (x+50), y, z, dir, 1);		-- ���~�|�X����V �����
	monsterTable[2] = CreateObj( monsterID, (x-50), y, z, dir, 1);		
	monsterTable[3] = CreateObj( monsterID, (x+30), y, (z+30), dir, 1);	
	monsterTable[4] = CreateObj( monsterID, (x-30), y, (z+30), dir, 1);

	for i = 1, #monsterTable  do
		WriteRoleValue( monsterTable[i], EM_RoleValue_Register, ply );	-- �Ǫ�reg�A����ply��ID
		SetPlot( monsterTable[i], "dead", "Q6_MonsterDead", 0 );
		
		AddToPartition( monsterTable[i], roomID );
		AdjustFaceDir( monsterTable[i], ply, 0 );
		SetAttack( monsterTable[i], ply );		
	end	
	return monsterTable;
end

function Q6_ResetPlot( Center )
	Sleep(20);
	
	SetModeEx( Center , EM_SetModeType_Show , true );	--��npc�X�{	
	DebugMsg( Center , ReadRoleValue(Center, EM_RoleValue_RoomID), "reset success" );
	
	WriteRoleValue( Center, EM_RoleValue_Register1, 0 );	--unlock�@��
	
	WriteRoleValue( Center , EM_RoleValue_IsWalk, 1 );	-- ��npc�ܦ^���B	
	MoveToFlagEnabled( Center, true ); 
	
	SetPlot( Center, "range", "Q6_Check", 100 );
end

function Q6_BossDead()
	local ply = ReadRoleValue( OwnerID(), EM_RoleValue_Register );	--Ū��ply��ID
	WriteRoleValue( ply, EM_RoleValue_Register2, 999 );
	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "Boss kill" );
end
function Q6_MonsterDead()	
	local ply = ReadRoleValue( OwnerID(), EM_RoleValue_Register );	--Ū��ply��ID
	local preCount = ReadRoleValue( ply, EM_RoleValue_Register2 );	--Ū�gcount�^ply�W
	WriteRoleValue( ply, EM_RoleValue_Register2, (preCount+1) );
	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "monster kill "..(preCount+1) );
end
