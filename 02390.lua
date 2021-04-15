---------------------------------------------------------------------------
--424260  顛覆一切的賭局
---------------------------------------------------------------------------
function LuaPG_424260_Give_Buff()
	local Player = TargetID()
	if	CheckAcceptQuest(Player,424260)==true	and
		CheckCompleteQuest(Player,424260)==false	then
		if	CheckBuff( Player , 509922)==false			then	----接任務後給一個buff（509922）
			AddBuff( Player,509922,1,480)
--			AddBuff( Player,620376,1,480)
--			CastSpell(OwnerID(),Player,497196)
			sleep(20)
			ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )
										----(限時任務，已開始倒數計時)
		elseif	CheckBuff( Player , 509922)==true			then
			CancelBuff(Player,509922)
			CancelBuff( Player,620376)
			AddBuff( Player,509922,1,480)
			AddBuff( Player,620376,1,480)
			sleep(20)
			ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )
		end
	end
end

function LuaPG_424260_Time_Limitation()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424260)==true		and
		CheckCompleteQuest(OwnerID(),424260)==false	then	----如果有任務且尚未完成
		if	CheckBuff(OwnerID() , 509922)==true		and	----判斷buff
			CountBodyItem(OwnerID(),240224)>=8	then	----判斷物品
			SetFlag(OwnerID(), 545129, 1)
		elseif	CheckBuff(OwnerID() , 509922)==false		then
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_424260_TIME_LIMITATION]", 0 )	
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424260_TIME_LIMITATION]", 0 )
										----你沒有在時間內帶來贏得賭局該有的東西，請放棄任務重接。
		end
	end
end

function LuaPG_424260_Complete()
--	SAY(OwnerID(),"00")
	local General=OwnerID()
	local Player=TargetID()
	if	CheckBuff(Player,509922)==true	then			----如果身上有buff，則消除
		CancelBuff(Player,509922)	
	end

	local Num = ReadRoleValue(General,EM_RoleValue_Register1)
	AddBuff( Player,620700,1,12)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(General , "LuaPG_424260_Complete_02" , General,Player)
	end
end

function LuaPG_424260_Complete_02(General,Player)
	local King=Lua_DW_CreateObj("flag",118521,780961,1)
	local New_General=DW_CreateObjEX("obj",118523,General)
	local Soldier=Lua_DW_CreateObj("flag",118522,780961,2)
	WriteRoleValue(General,EM_RoleValue_Register1,999) 			----開始演出的標記----產生演戲用領主

	local NeedChange = {King,New_General,Soldier}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end
	
	SetModeEx( New_General , EM_SetModeType_HideName, true)	----名稱
--	Hide(King)
--	Show(King,0)
	DW_MoveDirectToFlag( King , 780961,3,0 ,1) 				----演戲用領主走過來(旗子：780961)NO3
	WriteRoleValue(Soldier  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( Soldier , 780961,4,0 ,1) 				----演戲用保衛兵走過來NO4

	Sleep(10)
	PlayMotion(General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Say(New_General,"[SC_424260_GENERAL]")
	Sleep(20)

	local NeedDelNPC={King,Soldier,New_General}
	for index,value in pairs(NeedDelNPC) do
		DelObj(value)
	end
	
	CancelBuff(Player,620700)
--	SetFlag(Player,545130,1)
	WriteRoleValue(General,EM_RoleValue_Register1,0) 
end

----如果取消任務，就消失
function LuaPG_424260_Cancel_Buff()
--	Say(OwnerID(),"00")
	if	CheckAcceptQuest(OwnerID(),424260)==false	then
		CancelBuff(OwnerID(),509922)
	end
end

---------------------------------------------------------------------------
--424262 取消前令 
---------------------------------------------------------------------------
function LuaPG_424262_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424262)==true		and
		CheckFlag(OwnerID(),545123)==false			and
		CountBodyItem(OwnerID(),240223)>0			then
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424262_PROVE]","LuaPG_424262_02",0)
	end
	if	CheckAcceptQuest(OwnerID(),424326)==true		and
		CheckFlag(OwnerID(),545162)==false			then
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_11]","LuaS_424326_MSG_1",0);
	end
	if	CheckAcceptQuest(OwnerID(),424332)==true	then
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424332_1]","Lua_AG424332_1",0);
	end
end

function LuaPG_424262_02()
	LoadQuestOption(OwnerID())
	DelBodyItem(OwnerID(),240223,1)
	SetFlag(OwnerID(), 545123,1)
end

function LuaS_424326_MSG_1()
	local npcs=ReadRoleValue(TargetID(),EM_RoleValue_Register10)
	local plays=ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	CloseSpeak(OwnerID());
		if	plays~=0	then
			Tell(OwnerID(),TargetID(),"[SC_424326_3]".."[SC_424326_"..(plays-1).."]");
			return
		end
	Tell(OwnerID(),TargetID(),"[SC_424326_"..npcs.."]");
	WriteRoleValue(OwnerID(),EM_RoleValue_Register10,npcs+1)
		if	npcs==0	then
			WriteRoleValue(TargetID(),EM_RoleValue_Register10,1)
		elseif	npcs==1	then
			WriteRoleValue(TargetID(),EM_RoleValue_Register10,2)
		else
			WriteRoleValue(TargetID(),EM_RoleValue_Register10,0)
		end
end
---------------------------------------------------------------------------
--424261 獨以瑞佛爾之名
---------------------------------------------------------------------------
--BUFF(509960)
--演員：瑞佛爾（118538）、將軍（118539）
--flag：擔任見證（545143）
--走位旗子：780961（從no5開始）

function LuaPG_424261_Show()
	local Num = ReadRoleValue(TargetID(),EM_RoleValue_Register1)
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 424261 ) == true	 and
		CheckFlag(OwnerID(),545143)==false			and
		Num > 0 					then 			----檢查玩家是否有任務 並且現在是否正在演戲
		SetSpeakDetail( OwnerID(), "[SC_424261_SAY_WAIT]" )			----(正在演戲情況下 給予告知)
	elseif	CheckAcceptQuest( OwnerID(), 424261 ) == true 	and
		CheckFlag(OwnerID(),545143)==false			and
		Num == 0					then			----如果暫存值為0
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424261_SAY_OK]","LuaPG_424261_Show_02",0)
											----接演戲function	
	end
end

function LuaPG_424261_Show_02()
	local Player = OwnerID()
	local King = TargetID()
	CloseSpeak( Player )								----關閉對話視窗
	local General = LuaFunc_SearchNPCbyOrgID( King, 118469, 200)

	WriteRoleValue( King, EM_RoleValue_Register1, 999 )				----上鎖 表示正在演戲	
	CallPlot(King , "LuaPG_424261_Show_03" , Player,King,General)	
end

function LuaPG_424261_Show_03(Player,King,General)			
	while true do									--注意 這是迴圈
		local QuestID = 424261						--任務編號
		local FinishFlagID = 545143						--完成任務獲得的旗標
		local CheckBuffID = 509960						--檢查是否正在演戲的BUFF
		local CheckRange = 100						--演戲的檢查範圍
		local DoScript = "LuaPG_424261_Show_break"				--演戲結束要做的事


		CallPlot( King, "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )	
											--範圍看戲用的檢查函式

	--演戲中	
		local New_King = DW_CreateObjEX("obj",118538,King)			----生成演戲瑞佛爾
		local New_General = DW_CreateObjEX("obj",118539,General)		----生成演戲將軍

		local NeedChange = {New_King,New_General}
		for index,value in pairs(NeedChange) do
			ks_ActSetMode( value )	
		end

		Sleep(10)
		AdjustFaceDir(New_King, New_General, 0 )
		Say(New_King,"[SC_424261_SAY_01]")					----將軍，我知道長久以來，你一直認為我比不上父王		
		Sleep(20)
	
		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_point)		----瑞佛爾搖頭
		Say(New_King,"[SC_424261_SAY_02]")					----我做的事你總認為太過怯弱而甚少支持......	
		Sleep(30)	
	
		PlayMotion(New_King,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	----說話動作
		Say(New_King,"[SC_424261_SAY_03]")					----尤其現在這種情況.....
		Sleep(25)

		Say(New_King,"[SC_424261_SAY_04]")					----今天，我賭上火靴和自己的未來，向你挑戰！
		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_point)		----瑞佛爾拿著斧頭指著將軍
		Sleep(25)

		Say(New_General,"[SC_424261_SAY_05]")				----哼！你的意思是要拿颶風挑戰我？
		PlayMotion(New_General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	----將軍生氣狀
		Sleep(20)

		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_head_shake)
		Say(New_King,"[SC_424261_SAY_06]")					----不！蓋朵手上的颶風代表著祖先的見證......
		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_point)		----瑞佛爾拿著斧頭指著將軍
		Sleep(25)	

		WriteRoleValue(New_King  ,EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( New_King , 780961,5,0 ,1)   				----移動到旗子的距離

		for	i=1,4	do
		PlayMotion( New_King , ruFUSION_ACTORSTATE_ATTACK_1H )		----瑞佛爾戰鬥
--		CastSpell( New_King, New_General, 497196 )
		Sleep(5)
		PlayMotion( New_General , ruFUSION_ACTORSTATE_ATTACK_1H )	----將軍戰鬥
--		CastSpell( New_General, New_King, 497196 )
		Sleep(5)
		PlayMotion( New_General , ruFUSION_ACTORSTATE_ATTACK_2H  )
--		CastSpell( New_General, New_King, 497196 )
		Sleep(5)
		PlayMotion( New_King , ruFUSION_ACTORSTATE_ATTACK_2H )
		Sleep(10)
		end

		Sleep(10)
		Say(New_General,"[SC_101352_13]")					----哼！
		PlayMotion( New_King , ruFUSION_ACTORSTATE_NORMAL )		----瑞佛爾停止戰鬥
		PlayMotion( New_General , ruFUSION_ACTORSTATE_NORMAL )	----將軍停止戰鬥

		PlayMotionEX( New_General, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
											----將軍跪在地上
		Sleep(10)
		DW_MoveToFlag( New_King , 780961,3,0 ,1) 				----瑞佛爾往後走
		AdjustFaceDir(New_King, New_General, 0 )				----瑞佛爾面對將軍
		Sleep(10)
		Say(New_General,"[SC_424261_SAY_07]")				----將軍：哈哈，真想不到啊......
		Sleep(20)

		CallPlot( King, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
											--戲演完了 讓演戲位置的NPC 給予參與看戲的玩家 重要旗標(keyitem)
		break									--在最後面記得加break中斷
	end
end

function LuaPG_424261_Show_break()							----這段戲中斷/結束時要作的事情(需要此函式輔助判斷)
--	Say(OwnerID(),"00")								----此處為瑞佛爾

	local New_General = LuaFunc_SearchNPCbyOrgID( OwnerID(), 118538, 300, 0 )	----搜尋附近參加的NPC演員
	local New_King = LuaFunc_SearchNPCbyOrgID( OwnerID(), 118539, 300, 0 )
	
	if New_General ~= nil then delobj(New_General) end				----如果存在 則刪除
	if New_King ~= nil then delobj(New_King) end
	ks_resetObj( OwnerID(), nil )							----非常重要 刪除掛載演戲劇情的NPC 作重置
end



---------------------------------------------------------------------------
--424263 蘆卡的酒醃肉
---------------------------------------------------------------------------
--FLAG：545155
function LuaPG_424263_Give_Meat()
	local Player=OwnerID()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( Player, 424263 ) == true	and
		CountBodyItem(Player,240245)==10		then
		AddSpeakOption(Player, TargetID(),"[SC_424263_GIVE_MEET]","LuaPG_424263_Give_Meat_02",0)
	end
end

function LuaPG_424263_Give_Meat_02()
	LoadQuestOption(OwnerID())
	DelBodyItem(OwnerID(),240245, 10)
	SetFlag(OwnerID(),545155,1)
end

function LuaPG_424263_Give_Meat_03()
	local Player=OwnerID()
	if	CheckAcceptQuest( Player, 424263 ) == true	and
		CountBodyItem(Player,240245)<10		then
		SetSpeakDetail(OwnerID(),"[SC_424263_GIVE_MEET_02]")
		AddSpeakOption(Player, TargetID(),"[SC_424263_GIVE_MEET_03]","LuaPG_424263_Give_Meat_04",0)	
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424263_Give_Meat_04()
	CloseSpeak(OwnerID())
	repeat
	GiveBodyitem( OwnerID(), 240245, 1 )
	until CountBodyItem( OwnerID(), 240245 )==10
end

--function LuaPG_424263_Eat_Meat()
--	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424263_EAT_MEAT]", 0 ) 			 ----偷吃肉
--	DELOBJ(TargetID())
--end

---------------------------------------------------------------------------
--傳送門
---------------------------------------------------------------------------
function LuaPG_Z20_TO_Z211_0()
	SetPlot( OwnerID() , "range" , "LuaPG_Z20_TO_Z211_1" , 60 )
end

function LuaPG_Z20_TO_Z211_1()
	ChangeZone( OwnerID() , 80 , 0 , 3022 , 1130 , 4268 , 90 )
end

function LuaPG_Z211_TO_Z20_0()
	SetPlot( OwnerID() , "range" , "LuaPG_Z211_TO_Z20_1" , 50 )
end

function LuaPG_Z211_TO_Z20_1()
	ChangeZone( OwnerID() , 20 , 0 , -17115.9 , 401.6 , 43146 , 40 )
end