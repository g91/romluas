--z24支線、PE、委託=======================================
--=======================================
--425556 讓狂暴回歸虛無
---------------------------------------------------------------------------
function LuaPG_425556_CheckandKill()	--怪物死掉
	local NPC = OwnerID()
	local PlayerList = {}
	local Num = HateListCount(NPC)						--檢查身上仇恨表
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local Center = ReadRoleValue(NPC, EM_RoleValue_Register2)
	local CenPID = ReadRoleValue(Center, EM_RoleValue_PID)
	local SurvieNum = ReadRoleValue(Center, EM_RoleValue_Register3)

	for i = 0,Num do
		PlayerList[i] = HateListInfo(NPC, i, EM_HateListInfoType_GItemID)		--找到後檢查任務
		if OrgID == 107084 or OrgID == 107085	then
			if DW_CheckQuestAccept("or",PlayerList[i], 425556,425745,425726) == true	then
				DW_QietKillOne(PlayerList[i],107152)			 --靜靜的殺死怪，前者殺死後者，0代表為玩家
			end
		end
		if OrgID == 107085 or OrgID == 107136	then
			if DW_CheckQuestAccept("or",PlayerList[i], 425570,425755,425736) == true	and
			CountBodyItem(PlayerList[i], 241700)<10					then
--				Say(NPC, "oya")
				GiveBodyItem(PlayerList[i], 241700, 1)				 --就給他一個東西
			end
		end
	end

	if CenPID~=0	then
		if Center ~= 0	then
			SurvieNum = SurvieNum-1
		end
--		Say(Center, SurvieNum)
		if SurvieNum ==0	then
			CallPlot(Center,"LuaFunc_ResetObj",Center)
		end
	end
end


--=======================================
--425564 藤蔓構築之壁
---------------------------------------------------------------------------
function LuaPG_425564_Click()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425564)==true	then
		DW_QietKillOne(0,107194)		 ----靜靜的殺死怪，前者殺死後者，0代表為玩家
		Sleep(5)
	end
	return 1					----避免點擊物件後是紅色條
end



--=======================================
--425565 傳遞微小的力量
---------------------------------------------------------------------------
function LuaPG_425565_BeforeClick()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425565,425753,425734)==true	then
		if CountBodyItem(Player, 241310)>0				then
			return true
		else
			ScriptMessage( Player, Player, 1,"[SC_Z24Q425565_01]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_Z24Q425565_01]", 0 )	
			return false
		end	
	end
end

function LuaPG_425565_AfterClick()
	local Player = OwnerID()
	BeginPlot(Player, "LuaPG_425565_CROUCH", 0)
	DelBodyItem(Player, 241310, 1)
	DW_QietKillOne(0, 107195)
	return 1
end

function LuaPG_425565_CROUCH()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)
end


--=======================================
--425567 自昏迷中喚醒
---------------------------------------------------------------------------
--走位：781183 NO.1
function LuaPG_425567_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	if OrgID == 121286 or OrgID == 121288 or OrgID == 121289	then	--判讀對方id		
		if CountBodyItem(Player, 241816)>=1			then
			return true
		else
			ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", 0 )	
			return false
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", 0 )
		return false	
	end
end

function LuaPG_425567_Save()
	local Player = OwnerID()
	local NPC = TargetID()
	DelBodyItem(Player, 241816, 1)					--刪除物品	
	DW_QietKillOne(0,107203)					--偷偷殺怪
	BeginPlot(NPC, "LuaPG_425567_Save_02", 0)	
	return 1
end

function LuaPG_425567_Save_02()
	local NPC = OwnerID()
	local Flag = 781183
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local OrgIDList = {}
	OrgIDList[121286]=121454
	OrgIDList[121288]=121455
	OrgIDList[121289]=121456
	local NewNPC = DW_CreateObjEX("obj",OrgIDList[OrgID],NPC)	--產生新的精靈
	ks_ActSetMode(NewNPC)					--演員用開關

	local SpeakList = {"[SC_Z24Q425567_02]","[SC_Z24Q425567_04]","[SC_Z24Q425567_05]"}
	local Num = Rand(3)+1
	NPCSAY(NewNPC, SpeakList[Num])				--精靈道謝
	Sleep(25)
	NPCSAY(NewNPC, "[SC_Z24Q425567_04]")
	Sleep(25)
	DW_MoveDirectToFlag( NewNPC, Flag, 1, 0, 1)			--精靈走掉
	Sleep(10)
	DelObj(NewNPC)	
end

function LuaPG_425567_ReTake()
	local Player = OwnerID()
	local Fay = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425567)==true	and 
	CountBodyItem(Player,241816)==0			then
		AddSpeakOption( Player, Fay, "[SC_Z24Q425567_06]", "LuaPG_425567_ReTake_01", 0 )
	end
end

function LuaPG_425567_ReTake_01()
	local Player = OwnerID()
	GiveBodyItem(Player, 241816, 3)
	CloseSpeak(Player)
end




--=======================================
--425569 渡火潔淨污穢
---------------------------------------------------------------------------
function LuaPG_425569_Touch()
	local Fire = OwnerID()
	SetCursorType( Fire , 23)							----改變點擊的圖示
	SetPlot( Fire, "touch", "LuaPG_425569_IntoFire", 10 )
end

function LuaPG_425569_IntoFire()		--火盆上的碰觸劇情
	local Player = OwnerID()
	local Fire = TargetID()
	local Num01=ReadRoleValue(Fire, EM_RoleValue_Register3)

	DW_CancelTypeBuff(68,Player)						----取消騎乘狀態
	if DW_CheckQuestAccept("or",Player,425569)==true	and		--如果條件符合
	CheckFlag(Player, 546908)==false			then
		if Num01 == 0					then
			if 	BeginCastBarEvent( Player, Fire ,"[SC_Z24Q425569_01]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_425569_IntoFire_01" ) ~= 1 then
										----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player, Player, 1,"[SC_Z24Q425569_02]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z24Q425569_02]", "0xffbf0b2b" )
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
--		Say(Fire, "00")
	end	
end

function LuaPG_425569_IntoFire_01(Player, CheckStatus)
	local Fire = TargetID()
	EndCastBar( Player, CheckStatus)
--	Say(Fire, "11")
	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			CallPlot(Fire, "LuaPG_425569_IntoFire_02", Fire,Player)	--觸發劇情
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_425569_IntoFire_02(Fire,Player)
	WriteRoleValue(Fire , EM_RoleValue_Register3 , 999)
	local Burn = ReadRoleValue(Fire,EM_RoleValue_Register1)
	CastSpell( Burn, Burn, 850375)
	SetFlag(Player, 546908, 1)
	WriteRoleValue(Fire , EM_RoleValue_Register3 , 0)
end

function LuaPG_425569_Burn()			--火盆生火
	local Fire = OwnerID()
	local RoomID = ReadRoleValue(Fire, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Fire, EM_RoleValue_X )
	local Y = ReadRoleValue( Fire, EM_RoleValue_Y )
	local Z = ReadRoleValue( Fire, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Fire, EM_RoleValue_Dir )	--徑度
	local Burn = CreateObj( 121295, X-1, Y+10, Z+1, Dir, 1 )
	
	SetModeEx( Burn ,EM_SetModeType_Mark , false ) 	--標記
	SetModeEx( Burn ,EM_SetModeType_Move , false ) 	--移動
	SetModeEx( Burn, EM_SetModeType_Gravity , false )	--重力取消
	AddToPartition(Burn, RoomID )
	WriteRoleValue(Fire,EM_RoleValue_Register1, Burn)	--把火焰寫進火盆中
end

function LuaPG_425569_ReTake()
	local Player = OwnerID()
	local Percy = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425569)==true and
	(CountBodyItem(Player,241698)==0 or CountBodyItem(Player,241699)==0)then
		AddSpeakOption( Player, Percy, "[SC_Z24Q425569_03]", "LuaPG_425569_ReTake_01", 0 )
	end
end

function LuaPG_425569_ReTake_01()
	local Player = OwnerID()
	repeat
	GiveBodyItem(Player, 241698, 1)
	until
	CountBodyItem( Player, 241698)==1
	repeat
	GiveBodyItem(Player, 241699, 1)
	until
	CountBodyItem( Player, 241699)==1
	CloseSpeak(Player)
end




--=======================================
--425580 對遠古靈魂的召喚
---------------------------------------------------------------------------
--演員：121298 莫克．派波，121299 尼洛．布蘭登，121300 查吉．貝爾
--給玩家看戲的BUFF：623273
--走位：781183	NO.3~7
function LuaPG_425580_Show()
	local Player = OwnerID()
	local Pepper = TargetID()

	local Num = ReadRoleValue(Pepper, EM_RoleValue_Register1)

	if CheckAcceptQuest( Player, 425580) == true		 and
	CheckFlag(Player,546929)==false			then
		if Num > 0					then			----檢查玩家是否有任務 並且現在是否正在演戲		
			SetSpeakDetail(Player, "[SC_Z24Q425580_02]")			----(正在演戲情況下 給予告知)
		elseif Num == 0				then			----如果暫存值為0
			SetSpeakDetail(Player, "[SC_Z24Q425580_01]")
			AddSpeakOption(Player, Pepper,"[SC_Z24Q425580_CHECK]","LuaPG_425580_Show_02",0)
		end									----接演戲function	
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425580_Show_02()
	local Player = OwnerID()
	local Pepper = TargetID()
	local PlayerList01 = SearchRangePlayer(Pepper, 250)
	local PlayerList02 = {}
	for i = 0,#PlayerList01 do
		if CheckAcceptQuest(PlayerList01[i], 425580)==true and			--過濾有任務的玩家
		CheckFlag(PlayerList01[i],546929)==false		then
			table.insert(PlayerList02, PlayerList01[i])
--			Say(PlayerList02[i+1],"HERE")
		end
	end
	CloseSpeak( Player )								----關閉對話視窗
	
	WriteRoleValue( Pepper, EM_RoleValue_Register1, 999 )				----上鎖 表示正在演戲
	CallPlot( Pepper, "LuaPG_425580_Show_03", Player,Pepper,PlayerList02)				
end

function LuaPG_425580_Show_03(Player,Pepper,PlayerList02)			--掛在NPC身上的演戲劇情			
	local QuestID = 425580						--任務編號
	local FinishFlagID = 546929					--完成任務獲得的旗標
	local CheckBuffID = 623273					--檢查是否正在演戲的BUFF
	local CheckRange = 250						--演戲的檢查範圍
	local ActorArray = {}						--(新版修改)演員陣列表
	
	local FlagID = 781183				--旗標ID
	-- 事先把所有會用到的演員產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 121298, FlagID, 3, 1 )		--莫克
	ActorArray[2] = CreateObjByFlag( 121299, FlagID, 4, 1 )		--尼洛
	ActorArray[3] = CreateObjByFlag( 121300, FlagID, 5, 1 )		--查吉

	CallPlot( Pepper, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式

	for k=1,#PlayerList02 do						
		Lua_StopBGM(PlayerList02[k])					--停止背景音樂
		local Music = PlayMusicToPlayer(PlayerList02[k],"music/zone/019/zone/day/fantastic_grounds_05_TSI_leprechaun.mp3", false)	--播放音樂
		WriteRoleValue(PlayerList02[k], EM_RoleValue_Register5, Music)	--把音樂寫入玩家身上
	end
	for i=1, 3 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end
	sleep(10)

	--演戲中
	SAY(ActorArray[1], "[SC_Z24Q425580_03]")			--莫克：（施法，地上出現法陣）自遠古沉睡至今的靈魂啊，請出現在我們面前。
	SetDefIdleMotion( ActorArray[1], ruFUSION_MIME_BUFF_SP01)
	Sleep(25)
	SAY(ActorArray[2], "[SC_Z24Q425580_04]")			--尼洛：離開你的棲所，越過界線來顯現。
	SetDefIdleMotion( ActorArray[2], ruFUSION_MIME_BUFF_SP01)
	Sleep(25)
	SAY(ActorArray[3], "[SC_Z24Q425580_05]")			--查吉：我們在此地等著你。現身吧！現身吧！現身吧！
	SetDefIdleMotion( ActorArray[3], ruFUSION_MIME_BUFF_SP01)
	Sleep(25)
	for i=1,3 do
		SetDefIdleMotion( ActorArray[i], ruFUSION_MIME_IDLE_STAND)
	end
	SAY(ActorArray[1], "[SC_Z24Q425580_06]")			--莫克：接下來把毒雀子草丟入火中……
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)
	SAY(ActorArray[2], "[SC_Z24Q425580_07]")			--尼洛：啊啊啊啊啊啊！
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_CROUCH_LOOP)	--(尼洛跪下)
	Sleep(20)
	SAY(ActorArray[1], "[SC_Z24Q425580_15]")			--莫克
	Sleep(10)
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_CROUCH_END)
	SAY(ActorArray[2], "[SC_Z24Q425580_08]")			--尼洛：哈哈哈哈！你們這些愚蠢的侵犯我安眠的人！準備接受懲罰吧！
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Sleep(35)
	SAY(ActorArray[3], "[SC_Z24Q425580_09]")			--查吉：莫克，不太對，難道是……召喚失敗了？
	PlayMotion(ActorArray[3], ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(25)
	SAY(ActorArray[1], "[SC_Z24Q425580_10]")			--莫克：總之先跑再說吧！騎士，別發呆了，快跑！
	Sleep(20)

	WriteRoleValue(ActorArray[1] , EM_RoleValue_IsWalk , 0) 
	DW_MoveDirectToFlag(ActorArray[1] , FlagID, 6, 0, 1) 		--（兩個研究員跑走，留在原地的會開始隨機罵人）
	WriteRoleValue(ActorArray[3] , EM_RoleValue_IsWalk , 0) 
	DW_MoveToFlag( ActorArray[3] , FlagID, 7, 0, 1) 
	for i=1, 3 do
		DelObj(ActorArray[i])
	end
	--戲演完了
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- 給予旗標\物品
end

function LuaPG_425580_Curse()		--亂罵用的透明球
	local Nilo_Curse = OwnerID()
	local CurseList = {}
	CurseList[1]="[SC_Z24Q425580_11]"
	CurseList[2]="[SC_Z24Q425580_12]"
	CurseList[3]="[SC_Z24Q425580_13]"
	CurseList[4]="[SC_Z24Q425580_14]"

	local Rand_Num = Rand(4)+1
	while 1 do
		Sleep(100)
		NPCSAY(Nilo_Curse, CurseList[Rand_Num])
	end
end

function LuaPG_425580_BGM_Return()	--刪除播放音樂，恢復背景音
	local Player = OwnerID()
	local Music = ReadRoleValue(Player, EM_RoleValue_Register5)
	if Music~=0	then
		StopSound(Player,Music)
		Lua_PlayBGM(Player)
	end
end

--=======================================
--425581 召喚失敗？
---------------------------------------------------------------------------
function LuaPG_425581_Retake()
	local Player = OwnerID()
	local Holly = TargetID()
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player,425581)== true	 and 
	CheckFlag(Player, 546930)==false		and
	CountBodyItem(Player, 241703)==0		 then
		AddSpeakOption( Player, Holly, "[SC_Z24Q425581_01]", "LuaPG_425581_Retake_01", 0 )
	end
end

function LuaPG_425581_Retake_01()
	local Player = OwnerID()
	local Holly = TargetID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 241703,1)
	Tell(Player, Holly, "[SC_Z24Q425581_02]")
end

function LuaPG_425581_Hit_Check()		--棍子揍人前檢查
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local Num = ReadRoleValue(NPC, EM_RoleValue_Register2)
	if CheckFlag(Player, 546930)==true	then
		return false
	end
	if OrgID~= 121304	then								--檢查對方的orgid
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425581_03]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425581_03]", "0xffbf0b2b" )		
		return false	
	end
	if Num>0	then									--檢查對方有沒有被其他人打
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425581_04]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425581_04]", "0xffbf0b2b" )		
		return false		
	end
	if CheckAcceptQuest( Player,425581)== true and CheckFlag(Player, 546930)==false	then	--檢查自己有沒有flag
		return true
	end
end

function LuaPG_425581_Hit_After()		--使用棍子後
	local Player = OwnerID()
	local Nilo = TargetID()
	local BuffCheck=Lua_BuffPosSearch( Player ,623332)					--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--確認BUFF層數	
	WriteRoleValue( Nilo, EM_RoleValue_Register2, 999 )					--寫上register的值
	local LVandSpeakList={}									--自己打人的層數（buff有時間限制，所以要在時間內打到一定的次數）
	LVandSpeakList[0]="[SC_Z24Q425581_05]"
	LVandSpeakList[1]="[SC_Z24Q425581_06]"
	LVandSpeakList[2]="[SC_Z24Q425581_07]"
	LVandSpeakList[3]="[SC_Z24Q425581_09]"
	LVandSpeakList[4]="[SC_Z24Q425581_08]"
	LVandSpeakList[5]="[SC_Z24Q425581_08]"
	AttachCastMotionTool( Player, 212076)
	AddBuff(Player, 623332, 0, 15)								--給自己的BUFF
	BeginPlot(Player, "LuaPG_425581_Hit_After_03", 0)					--被打的特效		
	NPCSAY(Nilo, LVandSpeakList[BuffLv])							--對方喊痛
	PlayMotion(Nilo, ruFUSION_ACTORSTATE_EMOTE_CRY)
	if BuffLv>=5	then									--到達一定層數給flag
		SetFlag(Player, 546930, 1)
	end
	BeginPlot(Player, "LuaPG_425581_Hit_After_02", 0)
	WriteRoleValue( Nilo, EM_RoleValue_Register2, 0)					--還原register的值
end

function LuaPG_425581_Hit_After_02()
	local Player = OwnerID()
	Sleep(30)
	AttachCastMotionTool( Player, 212076)							--換回空手
end

function LuaPG_425581_Hit_After_03()
	local Player = OwnerID()
	AttachCastMotionTool(Player, 213827)
--	PlayMotion(Player, ruFUSION_ACTORSTATE_DEBUFF_INSTANT)
end



--=======================================
--425582 思念的故鄉
---------------------------------------------------------------------------
function LuaPG_425582_Truth()
	local Player = OwnerID()
	local Mork = TargetID()
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player,425582)== true and CheckFlag(Player,546931)==false then
		AddSpeakOption( Player, Mork, "[SC_Z24Q425582_01]", "LuaPG_425582_Truth_01", 0 )
	end
end

function LuaPG_425582_Truth_01()
	local Player = OwnerID()
	SetFlag(Player, 546931, 1)
	CloseSpeak(Player)
end




--=======================================
--425583 記憶中的滋味
---------------------------------------------------------------------------
function LuaPG_425583_TakeFruit()
	local Player = OwnerID()
	local BMan = TargetID()
	LoadQuestOption(Player)
	AddSpeakOption( Player, BMan, GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	if CheckAcceptQuest( Player,425583)== true	and
	CountBodyItem(Player, 241702)==0		then
		AddSpeakOption( Player, BMan, "[SC_Z24Q425583_01]", "LuaPG_425583_TakeFruit_01", 0 )
	end
end

function LuaPG_425583_TakeFruit_01()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_Z24Q425583_02]")
	GiveBodyItem(Player, 241702, 5)
end



--=======================================
--425574 失蹤人口？
---------------------------------------------------------------------------
function LuaPG_425574_TakeHimGo()
	local Player = OwnerID()
	local DickBird = TargetID()
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player,425574)== true	and
	CountBodyItem(Player, 241705)==0		then
		AddSpeakOption( Player, DickBird, "[SC_Z24Q425574_TAKETHISMAN]", "LuaPG_425574_aManInBackPack", 0 )
	end
end

function LuaPG_425574_aManInBackPack()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 241705, 1)
end




--=======================================
--425575 急速失溫
---------------------------------------------------------------------------
--BUFF: 623282、850376
function LuaPG_425575_Complete()
	local Player = TargetID()
	local Wally = OwnerID()
	local Flag = 781183
	local BUFF = 623282
	local Num = ReadRoleValue(Wally,EM_RoleValue_Register1)

	if	Num == 0	then					----如果暫存值為0
		local New_Wally = DW_CreateObjEX("obj", 121324, Wally)		----生成演戲Wally
		ks_ActSetMode( New_Wally )
		AddBuff( Player,BUFF,1,20)
		CallPlot(Wally , "LuaPG_425575_Complete_02" , New_Wally , Wally, Player, Flag, BUFF)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end	
end

function LuaPG_425575_Complete_02(New_Wally , Wally, Player, Flag, BUFF)
	WriteRoleValue(Wally,EM_RoleValue_Register1,999) 		----開始演出的標記

	local DickBird = LuaFunc_SearchNPCbyOrgID( Wally, 121325, 50, 0 )
	local x,y,z,dir=DW_Location(DickBird)
	local New_DickBird = CreateObj(121322,x,y,z,dir,1)
	PlayMotionEX( New_DickBird, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	AddToPartition(New_DickBird,0)
	Sleep(10)
	AdjustFaceDir( New_Wally,DickBird, 0)
	NPCSAY(New_Wally, "[SC_425575_WORKS_01]")			--撒上前的說話
	PlayMotionEX( New_Wally, ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)	--動作
	Sleep(25)
	CastSpell(New_Wally, DickBird, 850376)				--凍僵溶解的Buff
	NPCSAY(New_Wally, "[SC_425575_WORKS_02]")			--好像有效的說話
	Sleep(10)
	NPCSAY(New_DickBird, "[SC_425575_WORKS_03]")
	PlayMotion( New_DickBird,ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(30)
	DelObj(New_Wally)
	DelObj(New_DickBird)

	CancelBuff(Player, BUFF)	
	WriteRoleValue(Wally,EM_RoleValue_Register1,0)
end




--=======================================
--425577 前因，後果
---------------------------------------------------------------------------
function LuaPG_425577_KnowTheTruth()
	local Player = OwnerID()
	local DickBird = TargetID()
	if CheckAcceptQuest( Player,425577)== true	and
	CheckFlag(Player, 547017)== false		then
		SetSpeakDetail(Player, "[SC_425577_TALK_01]")
		AddSpeakOption(Player, DickBird, "[SC_425577_TALK_02]", "LuaPG_425577_KnowTheTruth_02(1)", 0)
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425577_KnowTheTruth_02(Talk)
	local Player = OwnerID()
	local DickBird = TargetID()
	if Talk==1	then
		SetSpeakDetail(Player, "[SC_425577_TALK_03]")
		AddSpeakOption(Player, DickBird, "[SC_425577_TALK_04]", "LuaPG_425577_KnowTheTruth_02(2)", 0)
	elseif Talk==2	then
		SetSpeakDetail(Player, "[SC_425577_TALK_05]")
		AddSpeakOption(Player, DickBird, "[SC_425577_TALK_06]", "LuaPG_425577_KnowTheTruth_02(3)", 0)	
	elseif Talk==3	then
		SetSpeakDetail(Player, "[SC_425577_TALK_07]")
		AddSpeakOption(Player, DickBird, "[SC_425577_TALK_08]", "LuaPG_425577_KnowTheTruth_02(4)", 0)
		AddSpeakOption(Player, DickBird, "[SC_425577_TALK_09]", "LuaPG_425577_KnowTheTruth_02(1)", 0)
	elseif Talk==4	then
		CloseSpeak(Player)
		SetFlag(Player, 547017, 1)
	end
end



--=======================================
--425578 冰雪大地的結晶
---------------------------------------------------------------------------
function LuaPG_425578_AttractTheBear()		--範圍劇情吸引附近的丘蒙來揍你
	local IceSeed = OwnerID()
	local Num = ReadRoleValue(IceSeed, EM_RoleValue_Register1)
--	Say(IceSeed, "YA")
	if Num==0	then
--		Say(IceSeed, "got")
		SetPlot( IceSeed,"range","LuaPG_425578_AttractTheBear_01",40 )
	end
end

function LuaPG_425578_AttractTheBear_01()	--轉給冰種本身引發劇情的跳板
	BeginPlot(TargetID(), "LuaPG_425578_AttractTheBear_02", 0)
end

function LuaPG_425578_AttractTheBear_02()
	local IceSeed = OwnerID()
	local Player = TargetID()
	WriteRoleValue(IceSeed, EM_RoleValue_Register1, 999)				----只發生一次，紀錄值
	local BearMan = SearchRangeNPC(IceSeed, 250)
	local Num01 = table.getn(BearMan)
	local OrgID
	local DeadorNot
	local AttackorNot
	local Attack=0
--	Say(IceSeed, "YA2")
	for i = 0, Num01 do
--		Say(IceSeed, "YA問")
		OrgID = ReadRoleValue(BearMan[i], EM_RoleValue_OrgID)
		AttackorNot = HateListCount(BearMan[i])					----仇恨表
		DeadorNot = ReadRoleValue( BearMan[i], EM_RoleValue_IsDead )
			if (OrgID == 107089	or
			OrgID == 107090	or					----檢查附近是否有熊人
			OrgID == 107091	or
			OrgID == 107092	or
			OrgID == 107093	or
			OrgID == 107094	or
			OrgID == 107095)	and
			DeadorNot==0		and
			AttackorNot==0	then					----是否正在戰鬥
--				Say(IceSeed, "nya~")
--				Say(IceSeed, OrgID)
				sysCastSpellLv (Player , BearMan[i] ,498368, 0 )		----有的話，觸發的那個玩家對該熊人嘲諷
				NPCSAY(BearMan[i], "[SC_Z24Q425578_ANGRYBEAR]")
				Attack=Attack+1
				if Attack==2	then
					break
				end
			end
		Sleep(5)
	end
	WriteRoleValue(IceSeed, EM_RoleValue_Register1, 0)----將值寫回0
end

function LuaPG_425578_IceSeed()		--冰種的特效
	local IceSeed = OwnerID()
	CastSpell(IceSeed, IceSeed, 850386)
--	CallPlot(IceSeed, "LuaPG_425578_AttractTheBear", IceSeed)
end




--=======================================
--425517 古文獻的治療法
---------------------------------------------------------------------------
function LuaPG_425571_PictureCheck()		--身上有這東西，點擊前檢查
	local Player = OwnerID()
	local Plant = TargetID()
	if CountBodyItem(Player, 241814)==0	then
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425517_01]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425517_01]", 0 )
		return false
	end
	return true
end

function LuaPG_425571_Retake()
	local Player = OwnerID()
	local UR = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425571,425737,425756)==true	and
	CountBodyItem(Player, 241814)==0					then
		AddSpeakOption(Player, UR, "[SC_425517_TAKE]", "LuaPG_425571_Retake_02", 0)
	end
end

function LuaPG_425571_Retake_02()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_425517_GIVE]")
	GiveBodyItem(Player, 241814, 1)
end



--=======================================
--冰原區任務
--=======================================
--425527 收集詢問
---------------------------------------------------------------------------
function LuaPG_425527_Ask()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425527)==true	and
	(CheckFlag(Player, 547041)==false or 
	CheckFlag(Player, 547042)==false or 
	CheckFlag(Player, 547043)==false)			then
		AddSpeakOption(Player, NPC, "[SC_Z24Q425527_01]", "LuaPG_425527_Ask_02(1)", 0)
	end
end

function LuaPG_425527_Ask_02(Answer)
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local NPCandFlagList = {}
	NPCandFlagList[121420] = {547041,"[SC_Z24Q425527_04]", "[SC_Z24Q425527_05]", "[SC_Z24Q425527_06]"}
	NPCandFlagList[121421] = {547042,"[SC_Z24Q425527_07]", "[SC_Z24Q425527_08]", "[SC_Z24Q425527_09]"}
	NPCandFlagList[121422] = {547043,"[SC_Z24Q425527_10]", "[SC_Z24Q425527_11]", "[SC_Z24Q425527_12]"}

	if Answer == 1	then
		SetSpeakDetail(Player, NPCandFlagList[OrgID][2])
		AddSpeakOption(Player, NPC, "[SC_Z24Q425527_02]", "LuaPG_425527_Ask_02(2)", 0)			
	elseif Answer == 2	then
		SetSpeakDetail(Player, NPCandFlagList[OrgID][3])
		AddSpeakOption(Player, NPC, "[SC_Z24Q425527_03]", "LuaPG_425527_Ask_02(3)", 0)	
	elseif Answer == 3	then
		SetSpeakDetail(Player, NPCandFlagList[OrgID][4])
		SetFlag(Player, NPCandFlagList[OrgID][1], 1)	
	end
end



--=======================================
--425528 追蹤標記
---------------------------------------------------------------------------
function LuaPG_425528_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	if OrgID~= 121421	then
		ScriptMessage( Player, Player, 1,"[SC_425105_C]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_425105_C]", "0xffbf0b2b" )
		return false		
	end
	if CheckDistance( Player, NPC, 50)==true	then		--測量距離
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425528_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425528_01]", "0xffbf0b2b" )	--小於某距離會出現SCRIPTM
		return false
	end
end

function LuaPG_425528_Use()
	local Player = OwnerID()
	DelBodyItem(Player, 241831, 1)
	SetFlag(Player, 547080, 1)
end

function LuaPG_425528_Talk()
	local Player = OwnerID()
	local Puniro = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425528)==true	and
	CountBodyItem(Player, 241831)==0			and
	CheckFlag(Player, 547080)==false			then
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425528_02]", "LuaPG_425528_Talk_02(2801)", 0)
	end
	if DW_CheckQuestAccept("or",Player,425533)==true	and
	CheckFlag(Player, 547048)==false			then
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_01]", "LuaPG_425528_Talk_02(3302)", 0)
	end
end

function LuaPG_425528_Talk_02(Num)
	local Player = OwnerID()
	local Puniro = TargetID()	
	if Num == 2801	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 241831, 1)
	elseif Num == 3302	then
		SetSpeakDetail(Player, "[SC_Z24Q425533_02]")
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_03]", "LuaPG_425528_Talk_02(3305)", 0)
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_04]", "LuaPG_425528_Talk_02(3308)", 0)
	elseif Num == 3305	then
		SetSpeakDetail(Player, "[SC_Z24Q425533_02]")
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_06]", "LuaPG_425528_Talk_02(3307)", 0)
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_04]", "LuaPG_425528_Talk_02(3308)", 0)
	elseif Num == 3307	then
		SetSpeakDetail(Player, "[SC_Z24Q425533_02]")
		SetFlag(Player, 547048, 1)
	elseif Num ==3308	then
		SetSpeakDetail(Player, "[SC_Z24Q425533_02]")
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_03]", "LuaPG_425528_Talk_02(3305)", 0)
		AddSpeakOption(Player, Puniro, "[SC_Z24Q425533_06]", "LuaPG_425528_Talk_02(3307)", 0)
	end
end




--=======================================
--425529 微物證據
---------------------------------------------------------------------------
--Flag: 781183 No.9
--BUFF: 623334
function LuaPG_425529_ClickAfter()
	local Player = OwnerID()
	SetFlag(Player,547044,1)
	return 1
end

function LuaPG_425529_Complete()
	local Player = TargetID()
	local Puniro = OwnerID()
	local Flag = 781183
	local BUFF = 623334
	local Num = ReadRoleValue(Puniro,EM_RoleValue_Register1)	
	if	Num == 0	then					----如果暫存值為0
		local New_Puniro = DW_CreateObjEX("obj", 121390, Puniro)	----生成演戲
		ks_ActSetMode( New_Puniro )
		AddBuff( Player,621123,1, 20)
		CallPlot(Puniro, "LuaPG_425529_Complete_02" , New_Puniro, Puniro, Player, Flag, BUFF)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425529_Complete_02(New_Puniro, Puniro, Player, Flag, BUFF)
	WriteRoleValue(Puniro,EM_RoleValue_Register1,999) 			----開始演出的標記

	local Soilder = Lua_DW_CreateObj("flag",121391, Flag, 9)			----產生通報的士兵781183 No.9
	ks_ActSetMode( Soilder )
	Sleep(10)
	DW_MoveToFlag( Soilder , Flag, 10, 0, 1)					--撒上前的說話781183 No.10
	PlayMotion(Soilder, ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	Sleep(10)
	PlayMotion(Soilder, ruFUSION_ACTORSTATE_EMOTE_SPEAK)		--悄悄話的動作
	Sleep(20)
	PlayMotion(Soilder, ruFUSION_ACTORSTATE_EMOTE_THINK)
	Sleep(20)
	DW_MoveToFlag( Soilder , Flag, 9, 0, 1)					--通報的士兵走掉781183 No.9
	DelObj(Soilder)
	DelObj(New_Puniro)

	CancelBuff(Player, BUFF)	
	WriteRoleValue(Puniro,EM_RoleValue_Register1,0)
end



--=======================================
--425530 謎團重重
---------------------------------------------------------------------------
function LuaPG_425530_TakeHimGo()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425527)==true	then
		AddSpeakOption(Player, NPC, "[SC_Z24Q425530_01]", "LuaPG_425530_TakeHimGo_02", 0)
	end	
end

function LuaPG_425530_TakeHimGo_02()
	local Player = OwnerID()
	GiveBodyItem(Player, 241833, 1)
end

function LuaPG_425530_ClickAfter()
	local Player = OwnerID()
	SetFlag(Player, 547082, 1)
	return 1
end



--=======================================
--425534 再回崗位
---------------------------------------------------------------------------
function LuaPG_425534_Talk()
	local Player = OwnerID()
	local Marcy = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425534)==true	and
	CheckFlag(Player, 547049)==false			then
		AddSpeakOption(Player, Marcy, "[SC_Z24Q425534_01]", "LuaPG_425534_Talk_02()", 0)
	end
end

function LuaPG_425534_Talk_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player, 547049, 1)
end



--=======================================
--425572 讓狂暴回歸平靜
---------------------------------------------------------------------------
function LuaPG_425572_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID)
	if DW_CheckQuestAccept("or",Player,425534)==false	then		--判斷任務
		ScriptMessage( Player, Player, 1, "[SC_Z24Q425567_01]","0xffbf0b2b" )
		ScriptMessage( Player, Player, 0, "[SC_Z24Q425567_01]","0xffbf0b2b" )		
		return false
	end
	if NPCOrgID ~= 107084 or NPCOrgID ~= 107085	then			--判斷怪物編號
		ScriptMessage( Player, Player, 1, "[SC_424142_1]","0xffbf0b2b" )
		ScriptMessage( Player, Player, 0, "[SC_424142_1]","0xffbf0b2b" )
		return false
	end

	local MaxHP = ReadRoleValue(NPC,EM_RoleValue_MaxHP)
	local NowHP = ReadRoleValue(NPC,EM_RoleValue_HP)
	local DeadorNot = ReadRoleValue( NPC, EM_RoleValue_IsDead)
	if NowHP/MaxHP>0.5	then						--判斷血量
		ScriptMessage( Player, Player, 1, "[SC_425572_02]","0xffbf0b2b" )
		ScriptMessage( Player, Player, 0, "[SC_425572_02]","0xffbf0b2b" )
		return false
	end
	if DeadorNot == 1 	then
		ScriptMessage( Player , Player , 1 , "[SC_423048_6]" ,"0xffbf0b2b")
		ScriptMessage( Player , Player , 0 , "[SC_423048_6]" , "0xffbf0b2b")
		return false
	end

	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_422932_3]" , 0 ) 	----你無法在騎乘時使用
			ScriptMessage( Player , Player , 0 , "[SC_422932_3]" , 0 )
			return false
		end
	end
end

function LuaPG_425572_Use()
	local Player = OwnerID()
	local NPC = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_425572_01]" , 0 ) 			----平靜下來
	ScriptMessage( Player , Player , 0 , "[SC_425572_01]" , 0 )
	SetStopAttack(NPC)
	SetModeEx( NPC, EM_SetModeType_Searchenemy , false )		--不索敵
	SetModeEx( NPC, EM_SetModeType_Fight , false )			--不可砍殺
	SetModeEx( NPC, EM_SetModeType_Strikback , false )			--不反擊
	DW_QietKillOne(0,107397)						--偷偷殺怪
	CallPlot(NPC, "LuaPG_425572_Use_02", NPC, Player)
end

function LuaPG_425572_Use_02()
--	local x,y,z,dir = DW_Location(NPC)
	local Center = ReadRoleValue(NPC, EM_RoleValue_Register2)		--讀取原物件是否有中控
--	local Animal = CreateObj(107135, X, Y, Z , Dir, 1 )				--生成怪物
--	WriteRoleValue(MonsterAnimal , EM_RoleValue_IsWalk , 1 )
--	AddToPartition(MonsterAnimal, RoomID)				--原地生一隻正常型的怪
	Sleep(30)
	if AnimalNum~=0	then						--有中控的話，則重置中控
		DelObj(NPC)
		CallPlot( Center, "LuaFunc_ResetObj", Center)
	else
		CallPlot( NPC, "LuaFunc_ResetObj", NPC)				--重置原來的物件
	end
end



--=======================================
--卡波沛多支援
--=======================================
--425209 傳送儀器設置
---------------------------------------------------------------------------
function LuaPG_425209_Set()
	local Player = OwnerID()
	DW_QietKillOne(Player, 107427)			 --靜靜的殺死怪，前者殺死後者，0代表為玩家
	return 1
end

function LuaPG_425209_Complete()
	local Player = TargetID()
	SetFlag(Player, 547208 , 1)
	SetFlag(Player, 547218 , 1)
end

function LuaPG_425540_Complete()
	local Player = TargetID()
	SetFlag(Player, 547210 , 1)
	SetFlag(Player, 547220 , 1)
end
---------------------------------------------------------------------------
--425220 協助傳送程序
---------------------------------------------------------------------------
function LuaPG_425220_Ready()
	local Player = OwnerID()
	local NPC = TargetID()
	local Stage = LuaFunc_SearchNPCbyOrgID( NPC, 121614, 60, 0 )
	if DW_CheckQuestAccept("or",Player, 425220,425764) == true	and
	CheckFlag(Player, 547201)==false				then
		if CheckDistance( Player, Stage, 15)==true		then
			SetSpeakDetail(Player, "[SC_Z24Q425220_01]")
			AddSpeakOption(Player, NPC, "[SC_424131_002]","LuaPG_425220_Ready_02",0)
		else
			SetSpeakDetail(Player, "[SC_Z24Q425220_02]")
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425220_Ready_02()
	local Player = OwnerID()
	local Place = {}
	Place[1] = {3362.1,443.3,-8890.1}
	Place[2] = {3861.0,446.9,-8100.6}
	Place[3] = {4266.6,423.5,-8834.9}
	local RandNum = Rand(3)+1
	ChangeZone( Player, 24, 0 , Place[RandNum][1], Place[RandNum][2] , Place[RandNum][3], 100 )
	 --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	SetFlag(Player, 547201, 1)
end