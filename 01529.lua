
---------------------------------------
function LuaS_422720_0()--���b 113265  �ƪi�D���S�� ���W����ܼ@��
---------------------------------------
	LoadQuestOption(OwnerID())
--�p�G�����Ȫ�����
	if	CheckAcceptQuest(OwnerID(),422720)	and
		CountBodyItem(OwnerID(),205838)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422720_0]","LuaS_422720_1", 0 )
	end
end



---------------------------------------
function LuaS_422720_1()
---------------------------------------
--�P�_����
	if	not CheckCompleteQuest(OwnerID(),422567)	then
		SetSpeakDetail( OwnerID(),"[SC_422720_1]")
	else
--�p�G����������
--�������Ȫ��~
--�P�_�O�_���L�Ӫ��~
		if	CountBodyItem(OwnerID(),205838)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422720_2]")
			GiveBodyItem(OwnerID(),205838,1)
		else
			CloseSpeak(OwnerID())
		end
	end
end


---------------------------------------
function LuaS_422721_1() --���H������ܼ@��������
---------------------------------------
--�P�_����
	if	not CheckCompleteQuest(OwnerID(),422482)	then
		SetSpeakDetail( OwnerID(),"[SC_422721_1]")
	else
--�p�G����������
--�������Ȫ��~
--�P�_�O�_���L�Ӫ��~
		if	CountBodyItem(OwnerID(),205839)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422721_2]")
			GiveBodyItem(OwnerID(),205839,1)
		else
			CloseSpeak(OwnerID())
		end
	end
end


---------------------------------------
function LuaS_422721_3()--��^��
---------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422721_3]")
end


---------------------------------------
function LuaS_422722_0() -- ���b 113304 ���w�C�D�㴵����ܼ@��
---------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422722)	and
		CountBodyItem(OwnerID(),205840)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422722_0]","LuaS_422722_1", 0 )
	end
end

---------------------------------------
function LuaS_422722_1()
---------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422722_1]")
end


---------------------------------------
function LuaS_422722_2()-- ���b 113288 ������������ܼ@��
---------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422722)	and
		CountBodyItem(OwnerID(),205840)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422722_2]","LuaS_422722_3", 0 )
	end
end



---------------------------------------	
function LuaS_422722_3()
---------------------------------------
--�P�_����
	if	not CheckCompleteQuest(OwnerID(),422604)	then
		SetSpeakDetail( OwnerID(),"[SC_422722_3]")
	else
--�p�G����������
--�������Ȫ��~
--�P�_�O�_���L�Ӫ��~
		if	CountBodyItem(OwnerID(),205840)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422722_4]")
			GiveBodyItem(OwnerID(),205840,1)
		else
			CloseSpeak(OwnerID())
		end
	end
end


---------------------------------------
function LuaS_422723_0()-- ���b 113176 ��ƵX�D�ը�����ܼ@��
---------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422723)	and
		CountBodyItem(OwnerID(),205841)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422723_0]","LuaS_422723_1", 0 )
	end
end

--  _1 ����b������

---------------------------------------
function LuaS_422723_1()
---------------------------------------
--�P�_����
--�p�G�����ܦ^����
--�������Ȫ��~
	if	CheckCompleteQuest(OwnerID(),422724)	then
--�P�_�O�_���L�Ӫ��~
		if	CountBodyItem(OwnerID(),205841)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422723_1]")
			GiveBodyItem(OwnerID(),205841,1)
		else
			CloseSpeak(OwnerID())
		end
	else
--�O�_�����L���k�D�H������
		if	CheckCompleteQuest(OwnerID(),422441)	then
			SetSpeakDetail( OwnerID(),"[SC_422723_2]")
		else
			SetSpeakDetail( OwnerID(),"[SC_422723_3]")
		end
	end
end

---------------------------------------
function LuaS_113420_0()--�_���ҡD��ù ���W����ܼ@��
---------------------------------------
	if	CheckFlag(OwnerID(),543283)	then
		SetSpeakDetail( OwnerID(),"[SC_113420_0]")
	else
		LoadQuestOption(OwnerID())
	end
end