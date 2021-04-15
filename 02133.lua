function Un_zone191_boss1Ctrl()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Ctrl = OwnerID()					--控制器
	local PhaseChange = 60					--切換時間
	--local PhaseCount = 1					--模式計時
	local CombatBegin=0						--開戰旗標
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104951,780813,1,1)
	local doorchick1
	--local doorchick2
	local littlemonster1=CreateObjByFlag(104950,780813,2,1)
	local littlemonster2=CreateObjByFlag(104950,780813,3,1)
	local littlemonster3=CreateObjByFlag(104950,780813,4,1)
	local littlemonster4=CreateObjByFlag(104950,780813,5,1)
	--local firelose ={}
	local Sktalk =  {"[SC_104951_01]","[SC_104951_02]","[SC_104951_03]"}--01_開戰 02_滅團 03_王死
	local bossrand = DW_rand(2)--random   1 or 2 決定是否出小王
	if bossrand == 1 then
		local lBoss = CreateObjByFlag(104983,780815,0,1)
		AddToPartition(lBoss,RoomID)
		Beginplot(lBoss,"un_191littlemonster_01",0)
	end
	--say(OwnerID(),"x = "..bossrand)
		AddToPartition(Boss,RoomID)
		AddToPartition(littlemonster1,RoomID)
		AddToPartition(littlemonster2,RoomID)
		AddToPartition(littlemonster3,RoomID)
		AddToPartition(littlemonster4,RoomID)
		WriteRoleValue(littlemonster1,EM_RoleValue_register1,boss)
		WriteRoleValue(littlemonster2,EM_RoleValue_register1,boss)
		WriteRoleValue(littlemonster3,EM_RoleValue_register1,boss)
		WriteRoleValue(littlemonster4,EM_RoleValue_register1,boss)
		Beginplot(littlemonster1,"UN_192_monsterrun",0)
		Beginplot(littlemonster2,"UN_192_monsterrun",0)
		Beginplot(littlemonster3,"UN_192_monsterrun",0)
		Beginplot(littlemonster4,"UN_192_monsterrun",0)
		SetModeEx(littlemonster1,EM_SetModeType_Fight, false)
		SetModeEx(littlemonster2,EM_SetModeType_Fight, false)
		SetModeEx(littlemonster3,EM_SetModeType_Fight, false)
		SetModeEx(littlemonster4,EM_SetModeType_Fight, false)
		WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
		WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
		--[[doorchick2 = CreateObjByFlag( 104519 , 780754 , 1 , 1 )
		SetModeEx(doorchick2,EM_SetModeType_Mark, false)
		SetModeEx(doorchick2,EM_SetModeType_HideName, false)
		SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
		SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
		SetModeEx(doorchick2,EM_SetModeType_Move, false)
		SetModeEx(doorchick2,EM_SetModeType_Fight, false)
		SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
		SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
		AddToPartition( doorchick2, RoomID)
		--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_LOOP)
		SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
		WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
		WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)--]]
		--SetPlot( boss,"dead","",0 )  --BOSS的死亡劇情
		
		while true do
			sleep(10)
			if hatelistcount(boss)~=0 then
				if CombatBegin==0 then
					CombatBegin=1										--開打了
					BeginPlot(boss , "Un_zone191_boss1AI" , 0)	
					ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
					doorchick1 = CreateObjByFlag( 104963 , 780813 , 6 , 1 )
					SetModeEx(doorchick1,EM_SetModeType_Mark, false)
					SetModeEx(doorchick1,EM_SetModeType_HideName, false)
					SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
					SetModeEx(doorchick1,EM_SetModeType_Move, false)
					SetModeEx(doorchick1,EM_SetModeType_Fight, false)
					SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
					SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
					AddToPartition( doorchick1, RoomID)
					--WriteRoleValue(boss,EM_RoleValue_register1,1)		--從模式1開始
				end
			end

			if hatelistcount(boss)==0 and CombatBegin==1 then			--開戰後仇恨表沒人
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then
					DelObj(boss)
					DelObj(littlemonster1)
					DelObj(littlemonster2)
					DelObj(littlemonster3)
					DelObj(littlemonster4)
					--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
					Delobj(doorchick1)
					ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )--玩家滅團BOSS對話
					sleep(50)
					Boss=CreateObjByFlag(104951,780813,1,1)
					littlemonster1=CreateObjByFlag(104950,780813,2,1)
					littlemonster2=CreateObjByFlag(104950,780813,3,1)
					littlemonster3=CreateObjByFlag(104950,780813,4,1)
					littlemonster4=CreateObjByFlag(104950,780813,5,1)
					RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
					WriteRoleValue(littlemonster1,EM_RoleValue_register1,boss)
					WriteRoleValue(littlemonster2,EM_RoleValue_register1,boss)
					WriteRoleValue(littlemonster3,EM_RoleValue_register1,boss)
					WriteRoleValue(littlemonster4,EM_RoleValue_register1,boss)
					AddToPartition(littlemonster1,RoomID)
					AddToPartition(littlemonster2,RoomID)
					AddToPartition(littlemonster3,RoomID)
					AddToPartition(littlemonster4,RoomID)		
					AddToPartition(Boss,RoomID)                         --重置BOSS.
					Beginplot(littlemonster1,"UN_192_monsterrun",0)
					Beginplot(littlemonster2,"UN_192_monsterrun",0)
					Beginplot(littlemonster3,"UN_192_monsterrun",0)
					Beginplot(littlemonster4,"UN_192_monsterrun",0)
					SetModeEx(littlemonster1,EM_SetModeType_Fight, false)
					SetModeEx(littlemonster2,EM_SetModeType_Fight, false)
					SetModeEx(littlemonster3,EM_SetModeType_Fight, false)
					SetModeEx(littlemonster4,EM_SetModeType_Fight, false)
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					--WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
					--SetPlot( boss,"dead","",0 )--BOSS的死亡劇情
					CombatBegin=0										--重置戰鬥
					--PhaseCount=1										--重置計時

				elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
					ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
					--Delobj(doorchick2)
					Delobj(doorchick1)
					sleep(50)
					break
				end
			end	
		end
end
function Un_zone191_boss1AI()
	local boss=OwnerID()
	local door = ReadRoleValue(boss,EM_RoleValue_register1)
	local RoomID=ReadRoleValue(boss,EM_RoleValue_RoomID)
	local SkCount=0
	local RND
	local TargetPlayer = {}
	local TargetPlayer1 = {}
	local Play_Chose = {}

	local targ
	local Bosstalk = {}
	local bump1
	local bump2
	local Sktalk =  {"[SC_104951_04]","[SC_104951_05]"}
	local hatelist
	local hate = {}
	local far
	local ball = LuaFunc_CreateObjByObj ( 104949 , OwnerID() ) 
	SetModeEx(ball,EM_SetModeType_Mark,false) ----標記
	SetModeEx(ball,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(ball,EM_SetModeType_Move,false) ---移動	
	SetModeEx(ball,EM_SetModeType_Fight,false) ---可砍殺
	SetModeEx(ball,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(ball,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(ball,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	SetModeEx(ball,EM_SetModeType_Searchenemy,false)  ---鎖敵
	SetModeEx(ball,EM_SetModeType_Show,false)
	AddToPartition( ball, RoomID)
	while true do
	sleep(10)
	SkCount=SkCount+1
	local target=ReadRoleValue(boss,EM_RoleValue_AttackTargetID)              --開戰觸發
			if SkCount%10 ==0 then
				hate = DW_HateRemain(0)
				for i=1, table.getn(hate) do
					if GetDistance( ball, hate[i])>300 then
						local x = ReadRoleValue ( boss, EM_RoleValue_X)
						local y = ReadRoleValue ( boss, EM_RoleValue_Y)
						local z = ReadRoleValue ( boss, EM_RoleValue_Z)
						SetPos( hate[i], x, y, z , 0 ) 
					end
				end
			end
			if  SkCount%7==0 then
				--[[TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),2)
				if ReadRoleValue(TargetPlayer[1],EM_RoleValue_VOC) == 0 or ReadRoleValue(TargetPlayer[2],EM_RoleValue_VOC)then
					TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),2)
				end--]]
				RND=DW_Rand(2)
					if RND == 1 then   									--單體
						Targ=ReadRoleValue(boss,EM_RoleValue_AttackTargetID)
						Play_Chose = KS_GetHateList( boss, 1 )--依照仇恨順序
						--say(boss,"TABLE = "..table.getn(Play_Chose))						
						while ReadRoleValue(boss,EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
						end
							CastSpelllv( boss, Targ,496515,0 )--單體
							if table.getn(Play_Chose)>1 then
							--say(Play_Chose[2],"hate 2")
							--say(Play_Chose[1],"hate 1")
								SetAttack( boss , Play_Chose[2])
								SysCastSpellLv(Play_Chose[2], OwnerID(),496518,0)
								addbuff(Play_Chose[2],508107,0,7)
							end
							--ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
							sleep(10)
					end
					if RND == 2 then                                     --扇形
						Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
						--say(OwnerID(),"2")
						while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
						end
						--BeginPlot(OwnerID(),"Lua_un_bossfight1_134",0)
						
						CastSpelllv( OwnerID(), OwnerID(),496516 ,1 )		 --扇形
						--ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 1 )
						sleep(30)
					end
			elseif  SkCount%20==0 then                                 --標記5秒後穿透射擊
					hatelist = hatelistcount(OwnerID())
					local TargetPlayer2 = {}
					if hatelist >= 5 then
						TargetPlayer2 = Lua_RandomPlayerFromHateList(OwnerID(),5)
						for i=1 , 5 do
							addbuff(TargetPlayer2[i],508105,0,7)
						end
					else
						TargetPlayer2 = Lua_RandomPlayerFromHateList(OwnerID(),hatelist)
						for i=1 , hatelist do
							addbuff(TargetPlayer2[i],508105,0,7)
						end
					end
                  sleep(20)
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 1 )
				SetModeEx(Boss,EM_SetModeType_Move, false)
				SetModeEx(Boss,EM_SetModeType_Strikback, false)
					while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
						sleep(2)
					end
					CastSpelllv( OwnerID(), OwnerID(), 496512,10 )
					sleep(20)
					SetModeEx(Boss,EM_SetModeType_Move, true)
					SetModeEx(Boss,EM_SetModeType_Strikback, true)
			elseif 	SkCount%27==0 then                                 --標記2人 2秒後碎星雨
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
					sleep(2)
				end
				hatelist = hatelistcount(OwnerID())
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 1 )
				if hatelist >= 2 then
					TargetPlayer1= Lua_RandomPlayerFromHateList(OwnerID(),2)
					addbuff(TargetPlayer1[1],508104,0,2)
					--if table.getn(firelose)
					addbuff(TargetPlayer1[2],508104,0,2)
				else
					Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
					addbuff(Targ,508104,0,2)
				end
				sleep(25)
				if hatelist >= 2 then
					CastSpelllv( OwnerID(),  targetplayer1[1], 496513,3 )
					sysCastSpelllv( OwnerID(),  targetplayer1[2], 496513,3 )
				else
					CastSpelllv( OwnerID(),  Targ, 496513,3 )
				end
			elseif 	SkCount>=270 then
				addbuff(OwnerID(),508659,0,-1)		
			end
	end	
end
--===============================================================================================================
function Un_zone192_monsterskill()-------------------箭雨
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local x1= ReadRoleValue ( TargetID(), EM_RoleValue_X)
local y1= ReadRoleValue ( TargetID(), EM_RoleValue_Y)
local z1=ReadRoleValue ( TargetID(), EM_RoleValue_Z)
	
			
	local ball =CreateObj ( 104953 ,X1 , y1 , z1 , 0 , 1)
	
	SetModeEx(ball,EM_SetModeType_Mark,false) ----標記
	SetModeEx(ball,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(ball,EM_SetModeType_Move,false) ---移動	
	SetModeEx(ball,EM_SetModeType_Fight,false) ---可砍殺
	SetModeEx(ball,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(ball,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(ball,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	SetModeEx(ball,EM_SetModeType_Searchenemy,false)  ---鎖敵
	SetModeEx(ball,EM_SetModeType_NotShowHPMP,false)
	
	--SetModeEx(ball,EM_SetModeType_Show,false)
	WriteRoleValue(ball,EM_RoleValue_Livetime,6)
	AddToPartition(ball,RoomID )
	beginplot(ball,"Lua_un_shut",0)
end
function Lua_un_shut()
	while true do
	sleep(10)
	AddBuff( OwnerID() ,508100 ,0 ,1 )
		sysCastSpellLv(OwnerID(),OwnerID(),496517,10)
	end	
end

--===============================================================================================================
--===============================================================================================================
function UN_192_monsterrun()           -------------------小怪落跑射後不理
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)	
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---反擊	
	SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
	MoveToFlagEnabled(OwnerID(), false)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local hate
	local bosshate
	local monster1
	local monster2
	local monster3
	while true do
		hate = HateListCount( OwnerID() )
		bosshate = HateListCount(boss)
		--mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		--debugmsg(0,0, "hate = "..hate )
		if hate  > 0	or bosshate>0 then
			--debugmsg(0,0,"mob9898 = "..mob9898)
			KS_NoAttackPlayer( OwnerID() )	
			WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
			SetModeEx(OwnerID(),EM_SetModeType_Fight, true)
			while true do
				if DW_CheckDis( OwnerID(), 780813, 6, 20 ) == true then
					--say(OwnerID(),"123")
					Sleep(10)
					monster1=CreateObjByFlag(104952,780813,6,1)
					monster2=CreateObjByFlag(104952,780813,7,1)
					monster3=CreateObjByFlag(104952,780813,8,1)
					AddToPartition(monster1,RoomID)
					AddToPartition(monster2,RoomID)
					AddToPartition(monster3,RoomID)
					beginplot(monster1,"un_104952",0)
					beginplot(monster2,"un_104952",0)
					beginplot(monster3,"un_104952",0)
					delobj(OwnerID())
					break
				else
					ks_MoveToFlag( OwnerID(), 780813, 6, 20 )
				end
				sleep(10)
			end
		else
			StopMove(OwnerID(),false)
		end	
		sleep(10)
	end
end
function un_508101()
		if CheckBuff(TargetID(),508105) == false or CheckBuff(TargetID(),506457)==true or CheckBuff(TargetID(),501546)==true then--檢查BUFF 
			return false
		elseif 	CheckBuff(TargetID(),508105) == true then
			return true
		end	
end
function un_104952()
	local Player={}
	local CombatBegin = 0
	local ttime = 0
	player = SearchRangePlayer ( OwnerID() , 500 )
	SetAttack( OwnerID() , player[1])
	while true do
	sleep(10)
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end

		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			delobj(OWnerID())
		
		end
		if hatelistcount(OwnerID())==0 then
		ttime=ttime+1
			if ttime == 15 then
				delobj(OWnerID())
			end
		end
	end
	
end