
--�� �@�Ψ禡-�R���ƥ��ȥ� ��--
function sasa_keydel_01( key1 )
	setflag( TargetID() , key1 , 0 )
	--Say( TargetID() , "GET" )
end

function sasa_keydel_02( key1 , key2 )
	setflag( TargetID() , key1 , 0 )
	setflag( TargetID() , key2 , 0 )
end

--------------------------------------------------------------------

--�� ����NPC�춥 ��--
function sasa_Collection_Herb01()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Herb = CheckFlag( OID , 547681 )		--��������
	local Ing = CheckFlag( OID , 547688 )		--���ȶi�椤

	if Herb == true then		--�p�G��������
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--�P�§A����U�A���Ѫ��q�w�g�����F�A�Щ��ѦA�ӧa�I
	elseif Ing == true then		--�p�G���ȶi�椤
		LoadQuestOption(OID)	--���J���ȼҪO
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--�A�O�o�����������H�ܡH
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Herb02" , 0 )
		--�O���C
	end
end

function sasa_Collection_Herb02()
	local Player = OwnerID()
	local Herb_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Herblism )		--23���ĵ���
	local Keyitem = { 547606 , 547607 , 547608 , 547609 , 547610 , 547611 , 547612 , 547613 }
				--���߯� , �W���� , �㺸���� , �Ǧ��� , �ڨF�۸��� , ��۱� , �o�H�x , �s��
	local Keyitem_SP = { 547654 , 547655 , 547656 , 547657 , 547658 }
						--�g�ȯ� , ����G , ��g�� , �G��ۣ , ����
	local Keyitem2 = { 547614 , 547615 , 547616 , 547617 , 547618 , 547619 , 547620 , 547621 }
				--�Ҫ��� , ���@�� , �]�OŢ�� , �p�ḭ�� , �촵�]��� , �N�Q���� , �n���� , �������
	local Keyitem_SP2 = { 547659 , 547660 , 547661 , 547662 }
						--�a���F�� , ������ , �s�ޯ� , �먣��
	
	for a = 1 , #Keyitem do
		setflag( Player , Keyitem[a] , 0 )
	end
	for b = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[b] , 0 )
	end
	for aa = 1 , #Keyitem2 do
		setflag( Player , Keyitem2[aa] , 0 )
	end
	for bb = 1 , #Keyitem_SP2 do
		setflag( Player , Keyitem_SP2[bb] , 0 )
	end
	if Herb_Lv <= 10 then
		setflag( Player , Keyitem[1] , 1 )		--���߯�
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 11 and Herb_Lv <= 20 then
		setflag( Player , Keyitem[2] , 1 )		--�W����
		setflag( Player , Keyitem[3] , 1 )		--�㺸����
		setflag( Player , Keyitem_SP[1] , 1 )	--�g�ȯ�
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 21 and Herb_Lv <= 30 then
		setflag( Player , Keyitem[4] , 1 )		--�Ǧ���
		setflag( Player , Keyitem_SP[2] , 1 )	--����G
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 31 and Herb_Lv <= 40 then
		setflag( Player , Keyitem[5] , 1 )		--�ڨF�۸���
		setflag( Player , Keyitem[6] , 1 )		--��۱�
		setflag( Player , Keyitem_SP[3] , 1 )	--��g��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 41 and Herb_Lv <= 50 then
		setflag( Player , Keyitem[7] , 1 )		--�o�H�x
		setflag( Player , Keyitem_SP[4] , 1 )	--�G��ۣ
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 51 and Herb_Lv <= 60 then
		setflag( Player , Keyitem[8] , 1 )		--�s��
		setflag( Player , Keyitem_SP[5] , 1 )	--����
		LoadQuestOption(Player)		--���J���ȼҪO
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[116473]]" )
		--��p�A�ثe�ڳo�̪��Ħ��q�w�g�����A�]�\�A�i�H�V<CN>[$VAR1]</CN>�ݰݡC(����)
	end
end

--�� ����NPC���� ��--
function sasa_Collection_Herb01_1()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Herb = CheckFlag( OID , 547681 )		--��������
	local Ing = CheckFlag( OID , 547688 )		--���ȶi�椤

	if Herb == true then		--�p�G��������
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--�P�§A����U�A���Ѫ��q�w�g�����F�A�Щ��ѦA�ӧa�I
	elseif Ing == true then		--�p�G���ȶi�椤
		LoadQuestOption(OID)	--���J���ȼҪO
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--�A�O�o�����������H�ܡH
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Herb02_1" , 0 )
		--�O���C
	end
end

function sasa_Collection_Herb02_1()
	local Player = OwnerID()
	local Herb_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Herblism )		--23���ĵ���
	local Keyitem1 = { 547606 , 547607 , 547608 , 547609 , 547610 , 547611 , 547612 , 547613 }
				--���߯� , �W���� , �㺸���� , �Ǧ��� , �ڨF�۸��� , ��۱� , �o�H�x , �s��
	local Keyitem_SP1 = { 547654 , 547655 , 547656 , 547657 , 547658 }
						--�g�ȯ� , ����G , ��g�� , �G��ۣ , ����
	local Keyitem = { 547614 , 547615 , 547616 , 547617 , 547618 , 547619 , 547620 , 547621 }
				--�Ҫ��� , ���@�� , �]�OŢ�� , �p�ḭ�� , �촵�]��� , �N�Q���� , �n���� , �������
	local Keyitem_SP = { 547659 , 547660 , 547661 , 547662 }
						--�a���F�� , ������ , �s�ޯ� , �먣��
	
	for cc = 1 , #Keyitem1 do
		setflag( Player , Keyitem1[cc] , 0 )
	end
	for dd = 1 , #Keyitem_SP1 do
		setflag( Player , Keyitem_SP1[dd] , 0 )
	end
	for c = 1 , #Keyitem do
		setflag( Player , Keyitem[c] , 0 )
	end
	for d = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[d] , 0 )
	end
	if Herb_Lv >= 51 and Herb_Lv <= 60 then
		setflag( Player , Keyitem[1] , 1 )		--�Ҫ���
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 61 and Herb_Lv <= 70 then
		setflag( Player , Keyitem[2] , 1 )		--���@��
		setflag( Player , Keyitem[3] , 1 )		--�]�OŢ��
		setflag( Player , Keyitem_SP[1] , 1 )	--�a���F��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 71 and Herb_Lv <= 80 then
		setflag( Player , Keyitem[4] , 1 )		--�p�ḭ��
		setflag( Player , Keyitem_SP[2] , 1 )	--������
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 81 and Herb_Lv <= 90 then
		setflag( Player , Keyitem[5] , 1 )		--�촵�]���
		setflag( Player , Keyitem[6] , 1 )		--�N�Q����
		setflag( Player , Keyitem_SP[3] , 1 )	--�s�ޯ�
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Herb_Lv >= 91 and Herb_Lv <= 100 then
		setflag( Player , Keyitem[7] , 1 )		--�n����
		setflag( Player , Keyitem[8] , 1 )		--�������
		setflag( Player , Keyitem_SP[4] , 1 )	--�먣��	
		LoadQuestOption(Player)		--���J���ȼҪO
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[114207]]" )
		--��p�A�ثe�ڳo�̪��Ħ��q�w�g�����A�]�\�A�i�H�V<CN>[$VAR1]</CN>�ݰݡC(�춥)
	end
end

--------------------------------------------------------------------

--�� ���YNPC�춥 ��--
function sasa_Collection_Wood01()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Wood = CheckFlag( OID , 547682 )		--�������Y
	local Ing = CheckFlag( OID , 547689 )		--���ȶi�椤

	if Wood == true then		--�p�G��������
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--�P�§A����U�A���Ѫ��q�w�g�����F�A�Щ��ѦA�ӧa�I
	elseif Ing == true then		--�p�G���ȶi�椤
		LoadQuestOption(OID)	--���J���ȼҪO
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--�A�O�o�����������H�ܡH
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Wood02" , 0 )
		--�O���C
	end
end

function sasa_Collection_Wood02()
	local Player = OwnerID()
	local Wood_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Lumbering )		--22���Y����
	local Keyitem = { 547622 , 547623 , 547624 , 547625 , 547626 , 547627 , 547628 , 547629 }
					--�h�� , ���� , ��� , �C���Q , �V�C�� , ������ , �𴵪L�]�� , �s�_����
	local Keyitem_SP = { 547663 , 547664 , 547665 , 547666 , 547667 }
						--�a�î� , �d�~�� , �sŽ�� , �t�� , �����
	local Keyitem2 = { 547630 , 547631 , 547632 , 547633 , 547634 , 547635 , 547636 , 547637 }
		--�j�F��� , �k���Z���_ , �մ��̤� , ���h�ȧ��� , ���F���ä� , �����L�R , ���s���� , ���ҧ¤�
	local Keyitem_SP2 = { 547668 , 547669 , 547670 , 547671 }
						--���j�� , �۪Q�� , ����q�� , ���Ь���
	
	for e = 1 , #Keyitem do
		setflag( Player , Keyitem[e] , 0 )
	end
	for f = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[f] , 0 )
	end
	for ee = 1 , #Keyitem2 do
		setflag( Player , Keyitem2[ee] , 0 )
	end
	for ff = 1 , #Keyitem_SP2 do
		setflag( Player , Keyitem_SP2[ff] , 0 )
	end
	if Wood_Lv <= 10 then
		setflag( Player , Keyitem[1] , 1 )		--�h��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 11 and Wood_Lv <= 20 then
		setflag( Player , Keyitem[2] , 1 )		--����
		setflag( Player , Keyitem[3] , 1 )		--���
		setflag( Player , Keyitem_SP[1] , 1 )	--�a�î�
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 21 and Wood_Lv <= 30 then
		setflag( Player , Keyitem[4] , 1 )		--�C���Q
		setflag( Player , Keyitem_SP[2] , 1 )	--�d�~��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 31 and Wood_Lv <= 40 then
		setflag( Player , Keyitem[5] , 1 )		--�V�C��
		setflag( Player , Keyitem[6] , 1 )		--������
		setflag( Player , Keyitem_SP[3] , 1 )	--�sŽ��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 41 and Wood_Lv <= 50 then
		setflag( Player , Keyitem[7] , 1 )		--�𴵪L�]��
		setflag( Player , Keyitem_SP[4] , 1 )	--�t��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 51 and Wood_Lv <= 60 then
		setflag( Player , Keyitem[8] , 1 )		--�s�_����
		setflag( Player , Keyitem_SP[5] , 1 )	--�����
		LoadQuestOption(Player)		--���J���ȼҪO
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[116474]]" )
		--��p�A�ثe�ڳo�̪��Ħ��q�w�g�����A�]�\�A�i�H�V<CN>[$VAR1]</CN>�ݰݡC(����)
	end
end

--�� ���YNPC���� ��--
function sasa_Collection_Wood01_1()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Wood = CheckFlag( OID , 547682 )		--�������Y
	local Ing = CheckFlag( OID , 547689 )		--���ȶi�椤

	if Wood == true then		--�p�G��������
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--�P�§A����U�A���Ѫ��q�w�g�����F�A�Щ��ѦA�ӧa�I
	elseif Ing == true then		--�p�G���ȶi�椤
		LoadQuestOption(OID)	--���J���ȼҪO
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--�A�O�o�����������H�ܡH
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Wood02_1" , 0 )
		--�O���C
	end
end

function sasa_Collection_Wood02_1()
	local Player = OwnerID()
	local Wood_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Lumbering )		--22���Y����
	local Keyitem1 = { 547622 , 547623 , 547624 , 547625 , 547626 , 547627 , 547628 , 547629 }
					--�h�� , ���� , ��� , �C���Q , �V�C�� , ������ , �𴵪L�]�� , �s�_����
	local Keyitem_SP1 = { 547663 , 547664 , 547665 , 547666 , 547667 }
						--�a�î� , �d�~�� , �sŽ�� , �t�� , �����
	local Keyitem = { 547630 , 547631 , 547632 , 547633 , 547634 , 547635 , 547636 , 547637 }
		--�j�F��� , �k���Z���_ , �մ��̤� , ���h�ȧ��� , ���F���ä� , �����L�R , ���s���� , ���ҧ¤�
	local Keyitem_SP = { 547668 , 547669 , 547670 , 547671 }
						--���j�� , �۪Q�� , ����q�� , ���Ь���
	
	for gg = 1 , #Keyitem1 do
		setflag( Player , Keyitem1[gg] , 0 )
	end
	for hh = 1 , #Keyitem_SP1 do
		setflag( Player , Keyitem_SP1[hh] , 0 )
	end
	for g = 1 , #Keyitem do
		setflag( Player , Keyitem[g] , 0 )
	end
	for h = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[h] , 0 )
	end
	if Wood_Lv >= 51 and Wood_Lv <= 60 then
		setflag( Player , Keyitem[1] , 1 )		--�j�F���
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 61 and Wood_Lv <= 70 then
		setflag( Player , Keyitem[2] , 1 )		--�k���Z���_
		setflag( Player , Keyitem[3] , 1 )		--�մ��̤�
		setflag( Player , Keyitem_SP[1] , 1 )	--���j��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 71 and Wood_Lv <= 80 then
		setflag( Player , Keyitem[4] , 1 )		--���h�ȧ���
		setflag( Player , Keyitem_SP[2] , 1 )	--�۪Q��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 81 and Wood_Lv <= 90 then
		setflag( Player , Keyitem[5] , 1 )		--���F���ä�
		setflag( Player , Keyitem[6] , 1 )		--�����L�R
		setflag( Player , Keyitem_SP[3] , 1 )	--����q��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Wood_Lv >= 91 and Wood_Lv <= 100 then
		setflag( Player , Keyitem[7] , 1 )		--���s����
		setflag( Player , Keyitem[8] , 1 )		--���ҧ¤�
		setflag( Player , Keyitem_SP[4] , 1 )	--���Ь���	
		LoadQuestOption(Player)		--���J���ȼҪO
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[114208]]" )
		--��p�A�ثe�ڳo�̪��Ħ��q�w�g�����A�]�\�A�i�H�V<CN>[$VAR1]</CN>�ݰݡC(�춥)
	end
end

--------------------------------------------------------------------

--�� �q��NPC�춥 ��--
function sasa_Collection_Mine01()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Mine = CheckFlag( OID , 547683 )		--�����q��
	local Ing = CheckFlag( OID , 547690 )		--���ȶi�椤

	if Mine == true then		--�p�G��������
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--�P�§A����U�A���Ѫ��q�w�g�����F�A�Щ��ѦA�ӧa�I
	elseif Ing == true then		--�p�G���ȶi�椤
		LoadQuestOption(OID)	--���J���ȼҪO
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--�A�O�o�����������H�ܡH
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Mine02" , 0 )
		--�O���C
	end
end

function sasa_Collection_Mine02()
	local Player = OwnerID()
	local Mine_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Mining )		--21�q�۵���
	local Keyitem = { 547638 , 547639 , 547640 , 547641 , 547642 , 547643 , 547644 , 547645 }
					--���q , ���K�q , �����q , ��q , �ջ��q , ���K�q , �����q , �`�W����
	local Keyitem_SP = { 547672 , 547673 , 547674 , 547675 , 547676 }
						--�ŦB�� , �j���� , ���Q���� , �̴����| , �H������
	local Keyitem2 = { 547646 , 547647 , 547648 , 547649 , 547650 , 547651 , 547652 , 547653 }
		--�Ť���`�� , �K���V�� , �������� , �X�ǩ��� , �ջȬP�� , ���ܽ��� , �����O�� , ���d�����q
	local Keyitem_SP2 = { 547677 , 547678 , 547679 , 547680 }
						--�������� , ���ǵ��� , �K��� , �Ů�����
	
	for i = 1 , #Keyitem do
		setflag( Player , Keyitem[i] , 0 )
	end
	for j = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[j] , 0 )
	end
	for ii = 1 , #Keyitem2 do
		setflag( Player , Keyitem2[ii] , 0 )
	end
	for jj = 1 , #Keyitem_SP2 do
		setflag( Player , Keyitem_SP2[jj] , 0 )
	end
	if Mine_Lv <= 10 then
		setflag( Player , Keyitem[1] , 1 )		--���q
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 11 and Mine_Lv <= 20 then
		setflag( Player , Keyitem[2] , 1 )		--���K�q
		setflag( Player , Keyitem[3] , 1 )		--�����q
		setflag( Player , Keyitem_SP[1] , 1 )	--�ŦB��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 21 and Mine_Lv <= 30 then
		setflag( Player , Keyitem[4] , 1 )		--��q
		setflag( Player , Keyitem_SP[2] , 1 )	--�j����
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 31 and Mine_Lv <= 40 then
		setflag( Player , Keyitem[5] , 1 )		--�ջ��q
		setflag( Player , Keyitem[6] , 1 )		--���K�q
		setflag( Player , Keyitem_SP[3] , 1 )	--���Q����
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 41 and Mine_Lv <= 50 then
		setflag( Player , Keyitem[7] , 1 )		--�����q
		setflag( Player , Keyitem_SP[4] , 1 )	--�̴����|
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 51 and Mine_Lv <= 60 then
		setflag( Player , Keyitem[8] , 1 )		--�`�W����
		setflag( Player , Keyitem_SP[5] , 1 )	--�H������
		LoadQuestOption(Player)		--���J���ȼҪO
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[116475]]" )
		--��p�A�ثe�ڳo�̪��Ħ��q�w�g�����A�]�\�A�i�H�V<CN>[$VAR1]</CN>�ݰݡC(����)
	end
end

--�� �q��NPC���� ��--
function sasa_Collection_Mine01_1()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Mine = CheckFlag( OID , 547683 )		--�����q��
	local Ing = CheckFlag( OID , 547690 )		--���ȶi�椤

	if Mine == true then		--�p�G��������
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--�P�§A����U�A���Ѫ��q�w�g�����F�A�Щ��ѦA�ӧa�I
	elseif Ing == true then		--�p�G���ȶi�椤
		LoadQuestOption(OID)	--���J���ȼҪO
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--�A�O�o�����������H�ܡH
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Mine02_1" , 0 )
		--�O���C
	end
end

function sasa_Collection_Mine02_1()
	local Player = OwnerID()
	local Mine_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Mining )		--21�q�۵���
	local Keyitem1 = { 547638 , 547639 , 547640 , 547641 , 547642 , 547643 , 547644 , 547645 }
					--���q , ���K�q , �����q , ��q , �ջ��q , ���K�q , �����q , �`�W����
	local Keyitem_SP1 = { 547672 , 547673 , 547674 , 547675 , 547676 }
						--�ŦB�� , �j���� , ���Q���� , �̴����| , �H������
	local Keyitem = { 547646 , 547647 , 547648 , 547649 , 547650 , 547651 , 547652 , 547653 }
		--�Ť���`�� , �K���V�� , �������� , �X�ǩ��� , �ջȬP�� , ���ܽ��� , �����O�� , ���d�����q
	local Keyitem_SP = { 547677 , 547678 , 547679 , 547680 }
						--�������� , ���ǵ��� , �K��� , �Ů�����
	
	for kk = 1 , #Keyitem1 do
		setflag( Player , Keyitem1[kk] , 0 )
	end
	for ll = 1 , #Keyitem_SP1 do
		setflag( Player , Keyitem_SP1[ll] , 0 )
	end
	for k = 1 , #Keyitem do
		setflag( Player , Keyitem[k] , 0 )
	end
	for l = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[l] , 0 )
	end
	if Mine_Lv >= 51 and Mine_Lv <= 60 then
		setflag( Player , Keyitem[1] , 1 )		--�Ť���`��
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 61 and Mine_Lv <= 70 then
		setflag( Player , Keyitem[2] , 1 )		--�K���V��
		setflag( Player , Keyitem[3] , 1 )		--��������
		setflag( Player , Keyitem_SP[1] , 1 )	--��������
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 71 and Mine_Lv <= 80 then
		setflag( Player , Keyitem[4] , 1 )		--�X�ǩ���
		setflag( Player , Keyitem_SP[2] , 1 )	--���ǵ���
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 81 and Mine_Lv <= 90 then
		setflag( Player , Keyitem[5] , 1 )		--�ջȬP��
		setflag( Player , Keyitem[6] , 1 )		--���ܽ���
		setflag( Player , Keyitem_SP[3] , 1 )	--�K���
		LoadQuestOption(Player)		--���J���ȼҪO
	elseif Mine_Lv >= 91 and Mine_Lv <= 100 then
		setflag( Player , Keyitem[7] , 1 )		--�����O��
		setflag( Player , Keyitem[8] , 1 )		--���d�����q
		setflag( Player , Keyitem_SP[4] , 1 )	--�Ů�����	
		LoadQuestOption(Player)		--���J���ȼҪO
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[114209]]" )
		--��p�A�ثe�ڳo�̪��Ħ��q�w�g�����A�]�\�A�i�H�V<CN>[$VAR1]</CN>�ݰݡC(�춥)
	end
end

--------------------------------------------------------------------

--�� ��������Ĳ�o ��--
function sasa_Collection_reward01()		--�������ĥ���
	local Player = TargetID()
	Setflag( Player , 547681 , 1 )		--��������KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 114207 , "Collection Herb Lv"..Lv )
end

function sasa_Collection_reward02()		--�������Y����
	local Player = TargetID()
	Setflag( Player , 547682 , 1 )		--��������KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 114208 , "Collection Wood Lv"..Lv )
end

function sasa_Collection_reward03()		--�����q�ۥ���
	local Player = TargetID()
	Setflag( Player , 547683 , 1 )		--��������KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 114209 , "Collection Mine Lv"..Lv )
end

--�� �M���Ҧ������X�� ��--
--/GM ? runplot sasa_ClearAllFlag_01
function sasa_ClearAllFlag_01()
	local Player = OwnerID()
	Setflag( Player , 547681 , 0 )
	Setflag( Player , 547682 , 0 )
	Setflag( Player , 547683 , 0 )
	--�������ȺX�С�
end

--------------------------------------------------------------------
