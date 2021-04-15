function Lua_TransToDungeons_Dialog_Begin()--�ǰe��ƥ�
	local Player = OwnerID()
	if ReadRoleValue( Player, EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_USECHECK_BATTLE_0]", 0 )--�԰����L�k�ϥ�
		return
	elseif  ReadRoleValue( Player, EM_RoleValue_ZoneID ) > 100 then
		ScriptMessage( Player , Player , 1 , "[SC_104108_05]", 0 )--�԰����L�k�ϥ�
		return		
	end
	Callplot( Player ,"Lua_TransToDungeons_Dialog", 0 )
end

function Lua_TransToDungeons_Dialog()
	local DailogType = {};
	DailogType[1] = "[SC_DUNGEONS_DIALOG_TYPE_1]";--�̮���j�����C���Űƥ�
	DailogType[2] = "[SC_DUNGEONS_DIALOG_TYPE_2]";--�̮���j���������Űƥ�
	DailogType[3] = "[SC_DUNGEONS_DIALOG_TYPE_3]";--�ĺ����j�����ƥ�
	DailogType[4] = "[SC_DUNGEONS_DIALOG_TYPE_4]";--�����F�溸�j�����ƥ�
	DailogType[5] = "[SC_DUNGEONS_DIALOG_TYPE_5]";--��F�hù���ƥ�
	DailogType[6] = "[SC_DUNGEONS_DIALOG_TYPE_6]";--�J�|�}�Ȥj�����ƥ��]32�ݥ��}�^
	
	local Player = OwnerID()
	if CheckBuff( Player , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
		return
	else	
		AddBuff(Player , 501570,0,-1);--�M�ᵹ��BUFF
	end
	
	DialogCreate( Player , EM_LuaDialogType_Select , "[SC_DUNGEONS_DIALOG_ASK][$SETVAR1="..CountBodyItem(Player,202903).."]" )
	for i = 1, table.getn( DailogType ) do
		DialogSelectStr( Player , DailogType[i] );
	end
	DialogSelectStr( Player , "[SO_EXIT]");--���}

	if DialogSendOpen( Player ) == false then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		CancelBuff( Player, 501570 );--�̫�M��BUFF
		return;
	end
	
	local FX = ReadRoleValue( Player, EM_RoleValue_X );--����y��x
	local FZ = ReadRoleValue( Player, EM_RoleValue_Z );--����y��z
	local PX, PZ;
	local time = 0;
	local SelectType = -1;
	
	DebugMsg(0,0,"Waiting Select")
	while true do
		PX = ReadRoleValue( Player,EM_RoleValue_X )--�ˬd��e�y��
		PZ = ReadRoleValue( Player,EM_RoleValue_Z )--�ˬd��e�y��
			
		if	math.floor(( (FX-PX)^2+(FZ-PZ)^2)^0.5) >= 50	then --�Y�Z���W�L50 �h�j��������			
			break
		end

		if ReadRoleValue( Player, EM_RoleValue_IsAttackMode ) == 1 then
			break
		end
		
		if time >= 30 then  --�p�G���a���I�� time�����X
			break
		end
		time = time + 1;

		local DialogStatus = DialogGetResult( Player )
		DebugMsg(0,0,"DialogStatus = "..DialogStatus )
		if DialogStatus > -2 then
			SelectType = DialogStatus;
			break
		end
		Sleep(10)
	end
	DialogClose( Player )
	CancelBuff( Player, 501570 );--�̫�M��BUFF
	DebugMsg(0,0,"SelectType = "..SelectType)
	if SelectType >= 0 and SelectType < table.getn( DailogType ) then	
		CallPlot( Player, "Lua_TransToDungeons_DialogType", SelectType+1 );
	end
end

function Lua_TransToDungeons_DialogType( SelectType, Page )
	local Player = OwnerID();
	if CheckBuff( Player , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
		return
	else	
		AddBuff(Player , 501570,0,-1);--�M�ᵹ��BUFF
	end
	
	DebugMsg(0,0,"DialogCreate")
	DialogCreate( Player , EM_LuaDialogType_Select , "[SC_DUNGEONS_DIALOG_SELECT]" )--�п�ܧA�Q�ǰe���ƥ��C
	Page = Page or 1;
	local Dungeons = Lua_TransToDungeons_Site( SelectType );
	local Total = 7;
	for i = 1, 7 do
		if  Dungeons[(Page-1)*7+i] ~= nil then
			DialogSelectStr( Player , "[SC_DUNGEONS_DIALOG_"..SelectType.."_"..((Page-1)*7+i ).."][$SETVAR1="..Dungeons[(Page-1)*7+i]["Lv"].."]" );
		else
			Total = i-1;
			break
		end
	end

	local Buttom = 0;
	if Page > 1 then
		DialogSelectStr( Player , "[SC_DANCEFES_SUKI_MAKE05]");--�W�@��
		Buttom = Buttom+1;
	end
	if Dungeons[( Page*7+1 )] ~= nil then
		DialogSelectStr( Player , "[SC_205764_2]");--�U�@��
		Buttom = Buttom+2;
	end
	DialogSelectStr( Player , "[SC_GUILDGIRL_BACK]" );--�^��D���
	DialogSelectStr( Player , "[SO_EXIT]");--���}
	
	if DialogSendOpen( Player ) == false then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		CancelBuff( Player, 501570 );--�̫�M��BUFF
		return;
	end
	
	local Result = -1;
	
	local FX = ReadRoleValue( Player, EM_RoleValue_X );--����y��x
	local FZ = ReadRoleValue( Player, EM_RoleValue_Z );--����y��z
	local PX, PZ;
	local time = 0;
	DebugMsg(0,0,"Waiting Select")
	while true do
		PX = ReadRoleValue( Player,EM_RoleValue_X )--�ˬd��e�y��
		PZ = ReadRoleValue( Player,EM_RoleValue_Z )--�ˬd��e�y��
			
		if	math.floor(( (FX-PX)^2+(FZ-PZ)^2)^0.5) >= 50	then --�Y�Z���W�L50 �h�j��������			
			break
		end

		if ReadRoleValue( Player, EM_RoleValue_IsAttackMode ) == 1 then
			break
		end
		
		if time >= 30 then  --�p�G���a���I�� time�����X
			break
		end
		time = time + 1;

		local DialogStatus = DialogGetResult( Player )
		if DialogStatus > -2 then
			Result = DialogStatus;
			break
		end
		Sleep(10)
	end
	
	DialogClose( Player )
	CancelBuff( Player, 501570 );--�̫�M��BUFF
	
	DebugMsg(0,0,"Result = "..Result.."; Total = "..Total.."; Buttom = "..Buttom)
	if Result >= 0 then
		if Result < Total then
			Result = Result+(Page-1)*7+1;
			local Site = Dungeons[Result];
			local Lv = Site["Lv"];
			local _jobLv = 0;
			local _jobValueIndex = 900;--EM_RoleValue_VOCLV_GM
			for i=0, 10 , 1 do
				_jobLv = ReadRoleValue( Player, _jobValueIndex + i );
				DebugMsg(0,0,"--     _jobValueIndex : ".._jobValueIndex + i.."      Job Lv = ".._jobLv.." :  >= "..Lv.." ?" );
				if _jobLv >= Lv then				
					local ItemID = 202903;
					if CountBodyItem( Player, ItemID ) > 0 then
						DebugMsg(0,0,"ChangeZone");
						if GetUseitemGUID( Player ) == ItemID then
							UseItemDestroy(); 		--�R���ϥΤ������~
						else
							DelBodyItem( Player, ItemID, 1 );
						end
						sleep(5)
						ChangeZone( Player, Site["ZoneID"], 0, Site["X"],Site["Y"], Site["Z"],0 );
						return
					else
						DebugMsg(0,0,"insufficient item" );
						ScriptMessage( Player, Player, 0, "[ITEM_NOT_ENOUGH][$SETVAR1=[<S>"..ItemID.."]]", 0 ); --�S��������XX
						ScriptMessage( Player, Player, 1, "[ITEM_NOT_ENOUGH][$SETVAR1=[<S>"..ItemID.."]]", 0 ); --�S��������XX
						return
					end
				end
			end
			DebugMsg(0,0,"insufficient Lv" );
			ScriptMessage( Player, Player, 0, "[SC_DUNGEONS_DIALOG_LV]", 0 ); --���Ť���
			ScriptMessage( Player, Player, 1, "[SC_DUNGEONS_DIALOG_LV]", 0 );
			return
		elseif Buttom == 0 and Result == Total then
			CallPlot( Player, "Lua_TransToDungeons_Dialog", 0 );--�^��D���
		elseif Buttom == 1 then
			if Result == Total then
				CallPlot( Player, "Lua_TransToDungeons_PreDialog", SelectType, Page-1 );--�W�@��
			elseif Result == Total+1 then
				CallPlot( Player, "Lua_TransToDungeons_Dialog", 0 );--�^��D���
			end
		elseif Buttom == 2 then
			if Result == Total then
				CallPlot( Player, "Lua_TransToDungeons_NextDialog", SelectType, Page+1 );--�U�@��
			elseif Result == Total+1 then
				CallPlot( Player, "Lua_TransToDungeons_Dialog", 0 );--�^��D���
			end
		elseif Buttom ==3 then
			if Result == Total then
				CallPlot( Player, "Lua_TransToDungeons_PreDialog", SelectType, Page-1 );--�W�@��
			elseif Result == Total+1 then
				CallPlot( Player, "Lua_TransToDungeons_NextDialog", SelectType, Page+1 );--�U�@��
			elseif Result == Total+2 then
				CallPlot( Player, "Lua_TransToDungeons_Dialog", 0 );--�^��D���
			end
		end
	end
end

function Lua_TransToDungeons_PreDialog( SelectType, Page )
	Lua_TransToDungeons_DialogType( SelectType, Page )
end

function Lua_TransToDungeons_NextDialog( SelectType, Page )
	Lua_TransToDungeons_DialogType( SelectType, Page )
end

function Lua_TransToDungeons_Check()--�ϥΫe�ˬd
	local Player = OwnerID();
	if ReadRoleValue( Player, EM_RoleValue_SpellMagicID ) ~= 0 then
		return false
	end
	
	if ReadRoleValue( Player, EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 0, "[SC_ZONE190_STKING]", 0 );--�԰�������ϥ�
		ScriptMessage( Player , Player , 1, "[SC_ZONE190_STKING]", 0 );--�԰�������ϥ�
		return false
	end
	
	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );--�����H�}��
		ScriptMessage( Player , Player , 1, "[SC_WINDOW_OPENED]", 0 );
		return false;
	end
	return true;
end

--==========================
--	2011/7/15 FN�s�W
--==========================
function FN_Dung_Tele_NPC()
	SetSpeakDetail(OwnerID(),"[FN_DUNG_TELE_NPC01]")

	if CheckFlag(OwnerID(),540194) == FALSE then
		AddSpeakOption(OwnerID(),TargetID(),"[FN_DUNG_TELE_NPC02]","FN_Dung_Tele_NPC_teach",0)
	end
end

function FN_Dung_Tele_NPC_teach()
	if ReadRoleValue(OwnerID(),EM_RoleValue_RelicsCoin ) >= 200 then
		SetSpeakDetail(OwnerID(),"[FN_DUNG_TELE_NPC04]")
		--
		YOYO_GetTokenValue(2,-200);
		SetFlag(OwnerID(),540194,1);--�Ƿ|�ǰe�N
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_DUNG_TELE_NPC03]", C_SYSTEM  )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[FN_DUNG_TELE_NPC03]", C_SYSTEM  )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(206879).."]".."]", 0  )
		CloseSpeak(OwnerID())
	end
end