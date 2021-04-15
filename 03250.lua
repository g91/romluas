function Z34_NPC124257_Initial()		-- �w�|�̴���
	local npc = OwnerID();

	SetPlot( npc , "touch" , "Z34_NPC124257_Touch" , 15 );
	CallPlot( npc , "SetMark_FlightPoint" );			-- �ǰe�ͻH�ϥ�

	return true;
end

function Z34_NPC124257_Touch()		-- �w�|�̴���
	local player = OwnerID();
	local QuestID = 427390;	-- �e�i�w�|�̴��q

	if CheckAcceptQuest( player , QuestID ) == true or CheckCompleteQuest( player , QuestID ) == true then	-- �P�_�O�_��������
	local String = "[Z34_QUEST427360_02]"		-- �A�n�ϥγo�Ӷǰe���H
	if String == -1 then
		ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	--��ưe�X�����D
		return 0
	end
	if CheckBuff( Player , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( Player , GetString("SO_YES") );
		DialogSelectStr( Player , GetString("SO_NO") );
		AddBuff( Player, 501570, 0 ,-1 );	--�M�ᵹ��BUFF
		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	-- ��ưe�X�����D
			return 0
		end
		-- �q�Ψ��oDIALOG�P�_( ���o������ID�B�s�b����ơB�Z������B�Z������ѦҪ��ؼ� )
		local SelectID = EX_GetDialogResoult( Player, 30 , 75 , TargetID() )
		DialogClose( Player )
		CancelBuff( Player, 501570 );	-- �̫�M��BUFF
		if SelectID == 0  then
			CastSpell( Player , Player , 491008 )
			sleep( 5 )
			ChangeZone( Player , 35, 0, -2240, -30, -860, 275 )	-- �w�|�̴��q
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
	end

	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427360_01]", 0 )		-- �T���G�A�ä���ƨϥγo�Ӷǰe�������I
		ScriptMessage( player, player, 1, "[Z34_QUEST427360_01]", C_Red )
	end
end

function Z34_NPC124401_Initial()		-- �w�|�̴���
	local npc = OwnerID();

	SetPlot( npc , "touch" , "Z34_NPC124401_Touch" , 15 );
	CallPlot( npc , "SetMark_FlightPoint" );			-- �ǰe�ͻH�ϥ�

	return true;
end

function Z34_NPC124401_Touch()		-- �֤߭n���
	local player = OwnerID();

	local String = "[Z34_QUEST427360_02]"		-- �A�n�ϥγo�Ӷǰe���H
	if String == -1 then
		ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	--��ưe�X�����D
		return 0
	end
	if CheckBuff( Player , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( Player , GetString("SO_YES") );
		DialogSelectStr( Player , GetString("SO_NO") );
		AddBuff( Player, 501570, 0 ,-1 );	--�M�ᵹ��BUFF
		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	-- ��ưe�X�����D
			return 0
		end
		-- �q�Ψ��oDIALOG�P�_( ���o������ID�B�s�b����ơB�Z������B�Z������ѦҪ��ؼ� )
		local SelectID = EX_GetDialogResoult( Player, 30 , 75 , TargetID() )
		DialogClose( Player )
		CancelBuff( Player, 501570 );	-- �̫�M��BUFF
		if SelectID == 0  then
			CastSpell( Player , Player , 491008 )
			sleep( 5 )
			ChangeZone( Player , 34, 0, -4044, 530, -2933, 195 )	-- �֤߭n��
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
function Z35_NPC124333and34_ClickBefore()	-- �W�����H���Ԥ��\��
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427467;	-- ��X�p�⪺��]

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		return true;		-- ���L
	end

	return false;			-- �����L

end

function  Z35_NPC124333and34_ClickAfter()		-- �W�����H���Ԥ��\��
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427467;		-- ��X�p�⪺��]
	local Obj1 = 124333		-- �W�����H�\��
	local Obj2 = 124334		-- �Ԥ��\��
	local Item1 = 243446;		-- �X�@�K��
	local Item2 = 243447;		-- ���٤���
	local Flag = 549376;		-- ��X�W�����H�M�Ԥ��ڻP�������l�p�⪺�t��

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		if ReadRoleValue( npc, EM_RoleValue_OrgID ) == Obj1 and CountBodyItem( player, Item1 ) < 1 then
			GiveBodyItem( player, Item1, 1 );
		end
		if ReadRoleValue( npc, EM_RoleValue_OrgID ) == Obj2 and CountBodyItem( player, Item2 ) < 1 then
			GiveBodyItem( player, Item2, 1 );
		end
		if CountBodyItem( player, Item1 ) >= 1 and CountBodyItem( player, Item2 ) >= 1 then
			SetFlag( player , Flag , 1 );
		end
	end
	
	return true;
end