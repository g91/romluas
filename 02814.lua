function Q6_BOSS_Summon4()
	local Center = OwnerID();

 	SetPlot( Center, "range", "Q6_Check", 100 );
end

function Q6_Check()
	local ply = OwnerID();		-- 觸發setplot的是玩家，所以owner是玩家
	local Center = TargetID();
		
	if ReadRoleValue( Center, EM_RoleValue_Register1 ) == 0 then
		CallPlot( Center, "Q6_initShow", ply, Center );
	end
end

function Q6_initShow( ply, Center )
	SetPlot( Center , "range","",0 );
	
	WriteRoleValue( Center, EM_RoleValue_Register1, 999 );	-- center reg1   用來lock劇情開始
	WriteRoleValue( ply, EM_RoleValue_Register2, 0);	-- center reg10 用來count擊殺怪物數量
	CallPlot( Center, "Q6_Show", ply, Center );
end

function Q6_Show( ply, Center )
	sleep(1);
	
	MoveToFlagEnabled( Center, false ); 	-- 先停
	AdjustFaceDir( Center , ply, 0 );		-- 面向玩家
	PlayMotion( Center, ruFUSION_ACTORSTATE_HURT_CRITICAL );	--受到驚嚇
	NPCSay( Center, "[Z953_Q6_1]" );		-- 別過來 Q_Q
	Sleep(20);
	
	NPCSay( Center, "[Z953_Q6_2]" );	--我就說別過來了啊啊啊!!! Q_Q
	AdjustFaceDir( Center , ply, 180 );	-- 背對玩家
	WriteRoleValue( Center , EM_RoleValue_IsWalk, 0 );	-- 讓npc開始逃竄
	MoveToFlagEnabled( Center, true ); 
	Sleep(30);	
	
	local transNPC = Q6_Transformation( ply, Center );	-- npc變身	
	Sleep(10);
	
 	NPCSay( transNPC, "[Z953_Q6_3]" );		-- 這就是惹怒我的下場!!!	
 	sleep(5);
 	SetAttack( transNPC, ply ); 
 	
 	local count = 0;

	while count< 10 do
		count = ReadRoleValue( ply, EM_RoleValue_Register2 );
		
		if count == 4 then 
			local roomID = ReadRoleValue( ply, EM_RoleValue_RoomID );
			
	 		NPCSay( transNPC, "[Z953_Q6_4]" );		-- 你以為這麼做就有用了嗎?
	 		Q6_Summon( transNPC, ply,  roomID );	-- 招換小怪
	 		WriteRoleValue( ply, EM_RoleValue_Register2, 5 );	
		end
		
		Sleep(10);
	end
 
 	DebugMsg( ply , ReadRoleValue(ply , EM_RoleValue_RoomID), "misson complete" );
 		
 	sleep(50);
	Q6_ResetPlot( Center );		-- debug重置用	
end

function Q6_Transformation( ply, Center )
	MoveToFlagEnabled( Center, false ); 	--讓npc先停下
	SetModeEx( Center , EM_SetModeType_Show , false );	--讓npc隱藏
	
		
	local transID = 107550;	-- Q5魔王 newID
	local roomID = ReadRoleValue( Center, EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location(Center);	
	
	local transNPC = CreateObj( transID, x, y, z, dir, 1 );
		
	if ply ~= 0 then	
		--DelFromPartition( Center, roomID );	
		
		WriteRoleValue( transNPC, EM_RoleValue_Register, ply );	-- 怪物reg10，紀錄ply的ID
		SetPlot( transNPC, "dead", "Q6_BossDead", 0 );		

		AddToPartition( transNPC, roomID );
		AdjustFaceDir( transNPC , ply, 0 );
				
		CallPlot( transNPC, "Q6_Summon", transNPC, ply, roomID );	-- 招換小怪
		
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

	monsterTable[1] = CreateObj( monsterID, (x+50), y, z, dir, 1);		-- 怪獸會出錯方向 之後改
	monsterTable[2] = CreateObj( monsterID, (x-50), y, z, dir, 1);		
	monsterTable[3] = CreateObj( monsterID, (x+30), y, (z+30), dir, 1);	
	monsterTable[4] = CreateObj( monsterID, (x-30), y, (z+30), dir, 1);

	for i = 1, #monsterTable  do
		WriteRoleValue( monsterTable[i], EM_RoleValue_Register, ply );	-- 怪物reg，紀錄ply的ID
		SetPlot( monsterTable[i], "dead", "Q6_MonsterDead", 0 );
		
		AddToPartition( monsterTable[i], roomID );
		AdjustFaceDir( monsterTable[i], ply, 0 );
		SetAttack( monsterTable[i], ply );		
	end	
	return monsterTable;
end

function Q6_ResetPlot( Center )
	Sleep(20);
	
	SetModeEx( Center , EM_SetModeType_Show , true );	--讓npc出現	
	DebugMsg( Center , ReadRoleValue(Center, EM_RoleValue_RoomID), "reset success" );
	
	WriteRoleValue( Center, EM_RoleValue_Register1, 0 );	--unlock劇情
	
	WriteRoleValue( Center , EM_RoleValue_IsWalk, 1 );	-- 讓npc變回散步	
	MoveToFlagEnabled( Center, true ); 
	
	SetPlot( Center, "range", "Q6_Check", 100 );
end

function Q6_BossDead()
	local ply = ReadRoleValue( OwnerID(), EM_RoleValue_Register );	--讀取ply的ID
	WriteRoleValue( ply, EM_RoleValue_Register2, 999 );
	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "Boss kill" );
end
function Q6_MonsterDead()	
	local ply = ReadRoleValue( OwnerID(), EM_RoleValue_Register );	--讀取ply的ID
	local preCount = ReadRoleValue( ply, EM_RoleValue_Register2 );	--讀寫count回ply上
	WriteRoleValue( ply, EM_RoleValue_Register2, (preCount+1) );
	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "monster kill "..(preCount+1) );
end
