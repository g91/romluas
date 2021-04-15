function LuaS_112797()

	--if CheckAcceptQuest( OwnerID(), 422261 ) == true or CheckCompleteQuest( OwnerID(), 422261 ) == true then
			SetFlag( OwnerID() , 542976 , 1 )
	--end

	LoadQuestOption( OwnerID() )	--載入任務模板
	if CheckFlag( OwnerID() , 542976 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112797_01]" , "LuaS_112797_Transfer" , 0 )		-- 選項，我想搭乘飛空艇前往[ZONE_VARANAS]
	end

end

function LuaS_112797_Transfer()
	CloseSpeak( OwnerID() )	--關閉對話視窗
	if ChangeZone( OwnerID() , 2 , 0 , 4407, 103 , -3621 , 325 ) then	-- 凡瑞娜絲城
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaS_113398()

	LoadQuestOption( OwnerID() )	--載入任務模板
	if CheckFlag( OwnerID() , 542976 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112797_02]" , "LuaS_113398_Transfer" , 0 )		-- 選項，我想搭乘飛空艇回到[ZONE_ELVEN CITADEL]
	end

end

function LuaS_113398_Transfer()
	CloseSpeak( OwnerID() )	--關閉對話視窗
	if ChangeZone( OwnerID() , 12 , 0 , 28197, 337 , 3430 , 0 ) then	-- 精靈島

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_ElfFlyBoat_0()
	SetPlot( OwnerID() , "collision" , "LuaI_ElfFlyBoat_1" , 0 )
end

function LuaI_ElfFlyBoat_1()
	SetFlag( OwnerID() , 542976 , 1 )
	if ChangeZone( OwnerID() , 2 , 0 , 4407, 103 , -3621 , 325 ) then	-- 凡瑞娜絲城
	else
		ChangeZone( OwnerID() , 12 , 0 , 27916, 334 , 3433 , 100 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end