function LuaI_202_BossOne_EXIT()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	if ChangeZone( OwnerID() , 206 , 0,3506, 335, 1839, 185) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_203_BossTwo_EXIT()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	if ChangeZone( OwnerID() , 207 , 0, 4957, 318, 1481, 185) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_204_BossThree_EXIT()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	if ChangeZone( OwnerID() , 207 , 0, 1638, 378, 1562, 175) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end




--�J�f
function LuaS_204to203_0()
	SetPlot(OwnerID() , "range" , "LuaS_204to203_1" , 30 )
end


function LuaS_204to203_1()
	if  ChangeZone( OwnerID() , 206 , 0, 5443, 396, 2413, 80) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end
--------------------------

function LuaS_203to202_0()
	SetPlot(OwnerID() , "range" , "LuaS_203to202_1" , 30 )
end


function LuaS_203to202_1()
	if ChangeZone( OwnerID() , 205 , 0, 5731 , 429 , 3786 , 90) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end
------------------------
function LuaS_202toZone5_0()
	SetPlot(OwnerID() , "range" , "LuaS_202toZone5_1" , 30 )
end

function LuaS_202toZone5_1()
	ChangeZone( OwnerID() , 5 , 0, -15629.2  , 948.9  , -5064.5 , 264)
end


--�X�f

function LuaS_202to203_0()
	SetPlot(OwnerID() , "range" , "LuaS_202to203_1" , 30 )
end

function LuaS_202to203_1()
	if ChangeZone( OwnerID() , 206 , 0, 3364 , 362 , 1614 , 270) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- ���o���a��¾����
		DesignLog(OwnerID() , 206 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- �����i�J�H��	-- �u�íx���Y
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end





function LuaS_203to204_0()
	SetPlot(OwnerID() , "range" , "LuaS_203to204_1" , 30 )
end

function LuaS_203to204_1()
	if ChangeZone( OwnerID() , 204 , 0, 4822, 343, 1258, 270) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- ���o���a��¾����
		DesignLog(OwnerID() , 207 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- �����i�J�H��	-- �ӱ�������
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end






--�ǰe��




function LuaS_203toZone5_0()
	SetPlot(OwnerID() , "touch" , "LuaS_203toZone5_1" , 50 )
end

function LuaS_203toZone5_1()
	if CheckFlag(OwnerID() , 542295)  == true then
		ChangeZone( OwnerID() , 5 , 0, -12712.2 , 1273.6 , -7700.5, 346 )
	else
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_12]", 0 )
		ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_12]", 0 )
	end
end



function LuaS_204toZone5_0()
	SetPlot(OwnerID() , "touch" , "LuaS_204toZone5_1" , 50 )
end

function LuaS_204toZone5_1()
	if CheckFlag(OwnerID() , 542296)  == true then
		ChangeZone( OwnerID() , 5 , 0, -19352.7 , 1252 , 335.9 , 346 )
	else
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_13]", 0 )
		ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_13]", 0 )
	end
end




function LuaS_Zone5to202_0()
	SetPlot(OwnerID() , "touch" , "LuaS_Zone5to202_1" , 50 )
end

function LuaS_Zone5to202_1()
	if ChangeZone( OwnerID() , 205 , 0, 1813 , 395 , 1139 , 270 ) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- ���o���a��¾����
		DesignLog(OwnerID() , 205 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- �����i�J�H��	-- �_���̨i�D
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end



function LuaS_Zone5to203_0()
	SetPlot(OwnerID() , "touch" , "LuaS_Zone5to203_1" , 50 )
end

function LuaS_Zone5to203_1()
	if CheckFlag(OwnerID() , 542295)  == true then
		if ChangeZone( OwnerID() , 206 , 0, 3364 , 365 , 1614 , 270) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- ���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- ���o���a��¾����
			DesignLog(OwnerID() , 206 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- �����i�J�H��	-- �u�íx���Y
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	else
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_12]", 0 )
		ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_12]", 0 )	
	end
end



function LuaS_Zone5to204_0()
	SetPlot(OwnerID() , "touch" , "LuaS_Zone5to204_1" , 50 )
end

function LuaS_Zone5to204_1()
	if CheckFlag(OwnerID() , 542296)  == true then
		if ChangeZone( OwnerID() , 207 , 0, 4822, 346, 1258, 270) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- ���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- ���o���a��¾����
			DesignLog(OwnerID() , 207 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- �����i�J�H��	-- �ӱ�������
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	else
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_13]", 0 )
		ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_13]", 0 )
	end
end

--�������ж�
function LuaS_204toBoss3_0()--3��
	SetPlot(OwnerID() , "range" , "LuaS_204toBoss3_1" , 30 )
end

function LuaS_204toBoss3_1()
	if CountBodyItem(OwnerID() , 203529) < 1 then
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_11]", 0 )
		return
	end

	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421660_3") )	-- �A�T�w���̳ͭ��b�A������åB�ǳƦn�����D�ԤF�H
		DialogSelectStr( OwnerID() , GetString("SC_421660_1") )			-- �T�w�I
		DialogSelectStr( OwnerID() , GetString("SC_421660_2") )			-- �٨S
		
		local DoubleCheck = LuaS_204toBoss3_2( OwnerID() )
		if DoubleCheck == "Yes" then
			if CountBodyItem(OwnerID() , 203529) < 1 then
				ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_11]", 0 )
				return
			else
				DelBodyItem(OwnerID() , 203529 , 1)
				ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_9]", 0 )
				ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_9]", 0 )			
				if ChangeZone( OwnerID() , 112  , -1 , 4575.4 , 308 , 1467.4 , 270) then
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_204toBoss3_2(Player)
	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- ���L�a�j��A120 = �@����
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) or (DialogStatus==-1) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
			end
		end
	end

	return DialogResult
end


function LuaS_204toBoss2_0()
	SetPlot(OwnerID() , "range" , "LuaS_204toBoss2_1" , 30 )
end

function LuaS_204toBoss2_1()
--	local leader = GetPartyID( OwnerID() , 1)
--	if leader == OwnerID() then
	if CountBodyItem(OwnerID() , 203528) < 1 then
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_5]", 0 )
		return
	end
	
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421660_0") )	-- �A�T�w���̳ͭ��b�A������åB�ǳƦn�����D�ԤF�H
		DialogSelectStr( OwnerID() , GetString("SC_421660_1") )			-- �T�w�I
		DialogSelectStr( OwnerID() , GetString("SC_421660_2") )			-- �٨S
		local DoubleCheck = LuaS_204toBoss2_2( OwnerID() )
		if DoubleCheck == "Yes" then
			if CountBodyItem(OwnerID() , 203528) < 1 then
				Say(OwnerID() , "No Item" )--
				return
			end
			for i=6 , 1 , -1 do
				if i==1 then
					ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_7]", 0 )
					ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_7]", 0 )
					DelBodyItem( OwnerID() , 203528 , 1 )
				end
				local party = GetPartyID(OwnerID() , i )
				if party ~= 0 then
					if ChangeZone( party  , 111  , -1 , 1215.7 , 405  , 4841 , 270) then
					else
						ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
					end
				else
					if i==1 then
						if ChangeZone( OwnerID() , 111  , -1 , 1215.7 , 405  , 4841 , 270) then
						else
							ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
						end				
					end
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
--	else
--		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_10]", 0 )
--		return
--	end
end


function LuaS_204toBoss2_2(Player)
	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- ���L�a�j��A120 = �@����
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) or ( DialogStatus==-1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
			end
		end
	end

	return DialogResult	
end

function LuaS_203toBoss1_0()
	SetPlot(OwnerID() , "range" , "LuaS_203toBoss1_1" , 30 )
end

function LuaS_203toBoss1_1()
--	local leader = GetPartyID( OwnerID() , 1)
--	if leader == OwnerID() then
	if CountBodyItem(OwnerID() , 203527) < 1 then
		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_4]", 0 )
		return
	end
	
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421660_0") )	-- �A�T�w���̳ͭ��b�A������åB�ǳƦn�����D�ԤF�H
		DialogSelectStr( OwnerID() , GetString("SC_421660_1") )			-- �T�w�I
		DialogSelectStr( OwnerID() , GetString("SC_421660_2") )			-- �٨S
		local DoubleCheck = LuaS_204toBoss2_2( OwnerID() )
		if DoubleCheck == "Yes" then
			if CountBodyItem(OwnerID() , 203527) < 1 then
				ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_4]", 0 )
				return
			end
			for i=6 , 1 , -1 do
				if i==1 then
					ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_6]", 0 )
					ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421660_6]", 0 )
					DelBodyItem( OwnerID() , 203527 , 1 )
				end
				local party = GetPartyID(OwnerID() , i )
				if party ~= 0 then
					if ChangeZone( party  , 109  , -1 , 1220.3, 289 , 1476, 270) then
					else
						ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
					end
				else
					if i==1 then
						if ChangeZone( OwnerID() , 109  , -1 , 1220.3, 289 , 1476, 270) then
						else
							ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
						end				
					end
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
--	else
--		ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421660_10]", 0 )
--		return
--	end	
end

function LuaS_203toBoss1_2(Player)
	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- ���L�a�j��A120 = �@����
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) or ( DialogStatus == -1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
			end
		end
	end

	return DialogResult	
end