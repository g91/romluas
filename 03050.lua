------
------27PE設定
------
function Lua_ZonePE_Z27_Set()--設定(每個區域變更)
	Lua_ZonePE_Z27_Global()--變數宣告(每個區域變更)
	Lua_ZonePE_3th_PESet()--PE設定(永久不變)
end

function Lua_ZonePE_Z27_Global()--變數宣告(每個區域變更)
	ZonePE_3th_Global = {}--(勿變更)
	ZonePE_3th_BonusTop = {}--排行榜(勿變更)
	ZonePE_3th_JoinList = {}--參加名單(勿變更)
	local Global = ZonePE_3th_Global--勿變更
	
	Global["MapID"] = 10027--地圖ID
	Global["MaxScore"] = 6000--成功總分
	Global["ExCha_Ratio"] = 100 --兌換比率
	Global["ExCha_Max"] = 10--兌換上限
	Global["ItemID"] = EM_RoleValue_EnergyJusticeCoin--代幣
	
	Global["ExBonus"] = {}--額外獎勵
	Global["ExBonus"][1]=25
	Global["ExBonus"][2]=20
	Global["ExBonus"][3]=15
	Global["ExBonus"][4]=10 
	Global["ExBonus"][5]=5 -- 5~10
	
	Global["Shop"] = {}
	Global["Shop"][1] = 600492	--高級商店
	Global["Shop"][2] = 600493	--中級物防商店
	Global["Shop"][3] = 600494	--中級命中商店
	Global["Shop"][4] = 600495	--高級商店(參觀
	Global["Shop"][5] = 600496	--中級物防商店(參觀
	Global["Shop"][6] = 600497	--中級命中商店(參觀
	
	Global["PE_Name"] = "SC_Z27_EVENT_NAME"--PE名稱
	Global["PE_Desc"] = "SC_Z27_EVENT_NAMEDES"--PE描述
	Global["PH_Name"] = {}--階段名稱
	Global["PH_Name"][1] = "SC_Z27_EVENT_RESET"	-- 等待階段
	Global["PH_Name"][2] = "SC_Z27_EVENT_STATE"	-- 進行階段
	
	Global["PH_Desc"] = {}--階段描述
	Global["PH_Desc"][1] = "SC_Z27_EVENT_RESET_DESC"-- 等待描述
	Global["PH_Desc"][2] = "SC_Z27_EVENT_STATE_DESC"-- 進行描述
	
	Global["OB_Name"] = "SC_Z27_EVENT_CON"--進行階段成功條件
	Global["OB_Desc"] = "SC_Z27_EVENT_CONDESC"--進行階段成功條件描述

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--區域事件現在開始！
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--區域事件沒有完成！
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--區域事件已被完成！
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--本次區域事件中，你貢獻的積分為[$VAR1]分，排名第[$VAR2]。
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--這些冒險者的名字將會紀錄在[SC_ZONE_PE_SELLS]的本子裡，作為冒險著們效法的目標。
end

function Lua_ZonePE_Z28_Set()--設定(每個區域變更)
	Lua_ZonePE_Z28_Global()--變數宣告(每個區域變更)
	Lua_ZonePE_3th_PESet()--PE設定(永久不變)
end

------
------28PE設定
------
function Lua_ZonePE_Z28_Global()--變數宣告(每個區域變更)
	ZonePE_3th_Global = {}--(勿變更)
	ZonePE_3th_BonusTop = {}--排行榜(勿變更)
	ZonePE_3th_JoinList = {}--參加名單(勿變更)
	local Global = ZonePE_3th_Global--勿變更
	
	Global["MapID"] = 10028--地圖ID
	Global["MaxScore"] = 6000--成功總分
	Global["ExCha_Ratio"] = 100 --兌換比率
	Global["ExCha_Max"] = 10--兌換上限
	Global["ItemID"] = EM_RoleValue_EnergyJusticeCoin--代幣
	
	Global["ExBonus"] = {}--額外獎勵
	Global["ExBonus"][1]=25
	Global["ExBonus"][2]=20
	Global["ExBonus"][3]=15
	Global["ExBonus"][4]=10 
	Global["ExBonus"][5]=5 -- 5~10
	
	Global["Shop"] = {}
	Global["Shop"][1] = 600501	--高級商店
	Global["Shop"][2] = 600502	--中級物防商店
	Global["Shop"][3] = 600503	--中級命中商店
	Global["Shop"][4] = 600504	--高級商店(參觀
	Global["Shop"][5] = 600505	--中級物防商店(參觀
	Global["Shop"][6] = 600506	--中級命中商店(參觀
	
	Global["PE_Name"] = "SC_Z28_EVENT_NAME"--PE名稱
	Global["PE_Desc"] = "SC_Z28_EVENT_NAMEDES"--PE描述
	Global["PH_Name"] = {}--階段名稱
	Global["PH_Name"][1] = "SC_Z28_EVENT_RESET"	-- 等待階段
	Global["PH_Name"][2] = "SC_Z28_EVENT_STATE"	-- 進行階段
	
	Global["PH_Desc"] = {}--階段描述
	Global["PH_Desc"][1] = "SC_Z28_EVENT_RESET_DESC"-- 等待描述
	Global["PH_Desc"][2] = "SC_Z28_EVENT_STATE_DESC"-- 進行描述
	
	Global["OB_Name"] = "SC_Z28_EVENT_CON"--進行階段成功條件
	Global["OB_Desc"] = "SC_Z28_EVENT_CONDESC"--進行階段成功條件描述

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--區域事件現在開始！
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--區域事件沒有完成！
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--區域事件已被完成！
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--本次區域事件中，你貢獻的積分為[$VAR1]分，排名第[$VAR2]。
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--這些冒險者的名字將會紀錄在[SC_ZONE_PE_SELLS]的本子裡，作為冒險著們效法的目標。
end

------
------29PE設定
------
function Lua_ZonePE_Z29_Set()--設定(每個區域變更)
	Lua_ZonePE_Z29_Global()--變數宣告(每個區域變更)
	Lua_ZonePE_3th_PESet()--PE設定(永久不變)
end

function Lua_ZonePE_Z29_Global()--變數宣告(每個區域變更)
	ZonePE_3th_Global = {}--(勿變更)
	ZonePE_3th_BonusTop = {}--排行榜(勿變更)
	ZonePE_3th_JoinList = {}--參加名單(勿變更)
	local Global = ZonePE_3th_Global--勿變更
	
	Global["MapID"] = 10029--地圖ID
	Global["MaxScore"] = 6000--成功總分
	Global["ExCha_Ratio"] = 100 --兌換比率
	Global["ExCha_Max"] = 10--兌換上限
	Global["ItemID"] = EM_RoleValue_EnergyJusticeCoin--代幣
	
	Global["ExBonus"] = {}--額外獎勵
	Global["ExBonus"][1]=25
	Global["ExBonus"][2]=20
	Global["ExBonus"][3]=15
	Global["ExBonus"][4]=10 
	Global["ExBonus"][5]=5 -- 5~10
	
	Global["Shop"] = {}
	Global["Shop"][1] = 600514	--高級商店
	Global["Shop"][2] = 600515	--中級物防商店
	Global["Shop"][3] = 600516	--中級命中商店
	Global["Shop"][4] = 600517	--高級商店(參觀
	Global["Shop"][5] = 600518	--中級物防商店(參觀
	Global["Shop"][6] = 600519	--中級命中商店(參觀
	
	Global["PE_Name"] = "SC_Z29_EVENT_NAME"--PE名稱
	Global["PE_Desc"] = "SC_Z29_EVENT_NAMEDES"--PE描述
	Global["PH_Name"] = {}--階段名稱
	Global["PH_Name"][1] = "SC_Z29_EVENT_RESET"	-- 等待階段
	Global["PH_Name"][2] = "SC_Z29_EVENT_STATE"	-- 進行階段
	
	Global["PH_Desc"] = {}--階段描述
	Global["PH_Desc"][1] = "SC_Z29_EVENT_RESET_DESC"-- 等待描述
	Global["PH_Desc"][2] = "SC_Z29_EVENT_STATE_DESC"-- 進行描述
	
	Global["OB_Name"] = "SC_Z29_EVENT_CON"--進行階段成功條件
	Global["OB_Desc"] = "SC_Z29_EVENT_CONDESC"--進行階段成功條件描述

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--區域事件現在開始！
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--區域事件沒有完成！
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--區域事件已被完成！
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--本次區域事件中，你貢獻的積分為[$VAR1]分，排名第[$VAR2]。
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--這些冒險者的名字將會紀錄在[SC_ZONE_PE_SELLS]的本子裡，作為冒險著們效法的目標。
end