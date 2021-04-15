
------------------------------------------------------------
function LuaPE_9_1_DW00()--產生導演劇情(第一階段)
------------------------------------------------------------
	PE_Zone9_1_GlobalStep = 0
	PE_Zone9_1_Global_1 = 0

--導演開始執行劇情
	BeginPlot(OwnerID(),"LuaPE_9_1_DW08",0)
end

----------------------------------------------
function LuaPE_9_1_DW01() --控制第一階段產生的炎魔和蛇人軍隊 
----------------------------------------------
--重置全域變數
	PE_Zone9_1_GlobalStep = 1
	PE_Zone9_1_Global_1 = 0
--"不利階段控制"歸零
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0) 
--記錄炎魔的死亡隻數
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)

--使用旗子 780228 編號 1  (導演箱子種出固定位置)
--使用旗子 780228 編號 all(炎魔出現的位置)
--使用旗子 780229 編號 1  (血戰谷通報者出現的點)
--使用旗子 780229 編號 1之外的all(支援蛇人出現的位置)
--使用旗子 780230 編號 all(炎魔的行進路線)
--使用旗子 780231 編號 all(支援蛇人的行進路線)
--使用旗子 780232 編號 all(血戰谷通報者的特別行進路線)
	local TimeCount = 0--計時器(經過多久)
	local DelayTime = 60 --產生有利條件的時限
	local Trouble = 15 --狀況發生的時間
	local FireFrequency = 30 --產生炎魔的頻率
	local FireLive = 75 --炎魔的生存時間
	local SnakeFrequency = 30 --產生干擾蛇人的頻率
	local SnakeLive = 75 --蛇人的生存時間
	local FireCount = 6--每次產生的炎魔數
	local SnakeCount = 4--每次產生的蛇人數
	local AllFire = {}--裝產生炎魔的矩陣
	local AllSnake = {}--裝產生的助陣蛇人矩陣
	local AllSnake2 = {} --裝通報的蛇人id
	local FireRand = {102681,102811,102814}
	local MapID = 731 --需要通報的玩家區域編號

	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_24]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_24]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_29]",C_Yellow,MapID)
	while	true	do
--DeBugMSG(0,0,"FirstStep:[TimeCount=]"..TimeCount.."[Register1=]"..ReadRoleValue(OwnerID(),EM_RoleValue_Register1))
--如果蛇人死亡的總隻數超過60
--進入下個階段
		if	PE_Zone9_1_Global_1 >= 60	then
			PE_Zone9_1_Global_1 = 0
			PE_Zone9_1_GlobalStep = 2
			local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW07",0)
DeBugMSG(0,0,"Step 1 oo     go to Next Step")
			DelObj(OwnerID())
		end
--如果階段失敗
--退回重置階段
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)>=60	then
			PE_Zone9_1_GlobalStep = 0
			PE_Zone9_1_Global_1 = 0
			local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW08",0)
DeBugMSG(0,0,"Step 1 XX     go back Step 0")
			DelObj(OwnerID())
		end

------------------------------
------------------------------
		sleep(10)
------------------------------
------------------------------

--###階段必定內容
--產生炎魔的過程
--用固定時間產生固定隻數的方式
--判斷PID確定玩家是否完成條件
		if	math.fmod(TimeCount,FireFrequency)==0	then
			for i=1,FireCount,1 do
				AllFire[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i)
				WriteRoleValue(AllFire[i],EM_RoleValue_LiveTime,FireLive)
				WriteRoleValue(AllFire[i],EM_RoleValue_PID,OwnerID())
				SetPlot(AllFire[i],"dead","LuaPE_9_1_DW04",0)
				CallPlot(AllFire[i],"LuaPE_9_1_DW02",780230)
				if	TimeCount >= DelayTime	and
					CheckBuff(OwnerID(),504947)	then
					AddBuff(AllFire[i],504947,1,-1)
				end
			end
--			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_23]"..PE_Zone9_1_Global_1.."/"..60,C_Yellow,MapID)
--			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_22]"..ReadRoleValue(OwnerID(),EM_RoleValue_PID).."/"..60,C_Yellow,MapID)
		end
--###不利條件區段
--產生不利條件的觸發階段
		if	TimeCount == Trouble	then
			AllSnake2[1] = Lua_DW_CreateObj("flag",102748,780229,1)
			WriteRoleValue(AllSnake2[1],EM_RoleValue_IsWalk,0)
			WriteRoleValue(AllSnake2[1],EM_RoleValue_LiveTime,SnakeLive)
			WriteRoleValue(AllSnake2[1],EM_RoleValue_PID,OwnerID())
			CallPlot(AllSnake2[1],"LuaPE_9_1_DW03",780232)
		end
--判斷是否產生不利條件
--進入不利階段產生蛇人
		if	math.fmod(TimeCount,SnakeFrequency)==0		and
			ReadRoleValue(OwnerID(),EM_RoleValue_Register1)==1	then
			for	i=1,SnakeCount,1	do
				AllSnake[i] = Lua_DW_CreateObj("flag",102529,780229,i+1)
				WriteRoleValue(AllSnake[i],EM_RoleValue_IsWalk,0)
				WriteRoleValue(AllSnake[i],EM_RoleValue_LiveTime,SnakeLive)
				CallPlot(AllSnake[i],"LuaPE_9_1_DW02",780231)
			end
		end
--###有利條件區段
--判斷是否觸發有利條件
--計時器
--岩魔能力提升
--打開開關(上buff)
--訊息：岩魔激發了天生的好戰本性，進入狂暴狀態！        SC_PE_9_1_2
		local OneOfFire = {}
		if	TimeCount == DelayTime					and
			ReadRoleValue(OwnerID(),EM_RoleValue_PID)<	1		then
			AddBuff(OwnerID(),504947,1,-1)
			DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_2]",C_Red,MapID)
--幫所有已產生的炎魔上buff
			local BeforeFire = SetSearchAllNPC(0)
			for i=1,BeforeFire,1 do
				OneOfFire[i] = GetSearchResult()
			end
			for i=1,table.getn(OneOfFire),1 do
				for k=1,table.getn(FireRand),1 do
					if	ReadRoleValue(OneOfFire[i],EM_RoleValue_OrgID) == FireRand[k]	then
						PlayMotion(OneOfFire[i],ruFUSION_ACTORSTATE_BUFF_SP01)--演戲動作
						AddBuff(OneOfFire[i] ,504947,1,-1)
					end
				end
			end
		end
--固定計時
		TimeCount = TimeCount + 1
	end
end


------------------------------------------------------------------
function LuaPE_9_1_DW02(flag) --套用移動模式
------------------------------------------------------------------
	Hide(OwnerID())
	Show(OwnerID(),0)
--通常旗子編號會包括第0根
--旗子總數-1才是旗子的最後編號
--當記錄值等同旗子總數代表已經全部走完
--確定走到一個點之後才能往下走

	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1	< GetMoveFlagCount(flag)	do
		if	DW_MoveToFlag( OwnerID() , flag , ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1,120 , 1  )	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register5,ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1)
		end
		sleep(1)
	end
end

---------------------------------------------------------------
function LuaPE_9_1_DW03(flag) --斥候在走到最後一段路程時的判斷
---------------------------------------------------------------
	Hide(OwnerID())
	Show(OwnerID(),0)
--通常旗子編號會包括第0根
--旗子總數-1才是旗子的最後編號
--當記錄值等同旗子總數代表已經全部走完
--確定走到一個點之後才能往下走

	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1	< GetMoveFlagCount(flag)	do
		if	DW_MoveToFlag( OwnerID() , flag , ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1,0 , 1  )	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register5,ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1)
		end
		sleep(1)
	end
	local Target = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local X,Z,NPC,Num
	local Sec = 0
	local MapID = 731 --判斷發送給哪個區域的玩家
--檢查戰鬥狀態
--非戰鬥才能用
	while	ReadRoleValue(Target,EM_RoleValue_Register1)~=1	do
		sleep(10)
		if	HateListCount( OwnerID()) == 0	then
			NPC = SearchRangeNPC ( OwnerID() , 100 )
			for i=1,table.getn(NPC),1 do
				if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 113702	then
					Num = i
					break
				end
			end
--蛇人的動作
--判斷是否進入戰鬥
--一旦進入戰鬥就中斷
			PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN ,ruFUSION_ACTORSTATE_CAST_LOOP ) 
			Sec = 0
--如果讓斥候持續五秒
--開啟判斷條件，然後結束迴圈
			while HateListCount( OwnerID())==0 do
				if	Sec > 5		then
					WriteRoleValue(Target,EM_RoleValue_Register1,1)
--提供玩家訊息
--告知進入不利階段
--訊息：[102748]吹響了警戒號角！蛇人大軍很快就會來到！          SC_PE_9_1_1
					DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_1]",C_Red,MapID)
					PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)--演戲動作
					sleep(20)
					DelObj(OwnerID())
					break
				end
				Sec = Sec + 1
				sleep(10)
			end
		end
	end
end


-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW04()  --炎魔的死亡判斷
--------------------------------------------------------------------------------------------
--產生者的id
	local Target = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--死亡計數
	if	PE_Zone9_1_GlobalStep==1	or
		PE_Zone9_1_GlobalStep==2	then
		WriteRoleValue(Target,EM_RoleValue_PID,ReadRoleValue(Target,EM_RoleValue_PID)+1)
		if	CheckID(Target)		then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_22]"..ReadRoleValue(Target,EM_RoleValue_PID).."/"..60,C_Yellow,MapID)
		end
	end
	return true
end


-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW05()  --蛇人的死亡判斷 掛在地圖上的種怪(第一階段的計數怪物)
--------------------------------------------------------------------------------------------
	SetPlot(OwnerID(),"dead","LuaPE_9_1_DW06",0)
end

-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW06()  --蛇人的死亡劇情
--------------------------------------------------------------------------------------------
	if	PE_Zone9_1_GlobalStep == nil	then
		return true
	end
	if	PE_Zone9_1_GlobalStep==1	or
		PE_Zone9_1_GlobalStep==3	then
--死亡計數
		PE_Zone9_1_Global_1 = PE_Zone9_1_Global_1 + 1
		if	PE_Zone9_1_GlobalStep==1	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_23]"..PE_Zone9_1_Global_1.."/"..60,C_Yellow,MapID)
		end
		return true
	end
end

-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW07() --控制第二階段的表演 魔像產生&炎魔攻擊
-------------------------------------------------------------------------------------------

--使用旗子 780228 編號 all(炎魔出現的位置)
--使用旗子 780233 編號 1(魔像出現的位置)
--使用旗子 780233 編號 1以外all(索雷爾頓出現的位置)
--使用旗子 780234 編號 1(魔像站定點的位置)
--使用旗子 780234 編號 1以外的(支援蛇人的前往路線)
	local Sec = 0
	local Golem --魔像
	local Healer = {}--幫魔像補血的索雷爾頓
	local HealerNum = 3 -- 索雷爾峙登場的數量
	local FireDemon = {} --第二階段的炎魔
	local FireNum = 3 --每次產生炎魔的數量
	local FireLive = 75--炎魔的生存時間
	local SnakeLive = 75 --蛇人的生存時間
	local Snake = {} --第二階段的蛇人
	local SnakeNum = 4--每次產生蛇人的數量
	local SnakeRand = {102529,102530}
	local FireRand = {102772,102813,102812}
	local AllFireKind = {102772,102813,102812}
	local MapID = 731 -- 血戰谷的地區
--開始表演劇情(此階段的怪物為演員，並無戰鬥能力。)
--產生魔像&索雷爾頓
	Golem = Lua_DW_CreateObj("flag",102749,780233,1)
	SetFightMode(Golem,0,1,0,0 )
	WriteRoleValue(Golem,EM_RoleValue_IsWalk,1)
	for i =1,HealerNum,1 do
		Healer[i] = Lua_DW_CreateObj("flag",102870,780233,i+1)
		SetFightMode(Healer[i],0,1,0,0 )
		WriteRoleValue(Healer[i],EM_RoleValue_IsWalk,1)
	end
--產生炎魔
--不攻擊狀態
	for i =1,FireNum,1 do
		FireDemon[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i,0)
		WriteRoleValue(FireDemon[i],EM_RoleValue_IsWalk,0)
		SetFightMode(FireDemon[i],0,1,0,0 )
	end


--控制魔像走到定點
--動作(抱拳)
--訊息：炎魔引起的騷動吸引了索雷爾頓的注意，他們帶著巨大的魔像出現在戰場上...    SC_PE_9_1_3
	DW_AreaMessage(Golem,2,"[SC_PE_9_1_3]",C_Red,MapID)
	DW_MoveToFlag( Golem , 780234 , 1 , 0 , 1  )
	PlayMotion(Golem,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	SetFightMode(Golem,1,1,0,1 )
	WriteRoleValue(Golem,EM_RoleValue_IsWalk,0)
--訊息：索雷爾頓魔像散發出強大的能量氣息，好戰的炎魔們立刻騷動了起來！     SC_PE_9_1_15
	sleep(10)
	DW_AreaMessage(Golem,2,"[SC_PE_9_1_15]",C_Red,MapID)
	sleep(10)
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_25]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_25]",C_Yellow,MapID)
--炎魔開戰
--設定炎魔生存時間
	for i =1,table.getn(FireDemon),1 do
		WriteRoleValue(FireDemon[i],EM_RoleValue_LiveTime,60)
		SetFightMode(FireDemon[i],1,1,0,1 )
		SetAttack(FireDemon[i],Golem)
	end
--命令已經在場上的炎魔攻擊
	local NumOfFire = SetSearchAllNPC(0)
	local OldFire 
	for i=1,NumOfFire,1 do
		OldFire = GetSearchResult()
		if	ReadRoleValue(OldFire,EM_RoleValue_OrgID) == 102681	then
			SetAttack(OldFire,Golem)
		end
	end

--開始迴圈
	while true do
		sleep(10)
--計時
		Sec = Sec + 1
--定時產生炎魔
--定時產生蛇人
--新產生的炎魔讓他們自動攻擊魔像
		if	math.fmod(Sec,30) == 0	then
			for i=1,FireNum,1 do
				FireDemon[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i)
				WriteRoleValue(FireDemon[i],EM_RoleValue_LiveTime,FireLive)
				WriteRoleValue(FireDemon[i],EM_RoleValue_PID,OwnerID())
				SetPlot(FireDemon[i],"dead","LuaPE_9_1_DW04",0)
				CallPlot(FireDemon[i],"LuaPE_9_1_DW02",780230)
				if	Sec >= 30	and
					CheckBuff(OwnerID(),504947)	then
					AddBuff(FireDemon[i],504947,1,-1)
				end
			end



--初次產生蛇人的訊息：蛇人利用炎魔注意力被索雷爾頓魔像吸引的空檔重組攻勢！(SC_PE_9_1_4)
			if	Sec == 30	then
				DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_4]",C_Red,MapID)
			end

			for i =1,SnakeNum,1	do
				Snake[i] = Lua_DW_CreateObj("flag",SnakeRand[DW_Rand(table.getn(SnakeRand))],780229,i)
				WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,60)
				WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
				WriteRoleValue(Snake[i],EM_RoleValue_Register5,2)
				CallPlot(Snake[i],"LuaPE_9_1_DW02",780234)
			end
		end
--索雷爾頓開始補血
--訊息：索雷爾頓持續對魔像進行修補，大大減緩了炎魔的攻勢！
		if	Sec == 10	then
			DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_44]",C_Red,MapID)
			for i=1,table.getn(Healer),1 do
				SetFightMode(Healer[i],0,1,0,1 )
				CallPlot(Healer[i],"LuaPE_9_1_DW10",Golem)
			end
		end
--檢查有利條件的觸發時間
--以幫自己上buff的方式做為觸發機制
--有利條件如果觸發 幫所有的炎魔上buff
		local OneOfFire = {}
		if	Sec == 30	then
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0	then
				DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_2]",C_Red,MapID)
				BeforeFire = SetSearchAllNPC(0)
				for i=1,BeforeFire,1 do
					OneOfFire[i] = GetSearchResult()
				end
				for i=1,table.getn(OneOfFire),1 do
					for k=1,table.getn(AllFireKind),1 do
						if	ReadRoleValue(OneOfFire[i],EM_RoleValue_OrgID) == AllFireKind[k]	then
							PlayMotion(OneOfFire[i],ruFUSION_ACTORSTATE_BUFF_SP01)--演戲動作
							AddBuff(OneOfFire[i],504947,1,-1)
						end
					end
				end
				AddBuff(OwnerID(),504947,1,-1)
			end
		end

--判斷失敗還是成功
		if	CheckID(Golem)==true		then
--成功條件：魔像死亡
--進入下一階段
			if	ReadRoleValue(Golem,EM_RoleValue_IsDead)==1	then
				DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_32]".."1".."/".."1",C_Yellow,MapID)
				PE_Zone9_1_GlobalStep = 3
				PE_Zone9_1_Global_1 = 0
				local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
				SetModeEx(Box,EM_SetModeType_Show,false) 
				SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
				SetModeEx(Box,EM_SetModeType_Mark,false) 
				AddToPartition(Box,0)
				BeginPlot(Box,"LuaPE_9_1_DW09",0)
DeBugMSG(0,0,"Step 2 OO     go to Next Step")
				DelObj(OwnerID())
			end
--失敗條件：過多的炎魔死亡
--退回重置階段
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) >= 60	then
--失敗訊息：
				DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_22]".."60".."/".."60",C_Yellow,MapID)
				WriteRoleValue(Golem,EM_RoleValue_LiveTime,45)
				for i =1,table.getn(Healer),1 do
					Healer[i] = Lua_DW_CreateObj("flag",102870,780233,i+1)
					SetFightMode( Healer[i],0,1,0,0 )
					WriteRoleValue(Healer[i],EM_RoleValue_LiveTime,70)
				end
				PE_Zone9_1_GlobalStep = 0
				PE_Zone9_1_Global_1 = 0
				local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
				SetModeEx(Box,EM_SetModeType_Show,false) 
				SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
				SetModeEx(Box,EM_SetModeType_Mark,false) 
				AddToPartition(Box,0)
				BeginPlot(Box,"LuaPE_9_1_DW08",0)
DeBugMSG(0,0,"Step 2 XX     go back Step 0")
				DelObj(OwnerID())
			end
		end
--定期提示訊息
		if	math.fmod(Sec,30) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_32]".."0".."/".."1",C_Yellow,MapID)
		end
	end
end



----------------------------------------------------------------------------------------------------
function LuaPE_9_1_DW08() -- 進入重置階段 (只會成功不會失敗)
----------------------------------------------------------------------------------------------------
	local MapID = 731
	local dateline = 120
--第一次提醒
--	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_28]"..dateline,C_Yellow,MapID)
	local sec = 0
	while	true	do
		sleep(10)
		if	sec > dateline	then
			break
		end
--定期提示訊息
		if	math.fmod(Sec,10) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_28]"..dateline-sec,C_Yellow,MapID)
		end
		sec = sec + 1
--DeBugMSG(0,0,"Wait for  "..sec.."   sec")
	end
--開始第一階段初始化
	PE_Zone9_1_GlobalStep = 1
	PE_Zone9_1_Global_1 = 0
	local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
	SetModeEx(Box,EM_SetModeType_Show,false) 
	SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
	SetModeEx(Box,EM_SetModeType_Mark,false) 
	AddToPartition(Box,0)
	BeginPlot(Box,"LuaPE_9_1_DW01",0)
DeBugMSG(0,0,"Step 0 OO     go to Next Step")
	DelObj(OwnerID())
end


----------------------------------------------------------------------------------------------------
function LuaPE_9_1_DW09()--進入第三階段  第四階段 (在一個隱形箱子上BeginPlot)
----------------------------------------------------------------------------------------------------	

--使用旗子 780228 編號 1(炎魔帶頭出現的位置)
--使用旗子 780228 編號 1之外的all(炎魔出現的位置)
--使用旗子 780019 編號 all(蛇人出現的位置)
--使用旗子 780023 編號 1(聯軍帶頭出現的位置)

	local MapID = 731
	local FireDemon = {}
	local FireCount = 3
	local Snake = {}
	local SnakeCount = 3
	local Sec = 0
	local HumenBoss
	local SnakeRand = {102529,102530}
	local FireRand = {102681,102772,102811,102812,102814}
	local FireLive = 75--炎魔的生存時間
--炎魔表演→特別產生表演用的炎魔
--利用放大buff來突顯它
	local DemonBoss = Lua_DW_CreateObj("flag",102813,780228,1)
	Hide(DemonBoss)
	SetFightMode(DemonBoss,0,1,0,0 )
	AddBuff(DemonBoss,505012,1,-1)
--產生戰鬥用的炎魔和蛇人
	for i=1,FireCount,1 do
	
		FireDemon[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i+1)
		SetFightMode(FireDemon[i],0,1,0,0 )
		WriteRoleValue(FireDemon[i],EM_RoleValue_IsWalk,0)
		WriteRoleValue(FireDemon[i],EM_RoleValue_LiveTime,FireLive)
	end
	for i=1,SnakeCount,1 do
		Snake[i] = Lua_DW_CreateObj("flag",SnakeRand[DW_Rand(table.getn(SnakeRand))],780019,i)
		SetFightMode (Snake[i],0,1,0,0 )
		WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
		WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,FireLive)
	end
	WriteRoleValue(DemonBoss,EM_RoleValue_IsWalk,0)
	sleep(10)
	Show(DemonBoss,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
--訊息：哈！真是強悍的對手！不過我還沒過癮啊！(SC_PE_9_1_6)
--訊息：長鱗片的小傢伙！再陪我們玩兩招吧！哈哈哈哈！    SC_PE_9_1_7
	DW_AreaMessage(DemonBoss,1,"[SC_PE_9_1_6]",C_Red,MapID)
	sleep(30)
	DW_AreaMessage(DemonBoss,1,"[SC_PE_9_1_7]",C_Red,MapID)
	sleep(20)
--全部開啟攻擊狀態
--炎魔攻擊
	SetFightMode(DemonBoss,1,1,0,1 )
	for i=1,table.getn(FireDemon),1 do
		SetFightMode(FireDemon[i],1,1,0,1 )
	end
	for i=1,table.getn(Snake),1 do
		SetFightMode(Snake[i],1,1,0,1 )
		WriteRoleValue(Snake[i],EM_RoleValue_PID,i)
		WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,60)
		CallPlot(Snake[i],"LuaPE_9_1_DW14",780234)
	end
	SetAttack(DemonBoss,Snake[1])
--訊息：一支隊伍悄悄的潛入血戰谷......
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_30]",C_Red,MapID)
--產生聯軍隊長
--掛上死亡重置的劇情
	local HumenBoss = Lua_DW_CreateObj("flag",102816,780023,1)
	SetPlot(HumenBoss,"dead","LuaPE_9_1_DW13",0)
	WriteRoleValue(HumenBoss,EM_RoleValue_IsWalk,0)
	Hide(HumenBoss)
	sleep(10)
	Show(HumenBoss,0)
--訊息(yell)：終於趕上了！看來蛇人已經被炎魔牽制住......SC_PE_9_1_8
	Yell(HumenBoss,"[SC_PE_9_1_8]",5)
	sleep(15)
--執行自走劇情
	BeginPlot(HumenBoss,"LuaPE_9_1_DW11",0)
	sleep(10)
--訊息：那些炎魔真是強悍！出來吧小子們！一切照計劃進行！SC_PE_9_1_9
	Yell(HumenBoss,"[SC_PE_9_1_9]",5)

--初始階段訊息
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_26]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_26]",C_Yellow,MapID)


--迴圈產生戰鬥
--迴圈判斷成功失敗
	local Sec = 0
	while true do
		sleep(10)
		
--如果進階成功
		if	PE_Zone9_1_GlobalStep == 4	then
			PE_Zone9_1_Global_1 = 0
DeBugMSG(0,0,"Step 3 OO     go to Next Step")
			break
		end
--如果進階失敗
--清理對象：HumenBoss   DemonBoss
		if	PE_Zone9_1_GlobalStep == 0	then
			if	CheckID(DemonBoss)==true	then
				DelObj(DemonBoss)
			end
			if	CheckID(HumenBoss)==true	then
				DelObj(HumenBoss)
			end
--重出新的判斷器
--命令執行重置階段的劇情
--刪掉自己終結這個階段
			local Box = Lua_DW_CreateObj("flag",110987,780228,1)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW00",0)
DeBugMSG(0,0,"Step 3  XX     go back Step 0")
			DelObj(OwnerID())
		end
		Sec = Sec + 1
--定期通知進度
		if	math.fmod(Sec,30) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_31]"..ReadRoleValue(HumenBoss,EM_RoleValue_Register2).."/".."4",C_Yellow,MapID)
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."0".."/".."1",C_Yellow,MapID)
		end
	end

--第四階段
--使用旗子  780030 編號all(翼蛇將軍出現的位置)
--使用旗子  780081 編號all(爆桶出現的位置)
--產生翼蛇將軍！
	local XYZ = {-5621,527,29198}
	local SnakeGeberal = Lua_DW_CreateObj("xyz",102532,XYZ)
	SetPlot(SnakeGeberal,"dead","LuaPE_9_1_DW58",0)
--訊息：敢在我的軍營裡亂來？你們很快就會後悔的......  SC_PE_9_1_14
	DW_AreaMessage(SnakeGeberal,1,"[SC_PE_9_1_14]",C_Red,MapID)
--執行專屬翼蛇將軍的移動(來回搜尋突擊隊)
	BeginPlot(SnakeGeberal,"LuaPE_9_1_DW16",0)


	local Powder = {}

--產生各種攻城器具
	for i=1,GetMoveFlagCount(780081)-1,1 do
		Powder[i] = Lua_DW_CreateObj("flag",113941,780081,i)
		SetPlot(Powder[i],"touch","LuaPE_9_1_DW18",50)
		BeginPlot(Powder[i],"LuaPE_9_1_DW24",0)
	end
	local Sec = 0
--處理迴圈
	while	true	do
		sleep(10)
--進階成功
		if	PE_Zone9_1_GlobalStep == 5	then
			sleep(15)
--清理對象：將軍
			DelObj(SnakeGeberal)
--重出新的判斷器
--命令執行重置階段的劇情
--刪掉自己終結這個階段
			local Box = Lua_DW_CreateObj("flag",110987,780228,1)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW00",0)
DeBugMSG(0,0,"Step 4  OO     go back Step 0")
			DelObj(OwnerID())
			break
		end
--進階失敗
--清理對象：將軍 火藥桶
		if	PE_Zone9_1_GlobalStep == 0	then
			for i=1,table.getn(Powder),1 do
				if	Powder[i]~= nil	then
					DelObj(Powder[i])
				end
			end
			DelObj(SnakeGeberal)
--重出新的判斷器
--命令執行重置階段的劇情
--刪掉自己終結這個階段
			local Box = Lua_DW_CreateObj("flag",110987,780228,1)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW00",0)
DeBugMSG(0,0,"Step 4  XX     go back Step 0")
			DelObj(OwnerID())
			break
		end
		Sec = Sec + 1
--定期通知進度
		if	math.fmod(Sec,30) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_33]".."0".."/".."1",C_Yellow,MapID)
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."0".."/".."1",C_Yellow,MapID)
		end
	end

end

----------------------------------------------------------------------------------------------------
function LuaPE_9_1_DW10(Golem) --索雷爾頓執行的動作
----------------------------------------------------------------------------------------------------
	while	true	do
		sleep(10)
--如果魔像被摧毀就自刪
--訊息：不可能！第二代的魔像也被擊敗了！      SC_PE_9_1_5
		if	CheckID(Golem)==false		then
			Say(OwnerID(),"[SC_PE_9_1_5]")
			WriteRoleValue(OwnerID(),EM_RoleValue_LiveTime,20)
			break
		end
--戰鬥外才執行的判斷
		if	HateListCount( OwnerID()) == 0		then
--確認和魔像的距離
			if	GetDistance(OwnerID(),Golem) < 150	then
--確認沒有在施法
--放法術：
				if	ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID) == 0	and
					ReadRoleValue(Golem,EM_RoleValue_IsDead)==0		then
					CastSpellLV(OwnerID(),Golem,494519,1)
				end
			else
--如果距離太遠的話就靠近到指定距離
				DW_GetClose(OwnerID(),Golem,150)
			end
		end
	end
end