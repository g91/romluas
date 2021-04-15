function LuaI_110331()
	SetPlot(OwnerID(),"dead","luaI_110331_Dead",40)
end

function LuaI_110331_Dead()
	SetRoleCamp( OwnerID() , "Visitor" )
	local PlayerTeam = HateListCount( OwnerID() )
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		If CountBodyItem( ID,200922) == 0 and CheckCompleteQuest(ID , 420340)== false then
			GiveBodyItem(ID , 200922,1)
		end
	end 

	BeginPlot(OwnerID(),"LuaI_110331_Feel",0)
	return false
end

function LuaI_110331_Feel()
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	Func_rand_walker(OwnerID(),100,50)
	Hide( OwnerID() )
	sleep( 300 )
	SetRoleCamp( OwnerID() , "Monster" )
	Show(OwnerID(),0)
	MoveToFlagEnabled( OwnerID() , true )
end

function LuaI_200928_Use()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420343 ) == true or CheckCompleteQuest( OwnerID() , 420343 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200928_0"), 0 ); --/*任務不符合。		
		return
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID()  then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200928_1"), 0 ); --/*你沒有目標。
	else
		if Target ~= 100430 or ReadRoleValue( TargetID()  ,EM_RoleValue_PID) > 0 then --代用，到時候要置換回狼型塔圖斯的ID
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200928_2"), 0 ); --/*目標錯誤。
		else
			WriteRoleValue(  TargetID()  , EM_RoleValue_PID , 100 )
			BeginPlot( TargetID() ,"LuaI_110331_Change", 0 )
		end
	end
end

function LuaI_110331_Change()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 100 )
	CastSpell( TargetID() , OwnerID() , 492175 )
	SetRoleCamp(OwnerID(),"Visitor")
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL )
	sleep( 30 )
	local Tartos = LuaFunc_CreateObjByObj( 110331 , OwnerID() )
	Hide( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	BeginPlot( Tartos , "LuaI_110331_Reset" , 0)
end

function LuaI_110331_Reset()
	sleep( 300 )
	DisableQuest( OwnerID() , true )
	Func_rand_walker(OwnerID(),100,50)
	Hide( OwnerID() )
	sleep( 300 )
	SetRoleCamp( TargetID() , "Monster" )
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
	Show( TargetID() , 0 )
	DelObj( OwnerID() )
end

function LuaI_200922() --塔圖斯的項鍊
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420340, 1  ) );

	ShowBorder( OwnerID(), 420340, "[200922]", "ScriptBorder_Texture_Paper" );
end

function LuaI_200923() --卡布的清單
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetString("EM_201107") );
	--/*一根麻林木樹枝，可以在傷痕峽谷中找到這種樹木。
	--/*五份阿卡馬勒粉末，那是黑體奔岩蝎毒囊中的結晶。
	--/*一瓶歐蘇勒之水，在歐蘇勒湖底下的神獸口中會湧出這種水。

	ShowBorder( OwnerID(), 0, "[200923]", "ScriptBorder_Texture_Paper" );
end

function LuaI_201107_CHECK() 
	if CheckAcceptQuest( OwnerID() , 420341 ) == true and CountBodyItem( OwnerID() , 200926 ) == 0 then
		local Water = LuaFunc_SearchNPCbyOrgID( OwnerID(), 110855 , 500 , 1)
		if Water[0] == -1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201107_1"), 0 ); 
			return false
		else
			return true
		end
	else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201107_2"), 0 ); 
		return false
	end
end

function LuaI_201107_USE() 

	GiveBodyItem( OwnerID() , 200926 , 1 )
end