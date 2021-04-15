function Lua_Zone20_Steelwar_Start()--���K�Գ���l�@��
	--�سy�������A�ΥH�����Ӭy�{
	local MainControl = CreateObjByObj(100292,OwnerID());
	BeginPlot(MainControl,"Lua_Zone20_Steelwar_Main",0);
end
function Lua_Zone20_Steelwar_Main()--���K�Գ��D�j��
	Global_Zone20_Steelwar = {};
	Global_Zone20_Steelwar["State"] = "Start";
	Global_Zone20_Steelwar["RetreatFlag"] = {};
	Global_Zone20_Steelwar["Chose"] = 0;
	Global_Zone20_Steelwar["Fighter"] = {};
	Global_Zone20_Steelwar["Fighter"][1] = {};
	Global_Zone20_Steelwar["Fighter"][2] = {};
	Global_Zone20_Steelwar["MonsterKing"] = {};
	Global_Zone20_Steelwar["Monster"] = {};
	Global_Zone20_Steelwar["Monster"][1] = {};
	Global_Zone20_Steelwar["Monster"][2] = {};
	Global_Zone20_Steelwar["FirstHit"] = {};
	Global_Zone20_Steelwar["lazyNPC"] = {};
	while 1 do
	--���ݰh���T��
		--�ˬd�O�_�M�h
		if Global_Zone20_Steelwar["State"] == "Fight" then
			for k =1,2 do
				for j =1,table.getn(Global_Zone20_Steelwar["Fighter"][k]) do
				--	DebugMsg( 0 , 0 , "Fighter ["..k.."]".."["..j.."] = "..Global_Zone20_Steelwar["Fighter"][k][j] );
					if Global_Zone20_Steelwar["Fighter"][k][j] == 0 then
						--�@�Ӱ϶����x�ШS�A�M�h
						Global_Zone20_Steelwar["State"] = "Retreat";
						break;
					end
				end
			end
		end
		--����M�h�T��
		if Global_Zone20_Steelwar["State"] == "Retreat" then
			--�s�Ҧ��H�M�h
			if Global_Zone20_Steelwar["MonsterKing"][1] ~= nil then
				Yell( Global_Zone20_Steelwar["MonsterKing"][1],"[SC_118365_7]",5)
				Yell( Global_Zone20_Steelwar["MonsterKing"][2],"[SC_118365_5]",5)
				Lua_Zone20_Steelwar_RetreatAll();
			end
			--�M���Ҧ��Ǫ�
			Sleep(50);
			Lua_Zone20_Steelwar_ReSetSituation();
			Global_Zone20_Steelwar["State"] = "Start";--�N���A�]�^�}�l
		elseif Global_Zone20_Steelwar["State"] == "Start" then	--�}�l��ܱ���
			--�i�J��ܱ��Ұ�
			Global_Zone20_Steelwar["FirstHit"] = {};--�M���u�������M��
			Sleep(60)--���ݨ�����b�}�l�U�@��
			local Situation = Lua_Zone20_Steelwar_Chose();--��ܱ��Ҩö}�l
		end
		Sleep(20);
	end
end

function Lua_Zone20_Steelwar_Chose()--��ܱ��Ұ�(���X�����ƪ��H������)
	Global_Zone20_Steelwar["State"] = "ShowTime";
	local Situation = {1,2,3};
	for i = 1,table.getn(Situation) do
		if Global_Zone20_Steelwar["Chose"] == Situation[i] then
			table.remove(Situation,i);
			break;
		end
	end
	local Chose = Situation[Rand(table.getn(Situation))+1];
	CallPlot(OwnerID(),"Lua_Zone20_Steelwar_KingShow",Chose);--�B�z���Ҭy�{1
	CallPlot(OwnerID(),"Lua_Zone20_Steelwar_lazyNPC",Chose);--����NPC
	CallPlot(OwnerID(),"Lua_Zone20_Steelwar_Situation",Chose);--���Ҭy�{2
	Global_Zone20_Steelwar["Chose"] = Chose;
	return Chose;
end
function Lua_Zone20_Steelwar_KingShow(Situation)--�����x�i����(��t)
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	local MonsterKing = {};	
	MonsterKing[1] = CreateObjByFlag( 118365 , 780940 , Situation-1 , 1 );
	MonsterKing[2] = CreateObjByFlag( 118366 , 780941 , Situation-1 , 1 );
	for i = 1,2 do
		SetModeEx(  MonsterKing[i], EM_SetModeType_HideName, false );--�W�l
		AddToPartition(MonsterKing[i],RoomID);
		Global_Zone20_Steelwar["MonsterKing"][i] = MonsterKing[i];
		CallPlot(MonsterKing[i],"Lua_Zone20_Steelwar_KingScript",i,Situation);--�B�z���Ҭy�{1
	end
end
function Lua_Zone20_Steelwar_KingScript(i,Situation)--�����x��l�@��
	if Situation ==3  then
		if i==2 then
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
			Yell(OwnerID(),"[SC_118365_3]",5);
			Sleep(20)
		else
			Sleep(20)
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
			Yell(OwnerID(),"[SC_118365_4]",5);
		end
	else
		if i==2 then
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
			Yell(OwnerID(),"[SC_118365_1]",5);
			Sleep(20)
		else
			Sleep(20)
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
			Yell(OwnerID(),"[SC_118365_2]",5);
		end
	end
	Sleep(20)
	Global_Zone20_Steelwar["State"] = "Fight";--�N���A�אּ�}�l�԰�
	local TimeCheck= 0;
	while 1 do
		if Global_Zone20_Steelwar["State"] == "Retreat" then
			break;
		end
		if TimeCheck >=10 then
			local T1Say={"[SC_118365_11]","[SC_118365_12]","[SC_118365_13]"};
			local T2Say={"[SC_118365_14]","[SC_118365_15]","[SC_118365_16]"};
			local RR = Rand(3)+1;
			if Situation ==3  then
				if i==2 then
					PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
					Npcsay(OwnerID(),T1Say[RR]);
					Sleep(20);
				else
					Sleep(20);
					PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
					Npcsay(OwnerID(),T2Say[RR]);
				end
			else
				if i==2 then
					PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
					Npcsay(OwnerID(),T1Say[RR]);
					Sleep(20);
				else
					Sleep(20);
					PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT);
					Npcsay(OwnerID(),T2Say[RR]);
				end
			end
			TimeCheck = 0;
		end
		Sleep(10)
		TimeCheck = TimeCheck +1;
	end
end
function Lua_Zone20_Steelwar_Situation(Situation)--���ҳB�z��
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	local MonsterGroup = {};
	local MonsterGroupID = {};
	local MonsterFlag = {};
	MonsterGroup[1] = {};
	MonsterGroup[2] = {};
	MonsterGroupID[1] = {};
	MonsterGroupID[2] = {};
	MonsterGroupID[3] = {};
	MonsterGroupID[1][1] = {118354,118354,118354};
	MonsterGroupID[1][2] = {118351,118351,118351,118353,118351,118351};
	MonsterGroupID[2][1] = {118354,118354,118355};
	MonsterGroupID[2][2] = {118351,118353,118352,118353,118351};
	MonsterGroupID[3][1] = {118354,118354,118356};
	MonsterGroupID[3][2] = {118351,118351,118353,118353,118351};
	MonsterFlag[1] = {780943,780942};
	MonsterFlag[2] = {780945,780944};
	MonsterFlag[3] = {780947,780946};
	--�o�̰��污�ҫ���
	DebugMsg( 0 , 0 , "Situation = "..Situation );
	local FlagPos = {};
	FlagPos[1] = {};
	FlagPos[2] = {};
	for j = 1, 2 do
		for k = 1, GetMoveFlagCount ( MonsterFlag[Situation][j] )do
			FlagPos[j][k] = DW_GetFlagXYZ(MonsterFlag[Situation][j],k-1);
		end
	end
	for p =1,2 do
		Global_Zone20_Steelwar["Monster"][p] = {};
		Global_Zone20_Steelwar["RetreatFlag"][p] = {};
		for i = 1,GetMoveFlagCount ( MonsterFlag[Situation][p] ) do
			MonsterGroup[p][i] = Lua_Davis_BornByMultilateralGroup( FlagPos[p][i][1],FlagPos[p][i][2],FlagPos[p][i][3],FlagPos[p][i][4],MonsterGroupID[Situation][p], 50  );	--�b�P���MonsterID �� X ����
			local BX,BY,BZ,BDir = Lua_MovePosByXYZ( FlagPos[p][i][1], FlagPos[p][i][2], FlagPos[p][i][3], FlagPos[p][i][4] , -150, 180);	--���o���100���y��
			Global_Zone20_Steelwar["RetreatFlag"][p][i] = {BX,BY,BZ,BDir};	--�N�M�h���аO�J�����ܼ�
			Global_Zone20_Steelwar["Monster"][p][i] = MonsterGroup[p][i];
			Global_Zone20_Steelwar["Fighter"][p][i] = table.getn(MonsterGroup[p][i]);
			--DebugMsg( 0 , 0 , "Fighter ["..p.."]".."["..i.."] = "..table.getn(MonsterGroup[p][i]) );
		end
	end
	while 1 do
		if Global_Zone20_Steelwar["State"] == "Fight" then--�ˬd�O�_���԰����A
			for p =1,2 do
				for i = 1,table.getn( MonsterGroup[p]) do
					Global_Zone20_Steelwar["FirstHit"][i] = {};
					for m = 1,table.getn( MonsterGroup[p][i]) do
						MoveToFlagEnabled( MonsterGroup[p][i][m] , false );	-- �������޼@��
						SetModeEx( MonsterGroup[p][i][m], EM_SetModeType_Fight, true );	--�i�������
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_Strikback, true );	--����
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_Mark, true );	--�аO
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_SearchenemyIgnore, false );--�Q�j�M
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_Obstruct, false );--����
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_Drag , false );--���O
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_Gravity, true );--���O
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_ShowRoleHead, true );--�Y����
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_Searchenemy, true );--����
						SetModeEx(  MonsterGroup[p][i][m], EM_SetModeType_HideName, false );--�W�l
						if ReadRoleValue( MonsterGroup[p][i][m] , EM_RoleValue_OrgID) == 118353 then
							SetModeEx(  MonsterGroup[p][i][m] , EM_SetModeType_Move, false );--����
						else
							SetModeEx(  MonsterGroup[p][i][m] , EM_SetModeType_Move, true );--����
						end
				--[[		if Situation ==1 then
							if ReadRoleValue( MonsterGroup[p][i][m],EM_RoleValue_OrgID) == 118353 then
								table.insert(Global_Zone20_Steelwar["FirstHit"][i],MonsterGroup[p][i][m]);
							end
						elseif Situation ==2 then
							if ReadRoleValue( MonsterGroup[p][i][m],EM_RoleValue_OrgID) == 118353 then
								table.insert(Global_Zone20_Steelwar["FirstHit"][i],MonsterGroup[p][i][m]);
							end
						elseif Situation == 3 then
							if ReadRoleValue( MonsterGroup[p][i][m],EM_RoleValue_OrgID) == 118353 then
								table.insert(Global_Zone20_Steelwar["FirstHit"][i],MonsterGroup[p][i][m]);
							end
							if ReadRoleValue( MonsterGroup[p][i][m],EM_RoleValue_OrgID) == 118356 then
								table.insert(Global_Zone20_Steelwar["FirstHit"][i],MonsterGroup[p][i][m]);
							end
						end
						for w = 1 ,table.getn(Global_Zone20_Steelwar["FirstHit"][i]) do
							DebugMsg( 0 , 0 , "$$FirstHit = "..Global_Zone20_Steelwar["FirstHit"][i][w] );
						end]]
						CallPlot( MonsterGroup[p][i][m] , "Lua_Zone20_Steelwar_MonsterRetreat",p,i,Situation);
					end
				end
			end
			break;
		end
		Sleep(10)--�C���ˬd���A
	end
end
function Lua_Zone20_SteelwarKillqueue(a,b)--�����W��ƦC��
	local IpID = {118356,118353}
	local orgA = ReadRoleValue(a,EM_RoleValue_OrgID)
	local orgB = ReadRoleValue(b,EM_RoleValue_OrgID)
	for i =1,table.getn(IpID) do
		if  orgA == IpID[i] then
			return true;
		elseif orgB == IpID[i] then
			return false;
		end
	end
	return a<b;
end
--�Ǫ��h���@��
function Lua_Zone20_Steelwar_MonsterRetreat(p,i,Situation)
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	Hide(OwnerID());
	Show(OwnerID(),RoomID);
	AddBuff(OwnerID() ,502707 ,1 ,-1 );--�D�԰������^�媺buff (ownerID,buff,LV,Time);
	if Situation == 2 then
		if p ==1 then
			AddBuff(OwnerID() ,509856 ,1 ,-1 );
		else
			AddBuff(OwnerID() ,509857  ,1 ,-1 );
		end
	else
		if p ==2 then
			AddBuff(OwnerID() ,509856 ,1 ,-1 );
		else
			AddBuff(OwnerID() ,509857  ,1 ,-1 );
		end

	end
	local isDef = false;
	local RR;
	local NowKillID=0;
	local KillList = {};
	if p == 1 then
		Npcsay(OwnerID(),"[SC_118365_6]");
		for m=1,table.getn(Global_Zone20_Steelwar["Monster"][2][i]) do
			SysCastSpellLv( OwnerID() , Global_Zone20_Steelwar["Monster"][2][i][m] , 496266,0 );
			table.insert(KillList,Global_Zone20_Steelwar["Monster"][2][i][m]);
			--Say(Global_Zone20_Steelwar["Monster"][2][i][m],"be hat");
		end
	elseif p == 2 then
		Npcsay(OwnerID(),"[SC_118365_8]");
		for m=1,table.getn(Global_Zone20_Steelwar["Monster"][1][i]) do
			SysCastSpellLv( OwnerID() , Global_Zone20_Steelwar["Monster"][1][i][m] , 496266,0 );
			table.insert(KillList,Global_Zone20_Steelwar["Monster"][1][i][m]);
			--Say(Global_Zone20_Steelwar["Monster"][1][i][m],"be hat");
		end
	end
	table.sort(KillList,Lua_Zone20_SteelwarKillqueue);--���s�ƦC�����W��
	NowKillID = KillList[1];
	LockHP( OwnerID() , 7000 , "Lua_Zone20_Steelwar_MR" );

	while 1 do
	--[[	local Hate = ks_getHateList(OwnerID());
		if Hate[1] ~= nil then
			Say(OwnerID(), "Hate = "..Hate[1]);
		end]]
		for i =1,table.getn(KillList) do
			local XTT = ReadRoleValue(KillList[i],EM_RoleValue_HP)
			--Say(OwnerID(), "XTT = "..XTT );
			if XTT <=7000 then
			--	Say(KillList[i], "I will Remove" );
				table.remove(KillList,i);
				break;
			end
		end
		local ShouldChange = 1;--�ˬd�{�b�����ؼЬO�_�٦b�W�椺
		--DebugMsg( 0 , 0 , "$$KillList$$===================");
		for m=1,table.getn(KillList) do
			SysCastSpellLv( OwnerID() , KillList[m] , 496266,0 );
		--	DebugMsg( 0 , 0 , "$$KillList ["..m.."] = "..KillList[m]);
			if NowKillID == KillList[m] then
				ShouldChange = 0;--�b�W�椺��ܤ��δ��ؼ�
			end
		end
		--�L�ؼЩΥؼп��~(���i����)
		--Say(OwnerID(), "ShouldChange = "..ShouldChange );
		if CheckID(NowKillID )==false or ShouldChange == 1 or ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= NowKillID then
			for i =1,table.getn(KillList) do
				if CheckID(KillList[i]) == true then
						SetAttack(OwnerID(),KillList[i]);
						NowKillID = KillList[i];
					--	Say(NowKillID, "Next Target is Me " );
						break;
				else
					table.remove(KillList,i);
					break;
				end
			end
		end
	Sleep(20);
	end
end
function Lua_Zone20_Steelwar_MR()
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	LockHP( OwnerID() , 7000 , "" );
	SetModeEx( OwnerID()  , EM_SetModeType_Fight , false );--�i�������
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false );--����
	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false );--����
	local party,inn;
	--�N�ۤv�����԰��W��
	for i,v in ipairs(Global_Zone20_Steelwar["Monster"]) do
		for j,w in ipairs(v) do
			for k,x in ipairs(w) do
				if OwnerID() == x then
					party=i;
					inn=j;
				end			
			end
		end
	end


 	--	for j=1,table.getn(Global_Zone20_Steelwar["Monster"]) do
 	--		for k=1,table.getn(Global_Zone20_Steelwar["Monster"][j]) do
 	--			for m=1,table.getn(Global_Zone20_Steelwar["Monster"][j][k]) do
 	--				if OwnerID() == Global_Zone20_Steelwar["Monster"][j][k][m] then
 	--					party=j;
 	--					inn=k;
 	--				end
 	--			end
 	--		end
 	--	end
	if Global_Zone20_Steelwar["Fighter"][party][inn] ~= nil then
		if Global_Zone20_Steelwar["Fighter"][party][inn] > 0 then
			Global_Zone20_Steelwar["Fighter"][party][inn] = Global_Zone20_Steelwar["Fighter"][party][inn] -1;
		else
			DebugMsg( 0 , 0 , "####ERROR!!! ...Plz Call the Programer!!!!!!!!!");
		end
	else
		DebugMsg( 0 , 0 , "party = "..party.." inn = "..inn );
		DebugMsg( 0 , 0 , "####ERROR!!! ...Plz Call the Programer!!!!!!!!!");
	end
	Lua_CancelAllBuff( OwnerID() ); --�M���Ҧ�buff
	ClearHateList( OwnerID() , -1 );	--�M������C��
	SetModeEx(  OwnerID(), EM_SetModeType_ShowRoleHead, false );--�Y����
	SetRoleCamp( OwnerID() ,"Visitor" );
	Lua_Zone20_SteelwarSetStopAttack(OwnerID(),RoomID);
	CallPlot(OwnerID(),"Lua_Zone20_Steelwar_MRB",party,inn)
end
function Lua_Zone20_Steelwar_MRB(party,inn)
	local OOID = ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) 
	if OOID == 118353  or OOID == 118356 then
		BeginPlot(OwnerID(),"Lua_Zone20_Steelwar_StartBomb",0);
		Sleep(20);
		DelObj(OwnerID());
	else
		if party==1 then
			Npcsay(OwnerID(),"[SC_118365_9]");
		else
			Npcsay(OwnerID(),"[SC_118365_10]");
		end
		--�}�l�k�]!!
		DW_WaitMoveTo( OwnerID() , Global_Zone20_Steelwar["RetreatFlag"][party][inn][1], Global_Zone20_Steelwar["RetreatFlag"][party][inn][2], Global_Zone20_Steelwar["RetreatFlag"][party][inn][3]);
		DelObj(OwnerID());
	end
end
function Lua_Zone20_SteelwarSetStopAttack(ObjID,RoomID)
	SetModeEx( ObjID , EM_SetModeType_Strikback , false );	-- ����
	SetModeEx( ObjID , EM_SetModeType_Searchenemy , false );	-- ����
	SetModeEx( ObjID , EM_SetModeType_Fight , false );		-- �i�������
	SetStopAttack( ObjID );
	WriteRoleValue( ObjID , EM_RoleValue_IsAttackMode , 0 );
	Hide( ObjID );
	Show( ObjID , RoomID );
end
function Lua_Zone20_Steelwar_ReSet()
	local MonsterGroupID = {100292,118351,118352,118353,118354,118355,118356,118365,118366,118717,118730};
	Lua_DavisDelObj( MonsterGroupID );
end
function Lua_Zone20_Steelwar_ReSetSituation()
	local List = {	Global_Zone20_Steelwar["MonsterKing"],
			Global_Zone20_Steelwar["Monster"],
			Global_Zone20_Steelwar["lazyNPC"]}
	for l,m in ipairs(List) do
		for i,v in ipairs(m) do
			if  type (v) == "table" then
				for j,k in ipairs( v) do
					if  type (k) == "table" then
						for x,n in ipairs( k) do
							DelObj(n);		
						end
					else
						DelObj(k);
					end
				end
			else
				DelObj(v);
			end
		end
	end
--	local MonsterGroupID = {118365,118366,118717,118730};
--	Lua_DavisDelObj( MonsterGroupID );
end
function Lua_Zone20_Steelwar_RetreatAll()
	if Global_Zone20_Steelwar["State"] == "Retreat" then
		--�}�l�M�h
		for p =1,2 do
			for i=1,table.getn(Global_Zone20_Steelwar["Monster"][p]) do
				for m=1,table.getn(Global_Zone20_Steelwar["Monster"][p][i]) do
					if CheckID(Global_Zone20_Steelwar["Monster"][p][i][m]) == true then
						CallPlot(Global_Zone20_Steelwar["Monster"][p][i][m],"Lua_Zone20_Steelwar_RetreatScript",p,i);
					end
				end
			end
		end
	end
end
function Lua_Zone20_Steelwar_RetreatScript(p,i)
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	Lua_CancelAllBuff( OwnerID() ); --�M���Ҧ�buff
	ClearHateList( OwnerID() , -1 );	--�M������C��
	SetModeEx(  OwnerID(), EM_SetModeType_ShowRoleHead, false );--�Y����
	SetRoleCamp( OwnerID() ,"Visitor" );
	Lua_Zone20_SteelwarSetStopAttack(OwnerID(),RoomID);
	DW_WaitMoveTo( OwnerID() , Global_Zone20_Steelwar["RetreatFlag"][p][i][1], Global_Zone20_Steelwar["RetreatFlag"][p][i][2], Global_Zone20_Steelwar["RetreatFlag"][p][i][3]);
	DelObj(OwnerID());
end

function Lua_Zone20_Steelwar_StartBomb()
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	local XX = CreateObjByObj( 118457, OwnerID() );
	SetModeEx(  XX, EM_SetModeType_ShowRoleHead, false );--�Y����
	SetModeEx(  XX, EM_SetModeType_Mark, false );	--�аO
	Lua_Zone20_SteelwarSetStopAttack(XX,RoomID);
	SysCastSpellLv( XX  , XX , 497724,1 );
	WriteRoleValue(XX,EM_RoleValue_LiveTime,2);
end

function Lua_Zone20_Steelwar_lazyNPC(Chose)
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	local lazyNPC = {};
	lazyNPC[1] = {};
	lazyNPC[2] = {};
	local MoID = {118717,118730}
	local FlagTT = {780968,780970,780972}
	for i = 1, 2 do
		Global_Zone20_Steelwar["lazyNPC"][i] = {};
		for k = 1, GetMoveFlagCount ( FlagTT[Chose]+i )do
			lazyNPC[i][k] = CreateObjByFlag( MoID[i] , FlagTT[Chose]+i , k-1 , 1 );
			AddToPartition(lazyNPC[i][k],RoomID);
			Global_Zone20_Steelwar["lazyNPC"][i][k] = lazyNPC[i][k];
			CallPlot(lazyNPC[i][k],"Lua_Zone20_Steelwar_lazyAc",i);--NPC����+�u�@
		end
	end
end
function Lua_Zone20_Steelwar_lazyAc(i)
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X);
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y);
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z);   ---------�o���O���XAttackplayer���������ӤH���y��
	local EM = {}
	EM[1] = {ruFUSION_ACTORSTATE_EMOTE_TIRED,ruFUSION_ACTORSTATE_EMOTE_CRY,ruFUSION_MIME_EMOTE_BEG,ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_MIME_EMOTE_BEG,ruFUSION_MIME_EMOTE_BEG,ruFUSION_MIME_EMOTE_BEG,ruFUSION_MIME_EMOTE_BEG,ruFUSION_MIME_EMOTE_BEG,ruFUSION_MIME_EMOTE_BEG};
	EM[2] = {ruFUSION_ACTORSTATE_EMOTE_TIRED,ruFUSION_ACTORSTATE_EMOTE_CRY,ruFUSION_ACTORSTATE_MINING_LOOP,ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_MINING_LOOP,ruFUSION_ACTORSTATE_MINING_LOOP,ruFUSION_ACTORSTATE_MINING_LOOP,ruFUSION_ACTORSTATE_MINING_LOOP,ruFUSION_ACTORSTATE_MINING_LOOP,ruFUSION_ACTORSTATE_MINING_LOOP};
	while 1 do
		WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1);
		lua_DavisRandMove(OwnerID(),X,Y,Z,30);  --50 �C�����ʶZ��
		Sleep(50);   ---�C������ɶ�(�@�몬�p)
		local XX = Rand(table.getn(EM[i]))+1;
		--Say(OwnerID(),"XX = "..XX);
		PlayMotion(OwnerID(),EM[i][XX]);
		Sleep(100+Rand(100));
	end
end