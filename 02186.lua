----�M���¯١B�_�ɤf�U�}�}
function LuaS_423732_01()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��	
	if	CheckAcceptQuest(OwnerID(),423732) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_02]","LuaS_423732_02",0)	----(�߰�����f�U�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_04]","LuaS_423732_03",0)	----(�߰�����ħL�C)
	end

end

function LuaS_423732_02()
	SetSpeakDetail(OwnerID(),"[SC_423730_03]")	----�p�G�ӤH�Ȥj���A�f�U�N�|�ܤj�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_04]","LuaS_423732_03",0)	----(�߰�����ħL�C)
end

function LuaS_423732_03()
	SetSpeakDetail(OwnerID(),"[SC_423730_05]")	----��A��I�o�ǥi�c���H���ħL�A���F���}���ӤH���ۤv�Z�����j�A�����}���ӤH��j�����ΥL�̡A���G�L���٤��O�Q�Ǫ����o����y���F�ڡI
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_02]","LuaS_423732_02",0)	----(�߰�����f�U�C)
end


----���Ѩ�U
function LuaS_423724_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423724) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_01]","LuaS_423724_02",0)	----(�߰ݬ�����ݭn���r��C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_03]","LuaS_423724_03",0)	----(�߰ݥh���̧���r��C)
	end
end

function LuaS_423724_02()
	SetSpeakDetail(OwnerID(),"[SC_423724_02]")	----�A���ӯ�ݨ�ڦ��ܦh�̥S�����ˤF�a�H������í�w�L�̪��˶աA�p�G�}�l�o�N�N�V�F�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_03]","LuaS_423724_03",0)	----(�߰ݥh���̧���r��C)
end

function LuaS_423724_03()
	SetSpeakDetail(OwnerID(),"[SC_423724_04]")	----[ZONE_QUIET_HOWL_PLAINS]�W��B�����A�u�O���񩹩����Ǫ����ۧڭ̡A�_�h�ڦ��N�h�Ħ^�ӵ��̥S�̪v�ˤF�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_01]","LuaS_423724_02",0)	----(�߰ݬ�����ݭn���r��C)
end

----���˪�������
function LuaS_423712_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423712) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423712_01]","LuaS_423712_02",0)	----(�߰ݨƱ��g�L�C)
	end
end

function LuaS_423712_02()
	SetSpeakDetail(OwnerID(),"[SC_423712_02]")	----�����h�u�@���e�A�⪨�����o������e���ڡA���ڷQ�������ɭԥi�H���X�����C�����۶���X�����A���G�஦�ݨ��N�⥦�m���F�A���ð_�ӡC......
end


----����I�óB
function LuaS_423713_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423713) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_01]","LuaS_423713_02",0)	----(�߰ݥL��[116987]�������åh���̡H)
	end
end

function LuaS_423713_02()
	SetSpeakDetail(OwnerID(),"[SC_423713_02]")	----(�L�@�y���b�G���ˤl)������ڡH���j��ť���Sť�L�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_03]","LuaS_423713_03",0)	----([116987]���A��o�����害���F�C)
end

function LuaS_423713_03()
	SetSpeakDetail(OwnerID(),"[SC_423713_04]")	----(�L�������ݡA���Y��a�������A�y�O�V�@��)���ӨS���������å�A���j�ݤ~�i�o�ʦo���F��C�ڨS���ö���A�S���N�O�S���I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_05]","LuaS_423713_04",0)	----(...�A�A�����A�ڴN�n[116569]��A�쨫�I)
end

function LuaS_423713_04()
	SetSpeakDetail(OwnerID(),"[SC_423713_06]")	----(�஦�@ť�y�������ର�`�ȡA���n�j��)��z...�I�ڤ��n�Q�쨫...�I�ڤ��n�Q[116569]�쨫��...�I�n�i�ȳ�...����...����...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_07]","LuaS_423713_05",0)	----(���֧i�D�ڡA[116987]������A�åh���H)
end

function LuaS_423713_05()
	SetSpeakDetail(OwnerID(),"[SC_423713_08]")	----���...�ڧѰO�F��...�ڥu�O�o�ڦb���l�~���H�K��F�@�ʾ�U�A���F�}�N�I�i�h�F...���ʾ�ڤ����D�F��...���n���ڳQ[116569]�쨫��...��z...
end


----����ܳ���
function LuaS_423715_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423715) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423715_02]","LuaS_423715_02",0)	----(�Щp�N�R�A�گ�z�ѩp���߱��A���O�p�w�g...)
	end
end

function LuaS_423715_02()
	SetSpeakDetail(OwnerID(),"[SC_423715_03]")
end


----���d����
function LuaS_423722_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423722) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423722_01]","LuaS_423722_02",0)	----(�߰ݦ�����������]�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423722_03]","LuaS_423722_03",0)	----(�߰ݦ������a�I�C)
	end
end

function LuaS_423722_02()
	SetSpeakDetail(OwnerID(),"[SC_423722_02]")	----�ڷQ���}�o�ӨcŢ�A���O�H�ڪ����骬�p�A�ڥ��L�k��Vĵ�ê����޺��A�^��[ZONE_CAMPBELL_TOWNSHIP]�C......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423722_03]","LuaS_423722_03",0)	----(�߰ݦ������a�I�C)
end

function LuaS_423722_03()
	SetSpeakDetail(OwnerID(),"[SC_423722_04]")	----�b[ZONE_QUIET_HOWL_PLAINS]���R�K�������ӷ��A�A�쨺�̱ĺK�Q��[208547]�A�b��[ZONE_MYZENA_CITY]�����W���y����[208548]�^�ӵ��ڴN�n�F�C
	AddSpeakOption(OwnerID().TargetID(),"[SC_423722_01]","LuaS_423722_02",0)	----(�߰ݦ�����������]�C)
end


----���y����t�̭�

------�Ϊ�����
function LuaS_423740_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423740) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_02",0)	----(�߰ݳ��y��t�̡C)
	end
end

function LuaS_423740_02()
	SetSpeakDetail(OwnerID(),"[SC_423740_02]")	----�L�̬O�b�U���`�ؤ���t������諸��t�̡A��_�@�몺��t�̡A���ӥ��U�������B�����ת��t�X�A�O���Ϊ�ź�ơC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_03]","LuaS_423740_03",0)	----(�߰ݳ��y��t�̪��t�X�ɬq�C)
end

function LuaS_423740_03()
	SetSpeakDetail(OwnerID(),"[SC_423740_04]")	----���γ̤ޥH���ƪ���t�̭̥��ɬO���|�b�����Τ��ѻP��t�`�ت��A�u���b�S��ɸ`�B�Ϊ̥L�̥��H�n�D�ɤ~�����|�ݨ�L�̺�����t�X�C
	SetFlag(OwnerID(),544651,1)
end

------�[������
function LuaS_423740_04()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423740) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_05",0)	----(�߰ݳ��y��t�̡C)
	end
end

function LuaS_423740_05()
	SetSpeakDetail(OwnerID(),"[SC_423740_05]")	----�L�̪���t�u�o�ܺ���I�ڬݤF�@�����A�v�u�̴ͤ��v����t��A�N�����F�����Ϊ������[���I......
	SetFlag(OwnerID(),544652,1)
end

function LuaS_423740_06()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_07",0)	----(�߰ݳ��y��t�̡C)
end

function LuaS_423740_07()
	SetSpeakDetail(OwnerID(),"[SC_423740_06]")	----�C�@�쪺�`�س��ܴΡA���ڳ̷R���٬O�]�N�v�u�´U�v����t�C......
end

function LuaS_423740_08()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_09",0)	----(�߰ݳ��y��t�̡C)
end

function LuaS_423740_09()
	SetSpeakDetail(OwnerID(),"[SC_423740_07]")	----�ڭ̮a�ڥ@�N���ܳ��w�����Ϊ���t�A�ר�O����˳˳�̭̪��t�X�A�`�O���ڭ̤j�}���ɡC
end

------�`���
function LuaS_423740_10()
	if	CheckAcceptQuest(OwnerID(),423740) == true 	and
		CheckFlag(OwnerID(),544651)==true	and
		CheckFlag(OwnerID(),544652)==true	then
		SetSpeakDetail(OwnerID(),"[SC_423740_08]") 	----�A����ť����ǨƱ��ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_09]","LuaS_423740_11",0)	----(�i�D�L�����]�N�v�u�´U�v�����ݡC)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_11]","LuaS_423740_12",0)	----(�i�D�L�������A�v�u�̴ͤ��v�����ݡC)
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_423740_11()
	SetSpeakDetail(OwnerID(),"[SC_423740_10]")	----�ڴ��ݹL�L����t�C�����U�l���G�`�������A�n�����ޤ���F�賣�i�H�q�U�l�̶]�X�ӡA��L���ʤ��O�ɴN���_�ݵo�͡C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_11]","LuaS_423740_12",0)	----(�i�D�L�������A�v�u�̴ͤ��v�����ݡC)
end

function LuaS_423740_12()
	SetSpeakDetail(OwnerID(),"[SC_423740_12]")	----�_��...�n��������e���q�����{�L...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_13]","LuaS_423740_13",0)	----(�߰ݤ`����p�C)
end

function LuaS_423740_13()
	SetSpeakDetail(OwnerID(),"[SC_423740_14]")	----�ڭ�踣���{�L�̴ͤ����b�ڭ��e�A���ۭ��M�S�X�������e���A��������O�Ф�����ı�o�D�`�`��......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_15]","LuaS_423740_15",0)	----(�A�٦n�ܡH)
end

function LuaS_423740_15()
	local Obj = OwnerID()
	SetSpeakDetail(Obj,"[SC_423740_16]")	----...�ڷQ��...�w�g�Q�_�ڦ��`���L�{�F�C......
	AddSpeakOption(Obj,Obj,"[SC_423740_17]","LuaS_423740_16", 0 )
end

function LuaS_423740_16()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
end

----���ߵL�O
function LuaS_423727_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423727) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423727_01]","LuaS_423727_02",0)	----(�߰ݵL�O����]�C)
	end
end

function LuaS_423727_02()
	SetSpeakDetail(OwnerID(),"[SC_423727_02]")	----�̪�o�X�~���ɷ|ı�o����S�O�֡A�H���O�ͤF�f�A���G��ͫo���ڨ���n�o�ܡC......
end

----�n�쬡��
function LuaS_423736_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423736) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423736_01]","LuaS_423736_02",0)	----(�ް_�L���`�N�C)
	end
end

function LuaS_423736_02()
	SetSpeakDetail(OwnerID(),"[SC_423736_02]")	----�K�I�A�b......��A��ӬO�A�ڡIť�ۡA�ګܷP�E�A���ڪ����A���O�A�i�H���n���Z�ڪ���s�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423736_03]","LuaS_423736_03",0)	----(�߰ݥL����s���e�C)
end

function LuaS_423736_03()
	SetSpeakDetail(OwnerID(),"[SC_423736_04]")	----�ڦb......�c�A���ڤ��ӷQ�ԲӸ������Ať�A�]����ı�o�����ѴN�¤F�C�`���A�ڦb���R������o�ǳå릺��S�|���_�ӡIť�_�ӴN�ܼF�`��a�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423736_05]","LuaS_423736_04",0)	----(�߰ݬO�_���i�i�C)
end

function LuaS_423736_04()
	SetSpeakDetail(OwnerID(),"[SC_423736_06]") 	----�ڬO���h�çA�O�_�u����z��......
end


----���Ū�������
function LuaS_423756_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423756) == true 		and
		CheckCompleteQuest(OwnerID(),423756) == false	and
		(CountBodyItem(OwnerID(),208557)) < 1			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423756_01]","LuaS_423756_02",0) 	----(�ڧ�f���˥�F......)
	end
end

function LuaS_423756_02()
	SetSpeakDetail(OwnerID(),"[SC_423756_02]")  	----�˥�F�H�u���A�S��k......
	GiveBodyItem(OwnerID(),208557,1)
end

----�ϤH�n��B���Ī��Ѭr��k
function LuaS_423718_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423718) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423718_01]","LuaS_423718_02",0) 	----(�߰ݬ�����ݭn�į�C)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423718_03]","LuaS_423718_03",0) 	----(�߰ݭ��̥i�H���Ѭr��C)
	end
	if	CheckAcceptQuest(OwnerID(),423720) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423720_01]","LuaS_423720_02",0) 	----(�߰ݦ����j��r�n���z�ѡC)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423720_03]","LuaS_423720_03",0) 	----(�߰ݻj��r�n�����o�a�I�C)
	end
end

function LuaS_423718_02()
	SetSpeakDetail(OwnerID(),"[SC_423718_02]") 	----�ڭ̦�O�J��s�Φb���B��s[ZONE_BLACK_MARSH_TEMPLE]�A�����b�լd�L�{���A���\�h�H�b[ZONE_LAKESIDE_CEMETERY]����D��[104861]�������C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423718_03]","LuaS_423718_03",0) 	----(�߰ݭ��̥i�H���Ѭr��C)
end

function LuaS_423718_03()
	SetSpeakDetail(OwnerID(),"[SC_423718_04]") 	----�Ѭr��N�ͪ��b�ªh��`�A�ä��O�D�`����A�·Ъ��O���Ǧb���䪺�s���C
end

function LuaS_423720_02()
	SetSpeakDetail(OwnerID(),"[SC_423720_02]") 	----�Ѭr��u��ΨӼȽw�r�ʵo�@�A�n�M�����W���ͬr�N�����t�M�L�k�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423720_03]","LuaS_423720_03",0) 	----(�߰ݻj��r�n�����o�a�I�C)
end

function LuaS_423720_03()
	SetSpeakDetail(OwnerID(),"[SC_423720_04]") 	----[ZONE_BLACK_MARSH_TEMPLE]���񦳳\�h[104704]�A�A�q�e�̨��W�N����o�r�n�A���L�b�������L�{���n�`�N�e�̪������C
end

----���R
function LuaAS_Dance_01()
	While 1	do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
		Sleep(35)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_DANCE)
		Sleep(50)
	end
end

----����
Function LuaAS_Sleeping()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
	while 	1 	do
		NPCSAY(OwnerID(),"[SC_423724_05]")
		Sleep(150)
		NPCSAY(OwnerID(),"[SC_423724_06]")
		Sleep(150)
	end
end

function LuaAS_Sleeping_01()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
	while 	1 	do
		NPCSAY(OwnerID(),"[SC_423724_06]")
		Sleep(100)
		NPCSAY(OwnerID(),"[SC_423724_07]")
		Sleep(100)
	end
end

----���

function LuaAS_423758_01()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_01]","LuaAS_423758_02",0) 	----(�߰ݧ������p���L�h�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_03]","LuaAS_423758_03",0) 	----(�߰ݴ�`�Ӷ�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_05]","LuaAS_423758_04",0) 	----(�߰ݤ�G�����ΡC)
end

function LuaAS_423758_02()
	SetSpeakDetail(OwnerID(),"[SC_423758_02]") 	----���g�b�o���g�a�W�A�_�Ǫ��E�̾��A���ެO�ֳ���o���p����L���A�\�h�H�_�Q���ʩR�]�����u�A�]�y���F�\�h�o�󪺧��l�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_03]","LuaAS_423758_03",0) 	----(�߰ݴ�`�Ӷ�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_05]","LuaAS_423758_04",0) 	----(�߰ݤ�G�����ΡC)
end

function LuaAS_423758_03()
	local Obj = OwnerID()
	if	CheckCompleteQuest(Obj,423758)==true	then
		SetSpeakDetail(OwnerID(),"[SC_423758_07]")--�������ȫ�
	else
		SetSpeakDetail(OwnerID(),"[SC_423758_04]") 	----�Ӯy�Ӷ�O���F�����b�T�ʦ~�h�e�A���F����E�̽����o���ѡA�����f�u���J�|���D��ԤҤ֥D�ӫءC
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_01]","LuaAS_423758_02",0) 	----(�߰ݧ������p���L�h�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_05]","LuaAS_423758_04",0) 	----(�߰ݤ�G�����ΡC)
end

function LuaAS_423758_04()
	SetSpeakDetail(OwnerID(),"[SC_423758_06]") 	----��G�����Υѧڭ̮�Ԥҥj���������D��Ԥһ�D�ҥX��إߪ��`�n�������ΡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_01]","LuaAS_423758_02",0) 	----(�߰ݧ������p���L�h�C)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_03]","LuaAS_423758_03",0) 	----(�߰ݴ�`�Ӷ�C)
end