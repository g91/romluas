function Q7_RoadOfHeaven()

end

function Q7_CheckPoint1()
	local chkP1 = OwnerID();	--center	

 	SetPlot( chkP1, "range", "Q7_checkStartPoint", 30 );
end

function Q7_CheckPoint2()
	local chkP2 = OwnerID();
	
 	SetPlot( chkP2, "range", "Q7_checkMidPoint", 30 );
end

function  Q7_checkStartPoint()
	local ply = OwnerID();
	local chkP1 =TargetID();
	local chk1Buff = 623977;

	if CheckBuff( ply, chk1Buff ) == false then
		AddBuff( ply, chk1Buff, 0, 60 );	-- gameTime = 60
		CallPlot( chkP1, "Q7_initGame1", ply, chkP1 );	
	end
end

function  Q7_checkMidPoint()
	local ply = OwnerID();
	local chkP2 =TargetID();
	local chk1Buff = 623977;
	local chk2Buff = 623978;
	
	if CheckBuff( ply, chk1Buff ) == true and CheckBuff( ply, chk2Buff ) == false then
		AddBuff( ply, chk2Buff, 0, -1 );
		CallPlot( chkP2, "Q7_initGame2", ply, chkP2 );	
	end
end

function Q7_initGame1( ply, center )	
	local plateID = 107564; 
	local flagID = 781255;	
	local randPID = rand(4);	-- 0~3

	local x,y,z,dir = DW_Location( flagID, randPID );
	local roomID = ReadRoleValue( center, EM_RoleValue_RoomID );	
		
	local plate = CreateObj( plateID, x, y, z, dir, roomID );	

	SetModeEx( plate, EM_SetModeType_Mark, false );		-- 無法點擊
	SetModeEx( plate, EM_SetModeType_IgnoreNpcKill, true );	-- 不被殺死
	SetModeEx( plate, EM_SetModeType_Obstruct, true ); 		-- 會撞人	

	WriteRoleValue( plate, EM_RoleValue_Register10, randPID );	--用來記住圓盤創造的旗標位置
	AddToPartition( plate, roomID );
	AddBuff( plate, 623979, 0, 60 );	

	SetPlot( plate, "collision", "Q7_castAOE", 1);
	CallPlot( center, "Q7_runGame1", ply, center, plate );
end

function Q7_runGame1( ply, center, plate )
	local chk1Buff = 623977;	
	local chk2Buff = 623978;
		
	if CheckBuff( ply, chk1Buff ) == false or CheckBuff( ply, chk2Buff ) == true then
		Q7_resetGame1( ply, center, plate );
	elseif Q7_runPlate( plate ) == true then	-- 如果圓盤到達旗標，則繼續移動
		Q7_runGame1( ply, center, plate );		
	end
end

function Q7_runPlate( plate )
	local flagID = 781255;	
	local PIDTable = {0,1,2,3};
	local nowPID = ReadRoleValue( plate, EM_RoleValue_Register10 );
	local nextPID  = Q7_getRandDataIgnoreOne( PIDTable, nowPID );

	WriteRoleValue( plate, EM_RoleValue_Register10, nextPID );
	
	return LuaFunc_MoveToFlag( plate, flagID, nextPID, 0 );	-- obj, tarFlag, flagPID, randomRange
end

function Q7_castAOE()
	local ply = OwnerID();	
	local plate = TargetID();	
	SysCastSpellLv( plate, ply, 850585, 0 );
end

function Q7_resetGame1( ply, center, plate )		
	DelObj( plate );	
 	SetPlot( center, "range", "Q7_checkStartPoint", 30 );		
end

function Q7_initGame2( ply, center )
	local flagID = 781255;	
	local roomID = ReadRoleValue( ply, EM_RoleValue_RoomID );	
		
	local boxID = 107565;		
	local boxTable = {};
	
	for i = 1, 4 do
		boxTable[i] = CreateObjByFlag( boxID, flagID, (i+3), 1 );
		AddToPartition( boxTable[i], roomID );
	end
	
	local mob1Box = boxTable[ rand( #boxTable ) + 1 ] ;
	local mob2Box = Q7_getRandDataIgnoreOne( boxTable, mob1Box );

	WriteRoleValue( center, EM_RoleValue_Register1, 0 );	 -- mob1 GUID 紀錄處
	WriteRoleValue( center, EM_RoleValue_Register2, 0 );	 -- mob2 GUID 紀錄處
	WriteRoleValue( center, EM_RoleValue_Register10, 111 );	--判斷是否已產生第一隻怪物用
	WriteRoleValue( ply, EM_RoleValue_Register, center );	--紀錄劇情2，center的ID	
	WriteRoleValue( ply, EM_RoleValue_Register2, 0 );		--紀錄殺死怪物數量
	
			
	setplot( mob1Box, "range", "Q7_createMobEvent", 60 );
	setplot( mob2Box, "range", "Q7_createMobEvent", 60 );
	
--	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "mob1Idx "..mob1Box );
--	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "mob2Idx "..mob2Box );		
	CallPlot( center, "Q7_runGame2", ply, center, boxTable );	
end

function Q7_runGame2( ply, center, boxTable )
	local chk1Buff = 623977;
	local killCount = ReadRoleValue( ply, EM_RoleValue_Register2 );
	
	while CheckBuff( ply, chk1Buff ) == true do
		killCount = ReadRoleValue( ply, EM_RoleValue_Register2 );
		if killCount == 2 then
			DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "mission complete!!!" );
			break;			
		end
		Sleep(10);
	end
	
	if killCount ~= 2 then 
		DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "mission fail~" );
	end
	Q7_resetGame2( ply, center, boxTable );
end

function Q7_peaceEvent()
	local box = TargetID();
	
	SetModeEx( box, EM_SetModeType_Show, false );
end

function Q7_createMobEvent()
	local ply = OwnerID();
	local box = TargetID();
	
	setplot( box, "range", 0, 0 );
		
	local center = ReadRoleValue( ply, EM_RoleValue_Register );
	local killCount = WriteRoleValue( ply, EM_RoleValue_Register2, 0 );
			
	local x,y,z,dir = DW_Location( box );	
	local roomID = ReadRoleValue( ply, EM_RoleValue_RoomID );
	local isCreateFirstMob = ReadRoleValue( center, EM_RoleValue_Register10 );
	
	local mob1ID = 107559;	
	local mob2ID = 107561;
	
	local mob;
	
	if isCreateFirstMob == 111 then
		WriteRoleValue( center, EM_RoleValue_Register10, 222 );	-- 判斷已招喚過第一隻怪
		
		mob = CreateObj( mob1ID, x, y, z, dir,  roomID );
		WriteRoleValue( center, EM_RoleValue_Register1, mob );	-- 紀錄GUID刪除用
	elseif isCreateFirstMob == 222 then
		mob = 	CreateObj( mob2ID, x, y, z, dir,  roomID );	
		WriteRoleValue( center, EM_RoleValue_Register2, mob );	-- 紀錄GUID刪除用	
	end

	SetModeEx( box, EM_SetModeType_Show, false );
	
	SetPlot( mob, "dead", "Q7_mobDeadEvent", 0);
	
	AddToPartition( mob, roomID );
	SetAttack( mob, ply );
end

function Q7_mobDeadEvent()
	local ply = TargetID();
	local mob = OwnerID();
	
	local killCount = ReadRoleValue( ply, EM_RoleValue_Register2 );
	WriteRoleValue( ply, EM_RoleValue_Register2, (killCount + 1) );	
	
	DebugMsg( ply , ReadRoleValue(ply, EM_RoleValue_RoomID), "monster kill "..(killCount+1) );
end

function Q7_resetGame2( ply, center, boxTable )	
	local mob1 = ReadRoleValue( center, EM_RoleValue_Register1 );	-- 讀取GUID刪除用
	local mob2 = ReadRoleValue( center, EM_RoleValue_Register2 );	-- 讀取GUID刪除用
	
	for k, v in pairs ( boxTable ) do
		DelObj( v );	
	end
	
	if mob1 ~= 0 then DelFromPartition( mob1 ); DelObj( mob1 ); end
	if mob2 ~= 0 then DelFromPartition( mob2 ); DelObj( mob2 ); end
	
	WriteRoleValue( center, EM_RoleValue_Register1, 0 );	 -- mob1 GUID 重置
	WriteRoleValue( center, EM_RoleValue_Register2, 0 );	 -- mob2 GUID 重置
	WriteRoleValue( ply, EM_RoleValue_Register2, 0 );	 -- killcount 重置
	SetPlot( center, "range", "Q7_checkMidPoint", 30 );
end

function Q7_getRandDataIgnoreOne( ValueTable,  IgnoreValue )	-- 不做鏡像table
	local IgnoreKey;

	for k, v in pairs( ValueTable ) do
		if v == IgnoreValue then
			IgnoreKey = k;
			break;
		end
	end

	table.remove( ValueTable, IgnoreKey );
	local randIdx = rand(#ValueTable) + 1 ;	
	local randValue = ValueTable[ randIdx ];
	
	table.insert( ValueTable, IgnoreKey, IgnoreValue );
	 
	return randValue;
end


