function LuaS_101500_Drunk()
	CallPlot( OwnerID() , "LuaS_101500_Drink" , TargetID() )
	return false
end
function LuaS_101500_Drink( Target )

	local Owner = OwnerID()
	local Monster = LuaFunc_SearchNPCbyOrgID( Owner , 101500 , 75 )	--Say( Monster , GetName(Monster) )

	CastSpell( Owner , Owner , 492365 )
	ScriptMessage( Owner , Target , 1 , "[SC_101500_03]" , C_SYSTEM )	-- �A�D��@�����s���I�I

	if CheckBuff( Monster , 502618 ) == true then
		CancelBuff( Monster , 502618 )
		Sleep( 10 )
		CastSpell( Target , Monster , 492365 )
		Say( Monster , "[SC_101500_01]" )		-- ���u�O�n�s�ڡI�I
		Sleep( 5 )
		ScriptMessage( Owner , -1 , 1 , "[SC_101500_02]" , C_SYSTEM )	-- �s���X���s�������N���������q����F�u�ۯ��g�I�I
	end

	Sleep( 20 )
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	Hide( Owner )
	Sleep( 280 )
	Show( Owner , RoomID )

end

function Lua_101500_Skill_Trap()	-- ����
	--ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_02]" , 1 )	-- �`�N�I���������N�b�A���}�U�I�I
	--local Obj = Role:new( TargetID() )

	--local BaseX = Obj :X()
 	--local BaseY = Obj :Y();
 	--local BaseZ = Obj :Z();
	--local BaseDir = Obj:Dir();
	--local BaseRoom = Obj:RoomID()

	--local Trap = CreateObj( 112046 , BaseX, BaseY, BaseZ , 0 , 1 )		-- ��보��
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