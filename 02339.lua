----424069�ʱK�@��
function LuaAS_424069_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424069) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424069_01]","LuaAS_424069_02",0) 	--�N�ѧO�Ү����L��
	end
end

function LuaAS_424069_02()
	SetSpeakDetail(OwnerID(),"[SC_424069_02]") 	--......���M�G�o�F�I
	SetFlag(OwnerID(),544873,1)
	if 	CheckFlag(OwnerID(),544873) == true 	and 	CheckFlag(OwnerID(),544874) == true 	and 	CheckFlag(OwnerID(),544875) == true 	then
		SetFlag(OwnerID(),544876,1)
	end
end

function LuaAS_424069_03()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424069) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424069_01]","LuaAS_424069_04",0) 	--�N�ѧO�Ү����L��
	end
end

function LuaAS_424069_04()
	SetSpeakDetail(OwnerID(),"[SC_424069_03]") 	--(�L�ݤF�@���ѧO�ҡA���Y���K��)
	SetFlag(OwnerID(),544874,1)
	if 	CheckFlag(OwnerID(),544873) == true 	and 	CheckFlag(OwnerID(),544874) == true 	and 	CheckFlag(OwnerID(),544875) == true 	then
		SetFlag(OwnerID(),544876,1)
	end
end

function LuaAS_424069_05()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424069) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424069_01]","LuaAS_424069_06",0)	--�N�ѧO�Ү����L��
	end
end

function LuaAS_424069_06()
	SetSpeakDetail(OwnerID(),"[SC_424069_04]") 	--(�ݨ��ѧO�ҫ�A�L��M���Y�h��)
	SetFlag(OwnerID(),544875,1)
	if 	CheckFlag(OwnerID(),544873) == true 	and 	CheckFlag(OwnerID(),544874) == true 	and 	CheckFlag(OwnerID(),544875) == true 	then
		SetFlag(OwnerID(),544876,1)
	end
end

----424077�{�ɶǰT��
function LuaAS_424077_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424077) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424077_01]","LuaAS_424077_02",0) 	--�~�������ƶ����n�ڨӸ߰ݫe�u���p�C
	end
end

function LuaAS_424077_02()
	SetSpeakDetail(OwnerID(),"[SC_424077_02]") 	--�A�i�ש�ӤF�I���٦b�Q��򳣨S�H�ӧ�ڸ߰ݾԪp�O...
	GiveBodyitem(OwnerID(),209280,1)
	SetFlag(OwnerID(),544893,1)
end

----424078�M�I����
function LuaAS_424078_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 1 		then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_01]","LuaAS_424078_02",0) 	--�~�������ƶ����n�ڨӲM�I����C
	end
end

function LuaAS_424078_02()
	SetSpeakDetail(OwnerID(),"[SC_424078_02]")	--�O�I�ثe�s�@���m�u�{�Ϊ�����s�q�S�����D...
	SetFlag(OwnerID(),544894,1)
end

function LuaAS_424078_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 1 		then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_01]","LuaAS_424078_04",0)
	end
end

function LuaAS_424078_04()
	SetSpeakDetail(OwnerID(),"[SC_424078_04]") 	--�O�I�ڭ̪��ƥΪZ���νb���Y������...
	SetFlag(OwnerID(),544895,1)
end

function LuaAS_424078_05()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 1 		then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_01]","LuaAS_424078_06",0)
	end
end

function LuaAS_424078_06()
	SetSpeakDetail(OwnerID(),"[SC_424078_03]") 	--���§A�̪�����...
	SetFlag(OwnerID(),544896,1)
end

function LuaAS_424078_07()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 0 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_05]","LuaAS_424078_08",0)
	end
end

function LuaAS_424078_08()
	SetSpeakDetail(OwnerID(),"[SC_424078_06]")
	GiveBodyItem(OwnerID(),209282,1)
end
----424080�s���o�{
function LuaAS_424080_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424080) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424080_01]","LuaAS_424080_02",0) 	--�ڷQ���D�O�вť۸ԲӪ����p�C
	end
end

function LuaAS_424080_02()
	SetSpeakDetail(OwnerID(),"[SC_424080_02]") 	--����O�вťۥثe�����p
	SetFlag(OwnerID(),544902,1)
end

Function LuaAS_14_Sleeping()
	AddBuff ( OwnerID(), 509062, 0,-1 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
end