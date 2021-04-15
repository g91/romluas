function Lua_Snowflake_StatueCampSet(Manner,Caster)--設定自己變成/脫離(,Caster)雕像模式
	local Statue
	local x,y,z,dir
	if ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer)==0 then
		Statue=TargetID();
	else
		Statue=OwnerID();
	end
	local Task=Manner;
	local Monster,Vistor=3,6;
	Task=Task or "RecoverStatue";
	local IsOneStatue=EM_RoleValue_Register;
	if Task=="RecoverStatue" then
		if ReadRoleValue(Statue,IsOneStatue)==0 then
			SetRoleCampID(Statue,Vistor);
			WriteRoleValue(Statue,IsOneStatue,2);
			PlayMotion(Statue,ruFUSION_ACTORSTATE_SLEEP_BEGIN);
			SetDefIdleMotion(Statue,ruFUSION_MIME_SLEEP_LOOP);
			sleep(20)
			SetModeEx(Statue,EM_SetModeType_HideName,true);
			SetModeEx(Statue,EM_SetModeType_ShowRoleHead,false);
			SetModeEx(Statue,EM_SetModeType_Mark,false);
			WriteRoleValue(Statue,IsOneStatue,1);
		end
	elseif Task=="BreakStatue" then
		WriteRoleValue(Statue,IsOneStatue,2);
		PlayMotion(Statue,ruFUSION_ACTORSTATE_SLEEP_END);
		SetDefIdleMotion(Statue,ruFUSION_MIME_IDLE_STAND)
		SetRoleCampID(Statue,Monster);
		sleep(20);
		SetModeEx(Statue,EM_SetModeType_HideName,false);
		SetModeEx(Statue,EM_SetModeType_ShowRoleHead,true);
		SetModeEx(Statue,EM_SetModeType_Mark,true);
		WriteRoleValue(Statue,IsOneStatue,0);
		MoveToFlagEnabled(Statue,false);
		x,y,z,dir=DW_Location(Caster);
		sleep(Move(Statue,x,y,z));
		MoveToFlagEnabled(Statue,true);
	end
end
function Lua_Snowflake_WarmFxCheck()--504457溫暖的CheckUseLua檢查劇情
	local Caster,Target=OwnerID(),TargetID()
	local BanList={107422,107398}
	for SN=1,#BanList,1 do
		if ReadRoleValue(Target,EM_RoleValue_OrgID)==BanList[SN] then
			return false;
		end
	end
	return true;
end
function Lua_Snowflake_LoopForCheckStatue()--火堆持續搜尋附近物件，並針對特定物件執行不同動作。(此function點火時執行單次)
	local Fire=OwnerID();
	local FireY=ReadRoleValue(Fire,EM_RoleValue_Y);
	local WarmEffectBuffID=507088;
	local IsOneStatue=EM_RoleValue_Register;
	local SearchRange=300;--搜尋範圍;
	while CheckBuff(Fire,WarmEffectBuffID)==true do
		local IsSureStatue=false;
		local QueueTable=SearchRangeNPC(Fire,SearchRange);
		for SN=0,#QueueTable,1 do
			local ID=QueueTable[SN];
			if ID~=GUID or ID~=-1 then
				local OrgID=ReadRoleValue(ID,EM_RoleValue_OrgID);
				if OrgID==107398 then--雪鹿
					if GetDistance(ID,Fire)<140 then
						CallPlot(ID,"Lua_Snowflake_DeerFearFire",Fire);
					end
				elseif OrgID==107422 then--雕像
					if IsSureStatue==false then
						if ReadRoleValue(ID,IsOneStatue)==1 then
							if  CheckRelation(Fire,ID,EM_CheckRelationType_CheckLine )==true then
								IsSureStatue=true;
								CallPlot(ID,"Lua_Snowflake_StatueCampSet","BreakStatue",Fire);
								CallPlot(ID,"Lua_Snowflake_StatueCompany",Fire);
							end
						end
					end
				end
			end
		end
		for Sec=1,3,1 do
			sleep(10);
			if CheckBuff(Fire,WarmEffectBuffID)==false then
				return;
			end
		end
	end
end
function Lua_Snowflake_DeerFearFire(Fire)--讓鹿往火的反方向逃跑
	local Deer=OwnerID();
	SetStopAttack(Deer);
	MoveToFlagEnabled(Deer,false);
	SetModeEx(Deer,EM_SetModeType_Strikback,false);
	local StopAutoRecoverHP=502707;
	AddBuff(Deer,StopAutoRecoverHP,0,-1);
	local x,y,z,dir;
	x,y,z,dir=DW_Location(Deer);
	local RunWayDir=DW_GetDir(x,y,z,Fire);
	x,y,z,dir=DW_NewLocation(RunWayDir-dir,100,x,y,z,dir);
	Move(Deer,x,y,z);
end
function Lua_Snowflake_DeerInitial()--雪鹿初始劇情
	local Deer=OwnerID();
	local ImmuneAttack=623763;
	AddBuff(Deer,ImmuneAttack,0,-1);
	local StopAutoRecoverHP=502707;
	local HP=ReadRoleValue(Deer,EM_RoleValue_HP);
	local OldHP=HP;
	while true do
		if HateListCount(Deer)==0 then
			for Sec=0,10,2 do
				sleep(20);
				if ReadRoleValue(Deer,EM_RoleValue_NpcOnMove)==0 then
					SetModeEx(Deer,EM_SetModeType_Strikback,true);
					CancelBuff(Deer,StopAutoRecoverHP);
				end
			end
			if ReadRoleValue(Deer,EM_RoleValue_HP)>=OldHP then
				MoveToFlagEnabled(Deer,true);
			end
			OldHP=HP
		end
		sleep(20);
	end
end
function Lua_Snowflake_CheckNearStatue(GUID)--找到範圍內最近的雕像
	local SearchRange=300;--搜尋範圍;
	local QueueTable=SearchRangeNPC(GUID,SearchRange);
	local IsOneStatue=EM_RoleValue_Register;
	for SN=0,#QueueTable,1 do
		local ID=QueueTable[SN];
		if ID~=GUID or ID~=-1 then
			if ReadRoleValue(ID,EM_RoleValue_OrgID)==107422 then
				if ReadRoleValue(ID,IsOneStatue)==1 then
					if  CheckRelation(GUID,ID,EM_CheckRelationType_CheckLine )==true then
						return ID;
					end
				end
			end
		end
	end
end
function Lua_Snowflake_StatueCompany(Fire)--雕像呼朋引伴
	local Statue=OwnerID();
	local SearchRange=300;--搜尋範圍;
	sleep(5+DW_Rand(5))
	local AnotherStatue=Lua_Snowflake_CheckNearStatue(Statue);
	if AnotherStatue~=nil then
		CallPlot(AnotherStatue,"Lua_Snowflake_StatueCampSet","BreakStatue",Fire);
		CallPlot(AnotherStatue,"Lua_Snowflake_StatueCompany",Fire);
	end
end