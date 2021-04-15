function Lua_Zone22_Requiem_SkillLvInfo(Lv)
	if Lv==0 then--普通版
		local SkillLv = {	8,		--單體技能
				2500,		--範圍技能
				11,		--大絕
				149,		--全場傷害
				9,		--物理小怪大絕
				9,		--魔法小怪大絕
				30,		--小怪A1
				399,		--小怪A2
				399,		--小怪B1
				399,		--小怪B2
				0}		--小怪跟王靠近增強BUFF
		local SkillList = {498154,	--單體技能
				498155,	--範圍技能
				498156,	--大絕
				498157,	--全場傷害
				498158,	--物理小怪大絕
				498159,	--魔法小怪大絕
				498160,	--小怪A1--物理單體
				498162,	--小怪A2--魔法單體
				498161,	--小怪B1--物理範圍
				498163,	--小怪B2--魔法範圍
				620623}	--小怪跟王靠近增強BUFF
		local MonID = {105935,	--王
				105936,	--哀嚎至死的厲鬼
				105937,	--羞愧自盡的怨靈
				105938}	--靈魂集合體
		return SkillLv,SkillList,MonID;
	elseif Lv == 1 then--簡單版
		local SkillLv = {	6,		--單體技能
				500,		--範圍技能
				5,		--大絕
				49,		--全場傷害
				3,		--物理小怪大絕
				3,		--魔法小怪大絕
				20,		--小怪A1
				199,		--小怪A2
				99,		--小怪B1
				99,		--小怪B2
				0}		--小怪跟王靠近增強BUFF
		local SkillList = {498154,	--單體技能
				498155,	--範圍技能
				498156,	--大絕
				498365,	--全場傷害
				498158,	--物理小怪大絕
				498159,	--魔法小怪大絕
				498366,	--小怪A1--物理單體
				498162,	--小怪A2--魔法單體
				498161,	--小怪B1--物理範圍
				498163,	--小怪B2--魔法範圍
				620623}	--小怪跟王靠近增強BUFF
		local MonID = {106206,	--王
				106207,	--哀嚎至死的厲鬼
				106208,	--羞愧自盡的怨靈
				106209}	--靈魂集合體
		return SkillLv,SkillList,MonID;
	end
end
function Lua_Zone22_Requiem_Main()--中控器(普通版PID=>0,簡單版PID=>1)
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local PID = ReadRoleValue(OID,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	--宣告所有全域變數
	if Lua_Requiem_Globel==nil then
		Lua_Requiem_Globel={};
	end
	if Lua_Requiem_Globel[RoomID]~= nil then
		Lua_Zone22_Requiem_ResetAll();
		--重置所有全域變數
		Lua_Requiem_Globel[RoomID]={GUID=0,Step="Reset",Mob={},Door={},QQ={}};
		local trash = {103126,MonID[1],MonID[2],MonID[3],MonID[4]};                 --2013/3/14修正玩家回報Boss消失時修改刪除
		Lua_DavisDelObj( trash );
		Lua_Zone22_Requiem_Door();
	else
		Lua_Requiem_Globel[RoomID]={GUID=0,Step="Reset",Mob={},Door={},QQ={}};
		Lua_Zone22_Requiem_Door();
	end
	local Globel =Lua_Requiem_Globel[RoomID];
	Globel.Ctrl = OID;
	local Distane = 270;
	local Boss = CreateObjByFlag ( MonID[1] , 780991, 0 ,1 );
	SetPlot(Boss,"dead","Lua_Zone22_Requiem_Dead",0)
	SetFightMode (  Boss  , 0, 0, 0, 0 );
	AddBuff(Boss,507899,0,-1);--不可攻擊BUFF
	AddToPartition(Boss,RoomID);
	Globel.GUID = Boss;
	--BeginPlot(OID,"Lua_Zone22_Requiem_Door",0);
	local Fight;
	local Dis = 0;
	local FlagCount = GetMoveFlagCount ( 780992 );--屍體位置的旗標
	local Msg = "";
	local NewMsg = "";
	while 1 do
		Boss = Globel.GUID;
		Fight = ReadRoleValue(Boss,EM_RoleValue_Register1);
		if Globel.Step == "Dead" then--王趴ㄌ
			if Globel.Mob~=nil then
				for i,v in pairs(Globel.Mob)do DelObj(v) end;--刪掉血
			end
			if Globel.QQ~=nil then
				for i,v in pairs(Globel.QQ)do DelObj(v) end;--刪掉血
			end
			break;
		else
			NewMsg = "QQ .."..table.getn(Globel.QQ).." Fight = "..Fight.." Step = "..Globel.Step
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
			if Fight ==0 then
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_LOOP )
			end
			if Globel.Step == "Reset" then--重置
				DelObj(Boss);--刪掉BOSS
				-- 重設NPC資料	
				Sleep( 50 );
				-- 重新加入分割區
				local PP = Lua_Table_GetRdIndex(FlagCount,5);
					Globel.QQ = Lua_Requiem_BornByFlagGroup(MonID[4],780992,PP,RoomID);
				for i,v in pairs(Globel.QQ) do
					SetPlot(v,"dead","Lua_Zone22_Requiem_QQ_dead",0)
					BeginPlot(v,"Lua_Zone22_Requiem_QQ_Move",0);
				end
				Boss = CreateObjByFlag ( MonID[1] , 780991, 0 ,1 );
				SetPlot(Boss,"dead","Lua_Zone22_Requiem_Dead",0)
				AddToPartition(Boss,RoomID);
				Globel.GUID = Boss;
				SetFightMode (  Boss  , 0, 0, 0, 0 );
				AddBuff(Boss,507899,0,-1);--不可攻擊BUFF
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_BEGIN )
				Globel.Step = "Nomal";
			end
			Dis = kg_GetDis(Boss,780991,0);
			if table.getn(Globel.QQ)==0 and Fight == 0 then--鬼魂被全殺
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_END)
				SetFightMode (  Boss  , 1, 1, 1, 1 );
				CancelBuff (Boss,507899);--不可攻擊BUFF
			end
			if Dis >=Distane then
				DebugMsg( 0, RoomID ,"TOO FAR");
				KS_ScriptMessage("[SC_REQUIEM_BOSS_TOOFAR]");
				Lua_Zone22_Requiem_ResetAll();
				CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
			--	DelObj(Boss);--刪除BOSS
			--	Boss = CreateObjByFlag ( 105935 , 780991, 0 ,1 );
			--	AddToPartition(Boss,RoomID);
			--	Globel.GUID = Boss;
			--	DelFromPartition( Globel.Door[2]);
			end
		end
		Sleep(10);
	end


end
function Lua_Zone22_Requiem_QQ_Move()
	local OID = OwnerID();
	local X = ReadRoleValue ( OID, EM_RoleValue_X);
	local Y = ReadRoleValue ( OID, EM_RoleValue_Y);
	local Z = ReadRoleValue ( OID, EM_RoleValue_Z);   ---------這里是捉出Attackplayer里面的那個人的座標
	local AttackTarget = 0;
	MoveToFlagEnabled(OID,false);
	while 1 do
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if AttackTarget ~=0 then
		else
			lua_DavisRandMove(OID,X,Y,Z,50);  --50 每次移動距離
		end
		Sleep(50+Rand(100));
	end
end
function Lua_Zone22_Requiem_QQ_dead()
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID];
	for i,v in pairs(Globel.QQ) do
		if OID==v then
			table.remove(Globel.QQ,i);
			break;
		end
	end
	DelObj(OID);
end
function Lua_Zone22_Requiem_Door()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local ExitDoor = {}
	local Globel = Lua_Requiem_Globel[RoomID];
	for i=1,2 do
		if Globel.Door[i] == nil then
			ExitDoor[i] = CreateObjByFlag( 106223, 780991 , i , 1 )--出口阻擋門
			DebugMsg( 0, RoomID ,"nil Door lllll..."..i.." ID = "..ExitDoor[i]);
			Globel.Door = {ExitDoor[1],ExitDoor[2]}
			kg_DoorInit( ExitDoor[i] );
			AddToPartition( ExitDoor[i] , RoomID );
		end
	end
	CallPlot( Globel.Door[1], "Lua_Zone22_Boss1_CloseDoor", true,Globel.GUID )
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	return ExitDoor;
end
function Lua_Zone22_Requiem_ResetObj()--重置物件劇情
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local Globel =Lua_Requiem_Globel[RoomID]
	if Globel.Mob~=nil then
		for i,v in pairs(Globel.Mob)do DelObj(v) end;--刪掉血
	end
	if Globel.QQ~=nil then
		for i,v in pairs(Globel.QQ)do DelObj(v) end;--刪掉血
	end
	if BOSS~=nil then
		if Globel.Step ~= "Dead" then
			Globel.Step = "Reset";
			--DebugMsg( 0, RoomID ,"isDead = false");
		else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Zone22_Requiem_Event_BeginAttack()--進入戰鬥事件
	local BOSS = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID]
	WriteRoleValue(BOSS,EM_RoleValue_Register1,1) --開始戰鬥
	MoveToFlagEnabled(BOSS,false);
	AddBuff(BOSS,506700,0,-1);
	BeginPlot(BOSS,"Lua_Zone22_Requiem_Fight_Ai",0);
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", true,Globel.GUID )
end
function Lua_Zone22_Requiem_Event_EndAttack()--離開戰鬥事件
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	--DebugMsg( 0, RoomID ,"Now leave Fight...");
	local TempPlayer = SetSearchAllPlayer(RoomID) --取現在該區內的所有玩家
	local ThesePlayer = {}
	local BuffID = {620621,620618,620624,621588,621589}
	local Globel =Lua_Requiem_Globel[RoomID]
	MagicInterrupt( Boss );
	WriteRoleValue(Boss,EM_RoleValue_Register1,0); --離開戰鬥
	--DelFromPartition( Globel.Door[2])
	CancelBuff(Boss,506700)--清BUFF
--	DebugMsg( 0, RoomID ,"Now leave Fight...");
	if Globel.Step ~= "Dead" then
		KS_ScriptMessage( "[SC_REQUIEM_ALLDEAD]" )--滅團
	end
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		for j,v in ipairs(BuffID) do
			CancelBuff(ThesePlayer[i],BuffID[j])--清BUFF
		end
	end
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	BeginPlot(Globel.Ctrl,"Lua_Zone22_Requiem_ResetObj",0);
end
function Lua_Zone22_Requiem_ResetAll()
	Lua_Zone22_Requiem_ResetObj();
end
function Lua_Zone22_Requiem_Dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID]
	KS_ScriptMessage( "[SC_REQUIEM_DEAD]" )--王死
	Globel.Step = "Dead";
	CallPlot( Globel.Door[1], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	DelFromPartition( Globel.Door[1])
	return true;
end
function Lua_Zone22_Requiem_Fight_Ai()
	local BOSS = OwnerID();
	KS_ScriptMessage("[SC_REQUIEM_START]");--開始戰鬥
	local RoomID= ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	WriteRoleValue (BOSS,EM_RoleValue_Register2,0);--重新計算
	local FightState = 1;
	local Clock = {0,0,1};
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	local CrazyTime = 360;
	local Crazy = false;
	local HatePlayer = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local FlagCount = GetMoveFlagCount ( 780992 );--屍體位置的旗標
	Globel.Step="Nomal";
	local Msg = "";
	local NewMsg = "";
	while FightState == 1 do
		HatePlayer = KS_GetHateList( Boss, 3 );
		FightState = ReadRoleValue(BOSS,EM_RoleValue_Register1);		--是否戰鬥中
		AttackTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID );
		HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
		NewMsg = "##FightState = "..FightState.." it's "..Globel.Step.." mode.";
		if Globel.Step ~= "Reset" then
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
				if Clock[1]>=10 and Globel.Step=="Nomal" then--第一次生小怪
					BeginPlot(BOSS,"Lua_Zone22_Requiem_Born",0);
					Clock[1]=1;
					Globel.Step="ACT2"
				elseif Clock[1]>=29 and Globel.Step=="ACT2" then--吃小怪
					KS_ScriptMessage("[SC_REQUIEM_EAT]");
					for i,v in pairs(Globel.Mob) do
						DebugMsg( 0, RoomID ,"Now Eat..."..v);
						sysCastSpellLv( BOSS , v  , 498164, 0);
					end
					BeginPlot(BOSS,"Lua_Zone22_Requiem_Born",20);
					Clock[1]=0;
				end

				if Clock[2]>=20 then--大絕
					local XXXX = 1;
					KS_ScriptMessage("[SC_REQUIEM_SPP]");
					MagicInterrupt( BOSS );
					local RR = Rand(table.getn(HatePlayer))+1
					if Globel.Mob[10]~=nil then
						if checkID(Globel.Mob[10])==true then 
							MagicInterrupt( Globel.Mob[10] );
							XXXX=XXXX+2
						end
					end
					if Globel.Mob[20]~=nil then
						if checkID(Globel.Mob[20])==true then 
							MagicInterrupt( Globel.Mob[20] );
							XXXX=XXXX+3
						end
					end
					--DebugMsg( 0, RoomID ,"X= "..XXXX.." Globel.Mob1 = "..Globel.Mob[1].." Globel.Mob2 = "..Globel.Mob[2]);
					Sleep(10)
					CastSpellLv( BOSS , BOSS  , SkillList[3], SkillLv[3]);--BOSS
					if XXXX%3==0 then
						if Globel.Mob[10]~=nil then
							if checkID(Globel.Mob[10])==true then 
								CastSpellLv( Globel.Mob[10] , HatePlayer[RR]  , SkillList[5], SkillLv[5]);--物理 
							end
						end
					end
					if XXXX%6==0 or  XXXX%4==0 then
						if Globel.Mob[20]~=nil then
							if checkID(Globel.Mob[20])==true then
								CastSpellLv( Globel.Mob[20] , Globel.Mob[20]  , SkillList[6], SkillLv[6]);--魔法
							end
						end
					end
					BeginPlot(BOSS,"Lua_Zone22_Requiem_AAE",30);
					Clock[2]=0;
				end
			NowCastSpell = ReadRoleValue( BOSS , EM_RoleValue_SpellMagicID );
			if NowCastSpell == 0  then
				local XR = Rand(2)+1;
				if Clock[3]%7==0 then--普通技能
					if XR == 1 then
						CastSpellLv( BOSS , AttackTarget  , SkillList[1], SkillLv[1]);
					else
						local HatePlayerFa= {};--超過一百五的名單
						local HateDis = KS_GetHateList( Boss, 2 );--仇恨表內玩家距離
						for i,v in pairs(HateDis) do
							if v>=150 then
								table.insert( HatePlayerFa,HatePlayer[i]);
							end
						end
						if table.getn(HatePlayerFa) >0 then
							local RR = Rand(table.getn(HatePlayerFa))+1
							CastSpellLv( BOSS , HatePlayerFa[RR]  , SkillList[2], SkillLv[2]);
						else
							local RR = Rand(table.getn(HatePlayer))+1
							CastSpellLv( BOSS , HatePlayer[RR]  , SkillList[2], SkillLv[2]);
						end
					end
				end
			else
				--DebugMsg( 0, RoomID ,"Now Casting...");
			end
			if Clock[3]>=CrazyTime and Crazy == false and PID == 0 then
				KS_ScriptMessage("[SC_REQUIEM_RUSH]");
				AddBuff(BOSS,620561,0,-1);
				Crazy = true;
			end
			for i ,v in ipairs(Clock) do
				Clock[i] = Clock[i] + 1;
			--	DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
			end;
		else
			break;
		end
		Sleep(10);
	end;
--	BeginPlot(BOSS,"Lua_Zone22_Requiem_ResetObj",0)
end
function Lua_Zone22_Requiem_MM_dead()
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID];
	for i,v in pairs(Globel.Mob) do
		--Say(OID,"OID= "..OID.." v ="..v);
		if OID==v then
			--Say(OID,"#OID= "..OID.." v ="..v);
			--table.remove(Globel.Mob,i);
			Globel.Mob[i]=nil;
			break;
		end
	end
	DelObj(OID);
	--return true;
end
function Lua_Zone22_Requiem_Eat()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local TID = TargetID();
	local Globel =Lua_Requiem_Globel[RoomID]
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	local TOID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
	--Say(OwnerID(),"BOSS= "..BOSS.." TID ="..TID);
	--Say(TID,"I Will Be Eat MyID = "..TOID);
	if TID ~= BOSS then
		if TOID == MonID[2] then
			if HPP>0.5 then
				AddBuff(BOSS,620625,0,-1);
			else	
				AddBuff(BOSS,620627,0,-1);
			end
		elseif TOID == MonID[3]  then
			if HPP>0.5 then
				AddBuff(BOSS,620626,0,-1);
			else
				AddBuff(BOSS,620628,0,-1);
			end
		end
		KillID(BOSS,TID);
	else
		--Say(BOSS,"Something Wrong....!!");
	end
end
function Lua_Zone22_Requiem_MM_Ai()--小怪Ai
	local OID = OwnerID();
	SetPlot(OID,"dead","Lua_Zone22_Requiem_MM_dead",0)
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local X = ReadRoleValue ( OID, EM_RoleValue_X);
	local Y = ReadRoleValue ( OID, EM_RoleValue_Y);
	local Z = ReadRoleValue ( OID, EM_RoleValue_Z);   ---------這里是捉出Attackplayer里面的那個人的座標
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID);
	local AttackTarget = 0;
	local Clock = 1;
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	MoveToFlagEnabled(OID,false);
	local HatePlayer = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	while 1 do
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if AttackTarget ~=0 then--戰鬥中
			 local Dis = kg_GetDis( OID , BOSS);
			if Dis < 100 and Clock%3==0 and Clock > 3 then
				AddBuff(OID,SkillList[11],SkillLv[11],-1);
				AddBuff(BOSS,SkillList[11],SkillLv[11],-1);
			end
			if Clock%7 ==0 then
				CastSpellLv( OID , AttackTarget  , SkillList[OrgID-MonID[1]+6], SkillLv[OrgID-MonID[1]+6]);
			elseif Clock%13 ==0 then
				CastSpellLv( OID , OID  , SkillList[OrgID-MonID[1]+8], SkillLv[OrgID-MonID[1]+8]);
			end
		else
			if Clock%5 ==0 then
				lua_DavisRandMove(OID,X,Y,Z,50);  --50 每次移動距離
			end
		end
		Clock = Clock +1;
		Sleep(10);
	end
end
function Lua_Zone22_Requiem_Born()
	local FlagCount = GetMoveFlagCount ( 780992 );--屍體位置的旗標
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	KS_ScriptMessage("[SC_REQUIEM_ADD]");
	local PP = Lua_Table_GetRdIndex(FlagCount,2);
	for i=1,2 do
		local BuffID = 620614+i*3
		Globel.Mob[i*10] = CreateObjByFlag ( MonID[1]+i , 780992, PP[i]-1 ,1 );--因為remove的規則所以INDEX*10
		AddToPartition(Globel.Mob[i*10],RoomID);
		AddBuff(Globel.Mob[i*10],BuffID,0,-1)
		BeginPlot(Globel.Mob[i*10],"Lua_Zone22_Requiem_MM_Ai",0);
	end
end
function Lua_Zone22_Requiem_AAE()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	KS_ScriptMessage("[SC_REQUIEM_BOMB]");
	sysCastSpellLv( BOSS , BOSS  , SkillList[4], SkillLv[4]);
end
function Lua_Requiem_BornByFlagGroup(ObjID,FlagID,FlagGroup,RoomID)
	local ObjGroup = {}
	local ss = Lua_Table_GetRdIndex(5,3);
	for i,v in pairs(FlagGroup) do
	--	DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
		ObjGroup[i] = CreateObjByFlag( ObjID , FlagID , v-1 , 1 )
		SetModeEx(  ObjGroup[i]  , EM_SetModeType_NotShowHPMP, true )
		AddToPartition(ObjGroup[i],RoomID)
	end
	return ObjGroup
end