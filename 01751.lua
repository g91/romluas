--2010�~�զⱡ�H�`����

-----NPC �ȧJ�뺸��l�@��---------------------------------------
function lua_mika_whiteday_npc01() -- ��ѥ������ȹL �i�ݨ즹�ﶵ
	local start = Checkflag(OwnerID(), 543606) -- �����ȱ���
	local ing = Checkflag(OwnerID(), 543607) -- �i����Ȥ�
	local today = Checkflag(OwnerID(), 543608) -- ���Ѥw�����զⱡ�H�`����
	if today == true then
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC1_1]" ) --�@�A���@�Ӵr�֪��զⱡ�H�`��I
	else
		if start == true then
			LoadQuestOption(OwnerID())  --���J���ȼҪO
		else
			if ing == false then
				SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC1]" ) --���A�ڸӥh����o�ǪF��~�n�H
				AddSpeakOption(  OwnerID(), TargetID( ), "[SC_WHITEDAY_01]" ,  "lua_mika_whiteday_npcgo",  0 ); -- �A�ݰ_�Ӧ��G������дo�H 	
			else 
				SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC1]" ) --���A�ڸӥh����o�ǪF��~�n�H
			end
		end
	end
end

function lua_mika_whiteday_npcgo() --�ﶵ  �A�ݰ_�Ӧ��G������дo�H
	CloseSpeak(OwnerID())
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_02]" )   --�K�y   ���ܤH,�o�ܤH,string
	----�A�@�N���ڪ����ܡH�u�O�Ӧn�F�C
	Setflag(OwnerID(), 543606, 1) -- ��ѥi�����Ȫ��A
end
-----------���ȼҪO�ƥ�-------------------------------------
function lua_mika_whiteday_npc03() --���U���Ȯ� ��questflag 
	Setflag(TargetID(), 543607, 1) -- �i����Ȥ�
end

function lua_mika_whiteday_npc04() --������ ��questflag 
	local item1 = CountBodyItem(TargetID(), 206922 ) --���֥d��
	local item2 = CountBodyItem(TargetID(), 206923 ) --�u�ߥd��
	if item2 >= 1 then
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_03]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�γ\�߷N��§�������󬰭��n�A�ڷ|�n�n�N�ڪ��Q�k��b�o�i�d���浹[������]�C
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_04]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�P�§A�����ڤ���~�O�̭��n���A�p�G�A�|�����A���u�R�A�Ʊ�A��ɧִM���A�p�G�A�w�g���F��H�A�Ʊ�A�̯੼���ñ����C
		sleep(10)
		DelBodyItem(TargetID(), 206923, 1) -- �u�ߥd��
		GiveBodyItem(TargetID(), 206927, 1) -- ���H�A��§��
		Setflag(TargetID(), 543606, 0) -- del �����ȱ���
		Setflag(TargetID(), 543607, 0) -- del �i�椤
		Setflag(TargetID(), 543608, 1) -- give ���Ѥw�����զⱡ�H�`����
	elseif item1 >= 1 then
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_03]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�γ\�߷N��§�������󬰭��n�A�ڷ|�n�n�N�ڪ��Q�k��b�o�i�d���浹[������]�C
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_04]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�P�§A�����ڤ���~�O�̭��n���A�p�G�A�|�����A���u�R�A�Ʊ�A��ɧִM���A�p�G�A�w�g���F��H�A�Ʊ�A�̯੼���ñ����C
		sleep(10)
		DelBodyItem(TargetID(), 206922, 1) -- ���֥d��
		GiveBodyItem(TargetID(), 206928, 1) -- ���H�t��§��
		Setflag(TargetID(), 543606, 0) -- del �����ȱ���
		Setflag(TargetID(), 543607, 0) -- del �i�椤
		Setflag(TargetID(), 543608, 1) -- give ���Ѥw�����զⱡ�H�`����
	else
		Setflag(TargetID(), 543606, 0) -- del �����ȱ���
		Setflag(TargetID(), 543607, 0) -- del �i�椤
		Setflag(TargetID(), 543608, 1) -- give ���Ѥw�����զⱡ�H�`����
	end
end
-----NPC ù�ª�l�@��---------------------------------------
function lua_mika_whiteday_npc05() --
	local key1 = Checkflag(OwnerID(), 543609) -- ��ѻ���L
	local ing = Checkflag(OwnerID(), 543607) -- �i����Ȥ�
	if ing == true and key1 == false then
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_2_01]" )
		--(�A�ݨ�[ù��]���b��z���̪��F��A�ݰ_�ӥ��ǳƥ��L�C)
		--�p�G�A�O�ӰݯS�s��§�����ƪ��ܡA��西�n��X�̫�@�M�o�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_WHITEDAY_2_02]" , "lua_mika_whiteday_npc51", 0 ) --�ण�����ڷQ�ӿ�k�H
	else
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC2]" ) 
		--�o�����X���զⱡ�H�`�S�s���ơA�P�q�u�O�W�G�ڪ��w���ڡ�I
		--�ڷQ���~�`��i�H�e���o�@�ӹ��˪�§���F�a�I
	end
end

function lua_mika_whiteday_npc51() --
	local BorG = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )  
	if BorG == 0 then --�k
		CloseSpeak(OwnerID())
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03B1]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�ݦb�A�B��n�A�ڤ����٦��@�ǥ��g������[206918]�A�p�G�A�n���ܴN�����A�@�ǧa
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03B2]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�u���L�K�A�o��ƥi�O�i�D����H���C
		sleep(10)
		GiveBodyItem(OwnerID(), 206918, 2) -- �]�˯�
		Setflag(OwnerID(), 543609, 1) -- ���Ѥw�Mù�»���L
	elseif BorG == 1 then -- �k
		CloseSpeak(OwnerID())
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03G1]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�o�Ӹ`�餣�ӬO�k�ʨ��W�b�i����l�ڡA�A������ݭn�ܡH
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03G2]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�A���A�b���H�������ơH�n�A���ڧ��ݳѾl�����ƽc���٦��S����Ϊ��F��C
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03G3]" )   --�K�y   ���ܤH,�o�ܤH,string
		--�˹�§�����ܡA�o�����Ө����F�C
		sleep(10)
		GiveBodyItem(OwnerID(), 206919, 2) -- �v�a
		Setflag(OwnerID(), 543609, 1) -- ���Ѥw�Mù�»���L
	end
end

-----NPC �S���l�@��---------------------------------------
function lua_mika_whiteday_npc06() --
	local ing = Checkflag(OwnerID(), 543607) -- �i����Ȥ�
	local key2 = Checkflag(OwnerID(), 543633) -- ��ѻ���L
	if  ing == true and key2 == false then
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC3]" ) 
		--�ҿױ��H�`�̦n��§���A�N�O�N�A�̯u�۪����r���y�g�b�d���W�A�ݤ��ݭn�Ӥ@�i���H�`�S�s�d���O�H
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_WHITEDAY_3_01]" , "lua_mika_whiteday_npc61", 0 ) --�е��ڤ@�i�S�s�d��
	else
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC3]" ) 
		--�ҿױ��H�`�̦n��§���A�N�O�N�A�̯u�۪����r���y�g�b�d���W�A�ݤ��ݭn�Ӥ@�i���H�`�S�s�d���O�H
	end
end

function lua_mika_whiteday_npc61() --
	CloseSpeak(OwnerID())
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_3_021]" )   --�K�y   ���ܤH,�o�ܤH,string
	--���n�N��A���ͷN�Ӧ��A�쥻�������n�d����§���{�b�����V�b�@�_�C
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_3_022]" )   --�K�y   ���ܤH,�o�ܤH,string
	--�p�G�A���ɶ����ܡA�N�q�̭���@�ӧa�C
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_3_023]" )   --�K�y   ���ܤH,�o�ܤH,string
	--�ܩ�̭������e�O����A�N�o�ЧA���}�T�{�F�C
	sleep(10)
	GiveBodyItem(OwnerID(), 206920, 1) -- ���H�d��§��
	Setflag(OwnerID(), 543633, 1) -- ���Ѥw�M�S�����L
end