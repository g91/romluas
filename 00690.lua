function LuaI_110729()
	SetPlot( OwnerID() , "Dead" , "LuaI_110729_Dead" , 0 )
	local Monster = { [1] = 100776 , [2] = 100777 , [3] = 100778 , [4] = 100780 ,[5] = 100748 }
	local range = 200

	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			LuaFunc_MonsterAlert_Script( Monster , range) 	
		end
		sleep( 100 )
	end

end

function LuaI_110729_Dead()
	CastSpell( OwnerID() , OwnerID() , 491002 )
	return true
end

function LuaQ_421042_OnClick()
	if CountBodyItem( OwnerID() , 202216) < 1  then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_421042_0"), 0 )
		SetPlot( TargetID() , "touch" , "" , 0 )
		return -1
	else
		return 1
	end
end

function LuaQ_421042_AfterClick()
	local Count = CountBodyItem( OwnerID(), 202216);

	if( Count >= 1) then
		DelBodyItem( OwnerID() , 202216 , 1 )
		BeginPlot( TargetID(),"LuaQ_421042_OK",0)
  		return 1;
	end
	SetPlot( TargetID() , "touch" , "" , 0 )
	return -1;
end

function LuaQ_421042_OK()
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local random = rand(3) + 1
	local String = { [1] = "EM_421042_1", [2] = "EM_421042_2" ,[3] = "EM_421042_3"  }
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	Say( OwnerID() , GetString(String[random]) )
--	if OrgID == 111069 or OrgID == 111071 then
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_REVIVING )
		sleep( 20 )	
--	end
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	Hide( OwnerID() )
--	Show( OwnerID() , 0 ) 
	LuaFunc_ResetObj( OwnerID() )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

