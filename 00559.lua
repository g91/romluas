----------------------------------------------------------------------------------------------------
Function Z32_Q424999SHOW_00( Ctrl )
	local Players = {}
	local Role = {}
	local ClientBuff = 500595
	local CompletedKey = 542609
	local ClientFlag = 542615
	local Flag = 780868
	local x, y, z, dir = 0
	local Index = {}
	BeginPlot( Ctrl, "Z32_Q424999ShowCheck", 0 )
	Index[ 1 ] = 123555--老袒．古瓦迪
	Index[ 2 ] = 123556--鯊邦度
	Index[ 3 ] = 123557--史洛戈
	for i = 1, table.getn( Index ), 1 do
		x, y, z, dir=DW_Location( Flag, i )
		Role[ i ]= CreateObj( Index[ i ],  x, y, z, dir, 1 )
		AddToPartition(  Role[ i ] , 0 )
		MoveToFlagEnabled( Role[ i ], false )
	end
	Players = SearchRangePlayer ( Ctrl, 200 )
	for j = 0, table.getn( Players ), 1 do
		if CheckAcceptQuest( Players[ j ], 424999 ) == true then
			ScriptMessage( Ctrl, Players[ j ], 2, "[SC_Q424999SHOW_00]", 0 )--裂水海盜、庫柏族、以及獅魚人等勢力的代表正在議論著......
		end
	end
	Sleep( 10 ) SetModeEx( Ctrl, EM_SetModeType_Mark, true )
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 3 ], 0 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 25 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_01]" )--哼！這還用得著那老頭子來說，這件事我早就想做了......
	Sleep( 35 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_02]" )--摧毀[ZONE_WINDBRINE_CASTLE]就等於是摧毀[SC_Z32FALCON]那些傢伙的信念，
	Sleep( 05 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Sleep( 35 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_03]" )--而一船失去信念的人，只能絕望地漂流在無盡的大海之上......
	Sleep( 05 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 05 ) AdjustFaceDir( Role[ 3 ], Role[ 1 ], 0 ) 
	Sleep( 25 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_04]" )--好了！我可聽不懂你在唱什麼，老子我只想盡快殺光他們！
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_LOOP ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_HURT_NORMAL )
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_BUFF_SP03 )
	Sleep( 30 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_05]" )--戰艦現在只差在武器的部分......
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 30 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 05 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_06]" )--你確定你那邊準備的火藥足夠炸開[ZONE_DGN_SKULL_ROCK]嗎？
	Sleep( 30 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_07]" )--也許可以先拿[ZONE_IRONWING_SENTRY]來試試看，大族長你意下如何啊？
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 30 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_08]" )--什麼！老子我現在就來跟你試試！來啊！
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_BEGIN )
	Sleep( 30 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_09]" )--嘿嘿！鯊老大你一聲也不吭，應該就是在等我們打起來吧？
	Sleep( 05 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_STAND )
	Sleep( 35 ) NpcSay( Role[ 2 ], "[SC_Q424999SHOW_10]" )--我有點睏了，也許是離開水太久了......
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 2 ], 0 ) AdjustFaceDir( Role[ 3 ], Role[ 2 ], 0 )
	Sleep( 30 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_11]" )--希望到時候你的魚頭戰士是醒著的，否則就算戰艦能順利開出[ZONE_DGN_SKULL_ROCK]也是沒用......
	Sleep( 05 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 05 ) SetDefIdleMotion( Role[ 3 ], ruFUSION_MIME_IDLE_STAND )
	Sleep( 35 ) NpcSay( Role[ 3 ], "[SC_Q424999SHOW_12]" )--是啊！是啊！到時候被[SC_Z32FALCON]登上戰艦就糟了！
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 30 ) NpcSay( Role[ 2 ], "[SC_Q424999SHOW_13]" )--說到水戰，到時候我們會先殺光[SC_Z32FALCON]，然後再殺了船員，最後拆掉整艘戰艦......
	Sleep( 50 ) NpcSay( Role[ 1 ], "[SC_Q424999SHOW_14]" )--好了！鯊老大...你的玩笑也開得太大了，你知道我們不過是問問罷了......
	Index[ 4 ] = 123600--以思帖．格雷恩
	x, y, z, dir=DW_Location( Flag, 4 )
	Role[ 4 ]= CreateObj( Index[ 4 ],  x, y, z, dir, 1 )
	AddToPartition(  Role[ 4 ] , 0 )
	WriteRoleValue( Role[ 4 ] , EM_RoleValue_IsWalk , 1 ) 
	MoveToFlagEnabled( Role[ 4 ], false )
	Sleep( 35 ) 
	Players = SearchRangePlayer ( Ctrl, 200 )
	for k = 0, table.getn( Players ), 1 do
		if CheckBuff( Players[ k ], 500595 ) == true then
			ScriptMessage( Role[ 4 ], Players[ k ], 2, "[SC_Q424999SHOW_15]", 0 )
		end
	end
	Sleep( 30 ) LuaFunc_MoveToFlag( Role[ 4 ], Flag, 5, 0 )
	Players = SearchRangePlayer ( Ctrl, 200 )
	for m = 0, table.getn( Players ), 1 do
		if ( CheckBuff( Players[ m ], 500595 ) == true and KS_CheckBuffLV( Players[ m ], ClientBuff ) >= 3 ) then
			CancelBuff( Players[ m ], ClientBuff )
			SetFlag( Players[ m ], ClientFlag, 1 )
			SetFlag( Players[ m ], CompletedKey, 1 )
		end
	end
	for n = 1, table.getn( Role ), 1 do
		DelObj( Role[ n ] )
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
End
function Z32_Q424999ShowCheck()
	local Ctrl = OwnerID()
	local ClientBuff = 500595
	local RangePlayer = {}
	while true do
		if ReadRoleValue( Ctrl, EM_RoleValue_Register2 ) == 0 then
			return
		end
		RangePlayer = SearchRangePlayer( Ctrl, 200 )
		for i = 0, #RangePlayer, 1 do
			if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) then
				if ( CheckAcceptQuest( RangePlayer[ i ], 424999 ) == true and CheckFlag( RangePlayer[ i ], 542609 ) == false ) then
					AddBuff( RangePlayer[ i ], ClientBuff, 0, 3 )
				end
			end
		end
		Sleep( 20 )
	end
end
----------------------------------------------------------------------------------------------------
Function Z32_Q425056SHOW_00( Ctrl )
	local Players = {}
	local Role = {}
	local CompletedKey = 542610
	local Flag = 780868
	local ClientBuff = 624960
	local SlowBuff = 624177
	local ClientFlag = 542615
	local ChangeScreen = 500429
	local x, y, z, dir = 0
	local Index = {}
	Index[ 1 ] = 123559--老袒．古瓦迪
	Index[ 2 ] = 123560--鯊邦度
	Index[ 3 ] = 123588--史洛戈
	BeginPlot( Ctrl, "Z32_Q425056ShowCheck", 0 )
	for i = 1, table.getn( Index ), 1 do
		x, y, z, dir = DW_Location( Flag, i )
		Role[ i ] = CreateObj( Index[ i ],  x, y, z, dir, 1 )
		AddToPartition(  Role[ i ] , 0 )
		MoveToFlagEnabled( Role[ i ], false )
		FaceFlag ( Role[ i ], Flag, 5 ) AdjustDir( Role[ i ], 0 )
	end
	Index[ 4 ] = 123589--以思帖．格雷恩
	x, y, z, dir = DW_Location( Flag, 5 )
	Role[ 4 ] = CreateObj( Index[ 4 ],  x, y, z, dir, 1 )
	AddToPartition(  Role[ 4 ] , 0 )
	MoveToFlagEnabled( Role[ 4 ], false )
	Sleep( 10 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) SetModeEx( Ctrl, EM_SetModeType_Mark, true )
	Sleep( 15 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_01]" )--這次的合作計畫可以說已經進行到了最後階段......
	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 3 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 35 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_02]" )--不過由於某些因素，接下來我們必須將計畫稍作調整......
	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 2 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_03]" )--我想各位應該知道我所指的是什麼......
	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 1 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 40 ) NpcSay( Role[ 1 ], "[SC_Q425056SHOW_04]" )--哦！你也注意到那個不知從哪冒出來的傢伙了......
	Sleep( 05 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 10 ) SetDefIdleMotion( Role[ 1 ], ruFUSION_MIME_IDLE_STAND )
	Sleep( 05 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_05]" )--據我所知...[SC_Z32FALCON]最近納入了一名新人，各位似乎都因此受到了不小的影響......
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 ) NpcSay( Role[ 2 ], "[SC_Q425056SHOW_06]" )--嗯！這傢伙確實棘手......
	Sleep( 25 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_07]" )--所以我已經先在[ZONE_DGN_SKULL_ROCK]的警戒和防禦方面做了加強，
 	Sleep( 05 ) AdjustFaceDir( Role[ 4 ], Role[ 2 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) AdjustFaceDir( Role[ 4 ], Role[ 1 ], 0 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 15 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_08]" )--現在[ZONE_DGN_SKULL_ROCK]只留下一個通道能夠進出......
	Sleep( 30 ) NpcSay( Role[ 3 ], "[SC_Q425056SHOW_09]" )--哼！就為了一隻螻蟻有需要這麼麻煩嗎！
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 25 ) NpcSay( Role[ 3 ], "[SC_Q425056SHOW_10]" )--老子我現在就去殺了他！
	Sleep( 05 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_BEGIN )
	Sleep( 25 ) NpcSay( Role[ 1 ], "[SC_Q425056SHOW_11]" )--排隊吧！這傢伙還欠著我們老四和老五的血債......
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 3 ], 0 ) PlayMotion( Role[ 1 ], ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Sleep( 35 ) NpcSay( Role[ 2 ], "[SC_Q425056SHOW_12]" )--你們！莊主話好像還沒說完吧......
	Sleep( 10 ) PlayMotion( Role[ 3 ], ruFUSION_ACTORSTATE_CAST_END )
	Sleep( 05 ) AdjustFaceDir( Role[ 1 ], Role[ 4 ], 0 )
	Sleep( 05 ) AdjustFaceDir( Role[ 3 ], Role[ 4 ], 0 )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_13]" )--呵呵！各位的鬥志看來相當高昂啊！
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_14]" )--調整行動計劃需要各位的意見，老夫不敢擅自作主......
	Sleep( 05 ) AdjustFaceDir( Role[ 2 ], Role[ 4 ], 0 )
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 10 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 15 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_15]" )--不如我們先出發，到了[ZONE_DGN_SKULL_ROCK]之後我再向各位說明......
	Sleep( 05 ) PlayMotion( Role[ 4 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 ) NpcSay( Role[ 4 ], "[SC_Q425056SHOW_16]" )
	Sleep( 25 ) FaceFlag ( Role[ 4 ], Flag, 4 ) AdjustDir( Role[ 4 ], 0 )
	Sleep( 15 )
	for k = 1, table.getn( Role ), 1 do
		AddBuff( Role[ k ], SlowBuff, 0, -1 )
		SetDefIdleMotion( Role[ k ], ruFUSION_MIME_WALK_FORWARD )
	end
	Sleep( 15 )
	Players = SearchRangePlayer ( Ctrl, 200 )
	for m = 0, table.getn( Players ), 1 do
		if CheckBuff( Players[ m ], ClientBuff ) == true then
			ScriptMessage( Ctrl, Players[ m ], 2, "[SC_Q425056SHOW_00]", 0 )
			AddBuff( Players[ m ], ChangeScreen, 0, -1 )
		end
	end
	Sleep( 25 )
	for n = 1, table.getn( Role ), 1 do
		DelObj( Role[ n ] )
	end
	Sleep( 30 )
	Players = SearchRangePlayer ( Ctrl, 200 )
	for p = 0, table.getn( Players ), 1 do
		if CheckBuff( Players[ p ], ClientBuff ) == true then
			SetFlag( Players[ p ], CompletedKey, 1 )
			SetFlag( Players[ p ], ClientFlag, 0 )
			CancelBuff( Players[ p ], ClientBuff )
			CancelBuff( Players[ p ], ChangeScreen )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register4, 0 )
End
function Z32_Q425056ShowCheck()
	local Ctrl = OwnerID()
	local ClientBuff = 624960
	local RangePlayer = {}
	while true do
		if ReadRoleValue( Ctrl, EM_RoleValue_Register4 ) == 0 then
			return
		end
		RangePlayer = SearchRangePlayer( Ctrl, 200 )
		for i = 0, #RangePlayer, 1 do
			if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) then
				if ( CheckAcceptQuest( RangePlayer[ i ], 425056 ) == true and CheckFlag( RangePlayer[ i ], 542610 ) == false ) then
					AddBuff( RangePlayer[ i ], ClientBuff, 0, 3 )
				end
			end
		end
		Sleep( 20 )
	end
end
----------------------------------------------------------------------------------------------------
function Z33_Q425058NpcOnDead()
	local Ctrl = OwnerID()
	local Player = TargetID()
	if CheckAcceptQuest( Player, 425058 ) == true then
		DW_QietKillOne( Player, 108865 )
	end
	return true
end
----------------------------------------------------------------------------------------------------