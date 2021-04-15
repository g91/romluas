--------------------------------------------------------------------------------------------------
function LuaS_dr424293_01()								--�ϩR�p�Ϥ��I�ﶵ
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckAcceptQuest( own,  424293 )==true then
			AddSpeakOption(own,tar,"[SC_424293_03]","LuaS_dr424293_02",0)
		elseif
		  CheckAcceptQuest(own,424294)==true and
	 	  CheckCompleteQuest(own,424302)==true and
		  CountBodyItem(own,240247)==0 and
		  CountBodyItem(own,240222)==0 then
		 	 AddSpeakOption(own,obj,"[SC_424422_0]","LuaQ_drcheckbag_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr424293_02()	  							--�ݤf��
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424293_01_1]" )
	AddSpeakOption(own,tar,"[SC_424293_01]","LuaS_dr424293_02_1",0)
end


function LuaS_dr424293_02_1()	  						--�ҥH�j�|�X�L�o��ƬO�u���H
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424293_02_1]" )
	AddSpeakOption(own,tar,"[SC_424293_02]","LuaS_dr424293_02_2",0)
end

function LuaS_dr424293_02_2() 	 						--�ҥH���A�D�H�`��G�H��Ĳ�H
	local own = OwnerID()
	SetSpeakDetail( own, "[SC_424293_03_1]" )
	GiveBodyItem( own, 545079, 1 )
end


function LuaQ_drcheckbag_1()							--���a��F�[�����s��A�i�A���į�
	local own= OwnerID()
	SetSpeakDetail(own,"[SC_424422_1]")
	GiveBodyItem(own,240222,1)
end
--------------------------------------------------------------------------------------------------

function LuaS_118480_0() 								--�H�c
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]", "LuaS_118480_1", 0 ) --/*�}�ҫH�c
end

function LuaS_118480_1()
	CloseSpeak( OwnerID() )
	MyOpenMail()	
end

--------------------------------------------------------------------------------------------------

function LuaQ_dr424294_0()								--�ˬd���L�P�s
	local own=OwnerID()
	if CountBodyItem(own,240212)>0 then
		return true
	else
	ScriptMessage(own, own, 2 ,"[SC_424294_01]" , 1)
		return false
	end
end	

function LuaQ_dr424294_1()	--�R���@��P�s���[����
	local own=OwnerID()
	DelBodyItem(own,240212,1)
	GiveBodyItem(own,240247,1)
end

--------------------------------------------------------------------------------------------------

function LuaQ_dr424294_2()								--�u�æ��s�~�����ﶵ
	local own= OwnerID()
	local obj=TargetID()
	LoadQuestOption(own)
	if CountBodyItem(own,240247)>0 then
		AddSpeakOption(own,obj,"[SC_424294_2]","LuaQ_dr424294_2_1",0)
	else
	LoadQuestOption(own)
	end
end

function LuaQ_dr424294_2_1()
	local own=OwnerID()
	local obj=TargetID()
	PlayMotion(obj,118)
	sleep(50)
	Say(obj,"[SC_424294_2_1]")
	sleep(50)
	addbuff(obj,620026,0,120)
	addbuff(own,620027,0,120)
	DisableQuest( obj , true ) 
	sleep(50)
	PlayMotionEX(obj,9,10)
	CloseSpeak(own)
	BeginPlot(obj,"LuaQ_dr424294_2_2",0)
end

function LuaQ_dr424294_2_2()
	local own = OwnerID()
	Sleep(1200)
	DisableQuest( own , false ) 
	PlayMotion(own,0)
end

-----------------------------------------------------------
function LuaS_dr118685()										--�ƹΪ��`�n�x��
	while 1 do
		Sleep(200)
		npcSay(OwnerID(),"[SC_118687_1]")
		Sleep(200)
		npcSay(OwnerID(),"[SC_118687_2]")
		Sleep(200)
		npcSay(OwnerID(),"[SC_118687_3]")
	end
end
-----------------------------------------------------------

function LuaS_dr424304_0()								
	local own =OwnerID()
	local obj = TargetID()
		LoadQuestOption(own)
		if CheckCompleteQuest(own,424304)==true and CheckCompleteQuest(own,424305)==false then
			AddSpeakOption(own,obj,"[SC_424304_1]","LuaS_dr424304_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr424304_1()
	local own =OwnerID()
	SetSpeakDetail(own,"[SC_424304_2]")
	GiveBodyItem(own,545082,1)
	AddBuff(own,620113,1,10)
	BeginPlot(own,"LuaQ_dr424304_drama01",0)
end

function LuaQ_dr424304_drama01()
		local Cmonster =Lua_DW_CreateObj( "flag" ,118481,  780950  , 0 , 1 , 1 )
		DW_MoveDirectToFlag( Cmonster ,  780950  , 1 , 1  )
		say(Cmonster,"[SC_424304_2]")
		sleep(50)
		DelObj(Cmonster)
end

function LuaS_dr118482_0()										--�~��
	local own =OwnerID()
	local obj = TargetID()
		LoadQuestOption(own)
		if CheckCompleteQuest(own,424304)==true  then
			AddSpeakOption(own,obj,"[SC_118482_1]","LuaS_dr118482_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr118482_1()
	local own =OwnerID()
	SetSpeakDetail(own,"[SC_118482_2]")
	if	CountBodyItem(own,545084)>=1 then
	DelBodyItem(own,545084,1)
	else
	GiveBodyItem(own,545083,1)
	AddSpeakOption(own,obj,"[SC_118482_3]","LuaS_dr118482_2",0)
	end
end

function LuaS_dr118482_2()
	SetPos(OwnerID(),-11510,442,36729,256)
end

-----------------------------------------------------------
function LuaQ_drgoout_0()						--�ǥX��
	SetPlot(OwnerID(),"range","LuaQ_drgoout_1",35)
end

function LuaQ_drgoout_1()
	SetPos(OwnerID(),-9177,486,36731,273)
end
-------------------------------------------------------------

function LuaS_dr118315_01()						
	local own = OwnerID()
	LoadQuestOption(own)
end


-------------------------------------------------------------�ج����~�������-------------------------------------------------------------
function LuaS_drresident_1()
	while 1 do
		Sleep(100)
		npcsay(OwnerID(),"[SC_RESIDENT_01]")		--�ڨ��᪺�q�ۥu�n�@�U�����N���O�A���F�I
		sleep(100)
		npcsay(OwnerID(),"[SC_RESIDENT_02]")		--�n�ߪ��H���A�������a�A�a�̤H�j�n�X�ѤF�I
		Sleep(100)
	end
end


function LuaS_drresident_2()
	while 1 do
		Sleep(120)
		npcsay(OwnerID(),"[SC_RESIDENT_03]")		--�o���q�ۥ����O�}�����쪺[208234]�I�������u�n�@�U�����N�n�I
		sleep(80)
		npcsay(OwnerID(),"[SC_RESIDENT_04]")		--���Ӧ��a�A�p�Ĥl�j���o���I
		Sleep(100)
	end
end

function LuaS_drresident_3()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_05]")		--�����C��������̲�ѴN�S���S�F�I
end
function LuaS_drresident_4()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_06]")		--�����I�{�r�j�F�I
end

function LuaS_drresident_5()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_07]")		--�����̥��~�æѹ��A�۾������îw���_���P�P�P...
end

function LuaS_drresident_6()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_08]")		--�o�n�F�`...�ۺq�u�nť...�ڤ]�n���o�@��...
end

function LuaS_drresident_7()
		npcsay(OwnerID(),"[SC_RESIDENT_09]")		--�š�`��̡㤣�\�ʡI�A�̦A��֡I�H�ᤣ��A�̪��F�I
end

function LuaS_drresident_8()
		npcsay(OwnerID(),"[SC_RESIDENT_10]")		--�H�H�I�O�ަo�A�u�n�O��[105668]�N�n�I
end

function LuaS_drresident_9()
		npcsay(OwnerID(),"[SC_RESIDENT_11]")		--�H�H�I
end

function LuaS_drresident_10()
		npcsay(OwnerID(),"[SC_RESIDENT_12]")		--�Ӭݬݪ��I�����̦n���F�賣�b�o���I
end

function LuaS_drresident_11()
		npcsay(OwnerID(),"[SC_RESIDENT_13]")		--ť���A�a�k��[�J�F�ج����M�h�Ϊ��H
		sleep(40)
		npcsay(OwnerID(),"[SC_RESIDENT_15]")		--�A�����ܡH�O���O���H
end

function LuaS_drresident_12()
		npcsay(OwnerID(),"[SC_RESIDENT_14]")		--�u�O�F�`���Iť��[118312]�j�H�٨S���B�A���|�O�]��[118312]�j�H�A�A�k��~�[�J���a�H
end

function LuaS_drresident_13()
		npcsay(OwnerID(),"[SC_RESIDENT_16]")		--�J���I��...�ڤk��A�~���O�]��[118312]�j�H�~�[�J�ج����M�h�Ϊ��I
end

function LuaS_drresident_14()
		npcsay(OwnerID(),"[SC_RESIDENT_17]")		--�ڭ̬O�٦a������ǡI
end

function LuaS_drresident_15()
		npcsay(OwnerID(),"[SC_RESIDENT_18]")			--���U�I���S���H��ť��ڪ��n���H
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaQ_dr118733_01()							 --���c�l���k��
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424305)==true 
	and CountBodyItem(O_ID,240291)==0 then
		AddSpeakOption(O_ID,T_ID,"[SC_118733_01]","LuaQ_dr118733_02",0)   	--�o�Ǥ��n���c�l�A�i�H���ڶܡH
	else
		LoadQuestOption(O_ID)
	end
end

function LuaQ_dr118733_02()
	local O_ID=OwnerID()
	SetSpeakDetail(O_ID,"[SC_118733_02]")					--�u���ܡH�A�u�O���F�ڤ@�Ӥj���I�o�U���ξ�߳Q���������ѤF�I
	GiveBodyItem(O_ID,240291,3)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaS_dr118485_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424305)==true then
	AddSpeakOption(O_ID,T_ID,"[SC_118485_01]","LuaS_dr118485_02",0)   	 --�Q�߰�...[105782]�C
	AddSpeakOption(O_ID,T_ID,"[SC_118485_02]","LuaS_dr118485_03",0)  	 --�Q�߰�...[105783]�C
	AddSpeakOption(O_ID,T_ID,"[SC_118485_03]","LuaS_dr118485_04",0)   	 --�Q�߰�...[105784]�C
	else
	LoadQuestOption(O_ID)
	end
end

function LuaS_dr118485_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_04]")				--[105782]�A�è���e���ϡA�g�����A��ۨ��ΡA���A������ı�C
end

function LuaS_dr118485_03()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_05]")				--[105783]�A�è��󦹫Υ~�����x�W�A�����x�L�Ը}�����n�W�A[118733]���G�����W���C
end

function LuaS_dr118485_04()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_06]")				--[105784]�A���]���@�k�}�A�è���᫰�ϡA��u�ǡA������������~��ˮ`�L�C
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaQ_118714_00()							--�i�Դ������]�]
	LoadQuestOption(OwnerID())
		if CheckAcceptQuest(OwnerID(),424399)==true and
		   CheckCompleteQuest(OwnerID(),424400)==true and
		   CountBodyItem(OwnerID(),240289)==0 then
		   AddSpeakOption(OwnerID(),TargetID(),"[SC_118714_0]","LuaQ_118714_01",0)	
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaQ_118714_01()
	SetSpeakDetail(OwnerID(),"[SC_118714_1]")
	GiveBodyItem(OwnerID(),240289,1)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------