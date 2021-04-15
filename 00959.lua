function LuaS_111509()

	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111509_01") , "Out_South_Gate" , 0 )	-- 選項，我要通過南方屏障

end

function Out_South_Gate()

	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV ) >= 15 then
		SetPos( OwnerID() , -28089 , -370 , -773 , 330 )
	else
		Say( TargetID() , GetString("SC_111509_02") )	-- 對不起，你的職業等級尚未到達 20 級，為了你的安全，我們不會讓你通過這道門。
	end

end

function LuaS_111510()

	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111510_01") , "In_South_Gate" , 0 )	-- 選項，我要進入南方屏障

end

function In_South_Gate()

	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	SetPos( OwnerID() , -28263 , -358 , -662 , 160 )
end