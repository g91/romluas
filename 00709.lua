function LuaI_421116_0()
	SetPlot( OwnerID() , "range" , "LuaI_421116_1" ,150 )
end

function LuaI_421116_1()
	if CheckAcceptQuest( OwnerID() , 421116 ) == true and Checkflag( OwnerID(), 541298) == false and Checkflag( OwnerID(), 541289) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421116_0") , 0 )	--石灰粉應該就是灑在這附近
		SetFlag( OwnerID() , 541298 , 1)
	elseif CheckAcceptQuest( OwnerID() , 421117 ) == true and Checkflag( OwnerID(), 541303) == false  and Checkflag( OwnerID(), 541290) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421117_0") , 0 )	--防護水晶應該是用在這裡吧
		SetFlag( OwnerID() , 541303 , 1)
	end

end

function LuaI_421116_2()
	BeginPlot( OwnerID() , "LuaI_421116_2A" , 0 )
end
function LuaI_421116_2A()
	local resultZ
	if CheckAcceptQuest( OwnerID() , 421116 ) ==  true and Checkflag( OwnerID(), 541298) == true then
		if BeginCastBar( OwnerID(), GetString("SC_421116") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 )~= 1 then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while 1 do
			sleep( 2 );
			local CastBarStatus = CheckCastBar( OwnerID() );
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
		if ( resultZ == "OKOK" ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421116_1") , 0 )	--你再收容所周圍灑下了石灰粉！！！
			SetFlag( OwnerID()  , 541298 , 0 );--刪除旗標
			SetFlag( OwnerID() , 541289 , 1)
		end
	end
end
--/*==========================================================================================
-----------------收容所中央初始劇情
function LuaI_421117_2()
	BeginPlot( OwnerID() , "LuaI_421117_2A" , 0 )
end
function LuaI_421117_2A()
	local resultZ
	if CheckAcceptQuest( OwnerID() , 421117 ) ==  true and Checkflag( OwnerID(), 541303) == true then
		if BeginCastBar( OwnerID(), GetString("SC_421117") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while 1 do
			sleep( 2 );
			local CastBarStatus = CheckCastBar( OwnerID() );
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
		if ( resultZ == "OKOK" ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421117_1") , 0 )	--你在收容所附近啟動了魔法屏障
			SetFlag( OwnerID()  , 541303 , 0 );--刪除旗標
			SetFlag( OwnerID() , 541290 , 1)
		end
	end
end