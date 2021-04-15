function Lua_UN_190_PAT1() --6人小隊---隊型用...掛在蘑菇人身上
	local dis = 30
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 100 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104768,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104773,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104772,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104769,Matrix,2,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104772,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(104773,Matrix,3,1)
	for i=1 , 6 do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register9) ~=nil then
			SetAttack( ObjMatrix[i] ,ReadRoleValue(OwnerID(),EM_RoleValue_Register9))
		end
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_register2,ReadRoleValue(OwnerID(),EM_RoleValue_register2))
		--BeginPlot( ObjMatrix[i] , "Lua_UN_190_PAT6" , 0 )
		--SetPlot( ObjMatrix[i],"dead","Lua_UN_190_PAT3",0 )
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_UN_190_PAT2" , 0 )
end
function Lua_UN_190_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_UN_190_PAT1" , 0 )
end
function Lua_UN_190_PAT4() --6人小隊---隊型用...掛在蘑菇人身上
	local dis = 50
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 100 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104872,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104872,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104873,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104873,Matrix,2,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104874,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(104875,Matrix,3,1)
	for i=1 , 6 do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register9) ~=nil then
			SetAttack( ObjMatrix[i] ,ReadRoleValue(OwnerID(),EM_RoleValue_Register9))
		end
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_register2,ReadRoleValue(OwnerID(),EM_RoleValue_register2))
		SetPlot( ObjMatrix[i],"dead","Lua_UN_190_PAT3",0 )
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_UN_190_PAT5" , 0 )
end
function Lua_UN_190_PAT5()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_UN_190_PAT4" , 0 )
end
function Lua_UN_190_PAT3()--怪死回傳值給門
	local x=ReadRoleValue(OWnerID(),EM_RoleValue_register2)
	local z=ReadRoleValue(x,EM_RoleValue_Register9)
	WriteRoleValue(x,EM_RoleValue_Register9,z-1)
end
function Lua_UN_190_PAT6()--門死怪死光
	local X = ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	sleep(20)
	while true do
		if CheckID(X) == false then
			DelObj(OwnerID())
		end
		sleep(20)
	end
end
--------------------------------------------------------------------------------------------------------------------
function UN_testalldoor()             -------------測試用***************
	local testtime = 0
	local door= {}
	local doorname
	door = Un_190_AllDoor(door)
	while true do 
	sleep( 10 )
	say(OwnerID(),"testtime = "..testtime)
	testtime=testtime+1
	if testtime == 20 then
		doorname=table.getn(door)
		for i=1,doorname do
		WriteRoleValue(door[i],EM_RoleValue_register7,99)
		end
		break	
	--BeginPlot( OwnerID() , "Lua_UN_190_PAT1" , 0 )
	end
	end
end
function Un_190_AllDoor(door)             --主控生門---用BEGINPLOT執行就好
                                      --門1.2報了再生BOSS
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door={}--門
	local flag={780776,780778,780779,780780,780781,780782,780783,780784,780785,780786}
	local x = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	if x == 0  then
		WriteRoleValue(OwnerID(),EM_RoleValue_Register9,1)
		x = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	end 
	if x ==1 then 
		for i=1 , 10 do
			door[i] = CreateObjByFlag( 104774 , flag[i] , 1 , 1 )
			SetModeEx(door[i],EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(door[i],EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(door[i],EM_SetModeType_NotShowHPMP, false)--不顯示血條
			SetModeEx(door[i],EM_SetModeType_Strikback, false)--反擊
			SetModeEx(door[i],EM_SetModeType_Move, false)--移動
			SetModeEx(door[i],EM_SetModeType_Fight, false)--可砍殺攻擊
			SetModeEx(door[i],EM_SetModeType_Searchenemy, false)--搜尋敵人
			SetModeEx(door[i],EM_SetModeType_Obstruct, true)--會阻擋(阻擋其他的物件)
			AddToPartition( door[i], RoomID)
			BeginPlot(door[i] ,"Un_190_AllDoor_1" , 0)
			WriteRoleValue(door[i],EM_RoleValue_register9,8)
			WriteRoleValue(door[i],EM_RoleValue_register2,door[i])
			WriteRoleValue(door[i],EM_RoleValue_PID,flag[i])
			WriteRoleValue(door[i],EM_RoleValue_register7,0)
			SetPlot( door[i],"dead","Un_190_AllDoordead",0 )
			CallPlot(door[i] , "Un_190_AllDoorhit" , 0)
			addbuff(door[i],508111,0,-1)
			table.insert(door,door[i])
			say(door[i],"door = "..door[i])
		end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register9,2)
		
	elseif 	x==2 then
		for i=1 , 2 do
			beginplot(door[i],"Un_190_doortimeup",0)
		end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register9,1)
	end
	return door
end
function Un_190_doortimeup()
	local firelose
	firelose = SearchRangeNPC ( OwnerID() , 1000 )
	for i=0,table.getn(firelose) do
		if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==104768 or 104769 or 104772 or 104773 then
			delobj(firelose[i])
		end
		delobj(OwnerID())
	end
end
function Un_190_AllDoorhit() --小怪死光門可以被打
	local timeee=0
	while true do
	sleep(20)
	timeee=timeee+1
	local reg =  ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
		if reg <=0 then
			SetModeEx(OwnerID(),EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(OwnerID(),EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(OwnerID(),EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			break
		end
	end
end
function Un_190_AllDoordead() --門死出小怪1
	ScriptMessage( OwnerID(), 0 , 2 ,"[SC_ZONE190_DOOR]" , 2 )
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(monster,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(monster,EM_SetModeType_Move, false)--移動
	SetModeEx(monster,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--搜尋敵人
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	WriteRoleValue(monster,EM_RoleValue_Register9,targetID())
	AddToPartition( monster, RoomID)
end
function Un_190_AllDoordead_boss2() --門死出小怪1
	ScriptMessage( OwnerID(), 0 , 2 ,"[SC_ZONE190_DOOR]" , 2 )
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(monster,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(monster,EM_SetModeType_Move, false)--移動
	SetModeEx(monster,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--搜尋敵人
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	WriteRoleValue(monster,EM_RoleValue_Register9,targetID())
	WriteRoleValue(start,EM_RoleValue_register1,5)

	AddToPartition( monster, RoomID)
end
function Un_190_AllDoordead_boss3() --門死出小怪1
	ScriptMessage( OwnerID(), 0 , 2 ,"[SC_ZONE190_DOOR]" , 2 )
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(monster,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(monster,EM_SetModeType_Move, false)--移動
	SetModeEx(monster,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--搜尋敵人
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	WriteRoleValue(monster,EM_RoleValue_Register9,targetID())
	WriteRoleValue(start,EM_RoleValue_register1,7)
	AddToPartition( monster, RoomID)
end

function Un_190_AllDoor_1() --門1生小怪
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local flag=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local monster = {monster,monster1,monster2}
	local littlemonster1
	local pass1
	local maxhp = ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
	local NowHp                                              --HP
	local Hp       --HP比
	local hphit = 0   --HP判斷暫存
	CallPlot(OwnerID() , "Un_190_AllDoorhit" , 0)
	while true do
	sleep(10)
	pass1 = ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		if pass1 ==0 then
			for i=1 , 3 do
				monster[i] = CreateObjByFlag( 104572 , flag , i+1 , 1 )
				SetModeEx(monster[i],EM_SetModeType_Show, false)
				SetModeEx(monster[i],EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
				SetModeEx(monster[i],EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
				SetModeEx(monster[i],EM_SetModeType_NotShowHPMP, false)--不顯示血條
				SetModeEx(monster[i],EM_SetModeType_Strikback, false)--反擊
				SetModeEx(monster[i],EM_SetModeType_Move, false)--移動
				SetModeEx(monster[i],EM_SetModeType_Fight, false)--可砍殺攻擊
				SetModeEx(monster[i],EM_SetModeType_Searchenemy, false)--搜尋敵人
				BeginPlot( monster[i] , "Lua_UN_190_PAT1" , 0 )
				WriteRoleValue(monster[i],EM_RoleValue_register2,OwnerID())
				AddToPartition( monster[i], RoomID)
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,1)
			end
			
		elseif pass1 == 99 then
			Beginplot(OwnerID(),"Un_190_AllDoordel_1",0)
			sleep(30)
			delobj(OwnerID())
		end
		----------以下為每20%生怪
		NowHp = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
		Hp = (NowHp / maxhp) *100
		if hp<=80 and hphit==0 then
		littlemonster1= CreateObjByFlag( 105136 , flag , 2 , 1 )
		WriteRoleValue(littlemonster1,EM_RoleValue_register2,flag)
		WriteRoleValue(littlemonster1,EM_RoleValue_register3,2)
		BeginPlot( littlemonster1, "Un_190_Doormonster" , 0 )
		AddToPartition(littlemonster1, RoomID)
		addbuff(littlemonster1,508296,0,5)
		hphit=1
		elseif hp<=60 and hphit==1 then
		littlemonster1= CreateObjByFlag( 105136 , flag , 2 , 1 )
		WriteRoleValue(littlemonster1,EM_RoleValue_register2,flag)
		WriteRoleValue(littlemonster1,EM_RoleValue_register3,2)
		BeginPlot( littlemonster1, "Un_190_Doormonster" , 0 )
		AddToPartition(littlemonster1, RoomID)
		addbuff(littlemonster1,508296,0,5)
		hphit=2
		elseif hp<=40 and hphit==2 then
		littlemonster1= CreateObjByFlag( 105136 , flag , 2 , 1 )
		WriteRoleValue(littlemonster1,EM_RoleValue_register2,flag)
		WriteRoleValue(littlemonster1,EM_RoleValue_register3,2)
		BeginPlot( littlemonster1, "Un_190_Doormonster" , 0 )
		AddToPartition(littlemonster1, RoomID)
		addbuff(littlemonster1,508296,0,5)
		hphit=3
		elseif hp<=20 and hphit==3 then
		littlemonster1= CreateObjByFlag( 105136 , flag , 2 , 1 )
		WriteRoleValue(littlemonster1,EM_RoleValue_register2,flag)
		WriteRoleValue(littlemonster1,EM_RoleValue_register3,2)
		BeginPlot( littlemonster1, "Un_190_Doormonster" , 0 )
		AddToPartition(littlemonster1, RoomID)
		addbuff(littlemonster1,508296,0,5)
		hphit=4
		end
	end
end
function Un_190_Doormonster() --小怪script
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local flag = ReadRoleValue(OwnerID(),EM_RoleValue_register2) --旗標
	local num = ReadRoleValue(OwnerID(),EM_RoleValue_register3)
	local passtime = 0 	 --沒進入戰鬥的數
	local skill =0		 --開戰旗標
	local leavetime = 0  --沒進入戰鬥多久消失的時間
	local door
	local targ
	Beginplot(OwnerID(),"Un_190_Doormonster_walk",0)
	while 1 do
	sleep(10)
		if hatelistcount(OWnerID())~=0 then
			if skill == 0 then   --修改開戰旗標+生傳送門(避免重複生怪)
				skill = 1
				targ = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				local x1= ReadRoleValue (targ  , EM_RoleValue_X)
				local y1= ReadRoleValue (  targ , EM_RoleValue_Y)
				local z1=ReadRoleValue ( targ , EM_RoleValue_Z)
				door=CreateObj ( 104977 , x1 , y1 , z1 , 0 , 1)
				SetModeEx(door,EM_SetModeType_Mark, false)
				SetModeEx(door,EM_SetModeType_HideName, false)
				SetModeEx(door,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(door,EM_SetModeType_Strikback, false)
				SetModeEx(door,EM_SetModeType_Move, false)
				SetModeEx(door,EM_SetModeType_Fight, false)
				SetModeEx(door,EM_SetModeType_Searchenemy, false)
				SetModeEx(door,EM_SetModeType_Obstruct, false)
				WriteRoleValue(door,EM_RoleValue_Livetime,10)
				AddToPartition( door, RoomID)	
				Beginplot(door,"Un_190_Doormonster_01",0) --門要執行的創怪
			end

		else
			leavetime=leavetime+1
		end
		if leavetime>=4 then --4秒後刪除自己
			delobj(OwnerID())
		end
	end	
end
function Un_190_Doormonster_walk()--走旗標
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
local flag =ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , flag ,1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				sleep(10)
				end
			end
		end	
		sleep(10)
	end
end
function Un_190_Doormonster_01() --傳送門生小怪script
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local skilltime = 0 --時間
local monster1       --小怪1
local monster2       --小怪2
local rand1
local rand2
local x1= ReadRoleValue (OwnerID()  , EM_RoleValue_X)
local y1= ReadRoleValue (  OwnerID() , EM_RoleValue_Y)
local z1=ReadRoleValue ( OwnerID() , EM_RoleValue_Z)
	while 1 do
		sleep(10)
		skilltime=skilltime+1
			if skilltime%2 ==0 then
				rand1= Az_RND_Ary(-30,30,2)
				rand2= Az_RND_Ary(-30,30,2)
				monster1=CreateObj ( 104768 , x1+rand1[1] , y1 , z1+rand1[2] , 0 , 1)
				monster2=CreateObj ( 105005 , x1+rand2[1], y1 , z1+rand2[2] , 0 , 1)
				AddToPartition(monster1,RoomID )
				AddToPartition(monster2,RoomID )
			end	
	end
end
--==================================================================================================================
                                                 --以下為刪除小怪--
--==================================================================================================================
function Un_190_AllDoordel()
	local door = ReadRoleValue(OWnerID(),EM_RoleValue_register7)
	for i=0,table.getn(door) do
		if ReadRoleValue( door[i+1] , EM_RoleValue_IsDead)==0 then
			CallPlot(door[i+1] , "Un_190_AllDoordel_1" , 0)
		end
	end
end
function Un_190_AllDoordel_1()
	local firelose = {}
		firelose = SearchRangeNPC ( OwnerID() , 1000 )
		for i=0,table.getn(firelose) do
				if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==104678 or 104679 or 104772 or 104773 then
					delobj(firelose[i])
				end
		end
end

------------------------------------------------------------------------------------------------------------------
												--商店
------------------------------------------------------------------------------------------------------------------
function Zone190_Other()--打鐵
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600260, "Test_Shop_Close" ); 
end	
function Zone190_Other_01() --表演
	
	while true do
		AddBuff( OwnerID(), 502662, 1, 25 ) --手發光
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		sleep(200)
	end
end			
------------------------------------------------------------------------------------------------------------------
												--PAT警衛
------------------------------------------------------------------------------------------------------------------
function Zone190_OtherPAT1() --PAT凡瑞娜絲城衛兵*2
	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(116941,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(116941,Matrix,1,-1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Zone190_OtherPAT2" , 0 )
end
function Zone190_OtherPAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Zone190_OtherPAT1" , 0 )
end
function Zone190_OtherPAT3() --PAT黑曜石要塞衛兵*2
	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(116940,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(116940,Matrix,1,-1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Zone190_OtherPAT4" , 0 )
end
function Zone190_OtherPAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Zone190_OtherPAT3" , 0 )
end
function Zone190_Other_02()
AddBuff( OwnerID() ,508132 ,0 ,-1 )
end
------------------------------------------------------------------------------------------------------------------
												--PAT小怪...
------------------------------------------------------------------------------------------------------------------
function Zone190_monsterPAT1() --PAT樹人
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105004,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104876,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104876,Matrix,3,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104876,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Zone190_monsterPAT2" , 0 )
end
function Zone190_monsterPAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Zone190_monsterPAT1" , 0 )
end
function Zone190_monsterPAT3() --PAT貓人
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105005,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104772,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104773,Matrix,2,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104768,Matrix,2,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Zone190_monsterPAT4" , 0 )
end
function Zone190_monsterPAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Zone190_monsterPAT3" , 0 )
end
function Zone190_monsterPAT5() --PAT符文人
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105006,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104873,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104874,Matrix,3,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104875,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Zone190_monsterPAT6" , 0 )
end
function Zone190_monsterPAT6()
	sleep( 10 )
	BeginPlot( OwnerID() , "Zone190_monsterPAT5" , 0 )
end
function un_zone190_care()
	local alltime = 0
	local CombatBegin = 0
	local Targ
	SetModeEx(OwnerID(),EM_SetModeType_Move, false)--移動
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
			if CombatBegin==1 then
				Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
				CastSpellLv(OwnerID(),Targ,496581,0)
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			CombatBegin = 0
			alltime = 0
		end
	end
end
function un_zone190_care1()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local x1=ReadRoleValue ( TargetID(), EM_RoleValue_X)
	local y1=ReadRoleValue ( TargetID(), EM_RoleValue_y)
	local z1=ReadRoleValue ( TargetID(), EM_RoleValue_z)
	local ball =CreateObj ( 105008 , x1 , y1 ,z1 , 0 , 1)
	SetModeEx(ball,EM_SetModeType_Mark,false) ----標記
	SetModeEx(ball,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(ball,EM_SetModeType_Move,false) ---移動	
	SetModeEx(ball,EM_SetModeType_Fight,false) ---可砍殺
	SetModeEx(ball,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(ball,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(ball,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	SetModeEx(ball,EM_SetModeType_Searchenemy,false)  ---鎖敵
	WriteRoleValue(ball,EM_RoleValue_Livetime,10)
	AddToPartition(ball,RoomID )
	beginplot(ball,"un_zone190_care2",0)
end
function un_zone190_care2()
	AddBuff( OwnerID() ,507730 ,0 ,-1 )
	while true do
	sleep(10)
		sysCastSpellLv(OwnerID(),OwnerID(),496582,10)
	end	
end
function un_zone190_care3()
	CastSpellLv(OwnerID(),OwnerID(),490239,0)
end
-----------------------------------------------------------------------------------------------------------------
												--警備副隊長講話
-----------------------------------------------------------------------------------------------------------------
function un_zone190_care4()			
	SetPlot( OwnerID(),"range","un_zone190_care5",100 )
end	
function un_zone190_care5()	
	Npcsay(TargetID(),"[SC_ZONE190_01]")
	beginplot(TargetID(),"un_zone190_care4",50)
end	
-----------------------------------------------------------------------------------------------------------------
												--攻城車控制器
-----------------------------------------------------------------------------------------------------------------
function un_zone190_care6()	
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local care = {} --放車的陣列1.2=2王...3.4=3王
	local reg1 --2王
	local reg2 --3王
	local regfight1  = 0 --開戰旗標
	local regfight2  = 0 --開戰旗標
	local reg11  --講話旗標
	local reg22  --講話旗標
	local ttime = 0 
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,2)
	WriteRoleValue(OwnerID(),EM_RoleValue_register4,2)
	for i=1 , 4 do
		care[i] = CreateObjByFlag( 105007 , 780831, i , 1 )
		SetModeEx(care[i],EM_SetModeType_Move,false) ---移動
		WriteRoleValue(care[i],EM_RoleValue_register1,OwnerID())
		if i==1 or i==2 then
			SetPlot( care[i],"dead","un_zone190_care7",0 )
		end
		if i==3 or i==4 then
			SetPlot( care[i],"dead","un_zone190_care8",0 )
		end
		AddToPartition(care[i],RoomID )
	end
	
	while 1 do
	reg11 = ReadRoleValue(OwnerID(),EM_RoleValue_register3)
	reg22 = ReadRoleValue(OwnerID(),EM_RoleValue_register4)
	ttime=ttime+1
		sleep(10)
		reg1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)--2王
		reg2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register2)--3王
		if CheckID( reg1) == true  then 
			if hatelistcount(reg1)~=0 then                          --如果2王仇恨表有人
					if regfight1 == 0 then
						regfight1 =1
					end
					if reg11 ~=0 and regfight1==1 then
					sleep(20)
						ScriptMessage( reg1, -1 , 2 , "[SC_ZONE190_CAR]", 2 )
						regfight1 = 2 
					end
				if ttime%5 == 0 then
					local TargetPlayer1 = Lua_RandomPlayerFromHateList(reg1,1)
					local TargetPlayer2 = Lua_RandomPlayerFromHateList(reg1,1)
					if ReadRoleValue(care[3] , EM_RoleValue_IsDead)==0 then
						CastSpelllv( care[3], TargetPlayer1[1], 496581,0 )
					end
					if ReadRoleValue(care[4] , EM_RoleValue_IsDead)==0 then
						CastSpelllv( care[4], TargetPlayer2[1], 496581,0 )
					end
				end
			else
				regfight1 =0
			end
		end
		if CheckID( reg2) == true then 
			if hatelistcount(reg2)~=0 then							--如果3王仇恨表有人
					if regfight2 == 0 then
						regfight2 = 1
					end
					if reg22 ~=0 and regfight2 == 1 then
					sleep(20)
						ScriptMessage( reg2, -1 , 2 ,"[SC_ZONE190_CAR]" , 2 )
						regfight2 = 2
					end
				if ttime%5 == 0 then
					local TargetPlayer3 = Lua_RandomPlayerFromHateList(reg2,1)
					local TargetPlayer4 = Lua_RandomPlayerFromHateList(reg2,1)
					if ReadRoleValue(care[1] , EM_RoleValue_IsDead)==0 then
						CastSpelllv( care[1], TargetPlayer3[1], 496581,0 )
					end
					if ReadRoleValue(care[2] , EM_RoleValue_IsDead)==0 then
						CastSpelllv( care[2], TargetPlayer4[1], 496581,0 )
					end
				end
			else 
				regfight2 = 0 
			end
		end
	end
end
function un_zone190_care7()	
	local AI = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local num= ReadRoleValue(AI,EM_RoleValue_register4)
	WriteRoleValue(AI,EM_RoleValue_register4,num-1)
end
function un_zone190_care8()	
	local AI = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local num= ReadRoleValue(AI,EM_RoleValue_register3)
	WriteRoleValue(AI,EM_RoleValue_register3,num-1)
end
function un_zone190_boss4()--4王任務
local QuestID = 423771
local Player
local keyItem = 544695
	if HateListCount( OwnerID() ) >= 1 then
		for i = 0 , HateListCount( OwnerID() )-1 , 1 do						
			player = HateListInfo( OwnerID() , i , EM_HateListInfoType_GItemID )
			if CheckAcceptQuest( Player, QuestID ) == true and CheckCompleteQuest( Player, QuestID ) ~= ture and CheckFlag( Player, keyItem ) ~= true then
				SetFlag(  Player, keyItem, 1 )
			end
		end
	end
end