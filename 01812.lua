--==========================================--
-- 夏多爾									--
--==========================================--

--佳布麗‧葉兒   香水商人 115027

function Lua_115027_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115027_010]","Lua_115027_1",0) --詢問她賣的香水
end

function Lua_115027_1()
	SetSpeakDetail(OwnerID(),"[SC_115027_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115027_020]","Lua_115027_2",0)--詢問香水的細節
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115027_0",0) --回上一頁
end

function Lua_115027_2()
	SetSpeakDetail(OwnerID(),"[SC_115027_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115027_030]","Lua_115027_3",0)--詢問卻普瑞谷地
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115027_1",0) --回上一頁
end

function Lua_115027_3()
	SetSpeakDetail(OwnerID(),"[SC_115027_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115027_2",0) --回上一頁
end

-----------------------------------------------------------------------------------------
--喬治‧威登 高級皮件商人 115028

function Lua_115028_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115028_010]","Lua_115028_1",0) --詢問他賣的皮件
end

function Lua_115028_1()
	SetSpeakDetail(OwnerID(),"[SC_115028_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115028_020]","Lua_115028_2",0)--詢問渣尼亞斯
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115028_0",0) --回上一頁
end

function Lua_115028_2()
	SetSpeakDetail(OwnerID(),"[SC_115028_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115028_040]","Lua_115028_4",0)--詢問卻普瑞谷地
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115028_1",0) --回上一頁
end

function Lua_115028_3()
	SetSpeakDetail(OwnerID(),"[SC_115028_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115028_2",0) --回上一頁
end

function Lua_115028_4()
	SetSpeakDetail(OwnerID(),"[SC_115028_041]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115028_2",0) --回上一頁
end

------------------------------------------------------------------------------------------
--沙林 毒藥商人 115036

function Lua_115036_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115036_010]","Lua_115036_1",0) --詢問他賣的毒藥
end

function Lua_115036_1()
	SetSpeakDetail(OwnerID(),"[SC_115036_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115036_020]","Lua_115036_2",0)--詢問酸液毒藥
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115036_0",0) --回上一頁
end

function Lua_115036_2()
	SetSpeakDetail(OwnerID(),"[SC_115036_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115036_030]","Lua_115036_3",0)--詢問毒牙腐蟲
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115036_1",0) --回上一頁
end

function Lua_115036_3()
	SetSpeakDetail(OwnerID(),"[SC_115036_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115036_040]","Lua_115036_4",0)--詢問卻普瑞谷地
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115036_2",0) --回上一頁
end

function Lua_115036_4()
	SetSpeakDetail(OwnerID(),"[SC_115036_041]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115036_3",0) --回上一頁
end

------------------------------------------------------------------------------------------

--==========================================--
-- 卡雅村									--
--==========================================--
------------------------------------------------------------------------------------------
--洛格斯 木材商人 115037

function Lua_115037_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115037_010]","Lua_115037_1",0) --詢問原因
end

function Lua_115037_1()
	SetSpeakDetail(OwnerID(),"[SC_115037_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115037_020]","Lua_115037_2",0)--詢問雷安卡獸人
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115037_0",0) --回上一頁
end

function Lua_115037_2()
	SetSpeakDetail(OwnerID(),"[SC_115037_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115037_1",0) --回上一頁
end

------------------------------------------------------------------------------------------
--布克利 民兵隊長 115038

function Lua_115038_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_010]","Lua_115038_1",0) --詢問發生什麼事
end

function Lua_115038_1()
	SetSpeakDetail(OwnerID(),"[SC_115038_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_020]","Lua_115038_2",0)--如何協助你
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115038_0",0) --回上一頁
end

function Lua_115038_2()
	SetSpeakDetail(OwnerID(),"[SC_115038_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_030]","Lua_115038_3",0)--詢問灰煙林地
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115038_1",0) --回上一頁
end

function Lua_115038_3()
	SetSpeakDetail(OwnerID(),"[SC_115038_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115038_2",0) --回上一頁
end

------------------------------------------------------------------------------------------
--艾格尼絲‧博亞丘 糧秣管理員 115039

function Lua_115039_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_010]","Lua_115039_1",0) --詢問糧食不足的原因
end

function Lua_115039_1()
	SetSpeakDetail(OwnerID(),"[SC_115039_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_020]","Lua_115039_2",0)--詢問卡雅村的日常食物
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115039_0",0) --回上一頁
end

function Lua_115039_2()
	SetSpeakDetail(OwnerID(),"[SC_115039_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_030]","Lua_115039_3",0)--詢問卡多芋
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_040]","Lua_115039_4",0)--詢問剎牙
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_050]","Lua_115039_5",0)--詢問蘆魚
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_060]","Lua_115039_6",0)--詢問白芝
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115039_1",0) --回上一頁
end

function Lua_115039_3()
	SetSpeakDetail(OwnerID(),"[SC_115039_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_040]","Lua_115039_4",0)--詢問剎牙
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_050]","Lua_115039_5",0)--詢問蘆魚
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_060]","Lua_115039_6",0)--詢問白芝
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115039_2",0) --回上一頁
end

function Lua_115039_4()
	SetSpeakDetail(OwnerID(),"[SC_115039_041]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_030]","Lua_115039_3",0)--詢問卡多芋
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_050]","Lua_115039_5",0)--詢問蘆魚
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_060]","Lua_115039_6",0)--詢問白芝
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115039_2",0) --回上一頁
end

function Lua_115039_5()
	SetSpeakDetail(OwnerID(),"[SC_115039_051]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_030]","Lua_115039_3",0)--詢問卡多芋
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_040]","Lua_115039_4",0)--詢問剎牙
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_060]","Lua_115039_6",0)--詢問白芝
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115039_2",0) --回上一頁
end

function Lua_115039_6()
	SetSpeakDetail(OwnerID(),"[SC_115039_061]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_040]","Lua_115039_3",0)--詢問卡多芋
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_050]","Lua_115039_4",0)--詢問剎牙
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115039_060]","Lua_115039_5",0)--詢問蘆魚
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115039_2",0) --回上一頁
end

------------------------------------------------------------------------------------------

--==========================================--
-- 阿利馬墓穴								--
--==========================================--
------------------------------------------------------------------------------------------
--安提 古董商人 115040

function Lua_115040_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115040_010]","Lua_115040_1",0) --詢問金幣的事情
end

function Lua_115040_1()
	SetSpeakDetail(OwnerID(),"[SC_115040_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115040_020]","Lua_115040_2",0)--詢問阿利馬‧煞金
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115040_0",0) --回上一頁
end

function Lua_115040_2()
	SetSpeakDetail(OwnerID(),"[SC_115040_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115040_030]","Lua_115040_3",0)--詢問阿利馬墓穴
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115040_1",0) --回上一頁
end

function Lua_115040_3()
	SetSpeakDetail(OwnerID(),"[SC_115040_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115040_2",0) --回上一頁
end

------------------------------------------------------------------------------------------
--妮可‧奧利維亞 艾力克研究團 115041

function Lua_115041_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115041_010]","Lua_115041_1",0) --詢問為什麼在這
end

function Lua_115041_1()
	SetSpeakDetail(OwnerID(),"[SC_115041_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115041_020]","Lua_115041_2",0)--詢問阿利馬墓穴
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115041_0",0) --回上一頁
end

function Lua_115041_2()
	SetSpeakDetail(OwnerID(),"[SC_115041_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115041_1",0) --回上一頁
end

------------------------------------------------------------------------------------------
--==========================================--
-- 瓦納多肯碉堡								--
--==========================================--
------------------------------------------------------------------------------------------
--落魄的湯姆  瓦納多肯的難民  115042

function Lua_115042_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115042_010]","Lua_115042_1",0) --詢問這裡發生了什麼事
end

function Lua_115042_1()
	SetSpeakDetail(OwnerID(),"[SC_115042_011]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115042_020]","Lua_115042_2",0)--詢問為什麼在這
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115042_0",0) --回上一頁
end

function Lua_115042_2()
	SetSpeakDetail(OwnerID(),"[SC_115042_021]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115042_030]","Lua_115042_3",0)--詢問瓦納多肯碉堡
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115042_1",0) --回上一頁
end

function Lua_115042_3()
	SetSpeakDetail(OwnerID(),"[SC_115042_031]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]", "Lua_115042_2",0) --回上一頁
end

------------------------------------------------------------------------------------------



