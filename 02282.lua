------------------------------Skill------------------------------------------
function Lua_Zone13_PE03_TakeAll()	--�@�������Ҧ��f��
	--OwnerID ���a
	local Oid = OwnerID()
	local Ctrl = ReadRoleValue(Oid,EM_RoleValue_Register5)
	DebugMsg(0,0,Ctrl)
	--SysCastSpellLv( Ctrl,Ctrl,497043,0 )--�s�餤�_�I�k��,���F���_���b���c�l�����a
	local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1 )
	local Group = Zone13_PE03_Var["Group"][GroupID]
	for i=1,table.getn( Group["Box"] ) do
		if ReadRoleValue(Group["Box"][i],EM_RoleValue_Register10)==0 then--�����a���b�ߪ��|�Q���L
			WriteRoleValue( Group["Box"][i] , EM_RoleValue_Register10, 1 )--�קK�@�������Ҧ��c�l�ɭ���Ĳ�o
			CallPlot( Group["Box"][i]  ,"Lua_Zone13_PE03_QuestBoxReset", Oid )
		end
	end
end

function Lua_Zone13_PE03_Skill01()--��m����c
	--����cID 117507
	--�c�l�s�ȤH���k�NID  497042
	local Oid = OwnerID()--���a
	local ForgedBox = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if CheckID(ForgedBox)==TRUE then
		table.remove(Zone13_PE03_Var_ForgedBox,ForgedBox)
		DelObj(ForgedBox)
	end
	ForgedBox = kg_GetRangePos( Oid , 117507,20 )--�гy����c
	--WriteRoleValue( ForgedBox, EM_RoleValue_LiveTime, 15 )--�ͦs�ɶ�
	WriteRoleValue(Oid,EM_RoleValue_Register9,ForgedBox )--�b���a���W�������c�l
	WriteRoleValue(ForgedBox,EM_RoleValue_Register9,Oid )--�b�c�l���W�������a
	WriteRoleValue(ForgedBox,EM_RoleValue_Register8,1 )--��ܦb���W
	AddToPartition( ForgedBox,ReadRoleValue(Oid,EM_RoleValue_RoomID) )
	SysCastSpellLv(ForgedBox,ForgedBox,497048,0)--�c�l���ͪ��S��
	Zone13_PE03_Var_ForgedBox[ForgedBox]={}--�ЫةǪ����
	BeginPlot(ForgedBox,"Lua_Zone13_PE03_BoxReady",0)
end

function Lua_Zone13_PE03_BoxReady()--�������Ĳ�o
	local ForgedBox = OwnerID()
	local Player = ReadRoleValue( ForgedBox , EM_RoleValue_Register9 )
	Sleep(50)
	SysCastSpellLv( ForgedBox,ForgedBox,497042,0 )
	CallPlot(ForgedBox,"Lua_Zone13_PE03_Skill02_EnemyBuffCheck01",Player)
	local Timer = 0
	while 1 do
		if Timer%3==0 and ReadRoleValue(ForgedBox,EM_RoleValue_Register8)==1 then--�C�T��I��޻��ȤH
			SysCastSpellLv( ForgedBox,ForgedBox,497042,0 )
		elseif Timer>=15 then--15������
			Hide(ForgedBox)
			WriteRoleValue(ForgedBox,EM_RoleValue_Register8,0)
			SetModeEx( ForgedBox , EM_SetModeType_Show, FALSE)--�O�_ø�s�X�ҫ�
			Show(ForgedBox,0)
			break
		end
		Sleep(10)
		Timer = Timer +1
	end
	Sleep(100)
	table.remove(Zone13_PE03_Var_ForgedBox,ForgedBox)
	DelObj(ForgedBox)
end

function Lua_Zone13_PE03_BoxCallEnemy()	--�޻��ȤH
	local Oid = OwnerID()--�c�l
	local Tid = TargetID()--�ȤH
	local Enemy = Zone13_PE03_Var["Enemy"]
	for j=1, table.getn(Enemy) do
		if ReadRoleValue( Tid, EM_RoleValue_OrgID ) == Enemy[j] then
			--�����c�l�b�ȤH���W
			if CheckBuff(Tid,508737)~=TRUE and CheckBuff(Tid,508738)~=TRUE and KS_InCombat(Tid)~=TRUE then
				--Say(Tid,"Yo!")
			 	AddBuff( Tid ,508737,0,-1)--�Q�޻�
			 	table.insert(Zone13_PE03_Var_ForgedBox[Oid],Tid)
			 	CallPlot(Tid,"Lua_Zone13_PE03_EnemyToBox",Oid )--�sTargetEnemy���_���ӧ�Box
			 end
			 break
		end
	end
end

function Lua_Zone13_PE03_EnemyToBox( Box )
	local Oid=OwnerID()
	local FaceBox=0
	MoveToFlagEnabled( Oid, false )	--���޸��|�@���}��
	WriteRoleValue(Oid,EM_RoleValue_IsWalk, 1 )	--Boss�Ψ�������
	while 1 do
		if CheckBuff(Oid,508737)==TRUE then
			if CheckID(Box)==TRUE and GetDistance( Oid, Box )>50 then
				KS_Move( Oid , 20, Box )
			elseif CheckID(Box)~=TRUE or ReadRoleValue(Box,EM_RoleValue_Register8)==0 then
				CancelBuff(Oid,508737)--�Q�޻�
				MoveToFlagEnabled( Oid, TRUE )	--���޸��|�@���}��
				WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--Boss�Ψ�������
				break
			else
				if FaceBox==0 then
					FaceBox=1
					FaceObj(Oid,Box)
				end
			end
		elseif CheckBuff(Oid,508737)~=TRUE and KS_InCombat(Oid)~=TRUE  then--�Q�޻������B�S���b�԰���
			--���p�c�l�s�b�N�t��
			if CheckBuff(Oid,508738)~=TRUE and CheckID(Box)==TRUE and GetDistance( Oid, Box )<30 and ReadRoleValue(Box,EM_RoleValue_Register8)==1 then
				PlayMotion(Oid,ruFUSION_ACTORSTATE_ATTACK_1H)
				ScriptMessage( Box, 0, 1 , "[SC_PE_ZONE13_03_MESSAGE01]" , 0 )
				--���F�̼��㪺�N��c���H�I
				DebugMsg(0,0,"DelBox")
				Hide(Box)
				WriteRoleValue(Box,EM_RoleValue_Register8,0)
				SetModeEx( Box , EM_SetModeType_Show, FALSE)--�O�_ø�s�X�ҫ�
				Show(Box,0)
				--DelObj(Box)
			end
			MoveToFlagEnabled( Oid, TRUE )	--���޸��|�@���}��
			WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--Boss�Ψ�������
			break
		else
			MoveToFlagEnabled( Oid, TRUE )	--���޸��|�@���}��
			WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--Boss�Ψ�������
			break
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill02_01()--���a���z���f��--497005 ��c�z�}  �_��ȤH
	local ForgedBox = ReadRoleValue(OwnerID(),EM_RoleValue_Register9 )
	if CheckID(ForgedBox)==TRUE and ReadRoleValue(ForgedBox,EM_RoleValue_Register8)==1 then
		BeginPlot(ForgedBox,"Lua_Zone13_PE03_Skill02_BoxExplode",0 )
	end
end

function Lua_Zone13_PE03_Skill02_BoxExplode()--���f���z���A�@���ۧڧR��
	local ForgedBox = OwnerID()
	local Player = ReadRoleValue( ForgedBox , EM_RoleValue_Register9 )
	SysCastSpellLv(ForgedBox,ForgedBox,497005,0)
	CallPlot(ForgedBox,"Lua_Zone13_PE03_Skill02_EnemyBuffCheck02",Player)
	
	Sleep(10)--DelObj(ForgedBox)
	Hide(ForgedBox)
	WriteRoleValue(ForgedBox,EM_RoleValue_Register8,0)
	SetModeEx( ForgedBox , EM_SetModeType_Show, FALSE)--�O�_ø�s�X�ҫ�
	Show(ForgedBox,0)
end

function Lua_Zone13_PE03_Skill02_02()--��c��Ǫ���_��
	local Oid =OwnerID()--�c�l
	local Tid = TargetID()--�ȤH
	if CheckBuff(Tid,508737)==TRUE then
		CancelBuff(Tid,508737)--�Q�޻�
		AddBuff(Tid,508738,0,-1)--�Q�_��
		--Say(Tid,"ouch!")
	end
end

function Lua_Zone13_PE03_Skill02_EnemyBuffCheck01( Player )--�ȤH���W���Q�޻��A�b�ˬd���S�����쥢�h����A���h�缾�a���y
	DebugMsg(0,0,"BuffCheck01Start! Player = "..Player )
	Lua_Zone13_PE03_Skill02_EnemyBuffCheck(Player,508737)
end

function Lua_Zone13_PE03_Skill02_EnemyBuffCheck02( Player )--�ȤH���W���Q�_��A�b�ˬd���S�����쥢�h����A���h�缾�a���y
	DebugMsg(0,0,"BuffCheck02Start! Player = "..Player )
	Lua_Zone13_PE03_Skill02_EnemyBuffCheck(Player,508738)
end

function Lua_Zone13_PE03_Skill02_EnemyBuffCheck(Player,Buff)
	local Oid= OwnerID()--��c
	local EnemyGroup = Zone13_PE03_Var_ForgedBox[Oid]
	local GiveKey = {}	--���p�w���L���a���y�h��1
	local Times = 10
	if Buff==508737 then Times=15 end--�c�l�u�|�s�b15��A�G�]�O�޻�15��
	for k=1,Times do--�C���ˬd�Ǫ����W���S���Q�_��P���h����,�@10��
		EnemyGroup = Zone13_PE03_Var_ForgedBox[Oid]
		for i in pairs(EnemyGroup) do
			if GiveKey[EnemyGroup[i]]==nil then
				GiveKey[EnemyGroup[i]]=0
				DebugMsg(0,0,Buff.." ,i="..EnemyGroup[i].." Key="..GiveKey[EnemyGroup[i]])
			end
		end
		for i in pairs(EnemyGroup) do
			if CheckBuff(EnemyGroup[i],Buff)==TRUE and CheckBuff(EnemyGroup[i],508748)==TRUE and GiveKey[EnemyGroup[i]]==0 then
				GiveKey[EnemyGroup[i]]=1--�W��A���b���Ƶ����y
				ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				--Say( Player,"Get One More  QuestKey!" )
			end
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill03_01()--���a�ʵ��ȤH
	local Player = OwnerID()
	local Tid =TargetID()
	AddBuff(Tid,508739,0,-1)--�Q�ʵ�
	CallPlot(Tid,"Lua_Zone13_PE03_Skill03_10sLoop",Player )
end
function Lua_Zone13_PE03_Skill03_02()--�Щ�ȤH
	local Player = OwnerID()
	local Tid = TargetID()
	if CheckBuff(Tid,508740)==TRUE then
		CancelBuff(Tid,508740)--�A�X�аO
		AddBuff(Tid,508741,0,-1)--��O�J�Щ�
		ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		--DebugMsg( 0,0,"Get QuestKey!" )
		--Say(Player,"Get QuestKey!"  )
	end
end

function Lua_Zone13_PE03_Skill03_10sLoop( Player )--�ȤH�Q�ʵ���ۧڰ���j��,���ΦҼ{��L���a,�]���ʵ��O�ߤ@��
	local Oid = OwnerID()--�ȤH
	--Say(Oid,"Loop Start")
	math.randomseed(math.random(10000, 99999))
	local randnum =0
	local BuffID = { 508740 , 508742 }--�A�X�аO,�o�ۦ���
	local timer = 0
	while 1 do
		sleep(10)
		timer = timer +1
		local Distance = GetDistance( Oid, Player )
		if CheckBuff(Oid,508739)==true and KS_InCombat(Oid)~=TRUE and Distance<140 and timer>=6 then --�ʵ��W�L����
			randnum = math.random(2)
			if randnum==2 then
				SysCastSpellLv( Player, Oid, 496946, 0 )--�W�[����
				WriteRoleValue(Oid,EM_RoleValue_Register10,Player)
				AddBuff(Player,508743,0,-1)--�ְk�R
			end
			CancelBuff(Oid,508739)
			AddBuff(Oid, BuffID[randnum] ,0,-1)
			break
		elseif KS_InCombat(Oid)==TRUE or Distance>=140 then--�ȤH�i�J�԰��λP���a�Z���ӻ�
			CancelBuff(Oid,508739)--�M���ʵ�
			break
		end
	end
end

function Lua_Zone13_PE03_Skill03_03()--�o�ۦ�������A�ʵ����a���ְk�R�O�_����
	DebugMsg(0,0,"Check Player Buff")
	local Oid = OwnerID()--�ȤH
	local Player = ReadRoleValue(Oid,EM_RoleValue_Register10)
	if CheckBuff(Player,508743)==TRUE then
		CancelBuff( Player,508743 )
		CancelBuff( Player,508744 )
		ks_QuestKill( Player, 105315, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		--DebugMsg( 0,0,"Get QuestKey!" )
		--Say( Player,"Get QuestKey!" )
	end
end

function Lua_Zone13_PE03_Skill04_01()--�H���M�w�O�_�����K��� --117509 �b�Y����
	math.randomseed(math.random(10000, 99999))
	local Oid = OwnerID() --���a
	local Ctrl = ReadRoleValue(Oid,EM_RoleValue_Register5)--�������A���K�M���c�lID�A���p���e���O�L����
	if ReadRoleValue(Ctrl,EM_RoleValue_Register10)==0 then--��ܥثe�S���c�l�Q����
		local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1)
		local GroupBox = Zone13_PE03_Var["Group"][GroupID]["Box"]
		local SecretBox = GroupBox[ReadRoleValue(Ctrl,EM_RoleValue_Register9)]--��X�Ӹs�ժ����K���
		if ReadRoleValue(SecretBox,EM_RoleValue_Register10)==0 then--�S���Q���󪱮a�j�w
			WriteRoleValue(SecretBox,EM_RoleValue_Register9,1)--�b�Y�j�w
			local Arrow = kg_GetPos(SecretBox,117509,15)--��X�c�l"�Y�W"����m
			SetModeEx( Arrow, EM_SetModeType_Gravity , false )	-- ���O
			SetModeEx( Arrow , EM_SetModeType_Mark, false)	----�i�I��(�_)
			SetModeEx( Arrow , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
			--WriteRoleValue(Arrow,EM_RoleValue_Register10,SecretBox)
			--WriteRoleValue(Oid,EM_RoleValue_Register10,randBox)--���a�O��c�lID
			--WriteRoleValue( Arrow, EM_RoleValue_LiveTime, 10 )--�ͦs�ɶ�
			AddToPartition( Arrow , ReadRoleValue( Oid , EM_RoleValue_RoomID ) )
			CallPlot(Arrow,"Lua_Zone13_PE03_DelArrow",Oid,Arrow,SecretBox)
			AddBuff( Oid,508746,0,-1 )--����Ž�
		else
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--�A����]�S���
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--�A����]�S���
	end
end

function Lua_Zone13_PE03_DelArrow( Player,Arrow,SecretBox )
	for i=1,10 do
		if GetDistance(Arrow,Player)>=150 then
			WriteRoleValue( SecretBox,EM_RoleValue_Register9,0 )--�b�Y����
			CancelBuff(Player,508746)
			break
		end
		if i==10 then
			WriteRoleValue( SecretBox,EM_RoleValue_Register9,0 )--�b�Y����
			break
		end
		Sleep(10)
	end
	DelObj(Arrow)
end

function Lua_Zone13_PE03_Skill04_02()--ú�^���
	local Oid = OwnerID()
	CancelBuff(Oid,508880)
	AddBuff(Oid,508745,0,-1)--�w����
	ks_QuestKill( Oid, 105315, 10 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--Say( Oid,"Get 10 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_01()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508750)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say( Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_02()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508751)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say(Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_03()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508752)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say( Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill05_04()
	local Tid =TargetID()
	local Player = OwnerID()
	CancelBuff(Tid,508753)
	AddBuff(Tid,508754,0,-1)
	ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say( Player,"Get 1 QuestKey!" )
end

function Lua_Zone13_PE03_Skill06()--���W�F�S��
	local Tid = TargetID() --�u�@��
	local Oid =OwnerID()--���a
	CallPlot(Tid,"Lua_Zone13_PE03_Skill06_Rest",Oid)
end

function Lua_Zone13_PE03_Skill06_Rest( Player )--�u�@�̥h���o
	local Oid = OwnerID()--�u�@��
	local sit = 0
	local Timer =0
	Hide(Oid)
	MoveToFlagEnabled( Oid, false )--�������޸��|�@��
	SetModeEx( Oid , EM_SetModeType_Searchenemy, false)	---����(�_)
	Show(Oid,0)
	--local Dummy = kg_GetRangePos(Oid,117507,100,180)
	--SetModeEx( Dummy , EM_SetModeType_Show, FALSE)--�O�_ø�s�X�ҫ�
	--AddToPartition(Dummy,ReadRoleValue(Oid,EM_RoleValue_RoomID))
	--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 1 )	--�Ψ������� 
	while 1 do
		if KS_InCombat(Oid)~=TRUE then
			--if GetDistance(Oid,Dummy)>40 then
			--	KS_Move( Oid , 0, Dummy )
		--	else
				if sit==0 then
					sit=1
					StopMove(Oid,TRUE)
					PlayMotion( Oid , ruFUSION_ACTORSTATE_SIT_LOOP )
				end
				if Timer==20 then
					CancelBuff(Oid,508749)--�����h��
					AddBuff(Oid,508876,0,-1)--�h�ҧK��
					ks_QuestKill( Player, 105315, 4 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
					PlayMotion(Oid, ruFUSION_ACTORSTATE_SIT_END)
					--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--�Ψ������� 
					Hide(Oid)
					MoveToFlagEnabled( Oid, true )--�������޸��|�@��
					SetModeEx( Oid , EM_SetModeType_Searchenemy, true)	---����(�_)
					Show(Oid,0)
					--DelObj(Dummy)
					break
				end
				SysCastSpellLv(Oid,Oid,497046,0)--�s��80�X����1
		--	end
		else
			PlayMotion(Oid, ruFUSION_ACTORSTATE_SIT_END)
			--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--�Ψ������� 
			Hide(Oid)
			MoveToFlagEnabled( Oid, true )--�������޸��|�@��
			SetModeEx( Oid , EM_SetModeType_Searchenemy, true)	---����(�_)
			Show( Oid,0 )
			--DelObj(Dummy)
			break
		end
		Timer = Timer+1
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill07_01()--�إߤ@�չB�f������a
	local Tid = TargetID()--�ѽm���e�f��
	local Oid = OwnerID()--���a
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	DebugMsg(0,0,"QuestCar="..QuestCar)
	if kg_CheckLive(QuestCar)==TRUE and ReadRoleValue(QuestCar,EM_RoleValue_OrgID)==105304 then
		DelObj(QuestCar)
	end
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and ReadRoleValue(QuestMember,EM_RoleValue_OrgID)==105316 then
		DelObj(QuestMember)
	end
	QuestCar = kg_GetRangePos(Tid,105304,100)
	MoveToFlagEnabled( QuestCar, false )	--�������޸��|�@��
	SetFlag( QuestCar, 544801, 1 )--�������_��
	SetModeEx( QuestCar , EM_SetModeType_Revive, false)	--�i����
	SetModeEx( QuestCar , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( QuestCar , EM_SetModeType_Searchenemy, false)	--����
	SetModeEx( QuestCar , EM_SetModeType_Strikback, false) ---����
	WriteRoleValue(QuestCar,EM_RoleValue_Register10,Oid)
	WriteRoleValue(Oid,EM_RoleValue_Register10,QuestCar)
	AddToPartition(QuestCar,RoomID)
	AddBuff(QuestCar,508887,0,-1)--�f�����^��
	AddBuff( QuestCar, 507514, 0, -1 )--�K�̪v��
	QuestMember = kg_GetRangePos(QuestCar,105316,50,180)
	MoveToFlagEnabled( QuestMember, false )	--�������޸��|�@��
	SetFlag( QuestMember, 544801, 1 )--�������_��
	SetModeEx( QuestMember , EM_SetModeType_Revive, false)	--�i����
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, false)	--����
	--SetModeEx( QuestMember , EM_SetModeType_Strikback, false) ---����
	WriteRoleValue(QuestMember,EM_RoleValue_Register10,Oid)
	WriteRoleValue(QuestMember,EM_RoleValue_Register9,QuestCar)
	WriteRoleValue(QuestCar,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(Oid,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(QuestMember,EM_RoleValue_Register8,0)--�ثe�n�h���X��
	WriteRoleValue(QuestCar,EM_RoleValue_Register8,0)--�ثe�n�h���X��
	AddToPartition(QuestMember,RoomID)
	AddBuff(QuestMember,508890,0,-1)--���i����
	Yell( QuestMember ,"[SC_PE_ZONE13_03_MESSAGE06]" , 2 )
	SetPlot( QuestMember , "DEAD", "Lua_Zone13_PE03_Dead03", 0 )--���`�@��
	SetPlot( QuestCar , "DEAD", "Lua_Zone13_PE03_Dead04", 0 )--���`�@��
	CallPlot(QuestCar,"Lua_Zone13_PE03_QuestMemberCheckPlayer",Oid,QuestMember)
	--SetFollow( QuestMember,QuestCar)
end

function Lua_Zone13_PE03_QuestMemberCheckPlayer( Player ,QuestMember )--�C�����ˬd���a�O�_�b����
	local QuestCar = OwnerID()
	while 1 do
		if kg_CheckLive(Player)~=true or GetDistance(QuestCar,player)>450 then
			DelObj(QuestMember)
			DelObj(QuestCar)
			break
		end
		Sleep(600)
	end
end

function Lua_Zone13_PE03_Skill07_02()--���B�f�s�իe�i
	local Oid = OwnerID()--���a
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	SetModeEx( QuestCar , EM_SetModeType_Fight, FALSE) ---�i���
	AddBuff(QuestMember,508890,0,-1)--���i����
	SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE) ---����
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, FALSE)	--����
	WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 1 )	--�Ψ������� 
	WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 1 )	--�Ψ�������
	CallPlot(QuestCar,"Lua_Zone13_PE03_Go01",Oid,QuestMember, QuestCar)
end

function Lua_Zone13_PE03_Go01( Player,QuestMember, QuestCar )
	--SetFollow( QuestMember,QuestCar)
	local FlagID = Zone13_PE03_Var["FlagID"][1]
	local Step = ReadRoleValue(QuestCar,EM_RoleValue_Register8)
	local Goal = GetMoveFlagCount( FlagID )-1
	while 1 do
		if KS_InCombat(QuestMember)==TRUE or ReadRoleValue( Player, EM_RoleValue_IsAttackMode )==1 then
			StopMove(QuestCar,TRUE)
			StopMove(QuestMember,TRUE)
			--SysCastSpellLv(QuestMember,QuestMember,497047,0)
			SysCastSpellLv( QuestMember,QuestMember,497046,0)--�j���s�餳��
			DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
			DebugMsg(0,0,"EnterBattle1")
			break
		else
			if Step<=Goal then
				if DW_CheckDis( QuestCar, FlagID, step , 30 ) == true and Step<Goal then
					Step = Step+1
					WriteRoleValue(QuestMember,EM_RoleValue_Register8,Step)--�ثe�n�h���X��
					WriteRoleValue(QuestCar,EM_RoleValue_Register8,Step)--�ثe�n�h���X��
				elseif Step==Goal and  DW_CheckDis( QuestCar, FlagID, step , 30 ) == true then
					if GetDistance(QuestCar,Player)<=100 then
						AddBuff(Player,508745,0,-1)--�w����
						ks_QuestKill( Player, 105315, 10 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
						--DebugMsg( 0,0,"Get 10 QuestKey!" )
						--Say( Player,"Get 10 QuestKey!" )
						DelObj(QuestMember)
						DelObj(QuestCar)
						break
					end
				else
					--SysCastSpellLv(QuestMember,QuestMember,497047,0)
					SysCastSpellLv( QuestMember,QuestMember,497046,0)--�j���s�餳��
					--DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
					if HateListCount(QuestMember)>0 then
						StopMove(QuestCar,TRUE)
						StopMove(QuestMember,TRUE)
						break
					end
					KS_Move( QuestMember , 0, QuestCar )
					KS_Move( QuestCar, 30, FlagID , Step )
				end
			end
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_Skill07_03()--�e�f�������f���h���H
	local Oid = OwnerID()--���a
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	SetModeEx( QuestCar , EM_SetModeType_Fight, TRUE) ---�i���
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, TRUE)	--����
	SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE) ---����
	CancelBuff(QuestMember,508890)
	--CallPlot(QuestCar,"Lua_Zone13_PE03_Fight",Oid,QuestMember, QuestCar)
end

function Lua_Zone13_PE03_Fight( Player,QuestMember, QuestCar )--�e�f�s�նi�J�԰�
	SetModeEx( QuestCar , EM_SetModeType_Fight, TRUE) ---�i���
	--SetModeEx( QuestMember , EM_SetModeType_Searchenemy, TRUE)	--����
	SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE) ---����
end

function Lua_Zone13_PE03_Skill07_04()--�e�f�s�ձj��e�i
	local Oid = OwnerID()--���a
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	DebugMsg(0,0,QuestMember)
	ClearHateList( QuestMember , -1 )
	SetModeEx( QuestCar , EM_SetModeType_Fight, FALSE) ---�i���
	--SetModeEx( QuestMember , EM_SetModeType_Fight, FALSE) ---�i���
	SetModeEx( QuestMember , EM_SetModeType_Strikback, FALSE) ---����
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, FALSE)	--����
	Hide(QuestMember)
	ClearHateList( QuestMember , -1 )
	SetStopAttack( QuestMember )
	Show( QuestMember,0 )
	--DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
	WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 0 )	--�Ψ������� 
	WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 0 )	--�Ψ�������
	CallPlot(QuestCar,"Lua_Zone13_PE03_Rush",Oid,QuestMember, QuestCar)
end

function Lua_Zone13_PE03_Rush( Player,QuestMember, QuestCar,FlagNum )--�j���}
--[[
	for i=1,10 do
		ClearHateList( QuestMember , -1 )
		DebugMsg(0,0,"HateCount= "..HateListCount(QuestMember))
		Sleep(30)
	end
]]--
	local FlagID = Zone13_PE03_Var["FlagID"][1]
	local Step = ReadRoleValue(QuestCar,EM_RoleValue_Register8)
	local Goal = GetMoveFlagCount( FlagID )-1
	local Timer = 0 
	while 1 do
		if Step<=Goal and Timer<=10 then
			if DW_CheckDis( QuestCar, FlagID, step , 30 ) == true and Step<Goal then
				Step = Step+1
				WriteRoleValue(QuestMember,EM_RoleValue_Register8,Step)--�ثe�n�h���X��
				WriteRoleValue(QuestCar,EM_RoleValue_Register8,Step)--�ثe�n�h���X��
			elseif Step==Goal and  DW_CheckDis( QuestCar, FlagID, step , 30 ) == true then
				if GetDistance(QuestCar,Player)<=100 then
					AddBuff(Player,508745,0,-1)--�w����
					ks_QuestKill( Player, 105315, 10 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
					--DebugMsg( 0,0,"Get 10 QuestKey!" )
					--Say( Player,"Get 10 QuestKey!" )
					DelObj(QuestMember)
					DelObj(QuestCar)
					break
				end
			else
				SysCastSpellLv( QuestMember,QuestMember,497046,0)--�j���s�餳��
				--Say(QuestMember,"Go!!!!!!!")
				KS_Move( QuestMember , 0, QuestCar )
				KS_Move( QuestCar, 30, FlagID , Step )
			end
		else
			WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 1 )	--�Ψ������� 
			WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 1 )	--�Ψ�������
			AddBuff(QuestMember,508890,0,-1)--���i����
			SetModeEx( QuestMember , EM_SetModeType_Strikback, TRUE ) ---����
			SetModeEx( QuestMember , EM_SetModeType_Searchenemy, FALSE )	--����
			DebugMsg(0,0,"Time's Up!")
			break
		end
		Sleep(10)
		Timer = Timer +1
	end
end

function Lua_Zone13_PE03_Skill08_01()
	local Tid = TargetID()--�ѽm���e�f��
	local Oid = OwnerID()--���a
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local QuestCar = ReadRoleValue(Oid,EM_RoleValue_Register10)
	if kg_CheckLive(QuestCar)==TRUE and ReadRoleValue(QuestCar,EM_RoleValue_OrgID)==105304 then 
		DelObj(QuestCar)
	end
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and ReadRoleValue(QuestMember,EM_RoleValue_OrgID)==105317 then 
		DelObj(QuestMember)
	end
	
	QuestCar = kg_GetRangePos(Tid,105304,100)
	MoveToFlagEnabled( QuestCar, false )	--�������޸��|�@��
	SetFlag( QuestCar, 544801, 1 )--�������_��
	SetModeEx( QuestCar , EM_SetModeType_Revive, false)	--�i����
	SetModeEx( QuestCar , EM_SetModeType_Fight, TRUE) ---�i���
	SetModeEx( QuestCar , EM_SetModeType_Searchenemy, false)	--����
	SetModeEx( QuestCar , EM_SetModeType_Strikback, false) ---����
	WriteRoleValue(QuestCar,EM_RoleValue_Register10,Oid)
	WriteRoleValue(Oid,EM_RoleValue_Register10,QuestCar)
	AddToPartition(QuestCar,RoomID)
	AddBuff(QuestCar,508887,0,-1)--�f�����^��
	AddBuff( QuestCar, 507514, 0, -1 )--�K�̪v��
	QuestMember = kg_GetRangePos(QuestCar,105317,50,180)
	MoveToFlagEnabled( QuestMember, false )	--�������޸��|�@��
	SetFlag( QuestMember, 544801, 1 )--�������_��
	SetModeEx( QuestMember , EM_SetModeType_Revive, false)	--�i����
	SetModeEx( QuestMember , EM_SetModeType_Searchenemy, false)	--����
	SetModeEx( QuestMember , EM_SetModeType_Strikback, false) ---����
	SetModeEx( QuestMember , EM_SetModeType_Fight, false) ---�i���
	WriteRoleValue(QuestMember,EM_RoleValue_Register10,Oid)
	WriteRoleValue(QuestMember,EM_RoleValue_Register9,QuestCar)
	WriteRoleValue(QuestCar,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(Oid,EM_RoleValue_Register9,QuestMember)
	WriteRoleValue(QuestMember,EM_RoleValue_Register8,0)--�ثe�n�h���X��
	WriteRoleValue(QuestCar,EM_RoleValue_Register8,0)--�ثe�n�h���X��
	AddToPartition(QuestMember,RoomID)
	--AddBuff(QuestMember,508890,0,-1)--���i����
	WriteRoleValue(QuestMember,EM_RoleValue_IsWalk, 1 )	--�Ψ������� 
	WriteRoleValue(QuestCar,EM_RoleValue_IsWalk, 1 )	--�Ψ�������
	SetPlot( QuestMember , "DEAD", "Lua_Zone13_PE03_Dead03", 0 )--���`�@��
	SetPlot( QuestCar , "DEAD", "Lua_Zone13_PE03_Dead04", 0 )--���`�@��
	CallPlot(QuestCar,"Lua_Zone13_PE03_Skill08_Go2",Oid,QuestMember,QuestCar)
end

function Lua_Zone13_PE03_Skill08_Go2( Player,QuestMember,QuestCar )

	local FlagID = Zone13_PE03_Var["FlagID"][2]
	local Step = ReadRoleValue(QuestCar,EM_RoleValue_Register8)
	local Goal = GetMoveFlagCount( FlagID )-1
	while 1 do
		if Step<=Goal  then
			if DW_CheckDis( QuestCar, FlagID, step , 30 ) == true and Step<Goal then
				if Step == 3 then
					CallPlot(QuestMember,"Lua_Zone13_PE03_CreateFlower",QuestCar)
				end
				Step = Step+1
				WriteRoleValue(QuestMember,EM_RoleValue_Register8,Step)--�ثe�n�h���X��
				WriteRoleValue(QuestCar,EM_RoleValue_Register8,Step)--�ثe�n�h���X��
			elseif Step==Goal and  DW_CheckDis( QuestCar, FlagID, step , 30 ) == true  then
				if GetDistance(QuestCar,Player)<=100 then
					AddBuff(Player,508745,0,-1)--�w����
					ks_QuestKill( Player, 105315, 10 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
					--DebugMsg( 0,0,"Get 10 QuestKey!" )
					--Say( Player,"Get 10 QuestKey!" )
					DelObj(QuestMember)
					DelObj(QuestCar)
					break
				end
			else
				--Say(QuestMember,"Go!!!!!!!")
				KS_Move( QuestMember , 0, QuestCar )
				KS_Move( QuestCar, 0, FlagID , Step )
			end
		end
		Sleep(10)
	end
end

function Lua_Zone13_PE03_CreateFlower(QuestCar)--105318 ���`����
	DebugMsg(0,0,"FloweStart")
	local QuestMember = OwnerID()
	local RoomID = ReadRoleValue(QuestMember,EM_RoleValue_RoomID)
	local Timer = 0
	local stepTime = 3--���᪺ͪ���j�ɶ�
	local amount = 1--�᪺�ƶq
	local FlagID = Zone13_PE03_Var["FlagID"][2]
	local Goal = GetMoveFlagCount( FlagID )-1
	while 1 do
		if DW_CheckDis( QuestCar, FlagID, Goal , 30 ) == true then--��F�ؼЫh���b���ͪ�
			break
		else
			if Timer>=0 and Timer%stepTime==0 then
				local flowers = kg_CreateArcByObj( QuestMember , 105318, 0 , 70  , amount , -1 , 89,91 )--(�ѦҪ���,����ID,���,�Z��,�ƶq,���V,�̤p����,�̤j����)
				for i in pairs(flowers) do
					SetFlag( flowers[i], 544801, 1 )--�������_��
					SetModeEx( flowers[i] , EM_SetModeType_Revive, false)	--�i����
					WriteRoleValue( flowers[i], EM_RoleValue_LiveTime, 10 )--�ͦs�ɶ�
					AddToPartition( flowers[i] , RoomID )
					SysCastSpellLv( QuestCar, flowers[i], 496946, 0 )--�W�[����
					DebugMsg(0,0,flowers[i])
				end
			end
		end
		Sleep(10)
		Timer = Timer+1
	end
end

function Lua_Zone13_PE03_Skill08_02()--������P�f��
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==105318 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105183  then--��
		KillID(Tid,Tid)--SysCastSpellLv( Oid,Tid,497049,110 )
	elseif ReadRoleValue( Tid , EM_RoleValue_OrgID )==105304 then--�f��
		SysCastSpellLv( Oid,Tid,497049,25 )
	end
end