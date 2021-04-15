function MagicTools_Exp( Eqpos , Durable , Exp , Tp )
		local Obj = Role:new( OwnerID() )
		local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )
--		Say(OwnerID(), MaxDurable)
		if( Durable <= MaxDurable )  then

			return Durable + Exp;
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_EXPFULL"), "0xFFFFF266" )
			return Durable;
		end
end

function MagicTools_Tp( Eqpos , Durable , Exp , Tp )
		local Obj = Role:new( OwnerID() )		
		local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )
--		Say(OwnerID(), MaxDurable)

		if( Durable <= MaxDurable )  then
			return Durable + Tp;
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_TPFULL"), "0xFFFFF266" )
			return Durable;
		end
end

function MagicTools_Exp_Low( Eqpos , Durable , Exp , Tp )
		local Obj = Role:new( OwnerID() )
		local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )
--		Say(OwnerID(), MaxDurable)
		if( Durable <= MaxDurable )  then

			return Durable + (Exp/2);
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_EXPFULL"), "0xFFFFF266" )
			return Durable;
		end
end

function MagicTools_Tp_Low50( Eqpos , Durable , Exp , Tp )
		local Obj = Role:new( OwnerID() )		
		local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )
--		Say(OwnerID(), MaxDurable)

		if( Durable <= MaxDurable )  then
			return Durable + (Tp/2);
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_TPFULL"), "0xFFFFF266" )
			return Durable;
		end
end

function MagicTools_Tp_Low75( Eqpos , Durable , Exp , Tp )
		local Obj = Role:new( OwnerID() )		
		local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )
--		Say(OwnerID(), MaxDurable)

		if( Durable <= MaxDurable )  then
			return Durable + (Tp*3/4);
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_TPFULL"), "0xFFFFF266" )
			return Durable;
		end
end

function MagicTools_Exp_Change( Option , Item )
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Durable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable )
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_MaxDurable )
--	Say(OwnerID(), Durable)
--	Say(OwnerID(), MaxDurable)
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOSPACE]", "0xFFFF0000" )
			return false
		elseif Durable == MaxDurable then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOTFULL]", "0xFFFF0000" )
			return false	
		end
	elseif ( Option == "USE" ) then
		if ( Item ~= nil  ) then
			GiveBodyItem( PlayerID , Item , 1 )
			UseItemDestroy()
		end
	end
end

function MagicTools_Tp_Change( Option , Item)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Durable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable )
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_MaxDurable )
--	Say(OwnerID(), Durable)
--	Say(OwnerID(), MaxDurable)
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOSPACE]", "0xFFFF0000" )
			return false
		elseif Durable == MaxDurable then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOTFULL]", "0xFFFF0000" )
			return false	
		end
	elseif ( Option == "USE" ) then
		if ( Item ~= nil  ) then
			GiveBodyItem( PlayerID , Item , 1 )
			UseItemDestroy()
		end
	end
end

-- 5.0.8 穝糤坝猭腳

--- 胐竒喷猭腳
function MagicTools_PetExp( Eqpos , Durable , Exp , Tp )
	local PlayerID = OwnerID()
	local MaxDurable = GetItemInfo( PlayerID , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )

--	Say(PlayerID, "PetExp - MaxDurable ="..MaxDurable)
--	Say(PlayerID, "PetExp - Durable = "..Durable)
--	Say(PlayerID, "PetExp - EXP = "..Exp)

	if( Durable <= MaxDurable )  then
		return Durable + (Exp*0.1 )   -- à︹竒喷10%
	else
		ScriptMessage( PlayerID, PlayerID, 1, GetString("MAGICTOOL_EXPFULL"), "0xFFFFF266" )
		return Durable;
	end
end

function MagicTools_PetExpChange( Option , Item)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Durable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable )
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_MaxDurable )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOSPACE]", "0xFFFF0000" )
			return false
		elseif Durable == MaxDurable then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOTFULL]", "0xFFFF0000" )
			return false	
		end
	elseif ( Option == "USE" ) then
		if ( Item ~= nil  ) then
			GiveBodyItem( PlayerID , Item , 1 )
			UseItemDestroy()
		end
	end
end
--------------------------------------------

-- 胐菌絤
function MagicTools_PetTp( Eqpos , Durable , Exp , Tp )
	local PlayerID = OwnerID()
	local MaxDurable = GetItemInfo( PlayerID , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )

--	Say(PlayerID, "PetTp - MaxDurable ="..MaxDurable)
--	Say(PlayerID, "PetTp - Durable = "..Durable)
--	Say(PlayerID, "PetTp - tp = "..Tp)

	if( Durable <= MaxDurable )  then
		return Durable + (Tp*0.5)   -- à︹莉眔TP  100%
	else
		ScriptMessage( PlayerID, PlayerID, 1, GetString("MAGICTOOL_EXPFULL"), "0xFFFFF266" )
		return Durable;
	end
end

function MagicTools_PetTpChange( Option , Item)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Durable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable )
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_MaxDurable )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOSPACE]", "0xFFFF0000" )
			return false
		elseif Durable == MaxDurable then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MAGICTOOL_NOTFULL]", "0xFFFF0000" )
			return false	
		end
	elseif ( Option == "USE" ) then
		if ( Item ~= nil  ) then
			GiveBodyItem( PlayerID , Item , 1 )
			UseItemDestroy()
		end
	end
end
--------------------------------------------

-- exp 300% 臔才
function MagicTools_Md_Exp( Eqpos , Durable , Exp , Tp )
	local Obj = Role:new( OwnerID() )
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )

	if( Durable <= MaxDurable )  then
		return Durable + (Exp*3);
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_EXPFULL"), "0xFFFFF266" )
		return Durable;
	end
end

-- exp 500% 臔才
function MagicTools_High_Exp( Eqpos , Durable , Exp , Tp )
	local Obj = Role:new( OwnerID() )
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )

	if( Durable <= MaxDurable )  then
		return Durable + (Exp*5);
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_EXPFULL"), "0xFFFFF266" )
		return Durable;
	end
end

-- tp 300% 臔才
function MagicTools_Md_Tp( Eqpos , Durable , Exp , Tp )
	local Obj = Role:new( OwnerID() )		
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )

	if( Durable <= MaxDurable )  then
		return Durable + (Tp*3);
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_TPFULL"), "0xFFFFF266" )
		return Durable;
	end
end

-- tp 500% 臔才
function MagicTools_High_Tp( Eqpos , Durable , Exp , Tp )
	local Obj = Role:new( OwnerID() )		
	local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )

	if( Durable <= MaxDurable )  then
		return Durable + (Tp*5);
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_TPFULL"), "0xFFFFF266" )
		return Durable;
	end
end

-----------------------