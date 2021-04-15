--Z30支線
--==========佈置用
function Lua_Z30_108501_LuaEvent_BeginAttack()	--母獅子進入戰鬥召喚公獅子
	local owner = OwnerID()
	local pid = ReadRoleValue( owner , EM_RoleValue_PID )
	if pid == 0 then
		WriteRoleValue( owner , EM_RoleValue_PID , 1 )
		local x,y,z,dir=DW_Location(owner);	--根據物件位置
		local Obj=CreateObj( 108500 , x+30 , y , z , dir, 1 );
		AddToPartition( Obj , 0 ); 
	end
end

function Lua_Z30_108501_LuaEvent_EndAttack()	--母獅子脫離戰鬥劇情
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end	

function Lua_Z30_108500_LuaEvent_EndAttack()	--公獅子脫離戰鬥後刪除自己
	DelObj ( OwnerID() )
end
----------------------------------426987----------------------------------
function Lua_Z30_426987_Accept()	--接任務後給予426988任務的前置條件旗標
	local Player = TargetID()
 	local NPC = OwnerID()
	Setflag( Player , 548865 , 1 )
end
------------------------------------426989-------------------------------------
function Lua_Z30_121963_spaek()	--121963烏嘎帕里對話劇情
	local player = OwnerID()
	local NPC = TargetID()
	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )
	LoadQuestOption( player )
	if PID == 0 then
		if CheckAcceptQuest( player , 426991 ) == true and CheckFlag( player , 548860 ) == false then
			AddSpeakOption( player , player , "[SC_Z30_Q426990_00]","Lua_Z30_121963_Activity" , 0 )
		elseif CheckAcceptQuest( player , 426993 ) == true and Countbodyitem( player , 243176 ) == 0 then
			AddSpeakOption( player , player , "[SC_Z30_Q426993_01]","Lua_Z30_121963_spaek2(1)" , 0 )				
		elseif CheckAcceptQuest( player , 426990 ) == true and CheckFlag( player , 548859 ) == false then
			AddSpeakOption( player , player , "[SC_Z30_Q426990_11]","Lua_Z30_121963_spaek2(2)" , 0 )
		elseif CheckAcceptQuest( player , 427046 ) == true and CheckFlag( player , 548862 ) == false then	--委託任務
			AddSpeakOption( player , player , "[SC_Z30_Q426990_00]","Lua_Z30_121963_Activity" , 0 )
		elseif CheckAcceptQuest( player , 427056 ) == true and CheckFlag( player , 548862 ) == false then	--公眾任務
			AddSpeakOption( player , player , "[SC_Z30_Q426990_00]","Lua_Z30_121963_Activity" , 0 )
		else
			LoadQuestOption( player )
		end
	else
		SetSpeakDetail( Player , "[SC_Z30_Q426989_01]" )
	end
end

function Lua_Z30_121963_spaek2(Option)
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak( Player )
	if Option == 1 then
		SetSpeakDetail( Player , "[SC_Z30_Q426993_02]" )
		Givebodyitem( player , 243176 , 1 )
	elseif Option == 2 then
		SetSpeakDetail( Player , "[SC_Z30_Q426990_12]" )
		SetFlag( Player , 548859 , 1 )
	end
end
------------------------------------426988-------------------------------------
function Lua_Z30_426988_Complete()	--426988任務完成給予426987完成條件旗標
	local Player = TargetID()
 	local NPC = OwnerID()
	Setflag( Player , 548858 , 1 )
end

function Lua_Z30_123368_touch()	--123368燒瓶物件產生劇情
	local Flask = OwnerID()
	SetPlot( Flask , "touch", "Lua_Z30_123368_touch2", 30 )
end

function Lua_Z30_123368_touch2()
	local Player = OwnerID()
	local Flask = TargetID()
	
	if CheckAcceptQuest( Player , 426988 ) == true or CheckAcceptQuest( Player , 427048 ) == true or CheckAcceptQuest( Player , 427058 ) == true then
		if Countbodyitem( Player , 243179 ) > 0 then	--已經有符石原液
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_01]" , 0 )	--你已經製作好[243179]…
		else
		--	SetPlot( Flask , "touch" , "" , 30 )	--讓其他人無法再點擊
			CallPlot( Flask , "Lua_Z30_123368_touch3" , Flask , Player )		
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_02]" , 0 )	--一瓶神秘的研究容器，還是別亂動吧…
	end
end

function Lua_Z30_123368_touch3(Flask , Player)
	local Buff = { [1]=506230 , [2]=507224 , [3]=507225 , [4]=509937 }	--燒瓶 , 黃色原液 , 不明液體 , 假性原液
	local OrgID = { [1]=123368 , [2]=123369 , [3]=123508 }	--燒瓶 , 黃色原液 , 不明液體
	if ReadRoleValue( Flask , EM_RoleValue_OrgID ) == OrgID[1] then
		if CheckBuff( Player , Buff[4] ) == true then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_03]" , 0 )	--你已經將[509937]拿在手上	
		elseif CheckBuff( Player , Buff[2] ) == true then
			Addbuff( Player , Buff[4] , 0 , 10 )
			Cancelbuff( Player , Buff[2] )
			Cancelbuff( Player , Buff[1] )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_04]" , 0 )	--你小心地拿起[506230]…
			Cancelbuff( Player , Buff[1] )
			Addbuff( Player , Buff[1] , 0 , 10 )
		end
	elseif ReadRoleValue( Flask , EM_RoleValue_OrgID ) == OrgID[2] then
		if CheckBuff( Player , Buff[4] ) == true then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_03]" , 0 )	--你已經將[509937]拿在手上	
		elseif CheckBuff( Player , Buff[2] ) == true then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_05]" , 0 )	--你正拿著[507224]…
		else
			Addbuff( Player , Buff[2] , 0 , 10 )
		end
	elseif ReadRoleValue( Flask , EM_RoleValue_OrgID ) == OrgID[3] then
		if CheckBuff( Player , Buff[4] ) == true then
			for i = 1 , 4 , 1 do
				Cancelbuff( Player , Buff[i] )
			end
			Givebodyitem( Player , 243179 , 1 )	
		else
			Cancelbuff( Player , Buff[3] )
			Addbuff( Player , Buff[3] , 0 , 10 )
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_06]" , 0 )	--你拿起[507225]…
		end		
	end
end			
------------------------------------426991 魔鬼訓練-------------------------------------
function Lua_Z30_121963_Activity()	--PID=0 執行活動劇情
	local Player = OwnerID()
	CloseSpeak( Player )
	local NPC = TargetID()
	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )	--紀錄NPC是否開啟戰鬥訓練

	if PID == 0 then
		WriteRoleValue( NPC , EM_RoleValue_PID , 1 )
		DW_CancelMount( 68 , player )	--進入遊戲不可騎乘
		WriteRoleValue( NPC , EM_RoleValue_Register+9 , Player )	--將玩家記在NPC的Reg1
		Addbuff( Player , 509946 , 0 , 34 )
		Beginplot( NPC , "Lua_Z30_121963_Activity2" , 0 )	--執行檢查
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z21_Q424542_03]" , 0 )	--目標忙碌中
	end
end	

function Lua_Z30_121963_Activity2()
	local NPC = OwnerID()
	local reward = { [1]=548860 , [2]=548862 , [3]=548863 }
	local Player = ReadRoleValue( NPC , EM_RoleValue_Register+9 )
--	local PID = ReadRoleValue( NPC , EM_RoleValue_PID ) --記錄在NPC身上的PID值
	local Time = 0
	local Dis
	local buff = 509946	--任務技能

	Lua_Z30_121963_Activity3()	-- 執行出題
--	Beginplot( NPC , "Lua_Z30_121963_Activity3" , 0 )	--執行出題
	while true do	
		Dis = GetDistance( NPC , Player )	--檢查NPC和玩家之間的距離
		if CheckID( Player ) == false then	--如果玩家離線，跳出迴圈
			break
		end
		if Dis >= 100 then
			ScriptMessage( NPC , Player , 2 , "[SC_Z30_Q426990_01]" , C_SYSTEM )	--警告訊息 ：距離太遠，任務失敗…	
			break
		end
		Time = Time + 1
		if Time == 30 then
	   		ScriptMessage( NPC , Player , 2 , "[SC_Z30_Q426990_02]" , C_SYSTEM )	--時間到，活動結束。	
			break
		end
		local Fraction = ReadRoleValue( NPC , EM_RoleValue_Register+8 )	
		if Fraction == 5 then
			ScriptMessage( NPC , Player , 1 , "[SC_Z30_Q426990_03]" , C_SYSTEM )	--恭喜你完成戰鬥訓練。
			if CheckAcceptQuest( player , 426991 ) == true and CheckFlag( player , reward[1] ) == false then	--支線
				Setflag( Player , reward[1] , 1 )
			elseif CheckAcceptQuest( player , 427046 ) == true and CheckFlag( player , reward[2] ) == false then	--委託任務
				Setflag( Player , reward[2] , 1 )
			elseif CheckAcceptQuest( player , 427056 ) == true and CheckFlag( player , reward[2] ) == false then	--公眾任務
				Setflag( Player , reward[2] , 1 )
			end
			break
		end
		for i = 1 , 3 , 1 do					
			if CheckFlag( Player , reward[i] ) == true then	--如果玩家身上有已完成旗標，跳出迴圈
				break
			end
			break
		end
		Sleep( 10 )
	end
--	PlayMotion( player , ruFUSION_ACTORSTATE_NORMAL )
	WriteRoleValue( NPC , EM_RoleValue_Register+9 , 0 )
	WriteRoleValue( NPC , EM_RoleValue_Register+8 , 0 )
	WriteRoleValue( NPC , EM_RoleValue_PID , 0 ) --把NPC身上PID值寫成0
	CancelBuff( Player , buff ) --刪除玩家身上全部BUFF
end

function Lua_Z30_121963_Activity3()
	local NPC = OwnerID()
	local player = ReadRoleValue( NPC , EM_RoleValue_Register+9 )
	local Time = 0
	local String
	local Word = { [1]="[SC_Z30_Q426990_08]" ,
			 [2]="[SC_Z30_Q426990_09]" ,
			 [3]="[SC_Z30_Q426990_10]" }	--題目字串
	local RandNum
--	WriteRoleValue( NPC , EM_RoleValue_PID , 1 )	--將NPC身上的PID值寫成1
--	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )	--記錄在NPC身上的PID值
	Sleep(10)
	say( NPC , "3" )
	Sleep(10)
	say( NPC , "2" )
	Sleep(10)
	say( NPC , "1" )
	Sleep(10)	
	String = "[SC_Z30_Q426990_07]"
	for i = 1 , 7 do	--題目
		RandNum = DW_Rand( table.getn( Word ) )
		String = String..Word[RandNum]
		WriteRoleValue( NPC , EM_RoleValue_Register+i , RandNum )	--將任務的字串記在NPC身上
		local REG = ReadRoleValue( NPC , EM_RoleValue_Register+i )
	--	say( NPC , "REG="..REG )
		if i == 7 then
			ScriptMessage( NPC , player , 1 , String , C_SYSTEM )	--題目字串
		end
	end
--	PlayMotion( player , ruFUSION_ACTORSTATE_NORMAL )
--	Sleep(300)
--	WriteRoleValue( NPC , EM_RoleValue_Register+9 , 0 )
--	WriteRoleValue( NPC , EM_RoleValue_PID , 0 )	
end

function Lua_Z30_426990_buffid(Answer)	--掛在技能的執行劇情上，檢查任務是否回答正確 Answer = 技能1 , 2 , 3 
	local player = OwnerID() --玩家
	local NPC = TargetID()
	local Quest = { [1] = 3 , [2] = 5 , [3] = 7 }	-- 每階段有幾個題目：為方便調整難度，先將題目分成3種難度
	local Topic = {}	

	Lua_FE_Reset(Player)	-- 每次施放技能的時候，清除最終就贖

	for j = 1 , Quest[3] , 1 do	-- i = 0
		Topic[j] = ReadRoleValue( NPC , EM_RoleValue_Register+j )
	end
	CallPlot( player , "Lua_Z30_426990_BuffAnswer" , Answer )
	for i = 1 , #Topic , 1 do	-- 任務的題目字串數量
		if Topic[i] ~= 0 then	-- 1 ~ 7
			if Answer == Topic[i] then	-- 技能給的數字，與NPC出題的數字符合，答對。
		--		CallPlot( player , "Lua_Z30_426990_BuffAnswer" , Answer )
				local Fraction = ReadRoleValue( NPC , EM_RoleValue_Register+8 )	
				WriteRoleValue( NPC , EM_RoleValue_Register+8 , Fraction+1 )
				ScriptMessage( NPC , player , 0 , "[SC_Z30_Q426990_04]"..Fraction+1 .."[SC_Z30_Q426990_05]" , C_SYSTEM )	--提示訊息：你答對了				
			else				-- 技能給的數字，與NPC出題的數字不符合，答錯。
		--		CallPlot( player , "Lua_Z30_426990_BuffAnswer" , Answer )
				ScriptMessage( NPC , player , 0 , "[SC_Z30_Q426990_06]" , C_SYSTEM )	--提示訊息：你做錯了
			end
			WriteRoleValue( NPC , EM_RoleValue_Register+i , 0 ) --將NPC身上記字串的REG值寫回0
			break
		end
	end	
end

function Lua_Z30_426990_buffid_goal()	--判斷目標是否為NPC
	local own = OwnerID()
	local tar = TargetID()
	local NPC = 121963
	if ReadRoleValue( tar , EM_RoleValue_OrgID ) == NPC then
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2012THANKS_NPC_121493_SYSTEM_11]" , 0 )	--系統告知"非有效目標"	
		return false
	end
end

function Lua_Z30_426990_BuffAnswer(id)
	local player = OwnerID()
	if id == 1 then
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN )
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_BOW_END )
	elseif id == 2 then
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN )
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_GUN_END )
	elseif id == 3 then
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_POLEARM_SP )
	end
end
------------------------------------426993-------------------------------------
function Lua_Z30_119965_spaek()	--珍．史都力對話劇情
	local player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426993 ) == true and Countbodyitem( player , 243102 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z30_Q426992_01]","Lua_Z30_119965_spaek2(1)" , 0 )	--妳最近有看到呼嚕帕里、恰蹦帕里和哇拉帕里嗎？
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_119965_spaek2(num)
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak( Player )
	if num == 1 then
		SetSpeakDetail( Player , "[SC_Z30_Q426992_02]" )
		Givebodyitem( player , 243102 , 1 )		
	end
end

function Lua_Z30_115807_Speak()	--115807對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426993 ) == true and Countbodyitem( player , 242973 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z30_Q426993_03]","Lua_Z30_115807_Speak2(1)" , 0 )	--我在找呼嚕帕里、恰蹦帕里和哇拉帕里…
	elseif CheckAcceptQuest( player , 426985 ) == true and Checkflag( player , 548864 ) == false then	--426985
		AddSpeakOption( player , player , "[SC_Z30_Q426985_01]","Lua_Z30_115807_Speak2(2)" , 0 )	--[121772]叫我來找你…
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_115807_Speak2(Option)
	local player = OwnerID()
	CloseSpeak( Player )
	if Option == 1 then
		SetSpeakDetail( Player , "[SC_Z30_Q426993_04]" )
		Givebodyitem( player , 242973 , 1 )
	elseif Option == 2 then
		SetSpeakDetail( Player , "[SC_Z30_Q426985_02]" )	--[121772]叫你來協助我們？帕哩，真好笑，他有挖掘戰士的眼光嗎？算了，誰叫他是族長，他怎麼說，我就配合他吧。
		Setflag( player , 548864 , 1 )
	end	
end		
------------------------------------426995許願-------------------------------------
function Lua_Z30_243178check()	--243178恰吉帕里的願望符文使用前檢查
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Pool = 123268	--希望水池
	if DW_CheckQuestAccept("or", Player , 426995 ) == true or DW_CheckQuestAccept("or", Player , 427054 ) == true or DW_CheckQuestAccept("or", Player , 427064 ) == true then
						--支線								--委託								--公眾
		if TOrgID == Pool then
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--系統告知"非有效目標"
			return false									
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--系統告知"使用條件不符合。"
		return false
	end
end

function Lua_Z30_506229use()
	local Player = OwnerID()
	local Food = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426994_01]" , 0 )
	if DW_CheckQuestAccept("or", Player , 426995 ) == true then	--支線	
		Setflag( Player , 548861 , 1 )
	elseif DW_CheckQuestAccept("or", Player , 427054 ) == true or DW_CheckQuestAccept("or", Player , 427064 ) == true then	--委託	
		Setflag( Player , 548165 , 1 )
	end
end

function Lua_Z30_123366_Speak()	--重新拿願望符文
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if CountBodyItem( Player , 243178 ) == 0 then
		if DW_CheckQuestAccept( "or" , Player , 426995 ) == true and CheckFlag( Player ,  548861 ) == false then
			AddSpeakOption( Player , NPC , "[SC_Z30_Q426995_01]" , "Lua_Z30_123366_SpeakRetake" , 0 )	--願望符文被我弄丟了...
		elseif CheckFlag( Player ,  548165 ) == false then
			if DW_CheckQuestAccept( "or" , Player , 427054 ) == true or DW_CheckQuestAccept("or", Player , 427064 ) == true then
				AddSpeakOption( Player , NPC , "[SC_Z30_Q426995_01]" , "Lua_Z30_123366_SpeakRetake" , 0 )	--願望符文被我弄丟了...
			end				
		end
	end
end

function Lua_Z30_123366_SpeakRetake()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426995_02]" )	--再給你一次機會，不要再弄丟[243178]了！
	GiveBodyItem( Player , 243178 , 1 )		
end
--Z30委託+PE
------------------------------------427047+427057-------------------------------------
function Lua_Z30_208970check()	--火繩使用檢查Lua
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local beast = 108500	--公野生獅龍獸
	if CheckAcceptQuest( player , 427047 ) == true or CheckAcceptQuest( player , 427057 ) == true then
		if Countbodyitem( player , 208971 ) > 0 then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q427047_01]" , 0 )	--你已經抓到[208971]
			return false
		elseif TOrgID == beast then 
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_05]" , 0 )	--系統告知"非有效目標"
			return false
		end
	end
end

function Lua_Z30_208970use()	--火繩使用Lua
	local player = OwnerID()
	local tar = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q427047_01]" , 0 )	--你已經抓到[208971]
	GiveBodyItem( player , 208971 , 1 )
	Callplot( player , "Lua_Z30_208970use2" , player , tar )
end

function Lua_Z30_208970use2( player , tar )
	local RoomID = ReadRoleValue( player , EM_RoleValue_RoomID)
	hide( tar )
	sleep(100)
	show( tar , RoomID )
--	AddToPartition( tar , RoomID )
end
------------------------------------427049+427059-------------------------------------
function Lua_Z30_427049_Objend()	--點擊物件後劇情
	local player = OwnerID()
	DW_QietKillOne( 0 , 106290 )	--靜靜的殺死106290怪，前者殺死後者，0代表為玩家
	return true
end
			