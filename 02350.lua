function lua_sprinrain_kors_EV1_00() --劇情開頭
local  key1=CheckFlag(OwnerID(),545001)
local  key2=CheckFlag(OwnerID(),545002)
local  key3=CheckFlag(OwnerID(),545003)
	DW_CancelTypeBuff( 68,  OwnerID() )
		if key3 == FALSE and key1 == FALSE then 
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_00]")
			local piece = CountBodyItem(OwnerID(),209557)
			if piece >= 1 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_18]","lua_sprinrain_kors_EV1_collectchange",0)
			end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_01]","lua_sprinrain_kors_EV1_01",0)
		elseif key1 == TRUE and key2 == FALSE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_05]")
			local piece = CountBodyItem(OwnerID(),209557)
			if piece >= 1 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_18]","lua_sprinrain_kors_EV1_collectchange",0)
			end
		elseif key2 == TRUE and key3 == FALSE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_05]")
			local piece = CountBodyItem(OwnerID(),209557)
			if piece >= 1 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_18]","lua_sprinrain_kors_EV1_collectchange",0)
			end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_04]","lua_sprinrain_kors_EV1_02",0)
		elseif key3 == TRUE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_08]")
			local piece = CountBodyItem(OwnerID(),209557)
			if piece >= 1 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_18]","lua_sprinrain_kors_EV1_collectchange",0)
			end
		end
end
function lua_sprinrain_kors_EV1_01()--給蛋交付亂跑的拉比兔。
	SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_03]","lua_sprinrain_kors_EV1_EGGGIVE",0)
end

function lua_sprinrain_kors_EV1_02()
	--	local SC = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	--	if SC >= 3 then
		local count = ReadRoleValue(OwnerID(), EM_LuaValueFlag_UseItem44 )  -- 6.0.1 新增useitem 類型 作為任務計次條件
	--	say(OwnerID(), "count ="..count)
		if count >= 3 then
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_06]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_07]","lua_sprinrain_kors_EV1_03",0)
		else
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_05]")
		end
end

function lua_sprinrain_kors_EV1_03()
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		CloseSpeak(OwnerID())
		GiveBodyItem(OwnerID(),209544,3)
		GiveBodyItem(OwnerID(),204218,2)

	--	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
		WriteRoleValue(OwnerID(), EM_LuaValueFlag_UseItem44, 0  )  -- 6.0.1 新增useitem 類型 作為任務計次條件
		local count = ReadRoleValue(OwnerID(), EM_LuaValueFlag_UseItem44 )  -- 6.0.1 新增useitem 類型 作為任務計次條件
	--	say(OwnerID(), "count ="..count)

		SetFlag(OwnerID(),545003,1)
	else	
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
		SetPlot(TargetID(),"touch","Lua_kors_gre2fes_peace_0",30)
	end
end

function lua_sprinrain_kors_EV1_EGGGIVE()-- take egg
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(),209543,3)
	SetFlag(OwnerID(),545001,1)
	else	
	SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_sprinrain_kors_EV1_00",0)
	end
end

function lua_sprinrain_kors_EV1_eggrabit()--接蛋
	BeginPlot(OwnerID(),"lua_sprinrain_kors_EV1_rabitmove",0)
	SetPlot(OwnerID(),"touch","lua_sprinrain_kors_EV1_RabitEgg",30)
end

function lua_sprinrain_kors_EV1_rabitmove()
	while TRUE do
		lua_DavisRandMove(OwnerID(),-4451,-1,4615,500)
		local Stime = Rand(200)+250
		Sleep(Stime)
	end
end	

function lua_sprinrain_kors_EV1_RabitEgg() 
	local egg = CountBodyItem(OwnerID(),209543)
	if egg >=1 then
		SetPlot(TargetID(),"touch","",0)
		BeginPlot(OwnerID(),"lua_sprinrain_kors_EV1_RabitEggG",0)
		BeginPlot(TargetID(),"lua_sprinrain_kors_EV1_RabitEggH",0)
	else
	--	local sc= ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	--	if sc>=3 then

		local count = ReadRoleValue(OwnerID(), EM_LuaValueFlag_UseItem44 )  -- 6.0.1 新增useitem 類型 作為任務計次條件
	--	say(OwnerID(), "count ="..count)
		if count >= 3 then
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_09]",C_SYSTEM)
		end
	end	
end

function lua_sprinrain_kors_EV1_RabitEggH()
		Hide(OwnerID())
		local Mflag = Rand(40)
		lua_DavisRandMove(OwnerID(),-4451,-1,4615,500)
		Sleep(100)
		Show(OwnerID(),0)
		SetPlot(OwnerID(),"touch","lua_sprinrain_kors_EV1_RabitEgg",30)
end

function lua_sprinrain_kors_EV1_RabitEggG()
	local egg = CountBodyItem(OwnerID(),209543)
	if egg >=1 then
		DelBodyItem(OwnerID(),209543,1)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_10]",C_SYSTEM)
		AddRoleValue(OwnerID(),EM_LuaValueFlag_UseItem44, 1)

		local count = ReadRoleValue(OwnerID(), EM_LuaValueFlag_UseItem44 )  -- 6.0.1 新增useitem 類型 作為任務計次條件
	--	say(OwnerID(), "count ="..count)
		if count >= 3 then
			SetFlag(OwnerID(),545002,1)
		end
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_11]",C_SYSTEM)
	end
end

function lua_sprinrain_kors_EV1_eategg()--吃蛋
local tmpN=Rand(100)
	if tmpN <=15 then
		AddBuff(OwnerID(),509557,1,600)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_12]",C_SYSTEM)
	elseif tmpN > 15 and tmpN <=30 then
		AddBuff(OwnerID(),509558,1,600)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_12]",C_SYSTEM)
	elseif tmpN >30  and tmpN <= 45 then
		AddBuff(OwnerID(),509559,1,600)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_12]",C_SYSTEM)
	elseif tmpN >45 and tmpN <= 60 then
		AddBuff(OwnerID(),509560,1,600)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_12]",C_SYSTEM)
	elseif tmpN >60 and tmpN<= 80 then
		AddBuff(OwnerID(),509562,1,-1)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_13]",C_SYSTEM)
	elseif tmpN > 80 then
		SysCastSpellLv(OwnerID(),OwnerID(),497548,1) 
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_14]",C_SYSTEM)
	end
local tmpE = Rand(100)
	if tmpE <=20 then
		GiveBodyItem(OwnerID(),209557,1)
	end
end

function lua_sprinrain_kors_EV1_eggbron()
	SetPlot(OwnerID(),"touch","lua_sprinrain_kors_EV1_egg",40)
end

function lua_sprinrain_kors_EV1_egg()
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			SetPlot( TargetID(),"touch","",0 )
			GiveBodyItem(OwnerID(),209299,1)
			Hide(TargetID())
			DelObj(TargetID())
		else
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_111490_DIALOG10]",C_SYSTEM)
		end
end

function lua_sprinrain_kors_EV1_findhideE()
	local npcm=SetSearchRangeInfo( OwnerID() , 250 )
	local Sa=0
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 118177 then
					if CheckDistance( OwnerID(), npcde, 90 ) == TRUE then 
						local egg = LuaFunc_CreateObjByObj (  118179, npcde )	
						SetModeEx(egg,EM_SetModeType_Revive,FALSE)
						BeginPlot(egg,"lua_sprinrain_kors_EV1_eggbron",0)
						DelBodyItem(OwnerID(),209544,1)
						AddToPartition( egg, 0 )	
						local flg2 = Rand(40)
						SetPosByFlag( npcde, 780939 , flg2 )
						Sa = Sa+1
					end
				end
		end
	if Sa == 0 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_KORSEV1_16]",C_SYSTEM)
	end
end
	
function lua_sprinrain_kors_EV1_collectchange()
	local collect = CountBodyItem(OwnerID(),209557)
	SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_KORSEV1_17]")
	if collect >= 1 then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_KORSEV1_19]","lua_sprinrain_kors_EV1_ch",0)
	end
end

function lua_sprinrain_kors_EV1_ch()
local collect = CountBodyItem(OwnerID(),209557)
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(),209544,collect)
	DelBodyItem(OwnerID(),209557,collect)
	else
	SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]")--您的背包空間不足，請清理一下再來吧。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_sprinrain_kors_EV1_00",0)
	end
end

function lua_sprinrain_kors_EV1_RE()
	SetFlag(OwnerID(),545001,0)
	SetFlag(OwnerID(),545002,0)
	SetFlag(OwnerID(),545003,0)
	Lua_Hao_ResetColdown(OwnerID(),497546)
end
	