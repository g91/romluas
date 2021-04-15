--say
function LuaZ13WS_423846()
----飛雅米提
	local A=RandRange( 1 , 4 )  
	if 	CheckAcceptQuest( OwnerID(), 423846 ) == true 			and
		CheckCompleteQuest(OwnerID(),423846)==false			and
		Checkflag(OwnerID(),544740) ==false				then
			if	CheckBuff(OwnerID(),508198)==false				then 
				SetSpeakDetail(OwnerID(), "[SC_423846_"..A.."]" ) 
				--握緊你的武器，它太乾淨了，需要用血好好澆灌一下，現在可以跟我們走了嗎？
				--等會兒可得跟緊點，別掉隊了，現在要走了嗎？
				--注意保護運輸隊員，若大家全死光了，這車貨物可就便宜那些又臭又醜的王八蛋了，好，要走了嗎？
				--你看起來很能打，很不錯很不錯，我們這就出發嗎？
				AddSpeakOption( OwnerID(), TargetID(), "[SC_111796_0]", "LuaZ13WS_423846_1",0) 
				--我準備好了。 (玩家確定要開始演戲)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_423236_11]", "LuaZ13WS_423846_wait",0) 
				--請再等我一下。
			else
				CloseSpeak(OwnerID())
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423846_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423846_10]", 0 )
				--你已加入其他的護送小隊，短時間內不可再加入其他護送小隊。
			end
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaZ13WS_423846_wait()
	SetSpeakDetail(OwnerID(), "[SC_423846_5]" ) 
	--好，準備好再找我。
	CloseSpeak( OwnerID() )
end

function LuaZ13WS_423846_1()
	CloseSpeak( OwnerID() )
	AddBuff(OwnerID(),508198,1,100)
	Beginplot(TargetID(),"LuaZ13WS_423846_2",0)
end

function LuaZ13WS_423846_2()
--領隊是OWNER
	local Ctrl = OwnerID()
	local Player = TargetID()
	DisableQuest(Ctrl, true )
	Hide(Ctrl)
	
	local leader= LuaFunc_CreateObjByObj( 105247 , Ctrl )
	WriteRoleValue( leader ,  EM_RoleValue_PID , Player )
	WriteRoleValue( Player ,  EM_RoleValue_PID , leader )
	--say(leader,ReadRoleValue( leader, EM_RoleValue_PID))
	--say(Player,ReadRoleValue( Player, EM_RoleValue_PID))
	local actor={105251,105252,105266,105273,117352}
	local One={}
	local OneDis = {}
	for i= 1,5 do
		One[i]= Lua_DW_CreateObj("flag" ,actor[i],780643,i)	
	end
	
	for i=1,5,1 do		
		WriteRoleValue(One[i], EM_RoleValue_IsWalk, 1)
		MoveToFlagEnabled( One[i], false)
		if i == 5 then
			OneDis[i] = GetDistance( One[i], leader )+30
		else
			OneDis[i] = GetDistance( One[i], One[5] )
		end
	end
	MoveToFlagEnabled( leader, false)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	
	BeginPlot(leader,"LuaZ13WS_423846_3",0)		
	BeginPlot(One[1],"LuaZ13WS_423846_4",0)
	BeginPlot(One[2],"LuaZ13WS_423846_5",0)
	BeginPlot(One[3],"LuaZ13WS_423846_4",0)
	BeginPlot(One[4],"LuaZ13WS_423846_5",0)
	--AttachObj( One[5] , leader , 0 ,"p_down","p_top" )
	--跟隨
	
	local N=0			--防止無盡迴圈
	local Enemy = 0
	local QuestSuccess = false
	
	while N < 500 do
		Fight = false
		for i=1, 5 do
			if i ~= 5 then
				Enemy = ReadRoleValue( One[i], EM_RoleValue_AttackTargetID )
			else
				Enemy = ReadRoleValue( leader, EM_RoleValue_AttackTargetID )
			end
				
			if	Enemy ~= 0 	then
				for j=1, 4 do
					if	CheckID(One[j]) == true and 
						ReadRoleValue( One[j], EM_RoleValue_IsDead) == 0 and
						ReadRoleValue( One[j], EM_RoleValue_AttackTargetID ) == 0	then
						stopMove( One[j], true )
						SysCastSpellLv( Enemy, One[j], 496266, 499 )
					end
				end
					
				if 	CheckID(leader) == true and 
					ReadRoleValue( leader, EM_RoleValue_IsDead) == 0 and
					ReadRoleValue( leader, EM_RoleValue_AttackTargetID ) == 0	then
					
					stopMove( leader, true )
					SysCastSpellLv( Enemy, leader, 496266, 499 )					
				end
				stopMove( One[5], true )
				Fight = true
				break
			end
		end
		
		if Fight == false and Getdistance( One[5], leader ) > 20 and GetDistance( leader, Ctrl ) > GetDistance( One[5], Ctrl )  then
			WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
			
			local X = ReadRoleValue( leader, EM_RoleValue_X )
			local Y = ReadRoleValue( leader, EM_RoleValue_Y )
			local Z = ReadRoleValue( leader, EM_RoleValue_Z )
			local Dir = ReadRoleValue( leader, EM_RoleValue_Dir )-180
			
			if Dir > 360 then Dir = Dir -360 
			elseif Dir < 0 then Dir = Dir +360 end
			
			local radian = (math.pi/180)*( Dir )--徑度
			X = X  +20*math.cos(radian)
			Z = Z - 20*math.sin(radian)
			Y  = GetHeight( X, Y, Z )
			
			local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( X , Y , Z, 35, Dir )--四角陣型設定區				
			--Say( One[5], OneDis[5].."Dis = "..GetDistance( One[5], leader ) )
			if GetDistance( One[5], leader ) > OneDis[5] then
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 0)
			else
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 1)
			end
			MoveDirect( One[5], X, Y, Z )
			for i=1,4 do
				--Say( One[i], OneDis[i]..";Dis = "..GetDistance( One[i], One[5] ))
				if GetDistance( One[i], One[5] ) > OneDis[i] and GetDistance( One[i], leader ) > GetDistance( One[5], leader ) then
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 0)
				else
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 1)
				end
				MoveDirect( One[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end
			
		if	GetDistance(leader, Player )>200		then
			ScriptMessage( Player, Player, 2,"[SC_423846_16]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423846_16]", 0 )
			--你距離護送小隊太遠，請快歸隊！
		end
		
		if	CheckID( Player ) == false or 
			ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 or
			CheckID( leader ) == false or 
			ReadRoleValue( leader, EM_RoleValue_IsDead) == 1 or
			CheckAcceptQuest( Player,423846) == false	or
			GetDistance(leader, Player) > 400 then
			QuestSuccess = false
			break
		end

		if	Checkflag(Player,544740)==true	then	--此buff將在國王抵達目的給國王
			break
		end
		if N>488	then	
				ScriptMessage( Player, Player, 0,499-N, 0 )
				ScriptMessage( Player, Player, 2,499-N, 0 )
		end	
		N=N+1
		sleep(10)
	end

	if	QuestSuccess == false			and
		Checkflag(Player,544740)==false	then
		ScriptMessage( Player, Player, 0,"[SC_423846_6]", 0 )
		ScriptMessage( Player, Player, 2,"[SC_423846_6]", 0 )
		--運輸車未成功抵達目標，或者你與運輸車距離太遠，任務失敗，請放棄重接。
	end
		
	for i=1,5,1 do
		Delobj(One[i])
	end
	Delobj(leader)
	Show(Ctrl,0)
	DisableQuest(Ctrl, false)
end
			
function LuaZ13WS_423846_3()
	DisableQuest( OwnerID() , true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	for	i=6,10 do
		DW_MoveToFlag( OwnerID(), 780643, i,0,1 )
	end
	Sleep(30)
	Say(OwnerID(),"[SC_423846_8]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Sleep(50)
	
	local player =SearchRangePlayer ( OwnerID() , 250  )   				
			--搜尋npc身邊 400範圍內的玩家，放入陣列內
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue( player[i],  EM_RoleValue_PID ) == OwnerID() then	
					Setflag(player[i],544740,1)
				end
			end
	Hide(OwnerID())
	Sleep(100)
	Show(OwnerID(),0)
	DisableQuest( OwnerID() , false )
end

function LuaZ13WS_423846_4()
--因為不client，所以演到底	
	DisableQuest(OwnerID(), true )	
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end

function LuaZ13WS_423846_5()
--因為不client，所以演到底	
	DisableQuest(OwnerID(), true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end

function LuaZ13WS_423846_6()
	DisableQuest( OwnerID() , true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	for i= 6,10 do
		DW_MoveToFlag( OwnerID(), 780643, i,0,1 )
	end
	Sleep(100)
end


-------

------------------------------------------------------------
function LuaZ13WS_423846A()
--岡恩．史帝
--544740任務完成條件 
--508198防止玩家短時間內重複接取
	local A=RandRange( 1 , 4 )  
	if 	CheckAcceptQuest( OwnerID(), 423846 ) == true 			and
		CheckCompleteQuest(OwnerID(),423846)==false			and
		Checkflag(OwnerID(),544740) ==false				then
			if	CheckBuff(OwnerID(),508198)==false				then 
				SetSpeakDetail(OwnerID(), "[SC_423846_"..A.."]" ) 
				--握緊你的武器，它太乾淨了，需要用血好好澆灌一下，現在可以跟我們走了嗎？
				--等會兒可得跟緊點，別掉隊了，現在要走了嗎？
				--注意保護運輸隊員，若大家全死光了，這車貨物可就便宜那些又臭又醜的王八蛋了，好，要走了嗎？
				--你看起來很能打，很不錯很不錯，我們這就出發嗎？
				AddSpeakOption( OwnerID(), TargetID(), "[SC_111796_0]", "LuaZ13WS_423846A_1",0) 
				--我準備好了。 (玩家確定要開始演戲)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_423236_11]", "LuaZ13WS_423846A_wait",0) 
				--請再等我一下。
			else
				CloseSpeak(OwnerID())
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423846_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423846_10]", 0 )
				--你已加入其他的護送小隊，短時間內不可再加入其他護送小隊。
			end
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaZ13WS_423846A_wait()
	SetSpeakDetail(OwnerID(), "[SC_423846_5]" ) 
	--好，準備好再找我。
	CloseSpeak( OwnerID() )
end

function LuaZ13WS_423846A_1()
	CloseSpeak( OwnerID() )
	AddBuff(OwnerID(),508198,1,100)
	Beginplot(TargetID(),"LuaZ13WS_423846A_2",0) 
end

function LuaZ13WS_423846A_2()
--領隊是OWNER
	local Ctrl = OwnerID()
	local Player = TargetID()
	DisableQuest(Ctrl, true )
	Hide(Ctrl)
	local leader= LuaFunc_CreateObjByObj( 105248 , Ctrl)
	WriteRoleValue( leader ,  EM_RoleValue_PID , Player  )--將LEADER的值記入玩家的pid
	WriteRoleValue( Player  ,  EM_RoleValue_PID , leader)

	local actor={105251,105252,105266,105273,117352}
	local One={}
	local OneDis = {}
	for i= 1,5 do
		One[i]= Lua_DW_CreateObj("flag" ,actor[i],780642,i)	
	end
	for i=1,5 do
		WriteRoleValue(One[i], EM_RoleValue_IsWalk, 1)
		MoveToFlagEnabled( One[i], false)
		if i == 5 then
			OneDis[i] = GetDistance( One[i], leader )+30
		else
			OneDis[i] = GetDistance( One[i], One[5] )
		end
	end
	MoveToFlagEnabled( leader, false)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	
	BeginPlot(leader,"LuaZ13WS_423846A_3",0)		
	BeginPlot(One[1],"LuaZ13WS_423846A_4",0)
	BeginPlot(One[2],"LuaZ13WS_423846A_5",0)
	BeginPlot(One[3],"LuaZ13WS_423846A_4",0)
	BeginPlot(One[4],"LuaZ13WS_423846A_5",0)

	
	local N=0			--防止無盡迴圈
	local Enemy = 0
	local QuestSuccess = false
	
	while N < 500 do
		Fight = false
		for i=1, 5 do
			if i ~= 5 then
				Enemy = ReadRoleValue( One[i], EM_RoleValue_AttackTargetID )
			else
				Enemy = ReadRoleValue( leader, EM_RoleValue_AttackTargetID )
			end
				
			if	Enemy ~= 0 	then
				for j=1, 4 do
					if	CheckID(One[j]) == true and 
						ReadRoleValue( One[j], EM_RoleValue_IsDead) == 0 and
						ReadRoleValue( One[j], EM_RoleValue_AttackTargetID ) == 0	then
						stopMove( One[j], true )
						SysCastSpellLv( Enemy, One[j], 496266, 499 )
					end
				end
					
				if 	CheckID(leader) == true and 
					ReadRoleValue( leader, EM_RoleValue_IsDead) == 0 and
					ReadRoleValue( leader, EM_RoleValue_AttackTargetID ) == 0	then
					
					stopMove( leader, true )
					SysCastSpellLv( Enemy, leader, 496266, 499 )					
				end
				stopMove( One[5], true )
				Fight = true
				break
			end
		end
	
	if Fight == false and Getdistance( One[5], leader ) > 20 and GetDistance( leader, Ctrl ) > GetDistance( One[5], Ctrl )  then
			WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
			
			local X = ReadRoleValue( leader, EM_RoleValue_X )
			local Y = ReadRoleValue( leader, EM_RoleValue_Y )
			local Z = ReadRoleValue( leader, EM_RoleValue_Z )
			local Dir = ReadRoleValue( leader, EM_RoleValue_Dir )-180
			
			if Dir > 360 then Dir = Dir -360 
			elseif Dir < 0 then Dir = Dir +360 end
			
			local radian = (math.pi/180)*( Dir )--徑度
			X = X  +20*math.cos(radian)
			Z = Z - 20*math.sin(radian)
			Y  = GetHeight( X, Y, Z )
			
			local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( X , Y , Z, 35, Dir )--四角陣型設定區
						
			--Say( One[5], OneDis[5].."Dis = "..GetDistance( One[5], leader ) )
			if GetDistance( One[5], leader ) > OneDis[5] then
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 0)
			else
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 1)
			end
			MoveDirect( One[5], X, Y, Z )
			for i=1,4 do
				--Say( One[i], OneDis[i]..";Dis = "..GetDistance( One[i], One[5] ))
				if GetDistance( One[i], One[5] ) > OneDis[i] and GetDistance( One[i], leader ) > GetDistance( One[5], leader ) then
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 0)
				else
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 1)
				end
				MoveDirect( One[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end

		if	GetDistance(leader, Player )>200		then
			ScriptMessage( Player, Player, 2,"[SC_423846_16]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423846_16]", 0 )
			--你距離護送小隊太遠，請快歸隊！
		end

		if	CheckID( Player ) == false or 
			ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 or
			CheckID( leader ) == false or 
			ReadRoleValue( leader, EM_RoleValue_IsDead) == 1 or
			CheckAcceptQuest( Player,423846) == false	or
			GetDistance(leader, Player) > 400 then
			
			QuestSuccess = false
			break
		end

		if	Checkflag(Player,544740)==true	then	--此buff將在國王抵達目的給國王
			break
		end
		if N>488	then	
				ScriptMessage( Player, Player, 0,499-N, 0 )
				ScriptMessage( Player, Player, 2,499-N, 0 )
		end	
		N=N+1
		
		sleep(10)
	end
		
	if	QuestSuccess == false	and
		Checkflag(Player,544740)==false	then
		ScriptMessage( Player, Player, 0,"[SC_423846_6]", 0 )
		ScriptMessage( Player, Player, 2,"[SC_423846_6]", 0 )
		--運輸車未成功抵達目標，或者你與運輸車距離太遠，任務失敗，請放棄重接。
		
	end
		
	for i=1,5,1 do
		Delobj(One[i])
	end
	Delobj(leader)
	Show(Ctrl,0)
	DisableQuest(Ctrl, false)
end
			
function LuaZ13WS_423846A_3()
	DisableQuest( OwnerID() , true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	for i=6,13 do
		DW_MoveToFlag( OwnerID(), 780642, i,0,1 )
	end
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Sleep(50)
	Say(OwnerID(),"[SC_423846_8]")
	local player =SearchRangePlayer ( OwnerID() , 250  )   				
			--搜尋npc身邊 400範圍內的玩家，放入陣列內
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue( player[i],  EM_RoleValue_PID ) == OwnerID() then	
					Setflag(player[i],544740,1)
				end
			end
	Hide(OwnerID())
--	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
	Sleep(100)
	Show(OwnerID(),0)
	DisableQuest( OwnerID() , false )
end

function LuaZ13WS_423846A_4()
--因為不client，所以演到底	
	DisableQuest(OwnerID(), true )	
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
--	NPCSay(OwnerID(),"[SC_423846_7]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
--	Delobj(OwnerID())
end

function LuaZ13WS_423846A_5()
--因為不client，所以演到底	
	DisableQuest(OwnerID(), true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
--	NPCSay(OwnerID(),"[SC_423846_7]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
--	Delobj(OwnerID()
end




----------------------------------------------------------
function LuaZ13WS_423846B()
	local A=RandRange( 1 , 4 )  
	if 	CheckAcceptQuest( OwnerID(), 423846 ) == true 			and
		CheckCompleteQuest(OwnerID(),423846)==false				and
		Checkflag(OwnerID(),544740) ==false						then
			if	CheckBuff(OwnerID(),508198)==false				then 
				SetSpeakDetail(OwnerID(), "[SC_423846_"..A.."]" ) 
				--握緊你的武器，它太乾淨了，需要用血好好澆灌一下，現在可以跟我們走了嗎？
				--等會兒可得跟緊點，別掉隊了，現在要走了嗎？
				--注意保護運輸隊員，若大家全死光了，這車貨物可就便宜那些又臭又醜的王八蛋了，好，要走了嗎？
				--你看起來很能打，很不錯很不錯，我們這就出發嗎？
				AddSpeakOption( OwnerID(), TargetID(), "[SC_111796_0]", "LuaZ13WS_423846B_1",0) 
				--我準備好了。 (玩家確定要開始演戲)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_423236_11]", "LuaZ13WS_423846B_wait",0) 
				--請再等我一下。
			else
				CloseSpeak(OwnerID())
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423846_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423846_10]", 0 )
				--你已加入其他的護送小隊，短時間內不可再加入其他護送小隊。
			end
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaZ13WS_423846B_wait()
	SetSpeakDetail(OwnerID(), "[SC_423846_5]" ) 
	--好，準備好再找我。
	CloseSpeak( OwnerID() )
end

function LuaZ13WS_423846B_1()
	CloseSpeak( OwnerID() )
	AddBuff(OwnerID(),508198,1,100)
	Beginplot(TargetID(),"LuaZ13WS_423846B_2",0)
end

function LuaZ13WS_423846B_2()
--領隊是OWNER
	local Ctrl = OwnerID()
	local Player = TargetID()
	DisableQuest(Ctrl, true )	
	Hide(Ctrl)
	local leader= LuaFunc_CreateObjByObj( 105250 , Ctrl  )
	WriteRoleValue( leader ,  EM_RoleValue_PID , Player )
	WriteRoleValue( Player  ,  EM_RoleValue_PID , leader )
	---say(leader,ReadRoleValue( leader, EM_RoleValue_PID))
	--say(Player,ReadRoleValue( Player, EM_RoleValue_PID))
	local actor={105251,105252,105266,105273,117352}
	local One={}
	local OneDis = {}
	for i= 1,5 do
		One[i]= Lua_DW_CreateObj("flag" ,actor[i],780641,i)	
	end

	for i=1,5,1 do		
		WriteRoleValue(One[i], EM_RoleValue_IsWalk, 1)
		MoveToFlagEnabled( One[i], false)
		if i == 5 then
			OneDis[i] = GetDistance( One[i], leader )+30
		else
			OneDis[i] = GetDistance( One[i], One[5] )
		end
	end
	MoveToFlagEnabled( leader, false)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	
	BeginPlot(leader,"LuaZ13WS_423846B_3",0)		
	BeginPlot(One[1],"LuaZ13WS_423846B_4",0)
	BeginPlot(One[2],"LuaZ13WS_423846B_5",0)
	BeginPlot(One[3],"LuaZ13WS_423846B_4",0)
	BeginPlot(One[4],"LuaZ13WS_423846B_5",0)

	local N=0			--防止無盡迴圈
	local Enemy = 0
	local QuestSuccess = false
	
	while N < 500 do
		Fight = false
		for i=1, 5 do
			if i ~= 5 then
				Enemy = ReadRoleValue( One[i], EM_RoleValue_AttackTargetID )
			else
				Enemy = ReadRoleValue( leader, EM_RoleValue_AttackTargetID )
			end
				
			if	Enemy ~= 0 	then
				for j=1, 4 do
					if	CheckID(One[j]) == true and 
						ReadRoleValue( One[j], EM_RoleValue_IsDead) == 0 and
						ReadRoleValue( One[j], EM_RoleValue_AttackTargetID ) == 0	then
						stopMove( One[j], true )
						SysCastSpellLv( Enemy, One[j], 496266, 499 )
					end
				end
					
				if 	CheckID(leader) == true and 
					ReadRoleValue( leader, EM_RoleValue_IsDead) == 0 and
					ReadRoleValue( leader, EM_RoleValue_AttackTargetID ) == 0	then
					
					stopMove( leader, true )
					SysCastSpellLv( Enemy, leader, 496266, 499 )					
				end
				stopMove( One[5], true )
				Fight = true
				break
			end
		end
		
		if Fight == false and Getdistance( One[5], leader ) > 20 and GetDistance( leader, Ctrl ) > GetDistance( One[5], Ctrl )  then
			WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
			
			local X = ReadRoleValue( leader, EM_RoleValue_X )
			local Y = ReadRoleValue( leader, EM_RoleValue_Y )
			local Z = ReadRoleValue( leader, EM_RoleValue_Z )
			local Dir = ReadRoleValue( leader, EM_RoleValue_Dir )-180
			
			if Dir > 360 then Dir = Dir -360 
			elseif Dir < 0 then Dir = Dir +360 end
			
			local radian = (math.pi/180)*( Dir )--徑度
			X = X  +20*math.cos(radian)
			Z = Z - 20*math.sin(radian)
			Y  = GetHeight( X, Y, Z )
			
			local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( X , Y , Z, 35, Dir )--四角陣型設定區
						
			--Say( One[5], OneDis[5].."Dis = "..GetDistance( One[5], leader ) )
			if GetDistance( One[5], leader ) > OneDis[5] then
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 0)
			else
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 1)
			end
			MoveDirect( One[5], X, Y, Z )
			for i=1,4 do
				--Say( One[i], OneDis[i]..";Dis = "..GetDistance( One[i], One[5] ))
				if GetDistance( One[i], One[5] ) > OneDis[i] and GetDistance( One[i], leader ) > GetDistance( One[5], leader ) then
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 0)
				else
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 1)
				end
				MoveDirect( One[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end
			
		if	GetDistance(leader, Player )>200		then
			ScriptMessage( Player, Player, 2,"[SC_423846_16]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423846_16]", 0 )
			--你距離護送小隊太遠，請快歸隊！
		end
		
		if	CheckID( Player ) == false or 
			ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 or
			CheckID( leader ) == false or 
			ReadRoleValue( leader, EM_RoleValue_IsDead) == 1 or
			CheckAcceptQuest( Player,423846) == false	or
			GetDistance(leader, Player) > 400 then
			QuestSuccess = false
			break
		end

		if	Checkflag(Player,544740)==true	then	--此buff將在國王抵達目的給國王
			break
		end
		
		if N>488	then	
				ScriptMessage( Player, Player, 0,499-N, 0 )
				ScriptMessage( Player, Player, 2,499-N, 0 )
		end	
		N=N+1
	
		sleep(10)
	end

	if	QuestSuccess == false			and
		Checkflag(Player,544740)==false		then
		ScriptMessage( Player, Player, 0,"[SC_423846_6]", 0 )
		ScriptMessage( Player, Player, 2,"[SC_423846_6]", 0 )
		--運輸車未成功抵達目標，或者你與運輸車距離太遠，任務失敗，請放棄重接。
	end
		
	for i=1,5,1 do
		Delobj(One[i])
	end
	Delobj(leader)
	Show(Ctrl,0)
	DisableQuest(Ctrl, false)
end
			
function LuaZ13WS_423846B_3()
	local leader=OwnerID()
	DisableQuest( leader , true )
	Hide(leader)
	Show(leader,0)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	for i=6,9 do
		DW_MoveToFlag( leader, 780641, i,0,1 )
	end
	Sleep(30)
	Say(leader,"[SC_423846_8]")
	PlayMotion(leader,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Sleep(50)
	
	local player =SearchRangePlayer ( leader , 250 )   				
			--搜尋npc身邊 400範圍內的玩家，放入陣列內
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue( player[i],  EM_RoleValue_PID ) ==  OwnerID() then	
					Setflag(player[i],544740,1)
				end
			end
	Hide(leader)
	Sleep(100)
	Show(leader,0)
	DisableQuest( leader , false )
end

function LuaZ13WS_423846B_4()
--因為不client，所以演到底	
	DisableQuest(OwnerID(), true )	
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end

function LuaZ13WS_423846B_5()
--因為不client，所以演到底	
	DisableQuest(OwnerID(), true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end



-------