function LuaS_110195_0()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest(OwnerID(),420041) == true then
		if CountBodyItem(OwnerID(),200066) >= 1 then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_1" ), "LuaS_110195_1", 0 ) --/*試著開啟寶箱
		else
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_1" ), "LuaS_110195_2", 0 ) --/*試著開啟寶箱
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_0") , "LuaS_110195_EXIT", 0 ); --/*結束對話	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110195_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110195_1")   );
	--/*你打開了鎖，箱子裡面是個奇怪的裝置。
	--/*裝置上有個標記與那枚賢者之眼的戒指相同，這可能也是賢者之眼的東西吧！
	--/*你應該將這個東西拿回去給穆沙，說不定這對案情能有所幫助。
	if CountBodyItem(OwnerID(),200066) >= 1 then
		DelBodyItem( OwnerID() , 200066 , 1 )
		GiveBodyItem( OwnerID(),200035,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_0") , "LuaS_110195_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110195_2()

	SetSpeakDetail( OwnerID(),GetString("ST_110195_2")   );
	--/*你無法用力量或魔法破壞這個鎖，如果破壞箱子的話，裡面的東西可能也會一起被破壞掉。
	--/*看來還是必須去找這個鎖的鑰匙才行。
	--/*鑰匙很可能就在附近某個索雷爾頓門徒身上吧！
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_0") , "LuaS_110195_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110195_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end