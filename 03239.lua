function LuaQuest_427416()	-- �S�����C
	local player = OwnerID();
	local QuestID = 427416;
	local Item = 208396;

	ClearBorder( player );
	AddBorderPage( player , GetQuestDetail( QuestID , 1 ) );

	ShowBorder( player , QuestID , "["..Item.."]", "ScriptBorder_Texture_Paper" );	

end

function LuaQuest_427420()	-- �M�I���޲�Ĳ��
	local player = OwnerID();
	local QuestID = 427420;
	local Item = 208399;

	ClearBorder( player );
	AddBorderPage( player , GetQuestDetail( QuestID , 1 ) );

	ShowBorder( player , QuestID , "["..Item.."]", "ScriptBorder_Texture_Paper" );	

end

function LuaS_208386_CHECK()		-- �]�k�p�q��
	local player = OwnerID();
	local QuestID = 427399;	-- �Ŷ�����q�ܤ�
	local KeyItem = 549389;	-- ��U�N�ڡD�Z�ۨ��o��q�ܤƼƾ�

	if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
		if CheckFlag( player , KeyItem ) == false then		-- �P�_�O�_�����n���~
			return true;
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427399_01]", 0 )		-- �T���G�A�w�g���o��q�ܤƪ��ƾڡI
			ScriptMessage( player, player, 1, "[Z34_QUEST427399_01]", C_LightGreen )
			return false;
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_02]", 0 )		-- �T���G�]�k�p�q���S����������I
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_02]", C_Red )
		return false;
	end
end

function LuaS_208386_USE()		-- �]�k�p�q��
	local player = OwnerID();
	local pX = ReadRoleValue( player , EM_RoleValue_X );
	local pY = ReadRoleValue( player , EM_RoleValue_Y );
	local pZ = ReadRoleValue( player , EM_RoleValue_Z );

--	local MapID = ?	-- �o�̪����D�n��u�F���[����a�v������Ͻs��
	local MapID = FindMapID( pX , pY , pZ );	-- ����u�ϰ��T�v�̭����u����ϡv�s��
	ScriptMessage( player , player , 0 , "MapID = "..MapID , 0 );

	if CheckMapID( pX , pY , pZ, MapID ) == true then
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_03]", 0 )		-- �T���G�]�k�p�q���}�l�O����q�ܤƪ��ƾڡI
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_03]", C_LightGreen )
		
		BeginCastBarEvent( player, player, "[Z34_QUEST427399_06]", 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208386_USEEnd" )
	
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_02]", 0 )		-- �T���G�]�k�p�q���S����������I
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_02]", C_Red )
	end

	return
end

function LuaS_208386_USEEnd( player, CheckStatus )
	local KeyItem = 549389;	-- ��U�N�ڡD�Z�ۨ��o��q�ܤƼƾ�

	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_04]", 0 )		-- �T���G�]�k�p�q���N��q�ܤƼƾڰO�������I
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_04]", C_LightGreen )
		SetFlag( player, KeyItem, 1 );	-- �������n���~
		return
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_05]", 0 )		-- �T���G�]�k�p�q���ƾڰO�����ѡI
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_05]", C_Red )
	end
end

function LuaS_208400_CHECK()	-- �������l�A��
	local player = OwnerID();
	local QuestID = 427407;	-- �������l���˧�
	local Item = 208400;	-- �������l�A��
	local Item1 = 208401;	-- �������l���Y���˳�
	local Item2 = 208402;	-- �������l���L���˳�
	local Item3 = 208403;	-- �������l���}���˳�
	local Item4 = 208404;	-- �������l���ⳡ�˳�
	local Item5 = 208405;	-- �������l������˳�
	
	if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
		if CountBodyItem( player, Item ) < 5 then
			if CountBodyItem( player, Item1 ) >= 1 and CountBodyItem( player, Item2 ) >= 1 and CountBodyItem( player, Item3 ) >= 1 and CountBodyItem( player, Item4 ) >= 1 and CountBodyItem( player, Item5 ) >= 1 then
				return true;
			else
				ScriptMessage( player, player, 0, "[Z34_QUEST427407_03]", 0 )		-- �T���G�A���ʥF��L���쪺�˳ơI
				ScriptMessage( player, player, 1, "[Z34_QUEST427407_03]", C_Red )
				return false;
			end
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- �T���G�A�w�g���ݭn�o�󪫫~�I
			ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
			return false;		
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- �T���G�A�w�g���ݭn�o�󪫫~�I
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
		return false;
	end
	
end

function LuaS_208400_USE()	-- �������l�A��
	local player = OwnerID();

	BeginCastBarEvent( player, player, "[Z34_QUEST427407_04]", 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208400_USEEnd" )

	return
end

function LuaS_208400_USEEnd( player, CheckStatus )	-- �������l�A��
	local player = OwnerID();
	local Item = 208400;	-- �������l�A��
	local Item1 = 208401;	-- �������l���Y���˳�
	local Item2 = 208402;	-- �������l���L���˳�
	local Item3 = 208403;	-- �������l���}���˳�
	local Item4 = 208404;	-- �������l���ⳡ�˳�
	local Item5 = 208405;	-- �������l������˳�

	
	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_02]", 0 )		-- �T���G�A�N�U����˳ƴ�X�@�M�������l�A�ˡC
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_02]", C_LightGreen )
		DelBodyItem( player, Item1, 1 );
		DelBodyItem( player, Item2, 1 );
		DelBodyItem( player, Item3, 1 );
		DelBodyItem( player, Item4, 1 );
		DelBodyItem( player, Item5, 1 );
		GiveBodyItem( player, Item, 1 );	-- �������l�A��
		return
	else

	end

	return
end

function LuaS_208388_CHECK()		-- �����˸m
	local player = OwnerID();
	local QuestID = 427403;	-- �Q�v�T���O�L�ͪ�
	local Item = 208389;	-- �����쪺�O�L�ͪ�
	local NPCID1 = 109291;	-- ��Ĭ�J�°\
	local NPCID2 = 109292;	-- ��Ĭ�J�Z�j��
	local NPCID3 = 109293;	-- ��Ĭ�J����
	local NPCID4 = 109296;	-- ��Ĭ�J���L��
	
	if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
		if CountBodyItem( player, Item ) < 8 then
			local Target = ReadRoleValue( player , EM_RoleValue_AttackTargetID );
			if Target ~= 0 then
				if ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID1 or ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID2 or ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID3 or ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID4 then
					return true;
				else
					ScriptMessage( player, player, 0, "[Z34_QUEST427403_06]", 0 )		-- �T���G�A��������H���O�O�L�ͪ��I
					ScriptMessage( player, player, 1, "[Z34_QUEST427403_06]", C_Red )
					return false;
				end
			else
				ScriptMessage( player, player, 0, "[Z34_QUEST427403_05]", 0 )		-- �T���G�A�����P�O�L�ͪ��i��԰��~�ஷ���e�I
				ScriptMessage( player, player, 1, "[Z34_QUEST427403_05]", C_Red )
				return false;
			end
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427403_01]", 0 )		-- �T���G�A�w�g������F�������O�L�ͪ��I
			ScriptMessage( player, player, 1, "[Z34_QUEST427403_01]", C_LightGreen )
			return false;		
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- �T���G�A�w�g���ݭn�o�󪫫~�I(�@�Ψ�L���Ȫ��r��)
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
		return false;
	end
end

function LuaS_208388_USE()		-- �����˸m
	local player = OwnerID();
	
	BeginCastBarEvent( player, player, "[Z34_QUEST427403_04]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208388_USEEnd" )
		
	return

end

function LuaS_208388_USEEnd( player, CheckStatus )	-- �����˸m
	local player = OwnerID();
	local Item = 208389;	-- �����쪺�O�L�ͪ�
	
	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427403_02]", 0 )		-- �T���G�A������F�@���O�L�ͪ��C
		ScriptMessage( player, player, 1, "[Z34_QUEST427403_02]", C_LightGreen )
		local Target = ReadRoleValue( player , EM_RoleValue_AttackTargetID );
		CallPlot( Target, "LuaFunc_ResetObj", Target );			-- ��������
		GiveBodyItem( player, Item, 1 );	-- �����쪺�O�L�ͪ�
		return
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427403_03]", 0 )		-- �T���G�����O�L�ͪ����ѡI
		ScriptMessage( player, player, 1, "[Z34_QUEST427403_03]", C_Red )
	end

	return
end

function LuaS_208398_CHECK()		-- �]�k�O���ϥ�
	local player = OwnerID();
	local QuestID = 427418;	-- �yø�]�k�}
	local Item = 208398;	-- �]�k�O���ϥ�
	local Item1 = 243301;	-- �w�O���]�k�}���ϥ�
	local NPCID = 124220;	-- �]�k�}
	
	if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
		if CountBodyItem( player, Item1 ) < 1 then
			local RangeNPCs = SearchRangeNPC( player, 100 )
			for i = 0, #RangeNPCs, 1 do
				if ReadRoleValue( RangeNPCs[i], EM_RoleValue_OrgID ) == NPCID then
					return true;
				end
			end
			ScriptMessage( player, player, 0, "[Z34_QUEST427418_03]", 0 )		-- �T���G����S�������]�k�}�s�b�I
			ScriptMessage( player, player, 1, "[Z34_QUEST427418_03]", C_Red )				
			return false;
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427418_01]", 0 )		-- �T���G�A�w�g�N�]�k�}���}���O���b�]�k�O���ϥ������C
			ScriptMessage( player, player, 1, "[Z34_QUEST427418_01]", C_LightGreen )
			return false;
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- �T���G�A�w�g���ݭn�o�󪫫~�I(�@�Ψ�L���Ȫ��r��)
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
		return false;
	end

end

function LuaS_208398_USE()		-- �]�k�O���ϥ�
	local player = OwnerID();

	BeginCastBarEvent( player, player, "[Z34_QUEST427418_04]", 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208398_USEEnd" )
	
	return

end

function LuaS_208398_USEEnd( player, CheckStatus )	-- �]�k�O���ϥ�
	local player = OwnerID();
	local Item = 208398;	-- �]�k�O���ϥ�
	local Item1 = 243301;	-- �w�O���]�k�}���ϥ�
	
	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427418_02]", 0 )		-- �T���G�A�w�g�N�]�k�}���}���O���U�ӡC
		ScriptMessage( player, player, 1, "[Z34_QUEST427418_02]", C_LightGreen )
		DelBodyItem( player, Item, 1 );
		GiveBodyItem( player, Item1, 1 );	-- �w�O���]�k�}���ϥ�
		return
	else

	end

	return
end

-- �ŮX�D�ը���(�ȨB��a)
function Z34_Npc124187()
	local npc = OwnerID();
	
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 )	-- �ƥ�P�_����
	WriteRoleValue( npc , EM_RoleValue_Register2 , 0 )	-- �ƥ�Ǫ��p�ƲM��
end

function Z34_Npc124187_LockHP()

end

function Z34_Npc124187SK()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID1 = 427393;		-- ĵ�ܩڰ�
	local QuestID2 = 427394;		-- ���@����
	local Item = 243302;			-- ���ɮi�}��

	if CheckAcceptQuest( player , QuestID1 ) == true then
		AddSpeakOption( player , npc , "[Z34_QUEST427393_EVENTOPTION]", "Z34_Quest427393_EventAgain", 0 )	-- �}�l�˳]�]�k�������C
	elseif CheckAcceptQuest( player , QuestID2 ) == true and CountBodyItem( player, Item ) <= 0 then
		AddSpeakOption( player , npc , "[Z34_QUEST427394_01]", "Z34_Npc124187SK_More", 0 )	-- �ЦA���ڤ@�ǵ��ɮi�}���C		
	end

	LoadquestOption( player )

end

function Z34_Npc124187SK_More()
	local player = OwnerID();
	local Item = 243302;	-- ���ɮi�}��

	CloseSpeak( player )
	GiveBodyItem( player , Item , 10 )

end

function Z34_Quest427393_EventAgain()
	local player = OwnerID();
	local npc = TargetID();

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- �P�_�ƥ�O�_�i�椤
		CallPlot( npc, "Z34_Quest427393_EventStart" )		-- �ƥ�}�l
	else
		Z34_Quest427393_EventQuestMessage( player, "RUN" )		-- �T���G�ĤH����թ|�������I���~��O�@�ŮX�D�ը����I
	end

	CloseSpeak( player )

	return

end

function Z34_Quest427393_EventAccept()
	local npc = OwnerID();
	local player = TargetID();
	local QuestBuff = 626305;	-- �԰��ˬd��

	if CheckBuff( player, QuestBuff ) == true then	-- �M���p�ƥ�Buff���s�p��
		CancelBuff( player, QuestBuff )
	end

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- �P�_�ƥ�O�_�i�椤
		CallPlot( npc, "Z34_Quest427393_EventStart" )		-- �ƥ�}�l
	else
		Z34_Quest427393_EventQuestMessage( Player, "RUN" )		-- �T���G�ĤH����թ|�������I���~��O�@�ŮX�D�ը����I
	end

	return

end

function Z34_Quest427393_EventStart()
	local npc = OwnerID()
	local FlagID = 781473;
	local mobID1 = 104848;
	local mobID2 = 104849;
	local mobID3 = 104850;
	local EventCurrentStatus = false
	local CurrentPhase = 0
	local KeyItem = 109314
	local QuestBuff = 626305;	-- �԰��ˬd��(�T)
	local CurrentBuffLv = 0
	local RequireBuffLv = 5
	local RangePlayers = {}
	local SearchRange = 500
	local mob = {}
	local QuestID = 427393;	-- ĵ�ܩڰ�

	WriteRoleValue( npc, EM_RoleValue_Register1, 1 )	-- ����ƥ󭫽ƶi��
	LockHP( npc , ReadRoleValue( npc, EM_RoleValue_MaxHP)*0.25 , "Z34_Npc124187_LockHP" );	-- �C��25%�A���
	PlayMotionEX( npc, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_LOOP ) 	-- �u�@�ʧ@

	SetModeEx( npc, EM_SetModeType_ShowRoleHead, false )	-- �����Y��2���A���}�H
	Sleep( 20 )
	SetModeEx( npc, EM_SetModeType_ShowRoleHead, true )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for k = 0, #RangePlayers, 1 do
		local player = RangePlayers[k]
		if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427393_EventQuestMessage( player, "BEGIN" )			-- �T���G�p�ߨ��d�I�ĤH�Y�N��ŧ�I
			end
		end
	end

	Sleep( 35 )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for m = 0, #RangePlayers, 1 do
		local player = RangePlayers[m]
		if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427393_EventQuestMessage( player, "NOTE_1" )			-- �T���G���h�X�{���ĤH�I
			end
		end
	end

	while true do
		CurrentPhase = CurrentPhase + 1--�ˬd��e���q
		if CurrentPhase >= 7 then
			Sleep( 20 )
		
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for r = 0, #RangePlayers, 1 do
				local player = RangePlayers[r]
				if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
					if player ~= nil and CheckID( player ) == true then
						Z34_Quest427393_EventQuestMessage( player, "END" )		-- �T���G���\�O�@�ŮX�D�ը����I
					end
				end
			end

			WriteRoleValue( npc, EM_RoleValue_Register1, 0 )	-- �ƥ󧹦��A�M�Ũƥ�P�_
			LockHP( npc , -100 , "" );
			PlayMotion( npc, ruFUSION_ACTORSTATE_NORMAL ) 	-- �u�@�ʧ@

			return
		end
	
		mob = Z34_Quest427393_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )	-- ���Ǩ禡

		while true do
			EventCurrentStatus = Z34_Quest427393_EventCheckStatus( mob, QuestID, QuestBuff )
			if EventCurrentStatus == true then
				break;
			end
			Sleep( 20 )		-- �C2���ˬd��ƥ󪺶i��
		end

		if ( CurrentPhase == 2 or CurrentPhase == 4 or CurrentPhase == 6 ) then
			RangePlayers = {}		-- �o�e���P������Ȫ����a��e���q����������
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for i = 0, #RangePlayers, 1 do
				local player = RangePlayers[i]
				if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
					if ( player ~= nil and CheckID( player ) == true ) then
						if CurrentPhase == 2 then
							Z34_Quest427393_EventQuestMessage( player, "NOTE_2" )		-- �T���G�`�N�I�s���ĤH�X�{�F�I
						elseif CurrentPhase == 4 then
							Z34_Quest427393_EventQuestMessage( player, "NOTE_3" )		-- �T���G�[��l�I�����̫�X�{���ĤH�I
						end
					end

					if CheckBuff( player, QuestBuff ) == true then
						CurrentBuffLv = KS_CheckBuffLv( player, QuestBuff )
						if CurrentBuffLv >= RequireBuffLv then
							DW_QietKillOne( player, KeyItem )
							CancelBuff( player, QuestBuff )
						end
					end
				end
			end
		end
		Sleep( 10 )
	end
end

function Z34_Quest427393_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )
	local npc = OwnerID()

	local FlagPosIndex = {}
	local CurrentIndexSum = 0
	while true do
		RandNum = DW_Rand( 10 )		-- �q10�ӺX�з��H����8�ӺX�Шӥͩ�
		CurrentIndexSum = #FlagPosIndex
		if CurrentIndexSum >= 9 then
			break;
		else
			if CurrentIndexSum == 0 then		-- �}�C�̭��S���F��
				FlagPosIndex[ 1 ] = RandNum		-- �i�H�N�Ĥ@�����üƩ�i�h
			else
				for i = 1, CurrentIndexSum, 1 do
					if RandNum == FlagPosIndex[ i ] then	-- ��2���H���쪺�üƤ��e�w�g��L�F
						RandNum = 0	 -- �N�ü��k0	
						break;
					end
				end
				if RandNum ~= 0 then
					CurrentIndexSum = CurrentIndexSum + 1
					table.insert( FlagPosIndex, CurrentIndexSum, RandNum )
				end
			end
		end
	end

	local mobID = {}
	if ( CurrentPhase == 1 or CurrentPhase == 2 ) then		-- 1,2�^�X�u�|�X1����
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID1
	elseif ( CurrentPhase == 3 or CurrentPhase == 4 ) then	-- 3,4�^�X�u�|�X1,2����
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID2
	else													-- 5,6�^�X�u�|�X2,3����
		mobID[ 1 ], mobID[ 2 ] = mobID2, mobID3
	end

	local mobAmount = CurrentPhase + 2		-- �C�^�X�X�Ǽƶq���^�X��+2
	if mobAmount >= 7 then					-- �̦h�X6���ǡA�W�L�h���C
		mobAmount = 6
	end

	local mob = {}
	for j = 1, mobAmount, 1 do
		local x, y, z, dir = DW_Location( FlagID, FlagPosIndex[ j ] )
		RandNum = DW_Rand( 2 )
		mob[ j ] = CreateObj( mobID[ RandNum ], x, y, z, dir, 1 )
		MoveToFlagEnabled( mob[ j ], false )
		AddToPartition( mob[ j ], 0 )
		WriteRoleValue( mob[ j ], EM_RoleValue_Register1, npc )		-- �N����NPC��GUID�g��Ǫ���reg1
		SetPlot( mob[ j ], "dead", "Z34_Quest427393_EventNpcOnDead", 0 )		-- �]�m���`�@��
		AddBuff( mob[ j ], 502862, 0, -1 )			-- �ƥ�Ǫ��аO(�Y�W�|���b�Y)
		AddBuff( mob[ j ], 623132, 0, 3 )			-- ���i����BUFF(3�������N�|����)
	end

	WriteRoleValue( npc, EM_RoleValue_Register2, mobAmount )	-- �N�ثe�Ǽƶq�g�����NPC��reg2

	return mob;

end

function Z34_Quest427393_EventCheckStatus( mob, QuestID, QuestBuff )
	local npc = OwnerID()
	local CurrentmobCounter = 0
	local GetBuffPlayer = 0
	local HateListSum = 0
	local CombatRange = 500
	local SearchRange = 350
	local AttackTarget = nil

	CurrentmobCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )

	if ( CurrentmobCounter == nil or CurrentmobCounter <= 0 ) then
		WriteRoleValue( npc, EM_RoleValue_Register2, 0 )
		return true
	end

	for i = 1, #mob, 1 do
		if CheckDistance( mob[ i ], npc, CombatRange ) == false then
			SetStopAttack( mob[ i ] )
		end
		HateListSum = HateListCount( mob[ i ] )
		if ( HateListSum ~= nil and HateListSum ~= 0 ) then
			for j = 0, HateListSum, 1 do
				GetBuffPlayer = HateListInfo( mob[ i ], j, EM_HateListInfoType_GItemID )
				if ( GetBuffPlayer ~= nil and CheckID( GetBuffPlayer ) == true ) then
					if CheckAcceptQuest( GetBuffPlayer, QuestID ) == true then
						AddBuff( GetBuffPlayer, QuestBuff, 0, -1 )
					end
				end
			end
		end
	end

	return false

end

function Z34_Quest427393_EventNpcOnDead()
	local mob = OwnerID()
	local npc = ReadRoleValue( mob, EM_RoleValue_Register1 )
	local CurrentNpcCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )
	CurrentNpcCounter = CurrentNpcCounter-1
	WriteRoleValue( npc, EM_RoleValue_Register2, CurrentNpcCounter )
	return true;
end

function Z34_Quest427393_EventQuestMessage( player , Step )
	if Step == "RUN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTRUN]", C_Red )		-- �T���G�ĤH����թ|�������I���~��O�@�ŮX�D�ը����I
		ScriptMessage( player, player, 1, "[Z34_QUEST427393_EVENTRUN]", 0 )
	elseif Step == "BEGIN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTBEGIN]", 0 )				-- �T���G�p�ߨ��d�I�ĤH�Y�N��ŧ�I
		ScriptMessage( player, player, 2, "[Z34_QUEST427393_EVENTBEGIN]", C_LightGreen )
	elseif Step == "NOTE_1" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTNOTE1]", 0 )				-- �T���G���h�X�{���ĤH�I
		ScriptMessage( player, player, 2, "[Z34_QUEST427393_EVENTNOTE1]", C_LightGreen )
	elseif Step == "NOTE_2" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTNOTE2]", 0 )				-- �T���G�`�N�I�s���ĤH�X�{�F�I
		ScriptMessage( player, player, 1, "[Z34_QUEST427393_EVENTNOTE2]", C_LightGreen )
	elseif Step == "NOTE_3" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTNOTE3]", 0 )				-- �T���G�[��l�I�����̫�X�{���ĤH�I
		ScriptMessage( player, player, 1, "[Z34_QUEST427393_EVENTNOTE3]", C_LightGreen )
	elseif Step == "END" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTEND]", 0 )					-- �T���G���\�O�@�ŮX�D�ը����I
		ScriptMessage( player, player, 2, "[Z34_QUEST427393_EVENTEND]", C_LightGreen )
	end
end

-- �ŮX�D�ը���(�֤߭n��)
function Z34_Npc124217()

end

function Z34_Npc124217SK()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427406;		-- �֤߭n���]�k����
	local Item = 243303;	-- �������ѻ�

	if CheckAcceptQuest( player , QuestID ) == true and CountBodyItem( player, Item ) <= 0 then
		AddSpeakOption( player , npc , "[Z34_QUEST427406_01]", "Z34_Npc124217SK_More", 0 )	-- �ЦA���ڤ@�Ǩ������ѻ��C
	end

	LoadquestOption( player )

end

function Z34_Npc124217SK_More()
	local player = OwnerID();
	local Item = 243303;	-- �������ѻ�

	CloseSpeak( player )
	GiveBodyItem( player , Item , 10 )

end

-- �ŧB�S�D��Z��
function Z34_Npc124206()
	local npc = OwnerID();
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 )	-- �ƥ�P�_����
	WriteRoleValue( npc , EM_RoleValue_Register2 , 0 )	-- �ƥ�Ǫ��p�ƲM��
end

function Z34_Npc124206SK()
	local player = OwnerID();
	local QuestID = 427408;	-- �n�먾�u

	if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
		AddSpeakOption( player , player , "[Z34_QUEST427408_EVENTOPTION]", "Z34_Quest427408_EventAgain", 0 )	-- �ﶵ�G��U���h��ŧ���������l�C
	end

	LoadquestOption( player )

end

function Z34_Quest427408_EventAgain()
	local player = OwnerID();
	local npc = TargetID();

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- �P�_�ƥ�O�_�i�椤
		CallPlot( npc, "Z34_Quest427408_EventStart" )		-- �ƥ�}�l
	else
		Z34_Quest427408_EventQuestMessage( player, "RUN" )		-- �T���G�������l����թ|�������I�л����U���u�I
	end

	CloseSpeak( player )

	return

end

function Z34_Quest427408_EventAccept()
	local npc = OwnerID();
	local player = TargetID();
	local QuestBuff = 626302;	-- �԰��ˬd��

	if CheckBuff( player, QuestBuff ) == true then	-- �M���p�ƥ�Buff���s�p��
		CancelBuff( player, QuestBuff )
	end

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- �P�_�ƥ�O�_�i�椤
		CallPlot( npc, "Z34_Quest427408_EventStart" )		-- �ƥ�}�l
	else
		Z34_Quest427408_EventQuestMessage( Player, "RUN" )		-- �T���G�������l����թ|�������I�л����U���u�I
	end

	return

end

function Z34_Quest427408_EventStart()
	local npc = OwnerID()
	local FlagID = 781472;
	local mobID1 = 109287;
	local mobID2 = 109288;
	local mobID3 = 109289;
	local EventCurrentStatus = false
	local CurrentPhase = 0
	local KeyItem = 109311
	local QuestBuff = 626302;	-- �԰��ˬd��(�������l)
	local CurrentBuffLv = 0
	local RequireBuffLv = 5
	local RangePlayers = {}
	local SearchRange = 500
	local mob = {}
	local QuestID = 427408;	-- �n�먾�u

	WriteRoleValue( npc, EM_RoleValue_Register1, 1 )	-- ����ƥ󭫽ƶi��

	SetModeEx( npc, EM_SetModeType_ShowRoleHead, false )	-- �����Y��2���A���}�H
	Sleep( 20 )
	SetModeEx( npc, EM_SetModeType_ShowRoleHead, true )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for k = 0, #RangePlayers, 1 do
		local player = RangePlayers[k]
		if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427408_EventQuestMessage( player, "BEGIN" )			-- �T���G���n�ǳơI�������l�Y�N��ŧ�I
			end
		end
	end

	Sleep( 35 )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for m = 0, #RangePlayers, 1 do
		local player = RangePlayers[m]
		if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427408_EventQuestMessage( player, "NOTE_1" )			-- �T���G���h�C�@�i�X�{���������l�I
			end
		end
	end

	while true do
		CurrentPhase = CurrentPhase + 1--�ˬd��e���q
		if CurrentPhase >= 7 then
			Sleep( 20 )
		
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for r = 0, #RangePlayers, 1 do
				local player = RangePlayers[r]
				if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
					if player ~= nil and CheckID( player ) == true then
						Z34_Quest427408_EventQuestMessage( player, "END" )		-- �T���G���\�����֤߭n�몺���u�I
					end
				end
			end

			WriteRoleValue( npc, EM_RoleValue_Register1, 0 )	-- �ƥ󧹦��A�M�Ũƥ�P�_
			return
		end
	
		mob = Z34_Quest427408_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )	-- ���Ǩ禡

		while true do
			EventCurrentStatus = Z34_Quest427408_EventCheckStatus( mob, QuestID, QuestBuff )
			if EventCurrentStatus == true then
				break;
			end
			Sleep( 20 )		-- �C2���ˬd��ƥ󪺶i��
		end

		if ( CurrentPhase == 2 or CurrentPhase == 4 or CurrentPhase == 6 ) then
			RangePlayers = {}		-- �o�e���P������Ȫ����a��e���q����������
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for i = 0, #RangePlayers, 1 do
				local player = RangePlayers[i]
				if CheckAcceptQuest( player , QuestID ) == true then	-- �P�_�O�_��������
					if ( player ~= nil and CheckID( player ) == true ) then
						if CurrentPhase == 2 then
							Z34_Quest427408_EventQuestMessage( player, "NOTE_2" )		-- �T���G�`�N�I�ĤG�i��եX�{�F�I
						elseif CurrentPhase == 4 then
							Z34_Quest427408_EventQuestMessage( player, "NOTE_3" )		-- �T���G�[��l�I�פU�̫�@�i����աI
						end
					end

					if CheckBuff( player, QuestBuff ) == true then
						CurrentBuffLv = KS_CheckBuffLv( player, QuestBuff )
						if CurrentBuffLv >= RequireBuffLv then
							DW_QietKillOne( player, KeyItem )
							CancelBuff( player, QuestBuff )
						end
					end
				end
			end
		end
		Sleep( 10 )
	end
end

function Z34_Quest427408_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )
	local npc = OwnerID()

	local FlagPosIndex = {}
	local CurrentIndexSum = 0
	while true do
		RandNum = DW_Rand( 10 )		-- �q10�ӺX�з��H����8�ӺX�Шӥͩ�
		CurrentIndexSum = #FlagPosIndex
		if CurrentIndexSum >= 9 then
			break;
		else
			if CurrentIndexSum == 0 then		-- �}�C�̭��S���F��
				FlagPosIndex[ 1 ] = RandNum		-- �i�H�N�Ĥ@�����üƩ�i�h
			else
				for i = 1, CurrentIndexSum, 1 do
					if RandNum == FlagPosIndex[ i ] then	-- ��2���H���쪺�üƤ��e�w�g��L�F
						RandNum = 0	 -- �N�ü��k0	
						break;
					end
				end
				if RandNum ~= 0 then
					CurrentIndexSum = CurrentIndexSum + 1
					table.insert( FlagPosIndex, CurrentIndexSum, RandNum )
				end
			end
		end
	end

	local mobID = {}
	if ( CurrentPhase == 1 or CurrentPhase == 2 ) then		-- 1,2�^�X�u�|�X1����
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID1
	elseif ( CurrentPhase == 3 or CurrentPhase == 4 ) then	-- 3,4�^�X�u�|�X1,2����
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID2
	else													-- 5,6�^�X�u�|�X2,3����
		mobID[ 1 ], mobID[ 2 ] = mobID2, mobID3
	end

	local mobAmount = CurrentPhase + 2		-- �C�^�X�X�Ǽƶq���^�X��+2
	if mobAmount >= 7 then					-- �̦h�X6���ǡA�W�L�h���C
		mobAmount = 6
	end

	local mob = {}
	for j = 1, mobAmount, 1 do
		local x, y, z, dir = DW_Location( FlagID, FlagPosIndex[ j ] )
		RandNum = DW_Rand( 2 )
		mob[ j ] = CreateObj( mobID[ RandNum ], x, y, z, dir, 1 )
		MoveToFlagEnabled( mob[ j ], false )
		AddToPartition( mob[ j ], 0 )
		WriteRoleValue( mob[ j ], EM_RoleValue_Register1, npc )		-- �N����NPC��GUID�g��Ǫ���reg1
		SetPlot( mob[ j ], "dead", "Z34_Quest427408_EventNpcOnDead", 0 )		-- �]�m���`�@��
		AddBuff( mob[ j ], 502862, 0, -1 )			-- �ƥ�Ǫ��аO(�Y�W�|���b�Y)
		AddBuff( mob[ j ], 623132, 0, 3 )			-- ���i����BUFF(3�������N�|����)
	end

	WriteRoleValue( npc, EM_RoleValue_Register2, mobAmount )	-- �N�ثe�Ǽƶq�g�����NPC��reg2

	return mob;

end

function Z34_Quest427408_EventCheckStatus( mob, QuestID, QuestBuff )
	local npc = OwnerID()
	local CurrentmobCounter = 0
	local GetBuffPlayer = 0
	local HateListSum = 0
	local CombatRange = 500
	local SearchRange = 350
	local AttackTarget = nil

	CurrentmobCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )

	if ( CurrentmobCounter == nil or CurrentmobCounter <= 0 ) then
		WriteRoleValue( npc, EM_RoleValue_Register2, 0 )
		return true
	end

	for i = 1, #mob, 1 do
		if CheckDistance( mob[ i ], npc, CombatRange ) == false then
			SetStopAttack( mob[ i ] )
		end
		HateListSum = HateListCount( mob[ i ] )
		if ( HateListSum ~= nil and HateListSum ~= 0 ) then
			for j = 0, HateListSum, 1 do
				GetBuffPlayer = HateListInfo( mob[ i ], j, EM_HateListInfoType_GItemID )
				if ( GetBuffPlayer ~= nil and CheckID( GetBuffPlayer ) == true ) then
					if CheckAcceptQuest( GetBuffPlayer, QuestID ) == true then
						AddBuff( GetBuffPlayer, QuestBuff, 0, -1 )
					end
				end
			end
		end
	end

	return false

end

function Z34_Quest427408_EventNpcOnDead()
	local mob = OwnerID()
	local npc = ReadRoleValue( mob, EM_RoleValue_Register1 )
	local CurrentNpcCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )
	CurrentNpcCounter = CurrentNpcCounter-1
	WriteRoleValue( npc, EM_RoleValue_Register2, CurrentNpcCounter )
	return true;
end

function Z34_Quest427408_EventQuestMessage( player , Step )
	if Step == "RUN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTRUN]", C_Red )		-- �T���G�������l����թ|�������I�л����U���u�I
		ScriptMessage( player, player, 1, "[Z34_QUEST427408_EVENTRUN]", 0 )
	elseif Step == "BEGIN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTBEGIN]", 0 )				-- �T���G���n�ǳơI�������l�Y�N��ŧ�I
		ScriptMessage( player, player, 2, "[Z34_QUEST427408_EVENTBEGIN]", C_LightGreen )
	elseif Step == "NOTE_1" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTNOTE1]", 0 )				-- �T���G���h�C�@�i�X�{���������l�I
		ScriptMessage( player, player, 2, "[Z34_QUEST427408_EVENTNOTE1]", C_LightGreen )
	elseif Step == "NOTE_2" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTNOTE2]", 0 )				-- �T���G�`�N�I�ĤG�i��եX�{�F�I
		ScriptMessage( player, player, 1, "[Z34_QUEST427408_EVENTNOTE2]", C_LightGreen )
	elseif Step == "NOTE_3" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTNOTE3]", 0 )				-- �T���G�[��l�I�פU�̫�@�i����աI
		ScriptMessage( player, player, 1, "[Z34_QUEST427408_EVENTNOTE3]", C_LightGreen )
	elseif Step == "END" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTEND]", 0 )					-- �T���G���\�����֤߭n�몺���u�I
		ScriptMessage( player, player, 2, "[Z34_QUEST427408_EVENTEND]", C_LightGreen )
	end
end

function Z34_NPC124221_ClickBefore()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427394;	-- ���@����
	local Item = 243302;	-- ���ɮi�}��

	if CheckAcceptQuest( player , QuestID ) == true and CountBodyItem( player, Item ) >= 1 then	-- ��������
		return true;		-- ���L
	end

	return false;			-- �����L

end

function Z34_NPC124221_ClickAfter()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427394;	-- ���@����
	local Item = 243302;	-- ���ɮi�}��
	local mob = 109312;		-- �˳]���ɮi�}��

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		DW_QietKillOne( player , mob )		--�R�R�������ǡA�e�̱�����̡A0�N�����a
		DelBodyItem( player , Item , 1 )
	end
	
	return true;
end

function Z34_NPC124222_ClickBefore()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427406;	-- �֤߭n���]�k����
	local Item = 243303;	-- �������ѻ�

	if CheckAcceptQuest( player , QuestID ) == true and CountBodyItem( player, Item ) >= 1 then	-- ��������
		return true;		-- ���L
	end

	return false;			-- �����L

end

function Z34_NPC124222_ClickAfter()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427406;	-- �֤߭n���]�k����
	local Item = 243303;	-- �������ѻ�
	local mob = 109313;		-- �˳]�������ѻ�

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		DW_QietKillOne( player , mob )		--�R�R�������ǡA�e�̱�����̡A0�N�����a
		DelBodyItem( player , Item , 1 )
	end
	
	return true;
end