function Un_EZzone18_BossCtrl()					
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Ctrl = OwnerID()					--控制器
	local PhaseChange = 60					--切換時間
	local PhaseCount = 1					--模式計時
	local CombatBegin=0						--開戰旗標
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104624,780754,2,1)
	local doorchick1
	local doorchick2
	local firelose ={}
	local Sktalk = {"[SC_104225_01]","[SC_104225_02]","[SC_104225_05]","[SC_104225_06]"}
	AddToPartition(Boss,RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	doorchick2 = CreateObjByFlag( 104519 , 780754 , 1 , 1 )
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
	WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
	SetPlot( boss,"dead","UN_EZtaigeDead_zone18",0 )
	
	while true do
		sleep(10)
		if hatelistcount(boss)~=0 then
			if CombatBegin==0 then
				CombatBegin=1										--開打了
				BeginPlot(boss , "Lua_UN_EZzone18_Boss2" , 0)	
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_END)
					doorchick1 = CreateObjByFlag( 104519 , 780754 , 3 , 1 )
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
				firelose = SearchRangeNPC ( OwnerID() , 1000 )
				for i=0,table.getn(firelose) do
					--say(OwnerID(),"x = "..firelose[i])
						if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==104457 then
							delobj(firelose[i])
						end
				end
				DelObj(boss)
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				Delobj(doorchick1)
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
				sleep(50)
				Boss=CreateObjByFlag(104624,780754,2,1)
				RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
				AddToPartition(Boss,RoomID)                         --重置BOSS
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
				SetPlot( boss,"dead","UN_EZtaigeDead_zone18",0 )
				CombatBegin=0										--重置戰鬥
				PhaseCount=1										--重置計時

			elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
				firelose = SearchRangeNPC ( OwnerID() , 1000 )
				for i=0,table.getn(firelose) do
					--say(OwnerID(),"x = "..firelose[i])
						if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==104457 then
							delobj(firelose[i])
						end
				end
				ScriptMessage( Boss, -1 , 2 , Sktalk[4] , 2 )
				--SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_BEGIN)
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				Delobj(doorchick2)
				Delobj(doorchick1)
				sleep(50)
				break
			end
		end	
	end
end

function Lua_UN_EZzone18_Boss2()					--Boss AI
	local boss=OwnerID()
	local door = ReadRoleValue(boss,EM_RoleValue_register1)
	local RoomID=ReadRoleValue(boss,EM_RoleValue_RoomID)
	local Sk1={496015,496016}				--BOSS普攻技能 火拳+火掌
	local SkLv={10,10}                      --技能等級
	local SkCount=0
	local RND
	local TargetPlayer = {}
	local targ
	local Bosstalk = {}
	local bump1
	local bump2
	local bossHateListCount
	local Sktalk = {"[SC_104225_03]","[SC_104225_04]","SC_104225_07"}
	while true do
	sleep(10)
	SkCount=SkCount+1
	local target=ReadRoleValue(boss,EM_RoleValue_AttackTargetID)              --開戰觸發
			if  SkCount%9==0 then
				bossHateListCount = HateListCount(OwnerID())
				TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)
				--say(OWnerID(),"tar1 = "..TargetPlayer[1])
				
				if ReadRoleValue(TargetPlayer[1],EM_RoleValue_VOC) == 0 then
					TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),2)
				end
				RND=DW_Rand(2)
					if RND == 1 then                                     --火拳
						while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
						end
							SetModeEx(Boss,EM_SetModeType_Move, false)
							SetModeEx(Boss,EM_SetModeType_Strikback, false)
							CastSpelllv( OwnerID(),  targetplayer[1], 496340,0 )
							ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
							sleep(40)
							SetModeEx(Boss,EM_SetModeType_Move, true)
							SetModeEx(Boss,EM_SetModeType_Strikback, true)
						
					end
					if RND == 2 then                                     --火掌
						Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
						--BeginPlot(OwnerID(),"Lua_un_bossfight1_134",0)
						SetModeEx(Boss,EM_SetModeType_Move, false)
						SetModeEx(Boss,EM_SetModeType_Strikback, false)
						CastSpelllv( OwnerID(), Targ, 496016,6 )
						ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 1 )
						sleep(20)
						SetModeEx(Boss,EM_SetModeType_Move, true)
						SetModeEx(Boss,EM_SetModeType_Strikback, true)
					end
					for i=1 , table.getn(TargetPlayer) do 
						if i==1 then
						local x1= ReadRoleValue ( TargetPlayer[1], EM_RoleValue_X)
						local y1= ReadRoleValue (  TargetPlayer[1], EM_RoleValue_Y)
						local z1=ReadRoleValue (  TargetPlayer[1], EM_RoleValue_Z)
								--bump1 = LuaFunc_CreateObjByObj ( 104493 , TargetPlayer[1])         --長炸彈,XXXXX=炸彈
								bump1=CreateObj ( 104493 , x1 , y1 , z1 , 0 , 1)
							--bump1 = LuaFunc_CreateObjByObj ( 104626 , TargetPlayer[1])         --長炸彈,XXXXX=炸彈
							SetModeEx(bump1,EM_SetModeType_Mark, false)
							SetModeEx(bump1,EM_SetModeType_HideName, false)
							SetModeEx(bump1,EM_SetModeType_NotShowHPMP, false)
							SetModeEx(bump1,EM_SetModeType_Strikback, false)
							SetModeEx(bump1,EM_SetModeType_Move, false)
							SetModeEx(bump1,EM_SetModeType_Fight, false)
							SetModeEx(bump1,EM_SetModeType_Searchenemy, false)
							AddToPartition(bump1,roomID )
						end
					end	
					sleep(20) 
			elseif  SkCount%7==0 then                                 --放雷射

					local cab=CreateObj ( 104507 , 907 , 800 , -673 , 0 , 1)
					SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
					--SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
					SetModeEx(cab,EM_SetModeType_Move,false) ---移動	
					SetModeEx(cab,EM_SetModeType_Fight,false) ---可砍殺
					SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
					SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
					SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
					SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
					SetModeEx(cab,EM_SetModeType_Gravity,false)
					WriteRoleValue(cab,EM_RoleValue_Livetime,2)
					--SetModeEx(cab,EM_SetModeType_Show,false)
					AddToPartition(cab,RoomID )
					sleep(10)
					TargetPlayer= Lua_RandomPlayerFromHateList(OwnerID(),2)
					sysCastSpellLv(cab,TargetPlayer[1],496019,3)
			elseif 	SkCount%15==0 then
				local TargetPlayer= Lua_RandomPlayerFromHateList(OwnerID(),1)
				CastSpelllv( OwnerID(),  targetplayer[1], 496350,3 )
			end
		--end
	end	
end
function Lua_un_bossfight2_135()    --火拳
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--say(TargetID( ),"X"..x)
	local cab=Lua_DW_CreateObj("obj",104507,TargetID(),0)
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
		CastSpellLV(cab,cab,496015,4)
	elseif x==5 then 
		CastSpellLV(cab,cab,496015,6)
	elseif x==4 then 
		CastSpellLV(cab,cab,496015,12)
	elseif x==3 then
		CastSpellLV(cab,cab,496015,24)
	elseif x==2 then
		CastSpellLV(cab,cab,496015,49)
	elseif x==1 then	
		CastSpellLV(cab,cab,496015,99)
	end
end
------------------------------------------------------------------------------------------------------------------
												--炸彈專用
------------------------------------------------------------------------------------------------------------------
function Lua_un_bump_135()
	local lifetime = 0 
	while true do
	lifetime = lifetime+1
		sleep(10)
		if lifetime == 3 then 
			CastSpellLv(OwnerID(),OwnerID(),496017,5)
			--NPCDead(OwnerID(), OwnerID())
		elseif lifetime >=4 then
			delobj(OwnerID())
		end
	end	
end
function UN_EZtaigeDead_zone18()    --BOSS死亡劇情
	local x = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	--ScriptMessage( OwnerID(), -1 , 2 ,"[SC_104140_05]", 2 )
	--SetDefIdleMotion(x,ruFUSION_MIME_ACTIVATE_BEGIN)       --刪除門
	Delobj(X)
end
function Lua_un_fireball_135()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--local ball = LuaFunc_CreateObjByObj ( 104457 , OwnerID())
	local ball=Lua_DW_CreateObj("obj",104457,OwnerID(),0)
	SetModeEx(ball,EM_SetModeType_Mark,false) ----標記
	SetModeEx(ball,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(ball,EM_SetModeType_Move,false) ---移動	
	SetModeEx(ball,EM_SetModeType_Fight,false) ---可砍殺
	SetModeEx(ball,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(ball,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(ball,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	SetModeEx(ball,EM_SetModeType_Searchenemy,false)  ---鎖敵
	--SetModeEx(ball,EM_SetModeType_Show,false)
	WriteRoleValue(ball,EM_RoleValue_Livetime,60)
	AddToPartition(ball,RoomID )
	beginplot(ball,"Lua_un_bumpppp5",0)
end
function Lua_un_bumpppp5()
	AddBuff( OwnerID() ,507730 ,0 ,-1 )
	while true do
	sleep(10)
		sysCastSpellLv(OwnerID(),OwnerID(),496163,5)
	end	
end