Function Lua_Hao_mixtureMine01(Option)

	local PlayerID = OwnerID() -- �ŧi��H���ۤv
	local NeedSpace = 1 -- �ŧi��1
	local NeedBagSpace = Check_Bag_Space( PlayerID , NeedSpace ) -- �ŧi�T�{�ϥΪ̪��]�]�Ŷ���1�H�W
	
	local G1 = CountBodyItem ( OwnerID() , 204885 ) -- ��
	
		if ( Option == "CHECK" ) then
	
			if ( NeedBagSpace == false ) then
					return false
			elseif G1 >= 10 then     
					return true
			else
					return false
			end

		elseif ( Option == "USE" ) then
	
			GiveBodyItem ( OwnerID() , 205070 , 1 )
			BeginPlot(  OwnerID()  , "Lua_Hao_mixtureMine01_1" , 0 )  
	
		end

end


Function Lua_Hao_mixtureMine01_1()
		
	DelBodyItem ( OwnerID() , 204885 , 10 )
			
end

Function Lua_Hao_mixtureMine02(Option)

	local PlayerID = OwnerID() -- �ŧi��H���ۤv
	local NeedSpace = 1 -- �ŧi��1
	local NeedBagSpace = Check_Bag_Space( PlayerID , NeedSpace ) -- �ŧi�T�{�ϥΪ̪��]�]�Ŷ���1�H�W
	
	local G2 = CountBodyItem ( OwnerID() , 204886 ) -- ��
	
		if ( Option == "CHECK" ) then
	
			if ( NeedBagSpace == false ) then
					return false
			elseif G2 >= 10 then     
					return true
			else
					return false
			end
	
		elseif ( Option == "USE" ) then
	
			GiveBodyItem ( OwnerID() , 205071 , 1 )
			BeginPlot(  OwnerID()  , "Lua_Hao_mixtureMine02_1" , 0 )  
	
		end

end

Function Lua_Hao_mixtureMine02_1()

			DelBodyItem ( OwnerID() , 204886 , 10 )

end

Function Lua_Hao_mixtureMine03(Option)

	local PlayerID = OwnerID() -- �ŧi��H���ۤv
	local NeedSpace = 1 -- �ŧi��1
	local NeedBagSpace = Check_Bag_Space( PlayerID , NeedSpace ) -- �ŧi�T�{�ϥΪ̪��]�]�Ŷ���1�H�W
	
	local G3 = CountBodyItem ( OwnerID() , 204887 ) -- �a
	
		if ( Option == "CHECK" ) then
	
			if ( NeedBagSpace == false ) then
					return false
			elseif G3 >= 10 then     
					return true
			else
					return false
			end
	
		elseif ( Option == "USE" ) then
	
			GiveBodyItem ( OwnerID() , 205072 , 1 )
			BeginPlot(  OwnerID()  , "Lua_Hao_mixtureMine03_1" , 0 )  
	
		end

end

Function Lua_Hao_mixtureMine03_1()

			DelBodyItem ( OwnerID() , 204887 , 10 )

end

Function Lua_Hao_mixtureMine04(Option)

	local PlayerID = OwnerID() -- �ŧi��H���ۤv
	local NeedSpace = 1 -- �ŧi��1
	local NeedBagSpace = Check_Bag_Space( PlayerID , NeedSpace ) -- �ŧi�T�{�ϥΪ̪��]�]�Ŷ���1�H�W
	
	local G4 = CountBodyItem ( OwnerID() , 204888 ) -- ��
	
		if ( Option == "CHECK" ) then
		
			if ( NeedBagSpace == false ) then
					return false
			elseif G4 >= 10 then     
					return true
			else
					return false
			end
		
		elseif ( Option == "USE" ) then
		
			GiveBodyItem ( OwnerID() , 205073 , 1 )
			BeginPlot(  OwnerID()  , "Lua_Hao_mixtureMine04_1" , 0 )  
	
		end

end

Function Lua_Hao_mixtureMine04_1()

			DelBodyItem ( OwnerID() , 204888 , 10 )

end