function Lua_hao_PlantLimitlv1()

	local SkillLV = ReadRoleValue(OwnerID(), EM_SkillValueType_Plant )
	local lvA = 0
	local lvB = 20			--/*矪砞﹚ㄏノ程蔼单
--	local lvC = 40			--/*矪砞﹚ㄏノぃ单

	if ( SkillLV <= lvB and SkillLV > lvA ) then					--/*耞单
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("Good Well") , 0 )	--/*Θㄏノ臸猭拈礍珇
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("Good Well") , 0 )	--/*Θㄏノ臸猭拈礍珇
	else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("Ur plantLv can't use this item") , 0 )	--/*贺从单礚猭ㄏノ珇
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("Ur plantLv can't use this item") , 0 )	--/*贺从单礚猭ㄏノ珇
	end
	
end

function Lua_Hao_Plant_SeasonIII_Test()

	Say( OwnerID() , "IamOwner" )
	Say( TargetID() , "IamTarget" )
	
	local Random = Rand(100)+1

	if Random <= 100 then
		Say( OwnerID() , "1" )
		Say( TargetID() , "2" )
		GiveBodyItem( OwnerID() , 209373 , 1 )
	end
end