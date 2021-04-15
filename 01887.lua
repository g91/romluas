function LuaPE_Zone16_02_DW_1()
--�ŧi�ܼ�
	local PE_Index = 2

	local PH_0 = 50
	local PH_1 = 100
	local PH_2 = 200
	local PH_3 = 300
	local PH_4 = 400
	local PH_5 = 500


	local PH_0_Score = 0
	local PH_1_Score = 0
	local PH_2_Score = 0
	local PH_3_Score = 0
	local PH_4_Score = 0
	local PH_5_Score = 0

	PE_2_DW_PH = 0

	PH_0_Term_1 = 3600
	PH_1_Term_1 = 120
	PH_2_Term_1 = GetMoveFlagCount(780081)-1
	PH_3_Term_1 = 180
	PH_3_Term_2 = 8
	PH_4_Term_1 = 10
	PH_5_Term_1 = 1
	PH_5_Term_2 = 300

	local MapID = 833
	ZONE16_PE02_MapID = 833

--�إ�PE
	PE_AddPE("SC_PE_ZONE16_DW_00","SC_PE_ZONE16_DW_01",PE_Index,0)
--�Nmapid������PE
	PE_AddRegion(PE_Index , MapID)
--�إ߶��q
	PE_AddPhase(PE_Index, PH_0, "SC_PE_ZONE16_DW_12", "", PH_0_Score, 1, 1, 0)
	PE_AddPhase(PE_Index, PH_1, "SC_PE_ZONE16_DW_02", "SC_PE_ZONE16_DW_03", PH_1_Score, 1, 1, 0)
	PE_AddPhase(PE_Index, PH_2, "SC_PE_ZONE16_DW_04", "SC_PE_ZONE16_DW_05", PH_2_Score, 1, 1, 0)
	PE_AddPhase(PE_Index, PH_3, "SC_PE_ZONE16_DW_06", "SC_PE_ZONE16_DW_07", PH_3_Score, 1, 1, 0)
	PE_AddPhase(PE_Index, PH_4, "SC_PE_ZONE16_DW_08", "SC_PE_ZONE16_DW_09", PH_4_Score, 1, 1, 0)
	PE_AddPhase(PE_Index, PH_5, "SC_PE_ZONE16_DW_10", "SC_PE_ZONE16_DW_11", PH_5_Score, 1, 1, 0)
--���q����
--���m���q
	PE_PH_AddObjective_TimeLimit(PE_Index, PH_0, PH_0+1, "SC_PE_ZONE16_DW_22", "", "PH_0_Term_1_Name", PH_0_Term_1*1000, 0, true)
--���q1
	PE_PH_AddObjective_EqualAndGreater(PE_Index, PH_1, PH_1+1, "SC_PE_ZONE16_DW_13", "SC_PE_ZONE16_DW_14", "PH_1_Term_1_Name", 0, PH_1_Term_1, true)

--���q2
	PE_PH_AddObjective_EqualAndGreater(PE_Index, PH_2, PH_2+1, "SC_PE_ZONE16_DW_15", "", "PH_2_Term_1_Name", 0, PH_2_Term_1, true)
--���q3
	PE_PH_AddObjective_TimeLimit(PE_Index, PH_3, PH_3+1, "SC_PE_ZONE16_DW_21", "SC_PE_ZONE16_DW_16", "PH_3_Term_1_Name", PH_3_Term_1*1000, 0, true)
--	PE_PH_AddObjective_EqualAndSmaller(PE_Index, PH_3, PH_3+1, "SC_PE_ZONE16_DW_21", "SC_PE_ZONE16_DW_16", "PH_3_Term_1_Name", PH_3_Term_1, 0, true)
	PE_PH_AddObjective_EqualAndGreater(PE_Index, PH_3, PH_3+2, "SC_PE_ZONE16_DW_17", "SC_PE_ZONE16_DW_18", "PH_3_Term_2_Name", 0, PH_3_Term_2, false)
--���q4
	PE_PH_AddObjective_TimeLimit(PE_Index, PH_4, PH_4+1, "SC_PE_ZONE16_DW_19", "", "PH_4_Term_1_Name", PH_4_Term_1*1000, 0, true)
--���q5
	PE_PH_AddObjective_EqualAndGreater(PE_Index, PH_5, PH_5+1, "SC_PE_ZONE16_DW_20", "", "PH_5_Term_1_Name", 0, PH_5_Term_1, true)
--	PE_PH_AddObjective_EqualAndSmaller(PE_Index, PH_5, PH_5+2, "SC_PE_ZONE16_DW_21", "", "PH_5_Term_2_Name", PH_5_Term_2, 0, false)
	PE_PH_AddObjective_TimeLimit(PE_Index, PH_5, PH_5+2, "SC_PE_ZONE16_DW_21", "", "PH_5_Term_2_Name", PH_5_Term_2*1000, 0, false)

	PE_PH_SetNextPhase(PE_Index, PH_0, PH_1)
	PE_PH_SetNextPhase(PE_Index, PH_1, PH_2)
	PE_PH_SetNextPhase(PE_Index, PH_2, PH_3)
	PE_PH_SetNextPhase(PE_Index, PH_3, PH_4)
	PE_PH_SetNextPhase(PE_Index, PH_4, PH_5)

--ph3���\�����[��
	PE_PH_SetBonusScore (2, PH_3, 12*(PH_3_Term_2-PE_GetVar("PH_3_Term_2_Name")), 13*(PH_3_Term_2-PE_GetVar("PH_3_Term_2_Name")))

	PE_OB_SetCallBackOnAchieve(PE_Index, "LuaPE_Zone16_02_DW_5")

	PE_SetCallBackOnBalance(PE_Index,"LuaPE_Zone16_02_DW_20")

	PE_Start(PE_Index,50)
end
----------------------------------------------------------------------------------------------------------

--���b���ƴӪ��W�����`�@��
function LuaPE_Zone16_02_DW_2()
	if	PE_2_DW_PH==5	then
		DelFromPartition(OwnerID())
		ReSetNPCInfo( OwnerID() )
	end
	SetPlot(OwnerID(),"dead","LuaPE_Zone16_02_DW_3",0)
end

function LuaPE_Zone16_02_DW_3()
	if	PE_2_DW_PH==1	then
		LuaPE_KS_GetBonus( 2,833,5 )
	end
	PE_AddVar("PH_1_Term_1_Name",1)
end
----------------------------------------------------------------------------------------------------------
--���m���q���@��
function LuaPE_Zone16_02_DW_4()
	sleep(600)
--�M���@��
	LuaPE_Zone16_02_DW_11()
	PE_2_DW_PH = 0
	DelObj(OwnerID())
end
----------------------------------------------------------------------------------------------------------
function LuaPE_Zone16_02_DW_5( PEIndex , PHIndex , OBIndex )
--�Ĥ����q���\>>���\����&���m���q
	if	OBIndex == 501	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		BeginPlot(DirectorBox,"LuaPE_Zone16_02_DW_4",0)
	end
--�Ĥ����q����>>�M���@��&���m���q
	if	OBIndex == 502	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		DW_AreaMessage(DirectorBox,2,"[SC_PE_ZONE16_DW_38]",C_Red,833)
		BeginPlot(DirectorBox,"LuaPE_Zone16_02_DW_4",0)
	end
--�ĥ|���q���t��>>�Ĥ����q���Ǫ�����
	if	OBIndex == 401	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox_1 = Lua_DW_CreateObj("flag",114040,780081,1)
		local DirectorBox_2 = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox_1,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox_1,EM_SetModeType_Mark,false) 
		SetModeEx(DirectorBox_2,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox_2,EM_SetModeType_Mark,false) 
		BeginPlot(DirectorBox_1,"LuaPE_Zone16_02_DW_10",0)
		BeginPlot(DirectorBox_2,"LuaPE_Zone16_02_DW_13",20)
		DW_AreaMessage(DirectorBox_2,2,"[SC_PE_ZONE16_DW_36]",C_Yellow,833)
		PE_2_DW_PH = 5
	end
--�ĤT���q�����\>>�ĥ|���q���t��
	if	OBIndex == 301	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		DW_AreaMessage(DirectorBox,2,"[SC_PE_ZONE16_DW_35]",C_Yellow,833)
		PE_2_DW_PH = 4
	end
--�ĤT���q������>>�����M��
	if	OBIndex == 302	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		DW_AreaMessage(DirectorBox,2,"[SC_PE_ZONE16_DW_39]",C_Red,833)
		BeginPlot(DirectorBox,"LuaPE_Zone16_02_DW_4",0)
	end
--�ĤG���q�������ž�
	if	OBIndex == 201	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		DW_AreaMessage(DirectorBox,2,"[SC_PE_ZONE16_DW_33]",C_Yellow,833)
		BeginPlot(DirectorBox,"LuaPE_Zone16_02_DW_12",0)
		PE_2_DW_PH = 3
	end
--�Ĥ@���q���\����>>�ĤG���q���t��
--�ĤG���q���t��>>�ĤT���q�����޾԰�&�˼ƭp��
	if	OBIndex == 101	then
DeBugMSG(0,0,OBIndex.."do")
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		BeginPlot(DirectorBox,"LuaPE_Zone16_02_DW_6",0)
		PE_2_DW_PH = 2
	end
--���m�ɶ�����
	if	OBIndex == 51		then
DeBugMSG(0,0,OBIndex.."do")
		PE_SetVar("PH_1_Term_1_Name",0)
		local DirectorBox = Lua_DW_CreateObj("flag",114040,780081,1)
		SetModeEx(DirectorBox,EM_SetModeType_Show,false) 
		SetModeEx(DirectorBox,EM_SetModeType_Mark,false) 
		ScriptMessage( DirectorBox, -1, 0, "[SC_PE_ZONE16_DW_31]", C_Yellow )
		ScriptMessage( DirectorBox, -1, 2, "[SC_PE_ZONE16_DW_31]", C_Yellow )
		PE_2_DW_PH = 1
	end
end

----------------------------------------------------------------------------------------------------------

function LuaPE_Zone16_02_DW_6()
	DW_AreaMessage(OwnerID(),2,"[SC_PE_ZONE16_DW_32]",C_Yellow,833)
	local Researcher  = {}
	local Researcher_Image = {115250,115252,115294,115296,115298,115299}
--���ͬ�s������w�I
	for i=1,GetMoveFlagCount(780081)-1,1 do
		Researcher[i] = Lua_DW_CreateObj("flag",Researcher_Image[DW_Rand(table.getn(Researcher_Image))],780081,i)
		CastSpell(Researcher[i],Researcher[i],495735)
		CallPlot(Researcher[i],"DW_MoveToFlag",Researcher[i] , 780082 , i, 0 , 1 )
		CallPlot(Researcher[i],"LuaPE_Zone16_02_DW_7",i)
	end
	while PE_GetVar("PH_2_Term_1_Name")<PH_2_Term_1	do
		sleep(10)
	end
--���Ҧ���s����F�w�I
	for i=1,table.getn(Researcher),1 do
		SetModeEx( Researcher[i], EM_SetModeType_DisableRotate, true )--����V
--����s�ʧ@
		SetDefIdleMotion(Researcher[i],ruFUSION_MIME_GATHER_LOOP)
		BeginPlot(Researcher[i],"LuaPE_Zone16_02_DW_8",0)
	end
	DelObj(OwnerID())
end
----------------------------------------------------------------------------------------------------------
--��s�����檺�@��>>����w�I�^�Ǽƭ�
function LuaPE_Zone16_02_DW_7(Num)
	SetModeEx(OwnerID(),EM_SetModeType_Fight,false) 
	SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false) 
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) 
--����w�I
	while DW_CheckDis(OwnerID(),780082,Num,40)==false do
		sleep(10)
	end
--�^�Ǽƭ�
	PE_AddVar("PH_2_Term_1_Name",1)
end

----------------------------------------------------------------------------------------------------------
--��s���Q��������>>�ǰe���}
function LuaPE_Zone16_02_DW_8()
	while PE_2_DW_PH ~= 3 do
		sleep(10)
	end
	sleep(20)
--�t����npc ����}�Ҿ԰�
	if	DW_CheckDis(OwnerID(),780082,1,50)==false	then
		AddBuff(OwnerID(),502707,1,-1)
		SetModeEx(OwnerID(),EM_SetModeType_Fight,true) 
	else
		DW_AreaMessage(OwnerID(),2,"[SC_PE_ZONE16_DW_34]",C_Yellow,833)
	end
	while true do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_HP)>(ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)/2)	then
			if	PE_2_DW_PH==4	then
--�P�_�O���O�n�S�O��t��npc
				if	DW_CheckDis(OwnerID(),780082,1,50)	then
					LuaPE_Zone16_02_DW_9()
				else
--���O�S�O��t�N��������������t
					SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
					Say(OwnerID(),"[SC_PE_ZONE16_DW_23]")
					PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
					sleep(20)
					Say(OwnerID(),"[SC_PE_ZONE16_DW_24]")
					if	CastSpell(OwnerID(),OwnerID(),495735)	then
						sleep(10)
						DelObj(OwnerID())
					end
				end
			end
			if	PE_GetVar("PH_3_Term_2_Name")>=PH_3_Term_2	then
				Say(OwnerID(),"[SC_PE_ZONE16_DW_30]")
				sleep(20)
				if	CastSpell(OwnerID(),OwnerID(),495735)	then
					sleep(20)
					DelObj(OwnerID())
				end
			end
		else
			break
		end
	end
--�Q�����᪺�B�m>>�ǰe�k��
--��_�ʧ@
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
--���ѭp��
	PE_AddVar("PH_3_Term_2_Name",1)
	Say(OwnerID(),"[SC_PE_ZONE16_DW_29]")
	while true do
		sleep(10)
		if	CastSpell(OwnerID(),OwnerID(),495735)	then
			sleep(20)
			DelObj(OwnerID())
		end
	end
end
----------------------------------------------------------------------------------------------------------
--���w�t��������
function LuaPE_Zone16_02_DW_9()
--�����԰�
	SetModeEx(OwnerID(),EM_SetModeType_Fight,false) 
	SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false) 
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) 
--�t��
	Say(OwnerID(),"[SC_PE_ZONE16_DW_25]")
	sleep(20)
	Say(OwnerID(),"[SC_PE_ZONE16_DW_26]")
--���ݲĥ|���q����
	while PE_2_DW_PH~=5 do
		sleep(10)
	end
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
--�t��
	Say(OwnerID(),"[SC_PE_ZONE16_DW_27]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(20)
	Say(OwnerID(),"[SC_PE_ZONE16_DW_28]")
	if	CastSpell(OwnerID(),OwnerID(),495735)	then
		sleep(20)
		DelObj(OwnerID())
	end
end
----------------------------------------------------------------------------------------------------------
--�Ĥ����q���ͩǼ@�� �����ĤT���q������
function LuaPE_Zone16_02_DW_10()
	local x
	local Mob_All = SetSearchAllNPC(0)
	local Mob = {}
	local Plant = {103846,103847,103848}
	local Scout = {103972,103973}
	local Gragon = {103974,103975}
	for i=1,Mob_All,1 do
		Mob[i] = GetSearchResult()
		x = ReadRoleValue(Mob[i],EM_RoleValue_OrgID)
		for g=1,table.getn(Plant),1 do
			if	x==Plant[g]	then
				DelFromPartition(Mob[i])
				ReSetNPCInfo( Mob[i] )
			end
		end
		for k=1,table.getn(Scout),1 do
			if	x==Scout[k]	then
				DelFromPartition(Mob[i])
				ReSetNPCInfo( Mob[i])
				break
			end
		end
		for z=1,table.getn(Gragon),1 do
			if	x==Gragon[z]	then
				SetModeEx(Mob[i],EM_SetModeType_Show,true) 
				SetModeEx(Mob[i],EM_SetModeType_Mark,true) 
				SetModeEx(Mob[i],EM_SetModeType_Searchenemy,true) 
				SetModeEx(Mob[i],EM_SetModeType_Strikback,true) 
				SetModeEx(Mob[i],EM_SetModeType_Fight,true) 
				AddToPartition(Mob[i],0)
				break
			end
		end
	end
	DelObj(OwnerID())
end

----------------------------------------------------------------------------------------------------------
--�M���@�����{��
function LuaPE_Zone16_02_DW_11()
	local x
	local Mob_All = SetSearchAllNPC(0)
	local Mob = {}
	local Plant = {103846,103847,103848}
	local Scout = {103972,103973}
	local Gragon = {103974,103975}
	for i=1,Mob_All,1 do
		Mob[i] = GetSearchResult()
		x = ReadRoleValue(Mob[i],EM_RoleValue_OrgID)
		for g=1,table.getn(Plant),1 do
			if	x==Plant[g]	then
				AddToPartition(Mob[i],0)
			end
		end
		for k=1,table.getn(Scout),1 do
			if	x==Scout[k]	then
				DelFromPartition(Mob[i])
				ReSetNPCInfo( Mob[i] )
				break
			end
		end
		for z=1,table.getn(Gragon),1 do
			if	x==Gragon[z]	then
				DelFromPartition(Mob[i])
				ReSetNPCInfo( Mob[i] )
				break
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------
--�ĤT���q���˼ƭp�ɼ@��&�B�z�Ǫ�
function LuaPE_Zone16_02_DW_12()
	sleep(30)
	local x
	local Mob_All = SetSearchAllNPC(0)
	local Mob = {}
	local Plant = {103846,103847,103848}
	local Scout = {103972,103973}
	local Gragon = {103974,103975}
	for i=1,Mob_All,1 do
		Mob[i] = GetSearchResult()
		x = ReadRoleValue(Mob[i],EM_RoleValue_OrgID)
		for k=1,table.getn(Scout),1 do
			if	x==Scout[k]	then
				SetModeEx(Mob[i],EM_SetModeType_Show,true) 
				SetModeEx(Mob[i],EM_SetModeType_Mark,true) 
				SetModeEx(Mob[i],EM_SetModeType_Searchenemy,true) 
				SetModeEx(Mob[i],EM_SetModeType_Strikback,true) 
				SetModeEx(Mob[i],EM_SetModeType_Fight,true) 
				AddToPartition(Mob[i],0)
				break
			end
		end
	end
	DelObj(OwnerID())
end
----------------------------------------------------------------------------------------------------------
--�Ĥ����q���ǰe���a�@��
function LuaPE_Zone16_02_DW_13()
	local Player_all = SetSearchAllPlayer(0)
	local x
	for i=1,Player_all,1 do
		x = GetSearchResult()
		if	DW_CheckMap(x,833)		then
			BeginPlot(x,"LuaPE_Zone16_02_DW_16",0)
		end
	end
	sleep(30)
	DelObj(OwnerID())
end
----------------------------------------------------------------------------------------------------------
--���b����̨��W�����`�@��
function LuaPE_Zone16_02_DW_14()
	SetPlot(OwnerID(),"dead","LuaPE_Zone16_02_DW_15",0)
	if	PE_2_DW_PH~=5	then
		DelFromPartition(OwnerID())
		ReSetNPCInfo( OwnerID() )
	end
end

function LuaPE_Zone16_02_DW_15()
	LuaPE_KS_GetBonus( 2,833,400+(PE_GetVar("PH_5_Term_2_Name")*6) )
	PE_AddVar("PH_5_Term_1_Name",1)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_ZONE16_DW_37]",C_Yellow,833)
end

----------------------------------------------------------------------------------------------------------
--�������a���@��
function LuaPE_Zone16_02_DW_16()
	AddBuff(OwnerID(),502550,1,2)
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	DialogCreate(OwnerID(),EM_LuaDialogType_YesNo,"[SC_PE_ZONE16_DW_40]")
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID(),"[SO_YES]")
	DialogSelectStr( OwnerID(),"[SO_NO]")
	if	LuaS_DialogRePort_TwoChoose(OwnerID())=="Yes"		then
		ChangeZone(OwnerID(),16,0,275.1+DW_Rand(20),-220,21986.2+DW_Rand(20),13.5)
		CastSpell(OwnerID(),OwnerID(),495735)
	end
end

----------------------------------------------------------------------------------------------------------
--���b���q3�Ǫ������`�@��
function LuaPE_Zone16_02_DW_17()
	if	PE_2_DW_PH>4	or
		PE_2_DW_PH<3	then
		DelFromPartition(OwnerID())
		ReSetNPCInfo( OwnerID() )
	end
	SetPlot(OwnerID(),"dead","LuaPE_Zone16_02_DW_18",0)
end

function LuaPE_Zone16_02_DW_18()
	if	PE_2_DW_PH==3	then
		LuaPE_KS_GetBonus( 2,833,10 )
	end
	return true
end


function LuaPE_Zone16_02_DW_19()
	if	PE_2_DW_PH~=5	then
		DelFromPartition(OwnerID())
		ReSetNPCInfo( OwnerID() )
	end
end


function LuaPE_Zone16_02_DW_20(PE_Index , GUID , Score)
	local LV = 55
	local MapID = ZONE16_PE02_MapID
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = ZONE16_PE01ORC_Var["ExCha_Ratio"]

	if Score > 0 then
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--�j�N��"
		else
			if Score >= 800 then Score = 800 end
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--�j�N��"
		end
	end

end
function LuaPE_Zone16_02_Pass1()--�q�L�Ĥ@���q
	PE_AddVar("PH_1_Term_1_Name",120)
end
function LuaPE_Zone16_02_Pass2()--�q�L�ĤG���q
	PE_SetVar("PH_3_Term_1_Name",1);
end
function LuaPE_Zone16_02_TimeFly()--���m�ɶ�����
	PE_SetVar("PH_0_Term_1_Name", 1);
end
--[[
/gm ? pcall LuaPE_ZONE18_PE01_GetScore(100)
--]]
function LuaPE_ZONE18_PE01_GetScore(Score)--���ۤv����
	PE_GivePlayerScore( ZONE18_PE01_PEIndex , OwnerID() , Score );
end
function LuaPE_ZONE18_PE01_TimeFly()
	PE_SetVar("ZONE18_PE01_ResetTime", 1);
end
function LuaPE_ZONE18_PE01_Pass1()--�q�L�Ĥ@���q
	PE_SetVar("ZONE18_PE01_Var_SmallAgidinDead",60)
end
function LuaPE_ZONE18_PE01_Pass2()--�q�L�ĤG���q
	PE_SetVar("ZONE18_PE01_Var_BigAgidinDead",30)
end
function LuaPE_ZONE18_PE01_Pass3()--�q�L��3���q
	PE_SetVar("ZONE18_PE01_Var_BossDead",1)
end
function LuaPE_ZONE18_PE01_PassSP()--�q�L�S���q(�b�Ĥ@���q����A���ɭԷ|�X�{)
	PE_SetVar("ZONE18_PE01_PH2Time",1)
end