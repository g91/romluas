--����§�](�j)
Function LuaI_202910(Option)
	local PlayerID = OwnerID()
	local PackageID = 202910
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
			if randA<= 29 then
				GiveBodyItem( PlayerID , 202907 , 10 )		--����*10
			elseif randA<= 29+10 then
				GiveBodyItem( PlayerID , 721938 , 1 )		--�d�蠟�b GiveBodyItem( PlayerID , 210415 , 1 )
			elseif randA<= 29+10+20 then
				GiveBodyItem( PlayerID , 201450 , 1 )		--���@�Z����
			elseif randA<= 29+10+20+20 then
				GiveBodyItem( PlayerID , 201457 , 1 )		--���@�˳ƥ�
			elseif randA<= 29+10+20+20+20 then
				GiveBodyItem( PlayerID , 201967 , 30 )		--�w�߭ײz��*30
			elseif randA<= 29+10+20+20+20+10 then
				GiveBodyItem( PlayerID , 201613 , 1 )		--70��]�q
			elseif randA<= 29+10+20+20+20+10+10 then
				GiveBodyItem( PlayerID , 721944 , 1 )		--�C�˧٫� �T�D�̪���R	GiveBodyItem( PlayerID , 221155 , 1 )	
			elseif randA<= 29+10+20+20+20+10+10+10 then
				GiveBodyItem( PlayerID , 721939 , 1 )		--���O���C GiveBodyItem( PlayerID , 210908 , 1 )	
			elseif randA<= 29+10+20+20+20+10+10+10+10 then
				GiveBodyItem( PlayerID , 721940 , 1 )		--�˲� GiveBodyItem( PlayerID , 210402 , 1 )	
			elseif randA<= 29+10+20+20+20+10+10+10+10+10 then
				GiveBodyItem( PlayerID , 721941 , 1 )		--Ĩۣ���C GiveBodyItem( PlayerID , 210394 , 1 )					
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10  then
				GiveBodyItem( PlayerID , 721943 , 1 )		--�P�˧٫� �y���k�v���� GiveBodyItem( PlayerID , 221154 , 1 )
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10 +10  then
				GiveBodyItem( PlayerID , 202440 , 1 )		--�Z��R�������§�]1���
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10 +10 +10  then
				GiveBodyItem( PlayerID , 202441 , 1 )		--������������§�]1���
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10 +10 +10 +10  then
				GiveBodyItem( PlayerID , 202442 , 1 )		--�����������§�]1���		
			else
				GiveBodyItem( PlayerID , 721942 , 1 )		--Ĩۣ�� GiveBodyItem( PlayerID , 220976 , 1 )
			end
	end

end
