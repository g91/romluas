
function kg_Test( value )
	local Player = TargetID();
	local Obj = OwnerID();
	local Tx = ReadRoleValue( Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Obj, EM_RoleValue_Z );
	local Od = ReadRoleValue( Player, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( Player, EM_RoleValue_X );
	local Oz = ReadRoleValue( Player, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  DebugMsg(0,0,"Dir="..Dir.." ,Od="..Od  );
	DebugMsg( 0,0 ," delta Dir = "..(Dir-Od) );
	local deltaDir = (Dir-Od);
	SetPos( Obj , kg_GetPosRX( Player , nil , 50 , 0 , deltaDir ) );
end

function Lua_test_PEChangeZone( Obj )
	Obj = Obj or OwnerID();
	local ZoneID = ReadRoleValue( Obj , EM_RoleValue_ZoneID );
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID);
	if RoomID>0 then
		ChangeZone( Obj, ZoneID ,0, kg_GetPos(Obj) );
	else
		ChangeZone( Obj, ZoneID ,1,kg_GetPos(Obj) );
	end
	ScriptMessage( Obj,Obj,0,"RoomID="..RoomID , 0 );
end

function kg_Function()
	kg_ShowID()
	local Oid = OwnerID()
	local Tid = TargetID()
	local RoomID = ReadRoleValue( Oid , EM_RoleValue_RoomID );
	--local Bucket = kg_GetPosRX( Oid, 117201 );
	--WriteRoleValue(Bucket , EM_RoleValue_LiveTime , 10 );
	--AddToPartition( Bucket , RoomID );
	--AddBuff(Oid ,506098,0,5)--FadeIn FadeOut
	--AddBuff(Oid ,508422,0,-1)--物免
	--AddBuff(Oid ,508423,0,-1)--魔免
	--AddBuff( Oid ,508488,0,5 )--無敵
	--AddBuff( Oid ,508558,0,-1 )--變身
	--PlayMotion( Oid , ruFUSION_ACTORSTATE_SIT_LOOP )
--[[
	local num = 36
	local start = 0 
	local ObjArray= {}
	local TempArray = {}
	local Dis = 50
	local Min=-15
	local Max=15
	--local NewObj =  kg_GetRangePos( O_id , Ctrl , Dis , 0 , -1)
	--AddToPartition(NewObj,RoomID)
	
	local step = 360/num
	local angle = 0
	local x,y,z
	local T_Obj = kg_GetRangePos( O_id , Ctrl , Dis , step , -1)
	--SetModeEx( T_Obj , EM_SetModeType_Show, FALSE)--隱藏
	AddToPartition(T_Obj,RoomID)
	local old_timer= GetTickCount()
	local current_timer = old_timer
	local delta_Time = current_timer-old_timer
	local timer = 0
	for i=1, 100 do
		current_timer = GetTickCount()
		delta_Time = current_timer-old_timer
		setpos( T_Obj , kg_GetRangePos( O_id , nil , Dis , angle , -1 ) )
		angle=angle+step
		old_timer = current_timer
	end

	while 1 do
		KS_Move( NewObj, 2 , T_Obj)
		if GetDistance( NewObj , T_Obj)<=10 then
			angle=angle+step
			setpos( T_Obj , kg_GetRangePos( O_id , nil , Dis , angle , -1 ) )
		end
		if angle >=1800 then break end
		sleep(1)
	end

	for i=1 , 6 do
		if i==1 then
			TempArray = kg_CreateArcByObj( O_id ,  Ctrl  , 1 , Dis , i , -1 ,(Min+(Max-Min)/2)  )
		else
			TempArray = kg_CreateArcByObj( O_id ,  Ctrl  , 1 , Dis , i , -1 ,Min,Max  )
		end
		kg_insertArray(ObjArray,TempArray)
		Dis = Dis+25
		sleep(1)
	end
]]
end

function Lua_kg_NpcPerform_SetNum( value )--每次產生幾隻 
	Lua_kg_NpcPerform_num=value;
end

function Lua_kg_NpcPerform_SetSleepTime( value )--產生頻率
	Lua_kg_NpcPerform_SleepTime=value;
end

function Lua_kg_NpcPerform_SetMax( value )--物件產生上限
	Lua_kg_NpcPerform_max=value;
end

function Lua_kg_NpcPerform_Del()
	DebugMsg(0,0, "Lua_kg_NpcPerform_Del..");
	if type(Lua_kg_NpcPerfTest_Obj)=="table" then
		for i in pairs(Lua_kg_NpcPerfTest_Obj.Bucket) do
			DelObj( Lua_kg_NpcPerfTest_Obj.Bucket[i] );
		end
		Lua_kg_NpcPerfTest_Obj.Bucket=nil;
		for i in pairs(Lua_kg_NpcPerfTest_Obj) do
			DelObj( Lua_kg_NpcPerfTest_Obj[i]  );
		end
	else
		DebugMsg( 0,0, "Lua_kg_NpcPerfTest_Obj isn't table!!" );
	end
	Lua_kg_NpcPerfTest_Obj={};
end

--[[
Lua_kg_NpcPerform_Test( max , num , SleepTime )	--( 總數量 , 每次產生隻數 , 產生間隔時間 )
產生隨機裝備的NPC  , 參數都不設定則預設為  max = 100 , num =1 , SleepTime =1
gm指令:
/gm ? runplot Lua_kg_NpcPerform_Test		--假如沒設定其他值 , 預設為每次產生一隻,每1/10秒產生一次,物件數量上限為100個
/gm ? pcall Lua_kg_NpcPerform_Test( max )		--max 為產生的物件總數量

/gm ? runplot Lua_kg_NpcPerform_Del			--將所有測試物件刪除
/gm ? pcall Lua_kg_NpcPerform_SetNum( value )	--每次產生幾隻
/gm ? pcall Lua_kg_NpcPerform_SetSleepTime( value )	--產生頻率
/gm ? pcall Lua_kg_NpcPerform_SetMax( value )	--物件產生總數量
]]

function Lua_kg_NpcPerform_Test( max , num , SleepTime  )--( 總數量 , 每次產生隻數 , 產生間隔時間 )
	local Oid = OwnerID();
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID);
	if ReadRoleValue(Oid,EM_RoleValue_IsPlayer)==1 then	--假如Owner是玩家則產生一個中控器
		local Bucket = kg_GetPosRX(Oid,117201);
		--kg_InvisibleObjInit(Bucket);
		AddToPartition( Bucket , RoomID );
		CallPlot( Bucket , "Lua_kg_NpcPerform_Test" , max , num , SleepTime );
	end
	
	if num == nil then
		if Lua_kg_NpcPerform_num~=nil then
			num = Lua_kg_NpcPerform_num;
		else
			num = 1;
		end
	end
	
	if SleepTime == nil then
		if Lua_kg_NpcPerform_SleepTime~=nil then
			SleepTime = Lua_kg_NpcPerform_SleepTime;
		else
			SleepTime = 1;
		end
	end
	if max == nil then
		if Lua_kg_NpcPerform_max~=nil then
			max = Lua_kg_NpcPerform_max;
		else
			max = 100;
		end
	end
	
	--Lua_kg_NpcPerform_Del();
	if Lua_kg_NpcPerfTest_Obj==nil then
		Lua_kg_NpcPerfTest_Obj={};
	end
	if Lua_kg_NpcPerfTest_Obj.Bucket == nil then
		Lua_kg_NpcPerfTest_Obj.Bucket={};
	end
	table.insert( Lua_kg_NpcPerfTest_Obj.Bucket , Oid );
	local BaseEquip = { 	Head = { 225222,225211,225218,225230,225234,225226,225301,225294,226920,226927,226934,
					226941,227060,227067,227074,227081,221761,221768,221775,221782,221789,221796 },
				Shoulder = { 225225,225213,225220,225233,225236,225228,225300,225296,226919,226926,226933,
					226940,227059,227066,227073,227080,221766,221773,221780,221787,221794,221801 },
				Clothes = { 225224,225212,225219,225232,225235,225229,225299,225295,226922,226929,226936,
					226943,227062,227069,227076,227083,221762,221769,221776,221783,221790,221797 },
				Shoes = { 225223,225214,225221,225231,225237,225227,225301,225297,226917,226924,226931,
					226938,227057,227064,227071,227078,221765,221772,221779,221786,221793,221800 },
				Gloves = { 226916,226923,226930,226937,227056,227063,227070,227077,221767,221774,221781,
					221788,221795,221802 },
				Belt = { 226918,226925,226932,226939,227058,227065,227072,227079,221763,221770,221777,
					221784,221791,221798 },
				Pants = { 226921,226928,226935,226942,227061,227068,227075,227082,221764,221771,221778,
					221785,221792,221799 }
			};
	local TempEquip  = {};
	for i , v in pairs(BaseEquip) do
		TempEquip[i]=KS_RegroupArray( v );
	end

	math.randomseed(math.random(100, 99999));
	local  Position =  kg_GetPosTable( Oid );
	local Current_Dis , Angle = 3,0;
	local Obj , randNum = 0,0;
	local EQWearPos = { 	Head =EM_EQWearPos_Head,
				Shoulder = EM_EQWearPos_Shoulder,
				Clothes= EM_EQWearPos_Clothes,
				Shoes=EM_EQWearPos_Shoes,
				Gloves=EM_EQWearPos_Gloves,
				Belt=EM_EQWearPos_Belt,
				Pants=EM_EQWearPos_Pants
				};
	DebugMsg(0,0,"Lua_kg_NpcPerform_Test start");
	local Count = 0;
	for i=1, Max do
		for j = 1 , num do
			Count=Count+1;
			if Count>=Max then
				break
			end
			Obj = kg_GetPosRX( Position , 105709 , Current_Dis , 0 , Angle , -1 );
			AddToPartition( Obj , RoomID );
			table.insert( Lua_kg_NpcPerfTest_Obj , Obj );
			SetRoleEquip( Obj , EM_EQWearPos_MainHand, 210054, 1 );
			--DebugMsg(0,0,"_____________________");
			--DebugMsg(0,0,"Obj = "..Obj );
			for k ,v in pairs(EQWearPos) do
				randNum = math.random( table.getn( TempEquip[k] ) );
				--DebugMsg(0,0,k.."_Num="..TempEquip[k][randNum] );
				SetRoleEquip( Obj , v , TempEquip[k][randNum] , 1 );
				table.remove( TempEquip[k] , randNum );
				if TempEquip[k][1]==nil then
					TempEquip[k]=KS_RegroupArray( BaseEquip[k] );
				end
			end
			
			Angle = Angle+3;
			if Angle>360 then Angle = Angle-360; Current_Dis = Current_Dis+5;  end
		end
		if Count>=Max then
			break
		end
		Sleep(SleepTime);
	end
	DebugMsg(0,0,"Lua_kg_NpcPerform_Test End");
end

function Lua_kg_NpcPerform_CreateByFlag( num , FlagID )--( 旗標ID , 每個旗標所產生的隻數 )
	local Oid = OwnerID();
	FlagID = FlagID or 780768;
	num = num or 80;
	local FlagMax = GetMoveFlagCount( FlagID )-1;
	local Bucket = 0;
	for i = 0 , FlagMax do
		Bucket = kg_GetPosRX( {FlagID,i} ,117201 );
		--kg_InvisibleObjInit(Bucket);
		AddToPartition( Bucket , ReadRoleValue(Oid,EM_RoleValue_RoomID) );
		CallPlot( Bucket , "Lua_kg_NpcPerform_Test",num );
	end
end

function Lua_kg_NpcPerform_Travel( SleepTime , FlagID , Times )
	local Oid = OwnerID();
	local RoomID =ReadRoleValue(Oid,EM_RoleValue_RoomID);
	FlagID = FlagID or 780768;
	SleepTime = SleepTime or 30;
	Times = Times or 100;
	local FlagMax = GetMoveFlagCount( FlagID )-1;
	local Current_Step = 0;
	local Current_Times = 0;
	for i =1,Times do
		setpos( Oid, kg_GetPosRX({FlagID,Current_Step} ) );
		Current_Step =Current_Step+1;
		if Current_Step>FlagMax then Current_Step=0; end
		Sleep(SleepTime);
	end
end

function Lua_kg_NpcPerform_Travel2( Player )
	local Oid = OwnerID();
	setpos( Oid, kg_GetPosRX({780768,0} ) );
	local RoomID =ReadRoleValue(Oid,EM_RoleValue_RoomID);
	if ReadRoleValue(Oid,EM_RoleValue_IsPlayer)==1 then
		local Bucket = kg_GetPosRX( Oid , 117201 );
		--kg_InvisibleObjInit(Bucket);
		WriteRoleValue( Bucket ,EM_RoleValue_LiveTime , ( KS_CheckBuffLV( Oid , 620140 )*10*GetMoveFlagCount( 780768 )+100 ) );
		AddToPartition( Bucket , RoomID );
		CallPlot(Bucket , "Lua_kg_NpcPerform_Travel2" , Oid );
		return
	end
	local FlagID = 780768;
	local SleepTime = KS_CheckBuffLV( Player , 620140 )*10;
	CancelBuff(Player,620140);
	local FlagMax = GetMoveFlagCount( FlagID )-1;
	local ZoneID = ReadRoleValue( Oid, EM_RoleValue_ZoneID );
	for i = 0 , FlagMax do
		Say( Player , "ZoneID="..ZoneID.." ,Step="..i );
		setpos( Player, kg_GetPosRX({FlagID,i} ) );
		Sleep( SleepTime );
	end
	
	if ZoneID == 47 then 
		ZoneID=56;
	else
		ZoneID = ZoneID+1;
		if ZoneID>57 then ZoneID=47; end
	end
	AddBuff( Player , 620140 , (SleepTime/10)-1 , -1 );
	ChangeZone( Player , ZoneID , RoomID , kg_GetPosRX( {FlagID,0} ) );
	DelObj(Oid);
end
