

------------------------------------
----------423574�ϴ��P�l�d----------

function LuaS_423574()	--���b�������W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423574 ) == true  and	CheckFlag( OwnerID() , 544606 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423574_1]", "LuaS_423574_1", 0 )--���a�G�ڨ���F����J.��L�S����
	end
end

function LuaS_423574_1()
	SetSpeakDetail(	OwnerID() , "[SC_423574_2]" )--�����G�A���a�A��ť�ۡC
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423574_3]", "LuaS_423574_2" , 0 )--���a�]�N����J.��L�S���ܭ��z�@�M�^
end

function LuaS_423574_2()
	SetSpeakDetail( OwnerID() , "[SC_423574_4]" )--�����G�گ�z�ѡA�ڤ]�|�ӥL�����ܥh���C
	SetFlag( OwnerID() , 544606 , 1 )
end



---------------------------------------------------
--423575�e���ƥ����S���a


function LuaS_423575()	--���b����J���W
	if CheckFlag ( OwnerID() , 544682 ) == true or CheckFlag ( OwnerID() , 544683 ) == true	or CheckAcceptQuest( OwnerID() , 423570 ) == true or CheckAcceptQuest( OwnerID() , 423571 ) == true then
		SetSpeakDetail(OwnerID() , "[SC_423575_5]")
	else
		LoadQuestOption( OwnerID() )	
		if CheckAcceptQuest( OwnerID() , 423575 ) == true and CheckFlag ( OwnerID() , 544607 ) == false then
			SetSpeakDetail(OwnerID(),"[SC_423575_1]")
			AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423575_2]", "Luas_423575_1", 0 )--���a�G���٦��ƭn�B�̡C
			AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423575_3]", "Luas_423575_2", 0 )--���a�G�ǳƦn�F�A�ڭ̨��a�C
		end
	end
end

function Luas_423575_1()
	SetSpeakDetail(OwnerID(),"[SC_423575_4]")--����J:��A�֥h�B�̧a�A�ڭ̴N�b�o�̵��A�C
end

function Luas_423575_2()
	--Say(OwnerID() , "[SC_423575_4]" )--����J����G���ڭ̳o�N�X�o�a�C
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 19 , 0 , -2172.4 , 206.4 ,49760.2 , 307.1 )--���Цa�I�n���--
	SetFlag (OwnerID() , 544607 , 1 )
end
---------------------------------------------------
--423576��R���Ȥ��W

function LuaS_423576_1()	--���b���L���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423576 ) == true  and	CheckFlag( OwnerID() , 544608 )	== false then
		AddSpeakOption ( OwnerID() ,	TargetID() ,"[SC_423576_1_1]", "LuaS_423576_1_1", 0 )
	end
end

function LuaS_423576_1_1()
	SetSpeakDetail( OwnerID() , "[SC_423576_1]" )
	SetFlag( OwnerID() , 544608 , 1 )
end

-----
function LuaS_423576_2()	--���b�u�C�֤H���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423576 ) == true  and	CheckFlag( OwnerID() , 544609 )	== false then
		AddSpeakOption ( OwnerID() ,	TargetID() ,"[SC_423576_1_1]", "LuaS_423576_2_1", 0 )
	end
end

function LuaS_423576_2_1()
	SetSpeakDetail( OwnerID() , "[SC_423576_2]" )
	SetFlag( OwnerID() , 544609 , 1 )
end
----	
function LuaS_423576_3()	--���b������l���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423576 ) == true  and	CheckFlag( OwnerID() , 544610 )	== false then
		AddSpeakOption ( OwnerID() ,	TargetID() ,"[SC_423576_1_1]", "LuaS_423576_3_1", 0 )
	end
end

function LuaS_423576_3_1()
	SetSpeakDetail( OwnerID() , "[SC_423576_3]" )
	SetFlag( OwnerID() , 544610 , 1 )
end

---------------------------------------------------
--423578�L�O���y�H

function LuaS_423578()	--���b���ȧ�������l
	--if CheckAcceptQuest ( OwnerID() , 423578 ) == true and CheckFlag ( OwnerID() , 544612 ) == false then
		SetFlag ( TargetID() , 544612 , 1 )
	--end
end

---------------------------------------------------
--423579���۪������a
function LuaS_423579()	--���b���ȧ�������l
	--if CheckAcceptQuest ( OwnerID() , 423579 ) == true and CheckFlag ( OwnerID() , 544611 ) == false then
		SetFlag ( TargetID() , 544611 , 1 )
	--end
end
---------------------------------------------------
--423580�_�Ǫ��Įv

function LuaS_423580()	--���b���ȧ�������l
	--if CheckAcceptQuest ( OwnerID() , 423580 ) == true and CheckFlag ( OwnerID() , 544613 ) == false then
		SetFlag ( TargetID() , 544613 , 1 )
	--end
end

---------------------------------------------------
--423581���ߪ��C�~--
function LuaS_423581()	--���b���ߪ��C�~���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423581 ) == true  and	CheckFlag( OwnerID() , 544585 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423581_1]", "LuaS_423581_1", 0 )
	end
end

function LuaS_423581_1()
	SetSpeakDetail(	OwnerID() , "[SC_423581_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_3]", "LuaS_423581_2" , 0 )
end

function LuaS_423581_2()
	SetSpeakDetail(	OwnerID() , "[SC_423581_4]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_5]", "LuaS_423581_3" , 0 )
end


function LuaS_423581_3()
	SetSpeakDetail(	OwnerID() , "[SC_423581_6]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_7]", "LuaS_423581_4" , 0 )
end

function LuaS_423581_4()
	SetSpeakDetail(	OwnerID() , "[SC_423581_8]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_9]", "LuaS_423581_5" , 0 )
end

function LuaS_423581_5()
	SetSpeakDetail(	OwnerID() , "[SC_423581_10]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_11]", "LuaS_423581_6" , 0 )
end


function LuaS_423581_6()
	SetSpeakDetail( OwnerID() , "[SC_423581_12]" )
	SetFlag( OwnerID() , 544585 , 1 )
	SetFlag( OwnerID() , 544614 , 1 )
end



---------------------------------------------------
------------------423582�ɬd���礧��

--�Ѧ� ZONE18 ��w��116445�Ƽw�D�w�_ �@��
--116682 �����ˬd�I
--/GM ? createflag 780799 1
function LuaS_423582()	--���b�d��@���ˬd����W
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116511  , 1000 , 0)	--�HOwnerID�����߷j�M�d��RANGE���ؼ�NPC�ҪOID
	--�ŧicookie��LuaFunc_SearchNPCbyOrgID(�]�N�O�n�Ψӷ�j�M���ߪ�NPC)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	setplot(OwnerID(),"range","LuaS_423582_1",200) --�]�w�d��@��
end

function LuaS_423582_1()
	local cookie = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)
	sleep(5)
	if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( cookie, EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( cookie ,OwnerID(),0 ) --��cookie����OWNERID		
		PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	--��cookie����
		sleep(5)
		say(cookie ,"[SC_423582_1]")	--���W��ܤ��X�{�b���a��ܮظ� NPC:����I�o�̸T��a��C�ֵ��ڹL�ӡI
		WriteRoleValue( cookie, EM_RoleValue_Register+2, 0 )
	end
	sleep(5)
	if	GetDistance( OwnerID() , TargetID() ) < 200	then	--�p�G���oOwnerID�PTargetID�����Z���p��50 ����
		SetPosByFlag( OwnerID(), 780799 , 1 )		--�NOwnerID�ǰe�ܺX�Ц�m
		if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then	--��TargetID������ ����
			WriteRoleValue( cookie, EM_RoleValue_Register+2, 1 )	--���L��
			AdjustFaceDir( cookie ,OwnerID(),0 )		--�è�cookie ���VOwnerID
			PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			say(cookie ,"[SC_423582_2]")	--NPC:�~�Ӫ̡A�o�ʪG����񪺰ϰ�O�T��a�񪺡I�����}�A�_�h�ڭ̴N�n�ΪZ�O�X���F�I		
			BeginPlot( OwnerID(), "LuaS_423582_2" , 0 )
			WriteRoleValue( cookie, EM_RoleValue_Register+2, 0 )	--�M����TargetID����
		end
	end
end

function LuaS_423582_2()
	if CheckAcceptQuest ( OwnerID() , 423582 ) == true and checkFlag( OwnerID() , 544615 )	== false then
		SetFlag( OwnerID(), 544615, 1 )
	end
end


	
---------------------------------------------------
--------------------�}�G���


--���a�ѹL�o�ӥ��ȡA�åB�S�������u�d��������s�v�B���W�S���}�G�ɡA�h�X�{��ܿﶵ

function LuaS_423586()--���b�Ͳ��D�����q���W
LoadQuestOption ( OwnerID() )
	if	CheckCompleteQuest	( OwnerID(), 423586 ) == true  and
		CheckCompleteQuest	( OwnerID(), 423587 ) == false and	
		CountBodyItem ( OwnerID(), 208273 ) == 0 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423586_1]", "LuaS_423586_1",0) --�u�ڧ�}�G�˥�F......�v
	end
end

function LuaS_423586_1()
	SetSpeakDetail( OwnerID() , "[SC_423586_2]")
	GiveBodyItem ( OwnerID(), 208273 , 1 )
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116967  , 800 , 0)
	Tell(OwnerID(),NPC,"[SC_423586_3]")
end

function LuaS_116512()	--���b�}�G��Ƨ���������
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116967  , 800 , 0)
	Tell(TargetID(),NPC,"[SC_423586_3]")
end
---------------------------------------------------
-----------------423587��X�l���}�G	
--���b�]�_�}���W
function DW_Border_423587() --��J���Ƚs���Y�i �ثe�����u�i���I�����~���o���Ȩϥ�	
	local str = "["..GetUseItemGUID(OwnerID()).."]"		--���X����W��
	ClearBorder( OwnerID())		--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail(QuestID,1))	--�۸O���e
	ShowBorder( OwnerID(), QuestID,str,"ScriptBorder_Texture_Paper" )	--�۸O���D
end

---------------------------------------------------
-----------------�d��������s
function LuaS_116501() --���b�d�������W
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 423588 ) == true and	--�T�{������
		CountBodyItem ( OwnerID(), 208274 ) == 0 and	--�èS�����礧�G
		CountBodyItem ( OwnerID(), 208283 ) == 0 then	--�]�S���]�_�}
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423586_1]", "LuaS_116501_1",0) --�u�ڧ�}�G�˥�F......�v
	end
end
function LuaS_116501_1()
	SetSpeakDetail( OwnerID() , "[SC_116501_1]")
	GiveBodyItem ( OwnerID(), 208283 , 1 )
end
---------------
function LuaS_423588()	--���b�N�i���W
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest( OwnerID() , 423588 ) == true and --�T�{������
		CountBodyItem ( OwnerID() , 208283 ) == 1 and 	--�åB���]�_�}
		CountBodyItem ( OwnerID() , 208274 ) == 0 then	--�åB�S�����礧�G
		AddSpeakOption( OwnerID() ,TargetID() , "[SC_423588_1]" , "LuaS_423588_1" , 0 )	--���a:�i�H�γo�Ӹ�A���G�l��?
	end
	if CheckAcceptQuest( OwnerID() , 423588 ) == true and CountBodyItem ( OwnerID() , 208283 ) == 0 then
		AddSpeakOption( OwnerID() ,TargetID() , "[SC_423588_3]" , "LuaS_423588_2" , 0 )
	end
end


function LuaS_423588_1()
	SetSpeakDetail( OwnerID() , "[SC_423588_2]" )
	DelBodyItem ( OwnerID() , 208283, 1 )
	GiveBodyItem ( OwnerID() , 208274, 1 )	
end

function LuaS_423588_2()
	SetSpeakDetail( OwnerID() , "[SC_423588_4]" )
end


---------------------------------------------------
--423590Ų�w�u��

function LuaS_423590()--���b�������W
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID() , 423590 ) == true and 
		CountBodyItem ( OwnerID() , 208275 ) == 1 then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423590_1]" , "LuaS_423590_1" , 0 )--���U�A�o�ʫH�æ���i�үd�H
	end
	if CheckAcceptQuest( OwnerID() , 423590 ) == true and CountBodyItem ( OwnerID() , 208275 ) == 0 then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423590_2]" , "LuaS_423590_2" , 0 )--���U�A���ʫH�Q�ЧAų�w�@�U�u���C
	end
end

function LuaS_423590_2()
	SetSpeakDetail ( OwnerID() , "[SC_423590_3]" )--�A�o��H�󵹧ڡA�ڤ~����k�P�_�H�󪺯u���C
end

function LuaS_423590_1()
	DelBodyItem ( OwnerID() , 208275, 1 )
	SetSpeakDetail ( OwnerID() , "[SC_423590_4]" )
	SetFlag( OwnerID(), 544616, 1 )
end


--------------------------------------------------------
---------423591�_�Ǫ�������

function LuaS_423591_1()	--���b�Ȩ�q�D�𮦨��W
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423591 ) == true  and	
		CheckFlag( OwnerID() , 544617 )	== false then
		AddSpeakOption ( OwnerID() , TargetID(),"[SC_423591_0]", "LuaS_423591_1_1" ,0)
	end
end

function LuaS_423591_1_1()
	SetSpeakDetail( OwnerID() , "[SC_423591_1]" )
	SetFlag( OwnerID() , 544617 , 1 )
end
-----

function LuaS_423591_2()	--���b�����D�F�֨��W
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423591 ) == true  and	
		CheckFlag( OwnerID() , 544618 )	== false then
		AddSpeakOption ( OwnerID() , TargetID(),"[SC_423591_5]", "LuaS_423591_2_1" ,0)
	end
end
function LuaS_423591_2_1()
	SetSpeakDetail( OwnerID() , "[SC_423591_2]" )
	SetFlag( OwnerID() , 544618 , 1 )
end
------
function LuaS_423591_3()	--���b�̮��D���h�F���W
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423591 ) == true  and	
		CheckFlag( OwnerID() , 544619 )	== false then
		AddSpeakOption ( OwnerID() ,TargetID(), "[SC_423591_6]", "LuaS_423591_3_1" ,0 )
	end
end

function LuaS_423591_3_1()
	SetSpeakDetail( OwnerID() , "[SC_423591_3]" )
	SetFlag( OwnerID() , 544619 , 1 )
end

-----------------------------------------------------
-------------------�`�J������
function Lua_116555() --�Ϫ��a���ݭn���Ȥ]�i�H�ߨ����~
	SetPlot( OwnerID(),"touch","Lua_116555_do",30 )--Ĳ�I�@��
end

function Lua_116555_do()
	if	CountBodyItem( OwnerID(),208276) < 1	then
		BeginPlot( TargetID(), "Lua_116555_Get", 0 )--�����˨��@��
		DW_CancelTypeBuff( 68,  OwnerID() )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_116555]", 0 )		
	end
end

function Lua_116555_Get()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	local item = 208276 --��o���~
	local num = 1 --��o�ƶq
	local time = 10 --���󭫥ͮɶ�  �@��ة� �ݭn�񭫥ͮɶ�  script���Ƕ�0
	CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- �ؼ�(target���a) ��o���~(item) �ƶq(num) �ɶ�(time)					
end

--�ϥΰ��˪��~�ˬd--
--/GM ? createflag 780800 
function LuaS_208276_0() --�ϥΫe�ˬd�O���O�b�d��
	if 	(DW_CheckDis(OwnerID(),780800,3,20) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,4,20) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,5,20) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,6,100) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,7,100) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) then
		DW_CancelTypeBuff(68)
		return true
	elseif		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_208276_0]", 0 )
		return false
	end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_208276_1]", 0 )
	return false
end



--���a�ݭn�ܨ��A�~��i�J��x
--�]������CLIENT  ���a���ˮ� �ݤ����� �~��i�J�^
--���˪��~�H�ɥi�H���o�A�e�x��x�������˦窫�i�H��

function LuaS_423593_1()   
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest (OwnerID() , 423593 ) == true	then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423593_1]", "LuaS_423593_1_1" , 0 ) --���a�G�����Τ���ɭԶ}�l��t�H
	end
end

function LuaS_423593_1_1()
	SetSpeakDetail ( OwnerID() , "[SC_423593_2]" )--......�]�A�J�Ӫ��ݵ۪�t�̪������A�o�o�{�Ŭ}�@���^
	SetFlag( OwnerID() , 544620 , 1 )--�o��X�� �߰ݶ}�t�ɶ�
end

-------

function LuaS_423593_2()
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest (OwnerID() , 423593 ) == true	then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423593_3]", "LuaS_423593_2_1()" , 0 ) --���a�G���A�n��ñ�W�ܡH
	end
end

function LuaS_423593_2_1()
	SetSpeakDetail ( OwnerID() , "[SC_423593_4]" )--......�]���e����t�̦��G�S��ť��A���ܡA�����L���A���s�b�^
	SetFlag( OwnerID() , 544621 , 1 )--�o��X�� �յۯ���ñ�W
end

-------

function LuaS_423593_3()
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest (OwnerID() , 423593 ) == true	then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423593_5]", "LuaS_423593_3_1()" , 0 ) --���a�G�i�H���Z�A�@�I�ɶ��ܡH
	end
end

function LuaS_423593_3_1()
	SetSpeakDetail ( OwnerID() , "[SC_423593_6]" )--......�]�A�o�{���e����t�̦��G�S������I�l�A���o�޲�����ۥѨ��ʡC�^
	SetFlag( OwnerID() , 544625 , 1 )--�o��X�� �յۻP��t�̤���
end


--PS.�p�G�n�b�����ε��C��Ωe�U���Ȫ��ܡA��ĳ�b�o�ӥ��ȧ�������A�A�����a�ݨ�o���Ȫ�NPC

--���a�ᱼ��A�A�d��������

function LuaS_423593()--���b�d�������W
LoadQuestOption ( OwnerID() )
	if	CheckCompleteQuest	( OwnerID(), 423593 ) == true  and	CountBodyItem ( OwnerID(), 208276 ) == 0 then	--�u�n�����L�`�J������ 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_423593_7]", "LuaS_423586_4",0) --�u�ڧⰰ�˥Ϊ���A�˥�F......�v
	end
end

function LuaS_423586_4()
	SetSpeakDetail( OwnerID() , "[SC_423586_8]")
	GiveBodyItem ( OwnerID(), 208276 , 1 )
end

-----------------------------------------------------
---------------423594���ת���q-----------------------

--[[function Lua_423446_start()
	local T_ID = TargetID()--����
	local O_ID = OwnerID() --���a
	
	if CheckFlag( O_ID, 544287) ~= true then	
		BeginPlot( T_ID, "Lua_423446_1", 0 )
		SetModeEx( T_ID, EM_SetModeType_Mark , false )
		DisableQuest( T_ID, true )
	end	
	return 1
end]]

function LuaS_423594()
	SetPlot( OwnerID(), "touch", "LuaS_423594_1" , 50 )
end
	
function LuaS_423594_1()
	if 	CheckAcceptQuest (OwnerID() , 423594 ) == false then	--�p�G�S������
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_2]" , "0xFFFFFF00"  ) --�N�u�O�@�ө_�Ǫ��۶�......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_2]" , "0xFFFFFF00"  )	
	elseif 	
		CheckAcceptQuest (OwnerID() , 423594 ) == true	and	--������ �B�S����ӺX��
		CheckFlag( OwnerID(), 544626 ) == false or 
		CheckFlag( OwnerID(), 544627 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_1]" , "0xFFFFFF00"  ) --�@�L��������A�Ұʶ��ǿ��~......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_1]" , "0xFFFFFF00"  )		
	elseif
		CheckFlag( OwnerID(), 544629 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_3]" , "0xFFFFFF00"  ) --�o�ӥ۬W���A���������......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_3]" , "0xFFFFFF00"  )
	elseif
		CheckFlag( OwnerID(), 544626 ) == true and 	--����ӺX��
		CheckFlag( OwnerID(), 544627 ) == true then
		SetFlag( OwnerID(), 544628 , 1 )
		SetFlag( OwnerID(), 544629 , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_0]" , "0xFFFFFF00"  ) --�A�Pı��@�ѯ�q�b��������...
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_0]" , "0xFFFFFF00"  )
	end
	
	
end	

----------------------------------------------------
--423595 �������u

function LuaS_423595()--���b423595����
	SetFlag( TargetID(), 544681 , 1 )
end

-----------------------------------------------------
-----------------------------------------------------

--423596���ƪ�����

function LuaS_423596()	--���b��i���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423596 ) == true  and	CheckFlag( OwnerID() , 544630 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423596_1]", "LuaS_423596_1", 0 )
	end
end

function LuaS_423596_1()
	SetSpeakDetail(	OwnerID() , "[SC_423596_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423596_3]", "LuaS_423596_2" , 0 )
end

function LuaS_423596_2()
	SetSpeakDetail(	OwnerID() , "[SC_423596_4]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423596_5]", "LuaS_423596_3" , 0 )
end

function LuaS_423596_3()
	SetSpeakDetail( OwnerID() , "[SC_423596_6]" )
	SetFlag( OwnerID() , 544630 , 1 )
end

-----------------------------------------------------
-----------------------------------------------------
function LuaS_208281_book_0()	--208281��z�L�������ɮ�
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_3]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_4]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_5]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, "[SC_208281_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID �ҭn����������ID(��0�h��������)�A�r�ꬰ���ѭ����D
end

-----------------------------------------------------
-----------------------------------------------------
------------423600��·�

function LuaS_423600_Magic()--�k�N�@���Ʊ� �]�m�b�򥻪k�N������@���W�ٸ�(�k�N�����n���אּ����@��)
	local Player = OwnerID()--���a
	local Obj = TargetID()--�ؼ�
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	local Goal = { 116564, 116565, 116586 }
	local Flag = { 544631, 544632, 544633 }
	for i=1, table.getn(Goal) do
		if OrgID == Goal[i] then	--�p�GOrgID��Goal[i]���j�M�쪺����@�� ����
			SetFlag( OwnerID(), Flag[i], 1 )	--���� Flag[i]�����X�Ф@��(Goal[i]�PFlag[i] ���ؼлP�n�����X�ж��ǭn�Ʀn)
			local Fire = LuaFunc_CreateObjByObj ( 116814, Obj ) --LuaFunc_CreateObjByObj�ѷӫ��w���󪺦�m�Ӳ��ͪ���
			WriteRoleValue( Fire, EM_RoleValue_LiveTime, 5 ) --�NFire�g�J����ɶ� 5��
			SetModeEx( Fire, EM_SetModeType_Mark, false )--SetModeEx=�]�wMode(�^�� bool) 
			--[[SetModeEx�D�n�O�@�Φb..�ëD�Ѫ���s�边�إX�� �ӬO��Script���ͥX�Ӫ�����W�A�D�n�\�ά���������W���]�m��軡����TIP�Φ��L���� ���O �O�_�Ŀ��x�s ]]
		end
	end	
end

function LuaS_423600_Do()--�q�L�ϥ��ˬd�����[�ϥΪ��~] 	(�]�m�b���~-�ϥήĪG����-Sever�ݼ@��-�ϥήĪG) 
	local Obj = ReadRoleValue( OwnerID(), EM_RoleValue_Register10 ) --�ŧiobj��LuaS_423600_Check�g�J��EM_RoleValue_Register10�Ȧs��
	WriteRoleValue( OwnerID(), EM_RoleValue_Register10, 0 ) --�O�dobjŪ���쪺�� ���O�M��EM_RoleValue_Register10�̭��g�J���Ȧs��
	CastSpell( OwnerID(), Obj, 496127 )--��obj�ϥ� �k�N  �ᬵ�u 
end --��禡���� obj�Q�M��

function LuaS_423600_Check()--�ϥΪ��~���ˬd	�]�m�b���~-���~�ϥ�-�ϥ��ˬdLUA�� (�n���ˬd�~��DO)
	local obj = SearchRangeNPC( OwnerID(), 50 ) --�ŧi �H���a������ �d��50��������obj
	local Goal = { 116564, 116565, 116586 } --�ŧi �D�n�ؼнs�� �� Goal
	local Flag = { 544631, 544632, 544633 } --�ŧi �X�нs����Flag
	local OrgID	--�ŧi ����b�ɮ׮w�̪��s��(�D�C�����B�ʪ�GID) ����o�ӭȷ|�䤣�쪫��
	for i= 0, table.getn(obj) do	
--[[(�]��SearchRangeNPC���{���ҥ]���禡 �ҥH�����q0�}�l�� �]��i=0   table.getn(obj) --�b�}�C�� �v�@�j�Mobj ]]
		OrgID = ReadRoleValue( obj[i], EM_RoleValue_OrgID )--�N�j�M�쪺obj�s���}�C obj[i] �ç����b�ɮ׮w�̪��T�w�s�� �üg��OrgID
		for j=1, table.getn(Goal) do 
--[[for�j�� �]���S�Ψ�{���]���禡 ��LUA�t�Ϊ���l�Ȭ�1 �ҥHj=1 �_�h�|���L0 �q1�}�l�� table.getn(Goal) --�b�}�C�� �v�@�j�MGoal ]]
			if OrgID == Goal[j] and CheckFlag( OwnerID(), Flag[j] ) ~= true then
			--�p�GOrgID����Goal[j]�}�C�����䤤�@�ӭ�(�]�N�Olocal Goal = { 116564, 116565, 116586 }�䤤�@��) 
			--�åB���a���W�X��"��"��Flag[j] �}�C�����䤤�@�ӭ� (�]�N�Olocal Flag = { 544631, 544632, 544633 }�䤤�@��)
				--debugmsg(0,0,"find")
				WriteRoleValue( OwnerID(), EM_RoleValue_Register10, obj[i] ) --�Nobj[i]�g�JEM_RoleValue_Register10���Ȧs
				return true		--�h�q�L�P�_�ø��X�禡 �B�^��true(�����禡)
			end
		end		
	end
	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_423600_1]" , 0 )--�ؼйL��
	return false--�_�h �^��false
end



------------------------------------------------------------
--------------------423690�Q�d�I���Գ�----------------------
function LuaS_423690()	--���b�������W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423690 ) == true  and	CheckFlag( OwnerID() , 544634 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423690_1]", "LuaS_423690_1", 0 )
	end
	if 	CheckAcceptQuest(OwnerID(),424213) == true 	and
		CountBodyItem(OwnerID(),209474) == 0		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424213_01]","LuaAS_424213_01",0)
	end
end

function LuaAS_424213_01()
	SetSpeakDetail(OwnerID(),"[SC_424213_02]")
	GiveBodyItem(OwnerID(),209474,1)
end

function LuaS_423690_1()
	SetSpeakDetail(	OwnerID() , "[SC_423690_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_11]", "LuaS_423690_2" , 0 )
end

function LuaS_423690_2()
	SetSpeakDetail(	OwnerID() , "[SC_423690_12]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_3]", "LuaS_423690_3" , 0 )
end

function LuaS_423690_3()
	SetSpeakDetail( OwnerID() , "[SC_423690_4]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_5]", "LuaS_423690_4" , 0 )
end

function LuaS_423690_4()
	SetSpeakDetail( OwnerID() , "[SC_423690_6]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_7]", "LuaS_423690_5" , 0 )
end
function LuaS_423690_5()
	SetSpeakDetail( OwnerID() , "[SC_423690_8]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_9]", "LuaS_423690_6" , 0 )
end
function LuaS_423690_6()
	SetSpeakDetail( OwnerID() , "[SC_423690_10]" )
	SetFlag( OwnerID() , 544634 , 1 )
end
