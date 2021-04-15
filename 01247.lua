function LuaInside_SURVIVE()
	SetCrystalID( TargetID(), 430 ); 	--�]�w�޲z���v�޳�
	LoadQuestOption( OwnerID() )
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_1]" , "Lua_SURVIVE_GetGuildBidInfo", 0 ) --�ڷQ���W3v3�ͦs�Գ�������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_2]" , "Lua_SURVIVE_Teach", 0 ) --�ڷQ�F��3v3�ͦs�Գ����W�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_2_6V6]" , "Lua_SURVIVE6v6_Teach", 0 ) --�ڷQ�F��6v6�ͦs�Գ����W�h
end

function Lua_SURVIVE_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(430) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 430, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
--	Say(OwnerID(),"SendBGInfoToClient")
end
function Lua_SURVIVE_Teach()
	SetSpeakDetail( OwnerID(), "[SC_SURVIVEINSIDE_3]"   )	--�o�O�@�Ӧ���3�H�q�����ͦs�Գ��A�H�ӤH�[�J��C�A���C���F��6�H�p���ɡA�N�|�H���t�令�T�H�@�լ��ۦP�}��A�ܦ���Ӱ}�窺�r���C 
									--�i�J�Գ���A�|������������ݮɶ��A�p�G��������Ҧ��i�J��C�����a�٨S����A�h�����Գ��A�Ӧ��Գ��S����Ӫ̡C 
									--�C�����@�ӼĤ�}�禨���A�v��W�[100���Գ��n���A���@��}�窺�Գ��n���F��2000���ɡA�h�Ӱ}����ӡA�Գ������C 
									--���`���᪺�����I�b�}��_�l�X�o�I�A���ͮɦ�10���������͵L�ġC
									--��}��Գ��n���F��500�B1000�B1500�ɡA�Ӱ}�窱�a�ҷ|��o50�I�a�A�ȡC 
									--�ͦs�Գ�����Ӱ}�禨���A���׬O�_�w���`�A�ҵo��100�I�a�A�ȡC 
									--���ɶi��ɡA�C3�����|�X�{�]�k�L�O�b���W�C 
end
function Lua_SURVIVE6v6_Teach()
	SetSpeakDetail( OwnerID(), "[SC_SURVIVEINSIDE_3_6V6]"   )	--�o�O�@�Ӧ���3�H�q�����ͦs�Գ��A�H�ӤH�[�J��C�A���C���F��6�H�p���ɡA�N�|�H���t�令�T�H�@�լ��ۦP�}��A�ܦ���Ӱ}�窺�r���C 
									--�i�J�Գ���A�|������������ݮɶ��A�p�G��������Ҧ��i�J��C�����a�٨S����A�h�����Գ��A�Ӧ��Գ��S����Ӫ̡C 
									--�C�����@�ӼĤ�}�禨���A�v��W�[100���Գ��n���A���@��}�窺�Գ��n���F��2000���ɡA�h�Ӱ}����ӡA�Գ������C 
									--���`���᪺�����I�b�}��_�l�X�o�I�A���ͮɦ�10���������͵L�ġC
									--��}��Գ��n���F��500�B1000�B1500�ɡA�Ӱ}�窱�a�ҷ|��o50�I�a�A�ȡC 
									--�ͦs�Գ�����Ӱ}�禨���A���׬O�_�w���`�A�ҵo��100�I�a�A�ȡC 
									--���ɶi��ɡA�C3�����|�X�{�]�k�L�O�b���W�C 
end