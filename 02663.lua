function CL_Z24_Boss5_SetcollisionPlot()
	SetPlot( OwnerID(), "collision","CL_Z24_Boss5_begin", 50 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
end
function CL_Z24_Boss5_begin()
	local OwnerID =OwnerID()
	local TargetID = TargetID()
	--say ( OwnerID , "go" )
	local RoomID = ReadRoleValue ( TargetID , EM_RoleValue_RoomID )
	if ReadRoleValue ( TargetID , EM_RoleValue_Register9 ) ~= 1 then
		WriteRoleValue( TargetID , EM_RoleValue_Register9 , 1 )
		if ReadRoleValue ( OwnerID , EM_RoleValue_IsPlayer ) == 1 and
			ReadRoleValue ( OwnerID , EM_RoleValue_VOC ) ~= 0 then
			ScriptMessage( OwnerID , -1 , 2 , "[SC_Z24_BOSS5_AI_BEGIN]" , 2 )  ---香緹恩的床邊傳來一陣狂妄的笑聲，在整個臥房內迴盪著
			local ctarlAI = Cl_CreateObj_ForFlag( 106815 , 781024 , 0 , RoomID ) ----產生透明球專用   wdb/dungeon/dgn_bedim.wdb
			
			Addbuff ( ctarlAI , 622496 , 0 , -1 ) ---兔子變大
			CallPlot( ctarlAI , "Cl_Z24_Boss5_ctarlAI" , 0 )
			delobj ( TargetID )
		end
	end
end
function Cl_Z24_Boss5_Choose_Level(Value1,Value2)
	local Npc_Table = {}
	------------------{1=Boss,2=心靈控制球}
	Npc_Table[149] = {106814,106827} ---正常版
	Npc_Table[150] = {106816,106627}---簡易版
	Npc_Table[937] = {106814,106827}---測試區
	----------------------------
	local SkillLv = {}
	if Value1 == nil then
		if Value2 == nil then
			return Npc_Table
		elseif Value2 ~= nil then
			return Npc_Table[Value2]
		end
	elseif Value1 == 149 then  ----------------------------------正常版
		SkillLv[499313] = 0 ---單體
		SkillLv[499314] = 0 ---扇形
		SkillLv[499315] = 9 ---遠程單體
		SkillLv[499316] = 0 ---迴旋斬(左)
		SkillLv[499317] = 0 ---迴旋斬(右)
		SkillLv[499318] = 7 ---全場AE
		SkillLv[499319] = 0 ---心靈控制
		SkillLv[499320] = 0 ---變身超級賽亞人
		SkillLv[499322] = 1 ---迴旋斬實際傷害
		if Value2 == nil then
			return SkillLv
		elseif Value2 ~= nil then
			return SkillLv[Value2]
		end
	elseif Value1 == 150 then  ---------------------------------簡易版
		SkillLv[499313] = 0 ---單體
		SkillLv[499314] = 0 ---扇形
		SkillLv[499315] = 2 ---遠程單體
		SkillLv[499316] = 0 ---迴旋斬(左)
		SkillLv[499317] = 0 ---迴旋斬(右)
		SkillLv[499759] = 2 ---全場AE
		SkillLv[499319] = 0 ---心靈控制
		SkillLv[499320] = 0 ---變身超級賽亞人
		SkillLv[499322] = 0 ---迴旋斬實際傷害
		if Value2 == nil then
			return SkillLv
		elseif Value2 ~= nil then
			return SkillLv[Value2]
		end
	elseif Value1 == 937 then  -------------------------------------測試區
		SkillLv[499313] = 0 ---單體
		SkillLv[499314] = 0 ---扇形
		SkillLv[499315] = 0 ---遠程單體
		SkillLv[499316] = 0 ---迴旋斬(左)
		SkillLv[499317] = 0 ---迴旋斬(右)
		SkillLv[499318] = 0 ---全場AE
		SkillLv[499319] = 0 ---心靈控制
		SkillLv[499320] = 0 ---變身超級賽亞人
		SkillLv[499758] = 0 ---迴旋斬實際傷害
		if Value2 == nil then
			return SkillLv
		elseif Value2 ~= nil then
			return SkillLv[Value2]
		end
	end
end
function Cl_Z24_Boss7_Skill_Table(Value)---1=紀錄時間,2=CD時間,3=法術編號,4=施法停留時間,5=字串
	local SkillID = {}
	SkillID["5"] = { 0 , 5 , 499313 , 10 , "[]" } ---單體
	SkillID["5_2"] = { 0 , 5 , 499314 , 20 , "[]" } ---扇形
	SkillID["7"] = { 0 , 7 , 499315 , 20 , "[SC_Z24_BOSS5_AI_SKILL_1]" } ---遠程單體
	SkillID["13"] = { 0 , 13 , 499316 , 20 , "[SC_Z24_BOSS5_AI_SKILL_2]" } ---迴旋斬(左)
	SkillID["13_1"] = { 0 , 13 , 499317 , 20 , "[SC_Z24_BOSS5_AI_SKILL_3]" } ---迴旋斬(右)
	SkillID["13_6"] = { 0 , 13 , 499318 , 50 , "[SC_Z24_BOSS5_AI_SKILL_4]" } ---全場AE
	SkillID["15"] = { 0 , 13 , 499319 , 30 , "[SC_Z24_BOSS5_AI_SKILL_5]" } ---心靈控制
	SkillID["P_3"] = { 0 , 13 , 499320 , 30 , "[SC_Z24_BOSS5_AI_SKILL_6]" } ---變身超級賽亞人
	--SkillID["crazy"] = { 0 , 400 ,"[SC_Z24_BOSS5_AI_CRAZY]"} --狂暴
	if Value == nil then
		return SkillID
	elseif Value ~= nil then
		return SkillID[Value]
	end
end
function Cl_Z24_Boss5_ctarlAI()
	local ctarlAI = OwnerID()
	sleep ( 40 )
	CancelBuff_NoEvent( ctarlAI , 622496 ) ---清除BUFF
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( ctarlAI , EM_RoleValue_ZoneID )
	local Npc_Table = Cl_Z24_Boss5_Choose_Level(nil)
	local Door = 0
	local Close_door = 0
	local Carzy_Time = 480 ---狂暴時間請在這裡設定
	local Carzy_Flag = 0
	local BossNpc = CreateObjByFlag( Npc_Table[ZoneID][1] , 781024 , 0 , 1 )  ------------生出魔術帽
	SetModeEx( BossNpc , EM_SetModeType_Searchenemy, false)--索敵(否)
	WriteRoleValue( BossNpc , EM_RoleValue_PID , ctarlAI )
	AddToPartition( BossNpc , RoomID )
	CallPlot( BossNpc , "cl_Z24_Boss5_Fight" , ZoneID )
	ScriptMessage( ctarlAI , -1 , 2 , "[SC_Z24_BOSS5_AI_BEGIN_2]" , 2 )  ---經過了漫長的等待，終於有人穿越這個該死的結界，只要控制你們，那麼我就能離開這裡！
	sleep ( 20 )
	SetPosByFlag( ctarlAI , 781024 , 3 )
	SetModeEx( BossNpc , EM_SetModeType_Searchenemy, true )--索敵(否)
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) ~= 4 do
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			if Close_door == 0 then
				Door = Cl_CreateObj_ForFlag( 106832 , 781024 , 11 , RoomID ) ----產生透明球專用
				SetModeEx ( Door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				Close_door = 1
			end
			Carzy_Time = Carzy_Time - 1
			if Carzy_Flag == 0 and Carzy_Time <= 0 then
				if ZoneID == 149 then
					ScriptMessage( BossNpc , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_6]" , 2 )
					addbuff( BossNpc , 623667 , 0 , -1 )
				end	
				Carzy_Flag = 1
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 2 then
			Carzy_Flag = 0
			delobj ( Door )
			WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 4 )
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 3 then
			delobj ( BossNpc )
			delobj ( Door )
			Close_door = 0
			Carzy_Flag = 0
			sleep ( 30 )
			Carzy_Time = 480
			BossNpc = CreateObjByFlag( Npc_Table[ZoneID][1] , 781024 , 0 , 1 )  ------------生出魔術帽
			WriteRoleValue( BossNpc , EM_RoleValue_PID , ctarlAI )
			AddToPartition( BossNpc , RoomID )
			CallPlot( BossNpc , "cl_Z24_Boss5_Fight" , ZoneID )
			WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 0 )
		end
		sleep ( 10 )
	end
end
--Boss   Register1=迴旋斬目標1  Register2=迴旋斬目標2  Register3=傳送旗標記錄
function cl_Z24_Boss5_Fight(ZoneID)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local skill_table = Cl_Z24_Boss7_Skill_Table(nil)
	local skillLV = Cl_Z24_Boss5_Choose_Level(ZoneID)
	local AttackTarget = 0
	local CombatBegin = 0
	local Rand_Skill = 0
	local DisPlay = {}
	local SkillTarget = {}
	local TargetNum = 0
	local Ball_Obj = 0
	local Play_Table = {}
	local OverSkill_Time = 0
	local OverSkill_Flag = 0
	SetPlot( Boss, "dead","cl_Z24_Boss5_dead", 0 ) ---塞入BOSS的戰鬥給他
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( Boss , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local HPPercent = ( bosshp / MaxHP )*100
	local OverBuff = 0
	local CtarlPlay = 0
	local Play_X , Play_Y , Play_Z = 0
	local CtarlBall = 0
	WriteRoleValue( Boss , EM_RoleValue_Register3 , 0 )
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( Boss ) ~= 0 then ---
			if CombatBegin == 0 then   -----
				CombatBegin = 1
				Play_Table = Cl_Z24_Boss5_BeginFight(RoomID)
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_FIGHT]" , 2 )  ---我要開始大快朵頤，先一點一滴的啃食掉你們身上流動的時間！
				WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 1 )
			end
			if CombatBegin == 1 then
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = skill_table[num][1] + 1
				end
				MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
				bosshp = ReadRoleValue( Boss , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
				HPPercent = ( bosshp / MaxHP )*100
				if skill_table["5"][1] >= skill_table["5"][2] then
					cl_chack_CastSpell()
					Rand_Skill = DW_Rand(80)
					if ( Rand_Skill >= 1 and Rand_Skill <= 20) or( Rand_Skill >=41 and Rand_Skill <= 60 ) then
						CastSpelllv ( Boss , AttackTarget , skill_table["5"][3] , skillLV[skill_table["5"][3]] )
						sleep ( skill_table["5"][4] )
					elseif ( Rand_Skill >= 21 and Rand_Skill <= 40 ) or( Rand_Skill >= 61 and Rand_Skill <= 80 ) then
						
						CastSpelllv ( Boss , Boss , skill_table["5_2"][3] , skillLV[skill_table["5_2"][3]] )
						sleep ( skill_table["5_2"][4] )
					end
					skill_table["5"][1] = 0
				end
				if skill_table["7"][1] >= skill_table["7"][2] then
					cl_chack_CastSpell()
					ScriptMessage( Boss , -1 , 2 , skill_table["7"][5] , 2 )  ---先來試試看你們的意志夠不夠堅定！
					DisPlay = KS_GetHateList( Boss , 2 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM)
					CastSpelllv ( Boss , DisPlay[1] , skill_table["7"][3] , skillLV[skill_table["7"][3]] )
					sleep ( skill_table["7"][4] )
					skill_table["7"][1] = 0
				end
				if skill_table["13"][1] >= skill_table["13"][2] then
					ScriptMessage( Boss , -1 , 2 , skill_table["13"][5] , 2 )  ---先來試試看你們的意志夠不夠堅定！
					cl_chack_CastSpell()
					OverSkill_Flag = 0
					SkillTarget = CL_Z24_Boss5_TargetTable()
					if(SkillTarget==nil)or(#SkillTarget==0)then
						table.insert( SkillTarget , AttackTarget )
					end
					TargetNum = table.getn( SkillTarget )
					if(TargetNum==nil)or(TargetNum==0)then
						table.insert( SkillTarget , AttackTarget )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
						TargetNum = table.getn( SkillTarget )
					end
					SetModeEx( Boss , EM_SetModeType_Move , false ) ---移動	(否)
					PlayMotionEX( Boss, ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_MIME_IDLE_SIT )
					sleep ( 10 )
					SetIdleMotion( Boss ,  ruFUSION_MIME_IDLE_SIT)--------保持地下模式
					Ball_Obj = CL_Z24_Boss5_SkillTarget_Obj( 106817 , SkillTarget[1] , Play_Table , 20 , 90 )
					CastSpelllv ( Boss , Ball_Obj , skill_table["13"][3] , 0 )
					addbuff(SkillTarget[1],623796,0,5)
						--say(Boss,"playball1 = "..Getname(SkillTarget[1]))
					sleep ( 5 )	
					ScriptMessage( Boss , -1 , 2 , skill_table["13_1"][5] , 2 )  ---先來試試看你們的意志夠不夠堅定！
					Ball_Obj = CL_Z24_Boss5_SkillTarget_Obj( 106817 , SkillTarget[TargetNum] , Play_Table , 10 , -90 )
					sysCastSpelllv ( Boss , Ball_Obj , skill_table["13_1"][3] , 0 )
					addbuff(SkillTarget[TargetNum],623796,0,5)
						--say(Boss,"playball2 = "..Getname(SkillTarget[TargetNum]))
					SetIdleMotion( Boss ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
					sleep ( 15 )
					--ScriptMessage( Boss , -1 , 2 , skill_table["13_1"][5] , 2 )  ---先來試試看你們的意志夠不夠堅定！
					--Ball_Obj = CL_Z24_Boss5_SkillTarget_Obj( 106817 , SkillTarget[TargetNum] , Play_Table , 10 )
					--CastSpelllv ( Boss , Ball_Obj , skill_table["13_1"][3] , 0 )
					--	say(Boss,"playball2 = "..Getname(SkillTarget[TargetNum]))
					sleep ( 10 )	 
					SetModeEx( Boss , EM_SetModeType_Move , true ) ---移動	(否)
					SkillTarget = {}
					skill_table["13"][1] = 0
					TargetNum = 0
					OverSkill_Flag = 1
				end
				--if skill_table["crazy"][1] >= skill_table["crazy"][2] then  --狂暴
					--ScriptMessage( Boss , -1 , 2 , skill_table["crazy"][3] , 2 )
					--addbuff(boss,623667,0,-1)
				--end
				if OverSkill_Flag == 1 then
					OverSkill_Time = OverSkill_Time + 1
					if OverSkill_Time >= 6 then
						ScriptMessage( Boss , -1 , 2 , skill_table["13_6"][5] , 2 )  ---先來試試看你們的意志夠不夠堅定！
						SetModeEx( Boss , EM_SetModeType_Move , false ) ---移動	(否)
						sleep ( 10 )
						PlayMotionex ( Boss , ruFUSION_MIME_SLEEP_DOWN , ruFUSION_MIME_SLEEP_LOOP )---------------第1ㄍ動作
						sleep ( 7 )
						SetIdleMotion( Boss ,ruFUSION_MIME_SLEEP_LOOP )----------------------維持動作
						CastSpelllv ( Boss , Boss , skill_table["13_6"][3] , skillLV[skill_table["13_6"][3]] )
						cl_chack_CastSpell()
						PlayMotion ( Boss , ruFUSION_MIME_SLEEP_UP )
						sleep ( 5 )
						SetIdleMotion( Boss ,ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作
						SetModeEx( Boss , EM_SetModeType_Move , true ) ---移動	(否)
						skill_table["13_6"][1] = 0
						OverSkill_Time = 0
						OverSkill_Flag = 0
					end
				end
				if HPPercent >= 20 and HPPercent <= 60 then
					if skill_table["15"][1] >= skill_table["15"][2] then
						cl_chack_CastSpell()
						CtarlPlay = Cl_Rand_HateList( 0 , 0 )
						if CtarlPlay == nil then   --避免事nil報錯
							CtarlPlay = 0
						end
						while ReadRoleValue(CtarlPlay,EM_RoleValue_IsPlayer) ~= 1 do
							CtarlPlay = Cl_Rand_HateList( 0 , 0 )
						end
						ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_5][$SETVAR1="..GetName( CtarlPlay ).."]" , 2 )
						CastSpelllv ( Boss , CtarlPlay , skill_table["15"][3] , skillLV[skill_table["15"][3]] )
						sleep ( skill_table["15"][4] )
						sleep ( 10 )
						Cl_Z24_Boss5_CtarBall(CtarlPlay)
						skill_table["15"][1] = 0
					end
				elseif HPPercent <= 19 then
					if OverBuff == 0 then
						cl_chack_CastSpell()
						ScriptMessage( Boss , -1 , 2 , skill_table["P_3"][5] , 2 )  ---先來試試看你們的意志夠不夠堅定！
						CastSpelllv ( Boss , Boss , skill_table["P_3"][3] , skillLV[skill_table["P_3"][3]] )
						sleep ( 10 )
						OverBuff = 1
					end
				end
			end
		elseif HateListCount( Boss ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_FIGHT_END]" , 2 )
				OverBuff = 0
				OverSkill_Flag = 0
				OverSkill_Time = 0
				Play_Table = {}
				CombatBegin = 0
				WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 3 )
			end
		end
	end
end
function cl_Z24_Boss5_dead()
	local Boss = OwnerID()
	sasa_Zone149_title_01()
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_DEAD]" , 2 )
	WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 2 )
end
function CL_Z24_Boss5_TargetTable()
	local New_Table = DW_HateSequence( 0 )
	local New_number = table.getn( New_Table )
	if New_number >= 2 then
		local Hate_Table = DW_HateSequence( 1 )
		local Hate_number = table.getn( Hate_Table )
		local Play_Table = {}
		local PlayNum = 0
		local SkillTarget = {}
		if Hate_number ~= 0 then
			for i = 1 , Hate_number , 1 do
				if ReadRoleValue( Hate_Table[i] , EM_RoleValue_IsPlayer ) ==  1 and
					CheckBuff(Hate_Table[i],622476) ~= true then
					table.insert( Play_Table , Hate_Table[i] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
				end
			end
			PlayNum = table.getn( Play_Table )
			if PlayNum > 2 then
				SkillTarget = Lua_GetFormHate( Play_Table , 2 )
				return SkillTarget
			elseif PlayNum > 0 and PlayNum <= 2 then
				return Play_Table
			end
		elseif Hate_number == 0 or Hate_number == nil then
			return Play_Table
		end
	elseif New_number < 2 then
		return New_Table
	end
end
function CL_Z24_Boss5_SkillTarget_Obj(OrgID,TargetID,Play_Table,SleepLv,BossDis)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	--local Ball = kg_GetPosRX( Boss , OrgID , 65 )
	local x,y,z,dir=DW_Location(Boss)
	x,y,z,dir=DW_NewLocation(60,BossDis,x,y,z,Dir)
	local Ball = CreateObj( OrgID , x , y , z , 0 , 1 )
	SetModeEx( Ball , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Ball , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( Ball , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	AddToPartition( Ball , RoomID )
	WriteRoleValue( Ball , EM_RoleValue_PID , ctarlAI )
	WriteRoleValue( Ball , EM_RoleValue_Register1 , Boss )
	CallPlot( Ball , "cl_Z24_Boss5_Ball" , TargetID,Play_Table,SleepLv )
	return Ball
end
function Cl_Z24_Boss5_Ball(TargetID,Play_Table,SleepLv)
	local Ball_Obj = OwnerID()
	sleep ( SleepLv )
	Addbuff ( Ball_Obj , 622416 , 0 , -1 ) ---兔子變大
	local ctarlAI = ReadRoleValue ( Ball_Obj , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( Ball_Obj , EM_RoleValue_Register1 ) 
	---Cl_Cl_Z24_Boss5_Begin_Move(Boss)
	CallPlot( Ball_Obj , "Cl_Z23_Boss5_ReadAllPlayDis" , Play_Table )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		if CheckID( TargetID ) == true and
			ReadRoleValue( TargetID , EM_RoleValue_IsDead ) ~= 1 then
			Cl_Z24_Boss5_Ball_Move(TargetID)
		else
			local Hate_Table = DW_HateSequence( 1 )
			local Hate_Num = table.getn(Hate_Table)
			if Hate_Num == 0 then
				TargetID = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
			elseif Hate_Num >= 1 then
				local HateRand = DW_Rand(Hate_Num)
				TargetID = Hate_Table[HateRand]
			end
		end
		sleep ( 10 )
	end
	delobj ( Ball_Obj )
end
function Cl_Cl_Z24_Boss5_Begin_Move(Boss)
	local Obj = OwnerID();
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Boss = ReadRoleValue( Obj , EM_RoleValue_Register4 ) --讀取隱藏物件位於哪個Zone
	local Tx = ReadRoleValue( Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Obj, EM_RoleValue_Z );
	local Od = ReadRoleValue( Boss, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( Boss, EM_RoleValue_X );
	local Oz = ReadRoleValue( Boss, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
	MoveToFlagEnabled(Obj, false) ---系統內建的路徑關掉
	WriteRoleValue( Obj ,EM_RoleValue_IsWalk , 0 )
	local deltaDir = (Dir-Od);
	local X , Y , Z = kg_GetPosRX( Boss , nil , 50 , 0 , deltaDir )
	LuaFunc_WaitMoveTo( Obj , X , Y , Z )
end
function Cl_Z24_Boss5_Ball_Move(TargetID)
	local Ball_Obj = OwnerID()
	local RoomID = ReadRoleValue( Ball_Obj , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Tx = ReadRoleValue( Ball_Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Ball_Obj, EM_RoleValue_Z );
	local Od = ReadRoleValue( TargetID, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( TargetID, EM_RoleValue_X );
	local Oz = ReadRoleValue( TargetID, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
	MoveToFlagEnabled(Ball_Obj, false) ---系統內建的路徑關掉
	WriteRoleValue( Ball_Obj ,EM_RoleValue_IsWalk , 0 )
	local deltaDir = (Dir-Od);
	local X , Y , Z = kg_GetPosRX( TargetID , nil , -50 , 0 , deltaDir )
	LuaFunc_WaitMoveTo( Ball_Obj , X , Y , Z )
end
function Cl_Z23_Boss5_ReadAllPlayDis(Play_Table)
	local Ball_Obj = OwnerID()
	local ctarlAI = ReadRoleValue ( Ball_Obj , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( Ball_Obj , EM_RoleValue_Register1 ) 
	local Play_Num = table.getn(Play_Table)
	local PlayDis = 0
	local KillFlag = 0
	local Boss_Dis = 0
	local ZoneID = ReadRoleValue ( Ball_Obj , EM_RoleValue_ZoneID )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		sleep ( 2 )
		Boss_Dis = GetDistance( Ball_Obj , Boss )
		if Boss_Dis <= 50 then
			if Cl_Z24_Boss5_CheckDir(Boss,Ball_Obj) == true then
				SetModeEx( Ball_Obj , EM_SetModeType_Move, false) ---移動	(否)
				MagicInterrupt( Boss )
				sysCastSpelllv ( Ball_Obj , Boss , 499321 , 0 )
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_HIT]" , 2 )
				KillFlag = 1
			elseif Cl_Z24_Boss5_CheckDir(Boss,Ball_Obj) == false then
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_MISS]" , 2 )
				SetPosByFlag( Boss , 781024 , 1 )
				Cl_Z24_Boss5_SetPos(Boss)
			end
		end
		for i = 1 , Play_Num , 1 do
			if ReadRoleValue( Play_Table[i] , EM_RoleValue_IsDead ) ~=  1 then
				PlayDis = GetDistance( Ball_Obj , Play_Table[i] )
				if PlayDis <= 23 then
					SetModeEx( Ball_Obj , EM_SetModeType_Move, false) ---移動	(否)
					sysCastSpelllv ( Ball_Obj , Play_Table[i] , 499322 , Cl_Z24_Boss5_Choose_Level(ZoneID,499322) )
					KillFlag = 1
				end
			end
		end
		if KillFlag == 1 then
			sleep ( 10 )
			delobj ( Ball_Obj )
			KillFlag = 0
		end
	end
end
function Cl_Z24_Boss5_BeginFight(RoomID)
	local OwnerID = OwnerID()
	local Play_Table  = {}
	local PlayNum = SetSearchAllPlayer(RoomID ) -----讀取整個ZONE的所有玩家這裡讀取到的是數量
	for i = 1 , PlayNum , 1 do ---把玩家抓入房間用 讀取到的玩家數量下去決定for迴圈跑幾次
		local Player = GetSearchResult()  ---將掃到ZONE裡的所有玩家依序存入這個暫存器
		if ReadRoleValue( Player, EM_RoleValue_VOC) ~= 0  and  ---是否為GM
			ReadRoleValue( Player , EM_RoleValue_IsPlayer ) ==  1 then
			table.insert( Play_Table , Player )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
		end
	end
	return Play_Table
end
function Cl_Z24_Boss5_CheckDir( Target , OwnerID )
	local Dir = KS_FrontOrBack( Target , OwnerID )
	if Dir >= 0 then
		return false
	elseif Dir < 0 then
		return true
	end
end
function Cl_Z24_Boss5_JobSkill(JobID)
	local JobSkill = {}
	JobSkill[1] = {499331,499332}  --戰士=爆裂旋風.喪膽
	JobSkill[2] = {499333,499334}  --遊俠=疾風箭.後頸攻擊
	JobSkill[3] = {499335,499336}  --影者=影之牢.閃身幻形
	JobSkill[4] = {499337,499338}  --法師=電擊術.雷電風暴
	JobSkill[5] = {499339,499340}  --祭司=治癒術.靈魂湧泉
	JobSkill[6] = {499341,499342}  --騎士=聖之盾.光之鎖鏈
	JobSkill[7] = {499343,499344}  --森牧=放逐.十字斬
	JobSkill[8] = {499345,499346}  --神官=生命綻放.大地湧泉
	JobSkill[9] = {499347,499348}  --靈能=阻禦網.意識斬
	JobSkill[10] = {499349,499350} --工匠=符能牽引.反饋防禦
	if JobID == nil then
		return JobSkil
	elseif JobID ~= nil then
		return JobSkill[JobID]
	end
end
function Cl_Z24_Boss5_JobSkillLv(SkillID)  --nil=仇恨表隨機目標，0=對Boss,1=對自己,2=對座標位置
	local skillLv = {}
	skillLv[499331] = { 16 , 1 }--爆裂旋風      X
	skillLv[499332] = { 12 , nil}--喪膽    
	skillLv[499333] = { 1 , nil}--疾風箭
	skillLv[499334] = { 10 , nil}--後頸攻擊
	skillLv[499335] = { 16 , nil}--影之牢    v
	skillLv[499336] = { 14 , 0}--閃身幻形
	skillLv[499337] = { 4 , 1}--電擊術  v
	skillLv[499338] = { 12 , 2}--雷電風暴   v=
	skillLv[499339] = { 2 , 0}--治癒術
	skillLv[499340] = { 0 , 1}--靈魂湧泉
	skillLv[499341] = { 0 , 0}--聖之盾
	skillLv[499342] = { 16 , nil}--光之鎖鏈
	skillLv[499343] = { 18 , nil}--放逐 v
	skillLv[499344] = { 25 , nil}--十字斬
	skillLv[499345] = { 4 , 0}--生命綻放
	skillLv[499346] = { 17 , 0}--大地湧泉
	skillLv[499347] = { 11 , 0}--阻禦網
	skillLv[499348] = { 3 , nil}--意識斬
	skillLv[499349] = { 1 , nil}--符能牽引
	skillLv[499350] = { 14 , 0}--反饋防禦
	if SkillID == nil then
		return skillLv
	elseif SkillID ~= nil then
		return skillLv[SkillID]
	end
end
function Cl_Z24_Boss5_CtarBall(Target)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	local Npc_Table = Cl_Z24_Boss5_Choose_Level(nil)
	local Play_X , Play_Y , Play_Z = Cl_Read_OwnerXYZ(Target)
	local CtarlBall = CreateObj( Npc_Table[ZoneID][2] , Play_X , Play_Y , Play_Z , 0 , 1 ) ----產生透明球專用
	SetModeEx( CtarlBall , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( CtarlBall , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( CtarlBall , EM_SetModeType_Searchenemy, false)--索敵(否)
	WriteRoleValue( CtarlBall , EM_RoleValue_PID , Boss )
	WriteRoleValue( CtarlBall , EM_RoleValue_Register1 , Target )
	AddToPartition( CtarlBall , RoomID )
	Addbuff (  CtarlBall , 502707 , 0 , -1 ) ---兔子變大
	CallPlot( CtarlBall , "Cl_Z24_Boss5_ctarlPlayer" , 0 )
end
function Cl_Z24_Boss5_ctarlPlayer()
	local CtarBall = OwnerID()
	local RoomID = ReadRoleValue ( CtarBall , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue ( CtarBall , EM_RoleValue_PID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local Target = ReadRoleValue ( CtarBall , EM_RoleValue_Register1 )
	local JobID = ReadRoleValue ( Target , EM_RoleValue_VOC )
	local PlaySkill = Cl_Z24_Boss5_JobSkill(JobID)
	local SkillLV = Cl_Z24_Boss5_JobSkillLv(nil)
	local powerLV = 0
	local skill_Time = 0
	local AttackTarget = 0
	local RandSkill = DW_Rand(2)
	local ctarl_X , ctarl_Y , ctarl_Z = 0
	SetPlot( ctarlAI, "dead","Cl_Z24_Boss5_ctarlDead", 0 ) ---塞入BOSS的戰鬥給他
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
			--say ( Target , "skill_Time="..skill_Time )
			if CheckID( Target ) ~= true then
				delobj ( CtarBall )
			elseif CheckID( Target ) == true then
				if ReadRoleValue ( Target , EM_RoleValue_IsDead ) == 1 then
					delobj ( CtarBall )
				elseif ReadRoleValue ( Target , EM_RoleValue_IsDead ) ~= 1 then
					if CheckBuff ( Target , 622476 ) == true then
						skill_Time = skill_Time + 1
						if skill_Time >= 3 then
							RandSkill = DW_Rand(2)
							if SkillLV[PlaySkill[RandSkill]][2] == nil then
								AttackTarget = Cl_Z24_Boss_RandTarget(Boss,Target)
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "AttackTarget="..Getname(AttackTarget) )
								CastSpelllv ( Target , AttackTarget , PlaySkill[RandSkill] , powerLV )
							elseif SkillLV[PlaySkill[RandSkill]][2] == 0 then
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "AttackTarget="..Getname(Boss) )
								CastSpelllv ( Target , Boss , PlaySkill[RandSkill] , powerLV )
							elseif SkillLV[PlaySkill[RandSkill]][2] == 1 then
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "Target="..Getname(Target) )
								CastSpelllv ( Target , Target , PlaySkill[RandSkill] , powerLV )
							elseif SkillLV[PlaySkill[RandSkill]][2] == 2 then
								AttackTarget = Cl_Z24_Boss_RandTarget(Boss)
								ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(AttackTarget)
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "AttackTarget_______XYZ="..Getname(AttackTarget) )
								CastSpellPos ( Target , ctarl_X , ctarl_Y , ctarl_Z , PlaySkill[RandSkill] , powerLV )
							end
							skill_Time = 0
						end
					elseif CheckBuff ( Target , 622476 ) ~= true then
						delobj ( CtarBall )
					end
				end
		end
		sleep ( 10 )
	end
	delobj ( CtarBall )
end
function Cl_Z24_Boss5_ctarlDead()
	local CtarBall = OwnerID()
	local Target = ReadRoleValue ( CtarBall , EM_RoleValue_Register1 )
	CancelBuff_NoEvent( Target , 622476 ) ---清除BUFF
	delobj ( CtarBall )
end
function Cl_Z24_Boss_RandTarget( ObjID , Target )
	local Hate_Table = Cl_RandTarget_HateList( ObjID )
	local Hate_Num = table.getn(Hate_Table)
	local Player = {}
	for i = 1 , Hate_Num , 1 do
		if Hate_Table[i] ~= Target then
			table.insert( Player , Hate_Table[i] ) 
		end
	end
	local Hate_Num = table.getn(Player)
	local Hate_Rand = DW_Rand(Hate_Num)
	return Player[Hate_Rand]
end
function Cl_Z24_Boss5_SetPos(ObjID)
	local OwnerID = OwnerID()
	if ReadRoleValue( ObjID , EM_RoleValue_Register3 ) == 0 then
		WriteRoleValue( ObjID , EM_RoleValue_Register3 , 1 )
		local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
		local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
		local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(ctarlAI)
		local Rand_X = math.random( -150, 150 )
		local Rand_Z = math.random( -150, 150 )
		local NpcID = CreateObj( 106829 , ctarl_X+Rand_X , ctarl_Y , ctarl_Z+Rand_Z , 0 , 1 )  ------------生出魔術帽
		SetModeEx( NpcID , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( NpcID , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( NpcID , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( NpcID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( NpcID , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
		AddToPartition( NpcID , RoomID )
		Addbuff ( NpcID , 622496 , 0 , -1 ) ---兔子變大
		CallPlot( NpcID , "CL_Z24_Boss5_Show" , ObjID )
	end
end
function CL_Z24_Boss5_Show(NpcID)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	sleep ( 10 )
	local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(OwnerID)
	SetPos( NpcID , ctarl_X , ctarl_Y , ctarl_Z , 0 )
	WriteRoleValue( NpcID , EM_RoleValue_Register3 , 0 )
	sleep ( 10 )
	delobj( OwnerID )
end
function Cl_Z24_Boss5_Job5_Skill499341()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106814 or
		ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106827 then
		return true
	else
		return false
	end
end
function Cl_Z24_Boss5CheckctarlAI()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106827 or
		ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106815 then
		return false
	else
		return true
	end
end