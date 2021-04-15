
-----------------------------------------------車隊中控器-----------------------------------------------------------------
function Lua_Zone14_PE03_WtFail( )--貨物爆掉,車隊成員運送失敗,Step:車隊目前的目標
	DebugMsg(0,0,"Zone14_PE03_WtFail Start..")
	Debuglog( 2,"Lua_Zone14_PE03_WtFail Start.." )
	local Oid = OwnerID()--終點
	local FlagID = 780885
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	kg_Z14PE03_DelWagonTrain( 0 )
	local FirstMember = 0--第一位到達的
	local DeadCount = 0--成員死亡計數
	local Step=0; local Goal=2;	local DisTable={}; local tempTable={};local MemberStep={}
	
	local MemberCount = table.getn(FriendArray)
	if MemberCount>0 then
		Say(FriendArray[1],"[SC_PE_ZONE14_03_TALK17]")
		for i in pairs(FriendArray) do--不反擊逃跑
			SetModeEx( FriendArray[i] , EM_SetModeType_Strikback, FALSE) ---反擊
			SetModeEx( FriendArray[i] , EM_SetModeType_Searchenemy, FALSE)	--索敵
			Hide(FriendArray[i])
			ClearHateList( FriendArray[i] , -1 )
			SetStopAttack( FriendArray[i] )
			Show( FriendArray[i],0 )
			if CheckBuff(FriendArray[i], 509261)~=true then
				AddBuff( FriendArray[i], 509261, 0, -1 )--騎乘30%
			end
			DisTable={}
			for j=2,GetMoveFlagCount( FlagID )-1 do--從旗標2開始記錄距離
				DisTable[j]={ [1]=j , [2]=kg_GetDis(FriendArray[i],FlagID,j) }
			end
			for j=2,table.getn(DisTable) do
				for k=j+1, table.getn(DisTable) do
					if DisTable[k][2]<DisTable[j][2] then
						tempTable=DisTable[j]
						DisTable[j] = DisTable[k]
						DisTable[k] = tempTable
					end
				end
			end
			MemberStep[FriendArray[i]]=DisTable[2][1]--各自找出最近的旗標編號
		end
		
		while 1 do
			DeadCount=0
			for i in pairs(FriendArray) do
				if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==1 then--計算隊員死亡的數量
					DeadCount = DeadCount+1
				end
			end
			if DeadCount >= MemberCount then break end
			for i in pairs(FriendArray) do
				Step = MemberStep[FriendArray[i]]
				if Step>=Goal then
					if Step>Goal and kg_GetDis(FriendArray[i],FlagID, Step )<=50 then
						Step=Step-1
						MemberStep[FriendArray[i]]=Step
					elseif Step==Goal and kg_GetDis(FriendArray[i],FlagID, Step )<=50 then
						FirstMember = FriendArray[i]
						break
					else
						KS_Move(FriendArray[i],30,FlagID, Step )
					end
				end
			end
			if FirstMember>0 then
				for i in pairs(FriendArray) do
					if FriendArray[i]~= FirstMember then
						DelObj(FriendArray[i])
					end
				end
				break
			end
			Sleep(10)
		end
	end
	if DeadCount < MemberCount then
		while 1 do
			if kg_GetDis(FirstMember,780933,1)<=30 or ReadRoleValue(FirstMember,EM_RoleValue_Register7)==1 or CheckID(FirstMember)~=true then
				break
			else
				KS_Move(FirstMember,0,780933,1)
			end
			Sleep(10)
		end
		if kg_GetDis(FirstMember,780933,1)<=30 and ReadRoleValue(FirstMember,EM_RoleValue_Register7)==0 and CheckID(FirstMember)==true then
			BeginPlot( FirstMember ,"Lua_Zone14_PE03_FailShow", 0 )
		end
	end
end

function Lua_Zone14_PE03_FailShow(  )
	local FirstMember = OwnerID()
	local QuestNPC = Zone14_PE03_QuestNPC
	Hide(FirstMember)
	SetModeEx( FirstMember , EM_SetModeType_Fight, false)--不可砍殺
	Show(FirstMember,0)
	CancelBuff(FirstMember,509261)
	Sleep(5)
	AdjustFaceDir( FirstMember,QuestNPC,0 )
	Sleep(10)
	Say(FirstMember,"[SC_PE_ZONE14_03_TALK18]")
	Sleep(10)
	AdjustFaceDir(QuestNPC,FirstMember,0)
	Sleep(10)
	Say(QuestNPC,"[SC_PE_ZONE14_03_TALK19]")
	Sleep(20)
	Say(FirstMember,"[SC_PE_ZONE14_03_TALK20]")
	Sleep(20)
	DelObj(FirstMember)
	FaceFlag( QuestNPC, 780885 , 3 )
	AdjustDir( QuestNPC,0 )
end

function Lua_Zone14_PE03_WTCtrlInit()--車隊中控器初始化  中控器:117676 馬:105481 貨物:105441 跟隨目標: 117201
	DebugMsg(0,0,"Pe1403 WagonTrainInit Start")
	Debuglog(2,"Pe1403 WagonTrainInit Start")
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local FlagID =Zone14_PE03_FlagID
	local FlagStartPoint = 1--出發點
	local IsWalk = 0
	local Ctrl = kg_GetPosRX( {FlagID,FlagStartPoint } ,117676 )
	kg_InvisibleObjInit( Ctrl )
	AddToPartition(Ctrl,RoomID)
	if Zone14_PE03_WagonTrain.FollowTarget~=nil and CheckID( Zone14_PE03_WagonTrain.FollowTarget )==true then
		DebugMsg(0,0,"Delete WagonTrain...")
		Debuglog(2,"Delete WagonTrain...")
		kg_Z14PE03_DelWagonTrain()
	end
	local FollowTarget = kg_GetRangePos(FlagID,115053,50,0,-3,FlagStartPoint)
	MoveToFlagEnabled( FollowTarget, false )
	Lua_Zone14_PE03_Born( FollowTarget )
	kg_MoveCtrl(FollowTarget)
	SetModeEx( FollowTarget , EM_SetModeType_Show, false)--是否繪製出模型
	WriteRoleValue( FollowTarget,EM_RoleValue_IsWalk, 1 )
	AddToPartition(FollowTarget,RoomID)
	--
	local Horse = kg_GetRangePos(FlagID,105481,20,0,-3,FlagStartPoint)
	MoveToFlagEnabled( Horse, false )
	Lua_Zone14_PE03_Born( Horse )
	kg_MoveCtrl( Horse )
	SetModeEx( Horse, EM_SetModeType_HideName, true)
	WriteRoleValue( Horse,EM_RoleValue_PassengerAttackable,1 )--乘客可以被打
	WriteRoleValue( Horse,EM_RoleValue_IsWalk, IsWalk )
	AddToPartition( Horse,RoomID )
	--
	local Goods = kg_GetRangePos(FlagID,105441,0,0,-3,FlagStartPoint)
	MoveToFlagEnabled( Goods, false )
	Lua_Zone14_PE03_Born( Goods )
	kg_MoveTarget( Goods )
	--WriteRoleValue( Goods , EM_RoleValue_Register9 , 0 )--當貨物掛點時,記住目前要去的旗標
	WriteRoleValue(Goods,EM_RoleValue_Register10,Horse)--當貨物得到現地，可以讓馬車也定身
	AddToPartition(Goods,RoomID)
	SetPlot(Goods,"dead","Lua_Zone14_PE03_Dead04_01",0)
	--
	local FlagX = GetMoveFlagValue( FlagID , FlagStartPoint , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagID , FlagStartPoint , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagID , FlagStartPoint , EM_RoleValue_Z )
	local CurrentDir = ReadRoleValue( FollowTarget , EM_RoleValue_Dir )--當前方向
	local TransTeamPosition = Lua_Zone14_PE03_FormationPosition( FlagX , FlagY , FlagZ, 35, CurrentDir )--四角陣型設定區
	local FriendID = Zone14_PE03_Var["Friend"]
	local FriendArray = {}
	for i =1,4 do
		--local Friend = kg_GetRangePos(FlagID,FriendID[i],50,Angle,-3,FlagStartPoint)
		FriendArray[i] = CreateObj( FriendID[i] , TransTeamPosition["X"][i], TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] , CurrentDir , 1 )
		MoveToFlagEnabled( FriendArray[i], false )
		Lua_Zone14_PE03_Born( FriendArray[i] )
		SetModeEx( FriendArray[i] , EM_SetModeType_Revive, false )	--可重生
		WriteRoleValue( FriendArray[i],EM_RoleValue_IsWalk, IsWalk )
		AddToPartition(FriendArray[i],RoomID)
	end
	
	AddBuff( FollowTarget, 509257, 260, -1 )--加速15%
	AddBuff( Horse, 509257, 20, -1 )--加速45%
	AddBuff(Goods,508887,0,-1)--不回血
	AddBuff( Goods, 507514, 0, -1 )--免疫治療
	AddBuff( Goods, 509257, 30, -1 )--加速30%
	AddBuff(Goods,509259,10,-1)--貨物安全中!
	AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
	
	Zone14_PE03_WagonTrain.Ctrl=Ctrl
	 Zone14_PE03_WagonTrain.FollowTarget=FollowTarget
	 Zone14_PE03_WagonTrain.Horse =Horse
	 Zone14_PE03_WagonTrain.Goods=Goods
	 Zone14_PE03_WagonTrain.Friend=FriendArray
	 
	 CallPlot(Ctrl,"Lua_Zone14_PE03_WagonTrainMove",FollowTarget,Horse,Goods)
	 Debuglog(2,"Pe1403 WagonTrainInit End")
end

function Lua_Zone14_PE03_WagonTrainMove( FollowTarget,Horse,Goods )--497374
	DebugMsg(0,0,"WagonTrain Start Moving...")
	Debuglog(2,"WagonTrain Start Moving...")
	Sleep(10)
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	for i in pairs(FriendArray) do
		WriteRoleValue(FriendArray[i],EM_RoleValue_PID,140303 )
		AddBuff( FriendArray[i], 509261, 0, -1 )--騎乘30%
	end
	local TransCarX , TransCarY , TransCarZ
	local CurrentDir = ReadRoleValue( FollowTarget , EM_RoleValue_Dir )--當前方向
	local TransTeamPosition = {}--四角陣型設定區
	local PreviousDir = CurrentDir--舊的方向
	local DeltaDir = 0	--偏移方向
	local Range = 35 --陣行範圍
	local CurrentTeamNum = 4
	local InBattle =false
	local FlagID = Zone14_PE03_FlagID
	local CheckDis = 120--偏移距離
	local Step = 2
	local Goal =  GetMoveFlagCount( FlagID )-1
	DebugMsg(0,0,"Goal="..Goal)
	local timer =0
	local TalkOnce = 0--剛進入戰鬥隊員講話
	local TalkGroup = {}
	while 1 do
		if timer%2==0 then
			SysCastSpellLv(Horse,Horse,497374,0)--給玩家buff,用來判定玩家是否有在保護馬車
			--SysCastSpellLv( Goods,Goods,497377,0 )--群嘲
		end
		if InBattle == false   then
			if CheckBuff( Goods ,509259 )~=true and table.getn(Zone14_PE03_WagonTrain.Friend)~=0 then--當貨物被打,buff消失 , 當已經沒有隊員時,貨物將不會停下來
				InBattle = true
				StopMove( Horse, true )
				StopMove( FollowTarget, true )
				DetachObj(Goods)
				SetPos(Goods,kg_GetPosRX(Horse,nil,25,0,180,-3))
				SysCastSpellLv( Goods,Goods,497377,0 )--群嘲
				TalkGroup={}
				for i in pairs(FriendArray) do
					StopMove( FriendArray[i], true )
					CancelBuff( FriendArray[i], 509304 )--解除騎乘
				end
			end
		end
		if InBattle == false then
			for i in pairs(FriendArray) do
				if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0  and KS_InCombat(FriendArray[i]) == true then--為死亡且進入戰鬥
					InBattle = true
					StopMove( Horse, true )
					StopMove( FollowTarget, true )
					CancelBuff(Goods,509259)
					DetachObj(Goods)
					SetPos(Goods,kg_GetPosRX(Horse,nil,25,0,180,-3))
					local EnemyTarget = ReadRoleValue(FriendArray[i],EM_RoleValue_AttackTargetID)
					SysCastSpellLv( Goods , EnemyTarget, 496946, 0 )--讓怪物也有貨物的仇恨
					SysCastSpellLv( Goods,Goods,497377,0 )--群嘲
					TalkGroup={}
					for j in pairs(FriendArray) do
						CancelBuff( FriendArray[j], 509304 )--解除騎乘
						SysCastSpellLv( EnemyTarget , FriendArray[j], 497448, 0 )--叫所有隊員先對同一目標打
					end
					break
				end
			end
		end
		
		if InBattle == true then
			if TalkOnce==0 then
				TalkOnce=1
				TalkGroup={}
				for i in pairs(FriendArray) do
					if ReadRoleValue(FriendArray[i], EM_RoleValue_Register7)==0 then
						table.insert(TalkGroup,FriendArray[i])
					end
				end
				Lua_Zone14_PE03_FriendTalk( TalkGroup )
			end
			if timer%3==0 then AddBuff(Goods,509259,0,-1) end
			local Count = 0--計算沒進入戰鬥的成員
			local BattleCount = 0
			FriendArray = Zone14_PE03_WagonTrain.Friend
			for i in pairs(FriendArray) do
				if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0 and KS_InCombat(FriendArray[i]) ~= true then
					Count = Count+1
				elseif ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0  and KS_InCombat(FriendArray[i]) == true then
					BattleCount = BattleCount+1
					for j in pairs(FriendArray) do
						SysCastSpellLv( ReadRoleValue(FriendArray[i],EM_RoleValue_AttackTargetID) , FriendArray[j], 497448, 0 )--叫所有隊員先對同一目標打
					end
				end
			end
			--DebugMsg(0,0,"TeamCount = "..Count)
			if Count ==table.getn(Zone14_PE03_WagonTrain.Friend) and Count>0 and KS_CheckBuffLV(Goods,509259)>=2 then
				DebugMsg(0,0,"Leave Battle1..")
				Debuglog(2,"WagonTrain Leave Battle1")
				AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
				for i in pairs(FriendArray) do
					if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0 and KS_InCombat(FriendArray[i]) ~= true then
						AddBuff( FriendArray[i], 509304, 0, -1 )--騎乘30%
					end
				end
				InBattle = false
				TalkOnce=0
			elseif BattleCount==0 and KS_CheckBuffLV(Goods,509259)>=2 then--冒險者死亡，但玩家把怪物解決
				DebugMsg(0,0,"Leave Battle2..")
				Debuglog(2,"WagonTrain Leave Battle2")
				AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
				InBattle = false
				Say(Horse,"[SC_PE_ZONE14_03_TALK16]")--嘶嘶～～！！
				TalkOnce=0
			end
		elseif InBattle == false and CheckBuff(Horse,508560)==false and CheckBuff(Goods,509222)==false then--馬車與貨物都沒有訂身狀態
			TransCarX = ReadRoleValue( FollowTarget , EM_RoleValue_X )
			TransCarY = ReadRoleValue( FollowTarget , EM_RoleValue_Y )
			TransCarZ = ReadRoleValue( FollowTarget , EM_RoleValue_Z )
			CurrentDir = ReadRoleValue( FollowTarget , EM_RoleValue_Dir )--當前方向
		
			if Step<=Goal then
				if kg_GetDis(FollowTarget,FlagID,Step)<=100 and Step<Goal  then
					Step = Step+1
					--WriteRoleValue(Goods,EM_RoleValue_Register9,Step)
				elseif kg_GetDis(FollowTarget,FlagID,Step)<=30 and Step==Goal then
					SysCastSpellLv(Horse,Horse,497375,0)--給玩家完成的buff
					Sleep(10)
					if Zone14_PE03_FinishLine==0 then
						kg_Z14PE03_DelWagonTrain()
					else
						BeginPlot(Zone14_PE03_FinishLine,"Lua_Zone14_PE03_WTCtrlInit",0)
					end
					DebugMsg(0,0,"Pe1403 WagonTrainMove End")
					Debuglog(2,"Pe1403 WagonTrainMove End")
					break
				else
					if kg_GetDis(FollowTarget,FlagID,Step)<=750 and Step==5 then--解決地圖bug用
						DetachObj(Goods)
						SetPos( Goods,kg_GetPosRX(Horse,nil,25,0,180) )
						AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
					end
					KS_Move(FollowTarget,0,FlagID,Step)
				end
			end
		
			DeltaDir = math.abs( PreviousDir - CurrentDir )
			--DebugMsg(0,0,"DeltaDir="..DeltaDir)
			if DeltaDir > 90 and DeltaDir < 270 then	-- 變化陣型位置
				local tmp = 0
				if FriendArray[1] ~= nil and FriendArray[4] ~= nil then
					tmp = FriendArray[1]
					FriendArray[1] = FriendArray[4]
					FriendArray[4] = tmp
				end
				if FriendArray[2] ~= nil and FriendArray[3] ~= nil then
					tmp = FriendArray[2]
					FriendArray[2] = FriendArray[3]
					FriendArray[3] = tmp
				end
			end
			PreviousDir = CurrentDir
			TransTeamPosition = Lua_Zone14_PE03_FormationPosition( TransCarX , TransCarY , TransCarZ, Range, CurrentDir )
			local DeltaX = ( TransCarX - ReadRoleValue( Horse , EM_RoleValue_X ) )^2
			local DeltaZ = ( TransCarZ - ReadRoleValue( Horse , EM_RoleValue_Z ) )^2
			--DebugMsg(0,0,"CheckHorse Dis="..math.floor( (DeltaX+DeltaZ)^0.5) )
			if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then
				CancelBuff(Horse,509257)
				AddBuff( Horse, 509257, 200, -1 )
				CancelBuff(Goods,509257)
				AddBuff( Goods, 509257, 230, -1 )--加速30%
				--Say(Horse,"Speed up..")
			else
				CancelBuff(Horse,509257)
				AddBuff( Horse, 509257, 20, -1 )
				CancelBuff(Goods,509257)
				AddBuff( Goods, 509257, 30, -1 )--加速30%
			end
			MoveDirect( Horse , TransCarX , TransCarY , TransCarZ )--KS_Move(Horse,0,FollowTarget)
		
			for i in pairs(FriendArray) do
				DeltaX = ( TransTeamPosition["X"][i] - ReadRoleValue( FriendArray[i] , EM_RoleValue_X ) )^2
				DeltaZ = ( TransTeamPosition["Z"][i] - ReadRoleValue( FriendArray[i] , EM_RoleValue_Z ) )^2
				--Say( FriendArray[i], "Dis = "..math.floor( (DeltaX+DeltaZ)^0.5) )
				if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then	--是否偏離定位
					AddBuff( FriendArray[i], 509258, 60, 3 )--騎乘加速15%
					--Say(FriendArray[i],"Speed up..")
				else
					CancelBuff(FriendArray[i],509258)
				end
				MoveDirect( FriendArray[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end
		
		Sleep(10)
		timer = timer+1
	end
end

function Lua_Zone14_PE03_FriendTalk( TalkGroup )
	local Dialogue = { 	"[SC_PE_ZONE14_03_TALK01]",--物資絕對不會讓給你們的！！
				"[SC_PE_ZONE14_03_TALK02]",--可惡！別想得逞！！
				"[SC_PE_ZONE14_03_TALK03]",--該死的怪物們...！
				"[SC_PE_ZONE14_03_TALK04]",--滾開！！滾開！！
				"[SC_PE_ZONE14_03_TALK05]",--如果沒有你們的話......！
				"[SC_PE_ZONE14_03_TALK06]",--就是你們殺死副長的！！
				"[SC_PE_ZONE14_03_TALK07]",--......我好累...
				"[SC_PE_ZONE14_03_TALK08]",--好可怕好可怕好可怕...不能逃不能逃不能逃...
				"[SC_PE_ZONE14_03_TALK09]",--我...我...哇啊啊啊！！！
				"[SC_PE_ZONE14_03_TALK10]" }--只要把你們都殺光，我就能回家了...
	local TalkGroupCount = table.getn(TalkGroup)
	if TalkGroupCount ==1 then
		Say(TalkGroup[1],Dialogue[kg_Rand(10)])
	elseif TalkGroupCount==2 then
		local randTalk = kg_Rand(10)
		Say(TalkGroup[1],Dialogue[randTalk])
		randTalk = randTalk+kg_Rand(9)
		if randTalk>10 then randTalk=randTalk-10 end
		Say(TalkGroup[2],Dialogue[randTalk])
	elseif TalkGroupCount > 2 then
		local randMember = kg_Rand(TalkGroupCount)
		local randTalk = kg_Rand(10)
		Say(TalkGroup[randMember],Dialogue[randTalk])
		randTalk = randTalk+kg_Rand(9)
		if randTalk>10 then randTalk=randTalk-10 end
		randMember = randMember + 1
		if randMember>TalkGroupCount then randMember=1 end
		Say(TalkGroup[randMember],Dialogue[randTalk])
	end
end

function Lua_Zone14_PE03_FormationPosition( X , Y , Z , Range , Dir )--四角陣型設定區
	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X-Range*math.sin(Dir*math.pi/180+15 )	-- 右前--1
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Range*math.cos(Dir*math.pi/180+15)

	Position["X"][2] = X+Range*math.sin(Dir*math.pi/180-15)	-- 左前--2
	Position["Y"][2] = Y
	Position["Z"][2] = Z+Range*math.cos(Dir*math.pi/180-15)

	Position["X"][3] = X-Range*math.sin(Dir*math.pi/180-15)	-- 右後--3
	Position["Y"][3] = Y
	Position["Z"][3] = Z-Range*math.cos(Dir*math.pi/180-15)

	Position["X"][4] = X+Range*math.sin(Dir*math.pi/180+15)	-- 左後--4
	Position["Y"][4] = Y
	Position["Z"][4] = Z+Range*math.cos(Dir*math.pi/180+15)

	return Position;
end
----------------------------------------------Debug功能----------------------------------------------------------------------------------------------
function kg_Z14PE03_GetQuestKey( Player , KeyCount )--玩家,數量
	Player = Player or OwnerID()
	KeyCount = KeyCount or 20
	ks_QuestKill( Player, 105432, KeyCount )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--Say( Player, "I got "..KeyCount.." QuestKey!" )
end

function kg_Z14PE03_CarriageReach( Carriage )--馬車已達到終點
	Carriage = Carriage or OwnerID()
	SysCastSpellLv(Carriage,Carriage,497375,0)--護送馬車就有15G
end

function kg_Z14PE03_DelWagonTrain( AllDelete )--刪除車隊
	AllDelete = AllDelete or 1
	DelObj( Zone14_PE03_WagonTrain.FollowTarget )
	DelObj( Zone14_PE03_WagonTrain.Goods )
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	if AllDelete == 1 then
		DelObj( Zone14_PE03_WagonTrain.Horse )
		for i in pairs(FriendArray) do
			DelObj(FriendArray[i])
		end
	else
		BeginPlot( Zone14_PE03_WagonTrain.Horse,"kg_Z14PE03_HorseRunAway", 1 )
	end
	Zone14_PE03_WagonTrain.FollowTarget=0
	Zone14_PE03_WagonTrain.Goods=0
	Zone14_PE03_WagonTrain.Horse = 0
	Zone14_PE03_WagonTrain.Friend={}
	DelObj(Zone14_PE03_WagonTrain.Ctrl)
end

function kg_Z14PE03_HorseRunAway()--小白逃跑
	local Horse = OwnerID()
	Say(Horse,"[SC_PE_ZONE14_03_TALK16]")--嘶嘶～～！！
	local x,y,z,_ = kg_GetPosRX( Horse,nil,130,0,kg_Rand(360) )
	while 1 do
		MoveDirect( Horse, x,y,z )
		if kg_GetDis(Horse,x,y,z)<=30 then
			break
		end
		Sleep(10)
	end
	DelObj( Horse )
end

function kg_Z14PE03_PrintWagonTrain()--印出車隊
	DebugMsg(0,0,"FollowTarget = "..Zone14_PE03_WagonTrain.FollowTarget)
	Say(Zone14_PE03_WagonTrain.FollowTarget,Zone14_PE03_WagonTrain.FollowTarget)
	DebugMsg(0,0,"Horse = "..Zone14_PE03_WagonTrain.Horse)
	Say(Zone14_PE03_WagonTrain.Horse,Zone14_PE03_WagonTrain.Horse)
	DebugMsg(0,0,"Goods = "..Zone14_PE03_WagonTrain.Goods)
	Say(Zone14_PE03_WagonTrain.Goods,Zone14_PE03_WagonTrain.Goods)
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	for i in pairs(FriendArray) do
		DebugMsg(0,0,"Friend_"..i.." = "..FriendArray[i])
		Say(FriendArray[i],FriendArray[i])
	end
end
----------------------------------------------其他----------------------------------------------------------------------------------------------
function Lua_Zone14_PE03_ClearPlayerBuff( Player )--清除玩家在1403的專屬buff
	local Buff = { 509250,509242,509190 }
	kg_ClearBuff( Player,Buff )
	if CheckBuff(Player,509196)==true then
		Lua_Z14PE03_Skill08_DelHorse( Player )
	end
	WriteRoleValue( Player,EM_RoleValue_Register9,0 )
	WriteRoleValue( Player,EM_RoleValue_Register10,0 )
end

function LuaPE_Zone14_PE03_GetBuff( Player )--任務模板:取得玩家(Player)能取得的PE用BUFF
	Player = Player or TargetID()--玩家
	Lua_Zone14_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player,509188)
	LuaPE_KS_GetBuff( Player )
	if CheckBuff(Player,509181)==true then
		AddBuff(Player,509188,14,-1)
	end
end

function Lua_Zone14_PE03_QuestComplete()--完成任務執行
	local Player = TargetID()
	Lua_Zone14_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player,509188)
	if LuaPE_KS_CleanBuff( Player ) == true then
		local BuffID = 509177
		local Buff = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2 )
		if CheckBuff( Player, Buff ) == true and Buff ~= BuffID then
			CancelBuff( Player, Buff )
			WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			DebugMsg(0,0,"14PE03 QuestFin Count = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
			return
		end
		
		local PECount = ReadRoleValue( Player, EM_LuaValueFlag_PECount )		
		local Lv = KS_CheckBuffLV( Player, BuffID )
		DebugMsg(0,0,"Old PECount = "..PECount.."; BuffLV = "..Lv)
		if Lv > 0 or ( Lv == 0 and PECount > 5 ) then--目前進行的PE任務完成次數
			if Lv == 0 and PECount > 5 then
				WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			end
			AddBuff( Player, BuffID, 0, -1 )
			WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2, BuffID )--目前進行的PE所附帶的獎勵狀態
			DebugMsg(0,0,"New PECount = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
		end

	end
end