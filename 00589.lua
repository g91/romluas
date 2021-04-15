function MagicTools_Tp_High2( Eqpos , Durable , Exp , Tp )
		local Obj = Role:new( OwnerID() )		
		local MaxDurable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , Eqpos , EM_ItemValueType_MaxDurable )
--		Say(OwnerID(), MaxDurable)

		if( Durable <= MaxDurable )  then
			return Durable + (Tp*2);
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MAGICTOOL_TPFULL"), "0xFFFFF266" )
			return Durable;
		end
end