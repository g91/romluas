

--======================================================================================================
--拿符石
--======================================================================================================

function LUAZ13WS_117361_0()
	Sleep(30)
	local NPC =SearchRangeNPC ( OwnerID() , 200 )				
			--搜尋npc身邊 400範圍內的NPC，放入陣列內
	local stone	
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 117361 then
			stone= NPC[i]
			break	
		end
	end
	
	while 1 do
		CastSpell(OwnerID(),stone,497134)--492184
		sleep(600)
	end
end


function LUAZ13WS_117361_1()
	while 1 do
		Addbuff(OwnerID(),507927,1,10)
		Sleep(5)
		Addbuff(OwnerID(),504098,1,10)
	end
end
		
		
---***---出蛇---***---


function LUAZ13WS_423834_0()
	SetPlot( OwnerID(),"Range","LUAZ13WS_423834_1",150 )
end

function LUAZ13WS_423834_1()
	local Ctrl = TargetID()--範圍劇情的物件
	local Player = OwnerID()--玩家

	if	CheckAcceptQuest(Player,423834)== true	and
		CheckCompleteQuest(Player,423834)==false	and
		Checkflag(Player,544742) ==false		and
		CheckBuff(Player,508932)==false		then
				
		if	CheckBuff(Ctrl,508932)==false	then 
			Addbuff(Ctrl, 508932, 0,-1)
			CallPlot( Ctrl,"Lua_Z13_423834_Start",0)
		else
			ScriptMessage( Player, Player, 2,"[SC_423834_begun]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423834_begun]", 0 )
			--莎潘思已開始收取禁忌符文行動，加入對抗蛇群的行列吧！
		end
	end
end

function LuaZ13WS_423834_Message( Msg)
	local Player = SearchRangePlayer( OwnerID(), 200 )
	local num = 0
	for i=0, table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i], 423834)== true	and
			CheckCompleteQuest( Player[i], 423834)==false	and
			Checkflag( Player[i], 544742) ==false		then
			
			if Msg ~= nil then
				ScriptMessage( Player[i], Player[i], 2, Msg, 0 )
				ScriptMessage( Player[i], Player[i], 0, Msg, 0 )
			end
			num = num+1
		end
	end
	return num
end

function Lua_Z13_423834_Start()--開始
	local ObjArray = {};
	local rock;
	local snake;
	local fighter;
	
	for i=1, 200 do
		Sleep(10)

		if i%3 and LuaZ13WS_423834_Message() == 0 then--檢查周圍玩家
			LuaZ13WS_423834_Break( ObjArray )--刪除物件
			return
		else
			LuaZ13WS_423834_Attack( ObjArray )--戰鬥
		end
		
		if i ==1 then
			LuaZ13WS_423834_Message("[SC_423834_A1]")
			--1.莎潘思導師大喊：收取禁忌符文需要時間，別讓蛇群打擾我！
			for j=1, 2 do
				snake = Lua_DW_CreateObj("flag" ,105276,780802, RandRange( 1 , 7 )  )
				WriteRoleValue( snake, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(snake, false )
				table.insert( ObjArray, snake )
				KS_Move( snake, 30, 5104, 88, -2263 );
			end
		elseif i == 10 then
			LuaZ13WS_423834_Message("[SC_423834_A2]")
			--2.莎潘思導師大喊：符石在抗拒收取的力量，我需要專注以對，冒險者，快清除蛇群！
			for j=1,4 do
				snake = Lua_DW_CreateObj("flag" ,105277,780802, RandRange( 1 , 7))
				WriteRoleValue( snake, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(snake, false )
				table.insert( ObjArray, snake )
				KS_Move( snake, 30, 5104, 88, -2263 );
			end
			Sleep(10)
			LuaZ13WS_423834_Message( "[SC_423834_B1]")--蘭薩德勇士應約前來！！
			for j=1,4 do
				fighter = Lua_DW_CreateObj("flag" ,105281,780802,10+j)
				SetDefIdleMotion( fighter, ruFUSION_MIME_IDLE_COMBAT_1H )
				WriteRoleValue( fighter, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(fighter, false )
				table.insert( ObjArray, fighter )
				KS_Move( fighter, 15, 5104, 88, -2263 );
			end
		elseif i == 20 then
			LuaZ13WS_423834_Message("[SC_423834_A3]")
			--3.莎潘思導師大喊：符石的抗力開始減弱，蛇群已察覺，小心對待牠們的瘋狂反撲！快呼叫蘭薩德的勇士援助！
			for j=1,6 do
				snake = Lua_DW_CreateObj("flag" ,105278,780802,RandRange( 1 , 7))
				WriteRoleValue( snake, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(snake, false )
				table.insert( ObjArray, snake )
				KS_Move( snake, 30, 5104, 88, -2263 );
			end
			Sleep(20)
			LuaZ13WS_423834_Message( "[SC_423834_B1]")--蘭薩德勇士應約前來！！
			for j=1,6 do
				fighter = Lua_DW_CreateObj("flag" ,105281,780802,10+j)
				SetDefIdleMotion( fighter, ruFUSION_MIME_IDLE_COMBAT_1H )
				WriteRoleValue( fighter, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(fighter, false )
				table.insert( ObjArray, fighter  )
				KS_Move( fighter, 15, 5104, 88, -2263 );
			end
		elseif i == 21 then
			LuaZ13WS_423834_Message( "[SC_423834_A4]" )
			--莎潘思導師大喊：符石收取到最後階段，快擊打石柱脆弱處，放出深藏的符石！
			rock = Lua_DW_CreateObj("flag" ,105279,780802,10)
			table.insert( ObjArray,  rock )
		end
		
		if i > 21 then
			if i%60 == 0 then
				LuaZ13WS_423834_Message( "[SC_423834_4]")--請攻擊石柱弱化處，否則任務將失敗。		
			elseif CheckID( rock ) ~= true or ReadRoleValue( rock, EM_RoleValue_IsDead ) == 1 then				
				LuaZ13WS_423834_End()--結束 給旗標
				LuaZ13WS_423834_Break( ObjArray )--刪除物件
				return
			end
		end
	end
	LuaZ13WS_423834_Message( "[SC_423834_5]")--你並未攻擊石柱弱化處，詭異的石柱已自行修復，任務失敗。
	LuaZ13WS_423834_Break( ObjArray )--刪除物件
end	

function LuaZ13WS_423834_Break( ObjArray )--刪除物件
	for i=1, table.getn(ObjArray) do
		if CheckID(ObjArray[i]) == true then
			DelObj(ObjArray[i])
		end
	end
	CancelBuff( OwnerID(), 508932 )
end

function LuaZ13WS_423834_Attack( ObjArray )--戰鬥
	for i=1, table.getn(ObjArray) do
		if	CheckID(ObjArray[i]) == true and 
			ReadRoleValue( ObjArray[i], EM_RoleValue_AttackTargetID ) == 0 then
			
			for j=1, table.getn(ObjArray) do
				if CheckRelation( ObjArray[j], ObjArray[i], EM_CheckRelationType_Enemy ) == true then
					SetAttack( ObjArray[j], ObjArray[i] )
					break
				end
			end
		end
	end
end

function LuaZ13WS_423834_End()--結束 給旗標
	local Player = SearchRangePlayer( OwnerID(), 200 )
	for i=0, table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i], 423834)== true	and
			CheckCompleteQuest( Player[i], 423834)==false	and
			Checkflag( Player[i], 544742) ==false		then
			
			ScriptMessage( Player[i], Player[i], 2,"[SC_423834_A5]", 0 )
			ScriptMessage( Player[i], Player[i], 0,"[SC_423834_A5]", 0 )
			--衛斯理．達比柯頓大喊：你能做到的事已完成，快退出蛇洞，回營地等待莎潘思導師。
			Setflag( Player[i],544742,1)
		end
	end
end