--�`�y���� 2009�~3���w�R�`
--�إ߮ɶ�: 2009/02/13
--�ק���: 2009/03/12
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--���~ ����̲M�� 204114

------------------------------------------------------------------------------
function LuaS_112312_list()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_112312_112]" );
	ShowBorder( OwnerID(), 0, "[SC_112312_111]" , "ScriptBorder_Texture_Paper" )
end

------------------------------------------------------------------------------
--����3 ���ɰe�H

------------------------------------------------------------------------------
function LuaN_112312_0() --��Script�g�bNPC�箦�W
	--LoadQuestOption( OwnerID() )
	local today= CheckFlag(OwnerID()  , 542396) -- ����w�ѹL������
	local allpass= CheckFlag(OwnerID()  , 542395) -- �w�e��npc5
	local getnpc4= CheckFlag(OwnerID()  , 542394) -- �w�e��npc4
	local getnpc3= CheckFlag(OwnerID()  , 542393) -- �w�e��npc3
	local getnpc2= CheckFlag(OwnerID()  , 542392) -- �w�e��npc2
	local getnpc1= CheckFlag(OwnerID()  , 542391) -- �w�e��npc1
	local getnpc0= CheckFlag(OwnerID()  , 542390) -- �Mnpc0���F
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	local clock = ClockRead( OwnerID() , EM_ClockValueType_NowTime ) --�˼Ƭ��

	if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then
		if  clock > 0  then --Ū��������� �p�ɬ�Ƥ�= 0
			if today== true then
				SetSpeakDetail( OwnerID(), "[SC_112312_TODAY]" )-- ���ѯu�O���W�A�F�C�����쪺�ܡA���ѦA�~��ЧA������I
			elseif allpass== true then--�p�G�w��������(�w�e��npc5)
					ClockClose( OwnerID() )
					SetSpeakDetail( OwnerID(), "[SC_112312_5]" )-- �z���t�ׯu�O��H�ڡA���F�P�±z�����ҡA�o§���N�ЧA���U�a�I
					GiveBodyItem( OwnerID() , 203864  , 1 ) --�R�|§��
					if letter > 0 then
						DelBodyItem(OwnerID() ,203865 , letter) --�������a���W�Ҧ��R�|�ܽШ�
					end
					SetFlag( OwnerID()  , 542396 , 1 ) -- �����a today Flag
			elseif getnpc4 ==false or getnpc3 ==false or getnpc2 ==false or getnpc1 ==false then
				SetSpeakDetail( OwnerID(), "[SC_112312_001]" )--�n�ЧA�����H�e������̦��G(��)
			end
		elseif clock == 0 then   --Ū��������� clock =0  ������Ȫ��Aor���~����.1~4���q����y)  
			if today== true then --�p�G���Ѥw�ѹL
                		SetSpeakDetail( OwnerID(), "[SC_112312_TODAY]" )-- ���ѯu�O���W�A�F�C�����쪺�ܡA���ѦA�~��ЧA������I
			else
				if getnpc4== true then --�p�G�w�e��npc4
					SetSpeakDetail( OwnerID(), "[SC_112312_4]" )-- �N�t�o��@�I�F�A(��)
					GiveBodyItem( OwnerID() , 520122  , 1 ) --�Ť���OII X1 
					GiveBodyItem( OwnerID() , 203295  , 5 ) --�P���j���Ϥ�x5
					SetFlag( OwnerID()  , 542396 , 1 ) -- �����a today Flag
				else      
					if getnpc3== true then --�p�G�w�e��npc3
						SetSpeakDetail( OwnerID(), "[SC_112312_123]" )-- �]�\�z���~�����Ǿ�~�F�a�C(��)
						GiveBodyItem( OwnerID() , 203868  , 5 ) --�����]�k�Ĥ�X5
						GiveBodyItem( OwnerID() , 203294  , 5 ) --���ѽ��׷Ϥ�X5
						SetFlag( OwnerID()  , 542396 , 1 ) -- �����a today Flag
					else
						if getnpc2== true then--�p�G�w�e��npc2
							SetSpeakDetail( OwnerID(), "[SC_112312_123]" )-- �]�\�z���~�����Ǿ�~�F�a�C(��)
							GiveBodyItem( OwnerID() , 200154  , 10 ) --��¦�����Ĥ� X10
							GiveBodyItem( OwnerID() , 203295  , 2 ) --�P���j���Ϥ� X2
							SetFlag( OwnerID()  , 542396 , 1 ) -- �����a today Flag
						else
							if getnpc1== true then--�p�G�w�e��npc1
								SetSpeakDetail( OwnerID(), "[SC_112312_123]" )-- �]�\�z���~�����Ǿ�~�F�a�C(��)
								GiveBodyItem( OwnerID() , 200154  , 5 ) --��¦�����Ĥ� X5
								GiveBodyItem( OwnerID() , 203294  , 2 ) --���ѽ��׷Ϥ� X2
								SetFlag( OwnerID()  , 542396 , 1 ) -- �����a today Flag
							else
								if getnpc0== true then--�p�G������
									SetSpeakDetail( OwnerID(), "[SC_112312_NOT]" )-- �ѰڡA�A�Ӥ��|��o��Ƨѥ��F�a�I(��)
									if letter > 0 then
										DelBodyItem(OwnerID() ,203865 , letter) --�������a���W�Ҧ��R�|�ܽШ�
									end
									SetFlag( OwnerID()  , 542396 , 1 ) -- �����a today Flag
								else -- ���ʪ�l
									SetSpeakDetail( OwnerID(), "[SC_112312_0]" )-- �G�F�I�o�̳��M�٦�5���ܽШ��٨S�H�X�h�I(��)
									AddSpeakOption( OwnerID(), OwnerID( ), "[SC_112312_01]" , "LuaN_112312_go", 0 ) --�����e�U�u���ɰe�H�v
								end
									
							end
						end 
					end
					
				end
			end
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_112311_8]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C  SC_112311_8
	end
end
----------------------------------------------------------------------------------------------
function LuaN_112312_go() -- �����e�U
	SetSpeakDetail( OwnerID(), "[SC_112312_001]" )-- �n�ЧA�����H�e������̦��G(...��)
	GiveBodyItem( OwnerID() , 203865  , 5 ) --�R�|�ܽШ�x5
	GiveBodyItem( OwnerID() , 204114  , 1 ) --����̲M��x1
	ClockOpen( OwnerID(), EM_ClockCheckValue_3 , 480, 480 , 0  , "" , "Lua_112312clock_close" ); --�]�w�p�ɾ��}�l,8����
	SetFlag( OwnerID()  , 542390 , 1 ) -- �����a getnpc0 Flag
end
--------------------------------------
function Lua_112312clock_close()  --�p�ɾ�����
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	ClockClose( OwnerID() )
	if letter > 0 then
		DelBodyItem(OwnerID() ,203865 , letter) --�������a���W�Ҧ��R�|�ܽШ�
	end
	ScriptMessage( OwnerID(),  OwnerID(), 2, "[SC_112312_BACK]" , 0 )	--�ɶ��˼ư���A�Ц^�����s����箦�^���C
end
----------------------------------------------------------------------------------------------
function LuaN_112314_1() -- npc1
	local getnpc1= CheckFlag(OwnerID() , 542391) -- �w�e��npc1
	local getnpc0= CheckFlag(OwnerID() , 542390) -- �Mnpc0���F
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	if getnpc1 == true then --npc1�w�g�e�F
		SetSpeakDetail( OwnerID(), "[SC_112314_03]" )--  [����]���K�쩳�ӶR�W���b���ݨ쪺�M���٬O�Ȧ�ӤH���~�M�n�O�H (��)
	else  -- false
		if getnpc0 == true then --�w�Mnpc0��(���ȶi�椤)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112314_02]" )-- [�i��]���M�{�b�~�e��A�A�]���ݬݬO���ɭԤF�C(��)
				DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
				SetFlag( OwnerID()  , 542391 , 1 ) -- �����a getnpc1 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
			end
		else -- false (���������ʪ��A)
			SetSpeakDetail( OwnerID(), "[SC_112314_01]" )-- [����]���~���R�|�w��e���|�O���ǤH�ڡA��{�b�s�i�ܽШ糣�S�H�X�h�I
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112315_1() -- npc2
	local getnpc2= CheckFlag(OwnerID()  , 542392) -- �w�e��npc2
	local getnpc1= CheckFlag(OwnerID()  , 542391) -- �Mnpc1���F
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�

	if getnpc2 == true then --npc2�w�g�e�F
		SetSpeakDetail( OwnerID(), "[SC_112315_03]" )--  [����]�ݨӳ̪�S�}�l���x�_���o�C(��)
	else  -- false
		if getnpc1 == true then --�w�Mnpc1��(���ȶi�椤)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112315_02]" )-- [�i��]���ڪ��ܽШ�H(��)
				SetFlag( OwnerID()  , 542392 , 1 ) -- �����a getnpc2 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
			end
		else -- false (���������ʪ��A)
			SetSpeakDetail( OwnerID(), "[SC_112315_01]" )-- [����] �n�O�A���ӤQ�~���ӡA�ڻ����w�N�������U�o�ܽШ��o�C(��)
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112316_1() -- npc3
	local getnpc3= CheckFlag(OwnerID()  , 542393) -- �w�e��npc3
	local getnpc2= CheckFlag(OwnerID()  , 542392) -- �Mnpc2���F
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�

	if getnpc3 == true then --npc3�w�g�e�F
		SetSpeakDetail( OwnerID(), "[SC_112316_03]" )--  [����]�P�§A�S�a�]�o�򻷮����ڡA�^�h�����Фp�߰ڡC
	else  -- false
		if getnpc2 == true then --�w�Mnpc2��(���ȶi�椤)
			if letter > 0 then --�p�G���W���ܽШ�
				SetSpeakDetail( OwnerID(), "[SC_112316_02]" )-- [�i��]����R�|���ٯu���ѱo�@���G�b�A�t���h�Ӧ^�h�ǳƤ~��C
				DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
				SetFlag( OwnerID()  , 542393 , 1 ) -- �����a getnpc3 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
			end
		else -- false (���������ʪ��A)
			SetSpeakDetail( OwnerID(), "[SC_112316_01]" )-- [����]�o�̬O�ڳ̳��w���a��C(��)
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112317_1() -- npc4
	local getnpc4= CheckFlag(OwnerID()  , 542394) -- �w�e��npc4
	local getnpc3= CheckFlag(OwnerID()  , 542393) -- �Mnpc3���F
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�

	if getnpc4 == true then --npc4�w�g�e�F
		SetSpeakDetail( OwnerID(), "[SC_112317_03]" )--  [����]���~���R�|�w�ƪ����ǧƱ�O���j�a����ڡC 
	else  -- false
		if getnpc3 == true then --�w�Mnpc3��(���ȶi�椤)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112317_02]" )-- [�i��]�ܽШ�ڡA�P�§A�S�a�e�L�ӡC
				DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
				SetFlag( OwnerID()  , 542394 , 1 ) -- �����a getnpc4 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
			end
		else -- false (���������ʪ��A)
			SetSpeakDetail( OwnerID(), "[SC_112317_01]" )-- [����]�A���ݨ�@���۬�����Ȫ��֤k�ܡH(��)
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112318_1() -- npc5
	local getnpc5= CheckFlag(OwnerID()  , 542395) -- �w�e��npc5
	local getnpc4= CheckFlag(OwnerID()  , 542394) -- �Mnpc0���F
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�

	if getnpc5 == true then --npc5�w�g�e�F
		SetSpeakDetail( OwnerID(), "[SC_112318_03]" )--  [����]�p�G���D���̦��R�|�A�˥X�ɪ��ܡA�N�q���ڤ@�n�a�C
	else  -- false
		if getnpc4 == true then --�w����npc4(���ȶi�椤)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112318_02]" )-- [�i��]�R�|���ܽШ�ܡH(��)
				DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
				SetFlag( OwnerID()  , 542395 , 1 ) -- �����a allpass Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
			end
		else -- false (���������ʪ��A)
			SetSpeakDetail( OwnerID(), "[SC_112318_01]" )-- [����] ����o�譱����ơA�����D�o�̦h���h�ڡC
		end
	end
end
-----------------------------------------------------------------------------------------