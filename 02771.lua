--�i��m����@��(�G����)
function Lua_na_wdposition()
	local Owner = OwnerID()
	AddBuff( Owner , 623743 , 0 , -1 )
end


----------------------------------------------------------
--���B�J�| / �I�߶� / ���ƶ� 
----------------------------------------------------------
function Lua_na_wedding_cake0(Option , TicketID , ObjID)  --�@��function
	local Owner = OwnerID()
	local Target = TargetID()
	local TOrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Roomid = ReadRoleValue(Owner, EM_LuaValueFlag_UseItem43 )

	if ( Option == "CHECK" ) then --�ˬd�ؼ�
		if TOrgID == 121476 then --�p�G�ؼЬO�m�����\��
			return true
		else
			ScriptMessage( Owner , Owner , 2, "[SC_WEDDING_MEG0]" , 0 )
			return false
		end

	elseif ( Option == "USE" ) then --�ϥε��G
		if WeddingObjlist == nil then
			WeddingObjlist = {}  -- �إߪŪ��\�񪫥�M��
		end

		if WeddingObjlist[Roomid] == nil then
			WeddingObjlist[Roomid] = {}  -- �إ�Table
		end

	--	DelBodyItem( Owner, TicketID, 1 )
		ChangeObjID( Target , ObjID)
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, false )--�����Y����
		table.insert(WeddingObjlist[roomid] , Target )
	end		
end

function Lua_na_wedding_cake() --�J�|����l�@��
	local Owner = OwnerID() --�J�|����
	local CakeOrgid = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	local CakeType = { 	121494, 121495, 121496, --���B�J�| 
				121503, 121504, 121505, --�I�߶� 
				121506, 121507, 121508	} --���ƶ�
	for i = 1 , #CakeType do
		if CakeOrgid == CakeType[i] then
			WriteRoleValue( Owner , EM_RoleValue_PID , 20 )
			break
		end
	end
	SetPlot( Owner , "touch" , "Lua_na_wdcake1_touch" , 30 ) --�]�wĲ�I�@��
end

function Lua_na_wdcake1_touch() --Ĳ�I�@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --����
	local TPid = ReadRoleValue( Target , EM_RoleValue_PID )
	local CakeOrgid = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local CakeGift = {	[121494] = {202895 , 1} ; --�m�ä��R�B§�J�|
				[121495] = {202896 , 1} ; --�����R�ʱB§�J�|
				[121496] = {202897 , 1} ; --���J���߱B§�J�|
				[121503] = {241960 , 1} ; --�}�ɲ����I�߶�
				[121504] = {241961 , 1} ; --�ߤ߬ۦL��X�I�߶�
				[121505] = {241959 , 1} ; --������G�I�߶�
				[121506] = {241962 , 1} ; --�Ӯa�A�����ƶ�
				[121507] = {241963 , 1} ; --�õ��Ȥ߶��ƶ�
				[121508] = {241964 , 1} ; --��j���R���ƶ�
							}--�������y(�ثe���~/�ƶq�ȥN)
--	DebugMsg(0, 0, TPid)
	if TPid > 1 then --�p�G�i�H�I��
		SetPlot( Target , "touch" , "" , 0)
		GiveBodyItem( Owner , CakeGift[CakeOrgid][1] , CakeGift[CakeOrgid][2] )
		WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)
		sleep(10)
		SetPlot( Target , "touch" , "Lua_na_wdcake1_touch" , 30 ) --�]�wĲ�I�@��
	else
		if TPid == 1 then
			GiveBodyItem( Owner , CakeGift[CakeOrgid][1] , CakeGift[CakeOrgid][2] )
			WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)	
		end
		SetPlot( Target , "touch" , "" , 0)
		ChangeObjID( Target , 121476 ) 
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, true )
	end
end

----------------------------------------------------------
--���W�� 121477
----------------------------------------------------------
function Lua_na_wedding_table0(Option , TicketID , ObjID)  --�@��function
	local Owner = OwnerID()
	local Target = TargetID()
	local TOrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Roomid = ReadRoleValue(Owner, EM_LuaValueFlag_UseItem43 )

	if ( Option == "CHECK" ) then --�ˬd�ؼ�
		if TOrgID == 121477 then --�p�G�ؼЬO�m�����\��
			return true
		else
			ScriptMessage( Owner , Owner , 2, "[SC_WEDDING_MEG0]" , 0 )
			return false
		end

	elseif ( Option == "USE" ) then --�ϥε��G
		if WeddingObjlist == nil then
			WeddingObjlist = {}  -- �إߪŪ��\�񪫥�M��
		end

		if WeddingObjlist[Roomid] == nil then
			WeddingObjlist[Roomid] = {}  -- �إ�Table
		end

	--	DelBodyItem( Owner, TicketID, 1 )
		ChangeObjID( Target , ObjID)
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, false )--�����Y����
		table.insert(WeddingObjlist[roomid] , Target )
	end		
end


function Lua_na_wedding_table() --�\�઺��l�@��
	local Owner = OwnerID() --�\�ॻ��
	local TableOrgid = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	local TableType = { 121509, 121510, 121511 } --�\��
	for i = 1 , #TableType do
		if TableOrgid == TableType[i] then
			WriteRoleValue( Owner , EM_RoleValue_PID , 20 )
			break
		end
	end
	SetPlot( Owner , "touch" , "Lua_na_wdtable_touch" , 30 ) --�]�wĲ�I�@��
end


function Lua_na_wdtable_touch() --Ĳ�I�@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --����
	local TPid = ReadRoleValue( Target , EM_RoleValue_PID )
	local TableOrgid = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local TableGift = {	[121509] = {241965 , 1} ; --�嶮���a���W��
				[121510] = {241966 , 1} ; --�S�s���a���W��
				[121511] = {241967 , 1} ; --�����a���W��	
							}--�������y(�ثe���~/�ƶq�ȥN)
--	DebugMsg(0, 0, TPid)
	if TPid > 1 then --�p�G�i�H�I��
		SetPlot( Target , "touch" , "" , 0)
		GiveBodyItem( Owner , TableGift[TableOrgid][1] , TableGift[TableOrgid][2] )
		WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)
		sleep(10)
		SetPlot( Target , "touch" , "Lua_na_wdtable_touch" , 30 ) --�]�wĲ�I�@��
	else
		if TPid == 1 then
			GiveBodyItem( Owner , TableGift[TableOrgid][1] , TableGift[TableOrgid][2] )
			WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)
		end
		SetPlot( Target , "touch" , "" , 0)
		ChangeObjID( Target , 121477 ) 
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, true )
	end
end


----------------------------------------------------------
--�ֹ� 121478
----------------------------------------------------------
function Lua_na_wedding_band(Option , TicketID , ObjID)  --�@��function
	local Owner = OwnerID()
	local Target = TargetID()
	local TOrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Roomid = ReadRoleValue(Owner, EM_LuaValueFlag_UseItem43 )  

	if ( Option == "CHECK" ) then --�ˬd�ؼ�
		if TOrgID == 121478 then --�p�G�ؼЬO�m�����\��
			return true
		else
			ScriptMessage( Owner , Owner , 2, "[SC_WEDDING_MEG0]" , 0 )
			return false
		end

	elseif ( Option == "USE" ) then --�ϥε��G
		if WeddingObjlist == nil then
			WeddingObjlist = {}  -- �إߪŪ��\�񪫥�M��
		end

		if WeddingObjlist[Roomid] == nil then
			WeddingObjlist[Roomid] = {}  -- �إ�Table
		end

	--	DelBodyItem( Owner, TicketID, 1 )
		SetPlot( Target , "touch" , "Lua_na_wdband_touch" , 30 ) --�]�wĲ�I�@��
		ChangeObjID( Target , ObjID)
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, false )--�����Y����
		table.insert(WeddingObjlist[roomid] , Target )
	end		
end

function Lua_na_wdband_touch()
	local OID = OwnerID()  -- player
	local TID = TargetID()  --obj
	local range = 150
	local players = SearchRangePlayer(TID, range)
	local playing = ReadRoleValue(TID, EM_RoleValue_Register+1 )	 -- �O�_����,  99 = ���� 
	
	if playing == 99 then  -- ����
		WriteRoleValue(TID, EM_RoleValue_Register+1, 0 )  -- �g�J�����
	else
		WriteRoleValue(TID, EM_RoleValue_Register+1, 99 )  -- �g�J�}�l����
		Callplot(TID, "Lua_na_wdband_touch_02" , 0 )  -- �ֹζ}�l�]�^�� �C���˴��S������buff�����a �����ܴN���L����
	end
end

function Lua_na_wdband_touch_02()
	local band = OwnerID()  -- player
	local range = 150
	local musicbuff = 623793

--	say(band , "band ")

	while true do 
	--	say(band, "test")
		local playing = ReadRoleValue(band, EM_RoleValue_Register+1 )	 -- �O�_����,  99 = ���� 
		if playing ~= 99 then  -- �S���b����  
			break
		else	-- ���� -- ���񵹨�L���a��a�񪺪��a
			local players = SearchRangePlayer(band, range)
			for i = 0 , table.getn(players) do 
				if CheckBuff(players[i], musicbuff ) == false then -- ���O�����
					AddBuff(players[i], musicbuff, 0, 3 )
					Lua_StopBGM(players[i])  -- ����ثe���񭵼�
					local MusicID = PlayMusicToPlayer(players[i],"music/wedding/fairytales_06_COL_ARO_home.mp3",True);  -- ���w���ať��Y�ӭ��ġA���q�j�p�|�ھڶZ���I��	
					-- music/dungeon/Pesche/ancient_wars_07_MKS_warriors_arise!.mp3
					Callplot(players[i], "Lua_na_wdband_touch_03" , band, MusicID )  -- ���a�]�^��
				--	say(players[i], "music on 3" )
				end
				AddBuff(players[i], musicbuff, 0, 3 )
			end
		end
		sleep(10)
	end
end


-- ���a�]�^��
function Lua_na_wdband_touch_03(obj, MusicID)
	local OID = OwnerID()  -- player
	local range = 150
--	say(OID, MusicID)
--	say(obj, "obj")

--	say(OID, "Check range and id ." )

	while true do 
		if CheckID(obj) == true then  -- �O�_��box
			local playing = ReadRoleValue(obj, EM_RoleValue_Register+1 )	
			if playing ~= 99 then  -- �S���b����
				StopSound(OID,MusicID)  -- ����MusicID�o���W�D���n��
				Lua_PlayBGM(OID)
			--	say(OID, "Stop and continue 1")
				break
			else
				local dis = GetDistance(OID, obj)  -- ���a�M����Z��
				if dis >= range then   -- �W�X�d�� �����
					StopSound(OID,MusicID)  -- ����MusicID�o���W�D���n��
					Lua_PlayBGM(OID)
				--	say(OID, "Stop and continue 2 ")
					break
				end
			end
		else  -- �䤣�쪫�� �����
			StopSound(OID,MusicID)  -- ����MusicID�o���W�D���n��
			Lua_PlayBGM(OID)
		--	say(OID, "Stop and continue 3")
			break 
		end
		sleep(10)
	end
end


----------------------------------------------------------
--���ֽe����y§��/���e����§��
----------------------------------------------------------
function Lua_na_wedding_box() --202898 / 202899 �@�μ@��
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue(Owner,EM_RoleValue_ZoneID)	
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

	if Zone == 305 or Zone == 306 or Zone == 307 then
		return TRUE
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_WEDDING_MEG1]", 0 )
		return FALSE
	end
end


function Lua_na_wdballon_touch() --Ĳ�I�@��
	local Owner = OwnerID() --��y
	local Player = TargetID() -- ���a�ϥΪ�

	local Roomid = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	if WeddingObjlist2 == nil then
		WeddingObjlist2 = {}  -- �إߪŪ��\�񪫥�M��
	end

	if WeddingObjlist2[Roomid] == nil then
		WeddingObjlist2[Roomid] = {}  -- �إ�Table
	end

	table.insert(WeddingObjlist2[roomid] , Owner )
	SetPlot( Owner , "touch" , "Lua_na_wedding_ballon" , 30 ) --�]�wĲ�I�@��
end

function Lua_na_wedding_ballon() --��y��Ĳ�I
	local Owner = OwnerID() --���a
	local Target = TargetID()
	local Maxim = {}
	Maxim[1] = "[SC_WEDDING_MESSAGE01]"
	Maxim[2] = "[SC_WEDDING_MESSAGE02]"		
	Maxim[3] = "[SC_WEDDING_MESSAGE03]"
	Maxim[4] = "[SC_WEDDING_MESSAGE04]"
	Maxim[5] = "[SC_WEDDING_MESSAGE05]"
	Maxim[6] = "[SC_WEDDING_MESSAGE06]"
	Maxim[7] = "[SC_WEDDING_MESSAGE07]"
	local R = DW_rand(7)
	SetPlot( Target , "touch" , "" , 0)
	ScriptMessage( Owner , Owner ,3 , Maxim[R] , 0)
	Addbuff( Owner , 623766 , 0, -1 )
	Sleep(10)
	SetPlot( Target, "touch" , "Lua_na_wedding_ballon" , 30 ) --�]�wĲ�I�@��
end



function Lua_na_wdbouquet_touch() --�������l�@��
	local Owner = OwnerID() --���
	local Player = TargetID() -- ���a�ϥΪ�

	local Roomid = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	if WeddingObjlist2 == nil then
		WeddingObjlist2 = {}  -- �إߪŪ��\�񪫥�M��
	end

	if WeddingObjlist2[Roomid] == nil then
		WeddingObjlist2[Roomid] = {}  -- �إ�Table
	end
	table.insert(WeddingObjlist2[roomid] , Owner )
	WriteRoleValue( Owner , EM_RoleValue_PID, 0 )
	SetPlot( Owner , "touch" , "Lua_na_wedding_bouquet" , 30 ) --�]�wĲ�I�@��
end


function Lua_na_wedding_bouquet() --�����Ĳ�I�@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --���
--	local T_PID = ReadRoleValue( Target , EM_RoleValue_PID)
	if ReadRoleValue( Target , EM_RoleValue_PID) == 0 then
		WriteRoleValue( Target , EM_RoleValue_PID , 1 )
		DelObj( Target)
		GiveBodyItem( Owner, 212141, 1)
		GiveBodyItem( Owner, 530925, 1 )
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_WEDDING_MEG2]" , 0 )	
	end
end




------------------------------------------------------------------------------
--�ϥΪ��~ �����J�|/ ����/ �I��
------------------------------------------------------------------------------
function Lua_wedding_item_check( Buff1, Buff2)
	local Owner = OwnerID()
	if CheckBuff( Owner , Buff1) == true or CheckBuff(Owner , Buff2) == true then
		ScriptMessage( Owner , Owner , 1 , "[SC_WEDDING_ITEM3]" , 0)
		return false
	else
		return true
	end
end




--�p��§��
--/GM ? ZONE 305 0 -3600 250 3600
--
--�j��§��
--/GM ? ZONE 305 0 -3600 250 -480
--
--�ǥ~§��
--/GM ? ZONE 305 0 -3600, 400 -4200