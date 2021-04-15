
--關係系統npc
function lua_mika_relationshop01() -- 掛在npc初始對話劇情
	SetSpeakDetail( OwnerID(), "[SC_RELATION_NPC01]" ) -- 想要與朋友建立更親密的關係嗎？...
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_01]" , "lua_mika_relationintro_01" , 0 )  --關係系統介紹
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_NPC02]" , "lua_mika_relationshop02" , 0 )
end

function lua_mika_relationshop02()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	OpenShop()
end

function lua_mika_relationshopset() --掛在npc物件產生劇情
	SetMinimapIcon( OwnerID(), EM_MapIconType_Shop )
	SetShop( OwnerID() , 600225 , "Test_Shop_Close" )
end

--關係系統介紹
function lua_mika_relationintro_01()
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_01_1]" ) -- 關係的類型包括:摯友、親人、情人、師徒、夫妻等。
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_02]" , "lua_mika_relationintro_02" , 0 )  --如何和玩家成立特殊關係？
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_03]" , "lua_mika_relationintro_03" , 0 )  --如何和玩家成立夫妻關係？
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_04]" , "lua_mika_relationintro_04" , 0 )  --如何提升關係等級？
end

function lua_mika_relationintro_02()  --如何和玩家成立特殊關係？
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_02_1]" ) -- (1) 請先找好想要與你成立關係的對象，並決定成立關係的類型。...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --回到上一層
end

function lua_mika_relationintro_03()  --如何和玩家成立夫妻關係？
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_03_1]" ) -- (1) 請先找好想要與你成立夫妻關係的對象。...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_34]" , " lua_mika_relationintro_03_2", 0 ) --下一頁
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --回到上一層
end

function lua_mika_relationintro_03_2()  --如何和玩家成立夫妻關係？
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_03_2]" ) -- (4) 滿足上述條件後，請組成兩人隊伍找婚姻管理員辦理申請結婚。...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --回到上一層
end

function lua_mika_relationintro_04()  --如何提升關係等級？
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_04_1]" ) -- 與有關係的玩家組隊打怪時會增加關係經驗...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --回到上一層
end