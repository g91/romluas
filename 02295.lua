

--================================================================================
--�M��K���F��
--================================================================================
function LuaZ13WS_423845_117706()
	local Obj = OwnerID()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423845)==true		and
		CheckCompleteQuest(OwnerID(),423845)==false	and
		CountBodyItem(Obj,209475)>=10			and
		CountBodyItem(OwnerID(),201753)<10		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423845_0]","LuaZ13WS_423845_1",0)
		--�A�n�Ať���i�H��10��[105176]��A��10��[201753]�C
	end
end 

function LuaZ13WS_423845_1()
	local Obj = OwnerID()
	if	CountBodyItem(Obj,209475)>=10		then
		DelBodyItem(Obj,209475,10)
		SetSpeakDetail(OwnerID(),"[SC_423845_1]")
	--��A�O�ڡA�O�ݧڭn����[105176]�O�����򪺡A�p�G�A�Q��ڴ�[201753]�A�̦n���򳣧O�ݡA�n�_�߱o�Φb�諸�a��A�ڥu�O�ӨS����G�ƪ��Ѥ�K�A���F�F��N���a�C
		GiveBodyItem(OwnerID(),201753,10)
	else
		CloseSpeak(Obj)
	end
end 



--================================================================================
--�P�O�Ю֤߹��(�b�Z�\�w)
--================================================================================
function LuaZ13WS_423848_117653()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423848)==true		and
		CheckCompleteQuest(OwnerID(),423848)==false	and
		Checkflag(OwnerID(),544778)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423848_0]","LuaZ13WS_423848_117653_1",0)
		--�A�ҿת��ؼЬO����H	--
	end 
end

function LuaZ13WS_423848_117653_1()
	SetSpeakDetail(OwnerID(),"[SC_423848_1]")	
	--�ؼЧY�^�O��ͩR�餺���T�ҲŤ�A�R���T�ҲŤ媺�J�D�w�w�]�ڡC
	--�Ĥ@�ؼСA�O�q���Ŭ����צM�I���T�ҲŤ�C�Ҧb�a�I���F2687...��458...�n10058...�_54�A�W�X�{���a�ϰO�����~�A��T�����A�L�k�P�w�C
	--�[�e�T�ҲŤ��q�����зǡA���s���y��ù���S�q�A�}�l......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423848_2]","LuaZ13WS_423848_117653_2",0)
	--�q�W���A���ؼСH
end 


function LuaZ13WS_423848_117653_2()

	BeginPlot(TargetID(),"LuaZ13WS_423848_117653_3",0)
--say(OwnerID(),"0..0")
--say(TargetID(),"1..1")
	CloseSpeak(OwnerID())
end

function LuaZ13WS_423848_117653_3()
--say(OwnerID(),"0..0")
--say(TargetID(),"3..3")
	Say(OwnerID(),"[SC_423848_3]")
	--�͹͹͡I�ĤG�ؼеo�{�I�O�q���Ŭ����צM�I�C
	Sleep(30)
	Say(OwnerID(),"[SC_423848_4]")
	--�H�{���a�Ϥ��R�A�b�H�B���������C���ܦM�I���Ť��ؼЦ@�j�M��257��...�͹͹�......
	Sleep(40)
	Say(OwnerID(),"[SC_423848_5]")
	--�P�_���A�Ĥ@�ؼЦM�I���Ű���ĤG�ؼСA�Ĥ@�ؼ���o�u���B�m�ƧǡC��l�ؼмȮɤ����l�ܡC
	SetFlag(TargetID(),544778,1)
	
	
end 




