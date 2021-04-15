--委託=======================================
--424944  運送能量
---------------------------------------------------------------------------
function LuaPG_424944_Give()			--加加希．蟲足
	local Player = OwnerID()
	local NPC = TargetID()								

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424944 )==true	and
		CountBodyItem(Player, 240820)>=5		and
		CheckFlag(Player, 545807)==false		then
	
			AddSpeakOption(Player, NPC , "[SC_424944_GIVE]","LuaPG_424494_Give_01",0)		
	end
end

function LuaPG_424494_Give_01()
	local Player = OwnerID()
	
	DelBodyItem(Player, 240820, 5)
	CloseSpeak(Player)
	SetFlag(Player, 545807, 1)
end

function LuaPG_424944_ReGet()			--波米妮
	local Player = OwnerID()
	local NPC = TargetID()								

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424944 )==true	and
		CountBodyItem(Player, 240820)<5		and
		CheckFlag(Player, 545807)==false		then
			SetSpeakDetail(Player, "[SC_424494_REGET]")
			AddSpeakOption(Player, NPC , "[SC_424944_GET]","LuaPG_424494_ReGet_01", 0)		
	end
end

function LuaPG_424494_ReGet_01()
	local Player = OwnerID()
	
	GiveBodyItem(Player, 240820, 5)
	CloseSpeak(Player)	
end




---------------------------------------------------------------------------
--424950  洛尼沃的清單
---------------------------------------------------------------------------
function LuaPG_Talk_Yukin()				--尤金
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424920 )==true			and
		CheckFlag(Player, 545814)==false				then
			AddSpeakOption(Player, NPC , "[SC_424920_YUKIN]","LuaPG_424920_AskFlag", 0)

	elseif	CheckAcceptQuest(Player, 424921 )==true			and
		CheckFlag(Player, 545815)==false				then		
			AddSpeakOption(Player, NPC , "[SC_424921_04]","LuaPG_424921_Understand_00", 0)

	elseif	CheckAcceptQuest(Player, 424922 )==true			and
		CheckFlag(Player, 545819)==true				and
		CheckFlag(Player, 545818)==false				then		
			AddSpeakOption(Player, NPC , "[SC_424922_01]","LuaPG_424922_Tell", 0)

	elseif	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545808)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)

	elseif	CheckAcceptQuest(Player, 424951 )==true			and
		CheckFlag(Player, 545817)==false				then
			AddSpeakOption(Player, NPC , "[SC_424951_RECOMMEND]","LuaPG_424951_Recommend", 0)

	elseif	CheckAcceptQuest(Player, 424954 )==true			and
		CheckFlag(Player, 545861)==false				then
			AddSpeakOption(Player, NPC , "[SC_424954_TELL]","LuaPG_424954_Tell", 0)
	elseif	CheckAcceptQuest(Player, 424930 )==true			and
		CheckFlag(Player, 545866)==false				then
			AddSpeakOption(Player, NPC , "[SC_424930_TELL]","LuaPG_424930_Tell", 0)
	end		
end

function LuaPG_Talk_Behel()				--貝赫爾
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545809)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)
	end		
end

function LuaPG_Talk_Bil()				--碧兒翠
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545810)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)

	elseif	CheckAcceptQuest(Player, 424927 )==true			and
		CountBodyItem(Player, 240848)>=10				and
		CheckFlag(Player, 545821)==false				then
			SetSpeakDetail(Player, "[SC_424927_03]")
			AddSpeakOption(Player, NPC, "[SC_424927_04]", "LuaPG_424927_Collect", 0)

	elseif	CheckAcceptQuest(Player, 424953 )==true			and
		CheckFlag(Player, 545860)==false				then
			AddSpeakOption(Player, NPC, "[SC_424953_ASK]", "LuaPG_424953_Medicine", 0)

	elseif	CheckAcceptQuest(Player, 424928 )==true			and
		CountBodyItem(Player, 240852)<5				then
			AddSpeakOption(Player, NPC , "[SC_424928_ASK]","LuaPG_424928_ReTake", 0)
	end		

end

function LuaPG_Talk_Tock()				--塔克
	local Player = OwnerID()
	local NPC = TargetID()
	LuaS_ZONE21_Formula()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545811)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)
	end		
end

function LuaPG_Talk_Hua()				--華雀兒
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545812)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)
	end		
end

function LuaPG_424950_Talk()
	local Player = OwnerID()
	local NPC = TargetID()

	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )--物件的資料庫編號
	local NPCList = {}
	NPCList[119727] = {"[SC_424950_TALK_01]"; 545808}	--尤金
	NPCList[119726] = {"[SC_424950_TALK_02]"; 545809}	--貝赫爾
	NPCList[119360] = {"[SC_424950_TALK_03]"; 545810}	--碧兒翠
	NPCList[119725] = {"[SC_424950_TALK_04]"; 545811}	--塔克
	NPCList[119616] = {"[SC_424950_TALK_05]"; 545812}	--華雀兒
	
	SetSpeakDetail(Player, NPCList[OrgID][1])
	SetFlag(Player, NPCList[OrgID][2], 1)
end





--支線=======================================
--424951  想成為英雄的人
---------------------------------------------------------------------------
function LuaPG_424951_Recommend()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424951_REJECT]")
	SetFlag(Player, 545817, 1)	
end

--424951  任務結束表演
---------------------------------------------------------------------------
--演員：薩耶奇119783
--走位旗子：781045	no.1
--給玩家看戲的BUFF：621125
function LuaPG_424951_Complete()
	local Player = TargetID()
	local Saye = OwnerID()
	local Flag = 781045

	Lua_ZonePE_3th_GetScore(70)
	local New_Saye = DW_CreateObjEX("obj", 119783, Saye)		----生成演戲薩耶奇
	ks_ActSetMode( New_Saye )

	local Num = ReadRoleValue(New_Saye,EM_RoleValue_Register1)
	AddBuff( Player,621125,1,20)
	
	if	Num == 0	then					----如果暫存值為0
		CallPlot(Saye , "LuaPG_424951_Complete_01" , New_Saye , Saye, Player, Flag)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424951_Complete_01(New_Saye , Saye, Player, Flag)
	WriteRoleValue(Saye,EM_RoleValue_Register1,999) 		----開始演出的標記

	Sleep(10)
	PlayMotion(New_Saye, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSAY(New_Saye, "[SC_424951_ANGRY]")
	Sleep(25)
	NPCSAY(New_Saye, "[SC_424951_ANGRY_01]")
	Sleep(10)	
	DW_MoveToFlag( New_Saye , Flag, 1, 0, 1)
	DelObj(New_Saye)

	CancelBuff(Player, 621125)	
	WriteRoleValue(Saye,EM_RoleValue_Register1,999) 		----寫回暫存值
end



---------------------------------------------------------------------------
--424953  薩耶奇的領悟
---------------------------------------------------------------------------
----如果取消任務，BUFF就消失
function LuaPG_424953_Cancel_Buff()
	if	CheckAcceptQuest(OwnerID(),424953)==false	then
		CancelBuff(OwnerID(),621126)
	end
end

function LuaPG_424953_Buff()
	local Player = TargetID()
	local NPC = OwnerID()
	if CheckAcceptQuest(Player,424953)==true	then
		AddBuff(Player, 621126, 1, 600)			----給BUFF
		ScriptMessage( Player, Player, 1,"[SC_424953_HURRY]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_424953_HURRY]", "0xffbf0b2b" )
									----SCRIPM提示時間有限
	end
end

function LuaPG_424953_Medicine()
	local Player = OwnerID()
	local NPC = TargetID()
	if CountBodyItem(Player, 240849)==0 and CountBodyItem(Player, 240850)==0	then
		SetSpeakDetail(Player, "[SC_424953_ASK_01]")
		AddSpeakOption(Player, NPC, "[SC_424953_TAKE_RIGHT]", "LuaPG_424953_Medicine_01(1)", 0)
		AddSpeakOption(Player, NPC, "[SC_424953_TAKE_WRONG]", "LuaPG_424953_Medicine_01(2)", 0)
	else
		SetSpeakDetail(Player, "[SC_424953_ASK_02]")
	end
end

function LuaPG_424953_Medicine_01(MedicineType)
	local Player = OwnerID()

	if MedicineType==1	then
--		Say(Player,"00")
		GiveBodyItem(Player, 240849, 1)
	elseif MedicineType==2	then
--		Say(Player,"22")
		GiveBodyItem(Player, 240850, 1)		
	end
	CloseSpeak(Player)
end

function LuaPG_424953_Cure()
	local Player = OwnerID()
--	LoadQuestOption(Player)

	if CheckAcceptQuest(Player, 424953)==true	and
	CheckFlag(Player, 545860)==false		then
		--Say(Player,"33")
		if CheckBuff( Player , 621126)==true		then
			if CountBodyItem(Player, 240849)==1			then
				LoadQuestOption(Player)
				--Say(Player,"44")
				SetFlag(Player, 545860, 1)
				DelBodyItem(Player, 240849, 1)
			elseif CountBodyItem(Player, 240850)==1		then
				--Say(Player,"55")
				SetSpeakDetail(Player, "[SC_424953_NOUSE]")
				Sleep(10)
				DelBodyItem(Player, 240850, 1)
--				ScriptMessage( Player, Player, 1,"[SC_424953_NOUSE_02]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424953_NOUSE_02]", "0xffbf0b2b" )
			end
		elseif 	CheckBuff( Player , 621126)==false	then
				--Say(Player,"66")
				LoadQuestOption(Player)
				ScriptMessage( Player, Player, 1,"[SC_424953_TOOLATE]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424953_TOOLATE]", "0xffbf0b2b" )
		end
	else
		--Say(Player,"77")
		LoadQuestOption(Player)
	end
end



---------------------------------------------------------------------------
--424954  最初的歉意
---------------------------------------------------------------------------
function LuaPG_424954_Tell()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player, 545861, 1)
end



---------------------------------------------------------------------------
--424955  最後的消息
---------------------------------------------------------------------------
function LuaPG_424955_Ask()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424955 )==true			and
		CheckFlag(Player, 545869)==false				then
			AddSpeakOption(Player, NPC , "[SC_424955_01]","LuaPG_424955_Ask_01", 0)
	end
end

function LuaPG_424955_Ask_01()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424955_02]")
	AddSpeakOption(Player, NPC , "[SC_424955_03]","LuaPG_424955_Ask_02", 0)
end

function LuaPG_424955_Ask_02()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424955_04]")
	AddSpeakOption(Player, NPC , "[SC_424955_05]","LuaPG_424955_Ask_03", 0)
end

function LuaPG_424955_Ask_03()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424955_06]")
	SetFlag(Player, 545869, 1)
end




--=======================================
--424956  研究員的解說
---------------------------------------------------------------------------
function LuaPG_Talk_Stein()
	local Player = OwnerID()
	local NPC = TargetID()

	if	CheckAcceptQuest(Player, 424956 )==true			and
		CheckFlag(Player, 545879)==false				then
			SetSpeakDetail(Player, "[SC_424956_TELL_01]")
			AddSpeakOption(Player, NPC , "[SC_424956_TELL_02]","LuaPG_Talk_Stein_01", 0)
	else	
		LoadQuestOption(Player)
	end		

	if	(CheckAcceptQuest(Player, 424957 )==true or CheckAcceptQuest(Player, 424938) == true)	and
		CountBodyItem(Player, 240859)==0							and
		(CountBodyItem(Player, 240860)<1 or CountBodyItem(Player, 240861)<1 or  CountBodyItem(Player, 240862)<1) then
			AddSpeakOption(Player, NPC , "[SC_424957_TELL_01]","LuaPG_424957_Paper", 0)
	end
end

function LuaPG_Talk_Stein_01()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424956_TELL_03]")
	AddSpeakOption(Player, NPC , "[SC_424956_TELL_04]","LuaPG_Talk_Stein_02", 0)		
end

function LuaPG_Talk_Stein_02()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424956_TELL_05]")
	AddSpeakOption(Player, NPC , "[SC_424956_TELL_06]","LuaPG_Talk_Stein_03", 0)		
end

function LuaPG_Talk_Stein_03()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545879, 1)		
end





--=======================================
--424957  繪製構造圖
--------------------------------------------------------------------------
function LuaPG_424957_Check()		----繪圖確認對象
	local Player = OwnerID()
	local NPC = TargetID()
	local PatientList = {}
	PatientList[106426]=240862
	PatientList[106453]=240861
	PatientList[106452]=240860	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	for key,value in pairs(PatientList) do
		if (CheckAcceptQuest(Player, 424957) == true or CheckAcceptQuest(Player, 424938) == true) and
		key==OrgID and
		CountBodyItem(Player, value)==0 then
			return true						
		elseif key==OrgID and
		CountBodyItem(Player, value)==1  then
			ScriptMessage( Player , Player , 1 , "[SC_424957_01]" , 0 ) 	----你已經畫過這台機關了
			ScriptMessage( Player , Player , 0 , "[SC_424957_01]" , 0 )
			return false	
		end
	end

	if OrgID~=106426 or OrgID~=106453 or OrgID~=106452 then
		ScriptMessage( Player , Player , 1 , "[SC_424957_02]" , 0 ) 	----請對著正確的機關繪圖
		ScriptMessage( Player , Player , 0 , "[SC_424957_02]" , 0 )
		return false			
	end

	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_424957_03]" , 0 ) 		----戰鬥中無法繪圖
		ScriptMessage( Player , Player , 0 , "[SC_424957_03]" , 0 )
		return false
	end

	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_424957_04]" , 0 ) 	----你無法在騎乘時繪圖
			ScriptMessage( Player , Player , 0 , "[SC_424957_04]" , 0 )
			return false
		end
	end
end

function LuaPG_424957_Use()
	local Player = OwnerID()
	local NPC = TargetID()

	local PatientList = {}
	PatientList[106426]=240862
	PatientList[106453]=240861
	PatientList[106452]=240860	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	
	DelBodyItem(Player, 240859, 1)
	GiveBodyItem(Player, PatientList[OrgID], 1)	
end

function LuaPG_424957_Paper()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	repeat 
	GiveBodyitem( Player, 240859, 1 )
	until 
	CountBodyItem( Player, 240859 )==3
end




--PE線=======================================
--424607  偵察人員的情報
---------------------------------------------------------------------------
function LuaPG_424607_Document()
	local Player = OwnerID()
	local NPC = TargetID()
	local AgentList = {}
	AgentList[119914] = {240853, "[SC_424607_AGENT_01]"}
	AgentList[119915] = {240854, "[SC_424607_AGENT_02]"}
	AgentList[119916] = {240855, "[SC_424607_AGENT_03]"}

	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	if CheckAcceptQuest(Player, 424607)==true	then
		if CountBodyItem(Player, AgentList[OrgID][1])<1	then
			SetSpeakDetail(Player, AgentList[OrgID][2])
			GiveBodyItem(Player, AgentList[OrgID][1], 1)
		elseif CountBodyItem(Player, AgentList[OrgID][1])>0 then
			LoadQuestOption(Player)
			ScriptMessage( Player, Player, 1,"[SC_424607_AGENT_04]", "0xffbf0b2b" )
			ScriptMessage( Player, Player, 0,"[SC_424607_AGENT_04]", "0xffbf0b2b" )
		end
	else
		LoadQuestOption(Player)
	end
end



--=======================================
--424609  能量檢測
---------------------------------------------------------------------------
function LuaPG_424609_Machine()		--掛在檢測儀器上面的出生劇情
	local Machine = OwnerID()
	local RoomID = ReadRoleValue(Machine, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Machine, EM_RoleValue_X )
	local Y = ReadRoleValue( Machine, EM_RoleValue_Y )
	local Z = ReadRoleValue( Machine, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Machine, EM_RoleValue_Dir )	--徑度
	local radian = (math.pi/180)*Dir
	
	local MaList = {}
	
	MaList[1] = CreateObj( 119919, X+30*math.cos(radian), Y, Z +20*math.sin(radian), Dir, 1 )	--晶礦
	MaList[2] = CreateObj( 119920, X-30*math.cos(radian), Y, Z +20*math.sin(radian), Dir, 1 )	--方塊

	for i =1,2 do	
		AddToPartition(MaList[i], RoomID )
		WriteRoleValue(Machine,(EM_RoleValue_Register-1)+i, MaList[i])
		--產生一個晶礦和一個方塊，並將之記在machine上
		SetModeEx( MaList[i]  ,EM_SetModeType_Mark , false ) 	--標記
		SetModeEx( MaList[i]  ,EM_SetModeType_Move , false ) 	--移動
	end
	SetPlot( Machine, "touch", "LuaPG_424609_Use_Machine", 10 )	--儀器劇情
--	SetPlot( MaList[2], "range", "LuaPG_424609_BlockCanSee", 100 )	--方塊劇情
end

function LuaPG_424609_Use_Machine()		--掛在檢測儀器上面的觸碰劇情
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01=ReadRoleValue(Machine, EM_RoleValue_Register3)

	DW_CancelTypeBuff(68,Player)						----取消騎乘狀態
	if CheckAcceptQuest(Player, 424609)==true	and			--如果條件符合
	CheckFlag(Player, 545867)==false		then
		if Num01 == 0					then		--如果沒人用儀器
			if 	BeginCastBarEvent( Player, Machine ,"[SC_424609_USE]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424609_Lighting" ) ~= 1 then
										----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player, Player, 1,"[SC_424609_USE_01]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424609_USE_01]", "0xffbf0b2b" )
--			else						--跑條：操作儀器
--				CallPlot(Machine, "LuaPG_424609_Lighting", Player, CheckStatus)
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_119918_DONOTTOUCH]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_119918_DONOTTOUCH]", "0xffbf0b2b" )
	end
end

function LuaPG_424609_Lighting(Player, CheckStatus)		--閃電的buff在晶礦和方塊間
	local Machine = TargetID()
--	Say(Player, CheckStatus)
	EndCastBar( Player, CheckStatus)

	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			CallPlot(Machine, "LuaPG_424609_Lighting_02", Machine,Player)	--觸發劇情，可以看見閃電的buff在晶礦和方塊間
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_424609_Lighting_02(Machine,Player)			--閃電的buff在晶礦和方塊間
	WriteRoleValue(Machine , EM_RoleValue_Register3 , 999)
--	Say(Machine, "33")	
	local Rock = ReadRoleValue(Machine, EM_RoleValue_Register1)
	local Block = ReadRoleValue(Machine, EM_RoleValue_Register2)
	Sleep(10)
--	Say(Rock,"11")
--	Say(Block,"22")
	CastSpell( Rock, Block , 498519 )
	Sleep(70)
	ScriptMessage( Player, Player, 1,"[SC_424609_BROKEN]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_424609_BROKEN]", "0xffbf0b2b" )

--	CancelBuff(Player, 621145)
	SetFlag(Player,545867,1)
	WriteRoleValue(Machine , EM_RoleValue_Register3,0)	
end

function LuaPG_424609_Del_Flag()
	local Player = TargetID()

	Lua_ZonePE_3th_GetScore(350)
	SetFlag(Player,545868,0)
end

function LuaPG_424608_TrustFlag()
	local Player = TargetID()

	Lua_ZonePE_3th_GetScore(50)
	SetFlag(Player,545868,1)
end


--=======================================
--424932  零件拆卸者
---------------------------------------------------------------------------
--掛在106470上的觸碰劇情
function LuaPG_106470_Touch_00()
	SetCursorType( OwnerID(), eCursor_Interact )
	SetPlot( OwnerID(),"touch","LuaPG_106470_Touch",35 )
end

function LuaPG_106470_Touch()
	local Player = OwnerID()
	local Machine_106470 = TargetID()
	local Num=ReadRoleValue(Machine_106470, EM_RoleValue_Register1)

	if CheckAcceptQuest(Player, 424932)==true	and			--如果條件符合
	CountBodyItem(Player, 240857)<5		then
		if Num == 0					then		--如果沒人用儀器
			if BeginCastBarEvent( Player, Machine_106470 ,"[SC_424932_01]", 30, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424932_Take" ) ~= 1 then
										----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player, Player, 1,"[SC_424932_TAKE]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424932_TAKE]", "0xffbf0b2b" )						
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_424932_02]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_424932_02]", "0xffbf0b2b" )			
	end
end

function LuaPG_424932_Take(Player, CheckStatus)
	local Player = OwnerID()
	local Machine_106470 = TargetID()
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			GiveBodyItem(Player, 240857, 1)
			EndCastBar( Player , CheckStatus ) --清除施法條
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end


