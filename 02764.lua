--本週(11/9)Lua題目：
--利用陣列，創建一個選單可以隨機出現5個座騎，讓玩家選擇，
--選擇後玩家會直接上座騎，總隨機座騎數量20，出現的座騎不要跟上次選擇的一樣

function YOYO_Task1()
	local TaskNumber = 5
	local MountsTable = {};
	MountsTable[1] = 501417; --騎乘雪貂
	MountsTable[2] = 501418; --騎乘白馬
	MountsTable[3] = 501440; --騎乘鶴鴕
	MountsTable[4] = 501441; --騎乘雪海拔忽
	MountsTable[5] = 501444; --騎乘花斑馬
	MountsTable[6] = 501445; --騎乘棕馬
	MountsTable[7] = 501446; --騎乘黑馬
	MountsTable[8] = 501649; --騎乘闇影雪貂
	MountsTable[9] = 501651; --騎乘火鶴鴕
	MountsTable[10] = 501652; --騎乘血鶴鴕
	MountsTable[11] = 501653; --騎乘金色鶴鴕
	MountsTable[12] = 501654; --騎乘銅甲拔忽
	MountsTable[13] = 501655; --騎乘青甲拔忽
	MountsTable[14] = 501656; --騎乘赤甲拔忽
	MountsTable[15] = 501657; --騎乘火眼拔忽
	MountsTable[16] = 501699; --騎乘紅色蘑菇人
	MountsTable[17] = 501700; --騎乘黃色蘑菇人
	MountsTable[18] = 502215; --騎乘綠色龍牙冰獸
	MountsTable[19] = 502216; --騎乘藍龍牙冰獸
	MountsTable[20] = 502554; --騎乘皇家馴鹿坐騎

	--local Seed = math.randomseed(os.time()); --跑一次亂數表
	--local Rand1 = math.random(1,20); --第一次為定值
	
	for Count = 1 , 100 do --隨機交換陣列中的順序100次
		local ValueA = RandRange(1,20);
		local ValueB = RandRange(1,20);
		local ValueC = MountsTable[ValueB];
		MountsTable[ValueB] = MountsTable[ValueA];
		MountsTable[ValueA] = ValueC;
	end

	local Player = OwnerID();
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	DialogCreate( Player , EM_LuaDialogType_Select , "Please select mounts" )

	for Count = 1 , TaskNumber do
		DialogSelectStr( Player , "["..MountsTable[Count].."]" )
	end

	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Player );--企劃包起來的等待回覆用function

	if SelectID == 0 then
		--選項0要做的事情
		AddBuff( Player , MountsTable[1] , 1 , -1)
	elseif SelectID > 0 then
		--選項1之後要做的事情
		AddBuff( Player , MountsTable[SelectID + 1] , 1 , -1)
	end

	DialogClose( Player )
end