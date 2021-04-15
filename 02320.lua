---------------------------------------------------------------------------
--424131  被留住的記憶
---------------------------------------------------------------------------
function LuaPG_424131_01() 
	local MIMIR = TargetID() --宣告MIMIR為TargetID
	local O_ID = OwnerID() --玩家

--SAY(TargetID() ,"00")	

	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then
		--否則進行第二判斷  有任務 沒有旗標
		SetSpeakDetail(OwnerID(),"[SC_424131_001]")
		AddSpeakOption( O_ID, MIMIR , "[SC_424131_002]", "LuaPG_424131_02",0) --我準備好了。
	else
		LoadQuestOption( O_ID )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end
end

function LuaPG_424131_02()
	local MIMIR = TargetID() --MIMIR
	local O_ID = OwnerID() --玩家
	if	ReadRoleValue( MIMIR, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_424131_003]" ) --請稍等我一下。
	else
		CloseSpeak( OwnerID() )	--關閉所有對話視窗
		WriteRoleValue( MIMIR, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
		CallPlot( MIMIR, "LuaPG_424131_03", O_ID )	--呼叫下一段函式
	end
end


function LuaPG_424131_03(O_ID)

	local MIMIR = OwnerID()----讀到米彌兒	
	SetFlag(O_ID,544956,1)----給演戲flag，這時看不到舊的mimir

			local NEW_MIMIR = DW_CreateObjEX("obj",117969,MIMIR)----生成演戲米彌兒

			DW_MoveToFlag( NEW_MIMIR , 780916 ,1,0 ,1)----米彌兒往前走(780916)

			PlayMotion(NEW_MIMIR,ruFUSION_ACTORSTATE_CROUCH_LOOP)     ----米彌兒蹲下
			Sleep(10)

	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then
			ScriptMessage( NEW_MIMIR, O_ID, 1, "[SC_424131_PUT]",  "0xffbf0b2b"  )
			ScriptMessage( NEW_MIMIR, O_ID, 0, "[SC_424131_PUT]",  "0xffbf0b2b"  )  ----scriptm：米彌兒放下符文
	end
			Sleep(10)

			DW_MoveToFlag( NEW_MIMIR , 780916 ,2,0 ,1)----米彌兒走回原位

			FA_FaceFlagEX(NEW_MIMIR, 780916 , 1)----米彌兒面對符文位置
			Sleep(20)
	
	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then		
			ScriptMessage( NEW_MIMIR, O_ID, 1, "[SC_424131_SHOW]",  "0xffbf0b2b"  )
			ScriptMessage( NEW_MIMIR, O_ID, 0, "[SC_424131_SHOW]",  "0xffbf0b2b"  )----生成符文學者:記憶符文顯現出影像
	end

			local scholar=Lua_DW_CreateObj("flag",117943,780916,1)
			FA_FaceFlagEX(scholar, 780916 , 2)----符文學者面對米彌兒位置	

			Sleep(15)
			Say(scholar,"[SC_424131_SAY_01]")
			Sleep(30)

			Say(scholar,"[SC_424131_SAY_02]")
			Sleep(25)

			Say(scholar,"[SC_424131_SAY_03]")
			Sleep(25)

			Say(scholar,"[SC_424131_SAY_04]")
			Sleep(10)

	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then	
			ScriptMessage( NEW_MIMIR, O_ID, 1, "[SC_424131_DISARREAR]",  "0xffbf0b2b" )
			ScriptMessage( NEW_MIMIR, O_ID, 0, "[SC_424131_DISARREAR]",  "0xffbf0b2b" )----scriptm：影像一陣搖晃，符文學者的身影漸漸消失。
	end
		
			DelObj(scholar)
			DelObj(NEW_MIMIR)
			SetFlag(O_ID,544956,0)	

	WriteRoleValue( MIMIR, EM_RoleValue_Register1, 0 )
	CallPlot(MIMIR,"LuaPG_424131_04",O_ID)
end

function LuaPG_424131_04(O_ID)
	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then
		SetFlag(O_ID,544947,1)
	end
end

---------------------------------------------------------------------------
--424135  讓情報傳下去
---------------------------------------------------------------------------
function LuaS_PG_424135_01()
	if CheckAcceptQuest( OwnerID(), 424135 ) == true and CountBodyItem( OwnerID() , 209415 ) <1  then
		--否則進行第二判斷  有任務 沒有旗標
		SetSpeakDetail(OwnerID(),"[SC_424135_01]")
		AddSpeakOption( OwnerID(), TargetID() , "[SC_424135_001]", "LuaS_PG_424135_02",0) --我準備好了。
	else
		LoadQuestOption( OwnerID() )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end

end


function LuaS_PG_424135_02()
		SetSpeakDetail(OwnerID(),"[SC_424135_02]")
		AddSpeakOption( OwnerID(), TargetID() , "[SC_424135_002]", "LuaS_PG_424135_03",0) --我準備好了。
end

function LuaS_PG_424135_03()
		CloseSpeak(OwnerID())
		GiveBodyitem( OwnerID(), 209415, 1 )
end


---------------------------------------------------------------------------
--424132  眾人的觀點
---------------------------------------------------------------------------
--問偽提爾海姆
function LuaS_PG_424132_fake_Tim()
	if CheckAcceptQuest( OwnerID(), 424132 ) == true and CheckCompleteQuest( OwnerID() , 424132) == false  then
		SetSpeakDetail(OwnerID(),"[SC_424132_02]")
	else
		LoadQuestOption( OwnerID() )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end
	BeginPlot(OwnerID(),"LuaS_PG_424132_fake_Tim_01",0)
end

function LuaS_PG_424132_fake_Tim_01()
	SetFlag( OwnerID(),544967,1)
end


--問吉爾克里斯
function LuaS_PG_424132_GILL()
	if CheckAcceptQuest( OwnerID(), 424132 ) == true and CheckCompleteQuest( OwnerID() , 424132) == false  then
		SetSpeakDetail(OwnerID(),"[SC_424132_01]")

	elseif
	CheckAcceptQuest( OwnerID(), 424134 ) == true and CheckCompleteQuest( OwnerID() , 424134) == false then
		SetSpeakDetail(OwnerID(),"[SC_424134_01]")
		AddSpeakOption(  OwnerID(), TargetID() , "[SC_424134_001]", "LuaS_PG_424134_GILL_02",0) --提爾海姆需要情報彙整報告？

	else
		LoadQuestOption( OwnerID() )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end
	BeginPlot(OwnerID(),"LuaS_PG_424132_GILL_01",0)
end


function LuaS_PG_424132_GILL_01()
	SetFlag( OwnerID(),544968,1)
end


function LuaQ_PG_424132_COMPLETE_01()
	local MIMIR = OwnerID()
	local player = TargetID()
	if	ReadRoleValue(MIMIR , EM_RoleValue_Register1)==0	then
		CallPlot(MIMIR , "LuaQ_PG_424132_COMPLETE_02" , player)
	else
		LoadQuestOption(player)
		SetFlag(player,544978,1)
	end
end

function LuaQ_PG_424132_COMPLETE_02(player)   ----結束後劇情，因此OwnerID為npc，TargetID為玩家
	local MIMIR = OwnerID()    ----MIMIR

	WriteRoleValue(MIMIR,EM_RoleValue_Register1,999) ----開始演出的標記
	CloseSpeak(player) ----面板消失

	local NEW_MIMIR = DW_CreateObjEX("obj",117971,MIMIR)----原位生成透明、424132演戲的mimir117971

	Say(NEW_MIMIR,"[SC_424132_04]")  ----呵呵呵，既然副小隊長都說要維持現狀了......
	Sleep(15)
	ScriptMessage( NEW_MIMIR, player, 1, "[SC_424132_03]",  "0xffbf0b2b" )
	ScriptMessage( NEW_MIMIR, player, 0, "[SC_424132_03]",  "0xffbf0b2b" )----scriptm:一陣警告聲傳了過來

	local STAR = Lua_DW_CreateObj("flag",118016,780916,3)----生成424132演戲的STAR於780916之3
	local MECELL = Lua_DW_CreateObj("flag",118019,780916,4)----生成424132演戲的記憶核心於780916之4
	Sleep(15)
	Say(MECELL,"[SC_424132_05]")   ----警告！發現魔族！判別為危險目標！
	Sleep(15)
	DW_MoveDirectToFlag(STAR ,780916,5,0 ,1) 
	DW_MoveToFlag(MECELL ,780916,6,0 ,1)    

	Say(NEW_MIMIR,"[SC_424132_06]")   ----嗯……事情變得有趣了。
	Sleep(20)

	DelObj(STAR)
	DelObj(MECELL)
	DelObj(NEW_MIMIR)
	
	SetFlag(player,544978,1)

	WriteRoleValue(MIMIR,EM_RoleValue_Register1,0) 
end


---------------------------------------------------------------------------
--424134  資訊匯合
---------------------------------------------------------------------------
function LuaS_PG_424134_GILL_02()
	SetSpeakDetail(OwnerID(),"[SC_424134_02]")
	AddSpeakOption(  OwnerID(), TargetID() , "[SC_424134_002]", "LuaS_PG_424134_GILL_03",0) --提爾海姆需要情報彙整報告？
end

function LuaS_PG_424134_GILL_03()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID() ,209416,1)
end

function LuaPG_REPORT()   -------拉索斐亞報告書
	FA_Border( OwnerID(), "[SC_424134_REPROT]" )
end






---------------------------------------------------------------------------
--424133  拉所斐亞的潛影
---------------------------------------------------------------------------
function LuaQ_PG_424133_ACCEPT(player)
	
	local MIMIR = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register1)		--米彌兒
	local GILL = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register2)			--吉爾克里斯
	local Star = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register3)			--絲達．法爾
	local MECELL = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register4)		--記憶核心
	local FAKE_TIM = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register5)		--提爾海姆
	DisableQuest(MIMIR,true)
	DisableQuest(MECELL,true)
	CloseSpeak(player)


	local NEW_MIMIR = DW_CreateObjEX("obj",118021,MIMIR)----生成演戲的透明米彌兒
	local NEW_MECELL= DW_CreateObjEX("obj",118023,MECELL)----生成演戲的透明記憶核心
	local NEW_FAKE_TIM= DW_CreateObjEX("obj",118027,FAKE_TIM)----生成演戲的透明偽提爾
	local NEW_Star= DW_CreateObjEX("obj",118022,Star)----生成演戲的透明絲達
	local NEW_GILL= DW_CreateObjEX("obj",118026,GILL)----生成演戲的透明吉爾

	Sleep(25)
	Say(NEW_GILL,"[SC_424133_GILL]")
	Sleep(25)
	ScriptMessage( NEW_MIMIR, 0, 1, "[SC_424133_WARN]",  "0xffbf0b2b" )
	ScriptMessage( NEW_MIMIR, 0, 0, "[SC_424133_WARN]",  "0xffbf0b2b" )    ----scriptm:記憶核心指著提爾海姆發出警告
	Sleep(15)
	Say(NEW_MECELL,"[SC_424133_MECELL_01]")
	Sleep(20)
	Say(NEW_FAKE_TIM,"[SC_424133_FAKE_01]")
	Sleep(15)
	

	DelObj(NEW_FAKE_TIM)    ----刪除透明偽提爾	
	local FAKE_TIM_2= DW_CreateObjEX("obj",117970,FAKE_TIM)    ----生成偽提爾2
	Hide(FAKE_TIM)	 ----hide偽提爾


	SetDefIdleMotion(FAKE_TIM_2, ruFUSION_MIME_IDLE_STAND)
	DW_MoveDirectToFlag(FAKE_TIM_2 ,780916,7,0 ,1)    ----偽提爾2走到780916之7


	local TIM_FIGHT= Lua_DW_CreateObj("flag",105572,780916,8)    ----生成NPC  TIM於780916之8
	--say(TIM_FIGHT,"00")
	DW_UnFight(TIM_FIGHT,true)----戰鬥標的off
	local TIM_CANT_SEE = DW_CreateObjEX("obj",118027,TIM_FIGHT)    ----生成隱形TIM

	Say(TIM_CANT_SEE,"[SC_424133_TIM_01]")
	Sleep(20)
	DW_MoveToFlag(TIM_FIGHT ,780916,9,0 ,1)     ----TIM走到780916之9
	Sleep(15)


	DelObj(TIM_CANT_SEE)


	Say(NEW_Star,"[SC_424133_SHOCK]")    ----star
	Say(NEW_MIMIR,"[SC_424133_SHOCK]")    ----mimir
	Say(NEW_GILL,"[SC_424133_SHOCK]")    ----GILL
	Sleep(10)


	Say(FAKE_TIM_2,"[SC_424133_FAKE_02]")   ----偽提爾2
	local ADU_FIGHT = Lua_DW_CreateObj("flag",105571,780916,7)  ----生成NPC亞度尼斯
	DW_UnFight(ADU_FIGHT,true)				----戰鬥標的off
	DelObj(FAKE_TIM_2) 					 ----刪除偽提爾2
	Sleep(20)

	
	local GILL_FIGHT = DW_CreateObjEX("obj",105573,GILL)----生成NPC吉爾
	Hide(GILL)  ----Hide吉爾
	
	DW_UnFight(GILL_FIGHT,true)				----戰鬥標的off
	DelObj(NEW_GILL)  					----DEL  NPC  透明吉爾


	DelObj(NEW_MECELL)					----DEL  NPC  透明記憶核心
	DelObj(NEW_Star)					----DEL  NPC  透明絲達
	DelObj(NEW_MIMIR)					----DEL  NPC  透明米彌兒


----進入戰鬥，戰鬥標的on
	DW_UnFight(GILL_FIGHT,false)
	DW_UnFight(ADU_FIGHT,false)
	DW_UnFight(TIM_FIGHT,false)
	
	Sleep(20)
	SysCastSpellLv(player,ADU_FIGHT,496266,0)		--就是只想攻擊玩家
	CallPlot( MIMIR, "LuaQ_PG_424133_ACCEPT_02", player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
end	


function LuaQ_PG_424133_ACCEPT_02(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
	local MIMIR = OwnerID()
	local Num=0

	local playingmode="here"
	local ADU="NotDead"
	local ADUID="true"
	local quest="in"
	local TIME="SHORT"

	local IfBreak=false				--用來判斷跳出每秒判斷時，是否中止迴圈
	while 1 do
		for i=1,3,1 do																									--為了維持基本判斷的頻率，將每秒判斷的部份獨立出來
                                                                            						
			if	ReadRoleValue(player , EM_RoleValue_IsDead)==1 	or    													--判斷之2：玩家死亡
				CheckID(player) == false	or                                                   						
				GetDistance( ADU_FIGHT, player) >500 	then                                     						
				playingmode="Nothere"  
				IfBreak=true                                                        						
				break	                                                                         						
			end                                                                                  						
			if 	ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6)==7766	 then								--判斷之3：劇情怪血量
				ADU="IsDead"
				IfBreak=true
				break
			end
			if	ReadRoleValue(ADU_FIGHT,EM_RoleValue_HP)/ReadRoleValue(ADU_FIGHT,EM_RoleValue_MaxHP)<0.5	then
				for i=0,HateListCount(ADU_FIGHT),1 do																	--用for迴圈逐個檢查亞度尼斯的仇恨表
					local Temp = HateListInfo(ADU_FIGHT,i, EM_HateListInfoType_GItemID)									--避免重複呼叫，將正在檢查的id記進『暫存變數』
					if	ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1	then											--確定仇恨表中的對象是玩家
						if	CheckAcceptQuest(Temp,424133)== true			and											--判斷是否有接任務？
							CheckFlag(Temp,544977)==false					then										--不曾取得旗標？
							IfOrdinaryOver=true																			--有人取得完成旗標，打出暗號
							SetFlag(Temp, 544977, 1 )																	--都通過檢查，則給任務完成旗標 
						end
					end
				end
				ADU="IsDead"
				IfBreak=true
				break
			end
			if	CheckID(ADU_FIGHT)== false  then																		--判斷之4：判斷無法找到亞度尼斯
				ADU="false"
				IfBreak=true
				break
			end
			sleep(10)                                                                            						
		end                                                                                      						
		                                                                                         						
		if	IfBreak==true	then																						--用來判斷跳出每秒判斷時，是否中止迴圈
			break
		end
		local NearPlayers = DW_SearchPlayerHaveQuest(ADU_FIGHT,270,424133)
		IfBreak = true									--先預設為會跳出的狀態
		for index,value in pairs(NearPlayers) do
			IfBreak = false								--只要還有玩家在就改回繼續判斷的狀態
			break										--節省時間
		end
		if	IfBreak==true	then																						--用來判斷跳出每秒判斷時，是否中止迴圈
			playingmode="Nothere"						--沒有玩家在
			break
		end
		Num=Num+1
	end
DeBugMSG(0,0,"1111111")

	if playingmode=="Nothere" or TIME=="TOOLONG" then
DeBugMSG(0,0,"playingmode==Nothere or TIME==TOOLONG")
		SetStopAttack(ADU_FIGHT)
		Sleep(30)
		Delobj(ADU_FIGHT)
		CallPlot(MIMIR,"LuaQ_PG_424133_ACCEPT_03",player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)			----非正常戰鬥離開
	end
	if	ADU=="IsDead"  then
DeBugMSG(0,0,"ADU==IsDead")
		CallPlot(MIMIR,"LuaQ_PG_424133_ACCEPT_04",player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)		--放煙霧逃走
	end
	if	ADUID=="false"	then
DeBugMSG(0,0,"false")
	end
end




function LuaQ_PG_424133_ACCEPT_03(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
DeBugMSG(0,0,"2222222")
----非正常戰鬥離開
	local MIMIR = OwnerID()

	local NeedDelTwoNPC = {TIM_FIGHT,GILL_FIGHT}		--戰鬥用的兩隻
	for index,value in pairs(NeedDelTwoNPC) do
		DelObj(value)
	end

	local HideTwoNPC = {FAKE_TIM,GILL}					--偽提爾、吉爾
	for index,value in pairs(HideTwoNPC) do
		Show(value,0)
	end
	
	WriteRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6,0)
	DisableQuest(MIMIR,false)
	DisableQuest(MECELL,false)

end



function LuaQ_PG_424133_ACCEPT_04(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
DeBugMSG(0,0,"3333333")
----正常打贏戰鬥後出現的劇情
	local MIMIR = OwnerID()

	local FightThreeNPC = {GILL_FIGHT,ADU_FIGHT,TIM_FIGHT}		--亞度尼斯、吉爾....、副小隊長
	for index,value in pairs(FightThreeNPC) do
		DW_UnFight(value,true)		--戰鬥關掉
		SetStopAttack(value)		--停止攻擊
	end
	SysCastSpellLv( ADU_FIGHT, ADU_FIGHT , 490592 ,0 )----ADU放出煙霧
	CastSpell(ADU_FIGHT,ADU_FIGHT,490592)
	Sleep(20)
	local AcceptQuestPlayers = DW_SearchPlayerHaveQuest(ADU_FIGHT,200,424133)
	for index,value in pairs(AcceptQuestPlayers) do
		ScriptMessage( ADU_FIGHT, value, 1, "[SC_424133_RUN]",  "0xffbf0b2b" )
		ScriptMessage( ADU_FIGHT, value, 0, "[SC_424133_RUN]",  "0xffbf0b2b" )    ----scriptm:當煙霧造成混亂時，亞度尼斯趁機逃走	
	end
	DelObj(ADU_FIGHT)----ADU_FIGHT消失
	Sleep(25)
	CallPlot(MIMIR,"LuaQ_PG_424133_ACCEPT_05",player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
end


function LuaQ_PG_424133_ACCEPT_05(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
----正常打贏戰鬥後的角色屬性
DeBugMSG(0,0,"4444444")
	local MIMIR = OwnerID()

	local NeedDelTwoNPC = {TIM_FIGHT,GILL_FIGHT}		--戰鬥用的兩隻
	for index,value in pairs(NeedDelTwoNPC) do
		DelObj(value)
	end

	local HideTwoNPC = {FAKE_TIM,GILL}					--偽提爾、吉爾
	for index,value in pairs(HideTwoNPC) do
		Show(value,0)
	end
	
	local AcceptQuestPlayers = DW_SearchPlayerHaveQuest(MIMIR,200,424133)
	for index,value in pairs(AcceptQuestPlayers) do
		if	CheckFlag(value,544977)==true	then			--有任務且已完成
			SetFlag(value,544975,1)							--才會看到真．提爾(副小隊長)
		end
	end
	WriteRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6,0)
	DisableQuest(MIMIR,false)
	DisableQuest(MECELL,false)

end


function LuaQ_PG_424133_complete()
	SetFlag(TargetID(),544975,1)
end


function LuaPG_105571_01()
	SetPlot(OwnerID(),"dead","LuaPG_105571_02",0)
end

function LuaPG_105571_02()
	local Obj = OwnerID()
	WriteRoleValue(Obj,EM_RoleValue_HP,ReadRoleValue(Obj,EM_RoleValue_MaxHP))
	WriteRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6,7766)
	for i=0,HateListCount(Obj),1 do																			--用for迴圈逐個檢查亞度尼斯的仇恨表
		local Temp = HateListInfo(Obj,i, EM_HateListInfoType_GItemID)											--避免重複呼叫，將正在檢查的id記進『暫存變數』
		if	ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1	then													--確定仇恨表中的對象是玩家
			if	CheckAcceptQuest(Temp,424133)== true			and													--判斷是否有接任務？
				CheckFlag(Temp,544977)==false					then												--不曾取得旗標？
				IfOrdinaryOver=true																					--有人取得完成旗標，打出暗號
				SetFlag(Temp, 544977, 1 )																			--都通過檢查，則給任務完成旗標 
			end
		end
	end
	return false
end

function LuaS_424133_AccecptPlot()
	local Obj = TargetID()
	--------------------------
	--中控器建立區(控制一切發展)
	--------------------------
	if	Zone14_424133_ContCenter == nil	then					--只建立一次中控器
		Zone14_424133_ContCenter=DW_CreateObjEX("obj",110987,Obj)--種出中控器後就不可能等於nil
		local TempGlobal = Zone14_424133_ContCenter
		SetModeEx(TempGlobal,EM_SetModeType_Mark,false) 				--關掉標記
		SetModeEx(TempGlobal,EM_SetModeType_Show,false) 				--不顯示
		SetModeEx(TempGlobal,EM_SetModeType_ShowRoleHead,false) 		--不秀血條
		local SureSaver = {}
		SureSaver[1] = LuaFunc_SearchNPCbyOrgID( Obj , 117972 , 300 )		--米彌兒
		SureSaver[2] = LuaFunc_SearchNPCbyOrgID( Obj , 117944 , 300 ) 		--吉爾克里斯
		SureSaver[3] = LuaFunc_SearchNPCbyOrgID( Obj , 118017 , 300 )		--絲達．法爾
		SureSaver[4] = Obj													--記憶核心
		SureSaver[5] = LuaFunc_SearchNPCbyOrgID( Obj , 117973 , 300 )		--提爾海姆
		----------------------------
		--將固定班底記入Zone14_424133_ContCenter的暫存值  register
		----------------------------
		
		for i=1,5,1 do			--共5人
			WriteRoleValue(TempGlobal,(EM_RoleValue_Register-1)+i,SureSaver[i])
		end
		
		----------------------------
		--收工;從此;只要讀Zone14_424133_ContCenter的暫存值就可以找出固定班底
		----------------------------
	end
end

function LuaS_424133_TalkPlot()
	local Obj = OwnerID()
	LuaS_424133_AccecptPlot()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,424133)==true	and
		CheckFlag(Obj,544977)==false		then
		AddSpeakOption(Obj,Obj,"[SC_424133_SPEAKOPTION]","LuaS_424133_TalkPlot_1", 0 )
	end
end

function LuaS_424133_TalkPlot_1()
	local player = OwnerID()				--玩家
	local Target = TargetID()			--記憶核心
	CallPlot(Target,"LuaQ_PG_424133_ACCEPT",player)
end