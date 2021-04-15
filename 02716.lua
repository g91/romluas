--SC_SASA2012_26
--240502--���u
-----------------------------------------------���
--�� NPC ��--

function sasa_Auction_npc01()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	local PID = ReadRoleValue( TID , EM_RoleValue_PID )  --0 = �D���ʮɬq , 1 = ���W�}��
	if PID == 1 then
		SetSpeakDetail( OID , "[SC_SASA2012_01]" )   --���
		--�w��ѥ[�o���O���m�з|�A�U���ڭ̳��|�H�����ˤ��P���ݩʹ��~�A���ѻP�o�����ʪ��z�A���F�������~�A�����o�@�I���y�C
		--������´���|�ݭn�j�q��<CS>�u[240502]�v</CS>���s����ơA�ΥH���ѧ�h���R����n�������̡A�۫H���D�ӨӪ��z�A���������H��A�Ƥ��y��Ч��I�N�y�a�K
		AddSpeakOption( OID , OID , "[SC_COLORWEAVE_01]" , "lua_mika_weave_story" , 0 )	--��´�`���Ѩ�
		AddSpeakOption( OID , OID , "[SC_SASA2012_02]" , "sasa_Auction_npc02" , 0 )    --���W�d
		AddSpeakOption( OID , OID , "[SC_SASA2012_39]" , "sasa_Auction_npc05" , 0 )    -- �ڷQ�ݬݦ������v�Ы~

		if CheckBuff( OID, 623225 ) == false then   --�S���Wbuff
			AddSpeakOption( OID , OID , "[SC_SASA2012_03]" , "sasa_Auction_npc03" , 0 )    --join
			--�ڷQ�ѥ[
		end

	else
		SetSpeakDetail( OID , "[SC_SASA2012_06]" )   --�٨S�}�l
		--�ܰ����z�Q����´���|�Һɪ��o���ߤO�A���L�m�з|�ثe���b�ǳƤ��A�бK���`�N������I
		AddSpeakOption( OID , OID , "[SC_COLORWEAVE_01]" , "lua_mika_weave_story" , 0 )
		--��´�`���Ѩ�
		AddSpeakOption( OID , OID , "[SC_SASA2012_02]" , "sasa_Auction_npc02" , 0 )    --rule
		--���W�d
		AddSpeakOption( OID , OID , "[SC_SASA2012_39]" , "sasa_Auction_npc05" , 0 )    -- �ڷQ�ݬݦ������v�Ы~
		
	end
end

function sasa_Auction_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_SASA2012_05]" )   --�W�d���e
	--��z�ۻ���K���o�Ϯ��I�D���H�|�˼ƨåB�����z��<CS>�u[240502]�v</CS>�C
	--�p�G�z�T�w�n�ѥ[�A�ڷ|�Ȯɭɱz�@�Ǥp���ۡA���L�n�p�ߨϥδN�O�K
	AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0 )    --back
	--�^�W�@��
end

function sasa_Auction_npc03()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	local PP = ReadRoleValue( TID , EM_RoleValue_Register ) --�P�_�������w���W�H��
	local done = Checkflag( OID , 546875 )  --��Ѥw���L
	local done_string = "[SC_SASA2012_27]"	--�z�w�g���W�L�o�I
	local noitem_string = "[SC_SASA2012_28]"	--�z���W��<CS>�u[240502]�v</CS>�����I
	
	if PP > 14 then --����
		SetSpeakDetail( OID , "[SC_SASA2012_04]" )  --full
		--�ثe�ѥ[�H�Ƥw���A�еy�ԦA�աC
		AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0 )    --back
		--�^�W�@��
	else
		if CountBodyItem ( OID, 240502 ) < 1 then
			SetSpeakDetail( OID , noitem_string )		--ĵ�i�S���~
			AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0)    --back
			--�^�W�@��
		elseif CheckBuff( OID , 623225 ) == true then
			SetSpeakDetail( OID , done_string )			--ĵ�i�w���W
			AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0)    --back
			--�^�W�@��
		elseif done == true then
			SetSpeakDetail( OID , "[SC_SASA2012_07]" )  --���Ѥw�g���L
			--�z���Ѥw�g�ѥ[�L�o�A�Щ��ѦA�ӧa�C
			--AddSpeakOption( OID , OID , "[SC_SASA2012_20]" , "sasa_Auction_npc04" , 0)
			--�O�_�ϥ�XXX�I���@��
			
			AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0)    --back
			--�^�W�@��
		else
		-- 	DesignLog( OID, 120905 , "Craft event machine play number".."." )
			CloseSpeak(OID)  --������ܵ���
			AddRoleValue( TID , EM_RoleValue_Register , 1 ) 	--NPC�O��PP��+1
			local PP = ReadRoleValue( TID , EM_RoleValue_Register ) 
		--	Say( OID , "PP ="..PP )
			Addbuff( OID , 623225 , 0 , 900 ) --�������W�ҩ�BUFF
			Setflag( OID , 546875 , 1 ) 	--��Ѥw�ѥ[�LBUFF
			ScriptMessage( OID , OID , 1 , "[SC_SASA2012_38]" , C_SYSTEM )   -- �Ш���䪺�m�з|���ϰ줺���ݡA�_�h�N���h�ѻP���I
		end
	end
end

--�� �A���@�� ��--

function sasa_Auction_npc04()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	if CountBodyItem( OID , 200275 ) > 0 then		--�j�ĭ߷Q�Ĥ�
	-- 	DesignLog( OID, 120905 , "Craft event machine play number".."." )
		CloseSpeak(OID)  --������ܵ���
		AddRoleValue( TID , EM_RoleValue_Register , 1 ) 	--NPC�O��PP��+1
		Addbuff( OID , 623225 , 0 , 900 ) --�������W�ҩ�BUFF
		ScriptMessage( OID , OID , 1 , "[SC_SASA2012_38]" , C_SYSTEM )   -- �Ш���䪺�m�з|���ϰ줺���ݡA�_�h�N���h�ѻP���I
	else
		SetSpeakDetail( OID , "[SC_SASA2012_08]" )  --�ƶq�٤���
		--�A�ҫ������ƶq�����I
		AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc03" , 0)    --back
		--�^�W�@��
	end
end

-- ���v�Ы~���ө�
function sasa_Auction_shop() -- �� ���󲣥ͼ@�� --���~
	SetShop(OwnerID() , 600356 , "Test_Shop_Close" ); 
end


function sasa_Auction_npc05()
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end


function sasa_People_say01()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	SetSpeakDetail( OID , "[SC_SASA2012_19]" )
	--ť�����~���Ѫ��F���٤���I
end

function sasa_People_say02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	SetSpeakDetail( OID , "[SC_SASA2012_20]" )
	--�����]�Ӱ��I�n�Ƨa�K
end

function sasa_People_say03()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	SetSpeakDetail( OID , "[SC_SASA2012_21]" )
	--�j�����å�ݰ_�Ӧn���������K
end