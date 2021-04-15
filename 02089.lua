function lua_kors_testevt1_01()
	SetSpeakDetail( OwnerID(), "[SC_TESTEVT1_01]" )--活動意義介紹
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TESTEVT1_05]","lua_kors_testevt1_02", 0 )--關於節分祭
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TESTEVT1_06]","lua_kors_testevt1_03", 0 )--關於惠方捲	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TESTEVT1_04]", "lua_kors_testevt1_04",0)--我想兌換惠方捲
end

function lua_kors_testevt1_02()
	SetSpeakDetail( OwnerID(), "[SC_TESTEVT1_02]")--關於節分祭
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_kors_testevt1_01", 0 )--回到上一層
end

function lua_kors_testevt1_03()
	SetSpeakDetail( OwnerID(), "[SC_TESTEVT1_03]")--關於惠方捲
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]","lua_kors_testevt1_01", 0 )--回到上一層
end

function lua_kors_testevt1_04()
	local item = CountBodyItem( OwnerID(), 206642 )
	if item >= 1 then
		CloseSpeak( OwnerID())
		GiveBodyItem( OwnerID(), 206643, 1 )--獲得惠方捲
		DelBodyItem( OwnerID(), 206642, 1 )--兌換券消除
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_kors_testevt1_01", 0 )--回到上一層
	end
end

function  Lua_kors_gre2fes_WIND00()--npc劇情起頭
	DW_CancelTypeBuff( 68,  OwnerID() )
	if Lua_Mounts_Copilot( OwnerID() ) == TRUE then
		if CheckFlag(OwnerID(),545025) == FALSE then 
			SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_00]")
			if CheckFlag(OwnerID(),545024) == FALSE and CheckFlag(OwnerID(),545025) == FALSE then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_01]","Lua_kors_gre2fes_01",0) --參加活動
			end
			if CheckFlag(OwnerID(),545024) == TRUE  and CheckFlag(OwnerID(),545025) == FALSE then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_02]","Lua_kors_gre2fes_change",0) --交出風之力換獎勵
			end
		else
			SetSpeakDetail(OwnerID(),"[]")
		end
	else
		CloseSpeak(OwnerID())
	end
end

function Lua_kors_gre2fes_WIND01()--講解
	SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_03]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_04]","Lua_kors_gre2fes_02",0)
end

function Lua_kors_gre2fes_02WIND()--出題跟變身
	CloseSpeak(OwnerID())
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 ) 
local  c =Rand(30)
local m = Rand(15)+16
	if c >= 0 and c<11 then --冷風之力
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC]"..m,C_SYSTEM)
	AddBuff(OwnerID(),509595,1,-1)
	AddBuff(OwnerID(),509564,1,-1)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 1 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, m ) 
	SetFlag(OwnerID(),545024,1)
	elseif c>=11 and c <21 then --暖風之力
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC]"..m,C_SYSTEM)
	AddBuff(OwnerID(),509595,1,-1)
	AddBuff(OwnerID(),509565,1,-1)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 2 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, m ) 
	SetFlag(OwnerID(),545024,1)
	elseif c>= 21 then --星風之力
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC]"..m,C_SYSTEM)
	AddBuff(OwnerID(),509595,1,-1)
	AddBuff(OwnerID(),509566,1,-1)	
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 3 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, m ) 
	SetFlag(OwnerID(),545024,1)
	end
end

function Lua_kors_gre2fes_changeWIND()--交換風之力
	local Q = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	local A = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		if Q == 1 then --冷風之力
			local SCORE = FN_CountBuffLevel(OwnerID(),509564)
			if SCORE >= A+5 then
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509564)
				GiveBodyItem(OwnerID(),209561,1)
				SetFlag(OwnerID(),545025)
			elseif SCORE >=A and SCORE < A+3 then
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509564)
				GiveBodyItem(OwnerID(),209561,1)
				SetFlag(OwnerID(),545025)
			elseif SCORE < A then		
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509564)
				SetFlag(OwnerID(),545025)
			end
		elseif Q == 2 then --暖風之力
			local SCORE = FN_CountBuffLevel(OwnerID(),509565)
			if SCORE >= A+5 then
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509565)
				GiveBodyItem(OwnerID(),209561,1)
				SetFlag(OwnerID(),545025)
			elseif SCORE >=A and SCORE < A+3 then
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509565)
				GiveBodyItem(OwnerID(),209561,1)
				SetFlag(OwnerID(),545025)
			elseif SCORE < A then		
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509565)
				SetFlag(OwnerID(),545025)
			end
		elseif Q == 3 then --星風之力
			local SCORE = FN_CountBuffLevel(OwnerID(),509566)
			if SCORE >= A+5 then
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509566)
				GiveBodyItem(OwnerID(),209561,1)
				SetFlag(OwnerID(),545025)
			elseif SCORE >=A and SCORE < A+3 then
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509566)
				GiveBodyItem(OwnerID(),209561,1)
				SetFlag(OwnerID(),545025)
			elseif SCORE < A then		
				SetSpeakDetail(OwnerID(),"[]")
				CancelBuff(OwnerID(),509566)
				SetFlag(OwnerID(),545025)
			end
		end
	else
	SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","Lua_kors_gre2fes_00",0)
	end
end

function Lua_kors_gre2fes_wind()
		SetPlot( OwnerID() , "range" , "Lua_kors_gre2fes_windPower" , 30 )
end

function Lua_kors_gre2fes_windPower()--風之力觸碰劇情
local ORGID =ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if ORGID == 118253 then
		if CheckBuff(OwnerID(),509566) == TRUE then
		 local WIND =FN_CountBuffLevel(OwnerID(),509566)
			CancelBuff(OwnerID(),509566)
			AddBuff(OwnerID(),509566,WIND+1,-1)
			BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)
		else 
			if CheckBuff(OwnerID(),509565) == TRUE then
				 local WIND =FN_CountBuffLevel(OwnerID(),509565)
				CancelBuff(OwnerID(),509565)
				AddBuff(OwnerID(),509565,WIND-1,-1)
				BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)	
			elseif CheckBuff(OwnerID(),509564) == TRUE then
		 		local WIND =FN_CountBuffLevel(OwnerID(),509564)
				CancelBuff(OwnerID(),509564)
				AddBuff(OwnerID(),509564,WIND-1,-1)
				BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)
			end
		end
	elseif ORGID == 118256 then
		if CheckBuff(OwnerID(),509565) == TRUE then
		 local WIND =FN_CountBuffLevel(OwnerID(),509565)
			CancelBuff(OwnerID(),509565)
			AddBuff(OwnerID(),509565,WIND+1,-1)
			BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)	
		else 
			if CheckBuff(OwnerID(),509564) == TRUE then
				 local WIND =FN_CountBuffLevel(OwnerID(),509564)
				CancelBuff(OwnerID(),509564)
				AddBuff(OwnerID(),509564,WIND-1,-1)
				BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)	
			elseif CheckBuff(OwnerID(),509566) == TRUE then
		 		local WIND =FN_CountBuffLevel(OwnerID(),509566)
				CancelBuff(OwnerID(),509566)
				AddBuff(OwnerID(),509566,WIND-1,-1)
				BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)	
			end
		end
	elseif ORGID == 118259 then
		if CheckBuff(OwnerID(),509564) == TRUE then
		 local WIND =FN_CountBuffLevel(OwnerID(),509564)
			CancelBuff(OwnerID(),509564)
			AddBuff(OwnerID(),509564,WIND+1,-1)
			BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)	
		else 
			if CheckBuff(OwnerID(),509565) == TRUE then
				 local WIND =FN_CountBuffLevel(OwnerID(),509565)
				CancelBuff(OwnerID(),509565)
				AddBuff(OwnerID(),509565,WIND-1,-1)
				BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)		
			elseif CheckBuff(OwnerID(),509564) == TRUE then
		 		local WIND =FN_CountBuffLevel(OwnerID(),509564)
				CancelBuff(OwnerID(),509564)
				AddBuff(OwnerID(),509566,WIND-1,-1)
				BeginPlot(TargetID(),"Lua_kors_gre2fes_windHide",0)	
			end
		end
	end
end

function Lua_kors_gre2fes_windHide()
	Hide(OwnerID())
	Sleep(50)
	Show(OwnerID())
end

function Lua_kors_gre2fes_windCreate()--生怪
	while true do
		BeginPlot( OwnerID(), "Lua_kors_gre2fes_windBron",0 )					
		Sleep(1200)
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Count = SetSearchAllNPC( RoomID )
		local Obj
		local WINDTable = {118253,118256,118259}
		if  Count ~= 0 then
			for i=1 , Count , 1 do
				local ID = GetSearchResult()
				Obj=Role:New(ID)
				if Obj:IsNPC() == true then
					local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
					for j = 1 , table.getn( WINDTable ) , 1 do
						if Name ==WINDTable[j] then  --若為陣列中的值
						BeginPlot( OwnerID(), "Lua_kors_gre2fes_windDel", 0 )	--刪除
						end	
					end
				end
			end
		end	
	end
	
end

function Lua_kors_gre2fes_windBron()
local WINDTable={118253,118256,118259}
	for i = 1,61 do --生風之力
		local color = Rand(30)+1
		local WIND={}
		if color <= 11 then 
		 WIND[i]=CreateObjByFlag(WINDTable[1] ,780936 , i ,1) 
			SetModeEx(WIND[i],EM_SetModeType_Revive,FALSE)
			AddToPartition( WIND[i], 0 )
		end	
		if color >11 and color <=21 then
		WIND[i]=CreateObjByFlag(WINDTable[2] ,780936, i ,1) 
			SetModeEx(WIND[i],EM_SetModeType_Revive,FALSE)
			AddToPartition( WIND[i], 0 )	
		end
		if color > 21 then
		WIND[i]=CreateObjByFlag(WINDTable[3] ,780936 , i ,1) 
			SetModeEx(WIND[i],EM_SetModeType_Revive,FALSE)
			AddToPartition( WIND[i], 0 )			
		end	
	end
end

function Lua_kors_gre2fes_windDel()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = {118253,118256,118259}

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


