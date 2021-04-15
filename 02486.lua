--鬼鬼祟祟，使用物品
function LuaI_424523_UseCheckLUA()
	local Player = OwnerID()
	local Cnpc,Pnpc=Aguse04(Player,100,119251)
	local Cnpc1,Pnpc1=Aguse04(Player,100,119358)
	
		if Cnpc ~= 0 or Cnpc1 ~= 0 then
			--Say(Player,"HAHA")
			return true
		else
			ScriptMessage(Player,Player,2,"[SC_424523_01]",0)	--這裡不是個適合的位置
			return false
		end
end	
function LuaI_424523_UseEffect()
	local Player = OwnerID()
	local Cnpc,Pnpc = Aguse04(Player,100,119251)
		if Cnpc ~= 0 then
			CallPlot(OwnerID(),"LuaI_424523_x1",0)
			SysCastSpellLv(Player,Pnpc,497860,1)
			SetFlag(Player,545502,1)
		else
			ScriptMessage(Player,Player,2,"[SC_424523_02]",0)
		end
end
function LuaI_424523_x1()
	DelBodyItem(OwnerID(),240098,1)
end
--Aguse04
function Aguse04(Player,Far,Num)
	local Qnpc = SearchRangeNPC(Player,100)
	local Pnpc=0
	local Cnpc = 0
		for i=0,table.getn(Qnpc),1 do
			if ReadRoleValue(Qnpc[i],EM_RoleValue_OrgID)==Num then
				Pnpc=Qnpc[i]
				Cnpc=Cnpc+1
			end
		end
	return Cnpc,Pnpc --回傳是不是有這隻，回傳這隻的編號
end
--424525緊急傳遞
function LuaS_424525_01()		
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
	if CheckAcceptQuest(OwnerID(),424525)==true and CheckFlag(OwnerID(),545504)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_SECRET_SIGN_01]","LuaS_424525_02",0)	--對話給旗標
	end
	if CheckAcceptQuest(OwnerID(),424526)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424525_3]","LuaS_424525_03",0)
	end
	if CheckAcceptQuest(OwnerID(),424554)==true and CountBodyItem(OwnerID(),240661)==0 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424554_1]","LuaS_424554_01",0)
	end
end
function LuaS_424525_02()
	tell(OwnerID(),TargetID(),"[SC_424525_1]")
	SetFlag(OwnerID(),545504,1)
	CloseSpeak(OwnerID());
end
function LuaS_424525_03()
	SetSpeakDetail(OwnerID(),"[SC_424525_2]");
end
function LuaS_424554_01()
	SetSpeakDetail(OwnerID(),"[SC_424554_2]");
	if CountBodyItem(OwnerID(),240661)==0 then
		GiveBodyItem(OwnerID(),240661,1)
	end
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424554_3]","LuaS_424554_02",0)
end
function LuaS_424554_02()
	SetSpeakDetail(OwnerID(),"[SC_424554_4]");
end
--任務424526 說客
function LuaS_424526_01()							--對話劇情
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
	if	CheckAcceptQuest(OwnerID(),424526)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424526_01]","LuaS_424526_02",0)
	end
end
function LuaS_424526_02()
	SetSpeakDetail(OwnerID(),"[SC_424526_02]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424526_03]","LuaS_424526_03",0)
end

function LuaS_424526_03()
	SetSpeakDetail(OwnerID(),"[SC_424526_04]")
	SetFlag(OwnerID(),545503,1)
end

--424527 飛鴿信差
function LuaS_424527_01()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0)
	if CheckAcceptQuest(OwnerID(),424527)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424527_1]","LuaS_424527_02",0)
	end
end
function LuaS_424527_02()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119262 then
		SetSpeakDetail(OwnerID(),"[SC_424527_2]");
		SetFlag(OwnerID(),545505,1);
	end
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119263 then
		SetSpeakDetail(OwnerID(),"[SC_424527_3]");
		SetFlag(OwnerID(),545506,1);
	end
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119264 then
		SetSpeakDetail(OwnerID(),"[SC_424527_4]");
		SetFlag(OwnerID(),545507,1);

	end
end
--424530 讓對話繼續
function LuaS_424531_StarTalk()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424530)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_1]","LuaS_424531_01",0)
	end
end
function LuaS_424531_01()
	SetSpeakDetail(OwnerID(),"[SC_424531_2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_4]","LuaS_424531_02",0)
end
function LuaS_424531_02()
	SetSpeakDetail(OwnerID(),"[SC_424531_5]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_6]","LuaS_424531_03",0)
end
function LuaS_424531_03()
	SetSpeakDetail(OwnerID(),"[SC_424531_7]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_9]","LuaS_424531_04",0)
end
function LuaS_424531_04()
	SetSpeakDetail(OwnerID(),"[SC_424531_10]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_12]","LuaS_424531_05",0)
end
function LuaS_424531_05()
	SetSpeakDetail(OwnerID(),"[SC_424531_10]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_12]","LuaS_424531_06",0)
end
function LuaS_424531_06()
	SetSpeakDetail(OwnerID(),"[SC_424531_13]")
	SetFlag(OwnerID(),545510,1)
end
--屍體軍火 傳送
function LuaP_424531_Accept()
	SetPosByFlag(TargetID(),780871,7)
end

--423774 追上威爾
function LuaS_423774_StarTalk()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),423774)==true and CheckFlag(OwnerID(),545565)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423774_0]","LuaS_423774_01",0)
	end
end
function LuaS_423774_01()
	SetSpeakDetail(OwnerID(),"[SC_423774_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423774_2]","LuaS_423774_02",0)
end
function LuaS_423774_02()
	SetSpeakDetail(OwnerID(),"[SC_423774_3]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423774_4]","LuaS_423774_03",0)
end
function LuaS_423774_03()
	SetSpeakDetail(OwnerID(),"[SC_423774_5]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423774_6]","LuaS_423774_04",0)
end
function LuaS_423774_04()
	SetSpeakDetail(OwnerID(),"[SC_423774_7]")
	SetFlag(OwnerID(),545565,1)
end

--424531屍體軍火商
function LuaS_424531_NI1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424531)==true and CheckFlag(OwnerID(),545566)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424531_14]","LuaS_424531_NI2",0)
	end
end
function LuaS_424531_NI2()
	CloseSpeak(OwnerID());
	Tell(OwnerID(),TargetID(),"[SC_424531_15]")
	SetFlag(OwnerID(),545566,1)
end

--424532 這個名字
function LuaS_424532_22()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424532)==true and 
	   CountBodyItem(OwnerID(),240099)==0 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424532_1]","LuaS_424532_23",0)
	end
end
function LuaS_424532_23()
	SetSpeakDetail(OwnerID(),"[SC_424532_2]");
	GiveBodyItem(OwnerID(),240099,1);
end

--點擊240099 可疑的信件
function Lua_424532_Item()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_424532_3]" );
	ShowBorder( OwnerID(), 0 , "[240099]", "ScriptBorder_Texture_Paper" );
	SetFlag(OwnerID(),545567,1)
end
--424533 惡作劇？
function LuaS_424533_Talk()	--說話
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424533)==true and  CheckFlag(OwnerID(),545568)==false then
		SetFlag(OwnerID(),545568,1)
	end
end
--424534 面對面，範圍劇情
function LuaP_424534_R1()
	CallPlot(OwnerID(),"LuaS_BackOfSismond",OwnerID())
	SetPlot(OwnerID(),"range","LuaP_424534_R2",80)
end
function LuaP_424534_R2()
	local P_AR=SearchRangePlayer(OwnerID(),150)
		for i=0,table.getn(P_AR),1 do
			if CheckAcceptQuest(P_AR[i],424534)==true and CheckFlag(OwnerID(),545569)==false then
				CastSpell(TargetID(),OwnerID(),498337)
				ScriptMessage(P_AR[i],P_AR[i],1,"[SC_424534_1]",0)
				SetFlag(P_AR[i],545569,1)
			end
		end
end
--424535 對談初始動作用
function LuaI_InitAct()
	SetDefIdleMotion(OwnerID(),13)
end
--初始被綁
function LuaIn_119308_E()
	AddBuff(OwnerID(),620955,1,-1)
	AddBuff(OwnerID(),620956,1,-1)
	SetDefIdleMotion(OwnerID(),13)
end

--424545 不安的榮耀之谷
function LuaS_119260_Talk()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest (OwnerID(),424545)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_119260_1]","LuaS_119260_1",0);
	end
end
function LuaS_119260_1()
	SetSpeakDetail(OwnerID(),"[SC_119260_2]");
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119260_3]","LuaS_119260_2",0);
end	
function LuaS_119260_2()
	ChangeZone(OwnerID(),15,0,-3453,-613,14410,359);
end
--
--信件
function LuaS_424548_1()--觸碰劇情
	SetPlot( OwnerID(),"touch","LuaS_424548_2",30 )
end

function LuaS_424548_2()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_424548_1]", 50, 131, 133, 0, "LuaS_424548_3" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end

function LuaS_424548_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240100,1)
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
		end
	end
end
--打開信件240100
function Lua_240100_Item()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 424549, 1  ) );
	ShowBorder( OwnerID(), 424549, "[424549]", "ScriptBorder_Texture_Paper" );
end
--角色吳德的對話
function LuaS_119512_02()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424550)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_119521_01]","LuaS_119512_03",0)
--[SC_119521_01] 你這裡還有多的[240660]嗎？
	end
end

function LuaS_119512_03()
	SetSpeakDetail(OwnerID(),"[SC_119521_02]")
--[SC_119521_02] 
--雖然你曾經幫助過我，是你突然這樣問我實在有些困難…
--因為我這次貨品訂得量是死的，如果下次你有預訂的話，我也許可以提供給你，但這次實在太吃緊了，抱歉啦！實在幫不了你…
--([119512]面有難色的拒絕了你，只好去拜託其它的人。)
end
--角色法蒂雅的對話
function LuaS_119434_01()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424550)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_119521_01]","LuaS_119434_02",0)
--[SC_119521_01] 你這裡還有多的[240660]嗎？
	end
end

function LuaS_119434_02()
	SetSpeakDetail(OwnerID(),"[SC_119434_01]")
	if CountBodyItem(OwnerID(),240662) == 0 then
		GiveBodyItem(OwnerID(),240662,1)
	end
--[SC_119434_01] 
--這個可是我特別珍藏的[240662]喔！
end

--119516水桶拿水
function LuaS_119516_1()--觸碰劇情
	SetPlot( OwnerID(),"touch","LuaS_119516_2",30 )
end

function LuaS_119516_2()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_119516_1]", 50, 131, 133, 0, "LuaS_119516_3" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end

function LuaS_119516_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240574,1)
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
		end
	end
end

--法術潑水劇情
function LuaT_424551_1()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119515 then
		CallPlot(TargetID(),"LuaT_424551_2",OwnerID())
	end
end
function LuaT_424551_2(Player)
	ScriptMessage(Player,Player,2,"[SC_119515_1]",0)
	Sleep(30)
	SetFlag(Player,545602,1)
end
--酒保
function LuaC_119452_01()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424555)==true then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424555_1]","LuaC_119452_02",0)
	end
end
function LuaC_119452_02()
	SetSpeakDetail(OwnerID(),"[SC_424555_2]")
	GiveBodyItem(OwnerID(),240269,1)
end
--424555 不告而別
function LuaS_119519_drum()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424555)==true and CountBodyItem(OwnerID(),240269)>=1 and checkflag(OwnerID(),545603)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_119519_1]","LuaS_119519_drum2",0)
	end
end
function LuaS_119519_drum2()
	SetSpeakDetail(OwnerID(),"[SC_119519_2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119519_3]","LuaS_119519_drum3",0)
end
function LuaS_119519_drum3()
	SetSpeakDetail(OwnerID(),"[SC_119519_4]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119519_5]","LuaS_119519_drum4",0)
end
function LuaS_119519_drum4()
	SetSpeakDetail(OwnerID(),"[SC_119519_6]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119519_7]","LuaS_119519_drum5",0)
end
function LuaS_119519_drum5()
	SetSpeakDetail(OwnerID(),"[SC_119519_8]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119519_9]","LuaS_119519_drum6",0)
end
function LuaS_119519_drum6()
	SetSpeakDetail(OwnerID(),"[SC_119519_10]")
	SetFlag(OwnerID(),545603,1)
end

--119479取劍
function LuaS_119479_1()--觸碰劇情
	SetPlot( OwnerID(),"touch","LuaS_119479_2",30 )
end

function LuaS_119479_2()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_119479_1]", 50, 131, 133, 0, "LuaS_119479_3" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end

function LuaS_119479_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240661,1)
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
		end
	end
end

--跟海邊的少年對話
function LuaS_119436_talk()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424650)==true and CheckFlag(OwnerID(),545604)==false and CountBodyItem(OwnerID(),240661)>=1 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_2]","LuaS_119436_1",0)
	end
end
function LuaS_119436_1()
	SetSpeakDetail(OwnerID(),"[SC_119479_3]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_4]","LuaS_119436_2",0)
end
function LuaS_119436_2()
	SetSpeakDetail(OwnerID(),"[SC_119479_5]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_6]","LuaS_119436_3",0)
end
function LuaS_119436_3()
	SetSpeakDetail(OwnerID(),"[SC_119479_7]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_8]","LuaS_119436_4",0)
end
function LuaS_119436_4()
	SetSpeakDetail(OwnerID(),"[SC_119479_9]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_10]","LuaS_119436_5",0)
end
function LuaS_119436_5()
	SetSpeakDetail(OwnerID(),"[SC_119479_11]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_12]","LuaS_119436_6",0)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_119479_13]","LuaS_119436_6",0)
end
function LuaS_119436_6()
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_119479_14]",0)
	SetSpeakDetail(OwnerID(),"[SC_119479_15]")
	if CountBodyItem(OwnerID(),240661)>=1 then
		DelBodyItem(OwnerID(),240661,1)
		SetFlag(OwnerID(),545604,1)
	end
end
--大門的傳送門
function Lua_DolinDourt_PortalInit()
	function Lua_DolinDourt_EnterPortal()
		local Player = OwnerID();									
		if CheckAcceptQuest(OwnerID(),424524)==true and CheckFlag( Player, 545501  )~= true then	--送進打怪
			SetPosByFlag( OwnerID(),780871 , 1 );
		elseif CheckCompleteQuest(OwnerID(),423774)==true then
			return
		elseif CheckAcceptQuest(OwnerID(),424529)==true or CheckCompleteQuest(OwnerID(),424529)==true then
			SetPosByFlag( OwnerID(),780871 , 8 );							--送進地下室
		elseif CheckCompleteQuest(OwnerID(),424527)==true then					--送進一樓
			SetPosByFlag( OwnerID(),780871, 6  );
		end
	end
	local Portal = OwnerID();
	MoveToFlagEnabled( Portal , false );
	SetModeEx( Portal , EM_SetModeType_Mark,false );
	SetModeEx( Portal , EM_SetModeType_Gravity,false );
	SetModeEx( Portal , EM_SetModeType_ShowRoleHead, false);
	SetModeEx( Portal , EM_SetModeType_Fight, false);
	SetPlot( Portal , "Collision" , "Lua_DolinDourt_EnterPortal" , 50 );
end
--一樓的傳送門--傳出跟傳到樓下
function Lua_Dolin1FOut_PortalInit()
	function Lua_Dolin1FOut_EnterPortal()
		local Player = OwnerID();									
			SetPosByFlag( OwnerID(),780871, 7  );
	end
	local Portal = OwnerID();
	MoveToFlagEnabled( Portal , false );
	SetModeEx( Portal , EM_SetModeType_Mark,false );
	SetModeEx( Portal , EM_SetModeType_Gravity,false );
	SetModeEx( Portal , EM_SetModeType_ShowRoleHead, false);
	SetModeEx( Portal , EM_SetModeType_Fight, false);
	SetPlot( Portal , "Collision" , "Lua_Dolin1FOut_EnterPortal" , 50 );
end
function Lua_Dolin1FtoDown_PortalInit()
	function Lua_Dolin1FtoDown_EnterPortal()
		local Player = OwnerID();	
		if CheckAcceptQuest(OwnerID(),424529)==true or CheckCompleteQuest(OwnerID(),424529)==true then
			SetPosByFlag( OwnerID(),780871 , 8 );							--送進地下室								
		end
	end
	local Portal = OwnerID();
	MoveToFlagEnabled( Portal , false );
	SetModeEx( Portal , EM_SetModeType_Mark,false );
	SetModeEx( Portal , EM_SetModeType_Gravity,false );
	SetModeEx( Portal , EM_SetModeType_ShowRoleHead, false);
	SetModeEx( Portal , EM_SetModeType_Fight, false);
	SetPlot( Portal , "Collision" , "Lua_Dolin1FtoDown_EnterPortal" , 50 );
end
--樓梯的傳送門
function Lua_GoOut_PortalInit()
	function Lua_GoOut_EnterPortal()
		local Player = OwnerID();	
			SetPosByFlag( OwnerID(),780871 , 5 );							--送出門外
	end
	local Portal = OwnerID();
	MoveToFlagEnabled( Portal , false );
	SetModeEx( Portal , EM_SetModeType_Mark,false );
	SetModeEx( Portal , EM_SetModeType_Gravity,false );
	SetModeEx( Portal , EM_SetModeType_ShowRoleHead, false);
	SetModeEx( Portal , EM_SetModeType_Fight, false);
	SetPlot( Portal , "Collision" , "Lua_GoOut_EnterPortal" , 50 );
end
--地下的傳送門
function Lua_GoOut2_PortalInit()
	function Lua_GoOut2_EnterPortal()
		local Player = OwnerID();	
			SetPosByFlag( OwnerID(),780871 , 5 );							--送出門外
	end
	local Portal = OwnerID();
	MoveToFlagEnabled( Portal , false );
	SetModeEx( Portal , EM_SetModeType_Mark,false );
	SetModeEx( Portal , EM_SetModeType_Gravity,false );
	SetModeEx( Portal , EM_SetModeType_ShowRoleHead, false);
	SetModeEx( Portal , EM_SetModeType_Fight, false);
	SetPlot( Portal , "Collision" , "Lua_GoOut2_EnterPortal" , 50 );
end

function Lua_SetM_01()
	SetDefIdleMotion(OwnerID(),243)
end
--偽裝的抗軍
function LuaS_119252_Y()
	LoadQuestOption(OwnerID());
	if CheckBuff(OwnerID(),620928)==false	 then
		CloseSpeak(OwnerID())
		AddBuff( OwnerID(),620928,0,-1 )
		tell(OwnerID(),TargetID(),"[SC_119252_1]")
	end
end

--偷來用，不重置中控--

function Ag_QuestS( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )--範圍玩家任務劇情開始播放
	local player = {}
	local Ctrl = OwnerID()
	local allplayer = SearchRangePlayer( Ctrl, CheckRange )	

	for i=0, table.getn(allplayer)-1 do--符合條件 給予演戲用Buff
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查			
			table.insert( player, allplayer[i] )
		end
	end
	DebugMsg(0,0, "Count = "..table.getn(player))
	while true do
		for i= 1, table.getn(player) do
			if player[i] ~= nil and CheckID(player[i]) == true and  
				( CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], Ctrl, CheckRange ) ~= true ) then --檢查是否超過檢查範圍
				
				CancelBuff( player[i], CheckBuffID )
				table.remove(player, i)							
			end
		end
		--DebugMsg(0,0, "Count = "..table.getn(player))
		if table.getn(player) == 0 then
			--DebugMsg(0,0,"Del")
			for i=1, table.getn(ActorArray ) do--刪除演員
				if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
			end
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			ks_resetObj( Ctrl, nil )--重置中控
			break
		end
		sleep(20)
	end	
end

function Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl )--範圍玩家任務劇情結束給予重要旗標
	Ctrl = Ctrl or OwnerID()
	local player = SearchRangePlayer ( Ctrl, CheckRange ) 	

	for i=0, table.getn(player )-1 do--清除演戲Buff
		if	CheckID(player[i]) == true and  
			CheckAcceptQuest( player[i], QuestID ) == true and 
			CheckBuff( player[i] , CheckBuffID ) == true and 
			CheckFlag( player[i], FinishFlagID ) ~= true then
			
			if FinishFlagID ~= nil then SetFlag( player[i], FinishFlagID, 1 ) end
			CancelBuff( player[i], CheckBuffID )
		end
	end

	for i=1, table.getn(ActorArray ) do--刪除演員
		if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	ks_resetObj( OwnerID(), nil )--重置中控
end

function GG_test1()
	local x=25
	local y= 20
	local z=x/y
	say(OwnerID(),math.floor(z))
end