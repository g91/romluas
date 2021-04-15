--中秋禮包(大)
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
				GiveBodyItem( PlayerID , 202907 , 10 )		--椰絨*10
			elseif randA<= 29+10 then
				GiveBodyItem( PlayerID , 721938 , 1 )		--悲鳴之刃 GiveBodyItem( PlayerID , 210415 , 1 )
			elseif randA<= 29+10+20 then
				GiveBodyItem( PlayerID , 201450 , 1 )		--神願武器石
			elseif randA<= 29+10+20+20 then
				GiveBodyItem( PlayerID , 201457 , 1 )		--神願裝備石
			elseif randA<= 29+10+20+20+20 then
				GiveBodyItem( PlayerID , 201967 , 30 )		--安心修理錘*30
			elseif randA<= 29+10+20+20+20+10 then
				GiveBodyItem( PlayerID , 201613 , 1 )		--70格包裹
			elseif randA<= 29+10+20+20+20+10+10 then
				GiveBodyItem( PlayerID , 721944 , 1 )		--劍傷戒指 禁錮者的鐐銬	GiveBodyItem( PlayerID , 221155 , 1 )	
			elseif randA<= 29+10+20+20+20+10+10+10 then
				GiveBodyItem( PlayerID , 721939 , 1 )		--徽記之劍 GiveBodyItem( PlayerID , 210908 , 1 )	
			elseif randA<= 29+10+20+20+20+10+10+10+10 then
				GiveBodyItem( PlayerID , 721940 , 1 )		--傷痕 GiveBodyItem( PlayerID , 210402 , 1 )	
			elseif randA<= 29+10+20+20+20+10+10+10+10+10 then
				GiveBodyItem( PlayerID , 721941 , 1 )		--蘑菇骨劍 GiveBodyItem( PlayerID , 210394 , 1 )					
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10  then
				GiveBodyItem( PlayerID , 721943 , 1 )		--匕傷戒指 流浪法師指環 GiveBodyItem( PlayerID , 221154 , 1 )
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10 +10  then
				GiveBodyItem( PlayerID , 202440 , 1 )		--凡瑞娜絲”精裝禮包1件裝
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10 +10 +10  then
				GiveBodyItem( PlayerID , 202441 , 1 )		--賢哲之眼”精裝禮包1件裝
			elseif randA<= 29+10+20+20+20+10+10+10+10+10+10 +10 +10 +10  then
				GiveBodyItem( PlayerID , 202442 , 1 )		--“風野”精裝禮包1件裝		
			else
				GiveBodyItem( PlayerID , 721942 , 1 )		--蘑菇盾 GiveBodyItem( PlayerID , 220976 , 1 )
			end
	end

end
