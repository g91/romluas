--------------佈置用--------------
function Lua_Z29_jiyi_STARKspeak()	--NPC對話劇情
	SetPlot( OwnerID() , "touch" , "Lua_Z29_jiyi_STARKspeak2" , 30 )
	SetCursorType( OwnerID() , eCursor_Speak)
end
	 
function Lua_Z29_jiyi_STARKspeak2()
--	local num = Rand(5)+1	
	AdjustFaceDir( TargetID(),OwnerID(),0)
--	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")
	local Speak = {[1] = "[SC_Z29_NPCSPEAKING_01]" ,
			[2] = "[SC_Z29_NPCSPEAKING_02]" ,
			[3] = "[SC_Z29_NPCSPEAKING_03]" ,
			[4] = "[SC_Z29_NPCSPEAKING_04]" ,
			[5] = "[SC_Z29_NPCSPEAKING_05]" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	NPCSay ( TargetID() , Speak[RandNum] )
end

function Lua_Z29_jiyi_108232_01()	--黑巢巨猿動作1
	PlayMotion( OwnerID()  , 37 )
	sleep(30)
	PlayMotion( OwnerID()  , 38 )
end

function Lua_Z29_jiyi_108232_02()	--黑巢巨猿動作2
	PlayMotion( OwnerID()  , 33 )
	sleep(10)
	PlayMotion( OwnerID()  , 38 )
end

function Lua_Z29_jiyi_123263()	--攀爬位置
	local Mobile = OwnerID()
	AddBuff( Mobile , 625204, 0, -1 )
	SetPlot( Mobile , "range" , "Lua_Z29_jiyi_Mobile1" , 30 )  	
end

function Lua_Z29_jiyi_Mobile1()
	local Player = OwnerID()
	local Mobile = TargetID()	--攀爬位置
	local PID = ReadRoleValue( Mobile , EM_RoleValue_PID )
	if PID == 1 then
		SetPosByFlag( Player , 781378 , 1 )	--上
	elseif PID == 2 then
		SetPosByFlag( Player , 781378 , 0 )	--下
	end 	
end

function Lua_Z29_122562_Motion()	--122562營地大廚動作
	local NPC=OwnerID()
	local Num=DW_Rand( 3 )*10
	PlayMotion( NPC , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( Num+30 )
	PlayMotion( NPC , ruFUSION_ACTORSTATE_CRAFTING_END )
end

function Lua_Z29_jiyi_Walamotion()	--漥啦族動作
	local npc = OwnerID()
	local Motion = {[1] = ruFUSION_ACTORSTATE_BUFF_SP01 ,
			[2] = ruFUSION_MIME_CAST_SP01 ,
			[3] = ruFUSION_ACTORSTATE_CAST_SP01 }
	local RandNum = DW_Rand( table.getn ( Motion ) )
	PlayMotion( npc , Motion[RandNum] )
end
---------------------------------------支線：426821完成解藥 委託+公眾：426846+426856解藥搖一搖-------------------------------
function Lua_Z29_123215_Touch()		--研究器具的碰觸劇情
	local Machine = OwnerID()
	SetPlot( Machine , "touch", "Lua_Z29_123215_Touch2", 30 )
end

function Lua_Z29_123215_Touch2()
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01 = ReadRoleValue( Machine , EM_RoleValue_Register1 )
	DW_CancelTypeBuff( 68 , Player )						--取消騎乘狀態
	if DW_CheckQuestAccept( "or" , Player , 426821 ) == true 		or 
	DW_CheckQuestAccept( "or" , Player , 426846 ) == true 		or 
	DW_CheckQuestAccept( "or" , Player , 426856 ) == true 		and	--如果條件符合：有接完成解藥任務
	CountBodyItem( Player , 242942 ) > 0				and	--除寄生劑半成品
	CountBodyItem( Player , 209973 ) < 5				then	--除寄生劑
		if Num01 == 0 then	----判斷參數值
			WriteRoleValue( Machine , EM_RoleValue_Register1 , 999 )		--Register1寫成999，將計數functuon鎖起來												
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_01]" , 0 )	--"請利用移動搖晃[123215]"					
			CallPlot( Machine , "Lua_Z29_123215_Count" , Machine , Player )	--每秒判斷Register1值
			if BeginCastBarEvent( Player , Machine , "[SC_Z29Q426821_02]" , 80 , ruFUSION_ACTORSTATE_GATHER_BEGIN , ruFUSION_ACTORSTATE_GATHER_END , 0 , "Lua_Z29_123215_Touch3" ) ~= 1 then
									--"搖晃研究器具"											--判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )	--有其他人在使用這個器具…
				ScriptMessage( Player , Player , 0 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )			
			end
		end
	elseif DW_CheckQuestAccept( "or" , Player , 426821 ) == true 	or 
	DW_CheckQuestAccept( "or" , Player , 426846 ) == true 		or 
	DW_CheckQuestAccept( "or" , Player , 426856 ) == true 		and 
	CountBodyItem( Player , 242942 ) == 0 then
		ScriptMessage( Player, Player, 1 , "[SC_Z27Q426448_01]" , "0xffbf0b2b" )	--"你沒有可以使用的物品…"
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )	--"使用條件不符合。"
		ScriptMessage( Player , Player , 0 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )
	end
end

function Lua_Z29_123215_Touch3( Player , CheckStatus )
	local Player = OwnerID()
	local Machine = TargetID()
	EndCastBar( Player , CheckStatus )
	WriteRoleValue( Machine , EM_RoleValue_Register1 , 0 )
	Sleep(10)
	local Num02 = ReadRoleValue( Machine , EM_RoleValue_Register2 )
	if ( CheckStatus ~= 0 ) then
		if Num02 <= 30 then
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_04]" , 0 )	--搖晃不夠均勻，除寄生劑製作失敗…
			DelBodyItem( Player , 242942 , 1 )
		elseif Num02 <= 50 then
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_05]" , 0 )	--除寄生劑製作完成
			DelBodyItem( Player , 242942 , 1 )
			GiveBodyItem( Player , 209973 , 1 )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_06]" , 0 )	--搖晃太用力，除寄生劑製作失敗…
			DelBodyItem( Player , 242942 , 1 )
		end
	else
		EndCastBar( Player , CheckStatus )
	end
	WriteRoleValue( Machine , EM_RoleValue_Register2 , 0 )
end

function Lua_Z29_123215_Count( Machine , Player )
	for i= 1 , 80 , 1 do
		local Num01 = ReadRoleValue( Machine , EM_RoleValue_Register1 )
		if Num01 == 0 then
			return
		end
		Sleep(1)
		local y=i%10					----每10（1秒）一次判斷，共8次						
			if y==0 then
				WriteRoleValue( Machine , EM_RoleValue_Register2 , i )
			end
	end
	return
end

function Lua_jiyi_Z29_426821_Retake()		--重新拿半成品
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426821 )==true or 
	DW_CheckQuestAccept( "or" , Player , 426846 ) == true or 
	DW_CheckQuestAccept( "or" , Player , 426856 ) == true then	
		if CountBodyItem( Player , 242942 ) == 0 and CountBodyItem( Player , 209973 )<5 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426821_07]" , "Lua_jiyi_Z29_426821_Retake2(1)" , 0 )
		end
	elseif DW_CheckQuestAccept( "or" , Player , 426822 )==true or 
	DW_CheckQuestAccept( "or" , Player , 426847 ) == true or 
	DW_CheckQuestAccept( "or" , Player , 426857 ) == true then	
		if CountBodyItem( Player , 242943 ) == 0 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426822_03]" , "Lua_jiyi_Z29_426821_Retake2(2)" , 0 )	--再給我一些[242943]吧！
		end
	end
end

function Lua_jiyi_Z29_426821_Retake2(Item)
	local Player = OwnerID()
	CloseSpeak( Player )
	if Item == 1 then
		local Num = 5 - CountBodyItem( Player , 242942 )
		for i = 1 , Num do
			GiveBodyItem( Player , 242942 , 1 )
		end
	elseif Item == 2 then
		GiveBodyItem( Player , 242943 , 5 )
	end			
end
-------------------------------支線：426822減少犧牲 委託+PE：426847+426857拯救寄生生物---------------------------------
function Lua_Z29_242943check()	--除寄生劑檢查LUA
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Animal = { [1]=108245 , [2]=108247 }	--刺棘血藤寄生古洛、刺棘血藤寄生巨熊
	if DW_CheckQuestAccept("or", Player , 426822 ) == true or 
	DW_CheckQuestAccept("or", Player , 426847 ) == true or 
	DW_CheckQuestAccept("or", Player , 426857 ) == true then
		if TOrgID == Animal[1] or TOrgID == Animal[2] then
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--系統告知"非有效目標"						
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--系統告知"使用條件不符合。"
		return false
	end
end			

function Lua_Z29_242943use()	--除寄生劑使用LUA
	local Player = OwnerID()
	local Tar = TargetID()
	local MaxHP = ReadRoleValue( Tar , EM_RoleValue_MaxHP )		--總血量
	local NowHP = ReadRoleValue( Tar , EM_RoleValue_HP )			--當前血量
	local HPPercent = ( NowHP / MaxHP )*100					--血量百分比
	if HPPercent <= 50  and HPPercent > 0 then	--血量少於50%時
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426822_01]" , 0 )	--"被寄生的生物漸漸恢復意識，不再主動攻擊你…"
		Callplot( Player , "Lua_Z29_242943use2" , Player , Tar )
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426822_02]" , 0 )	--"被寄生的生物似乎非常焦慮，請先削弱牠的攻擊…"					
	end
end

function Lua_Z29_242943use2( Player , Tar )
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Animal = { [1]=108245 , [2]=108247 }	--刺棘血藤寄生古洛、刺棘血藤寄生巨熊
	local x , y , z , dir = DW_Location( Tar )
	sleep(10)
	hide(Tar)
	DW_QietKillOne( 0 , 107944 )	--靜靜的殺死107944怪，前者殺死後者，0代表為玩家	
	if TOrgID == Animal[1] then
		local NewNPC = CreateObj( 108139 , x , y , z , dir , 1 )
		AddToPartition( NewNPC , 0 )
		Beginplot( NewNPC , "Lua_Z29_242943use3" , 0 )	
	elseif TOrgID == Animal[2] then
		local NewNPC = CreateObj( 108140 , x , y , z , dir , 1 )
		AddToPartition( NewNPC , 0 )
		Beginplot( NewNPC , "Lua_Z29_242943use3" , 0 )	
	end
	Sleep(10) 
	LuaFunc_ResetObj( Tar )
end

function Lua_Z29_242943use3()
	local NPC = OwnerID()
	local Player = TargetID()
	local dis = Rand( 100 )    --有玩家則移動距離
	if dis < 50 then
		dis = 50
	end
	SetDir( NPC , 180 )  
	AdjustFaceDir( NPC , Player , 180 )	--面向背對
	WriteRoleValue( NPC , EM_RoleValue_IsWalk , 2 )
	sleep(5)
	Lua_MoveLine( NPC , dis )	--參考物件，向前移動到Dis距離的位置(Dis填負數為向後移動)
	sleep(50 )
	Delobj( NPC )
end
--------------------------------------------426823取得信任-----------------------------------
function Lua_Z29_426823accept()	--接下任務後給426824收成不好的前置旗標
	local Player = TargetID()
 	local NPC = OwnerID()
	Setflag( Player , 548547 , 1 )
end	
----------------------------------------------支線：426824收成不好 委託+PE：426848+426858漥啦菇農---------------------------------
function Lua_Z29_123218start()	--漥啦菇初始劇情
	local Mushroom = OwnerID()
	while true do
		if Checkbuff( Mushroom , 625116 ) == false then
			Addbuff( Mushroom , 625116 , 0 , -1 )
		end
	Sleep(100)
	end
end

function Lua_Z29_209975_check()	--巴戟草使用檢查
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Mushroom = 123218
	if DW_CheckQuestAccept("or", Player , 426824 ) == true or 
	DW_CheckQuestAccept("or", Player , 426848 ) == true or 
	DW_CheckQuestAccept("or", Player , 426858 ) == true then
		if TOrgID == Mushroom then
			if Checkbuff( Tar , 625116 ) == true then
				return true
			elseif Checkbuff( Tar , 625116 ) == false then
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426824_01]" , 0 )	--"這朵漥啦菇沒有受到蟲害！"
				return false
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--系統告知"非有效目標"
			return false						
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--系統告知"使用條件不符合。"
		return false
	end
end

function Lua_Z29_209975_use()	--巴戟草使用
	local Player = OwnerID()
	local Mushroom = TargetID()
	Cancelbuff( Mushroom , 625116 )
	local num =Rand( 100 )	--機率表
	if Countbodyitem( Player , 209974 ) < 5 then	
		if num>= 30 then		--1/3獲得物品：成功。
			Givebodyitem( Player , 209974 , 1 )
		elseif num>= 15 then	--1/3不熟。
			ScriptMessage( Player , Player , 2 , "[SC_Z29Q426824_02]" , 0 )	--漥啦菇還沒長大，不要殘害幼苗…
		else				--1/3過熟。
			ScriptMessage( Player , Player , 2 , "[SC_Z29Q426824_03]" , 0 )	--漥啦菇受到嚴重蟲害，已經無法食用…
		end
	else
		ScriptMessage( Player , Player , 2 , "[SC_Z29Q426824_04]" , 0 )	--你已經有足夠的菇
	end			
end

function Lua_Z29_426824complete()	--任務結束給予426823完成任務條件
	local Player = TargetID()
 	local NPC = OwnerID()
	GiveBodyItem(Player , 243268 , 1 )
	Setflag( Player , 547382 , 1 )
end

function Lua_Z29_123217speak()	--123217古拉艾對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept("or", Player , 426824 ) == true or 
	DW_CheckQuestAccept("or", Player , 426848 ) == true or 
	DW_CheckQuestAccept("or", Player , 426858 ) == true then
		if Countbodyitem( Player , 209975 ) == 0 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426824_05]" , "Lua_Z29_123217speak2(1)" , 0 )	--還有巴戟草嗎？
		end
	elseif CheckFlag( Player , 547382 ) == true and CountBodyItem( Player , 243268 ) == 0 then
		AddSpeakOption( Player , Player , "[SC_Z29Q426824_07]","Lua_Z29_123217speak2(2)" , 0 )	--你還有窪拉菇嗎？
	end
end

function Lua_Z29_123217speak2(num)
	local Player = OwnerID()
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z29Q426824_06]" )	--拿去，這裡很多。
		GiveBodyItem( Player , 209975 , 1 )
	elseif num == 2 then
		SetSpeakDetail( player , "[SC_Z29Q426824_08]" )	--這是剩下的窪拉菇，別再來跟我討菇了。
		GiveBodyItem( Player , 243268 , 1 )
	end		
end				
---------------------------------支線：426825抓鼠取光 委託+PE：426849+426859捕捉光源-----------------------------------
function Lua_Z29_242940use(Option)	--鼠籠劇情
	local Player = OwnerID()
	local Tar = TargetID()	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Animal = 108267	--翡翠晶鼠

	if ( Option == "CHECK" ) then	--物品檢查劇情
		local BuffType = 0
		if DW_CheckQuestAccept("or", Player , 426825 ) == true or 
		DW_CheckQuestAccept("or", Player , 426849 ) == true or 
		DW_CheckQuestAccept("or", Player , 426859 ) == true then
			return true
		elseif BuffType == 68 then				       	    --/*有騎乘狀態無法使用
			ScriptMessage( Player , Player , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false	
		end
	elseif ( Option == "USE" ) then	--物品使用劇情
		BeginPlot( Player , "Lua_Z29_242940use2" , 0 )  
	end
end

function Lua_Z29_242940use2()	--產生陷阱
	local Player = OwnerID()
	local Trap = DW_CreateObjEX("obj", 122377 , Player )
	SetModeEx( Trap , EM_SetModeType_Show , true )		--顯示
	SetModeEx( Trap , EM_SetModeType_Strikback , false )	--反擊
	SetModeEx( Trap , EM_SetModeType_SearchenemyIgnore , false )	--被搜尋
	SetModeEx( Trap , EM_SetModeType_Mark , true )	--標記
	SetModeEx( Trap , EM_SetModeType_Move , false )	--移動
	SetModeEx( Trap , EM_SetModeType_Searchenemy , false )	--索敵
	SetModeEx( Trap , EM_SetModeType_HideName , true )	--名稱
	SetModeEx( Trap , EM_SetModeType_ShowRoleHead , false )	--頭像框
	SetModeEx( Trap , EM_SetModeType_Fight , false )		--可砍殺攻擊
	SetModeEx( Trap , EM_SetModeType_Strikback , false )	--反擊
	SetModeEx( Trap , EM_SetModeType_Obstruct , false )	--阻擋
	SetModeEx( Trap , EM_SetModeType_Gravity , true )	--重力
	AddToPartition( Trap , 0 )
	Callplot( Trap , "Lua_Z29_122377use" , Player )
end

function Lua_Z29_122377use(Player)	--鼠籠產生劇情
	local Trap = OwnerID()	--鼠籠
	local Mouse = Lua_Hao_NPC_Closest_Search( Trap , 108267 , 50 ) -- 以Owner為中心做范圍搜尋，回傳最接近的物件
	local X = ReadRoleValue( Trap , EM_RoleValue_X )
	local Y = ReadRoleValue( Trap , EM_RoleValue_Y )
	local Z = ReadRoleValue( Trap , EM_RoleValue_Z )
	local sec = Move( Mouse , X , Y , Z )
	Sleep(10) 
	if Mouse == 0 then
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426825_01]" , 0 )	--使用範圍內無翡翠晶鼠 
	else
		Beginplot( Mouse , "Lua_Z29_122377use2" , 0 )
		sleep(10)
		Givebodyitem( Player , 242941 , 1 )
	end
	Delobj(Trap)
end	

function Lua_Z29_122377use2()
	LuaFunc_ResetObj( OwnerID() )
end

function Lua_jiyi_Z29_123220_Retake()		--重新拿鼠籠
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426825 ) == true or
	DW_CheckQuestAccept("or", Player , 426849 ) == true or 
	DW_CheckQuestAccept("or", Player , 426859 ) == true then	
		if CountBodyItem( Player , 242940 ) == 0 and CountBodyItem( Player , 242941 ) <5 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426825_02]" , "Lua_jiyi_Z29_123220_Retake2" , 0 )	--我想再跟你拿一些透光鼠籠
		end
	end
end

function Lua_jiyi_Z29_123220_Retake2()
	local Player = OwnerID()
	CloseSpeak( Player )
	local Num = 5 - CountBodyItem( Player , 242941 )
	for i = 1 , Num do
		GiveBodyItem( Player , 242940 , 1 )
	end		
end
---------------------------426816法蘭克的生存之道------------------------
function Lua_Z29_121804speak()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426816 ) == true and Countbodyitem( Player , 241974 ) >= 5 then	
		AddSpeakOption( Player , NPC , "[SC_Z29Q426816_01]" , "Lua_Z29_121804speak2(1)" , 0 )	--這裡有一些糧食...
	elseif DW_CheckQuestAccept( "or" , Player , 426827 ) == true then	--426827減少蜂量
		if Checkflag( Player , 547526 ) == false then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426827_01]" , "Lua_Z29_121804speak2(2)" , 0 )	--聽說妳有可以降低女王蜂生育的好東西？
		else
			LoadQuestOption( Player )	
		end				
	end
end

function Lua_Z29_121804speak2(Item)
	local Player = OwnerID()
	if Item == 1 then
		SetSpeakDetail( player , "[SC_Z29Q426816_02]" )	--這些不是我們被法蘭克海盜搶走的糧食？是不是克羅克．達爾從煉獄營地搶回來的？
								--當初馬克．愛倫曼雖然是不得已跟法蘭克海盜團合作，一起來到這個塞勒裴地亞盆地，不過我們大家都錯估了法蘭克海盜的臭名聲，
								--才會被他們捅了一刀，所有資源都被法蘭克海盜搶走，被迫在這個野獸環繞的地方紮下營地，導致現在前有野獸，後有鯊魚的窘境，
								--真的不能怪我們搶回這些糧食，史塔克的團規可是「交易對等原則」，怎麼能做虧本生意呢？
		Setflag( Player , 547525 , 1 )
	elseif Item == 2 then
		SetSpeakDetail( player , "[SC_Z29Q426827_02]" )	--你是艾力克的大副，我看過你幫忙抵擋攻擊營地死亡食肉蜂的英姿！
									--你要尋問可以降低食肉女王蜂生育的方法？
									--太好了，如果是你，一定可以成功降低食肉女王蜂的生育能力。
		Setflag( Player , 547526 , 1 )			
	end				
end
-----------------------------426826史塔克的作風------------------------
function Lua_Z29_241973check()	--241973心臟草藥粉使用前檢查
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Food = 121803	--糧食包
	if DW_CheckQuestAccept("or", Player , 426826 ) == true then
		if TOrgID == Food then
			if Checkbuff( Tar , 623881 ) == true then
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426826_01]" , 0 )	--"這糧食似乎有下過藥，別再放藥進去了…"
				return false
			elseif Checkbuff( Tar , 623881 ) == false then
				return true
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--系統告知"非有效目標"
			return false									
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--系統告知"使用條件不符合。"
		return false
	end
end

function Lua_Z29_623882use()
	local Player = OwnerID()
	local Food = TargetID()
	Addbuff( Food , 623881 , 0 , 10 )	--下過藥BUFF
	DW_QietKillOne( 0 , 108330 )	--靜靜的殺死108330怪，前者殺死後者，0代表為玩家		
	ScriptMessage( Player , Player , 1 , "[SC_Z29Q426826_02]" , 0 )	--你在食物堆裡下藥...
end

function Lua_Z29_122376speak()	--再拿一些藥粉
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426826 ) == true then	
		if CountBodyItem( Player , 241973 ) == 0 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426826_03]" , "Lua_Z29_122376speak2" , 0 )	--藥粉似乎不太夠…
		end
	end
end

function Lua_Z29_122376speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	GiveBodyItem( Player , 241973 , 1 )
end
--------------------------------426828幸運之羽----------------------------------------
-------任務結束退場:旗標2生成走到旗標3
function Lua_Z29_426828_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623906
	local Flag = 781378
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----如果暫存值為0
		 WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player , CliBuff , 0 , 15 )
 	 	CallPlot( NPC , "Lua_Z29_426828_Complete2" , NPC , Player , Flag , CliBuff )    ----接演戲function      
 	end 
end

function Lua_Z29_426828_Complete2( NPC , Player , Flag , CliBuff )
	local New_NPC = Lua_DW_CreateObj("flag" , 123265 , Flag , 2 , 1 , 0 )     --產生演員 
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
 	Sleep(10)
	Say(New_NPC , "[SC_Z29Q426828_01]" )
 	DW_MoveToFlag( New_NPC , Flag , 3 , 0 , 1 )
 	Sleep(10)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end
--------------------------------426829打獵獻祭----------------------------------------
function Lua_Z29_243100_use(Option)	--特製飛刀使用劇情
	local Player = OwnerID()
	local Tar = TargetID()	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Animal = 108264	--芋葉乓骨

	if ( Option == "CHECK" ) then	--物品檢查劇情
		local BuffType = 0
		if DW_CheckQuestAccept("or", Player , 426829 ) == true and TOrgID == Animal then
			if Checkbuff( Player , 625192 ) == false then
				return true
			else
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426829_01]" , 0 )	--請先使用[499045]進行獵捕…
				return false
			end				
		elseif BuffType == 68 then				       	    --/*有騎乘狀態無法使用
			ScriptMessage( Player , Player , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false	
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--非有效目標
			return false
		end
	end
end

function Lua_Z29_243100_use2()
	local Player = OwnerID()
	local Tar = TargetID()		
	Addbuff( Player , 625192 , 0 , 10 )	--給玩家捕捉技能
	Addbuff( Tar , 625193 , 0 , 20 )	--給乓骨虛弱狀態
end	
	
function Lua_Z29_499045_check()	--捕捉技能檢查
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Animal = 108264	--芋葉乓骨
	if CheckAcceptQuest( player , 426829 ) == true and TOrgID == Animal then
		if Checkbuff( Tar , 625193 ) == true then	--檢查芋葉乓骨是否有「虛弱狀態」		
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426829_02]" , 0 )	--目標身上沒有虛弱狀態，芋葉乓骨掙脫逃走了…
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--非有效目標
		return false	
	end
end

function Lua_Z29_625194_use()
	local Player = OwnerID()
	local Tar = TargetID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	Hide(Tar)	
	Cancelbuff( Player , 625192 )
	DW_QietKillOne( 0 , 106570 )	--靜靜的殺死106570怪，前者殺死後者，0代表為玩家
	Callplot( Player , "Lua_Z29_625194_use2" , Tar )	
end

function Lua_Z29_625194_use2(Tar)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	sleep(100)
	show( Tar , RoomID )
end

function Lua_Z29_123266speak()	--雷斯寇．培特對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426829 ) == true and Countbodyitem( player , 243100 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z29Q426829_03]","Lua_Z29_123266speak2" , 0 )	--飛刀不夠用了…
	end
end

function Lua_Z29_123266speak2()
	local player = OwnerID()
	SetSpeakDetail( player , "[SC_Z29Q426829_04]" )	--我這裡還有一些，你拿去用吧！
	local Num = 5 - CountBodyItem( player , 243100 )
	for i = 1 , Num do
		Givebodyitem( player , 243100 , 1 )
	end
end
------------------------------426830燃煙引蜂-----------------------------------
function Lua_Z29_123294_touch()	--123294燃煙器初始劇情
	local Fire = OwnerID()

	SetPlot( Fire , "touch", "Lua_Z29_123294_touch2", 30 )	
end

function Lua_Z29_123294_touch2()
	local Player = OwnerID()
	local Fire = TargetID()
	if CheckAcceptQuest( Player , 426830 ) == true then
		if Countbodyitem( Player , 243101 ) >0 then
			SetPlot( Fire , "touch" , "" , 30 )	--讓其他人無法再點擊燃煙器
			CallPlot( Fire , "Lua_Z29_123294_NpcProduce" , Fire , Player )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426830_01]" , 0 )	--你沒有可以點燃[123294]的物品。
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426830_02]" , 0 )	--一個普通的盒子，上面似乎有燃燒過的痕跡…
	end
end			

function Lua_Z29_123294_NpcProduce( Fire , Player )	--女王蜂產生劇情
	local Fire = OwnerID()
	PlayMotion( Player , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	Addbuff( Fire , 625198 , 0 , 10 )
	local Bee = Lua_DW_CreateObj("flag" , 108261 , 781378 , 4 , 1 , 0 )     --在4號旗標產生女王蜂
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	AddToPartition( Bee , Room )
	WriteRoleValue( Fire , EM_RoleValue_Register9 , Bee )	--將女王蜂記在點燃器中
	Delbodyitem( Player , 243101 , 1 )
	Beginplot( Fire , "Lua_Z29_123294_Check" , 0 )
end		

function Lua_Z29_123294_Check()
	local Fire = OwnerID()
	local newbee = ReadRoleValue( Fire , EM_RoleValue_Register9 )
	while true do
		if CheckID( newbee ) == false then --檢查女王蜂是否存在
	--		say( Fire , "i'm reset" )
			SetPlot( Fire , "touch", "Lua_Z29_123294_touch2", 30 )
			break
		end
	sleep(10)
	end
end
-------------------------------426916樹精與礦石------------------------------
function Lua_Z29_426916_Accept()	--接任務後觸發劇情
	local player = TargetID()
	SetFlag( player , 547524 , 1 )	
end
-------------------------------426917調查研究法------------------------------
function Lua_Z29_426917_Complete()	--任務結束觸發劇情
	local player = TargetID()
	SetFlag( player , 548166 , 1 )	--給判斷426917完成任務旗標
	GiveBodyItem( player , 208973 , 1 )
end

function Lua_Z29_122647_Speak()	--珍．密尼對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckFlag( player , 548166 ) == true and Countbodyitem( player , 208973 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z29Q426917_01]","Lua_Z29_122647_Speak2" , 0 )	--我把[208973]搞丟了…
	end
end

function Lua_Z29_122647_Speak2()
	local player = OwnerID()
	SetSpeakDetail( player , "[SC_Z29Q426829_04]" )	--我這裡還有一些，你拿去用吧！
	Givebodyitem( player , 208973 , 1 )
end
-------------------------------426918 護貂使者--------------------------------
function Lua_Z29_620451_use()	--餵食技能執行劇情
	local player = OwnerID() --玩家
	local Mink = TargetID()
	local NewX , NewY , NewZ , NewDir = DW_Location( player )
	local Food = CreateObj( 122646 , NewX , NewY , NewZ , NewDir , 1 )
	ks_ActSetMode( Food )
	PlayMotionex ( player , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END ) 
	Beginplot( Food , "Lua_Z29_122646_begin" , 0 )	
end	

function Lua_Z29_122646_begin()	--食物的產生劇情
	local Food = OwnerID()
	local Player = TargetID()
	local X = ReadRoleValue( Food , EM_RoleValue_X )
	local Y = ReadRoleValue( Food , EM_RoleValue_Y )
	local Z = ReadRoleValue( Food , EM_RoleValue_Z )
	while true do
		local Mink = Lua_Hao_NPC_Closest_Search( Food , 122570  , 50 )	-- 以Owner為中心做范圍搜尋，回傳最接近的物件
		if Mink == 0 then
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426918_01]" , 0 )	--使用範圍內無蜜貂
			sleep( 100 )
			Delobj( Food )	
		else
			local sec = Move( Mink , X , Y , Z )
			ScriptMessage( Player , player , 0 , "[SC_Z29Q426918_02]" , C_SYSTEM )--提示訊息：蜜貂受引誘
			sleep(50)
			Delobj( Food )
		end
	sleep(10)
	end	
end

function Lua_Z29_122570_Begin()	--小蜜貂產生劇情(中控器)
	local Mink = OwnerID()
	local Player = ReadRoleValue( Mink , EM_RoleValue_Register1 )
	local Dis
	local Buff = 508195	--給活動技能

	while true do  --每秒偵測
		if CheckBuff( Player , Buff ) == false then	--檢查玩家是否有"給活動技能"BUFF>>玩家在活動中一定會有此BUFF
			break
		end	

		if CheckID( Player ) == false then	--檢查玩家是否離線
			break
		else --當玩家在線上
			Dis = GetDistance( Mink , Player )	--檢查當下玩家和隱藏物件之間的距離
	   		if Dis < 100 then
	   			--進行中
	   		elseif Dis >= 90 and Dis < 150 then 
	   			ScriptMessage( Mink , Player , 2 , "[SC_Z29Q426918_03]" , C_SYSTEM ) --系統顯示警告訊息：即將超過活動範圍
	   		elseif Dis >=150 then
	   			ScriptMessage( Mink , Player , 2 , "[SC_Z29Q426918_04]" , C_SYSTEM )--系統顯示警告訊息：離開活動範圍	
	   			Sleep(10)
	   			CancelBuff( Player , Buff )	--刪除活動用技能	
	   			break --跳出迴圈
	   		end

			local Mink_Older = SearchRangeNPC( Mink , 50 )
			local OrgID = 122564	--焦躁的蜜貂
			for i = 0 , table.getn(Mink_Older) do
				if ReadRoleValue( Mink_Older[i] , EM_RoleValue_OrgID ) == OrgID then
					SetFollow( Mink , Mink_Older[i] )	--讓小蜜貂跟隨焦躁的蜜貂
					Setflag( Player , 547523 , 1 )	--給完成任務旗標
					Sleep(100)										
					break
				end
			end	 
		end
	Sleep(10) --執行while迴圈必須停1秒在繼續
	end
	CancelBuff( Player , Buff )	--刪除玩家活動技能
	if CheckFlag( Player , 547523 ) == true then --檢查玩家如果已經得到"小蜜貂回到同伴身邊"的旗標
		ScriptMessage( Player , Player , 2 , "[SC_Z29Q426918_05]" , C_SYSTEM )	--小蜜貂順利回到同伴身邊。
	else
		ScriptMessage( Player , Player , 2 , "[SC_Z29Q426918_06]" , C_SYSTEM )	--請向[122563]重新接取任務…
	end		
	Delobj( Mink )	
end

function Lua_Z29_122563_speak()	--薇朵．坦茲對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426918 ) == true then
		if Checkflag( player , 547523 ) == false and Checkbuff( player , 508195 ) == false then
			AddSpeakOption( player , player , "[SC_Z29Q426918_07]","Lua_Z29_122563_speak2" , 0 )	--讓我護送[122563]回同伴身邊吧！
		else
			LoadQuestOption( player )			
		end
	end
end

function Lua_Z29_122563_speak2()
	local player = OwnerID()
	local NPC = TargetID()
	Closespeak(player)
	local NewX , NewY , NewZ , NewDir = DW_Location( Player )
	local Mink = CreateObj( 122570 , NewX + 10 , NewY , NewZ , NewDir , 1 )
	ks_ActSetMode( Mink )	
	WriteRoleValue( Mink , EM_RoleValue_Register1 , Player ) --將玩家記在蜜貂的R1
	Beginplot( Mink , "Lua_Z29_122570_Begin" , 0 )
	Addbuff( Player , 508195 , 0 , 30 )	--給活動技能30秒
end
--------------------------------426912 誰是間諜？------------------------------------
function Lua_Z29_123456_speak()	--偽裝的史塔克海盜對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426912 ) == true and CheckFlag( player , 548167 ) == false then
		AddSpeakOption( player , player , "[SC_Z29Q426912_01]","Lua_Z29_123456_speak2" , 0 )	--[123455]叫我來跟你要…
	else
		LoadQuestOption( player )
	end
end	

function Lua_Z29_123456_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z29Q426912_02]" )	--噓，小聲點，想害我身分曝光嗎？
	SetFlag( Player , 548167 , 1 )
end
--------------------------------426913 臣服敵營------------------------------------
function Lua_Z29_123455_speak()	--保傑．猶大對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426913 ) == true and CheckFlag( player , 548168 ) == false then
		AddSpeakOption( player , player , "[SC_Z29Q426913_01]","Lua_Z29_123455_speak2" , 0 )	--[123456]要我跟你說…
	else
		LoadQuestOption( player )
	end
end	

function Lua_Z29_123455_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z29Q426913_02]" )	--(你將[123456]退出法蘭克海盜團的事情轉達給保傑‧猶大…)
	SetFlag( Player , 548168 , 1 )
end							