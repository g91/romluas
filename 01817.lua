--簡單的AI中樞
function LuaS_103583_0()
	SetPlot(OwnerID(),"dead","LuaS_103580_6",0);
---------------------------------------------------------------------------------------------------------------------------------------
--全域變數宣告區
---------------------------------------------------------------------------------------------------------------------------------------
	WorldKing_Zone16 = 0
---------------------------------------------------------------------------------------------------------------------------------------
--固定值宣告區
---------------------------------------------------------------------------------------------------------------------------------------
	local SkillList = {495373,6,495374,4}
---------------------------------------------------------------------------------------------------------------------------------------
--變動值宣告區
---------------------------------------------------------------------------------------------------------------------------------------
	local TotalTime = 0
	local InitialFight = true
	local BossTarget = 0
	local Kids = {}
	local Player = {}
	local PlayerRand = 0
	local AllowFight = false
	local xyz = {}
--永久迴圈
	local IsFinish=true;
	while	true	do
--戰鬥外迴圈(一秒):
		sleep(10);
		if(IsFinish==true)then
			IsFinish=false;
		end
--戰鬥中迴圈(一秒):
		while	HateListCount( OwnerID())~=0	do
			IsFinish=true;
			sleep(10)
			BossTarget = ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
------------------------------------------------------------------------------
--戰鬥起始階段
------------------------------------------------------------------------------
			AddBuff(OwnerID(),506373,1,-1)
			if	InitialFight == true	then
				InitialFight = false
			else
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,ReadRoleValue(OwnerID(),EM_RoleValue_PID)+1)
			end
			TotalTime = TotalTime + 1
------------------------------------------------------------------------------
--計時區域
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--持續判斷區
------------------------------------------------------------------------------
			if	DW_CheckUse(OwnerID(),SkillList[3]) == 0		and
				WorldKing_Zone16 == 0				and
				TotalTime ~= 0					and
				TotalTime % 7==0				then
				Player = DW_HateRemain(1)
				if type(Player)~="boolean" then
					if	table.getn(Player)>=1			then
						PlayerRand = DW_Rand(table.getn(Player))
						WorldKing_Zone16 = 1
						local TempKids= Lua_CreateObjByDir( Player[PlayerRand] , 103584 , 200 , 0) 
						Kids[table.getn(Kids)+1] =TempKids
						AddBuff(TempKids,502707,0,-1);
						WriteRoleValue(TempKids,EM_RoleValue_IsWalk,0)
						SetModeEx(TempKids,EM_SetModeType_Strikback,false)
						SetModeEx(TempKids,EM_SetModeType_Searchenemy,false) 
						CallPlot(TempKids ,"LuaS_103583_1",Player[PlayerRand],OwnerID())
					end
				end
			end

			if	TotalTime%17==0	and
				TotalTime~=0		then
				Player = {}
				for i=0,HateListCount( OwnerID())-1,1 do
					Player[i] = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
					ScriptMessage( Player[i], Player[i], 0, "[SC_103583_1]", C_Yellow )
					ScriptMessage( Player[i], Player[i], 2, "[SC_103583_1]", C_Yellow )
				end
			end

			if	TotalTime%37==0	and
				TotalTime~=0		then
				AddBuff(OwnerID(),506377,0,-1)
				Player = {}
				for i=0,HateListCount( OwnerID())-1,1 do
					Player[i] = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
					ScriptMessage( Player[i], Player[i], 0, "[SC_103583_3]", C_Yellow )
					ScriptMessage( Player[i], Player[i], 2, "[SC_103583_3]", C_Yellow )
				end
			end
------------------------------------------------------------------------------
--檢查是否符合施法條件
------------------------------------------------------------------------------
			for i=1,table.getn(SkillList),2 do
				if	ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)==0	and
					ReadRoleValue(OwnerID(),EM_RoleValue_Coldown_All)==0	and
					DW_CheckUse(OwnerID(),SkillList[i])==0		then
------------------------------------------------------------------------------
--技能各別判斷
------------------------------------------------------------------------------
--普通壓力技
					if	SkillList[i] ==495373	then
						CastSpellLV(OwnerID(),BossTarget,SkillList[i],SkillList[i+1])
					end
--跳砍
					if	SkillList[i] ==495374		and
						CheckID(WorldKing_Zone16)	then
						ScriptMessage( WorldKing_Zone16, 0, 0, "[SC_103583_2]", C_Yellow )
						ScriptMessage( WorldKing_Zone16, 0, 2, "[SC_103583_2]", C_Yellow )
						sleep(10)
						AdjustFaceDir(OwnerID(),WorldKing_Zone16,0)
						if	CastSpellLV(OwnerID(),Player[PlayerRand],SkillList[i],SkillList[i+1])	then
							WriteRoleValue(WorldKing_Zone16,EM_RoleValue_LiveTime,5)
							CastSpell(WorldKing_Zone16,WorldKing_Zone16,490590)
							WorldKing_Zone16 = 0
						end
					end
				end
			end
		end
------------------------------------------------------------------------------
--清除區域
------------------------------------------------------------------------------
		if IsFinish==true then
			TotalTime = 0
			WorldKing_Zone16 = 0
			 InitialFight = true
			 BossTarget = 0
			 Player = {}
			 PlayerRand = 0
			AllowFight = false
			for i=1,table.getn(Kids),1 do
				DelObj(Kids[i])
			end
			 Kids = {}
			xyz = {ReadRoleValue(OwnerID(),EM_RoleValue_X),ReadRoleValue(OwnerID(),EM_RoleValue_Y)+2000,ReadRoleValue(OwnerID(),EM_RoleValue_Z)}
----------------------------------------------------------------------------
--			2013/10/23
--			function LuaS_103580_4() 遺失，功能不明。不影響BOSS運作，予以隱蔽。
--			BeginPlot(Lua_DW_CreateObj("xyz",114040,xyz,005),"LuaS_103580_4",0)
----------------------------------------------------------------------------
			SetPos(OwnerID(),1576,-670,19189,0);
			--SetPos(OwnerID(),0,-250,0,0);
		end
	end
end
------------------------------------------------------------------------------
--移動到目標位置then發出訊號
------------------------------------------------------------------------------
function LuaS_103583_1(Tar)
	MoveToFlagEnabled(OwnerID(), false)
	sleep(10)
	AddToPartition(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_RoomID))
	SetPlot(OwnerID(),"dead","LuaS_103583_2",0)
	AddBuff(Tar,506378,1,6)
	local x,y,z
	x=ReadRoleValue(Tar,EM_RoleValue_X)
	y=ReadRoleValue(Tar,EM_RoleValue_Y)
	z=ReadRoleValue(Tar,EM_RoleValue_Z)
	DW_WaitMoveTo( OwnerID() , x , y  , z )
	Yell(OwnerID(),"[SC_103583_0]",4)
	WorldKing_Zone16 = OwnerID()
	AdjustFaceDir(OwnerID(),TargetID(),0)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
end


function LuaS_103583_2()
	WorldKing_Zone16 = 0
	return true
end

--困難的AI中樞
function LuaS_103583H_0()
	DebugMsg(0,0,"LuaS_103583H_0 begin");
	Lua_DW_WBGUIDRecord(1);
---------------------------------------------------------------------------------------------------------------------------------------
--固定值宣告區
---------------------------------------------------------------------------------------------------------------------------------------
	local Sk1=495373;	--幻影斬擊
	local Sk1Lv=13;		--幻影斬擊的法術等級
	local Sk2=495374;	--翔空斬
	local Sk2Lv=0;		--翔空斬的法術等級19
	local Sk3=623285;	--永恒的黑暗(基本法術)
	--永恒的黑暗會反彈傷害，普攻反彈495376黑夜反噬，技能反彈495377極黯濺射
---------------------------------------------------------------------------------------------------------------------------------------
--變動值宣告區
---------------------------------------------------------------------------------------------------------------------------------------
	local TotalTime,HitTime = 0,0;
	local InitialFight = true
	local BossTarget = 0
	local Kids,KidsOrgID = {},107186;
	local Player,OnMark,Target = {},{},{};
	local PlayerRand = 0
	local AllowFight = false
	local xyz = {}
	local Now,Max,Turn=1,5,1;
	for i=1,Max do
		Kids[i]={};
	end
	local Boss=OwnerID();
--永久迴圈
	local IsFinish=true;
	while	true	do
		sleep(10)
		if IsFinish==true then
			DebugMsg(0,0,"Initial Setting");
			IsFinish=false;
			Lua_DW_WBGUIDRecord(1);
			LockHP(Boss,-10,"");
		end
--戰鬥中迴圈(一秒):
		while	HateListCount(Boss)~=0	do
			sleep(10);
			IsFinish=true;
			Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
			BossTarget = ReadRoleValue(Boss,EM_RoleValue_AttackTargetID)
------------------------------------------------------------------------------
--戰鬥起始階段
------------------------------------------------------------------------------
			AddBuff(Boss,506373,1,-1)
			if	InitialFight == true	then
				InitialFight = false
			else
				WriteRoleValue(Boss,EM_RoleValue_PID,ReadRoleValue(Boss,EM_RoleValue_PID)+1)
			end
			TotalTime = TotalTime + 1
			DebugMsg(0,0,"TotalTime="..TotalTime);
------------------------------------------------------------------------------
--計時區域
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--持續判斷區
------------------------------------------------------------------------------
			if	DW_CheckUse(Boss,Sk2) == 0		and
				Kids[Turn][1] ==nil			and
				TotalTime ~= 0			and
				TotalTime % 15==0			then
				Player={}
				for i=0,HateListCount(Boss)-1 do
					local GUID=HateListInfo(Boss,i , EM_HateListInfoType_GItemID);
					if ReadRoleValue(GUID,EM_RoleValue_IsPlayer)==1 then
						table.insert(Player,GUID);
						if CheckBuff(GUID,506378) then
							table.insert(OnMark,GUID);
						end
					end
				end
				Target=Lua_TableRuleOut(Player,OnMark,3);
				local AddNum=3-#Target
				if AddNum~=0 then
					for Num=1,AddNum,1 do
						local GUID=HateListInfo(Boss,0 , EM_HateListInfoType_GItemID);
						table.insert(Target,GUID);
						DebugMsg(0,0,"Add fake");
					end
				end
				if Target[1]~=nil then
					for i=1,3 do
						local x,y,z,dir=DW_Location(Target[i]);
						local TempKids=CreateObj(KidsOrgID,x-20+DW_Rand(40),y,z-20+DW_Rand(40),dir,1);
						AddToPartition(TempKids,0);
						Kids[Now][i]=TempKids;
						AddBuff(TempKids,502707,0,-1);
						WriteRoleValue(TempKids,EM_RoleValue_IsWalk,0)
						SetModeEx(TempKids,EM_SetModeType_Strikback,false)
						SetModeEx(TempKids,EM_SetModeType_Searchenemy,false) 
						CallPlot(TempKids,"LuaS_103583H_1",Target[i],Boss); 
					end
					Now=Now+1;
					if Now>Max then Now=1 end;
					HitTime=TotalTime;
				end
			end
			if	TotalTime%17==0	and
				TotalTime~=0		then
				Player = {}
				for i=0,HateListCount(Boss)-1 do
					Player[i] = HateListInfo(Boss,i , EM_HateListInfoType_GItemID)
					ScriptMessage( Player[i], Player[i], 0, "[SC_103583_1]", C_Yellow )
					ScriptMessage( Player[i], Player[i], 2, "[SC_103583_1]", C_Yellow )
				end
			end

			if	TotalTime%23==0	and
				TotalTime~=0		then
				AddBuff(Boss,Sk3,0,-1)
				BeginPlot(Boss,"LuaS_103583H_Shield",0);--script的吸收盾
				Player = {}
				for i=0,HateListCount( Boss)-1,1 do
					Player[i] = HateListInfo(Boss,i , EM_HateListInfoType_GItemID)
					ScriptMessage( Player[i], Player[i], 0, "[SC_103583_3]", C_Yellow )
					ScriptMessage( Player[i], Player[i], 2, "[SC_103583_3]", C_Yellow )
				end
			end
------------------------------------------------------------------------------
--檢查是否符合施法條件
------------------------------------------------------------------------------
			if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)==0 and ReadRoleValue(Boss,EM_RoleValue_Coldown_All)==0 then
------------------------------------------------------------------------------
--技能各別判斷
------------------------------------------------------------------------------
--幻影斬擊
				if DW_CheckUse(Boss,Sk1)==0 then
					CastSpellLV(Boss,BossTarget,Sk1,Sk1Lv);
--翔空斬
				elseif DW_CheckUse(Boss,Sk2)==0 and Kids[Turn][1]~=nil  and TotalTime>=HitTime+15 then
					for SN,GUID in pairs(Kids[Turn]) do
						if CheckID(GUID)==true and ReadRoleValue(GUID,EM_RoleValue_IsDead)==0 then
							ScriptMessage( GUID, 0, 0, "[SC_103583_2]", C_Yellow );
							ScriptMessage( GUID, 0, 2, "[SC_103583_2]", C_Yellow );
							if SysCastSpellLv(Boss,GUID,Sk2,Sk2Lv) then
								WriteRoleValue(GUID,EM_RoleValue_LiveTime,5)
								CastSpell(GUID,GUID,490590);
							end
						end
					end
					Kids[Turn]={};
					Turn=Turn+1;
					if Turn>Max then Turn=1 end;
					HitTime=TotalTime;
				end
			end
		end
		sleep(5);
------------------------------------------------------------------------------
--清除區域
------------------------------------------------------------------------------
		if IsFinish==true then
			Now,Max,Turn=1,5,1;
			TotalTime = 0
			 InitialFight = true
			 BossTarget = 0
			 Player = {}
			 PlayerRand = 0
			AllowFight = false
			for i=1,Max,1 do
				for SN,GUID in pairs(Kids[i]) do
					DelObj(GUID);
				end
				Kids[i]={};
			end
			xyz = {ReadRoleValue(Boss,EM_RoleValue_X),ReadRoleValue(Boss,EM_RoleValue_Y)+2000,ReadRoleValue(Boss,EM_RoleValue_Z)}
----------------------------------------------------------------------------
--			2013/10/23
--			function LuaS_103580_4() 遺失，功能不明。不影響BOSS運作，予以隱蔽。
--			BeginPlot(Lua_DW_CreateObj("xyz",114040,xyz,005),"LuaS_103580_4",0)
----------------------------------------------------------------------------
--			BeginPlot(Lua_DW_CreateObj("xyz",114040,xyz,005),"LuaS_103580_4",0)
			SetPos(OwnerID(),1576,-670,19189,0);
			DebugMsg(0,0,"Finish Combat");
			--SetPos(OwnerID(),0,-250,0,0);
		end
	end
end
------------------------------------------------------------------------------
--移動到目標位置then發出訊號
------------------------------------------------------------------------------
function LuaS_103583H_1(Player,Boss)
	local Kids=OwnerID();
	WriteRoleValue(Kids,EM_RoleValue_Register1,Player);
	SetPlot(Kids,"dead","LuaS_103583H_KidDead",0);
	MoveToFlagEnabled(Kids, false)
	AddToPartition(Kids,ReadRoleValue(Boss,EM_RoleValue_RoomID))
	AddBuff(Player,623284,1,-1)
	PlayMotion(Kids,ruFUSION_ACTORSTATE_EMOTE_WAVE)
	NPCSay(Kids,"[SC_103583_0]")
	sleep(20)
	while CheckID(Boss)==true and ReadRoleValue(Boss,EM_RoleValue_IsDead)==0 do
		AdjustFaceDir(Kids,Boss,0);
		for i=1,2 do
			if CheckBuff(Kids,501054) ==true	then
				sleep(30);
				SetModeEx(Kids,EM_SetModeType_Show,false);
				DW_UnFight(Kids,true)
				sleep(10)
				DelObj(Kids);
			end
			sleep(10);
		end
	end
	DelObj(Kids);
end

function LuaS_103583H_Shield()
	local PowerLv=250000;--吸收傷害
	local BuffSec=20;--持續秒數
	local Boss = OwnerID()
	LockHP(Boss,ReadRoleValue(Boss,EM_RoleValue_HP),"");
	local NowDamge=0;
	local InitialVar=0
	for i=0,HateListCount(Boss)-1 do
		local HPTT=HateListInfo(Boss,i , EM_HateListInfoType_HitPoint);
		InitialVar=InitialVar+HPTT;
	end
	DeBugMSG(0,0,"InitialVar="..InitialVar)
	for x=1,BuffSec,1 do
		for i=0,HateListCount(Boss)-1 do
			local HPTT=HateListInfo(Boss,i , EM_HateListInfoType_HitPoint);
			NowDamge=NowDamge+HPTT;
		end
		if NowDamge-InitialVar>PowerLv  or HateListCount(Boss)==0 then
			CancelBuff_NoEvent(Boss,623285);
			LockHP(Boss,-10,"");
			return
		end
		NowDamge=0
		sleep(10)
	end
end

function LuaS_103583H_KidDead()
	local Kids = OwnerID();
	local Player=ReadRoleValue(Kids,EM_RoleValue_Register1);
	CancelBuff_NoEvent(Player,506378);
	CancelBuff_NoEvent(Player,623284);
	return true;
end
--任務需求的死亡劇情
	
function Lua_423670_DeadPlot()
	local Boss = OwnerID();
	for Pos=0,HateListCount(Boss)-1 do
		local Player=HateListInfo(Boss,Pos , EM_HateListInfoType_GItemID)
		if CheckAcceptQuest(Player,423670)==true then
			DW_QietKillOne(Player,102137);
		end
	end
end