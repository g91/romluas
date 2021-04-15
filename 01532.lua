-- 2012.11.09 lua 作業
-- 本週Lua題目：
-- 利用陣列，創建一個選單可以隨機出現5個座騎，讓玩家選擇，選擇後玩家會直接上座騎，總隨機座騎數量20，出現的座騎不要跟上次選擇的一樣 
-----------------------------------------------------------------------------------------------------
function lua_mika_mountsummon_0()
	BeginPlot(OwnerID(), "lua_mika_mountsummon", 0 )
end

function lua_mika_mountsummon()
	local Player = OwnerID();
	local list = {
		505075,	--騎乘紫冠鶴鴕
		505111,	--騎乘猛禽鶴鴕
		505113,	--騎乘莫爾戰馬
		505127,	--騎乘毀滅戰馬
		505472,	--騎乘煉獄夢魘
		505473,	--騎乘幽冥夢魘
		505474,	--騎乘蒼火夢魘
		505475,	--騎乘金燄夢魘
		505476,	--騎乘深淵夢魘
		505477,	--騎乘魔血夢魘
		505478,	--騎乘曙光雪貂
		505479,	--騎乘鋼焰戰馬
		505480,	--騎乘龍魂戰駒
		505481,	--騎乘銀河天馬
		506001,	--騎乘白色駿馬
		506002,	--騎乘黑色駿馬
		506109,	--騎乘棕色駿馬
		506137,	--騎乘遠征毛驢
		506174,	--騎乘暴風鷹馬獸
		506175	--騎乘鷹眼葛列佛
		}
	local DialogStatus = 0
	local choosed = ReadRoleValue(Player, EM_RoleValue_Register+1)
	local count = 5
	local number
	local uselist = {}

	DialogCreate( Player , EM_LuaDialogType_Select , "choose one" )

	if choosed ~= 0  then  -- 上次有選過
		for i = 1, #list do
			if choosed == list[i] then
				table.remove{list, i }  -- 移除list 特定位置的項目
			end
		end
	end
	
	for i = 1, (count) do  -- 挑5個
		number = Rand(#list)+1
		table.insert(uselist, list[number] )
		table.remove(list, number)
		DialogSelectStr( Player , "["..uselist[i].."]"  )
	end

	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Player );--企劃包起來的等待回覆用function
	say(Player, "SelectID ="..SelectID )
	if SelectID == 0 then
		AddBuff(Player, uselist[1], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[1] )
	elseif SelectID == 1 then
		AddBuff(Player, uselist[2], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[2] )
	elseif SelectID == 2 then
 		AddBuff(Player, uselist[3], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[3] )
	elseif SelectID == 3 then
		AddBuff(Player, uselist[4], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[4] )
	elseif SelectID == 4 then
		AddBuff(Player, uselist[5], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[5] )
	end
	DialogClose(Player)
end

-------------
--lua進階題目1：在玩家前方每50距離建立1個箱子共10個箱子，在箱子上面坐10個不一樣的npc，每次執行上面的npc隨機分配
--lua進階題目2：在玩家的位子建立一個npc，沿著箱子的間隔處，蛇形往前走到最後一個箱子，在走回來。撰寫人：FN、阿元、小宏、阿浩、阿準
--lua進階題目3：題目2的npc必須以弧形前進。撰寫人：小宏、阿浩

function lua_mika_hw1211_test01()
	local Player = OwnerID()
	local NPCList = {
			114578,
			114579,
			114580,
			114581,
			114582,
			114583,
			114709,
			114710,
			114711,
			114712
			}
	local boxid = 110267
	local range = 50
	local nowrange = 0
	local allcount  =  10
	local box = {}
	local npc = {}	
	local box_x = {}
	local box_y = {}
	local box_z = {}
	local box_Dir = {}

	for i  = 1, 10 do
		addrange = range*(i-1)
		say(Player, "addrange = "..addrange )
		box[i] = Lua_CreateObjByDir( Player , boxid , range+addrange , 0 ) --參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件
		AddToPartition( Box[i], 0 )
		SetModeEx( Box[i], EM_SetModeType_Obstruct, true )
		box_x[i] = ReadRoleValue(box[i], EM_RoleValue_X)
		box_y[i] = ReadRoleValue(box[i], EM_RoleValue_Y )
		box_z[i] = ReadRoleValue(box[i], EM_RoleValue_Z )
		box_Dir[i] = ReadRoleValue(box[i], EM_RoleValue_Dir)

		local number = Rand(#NPCList)+1  -- 從目前table 裡面剩餘數量 取1個
		npc[i] = CreateObj( NPCList[number], box_x[i] , box_y[i]+30 ,  box_z[i] , box_Dir[i] , 1 )--怪物代用
		AddToPartition( npc[i], 0 )
		table.remove(NPCList, number )  -- 將此號碼位置從table 移除
		PlayMotionEX( npc[i], ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
		sleep(10)
	end

end

----------------------------------
function lua_mika_musictest1212_1()
	local Player = OwnerID()

	Lua_StopBGM(Player)  -- 停止目前播放音樂
	say(Player, "Start 1")
	local MusicID  = PlayMusicToPlayer(player,"music/wedding/fairytales_06_COL_ARO_home.mp3", true )--光龍出場音樂

	sleep(200)
	StopSound(Player,MusicID)  -- 停止MusicID這個頻道的聲音
	Lua_PlayBGM(Player)
	say(Player, "Stop 1")
end

function lua_mika_musictest1212_2()
	local Player = OwnerID()

	Lua_StopBGM(Player)  -- 停止目前播放音樂
	say(Player, "Start 2")
	local MusicID  = PlayMusicToPlayer(player,"music/GuildWar/epic_tales_01_APF_chaos.mp3", true )--光龍出場音樂

	sleep(200)
	StopSound(Player,MusicID)  -- 停止MusicID這個頻道的聲音
	Lua_PlayBGM(Player)
	say(Player, "Stop 2")
end



-----------------
function lua_mika_test_round_01(number)
	local box = OwnerID()
	local X_pos = ReadRoleValue(box, EM_RoleValue_X )
	local Y_pos = ReadRoleValue(box, EM_RoleValue_Y )
	local Z_pos = ReadRoleValue(box, EM_RoleValue_Z )
	local range = 50
	local obj = {}
	for i = 1,number do
		obj[i] = CreateObj( 100292, X_pos+(range*math.cos(math.pi*2*(i/number))), Y_pos, Z_pos+(range*math.sin(math.pi*2*(i/number))), 0, 1 )
		AddToPartition( obj[i], 0 )	
	end
end
