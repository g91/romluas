--780081 ���������ʥΪ��X�l
--780082 ����npc�ϥΪ��X�l
--780083 npc���ʨϥΪ��X�l
--�ϥΪ��~�G�ܭ�=>���o����buff
----------------------------------------------------------------------------
--�ϥΪ��~�ˬd(�M���T��)
function LuaS_423503_DW_0()
	if	DW_CheckRide(OwnerID())	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_NORIDE]", 0 )
		return false
	end
	return true
end
----------------------------------------------------------------------------
--�ϥΪ��~����@��
function LuaS_423503_DW_1()
	AddBuff(OwnerID(),507575,1,600)
end
----------------------------------------------------------------------------
--�b�s���ͪ�����NPC������ȥD��script
function LuaS_423503_DW_2(Q_NPC)
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),0)
--�إX�Ҧ����u�z����
	local TrueHand = {}
	for i=1,5,1 do
		TrueHand[i] = Lua_DW_CreateObj("flag",104328,780082,i,0)
--�����԰�
		DW_UnFight(TrueHand[i])
--��5�������i��
		if	i~=5	then	AddToPartition(TrueHand[i],0)	end
	end
--�إX���l(�S�����βy)&�����W�r&�����Y����
	local Boiler = Lua_DW_CreateObj("flag",116296,780082,6)--113568
	SetModeEx(Boiler,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Boiler,EM_SetModeType_HideName,true)
	Yell(OwnerID(),"[SC_423503_23]",3)
--���������ʨ���w��m
	DW_MoveToFlag( OwnerID() , 780081 , 1,0  )
--����ϥΪ��~���ʧ@
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)
	sleep(20)
--�u�z����1��V
--�u�z����1�G�����A���~�ľ����C���򦳨ǿ@�Y�C
	AdjustFaceDir(TrueHand[1],OwnerID(),0)
	Yell(TrueHand[1],"[SC_423503_4]",2)
	PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(10)
--���������ʨ�X��2
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	DW_MoveToFlag( OwnerID() , 780081 , 2,0 )
	AdjustFaceDir(OwnerID(),TrueHand[1],0)
--�������G�O�ܡH���M�A�n���n�ˬd�@�U�A�o�i�O�ǧJ�Q�Ѫ�F�@��ѧ˨Ӫ��ľ��O�H
	Yell(OwnerID(),"[SC_423503_5]",2)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--�u�z����2&3�۰ʾa��
	CallPlot(TrueHand[2],"DW_MoveToFlag",TrueHand[2],780083 , 1,0 )
	CallPlot(TrueHand[3],"DW_MoveToFlag",TrueHand[3],780083 , 2,0 )
	sleep(20)
	AdjustFaceDir(TrueHand[2],TrueHand[1],0)
	AdjustFaceDir(TrueHand[3],TrueHand[1],0)
	sleep(5)
--�u�z����1�G�n�a�I�D�_�ӡA���T�t���h...�γ\�O�ڦh�ߤF�I
	Yell(TrueHand[1],"[SC_423503_6]",2)
	PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
--�u�z����2�G���S�M�ǧJ��W�F�ڡH
	Yell(TrueHand[2],"[SC_423503_7]",2)
	PlayMotion(TrueHand[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(TrueHand[4],"DW_MoveToFlag",TrueHand[4],780083 , 3,0 )
	sleep(20)
	AdjustFaceDir(TrueHand[4],TrueHand[1],0)
--�u�z����3�G���n�]���H�a��h���{�s������p�աA�N��H�a���·аڡI
	Yell(TrueHand[3],"[SC_423503_8]",2)
	PlayMotion(TrueHand[3],ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(20)
--�u�z����4�G�������F�ܡH�i�H�}�l����F�ܡH
	Yell(TrueHand[4],"[SC_423503_9]",2)
	PlayMotion(TrueHand[4],ruFUSION_ACTORSTATE_EMOTE_STRETCH)
--�������۰ʲ��ʨ�X��3
	DW_MoveToFlag( OwnerID() , 780081 , 3,0 )
	AdjustFaceDir(OwnerID(), TrueHand[3],0)
--������ʧ@
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)
	sleep(10)
--�������G�U�J���A�t���h����A�F�C
	Yell(OwnerID(),"[SC_423503_10]",2)
	sleep(15)
--�u�z���� 1&2&3&4 ���V�������I�k
	for i=1,4,1 do
		AdjustFaceDir(TrueHand[i],OwnerID(),0)
		CastSpell(TrueHand[i],OwnerID(),492184)
	end
--�e�������T���G�X�L�̨S�ݨ����ɭԱN�į��˶i���l�I
	SetPlot(Boiler,"touch","LuaS_423503_DW_8",50)
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	and
			CheckBuff(Player[i],507575)==true		then
			ScriptMessage( Player[i], Player[i], 2, "[SC_423503_11]", 0 )
		end
	end
--�b�o�� Player ��@�P�_�j����榸��
	Player = 0
	while true do
		sleep(10)
--�����a�w�g�]��Ū��� �������L�P�_
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==30	then
			break
		end
		Player = Player +1
--�P�_���l���S��Buff
		if	CheckBuff(Boiler,507592)==true	then
			Player = Player - 1
		end
		if	Player >6	then
			SetPlot(Boiler,"touch","",0)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,20)
			break
		end
	end
--�ˬd�O�_�����_�@�������n
	Player = SearchRangePlayer ( Boiler , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	and
			CheckBuff(Player[i],507575)==true	then
			break
		end
--����S���i����Ȫ����a �������� ��ӧR�����R�@�R
		if	i==table.getn(Player)	then
			LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
		end
	end
--�ˬd���U�����Ӱ�����@�q
--�W�L6��S�����\�I�����l
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==20	then
--����Ĳ�I�@��
		SetPlot(Boiler,"touch","",0)
--�e�������T���G�O�ʡI���H�ӤF......
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true and
				CheckBuff(Player[i],507575)==true	then
				ScriptMessage( Player[i], Player[i], 2, "[SC_423503_18]", 0 )
			end
		end
--�u�z����5�W��&���ʨ���w��m
		AddToPartition(TrueHand[5],0)
		WriteRoleValue(TrueHand[5],EM_RoleValue_IsWalk,0)
		Hide(TrueHand[5])
		Show(TrueHand[5],0)
		DW_MoveToFlag( TrueHand[5] , 780083 , 4, 0  )
--�u�z����5���U���ɭԻ��G���n�F�A�ڦbxxxoo�A�o�{�F�ǧJ������...
		Yell(TrueHand[5],"[SC_423503_12]",2)
		sleep(20)
--���̪񪺪��a
		local MainRole = 0
		Player = SearchRangePlayer ( Boiler , 250 )
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)==true	then
				MainRole = i
				break
			end
--�p�G�ˬd�S�L�N�R���@��
			if	i==table.getn(Player)	then
				LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
			end
		end
--�u�z����1&2&3&4����I�k ��V���a
		for i=1,4,1 do
			SysCastSpellLv(OwnerID(),TrueHand[i],492185,1)
			AdjustFaceDir(TrueHand[i],Player[MainRole],0)
		end
		sleep(15)
--�u�z����1�G�ڴN�����~�ľ������D�I�A�쩳�O�֡H
		Yell(TrueHand[1],"[SC_423503_13]",2)
		PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(5)
--�u�z����2&3 �������a(�}�Ҿ԰�)
		for i=2,3,1 do
			DW_UnFight(TrueHand[i],false)
			if	CheckID(Player[MainRole])	then
				SysCastSpellLv(Player[MainRole],TrueHand[i],495751,DW_Rand(50))
			end
		end
		sleep(20)
--�u�z����2�G���}�L���T�l�ݬݡI
		Yell(TrueHand[2],"[SC_423503_14]",2)
		PlayMotion(TrueHand[2],ruFUSION_ACTORSTATE_EMOTE_POINT)
		CastSpell(TrueHand[3],TrueHand[3],496214)
--�������a���ܨ�buff
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)==true		then
				CancelBuff(Player[i],507575)
			end
		end
--��ܥ��Ȥw�����̫ܳᶥ�q
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,99)
	end
--���a�I�k���]�������q
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==30	then
--����Ĳ�I�@��
		SetPlot(Boiler,"touch","",0)
		Player = SearchRangePlayer ( Boiler , 250 )
		local MainRole = 0
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)==true		then
				MainRole = i
				break
			end
--�Y�L�N���_
			if	i==table.getn(Player)	then
				LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5])
			end
		end
--�N���a�w��(�ثe�ϥΦ�ʤ���)
		AddBuff(Player[MainRole],507646,1,10)
--�u�z����5�]�V���a
		AddToPartition(TrueHand[5],0)
		MoveToFlagEnabled(TrueHand[5], false)
		sleep(5)
--�u�z����5�I�k(�޵P�r��)
		if	CheckID(Player[MainRole])~= nil	then
			CastSpell(TrueHand[5],Player[MainRole],492224)
		end
		sleep(20)
--�Ѱ����a�ܨ�buff
		Player = SearchRangePlayer ( Boiler , 250 )
		for i=0,table.getn(Player),1 do
			if	CheckAcceptQuest(Player[i],423503)==true	and
				CheckBuff(Player[i],507575)	then
				if	i<=MainRole	then
					MainRole = i
				end
			end
--�Ѱ��ܨ�
			CancelBuff(Player[i],507575)
--�Ѱ��@������
			AddBuff(Player[i],507646,1,6)
		end
--�u�z����1&2&3&4 ��V���a
		for i=1,4,1 do
			SysCastSpellLv(OwnerID(),TrueHand[i],492185,1)
			AdjustFaceDir(TrueHand[i],Player[MainRole],0)
		end	
		sleep(5)
--�u�z����1�G�A���O�ǧJ�I�o�O���^�ơI
		Yell(TrueHand[1],"[SC_423503_15]",2)
		PlayMotion(TrueHand[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(25)
--�u�z����5�G�ڵo�{�ǧJ������I�o�O�ӫ_�P�f�I
		Yell(TrueHand[5],"[SC_423503_16]",2)
		PlayMotion(TrueHand[5],ruFUSION_ACTORSTATE_EMOTE_KICK)
		sleep(20)
--�u�z����2�G���F�L�I
		Yell(TrueHand[2],"[SC_423503_17]",2)
		PlayMotion(TrueHand[2],ruFUSION_ACTORSTATE_EMOTE_VICTORY)
--�}�үu�z����2&3���԰��X��
--�u�z����2&3�������a
		sleep(15)
		for i=2,3,1 do
			DW_UnFight(TrueHand[i],false)
			if	CheckID(Player[MainRole])	then
				SysCastSpellLv(Player[MainRole],TrueHand[i],495751,DW_Rand(50))
			end
		end
	end
	sleep(20)
--�N���������w�]�ʧ@�]���{��԰�
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	FaceObj( OwnerID(), TrueHand[1])
--����
	while	CheckDistance(TrueHand[1],OwnerID(), 25)==false	do
		sleep(5)
	end
	sleep(5)
--��������u�z����1�I�k
	CastSpell(OwnerID(),TrueHand[1],496213)
	sleep(10)
	Yell(TrueHand[1],"[SC_423503_22]",2)
	KillID(OwnerID(),TrueHand[1])
	sleep(15)
--�u�z����4�G��ӧA�]�O�����I
	Yell(TrueHand[4],"[SC_423503_19]",2)
	PlayMotion(TrueHand[4],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(10)
--�}�үu�z����4&5&���������԰��X��
	DW_UnFight(OwnerID(),false)
	for i=4,5,1 do
		DW_UnFight(TrueHand[i],false)
--�u�z����4&5����������
		SysCastSpellLv(OwnerID(),TrueHand[i],495751,DW_Rand(50))
	end
--����J�X�{
	local Morek = Lua_DW_CreateObj("flag",104330,780082,7)
	DW_UnFight(Morek)
	WriteRoleValue(Morek,EM_RoleValue_IsWalk,0)
	Hide(Morek)
	Show(Morek,0)
	DW_MoveToFlag( Morek , 780083 , 5,0  )
	DW_UnFight(Morek,false)
--�����u�z����2&3&4&5(�@����)
	for i=1,5,1 do
		SysCastSpellLv(TrueHand[i],Morek,495751,1)
	end
	SysCastSpellLv(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),Morek,495751,DW_Rand(50))
	while	true	do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)==0	then
			break
		else
			SysCastSpellLv(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),Morek,495751,DW_Rand(50))
		end
	end
--�I�񱽳��k�N

--����J�G�A���|�M�������b�@�_�H
	Yell(Morek,"[SC_423503_20]",2)
	PlayMotion(Morek,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--����J���ʨ����������
	FaceObj( Morek, OwnerID())
	sleep(20)
	Player = SearchRangePlayer ( Morek , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	then
--����J��V���a
			AdjustFaceDir(Morek,Player[i],0)
			break
		end
	end
	sleep(5)
--����J�G�ڥ��a�L���}...�@�|��A�ڭ̦b[116244]���ਣ�I
	Yell(Morek,"[SC_423503_21]",2)
	PlayMotion(Morek,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
--�������񦳥��Ȥ]��buff�����a�������Ȫ��X��
	Player = SearchRangePlayer ( Morek , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423503)==true	then
			SetFlag(Player[i],544356,1)
		end
	end
--�R���Ҧ�����
	LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand[1],TrueHand[2],TrueHand[3],TrueHand[4],TrueHand[5],Morek)
end
----------------------------------------------------------------------------
function LuaS_423503_DW_3()
	DeBugMSG(0,0,"1")
--�T�{�i�H�ϥΪ�����
	if	CheckAcceptQuest(OwnerID(),423503)==true	and
		CheckBuff(OwnerID(),507575)==false			and
		CheckFlag(OwnerID(),544356)==false			then
	DeBugMSG(0,0,"2")
--��NPC���W�����A �P�_�O�_�n�i��C��
		CallPlot(OwnerID(),"DW_ChooseOneFromTwo",OwnerID(),"[SC_QUESTEXECUTESURE_0]","LuaS_423503_DW_6","LuaS_423516_2" )
	end
end
----------------------------------------------------------------------------
--�������E��������ܼ@��
function LuaS_423503_DW_4()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423503)		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423503_0]","LuaS_423503_DW_5", 0 )
	end
end
----------------------------------------------------------------------------
--��ܿﶵ������@��
function LuaS_423503_DW_5()
	CloseSpeak(OwnerID())--�������
	if	CheckBuff(OwnerID(),507575)		then
--��wNPC(���Ȫ��a�P��Ĳ�o)
		DisableQuest(TargetID(),true)
--Hide
		Hide(TargetID())
		local Player = SearchRangePlayer ( TargetID() , 200 )
		for k,i in ipairs(Player) do
			if	CheckAcceptQuest(i,423503)==true	and
				CheckBuff(i,507575)	then
--�K�y���a
				Tell(i,OwnerID(),"[SC_423503_2]")
			end
		end
--���ͥ����ܼ�
		GlobalValue_Z18_DW_01 = Lua_DW_CreateObj("obj",104331,TargetID())
--�}�l�������
		CallPlot(GlobalValue_Z18_DW_01,"LuaS_423503_DW_2",TargetID())
	else
--���ܭn��潴
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_423503_1]", 0 )
	end
end
----------------------------------------------------------------------------
--�ߨ���L�h���ȶi�檺��m
function LuaS_423503_DW_6()
--���T�{�إX�Ӫ�NPC�٦s�b
	if	GlobalValue_Z18_DW_01~=nil	then
--�H�U�ɥ�Ĭ����Lua_CreateObjByDir�禡
		local face = 0
		local Dis = 100
		local Org = Role:new( GlobalValue_Z18_DW_01 )
		local Pos = {}
		local Dir = Org:Dir()
		local  NewRole
		local Cal
		if face == nil or Type( face) ~= "number" then
			face = 0
		end
		Cal = (math.pi/180)*(Dir ) 
		Pos["X"] = Org:X() +(Dis*math.cos(Cal))
		Pos["Z"] = Org:Z() - (Dis*math.sin(Cal))
		Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] );
		for i = 1 , 9 , 1 do
			if CheckLine( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
				Pos["X"] = Org:X() +(Dis*math.cos(Cal))*(10-i)/10
				Pos["Z"] = Org:Z() -(Dis*math.sin(Cal))*(10-i)/10
				Pos["Y"] = GetHeight( Pos["X"] ,  Org:Y() , Pos["Z"] )
			else
				break
			end
		end
		if Dis >= 0 then
			Dir = Dir +180-face
		else
			Dir = Dir + face
		end
		if Dir > 360 then
			Dir = Dir - 360
		end
		if Dir < 0 then
			Dir = Dir + 360
		end
--�P�_�n���n�Wbuff
		if	ReadRoleValue(GlobalValue_Z18_DW_01,EM_RoleValue_PID)<50	then
			AddBuff(OwnerID(),507575,1,600)
		end
--�N���a�ǰe��Ӧ�m
		ChangeZone(OwnerID(),18,0,Pos["X"],Pos["Y"],Pos["Z"],Dir)
	end
end
----------------------------------------------------------------------------
--�q�T���w�����a
function LuaS_423503_DW_7(PlayerID)
	ScriptMessage( PlayerID, PlayerID, 1, "[SC_423503_3]", 0 )
end
----------------------------------------------------------------------------
--���l��Ĳ�I�@��
function LuaS_423503_DW_8()
	if	CountBodyItem(OwnerID(),208119)==0	then --�S�į��N�h��
		return false
	end
	if	BeginCastBarEvent(OwnerID(),TargetID(),"[SC_USING]",30,  ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END  ,0 , "LuaS_423503_DW_10" )~= 1	then
--�Y����L�H�b�Ϊ���
		ScriptMessage( OwnerID(), OwnerID() , 1, "[SAY_NPC_BUSY]", 0 )
		return
	else
		AddBuff(TargetID(),507592,6,7)
	end
end
----------------------------------------------------------------------------
--�R���Ҧ����󪺼@��
function LuaS_423503_DW_9(Q_NPC,Boiler,TrueHand1,TrueHand2,TrueHand3,TrueHand4,TrueHand5,Morek)
--�R�����F�ۤv�H�~����L����
	DelObj(Boiler)
	if	CheckID(TrueHand1)	then
		DelObj(TrueHand1)
	end
	if	CheckID(TrueHand2)	then
		DelObj(TrueHand2)
	end
	if	CheckID(TrueHand3)	then
		DelObj(TrueHand3)
	end
	if	CheckID(TrueHand4)	then
		DelObj(TrueHand4)
	end
	if	CheckID(TrueHand5)	then
		DelObj(TrueHand5)
	end
	if	Morek~=nil	then
		if	CheckID(Morek)	then		DelObj(Morek)	end
	end
--�M�������ܼ�
	GlobalValue_Z18_DW_01 = nil
--��_�}�ҥ��Ȫ�NPC
	DisableQuest(Q_NPC,false)
	Show(Q_NPC,0)
--�R���ۤv
	DelObj(OwnerID())
end
----------------------------------------------------------------------------
--Ū��������᪺�d��
function LuaS_423503_DW_10(Executer,Result)
--�P�_�������p
	if	Result~=0	then
		if	Result>0	then
--���\���A
			EndCastBar(Executer,Result)
			DelBodyItem(OwnerID(),208119,CountBodyItem(OwnerID(),208119))
			WriteRoleValue(GlobalValue_Z18_DW_01,EM_RoleValue_PID,30)
		else
--���Ѫ��A
--�������l�W��buff
			EndCastBar(Executer,Result)
			CancelBuff(TargetID(),507592)
		end
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------