function LuaS_111827_0()
	if CheckBuff( OwnerID() , 502460 ) == true and CheckFlag(OwnerID(),542228 ) == false then
		if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 and CheckAcceptQuest(OwnerID() , 421604 ) == true then
			SetSpeakDetail( OwnerID(), "[SC_111827_0]"   ); --你就穿著這樣在大街上走？你是白痴啊！
			AddSpeakOption(OwnerID(),TargetID(),"[SC_111827_1]","LuaS_111827_1",0) --我來參加聚會。
		else
			SetSpeakDetail( OwnerID(), "[SC_111827_2]"   ); --你是來參加會議的嗎？不過會議已經開始了，照規定我不能讓任何人進去。
		end
	elseif CheckBuff( OwnerID() , 502460 ) == true and CheckFlag(OwnerID(),542228 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_111827_3]"   ); --會議發生了什麼事啊？我好像聽到吵雜的聲音......該不會你們又吵起來了吧？
	else
		SetSpeakDetail( OwnerID(), "[SC_111827_4]"   ); --這個地方由我們承租下來了，沒事的話快點離開。
	end
end

function LuaI_BlockWall_111827()
	local Guard = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111827 , 150 )
	WriteRoleValue( Guard , EM_RoleValue_Register , OwnerID() )
end

function LuaS_111827_1()
	CloseSpeak(OwnerID())
	Tell( OwnerID() , TargetID() , "[SC_111827_5]" ) --你應該進去再換衣服......算了，快進去吧！
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 666 )
	BeginPlot( TargetID() , "LuaS_111827_2" , 0 )
end

function LuaS_111827_2()
	local Player = TargetID()
	local DBID = ReadRoleValue( Player ,EM_RoleValue_DBID )
	local Zo = {}
	local Flag = 780223
	local Obj = {[0] = 101444 , [1] = 101446 }
	local Wall = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Party = LuaFunc_PartyData(Player)
	local Play = "On"
	local MyFlag = 6
	if Party[0] <= 6 then 
		for i = 1, Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 421604 ) == true and CheckBuff( Party[i]  , 502460 ) == true then
				if Party[i] ~= Player then
					SetPosByFlag( Party[i], Flag , 7-i )
				else
					MyFlag = 7-i
				end
			end
		end
	end
	SetPosByFlag( Player  , Flag , MyFlag )
	sleep(10)
	for i = 1 , 4 , 1 do
		local Dir = GetMoveFlagValue( Flag , i , EM_RoleValue_Dir )
		if i == 3 then
			Zo[i] = CreateObjByFlag( 101445 , Flag , 0 , 1 )
		else
			Zo[i] = CreateObjByFlag( Obj[Rand(2)] , Flag , 0 , 1 )
		end
		SetFightMode( Zo[i] , 0 , 1 , 0 , 0 )
		AddToPartition( Zo[i] , 0 )
		MoveToFlagEnabled( Zo[i] , False)
		WriteRoleValue( Zo[i] , EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( Zo[i] , EM_RoleValue_PID , i )
		WriteRoleValue( Zo[i] , EM_RoleValue_Register , Wall)
		LuaFunc_MoveToFlag(Zo[i], Flag , i ,0 )
		sleep(10)
		SetDir( Zo[i], Dir )
		sleep(Rand(40)+1)
	end
	Zo[5] = 0

	for i = 0 , 28 , 1 do
		if CheckID( Player ) == false then 
			Play = "Off" 
		end
		if GetDistance( Player, Zo[3] ) > 150 or CheckBuff( Player , 502460 ) == false then 
			ScriptMessage( Player , Player , 1 , "[SC_101444_11]" , 0 ) --你怪異的舉動引起了他們的懷疑
			AdjustFaceDir(Zo[3], Player, 0 )
			sleep(10)
			AdjustFaceDir(Zo[4], Player, 0 )
			sleep(30)
			Say( Zo[4] , "[SC_101444_10]" ) --是那名冒險者！
			PlayMotion( Zo[4] , ruFUSION_ACTORSTATE_EMOTE_POINT )
			sleep(30)
			Play = "Off" 
		end
		if Play ~= "On" then
			break
		end
		if i == 0 then
			Say( Zo[3] , "[SC_101444_01]" ) --今天的秘密聚會，目的是請大家回報這段時間打探到關於「傳說之劍-血之禮讚」的消息。
			PlayMotion( Zo[3] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		if i == 3 then
			Say( Zo[4] , "[SC_101444_02]" ) --根據賢者之眼內部眼線的情報，瑪爾索思委託了一名冒險者幫助他們尋找血之禮讚，而我們已經設法積極阻撓那名冒險者的行動。
			PlayMotion( Zo[4] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		if i == 8 then
			Say( Zo[3] , "[SC_101444_03]" ) --很好，絕對不能讓賢者之眼破壞我們的計畫！
			PlayMotion( Zo[3] , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		end
		if i == 10 then
			Say( Zo[2] , "[SC_101444_04]" ) --關於海波拉高原那些石碑的研究，有一個連賢者之眼與那名冒險者都不知道的重大發現。
			PlayMotion( Zo[2] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		if i == 15 then
			Say( Zo[1] , "[SC_101444_05]" ) --我們事先發現了一塊石碑，並且已經將石碑藏匿起來。根據上頭記載，推測在封印之戰之後，有人試圖再度喚醒沈睡的血之禮讚。
			PlayMotion( Zo[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		if i == 20 then
			Say( Zo[3] , "[SC_101444_06]" ) --嗯……這或許意味著，血之禮讚並未隨著封印之戰一起落入虛界之中……
			PlayMotion( Zo[3] , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		end
		if i == 23 then
			Say( Zo[2] , "[SC_101444_07]" ) --是的，所以我已經派人到歐蘇勒湖底下的遺跡去尋找新的線索。
			PlayMotion( Zo[2] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		if i == 26 then
			Zo[5] = CreateObjByFlag( 101446 , Flag , 0 , 1 )
			SetFightMode( Zo[5] , 0 , 1 , 0 , 0 )
			WriteRoleValue( Zo[5] , EM_RoleValue_IsWalk , 0 )
			AddToPartition( Zo[5] , 0 )
			MoveToFlagEnabled( Zo[5] , False)
			LuaFunc_MoveToFlag(Zo[5], Flag , 5 ,0 )
			WriteRoleValue( Zo[5] , EM_RoleValue_PID , 5 )
			WriteRoleValue( Zo[5] , EM_RoleValue_Register , Wall)
			for i = 1 , 4 , 1 do
				AdjustFaceDir(Zo[i], Zo[5], 0 )
			end
		end
		if i == 27 then
			PlayMotion( Zo[5] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		end
		if i == 28 then
			Say( Zo[5] , "[SC_101444_08]" ) --報告，我們派去歐蘇勒湖的人遭到襲擊，並且被奪走了衣服！
			sleep(15)
			Say( Zo[3] , "[SC_101444_09]" ) --衣服被奪走？那麼這邊這一位是…？
			AdjustFaceDir(Zo[3], Player, 0 )
			sleep(10)
			AdjustFaceDir(Zo[4], Player, 0 )
			sleep(30)
			Say( Zo[4] , "[SC_101444_10]" ) --是那名冒險者！
			PlayMotion( Zo[4] , ruFUSION_ACTORSTATE_EMOTE_POINT )
			sleep(30)
			if ReadRoleValue(Player , EM_RoleValue_DBID ) == DBID then
				for i = 1 , Party[0] , 1 do
					if CheckFlag( Party[i] , 542228 ) == false and CheckAcceptQuest(Party[i] , 421604 ) == true then
						SetFlag(Party[i] , 542228 , 1 )
					end
				end
			end
		end
		sleep( 10 )
	end
	for i = 1 , 5 , 1 do
		WriteRoleValue( Zo[i] , EM_RoleValue_IsWalk , 0 )
		SetFightMode( Zo[i] , 1 , 1 , 0 , 1 )
		if CheckID( TargetID() ) == true then
			SetAttack( Zo[i] , TargetID() )
		end
		BeginPlot(Zo[i] , "LuaS_111827_Dead" , 0 )
	end
	local Check = "Reset"
	while 1 do
		Check = "Reset"
		for i = 1 , 5 , 1 do
			if CheckID( Zo[i] ) == True and ReadRoleValue( Zo[i] , EM_RoleValue_IsNPC ) == 1 then
				Check = "No"
			end
		end
		if Check == "Reset" then
			break
		end
		Sleep( 30 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_111827_Dead()
	local Wall = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local POS = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	local Flag = 780223
	local Disable = "NO"
	local Count = 0
	WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 180 )

	while 1 do
		if GetDistance( OwnerID(), Wall ) < 35 or GetDistance( OwnerID(), TargetID() ) < 100 then
			Lua_CancelAllBuff( OwnerID()) 
			SetStopAttack(OwnerID() )
			SetFightMode( OwnerID() , 0 , 1 , 0 , 0 )
			ClearHateList( OwnerID() , -1 )
			LuaFunc_MoveToFlag( OwnerID(), Flag , POS ,0 )
			SetFightMode( OwnerID() , 1 , 1 , 0 , 1 )
		end

		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		elseif Disable == "YES" then
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0  then
				DelObj( OwnerID() )
			end
			break
		end

		sleep(1)

		if Count < 150 then
			Count = Count + 1
		else
			Disable = "YES" 
		end
	end
end