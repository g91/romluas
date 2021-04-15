-- ��{�j�Y�i�J�ǰe�I
function LuaI_Enter_BloodyGallery()

	SetPlot( OwnerID() , "Range" , "Enter_BloodyGallery" ,  20 )
--	BeginPlot( OwnerID() , "BloodyGallery_RunningMessage" ,  0 )

end

function Enter_BloodyGallery()

	--local hour = GetSystime(1)
	--local min = GetSystime(2)
	--local BuffID = 501637

	--if  ( hour >= 22 and hour <= 23 ) then
		if ChangeZone( OwnerID() , 201, 0 , 2732 ,  61 ,  1430 , 270 ) then
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("ST_BLOODY_01") , C_SYSTEM )		-- �A��V�@�D���������~�A�ǨӤ@�Ѩ�󪺦�{���C
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
			DesignLog(OwnerID(),201,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��	--��{�j�Y
			local BloodPot = CountBodyItem( OwnerID() , 201963 ) 		-- �s�A��~
			if DelBodyItem( OwnerID() , 201963 , BloodPot ) then		-- �s�A��~�R��
				GiveBodyItem ( OwnerID() , 201964 , BloodPot )		-- ������~
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	--elseif ( CheckBuff( OwnerID() , BuffID ) == true ) then
	--	if ChangeZone( OwnerID() , 201, 0 , 2732 ,  61 ,  1430 , 270 ) then
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("ST_BLOODY_01") , C_SYSTEM )		-- �A��V�@�D���������~�A�ǨӤ@�Ѩ�󪺦�{���C
	--		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
	--		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
	--		DesignLog( OwnerID() , 201 , "last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��	--��{�j�Y
	--		local BloodPot = CountBodyItem( OwnerID() , 201963 ) 		-- �s�A��~
	--		if DelBodyItem( OwnerID() , 201963 , BloodPot ) then		-- �s�A��~�R��
	--			GiveBodyItem ( OwnerID() , 201964 , BloodPot )		-- ������~
	--		end
	--	else
	--		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	--	end
	--else
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("ST_BLOODY_04") , C_SYSTEM )		-- �A��V�@�D���������~�A�����G�S������Ʊ��o�͡C
	--end

end
function BloodyGallery_RunningMessage()

	local hour = 0
	local min = 0
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	
	while true do
		hour = GetSystime(1)
		min = GetSystime(2)

		if  ( hour == 21 and min  == 40 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_1") )	-- ��{�j�Y�̪������s�}�l�������ʡC
			end
		end 
		if  ( hour == 21 and min  == 50 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_2") )	-- ��{�j�Y�̪������s�}�l�������ʡA�ǰe���ɧY�N�}�ҡC
			end
		end 
		if  ( hour == 22 and min  == 0 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_3") )	-- ��{�j�Y�����ɶ}�ҡA�����s�@��ӥX�I�I
			end
		end 
		if  ( hour == 0 and min  == 0 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_4") )	-- ��{�j�Y�������s�l���F�������A��^�_�A�ǰe���ɤw�g�����I�I
			end
		end 

		Sleep( 500 )

	end
end

-- ��{�j�Y�X�h�ǰe�I
function LuaI_Outer_BloodyGallery()
	SetPlot( OwnerID() , "Range" , "Outer_BloodyGallery" ,  20 )
end

function Outer_BloodyGallery()
	ChangeZone( OwnerID() , 2 , 0 , -151 , 37 , 2640 , 0 )
end