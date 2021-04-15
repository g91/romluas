--Quest 421841
function LuaS_112239_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421841 ) == true and CheckFlag( OwnerID() , 542380 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112239_0]", "LuaS_112239_1", 0 ) 
	end
end

function LuaS_112239_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_Accept_421841" , 0)
end

function LuaQ_Accept_421841()
	DisableQuest( OwnerID() , true )
	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	local m
	local b
	local time
	local check = "YES"
	--儲存怪物ID的陣列
	local GuardList = {}
	local MonsterID = {[1] = 100335 , [2] = 100336 }
	local Obj
	for i = 1 , 12 , 1 do
		GuardList[i] = 0
	end
	local HP
	local Party = LuaFunc_PartyData(TargetID())
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_421841_0]" , 0 ) --箱子中傳出聲音：小心！我聽到一些聲音，那些海盜好像回來了！
	sleep( 50 )
	for i = 0 , 17 , 1  do 
		check = "NO"
		for i = 1 , Party[0] , 1 do
			if  GetDistance( OwnerID(), Party[i] ) < 250 and ReadRoleValue( Party[i] , EM_RoleValue_IsDead) ~= 1 and CheckAcceptQuest(Party[i] , 421841 ) == true then 	
				--檢查玩家是否存活或是離開
				Check = "YES"
			end
		end
		if check == "NO" then
			for i = 1 , Party[0] , 1 do
				if CheckAcceptQuest(Party[i] , 421841 ) == true then
					ScriptMessage( Party[i] ,Party[i] , 1 , "[SC_421841_1]" , 0 ) --任務失敗
				end
			end
			break
		end
		if i == 0 or i == 4 or i == 8 or i == 12 then --產生四波怪物，每波3隻
			for j = 1 , 3 , 1 do
				m = i*3/4 + j
				GuardList[m] = CreateObjByFlag ( MonsterID[Rand(2)+1] , 780285 , j ,1 )
				AddToPartition(GuardList[m] , 0)
--				Yell( GuardList[m] , m , 5 )
				AddBuff( GuardList[m] , 502698 , 70 , -1 )
				WriteRoleValue( GuardList[m] , EM_RoleValue_PID,0)
				WriteRoleValue( GuardList[m] , EM_RoleValue_Register , TargetID() )
				SetPlot( GuardList[m] , "dead" , "LuaFunc_DeadPlay" , 0 )
				BeginPlot( GuardList[m] , "LuaQ_421841_Bond" , 0 )
--				SetAttack( GuardList[m] , TargetID() );
			end
		end
		sleep(50)
	end
	local Herca = {}
	Herca[1] = 0 
	if  Check == "YES" then
		Herca[1] = CreateObjByFlag( 100337 , 780285 , 4 , 1 )
		Herca[2] = CreateObjByFlag( MonsterID[Rand(2)+1]  , 780285 , 1 , 1 )
		Herca[3] = CreateObjByFlag( MonsterID[Rand(2)+1]  , 780285 , 2 , 1 )
		Herca[4] = CreateObjByFlag( MonsterID[Rand(2)+1]  , 780285 , 3 , 1 )
		for i = 1 , 4 , 1 do
			SetModeEx( Herca[i] , EM_SetModeType_Fight , false)
			SetModeEx( Herca[i]  , EM_SetModeType_Searchenemy , false)
			SetModeEx( Herca[i]  , EM_SetModeType_Strikback , false)
			AddToPartition( Herca[i]  , 0 )
		end

	end

	local Roar = "NO"
	for i = 1 , 12 , 1 do
		if CheckID( GuardList[i] ) == true then
			if Roar == "NO" and CheckID(Herca[1]) == true then
				Yell( Herca[1] , "[SC_421841_2]" , 4 ) --沒用的傢伙全部退下！
				Roar = "YES"
			end
			WriteRoleValue( GuardList[i] , EM_RoleValue_PID , 10 )
		end
	end

	if  Check == "YES" then
		sleep( 50 )
		Yell( Herca[1] , "[SC_421841_3]" , 4 ) --這是什麼？我要找的是[101607]！這個愛管閒事的傢伙是誰？
		PlayMotion( Herca[1] , ruFUSION_ACTORSTATE_CAST_INSTANT)
		sleep( 15 )
		AdjustFaceDir(Herca[2] ,Herca[1] , 0 )
		sleep( 5 )
		Yell( Herca[2] , "[SC_421841_4]" , 4 ) --老大，那個[101607]假的，你......
		PlayMotion( Herca[2] , ruFUSION_ACTORSTATE_CAST_INSTANT)
		sleep( 15 )
		AdjustFaceDir(Herca[1] ,Herca[2] , 0 )
		sleep( 5)
		Yell( Herca[1] , "[SC_421841_5]" , 4 ) --閉嘴！
		PlayMotion( Herca[1] , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		sleep( 5 )
		PlayMotion( Herca[2] , ruFUSION_ACTORSTATE_HURT_CRITICAL)
		sleep(15)
		Yell( Herca[1] , "[SC_421841_6]" , 4 ) --我認得那把劍，那是他的劍！他一定躲在某個地方！
		PlayMotion( Herca[1] , ruFUSION_ACTORSTATE_CAST_INSTANT)
		sleep(20)
		AdjustFaceDir(Herca[1] ,OwnerID() ,  0 )
		sleep(10)
		Yell( Herca[1] , "[SC_421841_7]" , 4 ) --不過......這個餌似乎釣不到我要的大魚。
		local Role = Role:new( OwnerID() )
		local Girl = CreateObj ( 112213 , Role:X() , Role:Y() , Role:Z() , Role:Dir() , 1)
		AddBuff( Girl , 502715  , 1 , -1 )
		sleep(20)
		local MIB = CreateObjByFlag( 101607 , 780285 , 0 , 1 )
		WriteRoleValue( MIB , EM_RoleValue_PID , 1 )
		SetFightMode ( MIB , 0, 1, 0 , 0 )
		AddToPartition( MIB , 0 )
		sleep(15)
		CastSpell( Herca[1] , OwnerID() , 492511 )
		Yell( MIB , "[SC_421841_8]" , 5 ) --快！對自己使用相位轉換！ 
		Beginplot( MIB , "LuaQ_421841_Move2" , 0 )
		sleep( 15 )
		CastSpell( OwnerID()  , OwnerID() , 491259)
		AdjustFaceDir(Herca[2] , MIB , 0 )
		AdjustFaceDir(Herca[3] , MIB , 0 )
		sleep( 10 )
		Hide( OwnerID() )
		AddToPartition( Girl  , 0 )
		sleep( 5 )
		Yell( MIB , "[SC_421841_9]" , 5 ) --快走！用傳送術！ 
		AdjustFaceDir(Herca[1] , MIB , 0 )
		sleep( 5 )
		CastSpell( Girl , Girl , 491922 )
		sleep(20)
		DelObj( Girl )
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 421841 ) == true and  GetDistance( OwnerID(), Party[i] ) < 250 then
				SetFlag( Party[i] , 542380 , 1 )
			end
		end
		Yell( Herca[3] , "[SC_421841_10]" , 4 ) --老大，就是他！那把劍就是從他身上搶來的！
		PlayMotion( Herca[3] , ruFUSION_ACTORSTATE_CAST_INSTANT)
		sleep( 10 )
		BeginPlot( MIB , "LuaQ_421841_Over" , 0 )
		Yell( MIB , "[SC_421841_11]" , 4 ) --來啊！追的到我就來追啊！
		sleep( 20 )
		Yell( Herca[1] , "[SC_421841_12]" , 4 ) --很好！我要你把你知道的一切都吐出來！追！
		for i = 1 , 4 , 1 do
			BeginPlot( Herca[i] , "LuaQ_421841_Over" , 0 )
		end
	else
		CastSpell( OwnerID()  , OwnerID() , 491259)
		sleep( 10 )
		Hide( OwnerID() )		
	end 
	for i = 1 , 12 , 1 do
		if CheckID( GuardList[i] ) == true then
--			Yell(  GuardList[i] , i , 5 )
			DelObj( GuardList[i] )
		end
	end			
	Hide( OwnerID() )
	sleep( 300 )
	Show( OwnerID() , 0 )
	SetPlot( OwnerID(),"touch","",0)
	DisableQuest( OwnerID() , false )
end
------------------------------------------
function LuaQ_421841_Bond()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Party = LuaFunc_PartyData(Player)
	local t 
	local Center = TargetID()
	local Tar = Role:new( Center )
	MoveToFlagEnabled( OwnerID() , False )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	if CheckID( Player ) == true and ReadRoleValue( Player ,EM_RoleValue_IsDead ) ~= 1 then
		SetAttack( OwnerID() ,Player )
	end
	while 1 do
		 t = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		if t > 0 or ReadRoleValue(OwnerID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		if  HateListCount( OwnerID() ) == 0 then
			if GetDistance( OwnerID() , Center) > 100 then
				Move( OwnerID() , Tar:X() + (-1)^Rand(2) * (Rand( 25 ) + 25) , Tar:Y() , Tar:Z()+ (-1)^Rand(2) * (Rand( 25 ) + 25))
			else
				for j = 1 , Party[0] , 1 do
					if  GetDistance( Center , Party[j] ) < 250 and ReadRoleValue( Party[j] , EM_RoleValue_IsDead) ~= 1 then 	
						SetAttack( OwnerID() ,Party[j] )
						break
					end
				end
			end
		end
		if GetDistance( OwnerID() , Center ) > 250 then
			EnableNpcAI( OwnerID() , false );
			SetFightMode( OwnerID() , 0 ,1 , 0 , 0 )
			SetStopAttack( OwnerID() )
			LuaFunc_WaitMoveTo( OwnerID() , Tar:X() + (-1)^Rand(2) * (Rand( 25 ) + 25) , Tar:Y() , Tar:Z()+ (-1)^Rand(2) * (Rand( 25 ) + 25))
			SetFightMode( OwnerID() , 1  ,1 , 1 , 1 )
			EnableNpcAI( OwnerID() , true );
		end
		sleep( 10 )
	end
	EnableNpcAI( OwnerID() , false );
	SetStopAttack( OwnerID() )
	SetModeEx( OwnerID()   , EM_SetModeType_Fight , false)
	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy , false)
	SetModeEx( OwnerID()    , EM_SetModeType_Strikback , false)
	BeginPlot( OwnerID()  , "LuaQ_421841_Over" , 0 )
end
function LuaQ_421841_Over()
	MoveToflagEnabled( OwnerID() , False )
	SetFightMode( OwnerID() , 0 , 1 , 0 , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780285 , 0 ,0 )
	sleep(5)
	Delobj( OwnerID() )
end
function Lua_421841_Move()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780285 , PID ,0 )	
end
function LuaQ_421841_Move2()
	MoveToFlagEnabled( OwnerID() , False)
	local Pos ={}
	Pos["X"] = GetMoveFlagValue( 780285 , 4 , EM_RoleValue_X)
	Pos["Y"] = GetMoveFlagValue( 780285 , 4 , EM_RoleValue_Y)
	Pos["Z"] = GetMoveFlagValue( 780285 , 4 , EM_RoleValue_Z)
	Move( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] )
end