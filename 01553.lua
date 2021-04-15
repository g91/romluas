----戴洛斯對話
function LuaS_113503()
--	if CheckCompleteQuest( OwnerID() , 422710 ) == false then
		LoadQuestOption( OwnerID() )
--	else
--		SetSpeakDetail(OwnerID(),"[SC_113503_TIME_ERROR]") 
--	end
	if CheckAcceptQuest( OwnerID() ,422708 ) == true and CheckFlag(OwnerID(),543338) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113503_1]","LuaS_113503_1",0) --這裡有可利用的地形嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113503_2]","LuaS_113503_1",0) --何不試試從運輸線偷渡進去？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113503_3]","LuaS_113503_1",0) --你有什麼計畫？[113503]......
	end
end

function LuaS_113503_1()

	SetSpeakDetail(OwnerID(),"[SC_113503_4]") --這裡到處是岩牆山壁，雖然讓蛇人的堡壘變得更無堅不摧......
	SetFlag(OwnerID() , 543338 , 1 )
end

-----血沸哨站之不怕死偵察

function LuaS_422709()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422709 ) == true and CheckFlag(OwnerID(),543339) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422709]","LuaS_422709_1",0) --我準備好了！走吧！讓我們一起去瞧瞧蛇人在搞什麼鬼！
	end
end

function LuaS_422709_1()

	CloseSpeak(OwnerID())
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422709_2" , 0 )
end

function LuaS_422709_2()
	local NPC = LuaFunc_CreateObjByOBj( 102675, OwnerID() )
	Hide(OwnerID())
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )
	BeginPlot( NPC , "LuaS_422709_3" , 0 )
	BeginPlot( NPC , "LuaS_422709_4" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(NPC) == false or ReadRoleValue( NPC , EM_RoleValue_OrgID ) ~= 102675 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )	
end

--檢查用(修改中)
function LuaS_422709_3()
	Local NPC = OwnerID() 
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Result = "Success"	
	local Party = LuaFunc_PartyData(Player)
	SetPlot( OwnerID() , "Dead" , "LuaS_422709_Dead" , 0 )
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 422709 ) == true and
 			CheckFlag(Party[i] , 543339 ) == false and
			GetDistance(Party[i] , OwnerID() ) < 100 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
			AddBuff( Party[i] , 504769 , 1 , -1 ) --偵察中的BUFF
		end
	end

	while true do
		sleep(10)

		if	not CheckID(Player)	then
			Result = "Fail"
			break
		end
		if	ReadRoleValue(Player,EM_RoleValue_IsDead) == 1	then
			Result = "Fail"
			CancelBuff(Player, 504769)
			break
		end
		if	not	CheckDistance( OwnerID(), Player , 200 )	then
			Result = "Fail"
			CancelBuff(Player, 504769)
			break
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_Register) > 0	then
			CancelBuff(Player, 504769)
			Result = "Fail"
			break
		end
	end
	
	
	if Result == "Fail" then

		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422709 ) == true and CheckFlag(Party[i] , 543339 ) == false then
				ScriptMessage( Party[i] , Party[i] , 1 , "[SC_422709_1]" , 0 ) --偵察失敗！
				ScriptMessage( Party[i] , Party[i] , 0 , "[SC_422709_1]" , 0 )
			end
		end
		SetStopAttack( OwnerID() ) --停止攻擊
		Lua_CancelAllBuff( OwnerID())  --清掉身上的BUFF
		SetRoleCamp( OwnerID() , "Visitor" ) --改變陣營
		Tell(Player,OwnerID(),"[SC_422709_2]") --太危險了！我先回去報告[113503]隊長，我們在那裡會合......
	end
	Move( OwnerID() , -12973 , 942 , 31919 )
	sleep( 10 )
	Delobj( OwnerID() )
end

function LuaS_422709_Dead()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	return false
end
--劇情用
function LuaS_422709_4()
	
	MoveToFlagEnabled( OwnerID() , false )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	
	Tell(Player,OwnerID(),"[SC_422709_3]") --跟我來吧！
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 1 ,  0 )
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 2 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	

	sleep(20)
	Tell(Player,OwnerID(),"[SC_422709_4]") --那裡有一些哥布林，讓我們靠過去一些偵察吧！
	sleep(10)

	LuaFunc_MoveToFlag(OwnerID() , 780439 , 3 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	

	sleep(20)
	Tell(Player,OwnerID(),"[SC_422709_5]") --噢！像火焰般皮膚的哥布林....不可否認，他們的打造技術真不錯！
	sleep(40)	
	Tell(Player,OwnerID(),"[SC_422709_6]") --要不是有這些哥布林幫忙，蛇人的武器製造速度將會慢上許多...
	sleep(40)
	Tell(Player,OwnerID(),"[SC_422709_7]") --我們真的該找個機會，宰光這些哥布林！
	sleep(30)
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 4 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	

	local MonA = CreateObjByFlag( 102518 , 780439 , 5 , 0 )  
	local MonB = CreateObjByFlag( 102518 , 780439 , 6 , 0 )  
	AddToPartition( MonA ,    0 )
	AddToPartition( MonB ,    0 )
	SetAttack( MonA , Player )
	SetAttack( MonB , Player )
	SetAttack( OwnerID() , MonA )
	SetAttack( OwnerID() , MonB )
	Say( MonA , "[SC_422709_12]" ) --  有入侵者！

	while true do
		if ReadRoleValue( MonA , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( MonA ) == true then  --檢查是否離開戰鬥
			Sleep( 10 )	-- 一秒檢查一次	
		else
			if CheckID( MonA ) == true then	DelObj( MonA )	end 
			break
		end
	end

	while true do
		if ReadRoleValue( MonB , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( MonB ) == true then  --檢查是否離開戰鬥
			Sleep( 10 )	-- 一秒檢查一次	
		else
			if CheckID( MonB ) == true then	DelObj( MonB )	end 
			break
		end
	end
	
	MoveToFlagEnabled( OwnerID() , false )

	sleep(20)
	Tell(Player,OwnerID(),"[SC_422709_13]") --繼續前進吧！
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 7 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 8 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)
	MoveToFlagEnabled( OwnerID() , false )	
	Tell(Player,OwnerID(),"[SC_422709_14]") --越靠近蛇人越危險，小心跟上！
	

	LuaFunc_MoveToFlag(OwnerID() , 780439 , 9 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	MoveToFlagEnabled( OwnerID() , false )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 10 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_8]") --索雷爾頓的傢伙與蛇人！
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_9]") --真想聽清楚他們在說什麼......
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_10]") --看起來蛇人似乎聽命於那些索雷爾頓的傢伙，這或許是個有用的情報！
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_11]") --我要再更深入去調查蛇人的行為，你先回去向戴洛斯隊長報告，我們回頭見......
	SetFlag(Player , 543339 , 1 )
	sleep(20)
	CancelBuff(Player, 504769)
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 12 ,  0 )
	Delobj( OwnerID() )
end
-----------潛入蛇人魔都
function LuaS_113680_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) > 0 or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) > 0 or CheckBuff( OwnerID() , 504948) == true then
		SetSpeakDetail(OwnerID(),"[SC_113680_5]") 
	else
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113680_0]","LuaS_113680_1",0)  --我要進入[ZONE_NAGA ACROPOLIS]
	end
end

function LuaS_113680_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and CheckBuff( OwnerID() , 504948) == false then
		DisableQuest( TargetID() , true )
		SetPlot( TargetID() , "touch" ,"LuaFunc_Obj_BUSY" , 40 )
		BeginPlot( TargetID() , "LuaS_113680_2" , 0 )
	end
end

function LuaS_113680_2()
	if CheckID( TargetID() ) == true then
		BeginPlot( TargetID() , "LuaS_113680_3" , 0 )
	end
	sleep( 100)
	DisableQuest( OwnerID() , false )
	SetPlot(  OwnerID()  , "touch" ,"" , 0 )
end
function LuaS_113680_3()

	local Wagon = CreateObjByFlag( 113682 , 780443 , 2 , 1 )
	local Zone = ReadRoleValue( OwneRID() , EM_RoleValue_ZoneID )
--	local Me= Role:new( OwnerID() )
--	local Dir = ReadRoleValue( TargetID() , EM_RoleValue_Dir )
	WriteRoleValue( Wagon , EM_RoleValue_LiveTime , 30 )
	WriteRoleValue( Wagon , EM_RoleValue_IsWalk , 1 )
	Lua_ObjDontTouch( Wagon ) 
	AddToPartition( Wagon , 0 )
	MoveToFlagEnabled( Wagon , false )
	BeginPlot( Wagon , "LuaS_113680_4" , 0 )
	PlayMotion( TargetID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( TargetID() ,"......" )
	tell( OwnerID()  , TargetID() , "[SC_113680_1]" ) --在這傢伙身上找個地方躲好，牠會負責帶你過去。
--	SetPos( OwnerID() , Me:X() , Me:Y() , Me:Z() , Dir )
	sleep( 30 )
	local Count = BuffCount ( OwnerID())
	local BuffType
	for i = 1 , Count do
		local BuffID = BuffInfo ( OwnerID() , Count-i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			CancelBuff( OwnerID() , BuffID )
		end
	end
	AddBuff( OwnerID() , 504948 , 0 , 30 )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_113680_2]" , 0 ) --你在[113682]上找了一個地方將自己藏了起來
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_113680_2]" , 0 )
	sleep( 20 )
	Say( TargetID() ,"......" )
	tell( OwnerID()  , TargetID() ,  "[SC_113680_3]" ) --我只能幫你到這裡，接下來就看你自己了，祝你幸運。
	sleep( 150 )
	local X = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_Z )
	local Dir = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_Dir )
	ChangeZone( OwnerID() , Zone , 0 , X , Y , Z , Dir )
	sleep( 10 )
	CancelBuff_NoEvent( OwnerID() , 504948 )
end

function LuaS_113680_4()
	sleep( 70 )
	if CheckID( TargetID() ) == true then
		ScriptMessage( TargetID() , TargetID() , 2 , "[SC_113680_4]" , 0 ) --[113680]開始緩緩地向[ZONE_NAGA ACROPOLIS]的方向移動
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_113680_4]" , 0 )
	end
	DW_MoveToFlag( OwnerID() , 780443 , 3 , 0 )
	Delobj( OwnerID() )
end