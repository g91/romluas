-----------------------------------------------------------------蠍殼拼圖----------------------------------------------------
function LuaQ_420549_CHECK1()

	if CountBodyItem(OwnerID(),200718) > 0 and CountBodyItem(OwnerID(),200719) > 0 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("EM_420549_1"), 0 );	--/*缺少所需物件。	
		return false
	end
end
function LuaQ_420549_CHECK2()

	if CountBodyItem(OwnerID(),200717) > 0 and CountBodyItem(OwnerID(),200719) > 0 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("EM_420549_1"), 0 );	--/*缺少所需物件。	
		return false
	end
end
function LuaQ_420549_CHECK3()

	if CountBodyItem(OwnerID(),200717) > 0 and CountBodyItem(OwnerID(),200718) > 0  then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("EM_420549_1"), 0 );	--/*缺少所需物件。	
		return false
	end
end

function LuaQ_420549_Item()

	DelBodyItem( OwnerID() ,200717 , 1 )
	DelBodyItem( OwnerID() ,200718 , 1 )
	DelBodyItem( OwnerID() ,200719 , 1 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420549_0"), 0 ); --/*你將蠍殼拼在一起。
	GiveBodyItem(OwnerID() ,200722 , 1 )

end
--------------------------------------------------------------阿爾弗雷德-----------------------------------------------------

function LuaI_100225()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "Range" , "LuaI_100225_range" , 150 )
end

function LuaI_100225_range()
	BeginPlot( TargetID() , "LuaI_100225_Esc" , 0 )
end

function LuaI_100225_Esc()
	ScriptMessage( OwnerID(), 0, 1, GetString("EM_100225_0"), 0 ); --/*阿爾弗雷德發現人類氣息，瞬間消失在空氣之中。
	local Point = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Point = Point + 1 + rand(2)
	if Point > 4  then
		Point = Point - 5
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Point )	
	SetPosByFlag( OwnerID() , 780045, Point )
end
--------------------------------------------------------------迪戈爾的召喚--------------------------------------------------
function LuaI_200700_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420169 ) == false or CheckCompleteQuest( OwnerID() , 420169 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_0"), 0 ); --/*你目前用不到這個符印。
		return false
	elseif CheckFlag( OwnerID() , 540790 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_1"), 0 ); --/*你看了符印一眼，確認阿爾弗雷德還囚禁在其中。
		return false
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_2"), 0 ); --/*你沒有目標。
		return false
	else
		if Target ~= 100225  then 
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_3"), 0 ); --/*符印只對阿爾弗雷德有作用。
			return false	
		else
			return true
		end
	end
end

function LuaC_200700_Effect()
	if CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_4"), 0 ); --/*看來阿爾弗雷德成功逃走了！		
	else
		BeginPlot(TargetID() , "LuaI_200700_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_5"), 0 ); --/*阿爾弗雷德迅速縮小，並被吸入符印裡面！
		SetFlag(OwnerID() ,540790 , 1 )	
	end
end
function LuaI_200700_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end
--------------------------------------------------------------守衛營地-----------------------------------------------------------------
function LuaS_200751_0() --魔怪之心

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420576, 1  ) );

	ShowBorder( OwnerID(), 420576, "[200751]", "ScriptBorder_Texture_Paper" );	

end
--------------------------------------------------------------治療-----------------------------------------------------------------
function LuaQ_420245_BeginClick() 

	if CountBodyItem( OwnerID() , 200706 ) > 0 then
		return 1
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420245_0"), 0 ); --/*缺少希曼調配的藥劑。`
		return -1
	end	

end

function LuaQ_420245_AfterClick() 

	if DelBodyItem( OwnerID() , 200706 , 1)  then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420245_1"), 0 ); --/*你深深吸了幾口蒸餾器中飄散出來的氣體。
		return 1
	else
		return -1
	end	

end
----------------------------------------------------------
