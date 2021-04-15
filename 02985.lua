--=======================================================
--	<�@����t�q�αƶ��禡>
--
--	�ݪ��G
--		Ĳ�o��t�@������ܥ�NPC�AEM_RoleValue_Register+1���n�ΡA�d�����t��
--
--	�ƫe�ǳơG
--		����NPC*1		�Ψ�Ĳ�o��t�@������ܥ�NPC
--		�򥻪k�N*1		�@�ӥΨӧP�_Client�㹳��buff�A�M�w���a�O�_�i�H�ݨ�NPC���t�X
--		Client�@��		���n�t�X��NPC���WClient�㹳�@���A�ΤW������buff��P�_
--		�S��s��		�@�սs���A�������ܼƿ��ѥΪ��A�Ф@�w�n���S��A��ĳ�����Υ��Ƚs���A�p�G�S�����ȴN�۳пW�S�s��
--
--=======================================================
function FN_Quest_Acting_plot( QuestID, BuffID, Func )
	--�qNPC����ܼ@������o��ӡA�O�o�N�J�ѼƯS��s��
	--�o��|������t�O�_�b�i�椤�A�p�G�S�b�i��h�����}�l��t�A�p�G��t���h�⪱�a�ƤJ���ݪ���C
	local Player = OwnerID()
	local NPC = TargetID()
	local InActing = ReadRoleValue( NPC, EM_RoleValue_Register+1 )
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
	--�ˬd�����ܼƬO�_�s�b�A�Ыإ����ܼ�
	if Global_player_queue == nil then Global_player_queue = {} end
	if Global_player_queue[ZoneID] == nil then Global_player_queue[ZoneID] = {} end
	if Global_player_queue[ZoneID][QuestID] == nil then Global_player_queue[ZoneID][QuestID] = {} end
	--�ˬd�O�_�b��t���A"0"=�_�A"1"=�O�A"2"=�Y�N�}�l
	DebugMSG(0,0,"EM_RoleValue_Register="..InActing)
	if InActing == 1 or InActing == 2 then
		if FN_InTableCheck( Player, Global_player_queue[ZoneID][QuestID] ) == false then
			--�T�{���a���bqueue,�̭��A��L��J
			table.insert( Global_player_queue[ZoneID][QuestID], Player )
			if InActing == 1 then
				ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_17]", 0 )	--�@���t�X���b�i�椤�A�N�z�ƤJ�U�@�������ݦ�C���A�Y���}���ϰ�h�۰����}��C
			else
				ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_20]", 0 )	--�@���t�X�Y�N�}�l�A�Ф��n����				
			end
		else
			ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_18]", 0 )	--�z�w�g�b���ݦ�C���A�е��ݤU�@���@���t�X
		end
	else
		CallPlot( NPC, "FN_Quest_Acting_Main", Player, NPC, Func, QuestID, BuffID )	--�}�l��t
	end
	CloseSpeak( Player )
end

function FN_Quest_Acting_Main( Player, NPC, Func, QuestID, BuffID )
	WriteRoleValue( NPC, EM_RoleValue_Register+1, 1 )		--�g����t���b�i�椤
	--
	local ActPlayerTable = {}	--�o��Table�O�B�z�Ҧ��ѻP�@�������a�A�|�b���ᦳ�ҧ��
	if type(Player) == "table" then
		ActPlayerTable = Player
	else
		table.insert( ActPlayerTable, Player )
	end

	--=================�@����t�}�l=============
	--�o��n�걵�L�h��t���D�n�@���A�o��|�N�J��ӰѼơA�ѻP�@�������a�� ActPlayerTable & ���Ĳ�o��NPC
	CallPlot( NPC, Func, ActPlayerTable, NPC )
	--=================�@����t����=============
	Sleep( 50 )
	while true do
		Sleep( 10 )
		--�i�J�@�Ӱj���ˬd�A�p�G�ݪ�t�����a���W���S���ݪ�t�Ϊ�Buff�A��ܪ�t�����F�A�i�H�I�s����plot
		local ShowOverCheck = true
		for p = 1, #ActPlayerTable do
			if CheckID( ActPlayerTable[p] ) == true and CheckBuff( ActPlayerTable[p], BuffID ) == true then
				ShowOverCheck = false
			end
		end
		if ShowOverCheck == true then
			CallPlot( NPC, "FN_Quest_Acting_ReActCheck", NPC, Func, QuestID, BuffID )
			return
		end
	end
end

function FN_Quest_Acting_ReActCheck( NPC, Func, QuestID, BuffID )
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
	--��t��������]�o�禡�A�P�_��C�����S�����ݪ����a�A�ӨM�w�O�_�n�A�t�@��

	if #Global_player_queue[ZoneID][QuestID] > 0 then
		-- �j��0��ܦ�C�������ݪ����a
		for i = 1, #Global_player_queue[ZoneID][QuestID] do
			CallPlot( Global_player_queue[ZoneID][QuestID][i], "FN_Quest_Acting_AskJoin", NPC, QuestID )
		end
		Global_player_queue[ZoneID][QuestID] = {}					--�M��queue
		WriteRoleValue( NPC, EM_RoleValue_Register+1, 2 )				--�g���ǳƶ}�l
		Sleep(400)									--����40��
		--���ݪ��o�q�ɶ��̡A�I���@�N�[�J�@�������a�A�άO��NPC���W�����a���|���s�Q�[�JActPlayerQueueTable
		--�ɶ��줧��o�Ǫ��a�N�|�}�l�s�@�����@����t
		if #Global_player_queue[ZoneID][QuestID] >= 1 then		--�ܤ֦��@�Ӫ��a��ܭn�ѥ[
			CallPlot( NPC, "FN_Quest_Acting_Main", Global_player_queue[ZoneID][QuestID], NPC, Func, QuestID, BuffID )	--�}�l��t
			Global_player_queue[ZoneID][QuestID] = {}
		else								--�쥻�b��C�������a���S���n�ѥ[
			WriteRoleValue( NPC, EM_RoleValue_Register+1, 0 )	--�ҥH�g��0�A����H�ɳ��i�H�i���t
		end
	else
		WriteRoleValue( NPC, EM_RoleValue_Register+1, 0 )		--��C���S�����ݪ����a�A�g����t�����A�i�H�}�l�U�@����t
	end
end

function FN_Quest_Acting_AskJoin( NPC, QuestID )
	--�}�l�@�Ӹ߰ݵ����Ӹ߰ݪ��a�n���n�ǰe�L�h�ݼ@���A�߰ݵ����s�b40��
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
	local PlayerZoneID = ReadRoleValue( Player, EM_RoleValue_ZoneID )
	if PlayerZoneID == ZoneID then
		--���a�b�PZone�~�߰�
		--�}�Ҹ߰ݵ���
		DialogCreate( Player, EM_LuaDialogType_YesNo, "[SC_QUESTSTRING_19]")
		DialogSelectStr( Player, "[SO_GETVOC_YES]" )
		DialogSelectStr( Player, "[SO_NEWHANDNO]" )
		--���ݪ��a��ܡA�ܦh40��
		local player_choice = LuaS_DialogRePort_TwoChoose_40s(Player)
		--�����ܡA���s�P�_
		if player_choice == "Yes" then
			local x,y,z,Dir = DW_Location( NPC )
			SetPos( Player, x, y, z, Dir )
			--
			table.insert( Global_player_queue[ZoneID][QuestID], Player )
		end
	end
end

function FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )	--�ˬd���b�ݪ�t�����a���A�禡
	for i = #ActPlayerTable, 1, -1 do
		local PlayerID = ActPlayerTable[i]
		if GetDistance( PlayerID, NPC ) > 200 or CheckQuest( PlayerID, QuestID, 0 ) == false then		--�W�L�Z�� / ������ �N�����ݪ�t���
			DebugMSG(0,0,"Not in the show, remove from table")
			CancelBuff( PlayerID, BuffID )
			table.remove( ActPlayerTable, i )
			--�����@��bgm �^�_�쥻��bgm
			StopSound( PlayerID, MusicID[PlayerID] )
			Lua_PlayBGM( PlayerID )
		end
	end
	--��ŦX���󪺪��a�Ǧ^�h
	return ActPlayerTable
end