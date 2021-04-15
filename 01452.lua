--專用旗子 780375  （要種）
-- 1：索雷爾頓小壞蛋出現點
-- 2，3：看守蕈人王的衛士出現點
-- 4，5：看守蕈人王的衛士移動點
-- 6 ：巴布里斯逃脫點

--範圍劇情script ，請掛在該任務範圍參考物件的初始劇情中
-- 任務 422472 是朋友還是敵人？：LuaI_422472_Range_0
-- 任務 422479 調查水源：LuaI_422479_0

---113167 葛林布茲 對話劇情----------
function LuaS_113167_0()
	if CheckBuff( OwnerID() , 503934 ) == true then
		SetSpeakDetail( OwnerID(),  "[SC_422472_2]" ) --( [113167]一見到你身上的孢子馬上別過頭去，看來在那些孢子消失前他不會跟你說任何話。 )
	else
		LoadQuestOption(OwnerID())
	end
	if	CheckAcceptQuest(OwnerID(),422721)	and
		CountBodyItem(OwnerID(),205839)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422721_0]","LuaS_422721_3", 0 )
	end
end

--------任務 422472 是朋友還是敵人？ ------------------------
function LuaI_Zone8_MushroomDead() --請掛在所有蕈人的死亡劇情中
	if CheckAcceptQuest( TargetID() , 422472 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422472_1]" , 0 ) --你違背了與[113167]的約定，傷害他的同伴！證據就在你的身上！
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422472_1]" , 0 )
		AddBuff( TargetID() , 503934 , 1 , 300 )
	end
	return true
end


function LuaI_422472_Range_0() --請掛在檢查點上
	SetPlot( OwnerID() , "range" , "LuaI_422472_Range_1" , 100 ) --調整最後的數字以改變偵測範圍
end

function LuaI_422472_Range_1()
	if CheckAcceptQuest( OwnerID() , 422472 ) == true and CheckFlag( OwnerID() , 542872 ) == false then
		SetFlag( OwnerID() , 542872  , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422472_0]" , 0 ) --你發現蕈人們一動也不動地在奇怪的大香菇下面坐著
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422472_0]" , 0 )
	end
end

----------任務 422474 叫醒他們 ---------------------------
function LuaS_113168_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID() , 422474 ) == true and CountBodyItem( OwnerID() , 205260 ) < 10 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422474_0]" ,"LuaS_113168_1", 0 ) --你用力搖醒蕈人
	end
end

function LuaS_113168_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )

	if ReadRoleValue(TargetID() , EM_RoleValue_PID ) > 0 then
		BeginPlot( TargetID() , "LuaS_113168_2C" , 0 ) --攻擊結果
		return
	end

	local Rand = DW_Rand( 300 ) -1
	if math.floor( Rand/100 ) == 2 then
		BeginPlot( TargetID() , "LuaS_113168_2A" , 0 ) --走開結果
	elseif math.floor( Rand/100 ) == 1 then
		BeginPlot( TargetID() , "LuaS_113168_2B" , 0 ) --沉思結果	
	else
		BeginPlot( TargetID() , "LuaS_113168_2C" , 0 ) --攻擊結果
	end 
end

function LuaS_113168_2A()
	local Str = {[1] = "[SC_422474_1]" , [2] = "[SC_422474_2]" }  --A. 我剛剛怎麼了？我怎麼會在這裡？ B.我該回到我的工作崗位上…
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	sleep( 5 )
	MoveToFlagEnabled( OwnerID() , false )
	PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Yell( OwnerID() , Str[DW_Rand(2)] , 2)
	sleep( 30 )
	Move( OwnerID() , -7701 ,0 , 19896 )
	if CheckAcceptQuest( TargetID() , 422474 ) == true and CountBodyItem( TargetID()  , 205260 ) < 10 then
		ScriptMessage( TargetID() ,TargetID(), 0 , "[SC_422474_3]" , 0 ) --你撿起[113168]離開後所遺留下來的孢子
		ScriptMessage( TargetID() , TargetID(), 2 , "[SC_422474_3]" , 0 )
		GiveBodyItem( TargetID() , 205260 , 1 )
	end
	sleep( 50 )
	Hide( OwnerID() )
	sleep( 150 )
	Show( OwnerID() , 0 )
	SetPos( OwnerID(), X, Y, Z , Dir )
	sleep( 5 )
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() , false )
end

function LuaS_113168_2B()
	local Str = {[1] = "[SC_422474_4]" , [2] = "[SC_422474_5]" }  --A.是誰？誰叫我？不要打斷我的沈思…B.啊哈！我知道你…你昨天有來過…今天又來啦～
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Rand = DW_Rand(2)
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	sleep( 5)
	PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Yell( OwnerID() , Str[Rand], 2)
	if Rand == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 748 )
	end
	sleep( 30 )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	DisableQuest( OwnerID() , false )
end

function LuaS_113168_2C()
	local BattleMushroom = LuaFunc_CreateObjByObj( 102300 , OwnerID() )
	Hide( OwnerID() )
	WriteRoleValue( BattleMushroom , EM_RoleValue_PID , TargetID() )
	BeginPlot( BattleMushroom , "LuaS_113168_2C_Battle" , 0 )
	while 1 do
		if CheckID( BattleMushroom ) == false then
			break
		end
		sleep( 10 )
	end
	sleep( 150 )
	Show( OwnerID() , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_113168_2C_Battle()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	Yell( OwnerID() ,"[SC_422474_6]" , 3 ) --你是什麼人？入侵者！有入侵者！
	if CheckID( Player ) == true and CheckRelation( OwnerID() , Player, EM_CheckRelationType_Attackable  ) == true then
		SetAttack( OwnerID() , Player )
	end
	while 1 do
		if HateListCount( OwnerID() ) == 0  and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			break
		else
			sleep( 30 )
		end
	end
	Delobj( OwnerID() )
end

------------任務 422479 調查水源------------
function LuaI_422479_0()
	SetPlot( OwnerID() , "range" , "LuaI_422479_1" , 50 )
end

function LuaI_422479_1()
	if CheckAcceptQuest( OwnerID() , 422479 ) == true and CheckFlag( OwnerID() , 542873 ) == false then
		SetPlot( TargetID()  , "range" , "" , 0 )
		BeginPlot( TargetID() , "LuaI_422479_2" , 0 )
	end
	if CheckCompleteQuest( OwnerID() , 422479 ) == true or CheckFlag( OwnerID() , 542873 ) == true then
		if CheckCompleteQuest( OwnerID() , 422489 ) == false then
			if CheckAcceptQuest( OwnerID() , 422489 ) == false and CountBodyItem( OwnerID(), 205261 )<1 then
			   SetPlot( TargetID()  , "range" , "" , 0 )
			   BeginPlot( TargetID() , "LuaI_422479_2" , 0 )
			end
		end
	end
end

function LuaI_422479_2()
	local BadGuy = CreateObjByFlag(  102302 , 780375 , 1 , 1)
	SetRoleCamp( BadGuy , "Visitor" )
	AddToPartition( BadGuy , 0 )
	SetPlot( BadGuy , "dead" , "LuaI_422479_Dead" , 0 )
	PlayMotion( BadGuy ,ruFUSION_ACTORSTATE_THROW )
	Yell( BadGuy , "[SC_422479_0]" , 5 ) --多喝點水吧！愚蠢的蕈人…
	if CheckAcceptQuest( TargetID()  , 422479 ) == true and CheckFlag( TargetID() , 542873 ) == false then
		SetFlag( TargetID() , 542873 , 1 )
	end
	sleep( 20 )
	Hide( BadGuy )
	SetRoleCamp( BadGuy , "Monster" )
	Show( BadGuy , 0 )
	Yell( BadGuy , "[SC_422479_1]" , 5 ) --糟了！有人！
	SetAttack( BadGuy , TargetID() )
	BeginPlot( BadGuy , "LuaI_422479_3" , 0 )
	while 1 do
		if CheckID( BadGuy ) == false then
			break
		end
		sleep( 10 )
	end
	SetPlot( OwnerID() , "range" , "LuaI_422479_1" , 30 )
end

function LuaI_422479_3()
	LuaFunc_Obj_Suicide(100)
end

function LuaI_422479_Dead()
	local PlayerNum = HateListCount( OwnerID() ) -1
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CountBodyItem( PPL , 205261 ) == 0 and CheckCompleteQuest( PPL , 422489 ) == false and GetDistance( OwnerID() , PPL ) < 300 then
				if CheckCompleteQuest( PPL , 422479 ) == true or CheckAcceptQuest( PPL , 422479 ) == true then
					ScriptMessage(  PPL ,  PPL , 0 , "[SC_422479_2]" , 0 ) --你從[102302]身上找出一封[205261]
					ScriptMessage(  PPL  ,  PPL  , 2 , "[SC_422479_2]" , 0 )
					GiveBodyItem( PPL , 205261 , 1 )
				end
		end
	end
	return true
end

----------任務 422489 污染水源的兇手 ----------------------------------------
function LuaI_205261_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail(422489, 1 ) )
	ShowBorder( OwnerID(), 422489, str , "ScriptBorder_Texture_Paper" )	
end

----------任務 422486 蕈人的密謀  ----------------------------------------
function LuaI_205362_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail(422486, 1 ) )
	ShowBorder( OwnerID(), 422486, str , "ScriptBorder_Texture_Paper" )	
end

---------任務 422480 幫助蕈人王 -------------------------------------------------
function LuaS_113190_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID() , 422481 ) == true and CheckFlag( OwnerID() , 542874 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422480_0]" ,"LuaS_113190_1", 0 ) --跟[113190]說可以開始了
	end
	if	CheckAcceptQuest(OwnerID(),422721)	and
		CountBodyItem(OwnerID(),205839)<1	 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422721_0]","LuaS_422721_1", 0 )
	end
end

function LuaS_113190_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_113190_2" , 0 )
end

function LuaS_113190_2()
	local Player = TargetID()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
	Yell( OwnerID() , "[SC_422480_1]"  , 3 ) --那我就開始囉！拜託你了。
	sleep( 30 )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_422480_2]" , 0 ) --[113190]發出奇特的呼嘯聲
	ScriptMessage( OwnerID() , TargetID(), 2 , "[SC_422480_2]" , 0 )
	sleep(10)
	local Guard = {}
	for i = 1 , 2 , 1 do
		Guard[i] = CreateObjByFlag(  102223 , 780375 , 1+i , 1)
		SetRoleCamp( Guard[i] , "Visitor" )
		AddToPartition( Guard[i] , 0 )
		MoveToFlagEnabled( Guard[i] , false )
		SetPlot( Guard[i] , "dead" , "LuaS_113190_Dead" , 0 )
		BeginPlot( Guard[i] , "LuaS_113190_Battle" , 0 )
		WriteRoleValue( Guard[i] , EM_RoleValue_PID , OwnerID() )
		WriteRoleValue( Guard[i] , EM_RoleValue_Register , Player )
		WriteRoleValue( Guard[i] , EM_RoleValue_Register +1 , 3+i )
		WriteRoleValue( Guard[i] , EM_RoleValue_IsWalk , 0 )
	end
	while 1 do
		if ( CheckID( Guard[1] ) == false or ReadRoleValue( Guard[2] , EM_RoleValue_IsDead) == 1 ) and ( CheckID( Guard[2] ) == false or ReadRoleValue( Guard[2] , EM_RoleValue_IsDead) == 1 ) then
			break
		end
		sleep( 10 )
	end
	sleep(10)
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) >= 2 and CheckID( Player ) == true then
		local Party = LuaFunc_PartyData(Player)
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422481 ) == true and GetDistance( Party[i] , OwnerID()) < 300 then
				SetFlag( Party[i] , 542874 , 1 )
			end
		end
	end
	DisableQuest(OwnerID() ,false )
end

function LuaS_113190_Dead()
	local King = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	if CheckID( King ) == true and ReadRoleValue( King , EM_RoleValue_OrgID ) == 113190 then
		local PID = ReadRoleValue( King , EM_RoleValue_PID ) +1
		WriteRoleValue( King , EM_RoleValue_PID , PID )
	end 
	return true
end

function LuaS_113190_Battle()
	local Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register +1 )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local X = GetMoveFlagValue( 780375  , Flag , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780375  , Flag , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780375  , Flag , EM_RoleValue_Z )
	if Flag > 4 then
		Yell( OwnerID() , "[SC_422480_3]" , 3 ) --快！那傢伙又開始大鬧了！
	end
	Move( OwnerID(),  X , Y , Z )
	Sleep( 30) 
	if Flag < 5 then
		Yell( OwnerID() , "[SC_422480_4]" , 3 ) --小心！有人類！
	end
	Hide( OwnerID() )
	SetRoleCamp( OwnerID() , "Monster" )
	Show( OwnerID() , 0 )
	MoveToFlagEnabled( OwnerID() , true )
	SetAttack( OwnerID() , Player )
	while 1 do
		if HateListCount( OwnerID() ) == 0  and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			break
		else
			sleep( 30 )
		end
	end
	DelObj( OwnerID() )
end

---------任務 422488 逃出這瘋狂的地方 -------------------------------------------------
function LuaS_113191_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422488 ) == true and CheckFlag( OwnerID() , 542879 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422488_0]" ,"LuaS_113191_1", 0 ) --出發
	end
	if	CheckAcceptQuest(OwnerID(),422721)	and
		CountBodyItem(OwnerID(),205839)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422721_0]","LuaS_422721_3", 0 )
	end
end

function LuaS_113191_1()
	CloseSpeak(OwnerID())
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_113191_2" , 0 )
end

function LuaS_113191_2()
	local Dummy = LuaFunc_CreateObjByOBj( 113192 , OwnerID() )
	Hide( OwnerID() )
	MoveToFlagEnabled( Dummy , false )
	WriteRoleValue( Dummy , EM_RoleValue_PID , TargetID() )
	BeginPlot( Dummy , "LuaS_113191_3" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(Dummy) == false or ReadRoleValue( Dummy , EM_RoleValue_OrgID ) ~= 113192 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )	
end

function LuaS_113191_3()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Me = Role:new( OwnerID() )
	local Pos ={["X"] = Me:X() , ["Y"] = Me:Y() , ["Z"] = Me:Z() , ["Dir"] = Me:Dir() }
	local X = GetMoveFlagValue( 780375  , 6 , EM_RoleValue_X )
	local Z = GetMoveFlagValue( 780375  , 6 , EM_RoleValue_Z )
	local Result = "Success"	
	local Party = LuaFunc_PartyData(Player)

	for i = 1 , Party[0] , 1 do
		if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckFlag(Party[i] , 542879 ) == false and GetDistance(Party[i] , OwnerID() ) < 100 and ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
			AddBuff( Party[i] , 503940 , 1 , 10 )
		end
	end

	SetFollow( OwnerID() , Player )

	while 1 do
		sleep(30)

		for i = 1 , Party[0] , 1 do
			if CheckID( Party[i]  ) == false or CheckBuff( Party[i]  , 503940 ) == false then
				Result = "Fail"
			else
				Party = LuaFunc_PartyData(Party[i])
				Result = "Success"
				break
			end
		end

		if ( Me:X() - X ) ^ 2 + ( Me:Z() - Z ) ^2 <= 10000 or Result == "Fail" then
			break
		else
			for i = 1 , Party[0] , 1 do
				if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckFlag(Party[i] , 542879 ) == false and GetDistance(Party[i] , OwnerID() ) < 100 and ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
					AddBuff( Party[i] , 503940 , 1 , 10 )
				end
			end
		end
	end

	if Result == "Fail" then
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckFlag(Party[i] , 542879 ) == false then
				ScriptMessage( Party[i] , Party[i] , 1 , "[SC_422488_1]" , 0 ) --護送[113191]失敗
				ScriptMessage( Party[i] , Party[i] , 0 , "[SC_422488_1]" , 0 )
			end
		end
		Yell( OwnerID() , "[SC_422488_2]" , 3 ) --噢！糟了......我最好回到原來的地方躲起來......
		SetFollow( OwnerID() , OwnerID() )
		Move( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] )
		sleep( 50 )
	else
		Yell( OwnerID() , "[SC_422488_3]" , 3 ) --到這邊我就可以自己找路出去了，謝謝你。
		PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep( 30 )
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckBuff(Party[i] , 503940 ) == true then
				CancelBuff_NoEvent( Party[i] , 503940 )
				SetFlag( Party[i] , 542879 , 1 )
			end
		end 
		Move( OwnerID() , X , Me:Y()  , Z )
		sleep( 50 )
	end
	Delobj( OwnerID() )
end

---------------------------------------------------------------------------------------------------