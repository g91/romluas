--�ǲ������U
function LuaI_XmasGife5( Option )
	local PlayerID = OwnerID()
	local PackageID = 203536		-- �ǲ������U
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace )
--	Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203513,		-- ���H�ܨ��Ĥ�
			203521,		-- �x�V���߿}
			203515,		-- 7�ѳ��H�d��
			203523,		-- �x�V���ųn�}
			203524	}	-- �x�V�δο}
	local probability = {	5,		-- ���H�ܨ��Ĥ����v
			30,             	-- �x�V���߿}���v
			10,             	-- 7�ѳ��H�d�����v
			30,             	-- �x�V���ųn�}���v
			25	}       	-- �x�V�δο}���v
	local RANDOWN = rand(100)

	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--Say(PlayerID,"RANDOWN is "..RANDOWN)
		if RANDOWN > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , rand(3)+1 )
			--Say(PlayerID," 1 ")
		elseif RANDOWN > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , rand(3)+1 )
			--Say(PlayerID," 2 ")					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			--Say(PlayerID," 3 ")				
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , rand(3)+1 )
			--Say(PlayerID," 4 ")					
		else
			GiveBodyItem( PlayerID , Item[5] , rand(3)+1 )
			--Say(PlayerID," 5 ")					
		end
	end
end

--���H�d���c 7��
function LuaI_XmasEgg01( Option )
	local PlayerID = OwnerID()
	local PackageID = 203515		
	local Item = 203514                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item , 1 )	
	end
end