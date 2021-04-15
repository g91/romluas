function Lua_na_2013_Flower_hide() --重置的時候將物件的值寫為0
	local Owner = OwnerID() --隱藏物件
	Lua_na_2012_Flower_RESETNPC()
	LuaN_miyon_action02()
end

function Lua_na_2013_Flower_NPC() --121719 艾芙兒對話劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --艾芙兒

	if CountBodyItem( Owner, 242082 ) >=1 and CheckFlag( Owner , 547360) == false then  --若玩家身上有花粉
		SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC9]" ) --	[$playername]，我就知道你值得託付！
		DelBodyItem( Owner , 242082 , 1 )	
		GiveBodyItem( Owner , 209161, 2 ) 
		SetFlag( Owner , 547358 , 0 )
		SetFlag( Owner , 547359 , 0 )
		SetFlag( Owner , 547360 , 1 ) --給旗標
		if CountBodyItem( Owner , 242083) > 0 or CountBodyItem( Owner , 242084) > 0 then
			DelBodyItem( Owner , 242083, 1 ) --刪除玩家身上的淨水
			DelBodyItem( Owner , 242084, 1 ) --刪除玩家身上的聖水
		end
		DesignLog( Owner , 121719 , "Complete" )
		Lua_Festival_02_All(Owner)

	elseif CheckFlag( Owner , 547359) == TRUE then --如果有接任務
		if CheckFlag( Owner , 547358 ) == false and CountBodyItem( Owner , 242083) <1 then
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC6]" ) --怎麼這麼不小心把灌溉用的淨水弄丟了呢	
			GiveBodyItem( Owner , 242083,1)
		elseif CheckFlag( Owner , 547358 ) == true and CountBodyItem( Owner , 242084) < 1 then
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC6]" ) --怎麼這麼不小心把灌溉用的淨水弄丟了呢？
			GiveBodyItem( Owner , 242083,1)
			SetFlag( Owner , 547358 , 0 ) --清除花精的旗標
		elseif CountBodyItem( Owner , 242084) == 1 then --如果玩家有聖水
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC5]") --咦？花粉呢？
			AddSpeakOption( Owner, Owner ,"[SO_110989_1]", "Lua_na_2013_Flower_Giveup", 0 ) --有聖水，完成任務
		else
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC8]" )
		end

	elseif CheckFlag( Owner, 547360 ) == true then --玩家已完成任務
		SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC1]" )
	else
		SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC2]")
		AddSpeakOption( Owner , Owner , "[SC_423911_02]" , "Lua_na_2013_Flower_NPC2", 0 )
		DesignLog( Owner , 121719 , "ACCEPT" )
	end
end
		 

function Lua_na_2013_Flower_NPC2()  --接受任務
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC4]" ) --	[$playername]，我就知道你值得託付！	
	GiveBodyItem( Owner , 242083, 1 )--給聖水
	Setflag( Owner , 547359, 1 )
end


function Lua_na_2013_Flower_Giveup() --玩家提早結束活動
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	SetSpeakDetail( Owner ,"[SC_2013_FLOWER_NPC3]")
	SetFlag( Owner , 547358 , 0 )
	SetFlag( Owner , 547359 , 0 )
	SetFlag( Owner , 547360 , 1 )
	CancelBuff(Owner , 623869)
	CancelBuff(Owner , 623870)
	GiveBodyItem( Owner , 724509 , 1) --給藥水
	Lua_Festival_02_All(Owner)
end

function Lua_na_2013_Flower_Fairy() --花精的對話劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	if CheckFlag( Owner , 547359) == true and CountBodyItem( Owner , 242083 ) >=1 then
		SetSpeakDetail( Owner ,"[SC_2013_FLOWER_NPC10]")
--		AddBuff( Owner , 623870 , 0 , 600 ) 
		DelBodyItem( Owner , 242083 , 1 )
		GiveBodyItem( Owner , 242084, 1 )
	elseif CountBodyItem( Owner, 242084) >=1 then --身上有聖水
		SetSpeakDetail( Owner, "[SC_2013_FLOWER_NPC12]") --去吧！用你手中的聖水與虔誠的心，向藍玫瑰祈求幸福吧！
	else
		SetSpeakDetail( Owner ,"[SC_2013_FLOWER_NPC11]")	 -- …………………………。
	end
end


function Lua_na_2013_Flower_stair1() --階梯的初始劇情
	local Owner = OwnerID() --階梯
	local Target = TargetID()
	local Time = 0
	local OrgID = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
--	local Sec = { 80 , 80 , 50 }

	if OrgID == 121703 then
		for i = 0 , 9 do  --10秒
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				ChangeObjID( Owner , 121703) 				
			end
			sleep(10)
		end
		ChangeObjID( Owner , 121716) --改變為隱形物件
		WriteRoleValue( Owner , EM_RoleValue_PID , 1)

	elseif OrgID == 121704 then
		if PID == 0 then
			ChangeObjID( Owner , 121716) --改變為隱形物件
			WriteRoleValue( Owner , EM_RoleValue_PID , 2)
		elseif PID == 3 then
			for i = 0 , 10 do  --11秒
				Time = Time + 1
				if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
					ChangeObjID( Owner , 121704)				
				end
			sleep(10)
			end	
			ChangeObjID( Owner , 121716) --改變為隱形物件
			WriteRoleValue( Owner , EM_RoleValue_PID , 3)
		end					
	else
		if PID ~= 5 then --不是花精靈所在的階梯
			if PID == 0 then
				Sleep(10)
				ChangeObjID( Owner , 121716) --改變為隱形物件
				WriteRoleValue( Owner , EM_RoleValue_PID , 4)
			else
				for i = 0 , 9 do  --10秒
					Time = Time + 1
					if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
						ChangeObjID( Owner , 121705) 			
					end
					sleep(10)
				end		
				ChangeObjID( Owner , 121716) --改變為隱形物件
				WriteRoleValue( Owner , EM_RoleValue_PID , 4)
			end	
		end
	end	
end



function Lua_na_2013_Flower_stair2() --隱藏階梯的初始劇情
	local Owner = OwnerID()
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
	local Time = 0
	SetModeEx( Owner , EM_SetModeType_Obstruct, false )			--阻擋	
	SysCastSpelllv( Owner , Owner , 850529 , 0)

	if PID == 1 then
		for i = 0 , 13 do  --14秒
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121703)
		WriteRoleValue( Owner , EM_RoleValue_PID , 1)
	elseif PID == 2 then		
		for i = 0 , 6 do  --7秒
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121704)
		WriteRoleValue( Owner , EM_RoleValue_PID , 3)
	elseif PID == 3 then
		for i = 0 , 12 do  --13秒
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121704)
		WriteRoleValue( Owner , EM_RoleValue_PID , 3)	
	elseif PID == 4 then
		for i = 0 , 13 do  --14秒
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121705)
		WriteRoleValue( Owner , EM_RoleValue_PID , 4)		
	end		
end



function Lua_na_2013_Flower_pos()
	local Owner = OwnerID()
	local Target = TargetID()
	local X, Y, Z , Dir =  Lua_Hao_Return_Coordinate( Target )
	SetPos ( Target , X , Y- 1 , Z , Dir )
end



--623869 看見玫瑰與第二段階梯的buff
function Lua_na_2013_Flower() --藍玫瑰產生劇情
	local Owner = OwnerID()
	AddBuff( Owner , 623868 , 0 , -1) --讓玫瑰有特效
	SetPlot( Owner , "touch" , "Lua_na_2013_Flower_1" , 30 ) --設定玫瑰的觸碰劇情
end


function Lua_na_2013_Flower_1() --觸碰劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --玫瑰

	if CountBodyItem( Owner , 242084 ) >= 1 then --如果玩家身上有聖水，而且確實報名活動
		if CheckFlag( Owner , 547359) == true then --檢查玩家是否有報名
			ScriptMessage( Owner , Owner, 3 , "[SC_2013_FLOWER_NPC13]" , 0 ) --快將花粉交給艾芙兒吧！
			DelBodyItem( Owner , 242084, 1 )
			GiveBodyItem( Owner , 242082 , 1 )
		else
			ScriptMessage( Owner , Owner, 3 , "[SC_2013_FLOWER_NPC15]" , 0 ) --你遺忘了[121719]所委託的事情，快向[121719]再次確認！
		end
	else
		ScriptMessage( Owner , Owner, 1 , "[SC_2013_FLOWER_NPC14]" , 0 ) --身上沒有聖水，無法取得花粉。
	end
end



----------------------------------------
--測試，刪除NPC
----------------------------------------

function Lua_test_delNPC()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 300)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local Stairs = {  121703, 121704, 121705 , 121708, 121709, 121710, 121716 }  --刪除所有階梯

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( Stairs) , 1 do
					if Name == Stairs[j] then  --若為陣列中的值
						Delobj( ID) --阻擋牆
					end
				end
			end
		end
	end
	Say( Owner , "Clear!" )
end



function Lua_na_2013_Flower_reset() --重置指令
	local Owner = OwnerID()
	local Flag = { 547358 , 547359 , 547360}
	for i = 1 , #Flag do
		SetFlag( Owner , Flag[i] , 0 )		
	end 
end



function Lua_na_2012_Flower_RESETNPC() --重置階梯的劇情
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 300)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local Stairs = {  121703, 121704, 121705 , 121716 }  --重置階梯劇情

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( Stairs) , 1 do
					if Name == Stairs[j] then  --若為陣列中的值
						if ReadRoleValue( ID , EM_RoleValue_PID) ~= 5 then
							WriteRoleValue( ID , EM_RoleValue_PID , 0 ) 
						end
					end
				end
			end
		end
	end
--	Say( Owner , "Reset!" )
end