function dw_test3()--永遠的測試指令
	local fungous = CreateObj(100052,0,0,0,0,1);
	AddToPartition(fungous,0);
	DebugMsg(0,0,ReSetNPCInfo(fungous));
	WriteRoleValue(fungous,EM_RoleValue_LiveTime,3);
end
function dw_test2()--永遠的測試指令
	DebugMsg(0,0,GetSystime(2));
end
function dw_test1()--永遠的測試指令
	
end
function dw_test()--永遠的測試指令
	local boss=OwnerID();
	local player=TargetID();
	local room=ReadRoleValue(boss, EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	x,y,z,dir=DW_NewLocation(180, 150, x,y,z,dir);
	local a=CreateObj(102991, x,y,z,dir, 1);
	SetModeEx(a, EM_SetModeType_Searchenemy, false);
	SetModeEx(a, EM_SetModeType_Fight, false);
	AddToPartition(a, room);
	SetAttack(boss, player);
	sleep(30);
	FaceObj(a, boss);
	sleep(50);
	
	--
	local hatelist={};
	local n=HateListCount(boss);
	if n~=0 then
		for pos=0, n-1, 1 do
			hatelist[HateListInfo(boss, pos, EM_HateListInfoType_GItemID)]= HateListInfo(boss, pos, EM_HateListInfoType_HatePoint);
		end
	end
	for id, hatevar in pairs (hatelist) do
		DebugMsg(0,0, id.."="..hatevar);
	end
	SetModeEx(boss, EM_SetModeType_Searchenemy, false)
	SetModeEx(boss, EM_SetModeType_Strikback, false)
	SetStopAttack(boss);
	local x,y,z,dir=DW_Location(a);
	SetDir(boss, DW_GetDir(x,y,z, boss));
	CastSpell(boss, a, 850976);
	sleep(40);
	SetModeEx(boss, EM_SetModeType_Searchenemy, true)
	SetModeEx(boss, EM_SetModeType_Strikback, true)
	for id, hatevar in pairs (hatelist) do
		SysCastSpellLv(id, boss, 495751, 1);
	end
	sleep(10)
	n=HateListCount(boss);
	for pos=0, n-1, 1 do
		g = HateListInfo(boss, pos, EM_HateListInfoType_GItemID);
		DebugMsg(0,0, "g="..g)
		SetHateListPoint(boss, pos, hatelist[g]);
	end
	n=HateListCount(boss);
	for pos=0, n-1, 1 do
		g = HateListInfo(boss, pos, EM_HateListInfoType_GItemID);
		DebugMsg(0,0, g..":"..HateListInfo(boss, pos, EM_HateListInfoType_HatePoint) )
	end
	
	DelObj(a);
end
function DW_OPENstrikeback()--開啟反擊(用於RP1)
	SetModeEx(OwnerID(), EM_SetModeType_Strikback, true);
	return false;
end
function DW_OPENsearchenermy()--開啟索敵(用於RP1)
	SetModeEx(OwnerID(), EM_SetModeType_Searchenemy, true);
	return false;
end
function dw_readrolevalue()
	local player=OwnerID();
	local room=ReadRoleValue(player, EM_RoleValue_RoomID);
	local __=ReadRoleValue(player, EM_RoleValue_RoomID);
	DebugMsg(0, room, __);
	DebugLog(2, "Func:dw_readrolevalue"..__);
end
function DW_gettime(t)--讀出系統給的時間值
	local room = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	if t and type(t)=="number" then
		if t<=5 and t>=0 then
			DebugMsg(0, room, GetSystime(t));
		else
			DebugMsg(0, room, GetSystime(0));
		end
	else
		DebugMsg(0, room, GetSystime(0));
	end
end
function dw_motion(motionID)
	PlayMotion(OwnerID(), motionID);
end
function DW_clsquest(QuestID)--刪除Func執行者身上的特定任務
	local who = OwnerID();
	local room = ReadRoleValue(who, EM_RoleValue_RoomID);
	if not QuestID then
		DebugMsg(0, room, "you  have no quest")
	end
	DeleteQuest(who, QuestID);
end
function DW_TEST_sysCast(spell_id)--target 對 owner 放
	SysCastSpellLv(TargetID(), OwnerID(), spell_id, 1);
end
function DW_TEST_ALLFLagSET(num1,num2)--設定flag
	local player = OwnerID();
	for flag=num1, num2, 500 do
		SetFlag(player, flag, 1);
	end
end
function DW_Test_CheckFlag(Flag)--檢查flag
	local player=OwnerID();
	local room = ReadRoleValue(player, EM_RoleValue_RoomID);
	if Flag==nil then
		DebugMsg(0, room, "Flag == nil");
		return;
	end
	DebugMsg(0, room, tostring(CheckFlag(player, Flag)) );
end
function DW_Test_UseCheck()--使用物品檢查
	local job = ReadRoleValue(OwnerID(), EM_RoleValue_VOC);
	if job == 0 then
		DebugMsg(0, 0, "false");
		return false;
	else
		DebugMsg(0, 0, "true");
		return true;
	end
end
function DW_Test_UseExecute()--使用物品執行
	Say(OwnerID(), 123456);
end
function DW_Test_Clear(QuestID)
	Global_DW_TempPlayerPool[QuestID]=nil;
	DW_WarfareTable[QuestID]=nil;
	DW_PatrolTable[QuestID]=nil;
end

function DW_TestLockKill()--測試鎖血殺法
	LockHP(OwnerID(),1,"DW_TestSay");
end
function DW_TestSay(x)--測試說話字串
	DebugMsg(0,0,tostring(x));
end
function DW_dialogue()--對話劇情測試
	local player=OwnerID();
	DW_option();
	AddSpeakOption(player, player, "test", "", 0)
	AddSpeakOption(OwnerID(), TargetID(), "Say Something", "Say(TargetID(),\"Something\")", 0);
end
function DW_szLuaScript()--測試用對話劇情(掛在117032下)
	local player = OwnerID();
	local x=1
	AddSpeakOption(player, player, "show me abc", "BeginPlot("..player..",\"dw_test2\" , 0)", 0);
end
function DW_option(p1, p2)--選項測試
	SetSpeakDetail(OwnerID(), "should 2")
	AddSpeakOption(OwnerID(), 0, "option 1", "", 0)
end
function DW_TestRelation()--測試物件相對關係
	local Npc,Player=OwnerID(),TargetID();
	if CheckRelation(Npc,Player,EM_CheckRelationType_Attackable) then
		DebugMsg(0,0,"EM_CheckRelationType_Attackable");
	else
		DebugMsg(0,0,"No1")
	end
	if CheckRelation(Npc,Player,EM_CheckRelationType_Enemy) then
		DebugMsg(0,0,"EM_CheckRelationType_Enemy")
	else
		DebugMsg(0,0,"No2")
	end
	if CheckRelation(Npc,Player,EM_CheckRelationType_InHateList) then
		DebugMsg(0,0,"EM_CheckRelationType_InHateList")
	else
		DebugMsg(0,0,"No3")
	end
end

function Lua_DetectObjAmount()--偵測該區物件數量
	local Player=OwnerID();
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID);
	local LocTable={};
	local AllNum=SetSearchAllNPC(RoomID);
	for SN=1,AllNum,1 do
		local NPC=GetSearchResult();
		local LocX=math.floor(ReadRoleValue(NPC,EM_RoleValue_X)/100);
		local LocZ=math.floor(ReadRoleValue(NPC,EM_RoleValue_Z)/100);
		LocTable[LocX]=LocTable[LocX] or {};
		LocTable[LocX][LocZ] = LocTable[LocX][LocZ] or {};
		table.insert(LocTable[LocX][LocZ],NPC);
	end
	local MaxField=0
	local RecordX,RecordZ;
	local OrgIDAnalysisTable={};
	for LocX,ZTable in pairs(LocTable) do
		for LocZ,IDtable in pairs(ZTable) do
			local TableSpace=#IDtable;
			if TableSpace>MaxField then
				MaxField=TableSpace;
				RecordX=LocX;
				RecordZ=LocZ;
				OrgIDAnalysisTable={}
				for SN,GUID in pairs(IDtable) do
					local OrgID=ReadRoleValue(GUID,EM_RoleValue_OrgID);
					OrgIDAnalysisTable[OrgID]=OrgIDAnalysisTable[OrgID] or 0;
					OrgIDAnalysisTable[OrgID]=OrgIDAnalysisTable[OrgID]+1;
				end
			end
		end
	end
	DebugMsg(RoomID,0,"X between:  "..(RecordX*100).." ~  "..((RecordX+1)*100).."  Z between:  "..(RecordZ*100).." ~  "..((RecordZ+1)*100))
	local MostOrgID,MostAmount=0,0;
	for OrgID,Amount in pairs(OrgIDAnalysisTable) do
		if Amount>MostAmount then
			MostAmount=Amount;
			MostOrgID=OrgID;
		end
	end
	DebugMsg(0,0,"Total of Obj is "..MaxField..". Amoung them, Most OrgID is:"..MostOrgID.."  Their Amount:"..MostAmount);
end
function DW_CurrentTargetHateValue()--讀出目標現在的高度
	local Player,Target=OwnerID(),TargetID();
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID);
	local HateTarget=HateListInfo(ReadRoleValue(Player,EM_RoleValue_AttackTargetID),0,EM_HateListInfoType_GItemID)
	DebugMsg(0,RoomID,GetName(HateTarget)..HateListInfo(ReadRoleValue(Player,EM_RoleValue_AttackTargetID),0,EM_HateListInfoType_HatePoint));
end
function Test_QQ()--可變性測試指令

end

function DW_TestHigh()--調出高度資料
	local Obj=OwnerID();
	local x,y,z,dir=DW_Location(Obj);
	local Ny=Getheight(x,y,z);
	NPCSay(Obj,Ny);
end
function DW_TestCombetProcess()--測試戰鬥流程
	local NPC=OwnerID();
	local IsFighting=false;
	while true do
		while HateListCount(NPC)~=0 do
			IsFighting=true;
			DebugMsg(0,0,"In combat");
			sleep(20);
		end
		if IsFighting==true then
			IsFighting=false;
			DebugMsg(0,0,"Reset");
			SetStopAttack(NPC);
			sleep(30);
			DebugMsg(0,0,"Test");
		end
		sleep(20);
	end
end
function discowood_1()--起飛
	local Obj = OwnerID()
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotion(Obj,ruFUSION_ACTORSTATE_FLY_BEGIN)
end
function discowood_2()--水平飛行用
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_SPIRAL_LOOP)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)
	SetModeEx(Obj,EM_SetModeType_Drag,false) 
end
function discowood_2EX()--上下飛行用
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
end
function discowood_3()--右盤旋
	local Obj = OwnerID()
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
	sleep(5)
	SetDefIdleMotion(Obj,ruFUSION_MIME_FLY_LOOP)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotion(Obj,ruFUSION_ACTORSTATE_SPIRAL_RIGHT)
end
function discowood_4()--左盤旋
	local Obj = OwnerID()
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
	sleep(5)
	SetDefIdleMotion(Obj,ruFUSION_MIME_FLY_LOOP)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotion(Obj,ruFUSION_ACTORSTATE_SPIRAL_LEFT)
end
function discowood_5()--落地
	local Obj = OwnerID()
	PlayMotion(Obj,ruFUSION_ACTORSTATE_FLY_END)
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND_02)
end
function discowood_6()--浮空過渡
	local Obj = OwnerID()
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	SetDefIdleMotion(Obj,ruFUSION_MIME_FLY_LOOP)
	SetModeEx(Obj,EM_SetModeType_Drag,true) 

end
function discowood_7()--出生加速
	local Obj = OwnerID()
	AddBuff(Obj,508176,20,-1)
	Hide(Obj)
	WriteRoleValue(Obj,EM_RoleValue_IsWalk,0)
	Show(Obj,0)
end
function DW_TestOutCombatEvent()--測試離開戰鬥相關
	DebugMsg(0,0,ReadRoleValue(OwnerID(),EM_RoleValue_IsDead));
end
function Lua_PE_DW_1()
	PH_1_Term_1 = 10
	PH_2_Term_1 = 10
	PE_AddPE("[SC_PE_ZONE16_DW_00]","[SC_PE_ZONE16_DW_01]",1,5000)
	PE_AddRegion(1 , 1);
	PE_AddPhase(1, 100, "[SC_PE_ZONE16_DW_12]", "", 100, 1, 1, 0)
	PE_AddPhase(1, 200, "[SC_PE_ZONE16_DW_02]", "[SC_PE_ZONE16_DW_03]", 100, 1, 1, 0)
	PE_PH_AddObjective_EqualAndGreater(1, 100, 101, "[SC_PE_ZONE16_DW_13]", "[SC_PE_ZONE16_DW_14]", "PH_1_Term_1_Name", 0, PH_1_Term_1, true)
	PE_PH_AddObjective_EqualAndGreater(1, 200, 201, "[SC_PE_ZONE16_DW_17]", "", "PH_2_Term_1_Name", 0, PH_2_Term_1, true)
	PE_PH_SetNextPhase(1, 100, 200)
	PE_Start(1,100)
	PE_OB_SetCallBackOnAchieve(1, "Lua_PE_DW_2")
end
function Lua_PE_DW_2() --秀出完成目標的參數
	DeBugMSG(0,0," PH_1_Term_1 = "..PE_GetVar("PH_1_Term_1_Name"))
	DeBugMSG(0,0," PH_2_Term_1 = "..PE_GetVar("PH_2_Term_1_Name"))
end
function DW_WhichIDShowPos(x)--找出2進位欄位的狀態
	local Val_2Bit = x
	local UnCheckArray = {
			
					}
	local Amount = 0
	for index,value in pairs(UnCheckArray) do
		if	CheckBit(value,Val_2Bit)==true	then
			DeBugMSG(0,0,index)
			Amount=Amount+1
		end
	end
	DeBugMSG(0,0,"Total is "..Amount)
end
function LuaS_101017_0()
	local Obj = OwnerID()
	MoveToFlagEnabled(Obj, false)
	SetDefIdleMotion(Obj,ruFUSION_MIME_RUN_FORWARD)
	AddBuff(Obj,508039,1,10)
	local Loc_1 = DW_GetFlagXYZ(780006,1)
	ChangeZone(Obj,43,0,Loc_1[1],Loc_1[2],Loc_1[3],Loc_1[4])



	WriteRoleValue(Obj,EM_RoleValue_Register1,DW_CreateObjEX("flag",112047,780006,2))
	WriteRoleValue(Obj,EM_RoleValue_Register2,DW_CreateObjEX("flag",112047,780006,4))
	local A = ReadRoleValue(Obj,EM_RoleValue_Register1)
	local B = ReadRoleValue(Obj,EM_RoleValue_Register2)

	sleep(5)




	AddBuff(Obj,507926,1,10)
	DW_MoveRand(Obj,0,1,A)
	local Copy = DW_CreateObjEX("flag",101017,780006,3)
	SetDefIdleMotion(Copy,ruFUSION_MIME_RUN_FORWARD)
	AddBuff(Copy,508039,1,10)
	AddBuff(Copy,507926,1,10)
	DW_MoveRand(Copy,0,1,B)
	
	for i=1,15,1 do
		sleep(2)
		if	DW_CheckDis(Obj,780006,2,10)	then
			Hide(Obj)
		end
		if	DW_CheckDis(Copy,780006,4,10)	then
			Hide(Copy)
		end
	end


	Show(Obj,0)
	DelObj(A)
	DelObj(B)
	DelObj(Copy)
end
function LuaS_101017_1()
	local Obj = OwnerID()
	WriteRoleValue(Obj,EM_RoleValue_Register3,3)
end
function DW_AllToShow(ID)
	local Obj = OwnerID()
	local WanttoFind = ID
	local Array = {}
	Array = SearchRangeNPC ( Obj , 300 )
	for i=0,table.getn(Array),1 do
		local Temp = Array[i]
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
DeBugMSG(0,0,"I have been found,and My GID is"..Temp)
			SetModeEx(Temp,EM_SetModeType_Show,true) 
			SpyShow(000008,Temp,0)
		end
	end
end
function DW_Demo_Quest_01()
	Say(OwnerID(),"Now Quest has Accepted  and .........I am Owner")
	Say(TargetID(),"I am Target")
end
function DW_Demo_Quest_02()
	Say(OwnerID(),"Now Quest is Over  and .........I am Owner")
	Say(TargetID(),"I am Target")
end
function DW_Demo_ClickObj_01()
	Say(OwnerID(),"Now Before Click Obj Do Check  and .........I am Owner")
	Say(TargetID(),"I am Target")
end
function DW_Demo_ClickObj_02()
	Say(OwnerID(),"Now After Click Obj Do Something  and .........I am Owner")
	Say(TargetID(),"I am Target")
end
function DW_SetHP(HP)
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,HP)
end
function DW_DebugSearchAllNPC()
	DebugMSG(0,0,SetSearchAllNPC(0))
end
function DW_ShowMyPath(Num)
	local Obj = OwnerID()
	local ZoneID = ReadRoleValue(Obj,EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	local X = ReadRoleValue(Obj,EM_RoleValue_X)
	local Z = ReadRoleValue(Obj,EM_RoleValue_Z)
	local Dir = ReadRoleValue(Obj,EM_RoleValue_Dir)
	local TempY = ReadRoleValue(Obj,EM_RoleValue_Y)-7;
	local Plane = {}

	Plane[1] = DW_CreateObjEX("obj",110987,Obj,0);
	SetModeEx(Plane[1],EM_SetModeType_Gravity,false);
	SetModeEx(Plane[1],EM_SetModeType_Move,false);
	SetModeEx(Plane[1],EM_SetModeType_Obstruct,true);
	AddToPartition(Plane[1],ReadRoleValue(Obj,EM_RoleValue_RoomID));
	SetPos( Plane[1], X, TempY, Z , Dir);
	WriteRoleValue(Plane[1],EM_RoleValue_PID,7788);
	for i=2,Num,1 do
		Plane[i] = Lua_CreateObjByDir( Plane[1] , 110987 , 11*(i-1) , 0) ;
		SetModeEx(Plane[i],EM_SetModeType_Gravity,false);
		SetModeEx(Plane[i],EM_SetModeType_Move,false);
		SetModeEx(Plane[i],EM_SetModeType_Obstruct,true);
		WriteRoleValue(Plane[i],EM_RoleValue_Y,TempY);
		AddToPartition(Plane[i],ReadRoleValue(Obj,EM_RoleValue_RoomID));
		WriteRoleValue(Plane[i],EM_RoleValue_PID,7788);
	end
end
function DW_ClearMyPath()
	local Obj = OwnerID();
	local PathTable = SearchRangeNPC ( Obj , 500 );
	local TempID,IsPath;
	for i=0,table.getn(PathTable) do
		TempID = PathTable[i]
		IsPath=(ReadRoleValue(TempID,EM_RoleValue_PID)==7788)
		if	IsPath==true	then
			DelObj(TempID);
		end
	end
end
function discowood_GetHigh(Y)
	local High
	local Obj = OwnerID()
	local ZoneID = ReadRoleValue(Obj,EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	local X = ReadRoleValue(Obj,EM_RoleValue_X)
	local Z = ReadRoleValue(Obj,EM_RoleValue_Z)
	local Dir = ReadRoleValue(Obj,EM_RoleValue_Dir)
	if	Y==nil	then
		High = 200
	else
		High = Y
	end
	local TempY = ReadRoleValue(Obj,EM_RoleValue_Y)+High-30;
	ChangeZone(Obj,ZoneID,RoomID ,X,ReadRoleValue(Obj , EM_RoleValue_Y)+High,Z,Dir)
	local Plane = DW_CreateObjEX("obj",110987,Obj,0);
	SetModeEx(Plane,EM_SetModeType_Gravity,false);
	SetModeEx(Obj,EM_SetModeType_Move,false);
	SetModeEx(Plane,EM_SetModeType_Obstruct,true);
	AddToPartition(Plane,ReadRoleValue(Obj,EM_RoleValue_RoomID));
	MoveToFlagEnabled(Plane, false)
	SetPos( Plane, X, TempY, Z , 0);
	WriteRoleValue(Plane,EM_RoleValue_LiveTime,4);
end
function DW_toFlag(flagOrgID, flagID)--直接飛到旗標
	local who=OwnerID();
	local x,y,z,dir=DW_Location(flagOrgID, flagID);
	SetPos(who, x,y,z,dir);
end
function discowood_checkbuff(BuffID)--檢查Buff
	local player=OwnerID();
	local Total = BuffCount(player);
	DebugMsg(0, 0, "total="..total);
	for pos=0, total-1, 1 do
		DebugMsg(0, 0, BuffInfo(player, pos, EM_BuffInfoType_BuffID) );
	end
	Debugmsg(0,0,"PowerLv"..DW_GetBuffPowerLv(OwnerID(),BuffID))
end
function tell_dir()
	tell(OwnerID(),OwnerID(), ReadRoleValue(OwnerID() , EM_RoleValue_Dir) )
end
function tell_dis(a, b)--用在小宏測距離上，加在法術檢查裡面
	local player=OwnerID();
	local room=ReadRoleValue(player, EM_RoleValue_RoomID);
	if a and b then
		local x,y,z,dir=DW_Location(a, b);
		tell(OwnerID(),OwnerID(), DW_GetDistance(player, x,y,z) );
	elseif a then
		tell(OwnerID(),OwnerID(), GetDistance( OwnerID(), a ))
	else
		tell(OwnerID(),OwnerID(), GetDistance( OwnerID(), TargetID() ))
	end
end
function LuaTest_WalkFunc()--測試移動
	local Who=OwnerID();
	MoveToFlagEnabled(Who, false);
	local x,y,z,dir=DW_Location(Who);
	x,y,z,dir=DW_NewLocation(0,100,x,y,z,dir);
	WriteRoleValue(Who, EM_RoleValue_IsWalk, 1);
	local Time=Move(Who,x,y,z);
	for MinnSec=1,Time+10,3 do
		sleep(3);
		DebugMsg(0, 0, ReadRoleValue(Who, EM_RoleValue_IsWalk));
	end
end
function discowood_buff(BuffID)
	AddBuff(OwnerID(),BuffID,0,-1)
end
function discowood_ClsBuff(BuffID)
	if not BuffID then
		local player = OwnerID();
		local room = ReadRoleValue(player, EM_RoleValue_RoomID);
		local allbuffnum = BuffCount(player);
		DebugMsg(0, room, "allbuffnum="..allbuffnum)
		for pos=0, allbuffnum, 1 do
			CancelBuff_NoEvent(player, BuffInfo(player, pos, EM_BuffInfoType_BuffID));
		end
		return;
	end
	CancelBuff_NoEvent(OwnerID(),BuffID);
end
function discowood_string(string)
	ScriptMessage(OwnerID(), OwnerID(), 3, string, C_Blue );
	Say(OwnerID(),"Say:");
	Say(OwnerID(),string);
	NPCSay(OwnerID(),"NPC Say:");
	NPCSay(OwnerID(), string);
	Yell(OwnerID(),"Yell:",2);
	Yell(OwnerID(),string,2);
end
function discowood_mail()
	local NPC = SearchRangeNPC(OwnerID(),200)
	for i=0,table.getn(NPC) do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==101441 	then
			Say(NPC[i],"!!")
		end
	end
end

function discowood_test()
	for i=541885,542125,1 do
		SetFlag(OwnerID(),i,1)
	end

	for i=543016,543159,1 do
		SetFlag(OwnerID(),i,1)
	end
end

function discowood_rand()
	Say(OwnerID(),3/2)
	Say(OwnerID(),math.ceil(3/2))
end
function DW_MapID()
	local GUID=OwnerID();
	local x,y,z,dir=DW_Location(GUID);
	DeBugMSG(0,0,"MapID:"..FindMapID( x,y,z ))
end
function discowood_mpfull()
	WriteRoleValue(OwnerID() , EM_RoleValue_MP , ReadRoleValue(OwnerID() , EM_RoleValue_MaxMP))
end
function DW_ForQADepartment(X)
	local Obj = OwnerID()
	local Lv
	if	X ==nil	then
		Lv = 10
	else
		Lv = X
	end
	AddBuff(Obj,506191,Lv-1,-1)
end

function DW_XSpell()
	local Obj = OwnerID()
	local Num = SetSearchAllNPC(0)
	for i=0,Num,1 do
		local Temp = GetSearchResult()
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)~= 117218	then
			SetModeEx(Temp,EM_SetModeType_Save,false) 
			DelObj(Temp)
		end
	end
end
function dw_showGUID()
	local who=OwnerID();
	local room=ReadRoleValue(who, EM_RoleValue_RoomID);
	DebugMsg(0, room, "GUID="..who);
end
function discowood_lottery()
	local Lottery = {}
	local Choose = {}
	local Temp = 0
	for i = 1,49,1 do
		Lottery[i] = i
	end
	for i=1,6,1 do
		Temp = DW_Rand(table.getn(Lottery))
		DeBugMsg(0,0,Lottery[Temp])
		table.remove(Lottery,Temp)
	end
	DeBugMsg(0,0,"------------------")
end
function DW_ReasonOfDisapper(OrgID)
	local Player=OwnerID();
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID)
	local TotalNum=SetSearchAllNPC(RoomID);
	local ID;
	local FuncName;
	for SN=1,TotalNum,1 do
		ID=GetSearchResult();
		if ReadRoleValue(ID,EM_RoleValue_OrgID)==OrgID then
			FuncName=GetLastHidePlotStr(ID);
			DebugMsg(0,RoomID,"---------------");
			if FuncName==nil then
				DebugMsg(0,RoomID,ID.."=nil")
			else
				DebugMsg(0,RoomID,ID.."="..FuncName);
				DebugMsg(0,RoomID,"Function Executer is"..ReadRoleValue(ID,EM_RoleValue_HidePlotOwnerDBID));
				DebugMsg(0,RoomID,"and it's OrgID is"..ReadRoleValue(ID,EM_RoleValue_HidePlotOwnerOrgObjID));
			end
		end
	end
	DebugMsg(0,RoomID,"==============");
end
--[[
function Hide(GUID)--監控Hide
	DesignLog(GUID,ReadRoleValue(GUID,EM_RoleValue_OrgID),"Hide rCode:"..String.format("%06d", rCode ).."  GUID="..GUID.."   DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID))
	--DebugLog(5,"Hide rCode:"..rCode.."  GUID="..GUID.."  OrgID="..ReadRoleValue(GUID,EM_RoleValue_OrgID).." DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID));
	Hide(GUID);
end
function Show(GUID,RoomID)--監控Show
	DesignLog(GUID,ReadRoleValue(GUID,EM_RoleValue_OrgID),"Show rCode:"..String.format("%06d", rCode ).."  GUID="..GUID.."   DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID))
	--DebugLog(5,"Show rCode:"..rCode.."  GUID="..GUID.."  OrgID="..ReadRoleValue(GUID,EM_RoleValue_OrgID).." DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID));
	Show(GUID,RoomID);
end
function DelFromPartition(GUID)--監控DelFromPartition
	DesignLog(GUID,ReadRoleValue(GUID,EM_RoleValue_OrgID),"DelFromPartition rCode:"..String.format("%06d", rCode ).."  GUID="..GUID.."   DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID))
	--DebugLog(5,"DelFromPartition rCode:"..rCode.."  GUID="..GUID.."  OrgID="..ReadRoleValue(GUID,EM_RoleValue_OrgID).." DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID));
	DelFromPartition(GUID);
end
function AddToPartition(GUID,RoomID)--監控AddToPartition
	DesignLog(GUID,ReadRoleValue(GUID,EM_RoleValue_OrgID),"AddToPartition rCode:"..String.format("%06d", rCode ).."  GUID="..GUID.."   DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID))
	--DebugLog(5,"AddToPartition rCode:"..rCode.."  GUID="..GUID.."  OrgID="..ReadRoleValue(GUID,EM_RoleValue_OrgID).." DBID="..ReadRoleValue(GUID,EM_RoleValue_DBID));
	AddToPartition(GUID,RoomID);
end
--]]
function Lua_TestTrigonometric()
	local x,y,z,dir=0,-250,0,0;
	local Mushroom=CreateObj(100052,x+(50*math.cos(0)),y,z-(50*math.sin(0)),dir,1);
	AddToPartition(Mushroom,0);
	WriteRoleValue(Mushroom,EM_RoleValue_LiveTime,5);

	local Box=CreateObj(110987,x+(50*math.cos(math.pi/2)),y,z-(50*math.sin(math.pi/2)),dir,1);
	AddToPartition(Box,0);
	WriteRoleValue(Box,EM_RoleValue_LiveTime,5);
end
function DW_BirthdaySong(Name)
	local s=0
	if(Name==nil)then
		--no name version
		s=1;
	end
	local a=OwnerID();
	local which_word;
	for i=s,6,1 do
		if(ReadRoleValue(a,EM_RoleValue_Register1+i)~=1)then
			which_word=i;
			if(i==6)then
				--reset
				for j=s,6,1 do
					WriteRoleValue(a,EM_RoleValue_Register1+j,0);
				end
				break;
			else
				WriteRoleValue(a,EM_RoleValue_Register1+i,1);
				break;
			end
		end

	end
	if(s==0)then
		--Say Name
		Yell(a,Name,3);
	else
		--hash string list
		local string="[DW_BIRTHDAYSONG_"..which_word.."]"
		Yell(a,string,3);
	end
	return true;
end