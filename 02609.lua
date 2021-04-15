--z23支線、PE、委託=======================================
--=======================================
--424958  偷天換日
---------------------------------------------------------------------------
--FLAG:546242
--物品：240894
function LuaPG_424958_Ask()		--尋問犯人	
	local Player = OwnerID()
	local Prisoner = TargetID()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local PrisonerList = {120520, 120522, 120562}			--犯人列表
--	local QuestNum= table.getn(QuestList)
	LoadQuestOption(Player)

--如果有接任務，第一次跟嫌疑犯說話後才開始記下此次犯人
--	for i=1,QuestNum do
		if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	then
			if Num== 0	then				--身上沒紀錄犯人
				local RanNum = Rand(3)+1		--隨機數字，決定此輪犯人
				WriteRoleValue(Player, EM_RoleValue_Register2, PrisonerList[RanNum])
									--將此犯人的orgid記在玩家身上EM_RoleValue_Register2
--				LuaPG_424958_CheckNum()
			end
			AddSpeakOption(Player, Prisoner, "[SC_424958_ASK_01]", "LuaPG_424958_Ask_02", 0)
		end
--		break
--	end		
end

function LuaPG_424958_Ask_02()
	local Player = OwnerID()
	local Prisoner = TargetID()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local OrgID = ReadRoleValue( Prisoner, EM_RoleValue_OrgID )	--物件的資料庫編號
	
	if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	and
	OrgID == Num							then	--對照玩家的值和嫌犯的值
		if CheckFlag(Player, 545814)==false	and
		CountBodyItem( Player, 240894 )==0	then

			SetSpeakDetail(Player, "[SC_424958_PRISONER01]")	
			AddSpeakOption(Player, Prisoner, "[SC_424958_ASK_01]", "LuaPG_424958_Ask_03", 0)

		elseif CheckFlag(Player, 545814)==true	or
		CountBodyItem( Player, 240894 )==1	then

			SetSpeakDetail(Player, "[SC_424958_PRISONER03]")

		end
	else
		SetSpeakDetail(Player, "[SC_424958_INNOCENT]")
	end
end

function LuaPG_424958_Ask_03()
	local Player = OwnerID()
	local Prisoner = TargetID()

	SetSpeakDetail(Player, "[SC_424958_PRISONER02]")
	GiveBodyItem(Player, 240894, 1)
end

function LuaPG_424958_Give()		--將東西給安提
	local Player = OwnerID()
	local Anti = TargetID()

	LoadQuestOption(Player)

	if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	and
	CheckFlag(Player, 546242)==false					and
	CountBodyItem(Player, 240894)==1					then
		AddSpeakOption(Player, Anti, "[SC_424958_GIVE]", "LuaPG_424958_Give_02", 0)
	end
end

function LuaPG_424958_Give_02()
	local Player = OwnerID()

	SetFlag(Player, 546242, 1)
	DelBodyItem(Player, 240894, 1)
	CloseSpeak(Player)	
end

function LuaPG_424958_Complete()
	Lua_ZonePE_3th_GetScore(250)
	local Player = TargetID()
	WriteRoleValue(Player, EM_RoleValue_Register2, 0)
	CancelBuff(Player, 622522)
--	LuaPG_424958_CheckNum()
end

function LuaPG_424958_CheckNum()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	Say(OwnerID(), Num)	
end

function LuaPG_424958_CheckQuest()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local Player = OwnerID()
	
	if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	then
		return true
	else
		CancelBuff(Player, 622522)
		WriteRoleValue(Player, EM_RoleValue_Register2, 0)
	end
end

function LuaPG_424958_Accept()
	local Player = TargetID()
	AddBuff( Player, 622522, 1, -1)
end




--=======================================
--425248  與影行者的比賽
---------------------------------------------------------------------------
function LuaPG_425248_Cancel_Buff()		--如果取消任務，buff就消失
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425248,425480,425494)==true	then
		return true
	else
		CancelBuff(Player,622182)
	end
end

function LuaPG_425248_Give_Buff()		--接任務後給個計算時間的buff
	local Player = TargetID()
	
	AddBuff( Player, 622182, 1, 600)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
	ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )		----(限時任務，已開始倒數計時)
end

function LuaPG_425248_Compete()		--勝負判斷
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425248,425480,425494)==true		and
	CheckBuff(Player, 622182)==true						then
		if CountBodyItem(Player, 241193)>=10			and
		CheckFlag(Player, 546243)==false				then
			SetFlag(Player, 546243, 1)
			CancelBuff(Player, 622182)
		end
	elseif DW_CheckQuestAccept("or",Player,425248,425480,425494)==true	and
	CheckFlag(Player, 546243)==false					and
	CheckBuff(Player, 622182)==false					then
		ScriptMessage( Player, Player, 1,"[SC_425248_LOSE]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_425248_LOSE]", 0 )		
	end
end




--=======================================
--425237  元素感應
---------------------------------------------------------------------------
function LuaPG_425237_Click()
	local Player = OwnerID()
	local NPC = TargetID()

	if DW_CheckQuestAccept("or",Player,425237,425464,425450)==true	then
		DW_QietKillOne(0,106733)		 ----靜靜的殺死怪，前者殺死後者，0代表為玩家
		Sleep(5)
	end
	return 1					----避免點擊物件後是紅色條
end


--=======================================
--425249  影行之營的障眼法
---------------------------------------------------------------------------
--BUFF：622272（堆疊用）
--FLAG：546245
function LuaPG_425249_Accept()
	local Player = TargetID()
	if CheckBuff(Player, 622272)==false	then
		AddBuff(Player, 622272, 0, -1)
	end	
end

function LuaPG_425249_Create()		--生成物品，中控出生劇情
	local Center = OwnerID()
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )	--徑度
	local MagicCircle = CreateObj( 120750, X, Y, Z , Dir, 1 )
	
	AddToPartition(MagicCircle, RoomID )
	WriteRoleValue(Center,(EM_RoleValue_Register-1)+1, MagicCircle)
		--產生一個放置點和一個吸收點，並將之記在Center上
	SetModeEx( MagicCircle  ,EM_SetModeType_Mark , false ) 		--標記
	SetModeEx( MagicCircle  ,EM_SetModeType_Move , false ) 		--移動
end

function LuaPG_425249_Recharge_01()	--點擊右鍵使用符文
	local Player = OwnerID()
	local NPC = SearchRangeNPC (Player, 30 )						--用來當作基準點
	local Num = table.getn(NPC)	
	local BuffCheck=Lua_BuffPosSearch( Player ,622272)					--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--確認BUFF層數
	local Got = 0

--	Say(Player, BuffLv+1)

	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_425249_CANTUSE]" , 0 ) 		--戰鬥中無法幫法陣充能
		ScriptMessage( Player , Player , 0 , "[SC_425249_CANTUSE]" , 0 )
		return false
	end

	if DW_CheckQuestAccept("or",Player,425249,425481,425495)==true	and		--有接任務
	BuffLv<=3								and
	NPC~=nil								then
		for i=0,Num do						--檢查附近對應的怪
			local PID = ReadRoleValue( NPC[i] , EM_RoleValue_PID ) 
			local EnergyPoint = ReadRoleValue(NPC[i], EM_RoleValue_OrgID)								
				if EnergyPoint==120646				and
				PID==BuffLv						then
					Got = Got+1
--					Say(Player, "right")
					break
				elseif EnergyPoint==120646				and
				PID~=BuffLv						then
					ScriptMessage( Player, Player, 1, "[SC_425249_RECHARGE_03]", 0 )	--法陣充能順序錯誤
					ScriptMessage( Player, Player, 0, "[SC_425249_RECHARGE_03]", 0 )
					CancelBuff(Player, 622272)
					AddBuff(Player, 622272, 0, -1)
--					Say(Player, "wrong")
					return false
				end
		end
	end

--	Say(Player, Got)

	if Got == 1	then
		return true
	else
		ScriptMessage( Player, Player, 1, "[SC_425249_RECHARGE_02]", 0 )		--這是用來幫法陣充能的，其它地方無法使用。
		ScriptMessage( Player, Player, 0, "[SC_425249_RECHARGE_02]", 0 )
		return false
	end
end

function LuaPG_425249_RechargeOK()		--使用後
	local Player = OwnerID()
	local MagicPoint = LuaFunc_SearchNPCbyOrgID( Player, 120646, 70, 0 )
	local BuffCheck=Lua_BuffPosSearch( Player ,622272)			--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--確認BUFF層數

	BeginPlot(Player,"LuaPG_425271_Act",10)
	AddBuff(Player, 622272, 0, -1)
	CallPlot(MagicPoint , "LuaPG_425249_RechargeOK_04" , MagicPoint)
--	Say(Player, BuffLv+1)
	CallPlot(Player , "LuaPG_425249_RechargeOK_02",Player,BuffLv)
end

function LuaPG_425249_RechargeOK_02(Player,BuffLv)	
	if BuffLv+1==3	then
		ScriptMessage( Player, Player, 1, "[SC_425249_RECHARGE_04]", 0 )
		ScriptMessage( Player, Player, 0, "[SC_425249_RECHARGE_04]", 0 )
		SetFlag(Player, 546245, 1)
	end
end

function LuaPG_425249_RechargeOK_03()
	AddBuff(OwnerID(), 622272, 0, -1)
end

function LuaPG_425249_RechargeOK_04(MagicPoint)
	CastSpell(MagicPoint,MagicPoint,850125)
end

function LuaPG_425249_Clear()		--沒有任務後清除buff
	local Player = OwnerID()

	if CheckAcceptQuest(Player, 425249)==false	and
	CheckAcceptQuest(Player, 425481)==false	and
	CheckAcceptQuest(Player, 425495)==false	then
		CancelBuff(Player,622272)
	end
end

function LuaPG_425249_Complete()		--沒有任務後清除buff
	local Player = TargetID()
	Lua_ZonePE_3th_GetScore(50)
	if CheckAcceptQuest(Player, 425249)==false	and
	CheckAcceptQuest(Player, 425481)==false	and
	CheckAcceptQuest(Player, 425495)==false	then
		CancelBuff(Player,622272)
	end
end

function LuaPG_425249_ReTake()		--重新拿取
	local Player = OwnerID()

	if DW_CheckQuestAccept("or",Player,425249,425481,425495)==true	and
	CountBodyItem(Player, 241196)<3					and
	CheckFlag(Player, 546245)==false					then
		SetSpeakDetail(Player, "[SC_425249_RETAKE]")
		Repeat
			GiveBodyItem(Player, 241196, 1)
		until
			CountBodyItem(Player, 241196)==3
	else
		LoadQuestOption(Player)
	end
end



--=======================================
--425253  據點不一的營地
---------------------------------------------------------------------------
function LuaPG_425253_CheckFlag()		--開啟前置
	SetFlag(TargetID(), 546246, 1)
end

function LuaPG_425253_Complete()
	Lua_ZonePE_3th_GetScore(300)
	SetFlag(TargetID(), 546246, 0)
end

function LuaPG_425253_Give()
	local Player = OwnerID()
	local NPC = TargetID()
	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425253,425485,425499)==true	and
	CountBodyItem(Player, 240858)>=1					and
	CheckFlag(Player, 546256)==false					then
		AddSpeakOption(Player, NPC, "[SC_425253_GIVE]", "LuaPG_425253_Give_02(1)", 0)
	end
	if DW_CheckQuestAccept("or",Player,425354,425368,425382)==true	and
	CountBodyItem(Player, 209469)==0			then
		AddSpeakOption(Player, NPC, "[SC_425354_GIVE]", "LuaPG_425253_Give_02(2)", 0)
	end
end

function LuaPG_425253_Give_02(Which)
	local Player = OwnerID()

	if Which==1	then
		SetSpeakDetail(Player, "[SC_425253_TAKE]")
		DelBodyItem(Player, 240858, 1)
		SetFlag(Player, 546256, 1)
	elseif Which==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 209469, 5)
	end
end

function LuaPG_425253_ReTake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425253,425485,425499)==true	and
	CountBodyItem(Player, 240858)==0					and
	CheckFlag(Player, 546256)==false					then
		AddSpeakOption(Player, NPC, "[SC_425253_RETAKE_01]", "LuaPG_425253_ReTake_01", 0)
	end
end

function LuaPG_425253_ReTake_01()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_425253_RETAKE]")
	GiveBodyItem(Player, 240858, 1)
end


--=======================================
--425241  遲遲未到的餐盒
---------------------------------------------------------------------------
function LuaPG_425241_TakeFoodBox()
	local Player = OwnerID()
	local NPC = TargetID()
	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425241,425454,425468)==true	and
	CountBodyItem(Player, 241201)==0			then
		AddSpeakOption(Player, NPC, "[SC_425241_TAKE_FOODBOX_01]", "LuaPG_425241_TakeFoodBox_02", 0)
	end
end

function LuaPG_425241_TakeFoodBox_02()
	local Player = OwnerID()
	local NPC = TargetID()
	
	SetSpeakDetail(Player, "[SC_425241_TAKE_FOODBOX_02]")
	AddSpeakOption(Player, NPC, "[SC_425241_TAKE_FOODBOX_03]", "LuaPG_425241_TakeFoodBox_03", 0)
end

function LuaPG_425241_TakeFoodBox_03()
	local Player = OwnerID()
	local NPC = TargetID()
	
	CloseSpeak(Player)
	GiveBodyItem(Player, 241201, 1)
end




--=======================================
--425242  事前防護無煩惱
---------------------------------------------------------------------------
function LuaPG_425242_TakeMedicine()
	local Player = OwnerID()
	local NPC = TargetID()
		LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425242,425455,425469)==true	and
	CountBodyItem(Player, 241266)<5					then
--		SetSpeakDetail(Player, "[SC_425242_ASK_01]")
		AddSpeakOption(Player, NPC, "[SC_425242_ASK_02]", "LuaPG_425242_TakeMedicine_02", 0)
	end	
end

function LuaPG_425242_TakeMedicine_02()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	Repeat 
		GiveBodyItem(Player, 241266, 1)
	until 	CountBodyItem(Player, 241266)==5
end




--=======================================
--425256  支援符文道具
---------------------------------------------------------------------------
function LuaPG_425256_MaHouDouGu()
	local Player = OwnerID()

	if DW_CheckQuestAccept("or",Player,425256,425488,425502)==true	and
	CheckFlag(Player, 546284)==false			and
	CountBodyItem(Player, 241268)>0			then
		SetSpeakDetail(Player, "[SC_425256_GIVE]")
		DelBodyItem(Player, 241268, 1)
		SetFlag(Player, 546284, 1)
	else
		LoadQuestOption(Player)	
	end
end

function LuaPG_425256_MaHouDouGu_02()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425256,425488,425502)==true	and
	CheckFlag(Player, 546284)==false			and
	CountBodyItem(Player, 241268)==0			then
		SetSpeakDetail(Player, "[SC_425256_GIVE]")
		AddSpeakOption(Player, NPC, "[SC_425256_GIVE_04]", "LuaPG_425256_MaHouDouGu_03", 0)
	end
end

function LuaPG_425256_MaHouDouGu_03()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_425256_GIVE_02]")
	AddSpeakOption(Player, NPC, "[SC_425256_GIVE_03]", "LuaPG_425256_MaHouDouGu_04", 0)
end

function LuaPG_425256_MaHouDouGu_04()
	local Player = OwnerID()

	CloseSpeak(Player)
	GiveBodyItem(Player, 241268, 1)
end

function LuaPG_425256_Accept()
	local Player = TargetID()
	SetFlag(Player, 547012, 1)
end

function LuaPG_425256_Accept_02()
	local Player = TargetID()
	SetFlag(Player, 547016, 1)
end


--=======================================
--425274  最後的幸運
---------------------------------------------------------------------------
function LuaPG_425274_Arrow()
	local Player = OwnerID()
	local Str = "["..GetUseItemGUID(Player).."]"
	ClearBorder( Player)							--初始化石碑介面
	
	if ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--支線
	CheckCompleteQuest( Player, 425274) == false		then
		AddBorderPage( Player, GetQuestDetail( 425274 , 1 ) )	
		ShowBorder( Player,425274, Str,"ScriptBorder_Texture_Paper" )

	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--無pe
	CheckCompleteQuest( Player, 425274) == true			and
	CheckAcceptQuest( Player, 425490) == false			then
		AddBorderPage( Player, GetQuestDetail( 425490 , 1 ) )
		ShowBorder( Player,425490, Str,"ScriptBorder_Texture_Paper" )
		
	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--有pe
	CheckAcceptQuest( Player, 425490) == true			and
	CheckAcceptQuest( Player, 425504) == false			then	
		AddBorderPage( Player, GetQuestDetail( 425504 , 1 ) )
		ShowBorder( Player,425504, Str,"ScriptBorder_Texture_Paper" )

	elseif CheckAcceptQuest( Player, 425490) == true		and
	CheckAcceptQuest( Player, 425504) == true			then
		ScriptMessage(Player,Player,1,"[SC_425274]",0)
		ScriptMessage(Player,Player,0,"[SC_425274]",0)
		return
	else
		ScriptMessage(Player,Player,1,"[SC_LV_NOT_ENOUGH]",0)
		return
	end
end



--=======================================
--425271  龍族們的蛋
---------------------------------------------------------------------------
--BUFF：622308（計數用）、850115
--任務NPC：120703（放置點）、120704（吸收點）
function LuaPG_425271_Create()		--生成物品，中控出生劇情
	local Center = OwnerID()
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )	--徑度
	local radian = (math.pi/180)*Dir
	
	local DraList = {}
	
	DraList[1] = CreateObj( 120703, X+30*math.cos(radian), Y, Z +40*math.sin(radian), Dir, 1 )	--放置點
--	DraList[2] = CreateObj( 121376, X+30*math.cos(radian), Y, Z +40*math.sin(radian), Dir, 1 )	--特效使用點

--	for i =1,2 do	
		AddToPartition(DraList[1], RoomID )
		WriteRoleValue(Center,(EM_RoleValue_Register-1)+1, DraList[1])
		--產生一個放置點和一個吸收點，並將之記在Center上
		SetModeEx( DraList[1]  ,EM_SetModeType_Mark , false ) 		--標記
		SetModeEx( DraList[1]  ,EM_SetModeType_Move , false ) 		--移動
--	end
end

function LuaPG_425271_Put()		--使用元素袋的檢查
	local Player = OwnerID()
	local Place = SearchRangeNPC(Player, 15)
	local Num = table.getn(Place)
	local BuffCheck=Lua_BuffPosSearch( Player ,622308)					--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--確認BUFF層數	
	local Got = 0
	local PutPlace

	if DW_CheckQuestAccept("or",Player,425271,425457,425471)==true	and		--有接任務
	BuffLv<3								and
	Place~=nil								then
--		Say(Player,BuffLv)
		for i =0,Num do
			PutPlace = ReadRoleValue(Place[i], EM_RoleValue_OrgID)
				if PutPlace ==120703					then	--附近有指定地點物件
--					Say(Player, "GOT")
					Got=Got+1
					break
				else
--					Say(Player, "None")
--					Say(Place[1], "None")
--					Say(Place[2], "None")
					return false
				end
		end
	end
	
	if Got==1	then
		DW_CancelTypeBuff(68,Player)							----取消騎乘狀態
		return true
	end
end

function LuaPG_425271_Put_02()	--使用後產生的效果
	local Player = OwnerID()
	local Absorb = LuaFunc_SearchNPCbyOrgID( Player, 120704, 70, 0 )
	local Place = ReadRoleValue(Absorb, EM_RoleValue_Register1)
	local BuffPlace = DW_CreateObjEX("obj",121376,Place) 
	local RoomID = ReadRoleValue(Absorb, EM_RoleValue_RoomID)
	AddToPartition(BuffPlace,  RoomID)
	ks_ActSetMode(BuffPlace)

	BeginPlot(Player,"LuaPG_425271_Act",10)							--玩家放置動作
--	CastSpell( Place, Absorb, 850115)							--兩個指定物件產生BUFF
	CallPlot(BuffPlace , "LuaPG_425271_Act_02" , Place, Absorb,BuffPlace)
	AddBuff(Player, 622308, 0, -1)								--堆疊計數用BUFF
	DW_QietKillOne(0,106830)								--靜靜的殺死怪，前者殺死後者，0代表為玩家
	BeginPlot(Place, "luaPG_425271_HideandShow", 0 )					-- 擺放記號HIDE
end

function luaPG_425271_HideandShow()								-- HIDE之後經過一定秒數出現
	local Place = OwnerID()  
	Sleep(15)
	Hide(Place)
	sleep(200)
	Show( Place, 0) 
end

function LuaPG_425271_Act()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)
end

function LuaPG_425271_Act_02(Place, Absorb,BuffPlace)
	CastSpell( BuffPlace, Absorb, 850115)
	Sleep(50)
	DelObj(BuffPlace)
end

function LuaPG_425271_ReTake()	--重拿物品
	local Player = OwnerID()
	local NPC = TargetID()
	local BuffCheck=Lua_BuffPosSearch( Player ,622308)					--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--確認BUFF層數

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425271,425457,425471)==true	and		--有接任務
	CountBodyItem(Player, 241273)==0					and
	BuffLv<3								then
		AddSpeakOption(Player, NPC, "[SC_425271_01]", "LuaPG_425271_ReTake_02", 0)
	end
end

function LuaPG_425271_ReTake_02()	--重拿物品
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_425271_02]")
	AddSpeakOption(Player, NPC, "[SC_425271_01]", "LuaPG_425271_ReTake_03", 0)	
end

function LuaPG_425271_ReTake_03()	--重拿物品
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 241273, 3)
end

function LuaPG_425271_Complete()
	Lua_ZonePE_3th_GetScore(30)
	local Player = TargetID()
	CancelBuff(Player, 622308)			--任務完成後，消去身上BUFF

end

function LuaPG_425271_Cancel()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425271,425457,425471)==true	then
		return true
	else
		CancelBuff(Player, 622308)		--如果刪除任務，取消身上BUFF
	end
end

function LuaPG_425271_Accept()
	local Player = TargetID()
	SetFlag(Player, 547011, 1)
end

function LuaPG_425271_Accept_02()
	local Player = TargetID()
	SetFlag(Player, 547015, 1)
end



--=======================================
--425272  禮尚往來是基本道理
---------------------------------------------------------------------------
function LuaPG_425272_Present()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425272,425472,425458)==true	and
	CountBodyItem(Player, 241272)==0			then
		AddSpeakOption(Player, NPC, "[SC_425272_PRESENT_01]", "LuaPG_425272_Present_02", 0)
	end
end

function LuaPG_425272_Present_02()
	local Player = OwnerID()
	GiveBodyItem(Player, 241272, 1)
	SetSpeakDetail(Player, "[SC_425272_PRESENT_02]")
end



--=======================================
--425276  阻止密謀行動
---------------------------------------------------------------------------
--中控器生出怪物，總共2人加一隻螞蟻
-- 雙方交談樣貌
--密會組會在5個地點出沒，一次出現為10分鐘，然後就會換地點，分兩個為同一時間，另三個為同一時間
--如果3人中只剩其中一方，就重置
--只要打到中控總分到一定分數以下，且每隻怪皆沒有進入戰鬥，就重置

function LuaPG_425276_Center()		--中控器生出怪
	local Center = OwnerID()
	local Min = GetSystime(2)							--抓取現在時間（分）
	local CenterPID = ReadRoleValue( Center , EM_RoleValue_PID )
	local TimeList = {}
	TimeList[1] = {0,21,41,11,31,51}
	TimeList[2] = {11,31,51,0,21,41}

	if Min == TimeList[CenterPID][1] or Min == TimeList[CenterPID][2] or Min == TimeList[CenterPID][3]		then		--產怪的時間
		LuaPG_425276_Reborn()
		BeginPlot(Center, "LuaPG_425276_10MR" ,0)
		Sleep(6100)
	elseif Min == TimeList[CenterPID][4] or Min == TimeList[CenterPID][5] or Min == TimeList[CenterPID][6]	then		--如果到了休息的10分鐘還有怪的話
		BeginPlot(Center, "LuaPG_425276_Check", 0)
		Sleep(6000)
		CallPlot(Center,"LuaFunc_ResetObj",Center)
	end
	BeginPlot(Center,"LuaPG_425276_Center_02", 0)
end

function LuaPG_425276_Center_Test()		--中控器生出怪(testversion)
	local Center = OwnerID()
	LuaPG_425276_Reborn()
	BeginPlot(Center, "LuaPG_425276_10MR_02" ,0)
	Sleep(6100)
	BeginPlot(Center, "LuaPG_425276_Check", 0)
	Sleep(6000)
	CallPlot(Center,"LuaFunc_ResetObj",Center)
end

function LuaPG_425276_Center_02()
	BeginPlot(OwnerID(),"LuaPG_425276_Center", 2)
end	

function LuaPG_425276_Reborn()
	local Center = OwnerID()
	local DeleteList = {}
	DeleteList[1] = ReadRoleValue(Center,EM_RoleValue_Register1)
	DeleteList[2] = ReadRoleValue(Center,EM_RoleValue_Register2)
	DeleteList[3] = ReadRoleValue(Center,EM_RoleValue_Register3)	
	local DeadorNot
--	DebugMsg(0,0,"--REBORN IS RUN --")
	for i=1,3 do
		DeadorNot = ReadRoleValue(DeleteList[i], EM_RoleValue_IsDead)
--		SAY(DeleteList[i],"1")
		Sleep(10)
		if DeadorNot == 0 then
			NPCSAY(DeleteList[i],"[SC_425276_DISAPPEAR]")
			Sleep(10)
			DelObj(DeleteList[i])
		end
	end
--	WriteRoleValue(Center,EM_RoleValue_Register7, 3)
	Sleep(160)
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )			--徑度
	
	local ChatList = {}
	ChatList[1] = CreateObj( 106828, X-30, Y, Z+15, (Dir/4), 1)			--協議者
	ChatList[2] = CreateObj( 106828, X-30, Y, Z-15, (Dir/4), 1)			--協議者
	ChatList[3] = CreateObj( 106720, X+30, Y, Z, (Dir/4)+180, 1)			--監軍蟻	
	for i =1,3 do
		AddToPartition(ChatList[i], RoomID )
		WriteRoleValue(Center,(EM_RoleValue_Register-1)+i, ChatList[i])
		--產生一個放置點和一個吸收點，並將之記在Center上
		WriteRoleValue(ChatList[i],EM_RoleValue_Register6,Center)	--將中控記在怪物身上
	end
	AdjustFaceDir( ChatList[1], ChatList[3], 0)
	AdjustFaceDir( ChatList[2], ChatList[3], 0)
end

function LuaPG_425276_Check()
	local Center = OwnerID()

	local NPCList = {ReadRoleValue(Center,EM_RoleValue_Register1),ReadRoleValue(Center,EM_RoleValue_Register2),ReadRoleValue(Center,EM_RoleValue_Register3)}
	local AttackCount = 0
	local AttackTarget

	for i=1,60 do	
		for j = 1,3 do
			AttackTarget = HateListCount(NPCList[j])			--判斷是否進入戰鬥 1= 是 0= 否
				if AttackTarget ==0	then				--如果沒有在戰鬥
					AttackCount = AttackCount+1
--					DebugMsg(0,0,"OLA")					
				end
		end
		if AttackCount == 3	then
			for k=1,3	do
				DelObj(NPCList[k])
			end
--			DebugMsg(0,0,"BITTE")	
			break
		end
--		DebugMsg(0,0,"HateListCount1"..HateListCount(NPCList[1]))
--		DebugMsg(0,0,"HateListCount2"..HateListCount(NPCList[2]))
--		DebugMsg(0,0,"HateListCount3"..HateListCount(NPCList[3]))	
		Sleep(100)
	end
end

function LuaPG_425276_Chat()			--聊天表演，掛在出生劇情
	local NPC = OwnerID()
	local AttackCount
	local Speak={}
	local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD 	-- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_POINT		-- 1/5 機率做出指人動作
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while true do
		AttackCount = ReadRoleValue(NPC,EM_RoleValue_IsAttackMode)
		if AttackCount == 0		then 
			local i = rand(5)
			Motion = Speak[i]
			PlayMotion( NPC, Motion)
		elseif AttackCount == 1	then
			break	
		end
		sleep(50)
	end
end

function LuaPG_425276_10MR()
	local Center = OwnerID()
	local Chat1
	local Chat2
	local Ant

	local X=0
	local Y=0
	local Z=0

	local IsAntDead,IsChat1Dead,IsChat2Dead=false,false,false;
	local IsAntFight,IsChat1Fight,IsChat2Fight=false,false,false;

	local HC=0

	for i=1,130	do
		Chat1 = ReadRoleValue(Center,EM_RoleValue_Register1)
		Chat2 = ReadRoleValue(Center,EM_RoleValue_Register2)
		Ant = ReadRoleValue(Center,EM_RoleValue_Register3)

		IsAntDead=(ReadRoleValue(Ant, EM_RoleValue_IsDead)==1);
		IsChat1Dead=(ReadRoleValue(Chat1, EM_RoleValue_IsDead)==1);
		IsChat2Dead=(ReadRoleValue(Chat2, EM_RoleValue_IsDead)==1);

		IsAntFight=(HateListCount(Ant)~=0);
		IsChat1Fight=(HateListCount(Chat1)~=0);
		IsChat2Fight=(HateListCount(Chat2)~=0);

		local TargetList={};

		if IsAntDead then
			if X==0 then
				X = X+1
			end
		else
			TargetList[3]=ReadRoleValue(Ant,EM_RoleValue_AttackTargetID);
		end

		if IsChat1Dead then
			if Y==0 then
				Y = Y+1
			end
		else
			TargetList[1]=ReadRoleValue(Chat1,EM_RoleValue_AttackTargetID);
		end

		if IsChat2Dead then
			if Z==0 then
				Z = Z+1
			end
		else
			TargetList[2]=ReadRoleValue(Chat2,EM_RoleValue_AttackTargetID);
		end

		for SN=1,3 do
			if TargetList[SN]~=nil and CheckID(TargetList[SN]) then
				SysCastSpellLv(TargetList[SN],Ant,495751,1);
				SysCastSpellLv(TargetList[SN],Chat1,495751,1);
				SysCastSpellLv(TargetList[SN],Chat2,495751,1);
			end
		end

		if Z==1 and Y==1 and X==0	then
			if IsAntFight==false then
----				DebugMsg(0,0,"ADIOS")
				HC=HC+1
			end
		end

		if X==1 and Y==0 and Z==0	then
			if IsChat1Fight==false and IsChat2Fight==false then			
----				DebugMsg(0,0,"MIAO")
				HC=HC+1
			end
		end

		if X==1 and Y==1 and Z==0	then
			if IsChat2Fight==false	then			
----				DebugMsg(0,0,"OHAYO")
				HC=HC+1
			end
		end

		if X==1 and Y==0 and Z==1	then
			if IsChat1Fight==false then			
----				DebugMsg(0,0,"SAWADICA")
				HC=HC+1
			end
		end

		if X==1 and Y==1 and Z==1 and HC==0		then
----			DebugMsg(0,0,"CHAO")
			HC=HC+1
		end

		if HC==1	then
----			DebugMsg(0,0,"ALOHA")
----			DelObj(Chat1)
----			DelObj(Chat2)
----			DelObj(Ant)
			X=0
			Y=0
			Z=0
			HC=0
			IsAntDead,IsChat1Dead,IsChat2Dead=false,false,false;
			IsAntFight,IsChat1Fight,IsChat2Fight=false,false,false;
			Sleep(50)
			LuaPG_425276_Reborn()
		end
----		DebugMsg(0,0,"X"..X)
----		DebugMsg(0,0,"Y"..Y)
----		DebugMsg(0,0,"Z"..Z)
----		DebugMsg(0,0,"HC"..HC)
		Sleep(50)
	end
end

function LuaPG_425276_10MR_02()
	local Center = OwnerID()
	local Chat1
	local Chat2
	local Ant

	local SurviveNum
	for i=1,120	do
--		Say(Center,"YEAH")
		Chat1 = ReadRoleValue(Center,EM_RoleValue_Register1)
		Chat2 = ReadRoleValue(Center,EM_RoleValue_Register2)
		Ant = ReadRoleValue(Center,EM_RoleValue_Register3)
		SurviveNum = ReadRoleValue(Center,EM_RoleValue_Register7)
		if SurviveNum==0	then
			Sleep(50)
			CallPlot(Center,"LuaPG_425276_Reborn",Center)
--			Say(Center,"BIBI")
		end
		Sleep(50)
	end
end

function LuaPG_425276_Dead()
	local Monster = OwnerID()
	local OrgID = ReadRoleValue( Monster, EM_RoleValue_OrgID )
	if OrgID== 106720	then
		Lua_PG_CancelAntBuff()
	end
	local Center = ReadRoleValue(Monster,EM_RoleValue_Register6)
	local SurviveNum = ReadRoleValue(Center,EM_RoleValue_Register7)
--	if Center~=0	then
--		SurviveNum = SurviveNum-1
--		WriteRoleValue(Center,EM_RoleValue_Register7, SurviveNum)
--	end
end




--=======================================
--425277  懷中蟻卵
---------------------------------------------------------------------------
function LuaPG_425277_AntEgg()
	local Player = OwnerID()
	local Str = "["..GetUseItemGUID(Player).."]"
	ClearBorder( Player)							--初始化石碑介面
	
	if ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--支線
	CheckCompleteQuest( Player, 425277) == false		then
		AddBorderPage( Player, GetQuestDetail( 425277 , 1 ) )	
		ShowBorder( Player,425277, Str,"ScriptBorder_Texture_Paper" )

	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--無pe
	CheckCompleteQuest( Player, 425277) == true			and
	CheckAcceptQuest( Player, 425493) == false			then
		AddBorderPage( Player, GetQuestDetail( 425493 , 1 ) )
		ShowBorder( Player,425493, Str,"ScriptBorder_Texture_Paper" )
		
	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--有pe
	CheckAcceptQuest( Player, 425493) == true			and
	CheckAcceptQuest( Player, 425507) == false			then	
		AddBorderPage( Player, GetQuestDetail( 425507 , 1 ) )
		ShowBorder( Player,425507, Str,"ScriptBorder_Texture_Paper" )

	elseif CheckAcceptQuest( Player, 425493) == true			and
	CheckAcceptQuest( Player, 425507) == true			then
		ScriptMessage(Player,Player,1,"[SC_425274]",0)
		ScriptMessage(Player,Player,0,"[SC_425274]",0)
	else
		ScriptMessage(Player,Player,1,"[SC_LV_NOT_ENOUGH]",0)
	end
end



--=======================================
--425273  死後之災
---------------------------------------------------------------------------
function LuaPG_425273_KillinDark()		--怪死亡的時候
	local Monster = OwnerID()
	local Playerlist = {}
	Playerlist = DW_HateRemain(0)
	if type(Playerlist)~="table" then
		return;
	end
	local Num = table.getn(Playerlist)

--	Say(Playerlist[1],"Hey!")
	for i=1,Num	do						--讀取仇恨表
		if DW_CheckQuestAccept("or",Playerlist[i],425273,425473,425459)==true	then
--			Say(OwnerID(),"OMG!")
			DW_QietKillOne(Playerlist[i],107058)		--偷偷殺掉一隻怪(0則視為OwnerID() 填1則視為TargetID())
		end
	end
end


--=======================================
--支援  小宏任務
---------------------------------------------------------------------------
function LuaPG_425353_ReTake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425353,425367,425381)==true	and
	CountBodyItem(Player, 209468)==0					then
		AddSpeakOption(Player, NPC, "[SC_425353_RETAKE]", "LuaPG_425353_ReTake_01", 0)
	end
end

function LuaPG_425353_ReTake_01()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 209468, 4)
end