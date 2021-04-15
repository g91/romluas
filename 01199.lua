function LuaI_Mulgrum_Relic_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_Mulgrum_Relic_Enter" , 0 )
end
function LuaS_Mulgrum_Relic_Enter()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID(),EM_LuaDialogType_YesNo,"[SC_ZONE114_0]"); --�аݬO�_�n�i�J50�Ū��ƥ��H
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		local Ans = LuaS_DialogRePort_TwoChoose(OwnerID())
		if	Ans == "Etc"	then
			return
		end

		if	Ans == "Yes"	then
			if CheckFlag( OwnerID() , 542397 ) == false then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX01]" , C_SYSTEM )	-- �̭��ǨӨH�������ݺV���n�A�����z�|�ۤ@�ئM�I����...
				Sleep( 10 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX02]" , C_DEFAULT )	-- �Aı�o�A�٨S�ǳƦn�i�H��i�o�Ӱϰ�I
			else
				if ChangeZone( OwnerID() , 114 , -1 , 4296.5 , 229 , 2549 , 0 ) then
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
					DesignLog( OwnerID() , 114 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	-- �B���G�H������
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end
		end
		
		if	Ans == "No"	then
			if CheckFlag( OwnerID() , 542397 ) == false then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX01]" , C_SYSTEM )	-- �̭��ǨӨH�������ݺV���n�A�����z�|�ۤ@�ئM�I����...
				Sleep( 10 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX02]" , C_DEFAULT )	-- �Aı�o�A�٨S�ǳƦn�i�H��i�o�Ӱϰ�I
			else
				if ChangeZone( OwnerID() , 113 , -1 , 4296.5 , 229 , 2549 , 0 ) then
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
					DesignLog( OwnerID() , 113 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	-- �B���G�H������
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaI_Mulgrum_Relic_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_Mulgrum_Relic_Out" , 0 )
end
function LuaS_Mulgrum_Relic_Out()
	if ChangeZone( OwnerID() , 11 , 0 , -20351 , 1036 , -21154 , 215 ) then

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_Treasure_Trove_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_Treasure_Trove_Enter" , 0 )
end
function LuaS_Treasure_Trove_Enter()
	if CheckCompleteQuest( OwnerID() , 421829 ) == false then	-- �ѧ��º��D�u����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX03]" , C_SYSTEM )	-- �̭��ǨӤ@�Ѹ޲�����^�A�����z�|�ۤ@�ئM�I����...
		Sleep( 10 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX04]" , C_DEFAULT )	-- �Aı�o���@�Ѳ��W���O�q����A����e�i�I
	else
		if ChangeZone( OwnerID() , 108 , -1 , 3155 , 711 , 664 , 0 ) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
			DesignLog( OwnerID() , 108 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	-- �B���G�H������
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	end
end

function LuaI_Treasure_Trove_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_Treasure_Trove_Out" , 0 )
end
function LuaS_Treasure_Trove_Out()
	if ChangeZone( OwnerID() , 3 , 0 , 11644, 23 , 2243 , 350 ) then

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end