--1172

function LuaYU_112150_0()

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L


	if flower == false and change == false  then

		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

	end


	SetSpeakDetail( OwnerID(), "[SC_112150_YU_01]"   )--�C�~�ᯫ�`���ɭԡA�����`�O�}�o�S�O����B�A�R��b�o�ʤH�̪��`��̡A�A�O�_�@�N�I�X�A���u�ߡB�@�ߨӦu�@�A���R���O�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "LuaYU_112150_1", 0 ) --�ᯫ�`���Ѩ�
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_03]" , "LuaYU_112150_2", 0 ) --�]�k��������
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_24]" , "LuaYU_112150_9", 0 ) --�I���]�k�����ؤl
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_25]" , "LuaYU_112150_11", 0 ) --�������Ӭ���

end

function LuaYU_112150_1()

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_05]"   )--�ᯫ�`���G��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_0", 0 ) --�T�{

end

function LuaYU_112150_2()

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L

	if flower == false   then

		SetSpeakDetail( OwnerID(), "[SC_112150_YU_06]"   )--�֦��ᯫ�����֡A�L�׬O�M��R���Ϊ̬O�u�@�R�����|�ܱo�D�`���Q�A�A�@�N�I�X�A���u�ߡB�@�ߨӰ����]�k�����ܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_07]" , "LuaYU_112150_5", 0 ) --�@�N�A�ڭn�u�@�R��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_08]" , "LuaYU_112150_6", 0 ) --�@�N�A�ڭn�M��R��

	else
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_26]"   )--�P�±z���ѻP�I�C�H�C���]�k�����ؤl���t�B�����A�z�i�H���ѦA�ӰѻP��I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_24]" , "LuaYU_112150_9", 0 ) --�I���]�k�����ؤl
	end



end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_112150_4()--�������

	CloseSpeak( OwnerID() )                     

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaYU_112150_5() --���⪴��

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end
		
			SetFlag( OwnerID()  , 542173 , 1 )

			GiveBodyItem( OwnerID() , 203204  , 1 ) --�������ؤl
			GiveBodyItem( OwnerID() , 203647  , 1 ) --�i�ˤ����e��

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_09]"   )--����Q�A�u�@���ʤH�u�O���֡A�a�۳o���]�k�����ؤl��<CM>[111815]</CM>�n�n�����ӥL�I�]�k��������ֳt���l���åB�_���A�ҥH���ӹL�{���i��l���ή`�A�@�w�n�n�n���O�@�L�I�t�~�o�~�e�����A�����ΡA���ث�n������A�ؤl�~�|�o�ަ����A�������n�`�N�������ɥR��I�u�ߡB�@�ߪ����@�~����ӥX���ᯫ���֪����ꪴ���I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end


end

function LuaYU_112150_6() --�Ŧ⪴��

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	


			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end


			SetFlag( OwnerID()  , 542173 , 1 )		

			GiveBodyItem( OwnerID() , 203205  , 1 ) --�Ū����ؤl
			GiveBodyItem( OwnerID() , 203647  , 1 ) --�i�ˤ����e��

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_10]"   )--���֧A������Q���ë��R���A�a�۳o���]�k�����ؤl��<CM>[111815]</CM>�n�n�����ӥL�I�]�k��������ֳt���l���åB�_���A�ҥH���ӹL�{���i��l���ή`�A�@�w�n�n�n���O�@�L�I�t�~�o�~�e�����A�����ΡA���ث�n������A�ؤl�~�|�o�ަ����A�������n�`�N�������ɥR��I�u�ߡB�@�ߪ����@�~����ӥX���ᯫ���֪����ꪴ���I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end




end


--��������l

function LuaYU_112150_7() 

		SetPlot( OwnerID()  ,"touch",  "LuaYU_112150_8" , 20 )   

end

function LuaYU_112150_8() 

	local Waterbattle =  CountBodyItem( OwnerID() , 203647 ) --�Ų~�l


	if  Waterbattle == 0  then  

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_39]" , C_SYSTEM  ) --�A�ݭn�e���Ӧ����]�k���i�G�C
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_39]" , 0 ) --

	elseif  Waterbattle > 0  then  

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_37]" , C_SYSTEM  ) --�A�N�e���˺��F�]�k���i�G�C
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_37]" , 0 ) --

		DelBodyItem( OwnerID() , 203647 , 1 )
		GiveBodyItem( OwnerID() , 203646  , 1 ) --�˺������e��
	end
end


function Lua_Valentine_blessing_talk()
	SetSpeakDetail( OwnerID(), "[SC_VALENTINE_BLESSING_2]"   )--�C�~�ᯫ�`�A�ڭ̷|�P�O����|�|��e�R�����h�z�լ��ʡA�o���z���R�ߥu�ݮ��m999���A�z�չ���N��o�z�����U�A�ڭ̤]�N���z��D�ᯫ�����֡A�аݱz�O�_�@�N�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_VALENTINE_BLESSING_3]" , "Lua_Valentine_blessing_talk1", 0 ) --�O���A���@�N�I
end

function Lua_Valentine_blessing_talk1()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money) >= 999 then
		GiveBodyItem( OwnerID() , 203024 , 1 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -999 )
		CloseSpeak( OwnerID() )
	else 
		SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaYU_112150_9() --*

		SetSpeakDetail( OwnerID(), "[SC_112150_YU_27]"   )--���F�����R�P�M����@�ɪ��U�Ө����A�p�G�z�@�N���m1��<CN>[202904]</CN>�Ϊ�8��<CN>[203648]</CN>�A�ڭ̱N����<CN>[203204]</CN>���z�I���A�p�G�A�Ӥ߰����]�k�����A�@�ѳ̦h�i�H��o5��<CN>[203648]</CN>��I�V�O���@�A�������a�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_41]" , "LuaYU_112150_10", 0 ) --��[202904]�I��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_42]" , "LuaYU_112150_10_2", 0 ) --��[203648]�I��

end


function LuaYU_112150_10() 

	local Rune =  CountBodyItem( OwnerID() , 202904 ) --�ǰe�̲Ť�

	if Rune > 0 then
		
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_06]"   )--�֦��ᯫ�����֡A�L�׬O�M��R���Ϊ̬O�u�@�R�����|�ܱo�D�`���Q�A�A�@�N�I�X�A���u�ߡB�@�ߨӰ����]�k�����ܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_07]" , "LuaYU_112150_5_2", 0 ) --�@�N�A�ڭn�u�@�R��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_08]" , "LuaYU_112150_6_2", 0 ) --�@�N�A�ڭn�M��R��
	else
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_28]"   )--��p�A�z���W�S��<CN>[202904]</CN>��I
	end

end

function LuaYU_112150_10_2() 

	local Rose =  CountBodyItem( OwnerID() , 203648 ) --�����������

	if Rose >= 8 then
		
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_06]"   )--�֦��ᯫ�����֡A�L�׬O�M��R���Ϊ̬O�u�@�R�����|�ܱo�D�`���Q�A�A�@�N�I�X�A���u�ߡB�@�ߨӰ����]�k�����ܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_07]" , "LuaYU_112150_5_3", 0 ) --�@�N�A�ڭn�u�@�R��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_08]" , "LuaYU_112150_6_3", 0 ) --�@�N�A�ڭn�M��R��
	else
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_40]"   )--��p�A�z���W�S��<CN>[203648]</CN>��I--*
	end

end

function LuaYU_112150_11() 

		SetSpeakDetail( OwnerID(), "[SC_112150_YU_29]"   )--�ᯫ�`�X�j�|��<CN>�������Ӭ���</CN>�A�Z<CN>��馨�\���|10������</CN>�̱N�P�تᯫ������§���A�����|��o�ڤۮy�M - �W���~�A�Φb<CN>���ʴ��������\���|30������</CN>�̱N��o�@�ӯS��ٸ���I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_30]" , "LuaYU_112150_12", 0 ) --�I���ᯫ������§��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_31]" , "LuaYU_112150_13", 0 ) --�I���ᯫ�`�ٸ�

end

function LuaYU_112150_12() 
	
	local UseItem1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)
	local UseItem0 = 0

	if UseItem1 >= 10 then

		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	
			UseItem0 = UseItem1 - 10
			GiveBodyItem( OwnerID() , 203649  , 1 ) 
--			GiveBodyItem( OwnerID() , 204073  , 3 )  --�]��4.0.0�����X�]�k���o�t�� �N�ĦX������o���� (4.0.1 �������)

			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , UseItem0 )   

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_32]"   )--�P�±z���ѻP�I�o�O�ᯫ�����z�����֡I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end	
	else
			SetSpeakDetail( OwnerID(), "[SC_112150_YU_33]" .. "|cffff00ff" .. UseItem1 .. "|r"  )--�Z<CN>��馨�\���|10������</CN>�̱N�P�تᯫ������§���A�����|��o�ڤۮy�M - �W���~��I�z�ثe���������ơG
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
	end

end

function LuaYU_112150_13() 

	local Rose =  CountBodyItem( OwnerID() , 530051 ) --�ٸ�
	local UseItem2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)
	local UseItem0 = 0

	if UseItem2 >= 30 and Rose == 0 then
	
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			UseItem0 = UseItem2 - 30
			GiveBodyItem( OwnerID() ,  530051  , 1 ) --�ٸ�
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , UseItem0 )   


			SetSpeakDetail( OwnerID(), "[SC_112150_YU_32]"   )--�P�±z���ѻP�I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end	
	elseif Rose > 0 then

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_32]"   )--�P�±z���ѻP�I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
	
	elseif UseItem2 < 30 and Rose == 0 then

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_35]" .. "|cffff00ff" .. UseItem2 .. "|r"  )--�Z<CN>���ʴ��������\���|30������</CN>�̱N��o�@�ӯS��ٸ���I�z�ثe���������ơG
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
	end

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�ǰe�̤����I����

function LuaYU_112150_5_2() --���⪴��

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end

			DelBodyItem( OwnerID() , 202904 , 1 )
			SetFlag( OwnerID()  , 542174 , 1 ) --�I���L���X��	
		
			SetFlag( OwnerID()  , 542173 , 1 )

			GiveBodyItem( OwnerID() , 203204  , 1 ) --�������ؤl
			GiveBodyItem( OwnerID() , 203647  , 1 ) --�i�ˤ����e��

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_09]"   )--����Q�A�u�@���ʤH�u�O���֡A�a�۳o���]�k�����ؤl��<CM>[111815]</CM>�n�n�����ӥL�I�]�k��������ֳt���l���åB�_���A�ҥH���ӹL�{���i��l���ή`�A�@�w�n�n�n���O�@�L�I�t�~�o�~�e�����A�����ΡA���ث�n������A�ؤl�~�|�o�ަ����A�������n�`�N�������ɥR��I�u�ߡB�@�ߪ����@�~����ӥX���ᯫ���֪����ꪴ���I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end


end

function LuaYU_112150_6_2() --�Ŧ⪴��

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L

		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end

			DelBodyItem( OwnerID() , 202904 , 1 )
			SetFlag( OwnerID()  , 542174 , 1 ) --�I���L���X��

			SetFlag( OwnerID()  , 542173 , 1 )		

			GiveBodyItem( OwnerID() , 203205  , 1 ) --�Ū����ؤl
			GiveBodyItem( OwnerID() , 203647  , 1 ) --�i�ˤ����e��

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_10]"   )--���֧A������Q���ë��R���A�a�۳o���]�k�����ؤl��<CM>[111815]</CM>�n�n�����ӥL�I�]�k��������ֳt���l���åB�_���A�ҥH���ӹL�{���i��l���ή`�A�@�w�n�n�n���O�@�L�I�t�~�o�~�e�����A�����ΡA���ث�n������A�ؤl�~�|�o�ަ����A�������n�`�N�������ɥR��I�u�ߡB�@�ߪ����@�~����ӥX���ᯫ���֪����ꪴ���I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end




end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------������������I����

function LuaYU_112150_5_3() --���⪴��

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end




			DelBodyItem( OwnerID() , 203648 , 8 )
			SetFlag( OwnerID()  , 542174 , 1 ) --�I���L���X��	
		
			SetFlag( OwnerID()  , 542173 , 1 )

			GiveBodyItem( OwnerID() , 203204  , 1 ) --�������ؤl
			GiveBodyItem( OwnerID() , 203647  , 1 ) --�i�ˤ����e��

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_09]"   )--����Q�A�u�@���ʤH�u�O���֡A�a�۳o���]�k�����ؤl��<CM>[111815]</CM>�n�n�����ӥL�I�]�k��������ֳt���l���åB�_���A�ҥH���ӹL�{���i��l���ή`�A�@�w�n�n�n���O�@�L�I�t�~�o�~�e�����A�����ΡA���ث�n������A�ؤl�~�|�o�ަ����A�������n�`�N�������ɥR��I�u�ߡB�@�ߪ����@�~����ӥX���ᯫ���֪����ꪴ���I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end


end

function LuaYU_112150_6_3() --�Ŧ⪴��

	local flower =  CheckFlag( OwnerID()  , 542173 ) --���L��L
	local change =  CheckFlag( OwnerID()  , 542174 ) --���L��L

		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end

			DelBodyItem( OwnerID() , 203648 , 8 )
			SetFlag( OwnerID()  , 542174 , 1 ) --�I���L���X��

			SetFlag( OwnerID()  , 542173 , 1 )		

			GiveBodyItem( OwnerID() , 203205  , 1 ) --�Ū����ؤl
			GiveBodyItem( OwnerID() , 203647  , 1 ) --�i�ˤ����e��

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_10]"   )--���֧A������Q���ë��R���A�a�۳o���]�k�����ؤl��<CM>[111815]</CM>�n�n�����ӥL�I�]�k��������ֳt���l���åB�_���A�ҥH���ӹL�{���i��l���ή`�A�@�w�n�n�n���O�@�L�I�t�~�o�~�e�����A�����ΡA���ث�n������A�ؤl�~�|�o�ަ����A�������n�`�N�������ɥR��I�u�ߡB�@�ߪ����@�~����ӥX���ᯫ���֪����ꪴ���I
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --�T�{
		end




end