function LuaYU_TaiwanCCB2_01()

	AddBuff(  OwnerID(),  503217, 1, -1)

	While true do

		PlayMotion( OwnerID(), 125) 
		AddBuff( OwnerID() ,503012 ,1 ,5 ); --�S�� 

		sleep(50)
	end

end

function LuaYU_TaiwanCCB2_02()


	SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_01]"   )--�˷R���_�I�̱z�n�A�ڬO�m�Ѥѻ�ѤѦ��ġn���ʤj�� - �p��A���F���z�b�_�I���ȵ{����[�ֳt�������I<CM>�C��</CM>���w��z�ӦV�ڻ��<CM>�_�I�̱M�ݪ�§��</CM>��I���ڤѤ����z�[�o�I
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_02]" , "LuaYU_TaiwanCCB2_03", 0 ) --�ڭn����_
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_03]" , "LuaYU_TaiwanCCB2_04", 0 ) --�ڭn�⧤�M
	
end


function LuaYU_TaiwanCCB2_03()

	local daylygift =  CheckFlag( OwnerID()  , 543286 ) --�C�魫�m
	local Taiger =  CountItem( OwnerID() , 201928 ) --�ä[���p�Ԫꧤ�M

	if daylygift == true then

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111577_YU_14]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_04]"   )--�˷R���_�I�̡A�z���Ѥw�g����L<CM>�_�I�̱M�ݪ�§��</CM>�F��I�Q���z���Ѫ֩w�g���L�۷��m�S�״I���ȵ{�A<CM>�w��z���ѦA�ӦV�ڻ���I���ڬ��z�[�o�I</CM>
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --�^�W�@��

	else

		GiveBodyItem( OwnerID() ,  203574  , 3 ) --���Ÿg���ľ�
		GiveBodyItem( OwnerID() ,  201610  , 6 ) --�ޯ��ľ�
		GiveBodyItem( OwnerID() ,  202322  , 3 ) --���ĩ��B�ľ�
		SetFlag( OwnerID()  , 543286 , 1 ) --���}���m�X��

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWANCCB2_10]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_05]"   )--�˷R���_�I�̡A�z���W�F�I�Ʊ�o��<CM>�_�I�̱M�ݪ�§��</CM>�ର�z�a�ӧֳt�������A���z��`�J�������[�״I���_�I�ȵ{�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --�^�W�@��


	end

end

function LuaYU_TaiwanCCB2_04()

	local daylygift =  CheckFlag( OwnerID()  , 543286 ) --�C�魫�m
	local Taiger =  CountItem( OwnerID() , 201928 ) --�ä[���p�Ԫꧤ�M

	if Taiger > 0 then

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_DAN_111700_20]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_06]"   )--�M���۵��p�Ԫꧤ�M���z�ݰ_�ӤQ�����ªZ�I�z�ٳ��w�ܡI�H���ʴ������C��_�I�̳�<CM>�u��֦��@��</CM>��I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_08]" , "LuaYU_TaiwanCCB2_05", 0 ) --���M���ϥΤ�k
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --�^�W�@��

	else

		GiveBodyItem( OwnerID() ,  201928  , 1 ) --�ä[���p�Ԫꧤ�M

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWANCCB2_11]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_07]"   )--�i�r�����M�~��ǰt�i�����_�I�̡I���ʴ������C��_�I�̳��i�H�֦��@�ǫi�r��<CM>���p�Ԫꧤ�M</CM>��I���L���۱z�[�t������h���_�I�ȵ{�a�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_08]" , "LuaYU_TaiwanCCB2_05", 0 ) --���M���ϥΤ�k
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --�^�W�@��

	end

end

function LuaYU_TaiwanCCB2_05()

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_09]"   )--�˷R���_�I�̡A���}�z���I�]( �ֱ��� B )��짤�M�G<CM>[201928]</CM>�����I��<CM>�ƹ��k��</CM>�A�N�i�H�M�����M�o�I�o�ɭԱz�b<CM>�e�����k�W��<CM>�N�|�X�{�ӧ��M���ĪG�ϥܡA�n�����M�����A�A�u�ݭn�w��<CM>���M���ĪG�ϥ�</CM>�I��<CM>�ƹ��k��</CM>�A�N�i�H�����M�����A�o�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --�^�W�@��

end

function Yu_TaiwanNewPlayerPackage_01( Option )
	local PlayerID = OwnerID()
	local PackageID = 206000		--���٤��Էs��]
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then

			ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWAN_PACKAGE_01]".. "|r" , 0 ) --
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 202322 , 1 )	
		GiveBodyItem( PlayerID , 202264 , 1 )	
		GiveBodyItem( PlayerID , 202320 , 1 )	
		GiveBodyItem( PlayerID , 201139 , 1 )	
		GiveBodyItem( PlayerID , 203576 , 1 )	
		GiveBodyItem( PlayerID , 203044 , 2 )	
		GiveBodyItem( PlayerID , 203045 , 2 )	
		GiveBodyItem( PlayerID , 203336 , 1 )	

	end
end

function Yu_TaiwanNewPlayerPackage_02( Option )
	local PlayerID = OwnerID()
	local PackageID = 206001		--�c�]�d�������]
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then

			ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWAN_PACKAGE_01]".. "|r" , 0 ) --
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 202322 , 1 )	
		GiveBodyItem( PlayerID , 202319 , 1 )	
		GiveBodyItem( PlayerID , 202321 , 1 )	
		GiveBodyItem( PlayerID , 201139 , 2 )	
		GiveBodyItem( PlayerID , 203050 , 2)	
		GiveBodyItem( PlayerID , 203051 , 2 )	
		GiveBodyItem( PlayerID , 203052 , 2 )	
		GiveBodyItem( PlayerID , 203305 , 1 )	

	end
end