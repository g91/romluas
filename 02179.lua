function kg_105039_05()	--�p��X�ͮɰ���
--OwnerID �p��
--EM_RoleValue_Register1 �p��"���b"�Q���a�j�w�I��ɬ�1
--EM_RoleValue_Register3  �Z�ղ���ID
--EM_RoleValue_Register8  ���a�w�g��p���I�粒���ɬ�1
--EM_RoleValue_Register9 �p��i�J�ഫ�����A�ɬ�1
	local Flower = OwnerID()
	WriteRoleValue(Flower,EM_RoleValue_Register1,0)
	WriteRoleValue(Flower,EM_RoleValue_Register8,0)
	WriteRoleValue(Flower,EM_RoleValue_Register9,0)
	SetModeEx(Flower,EM_SetModeType_ShowRoleHead,TRUE)	--����Y��
	sleep(50)	--����������a�i�H�I��
	SetPlot(Flower,"touch","kg_105039_06",30)
	BeginPlot(Flower,"kg_105039_08",0)
end

function kg_105039_06()	--�p��Q�I��ɰ���
	local Flower = TargetID()
	local Player = OwnerID()
	if ReadRoleValue(Flower,EM_RoleValue_Register1)==0 then
		WriteRoleValue(Flower,EM_RoleValue_Register1, 1 )	--�ƹ��I�����w
		if BeginCastBarEvent( Player, Flower , "[SC_105039_02]", 15, ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0 , "kg_105039_07")~=1 then
			ScriptMessage( Flower, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	else
		ScriptMessage( Flower, Player, 0,"[SAY_NPC_BUSY]", 0 )
	end
end

function kg_105039_07(ObjID, CheckStatus)	--�B���I�k���P�w
--OwnerID ���a
--TargetID �p��
	--DebugMsg(0,0,"Picking...")
	
	if CheckStatus >0  then	--�I�k���]���B�p��S���b�κA�ഫ���N��p��R��
		if  ReadRoleValue(TargetID(),EM_RoleValue_Register9)==0 then
	   		WriteRoleValue(TargetID(),EM_RoleValue_Register8,1)	--�p��w�Q���a�B��
	   		--DebugMsg(0,0,"Success!!")
	   		SysCastSpellLv(OwnerID(),TargetID(),492185,0)	--�I���_�ޯ�
			EndCastBar(OwnerID(),CheckStatus)
			kg_105039_10(TargetID())
			DelObj(TargetID())
		else	--�I�k���]�����O�p��w�g���ܤF�N��������
			--DebugMsg(0,0,"Fail....")
			WriteRoleValue(TargetID(),EM_RoleValue_Register1,0)
			EndCastBar(OwnerID(),CheckStatus)
		end
	elseif CheckStatus < 0 then	--�B���p�ᤤ�Q���_
		--DebugMsg(0,0,"���_....")
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,0)
		EndCastBar(OwnerID(),CheckStatus)
	end
end

function kg_105039_08()	--�p��AI
	local Flower = OwnerID()
	local ParentBoss = ReadRoleValue(Flower,EM_RoleValue_Register3)
	local badFlowerID = 105068	--�G�Ѫ��p��ID
	local badFlower
	local RoomID=ReadRoleValue(Flower,EM_RoleValue_RoomID)
	local timer = 0
	SysCastSpellLv(Flower,Flower,496643,0)	--�b�����p��W�G���S��
	CastSpell(Flower,ParentBoss,496631)	--�b����Boss�[�Wbuff,5��I�k
	
	while 1 do
		AdjustFaceDir(Flower,ParentBoss,0)	--����Z�ղ�
		if ReadRoleValue(ParentBoss,EM_RoleValue_IsDead)==1 or	--Boss���`
		   CheckID(ParentBoss)==false 	--Boss���s�b
		    or KS_InCombat(ParentBoss) ~= true then	--Boss���}�԰�
			kg_105039_10()
			break
		elseif timer ==5 and ReadRoleValue(Flower,EM_RoleValue_Register8)==0 then	--���p���a�S����p���˨�
			WriteRoleValue(Flower,EM_RoleValue_Register9,1)	--�p��i�J�ഫ���A
			SysCastSpellLv(ParentBoss,ParentBoss,496702,0)	--�I��l�ध��
			badFlower= LuaFunc_CreateObjByObj(badFlowerID,Flower)	--���ͻG�Ѫ���
			SetModeEx( badFlower , EM_SetModeType_Strikback, false) ---����
			SetModeEx( badFlower , EM_SetModeType_Move, false) ---����
			SetModeEx( badFlower , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( badFlower , EM_SetModeType_Searchenemy, false)	--����
			SetModeEx( badFlower , EM_SetModeType_Revive, false)	--�i����
			WriteRoleValue(badFlower,EM_RoleValue_Register3,ParentBoss)	--�N�Z�ղ�ID��b�a�p�᪺�f�U3
			AddToPartition(badFlower,RoomID)
			SetPlot(badFlower,"dead","kg_105039_10",30)
			BeginPlot(badFlower,"kg_105039_09",0)
			DelObj(Flower)
			break
		end
		sleep(10)
		timer = timer+1
	end
	DelObj(Flower)
end

function kg_105039_09()	--�G�Ѫ��p��AI
--EM_RoleValue_Register3 �Z�ղ�ID
	local badFlower = OwnerID()
	local ParentBoss = ReadRoleValue(badFlower,EM_RoleValue_Register3)
	local timer =0
	while 1 do
		if ReadRoleValue(ParentBoss,EM_RoleValue_IsDead)==1 or 
		   CheckID(ParentBoss)==false or
		   KS_InCombat(ParentBoss) ~= true then
			kg_105039_10()
			break
		elseif timer>2 then
			SetModeEx( badFlower , EM_SetModeType_Strikback, TRUE) ---����
			SetModeEx( badFlower , EM_SetModeType_Move, TRUE) ---����
			SetModeEx( badFlower , EM_SetModeType_Fight, TRUE) ---�i���
			SetModeEx( badFlower , EM_SetModeType_Searchenemy, TRUE)	--����
		end
		sleep(10)
		timer = timer+1
	end
	DelObj(badFlower)
end


function kg_105039_10(FlowerGID)	--�p�ᦺ�`�ɧ@���Ʊ�
	FlowerGID=FlowerGID or OwnerID()
	local ParentBoss = ReadRoleValue(FlowerGID,EM_RoleValue_Register3)	--Ū���Z�ղ�ID
	local CurrectFlowerCount = ReadRoleValue(ParentBoss,EM_RoleValue_Register2)	--Ū����e�p��ƶq
	CurrectFlowerCount = CurrectFlowerCount -1
	WriteRoleValue(ParentBoss,EM_RoleValue_Register2,CurrectFlowerCount)	--�N�p��ƶq��@�æ^�s��Z�ղ����ĤG�Ӥf�U
	DebugMsg(0,0,"There are "..CurrectFlowerCount.." flowers")
end