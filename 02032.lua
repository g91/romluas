
-------------���b116269�ɥ����v�������W  �H�K���a���Ʈ������ܫH��--------------------
function LuaS_116269()
LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_1]", "Luas_116269_STORY_1", 0 )	--A1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_7]", "Luas_116269_STORY_3", 0 )
--	if	CheckCompleteQuest( OwnerID(), 423571 )==true and CountBodyItem ( OwnerID(), 208129 )==0 then 
		--���a�ѹL423571��^�F�ԥ������ȡA�B�S�����ܫH�� ����
--		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_1]", "Luas_116269_1", 0 )--�ڧ�H��˥�F
--	end
	--if	CheckCompleteQuest( OwnerID(), 423568 )==false and CheckCompleteQuest( OwnerID(), 423513 )==true 
	--	and CountBodyItem ( OwnerID(), 208130 )==0 then 
		--���a�S���ѹL423568�^���A�����Ȧ����ѧ��̽u��423513�����ƪ��U������(�����̽u���ѡA��u�S��)
	--	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_1]", "Luas_116269_1", 0 )--�ڧ�H��˥�F
	--elseif 
	--	CheckCompleteQuest( OwnerID(), 423513 )==false and CheckCompleteQuest( OwnerID(), 423568 )==true 
	--	and CountBodyItem ( OwnerID(), 208129 )==0 then 
		--���a�S���ѹL423513�����ƪ��U�����Ȧ����ѧ���u��423568�^���A������(������u���ѡA�̽u�S��)
	--	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_1]", "Luas_116269_2", 0 )--�ڧ�H��˥�F
	--end	
end

--function LuaS_116269_1()
--	SetSpeakDetail(OwnerID(),"[SC_116269_0]")
--	GiveBodyItem ( OwnerID(), 208130, 1 )--�����o�ʫH�O����u�S�Ѫ����a���ܫH��
--end

--function LuaS_116269_2()
--	SetSpeakDetail(OwnerID(),"[SC_116269_0]")
--	GiveBodyItem ( OwnerID(), 208129, 1 )--�����o�ʫH�O���̽u�S�Ѫ����a���ܫH��
--end

function Luas_116269_STORY_1()	--
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_2]")--Q1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_4]", "Luas_116269_STORY_2", 0 )--�U�@��A2
end

function Luas_116269_STORY_2()	--
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_5]")--Q2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_7]", "Luas_116269_STORY_3", 0 )--�U�@��A3
end

function Luas_116269_STORY_3()	--
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_8]")--Q3
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_9]", "Luas_116269_STORY_3_1", 0 )--�U�@��A3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_17]", "Luas_116269_STORY_3_2", 0 )--�U�@��A3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_21]", "Luas_116269_STORY_3_3", 0 )--�U�@��A3-3
end

function Luas_116269_STORY_3_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_10]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_11]", "Luas_116269_STORY_3_1_1", 0 )--�U�@��A3-1-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_1_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_13]")--Q3-1-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_14]", "Luas_116269_STORY_3_1_2", 0 )--�U�@��A3-1-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_1_2()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_15]")--Q3-1-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_2()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_18]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_19]", "Luas_116269_STORY_3_2_1", 0 )--�U�@��A3-2-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_2_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_20]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_3()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_22]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_23]", "Luas_116269_STORY_3_3_1", 0 )--�U�@��A3-3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_24]", "Luas_116269_STORY_3_3_2", 0 )--�U�@��A3-3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_3_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_25]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_24]", "Luas_116269_STORY_3_3_2", 0 )--�U�@��A3-3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end

function Luas_116269_STORY_3_3_2()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_26]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_23]", "Luas_116269_STORY_3_3_1", 0 )--�U�@��A3-3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--�^��Q3
end