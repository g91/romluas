----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_00() -- ��ѥ������ȹL �i�ݨ즹�ﶵ

--	�e�X�ѡA�ڭ̪���s�H���o�{�F�@�طs������ - �E�X���ءA�o�ت��誺��q�߰ʤް_�F��s�H�������׿���C
--	�]���ڭ̵o�_�F�M��E�X���ت����ʡA�b�����ʴ����A�u�n�A�浹�ڭ̤@�w�ƶq���E�X���ش��Ѭ�s�A�ڴN�|���A�״I�����S��C

--	Say( OwnerID() , "1" ) -- ���a
--	Say( TargetID() , "2" ) -- NPC

	BeginPlot( TargetID() , "Lua_Hao_KR_203038_Bonus_Range" , 0 ) -- �Z���W�L50�Y������ܵ���

	local Key = Checkflag(OwnerID() , 543959 ) 	-- ����Key
	local Accept = Checkflag(OwnerID() , 543960 ) 	-- ���ȶi�椤
	local Over = Checkflag(OwnerID() , 543961 ) 	-- ���ȧ���
	if Over == true then
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 254 ) -- ���i�y
		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) -- �A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
	--	LoadQuestOption(OwnerID())  --���J���ȼҪO
	else
		PlayMotion( TargetID() , 106 ) -- �I�Y
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		if Key == true then -- ����Key�A�i�D�Ԯɤ~���J
		--	PlayMotion( TargetID() , 112 ) -- ��
			LoadQuestOption(OwnerID())  --���J���ȼҪO
			AddSpeakOption(  OwnerID() , TargetID() , "[SC_KOREA_BONUS_04]" ,  "Lua_Hao_KR_203038_Bonus_01",  0 ) -- �ڸӥh���̤~������[207224]�O�H
		else -- ����Key�A���i�D��
			if Accept == false then -- �������ȶi�椤��Key
			--	PlayMotion( TargetID() , 106 ) -- �I�Y
				SetSpeakDetail( OwnerID() , "[SC_KOREA_BONUS_00]" ) -- �A�n�A�ڬO�����Űӷ|���ӤH[114785]�A����n�ƷQ��A�@�_����... 
				AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_BONUS_01]" ,  "Lua_Hao_KR_203038_Bonus_02",  0 ) -- �O����Ʊ��O�H
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_01() -- �ﶵ �ڸӥh���~����o[207222]�O�H

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_007]" ) --�u�n���˻P�A���D¾���Ŭ۪񪺩Ǫ��A�N�����|��B�����~�ɨ��o�C
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_KR_203038_Bonus_00", 0 ) --�^��W�@��
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_02() --�ﶵ  �O����Ʊ��O�H

	local Over = Checkflag(OwnerID() , 543961 ) 	-- ���ȧ���

--	Say( OwnerID() , "02 = 1" ) -- ���a
--	Say( TargetID() , "02 = 2" ) -- NPC
	CloseSpeak( OwnerID() )

--	if Over == true then
--		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V 
--		PlayMotion( TargetID() , 254 ) -- ���i�y
--		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) -- �A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
--		AddSpeakOption(  OwnerID() , TargetID() , "[SC_KOREA_BONUS_04]" ,  "Lua_Hao_KR_203038_Bonus_01",  0 ) -- �ڸӥh���~����o[207222]�O�H
--	else
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 112 ) -- ��
		Setflag( OwnerID() , 543959 , 1 ) -- ����Key 
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
		AddSpeakOption(  OwnerID() , TargetID() , "[SC_KOREA_BONUS_04]" ,  "Lua_Hao_KR_203038_Bonus_01",  0 ) -- �ڸӥh���~����o[207222]�O�H
--	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_03() --�������ȫ�A�A���檺Script�C

--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- ���a
	AdjustFaceDir( OwnerID() , TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 106 ) -- �I�Y
	Setflag( TargetID() , 543960, 1 ) -- ���ȶi�椤
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_04() -- �������ȫ�A�A���檺Script�C

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 102 )

--	Say( TargetID() , "1" )	-- ���a
--	Say( OwnerID() , "2" )	-- NPC

	SetFlag( TargetID() , 543959 , 0 ) -- �R������Key
	SetFlag( TargetID() , 543960 , 0 ) -- �R�����ȶi�椤
	SetFlag( TargetID() , 543961 , 1 ) -- �������w���§�]�X��
--	GiveBodyItem( TargetID() , 203038 , 100 ) -- ����100�ӥ����ťN��
--	Sleep(20)
--	PlayMotion( OwnerID() , 103 )  -- �|�u

end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_Range() -- �Z���W�L50�Y������ܵ���

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --���a

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- ���V
			local Count = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
			X = Count + 1 
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , X )

			if CheckAcceptQuest( TargetID() , 423077 ) == true then
				if Count == 1 then
					tell( TargetID() , OwnerID() ,"[SC_KOREA_BONUS_02]" ) --�@���ݧA���n�����C
					PlayMotion( OwnerID() , 116 ) -- �A��
					break
				elseif Count == 2 then
					tell( TargetID() , OwnerID() , "[Sys423077_szquest_uncomplete_detail]" ) -- �O���O�@���@��A�ɶ��N�O�����C
					PlayMotion( OwnerID() , 103 ) -- �|�u
					break
				elseif Count > 2 then
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
					PlayMotion( OwnerID() , 116 ) -- �A��
					break
				end
			elseif CheckAcceptQuest( TargetID() , 423077 ) == false and Checkflag( TargetID() , 543961 ) == false then
				tell( TargetID() , OwnerID() ,"[SC_KOREA_BONUS_03]" ) --�@�A...�O�h�áA�N�O�A�A���D�A���Q���D�ҿת��n�����ܡH
				PlayMotion( OwnerID() , 109 ) -- ���W
				break
			end
		end
		sleep(5)
	end
end