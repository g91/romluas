-------------------------------------------------------------------
--從蛇人手中搶下屍體		使用780089  1~3(蛇人出生的點)
-------------------------------------------------------------------

function LuaS_422574_0() --初始範圍劇情
	SetPlot(OwnerID(),"range","LuaS_422574_1",130)
--宣告全域變數
	TotalCtrl = 0
--產生讓玩家點擊的版本
	local Another = Lua_DW_CreateObj("obj",113251,OwnerID())
	BeginPlot(Another,"LuaP_DW_Dead",0)
	SetPlot(Another,"touch","LuaS_422574_3",50)
--互相記錄彼此遊戲ID 為了讓CLIENT即時顯示
--	WriteRoleValue(Another,EM_RoleValue_PID,OwnerID())
--	WriteRoleValue(OwnerID(),EM_RoleValue_PID,Another)
end

function LuaS_422574_1()
	if	CheckAcceptQuest( OwnerID(), 422574 )		and--有接任務
		CheckFlag(OwnerID(),542903)==false		then
		BeginPlot(TargetID(),"LuaS_422574_2",0)
		return true
	end
	return false
end

function LuaS_422574_2()
	local SnakeNum = 3
--將範圍劇情關掉
	SetPlot(OwnerID(),"range","",0)
	local Snake = {}
--取出另一個的ID
	local Another = ReadRoleValue(OwnerID(),EM_RoleValue_PID)

--重置怪物死亡數量
	TotalCtrl = 0

	for i = 1,SnakeNum,1 do
--種出蛇人
		Snake[i] = Lua_DW_CreateObj("flag",102262,780089,i)
--關閉戰鬥
		SetFightMode ( Snake[i],0,1,0,0)
	end
--開始唱雙簧
	Say(Snake[1],"[SC_422574_1]")
	sleep(20)
	Say(Snake[2],"[SC_422574_2]")
	sleep(20)
	Say(Snake[3],"[SC_422574_3]")
	sleep(20)
	Say(Snake[1],"[SC_422574_4]")
--TO WAR~~~~~
	for i =1,table.getn(Snake),1	do
		SetPlot(Snake[i],"dead","LuaS_422574_6",0)--給蛇人掛上死亡劇情
		SetFightMode ( Snake[i],1,1,0,1)--戰鬥狀態
		SetAttack(Snake[i],TargetID())--攻擊目標
		BeginPlot(Snake[i],"LuaS_Discowood_CheckPeace",0)--離開戰鬥消失
	end
--持續檢查三個蛇人是否消失
	local Pass = 0
	while Pass == 0 do
		sleep(10)
		for i = 1,table.getn(Snake),1	do
			if	CheckID(Snake[i])	then
				break
			end
			if	i == table.getn(Snake)	then
				Pass = 1
			end
		end
	end
--如果三隻蛇人被擊敗
	if	TotalCtrl == SnakeNum	then
--範圍350內有接任務的玩家都有資格往下一個階段進行
		local Player = SearchRangePlayer ( OwnerID() , 350 )
		for i=0,table.getn(Player)-1 do
			if	CheckAcceptQuest( Player[i], 422574 )	then
				SetFlag(Player[i],542903,1)
			end
		end
--讓 client script 重新執行
--		Hide(Another)
--		Show(Another,0)
--		Hide(OwnerID())
--		Show(OwnerID(),0)
		sleep(60) --6秒重置時間
	end
	SetPlot(OwnerID(),"range","LuaS_422574_1",130)
end

function LuaS_422574_3() --觸碰劇情執行區
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_422574_6]" )
	ShowBorder( OwnerID(), 0, "[SC_422574_5]" , "ScriptBorder_Texture_Paper" )

	sleep(10)
	GiveBodyItem(OwnerID(),204892,1)
	SetFlag(OwnerID(),542902,1)
--	Hide(ReadRoleValue(OwnerID(),EM_RoleValue_PID))
--	Show(ReadRoleValue(OwnerID(),EM_RoleValue_PID),0)
--	Hide(TargetID())
--	Show(TargetID(),0)
end


function LuaS_422574_6() --蛇人死亡劇情
	TotalCtrl = TotalCtrl + 1
	return true
end


function LuaS_422574_7() --任務完成的表演劇情
	DisableQuest(OwnerID(),true)
	CloseSpeak(TargetID())
--大哭
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(10)
	Say(OwnerID(),"[SC_422574_7]")
	sleep(20)
	Say(OwnerID(),"[SC_422574_8]")
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	sleep(10)
	Say(OwnerID(),"[SC_422574_9]")
	sleep(10)
	DisableQuest(OwnerID(),false)
end



--------------------------------------------------------------------------------------------------------------------------------------
--進攻蛇人營地		使用780090  1~3(蛇人出生的點)	4 (回來站好的點)  7 (重生的標準點)
--------------------------------------------------------------------------------------------------------------------------------------

function LuaS_422578_3() -- 對話劇情
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID(), 422578 )	and--有接任務 並且 任務還沒完成
		(	CheckFlag(OwnerID(),542908)==false	or	CheckFlag(OwnerID(),542909)==false	)	then
		SetSpeakDetail( OwnerID(),"[SC_422578_0]")
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422578_1]", "LuaS_422578_4", 0)--Yes
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422578_2]", "LuaS_422578_6", 0)--NO
	end
	if	CheckAcceptQuest(OwnerID(),422575)	and
		CheckFlag(OwnerID(),542936)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422575]","LuaS_422575_1",0)
	end
end

function LuaS_422578_4()--解開NPC的移動限制
	CloseSpeak(OwnerID())
--關閉NPC任務
	DisableQuest(TargetID(),true)
--打開移動劇情
	MoveToFlagEnabled( TargetID(), true )
	Say(TargetID(),"[SC_422578_3]")
	WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
	SetDelayPatrolTime( TargetID(), 0 )
end

function LuaS_422578_5()--執行戰鬥流程
--停止不走
	MoveToFlagEnabled( OwnerID(), false )
--開場白
	Say(OwnerID(),"[SC_422578_4]")
	sleep(10)
--出現蛇人
	local Snake = {}
	local SnakeNum = 3 --蛇人數量
	for i = 1,SnakeNum,1 do
		Snake[i] = Lua_DW_CreateObj("flag",102262,780090,i)
		SetPlot(Snake[i],"dead","LuaS_422578_7",0) --死亡給完成任務
		BeginPlot(Snake[i],"LuaS_Discowood_CheckPeace",0)--離開戰鬥消失
	end
	sleep(10)
--蛇人開場白&開啟戰鬥狀態
	Say(Snake[1],"[SC_422578_5]")
	SetFightMode ( OwnerID(),1,1,0,1 )
--互相加仇人
	for i = 1,table.getn(Snake),1	do
		SetAttack(OwnerID(),Snake[i])
		SetAttack(Snake[i],OwnerID())
	end
--確定是不是三個蛇人都死了
	local Pass = true
	while	Pass	do
		for i=1,table.getn(Snake),1	do
			if	CheckID(Snake[i])				and
				ReadRoleValue(Snake[i],EM_RoleValue_IsDead)==0	then
				break
			end
			if	i==table.getn(Snake)	then
				Pass = false
			end
		end
		sleep(10)
	end
	Say(OwnerID(),"[SC_422578_6]")
--等她站好位置
	while	not DW_CheckDis(OwnerID(),780090,4,20)	do
		sleep(10)
	end
--檢查範圍內的玩家 給完成任務的旗標
	local Player = SearchRangePlayer ( OwnerID() , 350 )
	for i = 0,table.getn(Player)-1,1	do
--有接任務 而且有擊殺蛇人的玩家
		if	CheckAcceptQuest( Player[i],422578)	and
			CheckFlag(Player[i],542908)		then
			SetFlag(Player[i],542909,1)
		end
	end
--重置之
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())

end

function LuaS_422578_6()
	SetSpeakDetail( OwnerID(),"[SC_422578_7]")
end

function LuaS_422578_7() --蛇人的死亡劇情	負責送出清理蛇人的完成旗標
	for i = 0 ,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
--有接任務的玩家
		if	CheckAcceptQuest( Tar,422578)	then
			SetFlag(Tar,542908,1)
		end
	end
	return true
end


function LuaS_422578_8()--NPC初始劇情	調整位置 更改戰鬥狀態
	SetPlot( OwnerID() , "dead" , "LuaS_422579_8" , 0 )
	SetFightMode ( OwnerID(),0,1,0,0 )
	LuaS_421918_2()
end

function LuaS_422578_9()--接受任務清掉重要物品
	SetFlag(OwnerID(),542908,0)
	SetFlag(OwnerID(),542909,0)
	SetFlag(OwnerID(),542910,0)
end
--------------------------------------------------------------------------------------------------------------------------------------
--赴義		使用 780090 5(渥克斯出生點)  6(交代遺言的點) 8(重生的標準點)
--------------------------------------------------------------------------------------------------------------------------------------

function LuaS_422579_0()-- 對話劇情
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID(), 422579 )	and--有接任務 並且 任務還沒完成
		CheckFlag(OwnerID(),542910)==false	then
		SetSpeakDetail( OwnerID(),"[SC_422579_0]")
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422579_1]", "LuaS_422579_2", 0)--Yes
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422579_2]", "LuaS_422579_1", 0)--NO
	end
end

function LuaS_422579_1() -- 否定的回答
	SetSpeakDetail( OwnerID(),"[SC_422579_3]")
end

function LuaS_422579_2() -- 解開NPC的移動限制
--關閉NPC任務
	DisableQuest(TargetID(),true)
--打開移動劇情
	MoveToFlagEnabled( TargetID(), true )
--關閉對話
	CloseSpeak( OwnerID() )
--台詞
	Say(TargetID(),"[SC_422579_4]")
	SetDelayPatrolTime( TargetID(), 0 )
	WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
end

function LuaS_422579_3() -- 開始戰鬥
--關掉移動劇情
	MoveToFlagEnabled( OwnerID(), false )
--種出渥克斯
	local Boss = Lua_DW_CreateObj("flag",102274,780090,5)
--先演戲 因此關閉戰鬥
	SetFightMode ( Boss,0,1,0,0)
	SetFightMode ( OwnerID(),0,1,0,0 )
--台詞
	Say(Boss,"[SC_422579_5]")
	sleep(15)
	Say(Boss,"[SC_422579_6]")
	sleep(15)
	Say(Boss,"[SC_422579_7]")
	sleep(15)
--解開攻擊  開打
	SetFightMode ( OwnerID(),1,1,0,1 )
	SetFightMode ( Boss,1,1,0,1)
	SetAttack(OwnerID(),Boss)
	SetAttack(Boss,OwnerID())
	BeginPlot(Boss,"LuaS_Discowood_CheckPeace",0)--離開戰鬥消失
--戰鬥中的判斷
	local Tar
	while	HateListCount( OwnerID() ) > 0	do
		sleep(10)
--檢查仇恨表中不是渥克斯的怪
		for i=0,HateListCount(OwnerID()),1 do
			Tar = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
			if	ReadRoleValue(Tar,EM_RoleValue_OrgID) ~= 102274	then
--命令渥克斯毀滅之 並說出台詞
				if	CastSpellLv(Boss,Tar,492662,100)	then
					Say(Boss,"[SC_422579_8]")
				end
			end
		end
--檢查渥克斯的血量 判斷是否到了決戰時刻
		if	ReadRoleValue(Boss,EM_RoleValue_HP)/ReadRoleValue(Boss,EM_RoleValue_MaxHP) < 0.4	and
			ReadRoleValue(Boss,EM_RoleValue_IsDead) == 0						and
			ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0				and
			ReadRoleValue(OwnerID() , EM_RoleValue_Coldown_All ) == 0				then
--台詞 並 同歸於盡
			Say(OwnerID(),"[SC_422579_9]")
			CastSpellLv(OwnerID(),Boss,493685,101)
--維持虛弱狀態
			sleep(10)
			Lua_CancelAllBuff(OwnerID())
			WriteRoleValue(OwnerID(),EM_RoleValue_HP,1)
			AddBuff(OwnerID(),502707,1,-1)
		end
	end
--檢查是否走到定點 
	while ReadRoleValue(OwnerID(),EM_RoleValue_NpcOnMove)==1 do
		sleep(20);
	end
	local FlagID,FlagNum=780090,6;
	local x,y,z=GetMoveFlagValue( FlagID,FlagNum,EM_RoleValue_X),GetMoveFlagValue( FlagID,FlagNum,EM_RoleValue_Y),GetMoveFlagValue( FlagID,FlagNum,EM_RoleValue_Z);
	sleep(Move(OwnerID(),x,y,z));
	sleep(10)
	local Player = SearchRangePlayer(OwnerID(),350)
	for i=0,table.getn(Player)-1,1 do
--有接任務 且還沒完成的玩家 給他們完成旗標
		if	CheckAcceptQuest(Player[i],422579)	then
			SetFlag(Player[i],542910,1)
		end
	end
--重置
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end

function LuaS_422579_4() --完成任務：最後戰役後 執行的劇情
--鎖任務
	DisableQuest(OwnerID(),true)
--最後的台詞
	Say(OwnerID(),"[SC_422579_10]")
	sleep(15)
	Say(OwnerID(),"[SC_422579_11]")
	sleep(10)
--流血
	CastSpell(OwnerID(),OwnerID(),492667)
	sleep(10)
--自殺倒地
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DYING)
	sleep(50)
--塞旗標使其再也不出現
	SetFlag(TargetID(),542929,1)
--開任務
	DisableQuest(OwnerID(),false)
--重置
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end



function LuaS_422579_5() -- 死角莎芭 的初始化劇情
--維持虛弱狀態
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,1)
	AddBuff(OwnerID(),502707,1,-1)
end

function LuaS_422579_6() --第二階段初始劇情	校正位置 關閉戰鬥
	SetPlot( OwnerID() , "dead" , "LuaS_422579_8" , 0 )
	SetFightMode ( OwnerID(),0,1,0,0 )
	LuaS_421918_2()
end

function LuaS_422579_7()
	SetFightMode ( OwnerID(),1,1,0,1 )
end

function LuaS_422579_8()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if CheckID( Player ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_421696]" , 0 )
		ScriptMessage( Player , Player , 0 , "[SC_421696]" , 0 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 0)
	return true
end