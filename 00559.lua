----------------------------------------------------------------------------------------------------
Function Z32_Q424999SHOW_00( Ctrl )
	local Players = {}
	local Role = {}
	local ClientBuff = 500595
	local CompletedKey = 542609
	local ClientFlag = 542615
	local Flag = 780868
	local x, y, z, dir = 0
	local Index = {}
	BeginPlot( Ctrl, "Z32_Q424999ShowCheck", 0 )
	Index[ 1 ] = 123555--�ѳR�D�j�˭}
	Index[ 2 ] = 123556--�T����
	Index[ 3 ] = 123557--�v����
	for i = 1, table.getn( Index ), 1 do
		x, y, z, dir=DW_Location( Flag, i )
		Role[ i ]= CreateObj( Index[ i ],  x, y, z, dir, 1 )
		AddToPartition(  Role[ i ] , 0 )
		MoveToFlagEnabled( Role[ i ], false )
	end
	Players = SearchRangePlayer ( Ctrl, 200 )
	for j = 0, table.getn( Players ), 1 do
		if CheckAcceptQuest( Players[ j ], 424999 ) == true then
			ScriptMessage( Ctrl, Players[ j ], 2, "[SC_Q424999SHOW_00]", 0 )--�������s�B�w�f�ڡB�H�η೽�H���դO���N���bĳ�׵�......
		end
	end
	Sleep( 10 ) SetModeEx( Ctrl, EM_SetModeType_Mark, true )
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 3 ], 0 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 25 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_01]" )--��I�o�٥αo�ۨ����Y�l�ӻ��A�o��Ƨڦ��N�Q���F......
	Sleep( 35 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_02]" )--�R��[ZONE_WINDBRINE_CASTLE]�N����O�R��[SC_Z32FALCON]���ǳå몺�H���A
	Sleep( 05 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Sleep( 35 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_03]" )--�Ӥ@��h�H�����H�A�u�൴��a�}�y�b�L�ɪ��j�����W......
	Sleep( 05 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 05 ) AdjustFaceDir( Role[ 3 ], Role[ 1 ], 0 ) 
	Sleep( 25 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_04]" )--�n�F�I�ڥiť�����A�b�ۤ���A�Ѥl�ڥu�Q�ɧֱ����L�̡I
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_LOOP ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_HURT_NORMAL )
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_BUFF_SP03 )
	Sleep( 30 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_05]" )--��ĥ�{�b�u�t�b�Z��������......
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 30 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 05 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_06]" )--�A�T�w�A����ǳƪ����Ĩ������}[ZONE_DGN_SKULL_ROCK]�ܡH
	Sleep( 30 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_07]" )--�]�\�i�H����[ZONE_IRONWING_SENTRY]�ӸոլݡA�j�ڪ��A�N�U�p��ڡH
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 30 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_08]" )--����I�Ѥl�ڲ{�b�N�Ӹ�A�ոաI�ӰڡI
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_BEGIN )
	Sleep( 30 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_09]" )--�K�K�I�T�Ѥj�A�@�n�]���\�A���ӴN�O�b���ڭ̥��_�ӧa�H
	Sleep( 05 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_STAND )
	Sleep( 35 ) NpcSay( Role[ 2 ], "[SC_Q424999SHOW_10]" )--�ڦ��I�t�F�A�]�\�O���}���Ӥ[�F......
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 2 ], 0 ) AdjustFaceDir( Role[ 3 ], Role[ 2 ], 0 )
	Sleep( 30 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_11]" )--�Ʊ��ɭԧA�����Y�Ԥh�O���۪��A�_�h�N���ĥ�බ�Q�}�X[ZONE_DGN_SKULL_ROCK]�]�O�S��......
	Sleep( 05 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 05 ) SetDefIdleMotion( Role[ 3 ], ruFUSION_MIME_IDLE_STAND )
	Sleep( 35 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_12]" )--�O�ڡI�O�ڡI��ɭԳQ[SC_Z32FALCON]�n�W��ĥ�N�V�F�I
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 30 ) NpcSay( Role[ 2 ], "[SC_Q424999SHOW_13]" )--������ԡA��ɭԧڭ̷|������[SC_Z32FALCON]�A�M��A���F����A�̫��㿴��ĥ......
	Sleep( 50 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_14]" )--�n�F�I�T�Ѥj...�A�������]�}�o�Ӥj�F�A�A���D�ڭ̤��L�O�ݰݽ}�F......
	Index[ 4 ] = 123600--�H�䩫�D��p��
	x, y, z, dir=DW_Location( Flag, 4 )
	Role[ 4 ]= CreateObj( Index[ 4 ],  x, y, z, dir, 1 )
	AddToPartition(  Role[ 4 ] , 0 )
	WriteRoleValue( Role[ 4 ] , EM_RoleValue_IsWalk , 1 ) 
	MoveToFlagEnabled( Role[ 4 ], false )
	Sleep( 35 ) 
	Players = SearchRangePlayer ( Ctrl, 200 )
	for k = 0, table.getn( Players ), 1 do
		if CheckBuff( Players[ k ], 500595 ) == true then
			ScriptMessage( Role[ 4 ], Players[ k ], 2, "[SC_Q424999SHOW_15]", 0 )
		end
	end
	Sleep( 30 ) LuaFunc_MoveToFlag( Role[ 4 ], Flag, 5, 0 )
	Players = SearchRangePlayer ( Ctrl, 200 )
	for m = 0, table.getn( Players ), 1 do
		if ( CheckBuff( Players[ m ], 500595 ) == true and KS_CheckBuffLV( Players[ m ], ClientBuff ) >= 3 ) then
			CancelBuff( Players[ m ], ClientBuff )
			SetFlag( Players[ m ], ClientFlag, 1 )
			SetFlag( Players[ m ], CompletedKey, 1 )
		end
	end
	for n = 1, table.getn( Role ), 1 do
		DelObj( Role[ n ] )
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
End
function Z32_Q424999ShowCheck()
	local Ctrl = OwnerID()
	local ClientBuff = 500595
	local RangePlayer = {}
	while true do
		if ReadRoleValue( Ctrl, EM_RoleValue_Register2 ) == 0 then
			return
		end
		RangePlayer = SearchRangePlayer( Ctrl, 200 )
		for i = 0, #RangePlayer, 1 do
			if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) then
				if ( CheckAcceptQuest( RangePlayer[ i ], 424999 ) == true and CheckFlag( RangePlayer[ i ], 542609 ) == false ) then
					AddBuff( RangePlayer[ i ], ClientBuff, 0, 3 )
				end
			end
		end
		Sleep( 20 )
	end
end
----------------------------------------------------------------------------------------------------
Function Z32_Q425056SHOW_00( Ctrl )
	local Players = {}
	local Role = {}
	local CompletedKey = 542610
	local Flag = 780868
	local ClientBuff = 624960
	local SlowBuff = 624177
	local ClientFlag = 542615
	local ChangeScreen = 500429
	local x, y, z, dir = 0
	local Index = {}
	Index[ 1 ] = 123559--�ѳR�D�j�˭}
	Index[ 2 ] = 123560--�T����
	Index[ 3 ] = 123588--�v����
	BeginPlot( Ctrl, "Z32_Q425056ShowCheck", 0 )
	for i = 1, table.getn( Index ), 1 do
		x, y, z, dir = DW_Location( Flag, i )
		Role[ i ] = CreateObj( Index[ i ],  x, y, z, dir, 1 )
		AddToPartition(  Role[ i ] , 0 )
		MoveToFlagEnabled( Role[ i ], false )
		FaceFlag ( Role[ i ], Flag, 5 ) AdjustDir( Role[ i ], 0 )
	end
	Index[ 4 ] = 123589--�H�䩫�D��p��
	x, y, z, dir = DW_Location( Flag, 5 )
	Role[ 4 ] = CreateObj( Index[ 4 ],  x, y, z, dir, 1 )
	AddToPartition(  Role[ 4 ] , 0 )
	MoveToFlagEnabled( Role[ 4 ], false )
	Sleep( 10 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) SetModeEx( Ctrl, EM_SetModeType_Mark, true )
	Sleep( 15 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_01]" )--�o�����X�@�p�e�i�H���w�g�i���F�̫ᶥ�q......
	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 3 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 35 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_02]" )--���L�ѩ�Y�Ǧ]���A���U�ӧڭ̥����N�p�e�y�@�վ�......
	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 2 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_03]" )--�ڷQ�U�����Ӫ��D�کҫ����O����......
	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 1 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 40 ) NpcSay( Role[ 1 ], "[SC_Q425056SHOW_04]" )--�@�I�A�]�`�N�쨺�Ӥ����q���_�X�Ӫ��å�F......
	Sleep( 05 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 10 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_STAND )
	Sleep( 05 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_05]" )--�ڧکҪ�...[SC_Z32FALCON]�̪�ǤJ�F�@�W�s�H�A�U����G���]������F���p���v�T......
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 ) NpcSay( Role[ 2 ], "[SC_Q425056SHOW_06]" )--��I�o�å�T��Ƥ�......
	Sleep( 25 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_07]" )--�ҥH�ڤw�g���b[ZONE_DGN_SKULL_ROCK]��ĵ�٩M���m�譱���F�[�j�A
 	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 2 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) AdjustFaceDir( Role[ 4 ], Role[ 1 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 15 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_08]" )--�{�b[ZONE_DGN_SKULL_ROCK]�u�d�U�@�ӳq�D����i�X......
	Sleep( 30 ) NpcSay( Role[ 3 ], "[SC_Q425056SHOW_09]" )--��I�N���F�@�����Ʀ��ݭn�o��·жܡI
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 25 ) NpcSay( Role[ 3 ], "[SC_Q425056SHOW_10]" )--�Ѥl�ڲ{�b�N�h���F�L�I
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_BEGIN )
	Sleep( 25 ) NpcSay( Role[ 1 ], "[SC_Q425056SHOW_11]" )--�ƶ��a�I�o�å��٤�ۧڭ̦ѥ|�M�Ѥ������......
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 3 ], 0 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Sleep( 35 ) NpcSay( Role[ 2 ], "[SC_Q425056SHOW_12]" )--�A�̡I���D�ܦn���٨S�����a......
	Sleep( 10 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 4 ], 0 )
	Sleep( 05 ) AdjustFaceDir( Role[ 3 ], Role[ 4 ], 0 )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_13]" )--�����I�U�쪺���ӬݨӬ۷����ڡI
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_14]" )--�վ��ʭp���ݭn�U�쪺�N���A�ѤҤ����զۧ@�D......
	Sleep( 05 ) AdjustFaceDir( Role[ 2 ], Role[ 4 ], 0 )
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 10 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 15 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_15]" )--���p�ڭ̥��X�o�A��F[ZONE_DGN_SKULL_ROCK]����ڦA�V�U�컡��......
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_16]" )
	Sleep( 25 ) FaceFlag ( Role[ 4 ], Flag, 4 ) AdjustDir( Role[ 4 ], 0 )
	Sleep( 15 )
	for k = 1, table.getn( Role ), 1 do
		AddBuff( Role[ k ], SlowBuff, 0, -1 )
		SetDefIdleMotion( Role[ k ], ruFUSION_MIME_WALK_FORWARD )
	end
	Sleep( 15 )
	Players = SearchRangePlayer ( Ctrl, 200 )
	for m = 0, table.getn( Players ), 1 do
		if CheckBuff( Players[ m ], ClientBuff ) == true then
			ScriptMessage( Ctrl, Players[ m ], 2, "[SC_Q425056SHOW_00]", 0 )
			AddBuff( Players[ m ], ChangeScreen, 0, -1 )
		end
	end
	Sleep( 25 )
	for n = 1, table.getn( Role ), 1 do
		DelObj( Role[ n ] )
	end
	Sleep( 30 )
	Players = SearchRangePlayer ( Ctrl, 200 )
	for p = 0, table.getn( Players ), 1 do
		if CheckBuff( Players[ p ], ClientBuff ) == true then
			SetFlag( Players[ p ], CompletedKey, 1 )
			SetFlag( Players[ p ], ClientFlag, 0 )
			CancelBuff( Players[ p ], ClientBuff )
			CancelBuff( Players[ p ], ChangeScreen )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register4, 0 )
End
function Z32_Q425056ShowCheck()
	local Ctrl = OwnerID()
	local ClientBuff = 624960
	local RangePlayer = {}
	while true do
		if ReadRoleValue( Ctrl, EM_RoleValue_Register4 ) == 0 then
			return
		end
		RangePlayer = SearchRangePlayer( Ctrl, 200 )
		for i = 0, #RangePlayer, 1 do
			if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) then
				if ( CheckAcceptQuest( RangePlayer[ i ], 425056 ) == true and CheckFlag( RangePlayer[ i ], 542610 ) == false ) then
					AddBuff( RangePlayer[ i ], ClientBuff, 0, 3 )
				end
			end
		end
		Sleep( 20 )
	end
end
----------------------------------------------------------------------------------------------------
function Z33_Q425058NpcOnDead()
	local Ctrl = OwnerID()
	local Player = TargetID()
	if CheckAcceptQuest( Player, 425058 ) == true then
		DW_QietKillOne( Player, 108865 )
	end
	return true
end
----------------------------------------------------------------------------------------------------