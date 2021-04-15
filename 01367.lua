function LuaS_113353()

	local MaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )
	--WriteRoleValue( OwnerID() , EM_RoleValue_MaxLv , 50 )
	--Say( OwnerID() , MaxLv )
	if MaxLv < 55 then
		LoadQuestOption( OwnerID() )  --載入任務模板
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_113353_01]" , "LuaS_MAXLV_UP_1" , 0 )	-- 好的，請協助我提升我的等級界限。
	else
		SetSpeakDetail( OwnerID() , "[SC_113353_02]" )		-- 你的等級界限已經提升......去吧！我現在還不能夠透漏任何相關的線索，解答需要靠你自己努力去追尋......
	end
end

function LuaS_MAXLV_UP_1()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	CastSpell( TargetID() , OwnerID() , 493800 )
	ScriptMessage( OwnerID(), OwnerID() , 2 , "[SC_113353_03]"  , C_SYSTEM )	-- [113353]分身的力量將你的等級界限提升至 LV55
	ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_113353_03]"  , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxLv , 55 )
	return true
end