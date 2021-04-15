function LuaS_113948()
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_0]" , "LuaS_113948_Speak1" , 0 )	-- 「矮人、精靈...各族歷史文物出現在這裡，我覺得有蹊蹺。」
	end

end
function LuaS_113948_Speak1()
	local QuestID = 422851

	SetSpeakDetail( OwnerID() , "[SC_422851_1]" )	-- 你說這些物品是屬於各族的？每件看來都有悠長的歷史啊！冒險者，古老的東西常帶有我們不了解的力量，也許是這些物品影響了我們的圖騰柱，甚至因此造成神靈力量失衡也不無可能......
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_2]" , "LuaS_113948_Speak2" , 0 )	-- 「嚕耳滿薩滿，我可以循著這些線索繼續調查。」
	end
end
function LuaS_113948_Speak2()
	SetSpeakDetail( OwnerID() , "[SC_422851_3]" )	-- 好，你去查一下這都是誰放在圖騰柱旁邊的，若是村裡的波多們做的倒沒事，我相信村裡的波多都是好波多，不會做出壞事來，就怕有些東西是來路不明的，那問題就大了。
end

function LuaS_113989()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543537 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113989_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113989_Speak()
	local ItemID = 206378	-- 線索一：矮人的斧頭
	local KeyItemID = 543537	-- 還回線索一
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206378]][$SETVAR2=[113989]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true then
			SetSpeakDetail( OwnerID() , "[SC_422851_4]" )	-- 這是我的、這是我的！壞蛋！拿走我們的巴拉克還不夠，還要搶我的家傳斧頭，還給我！
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )

			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- 判斷是否四個線索都還回
		end
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
end

function LuaS_113990()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543538 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113990_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113990_Speak()
	local ItemID = 206379	-- 線索二：精靈木雕
	local KeyItemID = 543538	-- 還回線索二
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206379]][$SETVAR2=[113990]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true and CheckFlag( OwnerID() , KeyItemID ) == false then
			SetSpeakDetail( OwnerID() , "[SC_422851_5]" )	-- 我們嚕贊波多認為，祭神舞時將最珍貴的物品拿出來放在圖騰柱邊，等於祖先也一起參與。這是我的家傳木雕啊，你拿走的？沒關係，你不了解我們的習俗，還給我就好了。
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )
			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- 判斷是否四個線索都還回
		end
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
end

function LuaS_113991()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543539 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113991_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113991_Speak()
	local ItemID = 206380	-- 線索三:人類工藝品
	local KeyItemID = 543539	-- 還回線索三
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206380]][$SETVAR2=[113991]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true then
			SetSpeakDetail( OwnerID() , "[SC_422851_6]" )	-- 我的家傳寶物怎麼在你手上？那可是我世代祖先的寄託吶，快放回圖騰柱旁邊！
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )
			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- 判斷是否四個線索都還回
		end
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
end

function LuaS_113992()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543540 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113992_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113992_Speak()
	local ItemID = 206381	-- 線索四:犬人的骨笛
	local KeyItemID = 543540	-- 還回線索四
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206381]][$SETVAR2=[113992]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true then
			SetSpeakDetail( OwnerID() , "[SC_422851_7]" )	-- 祭神舞就要開始了，我的家傳骨笛呢？沒了骨笛，祖先們要怎麼參與呢？啊哈哈！你幫我找到啦？謝謝你啦。
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )
			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- 判斷是否四個線索都還回
		end
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
end

function LuaS_113993()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113993_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113993_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_8]" )	-- 沒人教過你地上的東西不要亂撿？你永遠不知道你會撿到什麼大麻煩！我會盯著你的，盜取巴拉克的冒險者。

end

function LuaS_113994()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113994_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113994_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_9]" )	-- 是見過啦，那是我隔壁鄰居的，他天天擦拭，寶貝的不得了，怎麼會在你那裡啊？
end

function LuaS_113995()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113995_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113995_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_10]" )	-- 好像見過，又好像沒見過耶！
end

function LuaS_113996()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113996_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113996_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_11]" )	-- 這是別人家的寶物吧？我家的放在圖騰柱邊，那個陶器很好看吧！
end

function LuaS_113997()	-- 422851家傳寶物？
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --載入任務模板
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113997_Speak" , 0 )	-- 你見過這些東西嗎？
	end
end
function LuaS_113997_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_12]" )	-- 你拿的那些東西都是要送我的嗎？
end

function LuaS_422851_CheckComplete()
	if CheckFlag( OwnerID() , 543537 ) == true and 
	   CheckFlag( OwnerID() , 543538 ) == true and 
	   CheckFlag( OwnerID() , 543539 ) == true and 
	   CheckFlag( OwnerID() , 543540 ) == true then
		SetFlag( OwnerID() , 543472 , 1 ) 	-- 玩家傳家寶的調查
	end
end
--==================================================================================================================
function LuaI_113998()	-- 初始產生嚕贊薩滿
	local BodoShamanID = { 113948 , 113999 , 114000 , 114001 , 114002 , 114003 }
	local BodoShaman = {}
	local FlagID = 780519
	local BodoBronFlag = { 1 , 2 , 3 , 4 , 5 , 6 }	-- 產生的旗標位置
	local RoomID = 0

	for i = 1 , 6 do
		BodoShaman[i] = CreateObjByFlag( BodoShamanID[i] , FlagID , BodoBronFlag[i] , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , BodoShaman[i] )		-- 將產生出來的嚕贊薩滿記到產生器上面
		SetModeEx( BodoShaman[i] , EM_SetModeType_Gravity , false )	-- 無重力
		AddToPartition( BodoShaman[i] , RoomID )
		MoveToFlagEnabled( BodoShaman[i] , false )			-- 關閉巡邏劇情
		Sleep( 1 )
	end

	WriteRoleValue( BodoShaman[1] , EM_RoleValue_PID , OwnerID() )		-- 將產生器記到嚕耳滿身上

end

function LuaS_422852()

	DisableQuest( OwnerID() , true )	-- 關掉互動

	local RoomID = 0

	local BodoLeader = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	-- 從嚕耳滿身上讀取產生器的GID

	local BodoShaman = {}			-- 取回其他嚕贊薩滿的GID
	for i = 1 , 6 do
		BodoShaman[i] = ReadRoleValue( BodoLeader , EM_RoleValue_Register+i )
		BeginPlot( BodoShaman[i] , "LuaS_422852_BodoShow" , 0 )
		Sleep( 1 )
	end

	Sleep( 10 )
	CastSpell( BodoShaman[1] , BodoShaman[1] , 494746 )	-- 風神降臨 特效
	Sleep( 20 )
	local BodoX = ReadRoleValue( BodoShaman[1] , EM_RoleValue_X )
	local BodoY = ReadRoleValue( BodoShaman[1] , EM_RoleValue_Y )
	local BodoZ = ReadRoleValue( BodoShaman[1] , EM_RoleValue_Z )
	local BodoDir = ReadRoleValue( BodoShaman[1] , EM_RoleValue_Dir )

	SetIdleMotion( BodoShaman[1] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- 改變預設動作 戰鬥
--	for i = 1 , 20 do	-- 嚕耳滿浮起
--		SetPos( BodoShaman[1] , BodoX , BodoY+i , BodoZ , BodoDir )
--		DelFromPartition( BodoShaman[1] )			-- 使用Partition來更新位置，順便中斷他身上所有的Script
--		AddToPartition( BodoShaman[1] , RoomID )
--		Sleep(1)	-- 沒有Sleep會瞬移
--	end
	local Sleeptime = MoveDirect( BodoShaman[1] , BodoX , BodoY+10 , BodoZ )
	sleep( Sleeptime + 10 )
	local Sleeptime = MoveDirect( BodoShaman[1] , BodoX , BodoY+20 , BodoZ )
	sleep( Sleeptime + 10)
	BeginPlot( BodoShaman[1] , "LuaS_422852_BodoFly" , 0 )	-- 浮起一直播放特效

	PlayMotionEX( BodoShaman[2] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[2] , "[SC_422852_0]" , 2 )	-- 吾乃風，不滅不息不停。吾乃風，常行常存常在。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[3] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[3] , "[SC_422852_1]" , 2 )	-- 此前千載，善惡兩分。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[4] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[4] , "[SC_422852_2]" , 2 )	-- 噗呼~~舉各族之手，建禁制之壁。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[6] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[6] , "[SC_422852_3]" , 2 )	-- 咻嗚~~阻邪佞之茅，豎善力之盾。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[5] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[5] , "[SC_422852_4]" , 2 )	-- 呼咻~~呼咻~~
	Sleep( 30 )

	Yell( BodoShaman[1] , "[SC_422852_15]" , 2 )	-- 噗呼呼~~呼咻咻~~嗚~~
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422852_5]" , C_SYSTEM )	-- (一種蒼茫悠遠的存在透過薩滿說話，祂說了很多，你只能捕捉其中幾句的意思)
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_422852_5]" , 0 )
	Sleep( 30 )
	Yell( BodoShaman[1] , "[SC_422852_16]" , 2 )	-- 噗呼噗噗~~咻呼~~嗚咻~~
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422852_6]" , C_SYSTEM )	-- (你努力要聽清，卻只聽見呼呼的風聲)
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_422852_6]" , 0 )
	Sleep( 30 )

	PlayMotionEX( BodoShaman[2] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[2] , "[SC_422852_7]" , 2 )	-- 你聽懂風神的諭示嗎？不懂，就讓我們為你解釋吧！
	Sleep( 30 )

	PlayMotionEX( BodoShaman[4] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[4] , "[SC_422852_8]" , 2 )	-- 風神是永恆的存在，千年之前祂曾在這裡看見……
	Sleep( 30 )

	PlayMotionEX( BodoShaman[3] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[3] , "[SC_422852_9]" , 2 )	-- 形貌不同的人種，無論是波多、精靈還是人類。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[5] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[5] , "[SC_422852_10]" , 2 )	-- 他們無視彼此的差異，互相幫助扶持……
	Sleep( 30 )

	PlayMotionEX( BodoShaman[6] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[6] , "[SC_422852_11]" , 2 )	-- 為了阻擋邪惡的力量，同心協力、不畏辛苦。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[2] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[2] , "[SC_422852_12]" , 2 )	-- 搜集各種材料，建造起力量強大的屏障……
	Sleep( 30 )

	PlayMotionEX( BodoShaman[3] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[3] , "[SC_422852_13]" , 2 )	-- 偉大的結界在眾人歡呼中豎起了。
	Sleep( 30 )

	PlayMotionEX( BodoShaman[4] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[4] , "[SC_422852_14]" , 2 )	-- 這個屏障除了是堅實的保障，更是偉大友誼的見證。
	Sleep( 30 )

	--for i = 20 , 1 , -1 do		-- 嚕耳滿落下
	--	SetPos( BodoShaman[1] , BodoX , BodoY+i-1 , BodoZ , BodoDir )
	--	DelFromPartition( BodoShaman[1] )			-- 使用Partition來更新位置，順便中斷他身上所有的Script
	--	AddToPartition( BodoShaman[1] , RoomID )
	--	Sleep(1)
	--end
	Sleeptime = MoveDirect( BodoShaman[1] , BodoX , BodoY , BodoZ )
	sleep( Sleeptime + 20)
	SetPos( BodoShaman[1] , BodoX , BodoY , BodoZ , BodoDir )
	for i = 1 , 6 do
		SetIdleMotion( BodoShaman[i] , ruFUSION_ACTORSTATE_NORMAL )	-- 改變預設動作 一般
		DelFromPartition( BodoShaman[i] )				-- 讓所有的嚕贊薩滿停止動作
		AddToPartition( BodoShaman[i] , RoomID )
		Sleep( 1 )
	end

	SetFlag( TargetID() , 543473 , 1 )	-- 風神神降 任務完成旗標

	DisableQuest( OwnerID() , false )	-- 開啟互動

end
function LuaS_422852_BodoShow()
	while true do
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP )	-- 波多搖擺舞
		Sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CHANNEL_END )
		Sleep( 5 )
	end
end
function LuaS_422852_BodoFly()
	while true do
		CastSpell( OwnerID() , OwnerID() , 493668 )	-- 風神圍繞 特效
		Sleep(15)
	end
end