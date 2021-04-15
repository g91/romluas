--Modifier : K.J. Aris
--Version : 131128
--NPC 105893



function Lua_Zone21_BeastLord_SkillLvInfo()
	local SkillLv = {	0,		--塔干哈諾飛掌
			0,		--獸王靈血
			0,		--塔干哈諾之擒
			0,		--塔干哈諾之噬
			0}		--塔干哈諾之怒
	return SkillLv;
end
function Lua_Zone21_BeastLord_SkillInfo()
	local SkillList = {	498105,	--塔干哈諾飛掌
			498106,	--獸王靈血
			498107,	--塔干哈諾之擒
			498110,	--塔干哈諾之噬
			498108}	--塔干哈諾之怒
	return SkillList;
end
function Lua_Zone21_BeastLord_Event_BeginAttack()--進入戰鬥事件
	Lua_DW_WBGUIDRecord(1)
	Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1) --開始戰鬥
	MoveToFlagEnabled(OwnerID(),false);
	AddBuff(OwnerID(),506700,0,-1);
	BeginPlot(OwnerID(),"Lua_Zone21_BeastLord_Fight_Ai",0);	
end
function Lua_Zone21_BeastLord_Event_EndAttack()--離開戰鬥事件
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	--DebugMsg( 0, RoomID ,"Now leave Fight...");
	local BOSS = Lua_BeastLord_Globel.GUID;
	if ReadRoleValue(BOSS,EM_RoleValue_IsDead)==0 then
		local npc=ReadRoleValue(BOSS,EM_RoleValue_Register9);
		WriteRoleValue(npc,EM_RoleValue_Register9,0);
		DisableQuest(npc,false)
	end
	Lua_Zone21_BeastLord_ResetAll();
end
function Lua_Zone21_BeastLord_ResetAll()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	WriteRoleValue(BOSS,EM_RoleValue_Register1,0); --離開戰鬥
	BeginPlot(BOSS,"Lua_Zone21_BeastLord_ResetObj",0);
end
function Lua_Zone21_BeastLord_Create()--物件產生劇情
	Lua_DW_WBGUIDRecord(1)
	local Boss = OwnerID();
	local RoomID= ReadRoleValue(Boss,EM_RoleValue_RoomID);
	SetModeEx( Boss  , EM_SetModeType_Move, false );--移動
	--宣告所有全域變數
	if Lua_BeastLord_Globel==nil then
		Lua_BeastLord_Globel={};
		Lua_BeastLord_Globel={GUID=Boss,Step="Nomal",Blood={},Percent=95,Angry=0,SkillQueue={},Revive=1,ReviveXX=0};
	else
		Lua_Zone21_BeastLord_ResetObj();
		--重置所有全域變數
		Lua_BeastLord_Globel={GUID=Boss,Step="Nomal",Blood={},Percent=95,Angry=0,SkillQueue={},Revive=1,ReviveXX=0};
	end
end
function Lua_Zone21_BeastLord_ResetObj()--重置物件劇情
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	local Globel =Lua_BeastLord_Globel
	if Lua_BeastLord_Globel.Blood~=nil then
		for i,v in ipairs(Lua_BeastLord_Globel.Blood)do DelObj(v) end;--刪掉血
	end
	if BOSS~=nil then
		if Globel.Step ~= "Dead" then
			--DebugMsg( 0, RoomID ,"isDead = false");
			DelObj(BOSS);--刪掉王
		else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Zone21_BeastLord_Dead()
	local Globel =Lua_BeastLord_Globel
	Globel.Step = "Dead";
	Globel.Revive = 0;
	Lua_SetClockPlot(288000,"Lua_Zone21_BeastLord_Revive")
--讓物件記錄世界王再次重生的時間，還有重生的對象
	DeBugMSG(0,0,"Next will be "..Lua_Z21_WorldBoss_ResetTime(OwnerID()))
	return true;
end
function Lua_SetClockPlot(Time,Sctipt)
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(OwnerID());
	local XX = CreateObj(121381,x,y,z,dir,1);
	local Globel =Lua_BeastLord_Globel;
	Globel.ReviveXX = XX;
	SetModeEx(  XX, EM_SetModeType_Show, false );--顯示
	SetModeEx( XX  , EM_SetModeType_Strikback, false );--反擊
	SetModeEx( XX  , EM_SetModeType_SearchenemyIgnore, false );--被搜尋
	SetModeEx( XX  , EM_SetModeType_Obstruct, false );--阻擋
	SetModeEx( XX  , EM_SetModeType_Mark, false );--標記
	SetModeEx( XX  , EM_SetModeType_Move, false );--移動
	SetModeEx( XX  , EM_SetModeType_Searchenemy, false );--索敵
	SetModeEx( XX  , EM_SetModeType_ShowRoleHead, false );--頭像框
	SetModeEx( XX  , EM_SetModeType_Fight , false );--可砍殺攻擊
	SetModeEx( XX  , EM_SetModeType_NotShowHPMP, true )
	AddToPartition(XX,RoomID);
	BeginPlot(XX,Sctipt,Time);
end
function Lua_Zone21_BeastLord_Revive()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel;
	Globel.Revive = 1;
	DebugMsg( 0, RoomID ,"BOSS can Revive");
	DelObj(OwnerID());
end
function Lua_Zone21_BeastLord_GoRevive()
	local Globel =Lua_BeastLord_Globel;
	Globel.Revive = 1;
	DelObj(Globel.ReviveXX);
	Globel.ReviveXX = 0;
end
function Lua_Zone21_BeastLord_Fight_Ai()--戰鬥AI
	local BOSS = OwnerID();
	local RoomID= ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel
	local SkillList = Lua_Zone21_BeastLord_SkillInfo();
	local SkillLv = Lua_Zone21_BeastLord_SkillLvInfo();
	local FightState = 1;
	local BloodCount = 0
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local AngryTime = 1;
	local Clock = 1;
	local MaxHP = ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
	--local HatePlayer = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local HatePlayer = KS_GetHateList( Boss, 1 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)	--K.J. Aris 101128
	SetPlot(BOSS,"dead","Lua_Zone21_BeastLord_Dead",0)
	LockHP( BOSS , MaxHP/100*Globel.Percent , "Lua_Zone21_BeastLord_Blood" );
	while FightState == 1 do
		FightState = ReadRoleValue(BOSS,EM_RoleValue_Register1);		--是否戰鬥中
		BloodCount = table.getn(Globel.Blood);
		AttackTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID );
		NowCastSpell = ReadRoleValue( BOSS , EM_RoleValue_SpellMagicID );
		HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
		--HatePlayer = KS_GetHateList( Boss, 3 );
		HatePlayer = KS_GetHateList( Boss, 1 );--K.J. Aris 101128
	--	DebugMsg( 0, RoomID ,"FightState = "..FightState.." BloodCount = "..BloodCount.." it's "..Globel.Step.." Percent ="..Globel.Percent.." Angry = "..Globel.Angry);

		if NowCastSpell == 0  then--如果沒有施法，繼續AI
			if BloodCount < 4 and Globel.Step == "Invincible" then
				CancelBuff(BOSS,620552);
				--取消無敵
				Globel.Step = "Nomal";
			elseif BloodCount >= 4 and Globel.Step == "Nomal" then
				AddBuff(BOSS,620552,0,-1);
				KS_ScriptMessage("[SC_BEASTLORD_5]")
				Globel.Step ="Invincible";
				--王上無敵
			end
			--塔干哈諾之怒加入技能排程
			if AngryTime%27 == 0 then
				table.insert(Globel.SkillQueue,{BOSS,SkillList[5],SkillLv[5],"[SC_BEASTLORD_4]"})
			end
			if table.getn(Globel.SkillQueue)>0 then
			--如果SkillQueue內有技能就放SkillQueue內的技能
		--		DebugMsg( 0, RoomID ,"SkillQueue = "..table.getn(Globel.SkillQueue));
				for i,v in ipairs(Globel.SkillQueue) do
					if CheckID(v[1]) == true and ReadRoleValue(v[1],EM_RoleValue_IsDead) == 0  then
			--			DebugMsg( 0, RoomID ," v[1] = ".. v[1].." v[2] = ".. v[2].." v[3] = ".. v[3]);
						CastSpellLv( BOSS , v[1]  , v[2], v[3]);
						KS_ScriptMessage(v[4]);
					end
					table.remove(Globel.SkillQueue,i);
					break;
				end
			else
			--如果SkillQueue內沒技能就放一般技能
				if GetDistance(BOSS,AttackTarget)>70 then--假如最高仇恨有無在攻擊範圍內
					--DebugMsg( 0, RoomID ,"NomalSkill");
					local RAT = HatePlayer[Rand(table.getn(HatePlayer))+1]
					if ( RAT ~= nil ) then
						CastSpellLv( BOSS , RAT , SkillList[1], SkillLv[1]);--施放飛掌
					end
					
				end
			end
		end
		if Globel.Angry==1 then--已開啟秒殺
			AngryTime = AngryTime +1
		end
		Clock = Clock +1
		Sleep(10)
		Lua_DW_WBLvCheck_Table(HatePlayer);
	end

end
function Lua_Zone21_BeastLord_Blood()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel
	local BOSS = Globel.GUID;
	local SkillList = Lua_Zone21_BeastLord_SkillInfo();
	local SkillLv = Lua_Zone21_BeastLord_SkillLvInfo();
	local OHPP =ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP);
	--DebugMsg( 0, RoomID ,"OHPP = "..OHPP);
	--Globel.Percent = math.floor(OHPP*100/5)*5;
	Globel.Percent = Globel.Percent -5;
--	DebugMsg( 0, RoomID ,"Globel.Percent  = "..Globel.Percent );
	local MaxHP = ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
	LockHP( BOSS , MaxHP/100*Globel.Percent , "Lua_Zone21_BeastLord_Blood" );--重設下次目標
	--local HatePlayer = KS_GetHateList( Boss, 3 )
	local HatePlayer = KS_GetHateList( Boss, 1 );--K.J. Aris 101128
	if Globel.Angry==0 then--未開啟秒殺
		Globel.Angry = 1;
	end
	KS_ScriptMessage("[SC_BEASTLORD_1]");
	--DebugMsg( 0, RoomID ,"HatePlayerCount = "..table.getn(HatePlayer));
	if table.getn(HatePlayer) > 1 then
		local RAT = HatePlayer[Rand(table.getn(HatePlayer)-1)+2]
		--DebugMsg( 0, RoomID ,"RAT = "..RAT);
		sysCastSpellLv( BOSS , RAT , SkillList[2], SkillLv[2]);--施放靈血
	else
		--DebugMsg( 0, RoomID ," HatePlayer[1] = ".. HatePlayer[1]);
		sysCastSpellLv( BOSS , HatePlayer[1] , SkillList[2], SkillLv[2]);--施放靈血
	end
end
function Lua_Zone21_BeastLord_BornBlood()--生小怪劇情
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	--生小怪
	local XX = Rand(20)+31;
	local BloodOrgID;
	if ReadRoleValue(BOSS,EM_RoleValue_OrgID)==105893 then
		BloodOrgID=105910;
	else
		BloodOrgID=107191;
	end
	local Blood = kg_GetPosRX( TargetID() , BloodOrgID , XX , 0 , math.random(360) , math.random(360) );
	AddToPartition(Blood,RoomID);
	table.insert(Lua_BeastLord_Globel.Blood,Blood);
	SetAttack(Blood,TargetID());
	AddBuff(Blood,508481,0,-1);--AE無效
	SetPlot(Blood,"dead","Lua_Zone21_BeastLord_BloodDead",0)
	local BloodCount = table.getn(Lua_BeastLord_Globel.Blood);

	--產生一個特殊計時器時間到將技能加入王的特殊排程
	local Timer = CreateObjByObj(121381,BOSS);
	SetModeEx(  Timer, EM_SetModeType_Show, false );--顯示
	CallPlot(Timer,"Lua_Zone21_BeastLord_SkillTimer",Blood)
end
function Lua_Zone21_BeastLord_SkillTimer(Blood)
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	local SkillList = Lua_Zone21_BeastLord_SkillInfo();
	local SkillLv = Lua_Zone21_BeastLord_SkillLvInfo();
	local Clock =1;
	--DebugMsg( 0, RoomID ,"Blood = ".. Blood);
	while 1 do
		--DebugMsg( 0, RoomID ,"Clock = ".. Clock);
		if ReadRoleValue(BOSS,EM_RoleValue_Register1)==0 or CheckID(BOSS)==false then
			break;
		end
		if Clock%11==0 then
			table.insert(Lua_BeastLord_Globel.SkillQueue,{BOSS,SkillList[3],SkillLv[3],"[SC_BEASTLORD_2]"});
		elseif Clock%21==0 then
			table.insert(Lua_BeastLord_Globel.SkillQueue,{Blood,SkillList[4],SkillLv[4],"[SC_BEASTLORD_3]"});
			break;
		end
		Clock = Clock +1;
		Sleep(10);
	end
	DelObj(OwnerID());
end
function Lua_Zone21_BeastLord_EatBlood()
--	Say(OwnerID(),"OwnerID");
--	Say(TargetID(),"TargetID");
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel
	local BOSS = Globel.GUID;
	local HPP =ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP);
	if HPP > 0 then
		local OHPP =ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP);
		local MaxHP = ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP);
		HPP = math.floor(HPP*100)
		local ADDHP = math.ceil(HPP/20)
		SetPosByObjDis(OwnerID(),TargetID(),0);
		DebugMsg( 0, RoomID ,"#HPP = "..HPP.." ADDHP = "..ADDHP);
		AddRoleValue(OwnerID(),EM_RoleValue_HP,ADDHP/100*ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP));--減少王血
		Globel.Percent = math.ceil(OHPP*100/5)*5;
		DebugMsg( 0, RoomID ,"#Globel.Percent  = "..Globel.Percent );
		LockHP( BOSS , MaxHP/100*Globel.Percent , "Lua_Zone21_BeastLord_Blood" );--重設下次目標
		KillID(OwnerID(),TargetID());
	end
end
function Lua_Zone21_BeastLord_BloodDead()
	local Blood = Lua_BeastLord_Globel.Blood;
	local OID = OwnerID();
	for i,v in ipairs(Blood) do 
		if v== OID then
			table.remove(Blood,i);
			break;
		end
	end
	return true;
end
function Lua_Zone21_BeastLord_Draw(Lv)
	if Lua_Zone21_Sinter_isGM()==false then
		return false;
	end
	local Caster,Target = OwnerID(),TargetID();
	SysCastSpellLv(Target,Caster,499638,Lv)
end
function Lua_Zone21_BeastLord_DrawH(Lv)
	if Lua_Zone21_Sinter_isGM()==false then
		return false;
	end
	local Caster,Target = OwnerID(),TargetID();
	SysCastSpellLv(Target,Caster,499639,Lv)
end
function Lua_Z21_WorldBoss_ResetTime(Boss)--Z21的世界王重生變化規則，會自動記錄時間，啟動倒數並回傳結果
	--EM_RoleValue_Register9，記錄npc的GUID
	--EM_RoleValue_Register8，記錄此王是否為HardCore模式
	local npc=ReadRoleValue(Boss,EM_RoleValue_Register9);
	local HardCore=(ReadRoleValue(Boss,EM_RoleValue_Register8)==0);
	local Next="Which One?"
	local StandardRevive=28800
	local HardCoreRevive=259200
	
	if HardCore==true then
		Next="Old Mode";
	else
		if DW_Rand(100)>=55 then--機率45%仍出普通的
			Next="Old Mode";
		else
			WriteRoleValue(npc,EM_RoleValue_Register9,1);
			WriteRoleValue(npc,EM_RoleValue_Register8,0);
			CallPlot(npc,"Lua_Z21_WorldBoss_Reseting",Lua_RandReviveTime(HardCoreRevive)); 
			Next="Hard Core";
			return "Hard Core";
		end
	end
	if Next=="Old Mode" then
		WriteRoleValue(npc,EM_RoleValue_Register9,1);
		WriteRoleValue(npc,EM_RoleValue_Register8,1);
		CallPlot(npc,"Lua_Z21_WorldBoss_Reseting",Lua_RandReviveTime(StandardRevive)*10); 
		return "Old Mode"
	end
end
function Lua_Z21_WorldBoss_Reseting(ResetTime)--以sleep等待王的重生
	Sleep(ResetTime);
	WriteRoleValue(OwnerID(),EM_RoleValue_Register9,0);
	DisableQuest(OwnerID(),false);
	return;
end
function Lua_RandReviveTime(ResetTime,Range)--模擬模版的重生隨機時間,回傳秒數(單位：秒)
	local RandRant
	if Range==nil then
		RandRant=30;
	else
		RandRant=Range;
	end
	if ResetTime==nil or type(ResetTime)~="number" then
		return false;
	end
	local NumberRange=math.floor(ResetTime*RandRant/100);
	return ResetTime-NumberRange+DW_Rand(NumberRange*2);
end