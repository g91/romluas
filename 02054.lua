 ----------------------------------------------------------------------------------------------------------------
                                                --1王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone18_134_PAT1() --4人小隊
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104543,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104546,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104544,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104545,Matrix,3,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone18_134_PAT2" , 0 )
end
function Lua_zone18_134_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone18_134_PAT1" , 0 )
end
 ----------------------------------------------------------------------------------------------------------------
                                                --5王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone18_134_PAT3() --4人小隊
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104543,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104546,Matrix,1,1)
	BeginPlot(ObjMatrix[2] , "Lua_un_zone18_monster20" , 0 )
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone18_134_PAT4" , 0 )
end

function Lua_zone18_134_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone18_134_PAT3" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                                     --小怪技能
----------------------------------------------------------------------------------------------------------------
function Lua_un_zone18_monster()                   --5秒清一次負面BUFF
	local buff = {}
	local x
	while true do
		sleep(50)
		x=BuffCount( OwnerID() )
		for i=1,x do
			buff[i]=BuffInfo( OwnerID() ,x-i ,EM_BuffInfoType_BuffID )
			CancelBuff( OwnerID(), buff[i])
		end
	end
end
function Lua_un_zone18_monster1()                   --攻擊靈氣
	while true do
		sleep(10)
		sysCastSpellLv(OwnerID(),OwnerID(),496298,0)
	end
end
function Lua_un_zone18_monster2()                   --攻速靈氣
	while true do
		sleep(10)
		sysCastSpellLv(OwnerID(),OwnerID(),496299,0)
	end
end

function Lua_un_zone18_monster3()--讓捕獸夾的觸發劇情藉由Beginplot的關係，延後一秒再發動
	SetPlot( OwnerID(),"range","Lua_un_zone18_monster4",30 )
end
function Lua_un_zone18_monster4() --此時的「OwnerID」是指玩家，「TargetID」是只捕獸夾 
	local Mob_Num = 0
	local Search = {}
	if  ReadRoleValue(OwnerID(),EM_RoleValue_VOC) == 0 then
		BeginPlot(TargetID() , "Lua_un_zone18_monster3" , 0)
	elseif  ReadRoleValue(OwnerID(),EM_RoleValue_VOC) ~= 0 then
		SetPlot( OwnerID(),"range","",10 ) ---為了避免重複觸法，所以，在觸發之後，必需要再塞一次「空的」劇情給玩加
		Addbuff(TargetID(),506964,0,1)--結束補獸夾的特效用
		Addbuff(OwnerID(),507841,0,15)
		--BeginPlot( OwnerID(), "AP_Zone134_104458_Trap_2", 10)
		sleep(10)
		Delobj(TargetID())
	end
end
function Lua_un_zone18_monster5()                   --火拳靈氣
	local alltime = 0
	local CombatBegin = 0
	local TargetPlayer
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
			if CombatBegin==1 then
				sysCastSpellLv(OwnerID(),OwnerID(),496300,2)
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			CombatBegin = 0
			alltime = 0
		end
	end
end
function Lua_un_zone18_monster6()                   --蟲子死了出小蟲
	local cab=LuaFunc_CreateObjByObj ( 104566 , OwnerID() )
	local TargetPlayer= Lua_RandomPlayerFromHateList(OwnerID(),1)
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
	--SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(cab,EM_SetModeType_Move,true) ---移動	
	SetModeEx(cab,EM_SetModeType_Fight,true) ---可砍殺
	SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	--SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
	--SetModeEx(cab,EM_SetModeType_Gravity,false)
	--SetModeEx(cab,EM_SetModeType_Show,false)
	SetAttack( cab , TargetPlayer[1])
	AddToPartition(cab,RoomID )
end
function Lua_un_zone18_monster7()
	local lifetime = 0
	while true do
		sleep(10)
		lifetime=lifetime+1
		if lifetime==5 then
			sysCastSpellLv(OwnerID(),OwnerID(),496301,19)
			sleep(10)
			delobj(OwnerID())
		end
	end
end

function Lua_un_zone18_monster8()
	local alltime = 0
	local CombatBegin = 0
	local TargetPlayer

	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
			if CombatBegin==1 then
				--addbuff(OwnerID(),507796,0,-1)
				sysCastSpellLv(OwnerID(),OwnerID(),496304,1)
				if alltime%15==0 then
					TargetPlayer= Lua_RandomPlayerFromHateList(OwnerID(),1)
					CastSpellLv(OwnerID(),targetplayer[1],496305,20)
				elseif 	alltime%18==0 then
				CastSpellLv(OwnerID(),OwnerID(),496189,0)
					sleep(20)
				end
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
		CancelBuff( OwnerID(), 507796 )
			CombatBegin = 0
			alltime = 0
		end
	end
end
function Lua_un_zone18_monster9()
	if CheckBuff( TargetID() ,507800)==false then
		addbuff(TargetID(),507800,2,-1)
		BeginPlot(TargetID(),"Lua_un_zone18_monster10",0)
	elseif 	CheckBuff( TargetID() ,507800 )==true then
		sysCastSpellLv(OwnerID(),TargetID(),496307,19)
	end
end
function Lua_un_zone18_monster10()
	local dottime = 0
	while true do
		dottime=dottime+1
		sleep(10)
		if dottime%5==0 and CheckBuff( OwnerID() ,507800)==true then
			sysCastSpellLv(OwnerID(),OwnerID(),496308,3)
		elseif 	dottime%5==0 and CheckBuff( OwnerID() ,507800)==false then
			break
		end
	end
end

function Lua_un_zone18_monster11()
	local alltime = 0
	local CombatBegin = 0
	local palyer
	local player2
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
			if CombatBegin==1 then
				if alltime%10==0 then
					CastSpellLv(OwnerID(),OwnerID(),496309,0)
				
				end
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			CombatBegin = 0
			alltime = 0
		end
	end
end
function Lua_un_zone18_monster11_2()
	local palyer
	local player2
	palyer =SearchRangePlayer( OwnerID() , 100 )
	player2=table.getn(palyer)+2
	sysCastSpellLv(OwnerID(),OwnerID(),496310, player2)
end
function Lua_un_zone18_monster12()--讓蟲子的觸發劇情藉由Beginplot的關係，延後一秒再發動
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	doorchick2 = CreateObjByFlag( 104519 , 780764 , 0 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	
	AddToPartition( doorchick2, RoomID)
	SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,doorchick2)
	SetPlot( OwnerID(),"collision","Lua_un_zone18_monster13",20 )
end
function Lua_un_zone18_monster13() --此時的「OwnerID」是指玩家，「TargetID」是蟲子
	local door = ReadRoleValue(TargetID(),EM_RoleValue_register1)
	WriteRoleValue(TargetID(),EM_RoleValue_HP,0)
	SetPlot( TargetID(),"collision","",10 ) ---為了避免重複觸法，所以，在觸發之後，必需要再塞一次「空的」劇情給玩加
	ScriptMessage( door, -1 , 2 , "[SC_104567_01]" , 2 )
	sleep(10)
	NPCDead( TargetID() , TargetID() )
	SetDefIdleMotion(door,ruFUSION_MIME_ACTIVATE_BEGIN)
end
function Lua_un_zone18_monster14()--棺材的劇情
	SetPlot( OwnerID(),"range","Lua_un_zone18_monster15",75 )
end
function Lua_un_zone18_monster15()--此時的「OwnerID」是指玩家，「TargetID」是棺材
	SetPlot( TargetID(),"range","",0 )
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local rand = Dw_rand(3)
	local rand1
	local monster
	local Player={}
	if  ReadRoleValue(OwnerID(),EM_RoleValue_VOC) == 0 then
		BeginPlot(TargetID() , "Lua_un_zone18_monster14" , 0)
	elseif  ReadRoleValue(OwnerID(),EM_RoleValue_VOC) ~= 0 then
		if rand==1 then
		ScriptMessage(  TargetID(), -1 , 2 , "[SC_104567_02]" , 2 )
		player = SearchRangePlayer ( OwnerID() , 500 )
		rand1 = DW_Rand(table.getn(player))
			monster=LuaFunc_CreateObjByObj ( 104559 , TargetID() )
			AddToPartition(monster,roomID )
			SetAttack( monster , player[rand1-1])
			WriteRoleValue(monster,EM_RoleValue_register1,TargetID())
			BeginPlot(monster , "Lua_un_zone18_monster19" , 0)
		elseif rand==2 then
		ScriptMessage(  TargetID(), -1 , 2 , "[SC_104567_02]" , 2 )
		player = SearchRangePlayer ( OwnerID() , 500 )
		rand1 = DW_Rand(table.getn(player))
			monster=LuaFunc_CreateObjByObj ( 104560 , TargetID() )
			AddToPartition(monster,roomID )
			SetAttack( monster , player[rand1-1])
			WriteRoleValue(monster,EM_RoleValue_register1,TargetID())
			BeginPlot(monster , "Lua_un_zone18_monster19" , 0)
		elseif rand==3 then
		end
		BeginPlot(TargetID() , "Lua_un_zone18_monster22" , 0)
	end
	
end
function Lua_un_zone18_monster22()
	local alltime = 0
	while true do
	sleep(10)
	alltime=alltime+1
		if alltime == 30 then
			BeginPlot( OwnerID(),"Lua_un_zone18_monster14",0 )
			break
		end
	end
end
function Lua_un_zone18_monster19()
	local alltime = 0
	local CombatBegin = 0
	local TargetPlayer

	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
		local monster =ReadRoleValue(OwnerID(),EM_RoleValue_register1)
			SetPlot( monster,"range","Lua_un_zone18_monster15",75 )
			CombatBegin = 0
			alltime = 0
			delobj(OwnerID())
		end
	end
end
function Lua_un_zone18_monster16()--寶藏的劇情
	SetPlot( OwnerID(),"range","Lua_un_zone18_monster17",75 )
end
function Lua_un_zone18_monster17()--此時的「OwnerID」是指玩家，「TargetID」是寶藏
	SetPlot( TargetID(),"range","",10 )
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local rand = Dw_rand(2)
	local monster
	if rand==1 then
	local cab=LuaFunc_CreateObjByObj ( 104566 , TargetID() )
	SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
	--SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(cab,EM_SetModeType_Move,true) ---移動	
	SetModeEx(cab,EM_SetModeType_Fight,true) ---可砍殺
	SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	--SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
	--SetModeEx(cab,EM_SetModeType_Gravity,false)
	--SetModeEx(cab,EM_SetModeType_Show,false)
	SetAttack( cab , ownerID())
	AddToPartition(cab,RoomID )
	elseif rand==2 then
	end	
end
function Lua_un_zone18_monster18()
	if CheckBuff( TargetID() ,507800)==true then
		return false
	elseif 	CheckBuff( TargetID() ,507800 )==false then
		return true
	end
end
function Lua_un_zone18_monster20()
	local alltime = 0
	local CombatBegin = 0
	local TargetPlayer
	local monster1
	local monster2
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CastSpelllv( OwnerID(),  OwnerID(), 496173,0 )
				monster1 = CreateObjByFlag( 104559 , 780754 , 6 , 1 )
				monster2 = CreateObjByFlag( 104560 , 780754 , 7 , 1 )
				WriteRoleValue(monster1,EM_RoleValue_register1,OwnerID())
				WriteRoleValue(monster2,EM_RoleValue_register1,OwnerID())
				AddToPartition( monster1, RoomID)
				AddToPartition( monster2, RoomID)
				BeginPlot(monster1 , "Lua_un_zone18_monster21" , 0)
				BeginPlot(monster2 , "Lua_un_zone18_monster21" , 0)
				CombatBegin=1			
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			CombatBegin = 0
			alltime = 0
		end
	end
end
function Lua_un_zone18_monster21()
	local alltime = 0
	local CombatBegin = 0
	local TargetPlayer
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
		local monster =ReadRoleValue(OwnerID(),EM_RoleValue_register1)
			CombatBegin = 0
			alltime = 0
				local x=ReadRoleValue(OWnerID(),EM_RoleValue_register1)
	local z=ReadRoleValue(x,EM_RoleValue_register1)
	WriteRoleValue(x,EM_RoleValue_register1,z-1)
			NPCDead( OwnerID() , OwnerID() )
			delobj(OwnerID())
		elseif CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then
			CombatBegin = 0
			alltime = 0
				local x=ReadRoleValue(OWnerID(),EM_RoleValue_register1)
	local z=ReadRoleValue(x,EM_RoleValue_register1)
	WriteRoleValue(x,EM_RoleValue_register1,z-1)
			NPCDead( OwnerID() , OwnerID() )
			delobj(OwnerID())
		end
	end
end
function Lua_un_zone18_monster23()
	local alltime = 0
	local CombatBegin = 0
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
			if CombatBegin==1 then
				if alltime%11==0 then
					Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
					CastSpellLv(OwnerID(),Targ,496311,4)
				elseif alltime%20==0 then
					CastSpellLv(OwnerID(),OwnerID(),496314,0)
				end
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			CombatBegin = 0
			alltime = 0
		end
	end
end
function Lua_un_linrow()--天堂路
	local sktime = 10
	local player={}
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local monster1
	local monster2
	local monster3
	local rand1
	local rand2
	local door
	local x = 0
	local rand
	WriteRoleValue(OWnerID(),EM_RoleValue_register1,0)
	WriteRoleValue(OWnerID(),EM_RoleValue_register2,0)
	monster3 = CreateObjByFlag( 104646 , 780754 , 17 , 1 )
	door = CreateObjByFlag( 104647 , 780754 , 16 , 1 )
	SetModeEx(door,EM_SetModeType_Mark, false)
	SetModeEx(door,EM_SetModeType_HideName, false)
	SetModeEx(door,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(door,EM_SetModeType_Strikback, false)
	SetModeEx(door,EM_SetModeType_Move, false)
	SetModeEx(door,EM_SetModeType_Fight, false)
	SetModeEx(door,EM_SetModeType_Searchenemy, false)
	SetModeEx(door,EM_SetModeType_Obstruct, true)
	AddToPartition( door, RoomID)
	WriteRoleValue(monster3,EM_RoleValue_register1,OwnerID())
	AddToPartition( monster3, RoomID)
	SetPlot( monster3,"dead","Lua_un_linrow_3",0 )
	while true do
	--say(OwnerID(),"time = "..sktime)
	--say(OwnerID(),"player = "..table.getn(player))
	sleep(10)
	if ReadRoleValue(OwnerID(),EM_RoleValue_register2) == 1 then
		ScriptMessage(  OwnerID(), -1 , 2 , "[SC_104225_09]" , 2 )
		Delobj(door)
		break
	end
		player = SearchRangePlayer ( OwnerID() , 200 )
		if ReadRoleValue(Player[0],EM_RoleValue_IsDead) == 1 then
			player={}
		elseif ReadRoleValue(Player[0],EM_RoleValue_VOC) == 0 then
			player={}
		end
		if table.getn(player) >=1 then
			sktime=sktime+1
			x=ReadRoleValue(OWnerID(),EM_RoleValue_register1)
			if sktime%15 == 0 and x<16 then
				rand = Az_RND_Ary(8,15,2)
				ScriptMessage(  OwnerID(), -1 , 2 , "[SC_104225_08]" , 2 )
				rand1 = DW_Rand(table.getn(player))
				rand2 = DW_Rand(table.getn(player))
				--say(OwnerID(),"atk="..player[rand1-1])
				--say(OwnerID(),"YYYYYYYYYYYYY")
				monster1 = CreateObjByFlag( 104559 , 780754 , rand[1] , 1 )
				monster2 = CreateObjByFlag( 104560 , 780754 , rand[2] , 1 )
				WriteRoleValue(monster1,EM_RoleValue_register1,OwnerID())
				WriteRoleValue(monster2,EM_RoleValue_register1,OwnerID())
				AddToPartition( monster1, RoomID)
				AddToPartition( monster2, RoomID)
				--BeginPlot(monster1 , "Lua_un_linrow_1" , 0)
				--BeginPlot(monster2 , "Lua_un_linrow_1" , 0)
				SetPlot( monster1,"dead","Lua_un_linrow_1",0 )
				SetPlot( monster2,"dead","Lua_un_linrow_1",0 )
				--CallPlot(monster1,"LuaFunc_Obj_Suicide",60)
				--CallPlot(monster2,"LuaFunc_Obj_Suicide",60)
				CallPlot(monster1 , "Lua_un_zone18_monster21" , 0)
				CallPlot(monster2 , "Lua_un_zone18_monster21" , 0)
				SetAttack( monster1 , player[rand1-1])
				SetAttack( monster2 , player[rand2-1])
				
				--say(OwnerID(),"x="..x)
				WriteRoleValue(OWnerID(),EM_RoleValue_register1,x+2)
			end
		end
	end
end
function Lua_un_linrow_1()
	local x=ReadRoleValue(OWnerID(),EM_RoleValue_register1)
	local z=ReadRoleValue(x,EM_RoleValue_register1)
	WriteRoleValue(x,EM_RoleValue_register1,z-1)
end
function Lua_un_linrow_3()
	local x=ReadRoleValue(OWnerID(),EM_RoleValue_register1)
	local z=ReadRoleValue(x,EM_RoleValue_register2)
	WriteRoleValue(x,EM_RoleValue_register2,z+1)
	
end
function Lua_un_bossfight2_134_01()    --火拳

		sleep(2)
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		--say(TargetID( ),"X"..x)
		local cab=Lua_DW_CreateObj("obj",104652,TargetID(),0)
		SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
		SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
		SetModeEx(cab,EM_SetModeType_Move,false) ---移動	
		SetModeEx(cab,EM_SetModeType_Fight,false) ---可砍殺
		SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
		SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
		SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
		SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
		SetModeEx(cab,EM_SetModeType_Show,false)
		AddToPartition(cab,RoomID )
		local PPL=SearchRangePlayer(TargetID(),90)	
		local x=table.getn(PPL)-----取出來的是數量
		WriteRoleValue(cab,EM_RoleValue_Livetime,3)
		if x>=6 then 
			CastSpellLV(cab,cab,496015,19)
		elseif x==5 then 
			CastSpellLV(cab,cab,496015,23)
		elseif x==4 then 
			CastSpellLV(cab,cab,496015,29)
		elseif x==3 then
			CastSpellLV(cab,cab,496015,39)
		elseif x==2 then
			CastSpellLV(cab,cab,496015,59)
		elseif x==1 then	
			CastSpellLV(cab,cab,496015,119)
		end
		
end