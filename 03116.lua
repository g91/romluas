-----------------------------426862 溝通------------------------------
function Lua_Z30_422656_Complete()	--任務結束表演劇情
	local Player = TargetID()
 	local NPC_Will = OwnerID()

	Setflag( Player , 548818 , 1 )
end

function Lua_Z30_121774_speak()	--帕里戰士對話劇情
	local player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426862 ) == true and CheckFlag( player , 548811 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426862_02]","Lua_Z30_121774_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end
--500429 眼前一黑
function Lua_Z30_121774_speak2()
	local Player = OwnerID()
	local NPC = TargetID()
--	local Reg1 = ReadRoleValue( NPC , EM_RoleValue_Register1 )	--記在帕里戰士身上的121771威爾
--	local PID = ReadRoleValue( Reg1 , EM_RoleValue_PID )	--控制表演開始=0開始表演，=1表演中
--	WriteRoleValue( Reg1 , EM_RoleValue_PID , 0 )	--將威爾的PID值寫成0
--	Yell( TargetID() ,"i'm target" , 3 )  
--	DebugMsg( 0 , 0 , "NPC="..NPC  )
	CloseSpeak( Player )
	Addbuff(Player , 500429 , 0 , 3 )
	sleep(10)
	SetFlag( Player , 548811 , 1 )
	Addbuff(Player , 620445 , 0 , -1 )	--Q426862過場表演
	SetPosByFlag( Player , 781382 , 0 )
	Cancelbuff( Player , 500429 )
--	Callplot( Reg1 , "Lua_jiyi_Cancelobj" , 121774 )
--	DelObj(NPC)	
--	ChangeZone( Player , 952 , 0 , 839.7 , -257.2 , 377.3 , 0 )
	sleep(10)
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426862_03]" , 0 )	--你似乎被帕里族戰士擊暈帶到火之守護…
end

function Lua_Z30_620445_Delete()
 	local Player = OwnerID()

 	if DW_CheckQuestAccept("or",Player, 426862) == false then
 		 CancelBuff(Player, 620445)	--Q426862過場表演
 	end
end

function Lua_Z30_426862_Complete()
	local Player = TargetID()
 	local NPC_Will = OwnerID()
	Setflag( Player , 548818 , 0 )	--關閉Cklinent條件旗標
end
-------------------------426863 禁止進入-----------------------
-------接受任務後退場
function Lua_jiyi_Z30_426863_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 504195
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
 	if Num == 0 then          ----如果暫存值為0
 		WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player, CliBuff , 0 , 15 )
 	 	CallPlot(NPC, "Lua_jiyi_Z30_426863_Accept2" , NPC, Player, CliBuff)    ----接演戲function      
 	end 
end

function Lua_jiyi_Z30_426863_Accept2(NPC, Player, CliBuff)
	local SeachNpc = SearchRangeNPC( NPC , 100 )
	local OrgID = { 122574 , 122576 }	--威爾、帕里族戰士
	local WalkFlag = 781382
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	for i = 0 , table.getn(SeachNpc) do		
		if ReadRoleValue( SeachNpc[i] , EM_RoleValue_OrgID ) == OrgID[1] then
			Beginplot( SeachNpc[i] , "Lua_Z30_123295Walk" , 0 )
		elseif ReadRoleValue( SeachNpc[i] , EM_RoleValue_OrgID ) == OrgID[2] then
			Beginplot( SeachNpc[i] , "Lua_Z30_123296Walk" , 0 )
		end
	end
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end

function Lua_Z30_123295Walk()
	local Will = OwnerID()
	local WalkFlag = 781382
	local New_NPC =  DW_CreateObjEX("obj", 123295 , Will )	--生成演戲威爾
	ks_ActSetMode( New_NPC )
--	NPCSAY(New_NPC, "i'm Will")
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 1)
	DW_MoveToFlag( New_NPC , WalkFlag , 2 , 0 , 1)
	Sleep(10)
	DelObj(New_NPC)
end

function Lua_Z30_123296Walk()
	local Pali = OwnerID()
	local WalkFlag = 781382
	local New_Pali =  DW_CreateObjEX("obj", 123296 , Pali )	--生成演戲帕里族戰士
	ks_ActSetMode( New_Pali )
--	NPCSAY(New_Pali, "i'm Pali")
	WriteRoleValue(New_Pali , EM_RoleValue_IsWalk , 1)
	DW_MoveToFlag( New_Pali , WalkFlag , 1 , 0 , 1)
	Sleep(10)
 	DelObj(New_Pali)
end		

function Lua_Z30_122577_speak()	--威爾對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426863 ) == true and CheckFlag( player , 548812 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426863_01]","Lua_Z30_122577_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end	

function Lua_Z30_122577_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426863_02]" )
	SetFlag( Player , 548812 , 1 )
end
--------------------------426864試探？-------------------------------
function Lua_Z30_122575_touch()	--122575火焰石初始劇情
	local Fire = OwnerID()
	SetPlot( Fire , "touch", "Lua_Z30_122575_touch2", 30 )	
end

function Lua_Z30_122575_touch2()	--122575火焰石執行劇情
	local Player = OwnerID()
	local Fire = TargetID()
	if CheckAcceptQuest( Player , 426864 ) == true then
		if Countbodyitem( Player , 240767 ) >0 then
			SetPlot( Fire , "touch" , "" , 30 )	--讓其他人無法再點擊火焰石
			CallPlot( Fire , "Lua_Z30_122575_touch3" , Fire , Player )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426864_01]" , 0 )	--你沒有可使用的物品
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426864_02]" , 0 )	--一顆普通的石頭，上面有許多磨損的痕跡…
	end
end

function Lua_Z30_122575_touch3( Fire , Player )
	--機率表
	local num =Rand( 100 )
	----1/3獲得物品：成功。
	if num>= 30 then
		ScriptMessage( Player , Player , 2 , "[SC_Z30_Q426864_03]" , 0 )	--你細心地將[240767]磨成[240768]…
		GiveBodyItem( Player , 240768 , 1 )	--給一個藥粉
	----1/3不熟。
	elseif num>= 15 then
		ScriptMessage( Player , Player , 2 , "[SC_Z30_Q426864_04]" , 0 )	--力道太大，[240767]都碎了…
	----1/3過熟。
	else
		ScriptMessage( Player , Player , 2 , "[SC_Z30_Q426864_05]" , 0 )	--力道太小，沒辦法使用…
	end
	SetPlot( Fire , "touch", "Lua_Z30_122575_touch2", 30 )	
	DelBodyItem( Player , 240767 , 1 )
	return 1
end

function Lua_Z30_122571speak()	--受傷的帕里戰士對話劇情
	local player = OwnerID()
	local BuffLv =  FN_CountBuffLevel( player , 503621 )	--檢查玩家身上BUFF
	local Speak = {[1] = "[SC_Z30_Q426864_15]" ,
			[2] = "[SC_Z30_Q426864_16]" ,
			[3] = "[SC_Z30_Q426864_17]" ,
			[4] = "[SC_Z30_Q426864_18]" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	SetSpeakDetail( Player , Speak[RandNum] )
	if CheckAcceptQuest( player , 426864 ) == true and BuffLv >= 4 then
--		say( player , "BuffLv="..BuffLv )
		AddSpeakOption( player , player , "[SC_Z30_Q426864_06]","Lua_Z30_122571speak2(2)" , 0 )
	elseif CheckAcceptQuest( player , 426864 ) == true and BuffLv < 4 then
--		say( player , "BuffLv="..BuffLv )
		AddSpeakOption( player , player , "[SC_Z30_Q426864_06]","Lua_Z30_122571speak2(1)" , 0 )
	else
		SetSpeakDetail( Player , Speak[RandNum] )		
	end
end

function Lua_Z30_122571speak2(Num)	--受傷的帕里戰士對話劇情
	local player = OwnerID()

	if Num == 1 then
		if Checkflag( player , 548813 ) == false and Checkbuff( TargetID() , 505190 ) == false then
			if Countbodyitem( player , 240768 ) > 0 then
				local Speak = {[1] = "[SC_Z30_Q426864_07]" ,
						[2] = "[SC_Z30_Q426864_08]" ,
						[3] = "[SC_Z30_Q426864_09]" }
				local RandNum = DW_Rand( table.getn ( Speak ) )
				SetSpeakDetail( player , Speak[RandNum] )
				DelBodyItem( player , 240768 , 1 )
				Addbuff( TargetID() , 505190 , 0 , 10 )				
				Addbuff( player , 503621 , 0 , -1 )
			else
				SetSpeakDetail( player , "[SC_Z30_Q426864_10]" )
			end				
		else
			SetSpeakDetail( player , "[SC_Z30_Q426864_11]" )
		end			
	elseif Num == 2 then
		Cancelbuff( player , 503621 )
		SetSpeakDetail( player , "[SC_Z30_Q426864_12]" )
		Setflag( player , 548813 , 1 )
	end
end

function Lua_Z30_121773_speak()	--帕里巫醫對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckFlag( player , 548813 ) == true and CheckFlag( player , 548814 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426864_13]","Lua_Z30_121773_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_121773_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426864_14]" )
	SetFlag( Player , 548814 , 1 )
end
--------------------------426865 戰況-------------------------------
function Lua_Z30_121772_speak()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426865 ) == true and CheckFlag( player , 548815 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426865_01]","Lua_Z30_121772_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_121772_speak2()
	local player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426865_02]" )
	SetFlag( Player , 548815 , 1 )
end			
---------------------------426866 防線-----------------------------------
function Lua_Z30_240769_check()	--火符石使用檢查
	local Player = OwnerID()
	local Tar = TargetID()	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Point = 122578	--燃火處
	if CheckAcceptQuest( player , 426866 ) == true then
		if TOrgID == Point then
			if Checkbuff( Tar , 503622 ) == false then
				return true
			else
				ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426866_01]" , 0 )	--此[122578]已經燃燒地非常旺盛…
				return false
			end				
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--系統告知"非有效目標"
			return false
		end
	else
		return false
	end
end

function Lua_Z30_240769_use()	--火符石使用劇情
	local Player = OwnerID()
	local Point = TargetID()
	Addbuff( Point , 503622 , 0 , 10 )	--火焰特效BUFF
	DW_QietKillOne( 0 , 107423 )	--靜靜的殺死107423怪，前者殺死後者，0代表為玩家		
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426866_02]" , 0 )	--你順利地點燃[122578]的火焰…
end
-----------------------------------426867 擊退-------------------------------
-------還任務後表演
function Lua_jiyi_Z30_426867_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781382
 	local CliBuff = 623908	--表演用演員顯示BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----如果暫存值為0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z30_426867_Complete2" , NPC , Player , Flag , CliBuff )    ----接演戲function
 	end 
end

function Lua_jiyi_Z30_426867_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122579 , Flag , 3 , 1 , 0 )     --在3號旗標產生演員 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	NPCSAY( Actor , "[SC_Z30_Q426867_01]" )
	sleep(20)
	NPCSAY( Actor , "[SC_Z30_Q426867_02]" )
	DW_MoveToFlag( Actor , Flag , 4 , 0 , 1 ) 
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end
--DW_MoveToFlag( ObjID , FlagObjID , FlagID, Range , Enable  )
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag
--------------------------------------426868 互相影響-----------------------------------
function Lua_Z30_122572_speak()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426868 ) == true and CheckFlag( player , 548816 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426868_01]","Lua_Z30_122572_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_122572_speak2()
	local player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426868_02]" )
	SetFlag( Player , 548816 , 1 )
end

function Lua_Z30_426868_ChickobjBegin()
	local player = OwnerID()
	local stone = TargetID()

	if DW_CheckQuestAccept("or", player , 426868 ) == true then	
		if Checkflag( Player , 548816 ) == true then
			return true
		else
			ScriptMessage( Player,Player, 1, "[SC_Z30_Q426868_03]", 0 ) 	--似乎是某種物品的碎片，看起來有被火燒過的痕跡
			return false
		end
	else		
		ScriptMessage( Player,Player, 1, "[SC_Z30_Q426868_03]", 0 ) 	--似乎是某種物品的碎片，看起來有被火燒過的痕跡
		return false
	end
end
------------------------------------------426869 坦希拉石像-------------------------------------------
function Lua_Z30_123365_Touch()	--123365共鳴處點擊劇情
	local Machine = OwnerID()
	SetPlot( Machine , "touch", "Lua_Z30_123365_Touch2", 30 )
end

function Lua_Z30_123365_Touch2()
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01 = ReadRoleValue( Machine , EM_RoleValue_Register1 )
	DW_CancelTypeBuff( 68 , Player )						--取消騎乘狀態
	if DW_CheckQuestAccept( "or" , Player , 426869 ) == true and CountBodyItem( Player , 241086 ) > 0 then
		if Num01 == 0 then	----判斷參數值
			WriteRoleValue( Machine , EM_RoleValue_Register1 , 999 )		--Register1寫成999，將計數functuon鎖起來												
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_01]" , 0 )	--"請利用移動控制供給能量的多寡"					
			CallPlot( Machine , "Lua_Z30_123365_Count" , Machine , Player )	--每秒判斷Register1值
			if BeginCastBarEvent( Player , Machine , "[SC_Z30_Q426869_02]" , 80 , ruFUSION_ACTORSTATE_GATHER_BEGIN , ruFUSION_ACTORSTATE_GATHER_END , 0 , "Lua_Z30_123365_Touch3" ) ~= 1 then
									--"搖晃研究器具"											--判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )	--有其他人在使用這個器具…
				ScriptMessage( Player , Player , 0 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )			
			end
		end
	elseif DW_CheckQuestAccept( "or" , Player , 426869 ) == true and CountBodyItem( Player , 241086 ) == 0 then
		ScriptMessage( Player, Player, 1 , "[SC_Z27Q426448_01]" , "0xffbf0b2b" )	--"你沒有可以使用的物品…"
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )	--"使用條件不符合。"
		ScriptMessage( Player , Player , 0 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )
	end
end

function Lua_Z30_123365_Touch3( Player , CheckStatus )
	local Player = OwnerID()
	local Machine = TargetID()
	EndCastBar( Player , CheckStatus )
	WriteRoleValue( Machine , EM_RoleValue_Register1 , 0 )
	Sleep(10)
	local Num02 = ReadRoleValue( Machine , EM_RoleValue_Register2 )
	if ( CheckStatus ~= 0 ) then
		if Num02 <= 30 then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_03]" , 0 )	--符文力量不足，坦希拉石像沒有任何變化
		elseif Num02 <= 50 then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_04]" , 0 )	--符文力量充分供給
			Delbodyitem( Player , 241086 , 1 )
			SetFlag( Player , 548817 , 1 )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_05]" , 0 )	--一次供給過多的符文力量，反而讓坦希拉石像多了幾道裂痕…
		end
	else
		EndCastBar( Player , CheckStatus )
	end
	WriteRoleValue( Machine , EM_RoleValue_Register2 , 0 )
end

function Lua_Z30_123365_Count( Machine , Player )
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
--還任務後表演
function Lua_jiyi_Z30_426869_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781382
 	local CliBuff = 623906	--表演用演員顯示BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----如果暫存值為0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z30_426869_Complete2" , NPC , Player , Flag , CliBuff )    ----接演戲function
 	end 
end

function Lua_jiyi_Z30_426869_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122569 , Flag , 6 , 1 , 0 )     --在6號旗標產生演員 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	NPCSAY( Actor , "[SC_Z30_Q426869_06]" )	--海盜，你們在幫助坦希拉嗎？
	DW_MoveToFlag( Actor , Flag , 7 , 0 , 1 )	--走到7號旗標
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end
--------------------------------------426870 臨門一腳----------------------------------------
--function Lua_Z30_426870_Accept()	--接下任務生成不死軍隊
--	local Player = TargetID()
-- 	local NPC_Pali = OwnerID()
--	CallPlot( player , "Lua_jiyi_Round_0415" , NPC_Pali , 108503 , 5 , 50 , 0 )
--	-- 參考物件、建立物件的ID、建立物件的數量、圓的半徑、建立物件是否延遲
--	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426870_01]" , 0 ) 	--周圍突然出現一群[108503]包圍你們…
--end
-------------------------------------426871 最終考驗-----------------------------------------
--接下任務後威爾跑出去
function Lua_jiyi_Z30_426871_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623836
 	local Num = ReadRoleValue( NPC , EM_RoleValue_Register1 )

 	if Num == 0 then          ----如果暫存值為0
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player, CliBuff , 0 , 15 )
 	 	CallPlot( NPC , "Lua_Z30_426871_Accept2" , NPC , Player , CliBuff )    ----接演戲function      
 	end 
end

function Lua_Z30_426871_Accept2( NPC , Player , CliBuff )
	local SeachNpc = SearchRangeNPC( NPC , 100 )
	local OrgID = 122565	--威爾
	local WalkFlag = 781382
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	for i = 0 , table.getn(SeachNpc) do		
		if ReadRoleValue( SeachNpc[i] , EM_RoleValue_OrgID ) == OrgID then
			Beginplot( SeachNpc[i] , "Lua_Z30_426871_Accept3" , 0 )
		end
	end
 	CancelBuff( Player , CliBuff )
 	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 )
end

function Lua_Z30_426871_Accept3()
	local Will = OwnerID()
	local WalkFlag = 781382
	local New_NPC =  DW_CreateObjEX("obj", 122567 , Will )	--生成演戲威爾
	ks_ActSetMode( New_NPC )
	NPCSAY(New_NPC, "[SC_Z30_Q426871_01]")	--[$playername]，我們快進墓室！
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	DW_MoveToFlag( New_NPC , WalkFlag , 5 , 0 , 1)
	Sleep(10)
	DelObj(New_NPC)	
end

function Lua_Z30_122568_Speak()	--122568威爾對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426871 ) == true and CheckFlag( player , 548819 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426871_02]","Lua_Z30_122568_Speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_122568_Speak2()
	local player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426871_03]" )	--(威爾神情凝重地蹲在地上…)可惡，是賽西蒙德的力量變強了嗎？墓室裡面充滿死亡的臭味，真令人不舒服…
	SetFlag( Player , 548819 , 1 )
end			