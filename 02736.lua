--===========================================================
--			�������a�ѻP�H��
--===========================================================
function Lua_jiyi_Xmas_121384_recode() --���b���ȼҪO�G���a�������ȫ����LUA�@���A�ΨӬ����ѥ[���ȤH��
	local npc = OwnerID()
	local player = TargetID()
	DesignLog( player , 121384 , " Xmas Code event STAR" )	--�O���ѥ[�H��
end
--===========================================================
--			���W�ͦN����ܼ@��
--===========================================================
function Lua_jiyi_Xmas_test_121382_givekey() --���W�ͦN����ܼ@��
	local player = OwnerID() 
	local npc = TargetID()
	local key = { 546795 , 547145 , 547229 } --�X�СG�w���L�_�͡B�w�������_�͡B�֥h�M�_�a
	local item = { 241796 , 241813 } --���~�G���_�͡B���_��
	CloseSpeak( player )	--������ܵ���
	if CheckAcceptQuest( player , 425335 )== true then--�P�_���a����425335������
		if CheckFlag( player , key[1] ) == false then --�P�_���a�S����L�_��
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_01]" )  --�n���_�ͪ���?
			AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121382_01]", "Lua_jiyi_Xmas_test_121382_givekey2(1)", 0 )  --���_��
		elseif  CountBodyItem( player , item[1] ) < 1 or CountBodyItem( player , item[2] ) < 1 then
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_02]" )  --�_�ͤ����F��?�A���@��
			AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121382_02]", "Lua_jiyi_Xmas_test_121382_givekey2(2)", 0 )  --�����_��
		else		
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_03]" )  --�^�h�a			
		end
	elseif CheckFlag( player , key[2] ) == true and CheckFlag( player , key[3] ) == false then 
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_02]" )  --�_�ͤ����F��?�A���@��
			AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121382_02]", "Lua_jiyi_Xmas_test_121382_givekey2(2)", 0 )  --�����_��
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_04]" )  --�O�ӱ������_�I�̶�	
	end
end

function Lua_jiyi_Xmas_test_121382_givekey2(unt) --���_�ͼ@��
	local player = OwnerID() 
	local npc = TargetID()
	local key = { 546795 , 547145 , 547229 } --�X�СG�w���L�_�͡B�w�������_�͡B�֥h�M�_�a
	local item = { 241796 , 241813 } --���~�G���_�͡B���_��
	CloseSpeak( player )
	if CheckAcceptQuest( player , 425335 )== true then--�P�_���a����425335������
		if unt == 1 then
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_05]" )  --�o�O�ܭ��n���_�͡A�ЧA�ȥ��n��浹[121384]�C
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_06]" )  --�٦n�ڳo���٦��ƥ����_�͡A�����A�a�C
		end
		SetFlag( player , key[1] , 1 ) --�}�Ҥw���L�_�ͺX��
		DelBodyItem( player , item[1] , 1 ) --�N���a���W�����_�ͲM��
		DelBodyItem( player , item[2] , 1 ) --�N���a���W�����_�ͲM��
		GiveBodyItem( player , item[1] , 1 ) --�����a���Ȫ��~
		GiveBodyItem( player , item[2] , 1 ) --�����a���Ȫ��~
	elseif CheckFlag( player , key[2] ) == true and CheckFlag( player , key[3] ) == false then 
		if unt == 1 then
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_05]" )  --�o�O�ܭ��n���_�͡A�ЧA�ȥ��n��浹[121384]�C
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_06]" )  --�٦n�ڳo���٦��ƥ����_�͡A�����A�a�C
		end
		SetFlag( player , key[1] , 1 ) --�}�Ҥw���L�_�ͺX��
		DelBodyItem( player , item[1] , 1 ) --�N���a���W�����_�ͲM��
		DelBodyItem( player , item[2] , 1 ) --�N���a���W�����_�ͲM��
		GiveBodyItem( player , item[1] , 1 ) --�����a���Ȫ��~
		GiveBodyItem( player , item[2] , 1 ) --�����a���Ȫ��~		
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_04]" )  --�O�ӱ������_�I�̶�	
	end		
	CloseSpeak( player )	
end
--===========================================================================
--					121370 �_�c��ܼ@��
--===========================================================================
function Lua_jiyi_Xmas_test_121370_box() --�_�c��ܼ@��
	local player = OwnerID() 
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 } --���~�G���_�� , ���_�� , ���_�_��
	local reg = ReadRoleValue( npc , EM_RoleValue_Register1 ) --�����_�c�O�_�i�H�}�ҹ�� =0 �i���
	local key = { 547229 , 547204 } --�X�СG�֥h�M�_�a�B�}�L�_�c
	CloseSpeak( player )	--������ܵ���
	if reg == 0 then 
		if CheckFlag( player , key[1] ) == true then --�ˬd���a�w�������_�ͥ���
			if CheckFlag( player , key[2] ) == false then --�ˬd���a�٨S�}�L�_�c
				if CountBodyItem( player , item[1] ) < 1 and CountBodyItem( player , item[2] ) < 1 and CountBodyItem( player , item[3] ) < 1 then --�ˬd���a�S���_��
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --�o�O�@�Ӵ��q���_�c
				elseif CountBodyItem( player , item[1] ) >= 1 or CountBodyItem( player , item[2] ) >= 1 then --�ˬd���a�����λ��_��
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_02]" )  --�o�{�@���_�c�A���G�i�H�έI�]�̪��_�Ͷ}��
					AddSpeakOption( player , npc , "[SC_2012XMAS_NPC_121370_03]" , "Lua_jiyi_Xmas_test_121370_box2(1)", 0 )  --�έI�]�̪��_�ͥ��}�_�c
				elseif CountBodyItem( player , item[3] ) >= 1 then --�ˬd���a���j�Ѫ��_��
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_04]" )  --�o�{���H�������_
					AddSpeakOption( player , npc , "[SC_2012XMAS_NPC_121370_05]" , "Lua_jiyi_Xmas_test_121370_box2(2)", 0 )  --���}�_�c						
				end
			elseif CheckFlag( player , key[2] ) == true then --�w�g����L�_�c
				SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_06]" )  --�o�O�@�Ӫ��_�c
			end
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --�o�O�@�Ӵ��q���c�l			
		end
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_07]" )  --���H�m���o�{�_�c			
	end
	CloseSpeak( player )	--������ܵ���
end

function Lua_jiyi_Xmas_test_121370_box2(mat) --���}�_�c
	local player = OwnerID() 
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 , 205807 , 724509 , 203734 }  --���~�G���_�͡B���_�� �B���_�_�͡B�ͤ��ή��~�B�����Ĥ��B�B�����y����
	local buff = 623674   --���_���A�GBUFF
	local reg = ReadRoleValue( npc , EM_RoleValue_Register1 ) --�����_�c�O�_�i�H�}�ҹ�� =0 �i���
	local R = Rand(100)+1 --rand�q0�}�l+1�ܱq1�}�l
	local key = { 547204 , 547145 } --�X�СG�}�L�_�c�B�������_��
	local String = "[SC_2012XMAS_NPC_121370_08]"
	WriteRoleValue( npc , EM_RoleValue_Register1 , 1 )
	CloseSpeak( player )
	if reg == 0 then
		DesignLog( player , 1213841 , " Xmas Code event OVER" )	--�O�������H��
		if mat == 2 then
			if CountBodyItem( player , item[3] ) >= 1 then --�ˬd���a�����_�_��			
				if R >= 60  then --��40%�����v
					String = String.."["..item[4].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[4] , 3 ) 
					GiveBodyItem( player , item[6] , 2 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--�A��o5�ӥͤ��ή��~�M1�i�B�����y����
				elseif R >= 30 and R < 60 then --��30%�����v
					String = String.."["..item[5].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[5] , 1 ) 
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--�A��o1�Ӭ����Ĥ��M1�i�B�����y����
				else  --��30%�����v
					String = String.."["..item[6].."]"			
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--�A��o1�i�B�����y����
				end
				DelBodyItem( player , item[1] , 1 ) --�N���a���W�������_�ͲM��
				DelBodyItem( player , item[2] , 1 ) --�N���a���W�������_�ͲM��
				DelBodyItem( player , item[3] , 1 ) --�N���a���W�������_�_�ͲM��
				SetFlag( player , key[1] , 1 ) --�}�Ҷ}�L�_�c�X��
				SetFlag( player , key[2] , 0 ) --���������_�ͺX��	
				BeginPlot( npc , "Lua_jiyi_Xmas_test_121370_boxhide", 0 ) --�_�c���ü@��
			else
				SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --�o�O�@�Ӵ��q���c�l
				WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --�}���_�c�i�I����
			end							
		else --mat == 1
			if CountBodyItem( player , item[1] ) >= 1 then --�ˬd���a�����_��
				if R >= 40 then --��60%���v
					String = String.."["..item[4].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[4] , 6 ) 
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--�A��o3�ӥͤ��ή��~�M2�i�B�����y����
				else  --��40%�����v
					GiveBodyItem( player , item[6] , 1 ) 
					AddBuff( player , buff , 0 , 10 ) --���_���A�GBUFF
					ScriptMessage( npc , player , 1 , "[SC_2012XMAS_NPC_121370_10]" , C_SYSTEM )--�A��o�F�B�����y�����A�P�ɤ]�Q���_�A�G�K
				end
				DelBodyItem( player , item[1] , 1 ) --�N���a���W�������_�ͲM��
				DelBodyItem( player , item[2] , 1 ) --�N���a���W�������_�ͲM��
				DelBodyItem( player , item[3] , 1 ) --�N���a���W�������_�_�ͲM��
				SetFlag( player , key[1] , 1 ) --�}�Ҷ}�L�_�c�X��
				SetFlag( player , key[2] , 0 ) --���������_�ͺX��	
				BeginPlot( npc , "Lua_jiyi_Xmas_test_121370_boxhide", 0 ) --�_�c���ü@��
			elseif CountBodyItem( player , item[2] ) >= 1 then --�ˬd���a�����_��
				if R >= 40 then --��60%���v
					String = String.."["..item[4].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[4] , 6 ) 
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--�A��o�ͤ��ή��~
				else  --��40%�����v
					GiveBodyItem( player , item[6] , 1 ) 
					AddBuff( player , buff , 0 , 10 )
					ScriptMessage( npc , player , 1 , "[SC_2012XMAS_NPC_121370_10]" , C_SYSTEM )--�A��o�F�B�����y�����A�P�ɤ]�Q���_�A�G�K
				end
				DelBodyItem( player , item[1] , 1 ) --�N���a���W�������_�ͲM��
				DelBodyItem( player , item[2] , 1 ) --�N���a���W�������_�ͲM��
				DelBodyItem( player , item[3] , 1 ) --�N���a���W�������_�_�ͲM��
				SetFlag( player , key[1] , 1 ) --�}�Ҷ}�L�_�c�X��
				SetFlag( player , key[2] , 0 ) --���������_�ͺX��
				BeginPlot( npc , "Lua_jiyi_Xmas_test_121370_boxhide", 0 ) --�_�c���ü@��
			else			
				SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --�o�O�@�Ӵ��q���c�l
				WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --�}���_�c�i�I����			
			end
		end
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_07]" )  --���H�m���o�{�_�c		
	end
	CloseSpeak( player )	
end	

function Lua_jiyi_Xmas_test_121370_boxhide() --�_�c�����@��
	local box = OwnerID()  --�_�c
	local player = TargetID() --���a
	local key = 546795 --�X�СGTEST_�_�c�_��
	CloseSpeak( player )
	hide( box ) --�����_�c
	sleep( 100 ) --����10����
	show( box , 0 ) --��{�_�c
	WriteRoleValue( box , EM_RoleValue_Register1 , 0 ) --�}���_�c�i�I����
end
--============================================================
--			���W�ͯS��ܼ@��
--============================================================
function Lua_jiyi_Xmas_test_121384_Robber() --���b�ͯS����ܼ@��
	local player = OwnerID()
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 } --���_�� , ���_�͡B���_�_��
	local key = { 546795 , 547145 , 547229 } --�X�СG���L�_�͡B�������_�͡B�֥h�M�_�a
	local reg2 = ReadRoleValue( npc , EM_RoleValue_Register2 ) --����npc�O�_�i�H�}�ҹ�� =0 �i���
	CloseSpeak( player )	--������ܵ���
	if reg2 == 0 then
			if CheckFlag( player , key[2] ) == true then --�ˬd���a���������_�ͺX��
				if CountBodyItem( player , item[1] ) >= 1 and CountBodyItem( player , item[2] ) >= 1 then --���a�����B���_��
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_01]" )  --�A�����_�ͤF��
					AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121384_01]" , "Lua_jiyi_Xmas_test_121384_Robber2(1)" , 0 )  --�����_��	
					AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121384_02]" , "Lua_jiyi_Xmas_test_121384_Robber2(2)" , 0 )  --�����_��
					AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121384_03]" , "Lua_jiyi_Xmas_test_121384_Robber2(3)" , 0 )  --�����B���_��
				elseif CheckFlag( player , key[3] ) == true then 
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_09]" )  --�h�M�䯦�_�a�C				
				else
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_03]" )  --�֨쫢���ҥ����					
				end	
			elseif CheckFlag( player , key[3] ) == true then --�ˬd���a���֥h�M�_�a�X��
				if CountBodyItem( player , item[1] ) >= 1 or CountBodyItem( player , item[2] ) >= 1 or CountBodyItem( player , item[3] ) >= 1 then --���a�����λ��_��
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_09]" )  --�h�M�䯦�_�a�C
				else
					LoadQuestOption(Player) --�I�J���ȼҪO��ܼ@��	
				end
			else	
				LoadQuestOption(Player)				
			end
	else
		LoadQuestOption(Player)
	end
	CloseSpeak( player )	--������ܵ���								 
end

function Lua_jiyi_Xmas_test_121384_Robber2(num) --����@�_�ͼ@��
	local player = OwnerID()
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 } --���_�� , ���_�� , ���q�_��
	local key = { 546795 , 547145 , 547229 } --�X�СG���L�_�͡B�w�������_�͡B�֥h�M�_�a
	CloseSpeak( player )
	WriteRoleValue( npc , EM_RoleValue_Register2 , 1 )
	if num == 1 then --���a��ܵ����_��
		if CountBodyItem( player , item[1] ) >= 1 then --�ˬd���a���W�O�_�����_��	
			DelBodyItem( player , item[1] , 1 ) --�N���a���W�������λ��_�ͲM��
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_05]" )  --���A�I�]���_�ͥh���_�c
			SetFlag( player , key[2] , 1 )	--���X�СG�w�������_��
			SetFlag( player , key[3] , 1 )	--���X�СG�֥h�M�_�a
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_06]" )  --�A�S���_��
		end			
	elseif num == 2 then --���a��ܵ����_��
		if CountBodyItem( player , item[2] ) >= 1 then --�ˬd���a���W�O�_�����_��
			DelBodyItem( player , item[2] , 1 ) --�N���a���W�������λ��_�ͲM��
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_05]" )  --���A�I�]���_�ͥh���_�c
			SetFlag( player , key[2] , 1 )	--���X�СGTEST_�������_��
			SetFlag( player , key[3] , 1 )	--���X�СG�֥h�M�_�a
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_06]" )  --�A�S���_��
		end
	else --���a��ܵ�����_��
		if CountBodyItem( player , item[1] ) >= 1 and CountBodyItem( player , item[2] ) >= 1 then --�ˬd���a���W�O�_�����M���_��	
			DelBodyItem( player , item[1] , 1 ) --�N���a���W�������_�ͲM��
			DelBodyItem( player , item[2] , 1 ) --�N���a���W�������_�ͲM��
			GiveBodyItem( player , item[3] , 1 ) --�����a���_�_��
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_07]" )  --��H�]����a�䯦�_�a
			SetFlag( player , key[2] , 1 )	--���X�СG�������_��
			SetFlag( player , key[3] , 1 )	--���X�СG�֥h�M�_�a			
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_06]" )  --�A�S���_��
		end							
	end
	WriteRoleValue( npc , EM_RoleValue_Register2 , 0 )	
	CloseSpeak( player )		
end

function Lua_jiyi_Xmas_test_121384_giveflag() --���ȧ��������P�_�X��
	local npc = OwnerID()
	local player = TargetID()
	local key = { 546795 , 547145 , 547232 , 547332 } --�X�СG���L�_�͡B�������_�͡B�M�_�e�m�B�e�i������(���ԧP�_��)
	local item = { 241796 , 241813 , 241365 } --���_�� , ���_�� , ���q�_��
	SetFlag( player , key[3] , 0 ) --�����M�_�e�m�X��
	SetFlag( player , key[1] , 1 ) --�}�Ү����_�c�_�ͺX��
	SetFlag( player , key[4] , 1 ) --�}�ҫe�i������(���ԧP�_��)�X��
	if CheckFlag( player , key[1] ) == true then --�ˬd���a�����L�_�ͺX��
		SetFlag( player , key[2] , 1 ) --�}�ҧ������_�ͺX��
	end	
	ScriptMessage( npc , player , 1 , "[SC_2012XMAS_NPC_121384_08]" , C_SYSTEM ) --���ɳͯS����V�A�Q�_��
end
--===================================================================
--					���ի��O
--===================================================================
function Lua_jiyi_Xmas_test_flag1() --���m����
	local own = OwnerID()
	local flag = { 547232 , 546795 , 547145 , 547229 , 547204 , 547332 } --�M�_�e�m�B��ͦN���L�_�͡B�������_�͡B�֥h�M�_�a�B�}�L�_�c�B�e�i������(���ԧP�_��)
	local item = { 241796 , 241813 , 241365 } --���_�� , ���_�� , ���q�_��
	local buff = 623674 --���_���A�G

	CancelBuff( own , buff ) --�R������BUFF
	for i = 1 , 6 do
		setflag( own , flag[i] , 0 ) --�����Ҧ��X��
	end
	if CountBodyItem( own , item[1] ) >= 1 or CountBodyItem( own , item[2] ) >= 1 or CountBodyItem( own , item[3] ) >= 1 then --���a�����λ��_��
		DelBodyItem( own , item[1] , 1 ) --�N���a���W�������_�ͲM��
		DelBodyItem( own , item[2] , 1 ) --�N���a���W�������_�ͲM��
		DelBodyItem( own , item[3] , 1 ) --�N���a���W�������_�_�ͲM��
	end			
end

function Lua_jiyi_Xmas_test_flag2() --���m���ȤG
	local own = OwnerID()
	local flag = { 547232 , 547145 , 547229 , 547204 } --�M�_�e�m�B�������_�͡B�֥h�M�_�a�B�}�L�_�c
	local buff = 623674 --���_���A�G

	CancelBuff( own , buff ) --�R��BUFF
	for i = 1 , 4 do
		setflag( own , flag[i] , 0 ) --�����Ҧ��X��
	end
	SetFlag( own , flag[1] , 1 ) --���e�m�X��
end