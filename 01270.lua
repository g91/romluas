function LuaS_422055()  --姨姨有危險！
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422055)==true)and( CheckCompleteQuest( OwnerID() , 422055) == false) and (CheckFlag( OwnerID(), 542436 ) ==false )	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422055_1]","LuaS_422055_1",0)--女士～回村裡吧。 
	end
end

function LuaS_422055_1()	
	CloseSpeak( OwnerID())
	Yell( TargetID(),"[SC_422055_2]",2)	--殺!我要殺光他們！
	MoveToFlagEnabled(TargetID(), true )	--打開或關閉巡邏劇情(true打開)	
	DisableQuest( TargetID() , true )	--開關NPC頭上的任務提示以及對話劇情(true關閉)
	SetDelayPatrolTime( TargetID(), 0 )

end

function LuaS_422055_2()	--巡邏路徑第三點
	local Fish = {}
	local amount = 5
	local Player = {}
	MoveToFlagEnabled(OwnerID (),false )
	ScriptMessage(OwnerID (), 0, 1, "[SC_422055_3]", 0 )
	sleep(10)
	For i=1, amount  do
		Fish[i] = Lua_DW_CreateObj("flag" ,101854, 780293, i )
		SetPlot(Fish[i],"dead","LuaS_422055_3",0 )
		SetAttack(OwnerID(),Fish[i])
		SetAttack(Fish[i],OwnerID())
		BeginPlot(Fish[i], "LuaS_Discowood_CheckPeace" , 0 )
	End
	while ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1 do
		sleep(10)
	end
	sleep(10)
	Player = SearchRangePlayer(OwnerID() , 350)
	For i=0,table.getn(Player)-1 do
		If	CheckAcceptQuest( Player[i], 422055 )	and
			CheckFlag( Player[i] , 542472 )		then
			SetFlag(Player[i] , 542436 , 1)
		end
	end
	MoveToFlagEnabled(OwnerID(), true )
	sleep(10)
	Say(OwnerID() , "[SC_422055_4]")
	Sleep(20)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_422055_3() --怪的死亡劇情
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422055 )	then
			SetFlag( Player   , 542472, 1 )
		end	
	end	
	return true
End

function LuaS_422055_4()	--巡邏路徑第四點
	SetPosByFlag( OwnerID(), 780293 , 6 )
	Hide( OwnerID() )
	sleep(20)
	Show( OwnerID(), 0)
	MoveToFlagEnabled(OwnerID (), false )	--打開或關閉巡邏劇情(false關閉)
	DisableQuest( OwnerID () , false )	--開關NPC頭上的任務提示以及對話劇情(false打開)
end



Function LuaS_422057()   --解救村民 旗子使用780298(1-5)
	--WriteRoleValue (OwnerID() , EM_RoleValue_PID,1  ) 
	local OBSL = Lua_DW_CreateObj("flag" ,112575,780298,1 )
	LuaFunc_MoveToFlag( OBSL,780298,2,0)
	sleep(5)
	Say(OBSL, "[SC_422057]")  --大事不好了～～求求你們快救人！塔努德．葛夏被怪傢伙盯上了～
	sleep(20)
	Say(OBSL, "[SC_422057_1]")  -- 跟我來，在這邊！
	sleep(10)
	Say(OwnerID(), "[SC_422057_2]") --麻煩你先過去看看情況，我再去找更多幫手來。
	LuaFunc_MoveToFlag( OBSL,780298,3,0) 
	LuaFunc_MoveToFlag( OBSL,780298,4,0) 
	DelObj (OBSL)
end


function LuaS_422057_1()
	
	SetPlot( OwnerID(),"range","LuaS_422057_2", 100)
	WriteRoleValue (OwnerID(), EM_RoleValue_PID,TargetID())	
end


Function LuaS_422057_2()
		SetPlot( TargetID(),"range","", 0)
		BeginPlot( TargetID() , "LuaS_422057_5" , 0 )
	if	 (CheckAcceptQuest(OwnerID(),422057)==true )and( CheckCompleteQuest( OwnerID() , 422057)==false) and (CheckFlag( OwnerID(), 542437 )== false)	then 
		local FISHORZ = Lua_DW_CreateObj("flag" ,101854,780298,5)
		WriteRoleValue (FISHORZ , EM_RoleValue_PID,TargetID())
		WriteRoleValue (TargetID(), EM_RoleValue_PID,FISHORZ )
		local TND = ReadRoleValue(FISHORZ,EM_RoleValue_PID)
		Yell(TND, "[SC_422057_4]",2)	--救命～別殺我！別殺我！我把水骨葉都給你～
		SetPlot(FISHORZ,"dead","LuaS_422057_3",0 )
	end	
End

function LuaS_422057_5()
	local FISHORZ = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 1, 50 , 1 do
		if CheckID(FISHORZ) == false or ReadRoleValue(  FISHORZ , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(  FISHORZ , EM_RoleValue_OrgID ) ~= 101854 then
			break
		end
		sleep( 60 )
	end
	if CheckID(FISHORZ) == true and ReadRoleValue(  FISHORZ , EM_RoleValue_IsDead ) == 0 and ReadRoleValue(  FISHORZ , EM_RoleValue_OrgID ) == 101854 then
		Delobj( FISHORZ )
	end
	SetPlot(OwnerID() , "range","LuaS_422057_2", 100)
end

function LuaS_422057_3() --怪的死亡劇情
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422057 )	then
			SetFlag( Player  , 542437, 1 )
			local TND = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
			Say(TND, "[SC_422057_3]")	--我還活著！是你救了我～真是太感謝你了！
		end	
	end	
	
	return true
End


function LuaS_422057_4()	--完成任務後
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
end



Function LuaS_422059()	--取你應得的(密語)
	tell(TargetID(),OwnerID(),"[SC_422059]")
	return true			
end

Function LuaS_422059_1()	
	say(OwnerID(),"[SC_422059_1]")			
end





function LuaS_422060()  --展開調查
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422060)==true )and( Checkflag( OwnerID() , 542307) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422060]","LuaS_422060_1",0) --好，我願意協助調查。
	end
	if (CheckAcceptQuest(OwnerID(),420629)==true )and( CheckCompleteQuest( OwnerID() ,420629) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_420629_0]","LuaS_420629_1",0) --詢問蛇人的事情
	end
end


function LuaS_422060_1()  
	SetSpeakDetail(OwnerID(),"[SC_422060_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422060_2]","LuaS_422060_2",0)	--
end

function LuaS_422060_2()  
	SetFlag(OwnerID() ,542307, 1 )
	CloseSpeak( OwnerID())
end



function LuaS_422061()  --棘手人物
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422061)==true)and( CheckCompleteQuest( OwnerID() , 422061) == false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422061_1]","LuaS_422061_1",0) 	
	end	
end

function LuaS_422061_1()
	CloseSpeak( OwnerID())
	Say( TargetID(), "[SC_422061_2]" )
	sleep(30)
	Say( TargetID(), "[SC_422061_3]" )
	sleep(30)
	Say( TargetID(), "[SC_422061_4]" )
	SetFlag(OwnerID() ,542480, 1 )
end


function LuaS_422062()  --為他們喝采
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422062)==true )and( CheckCompleteQuest( OwnerID() , 422062) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422062]","LuaS_422062_1",0) 
end
end

function LuaS_422062_1()  
	SetSpeakDetail(OwnerID(),"[SC_422062_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422062_2]","LuaS_422062_2",0) 
end

function LuaS_422062_2()  
	SetSpeakDetail(OwnerID(),"[SC_422062_3]")
	setFlag(OwnerID() ,542445, 1 )
	CloseSpeak( OwnerID())
end


function LuaS_422062_3()
	local R = Rand( 100 ) + 1
		if R >= 0 and R < 75 and (CountItem (OwnerID(), 204299 )<1) and ( CheckCompleteQuest( OwnerID() , 422090) == false) then
	GiveBodyItem( OwnerID(),204299, 1 )
	Return 1
	End
	GiveBodyItem( OwnerID(),204298, 1 )
	Return 1
end


function LuaS_422064_2()	--世界末日？
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==101740 or ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==101741 then
			return true		
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422064]", 0 )
	return false
end


function LuaS_422064()
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_422064_1]", 0 )
	ScriptMessage( OwnerID(), OwnerID(), 2 ,"[SC_422064_1]", 0 )
	BeginPlot( OwnerID(), "LuaS_422064_1", 0 )
End


function LuaS_422064_1()
	GiveBodyItem (OwnerID(),204239,1)	--給予玩家物件
	DelBodyItem( OwnerID(), 204136,1 )	--刪除玩家身上物件
	Sleep(10)
	SetFlag( OwnerID(),542476, 1 )
end



function LuaS_422065_2()	--期盼一絲希望
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==112519	then
			return true		
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422065]" , 0 )
	return false
end


function LuaS_422065()
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_422065_1]", 0 )
	BeginPlot( OwnerID(), "LuaS_422065_1", 0 )
End


function LuaS_422065_1()
	GiveBodyItem (OwnerID(),204137,1)
	DelBodyItem( OwnerID(),204238 ,1 )	
	Sleep(10)
	SetFlag( OwnerID(),542481, 1 )
end


function LuaS_422065_3()
	if (CheckAcceptQuest(OwnerID(),422065)==true )  and CountBodyItem( OwnerID() , 204238 ) > 0 then	
	tell(OwnerID(), TargetID() ,"[SC_422065_2]")
	ScriptMessage( OwnerID(), OwnerID(), 2 ,"[SC_422065_2]", 0 )
	end
end



function LuaS_422065_4()
	SetPlot(OwnerID(),"range","LuaS_422065_3",150)
end



function LuaS_422067()	--旗子使用780298(6-8)
	local ULI = Lua_DW_CreateObj("flag" ,112656,780298,6 )
	BeginPlot(ULI,"LuaS_422067_1", 0 )
	sleep(80)
	MoveToFlagEnabled (ULI  , false)	--關閉巡邏
	Say(ULI,"[SC_422067]")		--狄瑞爾先生，這附近很危險，請你帶著孩子回村莊裡吧。
	Sleep(20)
	Say(OwnerID(),"[SC_422067_1]")	--放心，孩子我會好好看著，別再來打擾我的研究了～
	Sleep(20)
	Say(ULI,"[SC_422067_2]")		--狄瑞爾先生…請別讓我們需要動用武力把你帶走…副隊長已經為了這件事情煩心很久。
	Sleep(25)
	Say(OwnerID(),"[SC_422067_3]")	--曼徹菲特？不是還有很多事情夠他煩的嗎？我離開村莊又不是來玩的，研究這麼久也沒出事，你還是快去巡邏別處吧～
	Sleep(30)
	Say(ULI,"[SC_422067_4]")		--狄瑞爾先生……
	Sleep(20)
	Say(OwnerID(),"[SC_422067_5]")	--你快走，我自己會看情況應對！
	Sleep(30)
	Say(ULI,"[SC_422067_6]")		--……請自己小心……
	WriteRoleValue( ULI ,EM_RoleValue_IsWalk , 1 )--用走的
	sleep(20)
	MoveToFlagEnabled (ULI  , true)
	LuaFunc_MoveToFlag(ULI , 780298, 8 , 0 )
	DelObj (ULI)
end


function LuaS_422067_1()
	LuaFunc_MoveToFlag(OwnerID() , 780298, 7 , 0 )
end



function LuaS_422068()	--書中世界 
	--SetDelayPatrolTime( TargetID(), 0 )
	BeginPlot( TargetID() , "LuaI_112520_0" , 0 )
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422068)==true )and( CheckCompleteQuest( OwnerID() , 422068) == false) and
	CountBodyItem ( OwnerID(), 204201)>0 then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422068]","LuaS_422068_1",0)
	End

	if (CheckAcceptQuest(OwnerID(),422068)==true )and( CheckCompleteQuest( OwnerID() , 422068) == false) and
	CountBodyItem ( OwnerID(), 204202)>0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_2]","LuaS_422068_2",0)
	end

	if (CheckAcceptQuest(OwnerID(),422068)==true )and( CheckCompleteQuest( OwnerID() , 422068) == false) and
	CountBodyItem ( OwnerID(), 204203)>0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_4]","LuaS_422068_3",0)
	end	
end

function LuaI_112520_0()		--平常白頻說話
	while 1 do
	Say(OwnerID(),"[SC_112520]")
	sleep(20)
	Say(OwnerID(), "[SC_112520_1]")
	sleep(300)
	end
end




function LuaS_422068_1()
	SetSpeakDetail(OwnerID(),"[SC_422068_6]") 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_9]","LuaS_422068_4",0)	--。
End

function LuaS_422068_4()
	SetSpeakDetail(OwnerID(),"[SC_422068_1]")
end

function LuaS_422068_2()
	SetSpeakDetail(OwnerID(),"[SC_422068_7]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_10]","LuaS_422068_5",0) --。
End

function LuaS_422068_5()
	SetSpeakDetail(OwnerID(),"[SC_422068_3]")
end

function LuaS_422068_3()
	SetSpeakDetail(OwnerID(),"[SC_422068_8]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_11]","LuaS_422068_6",0)
End

function LuaS_422068_6()
	SetSpeakDetail(OwnerID(),"[SC_422068_5]")
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	SetFlag(OwnerID() ,542449, 1 )
	CloseSpeak( OwnerID())
	say(TargetID(),"[SC_422068_12]")
end


function LuaS_422068_7()	--檢查同類型的書只能擁有一本 
	if	CountItem( OwnerID(), 204202 )==0	then
		GiveBodyItem(OwnerID (), 204202, 1 )
		Return 1
	end

	if 	CountItem( OwnerID(), 204201 )==0	then
		GiveBodyItem(OwnerID (), 204201, 1 )
		Return 1
	end

	if 	CountItem( OwnerID(), 204203 )==0	then
		GiveBodyItem(OwnerID (), 204203, 1 )
		Return 1
	end
end

function LuaS_422069()	--研究分析
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422069)==true )and( CheckCompleteQuest( OwnerID() , 422069) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422069]","LuaS_422069_1",0) --副隊長請我幫忙調查、解決獅魚人突然攻擊人類的原因。
	end
end

function LuaS_422069_1()  
	SetSpeakDetail(OwnerID(),"[SC_422069_1]")
	SetFlag(OwnerID() ,542447, 1 )
	CloseSpeak( OwnerID())
end



