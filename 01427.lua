function LuaYU_NPC2009helloween_transport_01()

	SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_25]"   )
--���A�A�A�A��̷ӥD�H���h�J�A�b�o�ӤH�H�˯��˰����y�夤�A�ڭ̭n�M�_�I�̭̪��ӹC���C�p�G�A���N�@���ܡA���Υ���N���A�ڭ̱N�Χְ��a�A�쬡�ʲ{���A�A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111577_YU_17]" , "LuaYU_NPC2009helloween_transport_02", 0 ) --�e�ڹL�h

end

function LuaYU_NPC2009helloween_transport_02()
	CloseSpeak( OwnerID() )      

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_26]".. "|r" , 0 ) --�n�X�o�o�A���n��~�I
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_26]".. "|r" , 0 ) 
	sleep(15)
	BeginPlot(  OwnerID()  , "LuaYU_NPC2009helloween_transport_03" , 0 )  
end

function LuaYU_NPC2009helloween_transport_03()

	ChangeZone( OwnerID(), 2, 0, 1776.1, -36.5, 9153.6, 228 )

end


function LuaYU_NPC2009helloween_01()

	local play =  CheckFlag( OwnerID()  , 543293 ) --���Ѥw�g�ӹL
	local ISGM = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)

	if ISGM == 0 then

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! You're GM ! SO PASS".. "|r" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."GM ! You're GM ! SO PASS".. "|r" , 0 ) 

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_10]"   )

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_NPC2009helloween_02", 0 ) --����C���W�h
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_04", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "LuaYU_NPC2009helloween_05", 0 ) --���y�I��


	elseif  play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--���A�A�A�A��O�N�S���ɶܡH�C�H�C�ѥu���@�����|��I���ѦA�ӧa�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "LuaYU_NPC2009helloween_05", 0 ) --���y�I��
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_11]" , "LuaYU_NPC2009helloween_03 ", 0 ) --��L��ĳ


	elseif CheckBuff( OwnerID() , 504979) == true  then

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_14]"   )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_NPC2009helloween_02", 0 ) --����C���W�h

	elseif play == false then

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_10]"   )
--���A�A�A�A��̷ӥD�H���h�J�A�b�o�ӤH�H�˯��˰����y�夤�A�ڭ̭n�M�_�I�̭̪��ӹC���C
--�ڬO ���Ԫ��p���C���Ը��R �����Ӫ��Ϫ̡A�o���A�ڭ̱a�ӤF��[���D�Ԫ�����-���K�S�g���I
-- �p�G�A�q�L�F����A�N�����|��������M�����Ԥp���M�˩Ψ�L���������y�A�A�A�A�A��
--�ǳƱ����Ӧ۪��K�S���D�ԤF�ܡI�H�A�A�A�A��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_NPC2009helloween_02", 0 ) --����C���W�h
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_04 ", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "LuaYU_NPC2009helloween_05", 0 ) --���y�I��


	end

end

function LuaYU_NPC2009helloween_02()--����C���W�h

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_11]"   )


--�W�h��²��A�������j�n��-�g���֤߶}�l��ʫ�A�K�|���� �޲����n�� �A�b�޲����n��«�ʮ��I���L�A
--�A�N���\���X�p�n�ʩǡA�èϮ֤ߨ���@�w�{�ת��ˮ`�B�B�H�����ͤT���C�⪺�c�]�n�ʬ�A�b���y�a�Y�u
--�������A�Y�S���ή��I���A�K�|���ͤT���C�⪺�]�ʧ����A�A�A�A�A�A��A�i�O�S��k�����L����I
--���O���Y�P�]�ʬۦP�C�⪺�c�]�n�ʬ�o�i�H���]�ʩӨ��c�]���ʦL�A����|�T�D�ʦL�ɡA�]�ʱN�|�R�X���K
--�Ͼ��g���֤ߡI�p���A�N�|���ͧ�h���c�]�n�ʬ�C

--���\�R���g���֤߮ɡA�N�����v�X�{�g���]�ʤ��A�����C�⪺�n�ʬ󳣥i�H��L���Y��I
--(�V�u���ɶ��R���g���֤ߡA�]�ʤ��X�{�����v�]�N�V���I)

--�p���覡�G

--���X�p�n�ʩǡA�o1���C
--���\���Y�X�n�ʬ�A�o1���C

--�I���覡�G
--�̤��ưt���C

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_04 ", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_01", 0 ) --�^�W�@��

end

function LuaYU_NPC2009helloween_03()--��L��ĳ

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_03]"   )
--�p�G�ٷQ�A���@�����ܡA

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_02", 0 ) --����C���W�h

end

function LuaYU_NPC2009helloween_04()--�D���D��

	CloseSpeak( OwnerID() )      

	AddBuff(OwnerID(), 504979,0,-1)

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_13]".. "|r" , 0 ) 
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_13]".. "|r" , 0 ) 

	local Score = 0

	ClockOpen( OwnerID()  ,EM_ClockCheckValue_2,300,300,0,"LuaYU_NPC2009helloween_end","LuaYU_NPC2009helloween_end")--�˼ƭp�ɾ� (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")

	SetSmallGameMenuType( OwnerID() , 5 , 1 ) --�}�Ҥ���( �ϥΪ�,�r��Ǹ�,1�}/2�� )
	SetSmallGameMenuStr( OwnerID() , 5 , 1 , "[SC_RUNRUNPUMPKIN_12]" ) -- TIPS ���ʼ��D
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr  SC_BEERDAY_49 = ���� <-- Tips

	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --�O������

--	SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- ��������

--	INSTANCE_STATE_05  =  ���K�S�g��
--	INSTANCE_SCORE_05 = ����
--	INSTANCE_TIPS_05 = �Цb�p�ɤ��A�ھڴ��X�����D�A�I�ﴣ�Ѫ����s�@���C���D���T�N�[<CY> 1 </CY>�I���ơA���D���~�h��<CS> 2 </CS>�I���ơC

--	02 = OwnerID() ���᪺ 2


end

function LuaYU_NPC2009helloween_end()--�D���D��

	ClockClose(OwnerID())
	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_24]".. "|r" , 0 ) 
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_24]".. "|r" , 0 ) 

	CancelBuff( OwnerID(), 504979 );	
	CancelBuff( OwnerID(),  504940);	
	CancelBuff( OwnerID(),  504941);	
	CancelBuff( OwnerID(),  504942);	
	CancelBuff( OwnerID(),  504943);	
	CancelBuff( OwnerID(),  504944);	
	CancelBuff( OwnerID(),  504945);	

	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 

--	Say( OwnerID() ,  Score )

	GiveBodyItem( OwnerID() , 206021  , Score ) --�g���ԪG

	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --�M�Ť���
	SetSmallGameMenuType( OwnerID() , 5 , 2) -- ��������	

	SetFlag( OwnerID() , 543293, 1)

end

function LuaYU_NPC2009helloween_05()--���y�I��

	local ISGM = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)

	if ISGM == 0 then

--		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! You're GM ! SO PASS".. "|r" , 0 ) 
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."GM ! You're GM ! SO PASS".. "|r" , 0 ) 


		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_17]"  ) --���A�A�A�A��ӧa�A�i�D�ڧA�Q�I������H

		AddSpeakOption( OwnerID(), TargetID(), "Give me [206021]" , "LuaYU_NPC2009helloween_GM_01", 0 ) -- ���ڨg�����K
		AddSpeakOption( OwnerID(), TargetID(), "NickName  Del" , "LuaYU_NPC2009helloween_GM_02", 0 ) -- ���ڲM���n�ʸ`�Ҧ��ٸ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_18]" , "LuaYU_NPC2009helloween_05_01", 0 ) -- �I��§��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_19]" , "LuaYU_NPC2009helloween_05_02", 0 ) -- �H�K���򳣦n
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_01", 0 ) --�^�W�@��

	else

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_17]"  ) --���A�A�A�A��ӧa�A�i�D�ڧA�Q�I������H

		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_18]" , "LuaYU_NPC2009helloween_05_01", 0 ) -- �I��§��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_19]" , "LuaYU_NPC2009helloween_05_02", 0 ) -- �H�K���򳣦n
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_01", 0 ) --�^�W�@��

	end
end

function LuaYU_NPC2009helloween_GM_01()
	CloseSpeak( OwnerID() )      
	GiveBodyItem(  OwnerID()  , 206021 , 999 )--�g�����K

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! OK".. "|r" , 0 ) 
end

function LuaYU_NPC2009helloween_GM_02()-- ���ڲM���n�ʸ`�Ҧ��ٸ�
	CloseSpeak( OwnerID() )      

	DelBodyItem(  OwnerID()  , 530003 , 1 ) 
	DelBodyItem(  OwnerID()  , 530004 , 1 ) 
	DelBodyItem(  OwnerID()  , 530364 , 1 ) 
	DelBodyItem(  OwnerID()  , 530365 , 1 ) 
	DelBodyItem(  OwnerID()  , 530366 , 1 ) 

	SetFlag( OwnerID() , 543293, 0)

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! OK".. "|r" , 0 ) 

end

function LuaYU_NPC2009helloween_05_01()--�I��§��

	local Fire =  CountBodyItem( OwnerID() , 206021 ) --�g�����K

	if Fire > 49 then

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_20]"  ) --�A�Q�n§���r�H����50�Өg�����K�A�ڱq§���U�̭���@��§�����A�C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_18]" , "LuaYU_NPC2009helloween_05_01_01", 0 ) -- �I��§��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --�^�W�@��

	else

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_22]"  ) --�A�Q�n§���r�H���O�ݭn50�Өg�����K�A�ڤ~��q§���U�̭���@��§�����A��C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --�^�W�@��

	end

end

function LuaYU_NPC2009helloween_05_01_01()
	local PlayerID = OwnerID()
	local Fire =  CountBodyItem( OwnerID() , 206021 ) --�g�����K
	local Amit =  CountBodyItem( OwnerID() , 530004 ) --�ٸ��G�n�u�a�I���K�S


	CloseSpeak( OwnerID() )      

	DelBodyItem( PlayerID , 206021 , 50 ) --�g�����K

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) --�n�ʸ`�ּ�
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) 

	local P = 100
	local XX = Rand( P )      

	if XX>=70 and XX<100 then
		GiveBodyItem( PlayerID , 203142 , 1 )--���§��
	elseif XX>=35 and XX<70 then
		GiveBodyItem( PlayerID , 203240 , 5 )--�n�ʸɵ�§��

	elseif XX>=5 and XX<35 then
		GiveBodyItem( PlayerID , 203239 , 1 )--����§��
	else
		GiveBodyItem( PlayerID , 206007, 1 )--�g���Ÿ�§��
	end

	if Amit == 0 and Fire >= 250 then

		GiveBodyItem( PlayerID , 530004, 1 )

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530004]".. "|r" , 0 ) --���ߨ��o�ٸ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530004]".. "|r" , 0 ) --���ߨ��o�ٸ�

	end

end

function LuaYU_NPC2009helloween_05_02()--�H�K���򳣦n


	local Fire =  CountBodyItem( OwnerID() , 206021 ) --�g�����K

	if Fire > 24 then

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_21]"  ) --�H�K���򳣦n�r�H���򵹧�25�Өg�����K�A�ڴN�H�K���A�Ӥ���a�C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_19]" , "LuaYU_NPC2009helloween_05_02_01", 0 ) -- �H�K���򳣦n
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --�^�W�@��

	else


		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_23]"  ) --�H�K���򳣦n�r�H����ܤ֭n��25�Өg�����K�A�ڤ~�൹�A��C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --�^�W�@��

	end


end

function LuaYU_NPC2009helloween_05_02_01()
	local PlayerID = OwnerID()
	CloseSpeak( OwnerID() )      
	local Fire =  CountBodyItem( OwnerID() , 206021 ) --�g�����K
	local Amit =  CountBodyItem( OwnerID() , 530003 ) --�ٸ��G���K�S�g��

	DelBodyItem( PlayerID , 206021 , 25 )

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) --�n�ʸ`�ּ�
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) 

	local P = 100
	local XX = Rand( P )      

	if XX>=60 and XX<100 then--40
		GiveBodyItem( PlayerID , 203240 , 3 )--�n�ʸɵ�§��
	elseif XX>=30 and XX<60 then--30
		GiveBodyItem( PlayerID , 203239, 1 )--�n�ʯ���§��
	elseif XX>=15 and XX<30 then--15
		GiveBodyItem( PlayerID , 203142, 1 )--�n�����§��
	elseif XX>=10 and XX<15 then--5
		GiveBodyItem( PlayerID , 203178, 1 )--�j��KEY
	else--10
		GiveBodyItem( PlayerID , 203090, 1 )--�p�n���ܨ�
	end

	if Amit == 0 and Fire >= 150 then

		GiveBodyItem( PlayerID , 530003, 1 )

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530003]".. "|r" , 0 ) --���ߨ��o�ٸ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530003]".. "|r" , 0 ) --���ߨ��o�ٸ�

	end

end




function LuaI_helloCool2( Option )
	local PlayerID = OwnerID()
	local PackageID = 206007		--�g���Ÿ�§��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local KEY =  CountBodyItem( PlayerID , 203178 ) --�j�Ѫ��_��
	local SEX = ReadRoleValue( OwnerID()  ,EM_RoleValue_SEX) 


	local Item = {	724055,		-- �ŭ���
			724880,		-- �k�g����
			724881	}		-- �k�g����

	local probability = {	55,		-- 
				45	}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( CountBodyItem( PlayerID , 203178 ) >= 1 ) then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
				
		else
			if SEX == 0 then
			GiveBodyItem( PlayerID , Item[2] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
			else
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )	
			end	
		end
	end
end