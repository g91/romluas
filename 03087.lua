-------------------------------支線：426638誰叫我是艾力克的大副------------------------------------
function Lua_Z28_426638_ChickobjBegin()
	local player = OwnerID()
	local stone = TargetID()
	if DW_CheckQuestAccept("or", player , 425714 ) == true then	--425714搶錢海盜團(委託任務)
			return true
	elseif DW_CheckQuestAccept("or", player , 426767 ) == true then	--426767搶錢海盜團(公眾任務)
			return true		
	elseif DW_CheckQuestAccept("or", player , 426638 ) == true then	
		if Checkflag( Player , 548367 ) == true then
			return true
		else
			ScriptMessage( Player,Player, 1, "[SC_Z28Q426638_01]", 0 ) 	--你無法辨識這是甚麼礦石
			return false
		end
	else		
		ScriptMessage( Player,Player, 1, "[SC_Z28Q426638_02]", 0 ) 	--塔帕塔帕峽才有的礦石
		return false
	end
end

function Lua_Z28_123102_speak()	--巴魯魯對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426638 ) == true and CheckFlag( player , 548367 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426638_03]","Lua_Z28_123102_speak2" , 0 )	--我要怎麼取得雅羅彩石？
	else
		LoadQuestOption( player )
	end
end

function Lua_Z28_123102_speak2()
--	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z28Q426638_04]" )	--稍微描述雅羅彩石的辨別方式
	SetFlag( OwnerID() , 548367 , 1 )	
end	
---------------------------------------426639點心代表我的愛-------------------------------------------------
function Lua_Z28_123140_speak()	--普立路對話劇情
	local player = OwnerID()
	local npc=TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 )>0 then
		AddSpeakOption( player , player , "[SC_Z28Q426639_01]","Lua_Z28_426639_speak(1)" , 0 )	--這是舞可兒準備的點心
	end
end

function Lua_Z28_123142_speak()	--阿薩酷對話劇情
	local player = OwnerID()
	local npc=TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 )>0 then 
		AddSpeakOption( player , player , "[SC_Z28Q426639_01]","Lua_Z28_426639_speak(4)" , 0 )	--"這是舞可兒準備的點心"
	end
end
	
function Lua_Z28_123099_speak()	--塔塔加對話劇情
	local player = OwnerID()
	local npc=TargetID()
	LoadQuestOption( player )
	if
	( CheckCompleteQuest( player, 426679 )==true and
	CheckCompleteQuest( player, 426628 )==false and
	CheckFlag( player, 548432 )==false ) then
		AddSpeakOption( player, npc, "[SC_NPC123099SPEAK_01]", "Lua_Z28_123099_speak02", 0 )	--字串已建
	elseif CheckAcceptQuest( player , 426632 ) == true and Countbodyitem( player , 242706 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z28Q426632_01]" ,"Lua_Z28_426639_speak(3)" , 0 )	--我好像沒有拿到黑晶石		
	else
		LoadQuestOption( player )
	end
end

function Lua_Z28_123099_speak02()
	local player=OwnerID()
	local npc=TargetID()
	SetFlag( player, 548432, 1 )
	SetSpeakDetail( player, "[SC_NPC123099SPEAK_02]" )
	AddSpeakOption( player, npc, "[SC_NPC123099SPEAK_03]", "Lua_Z28_123099_speak03", 0 )
end

function Lua_Z28_123099_speak03()
	local player=OwnerID()
	LoadQuestOption( player )
end

function Lua_Z28_426639_speak(sweet)
--	CloseSpeak( OwnerID() )
	Delbodyitem( OwnerID() , 243067 , 1 )
	if sweet == 1 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_02]" )	--謝謝你，忘了跟舞可兒說，最近要忙著準備祭典的東西
		SetFlag( OwnerID() , 548424 , 1 )
	elseif sweet == 2 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_03]" )	--好好吃，謝謝你
		SetFlag( OwnerID() , 548425 , 1 )
	elseif sweet == 4 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_06]" )	--最近忙著準備祭典，沒空理舞可兒，請你幫我跟舞可兒說謝謝。
		SetFlag( OwnerID() , 548423 , 1 )
	elseif sweet == 3 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426632_02]" )	--你忘在這裡了，拿去吧
		Givebodyitem( OwnerID() , 242706 , 1 )		
	end		
end

function Lua_Z28_123108_speak()	--拉魯拉魯對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 )>0 then
		AddSpeakOption( player , player , "[SC_Z28Q426639_01]","Lua_Z28_426639_speak(2)" , 0 )	--這是舞可兒要給你的點心
	else
		LoadQuestOption( player )
	end
end
----------------------------------426640討回公道？------------------------------
function Lua_Z28_108201_Attackstart()
	local npc = OwnerID()
	local player = TargetID()
	local string = {[1]="[SC_Z28Q426640_01]",		--破壞自然會惹祖靈生氣
			[2] = "[SC_Z28Q426640_02]",		--你也是破壞自然的壞人嗎？
			[3] = "[SC_Z28Q426640_03]"}		--不可以原諒破壞自然平衡的人
	local randnum = DW_Rand( table.getn ( string ) )
	
	if CheckAcceptQuest( player , 426640 ) == true then
		NPCSay ( npc , string[RandNum] )
	end	
end	
--function Lua_Z28_108201_Attackstart()		
--	sleep( 30 )
--	Local Speak={}
--	Local Motion
--	Speak[1] = "hey , you"
--	Speak[2] = "ho,no"
--	Speak[3] = "be happy"
--	for i = 4 , 10 , 1 do
--		Speak[i] = "hi,hi"
--		sleep(1)
--	end
--
--	While 1  do 
--		Local j = rand(10) + 1
--		Motion = Speak[j]
--		NPCSay ( OwnerID() , Motion )
--		sleep(50+Rand(20))
--	end
--end
----------------------------------426641口述歷史--------------------------
function Lua_Z28_123106speak()	--妮可‧蘿萍對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426641 ) == true and Countbodyitem( player , 243068 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z28Q426641_01]","Lua_Z28_123106speak2" , 0 )	--紀錄用的紙張好像不夠
	end
end

function Lua_Z28_123106speak2()
	local player = OwnerID()
	LoadQuestOption( player )
	local Paper = { 548570 , 548571 , 548572 }	--訪談普立路、訪談葛瑪蘭、訪談阿薩酷 三位長老的旗標
	for i = 1 , table.getn(Paper) do 
		if Checkflag( player , Paper[i] ) == false then
			SetSpeakDetail( player , "[SC_Z28Q426641_02]" )	--在給你一些記錄用的紙張
			Givebodyitem( player , 243068 , 1 )
		end
	end
end		

function Lua_Z28_243068_check()	--空白紙張檢查LUA
	local Player = OwnerID()
	local npc = targetID()
	local Elder = { [1]=123140 , [2]=123141 , [3]=123142 }	--普立路, 葛瑪蘭, 阿薩酷三位長老
	local Flag = { [1]=548570 , [2]=548571 , [3]=548572 }	--訪談普立路、訪談葛瑪蘭、訪談阿薩酷 三位長老的旗標

	if CheckAcceptQuest( player , 426641 ) == true then
		if Checkflag( player , Flag[1] ) == false and ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[1] then 
			return true			
		elseif ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[2] and Checkflag( Player , Flag[2] ) == false then
			return true
		elseif ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[3] and Checkflag( Player , Flag[3] ) == false then
			return true
		else
		ScriptMessage( Player , Player , 1 , "[SC_424142_1]" , 0 )	--非物品使用目標			
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z28Q426641_03]" , 0 )	--你現在無法使用這個物品
		return false
	end
end

function Lua_Z28_243068_use()	--空白紙張使用LUA
	local Player = OwnerID()
	local npc = TargetID()
	local Elder = { [1]=123141 , [2]=123140 , [3]=123142 }	--葛瑪蘭, 普立路, 阿薩酷三位長老 
	local Motion = {[1] = ruFUSION_ACTORSTATE_BUFF_SP01 ,
			[2] = ruFUSION_MIME_CAST_SP01 ,
			[3] = ruFUSION_ACTORSTATE_CAST_SP01 }
	local RandNum = DW_Rand( table.getn ( Motion ) )
	PlayMotion( npc , Motion[RandNum] )
	givebodyitem( player , 243069 , 1 )
	AdjustFaceDir( npc , Player , 0 )
	NPCSay( npc , "[SC_Z28Q426641_04]" )	--描述夏蹦族歷史傳說
	Sleep(30)
	if ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[1] then	--葛瑪蘭
		NPCSay( npc , "[SC_Z28Q426641_05]" )
		Sleep(30)
		NPCSay( npc , "[SC_Z28Q426641_06]" )
		Sleep(25)
		NPCSay( npc , "[SC_Z28Q426641_07]" )
		Sleep(10)
		setflag( player , 548571 , 1 )
	elseif ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[2] then	--普立路
		NPCSay( npc , "[SC_Z28Q426641_08]" )
		Sleep(30)
		NPCSay( npc , "[SC_Z28Q426641_09]" )
		Sleep(25)
		NPCSay( npc , "[SC_Z28Q426641_10]" )
		Sleep(10)
		setflag( player , 548570 , 1 )
	else									--阿薩酷
		NPCSay( npc , "[SC_Z28Q426641_11]" )
		Sleep(30)
		NPCSay( npc , "[SC_Z28Q426641_12]" )
		Sleep(25)
		NPCSay( npc , "[SC_Z28Q426641_13]" )
		Sleep(10)
		setflag( player , 548572 , 1 )
	end
	beginplot( player , "Lua_Z28_243068_use2" , 0 )
	Addbuff( npc , 623834 , 0 , 10 )
end

function Lua_Z28_243068_use2()
	Delbodyitem( OwnerID() , 243068 , 1 )
end
-------------------------426642圖解歷史----------------------
function Lua_Z28_123105_speak()	--舞可兒對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426642 ) == true and Countbodyitem( player , 243070 )>0 then
		AddSpeakOption( player , player , "[SC_Z28Q426642_01]","Lua_Z28_123105_speak2(1)" , 0 )	--你知道這張圖是甚麼意思嗎?
	end
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z28Q426639_04]","Lua_Z28_123105_speak2(2)" , 0 )	--點心好像不夠用了
	end		
end

function Lua_Z28_123105_speak2(num)
	local player = OwnerID()
--	closespeak( player )
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z28Q426642_02]" )	--隨便掰個會在水邊辦的祭典描述
		SetFlag( player , 548440 , 1 )
	elseif num == 2 then
		local Cake = { [1]=548423 , [2]=548424 , [3]=548425 }
		for i = 1 , table.getn(Cake) do 
			if Checkflag( player , Cake[i] ) == false then
				SetSpeakDetail( player , "[SC_Z28Q426639_05]" )	--我這裡還有...
				givebodyitem( player , 243067 , 1 )
			end
		end
	end
end	
-----------------------------426644試煉沒那麼簡單------------------------
function Lua_jiyi_Z28_426644_Accept()	--接任務後觸發劇情
	SetFlag( TargetID() , 548548 , 1 )	
end
--------------------------426645用愛灌溉-----------------------------
function Lua_Z28_123110objend()	--灌溉水桶觸碰後
	Addbuff( OwnerID() , 623290 , 0 , 10 )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426645_01]" , 0 )	--你獲得一點水能量符文
	return true
end

function Lua_Z28_497432check()	--水能量符文判斷
	local player = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Fruit = { [1]=123109 , [2]=122888 }	--未熟的瓜、成熟的瓜
	if Countbodyitem( player , 242075 ) < 5 then
		if TOrgID == Fruit[1] then	 
			return true
		elseif TOrgID == Fruit[2] then
			ScriptMessage( player , player , 1 , "[SC_Z28Q426645_02]" , 0 )	--只能對未熟的瓜使用
			return false
		else 
			ScriptMessage( player , player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--系統告知"非有效目標"
			return false
		end
	end		
end	

function Lua_Z28_623209use()	--水能量符文技能使用
	local Player = OwnerID()
	local Fruit = TargetID()	--未熟的南瓜
	ChangeObjID( Fruit , 122888 )	--轉變成成熟的南瓜
	Givebodyitem( player , 242075 , 1 )				
end	

function Lua_Z28_122888()	--讓成熟南瓜自己變回未熟南瓜
	SetModeEx( OwnerID()  , EM_SetModeType_ShowRoleHead, false )	--取消頭像框
	sleep(100)
	ChangeObjID( OwnerID() , 123109 )	--轉變成未熟的南瓜
	SetModeEx( OwnerID()  , EM_SetModeType_ShowRoleHead, true )	--顯示頭像框
end	
	
function Lua_jiyi_Z28_426645Complete()
	local player = TargetID()
	Cancelbuff( player , 623290 )
	SetFlag( player , 548439 , 1 )
end
----------------------------426646眼要利，手要快-----------------------
function Lua_Z28_123156speak()	--多摩多對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426646 )==true and CountBodyItem( Player , 242939 )==0 then	
		AddSpeakOption( Player , NPC , "[SC_Z28Q426646_01]" , "Lua_Z28_123156speak2" , 0 )	--我沒有待烤的肉了
	elseif DW_CheckQuestAccept( "or" , Player , 426765 )==true or DW_CheckQuestAccept( "or" , Player , 426770 )==true and CountBodyItem( Player , 242939 )==0 then	--委託426765+公眾426770 祭品當然越多越好
		AddSpeakOption( Player , NPC , "[SC_Z28Q426646_01]" , "Lua_Z28_123156speak2" , 0 )	--我沒有待烤的肉了
	end
end

function Lua_Z28_123156speak2()
	LoadQuestOption( OwnerID() )
	local Num = 5 - CountBodyItem( OwnerID() , 241746 )
	if Num == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Z28Q426646_06]", 0 )	--你已經備足烤肉
	else		
		for i = 1 , Num do
			Givebodyitem( OwnerID() , 242939 , 1 )
		end
	end
end	

function Lua_jiyi_Z28_121116touch()
	if CountBodyItem( OwnerID() , 242939 ) > 0 and CountBodyItem( OwnerID() , 241746 ) < 5 then	--242939 待烤生肉241746烤好的肉
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Z28Q426646_02]", 0 )	--你身上已經沒有物品了
		return false
	end
end

function Lua_jiyi_Z28_121116touch2()
	--機率表
	local num =Rand( 100 )
	--Say( OwnerID(),num)
	----1/3獲得物品：成功。
	if num>= 30 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426646_03]" , 0 )	--你成功烤出祭典用的肉
		GiveBodyItem( OwnerID() , 241746 , 1 )
	----1/3不熟。
	elseif num>= 15 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426646_04]" , 0 )	--烤過熟了不能獻給祖靈阿...
	----1/3過熟。
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426646_05]" , 0 )	--沒烤熟的肉誰要吃阿?
	end
	DelBodyItem( OwnerID() , 242939 , 1 )
	return 1
end

function Lua_jiyi_Z28_426646Complete()
	local player = TargetID()
	SetFlag( player , 548546 , 1 )
end
-----------------------------426647是誰偷走食物？----------------------------
function Lua_Z28_426647accept()
	local Player = TargetID()
 	local NPC = OwnerID()
	Addbuff( Player , 622930 , 0 , 50 )
end

function Lua_Z28_426647complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	Cancelbuff( Player , 622930 )
end

function Lua_Z28_426647objbegin()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or", Player , 426647 ) == true then	
		if Checkbuff( Player , 622930 ) == true then
			return true
		else
			return false
		end
	else		
		return false
	end
end
	
function Lua_Z28_426647objend()
	local player = OwnerID()
	DW_QietKillOne( 0 , 107935 )	--靜靜的殺死107935怪，前者殺死後者，0代表為玩家
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426647_01]" , 0 )	--除了一些像鹿蹄的腳印，沒有任何可疑的地方
	return true	
end			
-----------------------------426649奇怪偏方-----------------------------
function Lua_jiyi_Z28_209987check()	--蝸牛體液使用檢查
	local Player = OwnerID()
	if CheckAcceptQuest( Player , 426649 ) == true then
		if Countbodyitem( Player , 209988 ) > 0 then
			return true
		else
			ScriptMessage( Player,Player, 1, "[SC_Z28Q426649_01]", 0 ) 	--你沒有相關物品
			return false
		end
	end
end

function Lua_jiyi_Z28_623291use()
	local player = OwnerID()
	DelBodyItem( player , 209988 , 1 )
--	DelBodyItem( player , 209987 , 1 )	 	
	GiveBodyItem( player , 243071 , 1 )
end
---------------------------------426650每個勇士身邊都會有一隻蜥蜴----------------------------
function Lua_Z28_123159speak()	--撒奇萊雅對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426650 )==true and CountBodyItem( Player , 241745 )==0 and CountBodyItem( Player , 243072 ) == 0 then	
		AddSpeakOption( Player , NPC , "[SC_Z28Q426650_01]" , "Lua_Z28_123159speak2" , 0 )	--我把草繩弄丟了...
	end
end

function Lua_Z28_123159speak2()
	local Player = OwnerID()
	SetSpeakDetail( player , "[SC_Z28Q426650_02]" )	--還好我有做另一條，給你吧
	givebodyitem( player , 241745 , 1 )
end		
	
function Lua_Z28_241745check()	--草繩使用檢查Lua
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local Rope = 107345
	if CheckAcceptQuest( player , 426650 ) == true then
		if Countbodyitem( player , 243072 ) > 0 then
			ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_06]" , 0 )	--你已經抓到壁岩蜥
			return false
		elseif TOrgID == Rope then 
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_05]" , 0 )	--系統告知"非有效目標"
			return false
		end
	end
end		

function Lua_Z28_241745use()	--草繩使用Lua
	local player = OwnerID()
	local tar = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_03]" , 0 )	--蜥蜴馬上掙脫草繩，情急之下，你徒手將蜥蜴打暈...
	GiveBodyItem( player , 243072 , 1 )
	Callplot( player , "Lua_Z28_241745use2" , player , tar )
end

function Lua_Z28_241745use2( player , tar )
	local RoomID = ReadRoleValue( player , EM_RoleValue_RoomID)
	hide( tar )
	sleep(100)
	show( tar , RoomID )
--	AddToPartition( tar , RoomID )
end			
--任務結束表演
function Lua_jiyi_Z28_426650Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781360
 	local CliBuff = 623289	--表演用演員顯示BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----如果暫存值為0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z28_426650Complete2" , NPC , Player , Flag , CliBuff )    ----接演戲function
    	else
		LoadQuestOption(Player)  
 	end 
end

function Lua_jiyi_Z28_426650Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122874 , Flag , 2 , 1 , 1 )     --產生演員 
	ks_ActSetMode( Actor )
	Sleep(10) 
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	ScriptMessage( Player,Player, 1, "[SC_Z28Q426650_04]", 0 )	--看到蜥蜴醒來要攻擊薩奇萊雅，薩奇萊雅嚇得往後退了一大步，蜥蜴趁隙逃走...
	DW_MoveToFlag( Actor , Flag , 3 , 0 , 1 ) 
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end