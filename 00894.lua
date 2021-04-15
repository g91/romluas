--Zone5 -20876.6, 1252.2, 701.9
function LuaS_111413()
	LoadQuestOption(OwnerID())
end

function LuaI_111413()
	SetPlot( OwnerID() , "range" , "LuaS_111413_Range" , 200 )
end

function LuaS_111413_Range()
	--Say( TargetID() , "U r a MAN !!")
	if CheckBuff( OwnerID() , 501851 ) == false and CheckBuff( OwnerID() , 501852 ) == false and CheckBuff( OwnerID() , 501853 ) == false then
		local GoodEvil = ReadRoleValue( OwnerID() , EM_RoleValue_GoodEvil )
		if GoodEvil < -30 and GoodEvil >= -90 then
			--Say( TargetID() , "U r a small evil !!")
			CastSpell( TargetID(), OwnerID(), 491441 )	-- 小惡人懲罰
		elseif  GoodEvil < -90 and GoodEvil >= -150 then
			--Say( TargetID() , "U r a Middle evil !!")
			CastSpell( TargetID(), OwnerID(), 491442 )	-- 中惡人懲罰
		elseif GoodEvil < -150 then
			--Say( TargetID() , "U r a Big evil !!")
			CastSpell( TargetID(), OwnerID(), 491443 )	-- 大惡人懲罰
		else
			--Say( TargetID() , "U r a GM!!")
			--nothing
--WriteRoleValue( OwnerID() , EM_RoleValue_GoodEvil , -40 )
		end
	end

end

function LuaS_111413_ExitHell()
	ChangeZone( OwnerID() , 5 , 0 , -20877 , 1253 , 702 , 90 )
end