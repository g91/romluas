
--------------------------------------------------------------------------------
--康葛斯的對話劇情
function LuaS_423516_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423516)==true	and
		CheckFlag(OwnerID(),544396)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423516_0]","LuaS_423516_1", 0 )
	end
end
--------------------------------------------------------------------------------
function LuaS_423516_1()
	DW_CancelTypeBuff(68,OwnerID())--解除座騎
	if	GlobalValue_Z18_DW_02 ~= nil	then
		if	CheckID(GlobalValue_Z18_DW_02)==false	then
			GlobalValue_Z18_DW_02 = nil
		end
	end

--任務還沒開始
	if	GlobalValue_Z18_DW_02 == nil	then
--改變全域變數(關鍵)
		GlobalValue_Z18_DW_02 = Lua_DW_CreateObj("flag",104336,780084,1)
--建立康葛斯=>寫入PID=10=>開始進行流程
		WriteRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID,0)
		BeginPlot(GlobalValue_Z18_DW_02,"LuaS_423516_4",0)
--搜索範圍內玩家&有接任務的送去進行任務
		local Player = SearchRangePlayer( OwnerID() , 250 )
		for i=0,table.getn(Player),1 do
--詢問玩家是否進行任務
			if	CheckAcceptQuest(Player[i],423516)==true	and
				Player[i]~=OwnerID()	then
--關閉對話視窗
				CloseSpeak(Player[i])
				CallPlot(Player[i],"DW_ChooseOneFromTwo",Player[i],"[SC_QUESTEXECUTESURE_1]","LuaS_423516_3","LuaS_423516_2")
			end
		end

--最後把開啟任務的玩家送進去
		BeginPlot(OwnerID(),"LuaS_423516_3",0)

	else
--任務已經開始
--關閉對話視窗
		CloseSpeak(OwnerID())
--詢問玩家是否進行任務
		CallPlot(OwnerID(),"DW_ChooseOneFromTwo",OwnerID(),"[SC_QUESTEXECUTESURE_0]","LuaS_423516_3","LuaS_423516_2")
	end
end
--------------------------------------------------------------------------------
--玩家不接受進行任務
function LuaS_423516_2()
	CloseSpeak(OwnerID())
end
--------------------------------------------------------------------------------
--參與任務&進行傳送
function LuaS_423516_3()
--判斷任務階段&分配狀態(炸藥*2)
	GiveBodyItem(OwnerID(),208154,2)
	if	ReadRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID)<20	then
--畫面一黑
		AddBuff(OwnerID(),506098,1,3)
		AddBuff(OwnerID(),507914,1,3)
		SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
		BeginPlot(OwnerID(),"LuaS_423516_11",2)
--傳送
		DW_ChangeWithFlag(OwnerID(),780084,1,50)
		AddBuff(OwnerID(),507615,1,30)
		sleep(10)
	elseif	ReadRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID)<30	then
--畫面一黑
		AddBuff(OwnerID(),506098,1,10)
		AddBuff(OwnerID(),507914,1,10)
		BeginPlot(OwnerID(),"LuaS_423516_11",2)
--傳送
		DW_ChangeWithFlag(OwnerID(),780085,7,25)
	end
	for i=1,30,1 do
		if	GlobalValue_Z18_DW_02==nil	or
			CheckID(GlobalValue_Z18_DW_02)==false	then
			CancelBuff(OwnerID(),506098)
			CancelBuff(OwnerID(),507914)
			CancelBuff(OwnerID(),507615)
			return
		end
		sleep(10)
	end
end
--------------------------------------------------------------------------------
--任務流程=>導演：種出來的康葛斯
function LuaS_423516_4()
	DW_UnFight(OwnerID())
	AddBuff(OwnerID(),507615,1,300)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
--先等待至附近有人
	sleep(40)
--無聊先暖個場
	Say(OwnerID(),"[SC_110539_5]")
	sleep(35)
--開始檢查附近是不是有玩家出現
	local Player = {}
	for i=1,30,1 do
		sleep(1)
		Player = SearchRangePlayer ( OwnerID() , 300 )
		for k=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[k],423516)==true	and
				CheckBuff(Player[k],507615)==true		then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,11)
--(中央黃字訊息)你們埋好炸彈之後，喝下了變身藥水......
				ScriptMessage( OwnerID(), 0, 2, "[SC_423516_1]", 0 )
			end
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==11	then
			break
		end
		if	i==30	and
			ReadRoleValue(OwnerID(),EM_RoleValue_PID)<11	then
--若沒有搜尋到玩家=>執行收工程序
--尚未種出任務物件
			LuaS_423516_5()
			return
		end
	end
	sleep(15)
--康葛斯104336：噓.......我們現在是某種動物，一大一小，我是扮成大的那隻。
	Say(OwnerID(),"[SC_423516_2]")
	sleep(30)
--(出現向下指引的箭頭)
	local PointMark = {}
	PointMark[1] = Lua_DW_CreateObj("flag",104508,780084,2)
	PointMark[2] = Lua_DW_CreateObj("flag",104508,780084,3)
	Lua_ObjDontTouch( PointMark[1] )
	Lua_ObjDontTouch( PointMark[2] )
	DW_UnFight(PointMark[1])
	DW_UnFight(PointMark[2])
--康葛斯：看，我埋得真好， 他們絕不會發現炸藥在哪的！我等不及看好戲啦！
	Say(OwnerID(),"[SC_423516_3]")
	sleep(20)
--(中央黃字)：我的小麻雀...你想逃到哪？
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_4]", 0 )
--種出晨星跑過炸彈區
	local Star = Lua_DW_CreateObj("flag",104334,780084,4)
	WriteRoleValue(Star,EM_RoleValue_IsWalk,0)
	Hide(Star)
	Show(Star,0)
	DW_UnFight(Star)
	CallPlot(Star,"DW_MoveToFlag",Star , 780085, 1,0)
	sleep(30)
--(中央黃字)：難道你認為幾條雜魚就能讓你從我的掌中逃開嗎？
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_5]", 0 )
	sleep(5)
--拉法埃爾‧貝克德104332還有5隻死氣沉沉的戰士104335。(都關掉戰鬥旗標。)
	local Lafa = Lua_DW_CreateObj("flag",104332,780084,4)
	AdjustFaceDir(star,Lafa,0)
	DW_UnFight(Lafa)
	AdjustFaceDir(Lafa,star,0)
	sleep(5)
	local TrueHand = {}
	for i=1,5,1 do
		TrueHand[i] = Lua_DW_CreateObj("flag",104335,780084,i+4)
		DW_UnFight(TrueHand[i])
		AdjustFaceDir(TrueHand[i],star,0)
		sleep(1)
	end
	sleep(5)
--拉法埃爾‧貝克德SAY：小麻雀，過了這麼多年，還是這麼天真啊？
	Say(Lafa,"[SC_423516_6]")
	sleep(30)
--拉法挨爾‧貝克德SAY：圍上他。
	Say(Lafa,"[SC_423516_7]")
	PlayMotion(Lafa,ruFUSION_ACTORSTATE_EMOTE_POINT)
--5隻死氣沉沉的士兵走到炸彈的周圍，利用特效炸開，做死亡動作。
	for i=1,5,1 do
--開啟可砍殺
		SetModeEx(TrueHand[i],EM_SetModeType_Fight,true) 
		CallPlot(TrueHand[i],"DW_MoveToFlag",TrueHand[i] , 780085, i+1,0)
	end
	while	true	do
		sleep(2)
--炸彈1引爆
		if	DW_CheckDis(TrueHand[2],780084,3,40)	then
			CastSpell(PointMark[1],PointMark[1],494640)
			SysCastSpellLv(PointMark[1],PointMark[1],496178,1)
			WriteRoleValue(PointMark[1],EM_RoleValue_LiveTime,2)
			break
		end
	end
	while	true	do
		sleep(1)
--炸彈2引爆
		if	DW_CheckDis(TrueHand[4],780084,2,40)	then
			CastSpell(PointMark[2],PointMark[2],494640)
			SysCastSpellLv(PointMark[2],PointMark[2],496178,1)
			WriteRoleValue(PointMark[2],EM_RoleValue_LiveTime,2)
--為求保險 殺了所有的真理之手存活者
			for i=1,5,1 do
				if	CheckID(TrueHand[i])	then
					if	ReadRoleValue(TrueHand[i],EM_RoleValue_IsDead)==0	then
						KillID(PointMark[2],TrueHand[i])
					end
				end
			end
			AdjustFaceDir(Star,Lafa,0)
			break
		end
	end
	sleep(15)
--拉法挨爾‧貝克德SAY：小麻雀...這倒有些有趣呢！
	Say(Lafa,"[SC_423516_8]")
--去除掉康葛斯、玩家身上的變身BUFF。
	CancelBuff(OwnerID(),507615)
--改變暫存值的狀態
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,20)
--康葛斯大叫：他落單了！
	Say(OwnerID(),"[SC_423516_9]")
	Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423516)==true	and
			CheckBuff(Player[i],507615)==true	then
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,21)
			CancelBuff(Player[i],507615)
			SetDefIdleMotion(Player[i],ruFUSION_MIME_IDLE_STAND_02)
		end
--附近沒有玩家的話
		if	i==table.getn(Player) and
			ReadRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID)<21	then
			LuaS_423516_5(nil,nil,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5],PointMark[1],PointMark[2])
			return
		end
	end
--吉兒104109、勞勃104107由天空中飛下。圍繞在拉法挨爾‧貝克德的身邊。
	CallPlot(OwnerID(),"DW_MoveToFlag", OwnerID() , 780085 , 7,0 )
	local xyz1 = {7826.6,55,51785.8}
	local xyz2 = {7805.1,50,51861.9}
	local Lobo = Lua_DW_CreateObj("xyz",104107,xyz1,0)
	SetModeEx(Lobo,EM_SetModeType_Gravity,false) 
	DW_UnFight(Lobo)
	AddToPartition(Lobo,0)
	AddBuff(Lobo,506984,7,5)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_JUMP_LOOP)
	DW_MoveDirectToFlag( Lobo , 780085 , 8 )

	local Jill = Lua_DW_CreateObj("xyz",104109,xyz2,0)
	SetModeEx(Jill,EM_SetModeType_Gravity,false) 
	DW_UnFight(Jill)
	AddToPartition(Jill,0)
	AddBuff(Jill,506984,7,5)
	SetDefIdleMotion(Jill,ruFUSION_MIME_JUMP_LOOP)
	DW_MoveDirectToFlag( Jill , 780085 , 9 )

	while	true	do
		sleep(1)
		if	DW_CheckDis(Lobo,780085,8,20)	and
			DW_CheckDis(Jill,780085,9,20)		then
			break
		end
	end
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
--拉法挨爾‧貝克德SAY：遊戲還是要這樣才有趣...
	Say(Lafa,"[SC_423516_10]")
--拉法埃爾施法(出現5隻死氣沉沉的戰士攻擊。)
	CastSpell(Lafa,Lafa,496176)
	sleep(20)
	for i=1,5,1 do
		TrueHand[i] = Lua_DW_CreateObj("flag",104335,780084,i+4)
		DW_UnFight(TrueHand[i])
		AdjustFaceDir(TrueHand[i],star,0)
		SetDefIdleMotion(TrueHand[i],ruFUSION_MIME_IDLE_COMBAT_2H)
		sleep(1)
		CastSpell(TrueHand[i],TrueHand[i],496177)
	end
--拉法挨爾‧貝克德SAY：一舉將他們都生擒回去，除了小麻雀之外，其他都是艾娜莉亞大人的新玩具呢。
	Say(Lafa,"[SC_423516_11]")
	sleep(15)
	local Lafa_MaxHP = ReadRoleValue(Lafa,EM_RoleValue_MaxHP)
	DW_UnFight(Lafa,false)
	DW_UnFight(Lobo,false)
	DW_UnFight(Jill,false)
	DW_UnFight(Star,false)
--(拉法埃爾發動攻擊)
	SysCastSpellLv(Lafa,Lobo,495751,DW_Rand(100))
	SysCastSpellLv(Lafa,Star,495751,DW_Rand(100))
	SysCastSpellLv(Lafa,Jill,495751,DW_Rand(100))
	for i=1,5,1 do
		DW_UnFight(TrueHand[i],false)
		SysCastSpellLv(TrueHand[i],Lobo,495751,DW_Rand(100))
		SysCastSpellLv(TrueHand[i],Star,495751,DW_Rand(100))
		SysCastSpellLv(TrueHand[i],Jill,495751,DW_Rand(100))
	end
--康葛斯：想得美！讓他們嘗嘗康葛斯的特製炸藥！
	Say(OwnerID(),"[SC_423516_12]")
	CastSpell(OwnerID(),Lafa,496174)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	CallPlot(OwnerID(),"LuaS_423516_10",Lafa,496174,3)
--(中央黃字)：用康葛斯的特製炸藥擺平[<s>104335]！
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_13]", 0 )
	ScriptMessage( Lafa, 0, 2, "[SC_423516_13]", 0 )
--當拉法埃爾血低於30%，拉法埃爾‧貝克德SAY：小麻雀，遊戲結束了。
	local CheckSec = 0
	local HerePlayer = {}
	while	true	do
		sleep(3)
		if	ReadRoleValue(Lafa,EM_RoleValue_HP)/Lafa_MaxHP <0.3	then
			Say(Lafa,"[SC_423516_14]")
--將所有人擊退
			SysCastSpellLv(Lafa,Lafa,496178,1)
--施法擊暈晨星，並帶走晨星，一起消失。
			SysCastSpellLv(Lafa,star,496175,1)
			sleep(10)
--煙霧特效
			CastSpell(Lafa,Lafa,494840)
			sleep(10)
			break
		end
		if	ReadRoleValue(Jill,EM_RoleValue_IsDead)==1	or
			ReadRoleValue(star,EM_RoleValue_IsDead)==1	or
			ReadRoleValue(Lobo,EM_RoleValue_IsDead)==1	then
			ScriptMessage( OwnerID(), 0 , 2, "[SC_421841_1]", C_Red )
			LuaS_423516_5(Lobo,Jill,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
			return
		end
		CheckSec = CheckSec +1
		if	CheckSec >15	then
			CheckSec = 0
			HerePlayer  = SearchRangePlayer ( OwnerID() , 500 )
			for i=0,table.getn(HerePlayer),1 do
				if	CheckAcceptQuest(HerePlayer[i],423516)==true	then
					break
				end
				if	i==table.getn(HerePlayer)	then
					LuaS_423516_5(Lobo,Jill,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
					return
				end
			end
		end
	end
	DelObj(Lafa)
	DelObj(Star)
	sleep(15)
--吉兒SAY：可惡...
	Say(Jill,"[SC_423516_15]")
	sleep(15)
--(中央黃字)：等著吧！其他人，我會將你們一一打上緞帶，送至艾娜莉亞主人的手上。
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_16]", 0 )
	ScriptMessage( Jill, 0, 2, "[SC_423516_16]", 0 )
	ScriptMessage( Lobo, 0, 2, "[SC_423516_16]", 0 )
	sleep(25)
--康葛斯SAY：還是先回去吧！已經和摩瑞克連絡上了。
	Say(OwnerID(),"[SC_423516_17]")
	sleep(10)
--(將玩家傳送回去原本的地方。)
--給完成旗標
	Player = SearchRangePlayer ( OwnerID() , 450 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423516)==true	and
			CheckFlag(Player[i],544396)==false	then
			SetFlag(Player[i],544396,1)
			ChangeZone(Player[i],18,0,8915,200,52000,132.5)
		end
	end
	sleep(15)
	LuaS_423516_5(Lobo,Jill,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
	return
end
--------------------------------------------------------------------------------
--收工程序
function LuaS_423516_5(Lobo,Jill,Star,Lafa,T1,T2,T3,T4,T5,PM1,PM2)
--刪除其他物件	
	DW_CheckThenDel(Lobo)
	DW_CheckThenDel(Jill)
	DW_CheckThenDel(Star)
	DW_CheckThenDel(Lafa)
	DW_CheckThenDel(T1)
	DW_CheckThenDel(T2)
	DW_CheckThenDel(T3)
	DW_CheckThenDel(T4)
	DW_CheckThenDel(T5)
	DW_CheckThenDel(PM1)
	DW_CheckThenDel(PM2)
--回復全域變數
	GlobalValue_Z18_DW_02 = nil
--刪除自己
	DelObj(OwnerID())
end
--------------------------------------------------------------------------------
--使用物品後的檢查
function LuaS_423516_6()
--騎乘禁用
	if	DW_CheckRide(OwnerID())	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_NORIDE]", 0 )
		return false
	end
--只能對死氣沉沉的戰士使用
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==104335		then
		if	CheckDistance(OwnerID(),TargetID(), 150) == true	then
			if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
--目標已經死了
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_3]", 0 )
				return false
			else
				return true
			end
		else
--目標距離過遠
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204592_2]", 0 )
			return false
		end
	else
--目標錯誤
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421101_0]", 0 )
		return false
	end
end
--------------------------------------------------------------------------------
--物品使用後的法術
function LuaS_423516_7()
--動作&特效
	if	CastSpell(OwnerID(),TargetID(),493155)	==true	then
		BeginPlot(TargetID(),"LuaS_423516_8",20)
	end
end

function LuaS_423516_8()
	KillID(TargetID(),OwnerID())
end
--------------------------------------------------------------------------------
--爆炸後滾地的表演
function LuaS_423516_9()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==104335	then
		KillID(OwnerID(),TargetID())
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------
--對目標施法
function LuaS_423516_10(Target,MagicID,MagicLV)
	while	true	do
		if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1	then
			break
		end
		if	CheckRelation( OwnerID() , Target , EM_CheckRelationType_Attackable  )==false	then
			break
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID )==0	then
			sleep(25)
			CastSpellLV(OwnerID(),Target,MagicID,MagicLV)
		else
			sleep(10)
		end
	end
end
--------------------------------------------------------------------------------
--檢查畫面全黑的buff要不要消失
function LuaS_423516_11()
	while true do
		sleep(5)
--檢查距離
		if	DW_CheckDis(OwnerID(),780081,1,500)	then
			CancelBuff(OwnerID(),507914)
			CancelBuff(OwnerID(),506098)
			return
		end
--沒有buff就跳出
		if	CheckBuff(OwnerID(),506098)==false		then
			return
		end
	end
end