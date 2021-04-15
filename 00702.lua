function LuaQ_421129_Check()	-- 背包的主人
	if CheckCompleteQuest( OwnerID() , 421128 ) == true then
		return true
	else
		return false
	end
end

function LuaQ_421129()	-- 背包的主人
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421129 , 1 ) )
	ShowBorder( OwnerID() , 421129 , "[421129]" , "ScriptBorder_Texture_Paper" )
end

function LuaQ_421134_Check()	-- 謎樣的谷地礦石
	if CheckCompleteQuest( OwnerID() , 421132 ) == true then
		return true
	else
		return false
	end
end

function LuaQ_421134()	-- 謎樣的谷地礦石
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421134 , 1 ) )
	ShowBorder( OwnerID() , 421134 , "[421134]" , "ScriptBorder_Texture_Paper" )
end

function LuaQ_421135_Check()	-- 新手鐵匠的身世
	if CheckCompleteQuest( OwnerID() , 421134 ) == true then
		return true
	else
		return false
	end
end

function LuaQ_421135()	-- 新手鐵匠的身世
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421135 , 1 ) )
	ShowBorder( OwnerID() , 421135 , "[421135]" , "ScriptBorder_Texture_Paper" )
end

function LuaQ_421272()	-- 失蹤人口
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421272, 1 ) )
	ShowBorder( OwnerID() , 421272, "[202430]" , "ScriptBorder_Texture_Paper" )
end

function LuaI_111400()
	SetPlot( OwnerID() , "range" , "LuaS_111400_Range" , 150 )
end

function LuaS_111400_Range()
	if CheckAcceptQuest( OwnerID() , 421126 ) == true and CheckFlag( OwnerID() , 541280 ) == false then
		SetFlag( OwnerID() , 541280 , 1 )
	end
end

function LuaI_111405()
	SetPlot( OwnerID() , "range" , "LuaS_111405_Range" , 100 )
end

function LuaS_111405_Range()
	if CheckAcceptQuest( OwnerID() , 421140 ) == true and CheckFlag( OwnerID() , 541281 ) == false then
		SetFlag( OwnerID() , 541281 , 1 )
	end
end