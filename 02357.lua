function Lua_ying_music_118507talk() --NPC�w�� �E ���w���

	local KeyA = CheckFlag( OwnerID() , 545145 ) --�w������
	local KeyB = CheckFlag( OwnerID() , 545146 ) --�w����y
	local Lv = ReadRoleValue ( OwnerID() , EM_RoleValue_LV ) --�ˬd���a����
	local Count = CountBodyItem( OwnerID() , 209950 ) --���㪺�]�k�ֳ��ƶq

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	if Lv >= 48 then --����48�H�W
		if KeyA == false and KeyB == false and Count == 0 then --�������ȡB������y�B���W�L�������
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_01]" ) --�A�����ڧ�^�򥢪��]�k���šA���]�k�ֳ��A������ܡH
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_02]" , "Lua_ying_music_118507talk2" , 0 ) --"�S���D�I���O�ӫ�򰵩O�H"�ﶵ
		elseif KeyB == true then --�w����y
			SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) --�A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
		elseif Count >= 1 then --���W�w�����㪺�]�k�ֳ�
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_01]" ) --�A�����ڧ�^�򥢪��]�k���šA���]�k�ֳ��A������ܡH
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_05]" , "Lua_ying_music_118507talk4" , 0 ) --"�ڤw�g�N���㪺�]�k�ֳ��a�^�ӤF��"�ﶵ
		else --��keyA�B���S���㪺�]�k�ֳ�
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_07]" ) --�V������󭵲Ťp���F���ߩʦ��G���A�ѡA�γ\�o�������Ťp���F�̶}�ߪ���k��
		end
	else --����48�H�U
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011EV1_01]" ) -- "�ګܷP�§A���n�N�A�i���A����O���G�٨S����k���W�ڪ���"
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118507talk2() --"�S���D�I���O�ӫ�򰵩O�H"�ﶵ

	SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_03]" ) --���L�A���ӤH�A�ˬO�i�H�h�߰ݬݬݡA�V������󭵲Ťp���F���ߩʦ��G���A�ѡA�����w�o���D�Ǥ���K
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_04]" , "Lua_ying_music_118507talk3" , 0 ) --"�n���A�ڳo�N�h�A���ݧڪ��n�����a��"�ﶵ
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118507talk3() --"�n���A�ڳo�N�h�A���ݧڪ��n�����a��"�ﶵ

	SetFlag( OwnerID() , 545145 , 1 ) --�����w������Key
	
	local Rd = Rand(100)+1 --rand(0~99)+1 = 1~100

	if Rd >= 1 and Rd <= 20 then --1~20
		GiveBodyItem( OwnerID() , 209945 , 1 ) --�����ʤ֭��Ū��]�k�ֳ�1
	elseif Rd >20 and Rd <= 40 then --21~40
		GiveBodyItem( OwnerID() , 209946 , 1 ) --�����ʤ֭��Ū��]�k�ֳ�2
	elseif Rd >40 and Rd <= 60 then --41~60
		GiveBodyItem( OwnerID() , 209947 , 1 ) --�����ʤ֭��Ū��]�k�ֳ�3
	elseif Rd >60 and Rd <= 80 then --61~80
		GiveBodyItem( OwnerID() , 209948 , 1 ) --�����ʤ֭��Ū��]�k�ֳ�4
	else --81~100
		GiveBodyItem( OwnerID() , 209949 , 1 ) --�����ʤ֭��Ū��]�k�ֳ�5
	end
		CloseSpeak( OwnerID() )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Hao_Lost_Magic_Note(Count)	-- 2013.05.27 �d�ߪ��a�����R�ָ`���ʡu�򥢪��]�k���šv������

	local Player = OwnerID()
	local Complete = ReadRoleValue( Player , EM_LuaValueFlag_UseItem46 )	-- Ū����������
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	if Count == nil then
		Count = Complete
	else
		WriteRoleValue( Player , EM_LuaValueFlag_UseItem46 , Count )
	end
	DebugMsg( Player , Room , "Completions = "..Count )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Hao_Check_Buff_Status(BuffID)	-- 2013.05.27 �T�{���a�O�_�������wBuff

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Count ~= nil then
		if CheckBuff( Player , BuffID ) == true then
			DebugMsg( Player , Room , "true" )
			return
		end
	end
	DebugMsg( Player , Room , "false" )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118507talk4() --"�ڤw�g�N���㪺�]�k�ֳ��a�^�ӤF��"�ﶵ

	-- 2013.05.27 �ץ����a�����R�ָ`���ʡu�򥢪��]�k���šv��A�b�ŦX�ٸ����o����ɡA�����v�L�k���o�ٸ������D�C
	local Player = OwnerID()
	local Complete = ReadRoleValue( Player , EM_LuaValueFlag_UseItem46 )	-- Ū����������
	WriteRoleValue( Player , EM_LuaValueFlag_UseItem46 , Complete+1 )
	--
	SetFlag( OwnerID() , 545145 , 0 ) --�R���w������key
	SetFlag( OwnerID() , 545146 , 1 ) --�����w����yKey
	SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_06]" ) --���F��ܧڪ��P�¡A�o�ǭ��Ÿ���дN�e���A�A���֧A���Ӵr�֪��R�ָ`��
	GiveBodyItem( OwnerID() , 204428 , 4 ) --��������*4
	GiveBodyItem( OwnerID() , 204457 , 4 ) --��������*4
	DelBodyItem( OwnerID() , 209950 , 1 ) --�R�����㪺�]�k�ֳ�

--	AddBuff( OwnerID() , 509892 , 0 , 604800 ) --����7��, ���ȧ�������BUFF
--	local BuffLV = FN_CountBuffLevel( OwnerID() , 509892 ) --�ˬd���a���WBUFFLV
	local CHK1 = CountBodyItem( OwnerID() , 530731 ) --�ˬd�O�_���ٸ�
	local CHK2 = CountBodyItem( OwnerID() , 530732 ) --�ˬd�O�_���ٸ�
--	if BuffLV == 2 then --�C����BuffLV3
	DebugMsg( Player , 0 , "Completions = "..Complete+1 )
	if Complete+1 == 3 then
		if CHK1 < 1 then --�L�ٸ�
			GiveBodyItem( OwnerID() , 530731 , 1 ) --�����ٸ�"�]�k���ŷj����"
		end
--	elseif BuffLV == 6 then --�C����BuffLV7
	elseif Complete+1 == 7 then
		if CHK2 < 1 then --�L�ٸ�
			GiveBodyItem( OwnerID() , 530732 , 1 ) --�����ٸ�"�ڤ��O�����I"
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_delitem() --�R���ֳ���Ĳ�o

	SetFlag( OwnerID() , 545145 , 0 ) --�R���w������key
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209945Use() --���b209945���~�W��script�A�۸O����
	ClearBorder( OwnerID() ) --��l�ƥ۸O�����A�}�Y�@�w�n����
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_18]" ) --����01���e
	ShowBorder( OwnerID() , 0 , "[209945]", "ScriptBorder_Texture_Paper" ) --�]�w�۸O����
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209946Use() --���b209946���~�W��script�A�۸O����
	ClearBorder( OwnerID() ) --��l�ƥ۸O�����A�}�Y�@�w�n����
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_19]" ) --����02���e
	ShowBorder( OwnerID() , 0 , "[209946]", "ScriptBorder_Texture_Paper" ) --�]�w�۸O����
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209947Use() --���b209947���~�W��script�A�۸O����
	ClearBorder( OwnerID() ) --��l�ƥ۸O�����A�}�Y�@�w�n����
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_20]" ) --����03���e
	ShowBorder( OwnerID() , 0 , "[209947]", "ScriptBorder_Texture_Paper" ) --�]�w�۸O����
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209948Use() --���b209948���~�W��script�A�۸O����
	ClearBorder( OwnerID() ) --��l�ƥ۸O�����A�}�Y�@�w�n����
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_21]" ) --����04���e
	ShowBorder( OwnerID() , 0 , "[209948]", "ScriptBorder_Texture_Paper" ) --�]�w�۸O����
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209949Use() --���b209949���~�W��script�A�۸O����
	ClearBorder( OwnerID() ) --��l�ƥ۸O�����A�}�Y�@�w�n����
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_22]" ) --����05���e
	ShowBorder( OwnerID() , 0 , "[209949]", "ScriptBorder_Texture_Paper" ) --�]�w�۸O����
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk() --NPC�V�����D��L���

	local Key = CheckFlag( OwnerID() , 545145 )

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	if Key == true then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_08]" ) --�C��R�ָ`�����A�`���ܦh�H�ӦV�ڸ߰����󭵲Ťp���F���ơKXXX�A�A�]�O�Ӱݧ����󭵲Ťp���F���Ʊ��ܡH
		AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_09]" , "Lua_ying_music_118515talk00" , 0 ) --"�O���C"�ﶵ
	else
		LoadQuestOption( OwnerID() ) --Ū���ҪO
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk00() --"�O���C"�ﶵ

	SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_10]" ) --�p�G�A�ব����5�ӵ}�����Ф�A�ڴN���A�D��1�ӭ��Ťp���F�߷R�����~�C
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209953]]" , "Lua_ying_music_118515talk03" , 0 ) --"�е��ڼ��}"�ﶵ209953
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209951]]" , "Lua_ying_music_118515talk01" , 0 ) --"�е��ک]���ï]"�ﶵ209951
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209955]]" , "Lua_ying_music_118515talk05" , 0 ) --"�е��ھ����S��"�ﶵ209955
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209954]]" , "Lua_ying_music_118515talk04" , 0 ) --"�е��گ���d�D��"�ﶵ209954
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209952]]" , "Lua_ying_music_118515talk02" , 0 ) --"�е��گ�������"�ﶵ209952
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk03() --"�е��ڼ��}"�ﶵ209953

	local Count = CountBodyItem( OwnerID() , 209956 ) --�ˬd���a���W�}�����Ф�

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --�A���W�}�����Ф��٤����H�I���p���F�߷R�����~�@�㻰��h�����a�I
	else
		GiveBodyItem( OwnerID() , 209953 , 1 ) --�������}1��
		DelBodyItem( OwnerID() , 209956 , 5 ) --�����}�����Ф�5��
		CloseSpeak( OwnerID() ) --������ܵ���
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk01() --"�е��ک]���ï]"�ﶵ209951

	local Count = CountBodyItem( OwnerID() , 209956 ) --�ˬd���a���W�}�����Ф�

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --�A���W�}�����Ф��٤����H�I���p���F�߷R�����~�@�㻰��h�����a�I
	else
		GiveBodyItem( OwnerID() , 209951 , 1 ) --�����]���ï]1��
		DelBodyItem( OwnerID() , 209956 , 5 ) --�����}�����Ф�5��
		CloseSpeak( OwnerID() ) --������ܵ���
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk05() --"�е��ھ����S��"�ﶵ209955

	local Count = CountBodyItem( OwnerID() , 209956 ) --�ˬd���a���W�}�����Ф�

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --�A���W�}�����Ф��٤����H�I���p���F�߷R�����~�@�㻰��h�����a�I
	else
		GiveBodyItem( OwnerID() , 209955 , 1 ) --���������S��1��
		DelBodyItem( OwnerID() , 209956 , 5 ) --�����}�����Ф�5��
		CloseSpeak( OwnerID() ) --������ܵ���
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk04() --"�е��گ���d�D��"�ﶵ209954

	local Count = CountBodyItem( OwnerID() , 209956 ) --�ˬd���a���W�}�����Ф�

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --�A���W�}�����Ф��٤����H�I���p���F�߷R�����~�@�㻰��h�����a�I
	else
		GiveBodyItem( OwnerID() , 209954 , 1 ) --��������d�D��1��
		DelBodyItem( OwnerID() , 209956 , 5 ) --�����}�����Ф�5��
		CloseSpeak( OwnerID() ) --������ܵ���
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk02() --"�е��گ�������"�ﶵ209952

	local Count = CountBodyItem( OwnerID() , 209956 ) --�ˬd���a���W�}�����Ф�

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --�A���W�}�����Ф��٤����H�I���p���F�߷R�����~�@�㻰��h�����a�I
	else
		GiveBodyItem( OwnerID() , 209952 , 1 ) --������������1��
		DelBodyItem( OwnerID() , 209956 , 5 ) --�����}�����Ф�5��
		CloseSpeak( OwnerID() ) --������ܵ���
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118510() --���Ťp���FDO���

	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key
	local Count = CountBodyItem( OwnerID() , 209951 ) --�ˬd���a���W�]���ï]

	if Key == true then --��������
		if Count >= 1 then -- �]���]1�ӥH�W
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209951]]" ) --XXX�A�A��W���]���ï]�ڦn���w�A�i�H�e���ڶܡH�گ���A���@��ơA���ޤ���Ƴ����
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118510talk" , 0 ) --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ
		else --�S���]���]
			LoadQuestOption( OwnerID() ) --Ū���ҪO
		end
	else --�S������
		LoadQuestOption( OwnerID() ) --Ū���ҪO
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118510talk() --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ

	local Count1 = CountBodyItem( OwnerID() , 209951 ) --�ˬd���a���W�]���ï]
	local Count = CountBodyItem( OwnerID() , 209945 ) --�ʤ֭��Ū��]�k�ֳ�1
	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key

	if Count1 >= 1 then -- �]���ï]1�ӥH�W
		if Key == true then --���W������key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209951]]" ) --���§A�����]���ï]�A�گu���ܳ��w��
				DelBodyItem( OwnerID() , 209945 , 1 ) --�R���ʤ֭��Ū��]�k�ֳ�1
				DelBodyItem( OwnerID() , 209951 , 1 ) --�R���]���ï]
				GiveBodyItem( OwnerID() , 209950 , 1 ) --�������㪺�]�k�ֳ�
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
			else --���O�ʤ֭��Ū��]�k�ֳ�1
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --�]�p���F�յۼg�W���šA���O���˴N�O�g���W�K�^
				DelBodyItem( OwnerID() , 209951 , 1 ) --�R���]���ï]
			end
		else --���W�S������key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --�A���W���]�k�ֳ��O�H��򤣨��F�H�I
		end
	else --�S���]���ï]
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209951]]" ) --�x��A���O���n��]���ï]���ڶܡH��򤣨��F�H�I
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118511() --���Ťp���FRE���

	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key
	local Count = CountBodyItem( OwnerID() , 209952 ) --�ˬd���a���W��������

	if Key == true then --��������
		if Count >= 1 then -- ��������1�ӥH�W
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209952]]" ) --XXX�A�A��W�����������ڦn���w�A�i�H�e���ڶܡH�گ���A���@��ơA���ޤ���Ƴ����
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118511talk" , 0 ) --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ
		else --�S����������
			LoadQuestOption( OwnerID() ) --Ū���ҪO
		end
	else --�S������
		LoadQuestOption( OwnerID() ) --Ū���ҪO
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118511talk() --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ

	local Count = CountBodyItem( OwnerID() , 209946 ) --�ʤ֭��Ū��]�k�ֳ�2
	local Count1 = CountBodyItem( OwnerID() , 209952 ) --�ˬd���a���W��������
	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key

	if Count1 >= 1 then -- ��������1�ӥH�W
		if Key == true then --���W������key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209952]]" ) --���§A�������������A�گu���ܳ��w��
				DelBodyItem( OwnerID() , 209946 , 1 ) --�R���ʤ֭��Ū��]�k�ֳ�2
				DelBodyItem( OwnerID() , 209952 , 1 ) --�R����������
				GiveBodyItem( OwnerID() , 209950 , 1 ) --�������㪺�]�k�ֳ�
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
			else --���O�ʤ֭��Ū��]�k�ֳ�2
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --�]�p���F�յۼg�W���šA���O���˴N�O�g���W�K�^
				DelBodyItem( OwnerID() , 209952 , 1 ) --�R����������
			end
		else --���W�S������key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --�A���W���]�k�ֳ��O�H��򤣨��F�H�I
		end
	else --�S����������
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209952]]" ) --�x��A���O���n�⯫���������ڶܡH��򤣨��F�H�I
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118512() --���Ťp���FMI���

	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key
	local Count = CountBodyItem( OwnerID() , 209953 ) --�ˬd���a���W���}

	if Key == true then --��������
		if Count >= 1 then -- ���}1�ӥH�W
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209953]]" ) --XXX�A�A��W�����}�ڦn���w�A�i�H�e���ڶܡH�گ���A���@��ơA���ޤ���Ƴ����
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118512talk" , 0 ) --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ
		else --�S�����}
			LoadQuestOption( OwnerID() ) --Ū���ҪO
		end
	else --�S������
		LoadQuestOption( OwnerID() ) --Ū���ҪO
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118512talk() --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ

	local Count = CountBodyItem( OwnerID() , 209947 ) --�ʤ֭��Ū��]�k�ֳ�3
	local Count1 = CountBodyItem( OwnerID() , 209953 ) --�ˬd���a���W���}
	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key

	if Count1 >= 1 then -- ���}1�ӥH�W
		if Key == true then --���W������key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209953]]" ) --���§A�������}�A�گu���ܳ��w��
				DelBodyItem( OwnerID() , 209947 , 1 ) --�R���ʤ֭��Ū��]�k�ֳ�3
				DelBodyItem( OwnerID() , 209953 , 1 ) --�R�����}
				GiveBodyItem( OwnerID() , 209950 , 1 ) --�������㪺�]�k�ֳ�
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
			else --���O�ʤ֭��Ū��]�k�ֳ�3
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --�]�p���F�յۼg�W���šA���O���˴N�O�g���W�K�^
				DelBodyItem( OwnerID() , 209953 , 1 ) --�R�����}
			end
		else --���W�S������key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --�A���W���]�k�ֳ��O�H��򤣨��F�H�I
		end
	else --�S�����}
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209953]]" ) --�x��A���O���n����}���ڶܡH��򤣨��F�H�I
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118513() --���Ťp���FFA���

	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key
	local Count = CountBodyItem( OwnerID() , 209954 ) --�ˬd���a���W����d�D��

	if Key == true then --��������
		if Count >= 1 then -- ����d�D��1�ӥH�W
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209954]]" ) --XXX�A�A��W������d�D�ɧڦn���w�A�i�H�e���ڶܡH�گ���A���@��ơA���ޤ���Ƴ����
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118513talk" , 0 ) --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ
		else --�S������d�D��
			LoadQuestOption( OwnerID() ) --Ū���ҪO
		end
	else --�S������
		LoadQuestOption( OwnerID() ) --Ū���ҪO
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118513talk() --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ

	local Count = CountBodyItem( OwnerID() , 209948 ) --�ʤ֭��Ū��]�k�ֳ�4
	local Count1 = CountBodyItem( OwnerID() , 209954 ) --�ˬd���a���W����d�D��
	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key

	if Count1 >= 1 then -- ����d�D��1�ӥH�W
		if Key == true then --���W������key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209954]]" ) --���§A��������d�D�ɡA�گu���ܳ��w��
				DelBodyItem( OwnerID() , 209948 , 1 ) --�R���ʤ֭��Ū��]�k�ֳ�4
				DelBodyItem( OwnerID() , 209954 , 1 ) --�R������d�D��
				GiveBodyItem( OwnerID() , 209950 , 1 ) --�������㪺�]�k�ֳ�
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
			else --���O�ʤ֭��Ū��]�k�ֳ�4
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --�]�p���F�յۼg�W���šA���O���˴N�O�g���W�K�^
				DelBodyItem( OwnerID() , 209954 , 1 ) --�R������d�D��
			end
		else --���W�S������key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --�A���W���]�k�ֳ��O�H��򤣨��F�H�I
		end
	else --�S������d�D��
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209954]]" ) --�x��A���O���n�⯻��d�D�ɵ��ڶܡH��򤣨��F�H�I
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118514() --���Ťp���FSO���

	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key
	local Count = CountBodyItem( OwnerID() , 209955 ) --�ˬd���a���W�����S��

	if Key == true then --��������
		if Count >= 1 then -- �����S��1�ӥH�W
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209955]]" ) --XXX�A�A��W�������S���ڦn���w�A�i�H�e���ڶܡH�گ���A���@��ơA���ޤ���Ƴ����
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118514talk" , 0 ) --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ
		else --�S�������S��
			LoadQuestOption( OwnerID() ) --Ū���ҪO
		end
	else --�S������
		LoadQuestOption( OwnerID() ) --Ū���ҪO
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118514talk() --"�n�ڡ�A�����ڱN�򥢪����ŸɤW�ܡH"�ﶵ

	local Count = CountBodyItem( OwnerID() , 209949 ) --�ʤ֭��Ū��]�k�ֳ�5
	local Count1 = CountBodyItem( OwnerID() , 209955 ) --�ˬd���a���W�����S��
	local Key = CheckFlag( OwnerID() , 545145 ) --�w������key

	if Count1 >= 1 then -- �����S��1�ӥH�W
		if Key == true then --���W������key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209955]]" ) --���§A���������S���A�گu���ܳ��w��
				DelBodyItem( OwnerID() , 209949 , 1 ) --�R���ʤ֭��Ū��]�k�ֳ�5
				DelBodyItem( OwnerID() , 209955 , 1 ) --�R�������S��
				GiveBodyItem( OwnerID() , 209950 , 1 ) --�������㪺�]�k�ֳ�
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"�A�w���\��^�򥢪��]�k���šA����V[118507]�^���a�I"
			else --���O�ʤ֭��Ū��]�k�ֳ�5
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --�]�p���F�յۼg�W���šA���O���˴N�O�g���W�K�^
				DelBodyItem( OwnerID() , 209955 , 1 ) --�R�������S��
			end
		else --���W�S������key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --�A���W���]�k�ֳ��O�H��򤣨��F�H�I
		end
	else --�S�������S��
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209955]]" ) --�x��A���O���n�⾮���S�����ڶܡH��򤣨��F�H�I
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_elf() --���ź��F_���󲣥ͼ@��

	AddBuff( OwnerID() , 509891 , 1 , -1 ) --���F+�S��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound01() --���񭵮�DO

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect01" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect01() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\1.mp3", false ) --DO
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound02() --���񭵮�RE

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect02" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect02()

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\2.mp3", false ) --RE
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound03() --���񭵮�MI

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect03" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect03() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\3.mp3", false ) --MI
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound04() --���񭵮�FA

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect04" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect04() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\4.mp3", false ) --FA
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound05() --���񭵮�SO

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect05" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect05() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\5.mp3", false ) --SO
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound06() --���񭵮�LA

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect06" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect06() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\6.mp3", false ) --LA
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound07() --���񭵮�SI

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect07" , 0 ) --�I���@��
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect07() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\7.mp3", false ) --SI
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------