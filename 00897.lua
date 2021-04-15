function LuaS_111367_MagicBoxEx()		--魔幻寶盒能量兌換

	--LoadQuestOption( OwnerID() )	--載入任務模板
	SetSpeakDetail( OwnerID() , GetString("SC_MAGICBOXEX_07") )
	
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_02") , "LuaS_111367_MagicBoxEx_1" , 0 )	-- 選項，以 3 枚代幣兌換 1 點魔幻寶盒能量
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_03") , "LuaS_111367_MagicBoxEx_2" , 0 )	-- 選項，以 15 枚代幣兌換 5 點魔幻寶盒能量
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_04") , "LuaS_111367_MagicBoxEx_3" , 0 )	-- 選項，以 30 枚代幣兌換 10 點魔幻寶盒能量
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_THEMONEY_SHOP]" , "LuaS_ComShop_1", 0 ); 

end

function LuaS_111367_MagicBoxEx_1()
	CloseSpeak( OwnerID() )

	if DelBodyItem( OwnerID() , 203038 , 3 ) then		-- 必爾汀代幣
		local MessageString = ReplaceString( GetString("SC_MAGICBOXEX_05") , "Point" , "1" )	
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )	-- 你的魔幻寶盒能量增加了 Point 點！！ 
		AddRoleValue( OwnerID() , EM_RoleValue_BoxEnergy , 1 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_MAGICBOXEX_06") , C_DEFAULT )	-- 無法兌換，你沒有足夠的必爾汀代幣！！
	end
end

function LuaS_111367_MagicBoxEx_2()
	CloseSpeak( OwnerID() )

	if DelBodyItem( OwnerID() , 203038 , 15 ) then		-- 必爾汀代幣
		local MessageString = ReplaceString( GetString("SC_MAGICBOXEX_05") , "Point" , "5" )	
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )	-- 你的魔幻寶盒能量增加了 Point 點！！ 
		AddRoleValue( OwnerID() , EM_RoleValue_BoxEnergy , 5 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_MAGICBOXEX_06") , C_DEFAULT )	-- 無法兌換，你沒有足夠的必爾汀代幣！！
	end
end

function LuaS_111367_MagicBoxEx_3()
	CloseSpeak( OwnerID() )

	if DelBodyItem( OwnerID() , 203038 , 30 ) then		-- 必爾汀代幣
		local MessageString = ReplaceString( GetString("SC_MAGICBOXEX_05") , "Point" , "10" )	
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )	-- 你的魔幻寶盒能量增加了 Point 點！！ 
		AddRoleValue( OwnerID() , EM_RoleValue_BoxEnergy , 10 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_MAGICBOXEX_06") , C_DEFAULT )	-- 無法兌換，你沒有足夠的必爾汀代幣！！
	end
end