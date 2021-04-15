	--�r��W�h--
--SC_�}�Y�G�N��r��C
--lua_�}�Y�G�N��function�C
--Var_�}�Y�G�N��A���ܼƳ]�w�C
--Global_�}�Y�G�����ܼơC

function lua_BloodCSetting_Z21()
	local PE=Global_BloodCVar["PEIndex"] 	--�]�wPE
	
	PE_AddPE("SC_Z21ACTPE_1", "SC_Z21ACTPE_1_DESC", PE , 500);
	PE_AddRegion(PE,Global_BloodCVar["Area"]);
	PE_AddRegion(PE,1);

	PE_AddPhase( PE, 100, "SC_BloodC_PH1", "SC_BloodC_PH1_DESC", 0, 0, 0, 0);	--�h�g�����q
	PE_AddPhase( PE, 200, "SC_BloodC_PH2", "SC_BloodC_PH2_DESC", 0, 0, 0, 0);
	PE_AddPhase( PE, 300, "SC_BloodC_PH3", "SC_BloodC_PH3_DESC", 0, 0, 1, 0);
	PE_AddPhase( PE, 400, "SC_BloodC_PH4", "SC_BloodC_PH4_DESC", 0, 0, 1, 0);
	PE_AddPhase( PE, 500, "SC_BloodC_PH5", "SC_BloodC_PH5_DESC", 0, 0, 1, 0);
	PE_AddPhase( PE, 600, "SC_BloodC_SUC", "SC_BloodC_PHSUC_DESC", 0, 0, 0, 0);
	PE_AddPhase( PE, 700, "SC_BloodC_SUC", "SC_BloodC_PHSUC_DESC", 0, 0, 0, 0);
	
	PE_PH_AddObjective_TimeLimit( PE, 100, 101, "SC_BloodC_PH1_SOB1", "",  "Var_BloodC_CD" , 500 , 0 , true);	
	PE_PH_AddObjective_TimeLimit( PE, 200, 201, "SC_BloodC_PH1_SOB1", "",  "Var_BloodC_CD1" , Global_BloodCVar["time"] , 0 , true);

	PE_PH_AddObjective_Equal( PE, 300, 301, "SC_BloodC_PH2_SOB1", "", "Var_BloodCPHOB_1", 0, 15, true);

	PE_PH_AddObjective_Equal( PE, 300, 511, "SC_BloodC_PH2_FOB1", "", "Var_BloodCPHOB_3", 0, 3, false);
	PE_PH_AddObjective_Equal( PE, 300, 512, "SC_BloodC_PH2_FOB2", "", "Var_BloodCPHOB_4", 0, 1, false);
	PE_PH_AddObjective_TimeLimit( PE, 300, 611, "SC_BloodC_PH3_SOB1", "",  "Var_BloodC_CD5" , 1200000, 0, false);

	PE_PH_AddObjective_TimeLimit( PE, 400, 401, "SC_BloodC_PH3_SOB1", "",  "Var_BloodC_CD2" , 120000, 0, true);

	PE_PH_AddObjective_Equal( PE, 400, 511, "SC_BloodC_PH3_FOB1", "", "Var_BloodCPHOB_3", 0, 3, false);
	PE_PH_AddObjective_Equal( PE, 400, 512, "SC_BloodC_PH3_FOB1", "", "Var_BloodCPHOB_4", 0, 1, false);


	PE_PH_AddObjective_Equal( PE, 500, 501, "SC_BloodC_PH4_SOB1", "", "Var_BloodCPHOB_2", 0, 1, true);
--	PE_PH_AddObjective_Equal( PE, 500, 502, "SC_BloodC_PH4_SOB1", "", "Var_BloodCPHOB_5", 0, 5, true);

	PE_PH_AddObjective_Equal( PE, 500, 511, "SC_BloodC_PH4_FOB1", "", "Var_BloodCPHOB_3", 0, 3, false);
	PE_PH_AddObjective_Equal( PE, 500, 512, "SC_BloodC_PH4_FOB1", "", "Var_BloodCPHOB_4", 0, 1, false);
	PE_PH_AddObjective_TimeLimit( PE, 500, 611, "SC_BloodC_PH3_SOB1", "",  "Var_BloodC_CD6" , 1200000, 0, false);

	PE_PH_AddObjective_TimeLimit( PE, 600, 601, "SC_BloodC_PH5_SOB1", "",  "Var_BloodC_CD3" , 30000, 0, true);
	PE_PH_AddObjective_TimeLimit( PE, 700, 701, "SC_BloodC_PH5_SOB1", "",  "Var_BloodC_CD4" , 8000, 0, true);

	PE_PH_SetNextPhase( PE , 100 , 200 )
	PE_PH_SetNextPhase( PE , 200 , 300 )
	PE_PH_SetNextPhase( PE , 300 , 400 )
	PE_PH_SetNextPhase( PE , 400 , 500 )
	PE_PH_SetNextPhase( PE , 500 , 600 )

	PE_OB_SetNextPhase( PE, 500, 501, 600);
	PE_OB_SetNextPhase( PE, 300, 511, 700);
	PE_OB_SetNextPhase( PE, 300, 512, 700);
	PE_OB_SetNextPhase( PE, 400, 511, 700);
	PE_OB_SetNextPhase( PE, 400, 512, 700);
	PE_OB_SetNextPhase( PE, 500, 511, 700);
	PE_OB_SetNextPhase( PE, 500, 512, 700);

	PE_OB_SetNextPhase( PE, 300, 611, 700);
	PE_OB_SetNextPhase( PE, 500, 611, 700);

	--PE���q���\�ɪ�CallBack�禡
	PE_SetCallBackOnSuccess(PE, "Lua_Z21BloodC_PE_OnSuccess");
	--PE���q���\�ɪ�CallBack�禡
	PE_PH_SetCallBackOnSuccess( PE, "Lua_Z21BloodC_PH_OnSuccess" );
	--PE�ؼйF���ɪ�CallBack�禡
	PE_OB_SetCallBackOnAchieve( PE, "Lua_Z21BloodC_OB_Achieve" );
	--PE�����CallBack�禡
	PE_SetCallBackOnBalance( PE , "Lua_Z21BloodC_PE_OnBalance" )
	--PE�Ұ�

	 PE_SetUIVisible( PE, false )--�����PE����

	PE_Start(  PE, 100 );
end
--PE�ؼйF���ɪ�CallBack�禡
function Lua_Z21BloodC_OB_Achieve(PEIndex, PHIndex, OBIndex)
	local flagID=Global_BloodCVar["flagID"]
	local ctrl = Global_BloodCVar["ctrl"]
	if OBIndex==101 then
		Global_BloodCVar["FinalPH"] = 0 
		Global_BloodCVar["saya"] = CreateObjByFlag( 104126 , flagID , 5 , 1 ) 
		DebugMsg(0,0,"PE_ALREADY_ENTER_CDING!")
	elseif OBIndex==511 or OBIndex==512 then
		local saya = Global_BloodCVar["saya"] 
		local fumito = Global_BloodCVar["fumito"]
		CallPlot( ctrl,"lua_BloodC_PHShow5",ctrl,saya,fumito )
	elseif OBIndex==611 then
		local saya = Global_BloodCVar["saya"] 
		local fumito = Global_BloodCVar["fumito"]
		CallPlot( ctrl,"lua_BloodC_PHShow6",ctrl,saya,fumito )
	end
end
--PE���q���\�ɪ�CallBack�禡
function Lua_Z21BloodC_PH_OnSuccess(PEIndex, PHIndex, OBIndex)
	--Ū�J�ܼ�
	local ctrl = Global_BloodCVar["ctrl"]
	local saya = Global_BloodCVar["saya"] 
	--DebugMsg(0,0,"OnPHIndex="..PHIndex)
	if PHIndex==200 then 
		CallPlot( ctrl,"lua_BloodC_PHShow1",ctrl,saya )
	elseif PHIndex==300 then
		local fumito = Global_BloodCVar["fumito"]
		CallPlot( ctrl,"lua_BloodC_PHShow2",ctrl,saya,fumito )
	elseif PHIndex==400 then
		local fumito = Global_BloodCVar["fumito"]
		CallPlot( ctrl,"lua_BloodC_PHShow3",ctrl,saya,fumito )
	elseif PHIndex==500 then
		local saya = Global_BloodCVar["saya"] 
		local fumito = Global_BloodCVar["fumito"]
		CallPlot( ctrl,"lua_BloodC_PHShow4",ctrl,saya,fumito )
	end
end

--���y
function Lua_Z21BloodC_PE_OnBalance( PEIndex , GUID , Score )
	local buffID = 507607
	local MapID = Global_BloodCVar["Area"]
	local finalPH = Global_BloodCVar["FinalPH"]
	local Gift={ 206779,206777 }
	if CheckBuff( GUID , buffID )==false then 	 return 	end
	if CheckID(GUID) then CancelBuff( GUID,buffID ) end
	if finalPH ==0 then DebugMsg(0,0,"finalPHerror") return end

	if DW_CheckMap( GUID, MapID ) == true or DW_CheckMap( GUID, 1 ) == true then
	else
--		DebugMsg(0,0,"Area error")
		return 
	end
	if finalPH==3 then
		ScriptMessage( GUID, GUID , 2,"[SC_BLOODC_SM_1]", 0 )	--�L�k�O�@�n�p�]���ܡA�@���N�o�˵����F�C
	elseif finalPH==2 then
		ScriptMessage( GUID, GUID , 2,"[SC_BLOODC_SM_2]", 0 )	--���M���ѤF�A���O�w�g�V�O�ľԹL�F�C
		GiveBodyItem( GUID , Gift[2] , 1 )	
	elseif finalPH==1 and Score < 5 then
		ScriptMessage( GUID, GUID , 2, "[SC_BLOODC_SM_3]", 0 )	--�]���A����U�A�`��O��u�F���w�C
		GiveBodyItem( GUID , Gift[2] , 1 )	
	elseif finalPH==1 and Score >= 5 then
		ScriptMessage( GUID, GUID , 2, "[SC_BLOODC_SM_3]", 0 )	--�]���A����U�A�`��O��u�F���w�C
		GiveBodyItem( GUID , Gift[finalPH] , 1 )	
	end
	return
end
--�ɶ�����
function Lua_Z21BloodC_PE_OnSuccess(PEIndex, PHIndex, OBIndex)
	Global_BloodCVar["time"] = lua_GetTimeEve2Hour()*60*1000
--	Global_BloodCVar["time"] = 3000
	local time=Global_BloodCVar["time"]
	PE_PH_AddObjective_TimeLimit( PEIndex, 200, 201, "SC_BloodC_PH1_SOB1", "",  "Var_BloodC_CD1" , time , 0 , true);
end
--�����l���󪬺A
function Lua_Z21BloodCPE_OBJinit()
	Global_BloodCVar={}
	Global_HideAllMonster={}

	Global_BloodCVar["ctrl"]=OwnerID()				--�O������
	Global_BloodCVar["time"] = lua_GetTimeEve2Hour()*60*1000	--�O���C��PE���j�ɶ�
--	Global_BloodCVar["time"] = 3000
	Global_BloodCVar["Area"] = 334					--�O������PE�ϰ�
	Global_BloodCVar["flagID"] = 781182				--�O���@�P�κX��ID
	Global_BloodCVar["PEIndex"] = 4

	lua_AgCreateFlag_DoubleCircle()		--�H��������߲��Ͷꫬ�X�l
	Lua_Z21BloodCGlobal_init()			--�I�s�Ҧ�Var��l��
	lua_BloodCSetting_Z21()			--PE�]�m�Ұ�
end
--�ܼƪ�l��
function Lua_Z21BloodCGlobal_init()
	PE_SetVar("Var_BloodCPHOB_1",0)
	PE_SetVar("Var_BloodCPHOB_2",0)
	PE_SetVar("Var_BloodCPHOB_3",0)
	PE_SetVar("Var_BloodCPHOB_4",0)
--	PE_SetVar("Var_BloodCPHOB_5",0)
	Global_BloodCVar["var"] = 0
	Global_BloodC_MonsterList= nil
	Global_BloodCVar["fumito"] = nil
	Global_BloodCVar["saya"] = nil
	Global_BloodCVar["NPC"] = nil


	lua_BloodC_PE_ShowAllMonster()
end
--S1�G�}�l��tShow1
function lua_BloodC_PHShow1( ctrl,saya )
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID )
	local fumito = 0
	Sleep(20)
	CallPlot( ctrl,"lua_BloodC_PE_HideAllMonster",0)
	CallPlot( ctrl ,"lua_BloodC_CreateTownerRand",0 )			--���ͧ���
	--
	Sleep(20)
	CallPlot( ctrl,"lua_BloodC_SMG2Player",1 )			--���1
	Sleep(20)
	WriteRoleValue( saya ,EM_RoleValue_IsWalk , 0  )
	MoveToFlagEnabled( saya,false)
		SetModeEx( saya, EM_SetModeType_Mark, false )
		SetModeEx( saya, EM_SetModeType_Strikback, false )
		SetModeEx( saya  , EM_SetModeType_Searchenemy, false )
	AddToPartition( saya , RoomID )
	AddBuff( saya,507609,0,-1)
	SetPlot( saya,"dead","lua_BloodC_SaYaDeadDrama",0 )
	CallPlot( saya,"lua_BloodC_ActorFuMito",1 )	--���ͤC���H
	Sleep( 20)
	fumito = Global_BloodCVar["fumito"]
	Sleep(30)
	NpcSay( saya,"[SC_JPTIEUP_MODE2_NPC1_01_1]" )
	PlayMotion( saya,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 20)
	NpcSay( saya,"[SC_JPTIEUP_MODE2_NPC1_01_2]" )
	PlayMotion( saya,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 )
	PlayMotion( fumito,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_01_1]" )
	AdjustFaceDir( saya,fumito,0)
	Sleep( 40 )
	NpcSay( saya,"[SC_422999_28]" )	--�K�K
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_01_2]" )
	Sleep( 30 )
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_01_3]" )
	Sleep( 30 )
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_01_4]" )
	Sleep( 50 )
	CallPlot( ctrl,"lua_BloodC_SMG2Player",2 )	--�a�O�@�P���n�̰_�ӡA�u���̡v�n�ӤF�C
	Sleep( 20 )
	SetDefIdleMotion( saya,ruFUSION_MIME_IDLE_COMBAT_2H )
	NpcSay( saya,"[SC_JPTIEUP_MODE2_NPC1_03]" )
	Sleep(10)
		SetModeEx( saya, EM_SetModeType_Mark, true )
		SetModeEx( saya, EM_SetModeType_Strikback, true )
		SetModeEx( saya  , EM_SetModeType_Searchenemy, true )
	SetDefIdleMotion( fumito, ruFUSION_MIME_BUFF_LOOP)
	AddBuff(saya,622310,0,2)
	CallPlot( saya,"lua_BloodC_PH1_CreateMonster",0)
	CastSpell( fumito,fumito,499413 )
	CallPlot( saya,"lua_CtrlTownerAI",1)
end

--S2�G�}�l��tShow2
function lua_BloodC_PHShow2( ctrl,saya,fumito )
		SetDefIdleMotion( fumito, ruFUSION_MIME_BUFF_END)
		Sleep( 30 )
		AdjustFaceDir( saya,fumito,0 )
		PlayMotion( fumito,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_1]" )
		Sleep( 40 )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_2]" )
		Sleep( 10 )
		CallPlot( ctrl,"lua_BloodC_SMG2Player",3 )
		Sleep( 10 )
		NpcSay( saya,"[SC_JPTIEUP_MODE2_NPC1_04]" )
		Sleep( 10 )
		SetDefIdleMotion( fumito, ruFUSION_MIME_BUFF_LOOP)
		CallPlot( saya,"lua_BloodC_PH2_CreateMonster",0 )
		CastSpell( fumito,fumito,499413 )
		CallPlot( saya,"lua_CtrlTownerAI",2)
		Sleep( 30 )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_3]" )
		Sleep( 40 )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_4]" )
		Sleep( 40 )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_5]" )
		Sleep( 30 )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_6]" )
		Sleep( 50 )
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_7]" )
		Sleep( 50)
		NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_02_8]" )
end
--S3�G�}�l��tShow3
function lua_BloodC_PHShow3( ctrl,saya,fumito )
	SetDefIdleMotion( fumito, ruFUSION_MIME_BUFF_END)
	Global_BloodCVar["var"]=1	--����ĤG���q����
	CallPlot( ctrl,"lua_BloodC_SMG2Player",4 )
	Sleep(50)
	NpcSay( saya,"[SC_JPTIEUP_MODE2_NPC1_06]" )
	Sleep(20)
	SetDefIdleMotion( fumito, ruFUSION_MIME_BUFF_LOOP)
	CallPlot( saya,"lua_BloodC_PH3_CreateMonster",0 )
	CastSpell( fumito,fumito,499413 )
end
--S4�G�}�l��tShow4
function lua_BloodC_PHShow4( ctrl,saya,fumito )
--	SetModeEx( saya, EM_SetModeType_Show, false )
	local flagID = Global_BloodCVar["flagID"]
	local saya2 = Lua_DW_CreateObj("obj" , 104126 , saya )  
	SetDefIdleMotion( fumito, ruFUSION_MIME_BUFF_END)
	PlayMotion( saya2,ruFUSION_MIME_CROUCH_END )
	Global_BloodCVar["FinalPH"] = 1
	DelObj( saya )
	SetModeEx( saya2, EM_SetModeType_Strikback, false )--����
	SetModeEx( saya2, EM_SetModeType_Mark, false )--�аO
	SetModeEx( saya2, EM_SetModeType_Move, false )--����
 	SetModeEx( saya2, EM_SetModeType_Searchenemy, false )--����
 	SetModeEx( saya2, EM_SetModeType_HideName, false )--�W��
 	SetModeEx( saya2, EM_SetModeType_ShowRoleHead, false )--�Y����
 	SetModeEx( saya2, EM_SetModeType_Fight , false )--�i�������
	CallPlot( ctrl,"lua_BloodC_SMG2Player",5 )
	Sleep(10)
	lua_BloodC_PE_DelAllMonster()
	lua_BloodC_PE_DelAllNPC()
	AdjustFaceDir( fumito, saya2 , 0)
	AdjustFaceDir( saya2, fumito , 0)
	PlayMotion ( saya2 ,ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	Sleep(20)
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_04_1]")
	Sleep(50)
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_04_2]")
	Sleep(40)
	NpcSay( fumito,"[SC_JPTIEUP_MODE2_NPC2_04_3]")
	Sleep(30)
	lua_AGMoveToFlag( fumito,flagID,29,0 )
	Sleep(40)
	DelObj( fumito )
	PlayMotion ( saya2 ,ruFUSION_ACTORSTATE_CROUCH_END )
	Sleep(10)
	NpcSay( saya2,"[SC_JPTIEUP_MODE2_NPC1_07]")
	PlayMotion ( saya2 ,ruFUSION_ACTORSTATE_CAST_SP01 )
	Sleep(50)
	local tmp =SearchRangePlayer( saya2,200 )
	if tmp[0]~=nil then AdjustFaceDir( saya2,tmp[0],0 ) end
	NpcSay( saya2,"[SC_JPTIEUP_MODE1_08_1]")
	Sleep(30)
	NpcSay( saya2,"[SC_JPTIEUP_MODE1_08_2]")
	Sleep(30)
	NpcSay( saya2,"[SC_JPTIEUP_MODE1_08_3]")
	lua_AGMoveToFlag(saya2,flagID, 29 ,0 )
	Sleep(30)
	DelObj( saya2 )
	DesignLog( ctrl,104126,"PE_Success!" )
	Lua_Z21BloodCGlobal_init()
end
--S5�G�}�l��tShow5
function lua_BloodC_PHShow5( ctrl,saya,fumito )
--	SetModeEx( saya, EM_SetModeType_Show, false )
	local flagID = Global_BloodCVar["flagID"]
	local saya2 = Lua_DW_CreateObj("obj" , 104126 , saya )  
	DelObj( saya )
	DelObj(fumito)
	lua_BloodC_PE_DelAllMonster()

	SetModeEx( saya2, EM_SetModeType_Strikback, false )--����
	SetModeEx( saya2, EM_SetModeType_Mark, false )--�аO
	SetModeEx( saya2, EM_SetModeType_Move, false )--����
 	SetModeEx( saya2, EM_SetModeType_Searchenemy, false )--����
 	SetModeEx( saya2, EM_SetModeType_HideName, false )--�W��
 	SetModeEx( saya2, EM_SetModeType_ShowRoleHead, false )--�Y����
 	SetModeEx( saya2, EM_SetModeType_Fight , false )--�i�������

	local num=PE_GetVar("Var_BloodCPHOB_3")
	if num==3 then 
		Global_BloodCVar["FinalPH"] = 2
		CallPlot( ctrl,"lua_BloodC_SMG2Player",6 )
		Sleep(30)
		PlayMotion( saya2,ruFUSION_ACTORSTATE_EMOTE_CRY )
		NpcSay( saya2,"[SC_JPTIEUP_MODE2_NPC1_09]" ) 
		Sleep(30) 
	else
		Global_BloodCVar["FinalPH"] = 3
		CallPlot( ctrl,"lua_BloodC_SMG2Player",7 )
		Sleep(30)
		PlayMotion( saya2,ruFUSION_ACTORSTATE_DYING )
		NpcSay( saya2,"[SC_JPTIEUP_MODE2_NPC1_09]" ) 
		lua_BloodC_PE_DelAllNPC()
		Sleep(30) 
	end
	DelObj(saya2)
	DesignLog( ctrl,104126,"PE_fail!" )
	Sleep(40)
	Lua_Z21BloodCGlobal_init()
end
--S6�GSHOW611
function lua_BloodC_PHShow6(ctrl,saya,fumito )
	CallPlot( ctrl,"lua_BloodC_SMG2Player",0 )
	Sleep(10)
	lua_BloodC_PE_DelAllNPC()
	lua_BloodC_PE_DelAllMonster()
	DelObj(fumito)
	NpcSay( saya,"[SC_JPTIEUP_MODE1_09]" )
	Sleep(10)
	KillID( ctrl,saya )
	Sleep(50)
	DelObj(saya)
	DesignLog( ctrl,104126,"PE_fail!" )
	Global_BloodCVar["saya"]=nil	
	lua_BloodC_PE_ShowAllMonster()
end
--PH1�G�ͩ�1
function lua_BloodC_PH1_CreateMonster()
--	DebugMsg(0,0,"--MONSTER�G1--")
	Global_BloodC_MonsterList={}			--g�G
	local saya=Global_BloodCVar["saya"] 
	local flagNum={ 22 , 24 , 25 ,26 }
	for i=1,#flagNum,1 do
		lua_BloodC_PH1_SetMonster(flagNum[i])
	end
end
--PH1�G�ͩ�2
function lua_BloodC_PH1_SetMonster(i)
	local flagID = Global_BloodCVar["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	Sleep(10)
	if ( PE_GetVar("Var_BloodCPHOB_1")+4 )<=15 then
		local monster = CreateObjByFlag( 104036 , flagID , i , 1 ) 
			WriteRoleValue( monster ,EM_RoleValue_IsWalk , 0  )
			AddToPartition( monster , RoomID )
			Setflag(monster,544801, 1) 
			--SetAttack( monster,saYa )
			Global_BloodC_MonsterList[monster] = true
			WriteRoleValue( monster,EM_RoleValue_PID,i )
			CallPlot( monster,"lua_BloodC_PH1_MonsterStartDrama",0)
			setplot( monster,"dead","lua_BloodC_PH1_MonsterDeadDrama",0)
	end
	return true
end
--PH1�G�Ǫ�����l�@��(all)
function lua_BloodC_PH1_MonsterStartDrama()
	local monster=OwnerID()
	local saya=Global_BloodCVar["saya"] 
	local flagID = Global_BloodCVar["flagID"]
	local NPC = Global_BloodCVar["NPC"]
	CastSpell( monster,monster,499653 )	--�L�ĪG�A�ȩǪ����ͯS��
	MoveToFlagEnabled( monster,false )
	lua_AGMoveToFlag(monster,flagID, 3 ,50 )
	SetAttack( monster,saya )
	
	for index,value in pairs( NPC ) do
		if NPC[index] then
			local AttackStatue = ReadRoleValue( index , EM_RoleValue_IsAttackMode ) 
			if AttackStatue==0 then
				SysCastSpellLv( index,monster,496216,1 )
				return
			else
			SetAttack( monster,index )
			end
		end
	end
end
--PH1�G�Ǫ����}�԰��@��
function lua_BloodC_MonsterLeaveWar()
	local monster=OwnerID()
	local flagID = Global_BloodCVar["flagID"]
	local NPC = Global_BloodCVar["NPC"]
	CastSpell( monster,monster,499653 )	--�L�ĪG�A�ȩǪ����ͯS��
	if NPC==nil then return end
	for index,value in pairs( NPC ) do
		if index==nil then return end
		if NPC[index] then
			SysCastSpellLv( index,monster,496216,1 )
			return
		end
	end
end
--PH1�G�Ǫ����`�@��
function lua_BloodC_PH1_MonsterDeadDrama()
	local obj = OwnerID()
	local i=ReadRoleValue( OwnerID(),EM_RoleValue_PID )
	lua_BloodCZ21_GiveS()
	PE_AddVar("Var_BloodCPHOB_1",1)
	Global_BloodC_MonsterList[obj]=nil	--����Ŷ�
	lua_BloodC_PH1_SetMonster(i)
end
--PH2�G�ͩ�
function lua_BloodC_PH2_CreateMonster()
--	DebugMsg(0,0,"--MONSTER�G2--")
	local flagNum={ 21,22,24,25,26 }
	local flagID = Global_BloodCVar["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	local saya = Global_BloodCVar["saya"] 
		for i=1,3,1 do
			local monster =AgProUse_01( flagID,flagNum[i],104035,1,50 )
			WriteRoleValue( monster ,EM_RoleValue_IsWalk , 0  )
			AddToPartition( monster,RoomID )
			Setflag(monster,544801, 1) 
			CallPlot( monster,"lua_BloodC_PH1_MonsterStartDrama",0)
			SetPlot( monster,"dead","lua_BloodC_PH2_MonsterDeadDrama",0)
			Global_BloodC_MonsterList[monster] = true
			Sleep(5)
		end
		for i=4,5,1 do
			local monster =AgProUse_01( flagID,flagNum[i],104036,1,50 )
			WriteRoleValue( monster ,EM_RoleValue_IsWalk , 0  )
			AddToPartition( monster,RoomID )
			Setflag(monster,544801, 1) 
			CallPlot( monster,"lua_BloodC_PH1_MonsterStartDrama",0)
			SetPlot( monster,"dead","lua_BloodC_PH2_MonsterDeadDrama",0)
			Global_BloodC_MonsterList[monster] = true
			Sleep(5)
		end
	if ReadRoleValue( saya,EM_RoleValue_Register1 )==0 then
		CallPlot(saya,"lua_BloodC_PH2_CreateMonster_Ctrl",0)	
	end	
end
--PH2�G�ͩ�2
function lua_BloodC_PH2_CreateM2(x)
	local flagID=Global_BloodCVar["flagID"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	local monList ={ 103016,103017 }
	local flagNum ={ 21,22,24,25,26 }

	for i=1,x,1 do
		local num1 = rand( 2 )+1
		local num2 = rand( 5 )+1
		local monster =AgProUse_01( flagID,flagNum[num2],monList[num1],1,50 )
			Global_BloodC_MonsterList[monster]=true
			AddToPartition( monster, RoomID )
			Setflag(monster,544801, 1)
			CallPlot( monster,"lua_BloodC_PH1_MonsterStartDrama",0)
			setplot( monster,"dead","lua_BloodC_PH2_MonsterDeadDrama",0)
	end
end
--PH2�G���򲣥ͩǪ�������
function lua_BloodC_PH2_CreateMonster_Ctrl()
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1)
	local num=0
	local time=0
	while true do
		if Global_BloodCVar["var"]==1	then	break	end
		for index,value in pairs( Global_BloodC_MonsterList ) do
			if Global_BloodC_MonsterList[index] then
				num=num+1
			end
		end

		if num>=10 then
			--����Ƴ��S�@
		elseif num >=5 and time ==15 then
			local tmp=10-num
			CallPlot(OwnerID(),"lua_BloodC_PH2_CreateM2",tmp)			
			time=0
		elseif num<=1 or time ==15 then
			CallPlot(OwnerID(),"lua_BloodC_PH2_CreateMonster",0)
			time=0
		end
		Sleep(10)
		time=time+1
		num=0
	end
end
--PH2�G�Ǫ����`�@��
function lua_BloodC_PH2_MonsterDeadDrama()
	local obj=OwnerID()	
	Local Player = HateListCount( OwnerID() )	
	lua_BloodCZ21_GiveS()
	Global_BloodC_MonsterList[obj]=fail	--����Ŷ�
end
--PH3�G�ͩ�
function lua_BloodC_PH3_CreateMonster()
--	DebugMsg(0,0,"--MONSTER�G3--")
	local saya=Global_BloodCVar["saya"] 
	local flagID = Global_BloodCVar["flagID"]
	local flagNum={ 21,22,24,25,26 }
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID )
	local monster = CreateObjByFlag( 104125 , flagID , 21 , 1 ) 
		WriteRoleValue( monster ,EM_RoleValue_IsWalk , 1  )
		AddToPartition( monster , RoomID )
		Setflag(monster,544801, 1) 
		SetAttack( monster,saya )
		Global_BloodC_MonsterList[monster]=true
		setplot( monster,"dead","lua_BloodC_PH3_MonsterDeadDrama",0)
		for i=1,5,1 do
			monster =AgProUse_01( flagID,flagNum[i],104035,1,50 )
			WriteRoleValue( monster ,EM_RoleValue_IsWalk , 0 )
			AddToPartition( monster,RoomID )
			Setflag(monster,544801, 1) 
			CallPlot( monster,"lua_BloodC_PH1_MonsterStartDrama",0)
			setplot( monster,"dead","lua_BloodC_PH3_MonsterDeadDrama",0)
			Global_BloodC_MonsterList[monster] = true
		end
		for i=1,5,1 do
			monster =AgProUse_01( flagID,flagNum[i],104036,1,50 )
			WriteRoleValue( monster ,EM_RoleValue_IsWalk , 0 )
			AddToPartition( monster,RoomID )
			Setflag(monster,544801, 1) 
			CallPlot( monster,"lua_BloodC_PH1_MonsterStartDrama",0)
			setplot( monster,"dead","lua_BloodC_PH3_MonsterDeadDrama",0)
			Global_BloodC_MonsterList[monster] = true
		end
end
--PH3�G���`�@��
function lua_BloodC_PH3_MonsterDeadDrama()
	local obj=OwnerID()
	local OrgID=ReadRoleValue( obj,EM_RoleValue_OrgID )
	if OrgID==104125 then
		PE_AddVar("Var_BloodCPHOB_2",1)		
	elseif OrgID==104035 or OrgID==104036 then
--		PE_AddVar("Var_BloodCPHOB_5",1)
	end
	lua_BloodCZ21_GiveS()
	Global_BloodC_MonsterList[obj]=nil;	--����Ŷ�
end
--C�G���ͧ���
function lua_BloodC_CreateTownerRand()
	Global_BloodCVar["NPC"]={}		--�}�Ҥ@�ӧ����}�C	
	local flagID = Global_BloodCVar["flagID"] 
	local ctrl=Global_BloodCVar["ctrl"]
	local RoomID = ReadRoleValue( flagID,EM_RoleValue_RoomID) ;
	local People={103001,105689,105690,105691,105692}
	local tmp={}
	local catch={5,7}
	local towner=0
		for i=1,8 do	table.insert( tmp,i )	end	--��itable
	local catch=Lua_TableRuleOut( tmp,catch,3 )		--Cm��n���禡
		for i=1,#catch do
			towner=AgProUse_01( flagID,catch[i],People[i],1,20 )	--100994 119247
			SetModeEx( towner  , EM_SetModeType_Fight, true )
			SetModeEx( towner  , EM_SetModeType_Strikback, false )--����
			SetModeEx( towner  , EM_SetModeType_Searchenemy, false )--����
			Global_BloodCVar["NPC"][towner]=true
			AddToPartition( towner,RoomID )
			AddBuff( towner,507609,0,-1)				--�L�k�ɦ媺buff
			Setflag(towner,544801, 1) 				--���|���ͩ��_����
			CallPlot( towner,"lua_BloodC_TownerInit",0 )
			SetPlot( towner,"dead","lua_BloodC_TownerDeadDrama",0 )
			FaceFlag ( towner, flagID , 5 )
			AdjustDir( towner, 0 )
		end
end
--������l�@��
function lua_BloodC_TownerInit()
	local saya=Global_BloodCVar["saya"] 
	local obj = OwnerID()
	while 1 do
		local AttackStatue = ReadRoleValue( obj , EM_RoleValue_IsAttackMode ) 
		if AttackStatue ==0 then
			AdjustFaceDir( obj,saya,0 )
		elseif AttackStatue ==1 then
			local sec=Rand(10)
			PlayMotion( obj , ruFUSION_ACTORSTATE_EMOTE_CRY )
			if sec==3 then NpcSay( obj,"[SC_420927_5]") end
			Sleep(sec )
		end
		Sleep(10)
	end	
end
--D�G�������`�@��
function lua_BloodC_TownerDeadDrama()
	local saya=Global_BloodCVar["saya"] 
	local ctrl=Global_BloodCVar["ctrl"]
	SetAttack(TargetID(),saya)
	CallPlot( ctrl,"lua_BloodC_SMG2Player",8 )
	NpcSay( OwnerID(),"[SC_JPTIEUP_MODE2_NPC3_01]" )
	Global_BloodCVar["NPC"][OwnerID()]=nil
	PE_AddVar("Var_BloodCPHOB_3",1)
end
--D�G�p�]���`�@��
function lua_BloodC_SaYaDeadDrama()
	local ctrl=Global_BloodCVar["ctrl"]
	CallPlot( ctrl,"lua_BloodC_SMG2Player",9 )
	PE_AddVar("Var_BloodCPHOB_4",1) 
	--Say( OwnerID(),"[SC_JPTIEUP_MODE2_NPC1_09]" )
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )
end
--C�G���ͤC���H
function lua_BloodC_ActorFuMito(num)
	local flagID = Global_BloodCVar["flagID"] 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	if num==1 then
		Global_BloodCVar["fumito"] = CreateObjByFlag( 119565 , flagID , 21 , 1 ) 	--*
		local fumito = Global_BloodCVar["fumito"]
			WriteRoleValue( fumito ,EM_RoleValue_IsWalk , 1  )
			SetModeEx( fumito  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( fumito  , EM_SetModeType_Strikback, false )--����
			SetModeEx( fumito  , EM_SetModeType_Fight , false )--�i�������
			MoveToFlagEnabled( fumito,false)
			AddToPartition( fumito , RoomID )
			LuaFunc_MoveToFlag( fumito, flagID , 13 ,0 ) 
	elseif num==2 then
	end
end
--D�G�R���Ҧ��٦b���Ǫ�
function lua_BloodC_PE_DelAllMonster()
	if Global_BloodC_MonsterList==nil then return end
	for index,value in pairs(Global_BloodC_MonsterList) do
		if Global_BloodC_MonsterList[index] then
			DelObj(index);
			Global_BloodC_MonsterList[index]=nil;
		end
	end
	Global_BloodC_MonsterList=nil
end
--D�G�R���Ҧ�����
function lua_BloodC_PE_DelAllNPC()
	local NPC=Global_BloodCVar["NPC"]
	for index,value in pairs( NPC ) do
		if NPC[index] then
			DelObj(index);
			NPC[index]=nil;
		end
	end
	Global_BloodCVar["NPC"]=nil
end
--���������t�@��
function lua_CtrlTownerAI(k)
	local ctrl=Global_BloodCVar["ctrl"]
	local NPC=Global_BloodCVar["NPC"]
	local num=0
		for index,value in pairs( NPC ) do
			if num==0 and NPC[index] then
				NpcSay ( index,"[SC_JPTIEUP_MODE2_NPC3_02]" )
				num=num+1
			end
		end	
		Sleep(10)
		if k==1 then
			while true do
				Sleep(20)
				local CH1=PE_GetVar( "Var_BloodCPHOB_1" )
				if CH1==15 then break end
			end
			num=0
			for index,value in pairs( NPC ) do
				if num==0 and NPC[index] then
					NpcSay ( index,"[SC_JPTIEUP_MODE2_NPC3_03]" )
					num=num+1
				end
			end
		end
end
--HIDE�ϰ�W���Ҧ��Ǫ�
function lua_BloodC_PE_HideAllMonster()
	Global_HideAllMonster={}
	local tmp = SearchRangeNPC( OwnerID(),450 )
	local Camp = 0
	for i=0,#tmp do
		Camp = GetRoleCampID(tmp[i])
		if Camp == 3 then
			table.insert( Global_HideAllMonster,tmp[i] )
		end
	end
	for i=1,#Global_HideAllMonster do
		DelFromPartition( Global_HideAllMonster[i])
	end
	if Var_bloodC_WalkMan~=nil then
		DelFromPartition( Var_bloodC_WalkMan )
	end
end
--SHOW�ϰ�W���Ҧ��Ǫ�
function lua_BloodC_PE_ShowAllMonster()
--	DebugMsg(0,0,#Global_HideAllMonster)
	for i=1,#Global_HideAllMonster do
		AddToPartition( Global_HideAllMonster[i] , 0)
	end	
	for i=1,#Global_HideAllMonster do
		Global_HideAllMonster[i] =nil
	end
	if Var_bloodC_WalkMan~=nil then
		AddToPartition( Var_bloodC_WalkMan,0 )
	end
end
--���ʨ�X��

function lua_AGMoveToFlag( ObjID , FlagObjID , FlagID,Range )

 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	Move( ObjID, X , Y , Z ) 
	return 
end
--����
function lua_BloodCZ21_GiveS()
	Local num = HateListCount( OwnerID() )
	local PEIndex = Global_BloodCVar["PEIndex"]	
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
--�o�O���F�פ@�Ӹ��L��npc
function lua_BloodC_HideAWalkNPC()
	Var_bloodC_WalkMan=OwnerID()
end
--���F�d��o�ܥt�~�g
function lua_BloodC_SMG2Player( x )
	local ctrl=Global_BloodCVar["ctrl"]
	local playerList = SearchRangePlayer( ctrl,350 )
	local stringList = {}
	stringList[0] ="[SC_BLOODC_SM_4]"
	stringList[1] ="[SC_BLOOD21_SHOW1_1]"	--�Ҧ���������Q�ĤH����F�A�Ů��j���۴d�G����^
	stringList[2] ="[SC_BLOOD21_SHOW1_2]"	--�a�O�@�P���n�̰_�ӡA�u���̡v�n�ӤF�C	
	stringList[3] ="[SC_BLOODC_SHOW2_1]"	--�����@���ݮ����l�a�A��h���u�j���v�q�·t���P�X
	stringList[4] ="[SC_BLOODC_SHOW3_1]"	--�s�z�p���ͪ����b�ߩȵۡA���G�N�n����j�j���ĤH����F
	stringList[5] ="[SC_BLOODC_SHOW4_1]"	--�̱j�j���ؼгQ���˫�A�ĤH�]�H�������p��
	stringList[6] ="[SC_BLOOD21_SHOW1_3]"	--�S��O�@�n�����̡K�A���ѤF�K
	stringList[7] ="[SC_BLOOD21_SHOW1_4]"	--�S��O�@�n�p�]�K�A���ѤF�K
	stringList[8] ="[SC_BLOOD21_SHOW1_5]"
	stringList[9] ="[SC_BLOODC_SHOW5_1]"

	for i=0,#playerList-1 do
		if x<8 then
			ScriptMessage( ctrl, playerList[i] , 2, stringList[x] , 0 )
		else
			ScriptMessage( ctrl, playerList[i] , 1, stringList[x] , 0 )
		end
	end
end
	