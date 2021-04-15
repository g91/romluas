-------------------------------------------------------------------------------------------------------
--�Ϯ��]�M��TP�Φ��`�g�@
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp0Lv1()

	-- 2013.04.08 �ץ����|������@�h�Ʀ]�ƥ��W�h�b�L�H��5����������ɡA�C��P�h�S�Q�}�ҡA�Ϯ��]���ϥΤH�Ʀ����v�~�Ө��¦��Ϯ��]�ֿn�H�ƪ����D�C -- 
	local Library = OwnerID()
	local Zone = ReadRoleValue( Library , EM_RoleValue_ZoneID )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local RoomID = ReadRoleValue( Library , EM_RoleValue_RoomID )
--	if GuildLibraryID == nil then
--		GuildLibraryID = {}
--	end
--	GuildLibraryID[RoomID] = Library	
--	if GuildLibraryID[RoomID] == nil then
--		GuildLibraryID[RoomID] = OwnerID()	--�Υ����ܼưO�U�Ϯ��]��ID
--	end
--	if GuildLibraryID[RoomID] ~= OwnerID() then
--		GuildLibraryID[RoomID] = OwnerID()	--�Υ����ܼưO�U�Ϯ��]��ID
--	end
	DebugMsg( 0 , 0 , "--GuildLibraryForExpTp0Lv1--  "..ZoneID);
	if (ZoneID == 402) or ( ZoneID == 951 ) then
		SetModeEx( Library , EM_SetModeType_Mark , true )	--�аO
		SetModeEx( Library , EM_SetModeType_HideName , true )	--�W��
		SetModeEx( Library , EM_SetModeType_ShowRoleHead , true )	--�Y����
		SetModeEx( Library , EM_SetModeType_Fight , true )	--�i�������
		SetModeEx( Library , EM_SetModeType_Move , false )	--����
		SetModeEx( Library , EM_SetModeType_Obstruct , true )	--����
		SetModeEx( Library , EM_SetModeType_Strikback , false )	--����
		SetModeEx( Library , EM_SetModeType_DisableRotate , true )	--��V
		SetModeEx( Library , EM_SetModeType_Searchenemy , false )	--����
		SetModeEx( Library , EM_SetModeType_NotShowHPMP , true )	--����ܦ��
		AddBuff( Library , 505921 , 89 , -1 )	--90%		--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( Library , 505516 , 99 , -1 )	--100%	--�QNPC�����ˮ`�W�[ �k�N���� 0 = 1%	
		AddBuff( Library , 502707 , 1 , -1 )	--�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( Library  , EM_RoleValue_Register+1 ,  38  )	--�������j���ؿv��---***
		SetCursorType( Library , eCursor_Interact ) --����ܦ� ����
		SetPlot( Library , "touch" , "Yuyu_GuildWarBuliding_1_02" , 125 )	--���|���Ԯ�
		SetPlot( TargetID() , "dead" , "Lua_GUILDWAR_BuildDScript_2" , 0 )	--�Ϯ��]���`�@��
	else
		SetPlot( Library , "touch" , "GuildLibraryForExpTp1" , 125 )
	end
end
-------------------------------------------------------------------------------------------------------
function Guildreminder()	
	ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --�A���O�o�Ӥ��|��������I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
end
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp1End()
	ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_LIBRARY05]", C_SYSTEM ) --�ثe�Ϯ��]���b���L��
	ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_LIBRARY05]", C_SYSTEM ) 
end
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp1( Library )	--Ū�Ѧ^exp�t��-���Ϯ��]begin --�O�o�[���|�ˬd�q
--	DebugMsg( 0 , 0 , "--touch--  ".."TargetID="..TargetID());
	local Player = OwnerID()						-- ���a�T�w�� Player
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
--	local Library = GuildLibraryID[RoomID]	
	Library = ( Library == nil ) and TargetID() or Library;
--	DebugMsg( 0, RoomID ,"Library="..Library )			-- �Ϯ��]
	local LibraryUser = ReadRoleValue( Library , EM_RoleValue_PID  )		--���X�Ϯ��]��PID
	local PlayerGuildID = ReadRoleValue( Player , EM_RoleValue_GuildID )	--���X���a�����|ID
	local BuildingGuildID = ReadRoleValue( Library , EM_RoleValue_GuildID ) 	-- ���X�Ϯ��]�����|ID
--	BuildingGuildID = PlayerGuildID;
--	DebugMsg( 0 , RoomID , "PlayerGUID = "..PlayerGuildID.." , ".."BuildingGuildID = "..BuildingGuildID )
	local Job = ReadRoleValue( Player , EM_RoleValue_VOC )
	
	if PlayerGuildID ~= BuildingGuildID and Job ~= 0 then
		ScriptMessage( Player , Player , 1 , "[GUILD_REMINDER]", C_SYSTEM )
		ScriptMessage( Player , Player , 0 , "[GUILD_REMINDER]", C_SYSTEM )
	else
		if LibraryUser >= 30  then	-- �P���I���H�ƤW���� 30 �H
			ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY05]" , C_SYSTEM )	--�ثe�Ϯ��]���b���L��
			ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY05]" , C_SYSTEM ) 
		--	DebugMsg( 0 , RoomID , "Full = "..LibraryUser )
		elseif  LibraryUser < 30  then
			WriteRoleValue( Library , EM_RoleValue_PID , LibraryUser+1 )	 --��ϥΤH�ưO����PID
			DebugMsg( 0 , RoomID , "Users = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
			local LibraryLv = {}
			if Job ~= 0 then
				LibraryLv = {	[112688] = 1200 , 
						[112689] = 1100 , 
						[112690] = 1000 , 
						[112691] = 900 , 
						[112692] = 800 , 
						[112693] = 700 , 
						[112694] = 600 , 
						[112695] = 500 , 
						[112696] = 400 , 
						[112697] = 300
									}
			else
				LibraryLv = {	[112688] = 20 , 
						[112689] = 20 , 
						[112690] = 20 , 
						[112691] = 20 , 
						[112692] = 20 , 
						[112693] = 20 , 
						[112694] = 20 , 
						[112695] = 20 , 
						[112696] = 20 , 
						[112697] = 20
									}
			end
			local Time = ReadRoleValue( Library , EM_RoleValue_OrgID )
		--	local Casting = { 1200 , 1100 , 1000 , 900 , 800 , 700 , 600 , 500 , 400 , 300 }	-- Casting barŪ���ɶ�
		--	local TempOBJ = { 112688 , 112689 , 112690 , 112691 , 112692 , 112693 , 112694 , 112695 , 112696 , 112697 } --�Ϯ��]����npcID
		--	local Time = 0
		--
		--	for i = 1 , #TempOBJ , 1 do
		--		if ReadRoleValue( Library , EM_RoleValue_OrgID ) == TempOBJ[i] then --�C�@�ŹϮ��]�ɶ����P
		--			Time = Casting[i]	--�]�wTime���۹����ɶ�
		--			break
		--		end
		--	end
			--
			AddBuff( Player , 506163 , 0 ,Time )
			WriteRoleValue( Player ,  EM_RoleValue_Register + 1 , Library );
			if BeginCastBarEvent( Player, Player , "[GUILD_LIBRARY01]" , LibraryLv[Time] , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_NORMAL , 0 , "GuildLibraryForExpTp2" ) ~= 1 then
				LibraryUser = ReadRoleValue( Library , EM_RoleValue_PID )      --���X�Ϯ��]��PID
				WriteRoleValue( Library , EM_RoleValue_PID , LibraryUser-1 ) --�^�g�Ϯ��]��PID��
				CancelBuff( Player, 506163 )	--CastingBar���ѡA���Ū�������A����
			--	DebugMsg( 0 , RoomID , "Non Casting = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp2( Player , CheckStatus )
--	DebugMsg( 0 , 0 , "--touch222222--  ".."OwnerID="..OwnerID().."  ".."TargetID="..TargetID());
--	DebugMsg(0,0,"Player="..Player.."  ".."CheckStatus="..CheckStatus)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
--	local Library = GuildLibraryID[RoomID]	-- �Ϯ��]
--	local Library = TargetID();
	local Library = ReadRoleValue( Player ,  EM_RoleValue_Register + 1 );
--	DebugMsg(0,RoomID,"Library="..Library)
	local LibraryUser = ReadRoleValue( Library , EM_RoleValue_PID )	--���X�Ϯ��]��PID	

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then	-- ���\
			EndCastBar( Player , CheckStatus )
		--	DebugMsg( 0 , RoomID , "Casting Done = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
			local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )	--�t��EXP�A�o�X�ӷ|�O�t��
			local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )	--�t��TP�A�o�X�ӷ|�O�t��
			local ThisLVExp = ReadRoleValue( Player , EM_RoleValue_ThisLVExp )	--�ӵ��ũһ�Exp
			local EXP= math.floor(10+(ThisLVExp/20*0.005))
			local TP= math.floor(EXP*0.1)
			local NEWEXP = DebEXP+EXP	--�N�t�ť[�WExp
			local NEWTP = DebTP+TP
			if DebEXP == 0 then
				ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY02]" , C_SYSTEM )	--�z�ثe�w�g�S�����`�g�@
				ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY02]" , C_SYSTEM )
			--	DebugMsg( 0 , RoomID , "No Debt = "..ReadRoleValue( GuildLibraryID[RoomID] ,   EM_RoleValue_PID ) )
			else
				if (DebEXP*(-1)) < EXP then
					WriteRoleValue( Player , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( Player , EM_RoleValue_DebtTP , 0 )	
					ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY03]" , C_SYSTEM )	--�z�����`�g�@�w�g�M������
					ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY03]" , C_SYSTEM )	--�z�����`�g�@�w�g�M������
				--	DebugMsg( 0 , RoomID , "All Clear = "..ReadRoleValue( GuildLibraryID[RoomID] ,   EM_RoleValue_PID ) )
				else
					WriteRoleValue( Player , EM_RoleValue_DebtExp , NEWEXP )	--�^�g���a���W�t��
					WriteRoleValue( Player , EM_RoleValue_DebtTP , NEWTP )
					ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY04]".. " EXP " .. EXP .. " / " .. "TP " .. TP , C_SYSTEM )	--�g�L�F�@�۪���Ū�A�A�M���F�g��t��
					ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY04]".. " EXP " .. EXP .. " / " .. "TP " .. TP , C_SYSTEM )	--�g�L�F�@�۪���Ū�A�A�M���F�g��t��										
				--	BeginPlot( Player , "GuildLibraryForExpTp1" , 0 )	--���б���
				--	DebugMsg(0,RoomID,"Library="..ReadRoleValue( Player ,  EM_RoleValue_Register + 1 ))
					CallPlot( Player , "GuildLibraryForExpTp1" , Library );
				--	DebugMsg( 0 , RoomID , "Repeat = "..ReadRoleValue( GuildLibraryID[RoomID] ,   EM_RoleValue_PID ) )
				end
			end
		else	-- ����
			CancelBuff( Player , 506163 )
			EndCastBar( Player , CheckStatus )
		--	DebugMsg( 0 , RoomID , "Casting Fail = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
		end
--		DebugMsg(0,RoomID,"Library="..Library)
		WriteRoleValue( Library , EM_RoleValue_PID , LibraryUser-1 )	--�^�g�Ϯ��]��PID��		
	end
end
--
function Hao_Guild_Library_Set_Users(Set)	-- 2013.01.03�s�W �վ�Ϯ��]�ϥΤH��

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	if Set == 9527 then
		DebugMsg( Player , RoomID , "Library Users = "..ReadRoleValue( GuildLibraryID[RoomID] , EM_RoleValue_PID ) )
	else
		WriteRoleValue( GuildLibraryID[RoomID] , EM_RoleValue_PID , Set )	
		DebugMsg( Player , RoomID , "Library Users = "..ReadRoleValue( GuildLibraryID[RoomID] , EM_RoleValue_PID ) )
	end
end