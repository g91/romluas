function Hao_BuffTools()
	
	local Owner = OwnerID();
	local Target = TargetID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	CallPlot( Owner, "Hao_BuffToolsRunning", Owner, Target, Room );
end

function Hao_BuffToolsRunning( Owner, Target, Room )

	if CheckBuff( Owner, 501570 ) then
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );	--�����w�g���}�F
		return 0;
	end
	AddBuff( Owner, 501570, 0, -1 );

	local String = "Target : "..GetName( Target ).."\n".."\n";
	String = String.."[SC_BUFFTOOLS_INSTRUCTION]";	-- ����r�鬰 Buff�A����r�鬰 Debuff�A�զ�r�鬰�ӫ�Buff�C

	DialogCreate( Owner, EM_LuaDialogType_Select , String );	-- �ؼ���w�G
	
	local Menu = {};
	Menu[0]="[SC_BUFFTOOLS_SHOW_ALL]";	-- �C�X�ؼШ��W�Ҧ��� Buff �P Debuff
	Menu[1]="[SC_BUFFTOOLS_GET]";	-- �����ؼШ��W���w�� Buff �� Debuff
	Menu[2]="[SC_BUFFTOOLS_DELETE]";	-- �R���ؼШ��W�����w Buff �� Debuff
	Menu[3]="[SO_EXIT]";	-- ���}���
	
	for i = 0, #Menu do
 		DialogSelectStr( Owner, Menu[i] );
	end

	if not DialogSendOpen( Owner ) then	-- ���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Owner, Owner, 1, "[SYS_FIXEQ_DATA_ERROR]", 0 );
		return;
	end

	local Time = 0;
	local Select;

	while true do
		Sleep(1);
		Time = Time+1;
		Select = DialogGetResult( Owner );  --�ˬd�ϥΪ̿��������
	--	DebugMsg( Owner, Room, "Time = "..Time..", Select = "..Select );

	 	if Time > 600 then  -- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Owner, Owner, 0, "Idle for more than 60 sec, window will close automatically.", 0 );	-- ���m�W�L60��A�۰����������C
			break;
		end
	
		if Select == -1 or Select == 3 then	-- ���_�B���}���
			break;
		elseif Select == 0 then	-- �d��
			CancelBuff_NoEvent( Owner, 501570 );	-- �קK�C�X������ Buff
			local BuffList = Hao_BuffTools_ShowAll( Owner, Target, Room );	-- ���C�X�ؼШ��W�� Buff �P Debuff�C
			if #BuffList == 0 then
				ScriptMessage( Owner, Owner, 0, "No search results.", 0 );	-- �d�L���G
			end
			break;
		elseif Select ~= -2 then	-- - 2 ���w�]�ȡA���B�z�A�����P�R�����@�� function
			CallPlot( Owner, "Hao_BuffTools_Settings" , Owner, Target, Room, Select  );
			break;
		end
	end
	CancelBuff_NoEvent( Owner, 501570 );
	DialogClose( Owner );
end

function Hao_BuffTools_Settings( Owner, Target, Room, Select )	-- �]�w�ˬd�B�����B�R��

	local BuffList = Hao_BuffTools_ShowAll( Owner, Target, Room );	-- ���C�X�ؼШ��W�� Buff �P Debuff�C

	if CheckBuff( Owner, 501570 ) then
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );	-- �����w�g���}�F
		return 0;
	end

	AddBuff( Owner, 501570, 0, -1 );
	local String = "Target : "..GetName(Target);
--	ScriptMessage( Owner, Owner, 0, "[SC_107213_WORLDBOSS_0]"..GetName(Target), 0 );

	if Select == 1 then	-- ���� Buff
		String = String.."\n".."\n".."[SC_BUFFTOOLS_GET_MENU]";
		DialogCreate( Owner, EM_LuaDialogType_Input, String );	-- �п�J���wID
	--	DialogCreate( Owner, EM_LuaDialogType_Input, "[SC_BUFFTOOLS_GET_MENU]" );	-- �п�J���wID
	else	-- �R�� Buff
		String = String.."\n".."\n".."[SC_BUFFTOOLS_DELETE_MENU]";
		DialogCreate( Owner, EM_LuaDialogType_Input, String );	-- �п�J���w ID�A�R���Ҧ� Buff(Debuff) �ɽп�J - 1�A�R���D�ӫ������Ҧ� Buff(Debuff) �ɽп�J -2
	--	DialogCreate( Owner, EM_LuaDialogType_Input, "[SC_BUFFTOOLS_DELETE_MENU]" );	-- �п�J���w ID�A�R���Ҧ� Buff(Debuff) �ɽп�J - 1�A�R���D�ӫ������Ҧ� Buff(Debuff) �ɽп�J -2
	end
	DialogSelectStr( Owner, "[SO_YES]" );	-- �T�w
	DialogSelectStr( Owner, "[SC_CANCEL]" );	-- ����

	local Time = 0;
	local DialogStatus;

	if not DialogSendOpen( Owner ) then	-- ���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage( Owner, Owner, 1, "[SYS_FIXEQ_DATA_ERROR]", 0 );	-- ��Ʀ����D
		return;
	end

	while true do
		Sleep(1);
		Time = Time+1;
		DialogStatus = DialogGetResult( Owner );	-- �ˬd�ϥΪ̿��������

	 	if Time > 600 then	-- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Owner, Owner, 0, "Idle for more than 60s, window will close automatically.", 0 );	-- ���m�W�L60��A�۰����������C
			break;
		end

	--	if DialogStatus == -2 then	-- �w�]�ȡA���B�z
	--	end

		if DialogStatus == -1 or DialogStatus == 1 then	-- ���_�B���U������
			break;
		end

		if DialogStatus == 0 then	-- ���U�T�w��
			local BuffID = tonumber( DialogGetInputResult( Owner ));	-- ���o�ϥΪ̿�J�r��
		--	DebugMsg( Owner, Room, "String = "..tostring(InputString) );
			if BuffID ~= nil then
				if ( BuffID >= 500000 and BuffID <= 509999 ) or ( BuffID >= 620001 and BuffID <= 629999 ) then	-- ���J�r�ꬰ���ļƦr��
					local WordColor = "0xcFFFFFFFF";	-- �զ�A�ӫ� Buff �H���C����
					if not DW_CheckGameInfoBitColumn( BuffID, "settingflagex", 1 ) then	-- �D�ӫ�Buff - �S�Ŀ�򥻪k�N�����X�� - �u�ӫ� Buff�v
						if DW_CheckGameInfoBitColumn( BuffID, "settingflag", 0 ) then	-- ���Ŀ�򥻪k�N�����X�� - �u�n���k�N�v
							WordColor = "0xcFFFF0000"	-- ����ABuff �H���C����
						else
							WordColor = "0xcFFB22222"	-- ����ADebuff �H���C����
						end
					end
					if Select == 1 then	-- ���� Buff
						AddBuff( Target, BuffID, 0, -1 );
						ScriptMessage( Owner, Owner, 0, "Get "..BuffID.." ".."["..BuffID.."]", WordColor );	-- ��o ���w�W�٪� Buff
					else	-- �R�� Buff
						CancelBuff_NoEvent( Target, BuffID );
						ScriptMessage( Owner, Owner, 0, "Delete "..BuffID.." ".."["..BuffID.."]", WordColor );	-- ��o ���w�W�٪� Buff
					end
				elseif Select == 2 and BuffID == - 1 then	-- �R���Ҧ��D�ӫ����� Buff(Debuff)
					for i = 1, #BuffList do
						if not BuffList[i].itemshop then
							CancelBuff_NoEvent( Target, BuffList[i].id );
						end
					end
					ScriptMessage( Owner, Owner, 0, "[SC_BUFFTOOLS_DELETE_BESIDES_ITEM_SHOP]", 0 );
				elseif Select == 2 and BuffID == - 2 then	-- �R���Ҧ� Buff(Debuff)
					for i = 1, #BuffList do
						CancelBuff_NoEvent( Target, BuffList[i].id );
					end
					ScriptMessage( Owner, Owner, 0, "[SC_BUFFTOOLS_DELETE_ALL]", 0 );
				else
					ScriptMessage( Owner, Owner, 0, "Invalid string.", 0 );	-- �L�Ħr��
				end
				break;
			else
				ScriptMessage( Owner, Owner, 0, "Invalid string.", 0 );	-- �L�Ħr��
				break;
			end
		end
	end
	CancelBuff_NoEvent( Owner, 501570 );
	DialogClose( Owner );
end

function Hao_BuffTools_ShowAll( Owner, Target, Room )

	local Owner = Owner or OwnerID();	-- �H�ؼ��Y���ث��V����H���ˬd��H
	local Target = Target or TargetID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local CountBuff = BuffCount( Target );
	local BuffList = {};

--	DebugMsg( Owner, Room, "Your target is "..GetName(Target)..", Total Buffs&Debuffs : "..CountBuff );
	if Target ~= Owner then
	--	Tell( Owner, Target, "[SC_422833_12]" );
	end
--	ScriptMessage( Owner, Owner, 0, "Target : "..GetName(Target), 0 );

	for Pos = 0 , CountBuff-1 , 1 do
		local Buff = {};
		local BuffID = BuffInfo( Target, Pos, EM_BuffInfoType_BuffID );
		local Flag = GameObjInfo_Int( BuffID, "settingflag" );	-- ���o��Ʈw���� �]�w�X�� �]�w
		local FlagEx = GameObjInfo_int( BuffID, "settingflagex" );	-- ���o��Ʈw���� settingflagex �]�w
		local WordColor = "0xcFFFFFFFF";	-- �զ�A�ӫ� Buff �H���C����

		Buff.id = BuffID;	-- �O�� Buff ID
		Buff.itemshop = true;	-- �O�� Buff �O�_���ӫ�����

		if not DW_CheckGameInfoBitColumn( BuffID, "settingflagex", 1 ) then	-- �D�ӫ�Buff - �S�Ŀ�򥻪k�N�����X�� - �u�ӫ� Buff�v
			if DW_CheckGameInfoBitColumn( BuffID, "settingflag", 0 ) then	-- ���Ŀ�򥻪k�N�����X�� - �u�n���k�N�v
				WordColor = "0xcFFFF0000"	-- ����ABuff �H���C����
			else
				WordColor = "0xcFFB22222"	-- ����ADebuff �H���C����
			end
			Buff.itemshop = false;
		end
		table.insert( BuffList, Buff );
		ScriptMessage( Owner, Owner, 0, String.format("%02d",Pos+1)..". "..BuffID.." ".."["..BuffID.."]" , WordColor );
	end
	return BuffList;
end