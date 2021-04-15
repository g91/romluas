--聯盟使節團的委託
------------------------------------------------------------------------
function William_119526_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE and	 --檢查玩家是否已取得任務424976
		CheckFlag(OwnerID(),545760) == false then --檢查玩家是否已取得任務旗標
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119526_02",0) --增加按鈕								
	end
end
------------------------------------------------------------------------
function William_119526_02()
	SetFlag(OwnerID(),545760,1) --取得重要物品～凡瑞娜絲城的招募進度
	SetSpeakDetail( OwnerID(), "[SC_424976_01]" ) --凡瑞娜絲城的招募進度內容
end
------------------------------------------------------------------------
function William_119527_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE and	 --檢查玩家是否已取得任務424976
		CheckFlag(OwnerID(),545761) == false then --檢查玩家是否已取得任務旗標
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119527_02",0) --增加按鈕								
	end
end
------------------------------------------------------------------------
function William_119527_02()
	SetFlag(OwnerID(),545761,1) --取得重要物品～黑曜石要塞的招募進度
	SetSpeakDetail( OwnerID(), "[SC_424976_02]" ) --黑曜石要塞的招募進度內容
end
------------------------------------------------------------------------
function William_119528_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE  and --檢查玩家是否已取得任務424976
		CheckFlag(OwnerID(),545762) == false then --檢查玩家是否已取得任務旗標
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119528_02",0) --增加按鈕								
	end
end
------------------------------------------------------------------------
function William_119528_02()
	SetFlag(OwnerID(),545762,1) --取得重要物品～達拉尼斯的招募進度
	SetSpeakDetail( OwnerID(), "[SC_424976_03]" ) --達拉尼斯的招募進度內容
end
------------------------------------------------------------------------
function William_119529_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE and --檢查玩家是否已取得任務424976
		CheckFlag(OwnerID(),545763) == false then --檢查玩家是否已取得任務旗標
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119529_02",0) --增加按鈕								
	end
end
------------------------------------------------------------------------
function William_119529_02()
	SetFlag(OwnerID(),545763,1) --取得重要物品～火靴堡壘的招募進度
	SetSpeakDetail( OwnerID(), "[SC_424976_04]" ) --火靴堡壘的招募進度內容
end
------------------------------------------------------------------------
function William_NPC119759()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_05]" ) --只要表現的好～也許有機會成為大人物吶！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119760()
	CallPlot( OwnerID(), "LuaP_Sitting", OwnerID() )
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_06]" ) --放膽去冒險吧～千萬別讓自己有所遺憾呀...。
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119761()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_07]" ) --哈哈～我可是從沒想過要活著回來呀！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119762()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_08]" ) --就算沒有這次招募，我們冒險者遲早也是會去那裡的...。
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119763()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_09]" ) --聽說那裡的敵人可是魔族吶～難到只有我感到不安嗎？
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119764()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_10]" ) --魔族～好久遠的傳說呀～究竟是發生了什麼事呢？
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119765()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_11]" ) --維護世界和平～這種事怎麼可能少的了我呢！
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119766()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_12]" ) --魔族！？我似乎有聽說過吶...。
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119767()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_13]" ) --哼～真想趕快讓他們見識到我的厲害呀！
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119768()
	CallPlot( OwnerID(), "LuaP_Sitting", OwnerID() )
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_14]" ) --巴蘭沙瑟爾大陸～這是我一輩子沒到過的地方呀！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119769()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_15]" ) --這可是讓我們翻身的大好機會吶！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119770()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_16]" ) --什麼魔族我可不懂...我倒是要看看他們究竟是有多大本事！
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119771()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_17]" ) --管他敵人是誰，到時候見人就打準沒錯！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119772()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_18]" ) --所有的英雄們都在會那裏出現...，真令人期待呀！
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119773()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_19]" ) --我們達拉尼斯就要重返榮耀了呀...！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119774()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_20]" ) --我們火靴的榮耀...就要來臨啦！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119775()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_21]" ) --可是這麼一來，我們不就要和那群牛頭一起作戰了...。
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119776()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_22]" ) --和牛頭並肩作戰？那群牛頭怎麼會懂得如何作戰。
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119777()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_23]" ) --哈哈～我那把斧頭終於能派上用場了呀！
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119778()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_24]" ) --聽說世上所有的英雄們都在會那裏吶～！
		end
	sleep(150)
	end
end
------------------------------------------------------------------------