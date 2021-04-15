function Lua_ddddddNiji_00()

	SetPlot( OwnerID(),"touch","Lua_ddddddNiji_01",100 )

end


function Lua_ddddddNiji_01()

	Say( OwnerID() , " 124 " ) --薩克斯風
	PlayMotion( OwnerID() , 124) 
	sleep(50)
	Say( OwnerID() , " 125 " ) --薩克斯風
	PlayMotion( OwnerID() , 125) 
	sleep(50)
	Say( OwnerID() , " 126 " ) --薩克斯風
	PlayMotion( OwnerID() , 126) 	
	        

end





function Lua_ddddddNiji_10()

	SetPlot( OwnerID(),"range","Lua_ddddddNiji_11",50 )

end

function Lua_ddddddNiji_11()

	SetPlot( OwnerID(),"range","",0 )

	local gift =  CountBodyItem( OwnerID() , 201844 ) 
	local SS =  CountBodyItem( OwnerID() , 220769 ) 

	local SA =  CountBodyItem( OwnerID() , 220467 ) 
	local SB =  CountBodyItem( OwnerID() , 220346 ) 
	local SC =  CountBodyItem( OwnerID() , 220408 ) 
	local SD =  CountBodyItem( OwnerID() , 210224 ) 

	local Water1 =  CountBodyItem( OwnerID() , 201042 ) 
	local Water2 =  CountBodyItem( OwnerID() , 200663 ) 



	if gift ==1 and SS == 1 and SA == 1 and SB == 1 and SC == 1 and SD == 1 and Water1 == 1 and Water2 == 1 then

		GiveBodyItem( OwnerID()  ,  204393  , 1 )
	end

end




