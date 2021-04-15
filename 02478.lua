function lua_ft_kors_begin() --NPC開始劇情
	BeginPlot(OwnerID(),"LuaN_miyon_action02",0)
	BeginPlot(OwnerID(),"lua_ft_kors_OnC",0)
end

function lua_ft_kors_OnC() --活動開啟與否判斷迴圈
	while true do	
	local min = GetSystime(2) --抓系統時間(分鐘)
	local hr = GetSystime(1)-- 抓小時
		if  hr == 13 or   hr == 16  or hr == 19 or  hr == 22  then
			if min == 0 then --0分時執行出現劇情
			local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p ==0 then	
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				BeginPlot(OwnerID(),"lua_ft_kors_create",0)
				end				
			end
			if min == 59 then --刪除劇情
				local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p ~= 0 then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				BeginPlot(OwnerID(),"lua_ft_kors_FESclose",0)
				end
			end
		end
	Sleep(600)
	end
end

function lua_ft_kors_create() --開始活動創NPC
	for i = 1,50 do
		local ft = {}
		ft[i] =	CreateObjByFlag( 113753,781011, i , 1 )
			SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
			SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
			SetRandMove(ft[i],100,100,50) 
			AddToPartition( ft[i], 0 )	
	end
end

function lua_ft_kors_FESclose() --活動結束關NPC
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 113753
	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				if Name == NPC then  --若為陣列中的值
						DelObj( ID)
				end
			end
		end
	end
end


function lua_ft_kors_00()--for劇情開頭
DW_CancelTypeBuff( 68,  OwnerID() )-- 消除騎乘狀態
local key = CheckFlag(OwnerID(),545526) 
local key2 = CheckFlag(OwnerID(),545527) 
local key3 = CheckFlag(OwnerID(),545528)
local key4 = CheckFlag(OwnerID(),545564)
local open = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if open ~= 0 then --活動時間
		if key ==FALSE and key2 == FALSE  then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_00]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_01]","lua_ft_kors_01",0)
		elseif key == TRUE and key2 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_05]")
		elseif key2 == TRUE and key3 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_05]")
				if key4 == TRUE then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_15]","lua_ft_kors_AW",0)
				end
		elseif key3 == TRUE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_16]")
		end
	elseif open == 0 then --非活動時間
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_04]")
	end
end

function lua_ft_kors_01() --說明劇情
	SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_03]","lua_ft_kors_Start",0)
end

function lua_ft_kors_Start() --活動開始
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),545526,1)
	GiveBodyItem(OwnerID(),240041,1)
	AddBuff(OwnerID(),620804,1,180)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_06]",C_SySTEM)
end


function lua_ft_kors_false()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local npcm = SetSearchAllNPC( RoomID )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 113753 then
					if ReadRoleValue(npcde,EM_RoleValue_PID) == OwnerID() then
							DelObj(npcde)
						local ft  = {}
						local c =Rand(40)
							ft[i] =CreateObjByFlag( 113753,781011, c , 1 )
							SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
							SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
							SetRandMove(ft[i],100,100,50) 
							AddToPartition( ft[i], 0 )	
					end
				end
		end
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FT_FES_KORS_20]",C_SySTEM)
		SetFlag(OwnerID(),545527,1)
		SetFlag(OwnerID(),545528,1)
		SetFlag(OwnerID(),545564,1)
end

function lua_ft_kors_SQchek()
	while TRUE do
		local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		if CheckID( player ) == FALSE then
			local ft  = {}
				local c =Rand(40)
				ft[i] =CreateObjByFlag( 113753,781011, c , 1 )
				SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
				SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
				SetRandMove(ft[i],100,100,50) 
				AddToPartition( ft[i], 0 )	
		Sleep(5)
			DelObj(OwnerID())
		end
	Sleep(50)
	end
end

function lua_ft_kors_Nautilus() --鸚鵡螺使用
local tar = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
local count = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
local loot = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if tar ~= 113753 then --目標錯誤
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_07]",C_SySTEM)
	elseif tar == 113753 then --目標正確
		local OID =OwnerID()
		if loot == 0 then --非搶奪
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
			PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/french_horn.mp3",FALSE)
			AddBuff(TargetID(),620803,1,180)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,count+1)
			WriteRoleValue(TargetID(),EM_RoleValue_PID,OID)
			BeginPlot(TargetID(),"lua_ft_kors_SQchek",0)
		elseif loot ~= 0 and loot ~= OID then --搶奪來的
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
			PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/french_horn.mp3",FALSE)
			AddBuff(TargetID(),620803,1,180)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,count+1)
			WriteRoleValue(TargetID(),EM_RoleValue_PID,OID)
			local lootcount =ReadRoleValue(loot,EM_RoleValue_Register+1)
			WriteRoleValue(loot,EM_RoleValue_Register+1,lootcount-1)
			BeginPlot(TargetID(),"lua_ft_kors_SQchek",0)
		elseif loot ~= 0 and loot == OID then
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_19]",C_SySTEM) 
		end	
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FT_FES_KORS_08]",C_SySTEM)		
			SetFollow(TargetID(),OwnerID())
			BeginPlot(OwnerID(),"lua_ft_kors_check",10)
	end	
end

function lua_ft_kors_check() --檢察是否滿5隻
local count = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	if count >= 4 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_09]",C_SySTEM)
		SetFlag(OwnerID(),545527,1)
	end
end

function lua_ft_kors_catch() --回報任務NPC
local key = CheckFlag(OwnerID(),545526) 
local key2 = CheckFlag(OwnerID(),545527) 
local key3 = CheckFlag(OwnerID(),545564)
local open = ReadRoleValue(TargetID(),EM_RoleValue_PID)
local report = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	if open == 0 then
		if key ==FALSE and key2 == FALSE  then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_10]")
		elseif key == TRUE and key3 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_11]")
			if report >= 4 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_12]","lua_ft_kors_report",0)
			end
		elseif key3 == TRUE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_18]")
		end
	elseif open ~= 0 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_04]")
	end
end

function lua_ft_kors_report() --回報
local count = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
		SetFlag(OwnerID(),545564,1)
	if count <= 7 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_13]")
		BeginPlot(OwnerID(),"lua_ft_kors_Del",0)
	elseif count > 7 and count <= 12 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_14]")
		BeginPlot(OwnerID(),"lua_ft_kors_Del",0)
		GiveBodyItem(OwnerID(),530776,1)
	elseif count >12 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_14]")
		BeginPlot(OwnerID(),"lua_ft_kors_Del",0)
		GiveBodyItem(OwnerID(),530725,1)
 	end
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			CancelBuff_NoEvent(OwnerID(),620804)
end	

function lua_ft_kors_Del() --回報後刪除重生
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local npcm = SetSearchAllNPC( RoomID )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 113753 then
					if ReadRoleValue(npcde,EM_RoleValue_PID) == OwnerID() then
							DelObj(npcde)
						local ft  = {}
						local c =Rand(40)
							ft[i] =CreateObjByFlag( 113753,781011, c , 1 )
							SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
							SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
							SetRandMove(ft[i],100,100,50) 
							AddToPartition( ft[i], 0 )	
					end
				end
		end
end	

function lua_ft_kors_AW() --獎勵
	SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_17]")
	GiveBodyItem(OwnerID(),240059,5)
	DelBodyItem(OwnerID(),240041,1)
	SetFlag(OwnerID(),545528,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
end

function lua_ft_kors_Topen() --for testopen
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 119224
	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				if Name == NPC then  --若為陣列中的值
					WriteRoleValue(ID,EM_RoleValue_PID,1)
					BeginPlot(OwnerID(),"lua_ft_kors_create",0)
				end
			end
		end
	end
end

function lua_ft_kors_Tclose() --for testclose
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 119224
	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				if Name == NPC then  --若為陣列中的值
					WriteRoleValue(ID,EM_RoleValue_PID,0)
					BeginPlot(OwnerID(),"lua_ft_kors_FESclose",0)
				end
			end
		end
	end
end

function lua_ft_kors_Redo() --redo use
	local Owner = OwnerID()
	SetFlag(Owner, 545526,0)
	SetFlag(Owner, 545527,0)
	SetFlag(Owner, 545528,0)
	SetFlag(Owner, 545564,0)
	SetFlag(Owner, 541322, 0) --2012紛紛
	SetFlag(Owner, 548188, 0 ) --2013童話劇團—小紅帽
	CancelBuff(Owner,620804)
	DelBodyItem(Owner,240041,1)
	WriteRoleValue(Owner,EM_RoleValue_Register+1,0)
	WriteRoleValue(Owner,EM_RoleValue_Register+2,0)
--	BeginPlot(Owner,"lua_ft_kors_Del",0)
	BeginPlot(Owner,"Lua_na_2012Fairy_Reset",0 )--奈
end

function lua_ft_REplay() -- for 重置券
	SetFlag(OwnerID(),545525,0)
	BeginPlot(OwnerID(),"lua_ft_kors_Redo",0)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FT_FES_KORS_21]",C_SySTEM)
end