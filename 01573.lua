function LuaI_205972_0() 
--初始化石碑介面
	ClearBorder( OwnerID())	
--石碑內容
	AddBorderPage( OwnerID(), "[SC_205972_0]")
--石碑標題
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(),0,str , "ScriptBorder_Texture_Paper" )
	BeginPlot(OwnerID() , "LuaQ_GET_543533" , 0 )
end

function LuaI_205973_0() 
--初始化石碑介面
	ClearBorder( OwnerID())	
--石碑內容
	AddBorderPage( OwnerID(), "[SC_205973_0]")
--石碑標題
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 0,str , "ScriptBorder_Texture_Paper" )
end
function LuaI_205969_0() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 422659, 1  ) );
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422659, str , "ScriptBorder_Texture_Paper" );
end
function LuaQ_Complete_422659()
	local Count_A = countBodyItem(  targetID() , 205969 ) 
	local Count_B = countBodyItem(  targetID() , 205972 ) 
	local Count_C = countBodyItem(  targetID() , 205973 ) 
	if Count_A  > 0 then
		DelbodyItem( targetID() , 205969 , Count_A  )
	end
	if Count_B > 0 then
		DelbodyItem( targetID() , 205972 , Count_B  )
	end
	if Count_C > 0 then
		DelbodyItem( targetID() , 205973 , Count_C  )
	end
end

function LuaQ_Accept_422762()
	if CheckFlag( TargetID() , 543533 ) == false then
		BeginPlot( TargetID() , "LuaQ_GET_543533" , 0 )
	end
end
function LuaQ_GET_543533()
	ScriptMessage( OwnerID(), OwnerID(),2 , "[SC_ZONE9_TO_NAGA_GET]" , 0 ) 
	ScriptMessage( OwnerID(), OwnerID(),0 , "[SC_ZONE9_TO_NAGA_GET]" , 0 )
	SetFlag( OwnerID(), 543533 , 1 )
end