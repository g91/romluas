--PE設置

function lua_BloodCSetting_Z4()
	local PEIndex=Global_BloodCZ4Var["PEIndex"] 

	PE_AddPE("SC_Z4ACTPE_1", "SC_Z4ACTPE_1_DESC", PEIndex, 500);
	PE_AddRegion( PEIndex, Global_BloodCZ4Var["Area"] );
	PE_AddRegion( PEIndex, 1);

	PE_AddPhase(PEIndex, 100, "SC_BloodC4_PH1", "", 0, 0, 0, 0);
	PE_AddPhase(PEIndex, 200, "SC_BloodC4_PH2", "", 0, 0, 1, 0);
	PE_AddPhase(PEIndex, 300, "SC_BloodC4_PH3", "", 0, 0, 0, 0);
	PE_AddPhase(PEIndex, 400, "SC_BloodC4_PH4", "", 0, 0, 1, 0);
	PE_AddPhase(PEIndex, 500, "SC_BloodC4_PH5", "", 0, 0, 0, 0);
	PE_AddPhase(PEIndex, 600, "SC_BloodC4_PH6", "", 0, 0, 0, 0);
	PE_AddPhase(PEIndex, 700, "SC_BloodC4_PH7", "", 0, 0, 0, 0);

	PE_PH_AddObjective_TimeLimit(PEIndex, 100, 101, "SC_BloodC4_PH1_SOB1", "",  "Var_BloodCZ4_CD1" , Global_BloodCZ4Var["CDtime"] , 0 , true);

	PE_PH_AddObjective_Equal(PEIndex, 200, 201, "SC_BloodC4_PH2_SOB1", "", "Var_BloodCZ4_1", 0, 15, true);
	PE_PH_AddObjective_Equal(PEIndex, 200, 511, "SC_BloodC4_PH2_FOB1", "", "Var_BloodCZ4_2", 0, 1, false);
	PE_PH_AddObjective_TimeLimit(PEIndex, 200, 611, "SC_BloodC4_PH2_FOB2", "",  "Var_BloodCZ4_CD5" , 1200000, 0, false);--新增時間判斷

	PE_PH_AddObjective_TimeLimit(PEIndex, 300, 301, "SC_BloodC4_PH3_SOB1", "",  "Var_BloodCZ4_CD2" , 60000, 0, true);
	PE_PH_AddObjective_Equal(PEIndex, 300, 511, "SC_BloodC4_PH3_FOB1", "", "Var_BloodCZ4_2", 0, 1, false);

	PE_PH_AddObjective_Equal(PEIndex, 400, 401, "SC_BloodC4_PH4_SOB1", "", "Var_BloodCZ4_3", 0, 1, true);
	PE_PH_AddObjective_Equal(PEIndex, 400, 511, "SC_BloodC4_PH4_FOB1", "", "Var_BloodCZ4_2", 0, 1, false);
	PE_PH_AddObjective_TimeLimit(PEIndex, 400, 611, "SC_BloodC4_PH4_FOB2", "",  "Var_BloodCZ4_CD6" , 1200000, 0, false);--新增時間判斷

	PE_PH_AddObjective_TimeLimit(PEIndex, 500, 501, "SC_BloodC4_PH5_SOB1", "",  "Var_BloodCZ4_CD3" , 15000, 0, true);

	PE_PH_AddObjective_TimeLimit(PEIndex, 600, 601, "SC_BloodC4_PH6_SOB1", "",  "Var_BloodCZ4_CD4" , 5000, 0, true);

	PE_PH_AddObjective_TimeLimit(PEIndex, 700, 701, "SC_BloodC4_PH6_SOB1", "",  "Var_BloodCZ4_CD7" , 1000, 0, true);

	--PE_PH_AddObjective_Equal(1, 500, 501, "Z33_PE1_PHF3_SOB1", "Z33_PE1_PHF3_SOB1_DESC", "Z33_PE1_VAR7", 0, 10, true);



	PE_PH_SetNextPhase(PEIndex, 100, 200);
	PE_PH_SetNextPhase(PEIndex, 200, 300);
	PE_PH_SetNextPhase(PEIndex, 300, 400);
	PE_PH_SetNextPhase(PEIndex, 400, 500);

	PE_OB_SetNextPhase(PEIndex, 200, 511, 600);
	PE_OB_SetNextPhase(PEIndex, 300, 511, 600);
	PE_OB_SetNextPhase(PEIndex, 400, 511, 600);

	PE_OB_SetNextPhase(PEIndex, 200, 611, 700);
	PE_OB_SetNextPhase(PEIndex, 400, 611, 700);

	--PE成功時的CallBack函式
	PE_SetCallBackOnSuccess(PEIndex, "Lua_BloodCZ4_PE_OnSuccess");
	--PE目標達成時的CallBack函式
	PE_OB_SetCallBackOnAchieve( PEIndex, "LuaPE_BloodCZ4_OB_Achieve");
	--PE結算時CallBack函式
	PE_SetCallBackOnBalance( PEIndex, "Lua_BloodCZ4_PE_OnBalance");
	--PE啟動
	 PE_SetUIVisible( PEIndex, false )--不顯示PE介面

	PE_Start( PEIndex, 100 );
end
--事件結束控制
function Lua_BloodCZ4_PE_OnSuccess(PEIndex, PHIndex, OBIndex)
	Global_BloodCZ4Var["CDtime"]= lua_GetTimeEve2Hour() 
	local time=Global_BloodCZ4Var["CDtime"]*60*1000
	PE_PH_AddObjective_TimeLimit(PEIndex, 100, 101, "SC_BloodC4_PH1_SOB1", "",  "Var_BloodCZ4_CD1" , time , 0 , true);
end
--如果事件成功，就正常的切換時態。
function LuaPE_BloodCZ4_OB_Achieve(PEIndex, PHIndex, OBIndex)
	local ctrl=Global_BloodCZ4Var["ctrl"]
		if OBIndex==101 then 
			LuaPE_BloodCZ4GlobalSet()
			CallPlot( ctrl,"lua_BloodCZ4_Show1",ctrl)
		elseif OBIndex==201 then
			local saya=Global_BloodCZ4Var["saya"]
			CallPlot( ctrl,"lua_BloodCZ4_Show2",ctrl )
		elseif OBIndex==301 then
			CallPlot( ctrl,"lua_BloodCZ4_Show3",ctrl )
		elseif OBIndex==401 then
			Global_BloodCZ4Var["FinalPH"]	= OBIndex
			CallPlot( ctrl,"lua_BloodCZ4_Show4",ctrl )
		elseif OBIndex==511 then
			Global_BloodCZ4Var["FinalPH"]	= OBIndex
			CallPlot( ctrl,"lua_BloodCZ4_Show5",ctrl )
		elseif OBIndex==611 then
			CallPlot( ctrl,"lua_BloodCZ4_Show6",ctrl )
		end
end
--給分
--處理獎勵
function Lua_BloodCZ4_PE_OnBalance( PEIndex , GUID , Score )
	local buffID=507607
	local MapID = Global_BloodCZ4Var["Area"]
	local finalPH = Global_BloodCZ4Var["FinalPH"]
	local Gift={ 206778,206777 }
	if CheckBuff( GUID , buffID )==false then 	return end
	if CheckID(GUID) then CancelBuff( GUID,507607 ) end
	if finalPH ==0 then DebugMsg(0,0,"finalPHerror") return end

	if DW_CheckMap( GUID, MapID ) == true or DW_CheckMap( GUID, 1 ) == true then
	else
		DebugMsg(0,0,"Area error")
		return 
	end
	if finalPH==511 then
		ScriptMessage( GUID, GUID , 2,"[SC_BLOODC_SM_2]", 0 )	--無法保護好小夜的話，一切就這樣結束了。
	elseif finalPH~=511 and Score >= 5  then
		ScriptMessage( GUID, GUID , 2, "[SC_BLOODC_SM_3]", 0 )	--因為你的協助，總算是遵守了約定。
		GiveBodyItem( GUID , Gift[1] , 1 )
	elseif finalPH~=511 and Score < 5  then
		ScriptMessage( GUID, GUID , 2,"[SC_BLOODC_SM_3]", 0 )	--因為你的協助，總算是遵守了約定。
		GiveBodyItem( GUID , Gift[2] , 1 )
	end
	return 	
end
--掛於初始物件狀態
function LuaPE_BloodCZ4_OBJinit()
	Global_BloodCZ4Var={}				--開啟一個全域變數
	Global_BloodCZ4Var["ctrl"]=OwnerID()		--將自己塞進變數中
	Global_BloodCZ4Var["Area"]=160		--(預設)先設定在我的測試區944
	Global_BloodCZ4Var["flagID"] = 781182
	Global_BloodCZ4Var["PEIndex"]  = 4
	Global_BloodCZ4Var["CDtime"] = lua_GetTimeEve2Hour()*60*1000

	lua_testCreateFlag_Scattering()			--產生旗子
	LuaPE_BloodCZ4GlobalSet()				--呼叫設定其它變數
	lua_BloodCSetting_Z4()				--呼叫設定PE
end
--階段控制歸零
function LuaPE_BloodCZ4GlobalSet()
	PE_SetVar("Var_BloodCZ4_1",0)
	PE_SetVar("Var_BloodCZ4_2",0)
	PE_SetVar("Var_BloodCZ4_3",0)
	Global_BloodCZ4Var["var"]=0
	Global_BloodCZ4Var["FinalPH"] = 0
	Global_BloodC_MonsterList=nil
	Global_BloodC_MonsterList={}
end


--S1：SHOW1
function lua_BloodCZ4_Show1(ctrl)
	local flagID=Global_BloodCZ4Var["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	local town = 0
	local saya =0
	local player ={}
	local ctrl = Global_BloodCZ4Var["ctrl"]

	CallPlot( ctrl,"lua_BloodC_PE_HideAllMonster",0)
	Sleep(30)
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",1 )
	Sleep(30)
	town = CreateObjByFlag( 103001 , flagID , 5 , 1 ) 
	WriteRoleValue( town , EM_RoleValue_IsWalk , 0 )
 		SetModeEx( town, EM_SetModeType_Fight , false )
		SetModeEx( town, EM_SetModeType_Strikback, false )
		SetModeEx( town, EM_SetModeType_Searchenemy, false )
		SetModeEx( town, EM_SetModeType_Mark, false )
		SetModeEx( town, EM_SetModeType_HideName, false )--名稱
 		SetModeEx( town, EM_SetModeType_ShowRoleHead, false )--頭像框
	MoveToFlagEnabled( town , false )
	AddToPartition( town , RoomID )
	Setflag( town,544801, 1)
	LuaFunc_MoveToFlag( town, flagID , 2 ,0 ) 
	player = SearchRangePlayer( town,150 )
		if player[0]~=nil	then
			AdjustFaceDir( town,player[0],0 )
		else
			FaceFlag ( town, flagID , 3 )
			AdjustDir( town, 0 )
		end
	NpcSay( town,"[SC_420927_5]")
	Sleep(10)
	PlayMotion( town,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(10)
	NpcSay( town,"[SC_424327_1]")
	Sleep(5)
	local monster = CreateObjByFlag( 103016 , flagID , 1 , 1 ) 
		SetModeEx( monster, EM_SetModeType_Strikback, false )
		SetModeEx( monster, EM_SetModeType_Searchenemy, false )
		SetModeEx( monster, EM_SetModeType_Mark, false )
	AddToPartition( monster , RoomID )
	Setflag( monster,544801, 1)	
	AddBuff( monster,507608,0,-1)
	AdjustFaceDir( monster,town,0)
	AdjustFaceDir( town,monster,0)
		NpcSay( town, "[SC_102706_08]" )	--噢！不！這是什麼東西！
	Sleep(20)
	PlayMotion( monster,ruFUSION_ACTORSTATE_CAST_SP01 )
	Sleep(5)
	KillID( monster,town )
	Sleep(20)
	DelObj( town )
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",2 )
	Sleep(20)
	Global_BloodCZ4Var["saya"]= CreateObjByFlag( 103019 , flagID , 5 , 1 ) 
	saya=Global_BloodCZ4Var["saya"]
		SetModeEx( saya, EM_SetModeType_Mark, false )
		SetModeEx( saya, EM_SetModeType_Strikback, false )
		SetModeEx( saya, EM_SetModeType_Searchenemy, false )
		WriteRoleValue( saya ,EM_RoleValue_IsWalk , 0  )
		MoveToFlagEnabled( saya,false)
	AddToPartition( saya , RoomID )
	AddBuff( saya,507609,0,-1)
	AdjustFaceDir( saya,monster,0)
	LuaFunc_MoveToFlag( saya, flagID , 4 ,0 ) 
	Sleep(10)
	SetDefIdleMotion( saya,ruFUSION_MIME_ATTACK_2H )
	Sleep(10)	
	CastSpellLV( saya , monster , 498962 , 0 )
	Sleep(15)
	KillID( saya,monster )
	Sleep(30)
	SetStopAttack( saya )
	LuaFunc_MoveToFlag( saya, flagID , 2 ,0 ) 
	SetDefIdleMotion( saya,11 )
	Sleep( 10 )
		if player[0]~=nil	then
			AdjustFaceDir( saya,player[0],0 )
		end
	Sleep( 20 )
	NpcSay( saya,"[SC_JPTIEUP_MODE1_01_1]" )
	Sleep( 40 )
	NpcSay( saya,"[SC_JPTIEUP_MODE1_01_2]" )
	Sleep( 40 )
	NpcSay( saya,"[SC_JPTIEUP_MODE1_01_3]" )
	PlayMotion( saya,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 )
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",3 )
	SetPlot( saya,"dead","lua_BloodCSayaDeadDrama",0 )
		SetModeEx( saya, EM_SetModeType_Mark, true )
		SetModeEx( saya, EM_SetModeType_Strikback, true )
		SetModeEx( saya, EM_SetModeType_Searchenemy, true )
	SetDefIdleMotion( saya,ruFUSION_MIME_IDLE_COMBAT_2H )
	NpcSay( saya,"[SC_JPTIEUP_MODE1_03]" )
	Sleep(10)
	CallPlot( saya,"lua_BloodCZ4CreatMonster_PH1",0)
end
--S2：SHOW2
function lua_BloodCZ4_Show2(ctrl)
	Sleep(20)
	local saya=Global_BloodCZ4Var["saya"]
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",4 )
	Sleep(20)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_04]" )
	Sleep(10)
	CallPlot( saya,"lua_BloodCZ4CreatMonster_PH2",0)
end
--S3：SHOW3
function lua_BloodCZ4_Show3(ctrl)
	local saya=Global_BloodCZ4Var["saya"]
	Global_BloodCZ4Var["var"]=1
	Sleep(20)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_02_1]" )
	Sleep( 40 )
	NpcSay( saya,"[SC_JPTIEUP_MODE1_02_2]" )
	Sleep( 30 )
	NpcSay( saya,"[SC_JPTIEUP_MODE1_02_3]" )
	Sleep(10)
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",5 )
	Sleep(60)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_06]" )
	Sleep(10)
	CallPlot( saya,"lua_BloodCZ4CreatMonster3",0)
end
--S4：SHOW4
function lua_BloodCZ4_Show4(ctrl)
	local saya=Global_BloodCZ4Var["saya"]
	local flagID=Global_BloodCZ4Var["flagID"]
	lua_BloodCZ4_DelAllMonster()
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",6 )
	SetDefIdleMotion( saya,11 )
	WriteRoleValue( saya ,EM_RoleValue_IsWalk , 1  )
	Sleep(20)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_07]" )
	Sleep(50)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_08_1]" )
	Sleep(40)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_08_2]" )
	Sleep(40)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_08_3]" )
	LuaFunc_MoveToFlag( saya, flagID , 5 ,0 ) 
	Sleep(30)
	DelObj ( saya )
	DesignLog( ctrl,103019,"PE_Success!" )
	Global_BloodCZ4Var["saya"]=nil
	lua_BloodC_PE_ShowAllMonster()
end
--S5：第五，失敗階段表演
function lua_BloodCZ4_Show5(ctrl)
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",7 )
	local saya=Global_BloodCZ4Var["saya"]
	Sleep(40)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_09]" )
	Sleep(40)
	DelObj( saya )
	DesignLog( ctrl,103019,"PE_fail!" )
	Global_BloodCZ4Var["saya"]=nil	
	lua_BloodC_PE_ShowAllMonster()
end
--S6：SHOW611
function lua_BloodCZ4_Show6(ctrl)
	local saya=Global_BloodCZ4Var["saya"]
	CallPlot( ctrl,"lua_BloodCZ4_SMG2Player",0 )
	Sleep(10)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_09]" )
	Sleep(10)
	KillID( ctrl,saya )
	Sleep(50)
	local saya=Global_BloodCZ4Var["saya"]
	DelObj(saya)
	DesignLog( ctrl,103019,"PE_fail!" )
	Global_BloodCZ4Var["saya"]=nil	
	lua_BloodC_PE_ShowAllMonster()
end
--刪除所有還在的怪物
function lua_BloodCZ4_DelAllMonster()
	for index,value in pairs(Global_BloodC_MonsterList) do
		if Global_BloodC_MonsterList[index] then
			DelObj(index);
			Global_BloodC_MonsterList[index]=nil;
		end
	end
	Global_BloodC_MonsterList=nil
end
--小夜死亡劇情(死亡時切換PH=5)
function lua_BloodCSayaDeadDrama()
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )--反擊
	lua_BloodCZ4_DelAllMonster()
	PE_AddVar("Var_BloodCZ4_2",1) 
	local flagID = Global_BloodCZ4Var["flagID"]
	local sayi = Lua_DW_CreateObj("obj" , 103019 , OwnerID() )  
	PlayMotion( sayi,ruFUSION_ACTORSTATE_DEAD )
	SetModeEx( sayi, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( sayi, EM_SetModeType_Mark, false )--標記
	SetModeEx( sayi, EM_SetModeType_Move, false )--移動
 	SetModeEx( sayi, EM_SetModeType_Searchenemy, false )--索敵
 	SetModeEx( sayi, EM_SetModeType_HideName, false )--名稱
 	SetModeEx( sayi, EM_SetModeType_ShowRoleHead, false )--頭像框
 	SetModeEx( sayi, EM_SetModeType_Fight , false )--可砍殺攻擊
	Global_BloodCZ4Var["saya"]=sayi
	DelObj( OwnerID() )
end
--第一階段創怪呼叫
function lua_BloodCZ4CreatMonster_PH1()
	DebugMsg(0,0,"--MONSTER：1--")
	for i=5,15,5 do
		lua_BloodCZ4CreatMonsterSet(i)
	end
end
--第一階段產怪SET
function lua_BloodCZ4CreatMonsterSet(i)
	local saya=Global_BloodCZ4Var["saya"]
	local flagID=Global_BloodCZ4Var["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	Sleep(10)
	if (PE_GetVar("Var_BloodCZ4_1")+3)<=15 then
		local monster = CreateObjByFlag( 103017 , flagID , i , 1 ) 
			AddToPartition( monster , RoomID )
			Setflag(monster,544801, 1)
			Global_BloodC_MonsterList[monster]=true
			WriteRoleValue( monster,EM_RoleValue_PID,i )
			CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
			setplot( monster,"dead","lua_BloodCZ4MonsterDeadDrama",0)
	end
	return true
end
--第一階段怪物死亡劇情
function lua_BloodCZ4MonsterDeadDrama()
	local obj = OwnerID()
	local i=ReadRoleValue( OwnerID(),EM_RoleValue_PID )	
	PE_AddVar("Var_BloodCZ4_1",1)
	Global_BloodC_MonsterList[obj]=nil	--釋放空間
	lua_BloodCZ4_GiveScore()
	lua_BloodCZ4CreatMonsterSet(i)
end
--怪物的初始劇情
function Lua_BloodCZ4_MonsterDramaInit()
	local saya = Global_BloodCZ4Var["saya"]
	local obj = OwnerID()
	if saya~=nil then
		AdjustFaceDir( obj,saya,0 )
	end
	CastSpell( obj,obj,499653 )
	Sleep(10)
	if saya~=nil then
		AdjustFaceDir( obj,saya,0 )
 		SetAttack( obj,saya )
	end
end
--第二階段創怪
function lua_BloodCZ4CreatMonster_PH2()
	local saya=Global_BloodCZ4Var["saya"]
	local flagID=Global_BloodCZ4Var["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
		for i=5,15,5 do
			local monster =AgProUse_01( flagID,i,103016,1,50 )
			--SetAttack( monster,saya )
			Global_BloodC_MonsterList[monster]=true
			AddToPartition( monster, RoomID )
			Setflag(monster,544801, 1)
			CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
			setplot( monster,"dead","lua_BloodCZ4MonsterDead_PH",0)
		end
		for i=10,15,5 do
			local monster =AgProUse_01( flagID,i,103017,1,50 )
			Global_BloodC_MonsterList[monster]=true
			AddToPartition( monster, RoomID )
			Setflag(monster,544801, 1)
			CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
			setplot( monster,"dead","lua_BloodCZ4MonsterDead_PH",0)
		end
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1)==0 then
		CallPlot(saya,"lua_BloodCZ4CreatMonster_PH2_1",0)	
	end	
end
--
function lua_BloodCZ4CreatMonster_PH2_2(x)
	local flagID=Global_BloodCZ4Var["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	local monList ={ 103016,103017 }
	local flagNum ={ 5,10,15 }
	for i=1,x,1 do
		local num1 = rand( 2 )+1
		local num2 = rand( 3 )+1
		local monster =AgProUse_01( flagID,flagNum[num2],monList[num1],1,50 )
			Global_BloodC_MonsterList[monster]=true
			AddToPartition( monster, RoomID )
			Setflag(monster,544801, 1)
			CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
			setplot( monster,"dead","lua_BloodCZ4MonsterDead_PH",0)
	end
end
function lua_BloodCZ4CreatMonster_PH2_1()
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1)
	local num=0
	local time=0
	while true do
		if Global_BloodCZ4Var["var"]==1	then	break	end
		for index,value in pairs(Global_BloodC_MonsterList) do
			if Global_BloodC_MonsterList[index] then
				num=num+1
			end
		end
		if num>=10 then
			--什麼事都沒作
		elseif num >=5 and time ==18 then
			local tmp=10-num
			CallPlot(OwnerID(),"lua_BloodCZ4CreatMonster_PH2_2",tmp)			
			time=0
		elseif num<=1 or time ==18 then
			CallPlot(OwnerID(),"lua_BloodCZ4CreatMonster_PH2",0)
			time=0
		end
		Sleep(10)
		time=time+1
		num=0
	end
end
--第二階段死亡劇情
function lua_BloodCZ4MonsterDead_PH()
	local obj=OwnerID()	
	if obj==nil then return end
	Global_BloodC_MonsterList[obj]=nil;	--釋放空間
	lua_BloodCZ4_GiveScore()
end
--第三階段生怪
function lua_BloodCZ4CreatMonster3()
	DebugMsg(0,0,"--MONSTER：3--")
	local saya=Global_BloodCZ4Var["saya"]
	local flagID=Global_BloodCZ4Var["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	local monster = CreateObjByFlag( 103018 , flagID , 5 , 1 ) 
		Global_BloodC_MonsterList[monster]=true
		AddToPartition(  monster, RoomID )
		Setflag(monster,544801, 1)
		CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
		setplot( monster,"dead","lua_BloodCZ4MonsterDeadDrama3",0)
		lua_BloodCZ4CreatMonster_PH3()
end
--第三階段創小怪
function lua_BloodCZ4CreatMonster_PH3()
	local saya=Global_BloodCZ4Var["saya"]
	local flagID=Global_BloodCZ4Var["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
		for i=6,14,2 do
			local monster =AgProUse_01( flagID,i,103016,1,50 )
			--SetAttack( monster,saya )
			Global_BloodC_MonsterList[monster]=true
			AddToPartition( monster, RoomID )
			Setflag(monster,544801, 1)
			CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
			setplot( monster,"dead","lua_BloodCZ4MonsterDead_PH",0)
		end
		for i=7,15,2 do
			local monster =AgProUse_01( flagID,i,103017,1,50 )
			Global_BloodC_MonsterList[monster]=true
			AddToPartition( monster, RoomID )
			Setflag(monster,544801, 1)
			CallPlot( monster,"Lua_BloodCZ4_MonsterDramaInit",0)
			setplot( monster,"dead","lua_BloodCZ4MonsterDead_PH",0)
		end	
end
--第三階段死亡劇情
function lua_BloodCZ4MonsterDeadDrama3()
	local obj=OwnerID()
	PE_AddVar("Var_BloodCZ4_3",1)
	Global_BloodC_MonsterList[obj]=nil;	--釋放空間
	lua_BloodCZ4_GiveScore()
end
--給分
function lua_BloodCZ4_GiveScore()
	Local num = HateListCount( OwnerID() )
	local PEIndex = Global_BloodCZ4Var["PEIndex"]	
	local score =1
	for i=0,num-1 do
		local ID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID );
		local HatePoint = HateListInfo(OwnerID() ,i , EM_HateListInfoType_HatePoint );
		if ReadRoleValue( ID , EM_RoleValue_IsNPC ) ~= 1 and HatePoint>=30 then
			AddBuff( ID,507607,0,-1 )
			PE_GivePlayerScore( PEIndex , ID, score )
		end
	end
end
--取得距離每2小時整點的時間
function lua_GetTimeEve2Hour()
	local v_hours = GetSystime(1)%2	--取得時
	local v_min = 60-GetSystime(2)	--取得分
	local num=0
	if v_hours == 0 and v_min == 60 then
		num = 0
	elseif v_hours == 0 and v_min < 60 then
		num = v_min + 60
	elseif v_hours ==1 and v_min <=60 then
		num = v_min
	else
		DebugMsg(0,0,"ActPE_TimeCD_Error!!")
	end
		DebugMsg(0,0,"ActPE_TimeCD_"..num)
		return num
end
--為了範圍發話另外寫
function lua_BloodCZ4_SMG2Player( x )
	local ctrl=Global_BloodCZ4Var["ctrl"]
	local playerList = SearchRangePlayer( ctrl,350 )
	local stringList = {}
	stringList[0] ="[SC_BLOODC_SM_4]"
	stringList[1] ="[SC_BLOODC_SHOW1_1]"	
	stringList[2] ="[SC_BLOODC_SHOW1_2]"	
	stringList[3] ="[SC_BLOODC_SHOW1_3]"	
	stringList[4] ="[SC_BLOODC_SHOW2_1]"	
	stringList[5] ="[SC_BLOODC_SHOW3_1]"	
	stringList[6] ="[SC_BLOODC_SHOW4_1]"	--最強大的目標被擊倒後，敵人也隨之消失殆盡
	stringList[7] ="[SC_BLOODC_SHOW5_1]"	--[103019]被古物擊倒了！
	DebugMsg( 0,0,"DebugMsg,Show,Msg")
	for i=0,#playerList-1 do
			ScriptMessage( ctrl, playerList[i] , 2, stringList[x] , 0 )
	end
end
--AgProUse_01說明：在旗子(FlagObjID)編號(FlagID)附近隨機產生npc(OrgID),填入數量(amount),半徑(Range),並直接加入場景
function AgProUse_01(FlagObjID,FlagID,OrgID,amount,Range)
	local OldX = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X );
	local OldY= GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y );
	local OldZ = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z );
	local dir= GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_Dir);
	local RoomID = ReadRoleValue(FlagObjID,EM_RoleValue_RoomID);
	local ObjTable = {};
	while #ObjTable < amount do
		local RanNum = math.random(360);
		local X = OldX -Rand(Range)*math.cos(math.pi/180*RanNum);
		local Z = OldZ +Rand(Range)*math.sin(math.pi/180*RanNum);
		local Y = GetHeight( X , OldY , Z );
			local GUID = CreateObj(OrgID,X,Y,Z,dir,1);
			if CheckLine( GUID , X,Y,Z ) then
				ObjTable[#ObjTable+1] = GUID
			else
				DelObj( GUID )
			end
	end
	--直接加入場景
	--	for k,v in pairs(ObjTable) do
	--		AddToPartition(v,RoomID);
	--	end
	if amount==1 then
	return ObjTable[1];
	else
	return ObjTable;
	end
end
--初始劇情，無血條、死亡
function AG_NoHPMP()
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
end
--從一個指定地點產生一次散射的坐標旗子
function lua_testCreateFlag_Scattering()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182

 	local Inc = 0;
	for i = 0 , 5 , 1 do	
				local tmpY = GetHeight(BaseX+i*40*math.cos(BaseDir*math.pi/180),BaseY,BaseZ-i*40*math.sin(BaseDir*math.pi/180) )
				CreateFlag( flag , Inc  , BaseX+i*40*math.cos(BaseDir*math.pi/180),tmpY,BaseZ-i*40*math.sin(BaseDir*math.pi/180),BaseDir  )		
				Inc = Inc + 1	
		Sleep( 1 )
	end  
	for i = 0 , 4 , 1 do
				local tmpY = GetHeight( BaseX+i*40*math.cos((BaseDir+60)*math.pi/180),BaseY,BaseZ-i*40*math.sin((BaseDir+60)*math.pi/180) )			
				CreateFlag( flag , Inc  , BaseX+i*40*math.cos((BaseDir+60)*math.pi/180),tmpY,BaseZ-i*40*math.sin((BaseDir+60)*math.pi/180),(BaseDir+60)  )		
				Inc = Inc + 1		
		Sleep( 1 )
	end  
	for i = 0 , 4 , 1 do
				local tmpY = GetHeight( BaseX+i*40*math.cos((BaseDir-60)*math.pi/180),BaseY,BaseZ-i*40*math.sin((BaseDir-60)*math.pi/180) )	
				CreateFlag( flag , Inc  , BaseX+i*40*math.cos((BaseDir-60)*math.pi/180),tmpY,BaseZ-i*40*math.sin((BaseDir-60)*math.pi/180),(BaseDir-60)  )		
				Inc = Inc + 1		
		Sleep( 1 )
	end  
end
--從一個指定地點產生圓型的旗標
function lua_AgCreateFlag_DoubleCircle()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182
	local dis=20
	CreateFlag( flag , 0  , BaseX,BaseY,BaseZ,BaseDir  )
 	local Inc = 1;
	for j=1,4,1 do
		for i = 1 , 7 , 2 do
			local tmpY = GetHeight(	BaseX+dis*math.cos(2*math.pi*(i/8)),BaseY,BaseZ-dis*math.sin(2*math.pi*(i/8)) )
			CreateFlag( flag , Inc  , BaseX+dis*math.cos(2*math.pi*(i/8)),tmpY,BaseZ-dis*math.sin(2*math.pi*(i/8)),BaseDir  )		
			Inc = Inc + 1	
			Sleep( 1 )
		end 
		dis=dis+10
		for i = 2 , 8 , 2 do
			local tmpY = GetHeight(	BaseX+dis*math.cos(2*math.pi*(i/8)),BaseY,BaseZ-dis*math.sin(2*math.pi*(i/8)) )		
			CreateFlag( flag , Inc  , BaseX+dis*math.cos(2*math.pi*(i/8)),tmpY,BaseZ-dis*math.sin(2*math.pi*(i/8)),BaseDir  )		
			Inc = Inc + 1	
			Sleep( 1 )
		end  
		dis=dis+30
	end
end
