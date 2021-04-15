--初始化世界變數
function Lua_Zone2_WorldPE_Init( Times )		--初始化
	Times = Times or GetWorldVar( "Zone2_WorldPE_Times")+1
	SetWorldVar( "Zone2_WorldPE_Times", Times )	--PE場次
	SetWorldVar( "Zone2_WorldPE_Phase"  , 1 )	--設定階段
	SetWorldVar( "Zone2_WorldPE_Crystal"  , 0 )	--設定水晶
	SetWorldVar( "Zone2_WorldPE_Money_0", 0 )	--設定金錢(固定跳錢)
	SetWorldVar( "Zone2_WorldPE_EndTime", 0 )	--設定休息時間
	SetWorldVar("Zone2_WorldPE_SelectBuffID",0)	--設定最終被選擇的BuffID
	SetWorldVar("Zone2_WorldPE_CtrlBuffTime",0)	--設定最終被看見的buff時間
	SetWorldVar( "SC_BLACKWATER_P3_TIME" , 259200 )	--設定第三階段的時間，3天之久
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 0 )	--設定第三階段的開門階段
	for i=1, #Zone2_WorldPE_Buff do
		SetWorldVar( "Zone2_WorldPE_Money_"..i  , 0 )--設定金錢1,2,3
	end
end
--AC世界事件的主控制器
function Lua_Zone2_WorldPE_ctrl()

	Zone2_WorldPE_Require_1 = 200000000 	--進入第二階段門檻
	Zone2_WorldPE_Require_2 = 26000		--進入第三階段門檻
	Zone2_WorldPE_Buff = {	621995,	--水池增益1
					621996,	--水池增益2
					621997	--509435--水池增益3
				}
	Var_AC1_MainCtrl = OwnerID()
	Var_AC1_NpcGlobal_PH1 = Var_AC1_NpcGlobal_PH1 or {}	--第一階段npc
	Var_AC1_NpcGlobal_PH2 = Var_AC1_NpcGlobal_PH2 or {}	--第二階段npc
	Var_AC1_NpcGlobal_PH3 = Var_AC1_NpcGlobal_PH3 or {}	--第三階段npc
--	Var_AC1_NpcGlobal_PH4 = Var_AC1_NpcGlobal_PH4 or {}	--第四階段npc
--	Var_AC1_NpcGlobal_PH5 = Var_AC1_NpcGlobal_PH5 or {}	--第五階段npc

	if GetWorldVar( "Zone2_WorldPE_Times") == 0 then
		Lua_Zone2_WorldPE_Init()--初始化
	end
	
	local time = 0
	local Phase
	local Phase_Card = 0
	local CurrentPH = 0
	while true do
		Sleep(10)
		Phase = GetWorldVar( "Zone2_WorldPE_Phase");
		time = time+1;
		--捐錢階段
		if Phase == 1 then
			--產生演員
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--系統每20秒進行一次自動累加金錢
			if time%20 == 0 then
				local total = 0
				--累計金額，(只有分流1)
				if lua_ACuseRealZoneID( OwnerID() ) then
					local Rnum=Rand(3)+1
					local Cmoney=GetWorldVar( "Zone2_WorldPE_Money_"..Rnum)+3000
					SetWorldVar( "Zone2_WorldPE_Money_"..Rnum  , Cmoney)
				end
				--計算總金額
				for i=1, #Zone2_WorldPE_Buff do
					total = total + GetWorldVar( "Zone2_WorldPE_Money_"..i )
				end		
				--當總金額達到67000000，134000000時，進行許願池力量釋放 
				if total >=67000000 and GetWorldVar( "Zone2_WorldPE_Money_0")==0 then
					if lua_ACuseRealZoneID( OwnerID() ) then
						--將當前狀態設定給世界變數
						Lua_Zone2_WorldPE_SetBuff()
						SetWorldVar( "Zone2_WorldPE_Money_0", 1 )
					end
				elseif total >=134000000 and GetWorldVar( "Zone2_WorldPE_Money_0")==1 then
					if lua_ACuseRealZoneID( OwnerID() ) then
						--將當前狀態設定給世界變數
						Lua_Zone2_WorldPE_SetBuff()
						SetWorldVar( "Zone2_WorldPE_Money_0", 2 )
					end
				elseif total >= Zone2_WorldPE_Require_1 then
					--錢夠了，進階段
					lua_AC1_ChangePH( 5 )
					time = 0;
				end
				if time%180 == 0 then
					DebugMsg(0,0,"AC1,SysAddmoney,Now the Money is ="..total)
					time = 0;
				end
			end
		--捐水晶階段
		elseif Phase == 2 then
			--產生演員
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--每20秒判斷水晶數量
			if time%20 == 0 then
				if lua_ACuseRealZoneID( OwnerID() ) then
					if GetWorldVar( "Zone2_WorldPE_Crystal") >= Zone2_WorldPE_Require_2 then
						SetWorldVar( "Zone2_WorldPE_Phase"  , 3 )--進入階段3
						time = 0;
					end
				end
			end
		--開門表演階段
		elseif Phase == 3 then
			--產生演員
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--產生第三階段用的npc
			if Phase_Card == 0 then
				cl_Ac1_Blackwater_P3Start()
				Phase_Card = 1
				--開始副本傳送
				time = 0;
			end
		--重置休息階段
		elseif Phase == 4 then
			--每秒扣
			if GetWorldVar( "Zone2_WorldPE_EndTime") == 0 then
				Phase_Card = 0	--=>還原第三階段用
				Lua_Zone2_WorldPE_Init()--初始化
				time = 0;
			else
				--其它分流不做這件事。
				if lua_ACuseRealZoneID( OwnerID() ) then
					SetWorldVar( "Zone2_WorldPE_EndTime", GetWorldVar( "Zone2_WorldPE_EndTime")-1 )
				end
			end
		--1進2表演用階段
		elseif Phase == 5 then
			--產生演員
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--用PID來當表演的開關
			if ReadRoleValue( OwnerID(),EM_RoleValue_PID ) == 0 then
				CallPlot(OwnerID(),"lua_AC1L1conectL2",OwnerID())
				WriteRoleValue( OwnerID(),EM_RoleValue_PID,1 )
				time = 0;
			elseif time%300 == 0 then
				--假如沒表演( 例如剛好重開機 )，就直接把事件送入第二階段
				if lua_ACuseRealZoneID( OwnerID() ) then
						SetWorldVar( "Zone2_WorldPE_Phase"  , 2 )
				end
				WriteRoleValue( OwnerID(),EM_RoleValue_PID,0 ) 
				time=0;
			end
		--當指令被下0時，執行重置
		elseif Phase == 0 then
			Phase_Card = 0	--=>還原第三階段用
			if lua_ACuseRealZoneID( OwnerID() ) then
				Lua_Zone2_WorldPE_Init()
			end
		--置換到其它階段
		else
			--如果不在任何階段，每120s傳一段訊息進來。
			if time%120 == 0 then
				DebugMsg(0,0,"AC1,BREAKING,NOW_THE_PHASE IS："..Phase)
				time = 0 ;
			end
		end
	end
end
--捐錢方法，對話選項的最終傳進選擇與金錢，並加622224這個buff給玩家
function Lua_Zone2_WorldPE_PayMoney( select ,money )
	SetFlag( OwnerID(), 546067, 1 )
		if CheckBuff(OwnerID(),622224)==false then
			AddBuff(OwnerID(),622224,0,-1)
		end
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem29, GetWorldVar( "Zone2_WorldPE_Times") )
	SetWorldVar( "Zone2_WorldPE_Money_"..select  ,  GetWorldVar( "Zone2_WorldPE_Money_"..select )+money )
	DebugMsg(0,0,"AC1,PlayerAddmoney,Money is =")
end
--似乎沒在用
function Lua_Zone2_WorldPE_PayItem()--繳交物資
	local Player = OwnerID()
	local NPC = TargetID()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase")
	SetSpeakDetail( Player,  "Phae = "..Phase..";  EndTime = "..GetWorldVar( "Zone2_WorldPE_EndTime").."; Crystal = "..GetWorldVar( "Zone2_WorldPE_Crystal") )

	if GetWorldVar( "Zone2_WorldPE_EndTime") == 0 then
		AddSpeakOption( Player, Player, "PayMoney_1", "Lua_Zone2_WorldPE_PayMoney_1", 0)
		AddSpeakOption( Player, Player, "PayMoney_2", "Lua_Zone2_WorldPE_PayMoney_2", 0)
		AddSpeakOption( Player, Player, "PayMoney_3", "Lua_Zone2_WorldPE_PayMoney_3", 0)
	end
	
	if Phase == 2 and GetWorldVar( "Zone2_WorldPE_Crystal") < Zone2_WorldPE_Require_2 then
		AddSpeakOption( Player, Player, "Crystal", "Lua_Zone2_WorldPE_PayCrystal", 0)
	end
end

function Lua_Zone2_WorldPE_PayMoney_1()--捐錢
	Lua_Zone2_WorldPE_PayMoney( 1 )
	CloseSpeak(OwnerID())
end

function Lua_Zone2_WorldPE_PayMoney_2()--捐錢
	Lua_Zone2_WorldPE_PayMoney( 2 )
	CloseSpeak(OwnerID())
end

function Lua_Zone2_WorldPE_PayMoney_3()--捐錢
	Lua_Zone2_WorldPE_PayMoney( 3 )
	CloseSpeak(OwnerID())
end

function Lua_Zone2_WorldPE_PayCrystal( count )--捐水晶
	count = count or 200
	SetWorldVar( "Zone2_WorldPE_Crystal"  ,  GetWorldVar( "Zone2_WorldPE_Crystal")+count )
	CloseSpeak(OwnerID())
end
--當金額到達時，對buff狀態進行設定，1是哪種buff,2是buff持續時間。
function Lua_Zone2_WorldPE_SetBuff()
	local buff;
	local money=0;
	local utime=GetSystime(0)
	for i=1, #Zone2_WorldPE_Buff do
		if buff == nil or GetWorldVar( "Zone2_WorldPE_Money_"..i )>money then
			buff = i
			money = GetWorldVar( "Zone2_WorldPE_Money_"..i )
		end
	end
	SetWorldVar("Zone2_WorldPE_SelectBuffID",Zone2_WorldPE_Buff[buff])
	SetWorldVar("Zone2_WorldPE_CtrlBuffTime",utime+43200)
	--60*60*12=43200 執行12小時
end
--刪除捐過水池的旗標，目前沒在用
function Lua_Zone2_WorldPE_Clear()--清除旗標
	for i = 1 , SetSearchAllPlayer(0) do
		SetFlag( GetSearchResult(), 546067, 0 )
	end
end
--進結束階段表演用
function Lua_Zone2_WorldPE_SetEnd( time )--設定世界結束倒數
	time = time or 5
	SetWorldVar( "Zone2_WorldPE_EndTime", time )
	SetWorldVar( "Zone2_WorldPE_Phase"  , 4 )--進入階段4
end

--用來回傳自己是否在分流之中，不是的話回傳true，是的話回傳false
function lua_ACuseRealZoneID( own )
	own = own or OwnerID()
	local RealZoneID = ReadRoleValue( own,EM_RoleValue_RealZoneID )
	if RealZoneID <1000 then
		--DebugMsg(0,0,"AC1,return,readRealZoneID = "..RealZoneID)
		return true
	end
	return false
end
--AC1用來進階段用指令,不帶參數可秀現階段。
function lua_AC1_ChangePH( k )
	WriteRoleValue( Var_AC1_MainCtrl,EM_RoleValue_PID,0 )
	if k == nil then
		local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
		DebugMsg(0,0,"AC1,now the Phase is "..Phase)
		return
	elseif lua_ACuseRealZoneID( OwnerID() ) then		
		SetWorldVar( "Zone2_WorldPE_Phase"  , k )--進入階段
		DebugMsg(0,0,"AC1,Success connect to Phase:"..k)
		return
	end
	DebugMsg(0,0,"AC1,YouAreNotInTheMainZone.")
end
--測試用訊息，顯示所有捐獻金額
function Lua_Zone2_WorldPE_PrintMoney()--顯示捐獻金額
	for i=0, #Zone2_WorldPE_Buff do
		DebugMsg(0,0,"Money_"..i.." = "..GetWorldVar( "Zone2_WorldPE_Money_"..i ) )
	end
end
--測試用，讀出第一階段npc的table的大小
function lua_AC1npcNumTest()
	local num=table.getn(Var_AC1_NpcGlobal_PH1)
	DebugMsg(0,0,"AC1,TEST,PHASE1,NPCNUM："..num)
end
--測試用，讀出現在所設定的階段
function AC1testPhase()
	local 	Phase = GetWorldVar( "Zone2_WorldPE_Phase");
			DebugMsg(0,0,"now the Phase is "..Phase)
end