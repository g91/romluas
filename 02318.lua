function Lua_ying_GE2year_118041speak() --NPC��ڴ��Ҧw���
			
	local X = CheckFlag( OwnerID() , 545021 ) --�w��������
	local Y = CheckFlag( OwnerID() , 545022 ) --�w����������y
	local Z = CheckBuff( OwnerID() , 509601 ) --�ˬd���a���W�O�_��509601 �ܨ��N��BUFF
	local Lv = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) --�ˬd���a����

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	if Lv >= 48 then --����48�H�W
		if X == true then --�w������
			if Z == true then --���ܨ�
				SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_01]" ) --"�Ц��H�F�I�ڪ���s�Ǫ����H�Ӥ@������C�쪺���Z�A�ɭP�o���`�O�Q�˱o�äC�K�V�A�O�H�����F�I
				AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_11]" , "Lua_ying_GE2year_118041speak02" , 0 ) --"���������A�ڭn������y�C"�ﶵ
			else --�S�ܨ�
				SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_01]" ) --"�Ц��H�F�I�ڪ���s�Ǫ����H�Ӥ@������C�쪺���Z�A�ɭP�o���`�O�Q�˱o�äC�K�V�A�O�H�����F�I
				AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_11]" , "Lua_ying_GE2year_118041speak03" , 0 ) --"���������A�ڭn������y�C"�ﶵ
			end
		elseif Y == true then --�w����������y
			SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_15]" ) --"�A���Ѥw�g���U�L�ڤF�A���§A����ѦA�ӧa�I"
		else --��������&������������y
			SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_01]" ) --"�Ц��H�F�I�ڪ���s�Ǫ����H�Ӥ@������C�쪺���Z�A�ɭP�o���`�O�Q�˱o�äC�K�V�A�O�H�����F�I
			AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_02]" , "Lua_ying_GE2year_118041speak01" , 0 ) --"���@�N�����I"�ﶵ
		end
	else --����48�H�U
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011EV1_01]"   ) -- "�ګܷP�§A���n�N�A�i���A����O���G�٨S����k���W�ڪ���"
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118041speak02() --"���������A�ڭn������y�C"�ﶵ(���ܨ�)

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_12]" , C_SYSTEM ) --"�������Ѱ��ܨ��~�i�H����y��I"
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_12]" , C_SYSTEM ) --"�������Ѱ��ܨ��~�i�H����y��I"
	CloseSpeak( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118041speak03() --"���������A�ڭn������y�C"�ﶵ(�S�ܨ�)

	local X = CountBodyItem( OwnerID() , 209556 ) --�ˬd���a���W"�˵۫C�쪺Ţ�l"���X��

	SetFlag( OwnerID() , 545021 , 0 ) --�R�� �w������key
	SetFlag( OwnerID() , 545022 , 1 ) --���� �w����������ykey
	
	if X == 0 then --0
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_14]" ) --�A�S�����������[118040]�K���D�O�کҬI�i���]�k���ĤF�ܡH�I
	elseif  X >= 1 and X <=5 then --1~5
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"�Ӧn�F�I�o�U�ש�i�H�M�ߪ����n�ڪ���s�K
								                --���§A�����U��o�Ǽ��y�N��ۧڪ��@�I�߷N�A�Ʊ�A�|���w�C"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --���y-�w�y�C�����
		DelBodyItem( OwnerID() , 209556 , X ) --�R�� �˵۫C�쪺Ţ�l
	elseif X > 5 and X <=10 then --6~10
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"�Ӧn�F�I�o�U�ש�i�H�M�ߪ����n�ڪ���s�K
									  --���§A�����U��o�Ǽ��y�N��ۧڪ��@�I�߷N�A�Ʊ�A�|���w�C"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --���y-�w�y�C�����
		GiveBodyItem( OwnerID() , 203495 , 3 ) --�����Ť����Ĥ�HP+30%  3��
		AddBuff( OwnerID() , 509610 , 0 , 600 ) --BUFF 10����
		DelBodyItem( OwnerID() , 209556 , X ) --�R�� �˵۫C�쪺Ţ�l
	elseif X > 10 and X <=15 then --11~15
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"�Ӧn�F�I�o�U�ש�i�H�M�ߪ����n�ڪ���s�K
									  --���§A�����U��o�Ǽ��y�N��ۧڪ��@�I�߷N�A�Ʊ�A�|���w�C"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --���y-�w�y�C�����
		GiveBodyItem( OwnerID() , 203495 , 5 ) --�����Ť����Ĥ�HP+30%  5��
		AddBuff( OwnerID() , 509610 , 0 , 900 ) --BUFF 15����
		DelBodyItem( OwnerID() , 209556 , X ) --�R�� �˵۫C�쪺Ţ�l
	elseif X > 15 and X <=25 then --16~25
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"�Ӧn�F�I�o�U�ש�i�H�M�ߪ����n�ڪ���s�K
									  --���§A�����U��o�Ǽ��y�N��ۧڪ��@�I�߷N�A�Ʊ�A�|���w�C"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --���y-�w�y�C�����
		GiveBodyItem( OwnerID() , 203495 , 5 ) --�����Ť����Ĥ�HP+30%  5��
		AddBuff( OwnerID() , 509610 , 0 , 1200 ) --BUFF 20����
		DelBodyItem( OwnerID() , 209556 , X ) --�R�� �˵۫C�쪺Ţ�l
	else -- >25�H�W
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"�Ӧn�F�I�o�U�ש�i�H�M�ߪ����n�ڪ���s�K
									  --���§A�����U��o�Ǽ��y�N��ۧڪ��@�I�߷N�A�Ʊ�A�|���w�C"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --���y-�w�y�C�����
		GiveBodyItem( OwnerID() , 203496 , 5 ) --�����ŤW���Ĥ�HP+40%  5��
		AddBuff( OwnerID() , 509610 , 0 , 1800 ) --BUFF 30����
		DelBodyItem( OwnerID() , 209556 , X ) --�R�� �˵۫C�쪺Ţ�l
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118041speak01() --"���@�N�����I"�ﶵ

	SetSpeakDetail( OwnerID() , "[SC_GE2_2011EV1_03]" )  --���ǫC�쪺�ʧ@��b�ӱӱ��F�I�����ڧV�O��s�X�@�طs���]�k�A�i�H�N�H���~�����ܦ��C��A�o�����ӯ�����C���ǫC�쪺ĵ�٤ߡC
								  --�ڷQ�A�u�n�����|��K��e�̡A���򮷮����\�����v�N�|�j�j���ɡI
								  --���L�A�o���ܨ��]�k�u�����10�������ɶ��A�ҥH�A�@�w�n�n�n�ⴤ�ɶ���ñN�����쪺�C��浹�ڡA���նܡH
								  --�Y�ǳƦn�F�A�N���ڬ��A�I��C���ܨ��N�a��
	AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_04]" , "Lua_ying_GE2year_change" , 0 ) --"�n���A�ڷǳƦn�F��"�ﶵ
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_change() --��������

	local X = Lua_Mounts_Copilot( OwnerID() ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)

	if X == true then --���b��y
		DW_CancelTypeBuff( 68,  OwnerID() ) --�M�����M�ɡA�U��
		AddBuff( OwnerID() , 509601 , 0 , 600 ) --����"�̵��ܨ��N"
		AddBuff( OwnerID() , 509603 , 0 , 300 ) --����5�����p�Ⱖ��BUFF
		GiveBodyItem( OwnerID() , 209555 , 1 ) --����"�]�kŢ"
		SetFlag ( OwnerID() ,  545021 , 1 ) --���� �w��������key
	else --�b��y
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_16]" , C_SYSTEM ) --"�M�����M�ɵL�k�ӱ������ȡA�иѰ��M�����A�A�ӱ��C"
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_16]" , C_SYSTEM ) --"�M�����M�ɵL�k�ӱ������ȡA�иѰ��M�����A�A�ӱ��C"
	end
	CloseSpeak( OwnerID() ) --������ܵ���
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_buff() --�˼�5�����A�p�Ⱖ��BUFF

	local C = CountBodyItem( OwnerID() , 209556 ) --�ˬd���a���W"�˵۫C�쪺Ţ�l"���X��
	local X = CountBodyItem( OwnerID() , 530714 ) --�ˬd���a���W�O�_��"����֤�"���ٸ�
	
	if X < 1 then --�L�ٸ�
		if C >= 10 then --���a���W�A�˵۫C�쪺Ţ�l>=10��
			GiveBodyItem( OwnerID() , 530714 , 1 ) --����"����֤�"�ٸ�
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_buffclear() --�ܨ���BUFF�ɶ���A10�����������ܪ��aú�^���Ȫ��~

	local Count = CountBodyItem( OwnerID() , 209556 ) --�ˬd���a���W"�˵۫C�쪺Ţ�l"���X��

	if Count >= 1 then --1�H�W
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_20]" , C_SYSTEM ) --"�̵��ܨ��N�ĪG�w�����I����N�˵۫C�쪺Ţ�l��^����ڴ��Ҧw�a��"
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_20]" , C_SYSTEM ) --"�̵��ܨ��N�ĪG�w�����I����N�˵۫C�쪺Ţ�l��^����ڴ��Ҧw�a��"
	else --=0
		SetFlag( OwnerID() , 545021 , 0 ) --�R�� �w������key
		SetFlag( OwnerID() , 545022 , 1 ) --���� �w����������ykey
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_21]" , C_SYSTEM ) --"�̵��ܨ��N�ĪG�w�����I�o���S������ե֪��C��A�U���A�~��V�O�a��"
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_21]" , C_SYSTEM ) --"�̵��ܨ��N�ĪG�w�����I�o���S������ե֪��C��A�U���A�~��V�O�a��"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_use() --�ϥΪ��~���ˬd��LUA 
--	Say(OwnerID(), "Owner") = ���a
--	Say(TargetID(), "Target") = NPC - �ϥΥؼ�
	local X = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --Ū���ؼЪ�orgid
	local Y = GetDistance( OwnerID(), TargetID() ) --���o���a�P�ؼЪ��Z��
	local Z = CheckBuff( OwnerID() , 509601 ) --�ˬd���a���W�O�_��509601 �ܨ��N��BUFF

	if CheckID( TargetID() ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then --�C��s�b
		if Z == true then --���ܨ�
			if X == 105632 or X == 105633 then --105632[�͵����C��] --105633 [���㪺�C��]
				if Y <= 50 then --�Z�� <= 50�X
					return true			
				else  --�Z�� > 50
					ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_05]" , 0 )  --"�Z���L���A�L�k�ϥΡC"
					return false
				end
			else --��LNPC
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
				return false
			end
		else --�S�ܨ�
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_06]" , 0 ) --���W�S��[509601]�ĪG�A�L�k�ϥΡC
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
		return false
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_giveitem() --�ϥΪ��~����檺LUA
--	Say(OwnerID(), "Owner") = ���a
--	Say(TargetID(), "Target") = NPC - �ϥΥؼ�
	local X = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --Ū���ؼЪ�orgid
	local Y = Rand(100)+1 --rand(0~99)+1 = 1~100
	local Z = CheckBuff( TargetID() , 509602 ) --�ˬd�ؼШ��W�O�_��"�줧�@��"BUFF

	if X == 105632 then --105632[�͵����C��] 
		if Y <= 30 then --���\���v30%
			DelObj( TargetID() ) --�R���C��
			GiveBodyItem( OwnerID() , 209556 , 1 ) --����"�˵۫C�쪺Ţ�l"
		else --���Ѿ��v70%
			AddBuff( OwnerID() , 509604 , 0 , 3 ) --�������a�@��"�w�t"��BUFF�A����3��
--			AdjustFaceDir( TargetID() , OwnerID() , 180 ) -- NPC���缾�a�V�H180����V
--			WriteRoleValue( TargetID()  ,EM_RoleValue_IsWalk , 0  )-- ��NPC�ζ]��
--			Lua_MoveLine( TargetID() , 60 ) --�V�Ჾ��60�X
		end
	elseif X == 105633 then --105633[���㪺�C��]
		if Z == false then --�C�쨭�W�S�@��
			if Y <= 50 then --���\���v50%
				DelObj( TargetID() ) --�R���C��
				GiveBodyItem( OwnerID() , 209556 , 1 ) --����"�˵۫C�쪺Ţ�l"
			else -- ���Ѿ��v50%
				AddBuff( OwnerID() , 509604 , 0 , 3 ) --�������a�@��"�w�t"��BUFF�A����3��
			end
		else --�C�쨭�W���@��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_07]" , C_SYSTEM ) --"�ݥ��}���C�쨭�W��[509602]�I "
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_07]" , C_SYSTEM ) --"�ݥ��}���C�쨭�W��[509602]�I "
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118040speak() --�ե֪��C����
--	Say(OwnerID(), "Owner") = ���a
--	Say(TargetID(), "Target") = NPC 
	local X = CheckBuff( OwnerID() , 509601 ) --�ˬd���a���W�O�_��509601�A�ܨ��N��BUFF

	if X == true then --���ܨ�
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
		SetSpeakDetail( OwnerID() , "[SC_GE2_2011EV1_08]" ) --"�١�o��B�͡A�A�O�s�Ӫ��ܡH�q�S�ݹL�A�O�K"
		AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_09]" , "Lua_ying_GE2year_118040hide" , 0 ) --"�O�ڡK�ڬO�s�Ӫ��A�Цh���С�" �ﶵ
	else --�S�ܨ�
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
		SetSpeakDetail( OwnerID() , "[SC_GE2_2011EV1_10]" ) --"�O����O����O��� 
									   --(�C�쥿��ۧA��s�A���G������ܷQ���A���A�o�Sť�����K)"
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118040hide()
--	Say(OwnerID(), "Owner") --= ���a
--	Say(TargetID(), "Target") --= NPC 
	CloseSpeak( OwnerID() ) --������ܵ���
	BeginPlot( TargetID() , "Lua_ying_GE2year_118040hide01" , 0 ) --���� �ե֪��C��hide function
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118040hide01() --hide�ե֫C��A���ͷsNPC�A30���ե֫C��X�{�A�sNPC�R��

	local Obj = Role:new( OwnerID() ) --�b"�ե֪��C��"���m�A�إ߷s��NPC
	local BaseX = Obj :X() --�C�쪺X�b
	local BaseY = Obj :Y() --�C�쪺Y�b
	local BaseZ = Obj :Z() --�C�쪺Z�b
	local BaseDir = Obj:Dir() --�C�쪺���V
	local R= Rand(100)+1 --Rand(0~99)+1 = 1~100
	local Frog
	
	Hide( OwnerID() ) --�Ͻե֪��C�����
	if R <= 30 then --���v30%
		Frog = CreateObj( 105632 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�إ�"�͵����C��"
		BeginPlot( Frog , "Lua_ying_GE2year_move" , 0 ) --�͵����C�� �X�ͮɷ|����
		AddToPartition( Frog , 0 ) --�Ϸs�إߥX�Ӫ��C��X�{
			local Rd = Rand(10)+1 --1~10

			if Rd <= 4 then
				NPCSay( Frog , "[SC_GE2_2011EV1_18]" ) --���ڭ̨ӷ�n�B�ͧa�������
			end
	else --���v70%
		Frog = CreateObj( 105633 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�إ�"���㪺�C��"
		AddBuff( Frog , 509602 , 0 , -1 ) --�줧�@��
		BeginPlot( Frog , "Lua_ying_GE2year_move" , 0 ) --���㪺�C�� �X�ͮɷ|����
		AddToPartition( Frog , 0 ) --�Ϸs�إߥX�Ӫ��C��X�{
			local Ra = Rand(10)+1 --1~10

			if Ra <= 4 then
				NPCSay( Frog , "[SC_GE2_2011EV1_19]" ) --�ݧA�@�y�̼ˡA�ڳ̰Q����o����������D�F�I�ݩۡ�
			end
	end
	Sleep(400) --40��
	if  CheckID( Frog ) == true and ReadRoleValue( Frog , EM_RoleValue_IsDead ) == 0 then --�C��s�b
		ScriptMessage( Frog , TargetID() , 1 , "[SC_GE2_2011EV1_17]" , C_SYSTEM ) --"�g�L�X�f�ä�A�C��X�A���`�N�ɰk���F��"
		ScriptMessage( Frog , TargetID() , 0 , "[SC_GE2_2011EV1_17]" , C_SYSTEM ) --"�g�L�X�f�ä�A�C��X�A���`�N�ɰk���F��"
		DelObj( Frog ) --�R��Flog
	end
	Show( OwnerID() , 0 ) --�Ͻե֪��C��X�{
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_move() --�͵����C�� �X�ͮɷ|����

	WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 0  )-- ��NPC�ζ]��
	Hide(OwnerID())
	Show(OwnerID() , 0 )
--	local Rd = Rand(5)+1 --rand(0~4)+1= 1~5

	while TRUE do
		DW_MoveRand( OwnerID(), 60 )  --ObjID �Q�i�沾�ʪ�����   RandRange �Q�H�����ʪ��S��(���|)
		Sleep(20)
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------