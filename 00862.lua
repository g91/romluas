--����§�](�p)
Function LuaI_202908(Option)
	local PlayerID = OwnerID()
	local PackageID = 202908
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 721856 , 1 )		   ---test drop
		local randA= rand(100)
			if randA<= 4 then
				GiveBodyItem( PlayerID , 201611 , 1 )		--50��]�q
			elseif randA<= 4+15 then
				GiveBodyItem( PlayerID , 201967 , 1 )		--�w�߭ײz��
			elseif randA<= 4+15+10 then
				GiveBodyItem( PlayerID ,202907, 1 )		--�������
			elseif randA<= 4+15+10+10 then
				GiveBodyItem( PlayerID , 202451 , 1 )		--7�ѥհ�
			elseif randA<= 4+15+10+10+10 then
				GiveBodyItem( PlayerID , 201141, 1 )		--�������ū
			elseif randA<= 4+15+10+10+10+20 then
				GiveBodyItem( PlayerID , 221576, 1 )		--��ťͩR�@��
			elseif randA<= 4+15+10+10+10+20+20 then
				GiveBodyItem( PlayerID , 221577 , 1 )		--��Ūk�O�@��		
			else
				GiveBodyItem( PlayerID , 202231 , 1 )		--7���b�m
			end
	end

end