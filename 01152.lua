function LuaS_101500_Drunk()
	CallPlot( OwnerID() , "LuaS_101500_Drink" , TargetID() )
	return false
end
function LuaS_101500_Drink( Target )

	local Owner = OwnerID()
	local Monster = LuaFunc_SearchNPCbyOrgID( Owner , 101500 , 75 )	--Say( Monster , GetName(Monster) )

	CastSpell( Owner , Owner , 492365 )
	ScriptMessage( Owner , Target , 1 , "[SC_101500_03]" , C_SYSTEM )	-- 你聞到濃郁的酒香！！

	if CheckBuff( Monster , 502618 ) == true then
		CancelBuff( Monster , 502618 )
		Sleep( 10 )
		CastSpell( Target , Monster , 492365 )
		Say( Monster , "[SC_101500_01]" )		-- 喔～真是好酒啊！！
		Sleep( 5 )
		ScriptMessage( Owner , -1 , 1 , "[SC_101500_02]" , C_SYSTEM )	-- 酒桶溢出的酒香讓藝術之神的僕從停止了吟唱神讚！！
	end

	Sleep( 20 )
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	Hide( Owner )
	Sleep( 280 )
	Show( Owner , RoomID )

end

function Lua_101500_Skill_Trap()	-- 陷阱
	--ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_02]" , 1 )	-- 注意！陷阱往往就在你的腳下！！
	--local Obj = Role:new( TargetID() )

	--local BaseX = Obj :X()
 	--local BaseY = Obj :Y();
 	--local BaseZ = Obj :Z();
	--local BaseDir = Obj:Dir();
	--local BaseRoom = Obj:RoomID()

	--local Trap = CreateObj( 112046 , BaseX, BaseY, BaseZ , 0 , 1 )		-- 突刺陷阱
	--SetModeEx( Trap , EM_SetModeType_Mark, false) 
	--SetModeEx( Trap , EM_SetModeType_HideName, false) 
	--SetModeEx( Trap, EM_SetModeType_ShowRoleHead, false) 
	--SetModeEx( Trap, EM_SetModeType_Strikback, false) 
	--SetModeEx( Trap, EM_SetModeType_Move, false) 
	--AddtoPartition( Trap , BaseRoom)

	--BeginPlot( Trap , "Lua_101431_TrapLifeTime" , 0 )
end

function Lua_101500_TrapLifeTime()
	for i = 1, 30 do
		Sleep( 10 )
		CastSpell( OwnerID() , OwnerID() , 492316 )
	end
	if CheckID( OwnerID() ) then	DelObj( OwnerID() )	end
end