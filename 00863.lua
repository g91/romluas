--����§�](��)
Function LuaI_202909(Option)
	local PlayerID = OwnerID()
	local PackageID = 202909
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local randA= rand(200)
			if randA<= 18 then
				GiveBodyItem( PlayerID , 201612 , 1 )		--60��]�q
			elseif randA<= 18+20 then
				GiveBodyItem( PlayerID , 201967 , 10 )		--�w�߭ײz��*10
			elseif randA<= 18+20+40 then
				GiveBodyItem( PlayerID , 202907 , 5 )		--�������*5
			elseif randA<= 18+20+40 +40 then
				GiveBodyItem( PlayerID , 201141 , 1 )		--�������ū
			elseif randA<= 18+20+40 +40+20 then
				GiveBodyItem( PlayerID , 721934 , 1 )		--�H���CGiveBodyItem( PlayerID , 210400 , 1 )
			elseif randA<= 18+20+40 +40+20+20 then
				GiveBodyItem( PlayerID , 721935 , 1 )		--�N�����S�s§��
			elseif randA<=18+20+40 +40+20+20+20 then
				GiveBodyItem( PlayerID , 721936 , 1 )		--�F�������	
			elseif randA<= 18+20+40 +40+20+20+20+20 then
				GiveBodyItem( PlayerID , 721937 , 1 )		--���ʤ��a��		
			else
				GiveBodyItem( PlayerID , 201130 , 1 )		--�ä[���I
			end
	end

end
