-----------------2012花神節-----------------------
--免中控了，隨時可以玩。
--一天可以玩一次免費這樣
----------------------------------------------------

function Lua_kors_flowerS_Vash()											--威席
local player = OwnerID()
local NPC = TargetID()
local Free = CheckFlag(player, 546183)
local FreePlayed =CheckFlag (player, 546184)
local FreeEVD = CheckFlag(player,546187)
local played =CheckFlag(player, 546185)
local Ticket = CheckFlag(player,546186)
local SPitem = 241084

	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS00]")							--對話
	AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS01]","Lua_kors_flowerS_manual",0)			--進入規則講解
	if played == FALSE and  FreePlayed == FALSE then
		AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS03]","Lua_kors_flowerS_Check",0)		--遊玩
	elseif played == TRUE  then
		AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS22]","Lua_kors_flowerS_AW",0)		--領獎
	end

	if FreeEVD == FALSE then
		if Ticket == FALSE and Free == TRUE then		
			AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS07]","Lua_kors_flowerS_FRee",0)	--免費每日
		elseif FreePlayed == TRUE and CountBodyItem(player,SPitem) == 0 then
			AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS10]","Lua_kors_flowerS_FRAW",0)	--免費每日領獎
		end
	end	
end

function Lua_kors_flowerS_manual()										--規則說明
local player = OwnerID()
local NPC = TargetID()

	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS02]")
	AddSpeakOption(player,NPC,"[SC_111352_2]","Lua_kors_flowerS_Vash",0)
	AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS03]","Lua_kors_flowerS_Check",0)		--遊玩
end

function Lua_kors_flowerS_Check()								--購票遊玩
local player = OwnerID()
local NPC = TargetID()
	if CheckBuff(player,622023) == FALSE then
	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS04]")
	AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS05]","Lua_kors_flowerS_Ticket",0)
	elseif CheckBuff(player,622023) == TRUE then
	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS28]")
	end
end

function Lua_kors_flowerS_Ticket()								--購票執行
local player = OwnerID()
local NPC = TargetID()
local CASH = 202903
	if CountBodyItem(player,CASH) ~= 0 then
		CloseSpeak(player)
		SetFlag(player,546186,1)
		AddBuff(player,622023,1,-1)
		DelBodyItem(player,CASH,1)
	else
		SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS06]")
		AddSpeakOption(player,NPC,"[SC_111352_2]","Lua_kors_flowerS_Vash",0)
	end
end

	SetPlot( TargetID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
function Lua_kors_flowerS_AW()								--獎勵
local player = OwnerID()
local NPC = TargetID()
local Score = ReadRoleValue(player,EM_RoleValue_Register1)
local played = 546185
local ticket = 209161
local ITEM = 725757
	if Score ~= 0 then
	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS12][$SETVAR1="..Score.."]")
	SetFlag(player,played,0)
		if Score >0 and Score <=10 then
			GiveBodyItem(player,ITEM,1)
			GiveBodyItem(player,Ticket , 1)
		elseif Score>10 and Score<= 40 then
			GiveBodyItem(player,ITEM,2)
			GiveBodyItem(player,Ticket,2)
		elseif Score > 40 and Score <= 50 then
			GiveBodyItem (player,ITEM,2)
			GiveBodyItem(player,Ticket,3)
		elseif Score >50 then
			GiveBodyItem(player,ITEM,2)
			GiveBodyItem(player,Ticket,5)
			GiveBodyItem(player,530875,1)
		end
	AddSpeakOption(player,NPC,"[SC_111352_2]","Lua_kors_flowerS_Vash",0)
	elseif Score == 0 then
	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS29]")
	SetFlag(player,played,0)
	AddSpeakOption(player,NPC,"[SC_111352_2]","Lua_kors_flowerS_Vash",0)
	end
end

function Lua_kors_flowerS_FRee()								--免費票
local player = OwnerID()
local NPC = TargetID()

	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS08]")
	AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS09]","Lua_kors_flowerS_FTicket",0)

end

function Lua_kors_flowerS_FTicket()
local player =OwnerID()
local NPC = TargetID()

		CloseSpeak(player)
		SetFlag(player,546186,1)
		AddBuff(player,622023,1,-1)

end

function Lua_kors_flowerS_FRAW()								--每日任務
local player = OwnerID()
local NPC = TargetID()
local Score = ReadRoleValue(player,EM_RoleValue_Register1)
local played = 546185
local SPitem = 241084

	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS11][$SETVAR1="..Score.."]")
	GiveBodyItem(player,SPitem,1)

end

function Lua_kors_flowerS_WolfWood()							--沃夫得
local player = OwnerID()
local NPC = TargetID()
local Free = CheckFlag(player, 546183)
local FreePlayed =CheckFlag (player, 546184)
local FreeEVD = CheckFlag(player,546187)

	if FreeEVD == FALSE then								--每日解前
		if FreePlayed== FALSE  and Free == FALSE then
		SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS13]")
		AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS14]","Lua_kors_flowerS_Trust",0)
		else
		SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS18]")
			if CountBodyItem(player,241084) ~= 0 then	
			AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS19]","Lua_kors_flowerS_EVD",0)
			end
		end
	elseif FreeEVD == TRUE then								--每日解後
		SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS23]")
	end

end

function Lua_kors_flowerS_Trust()								--聽每日，開始
local player =OwnerID()
local NPC = TargetID()
	
	SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS15]")
	AddSpeakOption(player,NPC,"[SC_FLOWERFES_KORS_RS16]","Lua_kors_flowerS_TrustSt",0)

end

function Lua_kors_flowerS_TrustSt()								--得到免費每日資格
local player =OwnerID()
local NPC = TargetID()
local FreeKey =546183
	CloseSpeak(player)
	ScriptMessage(NPC,player,0,"[SC_FLOWERFES_KORS_RS17]",0)
	SetFlag(player,FreeKey,1)
end

function Lua_kors_flowerS_EVD()								--免費領獎結束
local player = OwnerID()
local NPC = TargetID()
local Gift = 241084
local EVD = 546187
local FreePlayed = 546184
local ticket = 209161
	if CountBodyItem(player,Gift) ~= 0 then
		SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS20]")
		SetFlag(player,EVD,1)
		SetFlag(player,FreePlayed,0)
		GiveBodyItem(player,Ticket,2)
		DelBodyItem(player,Gift,1)
	else
		SetSpeakDetail(player,"[SC_FLOWERFES_KORS_RS21]")
	end
end

function Lua_kors_flowerS_playCon()
local play = OwnerID()
	SetPlot(play,"touch","Lua_kors_flowerS_Star",10)
end

function Lua_kors_flowerS_Star()								--GameStar
local player = OwnerID()
local ShotBAR = TargetID()
local ShotOrgID = ReadRoleValue(ShotBAR,EM_RoleValue_OrgID)
local playKey = CheckFlag(player,546186)	
local RoseBuff =622024
local Ticket =622023
	if playKey == FALSE then
		ScriptMessage(ShotBAR,player,1,"[SC_FLOWERFES_KORS_RS24]",C_SYSTEM)
	elseif playKey == TRUE then
		SetPlot(ShotBAR,"touch","",0)
		WriteRoleValue(player,EM_RoleValue_Register1,0)
		AddBuff(player,RoseBuff,1,60)
		KORS_FirstPersonSee(player,"ON")
		SetFlag(player,546186,0)
		CancelBuff(player, Ticket)
		WriteRoleValue(ShotBAR,EM_RoleValue_PID,player)
		BeginPlot(ShotBAR,"Lua_kors_flowerS_GameIng",0)
	end
end




function Lua_kors_flowerS_GameIng()						--氣球迴圈
local con = OwnerID()
local ConOid = ReadRoleValue(con ,EM_RoleValue_OrgID)
local MonFlag = {781097,781098,781099}
local time = 0
local Player = ReadRoleValue(con,EM_RoleValue_PID)
local UseFlag	
local mon = {120384,120385,120386}
local TAG

	if ConOid == 120391 then
		UseFlag = MonFlag[1]
	elseif ConOid == 120392 then
		UseFlag = MonFlag[2]
	elseif ConOid == 120393 then
		UseFlag = MonFlag[3]
	end

	while time<= 60 do
		if time%10 == 0 then
		local monNum = Az_RND_Ary(0,16,7)	
		local King = Rand(99)
		local count = table.getn(monNum)
			for born = 1 , count , 1 do
			local monR = Rand(99)
				if born == 1 and King >=70 then
					TAG= CreateObjByFlag(mon[3],UseFlag,monNum[born],1)
					BeginPlot(TAG,"Lua_kors_flowerS_Mon",0)
					SetModeEx( TAG, EM_SetModeType_ShowRoleHead, TRUE )		--頭像框
					AddToPartition(TAG,0)
				end

				if monR >= 50 then
					TAG = CreateObjByFlag(mon[2],UseFlag,monNum[born],1)
					SetModeEx( TAG, EM_SetModeType_ShowRoleHead, TRUE )		--頭像框
					BeginPlot(TAG,"Lua_kors_flowerS_Mon",0)
					AddToPartition(TAG,0)
				else
					TAG = CreateObjByFlag(mon[1],UseFlag,monNum[born],1)
					SetModeEx( TAG, EM_SetModeType_ShowRoleHead, TRUE )		--頭像框
					BeginPlot(TAG,"Lua_kors_flowerS_Mon",0)
					AddToPartition(TAG,0)
				end
			end
		end					
	time = time+1
	Sleep(10)
	end
local Free = CheckFlag(Player,546183)
local Gift = 241084
	if Free == TRUE then
		SetFlag(Player,546183,0)
		SetFlag(player,546184,1)
		KORS_FirstPersonSee(player,"Off")
		BeginPlot(con,"Lua_kors_flowerS_playCon",0)
	else
		SetFlag(Player,546185,1)
		KORS_FirstPersonSee(player,"Off")
		BeginPlot(con,"Lua_kors_flowerS_playCon",0)		
	end
end


	
function Lua_kors_flowerS_Mon()
local mon =OwnerID()
local time = 0
	while TRUE do
	if time >= 10 then DelObj(mon) end
	time = time+1
	Sleep(10)
	end
end		

function Lua_kors_flowerS_RoseCK()
local player = OwnerID()
local TAG = TargetID()
	if TAG == 120384 or TAG == 120385 or TAG == 120386 then
		return TRUE
	else
		return FALSE
	end
end

function Lua_kors_flowerS_RoseSH()
local player = OwnerID()
local Tag = TargetID()
local Miss =Rand(99)
local gsc = 0
	if Miss <= 70 then
	local Score = ReadRoleValue(player,EM_RoleValue_Register1)
	local ORGID = ReadRoleValue(TAG,EM_RoleValue_OrgID)

			if ORGID == 120384 then
			DelObj(TAG)
			gsc = 1
			elseif ORGID == 120385 then
			DelObj(TAG)
			gsc = 2
			elseif ORGID == 120386 then
			DelObj(TAG)
			gsc = 4
			end
		WriteRoleValue(player,EM_RoleValue_Register1,Score+gsc)
		local NSC = ReadRoleValue(player,EM_RoleValue_Register1) 
		ScriptMessage(player,player,1,"[SC_FLOWERFES_KORS_RS26][$SETVAR1="..NSC.."]",C_SYSTEM)
	else
		ScriptMessage(player,player,1,"[SC_FLOWERFES_KORS_RS27]",C_SYSTEM)
	end
end	

function Lua_kors_flowerS_Re()
local player = OwnerID()
	SetFlag(player,546187,0)
end	

function Lua_kors_flowerS_Score(intSC)
local player = OwnerID()
	WriteRoleValue(player,EM_RoleValue_Register1,intSC)
end