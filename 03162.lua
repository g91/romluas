
--/gm ? pcall Lua_Brook_Test
function Lua_Brook_Test()
--	local _brookRole = _brook._role:new( CreateObj(107977,0,0,0,0,1));
--	DebugMsg(0,0,"_brookRole=".._brookRole._hp);
--	_brookRole._hp = 100;
--	DebugMsg(0,0,"_brookRole=".._brookRole._hp);
--	AddBuff( OwnerID() , 502756 , 0 , -1 );
	CancelBuff( OwnerID( ) , 625260 );
end

--/gm ? pcall Lua_Brook_TestTest
function Lua_Brook_TestTest()
	DebugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"123");
	WriteRoleValue( OwnerID() , EM_RoleValue_hp , 1000000 )
end

function Lua_Brook_TestTest_1( _buffID )
	DebugMsg( 0 , 0 , "--Lua_Brook_TestTest_1--  ");
	local _o = OwnerID();
	local _target = TargetID();
	DebugMsg( 0 , 0 , "_o=".._o);
	DebugMsg( 0 , 0 , "_target=".._target);
	DebugMsg( 0 , 0 , "_buffID=".._buffID);
--	AddBuff( _target , _buffID , 0 ,-1 );
	CastSpell( OwnerID(), TargetID(), 851732 );
end

--/gm ? pcall Lua_Brook_TestTest_2
function Lua_Brook_TestTest_2()
--	DelBodyItem( OwnerID(), 547019 , 1 ); 
--	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	DebugMsg( 0 , RoomID , "roomid="..RoomID );
	AddSpeicalCoin( OwnerID() , 12, 12, 10000 );
end


--Nana: 副本稱號的部分要麻煩你幫忙加一下
--Nana: sasa_ZoneDungeon_title_01(530996)  --Z32副本1王 
--sasa_ZoneDungeon_title_01(530997)  --Z32副本尾王 
 
--sasa_ZoneDungeon_title_01(530998 ) --Z33-1 尾王 巨魔之巢 
--sasa_ZoneDungeon_title_01(530999)  --Z33-2 尾王 渡鴉之心

--WriteRoleValue( mumu.guid ,  EM_RoleValue_Register + 1 , 1 );

--model/fx/skill/physical/act_parrymaster_t_hit_point.ros