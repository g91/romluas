function LuaI_TheThiefKing_DoorEnter()--入口的劇情
	SetPlot( OwnerID() , "touch" , "LuaI_TheThiefKing_DoorEnter_1" , 50 )
end

function LuaI_TheThiefKing_DoorExit()--出口的劇情
--	Hide( OwnerID() )
end

function LuaI_TheThiefKing_DoorEnter_1()
	if CheckFlag( OwnerID() , 542127) == true or CheckCompleteQuest( OwnerID() , 421465 ) == true then
		ScriptMessage( TargetID(), 0, 0,GetString("SC_111368_16"), 1 ) 
		SetPlot( TargetID() , "touch" , "" , 0 )
		Hide(TargetID())
	else
		ScriptMessage( TargetID(), 0, 0,GetString("SC_111368_0"), 1 ) --看來似乎需要完成某個條件才能開啟這扇門。
	end
end

function LuaS_TheThiefKing_Exit() --傳送到外面的劇情
	SetPlot( OwnerID() , "Range" , "LuaS_ZONE251_OUT" , 50 )
end

function LuaS_ZONE251_OUT()
	ChangeZone( OwnerID() , 10 , 0 , -38264, -129, -3176, 270 );
end

function LuaI_ZONE251_Enter() --傳送到裡面的劇情
	SetPlot( OwnerID() , "Range" , "LuaI_ZONE251_Enter_2" , 50 )
end

function LuaI_ZONE251_Enter_2()
	if ChangeZone( OwnerID() , 251 , -1 , 1429 , 41, 1068, 270 )then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),251,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_111463_0() --寶箱上的劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111374 , 250 , 0)
	local Exit = LuaFunc_SearchNPCbyOrgID(  OwnerID()  , 111375 , 250 , 0)
	Hide( Exit )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , Door )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 2 , Exit )
	SetPlot(OwnerID(),"Range" , "LuaI_TheThiefKing_Treasure_1" , 50 )
end
--叫出節目主持人
function LuaI_TheThiefKing_Treasure_1()
	ScriptMessage( TargetID(), 0, 0,GetString("SC_111368_17"), 1 ) 
	SetPlot(TargetID(),"Range" , "" , 0 )
	Hide( TargetID() )
	BeginPlot(TargetID(), "LuaI_TheThiefKing_Treasure_2" , 0 )
end

function LuaI_TheThiefKing_Treasure_2()
	local ThiefKing = 111368
	local Flag = 780095
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local ThiefKing = CreateObjByFlag( ThiefKing, Flag , 0 , 1 );
	local Party = LuaFunc_PartyData(TargetID())
	local Game
	local State
	local Torch = {}
	local Door = {}

	Torch[1] = CreateObjByFlag( 111369, Flag , 1 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 1 , Torch[1] )
	Torch[2] = CreateObjByFlag( 111370, Flag , 2 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 2 , Torch[2] )
	Torch[3] = CreateObjByFlag( 111371, Flag , 3 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 3 , Torch[3] )
	Torch[4] = CreateObjByFlag( 111372, Flag , 4 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 4 , Torch[4] )
	Torch[5] = CreateObjByFlag( 111373, Flag , 5 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 5 , Torch[5] )

	Door["IN"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 6 , Door["IN"] )
	Door["Out"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 7 , Door["Out"] )

	WriteRoleValue( ThiefKing  , EM_RoleValue_Register + 9 , 3 )
	AddToPartition( ThiefKing , RoomID )

	while 1 do --檢查範圍內沒活著的玩家就開門
		local Player = SearchRangePlayer (Thiefking, 250 )
		Game = "OVER"
		for i = 0 , table.getn(Player) , 1 do --有玩家在範圍內活著就OK

			if Player[i] == -1 then
				break
			end

			if ReadRoleValue( Player[i] , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Player[i], EM_RoleValue_IsPlayer ) == 1 then
				if CheckID(Player[i]) == true and ReadRoleValue( Player[i], EM_RoleValue_IsDead ) == 0 then
					Game = "OK"
					WriteRoleValue( ThiefKing  , EM_RoleValue_Register + 8 , Player[i] )
				end
			end
		end
		if Game == "OVER" then
			Hide(Door["IN"])
		end
		sleep(10)
	end

end

--節目主持人的對話內容
function LuaS_TheThiefKing_0()

	local State = ReadRoleValue( TargetID() , EM_RoleValue_Register + 9 )
	if CheckFlag( OwnerID() , 540505 ) == true or CheckCompleteQuest( OwnerID() , 421080 ) == true then
		if State  >= 9 then 
			SetSpeakDetail( OwnerID(), GetString("SC_111368_1") ); --如果想要更多的寶藏，就去世界上尋找吧！
		else
			if State == 3 then 
				SetSpeakDetail( OwnerID(), GetString("SC_111368_2") ); --歡迎來到我的寶藏庫，盜賊們；我是你們的王薩斯柯特，你既然能夠得到我的鑰匙，我就允許你獲得我的寶藏，但你必須通過我的試煉。
			elseif State == 5  then 
				SetSpeakDetail( OwnerID(), GetString("SC_111368_3") );--你準備好繼續接受挑戰了嗎？
			elseif State  == 7  then 
				SetSpeakDetail( OwnerID(), GetString("SC_111368_4") );--這是最後的挑戰了，我可是很期待的。
			else
				SetSpeakDetail( OwnerID(), State)
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111368_5") , "LuaS_TheThiefKing_1", 0 ); --開始吧！
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111368_6")); --歡迎來到我的寶藏庫，盜賊們；但必須擁有我的黃金鑰匙，才有取得寶藏的資格。
	end
end

function LuaS_TheThiefKing_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_TheThiefKing_Play" , 0 )
end