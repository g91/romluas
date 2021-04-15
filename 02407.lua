--動作
function AGaction_162()
	PlayMotion(OwnerID(),162)
end
--動作
function AGaction_attackswaro()--114357
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local loc=aguse02(OwnerID())
	local sw=CreateObj(100039,loc[1]+200,loc[2],loc[3],0,1)
		AddToPartition(sw,RoomID)
		--AddBuff(sw,508488,1,-1)
		Say(OwnerID(),sw)
	while 1 do
		setattack(OwnerID(),sw)
		Sleep(30)
	end
end
--動作
function AGAC_IDLE0()
	PlayMotion(OwnerID(),120)
end
--動作
function AGAC_BUFF_SP02()
	PlayMotion(OwnerID(),162)
end
--動作
function AGAC_BUFF_BEGIN()
	PlayMotion(OwnerID(),81)
end
--動作
function AGAC_CROUCH_BEGIN()
	PlayMotion(OwnerID(),148)
end
--我沒醉
function AGAC_INODRUNK()
	npcsay(OwnerID(),"[SC_117066_1]")
end
--產生火把並隨機移動
function lua_PSS_Q1()
	local Man=OwnerID()
	local CenterX,CenterY,CenterZ =ReadRoleValue(Man, EM_ROLEVALUE_X),ReadRoleValue(Man, EM_ROLEVALUE_Y),ReadRoleValue(Man, EM_ROLEVALUE_Z)
	local dir = ReadRoleValue(Man, EM_RoleValue_Dir)
	local Fire = 0
	local X = 0
	local Z = 0
	local RoomID=ReadRoleValue(Man, EM_RoleValue_RoomID)
	local j=0
	for i = 0,7,1 do
		X = CenterX + 50 * math.cos((45*(i)+dir)*math.pi/180)
		Z = CenterZ -50 * math.sin((45*(i)+dir)*math.pi/180)
		Fire = CreateObj( 100292, X, CenterY, Z, 0, 1 )
		AddToPartition( Fire, RoomID )	
		Sleep(5)
		Say( Fire,"i="..i)
	end
end
--測試消除509809這個buff
function lua_WBGIVETEST()
	local num=Lua_BuffPosSearch( OwnerID(), 509809 )
	local a=BuffInfo( OwnerID(), num ,1)
	local b=BuffInfo( OwnerID(), num ,2)
	DebugMsg(0,0,"num="..num)
	DebugMsg(0,0,"Buffis       ="..a)
	DebugMsg(0,0,"BuffTime="..b)
end
--測試用
--產生4隻怪，並執行一個迴圈，迴圈每2秒掃一次，看怪是否已經死亡。
function AGUSE_00()
--	SetModeEx( OwnerID() , EM_SetModeType_Gravity,false )
--	SetModeEx( OwnerID() , EM_SetModeType_AlignToSurface, false )
--	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_DEAD_WATER)
--	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DEAD_WATER)
--	local x,y,z,dir = DW_Location( OwnerID() )
--	local obj = CreateObj( 120224,x,y,z,dir,1 )
--		AddToPartition(obj,0)
--		DebugMsg(0,0,"obj="..obj)
--		AddBuff( obj,509809,1,-1)
--		Sleep(80)
--		DelObj(obj)
--	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_CRAFTING_LOOP)
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_FLY_LOOP )
--		Sleep(50)
--	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_SP02 )
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj = CreateObj(121670,x,y+50,z,dir,1)
		SetModeEx( obj,EM_SetModeType_Gravity,false )	--重力
		AddToPartition( obj,0 )
		AddBuff(obj,621379,0,-1)
--
end
function AGUSE_01()
--	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--
--	ClsRoomValue			( RoomID , 2 )
--	ruFUSION_MIME_FLY_BEGIN
--	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_FLY_LOOP)
end
--設置死亡劇情，並執行一個迴圈
function Lua_monsterisDead(moster)
	isDead={}
		for i=1,#moster do
			SetPlot( moster[i],"dead","Lua_returndead",0)
			isDead[moster[i]]=false
		end
		while true do
			local a=0
			for obj,value in pairs(isDead) do
				if value==true then a=a+1  end
			end
			if a==4 then break end
			Sleep(20)
		end
	return true
end
--死亡劇情，一死就開true
function Lua_returndead()
	isDead[OwnerID()]=true
	DebugMsg(0,0,"Change OK!")
end

--監控是否中斷表演，或是否已完成表演。
function Lua_Z24searchRangePlayer()
	while true do
		local allPlayer=SearchRangePlayer( OwnerID(),170 )
		local mainPlayer={}
			for i=0,#allPlayer do
				if	CheckID(allplayer[i]) == true and  
					CheckAcceptQuest( allplayer[i], QuestID ) == true and 
					CheckDistance( OwnerID(),allplayer[i],170 ) ~= true and 
					CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
					
					table.insert( mainPlayer, allplayer[i] )
				end

			end
			if #mainPlayer==0 then
				CallPlot( OwnerID(),"" )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_Register1)==0 then
				return
			end
		Sleep(10)
	end
end
--每秒監控怪物是否已經死光
--使用全域變數 Z24_MonsterisDead{}，表演完記得清除。
function Lua_monsterisDead1(moster)
	Z24_MonsterisDead={}	--全域變數，記得清除
	for i=1,#moster do
		SetPlot( moster[i],"dead","Lua_returnWhatDead",0) --怪物身上掛上死亡劇情
		Z24_MonsterisDead[moster[i]]=false
	end
	while true do
		local a=0
		for obj,value in pairs(isDead) do
			if value==true then a=a+1  end
		end
		if a==4 then break end Sleep(20)
	end
	return true
end
--死亡劇情
function Lua_returnWhatDead()
	Z24_MonsterisDead[OwnerID()]=true
end
--刪除所有表演物件
function Lua_Z24delAllObj( deltable )
	for i=1, #deltable do
		if CheckID( deltable[i] ) then
			DelObj( deltable[i] )
		end
	end
end
function lua_SayWheremI() 
	local x,y,z,dir = DW_Location(OwnerID())
	local where =FindMapID( x,y,z )	
	DebugMsg(0,0,"I am IN"..where )
end

--產生一個直線旗
function lua_testCreateFlag_StringLine()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182
	local rang = 45


 	local Inc = 0;
	for i = 0 , 3 , 1 do	
				local tmpY = GetHeight(BaseX-i*40*math.cos(BaseDir*math.pi/180),BaseY,BaseZ+i*40*math.sin(BaseDir*math.pi/180) )
				CreateFlag( flag , Inc  , BaseX-i*40*math.cos(BaseDir*math.pi/180),tmpY,BaseZ+i*40*math.sin(BaseDir*math.pi/180),BaseDir  )		
				Inc = Inc + 1	
		Sleep( 1 )
	end  
	for i = 1 , 1 , 1 do
				local tmpY = GetHeight( BaseX-i*40*math.cos((BaseDir+rang)*math.pi/180),BaseY,BaseZ+i*40*math.sin((BaseDir+rang)*math.pi/180) )
				local tmpX = BaseX-i*40*math.cos((BaseDir+rang)*math.pi/180)	
				local tmpZ = BaseZ+i*40*math.sin((BaseDir+rang)*math.pi/180)
				CreateFlag( flag , Inc  ,tmpX ,tmpY,tmpZ,BaseDir  )		
				Inc = Inc + 1		
				Sleep( 1 )
				for i= 1 ,3,1 do
					local tmpY = GetHeight(tmpX-i*40*math.cos(BaseDir*math.pi/180),tmpY,tmpZ+i*40*math.sin(BaseDir*math.pi/180) )
					CreateFlag( flag , Inc  , tmpX-i*40*math.cos(BaseDir*math.pi/180),tmpY,tmpZ+i*40*math.sin(BaseDir*math.pi/180),BaseDir  )	
					Inc = Inc + 1
					Sleep( 1 )
				end
	end  
	for i = 1 , 1 , 1 do
				local tmpY = GetHeight( BaseX+i*40*math.cos((BaseDir-rang)*math.pi/180),BaseY,BaseZ-i*40*math.sin((BaseDir-rang)*math.pi/180) )
				local tmpX = BaseX-i*40*math.cos((BaseDir-rang)*math.pi/180)	
				local tmpZ = BaseZ+i*40*math.sin((BaseDir-rang)*math.pi/180)
				CreateFlag( flag , Inc  , tmpX,tmpY,tmpZ,BaseDir  )		
				Inc = Inc + 1		
				Sleep( 1 )
				for i= 1 ,3,1 do
					local tmpY = GetHeight(tmpX-i*40*math.cos(BaseDir*math.pi/180),tmpY,tmpZ+i*40*math.sin(BaseDir*math.pi/180) )
					CreateFlag( flag , Inc  , tmpX-i*40*math.cos(BaseDir*math.pi/180),tmpY,tmpZ+i*40*math.sin(BaseDir*math.pi/180),BaseDir  )	
					Inc = Inc + 1
					Sleep( 1 )
				end
	end  
	local tmp={}
	local catch={}
	local towner=0
		for i=0,11 do	table.insert( tmp,i )	end	--塞進table
	local catch=Lua_TableRuleOut( tmp,catch,6 )		--Cm取n的函式
		for i=1,#catch do
			towner=AgProUse_01( flag,catch[i],100354,1,20 )	--100994 119247
			AddToPartition( towner,RoomID )
		end
end

--從一個指定地點產生一次散射的坐標旗子
function lua_AgCreateFlag_3SFlag()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182

 	local Inc = 0;
	for i = 0 , 2 , 1 do	
				local tmpY = GetHeight(BaseX-i*40*math.cos(BaseDir*math.pi/180),BaseY,BaseZ+i*40*math.sin(BaseDir*math.pi/180) )
				CreateFlag( flag , Inc  , BaseX-i*40*math.cos(BaseDir*math.pi/180),tmpY,BaseZ+i*40*math.sin(BaseDir*math.pi/180),BaseDir  )		
				Inc = Inc + 1	
	end  
	for i = 0 , 2 , 1 do
				local tmpY = GetHeight( BaseX-i*40*math.cos((BaseDir+60)*math.pi/180),BaseY,BaseZ+i*40*math.sin((BaseDir+60)*math.pi/180) )			
				CreateFlag( flag , Inc  , BaseX-i*40*math.cos((BaseDir+60)*math.pi/180),tmpY,BaseZ+i*40*math.sin((BaseDir+60)*math.pi/180),(BaseDir+60)  )		
				Inc = Inc + 1		
	end  
	for i = 0 , 2 , 1 do
				local tmpY = GetHeight( BaseX-i*40*math.cos((BaseDir-60)*math.pi/180),BaseY,BaseZ+i*40*math.sin((BaseDir-60)*math.pi/180) )	
				CreateFlag( flag , Inc  , BaseX-i*40*math.cos((BaseDir-60)*math.pi/180),tmpY,BaseZ+i*40*math.sin((BaseDir-60)*math.pi/180),(BaseDir-60)  )		
				Inc = Inc + 1		
	end  
end
--產生二條直線旗
function lua_Produce2StriethFlag()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182
	local rang = 45


 	local Inc = 0;
	for i = 0 , 3 , 1 do	
				local tmpY = GetHeight(BaseX-i*40*math.cos(BaseDir*math.pi/180),BaseY,BaseZ+i*40*math.sin(BaseDir*math.pi/180) )
				CreateFlag( flag , Inc  , BaseX-i*40*math.cos(BaseDir*math.pi/180),tmpY,BaseZ+i*40*math.sin(BaseDir*math.pi/180),BaseDir  )		
				Inc = Inc + 1	
		Sleep( 1 )
	end  
	for i = 1 , 1 , 1 do
				local tmpY = GetHeight( BaseX-i*40*math.cos((BaseDir+rang)*math.pi/180),BaseY,BaseZ+i*40*math.sin((BaseDir+rang)*math.pi/180) )
				local tmpX = BaseX-i*40*math.cos((BaseDir+rang)*math.pi/180)	
				local tmpZ = BaseZ+i*40*math.sin((BaseDir+rang)*math.pi/180)
				CreateFlag( flag , Inc  ,tmpX ,tmpY,tmpZ,BaseDir  )		
				Inc = Inc + 1		
				Sleep( 1 )
				for i= 1 ,3,1 do
					local tmpY = GetHeight(tmpX-i*40*math.cos(BaseDir*math.pi/180),tmpY,tmpZ+i*40*math.sin(BaseDir*math.pi/180) )
					CreateFlag( flag , Inc  , tmpX-i*40*math.cos(BaseDir*math.pi/180),tmpY,tmpZ+i*40*math.sin(BaseDir*math.pi/180),BaseDir  )	
					Inc = Inc + 1
					Sleep( 1 )
				end
	end   
	local tmp={}
	local catch={}
	local towner=0
		for i=0,8 do	table.insert( tmp,i )	end	--塞進table
	local catch=Lua_TableRuleOut( tmp,catch,6 )		--Cm取n的函式
		for i=1,#catch do
			towner=AgProUse_01( flag,catch[i],100354,1,20 )	--100994 119247
			AddToPartition( towner,RoomID )
		end
end

--用來產生一大片旗子

function lua_Z24CrearVar()
	Var_Z24Only_UseForCreatFlag = nil
end

function lua_AGtestACgive()
	local num =GetWorldVar( "Zone2_WorldPE_Crystal")
	DebugMsg(0,0,"now ="..num )
end


--local objTime =72000
--CallPlot( OwnerID(),"lua_AC1P3_ForcChangOD",objTime )

--強制替換階段
function lua_AC1P3_ForcChangOD( k )
	Sleep( k )
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 2 )
end

--高空種怪用
function lua_AGcreatInHigh_1( NewObjID )
	local Obj = OwnerID()
	local ZoneID = ReadRoleValue(Obj,EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	if NewObjID==nil then  NewObjID = 107068 end
	local x,y,z,dir = DW_Location( Obj )
	local monster = CreateObj( NewObjID, x, y+RandRange(220,380) , z, dir, 1 )
		SetModeEx( monster  ,EM_SetModeType_Save , true ) --儲存*
		SetModeEx( monster  ,EM_SetModeType_Gravity , false ) --重力*
	AddToPartition( monster,RoomID )
	SetRandMove( monster,75,300,60 )
	DebugMsg( 0,0,"CreateNewObjSuccess!")
end
--非24 ，z2掉接任務物品420608堅硬的甲殼
function lua_100209_EventOnDead()
	local num =Rand(100)
	DebugMsg(0,0,"num="..num)
	if num<30 then
		if CheckAcceptQuest( TargetID(),420608 )==false
		 and CheckCompleteQuest( TargetID(),420608 )==false then
			GiveBodyItem( TargetID(),201280,1 )
		end
	end
end
function AG_GetHigh(Y)
	local High
	local Obj = OwnerID()
	local ZoneID = ReadRoleValue(Obj,EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	local X = ReadRoleValue(Obj,EM_RoleValue_X)
	local Z = ReadRoleValue(Obj,EM_RoleValue_Z)
	local Dir = ReadRoleValue(Obj,EM_RoleValue_Dir)
	if	Y==nil	then
		High = 200
	else
		High = Y
	end
	local TempY = ReadRoleValue(Obj,EM_RoleValue_Y)+High-30;
	ChangeZone(Obj,ZoneID,RoomID ,X,ReadRoleValue(Obj , EM_RoleValue_Y)+High,Z,Dir)
	local Plane = DW_CreateObjEX("obj",110987,Obj,0);
	SetModeEx(Plane,EM_SetModeType_Gravity,false);
	SetModeEx(Obj,EM_SetModeType_Move,false);
	SetModeEx(Plane,EM_SetModeType_Obstruct,true);
	AddToPartition(Plane,ReadRoleValue(Obj,EM_RoleValue_RoomID));
	MoveToFlagEnabled(Plane, false)
	SetPos( Plane, X, TempY, Z , 0);
	WriteRoleValue(Plane,EM_RoleValue_LiveTime,80);
end
function lua_test_ag11()
	local testtable ={}
		for i = 100,105 do
			table.insert( testtable , i )
		end
		Sleep(30)
		for i = 1 , #testtable do
			Say( OwnerID(),testtable[i] )	
			Sleep(1)
		end
		Sleep(30)
		DebugMsg(0,0,"--remove")
		table.remove( testtable , 104 )
		Sleep(30)
		for i = 1 , #testtable do
			Say( OwnerID(),testtable[i] )	
			Sleep(1)
		end
end

function lua_AGtestKK()
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj = CreateObj ( 107769 , x+100, y+100, z+100, dir ,1 )
		SetModeEx( obj, EM_SetModeType_Gravity, false )--重力
		AddToPartition( obj, 0 )
		Sleep( 30 )
	while TRUE do
		CastSpell( obj, OwnerID(),850320 )
		Sleep(5)
		PlayMotion( obj,ruFUSION_MIME_CAST_SP01 )
		Sleep( 80 )
	end
end


function lua_agtsssssss()
	local tmp =ReadRoleValue( OwnerID(),EM_RoleValue_CampID ) 
	Say(OwnerID(),tmp)
end
