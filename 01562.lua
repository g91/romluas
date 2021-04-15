function Lua_bk_dw_ww_102463()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local st=OwnerID()
	local bwa={}
		for i=1 , 10 ,1 do
		bwa[i] = CreateObjByFlag(100469,780449,i,1)------------------------------------10個地方去產生物件
		SetModeEx( bwa[i] , EM_SetModeType_Show, false) ----秀出
		SetModeEx( bwa[i] , EM_SetModeType_Mark, false) ----標記
		SetModeEx( bwa[i] , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bwa[i] , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bwa[i] , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bwa[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( bwa[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( bwa[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( bwa[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
		WriteRoleValue(bwa[i] , EM_RoleValue_Register6,i)--------------------------------------紀錄位置
		WriteRoleValue(bwa[i] , EM_RoleValue_Register5,st)--------------------------------------紀錄位置
		AddtoPartition(bwa[i] , RoomID )
		BeginPlot( bwa[i],"Lua_bk_master_102641",10)
		end
		local door = CreateObjByFlag(102463,780449,11,1)-----------------------在旗標2上面丟入阻擋門
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
		AddtoPartition( door , RoomID )
		SetPlot( door , "range" , "Lua_bk_dw_range_102463" , 30 )----寫入範圍劇情
		while 1 do
		sleep(10)
		local bwdd = ReadRoleValue (st,EM_RoleValue_Register1)------讀取元素怪物還幾隻
		---	say(st,"xxxxxx="..bwdd)
			if bwdd==10 then 	
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_102463_02]" , 1 )
			DelObj(door)
			break
			end
		end
end
function Lua_bk_master_102641()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
 local bwater = LuaFunc_CreateObjByObj ( 102641 , OwnerID() )----------------------------------------------開場囉建立人
	SetModeEx( bwater , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( bwater , EM_SetModeType_Mark, true)
	SetModeEx( bwater , EM_SetModeType_HideName, true)
	SetModeEx( bwater , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( bwater , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( bwater , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( bwater , EM_SetModeType_Move, true) ---移動	
	SetModeEx( bwater , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( bwater , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( bwater , EM_SetModeType_Searchenemy, true)
	SetModeEx( bwater , EM_SetModeType_Show, true)
 WriteRoleValue( bwater ,EM_RoleValue_PID, OwnerID())	--寫入PID
 AddToPartition(bwater , RoomID )
 BeginPlot( bwater,"Lua_bk_dw_ww_102641",10)
 SetPlot( bwater , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------正確劇情
end
function Lua_bk_dw_ww_dd__102641()----------------------------------------------------死亡劇情著魔的水元素ai
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local bw = OwnerID()
	local bwa = ReadRoleValue (bw,EM_RoleValue_PID)-----------------開始物件的
	local st = ReadRoleValue (bwa,EM_RoleValue_Register5)-----------------開始物件的
	local bwdd=ReadRoleValue (st,EM_RoleValue_Register1)-----------------寫現在怪物數量
	bwdd=bwdd+1
	WriteRoleValue(st , EM_RoleValue_Register1,bwdd)
    Delobj(bwa) -------------刪除暫存物件
end
function Lua_bk_dw_ww_102641()----------------------------------------------------著魔的水元素ai
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local bw = OwnerID()
	local bwa = ReadRoleValue (bw,EM_RoleValue_PID)-----------------開始物件的
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
	local s1=0
	local time1=0
	local Skill={493996,494000,493999}
	local skilllv={1400,1400,1000}
	local Luck = 0
	local ss = 0
	while 1 do 
		sleep(10)
		if HateListCount( bw ) ~= 0 then
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
			time1=time1+1
			local NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP	--血量百分比
			if HPPercent < 0.5 then-------------------------當血量產生3支小怪
				if ss==0 then
				NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )-------------------------讀取現在的血量
				WriteRoleValue(bwa, EM_RoleValue_Register7,NowHP)
				local Temp = Lua_Davis_BornByMultilateral( 102666 , 3 , 25 )	--在自己身上出3怪
				WriteRoleValue( Temp[1] ,EM_RoleValue_PID, bwa)	--寫入PID
				WriteRoleValue(bwa, EM_RoleValue_Register1,Temp[1])	
				SetPlot( Temp[1] , "dead" , "Lua_bk_dd_sw_wr_102666" , 10 )
				AddBuff(Temp[1],504811,1,600)--------------物理免疫
				BeginPlot( Temp[1] , "Lua_bk_sw_102666",20)---------------------------------施放法術劇情
				SetAttack( Temp[1] , AttackTarget) -- 全部送進仇恨
				
				WriteRoleValue( Temp[2] ,EM_RoleValue_PID, bwa)	--寫入PID
				WriteRoleValue(bwa, EM_RoleValue_Register2,Temp[2])	
				SetPlot( Temp[2] , "dead" , "Lua_bk_dd_sw_wr_102666" , 10 )
				AddBuff(Temp[2],504810,1,600)--------------法術免疫
				BeginPlot( Temp[2] , "Lua_bk_sw_102666",20)---------------------------------施放法術劇情
				SetAttack( Temp[2] , AttackTarget) -- 全部送進仇恨
				
				WriteRoleValue( Temp[3] ,EM_RoleValue_PID, bwa)	--寫入PID
				WriteRoleValue(bwa, EM_RoleValue_Register3,Temp[3])	
				SetPlot( Temp[3] , "dead" , "Lua_bk_dd_sw_ri_102666" , 10 )-----------------------------------正確劇情
			    Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
				AddBuff(Temp[3],504811,1,600)--------------物理免疫
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
				AddBuff(Temp[3],504810,1,600)--------------法術免疫
				end
				BeginPlot( Temp[3] , "Lua_bk_sw_ri_102666",30)---------------------------------施放法術劇情
				SetAttack( Temp[3] , AttackTarget) -- 全部送進仇恨
			    sleep(5)
				Delobj(bw)
				ss=1
				end
				if ss==1 then 
				end
			end
			if time1>=5 then 
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) then
						SkillIndex = 2-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 50 and Luck < 75) or (Luck >= 25 and Luck < 50) then 
						SkillIndex = 3-------------------------------------------
						BossTarget=AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					end
					
				time1=0
			end	
		elseif HateListCount( bw ) == 0 then----------------離開戰鬥 所有值都該回歸
		time1=0
		end
	end
end
function Lua_bk_dd_sw_ri_102666()----------------------------------------------------小水元素之力死亡劇情-----------正確的
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local t1=ReadRoleValue(bwa,EM_RoleValue_Register2)
	local t2=ReadRoleValue(bwa,EM_RoleValue_Register3)
	local Nowhp=ReadRoleValue(bwa,EM_RoleValue_Register7)
	local seat=ReadRoleValue(bwa,EM_RoleValue_Register6)
	local st=ReadRoleValue(bwa,EM_RoleValue_Register5)----------------------------------------開始的gid
	local kill=TargetID() 
	DelObj(t1)
	DelObj(t2)
	if Nowhp<=0 then 
		local bwn = LuaFunc_CreateObjByObj ( 102641 , sw )----------------------------------------------開場囉建立人
			SetModeEx( bwn  , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( bwn  , EM_SetModeType_Mark, true)
			SetModeEx( bwn  , EM_SetModeType_HideName, true)
			SetModeEx( bwn  , EM_SetModeType_ShowRoleHead, true)
			SetModeEx( bwn  , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( bwn  , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( bwn  , EM_SetModeType_Move, true) ---移動	
			SetModeEx( bwn  , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( bwn  , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( bwn  , EM_SetModeType_Searchenemy, true)
			SetModeEx( bwn  , EM_SetModeType_Show, true)
		WriteRoleValue( bwn ,EM_RoleValue_PID, bwa)	--寫入PID
		WriteRoleValue(bwn, EM_RoleValue_HP,1)
		AddToPartition(bwn , RoomID )
		DelObj(sw)
		BeginPlot( bwn ,"Lua_bk_dw_ww1_102641",20)----把劇情丟到身上去-------------------後面打完劇情
		WriteRoleValue(bwn , EM_RoleValue_Register5,st)--------------------------------------紀錄位置
		WriteRoleValue(bwn,EM_RoleValue_Register6,seat)
		SetPlot( bwn , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------正確劇情
		KillID(kill , bwn )  ---殺掉npc指令
	elseif Nowhp>0 then 
	local bwn = LuaFunc_CreateObjByObj ( 102641 , sw )----------------------------------------------開場囉建立人
	WriteRoleValue( bwn ,EM_RoleValue_PID, bwa)	--寫入PID
	WriteRoleValue(bwn, EM_RoleValue_HP,Nowhp)
	AddToPartition(bwn , RoomID )
	DelObj(sw)
	BeginPlot( bwn ,"Lua_bk_dw_ww1_102641",20)----把劇情丟到身上去-------------------後面打完劇情
	WriteRoleValue(bwn , EM_RoleValue_Register5,st)--------------------------------------紀錄位置
	WriteRoleValue(bwn,EM_RoleValue_Register6,seat)
	SetPlot( bwn , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------正確劇情
	end
end
function Lua_bk_dd_sw_wr_102666()----------------------------------------------------小水元素之力----------------------錯誤
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local swb = Lua_DW_CreateObj("obj",102420,sw,0)
	SetModeEx( swb , EM_SetModeType_Show, true) ----秀出
	SetModeEx( swb , EM_SetModeType_Mark, false) ----標記
	SetModeEx( swb , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( swb , EM_SetModeType_Move, false) ---移動	
	SetModeEx( swb , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( swb , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( swb , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( swb , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( swb , EM_SetModeType_Searchenemy, false)  ---鎖敵
	AddToPartition(swb , RoomID )
	
	sysCastSpellLv(swb,swb,494386,0)
	BeginPlot( swb ,"Lua_bk_de_sw_wr_102666",30)----把劇情丟到身上去
	DelObj(sw)
end
function Lua_bk_de_sw_wr_102666()----------------------------------刪除
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local swb = OwnerID()
	
	sleep(20)
	DelObj(swb)
end
function Lua_bk_sw_102666()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local time1=0
	local Play_Chose={}
	local kp=0
	while 1 do 
	sleep(10)
		if HateListCount( sw ) ~= 0 then
			time1=time1+1
			if time1>=3 then
			Play_Chose=DW_HateRemain(0)-------------------------------讀取仇恨表所有人		
			kp=DW_Rand(table.getn(Play_Chose))
			CastSpellLV( OwnerID() , Play_Chose[kp] , 493999 , 1000 )---------隨機打一個
			sleep(30)
			end
		elseif HateListCount( sw ) == 0 then----------------離開戰鬥 所有值都該回歸
			DelObj(sw)
		end
	end
end
function Lua_bk_sw_ri_102666()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bw=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local time1=0
	local Play_Chose={}
	local kp=0
	while 1 do 
	sleep(10)
		if HateListCount( sw ) ~= 0 then
			time1=time1+1
			if time1>=3 then
			Play_Chose=DW_HateRemain(0)-------------------------------讀取仇恨表所有人		
			kp=DW_Rand(table.getn(Play_Chose))
			CastSpellLV( OwnerID() , Play_Chose[kp] , 493999 , 1000 )---------隨機打一個
			sleep(30)
			end
		elseif HateListCount( sw ) == 0 then----------------離開戰鬥 所有值都該回歸
			sleep(20)
			seat=ReadRoleValue(bw,EM_RoleValue_Register6)----------------------------------------讀取它是第幾個位置
			--WriteRoleValue(bw, EM_RoleValue_Register4,1)	-----------------------------------正確的離開戰鬥 代表大家的死光了!!!
			local bwn = CreateObjByFlag(102641,780449,seat,1)------------------------------------10個地方去產生物件
			WriteRoleValue( bwn ,EM_RoleValue_PID, bw)	--寫入PID
			BeginPlot( bwn,"Lua_bk_dw_ww_102641",10)
			AddToPartition(bwn , RoomID )
			SetPlot( bwn , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------正確劇情
			sleep(20)
			DelObj(sw)
		end
	end
end
function Lua_bk_dw_ww1_102641()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local bw = OwnerID()
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local time1=0
	local Skill={493996,494000,493999}
	local skilllv={1400,1400,1000}
	local Luck= 0
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( bw ) ~= 0 then
		time1=time1+1
			if time1>=5 then 
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) then
						SkillIndex = 2-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 50 and Luck < 75) or (Luck >= 25 and Luck < 50) then 
						SkillIndex = 3-------------------------------------------
						BossTarget=AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					end
					
				time1=0
			end	
		elseif HateListCount( bw ) == 0 then----------------離開戰鬥 所有值都該回歸
		sleep(20)
		local bwater = LuaFunc_CreateObjByObj ( 102641 , bwa )----------------------------------------------開場囉建立人
		SetModeEx( bwater , EM_SetModeType_Gravity, true) ---重力
		SetModeEx( bwater , EM_SetModeType_Mark, true)
		SetModeEx( bwater , EM_SetModeType_HideName, true)
		SetModeEx( bwater , EM_SetModeType_ShowRoleHead, true)
		SetModeEx( bwater , EM_SetModeType_NotShowHPMP, true)
		SetModeEx( bwater , EM_SetModeType_Strikback, true) ---反擊
		SetModeEx( bwater , EM_SetModeType_Move, true) ---移動	
		SetModeEx( bwater , EM_SetModeType_Fight, true) ---可砍殺
		SetModeEx( bwater , EM_SetModeType_SearchenemyIgnore, true) 
		SetModeEx( bwater , EM_SetModeType_Searchenemy, true)
		SetModeEx( bwater , EM_SetModeType_Show, true)
		WriteRoleValue( bwater ,EM_RoleValue_PID, bwa)	--寫入PID
		AddToPartition(bwater , RoomID )
		BeginPlot( bwater,"Lua_bk_dw_ww_102641",10)
		SetPlot( bwater , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------正確劇情
		DelObj(bw)
		end	
	end
end


