----------423049
-------------------��ܿﶵ
---function LuaS_423049()--
--	LoadQuestOption( OwnerID() )
--	if (CheckAcceptQuest(OwnerID(),423049)==true )and  (CheckFlag(OwnerID(),543726)==false )then
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_1]","LuaS_423049_1",0)----�A���Q�줰��n��k�ܡH
--	end
---end
function LuaS_423049_1()
	SetSpeakDetail(OwnerID(),"[SC_423049_2]")---��F�A�ڴ��g�q�����襤���X�~�����B���Ū����I			
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_3]","LuaS_423049_2",0)---�n�a�I���Ĥ��b���H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_4]","LuaS_423049_3",0)----��~�o��b�O�ӫ_�I�F�C
end

function LuaS_423049_2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423049_4", 0)
end
function LuaS_423049_4()
	DisableQuest( OwnerID() , true )
	Yell( OwnerID()  , "[SC_423049_5]" , 3 )-----�N��b�c�l����C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID()  , "[SC_423049_6]" , 3 )-----�A�i�H�ܤU�������Ĥ��C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	DisableQuest( OwnerID() , false )
end
function LuaS_423049_3()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423049_5", 0) 
end
function LuaS_423049_5()
	DisableQuest( OwnerID() , true )
	Yell( OwnerID()  , "[SC_423049_7]" , 3 )---�A���H���ڶܡH
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID()  , "[SC_423049_8]" , 3 )---�ѤW���B�ͥ������۫H���K�K
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID()  , "[SC_423049_9]" , 3 )----�A�����H���ڡK�K
----���Y���ʧ@
	PlayMotion( OwnerID() ,	ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	sleep(10)
	ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423049_10]", 0 )--[114613]���_�������Ĥ��V�A���x�C
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423049_10]", 0 )--[114613]���_�������Ĥ��V�A���x�C
	if (CheckID( TargetID() ) == true) and CheckBuff(TargetID(),505987)==false then
		AddBuff( TargetID(), 505987 , 1 , 13)----
	end
	DisableQuest( OwnerID() , false )
end

---�Ĥ����@��(1)��BUFF������  �|���X��
function LuaS_423049_6()----�ˬd�a�I�C
	if	ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 209 then-----715
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423049_11]", 0 ) --(�o���Ĥ��o��F�A�A�L�k�ϥΡC)�A�u��bXXXX�ϥΡI
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423049_11]", 0 )
		return false
	end
	return true
end

function LuaS_423049_7()--�����a�I
	if	ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 209 then--------�ˬd���w�Y�Ӱϰ�---715
			if CheckBuff( OwnerID() , 505987)==true   then 
				CancelBuff( OwnerID() , 505987 )
			end
			if CheckBuff( OwnerID() ,505988)==true then 
				CancelBuff( OwnerID() , 505988 )
			end
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423049_12]", 0 ) --XXX���Įĭ��ִ�z�C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423049_12]", 0 )
	end
end

function LuaS_423049_8()--�����X��
		SetFlag( OwnerID() ,543726, 1 )
end



---------423050
----(1)���b����W������l�@��
function LuaI_423050()---��l�@��
--	local Num = DW_Rand(5)
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
	SetPlot( OwnerID() , "touch" , "LuaS_423050" , 10 )
end

function LuaS_423050()
	local LUA = {"LuaS_423050_1" , "LuaS_423050_2", "LuaS_423050_3", "LuaS_423050_4", "LuaS_423050_5"  }
	local PID = ReadRoleValue( 	TargetID() , EM_RoleValue_PID )
		if	(CheckAcceptQuest(OwnerID(),423050)==true) then
			BeginPlot( OwnerID(), LUA[PID], 0)
		else
			ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_423050_1]", 0 )---[114621]�S���Ǩӥ����n���C
			ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_423050_1]", 0 )---[114621]�S���Ǩӥ����n���C
		end
end

function LuaS_423050_1()--���C��C
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_2]", "0xff67643f" )--�X��k�n�G�ڴN���p�Ц��ѹ��F�A�A���H�C����h���F�褣�_�������C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_2]",  "0xff67643f" )--�X��k�n�G�ڴN���p�Ц��ѹ��F�A�A���H�C����h���F�褣�_�������C
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_3]",  "0xff67643f"  )--�C�I�k�n�G�ګ��i��۫H�A�ѹ��|�Ѧr?
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_3]",  "0xff67643f"  )--�C�I�k�n�G�ګ��i��۫H�A�ѹ��|�Ѧr?
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_4]",  "0xff67643f"  )--�C�I�k�n�G�A�٬O����i�D�ڡA�A��ڬ��ê������è���̥h�F�H
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_4]",  "0xff67643f" )--�C�I�k�n�G�A�٬O����i�D�ڡA�A��ڬ��ê������è���̥h�F�H
		sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_5]",  "0xff67643f" )--�C�I�k�n�G���O�ڴ������y�ǤU���p�е�A�öQ�o�ܡA���٧ڡC
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_5]", "0xff67643f"  )--�C�I�k�n�G���O�ڴ������y�ǤU���p�е�A�öQ�o�ܡA���٧ڡC
		sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_6]", "0xff67643f" )--�X��k�n�G�ڨS���çA��ԣ�����СA�u�����ѹ��C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_6]",  "0xff67643f" )--�X��k�n�G�ڨS���çA��ԣ�����СA�u�����ѹ��C
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_7]", "0xff67643f" )--�X��k�n�G�ҥH�ڤ~�b�o���\�񮷹����A�u�O�����l���M���_�ӡA�o�S���쨺���ѹ��C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_7]",  "0xff67643f" )--�X��k�n�G�ҥH�ڤ~�b�o���\�񮷹����A�u�O�����l���M���_�ӡA�o�S���쨺���ѹ��C
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_8]", "0xff67643f"  )--�C�I�k�n�G���n�A���A���o�款�G�F�A�X�ۧڤ߱��٤��a�A�A�̦n���I�N����X�ӡC
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_8]",  "0xff67643f" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_9]", "0xff67643f"  )--�X��k�n�G�گu���S���A�u���O�ѹ��K
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_9]",  "0xff67643f"  )
	sleep(30)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end

function LuaS_423050_2()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_10]", "0xff008000")--�����k�n�G��~�n�Q����I�w��J�A���O���n�F�b��s�Ǹ̤����o�ӹ��I
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_10]","0xff008000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_11]", "0xff008000" )--�ϩʨk�n�G�p�_����A�o�򪺬��A�ګ����ܧA���y�O�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_11]", "0xff008000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_12]", "0xff008000" )--�ϩʨk�n�G�ڻ��L�p�G�A�O[114368]�A���@�����A��[114367]�ڡ�
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_12]","0xff008000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_13]","0xff008000")--�ϩʨk�n�G���A�����@�ӻ�D��A�]�A�Ҥ���ڡK�K
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_13]", "0xff008000" )
	sleep(30)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end

function LuaS_423050_3()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_14]", "0xFFFFFF00" )--�Jļ�k�n�G���F�H�񤣶i�h�ܡH
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_14]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_15]", "0xFFFFFF00")--�����k�n�G��K�K�o�ӫ��զ��I���C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_15]", "0xFFFFFF00")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_16]","0xFFFFFF00" )--�Jļ�k�n�G�L���i�o��}�F�A�٩񤣶i�h�H�A�쩳�|���|�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_16]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_17]", "0xFFFFFF00" )--�����k�n�G�u�����I���K�K�i�o�٤����}�K�K
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_17]","0xFFFFFF00")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_18]", "0xFFFFFF00")--�Jļ�k�n�G�쩳�n�i�h�}�H�𦺧ڤF�A���ڨ�
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_18]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_19]", "0xFFFFFF00" )--�Jļ�k�n�G��K�K�뤣�i�h�C�O���O�}�Ӥp�F�C�⥦���j�@�I�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_19]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_20]","0xFFFFFF00" )--�����k�n�G��K�K����F�A�o�w�g�O�����F�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_20]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_21]", "0xFFFFFF00")--�Jļ�k�n�G�ڤ��ޡA�@�w�n����C���ѤW�����H���Q�Y�ï]�ߤl���I
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_21]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_22]", "0xFFFFFF00" )--�Jļ�k�n�G�Aı�o�{�b�ڭ̶]�h��L���`�ƶ뤣�i�h�A�L�|��˹�ڭ̡H
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_22]", "0xFFFFFF00" )
	sleep(30)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end
function LuaS_423050_4()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_23]", "0xff8080ff")--����k�n�G�A�̳o�s�o���쩳�b���Ǥ���H
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_23]", "0xff8080ff" )	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_24]","0xff8080ff")--[114621]�ǨӤ@�}�n�������ݪ��T���C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_24]", "0xff8080ff" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_25]","0xff8080ff")--����k�n�G�ڤS��F�K�K�o�ѤO�q�Ӯz�F�I���A�̻���������ڪ��O�q�[�j�A���ڥ�Ĺ[114367]�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_25]","0xff8080ff" )	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_26]", "0xff8080ff")--����k�n�G�ڲ{�b�o�s�ӫ_�I�̳������L�C�A�̯u�z����쩳�b�d����H
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_26]", "0xff8080ff" )	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_27]", "0xff8080ff" )--����k�n�G�n����B�ڵ��A�̸���A���ݭn�s�J�A�ڴN�h�m�s�J�A�{�b�O�H
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_27]", "0xff8080ff")	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_28]","0xff8080ff")--����k�n�G��ĵ�i�A�̡A�o�@���A�p�G�S���ڪ��O�q�A�״��ɡA���U�Ӫ��g�B�N���u�o�ǤF�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_28]", "0xff8080ff")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_29]", "0xff8080ff"  )--�Ií�k�n�G[103292]��D�A�n�F��A�z�Q���Ҭ��ٻݭn�@�Ǯɶ��A�A�����t�X�ڭ̡A�~��K�K
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_29]", "0xff8080ff")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_30]", "0xff8080ff")--����k�n�G���L�A�ڲ{�b�߱����O�ܦn�A�p�G���Q�����ܡA�N�̦n���W�A�̪��L�A�ߨ�ǳ����ڤO�q���ɪ��u�@�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_30]","0xff8080ff")
	sleep(30)
	if (CheckID( OwnerID() ) == true) then
		if (CheckFlag(OwnerID(),543727)==false ) then
			SetFlag( OwnerID() , 543727, 1 )
			SetFlag( OwnerID() , 543729, 1 )
		end
	end
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end
function LuaS_423050_5()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_31]", "0xFFF00000" )--���B�k�n�G�G�M�o��F�O�K�K
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_31]", "0xFFF00000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_32]", "0xFFF00000" )--��릨k�n�G���}�ɡA�ڴN�A�q�L�|�ԭ@�줰��ɭԡH�G�M�@�U�l�N�z�o�F��u�����
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_32]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_33]", "0xFFF00000" )--���B�k�n�G�o�U�l�A�u�z���⪺�H�i�����F�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_33]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_34]", "0xFFF00000")--��릨k�n�G�U�l�`�O����İʹ���
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_34]", "0xFFF00000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_35]", "0xFFF00000")--��릨k�n�G[103292]�γ\�û������|�Q��L�]�����������骺�@�ѡA�ݵۥL�����ˤl�A�N��~���H�r���C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_35]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_36]", "0xFFF00000" )--���B�k�n�G�ϥ�������w�g���A�γ\�z�ӧ�ӮɭԱN[103292]�F���C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_36]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_37]", "0xFFF00000")--��릨k�n�G�٤����ӫ�C��F�A�K�ԯ��˪L������ˤF�H
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_37]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_38]", "0xFFF00000")--���B�k�n�G�u�z���⪺�H�w�g�}�l�i��j�q���h�L��y���p�e�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_38]", "0xFFF00000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_39]", "0xFFF00000")--��릨k�n�G�@��i�פ����I�s�J�B�s���ٰ��ܡH��Ӯɶ��A�h���y�a�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_39]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_40]", "0xFFF00000")--���B�k�n�G���ڪ��D�F�A�ڷ|�A�h�M����s�Ϯ��a�C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_40]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_41]", "0xFFF00000" )--��릨k�n�G�h�a�I�ڤ]�ӥh���ݼ��ݨ��ǯu�z����C
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_41]", "0xFFF00000")
	if (CheckID( OwnerID() ) == true) then
		if (CheckFlag(OwnerID(),543728)==false ) then
			SetFlag( OwnerID() , 543728, 1 )
			SetFlag( OwnerID() , 543729, 1 )
		end
	end
	sleep(20)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end



function LuaS_423050_6()	
	SetPlot( OwnerID(), "range","LuaS_423050_7", 150 )
end
function LuaS_423050_7()---103295
	if	CheckAcceptQuest(OwnerID(),423050)==true and CheckFlag( OwnerID(), 543762 )==false  then
		ScriptMessage(OwnerID() ,  OwnerID(),  1 , "[SC_423050_42]" , 0 )---�e��ǨӤ@�}�}�k�Ī�����n�C
		ScriptMessage( OwnerID() ,   OwnerID(), 0 , "[SC_423050_42]" , 0 )---
		SetFlag( OwnerID() , 543762, 1 )	
	end
end






----------------------------------------------------------------------------
----------------543730���n�X��  �X�l��780466
function LuaS_423052_0()
    LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423052)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423052_1]","LuaS_423052_1",0)---�ڷǳƦn�F�I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423052_2]","LuaS_423052_2",0)---���ڤ@�|��I
	end
end

function LuaS_423052_1()	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423052_3", 0)
end

function LuaS_423052_3()
	DisableQuest( OwnerID() , true )
	Yell( OwnerID() , "[SC_423052_4]" , 3 )--�b�ڱa�A��F�K�ԯ��˪L���e�A�Х����W���a�C
	SLEEP(30)
	Yell( OwnerID() , "[SC_423052_5]" , 3 )--���n�`��......
	SLEEP(20)
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID(), 505990 , 1 , 15)----�W�ت���BUFF
		SetPosByFlag( TargetID(), 780466 , 0)
		SetFlag( TargetID() , 543730, 1 )
	end
	DisableQuest( OwnerID() , false )
end

function LuaS_423052_2()
	SetSpeakDetail(OwnerID(),"[SC_423052_6]")---�n�A�ڷ|�b�o���ݧA�C���A�ǳƦn���ɭԦA�i�D�ڻ��C
end
------------------------------------------------------------------------------

function LuaS_423048_0()-----���b���~SERVER�ݼ@��...����Q�t����
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423048 ) == false or CountBodyItem( OwnerID() , 206806 ) >= 4 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if  OrgID ~= 103301 and OrgID ~= 103493 and OrgID ~= 103494 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_0]", 0 ); -----�o��[206805]���G�u���[103301]�ϥΡC
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_4]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[206805]�C
			return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_1]", 0 ); ----[103301]���O�ä㤤�A�A�L�k���Q�ϥ�[206805]�C
			return false
	end
		
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --�e�w�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423048_6]" , 0 )
			return false
	end
	return true
end

function LuaS_423048_1()
	if GiveBodyItem( OwnerID() , 206806 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---���b�ϥΪ����~
	end
	Hide(TargetID())
---	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_2]", 0 ); -------�A���[103301]�F�I
	DELOBJ(TargetID())
end



----�d��@��  �h��  �@��i�h  �N�|�X�{ �Q�t
---

function LuaS_423048_2()---���Ϊ���C
	SetPlot( OwnerID(), "range","LuaS_423048_3", 150 )
end
function LuaS_423048_3()---
	if	CheckAcceptQuest(OwnerID(),423048)==true and CountBodyItem( OwnerID() , 206806 ) < 4 then
		SetPlot(TargetID(), "range","", 0 )
		BeginPlot(TargetID(),"LuaS_423048_4",0)
	end
end

function LuaS_423048_4()
		local NPC={103301,103493,103494}---�üƥͩ�
		local KK = math.floor(DW_Rand( 100 )/33 ) +1--math.floor�G�����
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423048_7]" , 0 ) --�Ať���F�_�Ǫ��n���C
		sleep(20)
		local Obj = Role:new(TargetID() )
		local BaseX = Obj :X()		
		local BaseY = Obj :Y();		
		local BaseZ = Obj :Z();		
		local BaseDir = Obj:Dir();		
		local DD= CreateObj(NPC[KK], BaseX+50, BaseY, BaseZ+50, BaseDir, 1 )     		      
		AddToPartition( DD,0)    
		SetAttack( DD , TargetID() )          
--		BeginPlot(DD,"LuaQ_421177_Sui",0)
		SLEEP(600)
		SetPlot( OwnerID() , "range","LuaS_423048_3", 150 )
end