function lua_Quest425283_ANT_ctrl()
	local ctrl = OwnerID()
	local RoomID = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
	local element = {106909,106910,106911,106912}
	local AntOrgID = 120898
	local RecAnt = 120899
	local time = 0

	local TotalNPC=EM_RoleValue_Register1;
	local ElementOrgID=EM_RoleValue_Register1;
	local CtrlID=EM_RoleValue_PID
	local LastTime=0;
	
	--產生監控
	local x,y,z,dir = DW_Location(ctrl);
	local spy = CreateObj(120897, x,y,z,dir, 1)
	SetModeEx(spy, EM_SetModeType_Mark, false);
	SetModeEx(spy, EM_SetModeType_Show, false);
	SetModeEx(spy, EM_SetModeType_ShowRoleHead, false);
	AddToPartition(spy,0);
	BeginPlot(spy, "lua_Quest425283_spy", 0);
	while true do
		local NPC_Num = ReadRoleValue(ctrl,TotalNPC)
		--DebugMsg(0,0,"NPC_Num="..NPC_Num)
		--DebugMsg(0,0,"time="..time.."  LastTime="..LastTime.."   NPC_Num="..NPC_Num);
		if (time-LastTime >=NPC_Num) and NPC_Num<=8 then
			LastTime=time;
			local x,y,z,dir=DW_Location(ctrl);
			x,y,z,dir=DW_NewLocation( Rand(360)+1,Rand(130)+1,x,y,z,dir);
			local Ant = CreateObj(AntOrgID,x,y,z,dir,1);
			WriteRoleValue(Ant,CtrlID,ctrl)
			WriteRoleValue(Ant,ElementOrgID,element[DW_Rand(4)])
			MoveToFlagEnabled(Ant,false);
			AddToPartition(Ant,RoomID)
			NPCSAY(Ant,"[SC_ANT_DIE_IN_PAIN_01]")
			BeginPlot(Ant,"lua_Quest425283_ANT_Dead",0)
		end
		if time==349 then
			time=0;
			LastTime=0;
		else
			time = time +1;
		end
		Sleep(10)
	end
end
function lua_Quest425283_spy()--監控中控器
	local spy = OwnerID();
	local ctrl = TargetID();
	local org = {106909,106910,106911,106912}
	while true do
		sleep(600);
		local effectnum = 0
		local n = SetSearchAllNPC(0);
		for i=1, n, 1 do
			local npc = GetSearchResult();
			local o = ReadRoleValue(npc, EM_RoleValue_OrgID);
			for sn=1, #org, 1 do
				if o == org[sn] then
					effectnum = effectnum + 1;
					break;
				end
			end
			if effectnum~=0 then
				--已證實仍有存在
				break;
			end
		end
		if effectnum ==0 then
			DelObj(ctrl);
			local x,y,z,dir = DW_Location(spy);
			ctrl = CreateObj( 120897, x,y,z,dir, 1 );
			SetModeEx(ctrl, EM_SetModeType_Mark, false);
			SetModeEx(ctrl, EM_SetModeType_Show, false);
			SetModeEx(ctrl, EM_SetModeType_ShowRoleHead, false);
			AddToPartition(ctrl, 0);
			BeginPlot(ctrl, "lua_Quest425283_ANT_ctrl", 0);
			DelObj(spy);
			return;
		end
	end
end
function lua_Quest425283_ANT_Dead()
	local Ant = OwnerID()
	local RoomID = ReadRoleValue(Ant,EM_RoleValue_RoomID)
	local TotalNPC=EM_RoleValue_Register1;
	local ElementOrgID=EM_RoleValue_Register1;
	local CtrlID=EM_RoleValue_PID
	local ctrl = ReadRoleValue(Ant,CtrlID)

	local x,y,z,dir=DW_Location(ctrl);
	x=x+Rand(100);
	z=z+Rand(100);
	y=GetHeight(x,y,z);
	sleep( Move(Ant,x,y,z) -20);
	StopMove( Ant, true );

	local RandSpeak = {}
	RandSpeak[1]="[SC_ANT_DIE_IN_PAIN_02]"
	RandSpeak[2]="[SC_ANT_DIE_IN_PAIN_03]"
	local RandNum = Rand(2)+1
	NPCSAY(Ant,RandSpeak[RandNum])

	SetDefIdleMotion( Ant, ruFUSION_MIME_DEATH_DOWN)
	Sleep(DW_Rand(20)+10);

	CastSpell(Ant,Ant,850257)
	Sleep(10)

	x,y,z,dir=DW_Location(Ant);
	local element = CreateObj( ReadRoleValue(Ant,ElementOrgID) ,x,y,z,dir,1)
	local NPC_Num = ReadRoleValue(ctrl,TotalNPC)
	WriteRoleValue(element,CtrlID,ctrl)
	WriteRoleValue(ctrl,TotalNPC,NPC_Num+1)
	--DebugMsg(0,0,"NPC_Num+1="..ReadRoleValue(ctrl,TotalNPC));
	AddToPartition(element,RoomID)
	--SetPlot(element,"dead","lua_Quest425283_element",0);
	DelObj(Ant)
end

function lua_Quest425283_element()--元素死亡劇情
	LuaPG_425273_KillinDark()

	local TotalNPC=EM_RoleValue_Register1;
	local CtrlID=EM_RoleValue_PID;
	local element = OwnerID()

	local ctrl = ReadRoleValue(element,CtrlID)
	local NPC_Num = ReadRoleValue(ctrl,TotalNPC);
	WriteRoleValue(ctrl,TotalNPC,NPC_Num-1);
	--DebugMsg(0,0,"NPC_Num-1="..ReadRoleValue(ctrl,TotalNPC));
	Sleep(10)
	return true;
end

function lua_Quest425285_ItemUse()
local player = OwnerID()
local Qant = TargetID()
local MAXHp = ReadRoleValue(Qant,EM_RoleValue_MaxHP)
local NowHP = ReadRoleValue(Qant,EM_RoleValue_HP)
local OrgID=ReadRoleValue(Qant,EM_RoleValue_OrgID);
local x,y,z,dir=DW_Location(Player);
--		DelBodyItem(player,241484,1)
		GiveBodyItem(player,241485,1)
		if FindMapID(x,y,z)==353 then
			if OrgID==106774 or OrgID==106775 then
				BeginPlot(Qant,"Lua_Z23_BloodyBF_AntDead",0);
				DelObj(Qant);
			end
			if OrgID==106728 then
				BeginPlot(Qant,"Lua_Z23_BloodyBF_AntDead",0);
				DelObj(Qant);
			end
		end
		if OrgID==106726 then
			DelObj(Qant);
		else
			CallPlot( Qant, "LuaFunc_ResetObj",Qant );
		end
end


function lua_Quest425285_ItemCheck()
local player = OwnerID()
local TAG =TargetID()
local room = ReadRoleValue(player,EM_RoleValue_ZoneID)
local TagOrgID = ReadRoleValue(TAG,EM_RoleValue_OrgID)
local AntTable = {106720,106721,106726,106727,106728,106859,106775,106774,106865,106773,106678,106680}
local NowHP = ReadRoleValue(TAG,EM_RoleValue_HP)
local MAXHp = ReadRoleValue(TAG,EM_RoleValue_MaxHP)
local X = 0
--Say(player,room)
	if room ~= 23 then
		ScriptMessage(player,player,2,"[KORS_Z23_ITEMUSE2]",C_SYSTEM)
		return FALSE
	end

	for i = 1,#AntTable do
		if TagOrgID ~= AntTable[i] then
			X = X+1
		end
	end

	if X==#AntTable then
		ScriptMessage(player,player,2,"[KORS_Z23_ITEMUSE4]",C_SYSTEM)
		return FALSE		
	end

	if (NowHP/ MAXHp) < 0.5 then
		for i = 1,#AntTable do
			if TagOrgID == AntTable[i] then
				return TRUE
			end
		end
	else
		ScriptMessage(player,player,2,"[KORS_Z23_ITEMUSE]",C_SYSTEM)
			return FALSE
	end
end

function lua_Quest425286_CreatePoint()
local ctrl = OwnerID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local point = 120901
local flag = 781170
local time = 10
local SEC = 0
	while TRUE do
		if SEC%time == 0 then
		 local CP =CreateObjByFlag( point, flag, Rand(11),1 )
			BeginPlot(CP,"lua_Quest425286_CreatePointD",0)
			AddToPartition(CP,room)
		end		
	SEC = SEC +1
	Sleep(10)
	end
end

function lua_Quest425286_CreatePointD()
local CP= OwnerID()
local slep = 0
	while TRUE do
		if slep >= 20 then
			DelObj(CP)
		end
		slep =slep+1
		Sleep(15)
	end
end	


function lua_Quest425286_CreatePointT()			--點物件後觸發
local player = OwnerID()
local CP = TargetID()
	ScriptMessage(player,player,0,"[KORS_Z23_ITEMUSE2]",C_SYSTEM)
	DelBodyItem(player,241486,1)
	DelObj(CP)
	return true
end

function lua_Quest425287_AssassinGo()
	local Assassin = OwnerID()
	MoveToFlagEnabled(Assassin,false);
	local flag = 781169
	local x,y,z,dir;
	while true do
		x,y,z,dir=DW_Location(flag,DW_Rand(7));
		SetPos(Assassin,x,y,z,dir);
		Sleep(600)
	end
end

function lua_Quest425287_AssassinSay()
local player = OwnerID()
local npc =TargetID()
	if CountBodyItem(player,241487) ~= 0	and
	CheckFlag(player, 546723)==false	then
		SetSpeakDetail(player,"[KORS_Z23_ASSASSIN]")
		DelBodyItem(player,241487,1)
		GiveBodyItem(player,240796,1)
		SetFlag(player, 546723, 1)
	elseif CountBodyItem(player,240796) == 0	and
	CheckFlag(player, 546723)==true		then
		SetSpeakDetail(player,"[KORS_Z23_ASSASSIN_01]")
		GiveBodyItem(player,240796,1)
	end
end