function LuaS_110990_2()
	local TimeCheck = "CLOSE"
	local Name = GetName( TargetID() ) 
	local String = ""

	if GetSystime( 1 ) == 12 or GetSystime( 1 ) == 20 then
		if GetSystime( 2 ) < 45 then
			TimeCheck = "OPEN"
		else
			TimeCheck = "OVERTIME"
		end
	end
	
	if TimeCheck == "OPEN" then --符合報名時間的敘述
		local NLV = ReadRoleValue( TargetID() , EM_RoleValue_LV)
		local NSC = CountBodyItem(  TargetID() , 200007 )
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		String = "[SAY_110990_3][$SETVAR1="..Name.."]"
--		Say( TargetID(), NLV )                                                 --NLV>= NSC>=
--		Say( TargetID(), "ver2" )
		if  NLV<=14 then
			String = "[SAY_110990_5][$SETVAR1="..Name.."]"
			Say( OwnerID(), String) --您的LV不足
			else     
			if NLV>=46 and  NSC>=12 then
				DelBodyItem( TargetID() , 200007 , 12 )
				CastSpell( OwnerID() , TargetID() ,491959 )
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			elseif  NLV>=41 and  NSC>=10 then
				DelBodyItem( TargetID() , 200007 , 10)
				CastSpell( OwnerID() , TargetID() ,491958 )
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			elseif  NLV>=36 and  NSC>=9 then
				DelBodyItem( TargetID() , 200007 , 9 )
				CastSpell( OwnerID() , TargetID() ,491957)
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			elseif  NLV>=31 and  NSC>=8 then
				DelBodyItem( TargetID() , 200007 , 8 )
				CastSpell( OwnerID() , TargetID() ,491956)
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			elseif  NLV>=26 and  NSC>=7 then
				DelBodyItem( TargetID() , 200007 , 7)
				CastSpell( OwnerID() , TargetID() ,491955)
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			elseif  NLV>=21 and  NSC>=6 then
				DelBodyItem( TargetID() , 200007 , 6 )
				CastSpell( OwnerID() , TargetID() ,491954)
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			elseif  NLV>=15 and  NSC>=5 then
				DelBodyItem( TargetID() , 200007 , 5 )
				CastSpell( OwnerID() , TargetID() ,491224)
				Say( OwnerID() , GetString("SAY_110990_2") )
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
			else
				String = "[SAY_110990_5][$SETVAR1="..Name.."]"
				Say( OwnerID(), String) --您的LV不足
			end
			end

		elseif TimeCheck == "OVERTIME" then --超過報名時間的敘述
			ScriptMessage( TargetID() ,TargetID(), 1, GetString("SAY_110990_0"), 0 );
		else --不在報名時間的敘述
			ScriptMessage( TargetID() ,TargetID(), 1, GetString("SAY_110990_1"), 0 );
	end
	
end