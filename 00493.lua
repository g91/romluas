function LuaI_110071()
	SetPlot( OwnerID() , "touch" , "LuaQ_110071_CheckItem" , 25 );
	CastSpell( OwnerID(),OwnerID() , 491030 )  -- �X�ͫ����ۤv�W�S���]�k
end

function LuaQ_110071_CheckItem()
	local result = ""

	if CountBodyItem ( OwnerID() , 200895 ) >= 1 then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_05") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- ���������n
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]"  , 0 );
			return
		end
			while 1 do
				sleep( 2 );
				local CastBarStatus = CheckCastBar( OwnerID() );

				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0 ) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				DelBodyItem ( OwnerID() , 200895 , 1 );
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110071_1") , 0 )	-- �A���X�������A���������n�I
				GiveBodyItem ( OwnerID() , 200896 , 1 );
			end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110071_2") , 0 )	-- �A�S���i�H���������n�����~�I
	end
end