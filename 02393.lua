----424216 �ϸ`���U��
function LuaAS_424216_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424216) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_01]","LuaAS_424216_02",0) 	----�u�j�N�x�v�����Ʊ�A�ɧֱҵ{�X�Ϧ�ΡA
	end
end

function LuaAS_424216_02()
	SetSpeakDetail(OwnerID(),"[SC_424216_02]") 	----�o�Ӯɴ��X�Ϧ��...�H
	SetFlag(OwnerID(),545101,1)
end

function LuaAS_424216_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424216) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_03]","LuaAS_424216_04",0) 	----�u�j�N�x�v�����Ʊ�A�ɧֱҵ{�X�ϮL�h��
	end
end

function LuaAS_424216_04()
	SetSpeakDetail(OwnerID(),"[SC_424216_04]") 	----�n�ڥX�ϮL�h���H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_05]","LuaAS_424216_05",0)  	----�O���A�ڨS��ť���C
end

function LuaAS_424216_05()
	SetSpeakDetail(OwnerID(),"[SC_424216_06]") 	----�o�˧r...�n�a�A�ڷ|�ɧ֫e���L�h���F���ϩR�C
	SetFlag(OwnerID(),545102,1)
end

function LuaAS_424216_06()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424216) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_08]","LuaAS_424216_07",0) 	----�u�j�N�x�v�����Ʊ�A�ɧֱҵ{�X�ϵܼ}��
	end
end

function LuaAS_424216_07()
	SetSpeakDetail(OwnerID(),"[SC_424216_09]") 	----�n�ڨ�ܼ}���ܡH
	SetFlag(OwnerID(),545104,1)
end

----424217  �U�����ǳ�
function LuaAS_424217_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424217) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424217_01]","LuaAS_424217_02",0) 	----�j�N�x�����n�ڨӸ߰ݩp�O�_�w�����p���u�@�C
	end
end

function LuaAS_424217_02()
	SetSpeakDetail(OwnerID(),"[SC_424217_02]") 	----���H
	SetFlag(OwnerID(),545105,1)
end

function LuaAS_424217_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424217) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424217_01]","LuaAS_424217_04",0) 	----�j�N�x�����n�ڨӸ߰ݩp�O�_�w�����p���u�@�C
	end
end

function LuaAS_424217_04()
	SetSpeakDetail(OwnerID(),"[SC_424217_03]") 	----��...�A�ݿ��H�F�A�ڭt�d���u�@�ä��O�o�ӡC
end

----424220  �V�乪
function LuaAS_424220_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_02",0) 	----�аݱz��X�L�@�ƪ��ݪk�H
	end
end

function LuaAS_424220_02()
	SetSpeakDetail(OwnerID(),"[SC_424220_02]") 	----�گ���հ��U�Q�O�@�H�����߱�
	SetFlag(OwnerID(),545108,1)
end

function LuaAS_424220_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_04",0) 	----�аݱz��X�L�@�ƪ��ݪk�H
	end
end

function LuaAS_424220_04()
	SetSpeakDetail(OwnerID(),"[SC_424220_03]") 	----�L�h���@���O�ӴL���ͩR����a
	SetFlag(OwnerID(),545109,1)
end

function LuaAS_424220_05()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_06",0) 	----�аݱz��X�L�@�ƪ��ݪk�H
	end
end

function LuaAS_424220_06()
	SetSpeakDetail(OwnerID(),"[SC_424220_04]") 	----�p�ɭԥ��˱Чڥ��y��
	SetFlag(OwnerID(),545110,1)
end

function LuaAS_424220_07()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_08",0) 	----�аݱz��X�L�@�ƪ��ݪk�H
	end
end

function LuaAS_424220_08()
	SetSpeakDetail(OwnerID(),"[SC_424220_05]") 	----�_���y�H�b�X��e
	SetFlag(OwnerID(),545111,1)
end

----424224  �ϸ`�Ϊ�����
function LuaAS_424224_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424224) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424224_01]","LuaAS_424224_02",0) 	----���⪺�G��O�֮��L�Ӫ��H
	end
end

function LuaAS_424224_02()
	SetSpeakDetail(OwnerID(),"[SC_424224_02]") 	----���ϸ`�θg�L�ƥ����S���a��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424224_03]","LuaAS_424224_03",0) 	----(�N���礧�G���u�ۧi�D�L�C)
end

function LuaAS_424224_03()
	SetSpeakDetail(OwnerID(),"[SC_424224_04]") 	----����I�H
	SetFlag(OwnerID(),545114,1)
end

----424228  ���礧�G���U��
function LuaAS_424228_01()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ) 	----�ڷQ�ݬݧA�檺�F��
	if 	CheckAcceptQuest(OwnerID(),424228) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424228_01]","LuaAS_424228_02",0) 	----�A�̬O���O����@�إ~���A�����G��H
	end
end

function LuaAS_424228_02()
	SetSpeakDetail(OwnerID(),"[SC_424228_02]") 	----�ڡA�A�O�����ǡu���礧�G�ܡv�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424228_03]","LuaAS_424228_03",0) 	----�°⯫�礧�G���ӤH�ܱ`�ӶܡH
end

function LuaAS_424228_03()
	SetSpeakDetail(OwnerID(),"[SC_424228_04]") 	----�S���A�L�T�w�b�Ӥ�|�X�{�@��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424228_05]","LuaAS_424228_04",0) ----���W�ӤH�W���Ө���g�C���O����ɭԡH
end

function LuaAS_424228_04()
	SetSpeakDetail(OwnerID(),"[SC_424228_06]") 	----�ڷQ�Q
	SetFlag(OwnerID(),545095,1)
end

----424231  �M�h�����n
function LuaAS_424231_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424231) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_01]","LuaAS_424231_02",0) 	----�A�٦n�ܡH
	end
end

function LuaAS_424231_02()
	SetSpeakDetail(OwnerID(),"[SC_424231_02]") 	----�ڪ��D�{�b���ȴ���
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_03]","LuaAS_424231_03",0) 	----��...�γ\�A�@�N����ťť�A���дo�H
end

function LuaAS_424231_03()
	SetSpeakDetail(OwnerID(),"[SC_424231_04]") 	----���§A�A�S�Ϥj�H�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_05]","LuaAS_424231_04",0) 	----��o�ؤ��ʷ��᪺�k�H�A�A���Ӧp�����ۡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_07]","LuaAS_424231_05",0) 	----�R�N�O�n�]�e�L���@���A�L���w�g�O�A���d�l�F�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_09]","LuaAS_424231_06",0) 	----......
end

function LuaAS_424231_04()
	SetSpeakDetail(OwnerID(),"[SC_424231_06]") 	----�i�O�A�A����
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_07]","LuaAS_424231_05",0) 	----�R�N�O�n�]�e�L���@���A�L���w�g�O�A���d�l�F�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_09]","LuaAS_424231_06",0) 	----......
	SetFlag(OwnerID(),545097,1)
end

function LuaAS_424231_05()
	SetSpeakDetail(OwnerID(),"[SC_424231_08]") 	----�ک��աA�ڤ]�Q�o��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_05]","LuaAS_424231_04",0) 	----��o�ؤ��ʷ��᪺�k�H�A�A���Ӧp�����ۡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_09]","LuaAS_424231_06",0) 	----......
	SetFlag(OwnerID(),545097,1)
end

function LuaAS_424231_06()
	SetSpeakDetail(OwnerID(),"[SC_424231_10]") 	----�S�Ϥj�H�A�A�γ\�Oı�o�ګܶ�
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_05]","LuaAS_424231_04",0) 	----��o�ؤ��ʷ��᪺�k�H�A�A���Ӧp�����ۡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_07]","LuaAS_424231_05",0) 	----�R�N�O�n�]�e�L���@���A�L���w�g�O�A���d�l�F�C
	SetFlag(OwnerID(),545097,1)
end

------�ǰe
function LuaS_424213_GotoZone_15_start()
	if 	CheckAcceptQuest(OwnerID(),424213) == true		then
		SysCastSpellLv(OwnerID(),OwnerID(),495735,1)  	
		ChangeZone(OwnerID() , 15 , 0 , -3996.7 , 14.0 , 5048.0 , 255.3)
	end
end

function LuaS_424223_GotoZone_20_start()
	if 	CheckAcceptQuest(OwnerID(),424223) == true 	then
		SysCastSpellLv(OwnerID(),OwnerID(),495735,1)  
		ChangeZone(OwnerID() , 20 , 0 , -11860.0 , 778.6 , 42152.4 , 50.5)
	end
end

------424223 �e�����g�C��
function LuaAS_424223_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424223) == true 	and
		CountBodyItem(OwnerID(),209473) == 0 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424213_01]","LuaAS_424223_02",0)
	end
	if 	CheckAcceptQuest(OwnerID(),424214) == true 	and
		CountBodyItem(OwnerID(),209413) == 0 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424214_01]","LuaAS_424214_01")
	end
end

function LuaAS_424223_02()
	SetSpeakDetail(OwnerID(),"[SC_424223_01]")
	GiveBodyItem(OwnerID(),209473,1)
end

function LuaAS_424214_01()
	SetSpeakDetail(OwnerID(),"[SC_424214_02]")
	GiveBodyItem(OwnerID(),209413,1)
end