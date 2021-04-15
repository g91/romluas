--2011/10/18祈願節--
function lua_kors_thank_con()	--中控器產出
local OID = OwnerID()
local NPC =0
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	while TRUE do
	local hr = GetSystime(1)-- 抓小時
	local min = GetSystime(2)--抓目前分鐘
		if hr == 11 or hr == 14 or hr == 16 or hr == 18 or hr == 20 or hr == 22 then
			if min == 0 then --創出商隊主人
				NPC = CreateObjByFlag ( 120038 , 781058 , 0 , 1 )
				MoveToFlagEnabled(NPC,FALSE)
				WriteRoleValue(NPC,EM_RoleValue_IsWalk,1)
				AddToPartition ( NPC ,0 )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( oid, 2 , 3 , "[SC_KORS_THANKS_00]" ) 
				end
			elseif min == 5 then 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( oid, 2 , 3 , "[SC_KORS_THANKS_01]" )
				end
			elseif min == 10 then
				local count = SetSearchAllNPC( room )
				for i = 1, count ,1 do
					local NPC = GetSearchResult() 
					local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
					if OrgID == 120038  then			
					BeginPlot( NPC , "lua_kors_thank_walk", 0 )
					end
				end
			elseif min == 30 then 
				local count = SetSearchAllNPC( room )
				for i = 1, count ,1 do
					local NPC = GetSearchResult() 
					local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
					if OrgID == 120038 or OrgID == 120039 or OrgID == 106508 or OrgID == 120036  or OrgID == 120063  then			
					DelObj(NPC)
					end
				end
			end
		end
	Sleep(600)
	end

end

function lua_kors_thank_00()	--對話劇情 120038
local OID = OwnerID()
local TID = TargetID()
local key = CheckFlag( OID , 546094)	--活動參加過與否辨識
local key2 = CheckFlag( OID , 546095)	--活動參加中
local key3 = CheckFlag( OID , 546096)	--護送完成
local key4 = CheckFlag( OID , 546097)	--領過獎勵
		if key == FALSE and key2 == FALSE then
			SetSpeakDetail(OID,"[SC_KORS_THANKS_02]")
			AddSpeakOption( OID,TID,"[SC_KORS_THANKS_15]","lua_kors_thank_app",0)
		elseif key ==TRUE and key2 == FALSE then
			SetSpeakDetail( OID , "[SC_KORS_THANKS_03]" )
			AddSpeakOption( OID, TID , "[SC_KORS_THANKS_16]", "lua_kors_thank_ready", 0)
		elseif key2 == TRUE and key3 == FALSE then
			SetSpeakDetail( OID,"[SC_KORS_THANKS_04]")
		else
			SetSpeakDetail( OID , "[SC_KORS_THANKS_24]" )	
		end
end

function lua_kors_thank_01() --劇情對話120063
local OID = OwnerID()
local TID = TargetID()
local key2 = CheckFlag( OID , 546095)	--活動參加中
local key3 = CheckFlag( OID , 546096)	--護送完成
local key4 = CheckFlag( OID , 546097)	--領過獎勵
	if  key3 ==TRUE and key4 == FALSE then
		SetSpeakDetail( OID , "[SC_KORS_THANKS_05]")
		AddSpeakOption( OID ,TID , "[SC_KORS_THANKS_17]", "lua_kors_thank_gift" , 0 )
	elseif key4 == TRUE and key2 == TRUE then
		SetSpeakDetail( OID , "[SC_KORS_THANKS_06]" )
	else
		SetSpeakDetail( OID , "[SC_KORS_THANKS_24]" )
	end
end

function lua_kors_thank_app()	--答應開始活動
local OID = OwnerID()
local TID = TargetID()
	SetSpeakDetail( OID ,"[SC_KORS_THANKS_07]")
	AddSpeakOption( OID, TID , "[SC_KORS_THANKS_16]", "lua_kors_thank_ready",0)
end

function lua_kors_thank_ready()	--活動出發前
local OID = OwnerID()
local TID = TargetID()
local count = ReadRoleValue ( TID , EM_RoleValue_Register6 )
	CloseSpeak( OID)
	SetFlag( OID , 546094 , 1 )
	SetFlag (OID , 546095 , 1 )
	AddBuff ( OID ,621672 , 1 , 1800 )
	AddBuff( OID , 621669 , 1 , 1800 )
	Say( TID , "[SC_KORS_THANKS_08]" )
	WriteRoleValue( TID , EM_RoleValue_Register6 , count+1)
	WriteRoleValue( OID ,EM_RoleValue_Register2 , 0 )
end

function lua_kors_thank_gift()	--領獎
local OID = OwnerID()
local TID = TargetID()
local action = 621669
local ticket = 206266
	SetSpeakDetail(OID ,"[SC_KORS_THANKS_09]")
	GiveBodyItem( OID , ticket ,3)
	SetFlag( OID , 546097, 1)
		if ReadRoleValue (TID ,EM_RoleValue_Register5 ) ~= 0 then
			GiveBodyItem(OID, 209384 , 1 )
		end
	WriteRoleValue( OID ,EM_RoleValue_Register2 , 0 )
	CancelBuff_NoEvent( OID , action )
	CancelBuff( OID , 621672 )
end	

function lua_kors_thank_walk()	--啟動
local OID = OwnerID()
local NPC = 0
	addbuff ( oid ,621671 ,1,-1 )
		NPC = CreateObjByFlag ( 120039 , 781058 , 0 , 1 )
		MoveToFlagEnabled(NPC,FALSE)
		WriteRoleValue(NPC,EM_RoleValue_IsWalk,1)
		writerolevalue ( NPC ,EM_rolevalue_pid , OID )
		WriteRoleValue(OID ,EM_RoleValue_PID , NPC)
		AddToPartition ( NPC ,0 ) 
	BeginPlot( OID , "lua_kors_thank_go", 0 )	--創怪AND掃描
	BeginPlot( npc , "lua_kors_thank_run", 0 )
end

function lua_kors_thank_run()				--表演用NPC自帶走路
local OID = OwnerID()
local flag = 781058
local flagNum = 1
local control = ReadRoleValue( OID , EM_RoleValue_PID)
	while TRUE do
	Say( OID , "[SC_KORS_THANKS_10]" )
	LuaFunc_MoveToFlag( OID, flag, flagNum, 0 )
	LuaFunc_MoveToFlag( control , flag ,flagNum , 0 )
	flagNum = flagNum +1
	WriteRoleValue( OID , EM_RoleValue_Register1 , flagNum)
	beginplot ( oid , "lua_kors_thanks_with",0)
		if flagNum > 4 then
			say(OID ,"[SC_KORS_THANKS_13]" )
			BeginPlot(control ,"lua_kors_thank_goch", 0 )
			break
		end
	Sleep(300)
	end
end

function lua_kors_thaNks_with()
local OID = OwnerID()
local zone = ReadRoleValue( OID , EM_RoleValue_RoomID )
local count = SetSearchAllPlayer ( zone )
local player ={}
local flagNum = ReadRoleValue(OID , EM_RoleValue_Register1 )
	for i = 1 , count ,1 do
	player[i] = GetSearchResult() 	
		if CheckBuff( player[i] , 621669 ) == TRUE and  GetDistance( player[i] , OID ) <= 260 then
			if  ReadRoleValue(player[i] ,EM_RoleValue_Register1) ~= 0 then
			local t = ReadRoleValue(player[i],EM_RoleValue_Register2)
			WriteRoleValue(player[i] , EM_RoleValue_Register1 , 0 )
			WriteRoleValue(player[i],EM_RoleValue_Register2 , t+flagNum)
			end
		elseif CheckBuff( player[i] , 621669 ) == TRUE and  GetDistance( player[i] , OID ) > 260 then
			SetFlag(player[i] , 546095 , 0 )
			CancelBuff_NoEvent( player[i] ,621669 )
			CancelBuff( player[i] , 621672 )
		end	
	end	
end


function lua_kors_thank_go() 				--出發
local OID = OwnerID()
local Chicken = {}
local flag = 781058
local flagNum=1
local playerNum = 0
local ChickenNPC = 106508
local zone = ReadRoleValue( OID , EM_RoleValue_RoomID )
local count = SetSearchAllPlayer ( zone )
local NPC = ReadRoleValue ( OID ,EM_RoleValue_PID )
local howplay = ReadRoleValue ( OID , EM_RoleValue_Register6 )
local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	for i = 1 , count ,1 do
	local player = GetSearchResult() 
	local action = CheckBuff ( player , 621699)
		if action == TRUE then
			playerNum = playerNum+1
		end				
	end	
	if howplay ~= 0 then
		if howplay<= 5 then
			Chicken = Lua_CreateObjToRandownPos(OID,ChickenNPC,10,80,true) --新增amount個物件在指定目標半徑Range隨機位置，並傳回物件Table ,值代表 抓坐標點、產生物件編號、數量、R、是否顯示
			WriteRoleValue( OID , EM_RoleValue_Register3, 10 )
		elseif howplay >5 and playerNum <=20 then 
			Chicken = Lua_CreateObjToRandownPos(OID,ChickenNPC,20,100,true) --新增amount個物件在指定目標半徑Range隨機位置，並傳回物件Table ,值代表 抓坐標點、產生物件編號、數量、R、是否顯示
			WriteRoleValue( OID , EM_RoleValue_Register3, 20 )
		elseif howplay >20 then
			Chicken = Lua_CreateObjToRandownPos( OID ,ChickenNPC ,30,120 ,TRUE )
			WriteRoleValue( OID , EM_RoleValue_Register3, 30 )
		end
		for index,guid in pairs(Chicken)  do
			WriteRoleValue( guid , EM_RoleValue_PID , OID )
			WriteRoleValue ( guid , EM_RoleValue_Register1 , NPC )
			MoveToFlagEnabled(guid,FALSE)
			WriteRoleValue(guid,EM_RoleValue_IsWalk,1)
		end
		while TRUE do
			local all = ReadRoleValue( OID , EM_RoleValue_Register3)
			local goalfal = ReadRoleValue( OID ,EM_RoleValue_Register2)
			local moveflag = ReadRoleValue( NPC ,EM_RoleValue_Register1 )
			if moveflag <=4 and goalfal == all then
				Say ( NPC , "[SC_KORS_THANKS_18]" )
				BeginPlot (OID , "lua_kors_thank_fal" , 0 )
				break	
			elseif moveflag > 4  then
				break	
			end	
		Sleep(20)
		end
	elseif howplay == 0 then		
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsgEx( oid, 2 , 3 , "[SC_KORS_THANKS_20]" ) 
		end
		DelObj( NPC )
		DelObj( OID )
	end
end

function lua_kors_thank_goch()
local OID = OwnerID()
local NPC = ReadRoleValue ( OID ,EM_RoleValue_PID )
local all = ReadRoleValue( OID , EM_RoleValue_Register3)
--	Say( NPC ,"[SC_KORS_THANKS_13]")
	while TRUE do
	local goalfal = ReadRoleValue( OID ,EM_RoleValue_Register2)
	local arrive = ReadRoleValue( OID , EM_RoleValue_Register4 )	
			if arrive == all and goalfal == 0 then
			BeginPlot( OID , "lua_kors_thank_goal" , 0 )
			WriteRoleValue( OID , EM_RoleValue_Register5 , 1 )
			break
			elseif arrive == ( all - goalfal ) and goalfal ~= all then
			BeginPlot( OID , "lua_kors_thank_goal" , 0 )
				break
			elseif goalfal == all then
				BeginPlot (OID , " lua_kors_thank_fal" , 0 )
				break
			end
	Sleep(30)
	end
end


function lua_kors_thank_chicken()	--鶴駝自帶劇情
local OID = OwnerID()
local control = ReadRoleValue( OID , EM_RoleValue_PID )
local playnpc = ReadRoleValue( OID ,EM_RoleValue_Register1 )
	while TRUE do
	local moveflag = ReadRoleValue( playnpc , EM_RoleValue_Register1)
	local lock = ReadRoleValue ( OID ,EM_RoleValue_Register2 )
	local range = GetDistance(OID , playnpc )
		if moveflag <= 4 then
			if range >= 150 and range <= 300 then
					Say( playnpc ,"[SC_KORS_THANKS_11]" )
			elseif range >300 and range <= 500 then
					Say ( playnpc ,"[SC_KORS_THANKS_12]" )
			elseif range > 500 then
				Hide ( OID )
				local fal = ReadRoleValue ( control ,EM_RoleValue_Register2 )
				WriteRoleValue( control , EM_RoleValue_Register2 , fal+1 )
				StopMove( OID, TRUE )	
				break
			end
		elseif moveflag > 4 then
			if range <= 50 and lock == 0 then
				local arrive = ReadRoleValue ( control ,EM_RoleValue_Register4)
				WriteRoleValue( OID ,EM_RoleValue_Register2 , 1 )
				WriteRoleValue( control ,EM_RoleValue_Register4 , arrive+1 )
				SetFollow( OID, control )
			end
		end
	Sleep(30)
	end
end

function lua_kors_thank_goal()		--成功抵達
local OID = OwnerID()
local zone = ReadRoleValue( OID , EM_RoleValue_RoomID )
local count = SetSearchAllPlayer ( zone )
local player ={}
local NPC = ReadRoleValue ( OID ,EM_RoleValue_PID )
local give = 0
	give = CreateObjByFlag( 120063 , 781058 , 4 , 1)
	if ReadRoleValue( OID ,EM_RoleValue_Register5 ) ~= 0 then
		WriteRoleValue( give ,EM_RoleValue_Register5 , 1)	
	end
	AddToPartition( give , 0 )
	DelObj( NPC )
	for i = 1 , count ,1 do
	player[i] = GetSearchResult() 	
		if CheckBuff( player[i] , 621669 ) == TRUE and ReadRoleValue(player[i] , EM_RoleValue_Register2) >= 14 then
			SetFlag( player[i] , 546096 , 1 )
		elseif CheckBuff(player[i] , 621669 ) == TRUE and ReadRoleValue(player[i] , EM_RoleValue_Register2) < 14 then
			SetFlag(player[i] , 546095 , 0 )
			CancelBuff_NoEvent( player[i] ,621669 )
			CancelBuff( player[i] , 621672 )
		end	
	end	
	DelObj( OID )
end

function lua_kors_thank_fal()	--失敗重置
local OID =OwnerID()
local zone = ReadRoleValue( OID , EM_RoleValue_RoomID )
local count = SetSearchAllPlayer ( zone )
local NPC = ReadRoleValue ( OID ,EM_RoleValue_PID )
local player = {}
local complete = 546095
local OrgX = ReadRoleValue( NPC, EM_RoleValue_X )
local OrgY = ReadRoleValue( NPC , EM_RoleValue_Y )
local OrgZ = ReadRoleValue( NPC , EM_RoleValue_Z )
local OrgD = ReadRoleValue( NPC , EM_RoleValue_Dir )
local fal = 0
	fal = CreateObj(120036 ,OrgX ,OrgY , OrgZ ,OrgD , 1 ) 
	AddToPartition ( fal , 0 )
		for i = 1 ,count, 1  do
			player[i] = GetSearchResult() 	
			if CheckBuff( player[i] , 621669 ) == TRUE then
			SetFlag( player[i] , 546095 , 0 )
			CancelBuff_NoEvent( player[i] ,621669 )
			CancelBuff( player[i] , 621672 )
			end
		end					
	DelObj( NPC )
end

function lua_kors_thank_faltalk()
local OID = OwnerID()
	SetSpeakDetail( OID , "[SC_KORS_THANKS_19]" )
end

function lua_kors_thank_giveup()
local OID = OwnerID()
	SetFlag( OID ,546094 , 1 )
	SetFlag ( OID , 546095 , 1 )
	SetFlag ( OID , 546096 , 1 )
	SetFlag ( OID , 546097 , 1 )
	SetFlag ( OID , 546102 , 1 )
	CancelBuff( OID , 621672 )
end

function lua_kors_recover_flag()
local OID = OwnerID()
local flag = 120064
local NPC 
local X = ReadRoleValue( OID, EM_RoleValue_X )
local Y = ReadRoleValue( OID , EM_RoleValue_Y )
local Z = ReadRoleValue( OID , EM_RoleValue_Z )
local Dir = ReadRoleValue( OID , EM_RoleValue_Dir )
		NPC = CreateObj ( flag , X , Y , Z , dir , 1 )
		MoveToFlagEnabled(NPC,FALSE)
		WriteRoleValue( NPC ,EM_RoleValue_PID , OID )
		AddBuff ( NPC , 621675 , 1 , 300 )
		AddToPartition ( NPC ,0 )
		BeginPlot( NPC ,"lua_kors_recover_flagDo" , 0 )
end

function lua_kors_recover_flagDo()
local OID =  OwnerID()
local room = ReadRoleValue( OID ,EM_RoleValue_RoomID)
local player = ReadRoleValue(OID ,EM_RoleValue_PID)
local pcount = GetPartyID( player , -1 )
local time = 0
	if pcount ~= 0 then
		while time ~=  10  do
			AddBuff ( OID , 621675 , 1 , 30)
			for i = 1 , pcount , 1 do
				local party = GetPartyID(player , i )
				if party ~= 0 then
					if ReadRoleValue(party,EM_RoleValue_RoomID ) == room  then
					SysCastSpellLv(OID,party,498887,1) 
					end
				end
			end
			time =time +1
		Sleep(30)
		end
		if time == 10 then
			DelObj( OID )
		end
	elseif pcount == 0 then
		while time ~= 10  do
		AddBuff ( OID , 621675 , 1 , 30 )
				if ReadRoleValue(player,EM_RoleValue_RoomID ) == room then
					SysCastSpellLv(OID,player,498887,1) 
				end
			time = time+1
		Sleep(30)
		end
		if time == 10 then
		DelObj( OID )
		end
	end
end

function lua_kors_recover_flagCheck()
local OID = OwnerID()
local zone = ReadRoleValue( OID , EM_RoleValue_ZoneID )
	if zone>0 and zone < 100 then
		return TRUE
	elseif zone >= 100 then
		ScriptMessage( OID ,OID , 1,"[SC_CANT_USE_IN_THIS_AREA]",C_SYSTEM)
		return FALSE
	end
end

function lua_kors_thank_skill()		--趕鶴駝
local TID = TargetID()
local OID = OwnerID()
local OrgID=ReadRoleValue(TID , EM_RoleValue_OrgID)
local OrgX = ReadRoleValue( TID, EM_RoleValue_X )
local OrgY = ReadRoleValue( TID , EM_RoleValue_Y )
local OrgZ = ReadRoleValue( TID , EM_RoleValue_Z )
local OrgD = ReadRoleValue( OID , EM_RoleValue_Dir )
local X = OrgX
local Y = OrgY
local Z =OrgZ
local distable=(Rand(4)+1) * 50
local falR = Rand(10)
local lock = ReadRoleValue( TID , EM_RoleValue_Register2)
	if lock == 0 then
		if falR <= 8 then
			if OrgID == 106508 then
				 local flyDir = (math.pi/180)*( OrgD )		--讀取飛行面向
					X = OrgX +(distable*math.cos(flyDir))	--計算X邊長
					Z =OrgZ - (distable*math.sin(flyDir))	--計算Z軸長
					Move(TID,X,Y,Z)				--移動物件
				WriteRoleValue( OID , EM_RoleValue_Register1, 1 )
			else
				ScriptMessage( OID , OID , 1 , "[SC_KORS_THANKS_14]" ,C_SYSTEM)
			end
		elseif falR > 8 then
			if OrgID == 106508 then
				ScriptMessage( OID , OID , 1 , "[SC_KORS_THANKS_26]" , C_SYSTEM)
			else
				ScriptMessage( OID , OID , 1 , "[SC_KORS_THANKS_14]" ,C_SYSTEM)
			end
		end
	end
end

function lua_kors_thank_TestOn()
local OID = OwnerID()
local NPC =0
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		NPC = CreateObjByFlag ( 120038 , 781058 , 0 , 1 )
		MoveToFlagEnabled(NPC,FALSE)
		WriteRoleValue(NPC,EM_RoleValue_IsWalk,1)
		AddToPartition ( NPC ,0 )
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsgEx( oid, 2 , 3 , "[SC_KORS_THANKS_00]" ) 
		end
end

function lua_kors_thank_TestGo()
local OID = OwnerID()
local NPC =0
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local count = SetSearchAllNPC( room )
		for i = 1, count ,1 do
			local NPC = GetSearchResult() 
			local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 120038  then	
			AddBuff ( NPC , 621671 , 1 , 3600 )			
			BeginPlot( NPC , "lua_kors_thank_walk", 0 )
			end
		end
end

function lua_kors_thank_TestEND()
local OID = OwnerID()
local NPC =0
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local count = SetSearchAllNPC( room )
		for i = 1, count ,1 do
			local NPC = GetSearchResult() 
			local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 120038  or OrgID == 106508 or OrgID == 120039 or OrgID == 120036 or OrgID == 120063 then				
				DelObj( NPC)
			end
		end
end

function lua_kors_thank_extra()
local OID = OwnerID()
local NPC =0
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local count = SetSearchAllNPC( room )
		for i = 1, count ,1 do
			local NPC = GetSearchResult() 
			local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 120038  then				
				WriteRoleValue( NPC , EM_RoleValue_Register5 , 1 )
			end
		end
end

function lua_kors_thank_RE()
local OID = OwnerID()
	CancelBuff_NoEvent ( OID , 621669)
	CancelBuff_NoEvent( OID , 621672)
	SetFlag( OID , 546094 , 0)
	SetFlag( OID , 546095 , 0)
	SetFlag( OID , 546096 , 0)
	SetFlag( OID , 546097 , 0)
	SetFlag ( OID , 546102 , 0 )
end