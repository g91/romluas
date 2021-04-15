--主線任務：426123，曼索瑞恩的邀請函。
--主線任務：426124，光龍使命
function lua_Z25Q426123_SZ()
	local player = OwnerID()
	if CheckAcceptQuest( player,426124 ) and CheckFlag( player,547722 )==false then
		SetSpeakDetail( player,"[SC_426124_1]" )
		AddSpeakOption( player,player,"[SC_426124_2]","lua_Z25Q426124_1",0 )
	else
		LoadQuestOption( player )
	end
	if CheckAcceptQuest( player,426123 ) and CheckFlag( player,547721 )==false then
		AddSpeakOption( player,player,"[SC_Z24N120973_1]","lua_Z25Q426123_1",0 )
	end
end
--呈上
function lua_Z25Q426123_1()
	local player = OwnerID()
	local x,y,z,dir = DW_Location( player )
	local BuffID = 507178
	local Obj
		CloseSpeak( player )
		if CheckBuff( player,BuffID )==false then
			AddBuff( player,BuffID,0,38 )
			Obj = CreateObj( 106794,x,y,z,dir,1 )
				SetFightMode ( Obj,0, 0, 0, 0 ) 
				SetModeEx( Obj, EM_SetModeType_Move, false )	--移動
				SetModeEx( Obj, EM_SetModeType_Gravity, false )--重力
				SetModeEx( Obj, EM_SetModeType_Show, false )	--顯示
				AddToPartition( Obj,0 )
			PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			CallPlot( Obj,"lua_Z25Q426123_QuestStart",Obj,player )
		end
end
--呈上
function lua_Z25Q426123_QuestStart( Obj,player )
	CallPlot( Obj,"lua_Z25Q426123_QuestCheck",Obj,player )
	Sleep(10)
	ScriptMessage( player,player,3,"[SC_426123_1]","0xffff8040" )	--我要說的是千年前的故事…
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_2]","0xffff8040" )	--人王之前，魔族為了權力、為了力量彼此爭戰不休，造成世界極大的動亂。
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_3]","0xffff8040" )	--狡詐的魔族討厭各種強大的力量，鼓動叛逆且氣盛的龍族們加入戰火。
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_4]","0xffff8040" )	--龍族擁有保護元素脈流的使命…
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_5]","0xffff8040" )	--然而加入了魔族的戰爭，將仇恨帶入心中，使他們拋下自己的責任和天命。
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_6]","0xffff8040" )	--真龍之間的猛烈戰鬥造成元素脈流大亂
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_7]","0xffff8040" )	--最終，造成元素王的出現…那時已經來不及了…
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_8]","0xffff8040" )	--龍族為了阻止元素王的毀滅付出了慘痛的代價。
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_9]","0xffff8040" )	--吾友…地龍之王剎尼赫斯…犧牲自己的性命才消滅了風元素王…
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_10]","0xffff8040" )	--唉…
	Sleep(30)
	ScriptMessage( player,player,3,"[SC_426123_11]","0xffff8040" )	--曼索瑞恩為了私慾與力量喚醒了火元素王
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_12]","0xffff8040" )	--然而他並不曉得元素王的恐怖力量究竟有多強大…元素脈流影響世界的崩解…
	Sleep(25)
	ScriptMessage( player,player,3,"[SC_426123_13]","0xffff8040" )	--地龍之子，摩瑞克．渥林特 與 龍族使者
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_14]","0xffff8040" )	--在火元素王出現前，我會進行夢行之眠
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_15]","0xffff8040" )	--我會全力進行修復元素脈流，盡可能的消弱火元素王法伊羅特的力量。
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_16]","0xffff8040" )	--答應我，請你們一定要…
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_17]","0xffff8040" )	--阻止曼索瑞恩的野心…阻止卡德摩斯的犧牲，現在我們不得再失去任何真龍的力量…
end
--呈上
function lua_Z25Q426123_QuestCheck( Obj,player )
	local QuestID = 426123
	local FinishFlagID = 547721
	local CheckBuffID = 507178
	local CheckRange =70
		for i= 1, 38 do
			if  CheckID( player ) == true and  
				( CheckAcceptQuest( player, QuestID ) ~= true or --檢查有無任務
				CheckBuff( player, CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player, FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player, Obj, CheckRange ) ~= true ) then --檢查是否超過檢查範圍
				
					CancelBuff( player, CheckBuffID )
					ScriptMessage( player,player,1,"[SC_422974_FAILED]",0 )
					DelObj( Obj)
					return
			end
			Sleep( 10 )
		end
		Sleep( 30 )
			if  CheckID( player ) == true and  
				( CheckAcceptQuest( player, QuestID ) ~= true or --檢查有無任務
				CheckBuff( player, CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player, FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player, Ctrl, CheckRange ) ~= true ) then --檢查是否超過檢查範圍	
					SetFlag( player,FinishFlagID,1 )
			end
		DelObj( Obj)
		return	
end

--呈 lua_Z25Q426123_SZ()
function lua_Z25Q426124_1()
	SetSpeakDetail( OwnerID(),"[SC_426124_3]" )
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426124_4]","lua_Z25Q426124_2",0 )
end
function lua_Z25Q426124_2()
	SetSpeakDetail( OwnerID(),"[SC_426124_5]" )
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426124_6]","lua_Z25Q426124_3",0 )
end
function lua_Z25Q426124_3()
	SetSpeakDetail( OwnerID(),"[SC_426124_7]" )
	SetFlag( OwnerID(),547722,1 )
end

--426083 夢的化身 表演的部份
function lua_Q426083_range()
	SetPlot( OwnerID(), "range","lua_Q426083_run",50 )
end
function lua_Q426083_run()
	if CheckAcceptQuest( OwnerID(),426083 ) then
		SetPlot( TargetID(), "range", "", 0 )
		CallPlot( TargetID(), "lua_Q426083_1", 0 )
	end
end
function lua_Q426083_1()
	local mora1 =OwnerID()
	local tmp = SearchRangeNPC( mora1,70)
	local moralua 
		for i=0 , #tmp  do
			if ReadRoleValue( tmp[i], EM_RoleValue_OrgID ) == 121995 then
				moralua = tmp[i]
			end
		end
			Sleep(10)
			Say( mora1,"[SC_Z25Q426083_4]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_5]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_6]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_7]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_8]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_9]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_10]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_11]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_12]")
			Sleep(10)
			local player = SearchRangePlayer( OwnerID(),100 )
			for i=0, #player do
				if CheckAcceptQuest( player[i],426083 ) and CheckFlag( player[i],547573 )==false then
					ScriptMessage( player[i],player[i],1,"[SC_Z25Q426083_1]",0)
				end
			end
			Sleep(10)
			CallPlot( mora1,"lua_Q426083_range",0)
			--SetPlot( mora1, "range", "lua_Q426082_run", 50 )
end

--426083 夢的化身 藥劑的部份
function lua_I242357_CheckUse()
	if ReadRoleValue( TargetID(),EM_RoleValue_OrgID ) == 121994 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[KORS_Z23_ITEMUSE4]", 0)
		return false
	end
end
function lua_I242357_UseOK()
	if CheckAcceptQuest( OwnerID(),426083 ) and CheckFlag( OwnerID(),547573 )==false then
		SetFlag( OwnerID(), 547573,1 )
	end
end

function lua_z25testaddbuff()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_BEGIN )
	AddBuff( OwnerID() , 622000 , 0 ,-1 )
end

function LuaS_Z25N121995_crouch()------特效
	AddBuff(OwnerID(),507555,1,-1)
	AddBuff(OwnerID(),507556,1,-1)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_CROUCH )
end
--摩菇人 102280
--怪物跑跑跑
function LuaS_107471_0()

	local count = 4 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 9 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = -1 --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 250 --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local dis = 20 --間距

	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107471,Matrix,1, -2 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107501,Matrix,2,  0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107501,Matrix,3, -1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107514,Matrix,4,  2)

	--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

	--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

	--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaS_107471_1" , 0 )
end

function LuaS_107471_1()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaS_107471_0" , 0 )
end

--吸血蟲
function lua_z25bugrunout_range()
	SetPlot( OwnerID(),"range","lua_z25bugrunout_1",30 )
end
function lua_z25bugrunout_1()
	local objtable = {}
	SetPlot( TargetID(),"range","",0 )
	WriteRoleValue( TargetID(),EM_RoleValue_Register1,3  )
 	objtable = Lua_CreateObjToRandownPos( TargetID(), 107482, 3, 50, true )
		for i = 1, 3 do
			WriteRoleValue( objtable[i], EM_RoleValue_PID,TargetID() )
			SetAttack( objtable[i], OwnerID())
		end
end
--吸血蟲：脫離戰鬥
function lua_z25bugEvent_EndAttack()
	local PID = ReadRoleValue( OwnerID(),EM_RoleValue_PID )
	AddRoleValue( PID, EM_RoleValue_Register1, -1 )
		if ReadRoleValue( PID, EM_RoleValue_Register1) ==0 then
			CallPlot( PID, "lua_z25bugrunout_range", 0 )
		end
		if ReadRoleValue( OwnerID(),EM_RoleValue_IsDead) == 0 then
			DelObj( OwnerID() )
		end
end