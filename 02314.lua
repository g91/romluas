function AG_face_and_load()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
end

function AGtest1()
	for i=1,266 do
		PlayMotion(OwnerID(),i)
		Sleep(10)
	end
end

-----------------------------------------------------------------------------------------------use
function AGuse01(x)
		PlayMotion(OwnerID(),x)
end
-----------------------------------------------------------------------------------------------use�䪫�󧤼ХΡA�^��table
function AGUSE02(Obj)
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	local T={x,y,z}
	return T
end
--------------------------------------------------------���񵷮V�A�Ĥ@���q�������}����
function AG_424093_LevandDisappear()
	local xyz=AGUSE02(OwnerID())				--table,�ˮy��
	local Obj_H=Lua_DW_CreateObj("xyz",117907,xyz,1,27,1)	--�s�X�t�@�����񵷮V����t
	CallPlot(Obj_H,"AG_424093_01",Obj_H,xyz[1],xyz[2],xyz[3])	--�Υs�X�Ӫ�npc�I�s�禡
end

function AG_424093_01(Obj_H,x,y,z)
		AdjustFaceDir(Obj_H,TargetID(),0)
		Sleep(10)
		say(Obj_H,"[SC_424093_1]")				--�n�]�w�r��SC_424093_1�A�۫H�A���|���ۤv���˪��A�O�o�ӿ�񤤧�ڡC
		--Say(Obj_H,"test")
		Sleep(10)
		Move( Obj_H, x+500 , y, z-200 )
		Sleep(20)
		DelObj(Obj_H)	
end
--------------------------------------------------------�L�q�A�Ĥ@���q���ȵ���Ĳ�o�@���u�ڭ̶}�l�a�K�v
function AG_424094_ShowYourBlood()
	AddBuff(TargetID(),509369,1,20)
	local xyz=AGUSE02(OwnerID())
	local Obj_HS=Lua_DW_CreateObj("xyz",117908,xyz,1,230,1)
	WriteRoleValue(Obj_HS,EM_RoleValue_IsWalk,0)
	CallPlot(Obj_HS,"AG_424094_01",Obj_HS,xyz[1],xyz[2],xyz[3],TargetID())
end
function AG_424094_01(Obj_HS,x,y,z,Player)
		Sleep(10)
		Say(Obj_HS,"[SC_424094_1]")				--�]�w�r�� SC_424094_1�A�ڭ̶}�l�a�K
		Sleep(10)
		Move(Obj_HS,x-20,y,z+22)
		Sleep(20)		
		PlayMotion(Obj_HS,148)
		sleep(10)
		AddBuff(Obj_HS,509157,1,2)
		ScriptMessage(Player,Player,1,"[SC_424094_2]",0)		--[117908]�ϥΤF[209258]�A���۸O�S����������C
		Sleep(10)
		Say(Obj_HS,"[SC_424094_3]")					--�]���O�o�ӶܡK
		Sleep(10)
		AddBuff(Obj_HS,509157,1,2)	
		sleep(10)
		ScriptMessage(Player,Player,1,"[SC_424094_4]",0)		--[117908]�ϥΤF[209259]�A���۸O�S����������C
		Sleep(10)
		Say(Obj_HS,"[SC_424094_5]")					--�ݨӤ]���O�o�ӡK�J�M�p���K
		Sleep(20)
		PlayMotion(Obj_HS,150)
		sleep(20)
		AddBuff(Obj_HS,509157,1,2)
		PlayMotion(Obj_HS,39)
		ScriptMessage(Player,Player,1,"[SC_424094_6]",0)		--[117908]�ϥΤF�ۤv���A��A�A��y�b�۸O�W�o�X�H�H�����~�C
		Sleep(10)
		ScriptMessage(Player,Player,1,"[SC_424094_7]",0)		--���~�@�U�N�����F�A�۸O�S����������C
		Sleep(20)
		PlayMotion(Obj_HS,41)
		Sleep(10)
		Say(Obj_HS,"[SC_424094_8]")					--�ݨ��٬O���ѤF�K
		Sleep(10)
		Move(Obj_HS,x,y,z)
		Sleep(10)
		DelObj(Obj_HS)
end
--------------------------------------------------------�L�q�A�ĤG���q����--������ܭ��P��ʭ��A������ܭ�
function  AG_424095_UnderTheBlood_talk()
	LoadQuestOption(OwnerID())
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	if CheckFlag(OwnerID(),544961)==false then
		AdjustFaceDir(TargetID(),OwnerID(),0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_1]","AG_424095_01",0)	
	end
end
function AG_424095_01()
	PlayMotion(TargetID(),112)
	SetSpeakDetail(OwnerID(),"[SC_424095_2]")					
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_3]","AG_424095_02",0)	
end
function AG_424095_02()
	SetSpeakDetail(OwnerID(),"[SC_424095_4]")				
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_5]","AG_424095_03",0)	
end
function AG_424095_03()
	SetSpeakDetail(OwnerID(),"[SC_424095_6]")					
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_7]","AG_424095_04",0)
end
function AG_424095_04()
	SetSpeakDetail(OwnerID(),"[SC_424095_8]")				
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	SetFlag(OwnerID(),544961,1)
end
--------------------------------------------------------�L�q�A�ĤG���q����--��ʭ�--�αo�X�Ы�--�i�H�I�����F��X�{
function AG_424095_UnderTheBlood_act_after()
	if CountBodyItem(OwnerID(),209260)==1	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SYS_ITEM_UNIQUE]",0)
		return false
	end
		AddBuff(OwnerID(),509418,1,5)
		AddBuff(TargetID(),509157,1,-1)
	return true
end
function AG_424095_UnderTheBlood_act_before()
	local OBJ_state=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if	OBJ_state==0	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,250)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424095_9]",0)
			AddBuff(TargetID(),509157,1,-1)
			return 1
		elseif	OBJ_state==250 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,500)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424095_10]",0)
			return 1
		elseif	OBJ_state==500 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424095_11]",0)	
			Lua_CancelAllBuff(TargetID())
			AddBuff(TargetID(),507096,1,1)			
			GiveBodyItem(OwnerID(),209260,1)
			SetFlag(OwnerID(),544960,0)
			return 1
		else
			return 1
		end	
end
--------------------------------------------------------��117835�ɷ|�Ψ쪺�۪O�禡
function AGUSE_STORN01(X)
	local Obj_HS=Lua_DW_CreateObj("obj",X,OwnerID(),0,1)
END
--------------------------------------------------------424096���ê��T���A�����ܵ��X��
function LuaS_424096_AG()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	if CheckAcceptQuest(OwnerID(),424096) and CountBodyItem(OwnerID(),209260)==1 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_1]","LuaS_424096_01",0)
	end
	--if CheckAcceptQuest(OwnerID(),424109)==true or CheckCompleteQuest(OwnerID(),424109)==true then
	--	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423688_1]","LuaS_424109_01",0)
	--end
end
--function LuaS_424109_01()
--	SetPos(OwnerID(),2944,569,10243,137)
--end
function LuaS_424096_01()
	SetSpeakDetail(OwnerID(),"[SC_424096_2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_3]","LuaS_424096_02",0)
end
function LuaS_424096_02()
	PlayMotion(TargetID(),112)
	SetSpeakDetail(OwnerID(),"[SC_424096_4]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_5]","LuaS_424096_03",0)
end
function LuaS_424096_03()
	SetSpeakDetail(OwnerID(),"[SC_424096_6]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_7]","LuaS_424096_04",0)
end
function LuaS_424096_04()
	SetSpeakDetail(OwnerID(),"[SC_424096_8]")
	DelBodyItem(OwnerID(),209260,1)
	SetFlag(OwnerID(),544962,1)
end

function LuaQ_424096_Complet()
	local xyz=AGUSE02(OwnerID())
	local xyz1={xyz[1]+15,xyz[2],xyz[3]+15}
	local roada=Lua_DW_CreateObj("xyz",105478,xyz1,1,0,1)
	CallPlot(roada,"LuaQ_424096_C_2",roada)
end
function LuaQ_424096_C_2(roada)
	Sleep(10)
	AdjustFaceDir(roada,OwnerID(),0)
	Sleep(10)
	Say(roada,"[SC_424096_9]")
	Sleep(10)
	Say(roada,"[SC_424096_10]")
	Sleep(30)
	Move(roada,3439,187,11087)
	Sleep(20)
	DelObj(roada)
	return
end
--------------------------------------------------------424097�I���U�l
function AG_424097FakeAndTrue_bag()					--209262�U�l�|���
	local Energe=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424097]"..Energe,0)		--SC_424097�ثe�R�બ�p
	return
end
--------------------------------------------------------424097�I����q��
function AG_FakeAndTrue_Storn_BP()						--209263��q�۷|���
	local num=DW_RAND(3)
	local Energe=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)

		if	CountBodyItem(OwnerID(),209262)==1 then		--���p���]�k���U
				Energe=Energe+num
			if	Energe>=8	then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424097]"..Energe,0)
				DelBodyItem(OwnerID(),209262,1)
				GiveBodyItem(OwnerID(),209261,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)
				return
			else
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,Energe)
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424097]"..Energe,0)
			end
		else
			--������
		end
end
--------------------------------------------------------�I���R���]�k�U
function AG_424097FakeAndTrue_MagPack()
	Beginplot( OwnerID() ,"AG_424097_00", 0 )
	GiveBodyItem(OwnerID(),209262,1)
end

function AG_424097_00()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return
	end
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate(OwnerID(),EM_LuaDialogType_Select,"[SC_424097_1]");	--SC_424097_1
	DialogSelectStr(OwnerID(),"[SC_424097_2]");				--SC_424097_2
	DialogSelectStr(OwnerID(),"[SC_424097_3]");				--SC_424097_3

	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		CancelBuff( OwnerID(), 501570 );
		return;
	end
	local SelectID = AG_GetDialogResoult( OwnerID() );
	CancelBuff( OwnerID(), 501570 );
	DialogClose( OwnerID() )
	if SelectID == 0  then
		AG_424097_01()
	elseif SelectID == 1  then
		AG_424097_02()
	else 
		-- �S��
	end
	
end

function AG_GetDialogResoult(  GItemID )
	local Ret;
	for i = 0 , 40 , 1 do
		Sleep( 10 );
		Ret = DialogGetResult( GItemID );
		if Ret >-2 then
			if Ret>=0 then
				return Ret;
			elseif Ret==-1 then
				break
			end
		end
	end
	return -1
end

function AG_424097_01()
	AddBuff(OwnerID(),509575,1,2)
	Say(OwnerID(),"[SC_424097_2]")
	GiveBodyItem(OwnerID(),209264,1)
	--GiveBodyItem(OwnerID(),209262,1)
	return
end
function AG_424097_02()
	AddBuff(OwnerID(),509575,1,2)
	Say(OwnerID(),"[SC_424097_3]")
	GiveBodyItem(OwnerID(),209265,1)
	--GiveBodyItem(OwnerID(),209262,1)
	return
end
--------------------------------------------------------
function LuaQ_424098_HURRY_clickobj()
	IF CheckFlag(OwnerID(),544963)==TRUE and CountBodyItem(OwnerID(),209285)==0 then	--544963�ݹ�ܵ��A�X��
		GiveBodyItem(OwnerID(),209285,1)
		return 1
	elseif	CheckFlag(OwnerID(),544963)==FALSE then
		AddBuff(OwnerID(),509430,0,5)
		return false
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SYS_ITEM_UNIQUE]",0)
		return false
	end
end
function AG_424098_HURRY_01()	--���ܮ�544963�X��
		LoadQuestOption(OwnerID())						--�ڦb���A�ЧO�ЧڡI
	if CheckAcceptQuest(OwnerID(),424098) and CheckBuff(OwnerID(),509434)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_1]","AG_424098_01",0)
	end
end
function AG_424098_01()
	SetSpeakDetail(OwnerID(),"[SC_424098_2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_3]","AG_424098_02",0)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_4]","AG_424098_06",0)	
end
function AG_424098_02()
	SetSpeakDetail(OwnerID(),"[SC_424098_5]")					--5�ڻ����@�U�F�K�A�o�ӤHť�����H�ܶܡH�٬O�ڱo��A�����ܤ~��H�K�L�L�L�K�ڲ{�b�S�šI
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_6]","AG_424098_03",0)		--6�i�O�K
end
function AG_424098_03()
	SetSpeakDetail(OwnerID(),"[SC_424098_7]")					--7
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_8]","AG_424098_04",0)		--8���O�K
end
function AG_424098_04()
	SetSpeakDetail(OwnerID(),"[SC_424098_9]")					--9���K�����K�A�T�w�A�ٷQ�~�򻡤U�h�H
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_10]","AG_424098_05",0)	--10��������
end
function AG_424098_05()
	CloseSpeak(OwnerID())
	--DisableQuest(TargetID(),true)
	CallPlot(TargetID(),"Lua_AG_Changebody1",TargetID(),OwnerID())
end
function AG_424098_06()
	SetSpeakDetail(OwnerID(),"[SC_424098_13]")	
	AddBuff(OwnerID(),509473,1,1)		
	SetFlag(OwnerID(),544963,1)
end
function Lua_AG_Changebody1(Obj,Player)
	--DisableQuest(Obj,false)
	ScriptMessage(Player,Player,0,"[SC_424098_11]","0xffff80ff")
	--Sleep(5)
	AdjustFaceDir(Obj,Player,0)
	Sleep(5)	
	CastSpell(Obj,Player,497560)
	DW_CancelTypeBuff(68,Player)
	Sleep(10)	
	Say(Obj,"[SC_424098_12]")
end
--------------------------------------------------------
--���H���
function LuaS_118031_01()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),112)
		if CheckAcceptQuest(OwnerID(),424101)==true then
--ť���A�O�̥��o�{�����H�H
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424101_1]","LuaS_118031_02",0)
		end
end
function LuaS_118031_02()
	SetSpeakDetail(OwnerID(),"[SC_424101_2]")
	SetFlag(OwnerID(),544984,1)
end
function LuaS_118032_01()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),112)
		if CheckAcceptQuest(OwnerID(),424101)==true then
--�ڷQťť���󨺭ӥX�g�����H
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424101_3]","LuaS_118032_02",0)
		end
end
function LuaS_118032_02()
	SetSpeakDetail(OwnerID(),"[SC_424101_4]")
	SetFlag(OwnerID(),544985,1)
end
--------------------------------------------------------
function luaS_118033_01()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	if CheckAcceptQuest(OwnerID(),424109)==true and CountBodyItem(OwnerID(),209294)==0 then
		GiveBodyItem(OwnerID(),209294,1)
	end
end
--�H�U���ΤF
function luaS_118033_02()
	CloseSpeak(OwnerID())
	if	CountBodyItem(OwnerID(),209289)==10 then
		CastSpell(OwnerID(),OwnerID(),497181)
		sleep(20)
		GiveBodyItem(OwnerID(),209291,1)
	end
end
--------------------------------------------------------
--�լd�i�áA�I���]�]
function LuaI_209292_AfterUse()
	local NPCTT=SearchRangeNPC(OwnerID(),50)
	local num=table.getn(NPCTT)
	for i=0,num,1 do
		local npcid=ReadRoleValue(NPCTT[i],EM_RoleValue_OrgID)
		if npcid==118123 then
			local Obj=Lua_DW_CreateObj("obj",118124,NPCTT[i])
			SetModeEx(Obj,EM_SetModeType_Mark,false)
			CallPlot(NPCTT[i],"LuaFunc_ResetObj",NPCTT[i])
			return
		end
	end
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_VALENTINE_2011EV1_07]",0)
end
--��l�@��
function LuaI_118124_suspicious()
	local Plase=AGUSE02(OwnerID())
	local No_See2=Lua_DW_CreateObj("xyz",105621,Plase,1,27,1)
	WriteRoleValue(No_See2,EM_RoleValue_Register,OwnerID())
	CallPlot(No_See2,"Lua_AG_Suspicious",No_See2,Plase[1],Plase[2],Plase[3])
end
function Lua_AG_Suspicious(No_See2,x,y,z)
	SetModeEx(No_See2,EM_SetModeType_Fight,true)
	SetModeEx(No_See2,EM_SetModeType_Mark,true)
	SetModeEx(No_See2,EM_SetModeType_Move,FALSE)
	SetModeEx(No_See2,EM_SetModeType_Gravity,FALSE)
	SetModeEx(No_See2,EM_SetModeType_Searchenemy,FALSE)
	SetModeEx(No_See2,EM_SetModeType_Strikback,true)
	SetModeEx(No_See2,EM_SetModeType_AlignToSurface,FALSE)
	AddBuff(No_See2,507646,1,-1)
	AddBuff(No_See2,509456,0,604800)
end
--���`�@��1
function Lua_AG_105621_dead()
	SetPlot(OwnerID(),"dead","Lua_AG_105621_dead_01",0)
end
function Lua_AG_105621_dead_01()
	local Obj=ReadRoleValue(OwnerID(),EM_RoleValue_Register)
	AddBuff(OwnerID(),509473,0,3)
	DelObj(Obj)
	DW_QietKillOne(TargetID(),105622)
	DelObj(OwnerID())
	return
end
-------------------------------------------------------424103�W��
--�a�񪫫~
function LuaI_118122_01()
	SetPlot(OwnerID(),"range","LuaI_118122_02",40)
end
function LuaI_118122_02()
	if CheckFlag(OwnerID(),544986)==false and CheckAcceptQuest(OwnerID(),424103)==true then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424103_1]",0)
		return
	else
		return
	end
end
--�I�����~
function LuaQ_424103_AfterClickObj()
	if CheckFlag(OwnerID(),544986)==false and CheckAcceptQuest(OwnerID(),424103)==true then
		local Obj=Lua_DW_CreateObj("obj",118120,TargetID())
			SetModeEx(Obj,EM_SetModeType_Mark,false)
			CallPlot(Obj,"LuaQ_424103_01",Obj,OwnerID())
		return 1
	end
	return false
end
function LuaQ_424103_01(Obj,Obj2)
		PlayMotion(Obj,150)
		Sleep(10)
		MoveDirect(Obj,3831.3,223.6,12893.5)
		Sleep(20)
		Say(Obj,"[SC_424103_2]")
		Sleep(10)
		--AdjustFaceDir(Obj,Obj2,0)
		SetFlag(Obj2,544986,1)
		SetFlag(Obj2,545015,1)
		DelObj(Obj)
		return 
end
function LuaQ_424103_Complet()
	SetFlag(TargetID(),545015,1)
end
-------------------------------------------------------
--ŧ���ƥ�A��l�@��
function LuaI_118034_Suspicious()
	local Plant=OwnerID()
	local Plase=AGUSE02(Plant)--��y��
	local No_See2=Lua_DW_CreateObj("xyz",118035,Plase,1,27,1)
	WriteRoleValue(No_See2,EM_RoleValue_Register,Plant)
	CallPlot(No_See2,"Lua_AG_Suspicious1",No_See2)
	SetPlot(OwnerID(),"range","Lua_AG_FarMonster",80)
end
function Lua_AG_Suspicious1(No_See2)
	SetModeEx(No_See2,EM_SetModeType_Fight,true)
	SetModeEx(No_See2,EM_SetModeType_Mark,true)
	SetModeEx(No_See2,EM_SetModeType_Move,false)
	SetModeEx(No_See2,EM_SetModeType_Gravity,false)
	SetModeEx(No_See2,EM_SetModeType_Searchenemy,false)
	SetModeEx(No_See2,EM_SetModeType_Strikback,false)
	SetModeEx(No_See2,EM_SetModeType_AlignToSurface,false)
	AddBuff(No_See2,509456,0,604800)
end
--�IĲ�@��
function Lua_AG_FarMonster()
	local Play_T=SearchRangePlayer(OwnerID(),100)
	local num=table.getn(Play_T)
	for i=0,num,1 do
		if CheckAcceptQuest(Play_T[i],424106)==true	then
			local dir=ReadRoleValue(Play_T[i],EM_RoleValue_Dir)
			local Plase=AGUSE02(OwnerID())
			local monster=Lua_DW_CreateObj("xyz",105451,Plase,1,Dir,1)
			--CallPlot(monster,"Lua_AG_ShowMonster",monster,Play_T[i])
		else
			return
		end
	end
end
--���`�@��
function LuaS_118035_Dead()
	SetPlot(OwnerID(),"dead","Lua_AG_PlantBlock",0)
end
function Lua_AG_PlantBlock()
	local Obj=ReadRoleValue(OwnerID(),EM_RoleValue_Register)
	local monster=Lua_DW_CreateObj("obj",105451,Obj)
	AddBuff(OwnerID(),509473,0,3)
	CallPlot(Obj,"LuaFunc_ResetObj",Obj)
	DelObj(OwnerID())
	return
end
function Lua_105451_HateListCount()
	Sleep(100)
	while 1 do
		if HateListCount(OwnerID())==0 then
			DelObj(OwnerID())
			return
		end
		Sleep(30)
	end
end
--------------------------------------------------------
--�d�˪��O��
Function LuaI_209294_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetString("SC_424109_1"));
	AddBorderPage( OwnerID(), GetString("SC_424109_2"));
	AddBorderPage( OwnerID(), GetString("SC_424109_3"));
	AddBorderPage( OwnerID(), GetString("SC_424109_4"));
	ShowBorder( OwnerID(), 0, Str,"ScriptBorder_Texture_Paper" )
	SetFlag(OwnerID(),545017,1)
end

----------------------------------------���ܿ��
function LuaQ_424110_Accapt()
	SetPos(TargetID(),-178,1150,11061,260)
end
function LuaS_118230_01()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424110)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_116269_K_STORY_16]"," LuaS_118230_02",0)
	end
end
function  LuaS_118230_02()
	SetPos(OwnerID(),860,317,12899,86)
end

function LuaS_118227_BA()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_118227_BA1",0)
end
function LuaS_118227_BA1()
	SetSpeakDetail(OwnerID(),"[SC_424110_3]")
	SetFlag(OwnerID(),545028,1)
end
function LuaS_118228_HI()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_118228_HI1",0)
end
function LuaS_118228_HI1()
	SetSpeakDetail(OwnerID(),"[SC_424110_1]")
	SetFlag(OwnerID(),545030,1)
end
function LuaS_118228_OS()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_118229_OS1",0)
end
function LuaS_118229_OS1()
	SetSpeakDetail(OwnerID(),"[SC_424110_2]")
	SetFlag(OwnerID(),545029,1)
end
----------------------------------�e�H
function LuaS_118238_1()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_118238_1]","LuaS_118238_2",0)
end
function LuaS_118238_2()
	SetSpeakDetail(OwnerID(),"[SC_118238_2]")
	SetFlag(OwnerID(),544987,1)
end
----------------------------------�ҥj�]
function luaI_209291_1()
	local T_npc=SearchRangeNPC(OwnerID(),50)
	local num=table.getn(T_npc)
	for i=0,num,1 do
		local Obj=ReadRoleValue(T_npc[i],EM_RoleValue_OrgID)
		if Obj==118160 then
			SetModeEx(T_npc[i],EM_SetModeType_Mark,true)
		end
	end
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_VALENTINE_2011EV1_07]",0)
end
--------------------------------�ǰe��+buff
function LuaS_118240_Gate()
	SetPlot(OwnerID(),"range","LuaS_118240_Gate1",25)
end
function LuaS_118240_Gate1()
	--Say(OwnerID(),TargetID())
	SetPos(OwnerID(),3179,132,11075,0)
end
function Lua_118240_Gate2()
	AddBuff(OwnerID(),509576,1,60)
end

function AGUSE03(x)
	AddBuff(OwnerID(),x,0,-1)
end

function lua_AGtest05()
	while 1 do
	CastSpell(OwnerID(),2883666,497196)
	Sleep(20)
	end
end
--�S�H�ʵ��H��
function LuaC_118239_Mail()
	LoadQuestOption(OwnerID());
	if	CheckAcceptQuest(OwnerID(),424201)==true and
		CountBodyItem(OwnerID(),209295)==0	then
		GiveBodyItem(OwnerID(),209295,1)
	end
end