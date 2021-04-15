---------------------------------------------------------------------------
--424477  對錯的分界
---------------------------------------------------------------------------
--function LuaPG_424477()
--	LoadQuestOption(OwnerID())
--
--	if	CheckAcceptQuest(OwnerID(),424477)==true		and
--		CheckCompleteQuest(OwnerID(),424477)==false 	and
--		CheckFlag(OwnerID(),545511)==false			then
--		SetFlag(OwnerID(),545511,1)
--	end
--end


--任務結束後接劇情
---------------------------------------------------------------------------
--演員：119283、119333
--BUFF：620756
function LuaPG_424477_Complete()
	Lua_ZonePE_3th_GetScore(100)

	local Player = TargetID()
	local Lord = OwnerID()

	local New_Lord = DW_CreateObjEX("obj",119333,Lord)			----生成演戲人王
	ks_ActSetMode( New_Lord )	
	SetModeEx( New_Lord , EM_SetModeType_HideName, true)

	local Num = ReadRoleValue(Lord,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Lord , "LuaPG_424477_Complete_01" , Lord , Player, New_Lord)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424477_Complete_01( Lord , Player, New_Lord)
	WriteRoleValue(Lord,EM_RoleValue_Register1,999) 			----開始演出的標記	
	
	local  Arton = LuaFunc_SearchNPCbyOrgID( Lord, 119159, 200, 0 )
	local New_Arton = DW_CreateObjEX("obj",119333,Arton)
	ks_ActSetMode( New_Arton )	
	SetModeEx( New_Arton , EM_SetModeType_HideName, true)
	
	NPCSAY(New_Lord,"[SC_424477_COMPLETE_01]") 				----卡拉維：也許我可以直接找亞吉恩談一談
	Sleep(25)
	NPCSAY(New_Arton,"[SC_424477_COMPLETE_02]")			----阿爾頓：恕我直言，但亞吉恩絕對會否認
	Sleep(20)
	NPCSAY(New_Arton,"[SC_424477_COMPLETE_03]")			----阿爾頓：沒關係，我明白人王的困難
	DelObj( New_Arton )														
	DelObj( New_Lord )

	WriteRoleValue(Lord,EM_RoleValue_Register1,0)				----寫回艾依伯格暫存值
end



---------------------------------------------------------------------------
--424478  協助與檢視行動
---------------------------------------------------------------------------
--flag：說要幫忙 545514
function LuaPG_424478()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424478 )==true		and
		CheckCompleteQuest( Player , 424478 ) == false	and
		CheckFlag(Player,545514)==false			then	
	
			SetSpeakDetail(Player,"[SC_424478_00]")
			SetFlag(Player, 545514 , 1)
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424478_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424478 )==true		and
		CheckFlag(Player,545595)==false			then	
	
			SetSpeakDetail(Player,"[SC_424478_01]")
			SetFlag(Player, 545595 , 1)
	else
			LoadQuestOption(Player)
	end
end




---------------------------------------------------------------------------
--424479  特羅格商隊的海鷗
---------------------------------------------------------------------------
--flag：把黃蜂蜜給卡巴 545515
function LuaPG_424479()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424479 )==true		and
		CheckCompleteQuest( Player , 424479 ) == false		and
		 CheckFlag(Player,545515)==false			then
			if CheckFlag(Player,545719)==false then
				if CountBodyItem(Player , 240589) >=5 then	
					DelBodyItem(Player , 240589,5)
					SetFlag(Player,545719,1)			
					SetSpeakDetail(Player,"[SC_424479_01]")
					AddSpeakOption(Player, NPC , "[SC_424479_02]","LuaPG_424479_01",0)
				else
					LoadQuestOption(Player)
				end
			elseif CheckFlag(Player,545719)==true then
					AddSpeakOption(Player, NPC , "[SC_424479_02]","LuaPG_424479_01",0)
			end
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424479_01()
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424479_03]")
	SetFlag(Player, 545515 , 1)
end






---------------------------------------------------------------------------
--424492  賽弗爾．史奎普的研究
---------------------------------------------------------------------------
--任務接下後接劇情
---------------------------------------------------------------------------
--演員：賽弗爾119173
--走位旗子：781002	no.1
function LuaPG_424492_Accept()
	local Player = TargetID()
	local Script = OwnerID()

	local New_Script = DW_CreateObjEX("obj",119173,Script)
	ks_ActSetMode( New_Script )

	local Num = ReadRoleValue(Script,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Script , "LuaPG_424492_Accept_01" , Player , Script, New_Script)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424492_Accept_01(Player , Script, New_Script)
	WriteRoleValue(Script,EM_RoleValue_Register1,999) 			----開始演出的標記	

	DW_MoveToFlag( New_Script , 781002,1, 0 ,1)				----賽弗爾由781002的原位走到1
	DelObj(New_Script)												

	WriteRoleValue(Script,EM_RoleValue_Register1,0)				----寫回賽弗爾暫存值
end


function LuaPG_424492()	
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(OwnerID(),424477)==true		and
		CheckCompleteQuest(OwnerID(),424477)==false 	and
		CheckFlag(OwnerID(),545511)==false			then
		SetFlag(OwnerID(),545511,1)
	end

	if	CheckAcceptQuest(Player,424492)==true	and
		CheckFlag(Player,545521)==false		then
		SetFlag(Player,545521,1)
	end
end



---------------------------------------------------------------------------
--424480  意外發生！
---------------------------------------------------------------------------
--範圍演戲任務
---------------------------------------------------------------------------
--演員：卡德摩斯119174、龍型卡德摩斯119175、龍型艾伊那藍119295
--摩瑞克119182、勞勃119183
--走位旗子：781002	no.2～no.8
--轉龍型buff：620757、620758
function LuaPG_424480_Show()
	local Player = OwnerID()
	local Merick = TargetID()

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)

	LoadQuestOption(Player)
	if	CheckAcceptQuest( Player, 424480 ) == true		 and
		CheckFlag(Player,545522)==false			and
		Num > 0 						then 		----檢查玩家是否有任務 並且現在是否正在演戲
		SetSpeakDetail( Player, "[SC_424480_001]" )				----(正在演戲情況下 給予告知)
	elseif	CheckAcceptQuest( Player, 424480 ) == true 		and
		CheckFlag(Player,545522)==false			and
		Num == 0						then		----如果暫存值為0
		AddSpeakOption(Player, Merick,"[SC_424480_00]","LuaPG_424480_Show_02",0)
											----接演戲function	
	end
end


function LuaPG_424480_Show_02()
	local Player = OwnerID()
	local Merick = TargetID()
	CloseSpeak( Player )								----關閉對話視窗

	WriteRoleValue( Merick, EM_RoleValue_Register1, 999 )				----上鎖 表示正在演戲	
	BeginPlot( Merick, "LuaPG_424480_Show_03", 0 )				
end


function LuaPG_424480_Show_03()
	local Merick = OwnerID()			--掛在NPC身上的演戲劇情
	local QuestID = 424480			--任務編號
	local FinishFlagID = 545522			--完成任務獲得的旗標
	local CheckBuffID = 620756			--檢查是否正在演戲的BUFF
	local CheckRange = 350			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	
	local FlagID = 781002				--旗標ID
	-- 事先把所有會用到的演員產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 119174, FlagID, 6, 1 ) 	 --卡德摩斯（人型）
	ActorArray[2] = CreateObjByFlag( 119177, FlagID, 3, 1 ) 	--艾伊那藍（人型）
	ActorArray[3] = CreateObjByFlag( 119182, FlagID, 4, 1 ) 	--摩瑞克
	ActorArray[4] = CreateObjByFlag( 119183, FlagID, 5, 1 ) 	--勞勃
	ActorArray[5] = CreateObjByFlag( 119295, FlagID, 3, 1 )  	--艾伊那藍（龍型）

	CallPlot( Merick, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式
	for i=1, 4 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end
	SetModeEx( ActorArray[4] , EM_SetModeType_HideName, true)		----關掉名稱

	sleep(10)


	--演戲中
	Sleep(10)
	Yell( ActorArray[1], "[SC_424480_01]",3)		----冰：跟凡人嘀咕什麼？哈，該不會你想袒護那些噁心實驗產生的低劣種！
	sleep(30)
	Yell( ActorArray[1], "[SC_424480_02]",3)		----冰：龍王們對他們可不會有太好印象，他們的存在本就是侮辱龍族，而且誰知道他們做過哪些好事，龍族容不下他們，勸你最好親自把他們解決掉。
	PlayMotion( ActorArray[1], ruFUSION_ACTORSTATE_emote_point)
	sleep(40)
	Yell( ActorArray[3], "[SC_424480_03]",3)		----摩：（搖頭）不，吉兒他們並非自願變成如此，我自會跟龍王們解釋，而且現在重要的是找出半龍人實驗的真正幕後。
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(40)
	Yell( ActorArray[1], "[SC_424480_04]",3)		----冰：哈哈～幕後？推托之詞，我懷疑你根本就在實驗中插了一手！
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Yell( ActorArray[2], "[SC_424480_05]",3)		----艾藍：卡德摩斯，你最好注意一下自己的言行，摩瑞克可是光龍選的龍使，你是拐彎指責誰嗎？而且我贊成摩瑞克說的，最重要是弄清楚真相。
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_emote_head_shake)
	sleep(50)
	Yell( ActorArray[1], "[SC_424480_06]",3)		----冰：少說廢話！我本來就沒承認過這雜種是什麼龍使！
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(30)

	
--	DW_MoveToFlag( ActorArray[1] , FlagID, 6, 0 ,1)				----冰龍走到較遠的位置
--	FA_FaceFlagEX(ActorArray[1], FlagID , 2)
	AddBuff( ActorArray[1], 620757, 1, -1 )						----變身成龍
	ScriptMessage( ActorArray[1], TargetID(), 1 , "[SC_424480_12]", 0 )		--中央訊息：（[119174]變成龍形）
	ScriptMessage( ActorArray[1], TargetID(), 0 , "[SC_424480_12]", 0 )		--中央訊息：（[119174]變成龍形）
	sleep(10)
	ScriptMessage( ActorArray[1], TargetID() ,1 , "[SC_424480_07]", "0xffffff80" )	----(中央黃字訊息)龍型冰：為了龍族，今日將你們這群雜種一起解決掉！
	ScriptMessage( ActorArray[1], TargetID(), 0 , "[SC_424480_07]", "0xffffff80" )
	sleep(5)
	Yell( ActorArray[2], "[SC_424480_08]",3)					----艾藍：危險！
	sleep(5)
--	AddBuff( ActorArray[2], 620758, 1, -1 )						----艾藍變回龍型
	DelObj(ActorArray[2])
		AddToPartition( ActorArray[5], 0 )
--		DebugMsg(ActorArray[5],1,"11")
--		Say(ActorArray[5],"00")
		ks_ActSetMode( ActorArray[5] )

	WriteRoleValue(ActorArray[5]  ,EM_RoleValue_IsWalk , 0 )
	Hide(ActorArray[5])
	Show(ActorArray[5], 0)
	DW_MoveToFlag( ActorArray[5] , FlagID, 7, 0 ,1)				----艾藍衝過去							
	PlayMotion( ActorArray[1] , ruFUSION_ACTORSTATE_ATTACK_1H )		----龍型冰攻擊動作									
	sleep(10)
	PlayMotion( ActorArray[5], ruFUSION_ACTORSTATE_DYING)			----艾藍死亡
	sleep(5)
	Yell( ActorArray[3], "[SC_424480_11]",3)
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_ANGRY)				
	sleep(10)	

	ScriptMessage( ActorArray[1], TargetID(), 1 , "[SC_424480_09]", "0xffffff80" )	----(中央黃字訊息)龍型冰：嘖......
	ScriptMessage( ActorArray[1], TargetID(), 0 , "[SC_424480_09]", "0xffffff80" )
	DW_MoveDirectToFlag( ActorArray[1] , FlagID, 16, 0 ,1)				--龍型冰飛走
	SetDefIdleMotion(ActorArray[1],ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotionEX(ActorArray[1], ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	SetModeEx(ActorArray[1],EM_SetModeType_Drag,true) 
	sleep(30)
	DelObj(ActorArray[1])
	sleep(20)
	Yell( ActorArray[4], "[SC_424480_10]",3)		----勞勃：嗚嗚！姊姊！姊姊！不舒服！嗚嗚嗚嗚！（emote_surrender）
--	PlayMotion( ActorArray[4], ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	sleep(20)


	--戲演完了
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- 給予旗標\物品
end





---------------------------------------------------------------------------
--424470  死去多時的屍體
---------------------------------------------------------------------------
function LuaPG_424470_Click()
	local Player = OwnerID()
	local NPC = TargetID()

	if	CheckAcceptQuest(Player,424470)==true		and
		CheckCompleteQuest( Player , 424470) == false	and	
		CheckFlag(Player,545523)==false			then
			
			ScriptMessage( Player, Player, 1, "[SC_424470_01]",  "0xffbf0b2b"  )
			ScriptMessage( Player, Player, 0, "[SC_424470_01]",  "0xffbf0b2b"  )  
			Sleep(15)
			SetFlag(Player,545523,1)
	end
	return 1  ----避免點擊物件後是紅色條
end



--任務結束後接劇情
---------------------------------------------------------------------------
--演員：119185、119186
--走位旗子：781002	no.10
--BUFF：620771
function LuaPG_424470_Accept()
	local Player = TargetID()
	local Robert = OwnerID()

	local Num = ReadRoleValue(Robert,EM_RoleValue_Register1)
	
	AddBuff( Player,620771,1,-1)

	if	Num == 0	then						----如果暫存值為0
		CallPlot(Robert , "LuaPG_424470_Accept_01" , Player , Robert)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424470_Accept_01(Player , Robert)
	WriteRoleValue(Robert,EM_RoleValue_Register1,999) 			----開始演出的標記	

	local Gill = Lua_DW_CreateObj("flag",119186,781002,11)
	local Merick = Lua_DW_CreateObj("flag",119185,781002,10)	

	local NeedChange = {Gill,Merick}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end

	DW_MoveDirectToFlag( Gill , 781002,12, 0 ,1)				----吉兒走來
	DW_MoveToFlag( Merick , 781002,13, 0 ,1)				----摩瑞克走來
	NPCSay( Gill, "[SC_424470_02]")					----吉兒：這些屍體是怎麼回事！					
	Sleep(20)

	for index,value in pairs(NeedChange) do
		DelObj(value)	
	end

	CancelBuff(Player,620771)
	WriteRoleValue(Robert,EM_RoleValue_Register1,0)			----寫回勞勃暫存值
end




---------------------------------------------------------------------------
--424491  龍與禁忌符文
---------------------------------------------------------------------------
--演員：119171 賽佛爾
--BUFF：620880
--碰觸後，只會觸發一次，其他會說：為了不打擾其他人的調查，請稍等一下......
function LuaPG_424491_Touch()
	SetCursorType( OwnerID() , 23)	
	SetPlot( OwnerID(),"touch","LuaPG_424491_Touch_01",30 )
end


function LuaPG_424491_Touch_01()						----將演戲function丟回NPC身上
	local Player = OwnerID()
	local DeadDragan = TargetID()

	DW_CancelTypeBuff(68,Player)				----取消騎乘狀態
	local Num = ReadRoleValue(DeadDragan,EM_RoleValue_Register1)

	if	CheckAcceptQuest(Player,424491)==true		and    
		CheckCompleteQuest(Player,424491)==false  	 and
		CheckFlag(Player,545482)==false		and	
		CheckBuff(Player,620672)==false		then
		if	Num==0					then
			BeginCastBarEvent( Player, DeadDragan ,"[SC_424491_01]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424491_Touch_02" )
--			CallPlot(DeadDragan , "LuaPG_424491_Touch_02" , Player,DeadDragan)	
		else
			ScriptMessage( Player, Player, 1,"[SC_424491_TOUCH]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_424491_TOUCH]", 0 )
		end	
	end
end


--碰觸後，會看到導師走來，接劇情
function LuaPG_424491_Touch_02(Player, CheckStatus)
	local Player = OwnerID()
	local DeadDragan = TargetID()
	EndCastBar( Player, CheckStatus )

--	Say(Player,"33")
--	Say(DeadDragan,"44")

	if	CheckStatus>0	then
		AddBuff(Player,620880,1,-1)
		CallPlot(DeadDragan , "LuaPG_424491_Touch_03" , Player,DeadDragan)		----接演戲function	
	end
end

function LuaPG_424491_Touch_03(Player,DeadDragan)
	WriteRoleValue(DeadDragan , EM_RoleValue_Register1,999)

--	Say(Player,"00")
--	Say(DeadDragan,"11")

	local Serv = Lua_DW_CreateObj("flag",119171,781002,14)		----產生賽佛爾
	DW_MoveToFlag( Serv , 781002,15, 0 ,1)				----賽佛爾走來
	AdjustFaceDir( Serv, DeadDragan, 0 )
	CastSpell(  Serv, DeadDragan, 498324 ) 				----賽佛爾對龍的屍體施放法術
	Sleep(50)
	ScriptMessage( Player, Player, 1,"[SC_424491_TOUCH_01]", 0 )
	ScriptMessage( Player, Player, 0,"[SC_424491_TOUCH_01]", 0 )	----SCRIPTM：隨著艾伊那藍的屍體消失，賽佛爾．史奎普的手上多出一顆符文。

	DelObj(Serv)							----刪除演戲用賽佛爾
	
	CancelBuff(Player,620880)
	SetFlag(Player,545482,1)
	WriteRoleValue(DeadDragan , EM_RoleValue_Register1,0)
end

----如果取消任務，就消失
function LuaPG_424491_Cancel_Buff()
--	Say(OwnerID(),"00")
	if	CheckAcceptQuest(OwnerID(),424491)==false	then
		CancelBuff(OwnerID(),620880)
	end
end


--劇情後演戲
---------------------------------------------------------------------------
--演員：勞勃119121  吉兒119186  摩瑞克119185
function LuaPG_424491_Accept()
	local Player = TargetID()
	local Merick = OwnerID()

	local Gill = LuaFunc_SearchNPCbyOrgID( Merick, 119216, 200, 0 )
	local Lobert = LuaFunc_SearchNPCbyOrgID( Merick, 119270, 200, 0 )

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)
	
	AddBuff( Player,620672,1,-1)

	if	Num == 0	then						----如果暫存值為0
		CallPlot(Merick , "LuaPG_424491_Accept_01" , Player , Merick,Gill,Lobert)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424491_Accept_01(Player , Merick,Gill,Lobert)
	WriteRoleValue(Merick,EM_RoleValue_Register1,999) 			----開始演出的標記	

	local New_Merick = DW_CreateObjEX("obj",119102,Merick)
	local New_Gill = DW_CreateObjEX("obj",119103,Gill)
	local New_Lobert = DW_CreateObjEX("obj",119104,Lobert)	


	local NeedChange = {New_Merick,New_Gill,New_Lobert}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end

	PlayMotion(New_Merick,ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(10)
	DW_MoveToFlag( New_Merick , 781002,20, 0 ,1)				----摩瑞克走過去
	NPCSAY(New_Merick,"[SC_424491_ACCEPT_01]")
	Sleep(20)

	for index,value in pairs(NeedChange) do
		SetDefIdleMotion(value,ruFUSION_ACTORSTATE_FLY_LOOP)
		PlayMotionEX(value, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
		SetModeEx(value,EM_SetModeType_Drag,true) 
	end

	Sleep(10)

	for index,value in pairs(NeedChange) do
		DelObj(value)	
	end

	CancelBuff(Player,620672)
	WriteRoleValue(Merick,EM_RoleValue_Register1,0)			----寫回摩瑞克暫存值
end