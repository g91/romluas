function bk_127_103153()----------------冰火五重天控制器
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------控制器本身	
	local x=0---------戰鬥計時器
	local gatime=0
	local mobtime=0
	local mob=0
	local gg=0
	local CombatBegin=0
	local door=0
	local afdoor = CreateObjByFlag(103824,780596,2,1)-------------------------------------------奇美拉後門
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----重力
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	AddToPartition( afdoor , RoomID )
	BeginPlot( afdoor ,"bk_127_103825",0)
	local boss = CreateObjByFlag(103153,780596,3,1)------------------------------創立王
	SetModeEx( boss , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( boss , EM_SetModeType_Mark, true)
	SetModeEx( boss , EM_SetModeType_HideName, true)
	SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
	--SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----阻擋
	SetModeEx( boss , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( boss , EM_SetModeType_Move, true) ---移動	
	SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( boss , EM_SetModeType_Searchenemy, true)
	SetModeEx( boss , EM_SetModeType_Show, true)
	AddToPartition( boss , RoomID )
	BeginPlot( boss ,"bk_127_103153_fire",0)
	SetPlot( boss , "dead" , "bk_127_103153_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- 在控制器身上放入王的id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- 在王身上放入控制器id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --王正在戰鬥之中
			if CombatBegin==0 then 
				door = CreateObjByFlag(103824,780596,1,1)-------------------------------------------奇美拉前門
				SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				--SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				BeginPlot( door ,"bk_127_103825",0)
				CombatBegin=1
			end	
			gatime=gatime+1 ------狂暴時間
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103153_04]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --玩家死亡王離開戰鬥
			sleep(50)
			boss = CreateObjByFlag(103153,780596,3,1)
			SetModeEx( boss , EM_SetModeType_Mark, true)
			SetModeEx( boss , EM_SetModeType_HideName, true)
			SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
		--	SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----阻擋
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( boss , EM_SetModeType_Move, true) ---移動	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( boss , EM_SetModeType_Searchenemy, true)
			SetModeEx( boss , EM_SetModeType_Show, true)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103153_fire",0)---------------------------------王劇情模式
			SetPlot( boss , "dead" , "bk_127_103153_dead" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gg=0
			gatime=0
			CombatBegin=0
		elseif x==3 then --玩家打死亡跑死亡劇情
			Delobj(afdoor)----------------打開通往副本的門
			Delobj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			gg=0
			gatime=0
			CombatBegin=0
		end	
	end		
end
function bk_127_103153_fire()--------------王本身ai 奇美拉-紅
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------控制器本身	
	local CombatBegin=0
	local skill1={495541,495547,495542,495548}------1.火焰噴發2.烈焰吞噬3.冰霜吐息4.絕對凝結
	local SkillIndex=0
	local skilllv={80,9,80,9}----招式威力
	local skilltime=0------技能施放時間
	local Luck=0 -----計算出什麼招式
	local Play_Chose={}-----------填入仇恨表隊員
	local kp=0
	local skplayer=0 -------技能施放目標
	local mob=0
	local mob1=0
	local mob2=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin==0 then
				CombatBegin=1
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------寫入1之後代表王正在戰鬥中
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103153_01]" , 1 )
			end
			if mob==0  then
				mob1=mob1+1
				skilltime=skilltime+1
				if skilltime>= 5 then 
					Luck=DW_Rand(100)------------------- 亂數決定施放招式
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103153_02]" , "0xff6fb7ff" )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 2------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)-----------------仇恨表找人   填0代表 不排除主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 代表裡面沒有人 那還打屁啊
						end
						if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
					end
					skilltime=0
				end
				if mob1 >= 15 then
					---AddBuff(boss, 506574 , 1 , -1 )-----------------------------
					Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 代表裡面沒有人 那還打屁啊
					end
					if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						---ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
						local caball = Lua_DW_CreateObj("obj",103829,BossTarget,0)
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
						CastSpellLv(caball,caball,495543,30)
						WriteRoleValue(caball, EM_RoleValue_Livetime,20)	---------------存在時間livetime
						sleep(20)
					end
					mob=1 
					mob2=0
				end		
			end
			if mob==1 then
				mob2=mob2+1
				skilltime=skilltime+1
				if skilltime>= 5 then 
					Luck=DW_Rand(100)------------------- 亂數決定施放招式
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 3
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 4------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 代表裡面沒有人 那還打屁啊
						end
						if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103153_03]" , "0xff6fb7ff" )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
					end
					skilltime=0
				end
				if mob2>=15 then 
					---CancelBuff(boss , 506574 )-------清除變身BUFF
					Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 代表裡面沒有人 那還打屁啊
					end
					if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						---ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
					---	say(boss,"xxxxxxxxx")
						local caball = Lua_DW_CreateObj("obj",103829,BossTarget,0)
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
						CastSpellLv(caball,caball,495544,30)
						WriteRoleValue(caball, EM_RoleValue_Livetime,20)	---------------存在時間livetime
						sleep(20)
					end
					mob=0
					mob1=0
				end
			end		
		elseif HateListCount( boss )  == 0 then    ----戰鬥離開
			
			if CombatBegin==1 then 
				CombatBegin=0 
				WriteRoleValue(start, EM_RoleValue_Register1,2)			
				sleep(30)
				Delobj(OwnerID())
			end
		end
	end
end
function bk_127_103153_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_506575()
	GiveBodyItem( OwnerID() , 207175 , 1 )
	CancelBuff(TargetID() , 506563 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 506564 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 506565 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 506570 )----------------------------------結束玩家身上buff
	sysCastSpellLV( OwnerID() , OwnerID() , 495549 , 12 )
end
function bk_127_506576()
	GiveBodyItem( OwnerID() , 207176 , 1 )
	CancelBuff(TargetID() , 506567 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 506568 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 506569 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 506571 )----------------------------------結束玩家身上buff
	sysCastSpellLV( OwnerID() , OwnerID() , 495550 , 12 )
end
function bk_127_207175_ch()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then -------------------------------------檢查是否為玩家 玩家等於1
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_16]" , 1 )-------------------------------------只能對玩家使用
		return false
	else
		if GetDistance( OwnerID(), TargetID()) < 301 then
			return true
		else
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_17]" , 1 )-------------------------------------距離過遠
			return false
		end
	end
end
function bk_127_207175_magic()
	CancelBuff(TargetID() , 506573 )----------------------------------結束玩家身上buff
end
function bk_127_207176_ch()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then -------------------------------------檢查是否為玩家 玩家等於1
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_16]" , 1 )-------------------------------------只能對玩家使用
		return false
	else
		if OwnerID()==TargetID() then
			return false
		else
			if GetDistance( OwnerID(), TargetID()) < 301 then
				return true
			else
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_17]" , 1 )-------------------------------------距離過遠
				return false
			end
		end
	end
end
function bk_127_207176_magic()
	CancelBuff(TargetID() , 506572 )----------------------------------結束玩家身上buff
end
