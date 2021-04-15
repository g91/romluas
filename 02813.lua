function Z25_sound_play_Set()	--布托曼廢墟聲音佈置
	local obj = OwnerID()
	SetPlot( obj, "Range", "Z25_sound_play", 30 )
end

function Z25_sound_play()
	local player = OwnerID()
	local obj = TargetID()
	local ObjPid = ReadRoleValue(obj,EM_RoleValue_PID)
	local SoundX
	if ObjPid == 0 then
		SoundX = PlaySound( TargetID(), "sound/ambience/supplement/zone01_amb_night_mono02.mp3", false ); 
	elseif ObjPid == 1 then
		SoundX = PlaySound( TargetID(), "sound/ambience/supplement/zone01_amb_dungeon_mono05.mp3", false ); 
	elseif ObjPid == 2 then
		SoundX = PlaySound( TargetID(), "sound/ambience/object/zone23_3d_inception_stone.mp3", false ); 
	elseif ObjPid == 3 then
		SoundX = PlaySound( TargetID(), "sound/4_0_0/Creature/zanka/hurt3.mp3", false ); 
	end
end

function Z25_Area01_121727_Say()	--不安的開端
	local Npc = TargetID()
	local player = OwnerID()
	if CheckAcceptQuest(player,425835)==true and CountBodyItem(player,241360)<1 then
		AddSpeakOption(player,Npc,"[SC_121727_0]","Z25_Area01_121727_Speak_0",0)
	end
	LoadQuestOption(player)
end

function Z25_Area01_121727_Speak_0()	--不安的開端
	local Npc = TargetID()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_121727_1]")
		AddSpeakOption(player,Npc,"[SC_121727_2]","Z25_Area01_121727_Speak(1)",0)
		AddSpeakOption(player,Npc,"[SC_121727_3]","Z25_Area01_121727_Speak(2)",0)
end

function Z25_Area01_121727_Speak(Num)	--不安的開端
	Num = Num or 1
	local Npc = TargetID()
	local player = OwnerID()
	if Num == 1 then
		SetSpeakDetail(player,"[SC_121727_4]")
		SetFlag(player,547366,1)
		GiveBodyItem(player,242134,1)
	elseif Num == 2 then
		SetSpeakDetail(player,"[SC_121727_5]")
		SetFlag(player,547367,1)
		GiveBodyItem(player,242134,1)
	end
end

---------------------------------------------------------------
function Z25_Area01_121728_Say()
	local Npc = TargetID()
	local player = OwnerID()
	if CheckAcceptQuest(player,425836)==true and CheckFlag(player,547368)==false then
		AddSpeakOption(player,Npc,"[SC_423317_1]","Z25_Area01_121728_Say_0",0)
	end
	LoadQuestOption(player)
end

function Z25_Area01_121728_Say_0()
	local Npc = TargetID()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_121728_0]")
	AddSpeakOption(player,Npc,"[SC_121728_1]","Z25_Area01_121728_Say_1",0)
end

function Z25_Area01_121728_Say_1()
	local Npc = TargetID()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_121728_2]")
	SetFlag(player,547368,1)	
end

---------------------------------------------------------------

function Z25_Area01_Npc_Say_0()
	local Npc = OwnerID()
	Npcsay(Npc,"[SC_121729_0]")
end

function Z25_Area01_Npc_Say_1()
	local Npc = OwnerID()
	Npcsay(Npc,"[SC_121729_1]")
end

-------------------------------------------------------------------
function LuaM_Z25Patrol_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 5 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = -1  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local CtrlPid =  ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107215,Matrix,1, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107215,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107215,Matrix,2, -1 )
	for i=0,2 do
		CastSpell( ObjMatrix[i+1], ObjMatrix[i+1], 850586 )
	end
	if CtrlPid == 0 then 
		CallPlot(OwnerID(),"Z25_Patrol_Group_1",ObjMatrix)
	elseif CtrlPid == 1 then 
		CallPlot(OwnerID(),"Z25_Patrol_Group_2",ObjMatrix)
	end
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT
--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaM_Z25Patrol_matrix" , 0 )

end

function LuaM_Z25Patrol_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_Z25Patrol_matrix" , 0 )
end

function Z25_Patrol_Group_1(Team)
	while true do
		Npcsay(Team[1],"[Z25_PATROL_GROUPA_0]")
		Sleep(20)
		Npcsay(Team[1],"[Z25_PATROL_GROUPA_1]")
		Sleep(20)
		Npcsay(Team[2],"[Z25_PATROL_GROUPA_2]")
		Sleep(20)
		Npcsay(Team[1],"[Z25_PATROL_GROUPA_3]")
		Sleep(20)
		Npcsay(Team[3],"[Z25_PATROL_GROUPA_4]")
		Sleep(20)
		Npcsay(Team[3],"[Z25_PATROL_GROUPA_5]")
		Sleep(20)
		Npcsay(Team[2],"[Z25_PATROL_GROUPA_6]")
		Sleep(20)
		Npcsay(Team[3],"[Z25_PATROL_GROUPA_7]")
		Sleep(100)
	end
end

function Z25_Patrol_Group_2(Team)
	while true do
		Npcsay(Team[1],"[Z25_PATROL_GROUPA_8]")
		Sleep(20)
		Npcsay(Team[2],"[Z25_PATROL_GROUPA_9]")
		Sleep(20)
		Npcsay(Team[3],"[Z25_PATROL_GROUPA_9]")
		Sleep(40)
		Npcsay(Team[1],"[Z25_PATROL_GROUPA_0]")
		Sleep(20)
		Npcsay(Team[3],"[Z25_PATROL_GROUPA_8]")
		Sleep(20)
		Npcsay(Team[2],"[Z25_PATROL_GROUPA_9]")
		Sleep(100)
	end
end
-------------------------------------------------------------------

function Z25_Area01_425842_UseCK()
	local player = OwnerID()
	local CkNpc = SearchRangeNPC(player,50)

	if CheckAcceptQuest(player,425842)==true then
		for i=0,(#CkNpc) do
			if ReadRoleValue(CkNpc[i],EM_RoleValue_OrgID)==121755 then
				return true
			else
				ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
				return false
			end
		end
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
		return false
	end
end

function Z25_Area01_425842_Used()
	local player = OwnerID()
	local CkNpc = SearchRangeNPC(player,50)
		for i=0,(#CkNpc) do
			if ReadRoleValue(CkNpc[i],EM_RoleValue_OrgID)==121755 and ReadRoleValue(CkNpc[i],EM_RoleValue_PID)==0  then
				CastSpell(player,player,493776)
				SetFlag(player,547372,1)
			elseif ReadRoleValue(CkNpc[i],EM_RoleValue_OrgID)==121755 and ReadRoleValue(CkNpc[i],EM_RoleValue_PID)==1 then
				CastSpell(player,player,493776)
				SetFlag(player,547373,1)
			elseif ReadRoleValue(CkNpc[i],EM_RoleValue_OrgID)==121755 and ReadRoleValue(CkNpc[i],EM_RoleValue_PID)==2 then
				CastSpell(player,player,493776)
				SetFlag(player,547374,1)
			end
		end
end

function Z25_Area01_121765_Speak()
	local Npc = TargetID()
	local player = OwnerID()
	local NpcPid = ReadRoleValue(Npc,EM_RoleValue_Pid)
	if CheckAcceptQuest(player,425843)==true and CheckFlag(player,547379)==false then
		if NpcPid == 0 then
			AddSpeakOption(player,Npc,"[SC_425843_0]","Z25_Area01_121765_Say(0)",0)
		elseif NpcPid == 1 then
			AddSpeakOption(player,Npc,"[SC_425843_0]","Z25_Area01_121765_Say(1)",0)
		elseif NpcPid == 2 then
			AddSpeakOption(player,Npc,"[SC_425843_0]","Z25_Area01_121765_Say(2)",0)
		end
	end
	LoadQuestOption(player)
end

function Z25_Area01_121765_Say(Num)
	local Npc = TargetID()
	local player = OwnerID()
	if Num == 0 then
		SetSpeakDetail(player,"[SC_425843_1]")
	elseif Num == 1 then
		SetSpeakDetail(player,"[SC_425843_2]")
	elseif Num == 2 then
		SetSpeakDetail(player,"[SC_425843_3]")
		SetFlag(player,547379,1)
	end
end

-------

function LuaQ_425818_Check()
	local player = OwnerID()
	local Npc = TargetID()
	local Atable = {}
	
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425818)==true and CheckFlag(player,547384)==false then
		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
        			 Atable=SearchRangePlayer(Npc,50)
				for i=0,table.getn(Atable),1 do
					if CheckAcceptQuest(Atable[i],425818)==true then
						CloseSpeak(Atable[i])
					end
				end
			AddSpeakOption(Player,player,"[SC_423497_2]","LuaQ_425818_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)<5 then
			AddSpeakOption(Player,player,"[SC_423497_2]","LuaQ_425818_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
end

function LuaQ_425818_QuestStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,1)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425818] = Globle_An_TempPlayerPool[425818] or {};
	Globle_An_TempPlayerPool[425818].playerID = {};
	Globle_An_TempPlayerPool[425818].npc = {};
	SetFlag(player,547563,1)
	table.insert(Globle_An_TempPlayerPool[425818].playerID,player)

	CallPlot(player,"LuaQ_425818_Actor",player,npc)
end

function LuaQ_425818_Actor(player,Npc)
	AddBuff(player,622261,0,-1)
	local Papu = LuaFunc_createObjByObj( 121778 , Npc )

	table.insert(Globle_An_TempPlayerPool[425818].npc,Papu)

	CallPlot(Papu,"LuaQ_425818_Show",Papu,player,Npc)
end

function LuaQ_425818_Show(Papu,player,Npc)
	sleep(10)
	NPCSAY(Papu,"[SC_423497_2]")--走吧
	DW_Move("flag",Papu,781245,0)
	Yell(Papu,"[SC_425818_1]",2)
	sleep(30)
	CallPlot(Papu,"LuaQ_425818_PlayerCheck",Papu,player,npc)
	DW_Move("flag",Papu,781245,1)	
	Yell(Papu,"[SC_425818_2]",2)
	sleep(30)
	CallPlot(Papu,"LuaQ_425818_PlayerCheck",Papu,player,npc)
	DW_Move("flag",Papu,781245,2)	
	Yell(Papu,"[SC_425818_3]",2)
	sleep(30)
	CallPlot(Papu,"LuaQ_425818_PlayerCheck",Papu,player,npc)
	DW_Move("flag",Papu,781245,3)		
	Yell(Papu,"[SC_425818_4]",2)
	sleep(20)
	WriteRoleValue(Npc,EM_rolevalue_register9,6)
	CallPlot(Papu,"LuaQ_425818_PlayerCheck",Papu,player,npc)
	DW_Move("flag",Papu,781245,4)	
	Yell(Papu,"[SC_425818_5]",2)
	sleep(20)
	CallPlot(Papu,"LuaQ_425818_PlayerCheck",Papu,player,npc)
	DW_Move("flag",Papu,781245,5)	
	Yell(Papu,"[SC_425818_6]",2)
	sleep(20)
	CallPlot(Papu,"LuaQ_425818_PlayerCheck",Papu,player,npc)
	DW_Move("flag",Papu,781245,6)	

	LuaQ_425818_PlayerReward()
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622261)
	CallPlot(Papu,"LuaQ_425818_QuestEnd",Papu,player,npc)
end

function LuaQ_425818_QuestEnd(Papu,player,npc)
	local Atable = {}
	Globle_An_TempPlayerPool[425818].playerID =nil	
	Globle_An_TempPlayerPool[425818].npc =nil
	Globle_An_TempPlayerPool[425818] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622261)
        	 Atable=SearchRangePlayer(Npc,80)
		for i=0,table.getn(Atable),1 do
			if CheckBuff(Atable[i],501570)==true then
				CancelBuff(Atable[i],501570)
			end
		end
	DelObj(Papu)
end


function LuaQ_425818_PlayerCheck(Papu,player,npc)
	if Globle_An_TempPlayerPool == nil then
		return
	else
		if Globle_An_TempPlayerPool[425818] == nil then
			return
		else
			if Globle_An_TempPlayerPool[425818].playerID == nil then
				return
			end
		end
	end
	local TempPlayerID = Globle_An_TempPlayerPool[425818].playerID
	local QuestTF = 0
	local DisTF = 0
	local PlayerID=0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425818)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,Papu,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1   then
			ScriptMessage( value, value, 0,"[SAY_420635_1]", 0 )
			ScriptMessage( value, value, 1,"[SC_425818_0]", 0 )
			sleep(10)
			ScriptMessage( value, value, 1,"[SAY_420635_1]", 0 )
			CancelBuff(value,622261)
			table.remove(TempPlayerID,key)
		end
		if CheckID(value)==0 then
			table.remove(TempPlayerID,key)
		end
	end

	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Papu,"LuaQ_425818_QuestEnd",Papu,player,npc)
	end
end

function LuaQ_425818_PlayerReward()
	
	for key,value in pairs(Globle_An_TempPlayerPool[425818].playerID) do
		if CheckAcceptQuest(value,425818)==true and
			CheckDistance(value,OwnerID(),100)==true and 
			Checkbuff(value,622261)==true then
			SetFlag(value,547384,1)
			CancelBuff(value,622261)
			table.remove(Globle_An_TempPlayerPool[425818].playerID,value)
		end
	end
end

function LuaQ_425818_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425818_Yes","LuaQ_425818_No")
end

function LuaQ_425818_Yes()
	if Globle_An_TempPlayerPool == nil then
		return
	else
		if Globle_An_TempPlayerPool[425818] == nil then
			return
		else
			if Globle_An_TempPlayerPool[425818].playerID == nil then
				return
			end
		end
	end
	local player=OwnerID()
	AddBuff(player,622261,0,-1)
	SetFlag(player,547563,1)
	table.insert(Globle_An_TempPlayerPool[425818].playerID,player)	
	for key,value in pairs(Globle_An_TempPlayerPool[425818].npc) do
		if ReadRoleValue(value,EM_RoleValue_OrgID)==121778  then
		X=ReadRoleValue(value,EM_rolevalue_X)
		Y=ReadRoleValue(value,EM_rolevalue_Y)
		Z=ReadRoleValue(value,EM_rolevalue_Z)
		dir=ReadRoleValue(value,EM_rolevalue_dir)
		SetPos(player,x,y,z,dir)
		end
	end
end

function LuaQ_425818_No()
	return
end


----
function LuaQ_425974_Click()--任務:放置薰香，點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107628 --放置薰香
	DelBodyItem(player,242168,1)
	AddBuff(Npc,623857,0,15)
	CallPlot(player,"DW_QietKillOne",player,questitem)	
	return true
end

function LuaQ_425991_Check()--任務:餓死他們，點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107637 --燃燒軍糧
	if CountBodyItem(player,242194)==1 then
		return true
	else
		return false
	end
end

function LuaQ_425991_Click()--任務:餓死他們，點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107637 --燃燒軍糧
	AddBuff(Npc,504694,0,15)
	CallPlot(player,"DW_QietKillOne",player,questitem)	
	return true
end

function LuaQ_425848_ask()
	local player = OwnerID()
	local Npc = TargetID()
	local Torg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	local Qkey = { [121843]=547565 , [121844]=547566 , [121845]=547567 }	--啪賓--牟西所--烏希卡
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425848)==true and CheckFlag(player,Qkey[Torg])==false then
		AddSpeakOption(player,npc,"[SC_425848_0]","LuaQ_425848_say("..Torg..")",0)
	end
	if Torg==121845 then
		if CheckAcceptQuest( Player,425972)== true	and
			CountBodyItem(Player, 242213)==0	then
			SetSpeakDetail(Player, "[SC_Z24Q425972_01]")
			AddSpeakOption( Player, NPC, "[SC_Z24Q425972_02]", "LuaPG_425972_Take_02(1)", 0 )
		else
			LoadQuestOption(Player)
		end
	end
end

function LuaQ_425848_say(Torg)
	local player = OwnerID()
	if Torg==121843 then
		SetFlag(player,547565,1)
		SetSpeakDetail(player,"[SC_425848_1]")
	elseif Torg==121844 then
		SetFlag(player,547566,1)
		SetSpeakDetail(player,"[SC_425848_2]")
	elseif Torg==121845 then
		SetFlag(player,547567,1)
		SetSpeakDetail(player,"[SC_425848_3]")
	end
end

function Lua_425977_drink_check()
	local player = OwnerID()
	if CheckAcceptQuest(player,425977)==true then
		return true
	else 
		return false	
	end
end

function Lua_425977_drink()
	local player = OwnerID()
	local Npc = TargetID()
	local buffA=Lua_BuffPosSearch( player ,624049)				--找玩家身上判斷BUFF的位子
	local checkbuffA = BuffInfo( player , buffA , EM_BuffInfoType_Power )	--確認BUFF層數

	if checkbuffA==0 then
		SetFlag(player,547568,1)
		ScriptMessage( player, player, 1,"[SC_425977_0]", 0 )		
	elseif checkbuffA==1 then
		ScriptMessage( player, player, 1,"[SC_425977_1]", 0 )
	elseif checkbuffA==2 then
		ScriptMessage( player, player, 1,"[SC_425977_2]", 0 )
	elseif checkbuffA==3 then
		SetFlag(player,547595,1)	
		UseItemDestroy() 
		ScriptMessage( player, player, 1,"[SC_425977_3]", 0 )
		Cancelbuff(player,624049)
	end
end

function Lua_425960_say_0()
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,425960)==true and CheckFlag(player,547596)==false then
		AddSpeakOption(player,npc,"[SC_425960_0]","Lua_425960_say_1",0)
	end
	LoadQuestOption(player)
end

function Lua_425960_say_1()
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_425960_1]")
	SetFlag(player,547596,1)
end

function Lua_425993_Say_0()
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,425993)==true and CountBodyItem(player,242196)==0 and CountBodyItem(player,242239)==0 then
		AddSpeakOption(player,npc,"[SC_425993_0]","Lua_425993_Say_1",0)
	end
	LoadQuestOption(player)
end

function Lua_425993_Say_1()
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_425993_1]")
	GiveBodyItem(player,242239,1)
end

function LuaQ_425994_letter()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 425994 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 77 and CheckCompleteQuest(OwnerID(),425994)==false then
		ShowBorder( OwnerID(),425994, str,"ScriptBorder_Texture_Paper" )
	elseif CheckCompleteQuest(OwnerID(),425994)==true and CheckAcceptQuest(OwnerID(),426145)==false then
		ShowBorder( OwnerID(),426145, str,"ScriptBorder_Texture_Paper" )	
	elseif CheckCompleteQuest(OwnerID(),425994)==true and CheckAcceptQuest(OwnerID(),426145)==true then
		ShowBorder( OwnerID(),426148, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end

function Lua_425993_Rune_check()
	local player = OwnerID()
	if CheckAcceptQuest(player,425993)==true then
		return true
	end
end

function Lua_425993_rune()
	local player = OwnerID()
	local Npc = TargetID()
	local buffA=Lua_BuffPosSearch( player ,624058)				--找玩家身上判斷BUFF的位子
	local checkbuffA = BuffInfo( player , buffA , EM_BuffInfoType_Power )	--確認BUFF層數

	if checkbuffA>=9 and CountBodyItem(player,242196)<1 then
		GiveBodyItem(player,242196,1)
		UseItemDestroy() 
		CancelBuff(player,624058)		
		ScriptMessage( player, player, 1,"[SC_102558_4]", 0 )
	else
		ScriptMessage( player, player, 1,"[SC_425993_2][$SETVAR1=".."[".."242196".."]".."]", 0 )		
	end
end



function Lua_425996_CheckKey()
	local player = OwnerID()
	if (CheckAcceptQuest(player,425996)==true or CheckAcceptQuest(player,426146)==true or CheckAcceptQuest(player,426149)==true) and CountBodyItem(player,242197)>0 then
		return true
	elseif CountBodyItem(player,242197)<1 then
		ScriptMessage( player, player, 1,"[SC_425996_0][$SETVAR1=".."[".."242197".."]".."]", 0 )
		return false
	elseif CheckAcceptQuest(player,425996)==true or CheckAcceptQuest(player,426146)==true or CheckAcceptQuest(player,426149)==true then
		ScriptMessage( player, player, 1,"[SYS_GAMEMSGEVENT_422]", 0 )
		return false
	end
end

function Lua_425996_Key()
	local player = OwnerID()
	local npc = TargetID()
	local questitem = 107638 --救出士兵
	DelBodyItem(player,242197,1)
	PlayMotion(npc,145)
	CallPlot(npc,"LuaQ_425996_Show",npc,player)
	CallPlot(player,"DW_QietKillOne",player,questitem)
	return true
end

function Lua_425996_JAIL()
	local npc = OwnerID()	
	local RoomID = ReadRoleValue(NPC,EM_RoleValue_RoomID)
	local Aman = LuaFunc_CreateObjByObj ( 121946 , NPC) 
	SetModeEx(NPC,EM_SetModeType_Obstruct,true)
	WriteRoleValue(NPC,EM_RoleValue_Register2,Aman)
	WriteRoleValue(Aman,EM_RoleValue_Register2,NPC)
	AddToPartition(Aman,RoomID)
end

function LuaQ_425996_Show(npc,player)
	local Aman = ReadRoleValue (npc,EM_RoleValue_Register2)
	CallPlot(npc,"LuaQ_425996_Hidebox",Aman)
	CallPlot(Aman,"LuaQ_425996_Show2",npc,Aman)
	Hide(Aman)
end

function LuaQ_425996_Show2(npc,Aman)
	local RoomID = ReadRoleValue(Aman,EM_RoleValue_RoomID)
	local Bman = CreateObj_ByObjPoint(Aman,121946,"p_down") 
	SetModeEx(Bman,EM_SetModeType_Gravity,true)
	AddToPartition(Bman,RoomID)
	Sleep(10)
	npcsay(Bman,"[EM_421042_2]")
	Sleep(10)
	DelObj(Bman)
	PlayMotion(npc,147)	
end

function LuaQ_425996_Hidebox(Aman)
	sleep(200)
	Show(Aman,0)
end

--------

function Lua_425995_SetPlot()
	local Ctrl = OwnerID()
	SetPlot(Ctrl,"Range","Lua_425995_Drama_set",40)
end

function Lua_425995_Drama_set()

	local player = OwnerID()
	local Npc = TargetID()
	local playertable = SearchRangePlayer(npc,120)
	local playercount = 0
	local Templayer = {}
	local regis9 = 0
	regis9 = ReadRoleValue(Npc ,EM_RoleValue_Register9)
	if regis9>0 then
		SetPlot(Npc ,"Range","",40)
	end

	if CheckAcceptQuest(player,425995)==true and CheckFlag(player,547575)==false then
		for playercount=0,#playertable do
			if CheckAcceptQuest(playertable[playercount],425995)==true and CheckFlag(playertable[playercount],547575)==false then
				table.insert(Templayer,playertable[playercount])
				WriteRoleValue(npc,EM_RoleValue_Register9,9)
				CallPlot(npc,"Lua_425995_Drama",player,Npc,Templayer)
			else
				ScriptMessage( Npc,player,1,"[SC_424528_3]", 0 )
				return
			end
		end
	else
		return
	end
end

function Lua_425995_Drama(player,Npc,Templayer)
	local DramaFlag = 781248
	local RoomID = ReadRoleValue(Npc,EM_RoleValue_RoomID)
	AddBuff(player,624059,0,24)
	local SCMD = Lua_DW_CreateObj("flag",121942, DramaFlag, 0)
	local GOLA = Lua_DW_CreateObj("flag",121943, DramaFlag, 1)
	ScriptMessage( Npc,player,1,"[SC_425995_0]", 0 )
	Sleep(10)
	AddToPartition(SCMD,RoomID)
	AddToPartition(GOLA,RoomID)

	Sleep(10)
		ScriptMessage( Npc,Player,3,"[SC_425995_1]","0xffbd00bd" )
	Sleep(30)
		ScriptMessage( Npc,Player,3,"[SC_425995_2]","0xffbd00bd" )
	Sleep(30)
		ScriptMessage( Npc,Player,3,"[SC_425995_3]","0xff808080" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_4]","0xffbd00bd" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_5]","0xffbd00bd" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_6]","0xffbd00bd" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_7]","0xff808080" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_8]","0xffbd00bd" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_9]","0xff808080" )
	Sleep(20)
		ScriptMessage( Npc,Player,1,"[SC_425995_10]",0)	
	Sleep(10)
		ScriptMessage( Npc,Player,3,"[SC_425995_11]","0xffbd00bd" )
	Sleep(20)
		ScriptMessage( Npc,Player,3,"[SC_425995_12]","0xff808080" )
	for index,value in pairs(Templayer) do
		SetFlag(value,547575,1)
	end
	DelObj(SCMD)
	DelObj(GOLA)	
	CancelBuff(player,624059)
	WriteRoleValue(npc,EM_RoleValue_Register9,0)
	BeginPlot(npc,"Lua_425995_SetPlot",25)
end

function Lua_425996_Hostage()--俘虜的台詞
	local npc = OwnerID()
	local Npcstr = { [1]="SC_Z25_NPC_0",[2]="SC_Z25_NPC_1"}
	while true do
		Npcsay(npc,"["..Npcstr[Dw_Rand(2)].."]")
		sleep(80+Dw_Rand(50))
	end
end

function Lua_425996_Npc()--壞蛋的台詞
	local npc = OwnerID()	
	local Npcstr = { [1]="SC_Z25_NPC_2",[2]="SC_Z25_NPC_3"}
	Npcsay(npc,"["..Npcstr[Dw_Rand(2)].."]")
end

function LuaQ_426063_letter()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 426063 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>=77 and CheckCompleteQuest(OwnerID(),426063)==false then
		ShowBorder( OwnerID(),426063, str,"ScriptBorder_Texture_Paper" )
	elseif CheckCompleteQuest(OwnerID(),426063)==true and CheckAcceptQuest(OwnerID(),426008)==false then
		ShowBorder( OwnerID(),426008, str,"ScriptBorder_Texture_Paper" )	
	elseif CheckCompleteQuest(OwnerID(),426063)==true and CheckAcceptQuest(OwnerID(),426008)==true then
		ShowBorder( OwnerID(),426018, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end

function LuaQ_426062_Check()--任務:，動點手腳(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	if CountBodyItem(player,242227)>0 then
		return true
	else
		return false
	end
end

function LuaQ_426062_Click()--任務:，動點手腳(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local NpcPid = ReadRoleValue(npc,EM_RoleValue_PID) --放置薰香
	if NpcPid == 0 then
		SetFlag(player,547598,1)
		return true
	elseif NpcPid == 1 then
		SetFlag(player,547599,1)
		return true
	elseif NpcPid == 2 then
		SetFlag(player,547600,1)
		return true
	elseif NpcPid == 3 then
		SetFlag(player,547601,1)
		return true
	else
		return false
	end
end














