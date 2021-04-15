function LuaI_Z15_TO_Z209_0()
	SetPlot( OwnerID() , "range" , "LuaI_Z15_TO_Z209_1" , 50 )
end

function LuaI_Z15_TO_Z209_1()
	ChangeZone( OwnerID() , 209 , 0 , 135 , 858 , -820 , 90 )
end

function LuaI_Z209_TO_Z15_0()
	SetPlot( OwnerID() , "range" , "LuaI_Z209_TO_Z15_1" , 50 )
end

function LuaI_Z209_TO_Z15_1()
	ChangeZone( OwnerID() , 15 , 0 , -2908 , -97 , 7247 , 360 )
end

function LuaI_Z209_TO_DNG_0()
	SetPlot( OwnerID() , "range" , "LuaI_Z209_TO_DNG_1" , 70 )
end

function LuaI_Z209_TO_DNG_1()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_209_TO_DNG_ERROR]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_209_TO_DNG_ERROR]" , 0 )
end

--�F�ԥ����P���`�ۭn�붡���ǰe�@��

function LuaS_114776_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114776_0]" , "LuaS_114776_1", 0 ) --�аe�ڥh�F�ԥ�������
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114776_1]" , "LuaS_114776_2", 0 ) --�߰ݶ��`�M�h�Ψӳo�̪���]
	if CheckCompleteQuest( OwnerID() , 422969 ) == true then
		AddSpeakOption( OwnerID() , TargetID()  , "[SC_114776_2]" , "LuaS_114776_3", 0 ) --�߰ݦo�P[114509]���������Y
	end
end

function LuaS_114776_1()
	CloseSpeak(OwnerID())
	ChangeZone( OwnerID() , 6 , 0 , -20623 , -179 , 4212 , 45 )
end

function LuaS_114776_2()
	SetSpeakDetail( OwnerID(), "[SC_114776_3]" ) 
	--�{�b�F�ԥ������ꪺ�L�O�ä����H�ѨM�P�D���x���A�ӧڭ̶��`�M�h�άO�@�ɤW�̤j���ħL��´�A�L�̧�W�ڭ̬O�z�ҷ�M���Ʊ��C
	--�ܬO�o�˻��աI�����ڭ��M�h�θ̭����ܦh���ѳ��O�Ӧ۩�o�Ӱ�a�A�L�̹��o���g�a�٬O���P���A�ҥH�o�����X�@���ܤj�@�����]�O�L�̪��N��C
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114776_0", 0 ) 
end

function LuaS_114776_3()
	SetSpeakDetail( OwnerID(), "[SC_114776_4]" ) 
	--��H�A�J��ڧ̧̤F�ڡH
	--�L�����H�Y�h�a�I���ڭ̳ͦ]���a�ڦb�L�h�N���}�F�ĺ����j���A�ø��H��[110317]�Ϊ��b[ZONE_YGGNO LAND]�إ߷s���a��C
	--���L�ڧ̧̥i��q�p�Nť�ݷ����Ӧh�F�ԥ����y�Ǫ��^���G�ơA���j�ỡ�n�l�D����y�M�h�믫���_���z�N���}�a�̡C
	--��ӥL�N��F�o�̡Ať���{�b�b����M�h�θ����Z�����Ϊ��C
	--��......
	--���e�����]�o�{�L�����\�h�A���L���Ѷ̫l�ˤ@�I�]�S�ܡC
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114776_0", 0 ) 
end

function LuaS_114777_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114777_0]" , "LuaS_114777_1", 0 ) --�߰ݹF�ԥ������ꪺ�Ʊ�
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114777_1]" , "LuaS_114777_2", 0 ) --�аe�ڥh�F�ԥ�������
end

function LuaS_114777_1()
	SetSpeakDetail( OwnerID(), "[SC_114777_2]" ) 
	--�ڭ̹F�ԥ�������O�֦��y�[���v����a�A�ڭ̪���ɪ��~�ӤF�aģ���H���y�d�ĩi�z����ߡA�ӧڭ̦U��D�ꪺ�H���]�O��ɭ^������ǡC
	--�b�aģ���H���y�d�ĩi�z�����z���U�A�ڭ̰�a�O�@�ӦU�ؤH�ة����Ĭ��۳B����סA�]�O�u���A�ѥH�εo���y�M�h�믫�z���a��......�y�y......
	--���L�����ڭ̪����v�Ӥ[�F�A���ǳ·ШƱ��`�O�|�o�ͪ�......
	--���F��_�L�h���aģ�A�ڭ̻ݭn�A�̳o�Ǫ��W�_�I�̪��O�q�C
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114777_0", 0 ) 
end

function LuaS_114777_2()
	CloseSpeak(OwnerID())
	ChangeZone( OwnerID() , 15 , 0 , -4639 , 100 , 7600 , 180 )
end

function LuaS_114778_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114778_0]" , "LuaS_114778_1", 0 ) --�߰ݹF�ԥ�������P���`�M�h�Ϊ����Y
end

function LuaS_114778_1()
	SetSpeakDetail( OwnerID(), "[SC_114778_1]" ) 
	--�ڭ̶��`�M�h�Ϊ��Ϊ��L�h���g�b�F�ԥ���������L�԰��V�m�Ať���ڭ��M�h�Τ��ܦh���j���^���N�O�Ϊ��b���Ӯɴ��{�Ѫ��C
	--�ҥH�ڭ��M�h�λP�F�ԥ������ꤧ�������Y�@���ܤ����C
	--�{�b���̦��G�o�ͤF���o�F���Ʊ��A�ݭn�ܦh���g�窺�ħL�A�ӳo���O�ڭ��M�h�ί�����o�W�����a��C
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114778_0", 0 ) 
end

function LuaI_15_6_TRANSFER_0()
--	SetPlot( OwnerID() , "range" , "LuaI_15_6_TRANSFER_1" , 150 )
end

-----	�߮��ѹ�
function LuaS_102815_0()
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		return
	end
	local RandX=DW_Rand(10)
	local Cat
DeBugMSG(0,0,"RandX="..RandX)
	if	RandX<4	then
		Cat = Lua_CreateObjByDir( OwnerID() , 102754 , DW_Rand(50)+50 , 0) 
		AddToPartition(Cat,0)
		WriteRoleValue(Cat,EM_RoleValue_LiveTime,8)
		SetAttack(Cat,OwnerID())
	end
end

------ �u�C�֤H
function LuaI_Bard_Usually()
	while 1 do
		for i = 1 , 12 , 1 do
			PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DANCE )
			sleep( 50 )
		end
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep( 30 )
	end
end

------ �s��
function LuaI_DrinkGuest_1()
	while 1 do
		local Num = DW_Rand( 2 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )		
		sleep( 30 )
		if Num == 1 then
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )	
		else
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		sleep( 30 )
		if Num == 1 then
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )	
		else
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep( 30 )
		if Num == 1 then
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )	
		else
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		sleep( 30 )
	end
end

---�޾ɭ�
function LuaS_114952_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_0]" , "LuaS_114952_1", 0 )	--�߰ݼo���Ϫ���m 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_1]" , "LuaS_114952_2", 0 )	--�߰ݤ����Ϫ���m 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_2]" , "LuaS_114952_3", 0 )	--�߰��«��Ϫ���m 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_3]" , "LuaS_114952_4", 0 )	--�߰ݷt�ѰϪ���m 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_4]" , "LuaS_114952_5", 0 )	--�߰ݤU���D����m
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_5]" , "LuaS_114952_6", 0 )	--�߰ݦU�س]�I����m 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_6]" , "LuaS_114952_7", 0 )	--�߰ݦ^��[ZONE_YGGNO LAND]����k
end

function LuaS_114952_1()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_1_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_2()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_2_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_3()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_3_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_4()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_4_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_5()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_5_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_6()
	SetSpeakDetail(OwnerID(),"[SC_114952_7]")	--�A�Q�ݭ��ӳ]�I�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_8]" , "LuaS_114952_8", 0 )	--�߰�[114829]����m 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_9]" , "LuaS_114952_9", 0 )	--�߰�[114830]����m 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_10]" , "LuaS_114952_10", 0 )	--�߰ݥ���Ҫ���m 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_11]" , "LuaS_114952_11", 0 )	--�߰ݩЫκ޲z������m 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_12]" , "LuaS_114952_12", 0 )	--�߰ݤ��|���޲z������m
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_13]" , "LuaS_114952_13", 0 )	--�߰ݻȦ檺��m
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_14]" , "LuaS_114952_14", 0 )	--�߰ݦU�ذө�����m
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_15]" , "LuaS_114952_15", 0 )	--�߰ݦU�ػs�y���㪺��m 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_16]" , "LuaS_114952_16", 0 )	--�߰�[ZONE_DAELANIS_PALACE]����m 
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_7()
	SetSpeakDetail(OwnerID(),"[SC_114952_17]")	--�b[ZONE_DAELANIS_OLD_TOWN]���谼�j���]�����`�ۭn�몺�ϸ`�A�L�̯�����U�_�I�̨Ӧ^[ZONE_YGGNO LAND]�A�A�i�H�h����ݬݡC
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end
function LuaS_114952_8()
	SetSpeakDetail(OwnerID(),"[SC_114952_18]")	--[114829]�ܡH��m�N�b[ZONE_DAELANIS_MIDTOWN]�������n�ݡA�A�|�ݨ���f���H�c�H�Υ���Ҧ���C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_9()
	SetSpeakDetail(OwnerID(),"[SC_114952_19]")	--[114830]�ܡH�A�u��[ZONE_DAELANIS_ALLEY]���D���@�����F���쩳�A���N�b���̡C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_10()
	SetSpeakDetail(OwnerID(),"[SC_114952_20]")	--����Ҫ��H�i�n�b[114829]�A�A�i�H�b[ZONE_DAELANIS_MIDTOWN]�������n�ݬݨ�L�̴N���b���̡C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_11()
	SetSpeakDetail(OwnerID(),"[SC_114952_21]")	--�Ыκ޲z���H��I�ڰO�o�O���`�ۭn�몺�ϸ`�a�Ӫ��H���A�L�̳��b[ZONE_DAELANIS_OLD_TOWN]�谼���j���]���̡C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_12()
	SetSpeakDetail(OwnerID(),"[SC_114952_22]")	--�Ыκ޲z���H��I�ڰO�o�O���|���޲z�����ϸ`�a�Ӫ��H���A�L�̳��b[ZONE_DAELANIS_OLD_TOWN]�谼���j���]���̡C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_13()
	SetSpeakDetail(OwnerID(),"[SC_114952_23]")	--�Ȧ�ܡH��L[ZONE_DAELANIS_OLD_TOWN]���J�f���᩹����ݴN�ݱo��F�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_14()
	SetSpeakDetail(OwnerID(),"[SC_114952_24]")	--���F���\�M�Ĥ��B�Ҫ��������ө��O�b[ZONE_DAELANIS_MIDTOWN]�P[ZONE_DAELANIS_ALLEY]��ɪ��s���g��~�A��L�A�һݭn���ө��A���i�H�b[ZONE_DAELANIS_MIDTOWN]���������C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_15()
	SetSpeakDetail(OwnerID(),"[SC_114952_25]")	--�s�y���㪺�ܡA�A�i�H��ө����H�ɥΡC���F�Ҫ��ө��O�b[ZONE_DAELANIS_MIDTOWN]�P[ZONE_DAELANIS_ALLEY]��ɪ��s���g��~�A��L�ө����b[ZONE_DAELANIS_MIDTOWN]���������C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_16()
	SetSpeakDetail(OwnerID(),"[SC_114952_26]")	--�A�i�H�ݨ�[ZONE_DAELANIS_PALACE]�N�b[ZONE_DAELANIS_OLD_TOWN]�_��A���n��F���̧A�����q[ZONE_DAELANIS_OLD_TOWN]�F��������W�h�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end