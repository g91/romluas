-----------------------------------------------------------------------------
--Z26_火舌
-----------------------------------------------------------------------------
--接還任務表演時，OwnerID是npc
function lua_quest426185_1()--索尼斯．曼頓離開消失
	local newnpc = 122292
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		--演戲角色不可被點擊，必須關閉選取欄位
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		--演戲角色要關閉巡徑，以免演戲過程中返回重生點
		MoveToFlagEnabled( obj ,false )
		--建立角色
		AddToPartition( obj,0 )
		--角色頭上對話
		Say( obj, "[SC_Q426185_1]" )	--騎士大人，我先離開了，你自己小心點。
		--移動至某旗標位置
		LuaFunc_moveToFlag( obj,781285,1,0 )	--角色 旗子 ID 範圍
		--刪除角色
		DelObj( obj)
end

function lua_quest426193_1()--邦特．曼瑞離開消失
	local newnpc = 122293
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		AddBuff( TargetID(),504004,0,3 )	
		--演戲角色不可被點擊，必須關閉選取欄位
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		--演戲角色要關閉巡徑，以免演戲過程中返回重生點
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_Q426193_1]" )	--孩子們，[$playername]會好好照顧你們的，要乖乖等我回來喔。
		LuaFunc_moveToFlag( obj,781285,2,0 )	--角色 旗子 ID 範圍
		DelObj( obj)
end
-----------------------------------------------------------------------------
--Z26_沸湖
-----------------------------------------------------------------------------
-----------------------------------------------------426209水源運轉裝置
--回收委託的情報
--122351 聯盟戰士
function lua_Z26Q426209_1()
	--載入任務面板
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426209 )==true  and  CheckFlag( OwnerID() ,548103 )==false then
		--給予一個選項並對應一個含式
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426209_0]","lua_Z26Q426209_1_1",0 )
	end
end
--122352 聯盟戰士
function lua_Z26Q426209_2()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426209 )==true and CheckFlag( OwnerID() ,548104 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426209_0]","lua_Z26Q426209_2_1",0 )
	end
end
--122353 聯盟戰士
function lua_Z26Q426209_3()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426209 )==true and CheckFlag( OwnerID() ,548105 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426209_0]","lua_Z26Q426209_3_1",0 )
	end
end
--給完成的旗標
function lua_Z26Q426209_1_1()
	--呼叫對話
	SetSpeakDetail( OwnerID(), "[SC_426209_1]" )
	SetFlag( OwnerID(), 548103  ,1)
end
function lua_Z26Q426209_2_1()
	SetSpeakDetail( OwnerID(), "[SC_426209_2]" )
	SetFlag( OwnerID(), 548104  ,1)
end
function lua_Z26Q426209_3_1()
	SetSpeakDetail( OwnerID(), "[SC_426209_3]" )
	SetFlag( OwnerID(), 548105  ,1)
end



-----------------------------------------------------426206出征前的準備
--完成任務時給旗標
--122342 派克
--426208傳說中的料理
--接還任務表演時，OwnerID是npc
function lua_Z26Q426208_1_0()
	--Say無法讀取中文
	--Say( TargetID(), 1 )
	SetFlag( TargetID(),548101,1 )
end
--122343 查查
--426210降溫行動
function lua_Z26Q426210_1()
	SetFlag( TargetID(),548102,1 )
end



-----------------------------------------------------426207就是要吃美食(6/14加入委託與公眾)
--觸發劇情
--122347 可疑的巢穴
--242636 完整的蛋
function lua_Z26Q426207_1()
	LoadQuestOption( OwnerID() )
	--任務時
	if CheckAcceptQuest( OwnerID() ,426207 ) or CheckAcceptQuest( OwnerID() ,426364 ) or CheckAcceptQuest( OwnerID() ,426368 )==true  then
		--道具數量是否達上限
		--選項：撿拾巢穴內的蛋
		if CountBodyItem( OwnerID(),242636 )>=4 then
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426207_1_0]","lua_Z26Q426207_2",0 )
		else
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426207_1_0]","lua_Z26Q426207_3",0 )
		end
	end
end
--道具超過上限,打發對話：你已經收集足夠的數量。
function lua_Z26Q426207_2()
	CloseSpeak( OwnerID())
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426207_2]", 0 )
end
--給予道具,有機率招怪
--1/3招怪,2/3獲得物品
function lua_Z26Q426207_3()
	--關閉面板
	CloseSpeak( OwnerID())
	--rand 0~99(由0開始,+1才會由1開始)
	local num =Rand( 100 )
	--Say( OwnerID(),num)
	if num<= 69 then
		--避免被同時觸發，必須優先執行關閉標記
		SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--標記
		--呼叫某對象執行某函式
		CallPlot( TargetID(),"lua_Z26Q426207_3_1",0 )
		--播放動作
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		Sleep(20)
		GiveBodyItem( OwnerID(), 242636, 1 )
	else
		SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--標記
		CallPlot( TargetID(),"lua_Z26Q426207_3_1",0 )
		--呼叫怪物要掛在玩家身上
		CallPlot( OwnerID(),"lua_Z26Q426207_3_2",0 )
		--招引附近怪物,對話：裡頭沒有任何完整的蛋
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426207_3]", 0 )
	end
end
--重新開啟
function lua_Z26Q426207_3_1()
	Sleep( 600)
	SetModeEx( OwnerID()  , EM_SetModeType_Mark, true )--標記
end
--引怪
function lua_Z26Q426207_3_2()
	--SearchRangeNPC會回傳一個陣列{}，這個陣列序號從0開始
	local tmp = SearchRangeNPC( OwnerID(),180 )
	--讀取陣列資料必須在變數前加#
	for i = 0 , #tmp , 1 do
		--做法2：目標是某ID
		if ReadRoleValue( tmp[i],EM_RoleValue_OrgID ) ==107718 then
			CastSpell( tmp[i] , tmp[i] , 850896 )
			--注意不要在無敵下做
			SetAttack( tmp[ i ],OwnerID() )
		end
	end

end


-----------------------------------------------------426208傳說中的料理(6/14加入委託與公眾)
--索取道具
--242639 食用生蛋(可重複索取,攜帶限5)
--122342 派克
function lua_Z26Q426208_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426208 ) or CheckAcceptQuest( OwnerID() ,426365 ) or CheckAcceptQuest( OwnerID() ,426369 )==true  then
		--道具數量是否達上限
		if CountBodyItem( OwnerID(),242640 )<5 then--半熟蛋
			--道具已滿
			--選項：索取食用生蛋
		 	if CountBodyItem( OwnerID(),242639 )>=5 then--食用生蛋
				AddSpeakOption(  OwnerID(),TargetID(),"[SC_426208_1_0]","lua_Z26Q426208_1_1",0 )
			else
				AddSpeakOption(  OwnerID(),TargetID(),"[SC_426208_1_0]","lua_Z26Q426208_1_2",0 )
			end
		end
	end
end

--道具超過上限,打發對話：一口氣拿這麼多，很容易摔破的。
function lua_Z26Q426208_1_1()
	CloseSpeak( OwnerID())
	Say( TargetID(), "[SC_426208_1_1]" )
end
--補給道具,對話：小心拿好，別掉了。
function lua_Z26Q426208_1_2()
	CloseSpeak( OwnerID())
	Say( TargetID(), "[SC_426208_1_2]" )
	GiveBodyItem( OwnerID(), 242639, 1 )
end

--對角色使用物品
--122350 方型濾網
-- 242640 半熟蛋(目標:5)*有機率過熟或破掉
function lua_Z26_122350_1()
	if CountBodyItem( OwnerID(),242639 ) > 0 then--242639 食用生蛋
		return true
	else
		--：你身上已經沒有生的蛋了
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122350_0_1]", 0 )
		return false
	end
end
function lua_Z26_122350_1_1()
		--機率表
		local num =Rand( 100 )
		--Say( OwnerID(),num)
		----1/3獲得物品：成功煮出半熟的溫泉蛋。
		if num>= 30 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426208_2_3]", 0 )
			GiveBodyItem( OwnerID(), 242640, 1 )
		----1/3破掉：放的力道過大，蛋破掉了。
		elseif num>= 15 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426208_2_2]", 0 )
		----1/3過熟：煮太久，蛋過熟了。
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426208_2_1]", 0 )
		end
		DelBodyItem( OwnerID(), 242639, 1 )
		return 1
end



-----------------------------------------------------426210降溫行動
--122355 水源運轉裝置X-86
--242641 冷卻符文(目標:1)
--548106 在合適的裝置上安裝冷卻符文
function lua_Z26_122355_1()
	LoadQuestOption( OwnerID() )
	--判斷有任務
	--選項：安裝合適的符文
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122355_1_1",0)
	end
end
function lua_Z26_122355_1_1()
	CloseSpeak( OwnerID() )
	--未安裝
	if   CheckFlag( OwnerID() ,548106 )==false then
		--有道具,數量足夠：將符文安裝在裝置上
		if CountBodyItem( OwnerID(),242641 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242641, 1 )
			SetFlag( OwnerID(),548106,1 )
		--數量不足：裝置與符文共鳴後開啟了隱藏的面板，你發現上頭居然有3個鑲嵌孔洞
		--elseif CountBodyItem( OwnerID(),242641 ) >= 1 then
		--	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_1]", 0 )
		--無道具：未擁有合適的符文可以進行安裝
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	--已安裝完成：該裝置已經安裝完畢
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122356 水源運轉裝置X-93
--242642 活化符文(目標:1) 
--548107 在合適的裝置上安裝活化符文
function lua_Z26_122356_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122356_1_1",0)
	end
end
function lua_Z26_122356_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548107 )==false then
		if CountBodyItem( OwnerID(),242642 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242642, 1 )
			SetFlag( OwnerID(),548107,1 )
		--elseif CountBodyItem( OwnerID(),242642 ) >= 1 then
		--	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_2]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122357 水源運轉裝置C-29
--242643 分解符文(目標:1)
--548108 在合適的裝置上安裝分解符文
function lua_Z26_122357_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122357_1_1",0)
	end
end
function lua_Z26_122357_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548108 )==false then
		if CountBodyItem( OwnerID(),242643 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242643, 1 )
			SetFlag( OwnerID(),548108,1 )
		--elseif CountBodyItem( OwnerID(),242643 ) >= 1 then
		--	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_3]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122358 水源運轉裝置L-1
--242644 啟動符文(目標:2)
--548109 在合適的裝置上安裝 啟動符文
function lua_Z26_122358_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122358_1_1",0)
	end
end
function lua_Z26_122358_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548109 )==false then
		if CountBodyItem( OwnerID(),242644 ) >= 2 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242644, 2 )
			SetFlag( OwnerID(),548109,1 )
		elseif CountBodyItem( OwnerID(),242644 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_4]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122359 水源運轉裝置L-2
--242645 運轉媒介(目標:3)
--548110 在合適的裝置上安裝運轉媒介
function lua_Z26_122359_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122359_1_1",0)
	end
end
function lua_Z26_122359_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548110 )==false then
		if CountBodyItem( OwnerID(),242645 ) >= 3 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242645, 3 )
			SetFlag( OwnerID(),548110,1 )
		elseif CountBodyItem( OwnerID(),242645 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_1]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end



-----------------------------------------------------426214幕後黑影
--122361 傳輸系統
--242648 強力爆裂裝置
--有強力爆裂裝置，點擊即可完成(目標:6)
function lua_Z26_122361_1()
	LoadQuestOption( OwnerID() )
	--有道具：安裝爆裂裝置
	if CountBodyItem( OwnerID(),242648 ) > 0 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122361_0]","lua_Z26_122361_1_1",0)
	end
end
function lua_Z26_122361_1_1()
	CloseSpeak( OwnerID() )
	SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--標記
	--最後一個值可回傳到後續函式中
	CallPlot( TargetID(),"lua_Z26_122361_1_2",OwnerID() )
end
function lua_Z26_122361_1_2( player)
	PlayMotion( player ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	DW_QietKillOne( player ,107824 )--安裝爆裂裝置
	DelBodyItem( player, 242648, 1 )
	--引怪
	CallPlot( player ,"lua_Z26_122361_1_4",0 )
	--：爆裂裝置進入倒數讀秒
	ScriptMessage( player, player, 2, "[SC_122361_1]", 0 )
	Sleep(20)

	--由初始值遞減至0
	--倒數3秒
	for i = 3 ,0,-1 do
		ScriptMessage( player, player, 2, "[SC_122361_2]"..i.."[SC_122361_3]", 0 )
		Sleep( 10 )
	end
	--掛上減速Buff
	AddBuff( player , 624435 , 0 , 5 )
	CastSpell( TargetID() , TargetID() , 850896 )
	CallPlot( player,"lua_Z26_122361_1_2_1",player )--交談
	CallPlot( TargetID(),"lua_Z26_122361_1_2_2",0 )--原型
end
function lua_Z26_122361_1_2_1( player)
	--記錄值在玩家身上,依序增加後記得歸零
	local num = ReadRoleValue( player,EM_RoleValue_Register1 )
	--葛拉莫伐特&賽西蒙德的對話
	if num ==0 then
		WriteRoleValue( player,EM_RoleValue_Register1,1)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_0]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_1]", 0 )
		Sleep( 30 )
	elseif num ==1 then
		WriteRoleValue( player,EM_RoleValue_Register1,2)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_2]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_3]", 0 )
		Sleep( 30 )
	elseif num ==2 then
		WriteRoleValue( player,EM_RoleValue_Register1,3)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_4]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_5]", 0 )
		Sleep( 30 )
	elseif num ==3 then
		WriteRoleValue( player,EM_RoleValue_Register1,4)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_6]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_7]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_8]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_9]", 0 )
		Sleep( 30 )
	elseif num ==4 then
		WriteRoleValue( player,EM_RoleValue_Register1,0)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_10]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_11]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_12]", 0 )
		Sleep( 30 )
	end
end
function lua_Z26_122361_1_2_2()
	--假設ownerid()為原型，新物件叫obj
	local x,y,z,dir = DW_Location(  OwnerID() )
	local obj = CreateObj( 122362,x,y,z,dir,1 )
	--CastSpell( OwnerID() , OwnerID() , 850908 )
	CastSpell( OwnerID() , OwnerID() , 850908 )
	SetModeEx( obj,EM_SetModeType_Mark,false )
	SetFightMode ( obj,0, 0, 0,0 ) 
	--CastSpell( OwnerID(),OwnerID(),492453 )
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )
	AddToPartition( obj,0 )
	CallPlot( obj,"lua_Z26_122361_1_2_2_1",OwnerID())
end
function lua_Z26_122361_1_2_2_1( MRO )
	Sleep( 600)
	SetModeEx( MRO, EM_SetModeType_Show, true )	
	SetModeEx( MRO , EM_SetModeType_Mark, true )
	DelObj( OwnerID() )
end
--引怪
function lua_Z26_122361_1_4()
	--SearchRangeNPC會回傳一個陣列{}，這個陣列序號從0開始
	local tmp = SearchRangeNPC( OwnerID(),200 )
	for i = 0 , #tmp , 1 do
		--做法1：目標只要是敵方
		if ReadRoleValue( tmp[ i ] ,EM_RoleValue_CampID ) ==3  then--敵方陣營為3
			CastSpell( tmp[ i ] , tmp[ i ] , 850896 )
			SetAttack( tmp[ i ],OwnerID() )
		end
	end

end

function lua_Z26_122361_1_2_test()
DebugMsg( OwnerID() , 1, "star" )
WriteRoleValue( OwnerID(),EM_RoleValue_Register1,0)
end

--接還任務表演時，OwnerID是npc
---對話劇情，對話都是掛在玩家身上