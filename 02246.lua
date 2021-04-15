---------------------------------------------------------------------------
--423911 spy series
-----------------------------------------------------------------------------
function LuaP_423911_01()
	SetPlot( OwnerID(),"range","LuaP_423911_05",60 )  ----範圍劇情開始
end
	
function LuaP_423911_05()
	if	CheckAcceptQuest(OwnerID(),423911)==true	and    CheckFlag(OwnerID(),544795)==true   then
		SetFlag(OwnerID(),544791,1)
	end
end

function LuaP_423911_06()
	SetPlot( OwnerID(),"range","LuaP_423911_07",60 ) 
end

function LuaP_423911_07()
	if	CheckAcceptQuest(OwnerID(),423911)==true	and    CheckFlag(OwnerID(),544795)==true   then
		SetFlag(OwnerID(),544792,1)
	end
end

function LuaP_423911_08()
		SetPlot( OwnerID(),"range","LuaP_423911_09",100 ) 
end

function LuaP_423911_09()
	if	CheckAcceptQuest(OwnerID(),423911)==true	and    CheckFlag(OwnerID(),544795)==true   then
		SetFlag(OwnerID(),544793,1)
	end
end
---------------------------------------------talking
function LuaP_423911_02()	
	if (CheckAcceptQuest(OwnerID(),423911)==true )and( CheckCompleteQuest( OwnerID() , 423911) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423911_01]")       ----你願意幫忙嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423911_02]","LuaP_423911_03",0)       ----我願意幫忙
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423911_03()
	SetSpeakDetail(OwnerID(),"[SC_423911_03]")       ----讓我正式自我介紹……
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423911_04]","LuaP_423911_04",0)       ----你打算怎麼做
end
	
function LuaP_423911_04()   
	SetSpeakDetail(OwnerID(),"[SC_423911_05]")       ----你問到重點了
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423911_06]","LuaP_423911_10",0)       ----瞭解
end

function LuaP_423911_10()   
	CloseSpeak(OwnerID())----關掉任務視窗
	SetFlag(OwnerID(), 544795, 1 )

	BeginPlot(TargetID(), "LuaPG_423911_11",0)
end

function LuaPG_423911_11()
	SetFlag(TargetID(), 544917, 1 )  ----有這個的時候看不到NO1萊布尼茲，記得最後要消掉
	local L_acting=Lua_DW_CreateObj("flag",117557,780866,1)   ----演戲用萊布尼茲，生於第1根棋子

--say(OwnerID(),"00")

	Say(L_acting,"[SC_423911_08]")
	Sleep(20)
	
	DW_MoveToFlag( L_acting ,780866,2,0,1)    ----走到第2根棋子
	DelObj(L_acting) ----消掉演戲的人

	SetFlag(TargetID(), 544918, 1 )  ----有這個的時候看到NO2萊布尼茲，記得走到海爾芬營地的任務時要消掉
end

function LuaPG_423911_COMPLETE()
	SetFlag(TargetID(), 544917, 1 )  ----有這個的時候看不到NO1萊布尼茲，記得最後要消掉
	SetFlag(TargetID(), 544918, 1 )  ----有這個的時候看到NO2萊布尼茲，記得走到海爾芬營地的任務時要消掉
end

---------------------------------------------------------------------------
--423912 spy series 2
-----------------------------------------------------------------------------
function LuaP_423912_01()	
	if (CheckAcceptQuest(OwnerID(),423912)==true )and( CheckCompleteQuest( OwnerID() , 423912) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423912_01]")       ----無言
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423912_02]","LuaP_423912_02",0)       ----唉，你要是不說，我就不知道要怎麼救你了。
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423912_02()
	SetSpeakDetail(OwnerID(),"[SC_423912_03]")       ----（疑惑的看著你）
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423912_04]","LuaP_423912_03",0)       ----如果你沒有用處，旁邊那個人打算直接殺了你。
end

function LuaP_423912_03()
	SetSpeakDetail(OwnerID(),"[SC_423912_05]")       ----（眼神透漏出恐懼）
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423912_06]","LuaP_423912_04",0)       ----可是如果你有情報，我可以幫你向小隊長求情。
end

function LuaP_423912_04()   
	SetSpeakDetail(OwnerID(),"[SC_423912_07]")       ----我說，我說。
	SetFlag(OwnerID(), 544796, 1 )
end

---------------------------------------------------------------------------
--423913 spy series 3
-----------------------------------------------------------------------------
function LuaP_423913_01()	
	if (CheckAcceptQuest(OwnerID(),424199)==true )and( CheckCompleteQuest( OwnerID() , 424199) == false) then
		DW_QietKillOne(0,105268)   ----靜靜的殺死怪，前者殺死後者，0代表為玩家
		ScriptMessage( TargetID(), OwnerID(), 1, "[SC_423913_01]",  "0xffbf0b2b"  )
		ScriptMessage( TargetID(), OwnerID(), 0, "[SC_423913_01]",  "0xffbf0b2b"  )  
	end
	return 1  ----避免點擊物件後是紅色條
end

----接受任務後，福格洛消失，萊布消失（去除buff），產生演戲用福格洛和演戲用萊布，兩人走開
function LuaPG_423913_02()
	AddBuff(TargetID(),509385,1,20)

	local L_acting=Lua_DW_CreateObj("flag",117946,780866,3)   ----生在第3根棋子
	SetFlag(TargetID(), 544918, 0 )  
	local FU_acting=Lua_DW_CreateObj("flag",117947,780866,4)  ----生在第4根棋子
	
	WriteRoleValue(L_acting  ,EM_RoleValue_IsWalk , 1 )  ----WALKING
	Hide( L_acting)
	Show( L_acting , 0)
	
	DW_MoveDirectToFlag( L_acting , 780866,5,0 ,1) 
	DW_MoveToFlag( FU_acting , 780866,6,0 ,1)    ----走到第6根棋子

	DelObj(L_acting)
	DelObj(FU_acting)
	
	CancelBuff(TargetID(),509385)
end

---------------------------------------------------------------------------
--423914 spy series 4
-----------------------------------------------------------------------------
function LuaPG_423914_01() 
	local FOGRO = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家

--SAY(TargetID() ,"00")	

	if CheckAcceptQuest( O_ID, 423914 ) == true and CheckFlag( O_ID , 544959) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, FOGRO , "[SC_423914_002]", "LuaPG_423914_02",0) --我準備好了。
		SetSpeakDetail(OwnerID(),"[SC_423914_001]")
	else
		LoadQuestOption( O_ID )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end
end

function LuaPG_423914_02()
	local FOGRO = TargetID() --FOGRO
	local O_ID = OwnerID() --玩家
	if	ReadRoleValue( FOGRO, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_423914_003]" ) --請稍等我一下。
	else
		CloseSpeak( OwnerID() )	--關閉所有對話視窗
		WriteRoleValue( FOGRO, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
		CallPlot( FOGRO, "LuaPG_423914_03", O_ID )	--呼叫下一段函式
	end
end

function LuaPG_423914_03(Player)	
	local Fogro = OwnerID()
	local Old_NALEN = LuaFunc_SearchNPCbyOrgID( Fogro, 117288, 120, 0 )
--say(Fogro,Old_NALEN)
	local NALEN = DW_CreateObjEX("obj",117953,Old_NALEN) --建立新的隱形蘭娜
	SetModeEx(NALEN ,EM_SetModeType_ShowRoleHead,false)           ---不顯示血條
	SetModeEx( NALEN , EM_SetModeType_HideName, true)--名稱
	local Sheryl = LuaFunc_SearchNPCbyOrgID( Fogro, 117483, 120, 0 )
 		
		Adjustfacedir(NALEN,FOGRO,0)

		Say( FOGRO , "[SC_423914_01]")
		PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(35)

		Say( FOGRO , "[SC_423914_02]")
		PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(25)

		Say( FOGRO , "[SC_423914_03]")
		PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(25)

		Say( NALEN , "[SC_423914_04]")
		PlayMotion( NALEN  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(25)

		Adjustfacedir(Sheryl,NALEN,0)

		Say( Sheryl, "[SC_423914_05]")
		PlayMotion( Sheryl, ruFUSION_ACTORSTATE_emote_laugh)			
		Sleep(10)


	SetFlag(Player,544959,1) --給玩家旗標

	DelObj(NALEN)
	WriteRoleValue( Fogro, EM_RoleValue_Register1, 0 )--重開佛格洛的對話
end

function LuaPG_423914_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local FOGRO = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117947, 150, 0 )--搜尋附近參加的NPC演員
	local NALEN = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117953, 150, 0 )
	local Sheryl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117954, 150, 0 )
	
	if FOGRO ~= nil then delobj(FOGRO) end							--如果存在 則刪除
	if NALEN ~= nil then delobj(NALEN) end
	if Sheryl ~= nil then delobj(Sheryl) end
	ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
end



--function LuaP_423914_01()  ----接在任務結束後，所以owner為npc，target為玩家	
--	local FOGRO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117452 , 300 ) --任務npc
--	if	ReadRoleValue(FOGRO,EM_RoleValue_Register1)==0	then  --檢查 EM_RoleValue_Register1
--		CallPlot( OwnerID(),"LuaPG_423914_02",FOGRO)
--	end
--end

--function LuaPG_423914_02(FOGRO)
--	local NALEN = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117288 , 300 )
--	local  Sheryl = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117483 , 300 )

	--Say(OwnerID(),1)
	--Say(TargetID(),2)
	--Say(OwnerID(),Sheryl)

--	WriteRoleValue(FOGRO,EM_RoleValue_Register1,999)

--	DebugMsg(0,0,"1")

	--CloseSpeak(TargetID() )
	
--	Sleep(25)
--	Adjustfacedir(NALEN,FOGRO,0)

--	Say( FOGRO , "[SC_423914_01]")
--	PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(35)

--	Say( FOGRO , "[SC_423914_02]")
--	PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(25)

--	Say( FOGRO , "[SC_423914_03]")
--	PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(25)

--	Say( NALEN , "[SC_423914_04]")
--	PlayMotion( NALEN  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(25)

--	Adjustfacedir(Sheryl,NALEN,0)

--	Say( Sheryl, "[SC_423914_05]")
--	PlayMotion( Sheryl, ruFUSION_ACTORSTATE_emote_laugh)
--	sleep(20)

--	WriteRoleValue(FOGRO,EM_RoleValue_Register1,0)
--end


---------------------------------------------------------------------------
--423915 spy series 5
-----------------------------------------------------------------------------
function LuaP_423915_01()	
	if (CheckAcceptQuest(OwnerID(),423915)==true )and( CheckCompleteQuest( OwnerID() , 423915) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423915_01]")       ----你的意願呢
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423915_02]","LuaP_423915_02",0)       ----請讓我加入
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423915_02()   
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 544797, 1 )
end

---------------------------------------------------------------------------
--423916 spy series 6
-----------------------------------------------------------------------------
----接受任務後，福格洛消失，產生演戲用福格洛和演戲用萊布，兩人走開
function LuaPG_423916_01()
	local L_acting=Lua_DW_CreateObj("flag",117557,780866,7)   ----生在第7根棋子
	local FU_acting=Lua_DW_CreateObj("flag",117558,780866,8)  ----生在第8根棋子
	
	DW_MoveToFlag( L_acting , 780866,9,0 ,1)    ----走到第9根棋子
	DW_MoveToFlag( FU_acting , 780866,10,0 ,1)    ----走到第10根棋子

	DelObj(L_acting)    ----消掉演戲的人
	DelObj(FU_acting)
end