



-------------------------------------------------
function LuaS_422717_0() --���b�[�զh������ܼ@��
-------------------------------------------------
--�w�g�������Ȫ��H
--���s�٨S�i�J�I��
	if	CheckCompleteQuest(OwnerID(),422717)	and
		Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)]==0	and
		CountBodyItem(OwnerID(),205836)	== 0	then
		SetSpeakDetail( OwnerID(),"[SC_422717_0]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422717_1]","LuaS_422717_1", 0 )
	else
--�������N�̷Ӭy�{�h�]
		LoadQuestOption(OwnerID())
	end
end

-------------------------------------------------
function LuaS_422717_1()
-------------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422717_2]")
	GiveBodyItem(OwnerID(),205836,1)
end
-------------------------------------------------
function LuaS_422717_2() -- ���~���ˬd�@��
-------------------------------------------------
DeBugMSG(0,0,"UseItem:Start")
--�p�G�ؼФ��O�p�S�O��
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102623	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[EM_201167_3]", 0 )
		return false
	end
--�ˬd���W�O�_�����o�ϥΪ�buff
	if	CheckBuff(OwnerID(),504310)	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SYS_GAMEMSGEVENT_107]", 0 )
		return false
	end
--�ˬd���������q
	if	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] ~= 0	then
		return false
	end
--DeBugMSG(0,0,"UseItem:End".."^^Gloabl = "..Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)])
--�p�G�S���H�W����
	return true
end
-------------------------------------------------
function LuaS_422717_3() -- ���~������@��
--------------------------------------------------
--�g�J���~���N�o�ɶ�
	local ColdownType
	local ColdownTime
	ColdownType = GameObjInfo_Int( 494294 ,"ColdownType")
	ColdownTime = GameObjInfo_Int( 494294 ,"ColdownTime") 
	WriteRoleValue(OwnerID(),EM_RoleValue_Coldown_Job + ColdownType,ColdownTime)

--�Y�O�b����ϥΫh�i�J²��Ҧ�
--�P�_��q95%�H�W & ���i�J²��Ҧ�
--DeBugMSG(0,0,"Register = "..ReadRoleValue(TargetID(),EM_RoleValue_Register1).."HP/MAXHP="..ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP))
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) > 0.95	and
		ReadRoleValue(TargetID(),EM_RoleValue_Register1)==0	 then
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
		BeginPlot(TargetID(),"LuaS_422717_8",0)
	end
--DeBugMSG(0,0,"Gloabl = "..Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)])
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) < 0.5	then
--���ܥ����ܼ� ��ܼ@���}�t
		if	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] == 0	then
			Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] = 1
--�R�O�p�S�O���t��
			BeginPlot(TargetID(),"LuaS_422717_4",0)	
		end
	else
		if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) <=	0.95	and
			ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) >=	0.5	then
			WriteRoleValue(TargetID(),EM_RoleValue_Register2,ReadRoleValue(TargetID(),EM_RoleValue_Register2)+1)
			ScriptMessage( OwnerID(), OwnerID() , 2, "[SC_102623_2]", 0 )
		end
--�p�G�尪��50% ���w�|���ͪk�N
		CallPlot(OwnerID(),"LuaS_422717_9",TargetID())
	end
end

-------------------------------------------------
function LuaS_422717_4()--�p�S�O���t��
-------------------------------------------------
	local TempID
--���y����C�� �çP�_�O�_�ŦX���o�ٸ������
--�q�ӨS���ϥιL�����y�~��q�L�ˬd
--DeBugMSG(0,0,"Register="..ReadRoleValue(OwnerID(),EM_RoleValue_Register2))
	if	ReadRoleValue(OwnerID(),EM_RoleValue_Register2)==0	then
		for i=0,HateListCount(OwnerID())-1,1 do
			TempID = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--DeBugMSG(0,0,"TempID="..TempID.."##IsPlayer??  I am "..ReadRoleValue(TempID,EM_RoleValue_IsPlayer))
			if	ReadRoleValue(TempID,EM_RoleValue_IsPlayer)==1	then
				GiveBodyItem(TempID,530384,1)
			end
		end
	end
	for i=0,HateListCount(OwnerID())-1,1 do
		TempID = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--�������ȺX��
		if	CheckAcceptQuest(TempID,422717)	then
			SetFlag(TempID,543269,1)
		end
	end
--���ܧ������A
--�W���i������buff
	MoveToFlagEnabled(OwnerID(), false)
	SetFightMode ( OwnerID(),0,1,0,0 )
	Lua_CancelAllBuff(OwnerID())
	SetRoleCamp(OwnerID(),"Visitor")
	AddBuff(OwnerID(),504113,1,120)
	SetStopAttack(OwnerID())
	sleep(20)
--�i�J�I��
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_SLEEP_LOOP)
	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] = 2
	ScriptMessage( OwnerID(), -1, 2, "[SC_102623_5]", 0 )
end

-------------------------------------------------
function LuaS_422717_5() --���b�[�զh�����X�ͼ@��
-------------------------------------------------
--��room�����ܼƪ�l��
	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] = 0
end


-- _6 �M _7�Q�α��F



-------------------------------------------------
function LuaS_422717_8()--�t�����Ҧ�
-------------------------------------------------
--���ͤۼv
	local Shadow = Lua_DW_CreateObj("flag",113581,780088,1)
	DisableQuest(Shadow,true)
	Say(Shadow,"[SC_102623_3]")
	sleep(20)
--�I�k ����S��
	if	CastSpell(Shadow,OwnerID(),494220)	then
		AddBuff(OwnerID(),504610,1,-1)
		Say(Shadow,"[SC_102623_4]")
--���񧹦����Ȧs��
		sleep(20)
		DelObj(Shadow)
	end
end

-------------------------------------------------
function LuaS_422717_9(TargetID)--�I��k�N
-------------------------------------------------
--��ڮĪG
	SysCastSpellLv(OwnerID(),TargetID,493893,1)
--�S��
	CastSpell(OwnerID(),TargetID,494224)
end