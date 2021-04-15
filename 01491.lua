
-------------------------------------------------------------------------
function LuaS_102387_0()--凡城之夢PQ主流程控制器
-------------------------------------------------------------------------
--全域變數控制器
	ZonePQ_ValueGroup_Drama[1] = 0
	Step = 1			--階段控制	初始為1
	BackDoor = 0			--測試的後門
	StepDownNumber = 1	--是否廣播
--初始固定值
	local CountDown = 0		--倒數計時器
	local Initial = 0		--初始化標記
	local Crevice = {}		--第二階段裂縫空陣列
	local Boss = {}			--第三階段諸王
	local SeeA = 0			--希爾洛奧斯
	local XYZ = {769,300,617}	--希爾洛奧斯的位置
	local Yuris = 0			--尤里士
	local RandArray = {}		--隨機出現
	local RandFull = 0
	local later = {}			--完成時間
	local NowTime = {}		--已進行時間

--初始變化設定值
	local StepOneCD = 120			--階段一的倒數時間：120
	local StepIII = {102408,102409,102410}	--階段三的怪物名單
	local StepFourCD = 180			--階段四的倒數時間：180
	local early = {}			--起始時間
	early[1] = GetSystime(2)		
	early[2] = GetSystime(1)
	early[3] = GetSystime(4)
	early[4] = GetSystime(3)
--階段二使用顯旗	780088
--階段三使用顯旗	780089
--尤里士的位置	780090
--尤里士軍的行進路線	780091
--修改時間有兩個地方需要修改

	CallPlot( OwnerID(), "LuaS_102387_ClearGarbage", 0 )--強制倒垃圾

	while	true	do
		sleep(10)
--階段一：惡夢前的寧靜
		if	Step == 1	then
--階段一初始化
			if	Initial == 0	then
				Initial = 1
				CountDown = StepOneCD
			end
--階段一的完成條件：倒數至0
			if	CountDown == 0	then
				Step = 2
				Initial = 0
				ZonePQ_ValueGroup_Drama[1] = 0
			else
				CountDown = CountDown - 1
				if	math.fmod(CountDown,15) == 0	and
					CountDown ~= 0			then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_25]"..CountDown , C_Yellow   )
				end
			end
		end

--階段二：肅清裂縫
		if	Step == 2	then
--階段二初始化
				if	Initial == 0	then
					Initial = 1
					CountDown = 30
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_26]" , C_Yellow   )
--在預定位置產生裂縫	執行劇情
					for i=1,GetMoveFlagCount(780088)-1,1	do
						Crevice[i] = Lua_DW_CreateObj("flag",113335,780088,i)
						SetPlot(Crevice[i],"dead","LuaS_102387_8",0)
						BeginPlot(Crevice[i],"LuaS_102387_6",0)
--關閉互動
						DisableQuest(Crevice[i],true)
						SetRoleCamp(Crevice[i],"Monster")
					end
--尤里士登場表演
					Yuris = Lua_DW_CreateObj("flag",113339,780090,1,0)
					SetRoleCamp(Yuris,"Visitor")
					AddToPartition(Yuris,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
					BeginPlot(Yuris,"LuaS_102387_12",0)
				end
--檢查所有的裂縫狀態(進度檢查)
				ZonePQ_ValueGroup_Drama[1] = 0
				RandArray = {}
				for i=1,table.getn(Crevice),1 do
					if	ReadRoleValue(Crevice[i],EM_RoleValue_HP) < ReadRoleValue(Crevice[i],EM_RoleValue_MaxHP)	then
						ZonePQ_ValueGroup_Drama[1] = ZonePQ_ValueGroup_Drama[1] + 1
--將不穩定的裂縫集合起來
						table.insert(RandArray,table.getn(RandArray)+1,Crevice[i])
					end
				end
--每30秒進行一次進度匯報
				if	math.fmod(CountDown,30) == 0	then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_21]"..ZonePQ_ValueGroup_Drama[1].."/"..GetMoveFlagCount(780088)-1 , C_Yellow   )
--DebugMsg(0,0,"CountDown="..CountDown)
				end
--每30秒 若是有6個以上的裂縫遭到控制
--則隨機選擇一個回復穩定狀態 並上無敵狀態十秒
--向附近的玩家廣播公告恢復的訊息
				RandFull = 0
				if	CountDown == 4	and
					table.getn(RandArray) > 5	then
					RandFull = DW_Rand(table.getn(RandArray))
--DebugMsg(0,0,"RandFull="..RandFull)
					AddBuff(RandArray[RandFull],502921,1,-1)
					WriteRoleValue(	RandArray[RandFull],	EM_RoleValue_HP,	ReadRoleValue(RandArray[RandFull],EM_RoleValue_MaxHP) )
					ScriptMessage( RandArray[RandFull] , 0 , 0 , "[SC_102387_23]" , C_Yellow   )
				end
			
			if	CountDown == -1	then
				CountDown = 29
			else
				CountDown = CountDown - 1
			end

--階段二的完成條件：區域控制器等同旗標數
			if	ZonePQ_ValueGroup_Drama[1] == GetMoveFlagCount(780088)-1	or
				BackDoor == 1	then
--將後門指令重置
				BackDoor = 0
				for i=1,table.getn(Crevice),1	do
--開啟互動	改變陣營	重新顯像
					CancelBuff(Crevice[i],504081) --消除回血
					DisableQuest(Crevice[i],false)
					SetRoleCamp(Crevice[i],"Visitor")
					Hide(Crevice[i])
					sleep(10)
					Show(Crevice[i],0)
				end
--搜尋地圖中所有的npc
				local Count = SetSearchAllNPC(0)
				local NPC = {}
				for i = 1 , Count do
					NPC[i] = GetSearchResult()
				end
--如果發現帶隊者或是被創造出來的隊員		刪除!
				for i = 1,table.getn(NPC),1 do
					if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102405	or
						ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102406	or
						ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102407	then
						if	ReadRoleValue(NPC[i],EM_RoleValue_HP)>=ReadRoleValue(NPC[i],EM_RoleValue_MaxHP)	then
							DelObj(NPC[i])
						end
					end
				end
--重置變數
				Step = 3
				Initial = 0
				ZonePQ_ValueGroup_Drama[1] = 0
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_20]" , C_Yellow   )
			end
		end
--第三階段：深層惡夢
		if	Step == 3	then
--階段三初始化
			if	Initial == 0	then
				sleep(20)
				Initial = 1
--希爾洛奧斯出場	靠北台詞
				SeeA = Lua_DW_CreateObj("xyz",102387,XYZ,1,93)
				SetFightMode(SeeA,0,0,0,0)
				BeginPlot(SeeA,"LuaI_102387_FireAround",0)
--台詞時間
				LuaS_102387_1()
				sleep(15)
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_11]" , C_Yellow   )
				CountDown = StepFourCD
--產生王級怪物 780089 1~3 
				for i = 1,table.getn(StepIII),1	do
					Boss[i] = Lua_DW_CreateObj("flag",StepIII[i],780089,i)
--以死亡劇情與區域控制器溝通
					SetPlot(Boss[i],"dead","LuaS_102387_5",0)
				end
			end
--階段三的完成條件：區域控制器等同陣列大小
			if	ZonePQ_ValueGroup_Drama[1] == table.getn(StepIII)	then
--階段三完成
--確認是否經過8小時 OR 允許特例
--記下完成階段的時間	並將數值送交運算
				later[1] = GetSystime(2)		
				later[2] = GetSystime(1)
				later[3] = GetSystime(4)
				later[4] = GetSystime(3)
				NowTime = DW_TimeCount(later,early)
				if	(NowTime[2] >= 8	or	NowTime[3] > 0	or	NowTime[4] > 0)	or
					StepDownNumber	== 1	then
--時間到達
--階段進升 重置變數
					Step = 4
					Initial = 0
					ZonePQ_ValueGroup_Drama[1] = 0
				else
--未滿足進入最終階段的要求 而回到第一階段
					Step = 1
					Initial = 0
--重置的表演劇情：希爾洛奧斯的離去	刪除希爾洛奧斯
					sleep(20)
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_28]" , C_Red )
					DelObj(SeeA)
--刪除場上還活著的世界王級菁英
					for i=1,table.getn(Boss),1 do
						if	CheckID(Boss[i])	and
							ReadRoleValue(Boss[i],EM_RoleValue_IsDead)==0	then
							DelObj(Boss[i])
						end
					end
--刪除裂縫
					for i=1,table.getn(Crevice),1	do
						DelObj(Crevice[i])
					end
--刪除尤里士相關人員
					DelObj(Yuris)
					LuaS_102387_14()
				end
			end
--階段三的失敗條件：倒數超過
			if	CountDown == 0	then
				Step = 1
				Initial = 0
--失敗的表演劇情：希爾洛奧斯的嘲弄	刪除希爾洛奧斯
				sleep(20)
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_12]" , C_Red )
				DelObj(SeeA)
--刪除場上的王級菁英
				for i=1,table.getn(Boss),1 do
					if	CheckID(Boss[i])	then
						DelObj(Boss[i])
					end
				end
--刪除裂縫
				for i=1,table.getn(Crevice),1	do
					DelObj(Crevice[i])
				end
--刪除尤里士相關人員
				DelObj(Yuris)
				LuaS_102387_14()
			else
--持續倒數
				CountDown = CountDown - 1
--每30秒進行一次匯報
				if	math.fmod(CountDown,30)==0	and
					CountDown ~= 0			then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_24]"..CountDown , C_Yellow   )
				end
			end
		end

--第四階段：安多利爾
		if	Step == 4	then
--階段四：初始化
			if	Initial == 0	then
				Initial = 1
				sleep(20)
--讓希爾洛奧斯產生安多利爾
				CallPlot(SeeA,"LuaI_102387_0",Yuris)
			end
--階段四的結束條件：希爾洛奧斯消失
			if	not CheckID(SeeA)	then
--如果安多利爾戰敗	記錄當時的時間
				if	StepDownNumber == 0 	then
					early[1] = GetSystime(2)		
					early[2] = GetSystime(1)
					early[3] = GetSystime(4)
					early[4] = GetSystime(3)
				end
--重置階段流程
				Step = 1
				Initial = 0
				ZonePQ_ValueGroup_Drama[1] = 0
--刪除裂縫
				for i=1,table.getn(Crevice),1	do
					DelObj(Crevice[i])
				end
--刪除尤里士相關人員
				DelObj(Yuris)
				LuaS_102387_14()
			end
		end
--判斷時間是否經過8小時 是否已處理過？
		later[1] = GetSystime(2)
		later[2] = GetSystime(1)
		later[3] = GetSystime(4)
		later[4] = GetSystime(3)
		NowTime = DW_TimeCount(later,early)
		if	(NowTime[2] >= 8	or	NowTime[3] > 0	or	NowTime[4] > 0)	and
			(CheckID(SeeA) == false	or	Step == 3)					and
			StepDownNumber == 0								then
			StepDownNumber = 1
--顯示跑馬燈
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2, "[SC_102387_27]")
			end
		end
	end
--DebugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"ZonePQ_ValueGroup_Drama="..ZonePQ_ValueGroup_Drama[1].."##CountDown="..CountDown.."##Step="..Step)
end


-------------------------------------------------------------------------
function LuaS_102387_1()--希爾洛奧斯的開場宣言
-------------------------------------------------------------------------
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_7]"   , C_Red   )
	sleep(30)
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_8]"   , C_Red   )
	sleep(25)
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_9]"   , C_Red   )
	sleep(30)
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_10]"   , C_Red   )
	return true
end
-------------------------------------------------------------------------
function LuaS_102387_2()--裂縫的對話劇情
-------------------------------------------------------------------------
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_102387_13]","LuaS_102387_3",0)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_102387_14]","LuaS_102387_4",0)
end
-------------------------------------------------------------------------
function LuaS_102387_3() --傳送到惡夢廣場
-------------------------------------------------------------------------
	ChangeZone( OwnerID(), 208 , 0 ,300,180,200, 330 )
end

-------------------------------------------------------------------------
function LuaS_102387_4() --傳送出副本
-------------------------------------------------------------------------
	local Obj = OwnerID()
	if	CheckBuff(Obj,508902)==true	then
		CancelBuff_NoEvent(Obj,508902)
	end
	ChangeZone( Obj, 2 , 0 ,2700,60,-1000, 235 )
end
-------------------------------------------------------------------------
function LuaS_102387_5() -- 第三階段諸王的死亡劇情
-------------------------------------------------------------------------
	if	Step == 3	then
	ZonePQ_ValueGroup_Drama[1] = ZonePQ_ValueGroup_Drama[1] + 1
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_22]"..ZonePQ_ValueGroup_Drama[1].."/".."3" , C_Yellow   )
	end
	return true
end
-------------------------------------------------------------------------
function LuaS_102387_6()--第二階段的出怪劇情
-------------------------------------------------------------------------
	local Mob = {102405,102406,102407}--第二階段的小怪列表
	local Now = {}
	local Initial = 0
	local Sec = 11
	local RePort = 1
	local ShowMsg = 0
	local Togather = 0
--第二階段的行動
	while	Step == 2	do
		sleep(10)
		if	Initial == 0 	then
			Initial = 1
--重設戰鬥狀態(不可戰鬥)
			SetFightMode(OwnerID(),0,0,0,0)
--固定時間恢復	停止自動回血
			AddBuff(OwnerID(),504081,1,-1)
			AddBuff(OwnerID(),502707,1,-1)	
		end
--均回報陣亡或是尚未建立
--且為滿血狀態
		while	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0			and
			ReadRoleValue(OwnerID(),EM_RoleValue_HP)>=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)	do

			if	Sec > 10	then
				Sec = 0
				if	ShowMsg == 1	then
					ScriptMessage( OwnerID() , 0 , 0 , "[SC_102387_19]" , C_Yellow   )
				end
--取消無敵狀態
--建立護衛
				if	CheckBuff(OwnerID(),502921)	then
					CancelBuff(OwnerID(),502921)
				end
				for i = 1,table.getn(Mob),1	do
					Now[i] = Lua_DW_CreateObj("obj",Mob[i],OwnerID())
					WriteRoleValue(Now[i],EM_RoleValue_PID,OwnerID())
--計算產出總數
					WriteRoleValue(OwnerID(),EM_RoleValue_PID,ReadRoleValue(OwnerID(),EM_RoleValue_PID)+1)
					SetPlot(Now[i],"dead","LuaS_102387_10",0)
					BeginPlot(Now[i],"LuaS_102387_9",0)
				end
			else
				Sec = Sec + 1
			end
			break
		end
--怪物死光的提示
		if	RePort == 0	and
			ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0	then
			RePort = 1
			ShowMsg = 1
			ScriptMessage( OwnerID() , 0 , 0 , "[SC_102387_18]", C_Yellow )
		end
--若是還有倖存的怪物
--將預備廣播的值設定
--檢查是否需要啟發連動機制
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) ~= 0	then
			RePort = 0
			if	Togather == 0		then
--確認是否有人進入戰鬥
--若進入戰鬥 改變連動狀態
--記錄當前戰鬥目標
				for i=1,table.getn(Now),1 do
					if	CheckID(Now[i])	then
						if	HateListCount( Now[i]) > 0	then
							Togather = ReadRoleValue(Now[i],EM_RoleValue_AttackTargetID)
--DeBugMSG(0,0,"ID:"..Now[i].."  ##Togather:"..Togather)
							break
						end
					end
				end
--將戰鬥目標傳給其他未進入戰鬥的單位
--當然 前提是該單位尚存
				if	Togather ~= 0		then
					for i=1,table.getn(Now),1 do
						if	CheckID(Now[i])	then
							if	HateListCount( Now[i])==0	then
								SetAttack(Now[i],Togather)
							end
						end
					end
				end
			else
--連動狀態下
--確認是否三隻都離開戰鬥
--都離開戰鬥的話 取消連動狀態
				for i=1,table.getn(Now),1 do
					if	CheckID(Now[i])	then
						if	HateListCount( Now[i])~=0	then
							break
						end
					end
					if	i==table.getn(Now)	then
						Togather = 0
					end
				end
			end
		end

		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0		then
--重設戰鬥狀態(可戰鬥)
			SetFightMode(OwnerID(),0,0,0,1)
		else
--重設戰鬥狀態(不可戰鬥)
			SetFightMode(OwnerID(),0,0,0,0)
		end
	end
end


-------------------------------------------------------------------------
function LuaS_102387_7() --測試用後門 用以通過第二階段
-------------------------------------------------------------------------
	BackDoor = 1
end

-------------------------------------------------------------------------
function LuaS_102387_8() --階段二裂縫的死亡劇情
-------------------------------------------------------------------------
--不會死亡
	return false
end


-------------------------------------------------------------------------
function LuaS_102387_9() --裂縫產生的三隻王級  的初始化劇情
-------------------------------------------------------------------------
	local Num
	local Sec = 0
--讀取裂縫的值 找出裂縫的位置
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--關閉戰鬥
	SetFightMode(OwnerID(),0,1,0,0)
--判斷自己位於哪裡
	for i = 1,GetMoveFlagCount(780088),1	do
		if	DW_CheckDis(OwnerID(),780088,i,50)	then	
			Num = i
		end
	end
--亂數移動
	DW_MoveToFlag(OwnerID(),780088,Num,60,1)
--開啟戰鬥
	SetFightMode(OwnerID(),1,1,0,1)
	while true do
		sleep(20)
--若是離開戰鬥時
--距離裂縫超過一定長度
--刪除自己
		if	HateListCount( OwnerID())==0	then
			Sec = Sec + 2
			if	CheckDistance(OwnerID(),Master,100)==false	and
				Sec > 14						then
				WriteRoleValue(Master,EM_RoleValue_PID,	ReadRoleValue(Master,EM_RoleValue_PID)-1 )
				DelObj(OwnerID())
			end
		else
			Sec = 0
		end
	end
end

-------------------------------------------------------------------------
function LuaS_102387_10() --階段二怪物死亡劇情
-------------------------------------------------------------------------
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue(Master,EM_RoleValue_PID,	ReadRoleValue(Master,EM_RoleValue_PID)-1	)
	return true
end

-------------------------------------------------------------------------
function LuaS_102387_11() -- 陣形劇情
-------------------------------------------------------------------------
	local dis = 12
	local count = 7 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 5  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,-3)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,-2)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,2)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,-3)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,-2)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,2)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,-3)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,-2)
	ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,1)
	ObjMatrix[12] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,2)
--等待尤里士訓話
	sleep(40)
	for i = 1,table.getn(ObjMatrix),1 do
		AddBuff(ObjMatrix[i],504093,1,-1)
	end

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)
end

-------------------------------------------------------------------------
function LuaS_102387_12() -- 尤里士的表演劇情
-------------------------------------------------------------------------
--帶隊者不能現形 不能被指出 不能有頭像框
	local Soldier = 0--尤里士的意志們
	Soldier = Lua_DW_CreateObj("flag",102280,780090,2,0)
	SetModeEx(Soldier,EM_SetModeType_Show,false)
	SetModeEx(Soldier,EM_SetModeType_Mark,false)
	SetModeEx(Soldier,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Soldier,EM_SetModeType_NotShowHPMP,false)
	AddToPartition( Soldier , ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) )
	WriteRoleValue(Soldier,EM_RoleValue_IsWalk,1)
--初次設定
--控制陣形
	BeginPlot(Soldier,"LuaS_102387_11",0)
--演戲
	sleep(10)
	Say(OwnerID(),"[SC_102387_15]") -- 希爾洛奧斯正在破壞我們所愛的家園！
	sleep(20)
	Say(OwnerID(),"[SC_102387_16]") -- 我們絕對不能讓那個殘忍的惡魔得逞！
	sleep(10)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(OwnerID(),"[SC_102387_17]") --為了榮耀！英勇的戰士們！
	
--控制移動
	BeginPlot(Soldier,"LuaS_102387_13",0)
	while true do
--等待20秒
		for	i=1,20,1	do
			sleep(10)
		end
--等待帶頭NPC回到身邊
--回來之後立刻跳出迴圈進入下個階段
		while	not CheckDistance( OwnerID(), Soldier,100 )	do
			sleep(10)
		end
		sleep(200)
--控制陣形
		BeginPlot(Soldier,"LuaS_102387_11",0)
--演戲
		sleep(10)
		Say(OwnerID(),"[SC_102387_15]") -- 希爾洛奧斯正在破壞我們所愛的家園！
		sleep(20)
		Say(OwnerID(),"[SC_102387_16]") -- 我們絕對不能讓這個殘忍的惡魔得逞！
		sleep(10)
		PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
		Say(OwnerID(),"[SC_102387_17]") -- 出發！英勇的戰士們！
--控制移動
		BeginPlot(Soldier,"LuaS_102387_13",0)
	end
end


-------------------------------------------------------------------------
function LuaS_102387_13() -- 帶隊者的移動劇情
-------------------------------------------------------------------------
	MoveToFlagEnabled(OwnerID(),false)
	local NPC = {}
	local Flag = 1
	while true do
--回到原點時取消這段迴圈的執行
--透過判斷旗標的距離來判斷是否回到原點
		if	flag >= 2	then
			if	DW_CheckDis(OwnerID(),780090,2,30)	then
				return
			end
		end
		sleep(20)
		if	flag >= 2	then
			if	DW_CheckDis(OwnerID(),780090,2,30)	then
				return
			end
		end
--當隊員與自己在一定範圍內就代表他們已經跟上腳步
--所以才讓他往下一點前進
		NPC = SearchRangeNPC(OwnerID(),60)
		for i = 0,table.getn(NPC)-1,1 do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102411	then
				Flag = Flag + 1
				if	Flag > GetMoveFlagCount(780091)-1	then
					return
				end
				LuaFunc_MoveToFlag( OwnerID(), 780091 , Flag , 0 )
				break
			end
		end
		NPC = {}
	end
end

-------------------------------------------------------------------------
function LuaS_102387_14()--刪除帶隊者和士兵
-------------------------------------------------------------------------
--搜尋地圖中所有的npc
	local Count = SetSearchAllNPC(0)
	local NPC = {}
	for i = 1 , Count do
		NPC[i] = GetSearchResult()
	end
--如果發現帶隊者或是被創造出來的隊員		刪除!
	for i = 1,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102280	then
			DelObj(NPC[i])
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102411	then
			DelObj(NPC[i])
		end
	end
end

-------------------------------------------------------------------------
function LuaS_102387_15()--入口範圍劇情
-------------------------------------------------------------------------
--設定範圍劇情
	SetPlot(OwnerID(),"range","LuaS_102387_16",60)
end

-------------------------------------------------------------------------
function LuaS_102387_16()--入口範圍劇情執行
-------------------------------------------------------------------------
--檢查是否已有buff
	if	not	CheckBuff(OwnerID(),504111)		then
--是否已達到廣播的時間？
		if	StepDownNumber == 1	then
--秀出訊息
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_102387_31]",C_Red)
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_102387_31]",C_Red)
--蓋上印章作為識別
			AddBuff(OwnerID(),504111,1,-1)
		end
	end
end


------------------------------------------------------------------------------
function LuaS_102387_17() -- 消去回血buff
------------------------------------------------------------------------------
	CancelBuff(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),504081)
end

function LuaS_102387_ClearGarbage()--強制倒垃圾
	while true do
		sleep(600)
		collectgarbage("collect")
	end
end