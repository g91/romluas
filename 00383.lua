function LuaI_B3Door_Zone2A_0() --設定門的初始劇情，同時重置全域變數
	SetModeEX( OwnerID() , EM_SetModeType_Mark , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone100_B3_Door[RoomID] = {} 
	Ver_Zone100_B3_Door[RoomID]["Door"] = OwnerID() --傳遞自己的ID
	Ver_Zone100_B3_Door[RoomID]["State"] = 0 --將檢查用的變數歸零

end

function LuaI_100_B2Keeper() --設定傀儡法師的死亡劇情，放在初始劇情中
	SetPlot( OwnerID() ,"dead" , "LuaI_B2Keeper_Dead" , 40 )
end

function LuaI_B2Keeper_Dead() --傀儡法師在死亡時會檢查其他傀儡法師死了幾個，死了四個(加自己)就觸發招喚督爾克

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = Ver_Zone100_B3_Door[RoomID]["Door"]
	local Check = Ver_Zone100_B3_Door[RoomID]["State"]
	Check = Check + 1
	Ver_Zone100_B3_Door[RoomID]["State"] = Check
	if Check >= 4 and Check < 100 then --加上判斷，讓開過的門不執行這段劇情
		Check = 100
		Ver_Zone100_B3_Door[RoomID]["State"] = Check
		local Player = LuaFunc_PartyData(TargetID())
		for i = 1 , Player[0] , 1 do
			if CheckAcceptQuest( Player[i] , 420109) == true and CheckFlag( Player[i] , 540205) == false then
				SetFlag( Player[i] , 540205 , 1 )
			end 
		end
		BeginPlot( Door , "LuaI_B3Door_Zone2A_1" , 0 )
	end
	
	return true	
end

function LuaI_B3Door_Zone2A_1() --產生督爾克的劇情

	local Tollker = CreateObjByFlag( 100073,780022,8,1) --產生督爾克並設定死亡劇情
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	AddToPartition( Tollker , Zone )
	SetPlot( Tollker , "dead" , "LuaI_B2BOSS_Dead" , 40 ) -- 設定死亡劇情
	ScriptMessage( OwnerID(), -1 ,1, GetString("SAY_100073_1"), 0 ); --/*屍妖督爾克大喊：破壞安卡莉亞大人法陣的入侵者！就讓督爾克來教訓你們吧！
	CastSpell( Tollker , Tollker , 490101 )


end

function LuaI_B2BOSS_Dead() --督爾克死的時候開啟門
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100073,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)		--紀錄死亡

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = Ver_Zone100_B3_Door[RoomID]["Door"]
	BeginPlot( Door , "LuaI_B3Door_Zone2A_2" , 0 ) -- 因為開啟動作需要Sleep，不能放在死亡劇情，故用呼叫的
	return true	
end

function LuaI_B3Door_Zone2A_2() --讓門撥放開啟的動作
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep( 40 )
end