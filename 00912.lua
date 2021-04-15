------------------------------------------------
--zone302�ƥ��p�ɾ�
------------------------------------------------
function LuaS_Davis_Clock()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	Davis_DiffHour = 0	--�ŧi�����ܼ�
	Davis_DiffMin = 0
	local Bron = 0
	local Train = 0
	local Train2 = 0
	local Step = "false"
	local StartTime1 = GetDBKeyValue( "TempestHeightTime_01" )	-- ���o LogView ��  Special Event ���w���������F�}�Үɶ�1
	local StartTime2 = GetDBKeyValue( "TempestHeightTime_02" )	-- ���o LogView ��  Special Event ���w���������F�}�Үɶ�2
	Train = CreateObj( 111457, 1266 , 685 , 1106 , 138 , 1 )	--�^Zone6�ǰe�I
	AddToPartition( Train , RoomID )
	SetPlot( Train , "range" , "LuaS_Davis_InstanceOut" , 20 )	--�N���a�Ǧ^Zone6�������F�~

	while true do
		local Hour , Minute = Davis_GetSysTime()	--���o��e�ɶ��]�]�t�ϥδ��ի��O�ק��ɶ��^
		
		if ( Hour == StartTime1 or Hour == StartTime2 ) and ( Minute >= 0 ) and ( Step == "false" ) then
			DelObj( Train2 )
			Bron = LuaFunc_CreateObjByObj ( 111457 , OwnerID() )
			BeginPlot ( Bron , "LuaS_Davis_FireInstance" , 0 )	--�ƥ��}�l�Ұ�
			Hide( Bron )
			Step = "true"
			
		elseif ( Hour ~= StartTime1 ) and ( Hour ~= StartTime2 ) and ( Step == "true" ) then
			sleep( 100 )
			local BB = LuaFunc_CreateObjByObj ( 111457 , Bron )
			BeginPlot( BB , "LuaS_Davis_DelChest" , 0 )	--�R�_�c
			Hide( BB )
			DelObj( Bron )
			Train2 = LuaFunc_CreateObjByObj ( 111457 , OwnerID() )
			BeginPlot ( Train2 , "LuaS_Davis_AllClearInstance" , 0 )	--�M���a
			Step = "false"
		end
		sleep(10)
	end
end

------------------------------------------------
--�ƥ��}�l�Ұ�
------------------------------------------------
function LuaS_Davis_FireInstance()
	local Temp = {}
	local Count = 1
	local BoxCount = 10
	Ver_Zone302_TestTime = {}
	local Pass = false	--�����^�ǭ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--������h��
	Ver_Zone302_TestTime[ RoomID ]=0	--�ŧi���եΪ��Ӽh�����ܼ�
	--�����ƥ��}�l�]�ʪ��ɶ�
	local Original_Hour , Original_Min = Davis_GetSysTime()	--���o��e�ɶ��]�]�t�ϥδ��ի��O�ק��ɶ��^

	local ReportTime = 55	--�n�}�l�s�����y�{
	local Array = {}	--�гy�Ǫ��ì���ID

	local BossTable 	= { 
		100959 , 	--�ƿ���ध�F
		100957 , 	--���}�����F
		100955 , 	--����F
		100961 , 	--�P�K�r�N�����F
		100963 , 	--���e�l�s�����F
		100953 , 	--���Cù���F
		100965 , 	--�V�w���Τ����F
		100969 , 	--�i��n���F
		100967 , 	--�����t�����F
		100971 ,	--�����]�����F
		109241 , 	--�������F
		109243 , 	--���ᤧ�F
		109245 , 	--���S�i���F
		109247 , 	--�j��k�����F
		109249 , 	--��������F
		109251 , 	--�ɫ�s����
		109253 , 	--�i�ᤧ�F
		109255 , 	--�ɤڨU�d���F
		109257 , 	--���w�Ԥ��F
		109259 } 	--���Ƽ������F

	local MonsterTable = { 
		100960 , 	--���P�H�x���F
		100958 , 	--�g�b�j�M�̤��F
		100956 , 	--����T���F
		100962 , 	--�P�K�r�N���F
		100964 , 	--�H���l�s���F
		100954 , 	--�m�l�Ч����F
		100966 , 	--�i�w���Τ��F
		100970 , 	--�����i�h���F
		100968 , 	--��Ĭ���t�H���F
		100972 , 	--���C�h���F
		109242 , 	--���a�F�Ȥ��F
		109244 , 	--�Ԧ��~���F
		109246 , 	--���[���~���F
		109248 , 	--�A���r�蠟�F
		109250 , 	--�j�����ᤧ�F
		109252 , 	--�ɫ���s
		109254 , 	--�g����s���F
		109256 , 	--���������F
		109258 , 	--�r�����F
		109260 } 	--���㥨�~���F
	
	--���Ǫi��
	for i = 1 , table.getn( BossTable ) do
		Array = LuaS_Davis_InstanceMonster( BossTable[ i ] , 18 ,  MonsterTable[ i ] , RoomID )	--�ͩǪ��禡
		while true do
			Pass , ReportTime = LuaS_Davis_InstanceCheck( Array , Original_Hour , Original_Min , ReportTime , RoomID )	--�ˬd�ɶ��O�_�W�L & �Ǫ��O�_�������禡
			if Pass == true then	break
			end
			Sleep(10)
		end
		Sleep(300)
	end

	--�����ʧ@
	while true do
		--�p��w�g�g�L���ɶ�
		local Now_Hour , Now_Min = Davis_GetSysTime()	--���o��e�ɶ��]�]�t�ϥδ��ի��O�ק��ɶ��^
		local Count_Hour = 0
		local Count_Min = 0

		if ( Now_Hour - Original_Hour ) < 0 then	Count_Hour = Now_Hour - Original_Hour + 24
		else														Count_Hour = Now_Hour - Original_Hour
		end

		Count_Min = Now_Min - Original_Min + ( Count_Hour * 60 ) + Ver_Zone302_TestTime[ RoomID ]
		--�ˬd�O�_�i�J�˼�
		if 	Count_Min == ReportTime and
			ReportTime < 60 then
			local Time = ""
			Time = ReplaceString( GetString("SC_111284_9") , "LastTime" , 60 - ReportTime )
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 1 ,  Time )  --�ѤUx����
			end
			ReportTime = ReportTime + 1
		end
		--�p�G�ɶ��W�L�N�R�_�c��H
		if 	Count_Min >= 60 then
			--�R��
			for i = 1 , table.getn( Array ) , 1 do
				DelObj( Array[ i ] )
			end

			--�M���a
			LuaS_Davis_ClearInstance( RoomID )
			break
		end
		Sleep( 10 )
	end
end

------------------------------------------------
--�ͩǪ��禡
------------------------------------------------
function LuaS_Davis_InstanceMonster( BossID , HowMuch ,  MonsterID , RoomID )
	local Array = {}
	local Boss = CreateObjByFlag( BossID , 780193 , 0 , 1 )
	AddToPartition( Boss , RoomID )
	SetPlot( Boss ,"dead" , "LuaS_Davis_Chest" , 0 )	--�Ǫ����`�����_�c
	Array[ 0 ] = Boss
	for i = 1 , HowMuch , 1 do
		local Monster = CreateObjByFlag( MonsterID , 780193 , i , 1 )
		AddToPartition( Monster ,  RoomID )
		SetPlot( Monster ,"dead" , "LuaS_Davis_Chest" , 0 )	--�Ǫ����`�����_�c
		SetRandMove( Monster , 30 ,  20 , 30 )
		Array[ i ] = Monster
	end
	return Array
end

--------------------------------------------------------------
--�ˬd�ɶ��O�_�W�L & �Ǫ��O�_�������禡
--------------------------------------------------------------
function LuaS_Davis_InstanceCheck( Array , Original_Hour , Original_Min , ReportTime , RoomID )
	--�p��w�g�g�L���ɶ�
	local Now_Hour , Now_Min = Davis_GetSysTime()	--���o��e�ɶ��]�]�t�ϥδ��ի��O�ק��ɶ��^
	local Count_Hour = 0
	local Count_Min = 0
	
	if Now_Hour >= 24 then	Now_Hour = Now_Hour - 24
	end
	if Now_Min >= 60 then	Now_Min = Now_Min - 60
	end
	if ( Now_Hour - Original_Hour ) < 0 then	Count_Hour = Now_Hour - Original_Hour + 24
	else														Count_Hour = Now_Hour - Original_Hour
	end

	Count_Min = Now_Min - Original_Min + ( Count_Hour * 60 ) + Ver_Zone302_TestTime[ RoomID ]
	--�ˬd�O�_�i�J�˼�
	if 	Count_Min == ReportTime and ReportTime < 60 then
		local Time = ""
		Time = "[SC_111284_9][$SETVAR1=" .. 60 - ReportTime .. "]"
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 1 ,  Time )  --�ѤUx����
		end
		ReportTime = ReportTime + 1
	end
	--�ˬd�O���O�n�����ƥ��B�R�ǡB�𪱮a
	if 	Count_Min >= 60 then
		for i = 0 , table.getn( Array ) do
			if 	CheckID( Array[ i ] ) and
				ReadRoleValue( Array[ i ] , EM_RoleValue_RoomID ) == RoomID then
				DelObj( Array[ i ] )
			end
		end	
		LuaS_Davis_ClearInstance( RoomID )
		local Pass = false
		return Pass , ReportTime
	end
	--�ŧi�ͦs���ܼ�
	local Survivor = 0
	--�ˬd�ѴX���Ǫ�
	for i = 0 , table.getn( Array ) do
		if 	CheckID( Array[ i ] ) and
			ReadRoleValue( Array[ i ] , EM_RoleValue_RoomID ) == RoomID and
			ReadRoleValue( Array[ i ] , EM_RoleValue_IsDead ) == 0 then
			Survivor = Survivor + 1
		end
	end
	--�Ǫ��O���O�����F�H
	if Survivor == 0 then
		local Pass = true
		return Pass , ReportTime
	else
		local Pass = false
		return Pass , ReportTime
	end
end

------------------------------------------------
--�Ǫ����`�����_�c
------------------------------------------------
function LuaS_Davis_Chest()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local BossTable 	= { 
		100959 , 	--�ƿ���ध�F
		100957 , 	--���}�����F
		100955 , 	--����F
		100961 , 	--�P�K�r�N�����F
		100963 , 	--���e�l�s�����F
		100953 , 	--���Cù���F
		100965 , 	--�V�w���Τ����F
		100969 , 	--�i��n���F
		100967 , 	--�����t�����F
		100971 ,	--�����]�����F
		109241 , 	--�������F
		109243 , 	--���ᤧ�F
		109245 , 	--���S�i���F
		109247 , 	--�j��k�����F
		109249 , 	--��������F
		109251 , 	--�ɫ�s����
		109253 , 	--�i�ᤧ�F
		109255 , 	--�ɤڨU�d���F
		109257 , 	--���w�Ԥ��F
		109259 } 	--���Ƽ������F

	local MonsterTable = { 
		100960 , 	--���P�H�x���F
		100958 , 	--�g�b�j�M�̤��F
		100956 , 	--����T���F
		100962 , 	--�P�K�r�N���F
		100964 , 	--�H���l�s���F
		100954 , 	--�m�l�Ч����F
		100966 , 	--�i�w���Τ��F
		100970 , 	--�����i�h���F
		100968 , 	--��Ĭ���t�H���F
		100972 , 	--���C�h���F
		109242 , 	--���a�F�Ȥ��F
		109244 , 	--�Ԧ��~���F
		109246 , 	--���[���~���F
		109248 , 	--�A���r�蠟�F
		109250 , 	--�j�����ᤧ�F
		109252 , 	--�ɫ���s
		109254 , 	--�g����s���F
		109256 , 	--���������F
		109258 , 	--�r�����F
		109260 } 	--���㥨�~���F
		
	local ChestID 	= { 
		101302 , 101303 , 101304 , 101305 , 101306 , 101307 , 101308 , 101309 , 101310 , 101311 ,	--NPC�G�j���_�c I ~ X
		109261 , 109262 , 109263 , 109264 , 109265 , 109266 , 109267 , 109268 , 109269 , 109270 } 	--NPC�G�j���_�c XI ~ XX
	local ChestID2 = { 
		101312 , 101313 , 101314 , 101315 , 101316 , 101317 , 101318 , 101319 , 101320 , 101321 ,	--NPC�G�����_�c I ~ X
		109271 , 109272 , 109273 , 109274 , 109275 , 109276 , 109277 , 109278 , 109279 , 109280 } 	--NPC�G�����_�c XI ~ XX
	local ChestN = { 4 , 4 , 8 , 8 , 12 , 12 , 16 , 16 , 20 , 20 , 24 , 24 , 28 , 28 , 32 , 32 , 36 , 36 , 40 , 40 }	--�_�c�ƶq
	local LiveTime = { 60 , 60 , 60 , 60 , 60 , 60 , 60 , 60 , 120 , 120 , 120 , 120 , 120 , 120 , 120 , 120 , 180 , 180 , 180 , 180 }	--�ͦs�ɶ�

	local Step = 1
	for i = 1 , table.getn( BossTable ) do
		if MonsterID == BossTable[ i ] or MonsterID == MonsterTable[ i ]  then	Step = i
		end
	end
	
	local Chest = Lua_Davis_BornByMultilateral2( ChestID[ Step ] , ChestID2[ Step ] , ChestN[ Step ] , 30 , 0 )	--�b�P��dis ��MonsterID �� X ����
	for i = 1 , table.getn( Chest ) , 1 do
		BeginPlot( Chest[ i ] , "LuaS_Davis_InstanceChest" , 0 )
		CallPlot( Chest[ i ] , "Lua_ObjLifeTime" , LiveTime[ Step ] )
		DebugMsg( 0 , RoomID , "i= " .. i .. " LiveTime = " .. LiveTime[ Step ] )
	end
	return Chest
end

------------------------------------------------
--�_�c����l�@��
------------------------------------------------
function LuaS_Davis_InstanceChest()
	SetCursorType( OwnerID() ,eCursor_Locked )
	SetPlot( OwnerID() , "touch" , "LuaS_Davis_KillChest" , 40 )
end

------------------------------------------------
--�_�c��Ĳ�I�@��
------------------------------------------------
function LuaS_Davis_KillChest()
	SetPlot( TargetID() , "touch" , "" , 0 )
	local ChestID = { 
		101302 , 101303 , 101304 , 101305 , 101306 , 101307 , 101308 , 101309 , 101310 , 101311 , 	--NPC�G�j���_�c I ~ X
		109261 , 109262 , 109263 , 109264 , 109265 , 109266 , 109267 , 109268 , 109269 , 109270 , 	--NPC�G�j���_�c XI ~ XX
		101312 , 101313 , 101314 , 101315 , 101316 , 101317 , 101318 , 101319 , 101320 , 101321 , 	--NPC�G�����_�c I ~ X
		109271 , 109272 , 109273 , 109274 , 109275 , 109276 , 109277 , 109278 , 109279 , 109280 } 	--NPC�G�����_�c XI ~ XX
	local GiveItem = { 
		203246 , 203247 , 203248 , 203249 , 203250 , 203251 , 203252 , 203253 , 203254 , 203255 , 	--���~�G�j���_�c I ~ X
		208351 , 208352 , 208353 , 208354 , 208355 , 208356 , 208357 , 208358 , 208359 , 208360 , 	--���~�G�j���_�c XI ~ XX
		203256 , 203257 , 203258 , 203259 , 203260 , 203261 , 203262 , 203263 , 203264 , 203265 , 	--���~�G�����_�c I ~ X
		208361 , 208362 , 208363 , 208364 , 208365 , 208366 , 208367 , 208368 , 208369 , 208370 } 	--���~�G�����_�c XI ~ XX
	local NM 
	for i = 1, table.getn( ChestID ) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == ChestID[ i ] then
			NM = i
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

	if BeginCastBar( OwnerID() , "[SC_KILL_CHEST]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		while 1 do
			sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then
				if ( CastBarStatus > 0 ) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				end
			end
		end
		if ( result == "OKOK" ) then
			GiveBodyItem ( OwnerID() , GiveItem[ NM ] , 1 )
			DelObj( TargetID() )
		elseif ( result == "DAME" ) then
			SetPlot( TargetID() , "touch" , "LuaS_Davis_KillChest" , 40 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end

------------------------------------------------
--�M���a�禡
------------------------------------------------
function LuaS_Davis_ClearInstance( RoomID )
	local Obj
	local Count = SetSearchAllPlayer( RoomID )
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				BeginPlot(  ID , "LuaS_Davis_InstanceOut" , 0 )
			end
		end	
	end
end

------------------------------------------------
--�M���a
------------------------------------------------
function LuaS_Davis_AllClearInstance()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	While 1 do
		local Obj
		local Count = SetSearchAllPlayer(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				local Class = ReadRoleValue( ID , EM_RoleValue_VOC )
				if Obj:IsPlayer() == true and Class ~= 0 then
					BeginPlot(  ID , "LuaS_Davis_InstanceOut" , 0 )
				end
			end	
		end
		Sleep(50)
	end
end

------------------------------------------------
--�R�_�c
------------------------------------------------
function LuaS_Davis_DelChest()
	local ChestID = { 
		101302 , 101303 , 101304 , 101305 , 101306 , 101307 , 101308 , 101309 , 101310 , 101311 , 	--NPC�G�j���_�c I ~ X
		109261 , 109262 , 109263 , 109264 , 109265 , 109266 , 109267 , 109268 , 109269 , 109270 , 	--NPC�G�j���_�c XI ~ XX
		101312 , 101313 , 101314 , 101315 , 101316 , 101317 , 101318 , 101319 , 101320 , 101321 , 	--NPC�G�����_�c I ~ X
		109271 , 109272 , 109273 , 109274 , 109275 , 109276 , 109277 , 109278 , 109279 , 109280 } 	--NPC�G�����_�c XI ~ XX
	Lua_DavisDelObj( ChestID );
	DelObj(OwnerID())
end

------------------------------------------------
--�N���a�Ǧ^Zone6�������F�~
------------------------------------------------
function LuaS_Davis_InstanceOut()
	ChangeZone( OwnerID() , 6 , 0 , -23794 , -168 , 1419 , 107 )
end