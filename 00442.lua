function MagicTools_HP( Durable )
		local Obj = Role:new( OwnerID() )		
		local MaxHP = Obj:MaxHP()
		local HP = Obj:HP();
		local DHP = MaxHP- HP;
		if( MaxHP < HP*2 ) then
			return Durable;
		end
		if( Durable >= DHP ) then
			Obj:SetHP( MaxHP );
			return Durable - DHP;
		else
			Obj:SetHP( HP + Durable )
			return 0;
		end
end

function MagicTools_MP( Durable )
		local Obj = Role:new( OwnerID() )		
		local MaxMP = Obj:MaxMP()
		local MP = Obj:MP();
		local DMP = MaxMP- MP;
		if( MaxMP < MP*2 ) then
			return Durable;
		end
		if( Durable >= DMP ) then
			Obj:SetMP( MaxMP );
			return Durable - DMP;
		else
			Obj:SetMP( MP + Durable )
			return 0;
		end
end

