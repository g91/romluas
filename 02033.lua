--780081 路易斯移動用的旗子
--780082 產生npc使用的旗子
--780083 npc移動使用的旗子
--使用物品：披風=>取得偽裝buff
----------------------------------------------------------------------------
--使用物品檢查(騎乘禁用)
function LuaS_423503_DW_0()
	if	DW_CheckRide(OwnerID())	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_NORIDE]", 0 )
		return false
	end
	return true
end
----------------------------------------------------------------------------
--使用物品執行劇情
function LuaS_423503_DW_1()
	AddBuff(OwnerID(),507575,1,600)
end
----------------------------------------------------------------------------
--在新產生的任務NPC執行任務主體script
function LuaS_423503_DW_2(Q_NPC)
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),0)
--種出所有的真理之手
	local TrueHand = {}
	for i=1,5,1 do
		TrueHand[i] = Lua_DW_CreateObj("flag",104328,780082,i,0)
--關閉戰鬥
		DW_UnFight(TrueHand[i])
--第5隻先不進場
		if	i~=5	then	AddToPartition(TrueHand[i],0)	end
	end
--種出鍋爐(特效隱形球)&關閉名字&關閉頭像框
	local Boiler = Lua_DW_CreateObj("flag",116296,780082,6)--113568
	SetModeEx(Boiler,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Boiler,EM_SetModeType_HideName,true)
	Yell(OwnerID(),"[SC_423503_23]",3)
--路易斯移動到指定位置
	DW_MoveToFlag( OwnerID() , 780081 , 1,0  )
--播放使用物品的動作
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)
	sleep(20)
--真理之手1轉向
--真理之手1：等等，那瓶藥劑的顏色怎麼有些濃稠。
	AdjustFaceDir(TrueHand[1],OwnerID(),0)
	Yell(TrueHand[1],"[SC_423503_4]",2)
	PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(10)
--路易斯移動到旗標2
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	DW_MoveToFlag( OwnerID() , 780081 , 2,0 )
	AdjustFaceDir(OwnerID(),TrueHand[1],0)
--路易斯：是嗎？不然你要不要檢查一下，這可是傑克昨天花了一整天弄來的藥劑呢？
	Yell(OwnerID(),"[SC_423503_5]",2)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--真理之手2&3自動靠近
	CallPlot(TrueHand[2],"DW_MoveToFlag",TrueHand[2],780083 , 1,0 )
	CallPlot(TrueHand[3],"DW_MoveToFlag",TrueHand[3],780083 , 2,0 )
	sleep(20)
	AdjustFaceDir(TrueHand[2],TrueHand[1],0)
	AdjustFaceDir(TrueHand[3],TrueHand[1],0)
	sleep(5)
--真理之手1：好吧！聞起來，的確差不多...或許是我多心了！
	Yell(TrueHand[1],"[SC_423503_6]",2)
	PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
--真理之手2：怎麼又和傑克對上了啊？
	Yell(TrueHand[2],"[SC_423503_7]",2)
	PlayMotion(TrueHand[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(TrueHand[4],"DW_MoveToFlag",TrueHand[4],780083 , 3,0 )
	sleep(20)
	AdjustFaceDir(TrueHand[4],TrueHand[1],0)
--真理之手3：不要因為人家能去重現龍王實驗小組，就找人家的麻煩啊！
	Yell(TrueHand[3],"[SC_423503_8]",2)
	PlayMotion(TrueHand[3],ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(20)
--真理之手4：都說夠了嗎？可以開始實驗了嗎？
	Yell(TrueHand[4],"[SC_423503_9]",2)
	PlayMotion(TrueHand[4],ruFUSION_ACTORSTATE_EMOTE_STRETCH)
--路易斯自動移動到旗標3
	DW_MoveToFlag( OwnerID() , 780081 , 3,0 )
	AdjustFaceDir(OwnerID(), TrueHand[3],0)
--播鍊金動作
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)
	sleep(10)
--路易斯：沃克絲，差不多輪到你了。
	Yell(OwnerID(),"[SC_423503_10]",2)
	sleep(15)
--真理之手 1&2&3&4 面向路易斯施法
	for i=1,4,1 do
		AdjustFaceDir(TrueHand[i],OwnerID(),0)
		CastSpell(TrueHand[i],OwnerID(),492184)
	end
--畫面中央訊息：趁他們沒看見的時候將藥粉倒進鍋爐！
	SetPlot(Boiler,"touch","LuaS_423503_DW_8",50)
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	and
			CheckBuff(Player[i],507575)==true		then
			ScriptMessage( Player[i], Player[i], 2, "[SC_423503_11]", 0 )
		end
	end
--在這裡 Player 當作判斷迴圈執行次數
	Player = 0
	while true do
		sleep(10)
--當有玩家已經跑完讀秒條 直接跳過判斷
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==30	then
			break
		end
		Player = Player +1
--判斷鍋爐有沒有Buff
		if	CheckBuff(Boiler,507592)==true	then
			Player = Player - 1
		end
		if	Player >6	then
			SetPlot(Boiler,"touch","",0)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,20)
			break
		end
	end
--檢查是否有中斷劇情的必要
	Player = SearchRangePlayer ( Boiler , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	and
			CheckBuff(Player[i],507575)==true	then
			break
		end
--附近沒有進行任務的玩家 取消任務 把該刪的都刪一刪
		if	i==table.getn(Player)	then
			LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
		end
	end
--檢查接下來應該執行哪一段
--超過6秒沒有成功點擊鍋爐
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==20	then
--關閉觸碰劇情
		SetPlot(Boiler,"touch","",0)
--畫面中央訊息：別動！有人來了......
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true and
				CheckBuff(Player[i],507575)==true	then
				ScriptMessage( Player[i], Player[i], 2, "[SC_423503_18]", 0 )
			end
		end
--真理之手5上場&移動到指定位置
		AddToPartition(TrueHand[5],0)
		WriteRoleValue(TrueHand[5],EM_RoleValue_IsWalk,0)
		Hide(TrueHand[5])
		Show(TrueHand[5],0)
		DW_MoveToFlag( TrueHand[5] , 780083 , 4, 0  )
--真理之手5停下的時候說：不好了，我在xxxoo，發現了傑克的屍體...
		Yell(TrueHand[5],"[SC_423503_12]",2)
		sleep(20)
--取最近的玩家
		local MainRole = 0
		Player = SearchRangePlayer ( Boiler , 250 )
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)==true	then
				MainRole = i
				break
			end
--如果檢查沒過就刪除一切
			if	i==table.getn(Player)	then
				LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
			end
		end
--真理之手1&2&3&4停止施法 轉向玩家
		for i=1,4,1 do
			SysCastSpellLv(OwnerID(),TrueHand[i],492185,1)
			AdjustFaceDir(TrueHand[i],Player[MainRole],0)
		end
		sleep(15)
--真理之手1：我就說那瓶藥劑有問題！你到底是誰？
		Yell(TrueHand[1],"[SC_423503_13]",2)
		PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(5)
--真理之手2&3 攻擊玩家(開啟戰鬥)
		for i=2,3,1 do
			DW_UnFight(TrueHand[i],false)
			if	CheckID(Player[MainRole])	then
				SysCastSpellLv(Player[MainRole],TrueHand[i],495751,DW_Rand(50))
			end
		end
		sleep(20)
--真理之手2：揭開他的袍子看看！
		Yell(TrueHand[2],"[SC_423503_14]",2)
		PlayMotion(TrueHand[2],ruFUSION_ACTORSTATE_EMOTE_POINT)
		CastSpell(TrueHand[3],TrueHand[3],496214)
--取消玩家的變身buff
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)==true		then
				CancelBuff(Player[i],507575)
			end
		end
--表示任務已完成至最後階段
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,99)
	end
--玩家施法條跑完的階段
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==30	then
--關閉觸碰劇情
		SetPlot(Boiler,"touch","",0)
		Player = SearchRangePlayer ( Boiler , 250 )
		local MainRole = 0
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)==true		then
				MainRole = i
				break
			end
--若無就中斷
			if	i==table.getn(Player)	then
				LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
			end
		end
--將玩家定身(目前使用行動不能)
		AddBuff(Player[MainRole],507646,1,10)
--真理之手5跑向玩家
		AddToPartition(TrueHand[5],0)
		MoveToFlagEnabled(TrueHand[5], false)
		sleep(5)
--真理之手5施法(盾牌猛擊)
		if	CheckID(Player[MainRole])~= nil	then
			CastSpell(TrueHand[5],Player[MainRole],492224)
		end
		sleep(20)
--解除玩家變身buff
		Player = SearchRangePlayer ( Boiler , 250 )
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)	then
				if	i<=MainRole	then
					MainRole = i
				end
			end
--解除變身
			CancelBuff(Player[i],507575)
--解除劇情限制
			AddBuff(Player[i],507646,1,6)
		end
--真理之手1&2&3&4 轉向玩家
		for i=1,4,1 do
			SysCastSpellLv(OwnerID(),TrueHand[i],492185,1)
			AdjustFaceDir(TrueHand[i],Player[MainRole],0)
		end	
		sleep(5)
--真理之手1：你不是傑克！這是怎麼回事！
		Yell(TrueHand[1],"[SC_423503_15]",2)
		PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(25)
--真理之手5：我發現傑克的屍體！這是個冒牌貨！
		Yell(TrueHand[5],"[SC_423503_16]",2)
		PlayMotion(TrueHand[5],ruFUSION_ACTORSTATE_EMOTE_KICK)
		sleep(20)
--真理之手2：殺了他！
		Yell(TrueHand[2],"[SC_423503_17]",2)
		PlayMotion(TrueHand[2],ruFUSION_ACTORSTATE_EMOTE_VICTORY)
--開啟真理之手2&3的戰鬥旗標
--真理之手2&3攻擊玩家
		sleep(15)
		for i=2,3,1 do
			DW_UnFight(TrueHand[i],false)
			if	CheckID(Player[MainRole])	then
				SysCastSpellLv(Player[MainRole],TrueHand[i],495751,DW_Rand(50))
			end
		end
	end
	sleep(20)
--將路易斯的預設動作設為徒手戰鬥
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	FaceObj( OwnerID(), TrueHand[1])
--等待
	while	CheckDistance(TrueHand[1],OwnerID(), 25)==false	do
		sleep(5)
	end
	sleep(5)
--路易斯對真理之手1施法
	CastSpell(OwnerID(),TrueHand[1],496213)
	sleep(10)
	Yell(TrueHand[1],"[SC_423503_22]",2)
	KillID(OwnerID(),TrueHand[1])
	sleep(15)
--真理之手4：原來你也是內應！
	Yell(TrueHand[4],"[SC_423503_19]",2)
	PlayMotion(TrueHand[4],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(10)
--開啟真理之手4&5&莫里斯的戰鬥旗標
	DW_UnFight(OwnerID(),false)
	for i=4,5,1 do
		DW_UnFight(TrueHand[i],false)
--真理之手4&5攻擊莫里斯
		SysCastSpellLv(OwnerID(),TrueHand[i],495751,DW_Rand(50))
	end
--摩瑞克出現
	local Morek = Lua_DW_CreateObj("flag",104330,780082,7)
	DW_UnFight(Morek)
	WriteRoleValue(Morek,EM_RoleValue_IsWalk,0)
	Hide(Morek)
	Show(Morek,0)
	DW_MoveToFlag( Morek , 780083 , 5,0  )
	DW_UnFight(Morek,false)
--攻擊真理之手2&3&4&5(一擊殺)
	for i=1,5,1 do
		SysCastSpellLv(TrueHand[i],Morek,495751,1)
	end
	SysCastSpellLv(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),Morek,495751,DW_Rand(50))
	while	true	do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)==0	then
			break
		else
			SysCastSpellLv(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),Morek,495751,DW_Rand(50))
		end
	end
--施放掃場法術

--摩瑞克：你怎麼會和路易斯在一起？
	Yell(Morek,"[SC_423503_20]",2)
	PlayMotion(Morek,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--摩瑞克移動到路易斯附近
	FaceObj( Morek, OwnerID())
	sleep(20)
	Player = SearchRangePlayer ( Morek , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	then
--摩瑞克轉向玩家
			AdjustFaceDir(Morek,Player[i],0)
			break
		end
	end
	sleep(5)
--摩瑞克：我先帶他離開...一會兒，我們在[116244]那兒見！
	Yell(Morek,"[SC_423503_21]",2)
	PlayMotion(Morek,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
--給予附近有任務也有buff的玩家完成任務的旗標
	Player = SearchRangePlayer ( Morek , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	then
			SetFlag(Player[i],544356,1)
		end
	end
--刪除所有物件
	LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5],Morek)
end
----------------------------------------------------------------------------
function LuaS_423503_DW_3()
	DeBugMSG(0,0,"1")
--確認可以使用的條件
	if	CheckAcceptQuest(OwnerID(),423503)==true	and
		CheckBuff(OwnerID(),507575)==false			and
		CheckFlag(OwnerID(),544356)==false			then
	DeBugMSG(0,0,"2")
--用NPC身上的狀態 判斷是否要進行遊戲
		CallPlot(OwnerID(),"DW_ChooseOneFromTwo",OwnerID(),"[SC_QUESTEXECUTESURE_0]","LuaS_423503_DW_6","LuaS_423516_2" )
	end
end
----------------------------------------------------------------------------
--路易斯‧戴爾的對話劇情
function LuaS_423503_DW_4()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423503)		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423503_0]","LuaS_423503_DW_5", 0 )
	end
end
----------------------------------------------------------------------------
--對話選項的執行劇情
function LuaS_423503_DW_5()
	CloseSpeak(OwnerID())--關閉對話
	if	CheckBuff(OwnerID(),507575)		then
--鎖定NPC(不怕玩家同時觸發)
		DisableQuest(TargetID(),true)
--Hide
		Hide(TargetID())
		local Player = SearchRangePlayer ( TargetID() , 200 )
		for k,i in ipairs(Player) do
			if	CheckAcceptQuest(i,423503)==true	and
				CheckBuff(i,507575)	then
--密語玩家
				Tell(i,OwnerID(),"[SC_423503_2]")
			end
		end
--產生全域變數
		GlobalValue_Z18_DW_01 = Lua_DW_CreateObj("obj",104331,TargetID())
--開始執行任務
		CallPlot(GlobalValue_Z18_DW_01,"LuaS_423503_DW_2",TargetID())
	else
--提示要穿斗蓬
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_423503_1]", 0 )
	end
end
----------------------------------------------------------------------------
--立刻跳過去任務進行的位置
function LuaS_423503_DW_6()
--先確認種出來的NPC還存在
	if	GlobalValue_Z18_DW_01~=nil	then
--以下借用蘇哥的Lua_CreateObjByDir函式
		local face = 0
		local Dis = 100
		local Org = Role:new( GlobalValue_Z18_DW_01 )
		local Pos = {}
		local Dir = Org:Dir()
		local  NewRole
		local Cal
		if face == nil or Type( face) ~= "number" then
			face = 0
		end
		Cal = (math.pi/180)*(Dir ) 
		Pos["X"] = Org:X() +(Dis*math.cos(Cal))
		Pos["Z"] = Org:Z() - (Dis*math.sin(Cal))
		Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] );
		for i = 1 , 9 , 1 do
			if CheckLine( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
				Pos["X"] = Org:X() +(Dis*math.cos(Cal))*(10-i)/10
				Pos["Z"] = Org:Z() -(Dis*math.sin(Cal))*(10-i)/10
				Pos["Y"] = GetHeight( Pos["X"] ,  Org:Y() , Pos["Z"] )
			else
				break
			end
		end
		if Dis >= 0 then
			Dir = Dir +180-face
		else
			Dir = Dir + face
		end
		if Dir > 360 then
			Dir = Dir - 360
		end
		if Dir < 0 then
			Dir = Dir + 360
		end
--判斷要不要上buff
		if	ReadRoleValue(GlobalValue_Z18_DW_01,EM_RoleValue_PID)<50	then
			AddBuff(OwnerID(),507575,1,600)
		end
--將玩家傳送到該位置
		ChangeZone(OwnerID(),18,0,Pos["X"],Pos["Y"],Pos["Z"],Dir)
	end
end
----------------------------------------------------------------------------
--秀訊息安撫玩家
function LuaS_423503_DW_7(PlayerID)
	ScriptMessage( PlayerID, PlayerID, 1, "[SC_423503_3]", 0 )
end
----------------------------------------------------------------------------
--鍋爐的觸碰劇情
function LuaS_423503_DW_8()
	if	CountBodyItem(OwnerID(),208119)==0	then --沒藥粉就去死
		return false
	end
	if	BeginCastBarEvent(OwnerID(),TargetID(),"[SC_USING]",30,  ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END  ,0 , "LuaS_423503_DW_10" )~= 1	then
--若有其他人在用的話
		ScriptMessage( OwnerID(), OwnerID() , 1, "[SAY_NPC_BUSY]", 0 )
		return
	else
		AddBuff(TargetID(),507592,6,7)
	end
end
----------------------------------------------------------------------------
--刪除所有物件的劇情
function LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand1,TrueHand2,TrueHand3,TrueHand4,TrueHand5,Morek)
--刪掉除了自己以外的其他物件
	DelObj(Boiler)
	if	CheckID(TrueHand1)	then
		DelObj(TrueHand1)
	end
	if	CheckID(TrueHand2)	then
		DelObj(TrueHand2)
	end
	if	CheckID(TrueHand3)	then
		DelObj(TrueHand3)
	end
	if	CheckID(TrueHand4)	then
		DelObj(TrueHand4)
	end
	if	CheckID(TrueHand5)	then
		DelObj(TrueHand5)
	end
	if	Morek~=nil	then
		if	CheckID(Morek)	then		DelObj(Morek)	end
	end
--清除全域變數
	GlobalValue_Z18_DW_01 = nil
--恢復開啟任務的NPC
	DisableQuest(Q_NPC,false)
	Show(Q_NPC,0)
--刪除自己
	DelObj(OwnerID())
end
----------------------------------------------------------------------------
--讀秒條結束後的範圍
function LuaS_423503_DW_10(Executer,Result)
--判斷結束情況
	if	Result~=0	then
		if	Result>0	then
--成功狀態
			EndCastBar(Executer,Result)
			DelBodyItem(OwnerID(),208119,CountBodyItem(OwnerID(),208119))
			WriteRoleValue(GlobalValue_Z18_DW_01,EM_RoleValue_PID,30)
		else
--失敗狀態
--取消鍋爐上的buff
			EndCastBar(Executer,Result)
			CancelBuff(TargetID(),507592)
		end
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------