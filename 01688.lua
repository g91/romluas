--672
----------------------------------------------
function LuaS_422847_0()--�I������e����
----------------------------------------------
--�P�_�԰����A
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		return	-1
	end
--�P�_buff���A
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==114005		then
		if	CheckBuff(OwnerID(),505495)	then
			return	-1
		end
	else
		if	CheckBuff(OwnerID(),505495)==false	then
			return	-1
		end
	end
--�P�_�O�_�M�ĺ����L��
	if	Checkflag(OwnerID(),543530)==false	then
		return	-1
	end
	return 1
end


----------------------------------------------
function LuaS_422847_1()--�I����������
----------------------------------------------
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==114005	then
--����BUFF
		AddBuff(OwnerID(),505495,1,-1)
		AddBuff(OwnerID(),505497,1,-1)
		for i=1,10,1 do
			AddBuff(OwnerID(),505533,1,-1)
		end
		return	1
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==114006	then
--����BUFF
		AddBuff(OwnerID(),505496,1,-1)
		return	1
	end
end


----------------------------------------------
function LuaS_422847_2()--��ݥ��Ȫ���ܼ@��
----------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422847_12]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422847_22]","LuaS_422847_32", 0 )
end



----------------------------------------------
function LuaS_422847_3()--buff�����ˬd��m
----------------------------------------------
	local MapID = 672 
	if	DW_CheckMap(OwnerID(),MapID)	and
		CheckBuff(OwnerID(),505533)		then
		if	CheckBuff(OwnerID(),505519)==false	then
			AddBuff(OwnerID(),505497,1,-1)
		end
		return true
	else
		BeginPlot(OwnerID(),"LuaS_422847_30",0)
		CancelBuff(OwnerID(),505495)
	end
end


----------------------------------------------
function LuaS_422847_4()--�Ǫ����˧�AI
----------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_422847_5",100)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	AddBuff(OwnerID(),505520,1,-1)
--�W�a���۳Nbuff
	AddBuff(OwnerID(),505575,1,-1)
end


----------------------------------------------
function LuaS_422847_5()--�P�_���a�O�_���h���
----------------------------------------------
DeBugMSG(0,0,"Start to Check")
--�������A�}��
	SetPlot(TargetID(),"range","",0)
--�����O��
	WriteRoleValue(TargetID(),EM_RoleValue_PID,0)
--���W��buff�����a�~�|�ް_����
	if	CheckBuff(OwnerID(),505495)	then
DeBugMSG(0,0,"Ex-Combat Check = true")
		BeginPlot(TargetID(),"LuaS_422847_6",0)
	else
DeBugMSG(0,0,"Ex-Combat Check = false")
		WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
		SetPlot(TargetID(),"range","LuaS_422847_5",100)
	end
end


----------------------------------------------
function LuaS_422847_6()--
----------------------------------------------
	local AttackTarget = TargetID()
	local MapID = 672
--�]�w�ۤv�B�b�y���԰��z�������A(BUFF����)
	CancelBuff(OwnerID(),505520)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_1H)
--���קK������~���������޼@��
	MoveToFlagEnabled(OwnerID(), false)
--�O����l��m
	local InitialX = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local InitialZ = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local X,Z
--����P�_
	while	true	do
		sleep(7)
-----------------------------------------------------------------------------------�^�Y��
		X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		if	(X-InitialX)^2+(Z-InitialZ)^2 >=250^2		then
--�����O��
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
			BeginPlot(OwnerID(),"LuaS_422847_8",0)
DeBugMSG(0,0,"so far")
			return
		end
-----------------------------------------------------------------------------------�P�_��
--���T�w��H���b�@�ɤW�Y���b���ܭn����
		if	CheckID(AttackTarget)==false	then
--�j�M���aNPC
			local NPC = SearchRangeNPC ( OwnerID() , 150 )
			local Player = SearchRangePlayer ( OwnerID() , 150 )
			local Findone = false
--�䨭�W���԰�BUFF�����a
			for i=0,table.getn(Player),1 do
				if	CheckBuff(Player[i],505497)	then
					AttackTarget = Player[i]
					AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
					Findone = true
					break
				end
			end
--�p�G�S���
			if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
--�䨭�W���԰�BUFF��NPC
				for i=0,table.getn(NPC),1 do
					if	CheckBuff(NPC[i],505497)	then
						AttackTarget = NPC[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
						break
					end
					if	i==table.getn(NPC)	then
						if	CheckID(TargetID())	then
DeBugMSG(0,0,"Condition0")
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
			end
			if	CheckID(AttackTarget)==false	then
DeBugMSG(0,0,"Condition1")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
--�A�T�w��誺��m�Y���b�g�i�h���n����
		if	DW_CheckMap(AttackTarget,MapID)==false	then
DeBugMSG(0,0,"Condition2")
			LuaS_422847_7(OwnerID())
			return	true
		end
--�O���a�~�ݭn�����P�_
		if	ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer)==1	then
--�Y���b�@�����A�h����
			if	CheckBuff(AttackTarget,505522)	then
DeBugMSG(0,0,"Condition3")
				LuaS_422847_7(OwnerID())
				return	true
			end
--�Y���w���b���Ȫ��A�� �h����
			if	CheckBuff(AttackTarget,505495)==false	then
DeBugMSG(0,0,"Condition4")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
--�T�w��誺buff���A �Y�Lbuff�ˬd����O�_���B�� ���S�����ܴN����
		if	CheckBuff(AttackTarget,505497)==false	then
			local NPC = SearchRangeNPC ( OwnerID() , 150 )
			local Player = SearchRangePlayer ( OwnerID() , 150 )
				local Findone = false
				for i=0,table.getn(Player),1 do
					if	CheckBuff(Player[i],505497)	then
						AttackTarget = Player[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
						Findone = true
						break
					end
				end
				if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
					for i=0,table.getn(NPC),1 do
						if	CheckBuff(NPC[i],505497)	then
							AttackTarget = NPC[i]
							AddBuff( OwnerID() ,  502383 , 0 , 1 )
							break
						end
						if	i==table.getn(NPC)	then
DeBugMSG(0,0,"Condition5")
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
			if	AttackTarget ==TargetID()	then
DeBugMSG(0,0,"Condition6")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
--�p�G��覺�`�N����
		if	ReadRoleValue(AttackTarget,EM_RoleValue_IsDead)==1	then
DeBugMSG(0,0,"Condition7")
			LuaS_422847_7(OwnerID())
			return	true
		end
--�p�G�����Z���L�j�N����
		if	CheckDistance(OwnerID(),AttackTarget, 400)==false		then
DeBugMSG(0,0,"Condition8")
			LuaS_422847_7(OwnerID())
			return	true
		end
-----------------------------------------------------------------------------------���ʰ�
		if	CheckDistance(OwnerID(),AttackTarget, 150)==false		then
			DW_GetClose(OwnerID(),AttackTarget,150)
-----------------------------------------------------------------------------------�^�Y��
			X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
			Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
			if	(X-InitialX)^2+(Z-InitialZ)^2 >=250^2		then
--�����O��
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				BeginPlot(OwnerID(),"LuaS_422847_8",0)
DeBugMSG(0,0,"so far 2")
				return
			end
-----------------------------------------------------------------------------------�P�_��(�A���P�_�קK�_��)
--���T�w��H���b�@�ɤW�Y���b���ܭn����
			if	CheckID(AttackTarget)==false	then
				local NPC = SearchRangeNPC ( OwnerID() , 150 )
				local Player = SearchRangePlayer ( OwnerID() , 150 )
				local Findone = false
				for i=0,table.getn(Player),1 do
					if	CheckBuff(Player[i],505497)	then
						AttackTarget = Player[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
						Findone = true
						break
					end
				end
				if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
					for i=0,table.getn(NPC),1 do
						if	CheckBuff(NPC[i],505497)	then
							AttackTarget = NPC[i]
							AddBuff( OwnerID() ,  502383 , 0 , 1 )
							break
						end
						if	i==table.getn(NPC)	then
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
				if	AttackTarget ==TargetID()	then
DeBugMSG(0,0,"Condition9")
					LuaS_422847_7(OwnerID())
					return	true
				end
			end
--�A�T�w��誺��m�Y���b�g�i�h���n����
			if	DW_CheckMap(AttackTarget,MapID)==false	then
DeBugMSG(0,0,"Condition10")
				LuaS_422847_7(OwnerID())
				return	true
			end
--�O���a�~�ݭn�����P�_
			if	ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer)==1	then
--�Y���b�@�����A�h����
				if	CheckBuff(AttackTarget,505522)	then
DeBugMSG(0,0,"Condition11")
					LuaS_422847_7(OwnerID())
					return	true
				end
--�Y���w���b���Ȫ��A�� �h����
				if	CheckBuff(AttackTarget,505495)==false	then
DeBugMSG(0,0,"Condition12")
					LuaS_422847_7(OwnerID())
					return	true
				end
			end
--�T�w��誺buff���A �Y�Lbuff�ˬd����O�_���B�� ���S�����ܴN����
			if	CheckBuff(AttackTarget,505497)==false		then
				local NPC = SearchRangeNPC ( OwnerID() , 150 )
				local Player = SearchRangePlayer ( OwnerID() , 150 )
				local Findone = false
				for i=0,table.getn(Player),1 do
					if	CheckBuff(Player[i],505497)	then
						AttackTarget = Player[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
						Findone = true
						break
					end
				end
				if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
					for i=0,table.getn(NPC),1 do
						if	CheckBuff(NPC[i],505497)	then
							AttackTarget = NPC[i]
							AddBuff( OwnerID() ,  502383 , 0 , 1 )
							break
						end
						if	i==table.getn(NPC)	then
DeBugMSG(0,0,"Condition13")
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
DeBugMSG(0,0,"Condition14")
				LuaS_422847_7(OwnerID())
				return	true
			end
--�p�G��覺�`�N����
			if	ReadRoleValue(AttackTarget,EM_RoleValue_IsDead)==1	then
DeBugMSG(0,0,"Condition15")
				LuaS_422847_7(OwnerID())
				return	true
			end
--�p�G�����Z���L�j�N����
			if	CheckDistance(OwnerID(),AttackTarget, 400)==false		then
DeBugMSG(0,0,"Condition16")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
-----------------------------------------------------------------------------------������
		CastSpell(OwnerID(),AttackTarget,494806)
	end
end

----------------------------------------------
function LuaS_422847_7(obj) --���m���Ī��@��
----------------------------------------------
DeBugMSG(0,0,"LuaS_422847_7 RUN")
	if	ReadRoleValue(obj,EM_RoleValue_SpellMagicID )~=0	then
		AddBuff( obj ,  502383 , 0 , 1 )
	end
--�мg�����O��
	WriteRoleValue(obj,EM_RoleValue_PID,1)
--��^���i�J�u���԰��v�����A(���Wbuff)
	AddBuff(obj,505520,1,-1)
	SetDefIdleMotion(obj,ruFUSION_MIME_IDLE_STAND)
	MoveToFlagEnabled(obj, true)
	BeginPlot(obj,"LuaS_422847_4",20)
end



----------------------------------------------
function LuaS_422847_8() --�]�^��쪺�@��
----------------------------------------------
	MoveToFlagEnabled(OwnerID(), true)
	LuaS_422847_7(OwnerID())
end


----------------------------------------------
function LuaS_422847_9()	--�ޯ�1�G�P�a�ˬd
---------------------------------------------
	if	CheckBuff(OwnerID(),505522)	then
DeBugMSG(0,0,"false1")
		return false
	end
	local MapID = 672
	if	DW_CheckMap(OwnerID(),MapID)==false	then
DeBugMSG(0,0,"false2")
		return	false
	end
	AddBuff(OwnerID(),503977,1,2)
	return	true
end

----------------------------------------------
function LuaS_422847_10()	--�ޯ�1�G�P�a����
---------------------------------------------
--�����P�_buff
	CancelBuff(OwnerID(),505497)
--�إX���Ĥg��
--�u�s�b6��
--���W�|�ಾnpc�ؼЪ�buff
	local Item = Lua_DW_CreateObj("obj",114297,OwnerID())
	WriteRoleValue(Item,EM_RoleValue_LiveTime,6)
	AddBuff(Item,505497,1,-1)
--����buff���A
--���W�ܨ��N
	CancelBuff(OwnerID(),505497)
	AddBuff(OwnerID(),505519,1,6)
end


----------------------------------------------
function LuaS_422847_11()	--buff��������t�M�ĪG
----------------------------------------------
--buff�������ɭԡG
--���W�޼�buff
	AddBuff(OwnerID(),505497,1,-1)
--��s�d�򤺪�npc����
--�T�w�O�Ǫ����~����
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i=0,table.getn(NPC),1 do
		if	CheckBuff(NPC[i],505520)	then
			if	ReadRoleValue(NPC[i],EM_RoleValue_PID)==1	then
				AddBuff(GID,BUFFID,BUFFLV,BUFFTIME)
				SetPlot(NPC[i],"range","LuaS_422847_5",100)
			end
		end
	end
--���X�ʧ@
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_INSTANT)
--���X�S��
	local Item = Lua_DW_CreateObj("obj",114297,OwnerID())
	WriteRoleValue(Item,EM_RoleValue_LiveTime,2)
end



----------------------------------------------
function LuaS_422847_12() --�Ĥ@�q����t
----------------------------------------------
--�إ߭n��𪺩Ǫ�
	local Mobs = {}
	for i=1,3,1 do
		for k=1,5,1 do
			Mobs[5*(i-1)+K] = Lua_DW_CreateObj("flag",113972+K,780502,5*(i-1)+K)
		end
	end
	sleep(30)
--�x��1
	Yell(Mobs[1],"[SC_422847_14]",3)
--�w�S�Jù�X�{
	local Anticlo = Lua_DW_CreateObj("flag",113950,780503,0)
--�إX���βy
	local HideBall = {}
	for i=1,3,1 do
		HideBall[i] = Lua_DW_CreateObj("flag",112399,780503,i*3)
	end
	local ShowWar = {}
	for	i=1,6,1	do
		for k=1,2,1 do
			ShowWar[2*(i-1)+K] = Lua_DW_CreateObj("flag",113968+K,780503,2*(i-1)+K,0)
			CallPlot(ShowWar[2*(i-1)+K],"",2*(i-1)+K)
			SetDefIdleMotion(ShowWar[2*(i-1)+K],ruFUSION_MIME_IDLE_COMBAT_1H)
		end
	end
	sleep(20)
--�x��2&������
	AdjustFaceDir(Mobs[2],Anticlo,0)
	sleep(10)
	Yell(Mobs[2],"[SC_422847_15]",3)
	sleep(5)
--�������H������ �P�ɶi�J�԰����A
	for i=1,table.getn(Mobs),1 do
		AdjustFaceDir(Mobs[i],Anticlo,0)
		SetDefIdleMotion(Mobs[i],ruFUSION_MIME_IDLE_COMBAT_1H)
	end
	sleep(10)
--�x��3
--�w�S�Jù�x��
	Yell(Anticlo,"[SC_422847_0]",3)
	sleep(5)
--�إX�Ԥh��
	for i = 1,table.getn(ShowWar),1 do
		AddToPartition(ShowWar[i],0)
	end
--�g�b�S��
	for i=1,table.getn(HideBall),1 do
		CastSpellLV(HideBall[i],Mobs[i*5],494838,200)
	end
	sleep(30)
--�d�ĩi
	ScriptMessage( OwnerID(), 0, 1, "[SC_422847_3]", "0xFFBE60D2" )
	sleep(20)
--�w�w�Ĵ�
	ScriptMessage( OwnerID(), 0, 2, "[SC_422847_2]", "0xFFBE60D2" )
	sleep(15)
	Yell(Anticlo,"[SC_422847_1]",3)
--�d��@��>>�@���O�@�Ҧ�
	SetPlot(OwnerID(),"range","",0)
	sleep(30)
--�������a�����X��
	local Player = SearchRangePlayer ( OwnerID() , 300 )
	for i=0,table.getn(Player),1 do
		if	CheckBuff(Player[i],505495)	then
			SetFlag(Player[i],543570,1)
			CancelBuff(Player[i],505522)
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	sleep(10)
	DelObj(Anticlo)
	for i=1,table.getn(ShowWar),1 do
		DelObj(ShowWar[i])
	end
	for i=1,table.getn(HideBall),1 do
		DelObj(HideBall[i])
	end
	for i=1,table.getn(Mobs),1 do
		DelObj(Mobs[i])
	end
end



----------------------------------------------------
function LuaS_422847_13(flag) -- �Ԥh���ʼ@��
----------------------------------------------------
	DW_MoveToFlag( OwnerID() , 780403 , flag,20 , 1  )
end




----------------------------------------------------
function LuaS_422847_14() -- �ĤG�q����t
----------------------------------------------------
--�H���Ԥh
	local Mans = {}
	for i=1,5,1 do
		Mans[i] = Lua_DW_CreateObj("flag",113987,780402,i)
	end
--�H���k�v
	local Magic = Lua_DW_CreateObj("flag",113982,780402,6)
--�Ǫ�
	local Mobs = {0,0,0,0,0}
	for i=1,5,1 do
		Mobs[i] = Lua_DW_CreateObj("flag",113978,780403,i)
	end
	sleep(30)
--����
	for i=1,table.getn(Mobs),1 do
		CallPlot(Mobs[i],"LuaS_422847_15",Mans[i])
	end
	for i=1,table.getn(Mans),1 do
		CallPlot(Mans[i],"LuaS_422847_15",Mobs[i])
	end
--�k�v����
	CallPlot(Magic,"LuaS_422847_16",Mobs[1])
	sleep(30)
--�w�w�Ĵ��X��
	local Asace = Lua_DW_CreateObj("flag",113951,780404,1)
	Yell(Asace,"[SC_422847_18]",3)
	CallPlot(Asace,"LuaS_422847_17",Mobs[2])
--�P�_�Ҧ����ĤH���`
	local Pass = true
	local TrueSec = 0
	while Pass do
		sleep(10)
		TrueSec = TrueSec +1
		for i=1,table.getn(Mobs),1 do
			if	CheckID(Mobs[i])==true	then
				if	ReadRoleValue(Mobs[i],EM_RoleValue_IsDead)==0	then
					break
				end
			end
			if	i==table.getn(Mobs)	then
				Pass = false
			end
		end
		if	TrueSec > 12	then
			Pass = false
		end
	end
--�k�v�o�@
	Yell(Magic,"[SC_422847_16]",3)
	CancelBuff(Magic,505574)
	AddBuff(Magic,505575,1,-1)
	AdjustFaceDir(Asace,Magic,0)
	sleep(15)
	Yell(Asace,"[SC_422847_19]",3)
	CastSpellLV(Magic,Asace,494810,200)
	sleep(10)
	for i=1,table.getn(Mans),1 do
		WriteRoleValue(Mans[i],EM_RoleValue_HP,0)
		PlayMotion(Mans[i],ruFUSION_ACTORSTATE_DYING)
	end
--�w�w�Ĵ��ľW
	CastSpellLV(Asace,Magic,494831,200)
	sleep(15)
	Yell(Asace,"[SC_422847_5]",3)
	sleep(15)
--�{�ȮR�{��
	local Tina = Lua_DW_CreateObj("flag",113952,780404,1)
	sleep(10)
	AdjustFaceDir(Asace,Tina,0)
	Yell(Tina,"[SC_422847_6]",3)
	sleep(15)
--�A�ľW
	CastSpellLV(Asace,Tina,494831,200)
	sleep(10)
	PlayMotion(Asace,ruFUSION_ACTORSTATE_ATTACK_1H)
	DelObj(Tina)
	sleep(5)
	Tina = Lua_DW_CreateObj("flag",113952,780404,2)
	sleep(5)
	AdjustFaceDir(Asace,Tina,0)
	Yell(Asace,"[SC_422847_7]",3)
	sleep(20)
	Yell(Tina,"[SC_422847_8]",3)
	sleep(5)
	CastSpell(Tina,Tina,494832)
	sleep(15)
	Yell(Asace,"[SC_422847_9]",3)
	sleep(5)
	CallPlot(Asace,"LuaS_422847_13",1)
	sleep(30)
	DelObj(Asace)
--�d��@��>>�@���O�@�Ҧ�����
	SetPlot(OwnerID(),"range","",0)
	sleep(5)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422847_10]", C_Red )
--�������a�����X��
	local Player = SearchRangePlayer(OwnerID() , 300 )
	for i=0,table.getn(Player),1 do
		if	CheckBuff(Player[i],505495)	then
			SetFlag(Player[i],543571,1)
			CancelBuff(Player[i],505522)
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	for i=1,table.getn(Mans),1 do
		DelObj(Mans[i])
	end
	DelObj(Magic)
	for i=1,table.getn(Mobs),1 do
		DelObj(Mobs[i])
	end
end

----------------------------------------------------
function LuaS_422847_15(obj)--�����ε{��
----------------------------------------------------
	while	true	do
		sleep(10)
--�T�w�ؼЦs�b
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 50)==false		then
			DW_GetClose(OwnerID(),obj,50)
		end
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 55)	then
			CastSpellLV(OwnerID(),obj,494807,6)
		end
	end
end
----------------------------------------------------
function LuaS_422847_16(obj)--�k�N�����ε{��
----------------------------------------------------
	while	true	do
		sleep(10)
--�T�w�ؼЦs�b
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 100)==false		then
			DW_GetClose(OwnerID(),obj,100)
		end
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 150)	then
			CastSpellLV(OwnerID(),obj,494808,10)
		end
	end
end

----------------------------------------------------
function LuaS_422847_17(obj)--�w�w�Ĵ������ε{��
----------------------------------------------------
	while	true	do
		sleep(10)
--�T�w�ؼЦs�b
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 50)==false		then
			DW_GetClose(OwnerID(),obj,50)
		end
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 55)	then
			CastSpellLV(OwnerID(),obj,494809,200)
		end
	end
end


----------------------------------------------------
function LuaS_422847_18(Num)--�w�w�Ĵ��ޯ઺�ˬd�@��
----------------------------------------------------
--�w��k�v�ϥΪ�  �u��k�v����
	if	Num == 1	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113982		then
			return	true
		else
			return	false
		end
	end
--�w��{�ȮR�ϥΪ�  �u��{�ȮR����
	if	Num == 2	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113952		then
			return	true
		else
			return	false
		end
	end
--�w��u���H�v�d�򱽿����ޯ�
	if	Num == 3	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113978		then
			return	true
		else
			return	false
		end
	end
--�w��u�H���Ԥh�v�d�򱽿����ޯ�
	if	Num == 4	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113987		then
			return	true
		else
			return	false
		end
	end
	return false
end


----------------------------------------------------
function LuaS_422847_19() --�I�Ϫk�N���ˬd
----------------------------------------------------
	if	CheckBuff(OwnerID(),505522)	then
		return false
	end
	local Temp
--�ˬd��m�M�Z��
	local NPC = SearchRangeNPC ( OwnerID() , 110 )
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113981	or
			ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113983	then
			Temp = i
		end
	end
	if	ReadRoleValue(NPC[Temp],EM_RoleValue_PID)~=0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422847_21]", 0 )
		return false
	end
	if	CheckDistance(OwnerID(),NPC[Temp], 100)==false		then
--���ܶZ���ӻ�
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422847_20]", 0 )
		return false
	end
--�T������
	return true
end


----------------------------------------------------
function LuaS_422847_20()--�k�N������
----------------------------------------------------
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
--���L�̰���
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113983		then
--���槹���ݭn���X
			BeginPlot(NPC[i],"LuaS_422847_21",0)
			return
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113981		then
--���槹���ݭn���X
			BeginPlot(NPC[i],"LuaS_422847_21",0)
			return
		end
	end
end


----------------------------------------------------
function LuaS_422847_21()--�I��a�����@��
----------------------------------------------------
	local CastBarResult
--�N���a��ID�g�J
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
--Ū���
	if BeginCastBar( TargetID(), "[SC_422847_17]" , 100 , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_END , 0 ) ~= 1 then
		ScriptMessage ( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		return
	end
--�����ˬd
	SetDefIdleMotion(TargetID(),ruFUSION_MIME_CAST_LOOP)
	while	true	do
		sleep(2)
--�T�O�ؼФ��b
--�Y���b ���m�ܼ�
		if	CheckID(TargetID())==false	then
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			return
		end
		CastBarResult = CheckCastBar(TargetID())
		if	CastBarResult ~=0	then
			if	CastBarResult >0	then
--���\
				EndCastBar( TargetID(), CastBarResult )
				SetDefIdleMotion(TargetID(),ruFUSION_MIME_IDLE_STAND)
--�q�s���P�_�n��t�����q
				if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==113981		then
					BeginPlot(OwnerID(),"LuaS_422847_12",0)
				else
					BeginPlot(OwnerID(),"LuaS_422847_14",0)
				end
--�d�򤺪����a�i�J�@���O�@�Ҧ�
				local Player = SearchRangePlayer ( OwnerID() , 100 )
				for i=0,table.getn(Player),1 do
DeBugMSG(0,0,"search 1")
					if	CheckBuff(Player[i],505495)	then
DeBugMSG(0,0,Player[i])
						BeginPlot(Player[i],"LuaS_422847_22",0)
					end
				end
--�d��@��>>�@���O�@�Ҧ�
				SetPlot(OwnerID(),"range","LuaS_422847_22",100)
				return
			else
--�Q���_
				SetDefIdleMotion(TargetID(),ruFUSION_MIME_IDLE_STAND)
				EndCastBar( TargetID(), CastBarResult )
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				return
			end
		end
	end
end

------------------------------------------
function LuaS_422847_22() --�Ұʼ@���O�@
------------------------------------------
DeBugMSG(0,0,"range plot is begin")
--�u��w�ܦ��i�h�����a�_�@��
	if	CheckBuff(OwnerID(),505495)	then
DeBugMSG(0,0,"check pass")
		if	CheckBuff(OwnerID(),505522)==false	then
			AddBuff(OwnerID(),505522,1,30)
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
			sleep(20)
--���W���Y102065
			local Rock = Lua_DW_CreateObj("obj",114303,OwnerID(),0)
			SetModeEx(Rock ,EM_SetModeType_Strikback,false)
			SetModeEx(Rock,EM_SetModeType_Move,false)
			AddToPartition(Rock ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J�P�h
			BeginPlot(Rock,"LuaS_422847_23",0)
			PlayMotion(Rock ,ruFUSION_ACTORSTATE_SPAWN_BEGIN)
		end
	end
end
------------------------------------------
function LuaS_422847_23() --���Y���۷��@��
------------------------------------------
DeBugMSG(0,0,"rock start to check")
--���a���u
	while	CheckID(TargetID())	do
		sleep(10)
--�@����t����
		if	CheckBuff(TargetID(),505522)==false	then
			SetDefIdleMotion(TargetID(),ruFUSION_MIME_IDLE_STAND)
DeBugMSG(0,0,"Del 1")
			DelObj(OwnerID())
			break
		end
	end
DeBugMSG(0,0,"Del 2")
	DelObj(OwnerID())
end
------------------------------------------
function LuaS_422847_24()--��b�{�ȮR���W  �ΨӪ�t��
------------------------------------------
--�R���{�ȮR
	DelObj(TargetID())
	return true
end
------------------------------------------
function LuaS_422847_25()--���F�h���b���P�_�@��
------------------------------------------
	for i=1,5,1 do
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==(113972+i)	then
			return true
		end
	end
	return false
end
-------------------------------------------------
function LuaS_422847_26()--�R���ؼШ��W��buff�ƶq
-------------------------------------------------
	Lua_SubtractBuff(TargetID(),505533,0,0)
end
-------------------------------------------------
function LuaS_422847_27()  --�k�N���P�_
-------------------------------------------------
	if	CheckBuff(TargetID(),505519)==false	then
		return true
	else
		return false
	end
end
-------------------------------------------------------------
function LuaS_422847_28() --�n���۶H
-------------------------------------------------------------
	AddBuff(OwnerID(),505574,1,-1)
end
-------------------------------------------------------------
function LuaS_422847_29() --�a���۶H
-------------------------------------------------------------
	AddBuff(OwnerID(),505575,1,-1)
end
-------------------------------------------------------------
function LuaS_422847_30() --buff�������������B�m
-------------------------------------------------------------
	CancelBuff(OwnerID(),505496)
	Lua_SubtractBuff( OwnerID() , 505533 , 11 , 1 )
	CancelBuff_NoEvent(OwnerID(),505519)
	CancelBuff(OwnerID(),505497)
	CancelBuff(OwnerID(),505574)
end
-------------------------------------------------------------
function LuaS_422847_31() --�۶H�ޯ઺�ˬd
-------------------------------------------------------------
	if	CheckBuff(OwnerID(),505522)	then
		return false
	else
		return true
	end
end
----------------------------------------------
function LuaS_422847_32()--��ݥ��Ȫ���ܼ@��
----------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422847_23]")
	SetFlag(OwnerID(),543530,1)
end