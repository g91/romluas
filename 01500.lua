--20098�뵣�ܸ`

--npc say

function Lua_Mik_FairyTale_Festival_NPCmotion() --�Ѩϻ�
	local RR = rand(100)
	AddBuff(  TargetID(),  503217, 1, -1) 
	while 1 do
		PlayMotion( OwnerID(),165 )
		Sleep(10)
		PlayMotion( OwnerID(),166 )
		Say(OwnerID(),"[SC_0908SEANSON_NPCSAY01]")  --���֯����ڳo�Ӧ��H
		Sleep(1800+RR)
	end
end

function Lua_Mik_FairyTale_Festival_NPCmotion_bad() --�c�]��
	local RR = rand(100)
	AddBuff(  TargetID(),  503217, 1, -1) 
	while 1 do
		PlayMotion( OwnerID(),165 )
		Sleep(10)
		PlayMotion( OwnerID(),166 )
		Say(OwnerID(),"[SC_0908SEANSON_NPCSAY02]")  --�K�K�A�n���ݳo������t�ڡI
		Sleep(1800+RR)
	end
end


--NPC��ܼ@��
function LuaN_mika_09summerlove_good() --npc��l��ܼ@��
	if CheckFlag(OwnerID()  , 542978 ) == true then  --���Ѥw����(�Ѩ�)
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_01]" )--���ѯ�o��A��������b�Ӧn�F(�Ფ)  �L���F
	elseif CheckBuff(OwnerID() , 504156) == true or CheckBuff(OwnerID() , 504180 ) == true then --���R�ʤ��k�ޯ�
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_05]" )--����H�A�ݧڭ�谵�F����ƶܡH(�Ფ)  �i�椤 
	elseif CheckBuff(OwnerID() , 504160 ) == true or CheckBuff(OwnerID() , 504181 ) == true or Checkflag(OwnerID(), 542979) then  --���C�줧�k Buff  and �w�����p�c�]keyitem
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_06]" )--�ڷPı��A���W�ݯd�۫C�쪺���D�A�A�@�w�O���å몺�P���a�A�ڨS�q���a�I���}���}�I
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_43]" )--<CN>[$PLAYERNAME]</CN>�A���F���p�c�]���c�@�@..
		AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_53]", "LuaN_mika_09summerlove_good_joincheck", 0) --�n�A���ڨ����A�a�I
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_60]", "LuaN_mika_09summerlove_good_story", 0) --�ڷQ���D���ܸ`���Ѩ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_27]", "LuaN_mika_09summerlove_good_angel", 0) --����u�p�ѨϪ��R�ߡv
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_03]", "LuaN_mika_09summerlove_good_change", 0) --�ڷQ�I��§��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_04]", "LuaN_mika_09summerlove_good_gambling", 0) --�ڷQ�ѥ[���
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_45]", "LuaN_mika_09summerlove_good_getbook", 0) --�ڷQ���o[205732]
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck() --�T�{���S���n�ѥ[ - ��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_62]" )-- �A�T�w�n�ѥ[�ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_joingood", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck01() --�T�{�I�� - ����§��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_64]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift01", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck02() --�T�{�I�� - ���H§��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_66]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift02", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck03() --�T�{�I�� - ���ʤ��߱��Q��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_67]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift03", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck04() --�T�{�I�� - �I���ٸ�--��A�R����
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_68]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift04", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck05() --�T�{�I�� - �I���ä[����S�_�_�d���J
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_69]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift05", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_story() --�ڷQ���D���ܸ`���Ѩ�
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_61]" ) --�I�����e
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_angel() --����u�p�ѨϪ��R�ߡv
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_29]" )--<CN>~�p�ѨϪ��R��~</CN>(�Ფ)
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_change() --�ڷQ�I��§��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_07]" )--�A�Q�I������H
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_09]", "LuaN_mika_09summerlove_good_joincheck01", 0) --�I������§��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_39]", "LuaN_mika_09summerlove_good_joincheck02", 0) --�I�����H§��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_55]", "LuaN_mika_09summerlove_good_joincheck03", 0) --�I�����ʤ��߱��Q��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_41]", "LuaN_mika_09summerlove_good_joincheck04", 0) --�I���ٸ�--��A�R����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_56]", "LuaN_mika_09summerlove_good_joincheck05", 0) --�I���ä[����S�_�_�d���J
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gambling()--�ڷQ�ѥ[���
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_21]" )--�K�K�A�Ӹոլݤ��a�I�u�n�A��<CN>20�T[205790]</CN>�N�i�H�ѥ[����I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_24]", "LuaN_mika_09summerlove_good_gamblego", 0) --�ѥ[���
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gamblego() --�ѥ[���
	local coin_angel = CountBodyItem( OwnerID() , 205725 ) --�p�Ѩ������ƶq

	if coin_angel >= 5 then
		DelBodyItem( OwnerID() , 205725 , 5 ) --�p�Ѩ�����x5
		GiveBodyItem( OwnerID() , 720540  , 1 ) --������_
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_01]" )--���Ѫ����p��O�H�w��A���ѦA�Ӱѥ[�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����A�L�k�ѥ[����C
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_good_getbook()
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_47]" )--�A���A�Q�A���o�R�ʤ��k���ޯ�ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_49]" , "LuaN_mika_09summerlove_good_book", 0 ) --���o<CS>[205732]</CS>
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_good_book()
	local runestone = CountBodyItem( OwnerID() , 202904 ) --�ǰe���Ť�ƶq

	if runestone >= 1 then
		GiveBodyItem( OwnerID() , 205732  , 2 ) --�R�ʤ��k�]�k��x1
		DelBodyItem( OwnerID() , 202904 , 1 ) --�ǰe���Ť�x1
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_51]" )--�A�h�M�䨺�ǻݭn�A�������H�a�I���A���Q�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_getbook", 0 ) --�^��W�@��
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����C
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_getbook", 0 ) --�^��W�@��
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift01()  --�I������§��
	if CheckFlag(OwnerID()  , 542985) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_11]" )--�ڤ���ണ�Ѫ����~�ƶq�����A�ЧA���ѦA�Ӵ��a�C
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
	else
		if CheckFlag(OwnerID(), 542980) == true then 		
			GiveBodyItem( OwnerID() , 205734  , 1 ) --����§��x1  
			SetFlag( OwnerID()  , 542985 , 1 ) -- �� ���Ѥw�I���L§��
			SetFlag( OwnerID()  , 542980 , 0 ) -- �R �����i�I������§�����
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--�A�u�����F�ڤ@�Ӥj���A�o�I�F��A�N���U�a�A�Ʊ�����٦A��ݨ�A�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--�A�٨S�F���I������I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift02()  --�I�����H§��
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --�p�Ѩ������ƶq

	if coin_angel >= 50 then 		
		GiveBodyItem( OwnerID() , 205735  , 1 ) --���H§��x1 
		DelBodyItem( OwnerID() , 205790  , 50 ) --�R �p�Ѩ�����x50
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--�A�u�����F�ڤ@�Ӥj���A�o�I�F��A�N���U�a�A�Ʊ�����٦A��ݨ�A�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--�A�٨S�F���I������I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift03()  --�I�����ʤ���
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --�p�Ѩ������ƶq

	if CheckFlag(OwnerID()  , 542993) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--�A�w�g�I���L�o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
	else
		if coin_angel >= 100 then 
			local BorG = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )  
			sleep(10)
			if BorG == 0 then
				GiveBodyItem( OwnerID() , 223377  , 1 ) --���k��
			elseif BorG == 1 then
				GiveBodyItem( OwnerID() , 223379  , 1 ) --���k��
			end
			DelBodyItem( OwnerID() , 205790  , 100 ) --�R �p�Ѩ�����x100
			SetFlag( OwnerID()  , 542993 , 1 ) -- �� �w�I���L���ʤ��߻Ÿ�
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--�A�u�����F�ڤ@�Ӥj���A�o�I�F��A�N���U�a�A�Ʊ�����٦A��ݨ�A�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@�� 		
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--�A�٨S�F���I������I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift04()  --�I���ٸ�---��A�R����
	local title_good01 = CountBodyItem( OwnerID() , 530001 ) ---��A�R�����ٸ�
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --�p�Ѩ������ƶq

	if title_good01 == 1 then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_34]" )--�A�w�g���o�Ӻٸ��o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
	else
		if coin_angel >= 150 then 		
			GiveBodyItem( OwnerID() , 530001  , 1 ) --�� �ٸ�--��A�R���� 
			DelBodyItem( OwnerID() , 205790  , 150 ) --�R �p�Ѩ�����x150
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_36]" )--�o�}�l�A�u�����F�ڤ��֦�
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--�A�٨S�F���I������I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift05()  --�I���ä[����S�_�_�d���J
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --�p�Ѩ������ƶq

	if CheckFlag(OwnerID()  , 542995) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--�A�w�g�I���L�o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
	else
		if coin_angel >= 350 then 		
			GiveBodyItem( OwnerID() , 205743 , 1 ) --�� �ä[����S�_�_�d���J
			SetFlag( OwnerID()  , 542995 , 1 ) -- �� �w�I���L�p�Ѩ��d��
			DelBodyItem( OwnerID() , 205790  , 350 ) --�R �p�Ѩ�����x350
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--�A�u�����F�ڤ@�Ӥj���A�o�I�F��A�N���U�a�A�Ʊ�����٦A��ݨ�A�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--�A�٨S�F���I������I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function LuaN_mika_09summerlove_bad() --npc��ܼ@�� bad
	if CheckFlag(OwnerID(), 542979 ) == true then --��Ѥw�L���C�줧�k
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--���A�A��{�o�٤������I�Q���n�F�誺�ܡA���ѴN�A�Ӭ��ڤu�@�a�I
	elseif CheckBuff(OwnerID(), 504160) == true or CheckBuff(OwnerID(), 504181) == true  then --���W���C�줧�k�ޯ�
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_15]" )--�C�~��o�خɭ�(�Ფ)
	elseif  CheckBuff(OwnerID() , 504156) == true or CheckBuff(OwnerID() , 504180 ) == true  or CheckFlag(OwnerID()  , 542978 ) == true then --���R�ʤ��k �η�Ѥw�L���@��
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_16]" )--�A���W���������ߪ����..
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_44]" )--<CN>[$PLAYERNAME]</CN>�A�Q�M�ڤ@�_�c�@�@�ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_54]", "LuaN_mika_09summerlove_bad_joincheck", 0) --�ڷQ�ѥ[�c�@�@
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_60]", "LuaN_mika_09summerlove_bad_story", 0) --�ڷQ���D���ܸ`���Ѩ�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_28]", "LuaN_mika_09summerlove_bad_devil", 0) --����u�p�c�]���c�@�@�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_03]", "LuaN_mika_09summerlove_bad_change", 0) --�ڷQ�I��§��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_04]", "LuaN_mika_09summerlove_bad_gambling", 0) --�ڷQ�ѥ[���
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_46]", "LuaN_mika_09summerlove_bad_getbook", 0) --�ڷQ���s���o<CB>�C�줧�k</CB>
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck() --�T�{���S���n�ѥ[ - ��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_63]" )-- �A�T�w�n�ѥ[�ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_joinbad", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck01() --�T�{�I�� - ����§��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_64]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift01", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck02() --�T�{�I�� - ���H§��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_70]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift02", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck03() --�T�{�I�� - ���ʤ��߱��Q��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_71]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift03", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck04() --�T�{�I�� - �I���ٸ�--��A�R����
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_72]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift04", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck05() --�T�{�I�� - �I���ä[����S�_�_�d���J
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_73]" )-- �A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift05", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_story() --�ڷQ���D���ܸ`���Ѩ�
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_61]" ) --�I�����e
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_devil() --����u�p�c�]���c�@�@�v
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_30]" )--<CN>~�p�c�]���c�@�@~</CN>(�Ფ)
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_change() --�ڷQ�I��§��
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_33]" )--�A�n�I������H
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_09]", "LuaN_mika_09summerlove_bad_joincheck01", 0) --�I������§��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_40]", "LuaN_mika_09summerlove_bad_joincheck02", 0) --�I���C��§��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_57]", "LuaN_mika_09summerlove_bad_joincheck03", 0) --�I���ҧ����߱��Q��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_42]", "LuaN_mika_09summerlove_bad_joincheck04", 0) --�I���ٸ�--�C��������
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_58]", "LuaN_mika_09summerlove_bad_joincheck05", 0) --�I���ä[�p�c�]�_�_�d���J
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gambling()--�ڷQ�ѥ[���
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_22]" )--�K�K�A�Ӹոլݤ��a�I�u�n�A��<CN>20�T[205790]</CN>�N�i�H�ѥ[����I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_24]", "LuaN_mika_09summerlove_bad_gamblego", 0) --�ѥ[���
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gamblego() --�ѥ[���
	local coin_devil = CountBodyItem( OwnerID() , 205724 ) --�p�c�]�����ƶq


	if coin_devil >= 5 then
		DelBodyItem( OwnerID() , 205724 , 5 ) --�c�@�@�Ϫ̾���x5
		GiveBodyItem( OwnerID() , 724745  , 1 ) --������_
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--���Ѫ����p��O�H�w��A���ѦA�Ӱѥ[�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����A�L�k�ѥ[����C
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_getbook()
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_48]" )--����H�A�ٷQ�~��c�@�@�ڡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_50]" , "LuaN_mika_09summerlove_bad_book", 0 ) --���o<CS>[205733]</CS>
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_book()
	local runestone = CountBodyItem( OwnerID() , 202904 ) --�ǰe���Ť�ƶq

	if runestone >= 1 then
		GiveBodyItem( OwnerID() , 205733  , 2 ) --�C�줧�k�]�k��x1
		DelBodyItem( OwnerID() , 202904 , 1 ) --�ǰe���Ť�x1
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_52]" )--�K�K�K�A�~��ɨ��c�@�@���ֽ�a�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_getbook", 0 ) --�^��W�@��
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����C
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_getbook", 0 ) --�^��W�@��
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift() --�I������
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_33]" )--bad �I�����󤺮e
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift01()  --�I������§��
	if CheckFlag(OwnerID(), 542974) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_17]" )--�Q���F�誺�ܡA�N�����ѦA�����~��c�@�@�a�A�K�K�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
	else
		if CheckFlag(OwnerID(), 542973) == true then 		
			GiveBodyItem( OwnerID() , 205734  , 1 ) --����§��x1  
			SetFlag( OwnerID()  , 542974 , 1 ) -- �� ���Ѥw�I���L§��
			SetFlag( OwnerID()  , 542973 , 0 ) -- �R �����i�I������§�����
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--���A�A��{�o�٤������I�Q���n�F�誺�ܡA���ѴN�A�Ӭ��ڤu�@�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--�A�٨S�F���ڪ�����a�A�֥h�n�n��㨺�ǳå�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift02()  --�C��§��
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --�p�c�]�����ƶq

	if coin_devil >= 50 then		
		GiveBodyItem( OwnerID() , 205736  , 1 ) --�C��§��x1  
		DelBodyItem( OwnerID() , 205789  , 50 ) --�R �p�c�]����x50
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--���A�A��{�o�٤������I�Q���n�F�誺�ܡA���ѴN�A�Ӭ��ڤu�@�a�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--�A�٨S�F���ڪ�����a�A�֥h�n�n��㨺�ǳå�a�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
	end

end
----------------------------------------------------
function LuaN_mika_09summerlove_bad_gift03()  --�I���ҧ�����
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --�p�Ѩ������ƶq

	if CheckFlag(OwnerID()  , 542994) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--�A�w�g�I���L�o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
	else
		if coin_devil >= 100 then 
			local BorG = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )  
			Sleep(10)
			if BorG == 0 then
				GiveBodyItem( OwnerID() , 223376  , 1 ) --���k��
			elseif BorG == 1 then
				GiveBodyItem( OwnerID() , 223378  , 1 ) --���k��
			end
			DelBodyItem( OwnerID() , 205789  , 100 ) --�R �p�Ѩ�����x100
			SetFlag( OwnerID()  , 542994 , 1 ) -- �� �w�I���L�ҧ����߻Ÿ�
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--���A�A��{�o�٤������I�Q���n�F�誺�ܡA���ѴN�A�Ӭ��ڤu�@�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��		
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--�A�٨S�F���ڪ�����a�A�֥h�n�n��㨺�ǳå�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift04()  --�I���ٸ�---�C��������
	local title_bad01 = CountBodyItem( OwnerID() , 530002 ) --�C�������ܺٸ�
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --�p�c�]�����ƶq

	if title_bad01 == 1 then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_34]" )--�A�w�g���o�Ӻٸ��o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
	else
		if coin_devil >= 150 then 		
			GiveBodyItem( OwnerID() , 530002  , 1 ) --�� �ٸ�--�C�������� 
			DelBodyItem( OwnerID() , 205789  , 150 ) --�R �p�c�]����x150
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_38]" )--��A�ݤ��X�ӧA�o��ִN�ব����o�Ǽƶq�ڡI
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--�A�٨S�F���ڪ�����a�A�֥h�n�n��㨺�ǳå�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift05()  --�I���ä[�p�c�]�_�_�d���J
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --�p�c�]�����ƶq

	if CheckFlag(OwnerID(), 542996) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--�A�w�g�I���L�o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
	else
		if coin_devil >= 350 then 	
			GiveBodyItem( OwnerID() , 205747 , 1 ) --�� �ä[�p�c�]�_�_�d���J
			SetFlag( OwnerID()  , 542996 , 1 ) -- �� �w�I���L�c�]�d��
			DelBodyItem( OwnerID() , 205789  , 350 ) --�R �p�c�]����x350
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--���A�A��{�o�٤������I�Q���n�F�誺�ܡA���ѴN�A�Ӭ��ڤu�@�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--�A�٨S�F���ڪ�����a�A�֥h�n�n��㨺�ǳå�a�I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --�^��W�@��
		end
	end
end