
function LuaS_205672_0()	--422678 阻礙？助力？
	if	CheckAcceptQuest( OwnerID() , 422678 ) == true then
		if CheckFlag( OwnerID() , 543005 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205672_1]" , 0 ) --你已經綁架了一名[102494]，趁他想辦法逃脫之前快帶回去[113458]那裡。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205672_1]" , 0 ) 
			return false
		end

		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422202_4]" , 0 ) --目標已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422202_4]" , 0 )
		return false
	end

		local sole =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 102494 , 50 )
		if Type(sole) == "number" and CheckID(sole) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205672_2]" , 0 ) --你必須先接近[102494]才能使用[205672]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205672_2]" , 0 ) 
			return false 
		end

		if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	> 0.5	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101614_2]" ,  C_SYSTEM )
			return false
		else			
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205672_3]" , 0 ) --[102494]稍微變得衰弱，這是一個綁架他的好時機！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205672_3]" , 0 ) 
			return true
		end
	end
			return false 
end


function LuaS_205672_1()
	BeginPlot( TargetID() , "LuaS_205672_2" , 0 )
end
function LuaS_205672_2()
	say(OwnerID(),"[SC_205672_4]")	--放開我！！你是哪來的？
	sleep(20)	
	say(OwnerID(),"[SC_205672_5]")	--警告你最好別碰我～住手啊！住手～～
	sleep(10)
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543005 , 1 )
	end
	LuaFunc_ResetObj( OwnerID() )
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422679倒盡胃口
--使用旗子：780293  1-2

function LuaS_422679()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422679)==true )and( CheckCompleteQuest( OwnerID(),422679)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_0]","LuaS_422679_1",0) --說吧，你們在做什麼？
	end
end

function LuaS_422679_1()
	SetSpeakDetail(OwnerID(),"[SC_422679_1]")				--我為什麼要告訴你，你到底是從哪裡來的？禁制之壁被封死...血戰谷更不可能啊...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_2]","LuaS_422679_2",0)	--你可以選擇不說，我不介意用一些激烈手段...
end

function LuaS_422679_2()  
	SetSpeakDetail(OwnerID(),"[SC_422679_3]")				--呃...如果你把它們用在我身上...那你一定是瘋了...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_4]","LuaS_422679_3",0)	--1你可以挑戰看看我的底線。	 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_5]","LuaS_422679_3",0)	--2.是啊～我沒那麼瘋～
end

function LuaS_422679_3()  
	SetSpeakDetail(OwnerID(),"[SC_422679_6]")				--喂！勸你別鬧，最好是趕快放我走
	BeginPlot( TargetID(), "LuaS_422679_4", 0 )
end


function LuaS_422679_7()	--掛在索雷爾頓初始劇情
	local MIDI = Lua_DW_CreateObj("flag" ,113489,780293,1 )	--索雷爾頓出生製造密狄瑟
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID,MIDI  )	--將OwnerID()<索雷爾頓>寫進MIDI密狄瑟裡
	WriteRoleValue ( MIDI  , EM_RoleValue_PID, OwnerID())
end

function LuaS_422679_4()  
		Local BBS= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		tell(TargetID(),BBS,"[SC_422679_7]")			 	--別再跟他廢話了，你到箱子隨便拿一樣工具。
		sleep(20)	
		tell(TargetID(),BBS,"[SC_422679_8]")				--拿好跟我說一聲，我來制住他。
		
end


function LuaS_422679_8() 
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422679)==true ) then
		if  CountBodyItem( OwnerID(), 205762)<1 or CountBodyItem( OwnerID(), 205761)<1 then
			if  CountBodyItem( OwnerID(), 205965)>0 or CountBodyItem( OwnerID(), 205966)>0 or CountBodyItem( OwnerID(), 205967)>0  then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_9]","LuaS_422679_9",0)	--好了，開始吧～		
			end
		end
	end
end

function LuaS_422679_9()
	CloseSpeak( OwnerID() )
	if	 CountBodyItem( OwnerID(), 205965)>0	 then 
		DelBodyItem( OwnerID(), 205965, 1 )
	elseif	 CountBodyItem( OwnerID(), 205966)>0 	then
		delBodyItem( OwnerID(), 205966, 1 ) 
	elseif	CountBodyItem( OwnerID(), 205967)>0 	then
		DelBodyItem( OwnerID(), 205967, 1 )
	end	
	DisableQuest( TargetID() , true)
	say(TargetID(),"[SC_422679_13]")					--嗯！準備上了！
	BeginPlot( TargetID(), "LuaS_422679_10", 0 )
	
end

function LuaS_422679_10() 
	MoveToFlagEnabled( OwnerID(), true )
	LuaFunc_MoveToFlag(OwnerID() , 780293, 2 , 0 )
	CastSpell( OwnerID(), OwnerID(), 492671)	--施法特效
	Local SOLE= ReadRoleValue(OwnerID(), EM_RoleValue_PID)
	say( SOLE,"[SC_422679_10]")				--...做什麼？你們想...停、停、停！我認輸！別打、別脫～啊！燙、燙、燙～
	sleep(30)
	say( SOLE,"[SC_422679_11]")				--不過就是想知道我們在幹什麼是吧？我說就是了...為組織賣命這種吃力不討好的事不適合我做...
	sleep(40)
	say( SOLE,"[SC_422679_12]")				--紙筆拿來～我用寫的，別再靠近我了！
--	if CheckID( TargetID() ) == true then
--		SetFlag( TargetID() , 543351 , 1 )
--	end
	sleep(20)
	WriteRoleValue(  OwnerID(), EM_RoleValue_IsWalk , 1 )--用走的
	LuaFunc_MoveToFlag(OwnerID(), 780293, 1, 0 )
	if CheckID( TargetID() ) == true then
		if CountItem( TargetID(), 205762)<1 then
			GiveBodyItem( TargetID(),205762, 1 )
		end
		
		if CountItem( TargetID(), 205761)<1 then
			GiveBodyItem( TargetID(),205761, 1 )
		end
	end
	DisableQuest( OwnerID() , false)
end

function LuaS_422679_11()	
	if (CheckAcceptQuest(OwnerID(),422679)==true )and( CheckCompleteQuest( OwnerID(),422679)==false) 	then
		local R = Rand( 100 ) + 1
		if R >= 0 and R < 33	then
		GiveBodyItem( OwnerID(), 205965, 1 )
		return true
		end

		if R >= 34 and R < 66	then
		GiveBodyItem( OwnerID(), 205966, 1 )
		return true
		end

		if R >= 67 and R < 100	then
		GiveBodyItem( OwnerID(), 205967, 1 )
		return true
		end
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 任務 422681火線速報

function LuaS_422681_0()	--未偽裝對話
	if CheckBuff( OwnerID() , 504317 ) == true or CheckCompleteQuest( OwnerID() , 422681 ) == true then
		LoadQuestOption(OwnerID())
	else
		SetSpeakDetail( OwnerID(),  "[SC_422681_0]" ) --(眼前穿著索雷爾頓服飾的人對於你的出現似乎因驚訝而晃動身形。)
	end
end


function LuaI_205760_Check()	--掛在索雷爾頓服飾

	if CheckBuff( OwnerID() , 504317 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_0]" , 0 ) --你已經偽裝成索雷爾頓的成員
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_0]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --你正在戰鬥！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if CheckMapID(  X ,Y ,Z , 717 ) == false  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_1]" , 0 ) --必須靠近[ZONE_THE MOLTEN BRIDGE]附近的黑蛇營地使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_1]" , 0 ) 
		return false
	end
end


function Lua_ObjAreaCheck_504318_0() --偽裝偵測地點
	if	Lua_ObjAreaCheck(OwnerID() , 717 ) ==false  then
		CancelBuff_NoEvent( OwnerID() , 504317 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_205760_1]", 0 ) --必須在偵察[ZONE_THE MOLTEN BRIDGE]的行動中使用
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205760_1]", 0 )
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--任務422682 額外打算

function LuaS_422682_6()
	if  CheckAcceptQuest(TargetID(),422682)==true then
		if	CountBodyItem( TargetID(), 205760 )<1	then
		GiveBodyItem( TargetID(), 205760, 1 )
		end
	end
end

function LuaS_422682_0()	--點擊物品後
	if  CheckAcceptQuest(OwnerID(),422682)==true and CountBodyItem( OwnerID(),205920)>0 then	
 		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422682_7]" , 0 ) 	--你已經拿到一桶[205920]，可以去找甘諾德了
		return 1
	end

	if CheckBuff( OwnerID() , 504317 ) == false and CheckAcceptQuest(OwnerID(),422682)==true and CountBodyItem( OwnerID(),205920)<1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422682_3]" , 0 ) --你想盜取油桶的舉動引起蛇人注意！似乎有一群巡邏隊伍往這裡靠近！！
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422682_4]" , 0 ) --油桶被牢牢固定著。
		--local boss == Lua_DW_CreateObj("flag" ,113567,780298,1 )
		return 1
	end
	if CheckBuff( OwnerID() , 504317 ) == true and CheckAcceptQuest(OwnerID(),422682)==true and CountBodyItem( OwnerID(),205920)<1  then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422682_0]" , 0 ) --沈甸的油桶陷在土裡，你正以緩慢速度搬動著......
		local FOE = Lua_DW_CreateObj("flag" ,113567,780298,1 )
		WriteRoleValue ( OwnerID() , EM_RoleValue_PID,FOE   )	
		WriteRoleValue ( FOE  , EM_RoleValue_PID, OwnerID())	--將OwnerID()<玩家>寫進FOE蛇人裡
		BeginPlot(FOE,"LuaS_422682_1", 0 )	
		BeginPlot(TargetID(),"LuaS_422682_5", 0 )	
		return 1
	end
	return -1
end

function LuaS_422682_1()
	WriteRoleValue( OwnerID(),EM_RoleValue_IsWalk , 1 )--（用走的）
	DW_MoveToFlag(OwnerID(), 780298, 2 , 0 ,1)
	Say(OwnerID(),"[SC_422682_1]")		--看看這傢伙～不正是戴面具才敢現身的畏縮組織～那個索雷爾頓的人嗎？
	sleep(40)
	Local NPC= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	GiveBodyItem( NPC,205920, 1 )
	Say(OwnerID(),"[SC_422682_2]")		--搬個油桶這麼辛苦啊？連做苦工都很弱～哈哈～哥布林還比你強，至少他們挖礦速度快多了～
	sleep(30)
	Say(OwnerID(),"[SC_422682_6]")		--哥布林還比你強，至少他們挖礦速度快多了～
	WriteRoleValue( OwnerID(),EM_RoleValue_IsWalk , 1 )--（用走的）
	sleep(20)

	DW_MoveToFlag(OwnerID(), 780298, 3 , 0 ,1)
	DelObj (OwnerID())
end

function LuaS_422682_5()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	for i = 1, 30 , 1 do
		if  CheckID( TargetID()) == false	then
			break
		end
		if  CountBodyItem( TargetID(), 205920) > 0	then
			Hide( OwnerID() )
			sleep(150)
			Show(OwnerID() , 0)
			break
		end
		sleep(10)
	end
	SetPlot( OwnerID() , "touch" , "" , 0 )
end


function LuaS_422682_2()	--放在還任務後
	tell(TargetID(),OwnerID(),"[SC_422682_5]")	--來～我身上剩下這些療傷藥水，你拿去用～收好、收好，別被巡邏的蛇人看見了。
	GiveBodyItem( TargetID(),200274, 5 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--隱密行動

function LuaS_113516_0()
	if CheckAcceptQuest(OwnerID(),422683)==true and CountItem( OwnerID(), 205920) == 0 and  CheckFlag( OwnerID(),543006) ==false then
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422683_1]" , 0 ) --你必須擁有一桶[205920]
		return -1	--讓它中斷跳出用-1
	end
	if CheckAcceptQuest(OwnerID(),422683)==true and  CheckFlag( OwnerID(),543006) ==true and  CheckFlag( OwnerID(),543007) ==false then 	
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422683_3]" , 0 ) --你已燒毀部分物資，趕快發射哨煙筒通知[113487]
		return -1	--讓它中斷跳出用-1
	end
	return 1
end

function LuaS_205921_0()
	if( CheckFlag( OwnerID(),543007) ==true) or (CheckCompleteQuest(OwnerID(),422683)==true) then			
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422591_0]" , 0 ) 	--你現在不需要使用此物品
		return false
	end
	if( CheckFlag( OwnerID(),543006) ==false) and( CheckFlag( OwnerID(),543007) ==false)and (CheckCompleteQuest(OwnerID(),422683)==false) then		
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422683_0]" , 0 )	 --你必須先燒毀物資
		return false
	end
	if( CheckFlag( OwnerID(),543006) ==true) and( CheckFlag( OwnerID(),543007) ==false) and (CheckCompleteQuest(OwnerID(),422683)==false) then	
		BeginPlot( OwnerID(), "LuaS_205921_1",0 )
	end

end

function LuaS_205921_1()
	CastSpell( OwnerID(), OwnerID(), 494274 )
	sleep(30)
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422683_2]" , 0 )	 --哨煙發射劃出金色弧線～在營地另一邊的[113487]也以哨煙回應～
	SetFlag( OwnerID() , 543007 , 1 )
end


function LuaS_422683_0()
	if CheckAcceptQuest(OwnerID(),422683)==true and CountBodyItem(OwnerID(), 205920)>0 and CheckFlag( OwnerID(),543006) ==false then
	--	CastSpell( TargetID(), TargetID(), 494274 )
		AddBuff(TargetID() , 503605 , 1 , 10 )	
		DelBodyItem( OwnerID(), 205920, 1 )
		SetFlag( OwnerID() , 543006 , 1 )
		return 1
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--赤蛇親衛隊 旗子780354 1-2

function LuaS_422687_0()	
		LoadQuestOption(OwnerID())	
	if 	(CheckAcceptQuest(OwnerID(),422687)==true )and( CheckCompleteQuest( OwnerID(),422687)==false) and( CheckFlag( OwnerID(),543008) ==false)  	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_0]","LuaS_422687_1",0) 	--亞榭娜隊長要我來配合你的行動，掌握赤蛇親衛隊的動機。
	end

	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and(ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0) and ( CheckCompleteQuest( OwnerID(),422689)==false) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422689_0]","LuaS_422689_1",0)			 --我來了，亞榭娜隊長交給我[205765]和[205909]。
	end

	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and(ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 1) and(CheckCompleteQuest( OwnerID(), 422689 )==false) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422689_0]","LuaS_422689_3",0)			 
	end

	if 	(CheckAcceptQuest(OwnerID(),422690)==true )and( CheckFlag( OwnerID(),543332)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422690_0]","LuaS_422690_1",0)		 --...可以把我塞進箱子裡了...
	end
end

function LuaS_422687_1()
	SetSpeakDetail(OwnerID(),"[SC_422687_1]")
	if ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_2]","LuaS_422687_2",0)	--我隨時可以進行戰鬥。	
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_2]","LuaS_422687_3",0)	--我隨時可以進行戰鬥。
	end	
		
end			

function LuaS_422687_2()  
	CloseSpeak( OwnerID())
	say(TargetID(),"[SC_422687_3]")						--來了，提高警覺！
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaS_422687_4" , 0)
end

function LuaS_422687_3()  
	SetSpeakDetail(OwnerID(),"[SC_422687_4]")				--很好，還要再等一會。
end
		

function LuaS_422687_4()							
		local RED = Lua_DW_CreateObj("flag" ,102668,780354,1)
		MoveToFlagEnabled( RED , false )
		WriteRoleValue( RED,EM_RoleValue_IsWalk , 1 )--（用走的）
		sleep(20)
		Hide( RED)
		Show( RED,0)
		WriteRoleValue ( RED  , EM_RoleValue_PID,OwnerID() )	--將OwnerID()<索雷爾頓>寫進RED赤蛇裡
		BeginPlot(RED,"LuaS_422687_5", 0 )
		BeginPlot( TargetID() , "LuaS_422687_6" , 0 )
		SetPlot(RED,"dead","LuaS_422687_7",0 )
		sleep(100)
		SetAttack(RED ,TargetID())
		
end

function LuaS_422687_5()
	LuaFunc_MoveToFlag(OwnerID(), 780354,2 , 0 )
	yell(OwnerID(),"[SC_422687_5]",3)
	sleep(20)
	yell(OwnerID(),"[SC_422687_6]",3)

end

function LuaS_422687_7() --怪的死亡劇情
	local Player
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422687 )and ( CheckFlag( Player ,543008)) ==false 	then
			SetFlag( Player  , 543008, 1 )
			if	CheckAcceptQuest ( TargetID(), 422687 )and CountItem( TargetID(), 205763)<1	then
				GiveBodyItem( TargetID(),205763, 1 )
			end
			if	CheckAcceptQuest ( TargetID(), 422687 )and CountItem( TargetID(), 205764)<1	then
				GiveBodyItem( TargetID(),205764, 1 )
			end
		end
	end	
	Local NPC= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( NPC , EM_RoleValue_PID , 0 )
	return true
End

function LuaS_422687_6()
	local RED = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 1, 50 , 1 do
		if CheckID(RED) == false or ReadRoleValue(  RED , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(  RED , EM_RoleValue_OrgID ) ~= 102668 then
			break
		end
		sleep( 60 )
	end
	if CheckID(RED) == true and ReadRoleValue(  RED, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( RED , EM_RoleValue_OrgID ) == 102668 then
		Local NPC= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		WriteRoleValue( NPC , EM_RoleValue_PID , 0 )
		Delobj( RED)
		
	end
end

function LuaS_422687_9()	--還完任務後刪除物品
	if	CountBodyItem( TargetID(), 205763)>0		then
		DelBodyItem( TargetID(), 205763, 1 )
	end
	if	CountBodyItem( TargetID(), 205764)>0		then
		DelBodyItem( TargetID(), 205764, 1 )
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422693馬弗爾的反應	旗子：780351


function LuaS_422693_after()
	if  CheckAcceptQuest(TargetID(),422693)==true then
		if	CountBodyItem( TargetID(), 205760 )<1	then
		GiveBodyItem( TargetID(), 205760, 1 )
		end
	end
end


function LuaI_422693_1()		--「創立一個檢查範圍的隱形物件EX.113561」
	if CheckBuff( OwnerID() , 504766) == false then
		SetPosByFlag( OwnerID(), 780351 , 1)
	end
end

function LuaM_504767_0()--BUFF檢查傳送
	SetPosByFlag( OwnerID(), 780351 , 1)
end

function LuaS_422693_0()	
		LoadQuestOption(OwnerID())	
	if 	(CheckAcceptQuest(OwnerID(),422693)==true )and( CheckFlag( OwnerID(),543333)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_0]","LuaS_422693_1",0)		 --培里亞葛爾達？
	end
end

function LuaS_422693_1()
	SetSpeakDetail(OwnerID(),"[SC_422693_1]")				--你好，這算是第一次你和我正式見面，我是亞榭娜隊長的直屬副官：培里亞。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_2]","LuaS_422693_2",0)	--你好。
end

function LuaS_422693_2()
	SetSpeakDetail(OwnerID(),"[SC_422693_3]")	--既然隊長想知道馬弗爾對此事的態度反應，我們的動作必須稍微加快，方才已經有部分蛇人往炮烙鐵橋移動，他們的將軍出現	
--	BeginPlot(TargetID(),"LuaS_422693_3",0)
	if	CheckBuff( OwnerID() , 504317 ) == true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_4]","LuaS_422693_4",0)--我已經穿好索雷爾頓服飾了。
	end
	if	CheckBuff( OwnerID() , 504317 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_16]","LuaS_422693_5",0)--我現在要做什麼？
	end	
end



function LuaS_422693_4()
	closespeak(OwnerID())
	say(TargetID(),"[SC_422693_6]")--嗯，那我帶你過去。
	WriteRoleValue ( TargetID()  , EM_RoleValue_PID, OwnerID())			--將OwnerID()<玩家>寫進TargetID()培里亞裡
	BeginPlot(TargetID(),"LuaS_422693_6",0)
end

function LuaS_422693_5()
	SetSpeakDetail(OwnerID(),"[SC_422693_5]")--請先穿好索雷爾頓服飾。
end

function LuaS_422693_6()					    	    
	DisableQuest( OwnerID(), true )						--OwnerID是培里亞
	SetPlot( OwnerID(), "touch" , "LuaI_113486_1" , 30 )				--113486是培里亞	LuaI_113486_1範圍劇情
	BeginPlot( OwnerID() , "LuaI_113486_2" , 0 )				
end

function LuaI_113486_1()
	say( TargetID() , "[SC_422693_7]" )			 --請稍等我一下。
end

function LuaI_113486_2()
	local MA,player =0
	sleep( 20 )
	player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)								--設定玩家的宣告
	SetPosByFlag( player  , 780351 , 2 )										--傳送玩家
	AddBuff( player  , 504766, 1 , -1 )										--給玩家BUFF 
	AddBuff( player  , 503977 , 1 , 60 )										--給玩家BUFF 乖乖看戲
	MA = CreateObjByFlag( 102509 , 780351 , 3 , 1 )									--種出演戲NPC
	SetRoleCamp(  MA , "Visitor" )										--改變陣營，免得玩家被打，也把追逐調低
	AddToPartition( MA , 0 )
	MoveToFlagEnabled( MA  , false )										--巡邏關閉 
	local snake = {}
	for i=4,8,1 do
		snake[i] = CreateObjByFlag( 113563 , 780351 , i , 0 ) --5蛇
		AddToPartition( snake[i] , 0 )
		MoveToFlagEnabled( snake[i] , false )
	end
	local KILLER= {}
	for i=9,10,1 do
		KILLER[i] = CreateObjByFlag( 113562 , 780351 , i , 0 ) --2蛇
		AddToPartition( KILLER[i] , 0 )
		MoveToFlagEnabled( KILLER[i] , false )
	end
	sleep(30)
	AdjustFaceDir( MA ,snake[6]  , 0 ) 	
	Yell( MA , "[SC_422693_8]" , 3 )-- 就是這幾個？	
	sleep(20)
	Yell( snake[6] , "[SC_422693_9]",3 )         --稟將軍，是...
	sleep(20)
	Yell( MA , "[SC_422693_10]" , 3 )--我已經警告過...
	AdjustFaceDir( MA ,KILLER[9]  , 0 ) 
	sleep(20)
	PlayMotion( MA , ruFUSION_ACTORSTATE_ATTACK_2H)
	AddBuff( KILLER[9], 503974 , 0 , 30 )
	sleep(20)
	SetDefIdleMotion( KILLER[9], ruFUSION_MIME_DEATH_LOOP)
	sleep(20)
	Yell( KILLER[10] , "[SC_422693_11]" ,3)         --將軍！請再給我一次機會！
	AdjustFaceDir( MA ,KILLER[10]  , 0 ) 
	sleep(20)
	Yell( MA , "[SC_422693_12]" , 3 )--違反軍紀，不聽命者的下場...
	sleep(10)
	PlayMotion( MA , ruFUSION_ACTORSTATE_ATTACK_2H)
	AddBuff( KILLER[10], 503974 , 0 , 30 )
	sleep(20)
	SetDefIdleMotion( KILLER[10], ruFUSION_MIME_DEATH_LOOP)
	sleep(20)
	AdjustFaceDir( MA ,snake[7]  , 0 ) 
	sleep(15)
	Yell( MA , "[SC_422693_13]" , 3 )--都看清楚了？
	sleep(20)
	AdjustFaceDir( MA , player , 0 ) 
	sleep(10)
	ScriptMessage(  player , player, 1 , "[SC_422693_14]" , 0 ) 	--[102509]突然看向你躲藏的地方！	
	ScriptMessage(  player , player, 0 , "[SC_422693_14]" , 0 ) 	--[102509]突然看向你躲藏的地方！
	sleep(20)
	tell(player ,OwnerID(),"[SC_422693_15]")		--不妙，他起疑了！先回去吧。
	sleep(20)
	if CheckID(player) then
		if CheckAcceptQuest( player , 422693) == true then
		SetFlag( player , 543333  , 1 )
		end
	end
		CancelBuff_NoEvent( player  , 503977 )							--取消BUFF
		CancelBuff( player  , 504766)
	DisableQuest( OwnerID() , false )
	SetPlot( OwnerID() , "touch" , "" , 0 )
	delobj(MA)
	for i=4,8,1 do
	Delobj( snake[i] )  --刪掉5蛇
	end
	for i=9,10,1 do
	Delobj( KILLER[i] )  --刪掉3蛇
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422694盜取上鎖箱子

function LuaS_422694_2()
	if  CheckAcceptQuest(TargetID(),422694)==true then
		if	CountBodyItem( TargetID(), 205760 )<1	then
		GiveBodyItem( TargetID(), 205760, 1 )
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_113605_0()
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0)
	AddBuff( OwnerID() , 504801 , 1, -1 )
end