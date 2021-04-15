
function LuaS_422074()  --揭開內幕

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422074)==true )and( CheckCompleteQuest( OwnerID() , 422074) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422074]","LuaS_422074_1",0) --是的，我想知道獅魚人突然攻擊人類的原因。
	end
end


function LuaS_422074_1()  
	SetSpeakDetail(OwnerID(),"[SC_422074_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422074_2]","LuaS_422074_2",0) ---他們要物資的用意是什麼？
end

function LuaS_422074_2()  
	SetSpeakDetail(OwnerID(),"[SC_422074_3]")
	SetFlag(OwnerID() ,542446, 1 )
	CloseSpeak( OwnerID())
end


function LuaS_422074_3()	--點擊物品後(鼓)
	local GY =  Lua_DW_CreateObj("flag" ,112663,780298,9 )
	WriteRoleValue (OwnerID(), EM_RoleValue_PID,GY)
	BeginPlot( GY, "LuaS_422074_4", 0 )
	return true 
end

function LuaS_422074_4()
	Local GY = ReadRoleValue(TargetID(),EM_RoleValue_PID)	
	AddBuff(GY,503078 ,0,5 )
	sleep(50)
	DelObj (GY)
	setFlag(TargetID() ,542483, 1 )		
end



function LuaS_422075()	--回覆調查結果
	local NPC = SearchRangeNPC ( OwnerID() , 300 )
	for i=0,table.getn(NPC)-1 do
		if  ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==112687 then
			return 
		end
	end
	BeginPlot(OwnerID(),"LuaS_422075_2",0)
	local UL = Lua_DW_CreateObj("flag",112687 ,780350,1 )
	MoveToFlagEnabled(UL , false )
	WriteRoleValue( UL ,EM_RoleValue_IsWalk , 1 )
	LuaFunc_MoveToFlag( UL,780350,2,0)
	Say(UL, "[SC_422075]")  --都已經回村裡就別再跟著我了！
	sleep(10)
	LuaFunc_MoveToFlag( UL,780350,3,0)
	sleep(10)
	Say(UL, "[SC_422075_2]")  --你以為我會笨到讓妳再度偷偷跟上嗎？
	LuaFunc_MoveToFlag( UL,780350,4,0)
	Say(OwnerID() , "[SC_422075_4]")  --這次...謝謝你們的幫忙。
	sleep(30)
	Say(UL, "[SC_422075_5]")  --...那...算小事啦！倒是你們還要辛苦保護村民～
	sleep(30)
	Say(OwnerID() , "[SC_422075_6]")  --但是，徹底幫獅魚人解決問題前，野外還是很危險。
	sleep(30)
     	Say(UL, "[SC_422075_7]")  --...唉...好，我會再跟他們說的。
	sleep(10 )
	LuaFunc_MoveToFlag( UL,780350,5,0)
	DelObj (UL)
end

function LuaS_422075_2()
	local DLI = Lua_DW_CreateObj("flag",112700 ,780350,6 )
	WriteRoleValue( DLI ,EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled(DLI , false )	
	LuaFunc_MoveToFlag( DLI,780350,7,0)
	Say(DLI, "[SC_422075_1]")  --大叔～什麼時候要再出去？
	sleep(10)
	LuaFunc_MoveToFlag( DLI,780350,8,0)
	Say(DLI, "[SC_422075_3]")  --大叔！我想去玩～
	sleep(30)
	LuaFunc_MoveToFlag( DLI,780350,9,0)
	sleep(100)
	Say(DLI, "[SC_422075_8]")  --大叔，等等我
	LuaFunc_MoveToFlag( DLI,780350,10,0)
	DelObj (DLI)
end

function LuaS_422084()	--排斥人的孩子
	LoadQuestOption( OwnerID())
	if (CheckAcceptQuest(OwnerID(),422084)==true)and(CheckCompleteQuest( OwnerID() , 422084) == false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422084]","LuaS_422084_1",0)	--你好～
	end	

	if (CheckAcceptQuest(OwnerID(),422086)==true)and( CheckCompleteQuest( OwnerID() , 422086) == false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422086]","LuaS_422086_1",0)	--聽說你總是偷偷把艾莉娜．瓊瓦的寶物藏起來，為什麼？
	end		

	if (CheckAcceptQuest(OwnerID(),422085)==true)and( CheckCompleteQuest( OwnerID() , 422085) == false) then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_5]","LuaS_422085_3",0)		--我找到艾莉娜的寶物了。
	end	
end


function LuaS_422086_1()  
	SetSpeakDetail(OwnerID(),"[SC_422086_1]")					--哼！不想說！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422086_2]","LuaS_422086_2",0)	--你再藏，我還是會找到它。
end

function LuaS_422086_2()  
	SetSpeakDetail(OwnerID(),"[SC_422086_3]")					--……好吧…艾莉娜．瓊瓦只有兩根羽毛…一根要給… 
	SetFlag(OwnerID() ,542495, 1 )
	end

	
function LuaS_422084_1()
	SetSpeakDetail(OwnerID(),"[SC_422084_1]")					--你是誰？又是芬朵莎叫來的？就算我沒有爸爸、媽媽，也不要你管！快點走開！
	BeginPlot(TargetID() , "LuaS_422084_2", 0 )
	DisableQuest( TargetID() , true )						--開關NPC頭上的任務提示以及對話劇情(true關閉)

end

function LuaS_422084_2() 
	local ILI = Lua_DW_CreateObj("flag" ,112607,780298,10 )
	WriteRoleValue(OwnerID(), EM_RoleValue_PID, ILI )
	BeginPlot(ILI,"LuaS_422084_11", 0 )
	BeginPlot(ILI,"LuaS_422084_4", 0 )
	sleep(90)
	Say(OwnerID() , "[SC_422084_4]")						--自己找，找不到就是笨蛋～ 
	SetFlag(TargetID() ,542484, 1 )
	DisableQuest( OwnerID() , false )
end
	
function LuaS_422084_11()
	LuaFunc_MoveToFlag(OwnerID(),780298,11,0)
	MoveToFlagEnabled( OwnerID(), false )	
	Say(OwnerID(),"[SC_422084_2]") 						--你是壞蛋！把我的寶物還給我！
	sleep(30)
	Say(OwnerID(),"[SC_422084_5]")						--可惡！
	LuaFunc_MoveToFlag( OwnerID(),780298,12,0)
	DelObj(OwnerID())
end


function LuaS_422084_4()
	local DOGGY = Lua_DW_CreateObj("flag" ,112664,780298,13 )
	WriteRoleValue( OwnerID(), EM_RoleValue_PID, DOGGY )
	BeginPlot(OwnerID(), "LuaS_422084_12", 0 )	
end

function LuaS_422084_12()
	Local DOGGY = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	LuaFunc_MoveToFlag( DOGGY,780298, 14,0)
	MoveToFlagEnabled(DOGGY , false )
	Say(DOGGY, "[SC_422084_3]") --汪！
	LuaFunc_MoveToFlag( DOGGY,780298,15,0)
	SLEEP(10)
	LuaFunc_MoveToFlag( DOGGY,780298,16,0)
	DelObj(DOGGY)
end

function LuaS_422085()	--掛在艾莉娜身上
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) > 0 then
	SetSpeakDetail(OwnerID(),"[SC_422085_4]")	--小黃狗亂跑，不在
	else
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422085)==true)and( CheckCompleteQuest( OwnerID() , 422085) == false) and CountBodyItem( OwnerID() ,204360) == 0 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422085]","LuaS_422085_1",0)		--我來幫忙找出妳的寶物。
	End
	end
end	

function LuaS_422085_1()  
	SetSpeakDetail(OwnerID(),"[SC_422085_1]")					--真的？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_2]","LuaS_422085_2",0)	--對，妳的寶物是什麼，小黃狗看過嗎？
end

function LuaS_422085_2()  
	SetSpeakDetail(OwnerID(),"[SC_422085_3]")					--羽毛！漂亮的紫色羽毛，我這裡還有！只有兩根，是我的寶物，小黃狗壞壞抓去聞，你要借牠？
	if ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_6]","LuaS_422085_4",0)	--對，我想借助牠的能力。	
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_6]","LuaS_422085_11",0)--對，我想借助牠的能力。
	end	
	
End


function LuaS_422085_3()  
	if CountBodyItem( OwnerID() , 204360 ) > 0 then
	SetSpeakDetail(OwnerID(),"[SC_422085_7]")					--怎麼可能！我藏很好，你有這麼強？
	SetFlag(OwnerID() ,542494, 1 )
	end
End

function LuaS_422085_4()  
	CloseSpeak( OwnerID())
	say(TargetID(),"[SC_422085_8]")						--好～小黃狗愛亂跑～跟好牠！
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaS_422085_6" , 0)
end

function LuaS_422085_11()  
	SetSpeakDetail(OwnerID(),"[SC_422085_9]")					--可是，小黃狗現在不在......牠愛亂跑，等牠回來～
end




function LuaS_422085_6()	
	local X,Y,Z,Dir,Dis
	Dis = 15
	X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=270 	then
		Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) -270
	else
		Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)+90
	end
	XYZ = { X+Dis*math.sin(math.pi/180*Dir) , Y , Z+Dis*math.cos(math.pi/180*Dir) }
	sleep( 10 )
	local Dog = Lua_DW_CreateObj("xyz" , 112664 , XYZ , 1 , ReadRoleValue(OwnerID() , EM_RoleValue_Dir) )
	WriteRoleValue(Dog,EM_RoleValue_PID,TargetID())
	BeginPlot(Dog,"LuaS_422085_7",0)
end

function LuaS_422085_7()
	local Owner = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local QuestNpc = {112716,112715,112714,112713,112527}
	local QuestItem = {204414,204406,204419,204420,204360}
	local FlagX , FlagY , FlagZ , X , Y , Z , RandFlag , Dir , AntiDir , OutItem , BefoRand
	local Dis = 15
	local XYZ = {}
	RandFlag = 0
	for	i=1,5	do
		BefoRand = RandFlag
		while BefoRand == RandFlag	do
			RandFlag = DW_Rand(GetMoveFlagCount(780356)-2)+1
		end
--		LuaS_422085_8(OwnerID() , 780356 , RandFlag)
		X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		FlagX = GetMoveFlagValue( 780356 , RandFlag , EM_RoleValue_X )
		FlagY = GetMoveFlagValue( 780356 , RandFlag , EM_RoleValue_Y )
		FlagZ = GetMoveFlagValue( 780356 , RandFlag , EM_RoleValue_Z )

		for i = 0 , 20 , 1 do
		if	math.floor(FlagX/10) ~= math.floor(X/10)	and
			math.floor(FlagZ/10) ~= math.floor(Z/10)	then
			Move( OwnerID() , FlagX, FlagY, FlagZ )
			sleep(20)
			X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
			Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
			Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)

		end
		end
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=180	then
			AntiDir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) - 180
		else
			AntiDir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) + 180
		end
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=270 	then
			Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) -270
		else
			Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)+90
		end

		XYZ = { X+Dis*math.sin(math.pi/180*Dir) , Y , Z+Dis*math.cos(math.pi/180*Dir) }
		OutItem = Lua_DW_CreateObj("xyz" , QuestNpc[i], XYZ ,1 , AntiDir )
		WriteRoleValue(OutItem,EM_RoleValue_PID, Owner)
		WriteRoleValue(OutItem,EM_RoleValue_Register2 , QuestItem[i])
		ScriptMessage( OwnerID(), 0 , 2, "[SC_422085_10]", 0 )
		SetPlot(OutItem,"touch","LuaS_422085_10",50)
		BeginPlot(OutItem,"LuaS_422085_9",0)
		while CheckID(OutItem) do
			sleep(10)
		end
		if ChecKID(Owner) == false or GetDistance( Owner , OwnerID() ) > 350 or ReadRoleValue( Owner , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(Owner,422085)==false or CheckCompleteQuest(Owner,422085)==true then
		ScriptMessage( Owner,Owner , 2, "[SC_422085_11]", 0 )
			break
		
		end
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
	ScriptMessage( OwnerID(), 0 , 2, "[SC_422085_11]", 0 )
	DelObj(OwnerID())
end

function LuaS_422085_8(Who,FlagID,ID)
	LuaFunc_MoveToFlag( Who, FlagID , ID ,0 )
end

function LuaS_422085_9()
	local sec = 0
	while sec < 15 do
		sleep(10)
		sec = sec +1
	end
	DelObj(OwnerID())
end

function LuaS_422085_10()
	SetPlot(TargetID(),"touch","",0)
	local Item = ReadRoleValue(TargetID(),EM_RoleValue_Register2)
	if	ReadRoleValue(TargetID(),EM_RoleValue_PID) == OwnerID()	then
		GiveBodyItem(OwnerID(),Item,1)
	end
	DelObj(TargetID())
end


function LuaS_422087()	--謝禮與請求	
	say(OwnerID(),"[SC_422087]")	--那杯用水骨葉做成的精心特調絕對能讓你補充體力！
end

function LuaS_422087_1()	--點擊物品後
	if (CheckAcceptQuest(OwnerID(),422087)==true)and(CheckFlag( OwnerID(), 542496 )== false) then
	AddBuff(OwnerID(),501578 ,0,30 )
	SetFlag(OwnerID() ,542496, 1 )
	return true
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422087_1]", 0 )
	return false
end



function LuaS_422089()	--我不是要你偷...
		local FISHGO = Lua_DW_CreateObj("flag" ,112653,780355,1) 
		say( OwnerID(),"[SC_422089]" )
		sleep(100)
		DelObj(FISHGO)	
end





function LuaS_422090() 	--掛在物品上	更完美的石頭雕刻
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 422090, 1 ));
	ShowBorder( OwnerID(), 422090,str , "ScriptBorder_Texture_Paper" )				
end



function LuaS_422111() --製作吊網的材料 任務完成後產生一個吊網到地上 
	local WOW = Lua_DW_CreateObj("flag" ,112665,780355,2 ) 
	say(OwnerID(),"[SC_422111]" )
		Sleep(100)	
	DelObj(WOW)
	end

function LuaS_422111_1()	--掛在點擊物件後
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649	then
		local R = Rand( 100 ) + 1
	
		if R >= 0 and R < 33 and(CountItem (OwnerID(), 204401)<4) and ( CheckCompleteQuest( OwnerID() , 422111) == false) and (ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649) then
				GiveBodyItem( OwnerID(), 204401, 2)
		
		end
		if R >= 33 and R < 66 and (CountItem (OwnerID(), 204402 )<4) and ( CheckCompleteQuest( OwnerID() , 422111) == false) and (ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649) then
				GiveBodyItem( OwnerID(),204402, 2 )
				
		end
		if R >= 67 and R < 100 and( CountItem (OwnerID(), 204403 )<4) and ( CheckCompleteQuest( OwnerID() , 422111) == false) and (ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649) then
				GiveBodyItem( OwnerID(),204403, 2 )
		
		end
		BeginPlot(OwnerID() , "LuaS_422111_2", 0 )
	end
	Return 1
end


function LuaS_422111_2()
	if CountItem( OwnerID(), 204401)<4 then
		GiveBodyItem( OwnerID(),204401, 1 )
		Return 
	end

	if CountItem( OwnerID(), 204402)<4 then
		GiveBodyItem( OwnerID(),204402, 1 )
		Return 
	end

	if CountItem( OwnerID(), 204403)<4 then
		GiveBodyItem( OwnerID(),204403, 1 )
		Return 
	end
end







