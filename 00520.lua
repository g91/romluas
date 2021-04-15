function LuaS_110581()	--職業管理員

	LoadQuestOption( OwnerID() );  --載入任務模板
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110581_1") , "LuaS_110581_1",0 );	--我想轉換主副職
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110581_2") , "LuaS_110581_2",0 );	--主副職的特性
	end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_110581_1()	--職業管理員
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	-- GiveBodyItem(OwnerID(),540821,1)--給重要物品540821「開啟換職業介面」
	OpenChangeJob()

	end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_110581_2()	--職業管理員

	SetSpeakDetail( OwnerID() , "[ST_CHANGJOB]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_BACK]" , "LuaS_110581" , 0 )		--返回上一頁

end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ChangeJob_Intro()
	SetSpeakDetail( OwnerID(), "[SC_CHANGEJOB_DETAIL]"  )
end
