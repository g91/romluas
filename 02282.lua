------------------------------Skill------------------------------------------
function Lua_Zone13_PE03_TakeAll()	--一次拿走所有貨物
	--OwnerID 玩家
	local Oid = OwnerID()
	local Ctrl = ReadRoleValue(Oid,EM_RoleValue_Register5)
	DebugMsg(0,0,Ctrl)
	--SysCastSpellLv( Ctrl,Ctrl,497043,0 )--群體中斷施法條,為了中斷正在拿箱子的玩家
	local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1 )
	local Group = Zone13_PE03_Var["Group"][GroupID]
	for i=1,table.getn( Group["Box"] ) do
		if ReadRoleValue(Group["Box"][i],EM_RoleValue_Register10)==0 then--有玩家正在撿的會被略過
			WriteRoleValue( Group["Box"][i] , EM_RoleValue_Register10, 1 )--避免一次拿走所有箱子時重複觸發
			CallPlot( Group["Box"][i]  ,"Lua_Zone13_PE03_QuestBoxReset", Oid )
		end
	end
end

function Lua_Zone13_PE03_Skill01()--放置假木箱
	--假木箱ID 117507
	--箱子叫亞人的法術ID  497042
	local Oid = OwnerID()--玩家
	local ForgedBox = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if CheckID(ForgedBox)==TRUE then
		table.remove(Zone13_PE03_Var_ForgedBox,ForgedBox)
		DelObj(ForgedBox)
	end
	ForgedBox = kg_GetRangePos( Oid , 117507,20 )--創造假木箱
	--WriteRoleValue( ForgedBox, EM_RoleValue_LiveTime, 15 )--生存時間
	WriteRoleValue(Oid,EM_RoleValue_Register9,ForgedBox )--在玩家身上紀錄假箱子
	WriteRoleValue(ForgedBox,EM_RoleValue_Register9,Oid )--在箱子身上紀錄玩家
	WriteRoleValue(ForgedBox,EM_RoleValue_Register8,1 )--顯示在場上
	AddToPartition( ForgedBox,ReadRoleValue(Oid,EM_RoleValue_RoomID) )
	SysCastSpellLv(ForgedBox,ForgedBox,497048,0)--箱子產生的特效
	Zone13_PE03_Var_ForgedBox[ForgedBox]={}--創建怪物資料
	BeginPlot(ForgedBox,"Lua_Zone13_PE03_BoxReady",0)
end

function Lua_Zone13_PE03_BoxReady()--等五秒後觸發
	local ForgedBox = OwnerID()
	local Player = ReadRoleValue( ForgedBox , EM_RoleValue_Register9 )
	Sleep(50)
	SysCastSpellLv( ForgedBox,ForgedBox,497042,0 )
	CallPlot(ForgedBox,"Lua_Zone13_PE03_Skill02_EnemyBuffCheck01",Player)
	local Timer = 0
	while 1 do
		if Timer%3==0 and ReadRoleValue(ForgedBox,EM_RoleValue_Register8)==1 then--每三秒施放引誘亞人
			SysCastSpellLv( ForgedBox,ForgedBox,497042,0 )
		elseif Timer>=15 then--15秒後消失
			Hide(ForgedBox)
			WriteRoleValue(ForgedBox,EM_RoleValue_Register8,0)
			SetModeEx( ForgedBox , EM_SetModeType_Show, FALSE)--是否繪製出模型
			Show(ForgedBox,0)
			break
		end
		Sleep(10)
		Timer = Timer +1
	end
	Sleep(100)
	table.remove(Zone13_PE03_Var_ForgedBox,ForgedBox)
	DelObj(ForgedBox)
end

function Lua_Zone13_PE03_BoxCallEnemy()	--引誘亞人
	local Oid = OwnerID()--箱子
	local Tid = TargetID()--亞人
	local Enemy = Zone13_PE03_Var["Enemy"]
	for j=1, table.getn(Enemy) do
		if ReadRoleValue( Tid, EM_RoleValue_OrgID ) == Enemy[j] then
			--紀錄箱子在亞人身上
			if CheckBuff(Tid,508737)~=TRUE and CheckBuff(Tid,508738)~=TRUE and KS_InCombat(Tid)~=TRUE then
				--Say(Tid,"Yo!")
			 	AddBuff( Tid ,508737,0,-1)--被引誘
			 	table.insert(Zone13_PE03_Var_ForgedBox[Oid],Tid)
			 	CallPlot(Tid,"Lua_Zone13_PE03_EnemyToBox",Oid )--叫TargetEnemy不斷的來找Box
			 end
			 break
		end
	end
end

function Lua_Zone13_PE03_EnemyToBox( Box )
	local Oid=OwnerID()
	local FaceBox=0
	MoveToFlagEnabled( Oid, false )	--巡邏路徑劇情開關
	WriteRoleValue(Oid,EM_RoleValue_IsWalk, 1 )	--Boss用走的移動
	while 1 do
		if CheckBuff(Oid,508737)==TRUE then
			if CheckID(Box)==TRUE and GetDistance( Oid, Box )>50 then
				KS_Move( Oid , 20, Box )
			elseif CheckID(Box)~=TRUE or ReadRoleValue(Box,EM_RoleValue_Register8)==0 then
				CancelBuff(Oid,508737)--被引誘
				MoveToFlagEnabled( Oid, TRUE )	--巡邏路徑劇情開關
				WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--Boss用走的移動
				break
			else
				if FaceBox==0 then
					FaceBox=1
					FaceObj(Oid,Box)
				end
			end
		elseif CheckBuff(Oid,508737)~=TRUE and KS_InCombat(Oid)~=TRUE  then--被引誘消失且沒有在戰鬥中
			--假如箱子存在就演戲
			if CheckBuff(Oid,508738)~=TRUE and CheckID(Box)==TRUE and GetDistance( Oid, Box )<30 and ReadRoleValue(Box,EM_RoleValue_Register8)==1 then
				PlayMotion(Oid,ruFUSION_ACTORSTATE_ATTACK_1H)
				ScriptMessage( Box, 0, 1 , "[SC_PE_ZONE13_03_MESSAGE01]" , 0 )
				--受騙者憤怒的將木箱擊碎！
				DebugMsg(0,0,"DelBox")
				Hide(Box)
				WriteRoleValue(Box,EM_RoleValue_Register8,0)
				SetModeEx( Box , EM_SetModeType_Show, FALSE)--是否繪製出模型
				Show(Box,0)
				--DelObj(Box)
			end
			MoveToFlagEnabled( Oid, TRUE )	--巡邏路徑劇情開關
			WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--Boss用走的移動
			break
		else
			MoveToFlagEnabled( Oid, TRUE )	--巡邏路徑劇情開關
			WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--Boss用走的移動
			break
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill02_01()--玩家引爆假貨物--497005 木箱爆破  震攝亞人
	local ForgedBox = ReadRoleValue(OwnerID(),EM_RoleValue_Register9 )
	if CheckID(ForgedBox)==TRUE and ReadRoleValue(ForgedBox,EM_RoleValue_Register8)==1 then
		BeginPlot(ForgedBox,"Lua_Zone13_PE03_Skill02_BoxExplode",0 )
	end
end

function Lua_Zone13_PE03_Skill02_BoxExplode()--假貨物爆炸，一秒後自我刪除
	local ForgedBox = OwnerID()
	local Player = ReadRoleValue( ForgedBox , EM_RoleValue_Register9 )
	SysCastSpellLv(ForgedBox,ForgedBox,497005,0)
	CallPlot(ForgedBox,"Lua_Zone13_PE03_Skill02_EnemyBuffCheck02",Player)
	
	Sleep(10)--DelObj(ForgedBox)
	Hide(ForgedBox)
	WriteRoleValue(ForgedBox,EM_RoleValue_Register8,0)
	SetModeEx( ForgedBox , EM_SetModeType_Show, FALSE)--是否繪製出模型
	Show(ForgedBox,0)
end

function Lua_Zone13_PE03_Skill02_02()--木箱對怪物放震攝
	local Oid =OwnerID()--箱子
	local Tid = TargetID()--亞人
	if CheckBuff(Tid,508737)==TRUE then
		CancelBuff(Tid,508737)--被引誘
		AddBuff(Tid,508738,0,-1)--被震攝
		--Say(Tid,"ouch!")
	end
end

function Lua_Zone13_PE03_Skill02_EnemyBuffCheck01( Player )--亞人身上有被引誘，在檢查有沒有受到失去物資，有則對玩家獎勵
	DebugMsg(0,0,"BuffCheck01Start! Player = "..Player )
	Lua_Zone13_PE03_Skill02_EnemyBuffCheck(Player,508737)
end

function Lua_Zone13_PE03_Skill02_EnemyBuffCheck02( Player )--亞人身上有被震攝，在檢查有沒有受到失去物資，有則對玩家獎勵
	DebugMsg(0,0,"BuffCheck02Start! Player = "..Player )
	Lua_Zone13_PE03_Skill02_EnemyBuffCheck(Player,508738)
end

function Lua_Zone13_PE03_Skill02_EnemyBuffCheck(Player,Buff)
	local Oid= OwnerID()--木箱
	local EnemyGroup = Zone13_PE03_Var_ForgedBox[Oid]
	local GiveKey = {}	--假如已給過玩家獎勵則為1
	local Times = 10
	if Buff==508737 then Times=15 end--箱子只會存在15秒，故也是引誘15秒
	for k=1,Times do--每秒檢查怪物身上有沒有被震攝與失去物資,共10次
		EnemyGroup = Zone13_PE03_Var_ForgedBox[Oid]
		for i in pairs(EnemyGroup) do
			if GiveKey[EnemyGroup[i]]==nil then
				GiveKey[EnemyGroup[i]]=0
				DebugMsg(0,0,Buff.." ,i="..EnemyGroup[i].." Key="..GiveKey[EnemyGroup[i]])
			end
		end
		for i in pairs(EnemyGroup) do
			if CheckBuff(EnemyGroup[i],Buff)==TRUE and CheckBuff(EnemyGroup[i],508748)==TRUE and GiveKey[EnemyGroup[i]]==0 then
				GiveKey[EnemyGroup[i]]=1--上鎖，不在重複給獎勵
				ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				--Say( Player,"Get One More  QuestKey!" )
			end
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill03_01()--玩家監視亞人
	local Player = OwnerID()
	local Tid =TargetID()
	AddBuff(Tid,508739,0,-1)--被監視
	CallPlot(Tid,"Lua_Zone13_PE03_Skill03_10sLoop",Player )
end
function Lua_Zone13_PE03_Skill03_02()--標放亞人
	local Player = OwnerID()
	local Tid = TargetID()
	if CheckBuff(Tid,508740)==TRUE then
		CancelBuff(Tid,508740)--適合標記
		AddBuff(Tid,508741,0,-1)--艾力克標放
		ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		--DebugMsg( 0,0,"Get QuestKey!" )
		--Say(Player,"Get QuestKey!"  )
	end
end

function Lua_Zone13_PE03_Skill03_10sLoop( Player )--亞人被監視後自我執行迴圈,不用考慮其他玩家,因為監視是唯一的
	local Oid = OwnerID()--亞人
	--Say(Oid,"Loop Start")
	math.randomseed(math.random(10000, 99999))
	local randnum =0
	local BuffID = { 508740 , 508742 }--適合標記,惱羞成怒
	local timer = 0
	while 1 do
		sleep(10)
		timer = timer +1
		local Distance = GetDistance( Oid, Player )
		if CheckBuff(Oid,508739)==true and KS_InCombat(Oid)~=TRUE and Distance<140 and timer>=6 then --監視超過六秒
			randnum = math.random(2)
			if randnum==2 then
				SysCastSpellLv( Player, Oid, 496946, 0 )--增加仇恨
				WriteRoleValue(Oid,EM_RoleValue_Register10,Player)
				AddBuff(Player,508743,0,-1)--快逃命
			end
			CancelBuff(Oid,508739)
			AddBuff(Oid, BuffID[randnum] ,0,-1)
			break
		elseif KS_InCombat(Oid)==TRUE or Distance>=140 then--亞人進入戰鬥或與玩家距離太遠
			CancelBuff(Oid,508739)--清掉監視
			break
		end
	end
end

function Lua_Zone13_PE03_Skill03_03()--惱羞成怒消失，監視玩家的快逃命是否消失
	DebugMsg(0,0,"Check Player Buff")
	local Oid = OwnerID()--亞人
	local Player = ReadRoleValue(Oid,EM_RoleValue_Register10)
	if CheckBuff(Player,508743)==TRUE then
		CancelBuff( Player,508743 )
		CancelBuff( Player,508744 )
		ks_QuestKill( Player, 105315, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		--DebugMsg( 0,0,"Get QuestKey!" )
		--Say( Player,"Get QuestKey!" )
	end
end

function Lua_Zone13_PE03_Skill04_01()--隨機決定是否有機密文件 --117509 箭頭物件
	math.randomseed(math.random(10000, 99999))
	local Oid = OwnerID() --玩家
	local Ctrl = ReadRoleValue(Oid,EM_RoleValue_Register5)--中控器，順便清掉箱子ID，假如之前有記過的話
	if ReadRoleValue(Ctrl,EM_RoleValue_Register10)==0 then--表示目前沒有箱子被拿走
		local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1)
		local GroupBox = Zone13_PE03_Var["Group"][GroupID]["Box"]
		local SecretBox = GroupBox[ReadRoleValue(Ctrl,EM_RoleValue_Register9)]--找出該群組的機密文件
		if ReadRoleValue(SecretBox,EM_RoleValue_Register10)==0 then--沒有被任何玩家綁定
			WriteRoleValue(SecretBox,EM_RoleValue_Register9,1)--箭頭綁定
			local Arrow = kg_GetPos(SecretBox,117509,15)--找出箱子"頭上"的位置
			SetModeEx( Arrow, EM_SetModeType_Gravity , false )	-- 重力
			SetModeEx( Arrow , EM_SetModeType_Mark, false)	----可點選(否)
			SetModeEx( Arrow , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
			--WriteRoleValue(Arrow,EM_RoleValue_Register10,SecretBox)
			--WriteRoleValue(Oid,EM_RoleValue_Register10,randBox)--玩家記住箱子ID
			--WriteRoleValue( Arrow, EM_RoleValue_LiveTime, 10 )--生存時間
			AddToPartition( Arrow , ReadRoleValue( Oid , EM_RoleValue_RoomID ) )
			CallPlot(Arrow,"Lua_Zone13_PE03_DelArrow",Oid,Arrow,SecretBox)
			AddBuff( Oid,508746,0,-1 )--格殺勿論
		else
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--你什麼也沒找到
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--你什麼也沒找到
	end
end

function Lua_Zone13_PE03_DelArrow( Player,Arrow,SecretBox )
	for i=1,10 do
		if GetDistance(Arrow,Player)>=150 then
			WriteRoleValue( SecretBox,EM_RoleValue_Register9,0 )--箭頭解鎖
			CancelBuff(Player,508746)
			break
		end
		if i==10 then
			WriteRoleValue( SecretBox,EM_RoleValue_Register9,0 )--箭頭解鎖
			break
		end
		Sleep(10)
	end
	DelObj(Arrow)
end

function Lua_Zone13_PE03_Skill04_02()--繳回文件
	local Oid = OwnerID()
	CancelBuff(Oid,508880)
	AddBuff(Oid,508745,0,-1)--已完成
	ks_QuestKill( Oid, 105315, 10 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--Say( Oid,"Get 10 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_01()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508750)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say( Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_02()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508751)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say(Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_03()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508752)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say( Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_04()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508753)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say( Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill06()--辛苦了兄弟
	local Tid = TargetID() --守護者
	local Oid =OwnerID()--玩家
	CallPlot(Tid,"Lua_Zone13_PE03_Skill06_Rest",Oid)
end

function Lua_Zone13_PE03_Skill06_Rest( Player )--守護者去休息囉
	local Oid = OwnerID()--守護者
	local sit = 0
	local Timer =0
	Hide(Oid)
	MoveToFlagEnabled( Oid, false )--關閉巡邏路徑劇情
	SetModeEx( Oid , EM_SetModeType_Searchenemy, false)	---索敵(否)
	Show(Oid,0)
	--local Dummy = kg_GetRangePos(Oid,117507,100,180)
	--SetModeEx( Dummy , EM_SetModeType_Show, FALSE)--是否繪製出模型
	--AddToPartition(Dummy,ReadRoleValue(Oid,EM_RoleValue_RoomID))
	--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 1 )	--用走的移動 
	while 1 do
		if KS_InCombat(Oid)~=TRUE then
			--if GetDistance(Oid,Dummy)>40 then
			--	KS_Move( Oid , 0, Dummy )
		--	else
				if sit==0 then
					sit=1
					StopMove(Oid,TRUE)
					PlayMotion( Oid , ruFUSION_ACTORSTATE_SIT_LOOP )
				end
				if Timer==20 then
					CancelBuff(Oid,508749)--消除疲勞
					AddBuff(Oid,508876,0,-1)--疲勞免疫
					ks_QuestKill( Player, 105315, 4 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
					PlayMotion(Oid, ruFUSION_ACTORSTATE_SIT_END)
					--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--用走的移動 
					Hide(Oid)
					MoveToFlagEnabled( Oid, true )--關閉巡邏路徑劇情
					SetModeEx( Oid , EM_SetModeType_Searchenemy, true)	---索敵(否)
					Show(Oid,0)
					--DelObj(Dummy)
					break
				end
				SysCastSpellLv(Oid,Oid,497046,0)--群體80碼仇恨1
		--	end
		else
			PlayMotion(Oid, ruFUSION_ACTORSTATE_SIT_END)
			--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--用走的移動 
			Hide(Oid)
			MoveToFlagEnabled( Oid, true )--關閉巡邏路徑劇情
			SetModeEx( Oid , EM_SetModeType_Searchenemy, true)	---索敵(否)
			Show( Oid,0 )
			--DelObj(Dummy)
			break
		end
		Timer = Timer+1
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill07_01()--建立一組運貨員到營地
	local Tid = TargetID()--老練的送貨員
	local Oid = OwnerID()--玩家
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	DebugMsg(0,0,"QuestCar="..QuestCar)
	if kg_CheckLive(QuestCar)==TRUE and ReadRoleValue(QuestCar,EM_RoleValue_OrgID)==105304 then
		DelObj(QuestCar)
	end
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and ReadRoleValue(QuestMember,EM_RoleValue_OrgID)==105316 then
		DelObj(QuestMember)
	end
	QuestCar = kg_GetRangePos(Tid,105304,100)
	MoveToFlagEnabled( QuestCar, false )	--關閉巡邏路徑劇情
	SetFlag( QuestCar, 544801, 1 )--關閉帕奇鼠
	SetModeEx( QuestCar , EM_SetModeType_Revive, false)	--可重生
	SetModeEx( QuestCar , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( QuestCar , EM_SetModeType_Searchenemy, false)	--索敵
	SetModeEx( QuestCar , EM_SetModeType_Strikback, false) ---反擊
	WriteRoleValue(QuestCar,EM_RoleValue_Register10,Oid)
	WriteRoleValue(Oid,EM_RoleValue_Register10,QuestCar)
	AddToPartition(QuestCar,RoomID)
	AddBuff(QuestCar,508887,0,-1)--貨車不回血
	AddBuff( QuestCar, 507514, 0, -1 )--免疫治療
	QuestMember = kg_GetRangePos(QuestCar,105316,50,180)
	MoveToFlagEnabled( QuestMember, false )	--關閉巡邏路徑劇情
	SetFlag( QuestMember, 544801, 1 )--關閉帕奇鼠
	SetModeEx( QuestMember , EM_SetModeType_Revive, false)	--可重生
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, false)	--索敵
	--SetModeEx( QuestMember , EM_SetModeType_Strikback, false) ---反擊
	WriteRoleValue(QuestMember,EM_RoleValue_Register10,Oid)
	WriteRoleValue(QuestMember,EM_RoleValue_Register9,QuestCar)
	WriteRoleValue(QuestCar,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(Oid,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(QuestMember,EM_RoleValue_Register8,0)--目前要去的旗標
	WriteRoleValue(QuestCar,EM_RoleValue_Register8,0)--目前要去的旗標
	AddToPartition(QuestMember,RoomID)
	AddBuff(QuestMember,508890,0,-1)--不可攻擊
	Yell( QuestMember ,"[SC_PE_ZONE13_03_MESSAGE06]" , 2 )
	SetPlot( QuestMember , "DEAD", "Lua_Zone13_PE03_Dead03", 0 )--死亡劇情
	SetPlot( QuestCar , "DEAD", "Lua_Zone13_PE03_Dead04", 0 )--死亡劇情
	CallPlot(QuestCar,"Lua_Zone13_PE03_QuestMemberCheckPlayer",Oid,QuestMember)
	--SetFollow( QuestMember,QuestCar)
end

function Lua_Zone13_PE03_QuestMemberCheckPlayer( Player ,QuestMember )--每分鐘檢查玩家是否在旁邊
	local QuestCar = OwnerID()
	while 1 do
		if kg_CheckLive(Player)~=true or GetDistance(QuestCar,player)>450 then
			DelObj(QuestMember)
			DelObj(QuestCar)
			break
		end
		Sleep(600)
	end
end

function Lua_Zone13_PE03_Skill07_02()--讓運貨群組前進
	local Oid = OwnerID()--玩家
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	SetModeEx( QuestCar , EM_SetModeType_Fight, FALSE) ---可砍殺
	AddBuff(QuestMember,508890,0,-1)--不可攻擊
	SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE) ---反擊
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, FALSE)	--索敵
	WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 1 )	--用走的移動 
	WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 1 )	--用走的移動
	CallPlot(QuestCar,"Lua_Zone13_PE03_Go01",Oid,QuestMember, QuestCar)
end

function Lua_Zone13_PE03_Go01( Player,QuestMember, QuestCar )
	--SetFollow( QuestMember,QuestCar)
	local FlagID = Zone13_PE03_Var["FlagID"][1]
	local Step = ReadRoleValue(QuestCar,EM_RoleValue_Register8)
	local Goal = GetMoveFlagCount( FlagID )-1
	while 1 do
		if KS_InCombat(QuestMember)==TRUE or ReadRoleValue( Player, EM_RoleValue_IsAttackMode )==1 then
			StopMove(QuestCar,TRUE)
			StopMove(QuestMember,TRUE)
			--SysCastSpellLv(QuestMember,QuestMember,497047,0)
			SysCastSpellLv( QuestMember,QuestMember,497046,0)--強制對群體仇恨
			DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
			DebugMsg(0,0,"EnterBattle1")
			break
		else
			if Step<=Goal then
				if DW_CheckDis( QuestCar, FlagID, step , 30 ) == true and Step<Goal then
					Step = Step+1
					WriteRoleValue(QuestMember,EM_RoleValue_Register8,Step)--目前要去的旗標
					WriteRoleValue(QuestCar,EM_RoleValue_Register8,Step)--目前要去的旗標
				elseif Step==Goal and  DW_CheckDis( QuestCar, FlagID, step , 30 ) == true then
					if GetDistance(QuestCar,Player)<=100 then
						AddBuff(Player,508745,0,-1)--已完成
						ks_QuestKill( Player, 105315, 10 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
						--DebugMsg( 0,0,"Get 10 QuestKey!" )
						--Say( Player,"Get 10 QuestKey!" )
						DelObj(QuestMember)
						DelObj(QuestCar)
						break
					end
				else
					--SysCastSpellLv(QuestMember,QuestMember,497047,0)
					SysCastSpellLv( QuestMember,QuestMember,497046,0)--強制對群體仇恨
					--DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
					if HateListCount(QuestMember)>0 then
						StopMove(QuestCar,TRUE)
						StopMove(QuestMember,TRUE)
						break
					end
					KS_Move( QuestMember , 0, QuestCar )
					KS_Move( QuestCar, 30, FlagID , Step )
				end
			end
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill07_03()--送貨員脫離貨車去打人
	local Oid = OwnerID()--玩家
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	SetModeEx( QuestCar , EM_SetModeType_Fight, TRUE) ---可砍殺
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, TRUE)	--索敵
	SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE) ---反擊
	CancelBuff(QuestMember,508890)
	--CallPlot(QuestCar,"Lua_Zone13_PE03_Fight",Oid,QuestMember, QuestCar)
end

function Lua_Zone13_PE03_Fight( Player,QuestMember, QuestCar )--送貨群組進入戰鬥
	SetModeEx( QuestCar , EM_SetModeType_Fight, TRUE) ---可砍殺
	--SetModeEx( QuestMember , EM_SetModeType_Searchenemy, TRUE)	--索敵
	SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE) ---反擊
end

function Lua_Zone13_PE03_Skill07_04()--送貨群組強制前進
	local Oid = OwnerID()--玩家
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	DebugMsg(0,0,QuestMember)
	ClearHateList( QuestMember , -1 )
	SetModeEx( QuestCar , EM_SetModeType_Fight, FALSE) ---可砍殺
	--SetModeEx( QuestMember , EM_SetModeType_Fight, FALSE) ---可砍殺
	SetModeEx( QuestMember , EM_SetModeType_Strikback, FALSE) ---反擊
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, FALSE)	--索敵
	Hide(QuestMember)
	ClearHateList( QuestMember , -1 )
	SetStopAttack( QuestMember )
	Show( QuestMember,0 )
	--DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
	WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 0 )	--用走的移動 
	WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 0 )	--用走的移動
	CallPlot(QuestCar,"Lua_Zone13_PE03_Rush",Oid,QuestMember, QuestCar)
end

function Lua_Zone13_PE03_Rush( Player,QuestMember, QuestCar,FlagNum )--強行突破
--[[
	for i=1,10 do
		ClearHateList( QuestMember , -1 )
		DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
		Sleep(30)
	end
]]--
	local FlagID = Zone13_PE03_Var["FlagID"][1]
	local Step = ReadRoleValue(QuestCar,EM_RoleValue_Register8)
	local Goal = GetMoveFlagCount( FlagID )-1
	local Timer = 0 
	while 1 do
		if Step<=Goal and Timer<=10 then
			if DW_CheckDis( QuestCar, FlagID, step , 30 ) == true and Step<Goal then
				Step = Step+1
				WriteRoleValue(QuestMember,EM_RoleValue_Register8,Step)--目前要去的旗標
				WriteRoleValue(QuestCar,EM_RoleValue_Register8,Step)--目前要去的旗標
			elseif Step==Goal and  DW_CheckDis( QuestCar, FlagID, step , 30 ) == true then
				if GetDistance(QuestCar,Player)<=100 then
					AddBuff(Player,508745,0,-1)--已完成
					ks_QuestKill( Player, 105315, 10 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
					--DebugMsg( 0,0,"Get 10 QuestKey!" )
					--Say( Player,"Get 10 QuestKey!" )
					DelObj(QuestMember)
					DelObj(QuestCar)
					break
				end
			else
				SysCastSpellLv( QuestMember,QuestMember,497046,0)--強制對群體仇恨
				--Say(QuestMember,"Go!!!!!!!")
				KS_Move( QuestMember , 0, QuestCar )
				KS_Move( QuestCar, 30, FlagID , Step )
			end
		else
			WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 1 )	--用走的移動 
			WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 1 )	--用走的移動
			AddBuff(QuestMember,508890,0,-1)--不可攻擊
			SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE ) ---反擊
			SetModeEx( QuestMember , EM_SetModeType_Searchenemy, FALSE )	--索敵
			DebugMsg(0,0,"Time's Up!")
			break
		end
		Sleep(10)
		Timer = Timer +1
	end
end

function Lua_Zone13_PE03_Skill08_01()
	local Tid = TargetID()--老練的送貨員
	local Oid = OwnerID()--玩家
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	if kg_CheckLive(QuestCar)==TRUE and ReadRoleValue(QuestCar,EM_RoleValue_OrgID)==105304 then 
		DelObj(QuestCar)
	end
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and ReadRoleValue(QuestMember,EM_RoleValue_OrgID)==105317 then 
		DelObj(QuestMember)
	end
	
	QuestCar = kg_GetRangePos(Tid,105304,100)
	MoveToFlagEnabled( QuestCar, false )	--關閉巡邏路徑劇情
	SetFlag( QuestCar, 544801, 1 )--關閉帕奇鼠
	SetModeEx( QuestCar , EM_SetModeType_Revive, false)	--可重生
	SetModeEx( QuestCar , EM_SetModeType_Fight, TRUE) ---可砍殺
	SetModeEx( QuestCar , EM_SetModeType_Searchenemy, false)	--索敵
	SetModeEx( QuestCar , EM_SetModeType_Strikback, false) ---反擊
	WriteRoleValue(QuestCar,EM_RoleValue_Register10,Oid)
	WriteRoleValue(Oid,EM_RoleValue_Register10,QuestCar)
	AddToPartition(QuestCar,RoomID)
	AddBuff(QuestCar,508887,0,-1)--貨車不回血
	AddBuff( QuestCar, 507514, 0, -1 )--免疫治療
	QuestMember = kg_GetRangePos(QuestCar,105317,50,180)
	MoveToFlagEnabled( QuestMember, false )	--關閉巡邏路徑劇情
	SetFlag( QuestMember, 544801, 1 )--關閉帕奇鼠
	SetModeEx( QuestMember , EM_SetModeType_Revive, false)	--可重生
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, false)	--索敵
	SetModeEx( QuestMember , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( QuestMember , EM_SetModeType_Fight, false) ---可砍殺
	WriteRoleValue(QuestMember,EM_RoleValue_Register10,Oid)
	WriteRoleValue(QuestMember,EM_RoleValue_Register9,QuestCar)
	WriteRoleValue(QuestCar,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(Oid,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(QuestMember,EM_RoleValue_Register8,0)--目前要去的旗標
	WriteRoleValue(QuestCar,EM_RoleValue_Register8,0)--目前要去的旗標
	AddToPartition(QuestMember,RoomID)
	--AddBuff(QuestMember,508890,0,-1)--不可攻擊
	WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 1 )	--用走的移動 
	WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 1 )	--用走的移動
	SetPlot( QuestMember , "DEAD", "Lua_Zone13_PE03_Dead03", 0 )--死亡劇情
	SetPlot( QuestCar , "DEAD", "Lua_Zone13_PE03_Dead04", 0 )--死亡劇情
	CallPlot(QuestCar,"Lua_Zone13_PE03_Skill08_Go2",Oid,QuestMember,QuestCar)
end

function Lua_Zone13_PE03_Skill08_Go2( Player,QuestMember,QuestCar )

	local FlagID = Zone13_PE03_Var["FlagID"][2]
	local Step = ReadRoleValue(QuestCar,EM_RoleValue_Register8)
	local Goal = GetMoveFlagCount( FlagID )-1
	while 1 do
		if Step<=Goal  then
			if DW_CheckDis( QuestCar, FlagID, step , 30 ) == true and Step<Goal then
				if Step == 3 then
					CallPlot(QuestMember,"Lua_Zone13_PE03_CreateFlower",QuestCar)
				end
				Step = Step+1
				WriteRoleValue(QuestMember,EM_RoleValue_Register8,Step)--目前要去的旗標
				WriteRoleValue(QuestCar,EM_RoleValue_Register8,Step)--目前要去的旗標
			elseif Step==Goal and  DW_CheckDis( QuestCar, FlagID, step , 30 ) == true  then
				if GetDistance(QuestCar,Player)<=100 then
					AddBuff(Player,508745,0,-1)--已完成
					ks_QuestKill( Player, 105315, 10 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
					--DebugMsg( 0,0,"Get 10 QuestKey!" )
					--Say( Player,"Get 10 QuestKey!" )
					DelObj(QuestMember)
					DelObj(QuestCar)
					break
				end
			else
				--Say(QuestMember,"Go!!!!!!!")
				KS_Move( QuestMember , 0, QuestCar )
				KS_Move( QuestCar, 0, FlagID , Step )
			end
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_CreateFlower(QuestCar)--105318 死亡之花
	DebugMsg(0,0,"FloweStart")
	local QuestMember = OwnerID()
	local RoomID = ReadRoleValue(QuestMember,EM_RoleValue_RoomID)
	local Timer = 0
	local stepTime = 3--產生花的間隔時間
	local amount = 1--花的數量
	local FlagID = Zone13_PE03_Var["FlagID"][2]
	local Goal = GetMoveFlagCount( FlagID )-1
	while 1 do
		if DW_CheckDis( QuestCar, FlagID, Goal , 30 ) == true then--到達目標則不在產生花
			break
		else
			if Timer>=0 and Timer%stepTime==0 then
				local flowers = kg_CreateArcByObj( QuestMember , 105318, 0 , 70  , amount , -1 , 89,91 )--(參考物件,物件ID,顯示,距離,數量,面向,最小角度,最大角度)
				for i in pairs(flowers) do
					SetFlag( flowers[i], 544801, 1 )--關閉帕奇鼠
					SetModeEx( flowers[i] , EM_SetModeType_Revive, false)	--可重生
					WriteRoleValue( flowers[i], EM_RoleValue_LiveTime, 10 )--生存時間
					AddToPartition( flowers[i] , RoomID )
					SysCastSpellLv( QuestCar, flowers[i], 496946, 0 )--增加仇恨
					DebugMsg(0,0,flowers[i])
				end
			end
		end
		Sleep(10)
		Timer = Timer+1
	end
end

function Lua_Zone13_PE03_Skill08_02()--殺掉花與貨物
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==105318 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105183  then--花
		KillID(Tid,Tid)--SysCastSpellLv( Oid,Tid,497049,110 )
	elseif ReadRoleValue( Tid , EM_RoleValue_OrgID )==105304 then--貨車
		SysCastSpellLv( Oid,Tid,497049,25 )
	end
end