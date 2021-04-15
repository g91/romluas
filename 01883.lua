function bk_129_104046()--------------王本身ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local boss = OwnerID()--------控制器本身	
	local CombatBegin=0
	local skill1={495676,495678}------1.裂地爪 2.大地咆哮
	local SkillIndex=0
	local skilllv={13,6}----招式威力
	local skilltime=0------技能施放時間
	local Luck=0 -----計算出什麼招式
	local Play_Chose={}-----------填入仇恨表隊員
	local skplayer=0 -------技能施放目標
	local mob=0
	local lp=0
	local kp=0
	local door=0
	local door1=0
	local door2=0
	local door3=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin==0 then
				door = CreateObjByFlag(104016,780668,4,1)
				SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				SetDefIdleMotion( door,ruFUSION_MIME_ACTIVATE_LOOP)
				door1 = CreateObjByFlag(104016,780668,5,1)
				SetModeEx( door1 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door1 , EM_SetModeType_Mark, false)
				SetModeEx( door1 , EM_SetModeType_HideName, false)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
				SetModeEx( door1 , EM_SetModeType_Show, true)
				AddToPartition( door1 , RoomID )
				SetDefIdleMotion( door1,ruFUSION_MIME_ACTIVATE_LOOP)
				door2 = CreateObjByFlag(104016,780668,6,1)
				SetModeEx( door2 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door2 , EM_SetModeType_Mark, false)
				SetModeEx( door2 , EM_SetModeType_HideName, false)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door2 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)
				SetModeEx( door2 , EM_SetModeType_Show, true)
				AddToPartition( door2 , RoomID )
				SetDefIdleMotion( door2,ruFUSION_MIME_ACTIVATE_LOOP)
				door3 = CreateObjByFlag(104016,780668,7,1)
				SetModeEx( door3 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door3 , EM_SetModeType_Mark, false)
				SetModeEx( door3 , EM_SetModeType_HideName, false)
				SetModeEx( door3 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door3 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door3 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( door3 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door3 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door3 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door3 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door3 , EM_SetModeType_Searchenemy, false)
				SetModeEx( door3 , EM_SetModeType_Show, true)
				AddToPartition( door3 , RoomID )
				SetDefIdleMotion( door3 ,ruFUSION_MIME_ACTIVATE_LOOP)
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------寫入1之後代表王正在戰鬥中
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register9,door)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register6,door3)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register7,door2)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register8,door1)
				CombatBegin=1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_01]" , 1 )----又是一群煩人的小蟲，讓我們快點結束這「公平」的遊戲吧
				Say(OwnerID(),"[SC_103932_01]")
			end
			mob=mob+1
			skilltime=skilltime+1
			if mob>=30 then 
				BossTarget = AttackTarget
				local caball = Lua_DW_CreateObj("obj",103971,OwnerID(),0)
				SetModeEx( caball , EM_SetModeType_Show, true) ----秀出
				SetModeEx( caball , EM_SetModeType_Mark, false) ----標記
				SetModeEx( caball , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( caball , EM_SetModeType_Move, false) ---移動	
				SetModeEx( caball , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( caball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( caball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( caball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( caball , EM_SetModeType_Searchenemy, false)  ---鎖敵
				AddToPartition(caball , RoomID )
				WriteRoleValue(caball, EM_RoleValue_Livetime,6)
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_02]" , 1 )-----感受一下大地的憤怒！(真言)drialra histana fer bashtei！！
				AddBuff( caball , 506888 , 1 , -1 )
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
				sleep(30)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------保持飛天的狀態
				CastSpellLV( OwnerID() , OwnerID() , 495530 , 0 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(2)
				end
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------保持飛天的狀態
				------------------CastSpellLV( OwnerID() , BossTarget , 495734 , 9 )---------------觸發
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )---------------------播放下來.
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_11]" , 1 )
				CastSpellLV( OwnerID() , BossTarget , 495539 , 0 )---------------觸發
				----------------------------say(OwnerID(),"boss"..BossTarget)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
				SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式	
		---------------------	Debugmsg(0,0,"4")
				mob=0
			end
			if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- 亂數決定施放招式
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_04]" , 1 )-----這就像拍死一隻小蟲一樣容易
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2------------------------------------------單體打王傷害
					Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 代表裡面沒有人 那還打屁啊
					end
					if kp~=0 then --------看打哪個倒楣鬼
					BossTarget = Play_Chose[kp]		
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_03]" , 1 )-----感受一下大地的憤怒！
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
					sleep(20)
					end
				end
				skilltime=0
			end	
		elseif HateListCount( boss )  == 0 then    ----戰鬥離開
			if CombatBegin==1 then 
				CombatBegin=0 
				WriteRoleValue(start, EM_RoleValue_Register1,0)		-------------------當離開戰鬥回報0  	
				---sleep(30)
				Delobj(door)
				Delobj(door1)
				Delobj(door2)
				Delobj(door3)
				Delobj(boss)
				break
			end
			local PPL = SetSearchAllPlayer(RoomID)
			if PPL>=1 then ------------攻擊他
				for i = 1 , PPL , 1 do ---把玩家抓入房間用 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						SetAttack( boss , ID)
						break
					elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
						lp=lp+1
					end
				end
				if PPL==lp then 
					WriteRoleValue(start, EM_RoleValue_Register1,0)	
				---	sleep(50)
					lp=0
					Delobj(door)
					Delobj(door1)
					Delobj(door2)
					Delobj(door3)
					DelObj(boss)
					break
				end
			elseif PPL==0 then 
				WriteRoleValue(start, EM_RoleValue_Register1,0)	
			---	sleep(50)
				Delobj(door)
				Delobj(door1)
				Delobj(door2)
				Delobj(door3)
				DelObj(boss)
			end
		end
	end
end
function bk_129_104046_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,2)	
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_08]" , 1 )----終於能夠從屈辱的奴役中觸脫了......你們要小心.....那個.....女...人。
	local good=CreateObjByFlag(104047,780670,8,1)
	SetModeEx( good , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( good , EM_SetModeType_Mark, true)
	SetModeEx( good , EM_SetModeType_HideName, false)
	SetModeEx( good , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( good , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( good , EM_SetModeType_Obstruct, false)   -----重力
	SetModeEx( good , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( good , EM_SetModeType_Move, false) ---移動	
	SetModeEx( good , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( good , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( good , EM_SetModeType_Searchenemy, false)
	SetModeEx( good , EM_SetModeType_Show, true)
	AddToPartition( good , RoomID )
	local door= ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	local door1= ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local door2= ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
	local door3= ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
	Delobj(door)
	Delobj(door1)
	Delobj(door2)
	Delobj(door3)
	BeginPlot( boss ,"bk_129_104046_deadtime",20)-------------------
	-----DelObj(boss)
end
function bk_129_104046_deadtime()
	sleep(20)
	DelObj(OwnerID())
end
function bk_129_506789()----------------------法術判定
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local magic = OwnerID()
	local PX=0
	local PPL = SearchRangePlayer ( magic , 50 )	-------------------------讀取身旁的玩家數量
	local x=table.getn(PPL)-----取出來的是數量
	local x1=0
	local name=0
	------say(OwnerID(),"x"..x)
	if x>=1 then 
		x1=x-1
		for i=0, x1 ,1 do
			-----say(OwnerID(),"dsa"..i)
			---name= GetName( PPL[i] )
			--say(OwnerID(),"ASD"..name)
			if ReadRoleValue( PPL[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( PPL[i], EM_RoleValue_VOC) ~= 0 then----------------------------------------沒有死+不是gm 
				PX=PX+1
				-----say(OwnerID(),"PX"..PX)
			end
			-----say(OwnerID(),"111111111111111")
		end
			---say(OwnerID(),"222222222222222")
		if PX==1 then 
			AddBuff(  OwnerID() , 506775 , 1 , 10)------------石化buff
		elseif PX>=2 then 
			CastSpellLV( OwnerID() , OwnerID() , 495680 , 11 )
		end
	elseif x==0 then 
		AddBuff(  OwnerID() , 506775 , 1 , 10)------------石化buff
	end
end
function Lua_bk_129_506791()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SearchRangePlayer ( TargetID( ) , 60 )	-------------------------讀取身旁的玩家數量
	local x=table.getn(PPL)-----取出來的是數量
	--------------------say(TargetID( ),"X"..x)
	local cab = Lua_DW_CreateObj("obj",103971,TargetID( ),0)
	SetModeEx( cab , EM_SetModeType_Show, true) ----秀出
	SetModeEx( cab , EM_SetModeType_Mark, false) ----標記
	SetModeEx( cab , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( cab , EM_SetModeType_Move, false) ---移動	
	SetModeEx( cab , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( cab , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( cab , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( cab , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( cab , EM_SetModeType_Searchenemy, false)  ---鎖敵
	AddToPartition(cab , RoomID )
	WriteRoleValue(cab, EM_RoleValue_Livetime,6)
	if x==6 then 
		CastSpellLV( cab , cab , 495466 , 9 )
	elseif x==5 then 
		CastSpellLV( cab , cab , 495466 , 11 )
	elseif x==4 then 
		CastSpellLV( cab , cab , 495466 , 14 )
	elseif x==3 then
		CastSpellLV( cab , cab , 495466 , 19 )
	elseif x==2 then
		CastSpellLV( cab , cab , 495466 , 29 )
	elseif x==1 then	
-------------------------	say(cab,"45645646")
		CastSpellLV( cab , cab , 495466 , 59 )
	end
end