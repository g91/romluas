
------------------------------------------------------------
function LuaPE_9_1_DW00()--���;ɺt�@��(�Ĥ@���q)
------------------------------------------------------------
	PE_Zone9_1_GlobalStep = 0
	PE_Zone9_1_Global_1 = 0

--�ɺt�}�l����@��
	BeginPlot(OwnerID(),"LuaPE_9_1_DW08",0)
end

----------------------------------------------
function LuaPE_9_1_DW01() --����Ĥ@���q���ͪ����]�M�D�H�x�� 
----------------------------------------------
--���m�����ܼ�
	PE_Zone9_1_GlobalStep = 1
	PE_Zone9_1_Global_1 = 0
--"���Q���q����"�k�s
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0) 
--�O�����]�����`����
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)

--�ϥκX�l 780228 �s�� 1  (�ɺt�c�l�إX�T�w��m)
--�ϥκX�l 780228 �s�� all(���]�X�{����m)
--�ϥκX�l 780229 �s�� 1  (��Ԩ��q���̥X�{���I)
--�ϥκX�l 780229 �s�� 1���~��all(�䴩�D�H�X�{����m)
--�ϥκX�l 780230 �s�� all(���]����i���u)
--�ϥκX�l 780231 �s�� all(�䴩�D�H����i���u)
--�ϥκX�l 780232 �s�� all(��Ԩ��q���̪��S�O��i���u)
	local TimeCount = 0--�p�ɾ�(�g�L�h�[)
	local DelayTime = 60 --���ͦ��Q���󪺮ɭ�
	local Trouble = 15 --���p�o�ͪ��ɶ�
	local FireFrequency = 30 --���ͪ��]���W�v
	local FireLive = 75 --���]���ͦs�ɶ�
	local SnakeFrequency = 30 --���ͤz�Z�D�H���W�v
	local SnakeLive = 75 --�D�H���ͦs�ɶ�
	local FireCount = 6--�C�����ͪ����]��
	local SnakeCount = 4--�C�����ͪ��D�H��
	local AllFire = {}--�˲��ͪ��]���x�}
	local AllSnake = {}--�˲��ͪ��U�}�D�H�x�}
	local AllSnake2 = {} --�˳q�����D�Hid
	local FireRand = {102681,102811,102814}
	local MapID = 731 --�ݭn�q�������a�ϰ�s��

	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_24]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_24]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_29]",C_Yellow,MapID)
	while	true	do
--DeBugMSG(0,0,"FirstStep:[TimeCount=]"..TimeCount.."[Register1=]"..ReadRoleValue(OwnerID(),EM_RoleValue_Register1))
--�p�G�D�H���`���`���ƶW�L60
--�i�J�U�Ӷ��q
		if	PE_Zone9_1_Global_1 >= 60	then
			PE_Zone9_1_Global_1 = 0
			PE_Zone9_1_GlobalStep = 2
			local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW07",0)
DeBugMSG(0,0,"Step 1 oo     go to Next Step")
			DelObj(OwnerID())
		end
--�p�G���q����
--�h�^���m���q
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)>=60	then
			PE_Zone9_1_GlobalStep = 0
			PE_Zone9_1_Global_1 = 0
			local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW08",0)
DeBugMSG(0,0,"Step 1 XX     go back Step 0")
			DelObj(OwnerID())
		end

------------------------------
------------------------------
		sleep(10)
------------------------------
------------------------------

--###���q���w���e
--���ͪ��]���L�{
--�ΩT�w�ɶ����ͩT�w���ƪ��覡
--�P�_PID�T�w���a�O�_��������
		if	math.fmod(TimeCount,FireFrequency)==0	then
			for i=1,FireCount,1 do
				AllFire[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i)
				WriteRoleValue(AllFire[i],EM_RoleValue_LiveTime,FireLive)
				WriteRoleValue(AllFire[i],EM_RoleValue_PID,OwnerID())
				SetPlot(AllFire[i],"dead","LuaPE_9_1_DW04",0)
				CallPlot(AllFire[i],"LuaPE_9_1_DW02",780230)
				if	TimeCount >= DelayTime	and
					CheckBuff(OwnerID(),504947)	then
					AddBuff(AllFire[i],504947,1,-1)
				end
			end
--			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_23]"..PE_Zone9_1_Global_1.."/"..60,C_Yellow,MapID)
--			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_22]"..ReadRoleValue(OwnerID(),EM_RoleValue_PID).."/"..60,C_Yellow,MapID)
		end
--###���Q����Ϭq
--���ͤ��Q����Ĳ�o���q
		if	TimeCount == Trouble	then
			AllSnake2[1] = Lua_DW_CreateObj("flag",102748,780229,1)
			WriteRoleValue(AllSnake2[1],EM_RoleValue_IsWalk,0)
			WriteRoleValue(AllSnake2[1],EM_RoleValue_LiveTime,SnakeLive)
			WriteRoleValue(AllSnake2[1],EM_RoleValue_PID,OwnerID())
			CallPlot(AllSnake2[1],"LuaPE_9_1_DW03",780232)
		end
--�P�_�O�_���ͤ��Q����
--�i�J���Q���q���ͳD�H
		if	math.fmod(TimeCount,SnakeFrequency)==0		and
			ReadRoleValue(OwnerID(),EM_RoleValue_Register1)==1	then
			for	i=1,SnakeCount,1	do
				AllSnake[i] = Lua_DW_CreateObj("flag",102529,780229,i+1)
				WriteRoleValue(AllSnake[i],EM_RoleValue_IsWalk,0)
				WriteRoleValue(AllSnake[i],EM_RoleValue_LiveTime,SnakeLive)
				CallPlot(AllSnake[i],"LuaPE_9_1_DW02",780231)
			end
		end
--###���Q����Ϭq
--�P�_�O�_Ĳ�o���Q����
--�p�ɾ�
--���]��O����
--���}�}��(�Wbuff)
--�T���G���]�E�o�F�ѥͪ��n�ԥ��ʡA�i�J�g�ɪ��A�I        SC_PE_9_1_2
		local OneOfFire = {}
		if	TimeCount == DelayTime					and
			ReadRoleValue(OwnerID(),EM_RoleValue_PID)<	1		then
			AddBuff(OwnerID(),504947,1,-1)
			DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_2]",C_Red,MapID)
--���Ҧ��w���ͪ����]�Wbuff
			local BeforeFire = SetSearchAllNPC(0)
			for i=1,BeforeFire,1 do
				OneOfFire[i] = GetSearchResult()
			end
			for i=1,table.getn(OneOfFire),1 do
				for k=1,table.getn(FireRand),1 do
					if	ReadRoleValue(OneOfFire[i],EM_RoleValue_OrgID) == FireRand[k]	then
						PlayMotion(OneOfFire[i],ruFUSION_ACTORSTATE_BUFF_SP01)--�t���ʧ@
						AddBuff(OneOfFire[i] ,504947,1,-1)
					end
				end
			end
		end
--�T�w�p��
		TimeCount = TimeCount + 1
	end
end


------------------------------------------------------------------
function LuaPE_9_1_DW02(flag) --�M�β��ʼҦ�
------------------------------------------------------------------
	Hide(OwnerID())
	Show(OwnerID(),0)
--�q�`�X�l�s���|�]�A��0��
--�X�l�`��-1�~�O�X�l���̫�s��
--��O���ȵ��P�X�l�`�ƥN��w�g��������
--�T�w����@���I����~�੹�U��

	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1	< GetMoveFlagCount(flag)	do
		if	DW_MoveToFlag( OwnerID() , flag , ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1,120 , 1  )	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register5,ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1)
		end
		sleep(1)
	end
end

---------------------------------------------------------------
function LuaPE_9_1_DW03(flag) --���Ԧb����̫�@�q���{�ɪ��P�_
---------------------------------------------------------------
	Hide(OwnerID())
	Show(OwnerID(),0)
--�q�`�X�l�s���|�]�A��0��
--�X�l�`��-1�~�O�X�l���̫�s��
--��O���ȵ��P�X�l�`�ƥN��w�g��������
--�T�w����@���I����~�੹�U��

	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1	< GetMoveFlagCount(flag)	do
		if	DW_MoveToFlag( OwnerID() , flag , ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1,0 , 1  )	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register5,ReadRoleValue(OwnerID(),EM_RoleValue_Register5)+1)
		end
		sleep(1)
	end
	local Target = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local X,Z,NPC,Num
	local Sec = 0
	local MapID = 731 --�P�_�o�e�����Ӱϰ쪺���a
--�ˬd�԰����A
--�D�԰��~���
	while	ReadRoleValue(Target,EM_RoleValue_Register1)~=1	do
		sleep(10)
		if	HateListCount( OwnerID()) == 0	then
			NPC = SearchRangeNPC ( OwnerID() , 100 )
			for i=1,table.getn(NPC),1 do
				if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 113702	then
					Num = i
					break
				end
			end
--�D�H���ʧ@
--�P�_�O�_�i�J�԰�
--�@���i�J�԰��N���_
			PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN ,ruFUSION_ACTORSTATE_CAST_LOOP ) 
			Sec = 0
--�p�G�����ԫ��򤭬�
--�}�ҧP�_����A�M�ᵲ���j��
			while HateListCount( OwnerID())==0 do
				if	Sec > 5		then
					WriteRoleValue(Target,EM_RoleValue_Register1,1)
--���Ѫ��a�T��
--�i���i�J���Q���q
--�T���G[102748]�j�T�Fĵ�ٸ����I�D�H�j�x�ܧִN�|�Ө�I          SC_PE_9_1_1
					DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_1]",C_Red,MapID)
					PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)--�t���ʧ@
					sleep(20)
					DelObj(OwnerID())
					break
				end
				Sec = Sec + 1
				sleep(10)
			end
		end
	end
end


-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW04()  --���]�����`�P�_
--------------------------------------------------------------------------------------------
--���̪ͪ�id
	local Target = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--���`�p��
	if	PE_Zone9_1_GlobalStep==1	or
		PE_Zone9_1_GlobalStep==2	then
		WriteRoleValue(Target,EM_RoleValue_PID,ReadRoleValue(Target,EM_RoleValue_PID)+1)
		if	CheckID(Target)		then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_22]"..ReadRoleValue(Target,EM_RoleValue_PID).."/"..60,C_Yellow,MapID)
		end
	end
	return true
end


-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW05()  --�D�H�����`�P�_ ���b�a�ϤW���ة�(�Ĥ@���q���p�ƩǪ�)
--------------------------------------------------------------------------------------------
	SetPlot(OwnerID(),"dead","LuaPE_9_1_DW06",0)
end

-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW06()  --�D�H�����`�@��
--------------------------------------------------------------------------------------------
	if	PE_Zone9_1_GlobalStep == nil	then
		return true
	end
	if	PE_Zone9_1_GlobalStep==1	or
		PE_Zone9_1_GlobalStep==3	then
--���`�p��
		PE_Zone9_1_Global_1 = PE_Zone9_1_Global_1 + 1
		if	PE_Zone9_1_GlobalStep==1	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_23]"..PE_Zone9_1_Global_1.."/"..60,C_Yellow,MapID)
		end
		return true
	end
end

-------------------------------------------------------------------------------------------
function LuaPE_9_1_DW07() --����ĤG���q����t �]������&���]����
-------------------------------------------------------------------------------------------

--�ϥκX�l 780228 �s�� all(���]�X�{����m)
--�ϥκX�l 780233 �s�� 1(�]���X�{����m)
--�ϥκX�l 780233 �s�� 1�H�~all(���p���y�X�{����m)
--�ϥκX�l 780234 �s�� 1(�]�����w�I����m)
--�ϥκX�l 780234 �s�� 1�H�~��(�䴩�D�H���e�����u)
	local Sec = 0
	local Golem --�]��
	local Healer = {}--���]���ɦ媺���p���y
	local HealerNum = 3 -- ���p���ϵn�����ƶq
	local FireDemon = {} --�ĤG���q�����]
	local FireNum = 3 --�C�����ͪ��]���ƶq
	local FireLive = 75--���]���ͦs�ɶ�
	local SnakeLive = 75 --�D�H���ͦs�ɶ�
	local Snake = {} --�ĤG���q���D�H
	local SnakeNum = 4--�C�����ͳD�H���ƶq
	local SnakeRand = {102529,102530}
	local FireRand = {102772,102813,102812}
	local AllFireKind = {102772,102813,102812}
	local MapID = 731 -- ��Ԩ����a��
--�}�l��t�@��(�����q���Ǫ����t���A�õL�԰���O�C)
--�����]��&���p���y
	Golem = Lua_DW_CreateObj("flag",102749,780233,1)
	SetFightMode(Golem,0,1,0,0 )
	WriteRoleValue(Golem,EM_RoleValue_IsWalk,1)
	for i =1,HealerNum,1 do
		Healer[i] = Lua_DW_CreateObj("flag",102870,780233,i+1)
		SetFightMode(Healer[i],0,1,0,0 )
		WriteRoleValue(Healer[i],EM_RoleValue_IsWalk,1)
	end
--���ͪ��]
--���������A
	for i =1,FireNum,1 do
		FireDemon[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i,0)
		WriteRoleValue(FireDemon[i],EM_RoleValue_IsWalk,0)
		SetFightMode(FireDemon[i],0,1,0,0 )
	end


--�����]������w�I
--�ʧ@(�ꮱ)
--�T���G���]�ް_���̰ʧl�ޤF���p���y���`�N�A�L�̱a�ۥ��j���]���X�{�b�Գ��W...    SC_PE_9_1_3
	DW_AreaMessage(Golem,2,"[SC_PE_9_1_3]",C_Red,MapID)
	DW_MoveToFlag( Golem , 780234 , 1 , 0 , 1  )
	PlayMotion(Golem,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	SetFightMode(Golem,1,1,0,1 )
	WriteRoleValue(Golem,EM_RoleValue_IsWalk,0)
--�T���G���p���y�]�����o�X�j�j����q�𮧡A�n�Ԫ����]�̥ߨ��̰ʤF�_�ӡI     SC_PE_9_1_15
	sleep(10)
	DW_AreaMessage(Golem,2,"[SC_PE_9_1_15]",C_Red,MapID)
	sleep(10)
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_25]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_25]",C_Yellow,MapID)
--���]�}��
--�]�w���]�ͦs�ɶ�
	for i =1,table.getn(FireDemon),1 do
		WriteRoleValue(FireDemon[i],EM_RoleValue_LiveTime,60)
		SetFightMode(FireDemon[i],1,1,0,1 )
		SetAttack(FireDemon[i],Golem)
	end
--�R�O�w�g�b���W�����]����
	local NumOfFire = SetSearchAllNPC(0)
	local OldFire 
	for i=1,NumOfFire,1 do
		OldFire = GetSearchResult()
		if	ReadRoleValue(OldFire,EM_RoleValue_OrgID) == 102681	then
			SetAttack(OldFire,Golem)
		end
	end

--�}�l�j��
	while true do
		sleep(10)
--�p��
		Sec = Sec + 1
--�w�ɲ��ͪ��]
--�w�ɲ��ͳD�H
--�s���ͪ����]���L�̦۰ʧ����]��
		if	math.fmod(Sec,30) == 0	then
			for i=1,FireNum,1 do
				FireDemon[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i)
				WriteRoleValue(FireDemon[i],EM_RoleValue_LiveTime,FireLive)
				WriteRoleValue(FireDemon[i],EM_RoleValue_PID,OwnerID())
				SetPlot(FireDemon[i],"dead","LuaPE_9_1_DW04",0)
				CallPlot(FireDemon[i],"LuaPE_9_1_DW02",780230)
				if	Sec >= 30	and
					CheckBuff(OwnerID(),504947)	then
					AddBuff(FireDemon[i],504947,1,-1)
				end
			end



--�즸���ͳD�H���T���G�D�H�Q�Ϊ��]�`�N�O�Q���p���y�]���l�ު����ɭ��է�աI(SC_PE_9_1_4)
			if	Sec == 30	then
				DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_4]",C_Red,MapID)
			end

			for i =1,SnakeNum,1	do
				Snake[i] = Lua_DW_CreateObj("flag",SnakeRand[DW_Rand(table.getn(SnakeRand))],780229,i)
				WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,60)
				WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
				WriteRoleValue(Snake[i],EM_RoleValue_Register5,2)
				CallPlot(Snake[i],"LuaPE_9_1_DW02",780234)
			end
		end
--���p���y�}�l�ɦ�
--�T���G���p���y������]���i��׸ɡA�j�j��w�F���]����աI
		if	Sec == 10	then
			DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_44]",C_Red,MapID)
			for i=1,table.getn(Healer),1 do
				SetFightMode(Healer[i],0,1,0,1 )
				CallPlot(Healer[i],"LuaPE_9_1_DW10",Golem)
			end
		end
--�ˬd���Q����Ĳ�o�ɶ�
--�H���ۤv�Wbuff���覡����Ĳ�o����
--���Q����p�GĲ�o ���Ҧ������]�Wbuff
		local OneOfFire = {}
		if	Sec == 30	then
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0	then
				DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_2]",C_Red,MapID)
				BeforeFire = SetSearchAllNPC(0)
				for i=1,BeforeFire,1 do
					OneOfFire[i] = GetSearchResult()
				end
				for i=1,table.getn(OneOfFire),1 do
					for k=1,table.getn(AllFireKind),1 do
						if	ReadRoleValue(OneOfFire[i],EM_RoleValue_OrgID) == AllFireKind[k]	then
							PlayMotion(OneOfFire[i],ruFUSION_ACTORSTATE_BUFF_SP01)--�t���ʧ@
							AddBuff(OneOfFire[i],504947,1,-1)
						end
					end
				end
				AddBuff(OwnerID(),504947,1,-1)
			end
		end

--�P�_�����٬O���\
		if	CheckID(Golem)==true		then
--���\����G�]�����`
--�i�J�U�@���q
			if	ReadRoleValue(Golem,EM_RoleValue_IsDead)==1	then
				DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_32]".."1".."/".."1",C_Yellow,MapID)
				PE_Zone9_1_GlobalStep = 3
				PE_Zone9_1_Global_1 = 0
				local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
				SetModeEx(Box,EM_SetModeType_Show,false) 
				SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
				SetModeEx(Box,EM_SetModeType_Mark,false) 
				AddToPartition(Box,0)
				BeginPlot(Box,"LuaPE_9_1_DW09",0)
DeBugMSG(0,0,"Step 2 OO     go to Next Step")
				DelObj(OwnerID())
			end
--���ѱ���G�L�h�����]���`
--�h�^���m���q
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) >= 60	then
--���ѰT���G
				DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_22]".."60".."/".."60",C_Yellow,MapID)
				WriteRoleValue(Golem,EM_RoleValue_LiveTime,45)
				for i =1,table.getn(Healer),1 do
					Healer[i] = Lua_DW_CreateObj("flag",102870,780233,i+1)
					SetFightMode( Healer[i],0,1,0,0 )
					WriteRoleValue(Healer[i],EM_RoleValue_LiveTime,70)
				end
				PE_Zone9_1_GlobalStep = 0
				PE_Zone9_1_Global_1 = 0
				local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
				SetModeEx(Box,EM_SetModeType_Show,false) 
				SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
				SetModeEx(Box,EM_SetModeType_Mark,false) 
				AddToPartition(Box,0)
				BeginPlot(Box,"LuaPE_9_1_DW08",0)
DeBugMSG(0,0,"Step 2 XX     go back Step 0")
				DelObj(OwnerID())
			end
		end
--�w�����ܰT��
		if	math.fmod(Sec,30) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_32]".."0".."/".."1",C_Yellow,MapID)
		end
	end
end



----------------------------------------------------------------------------------------------------
function LuaPE_9_1_DW08() -- �i�J���m���q (�u�|���\���|����)
----------------------------------------------------------------------------------------------------
	local MapID = 731
	local dateline = 120
--�Ĥ@������
--	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_28]"..dateline,C_Yellow,MapID)
	local sec = 0
	while	true	do
		sleep(10)
		if	sec > dateline	then
			break
		end
--�w�����ܰT��
		if	math.fmod(Sec,10) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_28]"..dateline-sec,C_Yellow,MapID)
		end
		sec = sec + 1
--DeBugMSG(0,0,"Wait for  "..sec.."   sec")
	end
--�}�l�Ĥ@���q��l��
	PE_Zone9_1_GlobalStep = 1
	PE_Zone9_1_Global_1 = 0
	local Box = Lua_DW_CreateObj("flag",110987,780228,1,0)
	SetModeEx(Box,EM_SetModeType_Show,false) 
	SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
	SetModeEx(Box,EM_SetModeType_Mark,false) 
	AddToPartition(Box,0)
	BeginPlot(Box,"LuaPE_9_1_DW01",0)
DeBugMSG(0,0,"Step 0 OO     go to Next Step")
	DelObj(OwnerID())
end


----------------------------------------------------------------------------------------------------
function LuaPE_9_1_DW09()--�i�J�ĤT���q  �ĥ|���q (�b�@�����νc�l�WBeginPlot)
----------------------------------------------------------------------------------------------------	

--�ϥκX�l 780228 �s�� 1(���]�a�Y�X�{����m)
--�ϥκX�l 780228 �s�� 1���~��all(���]�X�{����m)
--�ϥκX�l 780019 �s�� all(�D�H�X�{����m)
--�ϥκX�l 780023 �s�� 1(�p�x�a�Y�X�{����m)

	local MapID = 731
	local FireDemon = {}
	local FireCount = 3
	local Snake = {}
	local SnakeCount = 3
	local Sec = 0
	local HumenBoss
	local SnakeRand = {102529,102530}
	local FireRand = {102681,102772,102811,102812,102814}
	local FireLive = 75--���]���ͦs�ɶ�
--���]��t���S�O���ͪ�t�Ϊ����]
--�Q�Ω�jbuff�Ӭ��㥦
	local DemonBoss = Lua_DW_CreateObj("flag",102813,780228,1)
	Hide(DemonBoss)
	SetFightMode(DemonBoss,0,1,0,0 )
	AddBuff(DemonBoss,505012,1,-1)
--���;԰��Ϊ����]�M�D�H
	for i=1,FireCount,1 do
	
		FireDemon[i] = Lua_DW_CreateObj("flag",FireRand[DW_Rand(table.getn(FireRand))],780228,i+1)
		SetFightMode(FireDemon[i],0,1,0,0 )
		WriteRoleValue(FireDemon[i],EM_RoleValue_IsWalk,0)
		WriteRoleValue(FireDemon[i],EM_RoleValue_LiveTime,FireLive)
	end
	for i=1,SnakeCount,1 do
		Snake[i] = Lua_DW_CreateObj("flag",SnakeRand[DW_Rand(table.getn(SnakeRand))],780019,i)
		SetFightMode (Snake[i],0,1,0,0 )
		WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
		WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,FireLive)
	end
	WriteRoleValue(DemonBoss,EM_RoleValue_IsWalk,0)
	sleep(10)
	Show(DemonBoss,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
--�T���G���I�u�O�j�������I���L���٨S�L�}�ڡI(SC_PE_9_1_6)
--�T���G��������p�å�I�A���ڭ̪���ۧa�I���������I    SC_PE_9_1_7
	DW_AreaMessage(DemonBoss,1,"[SC_PE_9_1_6]",C_Red,MapID)
	sleep(30)
	DW_AreaMessage(DemonBoss,1,"[SC_PE_9_1_7]",C_Red,MapID)
	sleep(20)
--�����}�ҧ������A
--���]����
	SetFightMode(DemonBoss,1,1,0,1 )
	for i=1,table.getn(FireDemon),1 do
		SetFightMode(FireDemon[i],1,1,0,1 )
	end
	for i=1,table.getn(Snake),1 do
		SetFightMode(Snake[i],1,1,0,1 )
		WriteRoleValue(Snake[i],EM_RoleValue_PID,i)
		WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,60)
		CallPlot(Snake[i],"LuaPE_9_1_DW14",780234)
	end
	SetAttack(DemonBoss,Snake[1])
--�T���G�@�䶤�������J��Ԩ�......
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_30]",C_Red,MapID)
--�����p�x����
--���W���`���m���@��
	local HumenBoss = Lua_DW_CreateObj("flag",102816,780023,1)
	SetPlot(HumenBoss,"dead","LuaPE_9_1_DW13",0)
	WriteRoleValue(HumenBoss,EM_RoleValue_IsWalk,0)
	Hide(HumenBoss)
	sleep(10)
	Show(HumenBoss,0)
--�T��(yell)�G�ש󻰤W�F�I�ݨӳD�H�w�g�Q���]�o���......SC_PE_9_1_8
	Yell(HumenBoss,"[SC_PE_9_1_8]",5)
	sleep(15)
--����ۨ��@��
	BeginPlot(HumenBoss,"LuaPE_9_1_DW11",0)
	sleep(10)
--�T���G���Ǫ��]�u�O�j���I�X�ӧa�p�l�̡I�@���ӭp���i��ISC_PE_9_1_9
	Yell(HumenBoss,"[SC_PE_9_1_9]",5)

--��l���q�T��
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_26]",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_26]",C_Yellow,MapID)


--�j�鲣�;԰�
--�j��P�_���\����
	local Sec = 0
	while true do
		sleep(10)
		
--�p�G�i�����\
		if	PE_Zone9_1_GlobalStep == 4	then
			PE_Zone9_1_Global_1 = 0
DeBugMSG(0,0,"Step 3 OO     go to Next Step")
			break
		end
--�p�G�i������
--�M�z��H�GHumenBoss   DemonBoss
		if	PE_Zone9_1_GlobalStep == 0	then
			if	CheckID(DemonBoss)==true	then
				DelObj(DemonBoss)
			end
			if	CheckID(HumenBoss)==true	then
				DelObj(HumenBoss)
			end
--���X�s���P�_��
--�R�O���歫�m���q���@��
--�R���ۤv�׵��o�Ӷ��q
			local Box = Lua_DW_CreateObj("flag",110987,780228,1)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW00",0)
DeBugMSG(0,0,"Step 3  XX     go back Step 0")
			DelObj(OwnerID())
		end
		Sec = Sec + 1
--�w���q���i��
		if	math.fmod(Sec,30) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_31]"..ReadRoleValue(HumenBoss,EM_RoleValue_Register2).."/".."4",C_Yellow,MapID)
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."0".."/".."1",C_Yellow,MapID)
		end
	end

--�ĥ|���q
--�ϥκX�l  780030 �s��all(�l�D�N�x�X�{����m)
--�ϥκX�l  780081 �s��all(�z��X�{����m)
--�����l�D�N�x�I
	local XYZ = {-5621,527,29198}
	local SnakeGeberal = Lua_DW_CreateObj("xyz",102532,XYZ)
	SetPlot(SnakeGeberal,"dead","LuaPE_9_1_DW58",0)
--�T���G���b�ڪ��x��̶èӡH�A�̫ܧִN�|�ᮬ��......  SC_PE_9_1_14
	DW_AreaMessage(SnakeGeberal,1,"[SC_PE_9_1_14]",C_Red,MapID)
--����M���l�D�N�x������(�Ӧ^�j�M������)
	BeginPlot(SnakeGeberal,"LuaPE_9_1_DW16",0)


	local Powder = {}

--���ͦU�ا𫰾���
	for i=1,GetMoveFlagCount(780081)-1,1 do
		Powder[i] = Lua_DW_CreateObj("flag",113941,780081,i)
		SetPlot(Powder[i],"touch","LuaPE_9_1_DW18",50)
		BeginPlot(Powder[i],"LuaPE_9_1_DW24",0)
	end
	local Sec = 0
--�B�z�j��
	while	true	do
		sleep(10)
--�i�����\
		if	PE_Zone9_1_GlobalStep == 5	then
			sleep(15)
--�M�z��H�G�N�x
			DelObj(SnakeGeberal)
--���X�s���P�_��
--�R�O���歫�m���q���@��
--�R���ۤv�׵��o�Ӷ��q
			local Box = Lua_DW_CreateObj("flag",110987,780228,1)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW00",0)
DeBugMSG(0,0,"Step 4  OO     go back Step 0")
			DelObj(OwnerID())
			break
		end
--�i������
--�M�z��H�G�N�x ���ı�
		if	PE_Zone9_1_GlobalStep == 0	then
			for i=1,table.getn(Powder),1 do
				if	Powder[i]~= nil	then
					DelObj(Powder[i])
				end
			end
			DelObj(SnakeGeberal)
--���X�s���P�_��
--�R�O���歫�m���q���@��
--�R���ۤv�׵��o�Ӷ��q
			local Box = Lua_DW_CreateObj("flag",110987,780228,1)
			SetModeEx(Box,EM_SetModeType_Show,false) 
			SetModeEx(Box,EM_SetModeType_ShowRoleHead,false) 
			SetModeEx(Box,EM_SetModeType_Mark,false) 
			AddToPartition(Box,0)
			BeginPlot(Box,"LuaPE_9_1_DW00",0)
DeBugMSG(0,0,"Step 4  XX     go back Step 0")
			DelObj(OwnerID())
			break
		end
		Sec = Sec + 1
--�w���q���i��
		if	math.fmod(Sec,30) == 0	then
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_33]".."0".."/".."1",C_Yellow,MapID)
			DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."0".."/".."1",C_Yellow,MapID)
		end
	end

end

----------------------------------------------------------------------------------------------------
function LuaPE_9_1_DW10(Golem) --���p���y���檺�ʧ@
----------------------------------------------------------------------------------------------------
	while	true	do
		sleep(10)
--�p�G�]���Q�R���N�ۧR
--�T���G���i��I�ĤG�N���]���]�Q���ѤF�I      SC_PE_9_1_5
		if	CheckID(Golem)==false		then
			Say(OwnerID(),"[SC_PE_9_1_5]")
			WriteRoleValue(OwnerID(),EM_RoleValue_LiveTime,20)
			break
		end
--�԰��~�~���檺�P�_
		if	HateListCount( OwnerID()) == 0		then
--�T�{�M�]�����Z��
			if	GetDistance(OwnerID(),Golem) < 150	then
--�T�{�S���b�I�k
--��k�N�G
				if	ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID) == 0	and
					ReadRoleValue(Golem,EM_RoleValue_IsDead)==0		then
					CastSpellLV(OwnerID(),Golem,494519,1)
				end
			else
--�p�G�Z���ӻ����ܴN�a�����w�Z��
				DW_GetClose(OwnerID(),Golem,150)
			end
		end
	end
end