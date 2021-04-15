
---------------------------測試用

function LuaS_422359_11()
	ZonePQ_ValueGroup_Drama[1]  = 59
end

----------------------------------------------符文包	
function LuaS_422359_9()
	local Result = DW_Rand(100)
--	Say(OwnerID(),"BagItem's Rate: "..Result )
	if	Result >60	then
		if	Lua_DW_RuneBag(6,1,3) 	then	UseItemDestroy()	end
		return
	end
	if	Result > 0	then
		if	DW_Rand(2) == 1	then
			if	Lua_SafeGive(OwnerID(),200819,10) 	then	UseItemDestroy()	end
		else
			if	Lua_SafeGive(OwnerID(),201060,10) 	then	UseItemDestroy()	end
		end
		return
	end
end

function LuaS_422359_10()
	local Result = DW_Rand(100)
--	Say(OwnerID(),"BagItem's Rate: "..Result )
	if	Result >98	then
		if	Lua_DW_RuneBag(11,4,2) 	then	UseItemDestroy()	end
		return
	end
	if	Result >60	then
		if	Lua_DW_RuneBag(11,1,3) 	then	UseItemDestroy()	end
		return
	end
	if	Result > 0	then
		if	DW_Rand(2) == 1	then
			if	Lua_SafeGive(OwnerID(),200820,10) 	then	UseItemDestroy()	end
		else
			if	Lua_SafeGive(OwnerID(),201061,10) 	then	UseItemDestroy()	end
		end
		return
	end
end


-----------------------------------------------

function LuaS_422359_0()


	ZonePQ_ValueGroup_Drama[1] = 0 -- 階段控制器(全域)
	local Num = 60 -- 要進入下一階的怪的數量
	local Army = {0} --裝入產生怪的編號 以利控制 一開始裝入一個零避免無窮迴圈
	local Done = 0 -- 是否成功建怪
	local Total = 0 -- 當前怪的總數
	local Con_Total = 5 -- 預設場上怪的總數
	local Now = 0 --即時處理
	local Default_Space = 10 -- 預設間隔
	local Space = 0  -- 正常生怪倒數
	local Buffer = 0  --緩衝器
	local MaxBuffer = 4 --緩衝極限
	local Need = 0	--生怪需求
	local Bulletin = 0
	local MobList = {102157,102142,102158}
	local RandPosition = 0
	local SPMob = 0

	while true do
		sleep(10) -- 每秒循環一次
		for i=0,Num,5  do
			if	ZonePQ_ValueGroup_Drama[1] == i	then
				if	Bulletin ==1	then	break	end --避免重複
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_7]".. ZonePQ_ValueGroup_Drama[1].."/"..Num  , C_YELLOW )
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_422359_7]".. ZonePQ_ValueGroup_Drama[1].."/"..Num  , C_YELLOW )
				if	i==Num-5	then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_0]", C_Red )
				end
				Bulletin  = 1
				break
			end
			if i > ZonePQ_ValueGroup_Drama[1] or ZonePQ_ValueGroup_Drama[1]  < 5 then
				Bulletin = 0
			end
		end
--刪除橘武用怪
		if	ZonePQ_ValueGroup_Drama[1] > -1	then
			if	CheckID(SPMob)	then
				DebugMsg( 0 , 0 ,"SPMob = "..SPMob )
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_9]" , C_YELLOW )
				if DelObj(SPMob) then
					DebugMsg( 0 , 0 ,"SPMob DEL" )
					SPMob = 0
				end
			end
		end
		if	ZonePQ_ValueGroup_Drama[1] >=  Num	then  --超過一定隻數就進入第二階段

			ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_1]"   , C_Red  ) --訊息提示
			ZonePQ_ValueGroup_Drama[1] = -10  -- 第二階段不計數
			local EnergyTraner = Lua_DW_CreateObj("flag",102156,780094,1,0)
			SetModeEx( EnergyTraner , EM_SetModeType_Strikback , false ) --反擊勾掉
			SetModeEx( EnergyTraner , EM_SetModeType_Searchenemy , false ) -- 索敵勾掉
			SetPlot(EnergyTraner,"dead","LuaS_422359_4",0) -- 打死它的控制 同時加入場景
			AddToPartition(EnergyTraner,0)
			AddBuff(EnergyTraner,503595,1,-1)  -- 放打它的獎勵
			BeginPlot(EnergyTraner,"LuaS_422359_6",0) -- 控制的條件

--第二階段的橘武用怪
			if	DW_Rand(100)<= 40	then
				SPMob = Lua_DW_CreateObj("flag",102355,780094,GetMoveFlagCount(780094)-1)
				DebugMsg( 0 , 0 ,"SPMob = "..SPMob )
				BeginPlot(SPMob,"LuaS_422359_12",0)
			end
			
			local PowerTrough = Lua_DW_CreateObj("flag",113045,780094,20)
			CallPlot(PowerTrough ,"LuaS_422359_8" ,EnergyTraner )
		end
		Total = table.getn(Army) --取矩陣中的總數做為當前值
		for i=1,table.getn(Army)	do -- 過濾並剔除已陣亡 或是 已消失的士兵
			if	not CheckID(Army[i])	then
				Army[i] = 0
				Total = Total - 1 -- 總數-1
			end
			if	ReadRoleValue(Army[i],EM_RoleValue_IsDead) == 1	then
				Army[i] = 0
				Total = Total - 1 -- 總數-1
			end
		end
--ScriptMessage( OwnerID() , -1 , 0 , ZonePQ_ValueGroup_Drama[1] , 0 )
--ScriptMessage( OwnerID() , -1 , 0 , Total   , 0 )
--ScriptMessage( OwnerID() , -1 , 0 , "------"  , 0 )

		if	Con_Total > Total	and
			Space < 7	then
			Buffer = Buffer + 1 --緩衝器負載加重
		else
			if	Buffer > 0	then	Buffer = Buffer - 1 		end
		end

		if	Buffer >= MaxBuffer	then -- 如果負載過重 就生怪
			Buffer = 0
			Need = Need + 1
		end

		if	Space >= Default_Space	then --固定生怪
			Need = Need + 1
			if	ZonePQ_ValueGroup_Drama[1] < -9	then --如果進入第二階段 雙倍生怪
				Need = Need + 1
			end
			Space = 0
		end

		if	Total < 3		and --少於三隻
			Need < 1	and --沒有增怪需求
			Space < 7	then -- 3秒內沒有預定增怪計畫
			Need = Need + 1
		end

		Space = Space + 1 --每次循環累積
		RandPosition = DW_Rand(5) --隨機出現
		if	Need ~= 0 then
			for i=1,Need	do
				for	j=1,table.getn(Army)	do -- 檢查已產生的怪物矩陣 找未用過的 或是 已清空的
					if	Army[j] == nil	or
						Army[j] == 0	then
--------------------------------------------------------------------------------
						Army[j] = Lua_DW_CreateObj("flag",MobList[DW_Rand(table.getn(MobList))] ,780086+i,RandPosition ) -- 從沒人用位置先用
		--				SetModeEx( Army[j] , EM_SetModeType_Gravity , false ) --重力勾掉
						SetPlot(Army[j],"dead","LuaS_422359_3",0)
						WriteRoleValue(Army[j],EM_RoleValue_PID,RandPosition )
						CallPlot(Army[j],"LuaS_422359_1",780086+i)
						BeginPlot(Army[j],"LuaS_422359_2",0)
						Done = 1 -- 標記完成
						break
					end
				end
				if	Done == 0 then --位置已滿
--------------------------------------------------------------------------------
					Army[table.getn(Army)+1] = Lua_DW_CreateObj("flag",MobList[DW_Rand(table.getn(MobList))] ,780086+i,RandPosition ) -- 在新位置放怪
				--	SetModeEx( Army[table.getn(Army)]  , EM_SetModeType_Gravity , false ) --重力勾掉
					SetPlot(Army[table.getn(Army)],"dead","LuaS_422359_3",0)
					WriteRoleValue(Army[table.getn(Army)],EM_RoleValue_PID,RandPosition )
					CallPlot(Army[table.getn(Army)],"LuaS_422359_1",780086+i)
					BeginPlot(Army[table.getn(Army)],"LuaS_422359_2",0)
				end
				Done = 0
			end
			Need = 0 --需求歸零
		end
	end
end

function LuaS_422359_1(Flag)
	while	true	do
		local FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,FlagNum)
		if	GetMoveFlagCount(Flag) == FlagNum	then
			DelObj(OwnerID())
		end
		DW_MoveToFlag( OwnerID(), Flag , FlagNum , 10 )
	end
end

function LuaS_422359_2()
	local X,Z,Sec

	X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	Sec = 0
	while	true	do
		sleep(10)
		if	Sec > 4	then
			DelObj(OwnerID())
		end
		Sec = Sec + 1
		if	X~=ReadRoleValue(OwnerID(),EM_RoleValue_X)	or
			Z~= ReadRoleValue(OwnerID(),EM_RoleValue_Z)	or
			ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1		then
			Sec = 0
		end
--Say(OwnerID(),X)
--Say(OwnerID(),Z)
--Say(OwnerID(),Sec)
		X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)		
	end
end

function LuaS_422359_3()
	local Guy = Lua_HateListPos(1)
	local Killer
	if	ZonePQ_ValueGroup_Drama[1] >= 0	then  -- 只有第一階段要計數
		ZonePQ_ValueGroup_Drama[1] = ZonePQ_ValueGroup_Drama[1] + 1
	end

	Killer= HateListInfo(OwnerID() ,Guy[1]  , EM_HateListInfoType_GItemID );
	if	ReadRoleValue(Killer,EM_RoleValue_IsPlayer) == 1	then
		if	GetPartyID(Killer,-1) ~= 0	then
			for	j = 1,GetPartyID(Killer,-1) 	do
				if	GetPartyID(Killer,j) ~= nil	then
					if	ReadRoleValue(GetPartyID(Killer,j),EM_RoleValue_IsDead)==0	and
						CheckDistance( OwnerID(), GetPartyID(Killer, j ) , 500 )		then
						GiveBodyItem(GetPartyID(Killer,j),204894,1)
					end
				end
			end
		else
			GiveBodyItem(Killer,204894,1)
		end
	end
end

function LuaS_422359_4() -- 死亡劇情
	ZonePQ_ValueGroup_Drama[1] = -5 -- 到第三階段
	local XYZ = {4358, 378, 3277}
	local NPC = Lua_DW_CreateObj("xyz",113044,XYZ)  --種出隱藏NPC
	BeginPlot(NPC,"LuaS_422359_7",0)
	local Bingo = Lua_HateListPos(3)
	local Killer
	for i = 1,table.getn(Bingo)	do
		Killer = HateListInfo(OwnerID() ,Bingo[i] , EM_HateListInfoType_GItemID );
		if	GetPartyID(Killer ,-1) ~= 0	then
			for	j = 1,GetPartyID(Killer ,-1) 	do
				if	GetPartyID(Killer ,j) ~= nil	then
					if	ReadRoleValue(GetPartyID(Killer ,j),EM_RoleValue_IsDead)==0	and
						CheckDistance( OwnerID(), GetPartyID(Killer , j ) , 500 )	then
						GiveBodyItem(GetPartyID(Killer ,j),204894,60)
					end
				end
			end
		else
			GiveBodyItem(Killer ,204894,60)
		end

	end
end

function LuaS_422359_5() -- 反彈的法術執行劇情
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer) == 1	then
		if	GetPartyID(TargetID(),-1) ~= 0	then
			for	j = 1,GetPartyID(TargetID(),-1) 	do
				if	GetPartyID(TargetID(),j) ~= nil	then
					if	ReadRoleValue(GetPartyID(TargetID(),j),EM_RoleValue_IsDead)==0	and
						CheckDistance( OwnerID(), GetPartyID(TargetID(), j ) , 500 )	then
						GiveBodyItem(GetPartyID(TargetID(),j),204894,1)
					end
				end
			end
		else
			GiveBodyItem(TargetID(),204894,1)
		end
	end
end

function LuaS_422359_6()
	for	i = 1,GetMoveFlagCount(780094)-1	do
		if	i == GetMoveFlagCount(780094)-1	then	break	end
		if	i == 10	then	ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_2]"   , C_Red   )		end
		if	i == 15	then	ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_3]"   , C_Red   )		end
		DW_MoveToFlag( OwnerID() , 780094 , i+1 , 0 )
	end
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_4]"   , C_Red   )
	ZonePQ_ValueGroup_Drama[1] = 0--抵達終點 重回第一階段
	DelObj(OwnerID())
end

function LuaS_422359_7()
	local AllTime = 180
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_5]"   , C_Red   )
	for i = 1,AllTime 	do
		sleep(10)
		if	AllTime - i==15	then
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_8]"..15   , C_YELLOW  )
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_422359_8]"..15   , C_YELLOW  )
		end
		if	AllTime - i==6	then
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_8]"..6   , C_YELLOW  )
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_422359_8]"..6   , C_YELLOW  )
		end
		if	AllTime - i==4	then
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_8]"..4   , C_YELLOW  )
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_422359_8]"..4   , C_YELLOW  )
		end
		if	AllTime - i==2	then
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_8]"..2   , C_YELLOW  )
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_422359_8]"..2   , C_YELLOW  )
		end
	end
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_422359_6]"   , C_Red   )
	ZonePQ_ValueGroup_Drama[1] = 0 -- 到第三階段
	DelObj(OwnerID())
end


function LuaS_422359_8(PowerTrough)
	while true do
		sleep(10)
		if	not	CheckID(PowerTrough)	then
			DelObj(OwnerID())
		end
	end
end


function LuaS_422359_12()
	DW_MoveToFlag(OwnerID(), 780094, GetMoveFlagCount(780094)-1, 30 )
end