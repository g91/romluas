
--------------------------------------------------------------------------------
--�d��������ܼ@��
function LuaS_423516_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423516)==true	and
		CheckFlag(OwnerID(),544396)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423516_0]","LuaS_423516_1", 0 )
	end
end
--------------------------------------------------------------------------------
function LuaS_423516_1()
	DW_CancelTypeBuff(68,OwnerID())--�Ѱ��y�M
	if	GlobalValue_Z18_DW_02 ~= nil	then
		if	CheckID(GlobalValue_Z18_DW_02)==false	then
			GlobalValue_Z18_DW_02 = nil
		end
	end

--�����٨S�}�l
	if	GlobalValue_Z18_DW_02 == nil	then
--���ܥ����ܼ�(����)
		GlobalValue_Z18_DW_02 = Lua_DW_CreateObj("flag",104336,780084,1)
--�إ߱d����=>�g�JPID=10=>�}�l�i��y�{
		WriteRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID,0)
		BeginPlot(GlobalValue_Z18_DW_02,"LuaS_423516_4",0)
--�j���d�򤺪��a&�������Ȫ��e�h�i�����
		local Player = SearchRangePlayer( OwnerID() , 250 )
		for i=0,table.getn(Player),1 do
--�߰ݪ��a�O�_�i�����
			if	CheckAcceptQuest(Player[i],423516)==true	and
				Player[i]~=OwnerID()	then
--������ܵ���
				CloseSpeak(Player[i])
				CallPlot(Player[i],"DW_ChooseOneFromTwo",Player[i],"[SC_QUESTEXECUTESURE_1]","LuaS_423516_3","LuaS_423516_2")
			end
		end

--�̫��}�ҥ��Ȫ����a�e�i�h
		BeginPlot(OwnerID(),"LuaS_423516_3",0)

	else
--���Ȥw�g�}�l
--������ܵ���
		CloseSpeak(OwnerID())
--�߰ݪ��a�O�_�i�����
		CallPlot(OwnerID(),"DW_ChooseOneFromTwo",OwnerID(),"[SC_QUESTEXECUTESURE_0]","LuaS_423516_3","LuaS_423516_2")
	end
end
--------------------------------------------------------------------------------
--���a�������i�����
function LuaS_423516_2()
	CloseSpeak(OwnerID())
end
--------------------------------------------------------------------------------
--�ѻP����&�i��ǰe
function LuaS_423516_3()
--�P�_���ȶ��q&���t���A(����*2)
	GiveBodyItem(OwnerID(),208154,2)
	if	ReadRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID)<20	then
--�e���@��
		AddBuff(OwnerID(),506098,1,3)
		AddBuff(OwnerID(),507914,1,3)
		SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
		BeginPlot(OwnerID(),"LuaS_423516_11",2)
--�ǰe
		DW_ChangeWithFlag(OwnerID(),780084,1,50)
		AddBuff(OwnerID(),507615,1,30)
		sleep(10)
	elseif	ReadRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID)<30	then
--�e���@��
		AddBuff(OwnerID(),506098,1,10)
		AddBuff(OwnerID(),507914,1,10)
		BeginPlot(OwnerID(),"LuaS_423516_11",2)
--�ǰe
		DW_ChangeWithFlag(OwnerID(),780085,7,25)
	end
	for i=1,30,1 do
		if	GlobalValue_Z18_DW_02==nil	or
			CheckID(GlobalValue_Z18_DW_02)==false	then
			CancelBuff(OwnerID(),506098)
			CancelBuff(OwnerID(),507914)
			CancelBuff(OwnerID(),507615)
			return
		end
		sleep(10)
	end
end
--------------------------------------------------------------------------------
--���Ȭy�{=>�ɺt�G�إX�Ӫ��d����
function LuaS_423516_4()
	DW_UnFight(OwnerID())
	AddBuff(OwnerID(),507615,1,300)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
--�����ݦܪ��񦳤H
	sleep(40)
--�L����x�ӳ�
	Say(OwnerID(),"[SC_110539_5]")
	sleep(35)
--�}�l�ˬd����O���O�����a�X�{
	local Player = {}
	for i=1,30,1 do
		sleep(1)
		Player = SearchRangePlayer ( OwnerID() , 300 )
		for k=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[k],423516)==true	and
				CheckBuff(Player[k],507615)==true		then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,11)
--(�������r�T��)�A�̮I�n���u����A�ܤU�F�ܨ��Ĥ�......
				ScriptMessage( OwnerID(), 0, 2, "[SC_423516_1]", 0 )
			end
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==11	then
			break
		end
		if	i==30	and
			ReadRoleValue(OwnerID(),EM_RoleValue_PID)<11	then
--�Y�S���j�M�쪱�a=>���榬�u�{��
--�|���إX���Ȫ���
			LuaS_423516_5()
			return
		end
	end
	sleep(15)
--�d����104336�G�N.......�ڭ̲{�b�O�Y�ذʪ��A�@�j�@�p�A�ڬO�ꦨ�j�������C
	Say(OwnerID(),"[SC_423516_2]")
	sleep(30)
--(�X�{�V�U���ު��b�Y)
	local PointMark = {}
	PointMark[1] = Lua_DW_CreateObj("flag",104508,780084,2)
	PointMark[2] = Lua_DW_CreateObj("flag",104508,780084,3)
	Lua_ObjDontTouch( PointMark[1] )
	Lua_ObjDontTouch( PointMark[2] )
	DW_UnFight(PointMark[1])
	DW_UnFight(PointMark[2])
--�d�����G�ݡA�ڮI�o�u�n�A �L�̵����|�o�{���Ħb�����I�ڵ����άݦn���աI
	Say(OwnerID(),"[SC_423516_3]")
	sleep(20)
--(�������r)�G�ڪ��p�³�...�A�Q�k����H
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_4]", 0 )
--�إX��P�]�L���u��
	local Star = Lua_DW_CreateObj("flag",104334,780084,4)
	WriteRoleValue(Star,EM_RoleValue_IsWalk,0)
	Hide(Star)
	Show(Star,0)
	DW_UnFight(Star)
	CallPlot(Star,"DW_MoveToFlag",Star , 780085, 1,0)
	sleep(30)
--(�������r)�G���D�A�{���X�������N�����A�q�ڪ��x���k�}�ܡH
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_5]", 0 )
	sleep(5)
--�Ԫk�J���E���J�w104332�٦�5������I�I���Ԥh104335�C(�������԰��X�СC)
	local Lafa = Lua_DW_CreateObj("flag",104332,780084,4)
	AdjustFaceDir(star,Lafa,0)
	DW_UnFight(Lafa)
	AdjustFaceDir(Lafa,star,0)
	sleep(5)
	local TrueHand = {}
	for i=1,5,1 do
		TrueHand[i] = Lua_DW_CreateObj("flag",104335,780084,i+4)
		DW_UnFight(TrueHand[i])
		AdjustFaceDir(TrueHand[i],star,0)
		sleep(1)
	end
	sleep(5)
--�Ԫk�J���E���J�wSAY�G�p�³��A�L�F�o��h�~�A�٬O�o��ѯu�ڡH
	Say(Lafa,"[SC_423516_6]")
	sleep(30)
--�Ԫk�����E���J�wSAY�G��W�L�C
	Say(Lafa,"[SC_423516_7]")
	PlayMotion(Lafa,ruFUSION_ACTORSTATE_EMOTE_POINT)
--5������I�I���h�L���쬵�u���P��A�Q�ίS�Ĭ��}�A�����`�ʧ@�C
	for i=1,5,1 do
--�}�ҥi���
		SetModeEx(TrueHand[i],EM_SetModeType_Fight,true) 
		CallPlot(TrueHand[i],"DW_MoveToFlag",TrueHand[i] , 780085, i+1,0)
	end
	while	true	do
		sleep(2)
--���u1���z
		if	DW_CheckDis(TrueHand[2],780084,3,40)	then
			CastSpell(PointMark[1],PointMark[1],494640)
			SysCastSpellLv(PointMark[1],PointMark[1],496178,1)
			WriteRoleValue(PointMark[1],EM_RoleValue_LiveTime,2)
			break
		end
	end
	while	true	do
		sleep(1)
--���u2���z
		if	DW_CheckDis(TrueHand[4],780084,2,40)	then
			CastSpell(PointMark[2],PointMark[2],494640)
			SysCastSpellLv(PointMark[2],PointMark[2],496178,1)
			WriteRoleValue(PointMark[2],EM_RoleValue_LiveTime,2)
--���D�O�I ���F�Ҧ����u�z����s����
			for i=1,5,1 do
				if	CheckID(TrueHand[i])	then
					if	ReadRoleValue(TrueHand[i],EM_RoleValue_IsDead)==0	then
						KillID(PointMark[2],TrueHand[i])
					end
				end
			end
			AdjustFaceDir(Star,Lafa,0)
			break
		end
	end
	sleep(15)
--�Ԫk�����E���J�wSAY�G�p�³�...�o�˦��Ǧ���O�I
	Say(Lafa,"[SC_423516_8]")
--�h�����d�����B���a���W���ܨ�BUFF�C
	CancelBuff(OwnerID(),507615)
--���ܼȦs�Ȫ����A
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,20)
--�d�����j�s�G�L����F�I
	Say(OwnerID(),"[SC_423516_9]")
	Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423516)==true	and
			CheckBuff(Player[i],507615)==true	then
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,21)
			CancelBuff(Player[i],507615)
			SetDefIdleMotion(Player[i],ruFUSION_MIME_IDLE_STAND_02)
		end
--����S�����a����
		if	i==table.getn(Player) and
			ReadRoleValue(GlobalValue_Z18_DW_02,EM_RoleValue_PID)<21	then
			LuaS_423516_5(nil,nil,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5],PointMark[1],PointMark[2])
			return
		end
	end
--�N��104109�B�ҫk104107�ѤѪŤ����U�C��¶�b�Ԫk�����E���J�w������C
	CallPlot(OwnerID(),"DW_MoveToFlag", OwnerID() , 780085 , 7,0 )
	local xyz1 = {7826.6,55,51785.8}
	local xyz2 = {7805.1,50,51861.9}
	local Lobo = Lua_DW_CreateObj("xyz",104107,xyz1,0)
	SetModeEx(Lobo,EM_SetModeType_Gravity,false) 
	DW_UnFight(Lobo)
	AddToPartition(Lobo,0)
	AddBuff(Lobo,506984,7,5)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_JUMP_LOOP)
	DW_MoveDirectToFlag( Lobo , 780085 , 8 )

	local Jill = Lua_DW_CreateObj("xyz",104109,xyz2,0)
	SetModeEx(Jill,EM_SetModeType_Gravity,false) 
	DW_UnFight(Jill)
	AddToPartition(Jill,0)
	AddBuff(Jill,506984,7,5)
	SetDefIdleMotion(Jill,ruFUSION_MIME_JUMP_LOOP)
	DW_MoveDirectToFlag( Jill , 780085 , 9 )

	while	true	do
		sleep(1)
		if	DW_CheckDis(Lobo,780085,8,20)	and
			DW_CheckDis(Jill,780085,9,20)		then
			break
		end
	end
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
--�Ԫk�����E���J�wSAY�G�C���٬O�n�o�ˤ~����...
	Say(Lafa,"[SC_423516_10]")
--�Ԫk�J���I�k(�X�{5������I�I���Ԥh�����C)
	CastSpell(Lafa,Lafa,496176)
	sleep(20)
	for i=1,5,1 do
		TrueHand[i] = Lua_DW_CreateObj("flag",104335,780084,i+4)
		DW_UnFight(TrueHand[i])
		AdjustFaceDir(TrueHand[i],star,0)
		SetDefIdleMotion(TrueHand[i],ruFUSION_MIME_IDLE_COMBAT_2H)
		sleep(1)
		CastSpell(TrueHand[i],TrueHand[i],496177)
	end
--�Ԫk�����E���J�wSAY�G�@�|�N�L�̳��;�^�h�A���F�p�³����~�A��L���O��R���Ȥj�H���s����O�C
	Say(Lafa,"[SC_423516_11]")
	sleep(15)
	local Lafa_MaxHP = ReadRoleValue(Lafa,EM_RoleValue_MaxHP)
	DW_UnFight(Lafa,false)
	DW_UnFight(Lobo,false)
	DW_UnFight(Jill,false)
	DW_UnFight(Star,false)
--(�Ԫk�J���o�ʧ���)
	SysCastSpellLv(Lafa,Lobo,495751,DW_Rand(100))
	SysCastSpellLv(Lafa,Star,495751,DW_Rand(100))
	SysCastSpellLv(Lafa,Jill,495751,DW_Rand(100))
	for i=1,5,1 do
		DW_UnFight(TrueHand[i],false)
		SysCastSpellLv(TrueHand[i],Lobo,495751,DW_Rand(100))
		SysCastSpellLv(TrueHand[i],Star,495751,DW_Rand(100))
		SysCastSpellLv(TrueHand[i],Jill,495751,DW_Rand(100))
	end
--�d�����G�Q�o���I���L�̹����d�������S�s���ġI
	Say(OwnerID(),"[SC_423516_12]")
	CastSpell(OwnerID(),Lafa,496174)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	CallPlot(OwnerID(),"LuaS_423516_10",Lafa,496174,3)
--(�������r)�G�αd�������S�s�����\��[<s>104335]�I
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_13]", 0 )
	ScriptMessage( Lafa, 0, 2, "[SC_423516_13]", 0 )
--��Ԫk�J����C��30%�A�Ԫk�J���E���J�wSAY�G�p�³��A�C�������F�C
	local CheckSec = 0
	local HerePlayer = {}
	while	true	do
		sleep(3)
		if	ReadRoleValue(Lafa,EM_RoleValue_HP)/Lafa_MaxHP <0.3	then
			Say(Lafa,"[SC_423516_14]")
--�N�Ҧ��H���h
			SysCastSpellLv(Lafa,Lafa,496178,1)
--�I�k���w��P�A�ña����P�A�@�_�����C
			SysCastSpellLv(Lafa,star,496175,1)
			sleep(10)
--�����S��
			CastSpell(Lafa,Lafa,494840)
			sleep(10)
			break
		end
		if	ReadRoleValue(Jill,EM_RoleValue_IsDead)==1	or
			ReadRoleValue(star,EM_RoleValue_IsDead)==1	or
			ReadRoleValue(Lobo,EM_RoleValue_IsDead)==1	then
			ScriptMessage( OwnerID(), 0 , 2, "[SC_421841_1]", C_Red )
			LuaS_423516_5(Lobo,Jill,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
			return
		end
		CheckSec = CheckSec +1
		if	CheckSec >15	then
			CheckSec = 0
			HerePlayer  = SearchRangePlayer ( OwnerID() , 500 )
			for i=0,table.getn(HerePlayer),1 do
				if	CheckAcceptQuest(HerePlayer[i],423516)==true	then
					break
				end
				if	i==table.getn(HerePlayer)	then
					LuaS_423516_5(Lobo,Jill,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
					return
				end
			end
		end
	end
	DelObj(Lafa)
	DelObj(Star)
	sleep(15)
--�N��SAY�G�i�c...
	Say(Jill,"[SC_423516_15]")
	sleep(15)
--(�������r)�G���ۧa�I��L�H�A�ڷ|�N�A�̤@�@���W�v�a�A�e�ܦ�R���ȥD�H����W�C
	ScriptMessage( OwnerID(), 0, 2, "[SC_423516_16]", 0 )
	ScriptMessage( Jill, 0, 2, "[SC_423516_16]", 0 )
	ScriptMessage( Lobo, 0, 2, "[SC_423516_16]", 0 )
	sleep(25)
--�d����SAY�G�٬O���^�h�a�I�w�g�M����J�s���W�F�C
	Say(OwnerID(),"[SC_423516_17]")
	sleep(10)
--(�N���a�ǰe�^�h�쥻���a��C)
--�������X��
	Player = SearchRangePlayer ( OwnerID() , 450 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423516)==true	and
			CheckFlag(Player[i],544396)==false	then
			SetFlag(Player[i],544396,1)
			ChangeZone(Player[i],18,0,8915,200,52000,132.5)
		end
	end
	sleep(15)
	LuaS_423516_5(Lobo,Jill,Star,Lafa,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
	return
end
--------------------------------------------------------------------------------
--���u�{��
function LuaS_423516_5(Lobo,Jill,Star,Lafa,T1,T2,T3,T4,T5,PM1,PM2)
--�R����L����	
	DW_CheckThenDel(Lobo)
	DW_CheckThenDel(Jill)
	DW_CheckThenDel(Star)
	DW_CheckThenDel(Lafa)
	DW_CheckThenDel(T1)
	DW_CheckThenDel(T2)
	DW_CheckThenDel(T3)
	DW_CheckThenDel(T4)
	DW_CheckThenDel(T5)
	DW_CheckThenDel(PM1)
	DW_CheckThenDel(PM2)
--�^�_�����ܼ�
	GlobalValue_Z18_DW_02 = nil
--�R���ۤv
	DelObj(OwnerID())
end
--------------------------------------------------------------------------------
--�ϥΪ��~�᪺�ˬd
function LuaS_423516_6()
--�M���T��
	if	DW_CheckRide(OwnerID())	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_NORIDE]", 0 )
		return false
	end
--�u��了��I�I���Ԥh�ϥ�
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==104335		then
		if	CheckDistance(OwnerID(),TargetID(), 150) == true	then
			if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
--�ؼФw�g���F
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_3]", 0 )
				return false
			else
				return true
			end
		else
--�ؼжZ���L��
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204592_2]", 0 )
			return false
		end
	else
--�ؼп��~
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421101_0]", 0 )
		return false
	end
end
--------------------------------------------------------------------------------
--���~�ϥΫ᪺�k�N
function LuaS_423516_7()
--�ʧ@&�S��
	if	CastSpell(OwnerID(),TargetID(),493155)	==true	then
		BeginPlot(TargetID(),"LuaS_423516_8",20)
	end
end

function LuaS_423516_8()
	KillID(TargetID(),OwnerID())
end
--------------------------------------------------------------------------------
--�z����u�a����t
function LuaS_423516_9()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==104335	then
		KillID(OwnerID(),TargetID())
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------
--��ؼЬI�k
function LuaS_423516_10(Target,MagicID,MagicLV)
	while	true	do
		if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1	then
			break
		end
		if	CheckRelation( OwnerID() , Target , EM_CheckRelationType_Attackable  )==false	then
			break
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID )==0	then
			sleep(25)
			CastSpellLV(OwnerID(),Target,MagicID,MagicLV)
		else
			sleep(10)
		end
	end
end
--------------------------------------------------------------------------------
--�ˬd�e�����ª�buff�n���n����
function LuaS_423516_11()
	while true do
		sleep(5)
--�ˬd�Z��
		if	DW_CheckDis(OwnerID(),780081,1,500)	then
			CancelBuff(OwnerID(),507914)
			CancelBuff(OwnerID(),506098)
			return
		end
--�S��buff�N���X
		if	CheckBuff(OwnerID(),506098)==false		then
			return
		end
	end
end