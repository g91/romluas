function LuaI_Anne( Option )
	local PlayerID = OwnerID()
	local PackageID = 203141		-- �p�w�g���p§��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	724058,		-- �ɵ�
			203087,		-- Ĩۣ�H�ܨ��Ĥ�
			203086,		-- �����L�ܨ��Ĥ�
			203079	}	-- �n�ʬ�

	local probability = {	65,		-- �ɵ����v
			15,  	       	-- Ĩۣ�H�ܨ��Ĥ����v
			15,             	-- �����L�ܨ��Ĥ����v
			5	}       	-- �n�ʬ����v

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
--		Say(PlayerID,"RAND is "..RAND)
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )					
		else
			GiveBodyItem( PlayerID , Item[4] , 1 )					
		end
	end
end