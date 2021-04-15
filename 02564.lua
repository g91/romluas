--水元素動作
function Z22_WaterM18()
	PlayMotion(OwnerID(),18)
end
function Z22_WaterM21()
	PlayMotion(OwnerID(),21)
end
function Z22_WaterM36()
	PlayMotion(OwnerID(),36)
end
function Z22_WaterM51()
	PlayMotion(OwnerID(),51)
end

--清空付債
function LuaS_AAG_USE()
	local DebEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
	local EXP = 5000000
	local TP = 500000

		local NEWEXP = DebEXP+EXP
		local NEWTP = DebTP+TP
				if (NEWEXP < 0) then
					--Say(OwnerID(),"1")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NEWEXP )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NEWTP )

				elseif (NEWEXP >= 0) then
					--Say(OwnerID(),"2")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！		
				end
end

--2011/11/10 任務：所見不同
function LuaS_420710_Ti()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
end
function LuaS_420710_1()
	MoveToFlagEnabled( TargetID(), false ); 
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
	if CheckAcceptquest(OwnerID(),420710)==true and 
		CheckFlag(OwnerID(),546110)==false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_420710_01]", "LuaS_420710_2", 0 );
	end
	if 	CountBodyItem(OwnerID(),240956)<1 and
		CheckAcceptQuest(OwnerID(),420932)==true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_420710_03]", "LuaS_420932_3", 0 );
	end
	if 	CountBodyItem(OwnerID(),240956)<1 and
		CheckCompleteQuest(OwnerID(),420932)==true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_420710_03]", "LuaS_420932_3", 0 );
	end	
end
function LuaS_420710_2()
	SetSpeakDetail(OwnerID(),"[SC_420710_02]");
	SetFlag(OwnerID(),546110,1);
end
--2011/11/10 任務：420932邀請。用的是420710的延續字串。
function LuaS_420932_3()
	SetSpeakDetail(OwnerID(),"[SC_420710_04]");
	GiveBodyItem(OwnerID(),240956,1);
end
--2011/11/10 任務420932邀請
--使用物品240956，任務物品、一般物品
function LuaI_420932_UseForQ()
	CastSpell( OwnerID(), OwnerID(),498977  )
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_420932_1]",0);
		--if	CheckAcceptQuest(OwnerID(),420932)==true	then
			--SetFlag(OwnerID(),546111,1);
		--end
end
--區域火焰
function Lua_Z22_castAllPlayerBuff()
	local Room =ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local Temp={};
	while 1	do
		local PlayerCount = SetSearchAllPlayer(Room);
		--Say(OwnerID(),PlayerCount);
		if PlayerCount~=0 then
			for i=1,PlayerCount,1 do
				 Temp[i] = GetSearchResult()
					if DW_CheckMap(Temp[i],221) or DW_CheckMap(Temp[i],222) or DW_CheckMap(Temp[i],233) then
						AddBuff(Temp[i],621104,0,61)
					end
			end
		end
		Sleep(600);
	end
end
--2011/11/11 421029  任務：不同的火焰
function Lua_421029_touche()
		SetPlot( OwnerID(),"touch","Lua_421029_1",40 );
end
function Lua_421029_1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	local TPID=ReadRoleValue(T_ID,EM_RoleValue_PID)
	if CheckAcceptQuest(O_ID,421029)==true then
		if CheckFlag(O_ID,TPID)==false then 
			if CountBodyItem(O_ID,240957)>0 then
				CallPlot(O_ID,"LuaT_AG421029_fmin",O_ID,T_ID);
			else
				ScriptMessage(O_ID,O_ID,2,"[SC_421029_5]",0);				
			end
		else
			ScriptMessage(O_ID,O_ID,2,"[SC_421029_4]",0);
		end
	else
		ScriptMessage(O_ID,O_ID,2,"[SC_421029_1]",0);
	end
end

function LuaT_AG421029_fmin(O_ID,T_ID)
	DW_CancelTypeBuff(68,O_ID)	--下馬
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_421029_2]", 20, 131, 133, 0, "LuaT_AG421029_fmin2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function LuaT_AG421029_fmin2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			DelBodyItem(O_ID,240957,1)		
			--Say(O_ID,"1")
			--Say(T_ID,"2")
			CallPlot(O_ID,"LuaT_AG421029_fmin3",O_ID,T_ID)
			ScriptMessage(O_ID,O_ID,1,"[SC_421029_3]",0);
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
function LuaT_AG421029_fmin3(O_ID,T_ID)
	local TPID=ReadRoleValue(T_ID,EM_RoleValue_PID)
	local Roomid=ReadRoleValue(T_ID,EM_RoleValue_RoomID)
	local T_X=ReadRoleValue(T_ID,EM_RoleValue_X)
	local T_Y=ReadRoleValue(T_ID,EM_RoleValue_Y)
	local T_Z=ReadRoleValue(T_ID,EM_RoleValue_Z)
	local OBJ=CreateObj(119825,T_X,T_Y,T_Z,0,1)
		SetModeEx( OBJ  , EM_SetModeType_Mark, false )--標記
		SetModeEx( OBJ  , EM_SetModeType_Revive, false )--重生
		--SetModeEx( OBJ  , EM_SetModeType_HideName, true )--名稱
		AddToPartition(OBJ,Roomid)
		AddBuff(OBJ,621795,0,9);
		SetFlag(O_ID,TPID,1)
end
--
function Lua_119825_del()
	Sleep(80);
	--Say(OwnerID(),"BYE")
	DelObj(OwnerID())
end
--	
--20111111.任務：半龍女孩的對話
function LuaT_424852_1()
	LoadQuestOption(OwnerID());
	if	CheckAcceptQuest(OwnerID(),424852)==true and
		CheckFlag(OwnerID(),546112)==false	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_424852_1]", "LuaT_424852_2", 0 );
	end		
end
function LuaT_424852_2()
	SetSpeakDetail(OwnerID(),"[SC_424852_2]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_424852_3]", "LuaT_424852_3", 0 );
end
function LuaT_424852_3()
	SetSpeakDetail(OwnerID(),"[SC_424852_4]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_424852_5]", "LuaT_424852_4", 0 );
end
function LuaT_424852_4()
	SetSpeakDetail(OwnerID(),"[SC_424852_6]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_424852_7]", "LuaT_424852_5", 0 );
end
function LuaT_424852_5()
	SetSpeakDetail(OwnerID(),"[SC_424852_8]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_424852_9]", "LuaT_424852_6", 0 );
end
function LuaT_424852_6()
	SetSpeakDetail(OwnerID(),"[SC_424852_10]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_424852_11]", "LuaT_424852_7", 0 );
end
function LuaT_424852_7()
	SetSpeakDetail(OwnerID(),"[SC_424852_12]");
	SetFlag(OwnerID(),546112,1)
end
--任務：調節水溫，使用物品240956
function LuaI_240958_USE()
	local O_ID=OwnerID();
	local RoomID = ReadRoleValue( O_ID , EM_RoleValue_RoomID )
	local TNPC=SearchRangeNPC(O_ID,30);
	local NPC=0;
	for i=0,table.getn(TNPC),1 do
		if ReadRoleValue( TNPC[i],EM_RoleValue_OrgID)==119817 then
			NPC=TNPC[i];
		end
	end
		if NPC~=0 then --and ReadRoleValue(O_ID,EM_RoleValue_Register1)==0	then
			CastSpell(O_ID,NPC,498978);
			--WriteRoleValue(O_ID,EM_RoleValue_Register1,1);
			Hide(NPC);
			--callplot(NPC,Lua_240958_Show,NPC,RoomID);
			SetFlag(O_ID,546113,1);
			CallPlot( NPC, "LuaFunc_ResetObj", NPC )
		else
			ScriptMessage( O_ID, O_ID, 0,"[SC_424855_1]", 0 );		--你得靠近一點
		end
end
function Lua_240958_Show(NPC,RoomID)
	Sleep(100);
	WriteRoleValue(NPC,EM_RoleValue_Register1,0);
	Show(NPC,RoomID);
end

function lua_z22NPC119817_smork()
	SetModeEx( OwnerID(), EM_SetModeType_Mark, false )
	AddBuff(OwnerID(),622119,0,-1)
end

--火苗用的火，對們我施放一個永久的火苗
function Lua_119834_addSelf()
	AddBuff(OwnerID(),621847,1,-1);
end

--20111128任務424856療的力量

--function LuaQ_424856_Check()
--	say(ownerid(),"1")
--	return true
--end

function LuaQ_424856_Click()
	local ItemID	= 240959;
	local ItemCount 	= 1;
	local RoleID	= OwnerID();
	local Count = CountBodyItem( RoleID, ItemID );

	if( Count >= ItemCount ) then
		local Result = DelBodyItem( RoleID, ItemID, ItemCount );
		if( Result ) then
			SetFlag(RoleID,546114,1);
  			return 1
		end
	end
		ScriptMessage(RoleID,RoleID,2,"[SC_424856_1]",0) --你身上沒有自然之水
		return  1
end
--20111128任務424876裝置
function Lua_240962_Use()
	local OID=OwnerID();
	local NPCT=SearchRangeNPC(OID,50);
	local NPCN=table.getn(NPCT);
	local FLAG=0;
	local NewNPC=0;
		for i=0,NPCN do
			if ReadRoleValue(NPCT[i],EM_RoleValue_OrgID)==119827 then
				FLAG=ReadRoleValue(NPCT[i],EM_RoleValue_PID);
			end
		end
		if FLAG==0 then
			ScriptMessage(OID,OID,2,"[SC_424876_1]",0)
			return true
		elseif CheckFlag(OID,FLAG)==true then
			ScriptMessage(OID,OID,2,"[SC_424876_2]",0)
			return true
		else
			NewNPC=CreateObjByObj( 119828, OID );
			SetFlag(OID,FLAG,1);
		end
		return true
end
--物品自動消失
function Lua_119828_Del()
	SetModeEX( OwnerID() , EM_SetModeType_Revive, false)
	Sleep(150);
	DelObj(OwnerID());
end
--任務424890 給予安定的力量
--使用物品241019，判定目標並施放一個法術
function Lua_241019_BFUSE()
	if  ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==106394 then
		if  CheckDistance( OwnerID(), TargetID(),100)==true then
			return true
		else
			ScriptMessage(TargetID(),OwnerID(),2,"[SC_424086_8]",0)
			return false
		end
			ScriptMessage(TargetID(),OwnerID(),2,"[SC_204648_1]",0)
			return false
	else
			ScriptMessage(TargetID(),OwnerID(),2,"[SC_204648_1]",0)
			return false
	end
end
--施放法術時觸發
function Lua_424890_1()
	SetModeEX( TargetID() , EM_SetModeType_Mark, false)
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_424890_1]",0);
	DW_QietKillOne(OwnerID(),106402)
	CallPlot( TargetID() , "Lua_424890_2",TargetID() );
end
function Lua_424890_2(TID)
	Sleep(50);
	SetModeEX( TargetID() , EM_SetModeType_Mark, true)
	CallPlot( TID, "LuaFunc_ResetObj", TID )
end
--任務424892零星火苗
--使用物品241021
function Lua_241021_BFUSE()
	local FireT=SearchRangeNPC(OwnerID(),100);
	local con=0;
		for i=0,table.getn(FireT) do
			if  ReadRoleValue(FireT[i],EM_RoleValue_OrgID)==119834  then
				WriteRoleValue(OwnerID(),EM_RoleValue_Register10,FireT[i]);
				con=con+1;
			end
		end
	if  con>=1 then
		return true
	else
		ScriptMessage(TargetID(),OwnerID(),2,"[SC_424892_1]",0)
		return false
	end
end
--使用後跑的程式
function Lua_241021_AFUSE()
	local TID=ReadRoleValue(OwnerID(),EM_RoleValue_Register10);
	CastSpell(OwnerID(),TID,498980)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register10,0);
	return true
end
--讓物件重生
function Lua_424892_1()
	local TID=TargetID()
	DW_QietKillOne(OwnerID(),100394)
	CallPlot( TID, "LuaFunc_ResetObj", TID )
end
--任務界線 424893
--使用物品241022
function Lua_241022_BFUSE()
	local TreeT=SearchRangeNPC(OwnerID(),100);
	local con=0;
		for i=0,table.getn(TreeT) do
			if  ReadRoleValue(TreeT[i],EM_RoleValue_OrgID)==106499  then
				con=con+1;
			end
			if  ReadRoleValue(TreeT[i],EM_RoleValue_OrgID)==106498  then
				con=con+1;
			end
		end
	if  con>=1 then
		return true
	else
		ScriptMessage(TargetID(),OwnerID(),2,"[SC_424893_1]",0)
		return false
	end
end
function Lua_241022_AFUSE()
	DW_QietKillOne(OwnerID(),106637)
end
--2011/12/1 424895  任務祭靈者
--點擊任務npc120263
function Lua_424895_touche()
	SetPlot( OwnerID(),"touch","Lua_424895_1",40 );
end
function Lua_424895_1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if CheckAcceptQuest(OwnerID(),424895)==true then
		if CountBodyItem(OwnerID(),241023)>0 then
			CallPlot(O_ID,"LuaT_AG424895_fmin",O_ID,T_ID);
		end
	else
		ScriptMessage(T_ID,O_ID,2,"[SC_424895_2]",0);
	end
end

function LuaT_AG424895_fmin(O_ID,T_ID)
	DW_CancelTypeBuff(68,O_ID)	--下馬
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_424895_1]", 20, 131, 133, 0, "LuaT_AG424895_fmin2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function LuaT_AG424895_fmin2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			DelBodyItem(O_ID,241023,1)		
			CastSpell(O_ID,T_ID,499099)
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
--埋入聖之石
function Lua_424895_end()
	SetFlag(OwnerID(),546111,1);
end

--任務調查巨門使用前檢查
function Lua_424902_1()
	if CountBodyItem(OwnerID(),241026)>0 then
		return true
	end
	return false
end
--任務調查巨門使用後檢查
function Lua_424902_2()
	local ItemP=ReadRoleValue(TargetID(),EM_RoleValue_PID);
	--DelBodyItem(OwnerID(),241026,1);
	if CountBodyItem(OwnerID(),241031+ItemP) >=1 then
		ScriptMessage(TargetID(),OwnerID(),2,"[SC_424902_1]",0)
	else		
		GiveBodyItem(OwnerID(),241031+ItemP,1);
	end

	return 1
end
--任務424905用繩子
function Lua_241029_AFUSE()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==106399 then
	else
		ScriptMessage(TargetID(),OwnerID(),2,"[SC_204592_1]",0)
		return false
	end
	if CheckDistance(OwnerID(),TargetID(),150)==true then
	else
		ScriptMessage(TargetID(),OwnerID(),2,"[SC_204592_1]",0)
		return false
	end
	return true
end
--任務424905用繩子後
function Lua_241029_BFUSE()
	ScriptMessage(TargetID(),OwnerID(),1,"[SC_241029_1]",0)
	SetAttack( TargetID(),OwnerID())
	DW_QietKillOne(OwnerID(),100395)
end

function AGuse06(mana)
	CastSpell(OwnerID(),OwnerID(),mana)
end

function lua_BufftoEveryOne()
	local OID=OwnerID()
		Say(OID,"1")
end