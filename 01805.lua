function bk_127_103827()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------控制器本身	
	local x=0---------戰鬥計時器
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
	local afdoor = CreateObjByFlag(103825,780589,1,1)-----------------1號後門
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
	local boss = CreateObjByFlag(103169,780589,3,1)------------------------------創立王  2號王
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
	BeginPlot( boss ,"bk_127_103169",0)
	SetPlot( boss , "dead" , "bk_127_103169_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- 在控制器身上放入王的id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- 在王身上放入控制器id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --王正在戰鬥之中
			if CombatBegin==0 then 
				door = CreateObjByFlag(103825,780589,2,1)   ---------3號前門
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
				BeginPlot( door ,"bk_127_103825",0)
				CombatBegin=1
			end	
			gatime=gatime+1 ------狂暴時間
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103169_04]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --玩家死亡王離開戰鬥
			sleep(50)
			boss = CreateObjByFlag(103169,780589,3,1)
			SetModeEx( boss , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( boss , EM_SetModeType_Mark, true)
			SetModeEx( boss , EM_SetModeType_HideName, true)
			SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
			--SetModeEx( boss , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----阻擋
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( boss , EM_SetModeType_Move, true) ---移動	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( boss , EM_SetModeType_Searchenemy, true)
			SetModeEx( boss , EM_SetModeType_Show, true)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103169",0)---------------------------------王劇情模式
			SetPlot( boss , "dead" , "bk_127_103169_dead" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gatime=0	
			gg=0
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
function bk_127_103169()--------------王本身ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------控制器本身	
	local CombatBegin=0
	local skill1={495515,495551,495554}------1.利刃斬2.混亂音波
	local SkillIndex=0
	local skilllv={18,4,100}----招式威力
	local skilltime=0------技能施放時間
	local mob=0
	local mobtime= 0
	local mobtime1=0
	local skilltarget=0
	local skillbigtime=0
	local Luck=0 -----計算出什麼招式
	local Play_Chose={}-----------填入仇恨表隊員
	local skplayer=0 -------技能施放目標
	local lp=0
	local kp=0
	local X=0 
	local Y=0
	local Z=0
	----local Dir=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin==0 then
				CombatBegin=1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_01]" , 1 )
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------寫入1之後代表王正在戰鬥中
			end
			skilltime=skilltime+1
			if mob == 0 then
				mobtime=mobtime+1
			---	say( OwnerID(),"mobtime"..mobtime)
				if mobtime >= 10 then ---------衝撞
					for i=1 , 20 ,1 do 
						local tar = CreateObjByFlag(103827,780598,i,1)
						SetModeEx( tar , EM_SetModeType_Gravity, false) ---重力
						SetModeEx( tar , EM_SetModeType_Mark, false)
						SetModeEx( tar , EM_SetModeType_HideName, false)
						SetModeEx( tar , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( tar , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( tar , EM_SetModeType_Obstruct, false)   -----重力
						SetModeEx( tar , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( tar , EM_SetModeType_Move, false) ---移動	
						SetModeEx( tar , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( tar , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( tar , EM_SetModeType_Searchenemy, false)
						SetModeEx( tar , EM_SetModeType_Show, true)
						AddToPartition( tar , RoomID )
						if GetDistance( OwnerID(), tar) > 170 then						
							WriteRoleValue(skilltarget, EM_RoleValue_Livetime,5)
							CastSpellLV( OwnerID() , skilltarget , 495516 , 1 )--------對目標施放招式
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_02]" , 1 )
							say( boss,"[SC_103169_02]")
							AddBuff(boss, 506543 , 1 , -1 )-------上黑色衝鋒buff
							---say( OwnerID(),"mob"..mob)
							sleep(20)
							CancelBuff(boss , 506543)----------------------------------把王獻出來
							mob=1
							mobtime=0
							break
						end
					end
				end
				if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- 亂數決定施放招式
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck <101) then		
						SkillIndex = 3------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 代表裡面沒有人 那還打屁啊
						end
						if kp~=0 then --------看打哪個倒楣鬼
						BossTarget = Play_Chose[kp]		
						---ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
					end
					skilltime=0
				end
			end
			if mob == 1 then 
				mobtime1=mobtime1+1
				-----say(OwnerID(),"xxxxx"..mobtime1)
				if mobtime1 >= 10 then 
					----say(OwnerID(),"yyyyy")
					SetModeEx( boss , EM_SetModeType_Obstruct, false)
					SetModeEx( boss , EM_SetModeType_Move, false) ---移動
					SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( boss , EM_SetModeType_Mark, false)
					----SetModeEx( boss , EM_SetModeType_Gravity, false) ---重力
					SysCastSpellLV( OwnerID() , boss , 495518 , 1 )--------使用物件把王打起來
					sleep(10)
					CastSpellLV( OwnerID() , OwnerID() , 495517 , 1 )--------自己施放跳躍
					-------sysCastSpellLV( OwnerID() , OwnerID() , 495595 , 1 )--------暈
					------AddBuff(boss, 506546 , 1 , -1 )-------把王藏起來							
					sleep(10)-----停留秒
					AddBuff(boss, 506546 , 1 , -1 )-------把王藏起來	
					Play_Chose=DW_HateRemain(0)-----------------仇恨表找人   填0代表 不排除主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 代表裡面沒有人 那還打屁啊
						local skilltarget = Lua_DW_CreateObj("obj",103827,boss,0)
						SetModeEx( skilltarget , EM_SetModeType_Gravity, false) ---重力
						SetModeEx( skilltarget , EM_SetModeType_Mark, false)
						SetModeEx( skilltarget , EM_SetModeType_HideName, false)
						SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----阻擋
						SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( skilltarget , EM_SetModeType_Move, false) ---移動	
						SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
						SetModeEx( skilltarget , EM_SetModeType_Show, true)	
						AddToPartition( skilltarget , RoomID )
						WriteRoleValue(skilltarget, EM_RoleValue_Livetime,8)
						AddBuff(skilltarget, 506540 , 1 , -1 )-------上黑色陰影的buff.
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_03]" , 1 )
						----say( boss,"[SC_103169_03]")
						sleep(20)
						X=ReadRoleValue(skilltarget ,EM_RoleValue_X)
						Y=ReadRoleValue(skilltarget ,EM_RoleValue_Y)
						Z=ReadRoleValue(skilltarget ,EM_RoleValue_Z)
						--- Dir=ReadRoleValue(boss ,EM_RoleValue_Dir)
						SetPos( boss, X, Y , Z , 20 )--------
						sleep(10)
						AddBuff(skilltarget, 506541 , 1 , -1 )-------落下地板破裂
						sysCastSpellLV( skilltarget , skilltarget , 495535 , 8 )
						CancelBuff(boss , 506546)----------------------------------把王獻出來
						sleep(30)
						SetModeEx( boss , EM_SetModeType_Move, true) ---移動
						SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
						SetModeEx( boss , EM_SetModeType_Mark, true)
					end
					if kp~=0 then --------看打哪個倒楣鬼
						-------say(boss,"1111")
					---	BossTarget = Play_Chose[kp]	
						local skilltarget = Lua_DW_CreateObj("obj",103827,Play_Chose[kp],0)
						SetModeEx( skilltarget , EM_SetModeType_Gravity, false) ---重力
						SetModeEx( skilltarget , EM_SetModeType_Mark, false)
						SetModeEx( skilltarget , EM_SetModeType_HideName, false)
						SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----阻擋
						SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( skilltarget , EM_SetModeType_Move, false) ---移動	
						SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
						SetModeEx( skilltarget , EM_SetModeType_Show, true)	
						AddToPartition( skilltarget , RoomID )
						WriteRoleValue(skilltarget, EM_RoleValue_Livetime,8)
						AddBuff(skilltarget, 506540 , 1 , -1 )-------上黑色陰影的buf
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_03]" , 1 )
						say( boss,"[SC_103169_03]")
						sleep(20)
						X=ReadRoleValue(skilltarget ,EM_RoleValue_X)
						Y=ReadRoleValue(skilltarget ,EM_RoleValue_Y)
						Z=ReadRoleValue(skilltarget ,EM_RoleValue_Z)
						---Dir=ReadRoleValue(Play_Chose[kp] ,EM_RoleValue_Dir)
						SetPos( boss, X, Y , Z , 20 )--------
						sleep(10)
						AddBuff(skilltarget, 506541 , 1 , -1 )-------落下地板破裂
						sysCastSpellLV( skilltarget , skilltarget , 495535 , 300 )
						CancelBuff(boss , 506546)----------------------------------把王獻出來
						sleep(30)
						SetModeEx( boss , EM_SetModeType_Move, true) ---移動
						SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
						SetModeEx( boss , EM_SetModeType_Mark, true)
					end
					mob=0
					mobtime1=0
				end				
				if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- 亂數決定施放招式
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck <101) then	
						SkillIndex = 2------------------------------------------單體打王傷害
						CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					end
				skilltime=0
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
function bk_127_103169_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	CancelBuff(boss , 506546)----------------------------------把王獻出來
	SetModeEx( boss , EM_SetModeType_Move, true) ---移動
	SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( boss , EM_SetModeType_Mark, true)
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_103825()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_ACTIVATE_LOOP)
end
