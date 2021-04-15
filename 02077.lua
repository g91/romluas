--�x�W��J����NPC
--2011-0210 �H�S�Ժ���J
--2011-0106 �s��Ծs��J
--2010-1122 �ɭ��N���~��J����
--2010-1022 �Ȫe�Ѱ���J����
--2010-0923 �N����J����
--serverscript 2077

-- 20100923 ��l�N���J���� npc�I�� 
function Lua_mika_eagleegg_01()  --�����s�� �����
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��
	SetSpeakDetail( OwnerID(), "[SC_EAGLEEGG_00]" ) --�A�b�ʶR����J���A�O�_���o��Q�n���F��O�H....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[226295]]", "Lua_mika_eagleegg_04",0 )--�ڷQ�I��[$VAR1]--���Ŧ��l(�����J����)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[204513]]", "Lua_mika_eagleegg_02",0 )--�ڷQ�I��[$VAR1]--�d���}�q(�N���J����)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[224989]]", "Lua_mika_eagleegg_06",0 )--�ڷQ�I��[$VAR1]--�ȪŤ��l(�Ȫe�Ѱ�����)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[225306]]", "Lua_mika_eagleegg_09",0 )--�ڷQ�I��[$VAR1]--�x�V�y����F�ͻH(�ɭ��N���~��J����)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[224865]]", "Lua_gamaegg_na_10",0 )--�ڷQ�I��[$VAR1]--�A�����l(�s��Ծs��J����)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[224866]]", "Lua_gamaegg_na_11",0 )--�ڷQ�I��[$VAR1]--�������l(�H�S�Ժ���J����)
end

---�I�����Ŧ��l(�����J����)------------------------------------------------------------------
function Lua_mika_eagleegg_04()  --�ڷQ�I��[$VAR1]--���Ŧ��l(�����J����)
	SetSpeakDetail( OwnerID(), "[SC_EAGLEEGG_05]" ) --�Z�ʶR�����J....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_mika_eagleegg_05",0 )--�T�w�I��
end

function Lua_mika_eagleegg_05()  --�{ģ���~���J�߸H��x5 �� ���Ŧ��lx1
	local eggid = 205684 --�{ģ���~���J�߸H��
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W���J�߸H���ƶq
	local rewardid = 226295 --���Ŧ��l
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R �J�߸H��x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[226295]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end

---�I���d���}�q(�N���J����)------------------------------------------------------------------
function Lua_mika_eagleegg_02()  --�I���d���}�q(�N���J����)
	SetSpeakDetail( OwnerID(), "[SC_EAGLEEGG_01]" ) --�Z�ʶR�N���J....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_mika_eagleegg_03",0 )--�T�w�I��
end

function Lua_mika_eagleegg_03()
	local eggid = 208321 --�J�߸H��
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W���J�߸H���ƶq
	local rewardid = 204513 --���|��}�q��
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R �J�߸H��x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[204513]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end


---�I���ȪŤ��l(�Ȫe�Ѱ�����)------------------------------------------------------------------
function Lua_mika_eagleegg_06()  
	SetSpeakDetail( OwnerID(), "[SC_GALAXYEGG_01]" ) --�Z�ʶR�Ȫe�Ѱ��J ...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_mika_eagleegg_07",0 )--�T�w�I��
end

function Lua_mika_eagleegg_07()
	local eggid = 208300 --�J�߸H��
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W���J�߸H���ƶq
	local rewardid = 224989 --�ȪŤ��l
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R �J�߸H��x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[224989]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end

---�I���x�V�y����F�ͻH(�ɭ��N���~��J����)------------------------------------------------------------------
function Lua_mika_eagleegg_09()  
	SetSpeakDetail( OwnerID(), "[SC_TWMALLEGG_01]" ) --�Z�ʶR....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TWMALLEGG_02]", "Lua_mika_eagleegg_091",0 )--�I���k�ʨ���θ˳�
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TWMALLEGG_03]", "Lua_mika_eagleegg_092",0 )--�I���k�ʨ���θ˳�
end

function Lua_mika_eagleegg_091()  ---�I���x�V�y����F�ͻH(�k��)
	local eggid = 208334 --�Ƹ����N���~�Ф�
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W���Ƹ����N���~�Ф�ƶq
	local rewardid_1 = 225311 --�x�V�y����F�ͻH (�k��)
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R �J�߸H��x5
		GiveBodyItem( OwnerID(), rewardid_1, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[225311]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end

function Lua_mika_eagleegg_092()  ---�I���x�V�y����F�ͻH (�k��)
	local eggid = 208334 --�Ƹ����N���~�Ф�
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W���Ƹ����N���~�Ф�ƶq
	local rewardid_2 = 225306 --�x�V�y����F�ͻH (�k��)
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R �J�߸H��x5
		GiveBodyItem( OwnerID(), rewardid_2, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[225306]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end



---�I���A�����l(�s�s�Ի��)------------------------------------------------------------------
function Lua_gamaegg_na_10()  
	SetSpeakDetail( OwnerID(), "[SC_GAMAEGG_01]" ) --�Z�ʶR�s�s�Ի�J ...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_gamaegg_na_10_1",0 )--�T�w�I��
end

function Lua_gamaegg_na_10_1()  
	local eggid = 208672 --��w���s��Ծs����
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W���J�߸H���ƶq
	local rewardid = 224865 --�A�����l
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R ��w���s��Ծs����x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[224865]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end




---�I���������l(�H�S�Ժ�����)------------------------------------------------------------------
function Lua_gamaegg_na_11()  
	SetSpeakDetail( OwnerID(), "[SC_GAMAEGG_02]" ) --�Z�ʶR�H�S�Ժ��J ...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_gamaegg_na_11_1",0 )--�T�w�I��
end

function Lua_gamaegg_na_11_1()  
	local eggid = 209167 --���W���H�S�Ժ�����
	local count =CountBodyItem( OwnerID(), eggid) --�ˬd���a���W������ƶq
	local rewardid = 224866 --�������l
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- �R ���W���H�S�Ժ�����x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --���I�������~
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[224866]]" , C_SYSTEM )  --���ߧA��o[$VAR1]�I
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --�z�ҫ������~�ƶq�����A�٤���I����C
	end
end