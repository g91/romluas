function Lua_ying_skillcraft_8850_01() --NPC���_�f�w ���

	local Quest = CheckAcceptQuest( OwnerID() , 424417 ) --���ȡG�Ӧۥ��K�v���e�U
	local Count = CountBodyItem( OwnerID() , 209993 ) --�ˬd�B���ۼƶq

	LoadQuestOption( OwnerID() ) --Ū�����ȼҪO
	if Quest == true then --����������
		if Count <= 2 then --���a���W�B���ۼƶq��0, 1, 2
			AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_01]" , "Lua_ying_skillcraft_8850_02" , 0 ) --"�]�A�V118850���_�f�w�����A���ӷN�K�^"
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8850_02() --"�]�A�V118850���_�f�w�����A���ӷN�K�^"�ﶵ

	local Quest = CheckAcceptQuest ( OwnerID() , 424417 ) --���ȡG�Ӧۥ��K�v���e�U
	local Count = CountBodyItem( OwnerID() , 209993 ) --�ˬd�B���ۼƶq

	if Quest == true then --��������
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_02]" ) --��Ӧp���ڡ�A���B��u�n�I�X�ѫe�ڭ�Ķ���F�@�ǦB���ۡA�N�浹�A�a��
								              --�ܩ�n�p���B���ۺ�ű���B��ű���A�o�ڴN�����ա㤣�L�ڪ��D���ӤH�@�w����k�A���N�O�����S�A�L�i�O�@�y����ű�v��A��L�ǨS����
		if Count == 0 then
			GiveBodyItem( OwnerID() , 209993 , 3 ) --�����B����*3
		elseif Count == 1 then
			GiveBodyItem( OwnerID() , 209993 , 2 ) --�����B����*2
		elseif Count == 2 then
			GiveBodyItem( OwnerID() , 209993 , 1 ) --�����B����*1
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_03]" ) --�]���_�f�w���M�`��ۤv���Ʊ��A���G�Sť���A�b���ܡK�^
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8851_01() --NPC�����S ���

	local Quest = CheckAcceptQuest ( OwnerID() , 424417 ) --���ȡG�Ӧۥ��K�v���e�U
	local Count = CountBodyItem( OwnerID() , 209993 ) --�ˬd�B���ۼƶq

	LoadQuestOption( OwnerID() )
	if Quest == true then --����������
		if Count >= 3 then --���a���W�B���ۼƶq3�ӥH�W
			AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_04]" , "Lua_ying_skillcraft_8851_02" , 0 ) --"�аݡA�A�N�Oű���v[118851]�ܡH"
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8851_02() --"�аݡA�A�N�Oű���v[118851]�ܡH" �ﶵ

	local Quest = CheckAcceptQuest ( OwnerID() , 424417 ) --���ȡG�Ӧۥ��K�v���e�U
	local Count = CountBodyItem( OwnerID() , 209993 ) --�ˬd�B���ۼƶq

	if Quest == true then --��������
		if Count >= 3 then
			SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_05]" ) --�ڴN�O[118851]�A������Ʊ��ܡH
						  				 --�]�A��X�F���W��[209993]�A�ç�@�������s�h�߳��i�D�F[118851]�K�^ 
						 				 --�ڪ��D�F�A�o�I�p���������˧ڡA�]�b�ڨ��W�I �]�X�����L��K�^ �����A�ӧa�I�����P�P�N��ű�����F�A�p�߮��n�A���n�˥��o��
			DelBodyItem( OwnerID() , 209993 , 3 ) --�R���B����3��
			GiveBodyItem( OwnerID() , 209994 , 1 ) --�����B��ű��1��
		else
			SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_06]" ) --�ڴN�O[118851]�A������Ʊ��ܡH
							    			--�]�A��@�������s�h�߳��i�D�F[118851]�K�^ �ڪ��D�F�A���M�o��Ʊ������˧ڡA���O�Q����1��[209994]�A������3��[209993]�~��C
		end
	else --�S������
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_07]" ) --�ڴN�O[118851]�S���I���ڲ{�b�ܦ��A���ާA������Ʊ����O�ӥ��Z�ڡA���֨��}��
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fish() --�����A"���s"���󲣥ͼ@��

		SetPlot( OwnerID() , "Touch" , "Lua_ying_skillcraft_fish01" , 30 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fish01() --������
--	Say(OwnerID(), "Owner") = ���a
--	Say(TargetID(), "Target") = ���s
	local Quest = CheckAcceptQuest( OwnerID() , 424418 ) --���ȡG�Ӧ۲i���v���e�U
	local X = Lua_Mounts_Copilot( OwnerID() ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local Count = CountBodyItem( OwnerID() , 209997 ) --�ˬd���a���W���������A���ƶq

	if Quest ==true then --��������
		if Count < 10 then --�������A���ƶq�p��10��
			if X == true then --���b��y
				DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��
				PlayMotion( OwnerID() , 106 ) --����ok�ʧ@�A�Ϥ⤤�Z�����^
				AttachCastMotionTool( OwnerID() , 212402 ) --�m���Z��������
				if BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CRAFT_2011_11]" , 30 , ruFUSION_ACTORSTATE_FISHING_CAST , ruFUSION_ACTORSTATE_FISHING_REEL , 0 , "Lua_ying_skillcraft_fish02") ~= 1 then --���� (3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else --10�ӥH�W
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_10]" , 0 ) --"�A���W�L�k�A�ˤU��h[209997]�C"
		end		
	else --�S������
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_09]" , C_SYSTEM ) --"���೽��������"
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fish02( Player , CheckStatus ) --(�����, �Ѽ�)

	local X = Rand(100)+1 --1~100

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				if X <= 70 then --���v70%
					GiveBodyItem( Player , 209997 , 1 ) --�������������A��
				else --���v30%
					ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_12]" , C_SYSTEM ) --����q�A������W�ò�F��
				end
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				SetModeEx( TargetID() , EM_SetModeType_Mark , false ) --���üаO
				SetModeEx( TargetID() , EM_SetModeType_Show , false ) --���ó��s
				BeginPlot( TargetID() , "Lua_ying_skillcraft_show", 0 ) --��ܳ��s
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				ScriptMessage( TargetID() , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
		AttachCastMotionTool( Player , 212402 ) --�m���Z��������
		BeginPlot( Player , "Lua_ying_skillcraft_motion", 0 ) --��������ʧ@
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_motion() --��������ʧ@

	Sleep(40) --4��
	AttachCastMotionTool( OwnerID() , 212076 )  --�m���Z�����Ť�
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_show() --��ܳ��s

	Sleep(70) --7��
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true ) --��ܼаO
	SetModeEx( OwnerID() , EM_SetModeType_Show , true ) --��ܳ��s
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fire() --�N���A"�U�N������"���󲣥ͼ@��

	SetPlot( OwnerID() , "Touch" , "Lua_ying_skillcraft_fire01" , 30 ) 
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fire01() --�N����

	local Quest = CheckAcceptQuest( OwnerID() , 424418 ) --���ȡG�Ӧ۲i���v���e�U
	local X = Lua_Mounts_Copilot( OwnerID() ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local Count = CountBodyItem( OwnerID() , 209997 ) --�ˬd���a���W���������A���ƶq

	if Quest == true then --��������
		if Count >= 1 then --�������A���ƶq�j�󵥩�1
			if X == true then --���b��y
				DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��
				if BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CRAFT_2011_14]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_skillcraft_fire02") ~= 1 then --�N�� (3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_13]" , C_SYSTEM ) --�������K�U�N���K
		end
	else --�S������
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_13]" , C_SYSTEM ) --�������K�U�N���K
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fire02( Player , CheckStatus ) --(�����, �Ѽ�)

	local X = Rand(100)+1 --1~100

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				if X <= 50 then --���v50%
					GiveBodyItem( Player , 209995 , 1 ) --�����������A��
				else --���v50%
					GiveBodyItem( Player , 209996 , 1 ) --�����N�J����
				end
				DelBodyItem( OwnerID() , 209997 , 1 ) --�R�����������A��1��
				EndCastBar( Player , CheckStatus ) --�M���I�k��
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				ScriptMessage( TargetID() , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_givekey() --�������ȫ����
--	Say(OwnerID(), "Owner") --= NPC
--	Say(TargetID(), "Target") --= ���a

	local QKey = { 545436 , 545437 , 545438 , 545439 , 545440 , 545441 } --Keyitem�ANPC�X���D�ءG��B���B�����B��B�H���B����
	local Step = 0 
	local String = { "[SC_CRAFT_2011_21]" , "[SC_CRAFT_2011_22]" , "[SC_CRAFT_2011_23]" , "[SC_CRAFT_2011_24]" , "[SC_CRAFT_2011_25]" , "[SC_CRAFT_2011_26]" } --�r��G��B���B�����B��B�H���B����
--	(�����ȮɡA�ˬd���a���W�O�_�w���D��key�A�����ܧY�M���C)
	for i = 1 , table.getn(QKey) , 1 do --1 , 6 , 1 do
		if CheckFlag( TargetID() , QKey[i] ) == true then --���a���W������keyitem...
			SetFlag( TargetID() , QKey[i] , 0 ) --�R������keyitem
		end
	end
--	(�Y���a���W�S��������keyitem�A�H�����@���D��key�A�õ�����ܡC)
	for i = 1 , table.getn(QKey) , 1 do --1 , 6 , 1 do
		if CheckFlag( TargetID() , QKey[i] ) == false then
			Step = Step + 1 --�Y���a���W�L����key�A�hStep+1
		end
		if Step == 6 then  --Step == 6�A�Y���a���W6��key�S��
			local R = Rand(6)+1 --(0~5)+1 =1~6

			SetFlag( TargetID() , QKey[R] , 1 ) --�H�������@��key
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_CRAFT_2011_19]".." "..String[R].." ".."[SC_CRAFT_2011_20]" , C_SYSTEM ) --�����Ҫ����K�հt�XX���ľ��I
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_CRAFT_2011_19]".." "..String[R].." ".."[SC_CRAFT_2011_20]" , C_SYSTEM ) --�����Ҫ����K�հt�XX���ľ��I
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424419over() --�������ȫ����
--	Say(OwnerID(), "Owner") --= NPC
--	Say(TargetID(), "Target") --= ���a
	SetFlag( TargetID() , 545436 , 0 ) --��
	SetFlag( TargetID() , 545437 , 0 ) --��
	SetFlag( TargetID() , 545438 , 0 ) --����
	SetFlag( TargetID() , 545439 , 0 ) --��
	SetFlag( TargetID() , 545440 , 0 ) --�H��
	SetFlag( TargetID() , 545441 , 0 ) --����
	SetFlag( TargetID() , 545447 , 0 ) -- �R���Ҫ�����key
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_color() --���C��A"�ľ�"���󲣥ͼ@��

	SetPlot( OwnerID() , "Touch" , "Lua_ying_skillcraft_color01" , 30 )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_color01() --���C��

	local Quest = CheckAcceptQuest( OwnerID() , 424419 ) --���ȡG�Ӧ۷Ҫ��v���e�U
	local Color = { 118854 , 118855 , 118856 , 118857 } --����ID�G�����ľ��B�����ľ��B�Ŧ��ľ��B�զ��ľ�
	local BUFF = { 620402 , 620403 , 620404 , 620405 } --BUFFID�G��BF�B��BF�B��BF�B��BF
	local Key = { 545436 , 545437 , 545438 , 545439 , 545440 , 545441 } --Keyitem�ANPC�X���D�ءG��B���B�����B��B�H���B����
	local Step = { { 620402 , 620403 } , { 620402 , 620404 } , { 620402 , 620405 } , { 620403 , 620404 } , { 620403 , 620405 } , { 620404 , 620405 } }--BUFF�զX�G��+���B��+�� �B��+�աB��+�šB��+�աB��+��
	local Type = 0 --����
	local Count =BuffCount( OwnerID() ) --�d�ߪ��a���WBUFF�ƶq( �_�l�Ȭ� 0 )
	local X = CountBodyItem( OwnerID() , 209998 ) --�ˬd���a���W�O�_��"�V�X�������ľ�"

	if Quest == true then --��������
		if X <= 0 then --���a���W�S��"�V�X�������ľ�"
--			(���j��ΨӧP�_���a���W�O�_�����@���C�⪺BUFF)
			for i = 0 , Count , 1 do --Ū�����a���W�Ҧ�BUFF�`�q
				local BUFFID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID ) --���o���a���W�Y��m��BUFFID

				for j = 1 , table.getn(BUFF) , 1 do --1 , 4 , 1 do
					if BUFFID == BUFF[j] then --�p�G���a���W���o��BUFFID�A�ŦXBUFF[j]...
						Type = Type + 1 --����+1 ( Type�u�|�� 0 �� 1 )
					end
				end
			end
--
			for i = 1 , table.getn(Color) , 1 do --Ū�����Ȫ���ID --1 , 4 , 1 do
				if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == Color[i] then -- �p�G�I�������Ȫ���ID�A�ŦX�}�C�������Ȫ���ID ��...
					if Type == 0 then -- ���a���W������Buff������ 0 �خ�...
						AddBuff( OwnerID() , BUFF[i] , 0 , 300 )
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_16][$SETVAR1=".."["..Color[i] .."]".."]" , C_SYSTEM ) --�A����FX���ľ��K
						break
					elseif Type == 1 then --���a���W������Buff������ 1 �خ�...
						AddBuff( OwnerID() , BUFF[i] , 0 , 300 )
						for j = 1 , table.getn(Key) , 1 do --NPC�X���D�� --1 , 6 , 1 do
							if CheckFlag( OwnerID() , Key[j] ) == true then --�ˬd���a���W�����@���D��key
								if CheckBuff( OwnerID() , Step[j][1] ) == true and CheckBuff( OwnerID() , Step[j][2] ) == true then 
								--�p�G���a���WBUFF�զX�� BUFF[Step[j][1]] �M BUFF[Step[j][2]]
									GiveBodyItem( OwnerID() , 209998 , 1 ) --�������a1��"�V�X�������ľ�"
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_17]" , C_SYSTEM ) --�A���\�հt�X�F�@�~�ľ��I
									break
								else --�D�D�زզX
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_18]" , C_SYSTEM ) --�ݰ_�Ӧ��G�հt���F�A�Э��s���ա�
									break
								end
							end
						end
						for j = 1 , table.getn(BUFF) , 1 do -- 1 , 4 , 1 do
							CancelBuff( OwnerID() , BUFF[j] ) --�M�����a���WBUFF
						end
					end
				end
			end
		else --��"�V�X�������ľ�"
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_09]" , 0 ) --"�A�w�֦��ӥ��Ȫ��~"
		end
	else --�S������
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_15]" , 0 ) --�Ф��H�N�IĲ�I
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8816_01() --NPC����� ���

	local Quest = CheckAcceptQuest( OwnerID() , 424420 ) --���ȡG�Ӧۻs�Үv���e�U
	local Count = CountBodyItem( OwnerID() , 209999 ) --�ˬd��u�j���K�ƶq
	local BUFF = CheckBuff( OwnerID() , 620431 ) --�ˬd���a���W�O�_���C���D��BUFF
	
	if Quest == true then --��������
		if  BUFF == true then --���D��BUFF
			if Count <= 0 then --���W�S����u�j���K
				SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_33]" ) --����Ӳq�q�ݡA�ڨ��W�����q�O����������a��
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_34]" , "Lua_ying_skillcraft_select0" , 0 ) --�����q200244
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_35]" , "Lua_ying_skillcraft_select1" , 0 ) --�����q200230
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_36]" , "Lua_ying_skillcraft_select2" , 0 ) --���K�q200234
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_37]" , "Lua_ying_skillcraft_select3" , 0 ) --��q200238
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_38]" , "Lua_ying_skillcraft_select4" , 0 ) --�����q200236
			else
				SetSpeakDetail ( OwnerID() , "[SC_VALENTINE_2011EV1_09]" ) --"�A�w�֦��ӥ��Ȫ��~"
			end
		else --�S�D��BUFF
			SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_27]" ) --�H�H�H��ڦ��@�ӫܯS�O���F����O�ڪ������ڪ��A�A�Q���D�O����ܡH�����K�~���i�D�A�O�I
			if Count <= 0 then --���W�S����u�j���K
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_28]" , "Lua_ying_skillcraft_8816_02" , 0 ) --���U�A�i�D�ڹ���
			end
		end
	else --�S����
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_27]" ) --�H�H�H��ڦ��@�ӫܯS�O���F����O�ڪ������ڪ��A�A�Q���D�O����ܡH�����K�~���i�D�A�O�I
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8816_02() --"���U�A�i�D�ڹ���"

	local Quest = CheckAcceptQuest( OwnerID() , 424420 ) --���ȡG�Ӧۻs�Үv���e�U

	if Quest == true then
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_29]" ) --��K�n�a�A���O�A���i�H�i�D�O�H��㪨�����o�ӥs��[209999]�A�ܺ}�G�a�H�G�������O�K
									 --�������o�ӪF��ܦh�H���Q�n�K�x�H�I�A�Ӥ��|�]�O�Q�n�o�ӪF��a�H�ڤ��������H�����
									 --�n���K�A���ڪ��ӹC���n�F�A�H�H�H��b�ڨ��W�٦��t�@���q�A�u�n�A��b30���q���O�����q�B�ƶq�h�֡A�ڴN��[209999]���A�C
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_30]" , "Lua_ying_skillcraft_8816_03" , 0 ) --����������D�I�ڷǳƦn�n�q�o��
	else
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_31]" ) --�ڤS���{�ѧA�A���������i�H�򭯥ͤH���ܡI
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8816_03() --"����������D�I�ڷǳƦn�n�q�o��"

	local Quest = CheckAcceptQuest( OwnerID() , 424420 ) --���ȡG�Ӧۻs�Үv���e�U
	local Ran = Rand(50) --0~49
	local NoNum = { 9 , 19 , 29 , 39 , 49 } --�b�C������ 10 , 20 , 30 , 40 , 50 (���n���ﶵ) --1~9

	if Quest == true then
		for i = 1 , table.getn(NoNum) , 1 do --1 , 5 , 1 do --���n���Ʀr
			if Ran == NoNum[i] then --�Yrand�줣�n���Ʀr�N-1
				Ran= Ran - 1  --rand�줣�n���Ʀr�N-1		
			end
		end
		AddBuff( OwnerID() , 620431 , Ran , 30 ) --�D��BUFF
--		Say( OwnerID() , "Ran = "..Ran )
		Lua_ying_skillcraft_8816_01()
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_32]" , 0 ) --�A�w�N���ȩ��A�L�k�}�l�C���I
		CloseSpeak( OwnerID() ) --������ܵ���
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select0() --�����q200244

	Lua_ying_skillcraft_menu(0)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select1() --�����q200230

	Lua_ying_skillcraft_menu(1)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select2() --���K�q200234

	Lua_ying_skillcraft_menu(2)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select3() --��q200238

	Lua_ying_skillcraft_menu(3)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select4() --�����q200236

	Lua_ying_skillcraft_menu(4)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_menu(Value) --��ܨ䤤�@���q
--	Say(OwnerID(), "Owner") --= ���a
--	Say(TargetID(), "Target") --= NPC
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620431 ) --�P�_���a���W���D��BUFF���Ŧh��
	local Num1 = Math.floor( BuffLV / 10 ) --�����(�YBuffLV=15�A��10����ƫᬰ1)

	if Num1 == Value then --�YBuffLV����ƫ᪺�Ʀr����ﶵ�Ʀr�A����
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_39]" ) --����F���A�F�`�A�A�ӴN�O�q�ƶq�o��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_41]" , "Lua_ying_skillcraft_opt0" , 0 ) --1��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_42]" , "Lua_ying_skillcraft_opt1" , 0 ) --2��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_43]" , "Lua_ying_skillcraft_opt2" , 0 ) --3��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_44]" , "Lua_ying_skillcraft_opt3" , 0 ) --4��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_45]" , "Lua_ying_skillcraft_opt4" , 0 ) --5��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_46]" , "Lua_ying_skillcraft_opt5" , 0 ) --6��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_47]" , "Lua_ying_skillcraft_opt6" , 0 ) --7��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_48]" , "Lua_ying_skillcraft_opt7" , 0 ) --8��
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_49]" , "Lua_ying_skillcraft_opt8" , 0 ) --9��
	else --����
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_40]" ) --�H�H�H��o�ӵ��פ�����
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt0() --1��

	Lua_ying_skillcraft_menu02(0)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt1() --2��

	Lua_ying_skillcraft_menu02(1)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt2() --3��

	Lua_ying_skillcraft_menu02(2)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt3() --4��

	Lua_ying_skillcraft_menu02(3)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt4() --5��

	Lua_ying_skillcraft_menu02(4)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt5() --6��

	Lua_ying_skillcraft_menu02(5)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt6() --7��

	Lua_ying_skillcraft_menu02(6)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt7() --8��

	Lua_ying_skillcraft_menu02(7)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt8() --9��

	Lua_ying_skillcraft_menu02(8)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_menu02(Value) --��ܼƶq

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620431 ) --�P�_���a���W���D��BUFF���Ŧh��
	local Num2 = BuffLV % 10 --���l��(�YBuffLV=27�A��10���l�ƫᬰ7)

	if Num2 == Value then --�YBuffLV���l�ƫ᪺�Ʀr����ﶵ�Ʀr�A����
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_50]" ) --�z�ɡA�o�˳���Q�A�q��A���ڴN��[209999]�e���A�F�A���ŦA�ӳ��ڪ��@��
		GiveBodyItem( OwnerID() , 209999 , 1 ) --������u�j���K1��
		CancelBuff( OwnerID() , 620431 ) --�R���D��BUFF
	else --����
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_40]" ) --�H�H�H��o�ӵ��פ�����
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8848_01() --NPC �B�y ���

	local Key1 = CheckFlag( OwnerID(), 545443 ) -- ���_����
	local Key2 = CheckFlag( OwnerID(), 545444 ) -- ��u����
	local Key3 = CheckFlag( OwnerID(), 545445 ) -- ���K����
	local Key4 = CheckFlag( OwnerID(), 545446 ) -- �i������
	local Key5 = CheckFlag( OwnerID(), 545447 ) -- �Ҫ�����
	local Key6 = CheckFlag( OwnerID(), 545448 ) -- �s�ҥ���
	local KeyA = CheckFlag( OwnerID(), 545449 ) -- �w���(�C�魫�m)

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	if KeyA == false then
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_51]" ) --�C�^�@��F�o�Ӯɸ`�A���K�̬��F�����ҶǩӤU�Ӫ��u���K�믫�v.....
		AddSpeakOption( OwnerID() , TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_ying_skillcraft_8848_02" , 0 ) --�M��O?
	elseif KeyA == true and Key1 == false and Key2 == false and Key3 == false and Key4 == false and Key5 == false and Key6 == false then
		SetSpeakDetail ( OwnerID() , "[SC_THANKSGIVING_16]" ) --�A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
	elseif KeyA == true then
		LoadQuestOption( OwnerID())
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8848_02() --"�M��O?"�ﶵ

	SetFlag( OwnerID() , 545443 , 1 ) -- ���_����
	SetFlag( OwnerID() , 545444 , 1 ) -- ��u����
	SetFlag( OwnerID() , 545445 , 1 ) -- ���K����
	SetFlag( OwnerID() , 545446 , 1 ) -- �i������
	SetFlag( OwnerID() , 545447 , 1 ) -- �Ҫ�����
	SetFlag( OwnerID() , 545448 , 1 ) -- �s�ҥ���
	SetFlag( OwnerID() , 545449 , 1 ) -- �w���(�C�魫�m)
	LoadQuestOption( OwnerID())
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424415over()

	SetFlag( TargetID() , 545443 , 0 ) -- �R�����_����key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424416over()

	SetFlag( TargetID() , 545444 , 0 ) -- �R����u����key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424417over()

	SetFlag( TargetID() , 545445 , 0 ) -- �R�����K����key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424418over()

	SetFlag( TargetID() , 545446 , 0 ) -- �R���i������key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424420over()

	SetFlag( TargetID() , 545448 , 0 ) -- �R���s�ҥ���key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------