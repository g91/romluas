function bk_127_103872()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------控制器本身	
	local x=0---------戰鬥計時器
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
	local s=0
	local y=0
	local s1=0
	local s2=0
	local s3=0
	local afdoor = CreateObjByFlag(103871,780597,2,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----阻擋
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	BeginPlot( afdoor ,"bk_127_103825",0)
	AddToPartition( afdoor , RoomID )
	local boss = CreateObjByFlag(103869,780597,3,1)------------------------------創立王
	SetModeEx( boss , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( boss , EM_SetModeType_Mark, true)
	SetModeEx( boss , EM_SetModeType_HideName, true)
	SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
	---SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----阻擋
	SetModeEx( boss , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( boss , EM_SetModeType_Move, true) ---移動	
	SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( boss , EM_SetModeType_Searchenemy, true)
	SetModeEx( boss , EM_SetModeType_Show, true)
	AddToPartition( boss , RoomID )
	BeginPlot( boss ,"bk_127_103869",0)
	SetPlot( boss , "dead" , "bk_127_103869_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- 在控制器身上放入王的id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- 在王身上放入控制器id
	local Maxhp=ReadRoleValue( boss , EM_RoleValue_MaxHP )
	WriteRoleValue(start ,EM_RoleValue_Register4,Maxhp)--------------------------------紀錄王本身血量
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		y=ReadRoleValue(start,EM_RoleValue_Register5)
		if x==1 then --王正在戰鬥之中
			if CombatBegin==0 then 
				door = CreateObjByFlag(103871,780597,1,1)
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
				BeginPlot( door ,"bk_127_103825",0)
				AddToPartition( door , RoomID )
				
				CombatBegin=1
				
			end	
			if y==1 then
				WriteRoleValue(start, EM_RoleValue_Register5,0)
				s=ReadRoleValue(start,EM_RoleValue_Register2)------------回報他們打到誰
				s1 = ReadRoleValue(start,EM_RoleValue_Register7)
				s2 = ReadRoleValue(start,EM_RoleValue_Register8)
				s3 = ReadRoleValue(start,EM_RoleValue_Register9)
				if s== 1 then 
					local Nowhp=ReadRoleValue(start,EM_RoleValue_Register3)
					WriteRoleValue(boss, EM_RoleValue_HP,Nowhp)
					WriteRoleValue(boss ,EM_RoleValue_Register3,0)
					SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( boss , EM_SetModeType_Mark, true)
					CancelBuff(boss , 506546)----------------------------------把王獻出來
				elseif s==2 then 
					local Nowhp=ReadRoleValue(start,EM_RoleValue_Register3)
					local Maxhp=ReadRoleValue( start , EM_RoleValue_Register4)----------讀取王的最大的血量
					local HPPercent = Nowhp /  Maxhp	--血量百分比
					if HPPercent <= 0.9 then
						HPPercent=HPPercent+0.1
						Nowhp=Maxhp*HPPercent
						WriteRoleValue( boss, EM_RoleValue_HP,Nowhp)
						WriteRoleValue(boss ,EM_RoleValue_Register3,0)
						SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
						SetModeEx( boss , EM_SetModeType_Mark, true)
						CancelBuff(boss , 506546)----------------------------------把王獻出來
					elseif HPPercent > 0.9 then 
						WriteRoleValue( boss, EM_RoleValue_HP,Maxhp)
						WriteRoleValue(boss ,EM_RoleValue_Register3,0)
						SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
						SetModeEx( boss , EM_SetModeType_Mark, true)
						CancelBuff(boss , 506546)----------------------------------把王獻出來
					end
				end
				WriteRoleValue(start, EM_RoleValue_Register2,0)	
				Delobj(s1)
				Delobj(s2)
				Delobj(s3)
			end
			gatime=gatime+1 ------狂暴時間
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103170_03]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --玩家死亡王離開戰鬥
			sleep(50)
			s1 = ReadRoleValue(start,EM_RoleValue_Register7)
			s2 = ReadRoleValue(start,EM_RoleValue_Register8)
			s3 = ReadRoleValue(start,EM_RoleValue_Register9)
			boss = CreateObjByFlag(103869,780597,3,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103869",0)---------------------------------王劇情模式
			SetPlot( boss , "dead" , "bk_127_103869_dead" , 10 )
			x=0
			sleep(10)
			Delobj(s1)
			Delobj(s2)
			Delobj(s3)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gg=0
			gatime=0
			CombatBegin=0
		elseif x==3 then --玩家打死亡跑死亡劇情
			s1 = ReadRoleValue(start,EM_RoleValue_Register7)
			s2 = ReadRoleValue(start,EM_RoleValue_Register8)
			s3 = ReadRoleValue(start,EM_RoleValue_Register9)
			Delobj(s1)
			Delobj(s2)
			Delobj(s3)
			Delobj(afdoor)----------------打開通往副本的門
			Delobj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			gg=0
			gatime=0
			CombatBegin=0
		end	
	end		
end
function bk_127_103869()--------------王本身ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------控制器本身	
	local CombatBegin=0
	local skill1={495531,495532,495534}------1.心靈控制 2. 腐蝕波
	local SkillIndex=0
	local skilllv={0,5,20}----招式威力
	local skilltime=0------技能施放時間
	local Luck=0 -----計算出什麼招式
	local Play_Chose={}-----------填入仇恨表隊員
	local skplayer=0 -------技能施放目標
	local mob=0  ----階段
	local mob1=0 ----時間
	local lp=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin==0 then
				CombatBegin=1
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------寫入1之後代表王正在戰鬥中
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103170_01]" , 1 )
			end
			mob=ReadRoleValue(boss,EM_RoleValue_Register3)
			if mob == 0 then
				mob1=mob1+1
				skilltime = skilltime+1
				if skilltime>= 8 then 
				Luck=DW_Rand(100)------------------- 亂數決定施放招式
					if (Luck >= 0 and Luck < 33)  then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						skilltime=0 
					elseif (Luck >= 33 and Luck < 66) then	
						SkillIndex = 2-----------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 代表裡面沒有人 那還打屁啊
						end
						if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
						skilltime=0 
					elseif (Luck >= 66 and Luck < 101) then 
						SkillIndex = 3 -----------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 代表裡面沒有人 那還打屁啊
						end
						if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
						skilltime=0 
					end
				end	
				if mob1 >= 30 then 
					mob=1
					WriteRoleValue(boss ,EM_RoleValue_Register3,1)
					mob1=0
				end	
			end
			if mob == 1 then 
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103170_02]" , 1 )
				local NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )			
				local Temp = Lua_Davis_BornByMultilateral( 103870 , 3 , 25 )	--在自己身上出4怪
				WriteRoleValue( Temp[1] ,EM_RoleValue_PID, start)	--寫入PID
				WriteRoleValue(start, EM_RoleValue_Register7,Temp[1])	
				SetPlot( Temp[1] , "dead" , "bk_127_103870_true" , 10 )
				BeginPlot( Temp[1] , "bk_127_103870_tu",20)---------------------------------施放法術劇情
				SetAttack( Temp[1] , AttackTarget) -- 全部送進仇恨
				----AddBuff(Temp[1], 506757 , 1 , -1 )
				WriteRoleValue( Temp[2] ,EM_RoleValue_PID, start)	--寫入PID
				WriteRoleValue(start, EM_RoleValue_Register8,Temp[2])	
				SetPlot( Temp[2] , "dead" , "bk_127_103870_flase" , 10 )
				BeginPlot( Temp[2] , "bk_127_103870",20)---------------------------------施放法術劇情
				SetAttack( Temp[2] , AttackTarget) -- 全部送進仇恨
				WriteRoleValue( Temp[3] ,EM_RoleValue_PID, start)	--寫入PID
				WriteRoleValue(start, EM_RoleValue_Register9,Temp[3])	
				SetPlot( Temp[3] , "dead" , "bk_127_103870_flase" , 10 )
				BeginPlot( Temp[3] , "bk_127_103870",20)---------------------------------施放法術劇情
				SetAttack( Temp[3] , AttackTarget) -- 全部送進仇恨
				NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )-------------------------讀取現在的血量
				WriteRoleValue(start, EM_RoleValue_Register3,NowHP)-------------------1  記住血量
				AddBuff(boss, 506546 , 1 , -1 )---------變成透明特效球!
				SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( boss , EM_SetModeType_Mark, false)
				WriteRoleValue(boss ,EM_RoleValue_Register3,2)
				mob=2
			end
			
		elseif HateListCount( boss )  == 0 then    ----戰鬥離開
			if CombatBegin==1 then
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
				sleep(50)
				DelObj(boss)
				CombatBegin=0
			end
		end
	end
end
function bk_127_103869_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( boss , EM_SetModeType_Mark, true)
	CancelBuff(boss , 506546)----------------------------------把王獻出來
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_103870_true()--------------小怪劇情
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue(start, EM_RoleValue_Register5,1)	
	WriteRoleValue(start, EM_RoleValue_Register2,1)	
	Delobj(OwnerID())
end
function bk_127_103870_flase()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local caball = Lua_DW_CreateObj("obj",103888,OwnerID(),0)
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
	CastSpellLv(caball,caball,495529,40)
	WriteRoleValue(caball, EM_RoleValue_Livetime,5)	---------------存在時間livetime
	WriteRoleValue(start, EM_RoleValue_Register5,1)
	WriteRoleValue(start, EM_RoleValue_Register2,2)	
	Delobj(OwnerID())
end
function bk_127_103870()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local sm=OwnerID()
	local skill1={495586,495587,495588}------1.衰落印記 2. 腐敗印記3.殘癈印記
	local skilllv={2,2,2}----招式威力
	local SkillIndex=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local ti=0
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		ti=ti+1
		if ti>=5 then 
			Luck=DW_Rand(100)------------------- 亂數決定施放招式
			if (Luck >= 0 and Luck < 33)  then
				SkillIndex = 1
				BossTarget = AttackTarget
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
			elseif (Luck >= 33 and Luck < 66) then	
				SkillIndex = 2-----------------------------------------單體打王傷害
				Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 代表裡面沒有人 那還打屁啊
				end
				if kp~=0 then --------看打哪個倒楣鬼
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			elseif (Luck >= 66 and Luck < 101) then
				SkillIndex = 3-----------------------------------------單體打王傷害
				Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 代表裡面沒有人 那還打屁啊
				end
				if kp~=0 then --------看打哪個倒楣鬼
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			end
			ti=0
		end	
	end	
end
function bk_127_103870_tu()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local sm=OwnerID()
	local skill1={495655,495587,495655}------1.衰落印記 2. 腐敗印記3.殘癈印記
	local skilllv={2,2,2}----招式威力
	local SkillIndex=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local ti=0
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		ti=ti+1
		if ti>=5 then 
			Luck=DW_Rand(100)------------------- 亂數決定施放招式
			if (Luck >= 0 and Luck < 33)  then
				SkillIndex = 1
				BossTarget = AttackTarget
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
			elseif (Luck >= 33 and Luck < 66) then	
				SkillIndex = 2-----------------------------------------單體打王傷害
				Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 代表裡面沒有人 那還打屁啊
				end
				if kp~=0 then --------看打哪個倒楣鬼
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			elseif (Luck >= 66 and Luck < 101) then
				SkillIndex = 3-----------------------------------------單體打王傷害
				Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 代表裡面沒有人 那還打屁啊
				end
				if kp~=0 then --------看打哪個倒楣鬼
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			end
			ti=0
		end	
	end	
end

