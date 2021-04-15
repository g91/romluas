-------掛在囚犯身上----------------------------------------------------------
function Lua_apon_102683_Jailer()
	while 1 do
		sleep(10)
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )---蛇女王的GID
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if CheckBuff(OwnerID() , 504676) == true then ---進入分身要出場的表演
			sleep(10)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_11]" , 1 )----在牢房內傳出一陣哀嚎泣厲的聲音
			local SK = star_CreateObj( OwnerID() , 102894 , 0 , 0 , 0 , roomid1 , 0)
			SetModeEx(SK , EM_SetModeType_Strikback , false )--反擊
			SetModeEx(SK , EM_SetModeType_Searchenemy , false )--索敵
			SetModeEx( SK , EM_SetModeType_Fight, false) ----可砍殺攻擊
			SetModeEx( SK , EM_SetModeType_Mark, false) ----標記
			SetModeEx( SK , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( SK , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( SK , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( SK , EM_SetModeType_Gravity, false) ----重力
			SetModeEx( SK , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
			SetModeEx( SK , EM_SetModeType_AlignToSurface, false) ----貼齊表面
			SetModeEx( SK , EM_SetModeType_Move, false) ----移動
			Hide(OwnerID())
			AddBuff (SK , 505142 , 0 , 200)---將每一個特效球上一個分身要出場的特效
			sleep(10)
			local BK = star_CreateObj( SK , 102918 , 0 , 0 , 0 , roomid1 , 0)
			WriteRoleValue( BK, EM_RoleValue_PID, Boss)
			BeginPlot(BK,"LuaS_Discowood_CheckPeace",0) ---離開戰鬥後會自動消失 
			SetAttack( BK , AttackTarget )
			SetFightMode ( BK,0, 0, 0,0 )
			sleep(20)
			SetFightMode ( BK,1, 1, 1,1 )
			SetAttack( BK , AttackTarget )
			Delobj(SK)
			Delobj(OwnerID())
		end
	end
end

------------------------判斷主副職，扣SP or MP 專用-----------------------------------------------------------------------------------------------------

function Lua_apon_Zone120_buff_0() ----判斷是否有MP
	local Job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( TargetID() , EM_RoleValue_VOC_SUB )
	
	if Job == 1 or Job_sub == 1 then
		AddBuff (TargetID() , 505145 , 0 , 90)--扣戰士SP
	end
	
	if Job == 2 or Job_sub == 2 then 
		AddBuff (TargetID() , 505146 , 0 , 90)--扣遊俠SP
	end
	
	if Job == 3 or Job_sub == 3 then 
		AddBuff (TargetID() , 505147 , 0 , 90)--扣影行者SP
	end
	
	if Job == 4 or Job == 5 or Job == 6 or Job == 7 or Job == 8	
	or Job_sub == 4 or Job_sub == 5 or Job_sub == 6 or Job_sub == 7 or Job_sub == 8 then
		AddBuff (TargetID() , 505144 , 0 , 90)--扣MP
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------爆爆蛇--------------------------------------------------------------------------------
function Lau_apon_102917_Bomb_1()
	while 1 do 
		sleep(10)
		if CheckBuff(OwnerID() , 505225) == true then
			sleep(5)
			CastSpellLV( OwnerID() , OwnerID() , 494553 ,1)	
			PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
			sleep(10)
			Delobj( OwnerID() )
		end
	end
end


--------------------------蛇女王分身的部份----------------------------------------------------------
--------要再增加技能和每隔 10 秒 ， 丟出三條蛇
function Lua_apon_102918_1()
	SetPlot( OwnerID(),"dead","Lua_apon_102918_2",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter_p2_1 = 0
	local counter_p2_2 = 0
	local counter_p2_3 = 0
	local Rand_X
	local Rand_Z
	local SP = 0---丟爆爆蛇階段
	local SP_all = {} ---儲存所有的爆爆蛇
	local Check_SP_Num ---確認場上有多少隻爆爆蛇
	local PPLX = 0
	while 1 do 
		local Skill = {494594, 494596,494597 } ---技能表，單體傷害、扇形AE、空中水球術
		local SkillLv = {0 , 0 , 0 , 0 ,}  ---技能等級
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then
		--if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			counter_p2_1 = counter_p2_1 + 1 ---普通招式_1 and 2
			counter_p2_2 = counter_p2_2 + 1 ---普通招式_1 and 2
			counter_p2_3 = counter_p2_3 + 1 ----普通招式_3 
			
			if table.getn(SP_all) >= 1 then
				for i = 1 , table.getn(SP_all), 1 do ---重新計算場上有多少夢境王
					if SP_all[i] ~= nil and CheckID(SP_all[i]) == false then
						table.remove ( SP_all , i)
					end	
				end
			end
			
			Check_SP_Num = table.getn(SP_all)
			
			if counter_p2_1 >= 5 and Check_SP_Num <= 10 then
				Rand_X = Rand(20)
				Rand_Z = Rand(20)
				local snake = star_CreateObj( OwnerID() , 102917 , Rand_X , 20 , Rand_Z , roomid1 , 0) ---丟出爆爆蛇
				BeginPlot(snake,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
				SetPlot(snake , "range" ,"Lau_apon_102917_Bomb_1" , 40)
				table.insert( SP_all , snake )
				table.getn(SP_all)
				counter_p2_1 = 0
			end
					
			if counter_p2_2 >= 7 then
				Luck = Rand( 100 )--雖機出招用
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---單體傷害
					SkillIndex = 1
					Skill_lv_Index = 1
					BossTarget = AttackTarget
					--Say(OwnerID() , "Skill__1")
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE 傷害	
					SkillIndex = 2
					Skill_lv_Index = 1
					BossTarget = OwnerID()	
					--Say(OwnerID() , "Skill__2")
				end		
				--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
				--Yell( OwnerID() , SkillString[SkillIndex] , 5)
				CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
				sleep(10)
				counter_p2_2 = 0
						
			elseif counter_p2_3 >= 9 then 
				Luck = Rand( 100 )--雖機出招用
				if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
					SkillIndex = 3
					Skill_lv_Index = 1
					BossTarget = HateTargetID()
				end	
				local Ball = star_CreateObj( BossTarget , 102924 , 0 , 150 , 0 , roomid1 , 0) ---生出一個特效球
				-------------特效球專用-----------------------------------------------------------------------------------------------------------------
				SetModeEx(Ball , EM_SetModeType_Strikback , false )--反擊
				SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( Ball , EM_SetModeType_Fight, false) ----可砍殺攻擊
				SetModeEx( Ball , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( Ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Ball , EM_SetModeType_Gravity, false) ----重力
				SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
				SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----貼齊表面
				SetModeEx( Ball , EM_SetModeType_Move, false) ----移動
				WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
				WriteRoleValue(Ball, EM_RoleValue_Livetime,5)	
				------------------------------------------------------------------------------------------------------------------------------------------------
				CastSpellLV( Ball , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
				sleep(10)
				counter_p2_3 = 0
			---------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
			end
		elseif HateListCount( OwnerID() ) == 0 then
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0
			
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				if PPL==0 then-----------------------------檢查裡面是否 有沒有人
					sleep(30)
					Delobj(OwnerID())
				
				elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then 
							PPLX=PPLX+1
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
					end
					
					if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
						sleep(30)
						Delobj(OwnerID())
						break
					elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
							SetAttack( OwnerID() , ID_2[i] )
							PPLX = 0
							PPL = 0
						end
					end
				end
			end	
		end
	end
end



function Lua_apon_102918_2() ----分身的死亡劇情
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )---蛇女王的GID
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir )
	
	local SK = star_CreateObj( OwnerID() , 102919 , 0 , 0 , 0 , roomid1 , 0) ---生出一個特效球
	
	-------------特效球專用-----------------------------------------------------------------------------------------------------------------
	SetModeEx(SK , EM_SetModeType_Strikback , false )--反擊
	SetModeEx(SK , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( SK , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( SK , EM_SetModeType_Mark, false) ----標記
	SetModeEx( SK , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( SK , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( SK , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( SK , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( SK , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( SK , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( SK , EM_SetModeType_Move, false) ----移動
	WriteRoleValue( SK , EM_RoleValue_IsWalk , 0 )
	------------------------------------------------------------------------------------------------------------------------------------------------
	WriteRoleValue( SK , EM_RoleValue_PID , Boss )
	--SetPos( SK, X, (Y-40), Z , Dir )
	--CastSpell( SK , SK , 494555)----分身表演爆炸
end

function Lua_apon_102918_3() ----掛在分身生出的特效球上
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir )
	local Dir_Rand = 90
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )---蛇女王的GID
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPos( OwnerID(), X, (Y-51), Z , Dir )
	sleep(10)
	CastSpell( OwnerID() , OwnerID() , 494555)----分身表演爆炸
	sleep(25)
	AddBuff (OwnerID() , 505143 , 0 , 60) ----表演蛇要跑出來時的特效
	local Move_X = {X-100 , X , X+100 , X}
	local Move_Z = {Z , Z+100 , Z , Z-100}
	local Snake_table = {102865,102866,102867,102868} ---四隻分身產生的蛇
	sleep(10) ----加上一個訊息，讓玩家知道蛇要出來了
	for i = 1 , table.getn(Snake_table), 1 do
		local Snake_other = star_CreateObj( OwnerID() , Snake_table[i] , 0 , 51 , 0 , roomid1 , Dir_Rand*i) ---生出四條蛇
		SetModeEx(Snake_other , EM_SetModeType_Strikback , false )--反擊
		SetModeEx(Snake_other , EM_SetModeType_Searchenemy , false )--索敵 
		MoveToFlagEnabled(Snake_other, false )
		WriteRoleValue( Snake_other , EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( Snake_other , EM_RoleValue_PID , Boss )
		Move( Snake_other , Move_X[i] , Y , Move_Z[i] )
	end
	sleep(30)
	Delobj(OwnerID())
end

function Lua_apon_102918_A() ----分身小蛇A 
	sleep(25)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_A_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(5)
	end
	CastSpellLV( OwnerID(),Boss ,494557,1)-----四隻蛇各別專用的技能
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_A_dead_1() ----分身小蛇A 
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102920 , 0 , 0 , 0 ,roomid1,0 ) ---生出一個發技能用的特效球
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----可砍殺攻擊
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----將殺死此蛇的玩家的GID 存入此 PID中
	Delobj(OwnerID())
end

function Lua_apon_102918_A_dead_2() ---掛在分身小蛇A 的 施法球上
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494590,1) 
	sleep(10)
	Delobj(OwnerID())
end

function Lua_apon_102918_B() ----分身小蛇B
	sleep(45)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_B_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	CastSpellLV( OwnerID(),Boss ,494558,1)-----四隻蛇各別專用的技能
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_B_dead_1() ----分身小蛇B
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102921 , 0 , 0 , 0 ,roomid1,0 ) ---生出一個發技能用的特效球
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----可砍殺攻擊
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----將殺死此蛇的玩家的GID 存入此 PID中
	Delobj(OwnerID())
end

function Lua_apon_102918_B_dead_2() ---掛在分身小蛇B 的 施法球上
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494591,1)
	sleep(10)
	Delobj(OwnerID())
end

function Lua_apon_102918_C() ----分身小蛇C
	sleep(45)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_C_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	CastSpellLV( OwnerID(),Boss ,494559,1)-----四隻蛇各別專用的技能
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_C_dead_1() ----分身小蛇C
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102922 , 0 , 0 , 0 ,roomid1,0 ) ---生出一個發技能用的特效球
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----可砍殺攻擊
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----將殺死此蛇的玩家的GID 存入此 PID中
	Delobj(OwnerID())
end

function Lua_apon_102918_C_dead_2() ---掛在分身小蛇C 的 施法球上
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494592,1) 
	sleep(10)
	Delobj(OwnerID())
end


function Lua_apon_102918_D() ----分身小蛇D 
	sleep(45)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_D_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	CastSpellLV( OwnerID(),Boss ,494560,1) -----四隻蛇各別專用的技能
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_D_dead_1() ----分身小蛇D
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102923 , 0 , 0 , 0 ,roomid1,0 ) ---生出一個發技能用的特效球
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----可砍殺攻擊
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----將殺死此蛇的玩家的GID 存入此 PID中
	Delobj(OwnerID())
end

function Lua_apon_102918_D_dead_2() ---掛在分身小蛇D 的 施法球上
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494593,1) 
	sleep(10)
	Delobj(OwnerID())
end

