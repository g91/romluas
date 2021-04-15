function lua_kors_dancefer_EV2_EVILAXE()
	AddBuff(OwnerID(),509283,1,-1)
	BeginPlot(OwnerID(),"lua_kors_dancefer_EV2_AXEmove",0)
	SetPlot(OwnerID(), "dead" , "lua_kors_dancefer_EV2_count" , 30 )
end

function lua_kors_dancefer_EV2_AXEmove()
	while TRUE do
		local flg = Rand(22)+23
		local sec = Rand(30)*10
		LuaFunc_MoveToFlag( OwnerID(), 780320 , flg , 30 )
		Sleep(sec)
	end
end


function lua_kors_dancefer_EV2_hansin()
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FEVER_BUFFDISAPPEAR]",C_SYSTEM)	
	CancelBuff(OwnerID(),509389)
end

function lua_kors_dancefer_EV2_hansinDX()
	local tmpS = FN_CountBuffLevel(OwnerID(),509381)
	if tmpS >= 10 then
	AddBuff(OwnerID(),509241)
	end
end

function lua_kors_dancefer_EV2_hansinEnd()
	CancelBuff(OwnerID(),509382)
	CancelBuff(OwnerID(),509241)
	SetFlag(OwnerID(),544865,1)
end

function lua_kors_dancefer_EV2_00()--劇情開頭
if CheckFlag(OwnerID(),544866) == FALSE then
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_KICK_00]")
	if CheckFlag(OwnerID(),544864) == FALSE then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_KICK_01]","lua_kors_dancefer_EV2_01",0)
	end
local score = CheckBuff(OwnerID(),509389)
	if CheckFlag(OwnerID(),544865)==FALSE and CheckFlag(OwnerID(),544864)==TRUE then
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_KICK_11]")
	elseif CheckFlag(OwnerID(),544865)==TRUE and CheckFlag(OwnerID(),544864)==TRUE then
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_KICK_12]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_KICK_02]","lua_kors_dancefer_EV2_giftGive",0)
	end
else
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_KICK_08]")
end
end


function lua_kors_dancefer_EV2_giftGive()
	CloseSpeak(OwnerID())
local score = FN_CountBuffLevel(OwnerID(),509389)
	if score <=10 then	
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_DANCEFES_KORS_KICK_15]",C_SYSTEM)	
		CancelBuff(OwnerID(),509389)
		SetFlag(OwnerID(),544866,1)
	elseif score >10 and score <30 then 
		GiveBodyItem(OwnerID(),209270,1)
		CancelBuff(OwnerID(),509389)
		SetFlag(OwnerID(),544866,1)
	elseif score>=30 and score <40 then
		GiveBodyItem(OwnerID(),209270,2)
		CancelBuff(OwnerID(),509389)
		SetFlag(OwnerID(),544866,1)
	elseif score>=40 and score <60 then 
		GiveBodyItem(OwnerID(),209270,3)
		CancelBuff(OwnerID(),509389)
		SetFlag(OwnerID(),544866,1)
	elseif score>=60 then
		GiveBodyItem(OwnerID(),209270,4)
		CancelBuff(OwnerID(),509389)
		SetFlag(OwnerID(),544866,1)
	end
end

function lua_kors_dancefer_EV2_01()
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_KICK_03]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_KICK_07]","lua_kors_dancefer_EV2_change",0)
end

function lua_kors_dancefer_EV2_change()
	CloseSpeak(OwnerID())
local sex = ReadRoleValue(OwnerID(),EM_RoleValue_SEX)
	if sex == 1 then 
	SetFlag(OwnerID(),544864,1)
	GiveBodyItem(OwnerID(),209297,1)
	elseif sex == 0 then
	SetFlag(OwnerID(),544864,1)
	GiveBodyItem(OwnerID(),209298,1)
	end	
end

function lua_kors_dancefer_EV2_bornAXE()--生怪
	while true do
		local min = GetSystime(2) --抓系統時間(分鐘)
		local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)				

				if min == 29 then --.30分時廣播，執行出現劇情
					BeginPlot( OwnerID(), "lua_kors_dancefer_EV2_bron",0 )					
				end
	
				if min == 00 then --刪除劇情
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Count = SetSearchAllNPC( RoomID )
					local Obj
					local AXEnoTable = {105469,105470,105471}

					if  Count ~= 0 then
						for i=1 , Count , 1 do
							local ID = GetSearchResult()
							Obj=Role:New(ID)
							if Obj:IsNPC() == true then
								local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
								for j = 1 , table.getn( AXEnoTable ) , 1 do
									if Name ==AXEnoTable[j] then  --若為陣列中的值
									BeginPlot( OwnerID(), "lua_kors_dancefer_EV2_del", 0 )	--刪除
									end
								end
							end
						end
					end
				end
			Sleep(600)  	
	end
	
end

function lua_kors_dancefer_EV2_bron()
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 2 , "[SC_DANCEFES_KORS_KICK_04]" ) 	-- (0 自己 1 區域 2 全部玩家 )。
		end
		sleep( 600) 
		BeginPlot( OwnerID(), "lua_kors_dancefer_EV2_star" ,0 ) --出現在雷蹄之丘
end


function lua_kors_dancefer_EV2_star()
local AXEtable={105469,105470,105471}
local AXEnoTable={20,1,1}
	for i = 1,20,1 do --生第一波怪
		local flg = Rand(22)+23
		local AXE={}
		if i <= 15 then 
		AXE[i]=CreateObjByFlag(AXEtable[1] ,780320 , flg ,1) 
			SetModeEx(AXE[i],EM_SetModeType_Revive,TRUE)
	--		SetRandMove(AXE[i],100,100,50) 
			AddToPartition( AXE[i], 0 )	
		elseif i >=13 and i < 20 then
		AXE[i]=CreateObjByFlag(AXEtable[2] ,780320 , flg ,1) 
			SetModeEx(AXE[i],EM_SetModeType_Revive,TRUE)
	--		SetRandMove(AXE[i],150,150,50) -- 
			AddToPartition( AXE[i], 0 )	
		elseif i == 20 then
		AXE[i]=CreateObjByFlag(AXEtable[3] ,780320 , flg ,1) -- 
			SetModeEx(AXE[i],EM_SetModeType_Revive,TRUE)
	--		SetRandMove(AXE[i],170,200,55) 			
			AddToPartition( AXE[i], 0 )			
		end	
	end
end

function lua_kors_dancefer_EV2_count()
local AXEtable={105469,105470,105471}
local AXEnoTable={1,4,6}
local NPC =ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)
local score = FN_CountBuffLevel(TargetID(),509389)
		for i = 1,3 do
			if NPC == AXEtable[i] then
			CancelBuff(TargetID(),509389)
			BeginPlot(TargetID(),"lua_kors_dancefer_EV2_countScore",0)
			AddBuff(TargetID(),509389,score+AXEnoTable[i],-1)	
			end
		end
end

function lua_kors_dancefer_EV2_countScore()
local score = FN_CountBuffLevel(OwnerID(),509389)
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_DANCEFES_KORS_KICK_14]"..score+1,C_SYSTEM)
end

function lua_kors_dancefer_EV2_del() 
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , "[SC_DANCEFES_KORS_KICK_06]" )
	end
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = {105469,105470,105471}

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID)
					end
				end
			end
		end
	end
end
		
function lua_kors_dancefer_EV2_skcheck()
local tag = CheckBuff(TargetID(),509283)
	if tag == TRUE then
		return TRUE
	else
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_DANCEFES_KORS_KICK_13]",C_SYSTEM)
		return FALSE
	end
end
	
function  lua_dancefes_2011_EV2_DEAD()
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_DANCEFES_KORS_ARR_10]",C_SYSTEM)
end
function lua_kors_dancefer_EV2_hansinCK()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)	
		if ZoneID == 15 then
			return TRUE 
		elseif ZoneID ~= 15 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FEVER_CHECKPOINT]",C_SYSTEM)
			return FALSE
		end
end