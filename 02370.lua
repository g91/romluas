--筆、墨與紙，對話
function LuaS_424325_PEN()
	AdjustFaceDir(TargetID(),OwnerID(),0);
	LoadQuestOption(OwnerID());
	if 	CheckAcceptQuest(OwnerID(),424325)==true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_424325_1]" , "LuaS_424325_1",0 );
	end
	if 	CountBodyItem(OwnerID(),240255)>=1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_424325_3]" , "LuaS_424325_2",0 );
	end
end
function LuaS_424325_1()
	SetSpeakDetail(OwnerID(),"[SC_424325_2]");
		if CountBodyItem(OwnerID(),240253)==0 then
			GiveBodyItem(OwnerID(),240253,1);
			SetFlag(OwnerID(),545442,1);
		end
end
function LuaS_424325_2()
	CloseSpeak(OwnerID());
	DelBodyItem(OwnerID(),240255,1);
	GiveBodyItem(OwnerID(),240256,1);
	--NpcSay(剩下的工作就交給你吧！騎士)
end

--口令
function LuaS_424326_MSG_MS()
	local	num;
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
		if	CheckAcceptQuest(OwnerID(),424326)==true		and
			CheckFlag(OwnerID(),545162)==false			then
			num=ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
				if	num==1	then
					AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_4]","LuaS_424326_MSG_3",0);		--SC_424326_4
				elseif	num==2	then
					AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_4]","LuaS_424326_MSG_4",0);
				elseif	num==3	then
					AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_4]","LuaS_424326_MSG_5",0);
				else
					return
				end
		end
		if	CheckAcceptQuest(OwnerID(),424331)==true and CheckFlag(OwnerID(),545165)==false and CountBodyItem(OwnerID(),240269)>=1   then
			AddSpeakOption( OwnerID(), TargetID(),"[SC_424331_1]","Lua_424331_1",0);
		end
end
function LuaS_424326_MSG_3()
	SetSpeakDetail(OwnerID(),"[SC_424326_5]");	--CS_424326_5
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_6]","LuaS_424326_MSG_F",0);
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_0]","LuaS_424326_MSG_C",0);
end
function LuaS_424326_MSG_4()
	SetSpeakDetail(OwnerID(),"[SC_424326_5]");	--CS_424326_5
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_7]","LuaS_424326_MSG_F",0);
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_1]","LuaS_424326_MSG_C",0);
end
function LuaS_424326_MSG_5()
	SetSpeakDetail(OwnerID(),"[SC_424326_5]");	--CS_424326_5
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_8]","LuaS_424326_MSG_F",0);
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_2]","LuaS_424326_MSG_C",0);	
end
function LuaS_424326_MSG_C()
	CloseSpeak(OwnerID());
	SetFlag(OwnerID(),545162,1)
	Tell(OwnerID(),TargetID(),"[SC_424326_9]")
end
function LuaS_424326_MSG_F()
	CloseSpeak(OwnerID());
	NpcSay(TargetID(),"[SC_424326_10]")
end

--動作
function AGAC_CRY_C()
	while 1 do
		Sleep(20)
		PlayMotion(OwnerID(),105)
	end
end
--大海撈瓶
--2011/11/09新增判定-打開看似平凡的瓶子
function LuaI_AG424329_Pin1()
	local Player=OwnerID();
	local num=DW_rand(3);
	local num2=ReadRoleValue(Player,EM_RoleValue_Register1)
		if CheckAcceptQuest(Player,424329)==true then		--接到424329的人
			if num2==2 then
				GiveBodyItem(Player,240264,1)		
			elseif num2==3 then
				GiveBodyItem(Player,240265,1)
			end
			GiveBodyItem(Player,240260+num,1)
			WriteRoleValue(Player,EM_RoleValue_Register1,num2+1)
		elseif CheckCompleteQuest(Player,424329)==true then	--完成424329的人
			if CheckCompleteQuest(Player,424340)==true  then	--但是還沒完成424340的人，此段是為了補嚐之前錯過的玩家
				GiveBodyItem(Player,240260+num,1);
			elseif CountBodyItem(Player,240264)>=1 then
				GiveBodyItem(Player,240260+num,1);			
			else 
				GiveBodyItem(Player,240264,1);
			end
		else								--還沒接到424329之後的人
			GiveBodyItem(Player,240260+num,1);
		end
end
function LuaQ_AG424329_Init()
	WriteRoleValue(TargetID(),EM_RoleValue_Register1,0)
end
--瓶中信
function LuaS_AG424340_0() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 424340, 1  ) );
	ShowBorder( OwnerID(), 424340, "[424340]", "ScriptBorder_Texture_Paper" );	

end
--酒桶
function LuaS_AG118829_1()--觸碰劇情
	SetPlot( OwnerID(),"touch","LuaS_AG118829_2",30 )
end

function LuaS_AG118829_2()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_118829_1]", 50, 131, 133, 0, "LuaS_AG118829_3" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end

function LuaS_AG118829_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240269,1)
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
		end
	end
end
--跳蚤
function LuaI_AG424335_0()	
	local Obj = OwnerID()--玩家
	local Target = TargetID()--使用對象
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local x=ReadRoleValue(Target,EM_RoleValue_Register1)
	if	(TargetOrgID~=105672)	then		--目標不是
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )	--目標錯誤
	elseif	CheckBuff(Target,509033)==true	then		
		ScriptMessage( Obj, Obj, 1, "[SC_424335_1]", 0 )	--目標已被使用過
	elseif	CheckDistance(Obj,Target, 50)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	else
		return true
	end
	return false--不予理會
end

function LuaI_AG424335_1()
	AddBuff(TargetID(),509033,1,20)
	--WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
		GiveBodyItem(OwnerID(),240031,1)
end
--打好關係
function LuaS_118300_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545137 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118300_2",0)
	end
end
function LuaS_118300_2()
	SetSpeakDetail(OwnerID(),"[SC_424333_3]")
	SetFlag(OwnerID(),545137,1)
	GiveBodyItem(OwnerID(),240269,1)
end
function LuaS_118301_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545138 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118301_2",0)
	end
end
function LuaS_118301_2()
	SetSpeakDetail(OwnerID(),"[SC_424333_2]")
	SetFlag(OwnerID(),545138,1)
	GiveBodyItem(OwnerID(),240269,1)
end
function LuaS_118755_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545161 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118755_2",0)
	end
end
function LuaS_118755_2()
	SetSpeakDetail(OwnerID(),"[SC_424333_4]")
	SetFlag(OwnerID(),545161,1)
	GiveBodyItem(OwnerID(),240269,1)
end
--情報
function Lua_424331_1()
	SetSpeakDetail(OwnerID(),"[SC_424331_2]")
	AddSpeakOption( OwnerID(), TargetID(),"[SC_424331_3]","Lua_424331_2",0);
end
function Lua_424331_2()
	SetSpeakDetail(OwnerID(),"[SC_424331_4]")
	AddSpeakOption( OwnerID(), TargetID(),"[SC_424331_5]","Lua_424331_3",0);
end
function Lua_424331_3()
	SetSpeakDetail(OwnerID(),"[SC_424331_6]")
	SetFlag(OwnerID(),545165,1)
end
--出發
function Lua_AG424332_1()
	SetSpeakDetail(OwnerID(),"[SC_424332_2]")
	SetFlag(OwnerID(),545164,1)
end

--唱歌
function LuaS_424341_sing()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(OwnerID(),265)
	AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_13]","LuaS_424341_sing2",0);
end
function LuaS_424341_sing2()
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	if x==0 then
		SetSpeakDetail(OwnerID(),"[SC_424341_14]")
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	elseif x==1 then
		SetSpeakDetail(OwnerID(),"[SC_424341_15]")
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,2)
	else
		SetSpeakDetail(OwnerID(),"[SC_424341_16]")
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
	end
end
--
function LuaS_424341_sing3()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424341)==true then
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_17]","LuaS_424341_sing4",0);
	end
end
function LuaS_424341_sing4()
		SetSpeakDetail(OwnerID(),"[SC_424341_18]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_1]","LuaS_424341_sing5",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_5]","LuaS_424341_sing7",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_9]","LuaS_424341_sing9",0);
end
function LuaS_424341_sing5()
		SetSpeakDetail(OwnerID(),"[SC_424341_2]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_3]","LuaS_424341_sing6",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_7]","LuaS_424341_sing_END",0);
end
function LuaS_424341_sing6()
		SetSpeakDetail(OwnerID(),"[SC_424341_4]")
		SetFlag(OwnerID(),545228,1)
end
function LuaS_424341_sing7()
		SetSpeakDetail(OwnerID(),"[SC_424341_6]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_7]","LuaS_424341_sing8",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_11]","LuaS_424341_sing_END",0);
end
function LuaS_424341_sing8()
		SetSpeakDetail(OwnerID(),"[SC_424341_8]")
		SetFlag(OwnerID(),545228,1)
end
function LuaS_424341_sing9()
		SetSpeakDetail(OwnerID(),"[SC_424341_10]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_11]","LuaS_424341_sing10",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_3]","LuaS_424341_sing_END",0);
end
function LuaS_424341_sing10()
		SetSpeakDetail(OwnerID(),"[SC_424341_12]")
		SetFlag(OwnerID(),545228,1)
end
function LuaS_424341_sing_END()
	CloseSpeak(OwnerID());
	NpcSay(TargetID(),"[SC_424341_19]");
end

function agusetest1()
	local x=SearchRangeNPC(OwnerID(),11800)
	local y=table.getn(x)
		for i=0,y do	
			if readrolevalue(x[i],EM_RoleValue_OrgID)==118337 then
				Say(OwnerID(),x[i])
				delobj(x[i])
			end
				Say(OwnerID(),"no")
		end

end

--2011/11/09任務424329新增：點擊後return 1
function Lua_AG424329_Comp()
		return 1
end

--2011/11/09因需求新增對瓶子產生點擊使用
function LuaI_AG424329_PinItem2()--觸碰劇情
	SetPlot( OwnerID(),"touch","LuaI_AG424329_PinItem3",30 )
end

function LuaI_AG424329_PinItem3()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)	--下馬
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_RUNRUNPUMPKIN_05]", 50, 131, 133, 0, "LuaI_AG424329_Touch2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end

function LuaI_AG424329_Touch2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240260,1)		--給予看似平凡的瓶子
			CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end

