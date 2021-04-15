--control--104650
--寶箱旗--781455--ID--104529
--怪物旗--781456
--BOSS--104472--104482--104526
--ID--104473--104474--104483--104484--104527--104528

--※ 死人打人啦 ※--
function sasa_deadpp_attack01()
	local mob = OwnerID()
	local Room = ReadRoleValue( mob , EM_RoleValue_RoomID )		--讀在哪一層
	local EnterFight
	SetDefIdleMotion( mob, ruFUSION_MIME_IDLE_DEAD )
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( mob , EM_RoleValue_AttackTargetID )
		if HateListCount( mob ) ~= 0 then			--讀仇恨表內數量(有人)
			SetDefIdleMotion( mob , ruFUSION_MIME_NONE )
			if EnterFight == 0 then
				EnterFight = 1
				Sleep(10)
				SetDefIdleMotion( mob , ruFUSION_MIME_ATTACK_1H )
			end
		elseif HateListCount( mob ) == 0 then		--讀仇恨表內數量(沒人)
			Sleep(20)
			SetDefIdleMotion( mob, ruFUSION_MIME_IDLE_DEAD )
			if EnterFight == 1 then
				EnterFight = 0
			end
		end
	end
end

--※ 隨機BOSS寶箱 ※--
function sasa_Random_control215()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Count , EM_RoleValue_ZoneID )
	local BossNum = { 104472 , 104482 , 104526 }
	local class
	if ZoneID == 215 then		--神殿1
		class = 1
	elseif ZoneID == 216 then	--神殿2
		class = 2
	elseif ZoneID == 217 then	--神殿3
		class = 3
	end
	local Flag = DW_CircleRand(20)	--需為取出數量倍數

--※ 隨機BOSS ※--
	for a = 1 , 5 do
		local boss = CreateObjByFlag( BossNum[class] , 781456 , Flag()+0 , 1 )--此種RAND不包含flag0，所以從flag4開始種物件，要寫Flag()+3，略過flag1~3
		AddToPartition( boss , Room )
	end
	sleep(10)

--※ 隨機寶箱 ※--
	for b = 1 , 5 do
	local Treasure = CreateObjByFlag( 104529 , 781455 , Flag()+0 , 1 )
	SetModeEx( Treasure , EM_SetModeType_Searchenemy, false )   			--索敵
	SetModeEx( Treasure , EM_SetModeType_Fight, false ) 					--砍殺
	SetModeEx( Treasure , EM_SetModeType_Move, false )						--移動
	SetModeEx( Treasure , EM_SetModeType_Strikback, false )					--反擊
	AddToPartition( Treasure , Room )
	BeginPlot( Treasure , "sasa_104529_Treasure", 0 )
	end
end

--※ 寶箱AI ※--
function sasa_104529_Treasure()
	SetPlot( OwnerID() ,"touch", "sasa_104529_Treasure_open" ,40 )
end

function sasa_104529_Treasure_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end

--※ 傳送門 ※--
function ZONE_215_217_OUTDOOR_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_215_217_OUTDOOR_2" , 0 )
end

function ZONE_215_217_OUTDOOR_2()	--出副本後的座標點
	if ChangeZone( OwnerID() , 2 , 0 , 5795 , 50 , -2930 , 0 ) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

--※ 計時器 ※--時間未結束出副本則無法在接關，需重頭開始。
function sasa_mirrorworld_clockopen()
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local String = { "[SC_PHANTOM_TIME_START01]" , "[SC_PHANTOM_TIME_START02]" , "[SC_PHANTOM_TIME_END01]" }
	--你有15分鐘可以好好運用！
	--你的時間正在一分一秒地流逝中……
	--時間到，下次再來吧！
	sleep(20)
	ScriptMessage( Player , -1 , 2 , String[1] , "0xff6fb7ff" )
	------------對象-------鏡世界專用編號------開始--現在--結束-----換區劇情-----------時間結束劇情
	ClockOpen( Player , EM_ClockCheckValue_33 , 900 , 900 , 0 , "Lua_Clockending" , "Lua_Clockending" )
	sleep(8990)--正規時間：15分鐘, 15*60=900, 900-1=899=8990毫秒
	ScriptMessage( Player , -1 , 2 , String[3] , "0xff6fb7ff" )
	sleep(20)
	ChangeZone( Player , 2 , 0 , 5795 , 50 , -2930 , 0 )	--時間到傳出副本
end

--------------------------------------------------------------------------------------------------------------

--[[※ 舊版本計時器 ※--時間未結束進出副本會讀取剩餘時間接關。
function sasa_mirrorworld_clockopenkeep()
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Pos					--玩家BUFF位置
	local Time					--副本剩餘時間變數
	local TimeBuff = 626288		--副本時間判斷用
	local String = { "[SC_PHANTOM_TIME_START01]" , "[SC_PHANTOM_TIME_START02]" , "[SC_PHANTOM_TIME_END01]" }
	--你有15分鐘可以好好運用！
	--你的時間正在一分一秒地流逝中……
	--時間到，下次再來吧！
	
	if CheckBuff( Player , TimeBuff ) == true then
		Pos = Lua_BuffPosSearch( OwnerID() , TimeBuff )				--確認BUFF位置
		Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )	--讀取時間
		sleep(20)
		ScriptMessage( Player , -1 , 2 , String[2] , "0xff6fb7ff" )
		AddBuff( Player , TimeBuff , 0 , Time )						--給予剩下的時間
		------------對象-------鏡世界專用編號------開始--現在--結束-----換區劇情-----------時間結束劇情
		ClockOpen( Player , EM_ClockCheckValue_33 , Time , Time , 0 , "Lua_Clockending" , "Lua_Clockending" )
		sleep((Time-1)*10)--剩餘時間-1後*10=毫秒
		ScriptMessage( Player , -1 , 2 , String[3] , "0xff6fb7ff" )
		sleep(20)
		ChangeZone( Player , 2 , 0 , 5795 , 50 , -2930 , 0 )	--時間到傳出副本
	else
		sleep(20)
		ScriptMessage( Player , -1 , 2 , String[1] , "0xff6fb7ff" )
		AddBuff( Player , TimeBuff , 0 , -1 )
		------------對象-------鏡世界專用編號------開始--現在--結束-----換區劇情-----------時間結束劇情
		ClockOpen( Player , EM_ClockCheckValue_33 , 900 , 900 , 0 , "Lua_Clockending" , "Lua_Clockending" )
		sleep(8990)--正規時間：15分鐘, 15*60=900, 900-1=899=8990毫秒
		ScriptMessage( Player , -1 , 2 , String[3] , "0xff6fb7ff" )
		sleep(20)
		ChangeZone( Player , 2 , 0 , 5795 , 50 , -2930 , 0 )	--時間到傳出副本
	end
end]]--