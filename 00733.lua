function LuaQ_421295_BeforeClick()
	SetPlot( OwnerID() , "touch" , "LuaQ_421295_Afterclick" , 50 );
end
function LuaQ_421295_Afterclick()
local n = 0
local resultZ=""
	if CountBodyItem(OwnerID() ,202497 ) >= 40  then
		if BeginCastBar(OwnerID(),GetString("SC_421295_0") ,30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 ) == 1 then
			while 1 do
				n=n+1
				if n>60 then--防無窮迴圈，60=半分鐘
					--ScriptMessage(OwnerID(),OwnerID(),0,"無窮迴圈",0)
					break
				else
					--ScriptMessage(OwnerID(),OwnerID(),0,"合法迴圈",0)
				end
				sleep(2)
				local CastBarStatus=CheckCastBar(OwnerID());
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						resultZ = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						resultZ = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if (resultZ=="OKOK") then
				DelBodyItem(OwnerID(),202497,40)
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421295_1") , 0 )
				local Obj = Role:new( OwnerID() ) 		
				local BaseX = Obj :X()		
			 	local BaseY = Obj :Y();		
			 	local BaseZ = Obj :Z();		
				local BaseDir = Obj:Dir();		
				local NewObjGUID = kk;
			 	kk= CreateObj(100868, BaseX-50, BaseY, BaseZ, BaseDir, 1 )
				local NewObjGUID = kk1;
				kk1= CreateObj(100868, BaseX+30, BaseY, BaseZ-30, BaseDir, 1 )
				local NewObjGUID = kk2;
				kk2= CreateObj(100868, BaseX+30, BaseY, BaseZ+30, BaseDir, 1 )
				AddToPartition( kk, 0 )
				AddToPartition( kk1, 0 )
				AddToPartition( kk2, 0 )
				SetAttack( kk , OwnerID())
				SetAttack( kk1 , OwnerID())
				SetAttack( kk2 , OwnerID())
				sleep(60)
				BeginPlot( kk , "LuaQ_421177_Sui" , 0 )
				BeginPlot( kk1 , "LuaQ_421177_Sui" , 0 )
				BeginPlot( kk2 , "LuaQ_421177_Sui" , 0 )
				SetPlot( kk , "dead" , "Lua_421295_deadlog_1" , 0 )
				SetPlot( kk1 , "dead" , "Lua_421295_deadlog_1" , 0 )
				SetPlot( kk2 , "dead" , "Lua_421295_deadlog_1" , 0 )
			end
		end
	end
end

function Lua_421295_deadlog_1()
	if Countbodyitem(OwnerID(),202500) <= 3 then
		Givebodyitem(OwnerID(),202500,3)
	end
	return true
end


