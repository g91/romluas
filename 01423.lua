--�ٸ��I��npc
--update 2011.06.17 (4.0.1)
-------------------------------------------------------------------------
function LuaN_mika_titlegetnpc() --�ٸ��I��NPC
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_00]" )--�Q���D�A�{�b����o����ٸ��ܡH�ӬݬݥH�U���I������a�I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_01]", "LuaN_mika_titlegetnpc01", 0) --����O�ٸ��H
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_02]", "LuaN_mika_titlegetnpc02", 0) --���o�شӺٸ�  
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc01() --����O�ٸ��H
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_011]" )--�b�_�I���A��<CP>�����S�w����</CP>��<CP>�F���S�w����</CP>�ɴN�i���o<CN>�ٸ�</CN>�C(�Ფ)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02() --���o�شӺٸ�
	local item1 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �Ӫ�������
	local item2 = CountBodyItem(OwnerID(), 530110 ); -- �ˬd�O�_�� �ʪᤧ�D
	local item3 = CountBodyItem(OwnerID(), 530118 ); -- �ˬd�O�_�� ��N�P����
	local item4 = CountBodyItem(OwnerID(), 530119 ); -- �ˬd�O�_�� ��N�l�D��

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_012]" )--�ھڳo���ѤW����A (�Ფ) 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_13]", "LuaN_mika_titlegetnpc02_1", 0) --�����t�C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_14]", "LuaN_mika_titlegetnpc02_2", 0) --�Ӫ��n�ͨt�C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_15]", "LuaN_mika_titlegetnpc02_3", 0) --���w�t�C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_16]", "LuaN_mika_titlegetnpc02_4", 0) --��B�t�C
	if item1 == 1 or item2 == 1 or item3 == 1 or item4 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_17]", "LuaN_mika_titlegetnpc02_5", 0) --��N�t�C(�G��)
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_1() --�����t�C
	local item1 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �����M�a
	local item2 = CountBodyItem(OwnerID(), 530105 ); -- �ˬd�O�_�� �������_�j�v

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--�п�ܧA�Q�I�����ٸ��C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_18]", "LuaN_mika_titlegetnpc02_18", 0) --����u������Ǫ̡v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_19]", "LuaN_mika_titlegetnpc02_19", 0) --����u�����i���̡v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_20]", "LuaN_mika_titlegetnpc02_20", 0) --����u������i�̡v(�G��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_21]", "LuaN_mika_titlegetnpc02_21", 0) --����u�����M�a �v(�G��)
	if item2 == 0 and item1 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_22]", "LuaN_mika_titlegetnpc02_22", 0) --����u�������_�j�v�v (�T�� 4.0.1)
	end
--	if item2 == 1 then
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_23]", "LuaN_mika_titlegetnpc02_23", 0) --����u���������v  (���}��)
--	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_2() --�Ӫ��n�ͨt�C
	local item1 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �Ӫ�������

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--�п�ܧA�Q�I�����ٸ��C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_24]", "LuaN_mika_titlegetnpc02_24", 0) --����u�P�񸭬۹J�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_25]", "LuaN_mika_titlegetnpc02_25", 0) --����u�ᦷ�ھF�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_26]", "LuaN_mika_titlegetnpc02_26", 0) --����u�Ӫ������͡v (�G��)

	if item1 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_27]", "LuaN_mika_titlegetnpc02_27", 0) --����u�ʪᤧ�D�v (�T�� 4.0.1)
	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --�^��W�@�h
end
--------------------------------------------
function LuaN_mika_titlegetnpc02_3() --���w�t�C
	local item1 = CountBodyItem(OwnerID(), 530112 ); -- �ˬd�O�_�� �A�o����
	local item2 = CountBodyItem(OwnerID(), 530113 ); -- �ˬd�O�_�� �A�o����

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--�п�ܧA�Q�I�����ٸ��C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_28]", "LuaN_mika_titlegetnpc02_28", 0) --����u�A�o�گ�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_29]", "LuaN_mika_titlegetnpc02_29", 0) --����u�A�o����v

	if  item1 == 1 or item2 == 1 then --�w�� �A�o���� �ٸ�
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_30]", "LuaN_mika_titlegetnpc02_30", 0) --����u�A�o�ʤ��Y�v (�G��)
	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_4() --��B�t�C
	local item1 = CountBodyItem(OwnerID(), 530116 ); -- �ˬd�O�_�� �ڬO���Զ�B
	local item2 = CountBodyItem(OwnerID(), 530117 ); -- �ˬd�O�_�� �ڬO���Զ�B

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--�п�ܧA�Q�I�����ٸ��C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_31]", "LuaN_mika_titlegetnpc02_31", 0) --����u�ڬO�p��B�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_32]", "LuaN_mika_titlegetnpc02_32", 0) --����u�ڬO�n��B�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_33]", "LuaN_mika_titlegetnpc02_33", 0) --����u�ڬO���Զ�B�v(�G��)

	if  item1 == 1 or item2 == 1 then --�w�� �ڬO���Զ�B�ٸ�
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_34]", "LuaN_mika_titlegetnpc02_34", 0) --����u�ڬO��B�N��v(�G��)
	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_5() --��N�t�C
	local item1 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �Ӫ�������
	local item2 = CountBodyItem(OwnerID(), 530110 ); -- �ˬd�O�_�� �ʪᤧ�D
	local item3 = CountBodyItem(OwnerID(), 530118 ); -- �ˬd�O�_�� ��N�P����
	local item4 = CountBodyItem(OwnerID(), 530119 ); -- �ˬd�O�_�� ��N�l�D��

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--�п�ܧA�Q�I�����ٸ��C

	if ( item4 == 0 and item3 == 0 and item1 == 1 ) or ( item4 == 0 and item3 == 0 and item2 == 1 ) then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_35]", "LuaN_mika_titlegetnpc02_35", 0) --����u��N�P���̡v (�G��)
	end
	if item4 == 0 and item3 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_36]", "LuaN_mika_titlegetnpc02_36", 0) --����u��N�l�D�̡v (�T�� 4.0.1 )
	end
--	if item4 == 1 then
	--	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_37]", "LuaN_mika_titlegetnpc02_37", 0) --����u��N�гy�̡v (���}��)
--	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --�^��W�@�h
end

---�����t�C--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_18() -- ������Ǫ�
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_18A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_18c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_19() --  �����i����
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_19A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_19c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_20() --  ������i��
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_20A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_20c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_21() --  �����M�a
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_21A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_21c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_22() --  �������_�j�v
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_22A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_22c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_23() --  ��������
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_23A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_23c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
end

---�Ӫ��n�ͨt�C--------------------------------------------------------------------------

function LuaN_mika_titlegetnpc02_24() --  �P�񸭬۹J
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_24A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_24c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_25() --  �ᦷ�ھF
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_25A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_25c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_26() --  �Ӫ�������
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_26A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_26c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_27() --  �ʪᤧ�D
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_27A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_27c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
end

---���w�t�C--------------------------------------------------------------------------

function LuaN_mika_titlegetnpc02_28() --  �A�o�گ�
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_28A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_28c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_29() --  �A�o����
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_29A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_29c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_30() --  �A�o�ʤ��Y
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_30A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_30c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
end
---�����t�C--------------------------------------------------------------------------
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_31() --  �ڬO�p��B
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_31A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_31c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_32() --  �ڬO�n��B
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_32A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_32c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_33() --  �ڬO���Զ�B
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_33A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_33c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_34() --  �ڬO��B�N��
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_34A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_34c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
end
---��N�t�C--------------------------------------------------------------------------

function LuaN_mika_titlegetnpc02_35() --  ��N�P����
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_35A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_35c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_36() --  ��N�l�D��
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_36A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_36c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_37() --  ��N�гy��
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_37A]" )--�������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_37c", 0) --���o�ٸ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
end
--------------------------------------------
--�ٸ��I��

---�����t�C--------------------------------------------------------------
function LuaN_mika_titlegetnpc02_18c() --�I���ٸ� ������Ǫ�
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530101 ); -- �ˬd�O�_�� �ٸ� ������Ǫ�
	local title2 = CountBodyItem(OwnerID(), 530102 ); -- �ˬd�O�_�� �ٸ� �����M�a
	local title3 = CountBodyItem(OwnerID(), 530103 ); -- �ˬd�O�_�� �ٸ� �����M�a
	local title4 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �ٸ� �����M�a


	if title4 == 1 or title3 == 1 or title2 == 1 then --�p�G���P�t�C�����ٸ�
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
		else
			if item1 >= 10 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530101 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205084 , 10 ) --�����~ ���S�] X10
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_19c() --�I���ٸ� �����i����
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530102 ); -- �ˬd�O�_�� �ٸ� �����i����
	local title2 = CountBodyItem(OwnerID(), 530101 ); -- �ˬd�O�_�� �ٸ� ������Ǫ�
	local title3 = CountBodyItem(OwnerID(), 530103 ); -- �ˬd�O�_�� �ٸ� �����M�a
	local title4 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �ٸ� �����M�a

	if title4 == 1 or title3 == 1  then --�p�G���P�t�C�����ٸ�
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
		else
			if title2 == 1 and item1 >= 20 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530102 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205084 , 20 ) --�����~ ���S�] X20
				DelBodyItem(OwnerID(), 530101 , 1 ) --�R���ٸ� ������Ǫ�
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_20c() --�I���ٸ� ������i��
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530103 ); -- �ˬd�O�_�� �ٸ� ������i��
	local title2 = CountBodyItem(OwnerID(), 530102 ); -- �ˬd�O�_�� �ٸ� �����i����
	local title4 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �ٸ� �����M�a

	if title4 == 1  then --�p�G���P�t�C�����ٸ�
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
		else
			if title2 == 1 and item2 >= 30 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530103 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205085 , 30 ) --�����~ �S��G�� X30
				DelBodyItem(OwnerID(), 530102 , 1 ) --�R���ٸ� ������Ǫ�
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_21c() --�I���ٸ� �����M�a
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �ٸ� �����M�a
	local title2 = CountBodyItem(OwnerID(), 530103 ); -- �ˬd�O�_�� �ٸ� ������i��

	if title1 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
	else
		if title2 == 1 and item2 >=50 then  
			GiveBodyItem(OwnerID(), 530104 , 1 )  --���ٸ�
			DelBodyItem(OwnerID(), 205085 , 50 ) --�����~ �S��G�� 50
			DelBodyItem(OwnerID(), 530103, 1 ) --�R���ٸ� ������i��
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
		end		
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_22c() --�I���ٸ� �������_�j�v
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���

	local title1 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �ٸ� �����M�a
	local title2 = CountBodyItem(OwnerID(), 530105 ); -- �ˬd�O�_�� �ٸ� �������_�j�v

	if title2 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
	else
		if title1 == 1 then 
			if item3 >=10 then  
				GiveBodyItem(OwnerID(), 530105 , 1 )  --���ٸ� �������_�j�v
				DelBodyItem(OwnerID(), 205086 , 10 ) --�����~ ��G�׵� x10
				DelBodyItem(OwnerID(), 530104, 1 ) --�R���ٸ� �����M�a

				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			end
		else
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		end		
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_23c() --�I���ٸ� ��������
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���

	local title1 = CountBodyItem(OwnerID(), 530105 ); -- �ˬd�O�_�� �ٸ� �������_�j�v
	local title2 = CountBodyItem(OwnerID(), 530106 ); -- �ˬd�O�_�� �ٸ� ��������

	if title2 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
	else
		if title1 == 1 then 
			if item3 >= 50 then  
				GiveBodyItem(OwnerID(), 530106 , 1 )  --���ٸ� ��������
				DelBodyItem(OwnerID(), 205086 , 50 ) --�����~ ��G�׵� x50
				DelBodyItem(OwnerID(), 530105, 1 ) --�R���ٸ� �������_�j�v

				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --�^��W�@�h
			end
		else
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		end		
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_24c() --�I���ٸ� �P�񸭬۹J
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title2_1 = CountBodyItem(OwnerID(), 530101 ); -- �ˬd�O�_�� �ٸ� �����t�C
	local title2_2 = CountBodyItem(OwnerID(), 530102 ); -- �ˬd�O�_�� �ٸ� 
	local title2_3 = CountBodyItem(OwnerID(), 530103 ); -- �ˬd�O�_�� �ٸ� 
	local title2_4 = CountBodyItem(OwnerID(), 530104 ); -- �ˬd�O�_�� �ٸ� 
	local title2_5 = CountBodyItem(OwnerID(), 530105 ); -- �ˬd�O�_�� �ٸ� 
	local title2_6 = CountBodyItem(OwnerID(), 530106 ); -- �ˬd�O�_�� �ٸ� 
	local title1 = CountBodyItem(OwnerID(), 530107 ); -- �ˬd�O�_�� �ٸ� �P�񸭬۹J
	local title2 = CountBodyItem(OwnerID(), 530108 ); -- �ˬd�O�_�� �ٸ� �ᦷ�ھF
	local title3 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �ٸ� �Ӫ�������

	if title3 == 1 or title2 == 1 then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		else
			if title2_1 == 1 or title2_2 == 1 or title2_3 == 1 or title2_4 == 1 or title2_5 == 1 or title2_6 == 1 then --�p�G�������t�C����ٸ�
				if item1 >= 5 and item2 >= 5 then  --
					GiveBodyItem(OwnerID(), 530107 , 1 )  --���ٸ�
					DelBodyItem(OwnerID(), 205084 , 5 ) --�����~ ���S�] X5
					DelBodyItem(OwnerID(), 205085 , 5 ) --�����~ �S��G�� X5
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--��p�A�A�ҫ����~���ƶq�٤�����A���~��[�o�I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_25c() --�I���ٸ� �ᦷ�ھF
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530108 ); -- �ˬd�O�_�� �ٸ� �ᦷ�ھF
	local title2 = CountBodyItem(OwnerID(), 530107 ); -- �ˬd�O�_�� �ٸ� �P�񸭬۹J
	local title3 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �ٸ� �Ӫ�������

	if title3 == 1  then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		else
			if title2 == 1 and item1 >= 10 and item2 >= 5 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530108 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205084 , 10 ) --�����~ ���S�] X10
				DelBodyItem(OwnerID(), 205085 , 5 ) --�����~ �S��G�� X5
				DelBodyItem(OwnerID(), 530107 , 1 ) --�R �ٸ� �P�񸭬۹J
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_26c() --�I���ٸ�  �Ӫ�������
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �ٸ� �Ӫ�������
	local title2 = CountBodyItem(OwnerID(), 530108 ); -- �ˬd�O�_�� �ٸ� �ᦷ�ھF

	if title1 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
	else
		if title2 == 1 and item2 >= 30 and item3 >= 15 then  --�ƶq���w
			GiveBodyItem(OwnerID(), 530109 , 1 )  --���ٸ�
			DelBodyItem(OwnerID(), 205085 , 30 ) --�����~ �S��G��  X30
			DelBodyItem(OwnerID(), 205086 , 15 ) --�����~ ��G��� X15
			DelBodyItem(OwnerID(), 530108 , 1 ) --�R �ٸ� �Ӫ�������
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		end		
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_27c() --�I���ٸ�  �ʪᤧ�D
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �ٸ� �Ӫ�������
	local title2 = CountBodyItem(OwnerID(), 530110 ); -- �ˬd�O�_�� �ٸ� �ʪᤧ�D

	if title2 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
	else
		if title1 == 1 then
			if  item2 >= 50 and item3 >= 30 then  
				GiveBodyItem(OwnerID(), 530110 , 1 )  --���ٸ� �ʪᤧ�D
				DelBodyItem(OwnerID(), 205085 , 50 ) --�����~ �S��G��  X50
				DelBodyItem(OwnerID(), 205086 , 30 ) --�����~ ��G��� X30
				DelBodyItem(OwnerID(), 530109 , 1 ) --�R �ٸ� �Ӫ�������
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
			end		
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --�^��W�@�h
		end
	end
end 

--------------------------
function LuaN_mika_titlegetnpc02_28c() --�I���ٸ� �A�o�گ�
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530111 ); -- �ˬd�O�_�� �ٸ�
	local title2 = CountBodyItem(OwnerID(), 530112 ); -- �ˬd�O�_�� �ٸ�
	local title3 = CountBodyItem(OwnerID(), 530113 ); -- �ˬd�O�_�� �ٸ�

	if title3 == 1 or title2 == 1 then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
		else
			if item1 >= 5 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530111 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205084 , 5 ) --�����~ ���S�] X5
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
			end		
		end
	end
end 
-----------------------------
function LuaN_mika_titlegetnpc02_29c() --�I���ٸ� �A�o����
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530112 ); -- �ˬd�O�_�� �ٸ� �A�o����
	local title2 = CountBodyItem(OwnerID(), 530111 ); -- �ˬd�O�_�� �ٸ� �A�o�گ�
	local title3 = CountBodyItem(OwnerID(), 530113 ); -- �ˬd�O�_�� �ٸ�

	if title3 == 1  then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
		else
			if title2 == 1 and item1 >= 15 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530112 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205084 , 15 ) --�����~ ���S�] X15
				DelBodyItem(OwnerID(), 530111 , 1 ) --�R�ٸ� �A�o�گ�
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
			end		
		end
	end
end 
---------------------
function LuaN_mika_titlegetnpc02_30c() --�I���ٸ� �A�o�ʤ��Y
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local title1 = CountBodyItem(OwnerID(), 530113 ); -- �ˬd�O�_�� �ٸ� �A�o�ʤ��Y
	local title2 = CountBodyItem(OwnerID(), 530112 ); -- �ˬd�O�_�� �ٸ� �A�o����

	if title1 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
	else
		if title2 == 1 and item1 >= 35 then  --�ƶq���w
			GiveBodyItem(OwnerID(), 530113 , 1 )  --���ٸ� �A�o�ʤ��Y
			DelBodyItem(OwnerID(), 205084 , 35 ) --�����~ ���S�] X15
			DelBodyItem(OwnerID(), 530112 , 1 ) --�R�ٸ�  �A�o����
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --�^��W�@�h
		end		
	end
end 
---------------------------------
function LuaN_mika_titlegetnpc02_31c() --�I���ٸ� �ڬO�p��B
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530114 ); -- �ˬd�O�_�� �ٸ� �ڬO�p��B
	local title2 = CountBodyItem(OwnerID(), 530115 ); -- �ˬd�O�_�� �ٸ� �ڬO�n��B
	local title3 = CountBodyItem(OwnerID(), 530116 ); -- �ˬd�O�_�� �ٸ� �ڬO�n��B
	local title4 = CountBodyItem(OwnerID(), 530117 ); -- �ˬd�O�_�� �ٸ� �ڬO�n��B

	if title4 ==1 or title3 == 1 or title2 == 1 then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
		else
			if item2 >= 6 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530114 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205085 , 6 ) --�����~ �S��G�� X 6
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
			end		
		end
	end
end 
------------------
function LuaN_mika_titlegetnpc02_32c() --�I���ٸ� �ڬO�n��B
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530115 ); -- �ˬd�O�_�� �ٸ� �ڬO�n��B
	local title2 = CountBodyItem(OwnerID(), 530114 ); -- �ˬd�O�_�� �ٸ� �ڬO�p��B
	local title3 = CountBodyItem(OwnerID(), 530116 ); -- �ˬd�O�_�� �ٸ� �ڬO���Զ�B
	local title4 = CountBodyItem(OwnerID(), 530117 ); -- �ˬd�O�_�� �ٸ� �ڬO��B�N��

	if title4 == 1 or title3 == 1  then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
		else
			if title2 == 1 and item2 >= 12 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530115 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205085 , 12 ) --�����~ �S��G�� X12
				DelBodyItem(OwnerID(), 530114 , 1 ) --�R�ٸ� �ڬO�p��B
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
			end		
		end
	end
end 
------------------
function LuaN_mika_titlegetnpc02_33c() --�I���ٸ� �ڬO���Զ�B
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G��
	local title1 = CountBodyItem(OwnerID(), 530116 ); -- �ˬd�O�_�� �ٸ� �ڬO���Զ�B
	local title2 = CountBodyItem(OwnerID(), 530115 ); -- �ˬd�O�_�� �ٸ� �ڬO�n��B
	local title3 = CountBodyItem(OwnerID(), 530117 ); -- �ˬd�O�_�� �ٸ� �ڬO��B�N��

	if title3 == 1  then --�p�G���󰪶����ٸ� (���I���L)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g�I���L���ٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h	
	else
		if title1 == 1 then --�p�G�w�g���ٸ� 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
		else
			if title2 == 1 and item2 >= 24 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530116 , 1 )  --���ٸ�  �ڬO���Զ�B
				DelBodyItem(OwnerID(), 205085 , 24 ) --�����~ �S��G�� X24
				DelBodyItem(OwnerID(), 530115, 1 ) --�R�ٸ�  �ڬO�n��B
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
			end		
		end
	end
end 
----------------------------------
function LuaN_mika_titlegetnpc02_34c() --�I���ٸ� �ڬO��B�N��
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G�� 
	local title1 = CountBodyItem(OwnerID(), 530117 ); -- �ˬd�O�_�� �ٸ� �ڬO��B�N��
	local title2 = CountBodyItem(OwnerID(), 530116 ); -- �ˬd�O�_�� �ٸ�  �ڬO���Զ�B
	if title1 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
	else
		if title2 == 1 and item2 >= 60 then  --�ƶq���w
			GiveBodyItem(OwnerID(), 530117 , 1 )  --���ٸ�  �ڬO��B�N��
			DelBodyItem(OwnerID(), 205085 , 60 ) --�����~ �S��G�� X60
			DelBodyItem(OwnerID(), 530116, 1 ) --�R�ٸ�  �ڬO���Զ�B
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --�^��W�@�h
		end		
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_35c() --�I���ٸ� ��N�P����
	local item1 = CountBodyItem(OwnerID(), 205084); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G�� 
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���
	local title1 = CountBodyItem(OwnerID(), 530118 ); -- �ˬd�O�_�� �ٸ� ��N�P����
	local title2 = CountBodyItem(OwnerID(), 530109 ); -- �ˬd�O�_�� �ٸ�  �Ӫ�������
	local title3 = CountBodyItem(OwnerID(), 530110 ); -- �ˬd�O�_�� �ٸ�  �ʪᤧ�D
	if title1 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
	else
		if title2 == 1 or  title3 == 1 then --�p�G���ٸ�
 				if item1 >= 20 and item2 >= 10 and item3 >= 5 then  --�ƶq���w
					GiveBodyItem(OwnerID(), 530118 , 1 )  --���ٸ�  ��N�P����
					DelBodyItem(OwnerID(), 205084 , 20 ) --�����~ ���S�]x20
					DelBodyItem(OwnerID(), 205085 , 10 ) --�����~ �S��G�� X10
					DelBodyItem(OwnerID(), 205086 , 5 ) --�����~  ��G���X5
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
				end
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
		end	
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_36c() --�I���ٸ� ��N�P����
	local item1 = CountBodyItem(OwnerID(), 205084); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G�� 
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���

	local title1 = CountBodyItem(OwnerID(), 530118 ); -- �ˬd�O�_�� �ٸ� ��N�P����
	local title2 = CountBodyItem(OwnerID(), 530119 ); -- �ˬd�O�_�� �ٸ�  ��N�l�D��

	if title2 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
	else
		if title1 == 1 then -- ���W�@�Ӻٸ�
 				if item1 >= 50 and item2 >= 30 and item3 >= 10 then 
					GiveBodyItem(OwnerID(), 530119 , 1 )  --���ٸ�  ��N�l�D��
					DelBodyItem(OwnerID(), 530118 , 1 )  --�R�ٸ�  ��N�P����
					DelBodyItem(OwnerID(), 205084 , 50 ) --�����~ ���S�]x50
					DelBodyItem(OwnerID(), 205085 , 30 ) --�����~ �S��G�� X50
					DelBodyItem(OwnerID(), 205086 , 10 ) --�����~  ��G���X10
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
				end
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
		end	
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_37c() --�I���ٸ� ��N�гy��
	local item1 = CountBodyItem(OwnerID(), 205084); -- �ˬd�O�_�� ���S�]
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- �ˬd�O�_�� �S��G�� 
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- �ˬd�O�_�� ��G���

	local title1 = CountBodyItem(OwnerID(), 530119 ); -- �ˬd�O�_�� �ٸ� ��N�P����
	local title2 = CountBodyItem(OwnerID(), 530120 ); -- �ˬd�O�_�� �ٸ� ��N�гy��

	if title2 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--�A�w�g���o�Ӻٸ��o�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
	else
		if title1 == 1 then -- ���W�@�Ӻٸ�
 				if item1 >= 100 and item2 >= 50 and item3 >= 30 then 
					GiveBodyItem(OwnerID(), 530120 , 1 )  --���ٸ�  ��N�гy��
					DelBodyItem(OwnerID(), 530119 , 1 )  --�R�ٸ�  ��N�P����
					DelBodyItem(OwnerID(), 205084 , 100 ) --�����~ ���S�]x100
					DelBodyItem(OwnerID(), 205085 , 50 ) --�����~ �S��G�� X50
					DelBodyItem(OwnerID(), 205086 , 30 ) --�����~  ��G���X30
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--���ߧA���o���ٸ��I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--���ٸ��һݪ����~������A���~��[�o�I
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
				end
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--��p�A�A�S�������ٸ��һݪ��ٸ��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --�^��W�@�h
		end	
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titledelall_plant() -- ���եΫ��O �R�������شӺٸ�
	DelBodyItem(OwnerID(), 530101 , 1 ) 
	DelBodyItem(OwnerID(), 530102 , 1 ) 
	DelBodyItem(OwnerID(), 530103 , 1 ) 
	DelBodyItem(OwnerID(), 530104 , 1 ) 
	DelBodyItem(OwnerID(), 530105 , 1 ) 
	DelBodyItem(OwnerID(), 530106 , 1 ) 
	DelBodyItem(OwnerID(), 530107 , 1 ) 
	DelBodyItem(OwnerID(), 530108 , 1 ) 
	DelBodyItem(OwnerID(), 530109 , 1 ) 
	DelBodyItem(OwnerID(), 530110 , 1 ) 
	DelBodyItem(OwnerID(), 530111 , 1 ) 
	DelBodyItem(OwnerID(), 530112 , 1 ) 
	DelBodyItem(OwnerID(), 530113 , 1 ) 
	DelBodyItem(OwnerID(), 530114 , 1 ) 
	DelBodyItem(OwnerID(), 530115 , 1 ) 
	DelBodyItem(OwnerID(), 530116 , 1 ) 
	DelBodyItem(OwnerID(), 530117 , 1 ) 
	DelBodyItem(OwnerID(), 530118 , 1 ) 
	DelBodyItem(OwnerID(), 530119 , 1 ) 
	DelBodyItem(OwnerID(), 530120 , 1 ) 
	Say(OwnerID(),"title all clear") 
end
--------------------------------------------------------------------------
function LuaN_mika_titleitem_plant() -- ���եΫ��O ���شӺٸ��D��U100
	GiveBodyItem(OwnerID(), 205084 , 100 )  
	GiveBodyItem(OwnerID(), 205085 , 100 )  
	GiveBodyItem(OwnerID(), 205086 , 100 )  
--	Say(OwnerID(),"give all item 100") 
end
--------------------------------------------------------------------------