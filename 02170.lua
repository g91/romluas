
function FN_teleport_EX()
	local magic
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	magic = LuaFunc_CreateObjByObj ( 103931 , OwnerID() )
	SetModeEx(magic,EM_SetModeType_Mark, false)
	SetModeEx(magic,EM_SetModeType_HideName, false)
	SetModeEx(magic,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(magic,EM_SetModeType_Strikback, false)
	SetModeEx(magic,EM_SetModeType_Move, false)
	SetModeEx(magic,EM_SetModeType_Fight, false)
	SetModeEx(magic,EM_SetModeType_Searchenemy, false)
	SetModeEx(magic,EM_SetModeType_Obstruct, true)
	WriteRoleValue(magic,EM_RoleValue_Livetime,3)
	AddToPartition( magic, RoomID)
	CastSpell( OwnerID(), OwnerID(), 497190 )
	sleep(10)
	setpos( OwnerID() , kg_GetRangePos( OwnerID() , nil , 100 , 0 , -3  ) )
end
-------------------------------------------------------------------------------------------
function Normal_Easy_EnterZone()

	if GetPartyID( OwnerID() , -1 ) == 0 then
		local x = ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting )
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_NORMAL_ENTERZONE]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_NORMAL_ENTERZONE]" , 0 )
		say(OwnerID(),"NORMAL"..x)
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_EASY_ENTERZONE]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_EASY_ENTERZONE]" , 0 )
		say(OwnerID(),"easy"..x)
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 2 then
		say(OwnerID(),"hard"..x)
		end
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		local y = PartyInstanceLv ( OwnerID())
		local x = ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting )
		if PartyInstanceLv ( OwnerID()) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_NORMAL_ENTERZONE]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_NORMAL_ENTERZONE]" , 0 )
		say(OwnerID(),"NORMAL"..y)
		elseif PartyInstanceLv ( OwnerID()) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_EASY_ENTERZONE]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_EASY_ENTERZONE]" , 0 )
		say(OwnerID(),"easy"..y)
		elseif PartyInstanceLv ( OwnerID()) == 2 then
		say(OwnerID(),"hard"..y)
		end
	end
	
end
function Normal_Easy_EnterZone2(x)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
CopyRoomMonster	( x , RoomID )
end
--293 1136 1448
--147 -1 293 1136 1448 180
----�ƥ��X�J�f��Script
-------102678   110578  112224
-----�ƥ��ǰe���ȩw��
function zone_23ts_NOOPEN_Enter()
	SetPlot( OwnerID() , "Collision" , "un_23ts_NOOPEN_enter" , 1 )
end
function un_23ts_NOOPEN_enter()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_17NOOPEN]" , 0 )
end
function zone_23_Enter()
	SetPlot( OwnerID() , "Collision" , "un_19_23_Enter" , 1 )
end
function un_19_23_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then---�P�_�Ŀ諸�ƥ�����
			if ChangeZone( OwnerID() ,  147 ,  -1 , 293 , 1136 , 1448, 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 147 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
			if ChangeZone( OwnerID() , 147 ,  -1 , 293 , 1136 , 1448, 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 147 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 2 then ------------Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 147 , -1 , 293 , 1136 , 1448, 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 147 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv ( OwnerID())== 0 then---�P�_�Ŀ諸�ƥ�����
			if ChangeZone( OwnerID() ,  147 ,  -1 , 293 , 1136 , 1448, 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 147 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv ( OwnerID()) == 1 then
			if ChangeZone( OwnerID() , 147 ,  -1 , 293 , 1136 , 1448, 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 147 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv ( OwnerID() )== 2 then ------------Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 147 , -1 , 293 , 1136 , 1448, 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 147 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function zone_23_Out()
	SetPlot( OwnerID() , "Collision" , "un_23_Out" , 1 )
end
function un_23_Out()
	if ChangeZone( OwnerID() , 939 , 0, 755 , -257 , -854 , 0 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
function zoneteset001()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
say(OwnerID(),"zone = "..RoomID)

end
function testbossslill()

CastSpellLv(OwnerID(),OwnerID(),498444,0)

end
function testjobbb()
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	say(OwnerID(),"job = "..Job)
	say(OwnerID(),"Job_sub = "..Job_sub)
end

function attachtest_un()
local firelose = {}
firelose = SearchRangeNPC ( OwnerID() , 50 )
say(firelose[0],"mon = hihi")
AttachObj(  firelose[0],OwnerID(), 1, "p_top", "p_top" )
end

function un_getnamesay()
local name
--name = Getname(OwnerID())
say(OwnerID(),"name = "..Getname(OwnerID()))
end

function un_cointest_01()
	say(OwnerID(),"got money")
	say(TargetID(),"send money")
	AddSpeicalCoin( OwnerID(), 14 , 14, 10 )
	return true
end
function un_cointest_02(x)
--AddSpeicalCoin( OwnerID(), 5 , 5, 10 )
	say(OwnerID(),"got money")
	say(TargetID(),"send money")
AddSpeicalCoin( OwnerID(), 14 , 14, x )
end

function TokenItemsToValue_ex( Type,num ) --���~+�ƶq
	CallPlot( OwnerID() , "TokenItemsToValue_2_ex" , Type ,num)
end
function TokenItemsToValue_2_ex( Type,num )
	local OwnID = OwnerID()
		local ItemsTypeTable = { --�f�����~�M��
	206686 , -- Type = 1�A�շ�����
	206879 , -- Type = 2�A�j�N��
	208681 , -- Type = 3�A�ڹҥ����L�O
	240181 , -- Type = 4�A�����Ŷꨩ
	201545 , -- Type = 5�A���q��q
	241706 } -- Type = 6�A�ǩ_����
	
	local TokenValueTable = { --�f�����ƭȽs��
	8 , 	-- TokenValue = 8		--�շ�����
	9 , 	-- TokenValue = 9		--�j�N��
	10 , 	-- TokenValue = 10	--�ڹҥ����L�O
	11 , 	-- TokenValue = 11	--�����Ŷꨩ
	12 , 	-- TokenValue = 12	--���q��q
	13}	-- TokenValue = 13	--�ǻ�����
	
	local TokenValueNameTable = { --�f���ƭȲM��
	EM_RoleValue_TrialBadgeCoin , -- Type = 1�A�շ�����
	EM_RoleValue_RelicsCoin , -- Type = 2�A�j�N��
	EM_RoleValue_DreamlandCoin , -- Type = 3�A�ڹҥ����L�O
	EM_RoleValue_PhiriusShellCoin , -- Type = 4�A�����Ŷꨩ
	EM_RoleValue_EnergyJusticeCoin , -- Type = 5�A���q��q
	EM_RoleValue_ProofLegendCoin } -- Type = 6�A�ǩ_����
	
	local TokenLimitTable = { --�f���ƭȤW���M��A-1 = �L�W��
	-1 , -- Type = 1�A�շ�����
	3000 , -- Type = 2�A�j�N��
	-1 , -- Type = 3�A�ڹҥ����L�O
	1000 , -- Type = 4�A�����Ŷꨩ
	-1 , -- Type = 5�A���q��q
	-1 } -- Type = 6�A�ǩ_����
	
	local StringTable = { "[SC_TOKEN_STRING_1]" , "[SC_TOKEN_STRING_2]" , "[SC_TOKEN_STRING_3]" } --�T���r��
	local TokenStringTable = { --�f�����r��
	"[SYS_MONEY_TYPE_8]" , 
	"[SYS_MONEY_TYPE_9]" , 
	"[SYS_MONEY_TYPE_10]" , 
	"[SYS_MONEY_TYPE_11]" , 
	"[SYS_MONEY_TYPE_12]" , 
	"[SYS_MONEY_TYPE_13]" }
	
	local TokenItemCount = CountBodyItem( OwnID , ItemsTypeTable[ Type ] ) --�ثe�ϥγf�����~���ƶq
	local TokenValueCount = ReadRoleValue( OwnID , TokenValueNameTable[ Type ] ) --�ثe���ഫ���f���ƭȼƶq
	
	DebugMsg( 0 , 0 , "ItemsType = " .. ItemsTypeTable[Type] )
	DebugMsg( 0 , 0 , "TokenValue = " .. TokenValueTable[Type] )
	DebugMsg( 0 , 0 , "TokenValueName = " .. TokenValueNameTable[Type] )
	DebugMsg( 0 , 0 , "TokenLimit = " .. TokenLimitTable[Type] )
	DebugMsg( 0 , 0 , "TokenItemCount = " .. TokenItemCount )
	DebugMsg( 0 , 0 , "TokenValueCount = " .. TokenValueCount )
	
	if TokenLimitTable[ Type ] > 0 then --�p�G�W�L�f���ƭȤW���A�h�����ഫ�A����ܰT��
		if TokenValueCount + TokenItemCount > TokenLimitTable[ Type ] then
			ScriptMessage( OwnID , OwnID , 2 , TokenStringTable[ Type ]..StringTable[ 3 ] , 0 )
			return
		end
	end
	
	DelBodyItem( OwnID , ItemsTypeTable[ Type ] , TokenItemCount ) --�R�����~
	AddSpeicalCoin( OwnID , 19 , TokenValueTable[ Type ] , TokenItemCount+num ) --�����f���ƭ�
	ScriptMessage( OwnID , OwnID , 2 , StringTable[ 1 ]..TokenItemCount..TokenStringTable[ Type ]..StringTable[ 2 ] , 0 ) --�ഫ���\�T��
end
function un_YOYO_GetTokenValue_teset()
	YOYO_GetTokenValue( 3,1 )
end

function un_zonedung_BossID() --10���n����zone��BossID�M���l�@��
local own = OWnerID()
local ZoneID = ReadRoleValue(own,EM_RoleValue_ZoneID)
local RoomID = ReadRoleValue(own,EM_RoleValue_RoomID)
	for i = 1 , 3 do
		sleep(10)
			say(own,"tome = "..i)
			if i == 3 then
				say(own,"oh ya")
				un_zonedung_BossID_zone(ZoneID,RoomID)
			end	
	end	
end
function un_zonedung_BossID_zone(ZoneID,RoomID) --�j�MBoss����l�@��
local own = OWnerID()
	say(own,"oh yaehahaha")
	local BOSSNPC = SetSearchAllNPC(RoomID)      --Ū�����hzone�Ҧ�NPC�ƶq
	local npcsex
	local Str
	local namenpc
		local BOSSNPCname                               --���ŧi�n���X��zone�᪺NPC
		for i = 1 , BOSSNPC do                          --�X�Ӫ��a����X��for�j��A�P�_�Ҧ����a
			BOSSNPCname = GetSearchResult()     
			namenpc = ReadRoleValue( BOSSNPCname , EM_RoleValue_OrgID ) --����GUID
			npcsex = GameObjInfo_Int(namenpc ,"Sex")
			--npcsex =GameObjInfo_Str(BOSSNPCname ,"Sex")
			--Str = "[$SETVAR1="..npcsex.."]"
			say(BOSSNPCname,"sex = "..npcsex)
		end
	--DebugLog(2,"Yes")  --log�T�� ""�����n�O�����T�� 
end