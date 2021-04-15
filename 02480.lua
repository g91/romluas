function cl_21_106082_Setattack() ----不死喀洛恩控制者復活夥伴用
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
	local mostbon = {}
	local most = SearchRangeNPC ( me , 80 )
	local mostno = table.getn(most)
	for i= 1 , mostno , 1 do
		if most[i] ~= nil then
			if ReadRoleValue ( most[i] , EM_RoleValue_IsDead ) == 1 then
				local most_GID = ReadRoleValue ( most[i] , EM_RoleValue_OrgID )
				local X1 = ReadRoleValue ( most[i], EM_RoleValue_X)
				local Y1 = ReadRoleValue ( most[i], EM_RoleValue_Y)
				local Z1 = ReadRoleValue ( most[i], EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
				delobj ( most[i] )
				local Bon = CreateObj( most_GID , X1, Y1 , Z1 , 0 , 1 )  ------------要生出透明求施放範圍100的AE
				AddToPartition( Bon , RoomID )
				SetAttack( Bon , AttackTarget)
			end
		end
	end
end
function cl_21_106082_die() ----不死喀洛恩控制者
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local X1 = ReadRoleValue ( me, EM_RoleValue_X)
	local Y1 = ReadRoleValue ( me, EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( me, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	local ball = CreateObj( 106105 , X1, Y1 , Z1 , 0 , 1 )  ------------要生出透明求施放範圍100的AE
	SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( ball , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( ball , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --存活時間
	AddToPartition(ball , RoomID )
	CastSpelllv ( ball , ball , 497403 , 0 ) --
end
function cl_21_106086Archer() ---不死夏多爾弓箭手AI
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->噬魂血箭
	local skill_time2 = 0 ---->目標鎖定+狙擊
	local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( me ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
				skill_time3 = skill_time3 + 1
				if skill_time1 >= 1 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497591 , 400 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep(10)
					skill_time1 = 0
				end
				if skill_time2 >= 5 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					local hate_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate=table.getn(hate_Table) ----取出仇恨表內的數量
					if hate >= 1 then
						local Rand_Num = DW_Rand(hate)  ----隨機選一個值代表TABLE裡的位置
						if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_IsDead ) ~= 1 then
							CastSpelllv ( me , hate_Table[Rand_Num] , 497589 , 5 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
							sleep ( 10 )
							skill_time2 = 0
						end
					end
				end
				if skill_time3 >= 9 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					local hate_Table_2 = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate_2=table.getn(hate_Table_2) ----取出仇恨表內的數量
					if hate_2 >= 1 then
						local Rand_Num_2 = DW_Rand(hate_2)  ----隨機選一個值代表TABLE裡的位置
						if ReadRoleValue( hate_Table_2[Rand_Num_2] , EM_RoleValue_IsDead ) ~= 1 then
							WriteRoleValue (  me , EM_RoleValue_Register2 , hate_Table_2[Rand_Num_2] )
							addbuff ( hate_Table_2[Rand_Num_2] , 620810 , 0 , 60 )
							CastSpelllv ( me , me , 498480 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
							sleep ( 50 )
							skill_time3 = 0
						end
					end
				end
			end
		elseif HateListCount ( me ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				skill_time3 = 0
			end
		end
	end
end
function cl_21_chek_TargetID()
	local Npc = OwnerID()
	local player = ReadRoleValue ( Npc , EM_RoleValue_Register2 )
	if CheckID( player )  == true and
		ReadRoleValue ( Npc , EM_RoleValue_IsDead ) ~= 1 then
		return true
	else
		return false
	end
end
function cl_21_sysmagic_498255()
	local Npc = OwnerID()
	local player = ReadRoleValue ( Npc , EM_RoleValue_Register2 )
	sysCastSpelllv ( Npc , player , 498255 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
end
function cl_21_106089Fatal() ---不死安格爾致命者
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->噬魂血箭
	local skill_time2 = 0 ---->目標鎖定+狙擊
	local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( me ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
				--skill_time3 = skill_time3 + 1
				if CheckBuff( me , 502717 ) == true then
					CastSpelllv ( me , me , 498260 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep (15)
					CastSpelllv ( me , me , 498259 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 30 )
				end
				if skill_time2 >= 3 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497405 , 400 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep(30)
					skill_time2 = 0
				end
				if skill_time1 >= 13 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( me , me , 498259 , 100 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep(30)
					skill_time1 = 0
				end
			end
		elseif HateListCount ( me ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				skill_time3 = 0
			end
		end
	end
end
function cl_Z21_106097()  ----機關蟲產小怪
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local X1 = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	for i = 1 , 8 , 1 do
		local Bon = CreateObj( 106112 , X1, Y1 , Z1 , 0 , 1 )  ------------要生出透明求施放範圍100的AE
		AddToPartition( Bon , RoomID )
	end
end
function cl_Z21_106112_Del_Owner()  ----機關小蟲沒有目標時刪除自己
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local del_time = 0
	while 1 do
		sleep ( 10 )
		if HateListCount( OwnerID ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			del_time = 0
		elseif HateListCount ( OwnerID ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			del_time = del_time + 1
			if del_time >= 10 then
				DelObj ( OwnerID )
			end
		end
	end
end
function cl_z21_106103_Welcome_AI() -----虛影的觸碰物件
	local AI = OwnerID()
	SetPlot(  AI, "collision","cl_z21_106103_Welcome_range", 50 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
end
function cl_z21_106103_Welcome_range()  ----觸碰物件產生虛影
	local AI = TargetID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_03]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
		sleep ( 10 )
		local No_face = CreateObjByFlag( 106103 ,781012 ,0 , 0 ) --i = 旗標編號  
		SetModeEx( No_face,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
		SetModeEx( No_face,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
		SetModeEx( No_face,EM_SetModeType_NotShowHPMP, false)--不顯示血條
		SetModeEx( No_face,EM_SetModeType_Strikback, false)--反擊
		SetModeEx( No_face,EM_SetModeType_Move, true)--移動
		SetModeEx( No_face,EM_SetModeType_Fight, false)--可砍殺攻擊
		SetModeEx( No_face,EM_SetModeType_Searchenemy, false)--搜尋敵人
		SetModeEx( No_face,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
		AddToPartition( No_face, RoomID)
		say ( No_face , "[SC_ZONE21_L_MTS_04]")
		BeginPlot( No_face ,"cl_z21_106103_No_face" , 0) --掛走旗標+撞到人的判斷
		DelObj ( AI )
	end
end
function cl_z21_106103_No_face() ----虛影衝過去嚇玩家，並且消失
	local No_face = OwnerID()
	local RoomID = ReadRoleValue ( No_face , EM_RoleValue_RoomID )
	MoveToFlagEnabled(No_face, false) ---系統內建的路徑關掉
	WriteRoleValue( No_face , EM_RoleValue_IsWalk, 0 )
	Hide(No_face)
	Show(No_face,RoomID)
	DW_MoveToFlag( No_face , 781012 , 1 , 0 ) ----隨機Rand旗子走路
	sysCastSpelllv ( No_face , No_face , 498288 , 0 ) 
	sleep ( 10 )
	ScriptMessage( No_face , -1 , 2 ,"[SC_ZONE21_L_MTS_05]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
	DelObj( No_face )
end
function cl_z21_106103_AI_1() ----虛影觸碰物件==P-2
	local AI = OwnerID()
	SetPlot(  AI, "collision","cl_z21_106103_Welcome_range_1", 50 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
end
function cl_z21_106103_Welcome_range_1()  ----虛影觸碰劇情
	local AI = TargetID()
	local play = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	if ReadRoleValue( play , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_06]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
		local No_face = CreateObjByFlag( 106103 ,781012 , 2 , 0 ) --i = 旗標編號  
		SetModeEx( No_face,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
		SetModeEx( No_face,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
		SetModeEx( No_face,EM_SetModeType_NotShowHPMP, false)--不顯示血條
		SetModeEx( No_face,EM_SetModeType_Strikback, false)--反擊
		SetModeEx( No_face,EM_SetModeType_Move, true)--移動
		SetModeEx( No_face,EM_SetModeType_Fight, false)--可砍殺攻擊
		SetModeEx( No_face,EM_SetModeType_Searchenemy, false)--搜尋敵人
		SetModeEx( No_face,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
		WriteRoleValue ( No_face , EM_RoleValue_Register5 , play )
		AddToPartition( No_face, RoomID)
		BeginPlot( No_face ,"cl_z21_106103_No_face_1" , 0) --掛走旗標+撞到人的判斷
		DelObj ( AI )
	end
end
function cl_z21_106103_No_face_1() ----虛影衝過去嚇玩家，並且消失
	local No_face = OwnerID()
	local RoomID = ReadRoleValue ( No_face , EM_RoleValue_RoomID )
	local play = ReadRoleValue ( No_face , EM_RoleValue_Register5 )
	say ( No_face , "[SC_ZONE21_L_MTS_01]")
	sleep ( 10 )
	CastSpelllv ( No_face , No_face , 498367 , 0 )
	sleep ( 10 )
	local BALL = CreateObjByFlag( 105387 ,781012 , 3 , 0 ) --i = 旗標編號  
	SetModeEx( BALL,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx( BALL,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx( BALL,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx( BALL,EM_SetModeType_Strikback, false)--反擊
	SetModeEx( BALL,EM_SetModeType_Move, false)--移動
	SetModeEx( BALL,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx( BALL,EM_SetModeType_Searchenemy, false)--搜尋敵人
	SetModeEx( BALL,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
	AddToPartition( BALL, RoomID)
	CastSpelllv ( BALL , BALL , 496764 , 0 )
	sleep ( 30 )
	local No_face_CALLmt = CreateObjByFlag( 106095 ,781012 , 3 , 0 ) --i = 旗標編號  
	AddToPartition( No_face_CALLmt, RoomID)
	sleep ( 10 )
	SetAttack( No_face_CALLmt , play)
	say ( No_face , "[SC_ZONE21_L_MTS_02]")
	sleep ( 10 )
	DelObj ( BALL )
	DelObj ( No_face )
end
function cl_z21_106103_AI_2()  ----虛影嚇人P-3
	local AI = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	local open_door = 0
	SetPlot(  AI, "collision","cl_z21_106103_Welcome_range_2", 50 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	local door = CreateObjByFlag( 106197 , 781012 , 4 , 1 ) ------------產生後門
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door,RoomID ) ----物件加入場景,例行公事
	SetIdleMotion( door , ruFUSION_MIME_IDLE_STAND)
	WriteRoleValue ( door , EM_RoleValue_Register1 , AI )
	while 1 do
		sleep ( 10 )
		if ReadRoleValue ( AI , EM_RoleValue_Register2 ) == 1 then
			if open_door == 0 then
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
				SetModeEx ( door , EM_SetModeType_Obstruct, false ) 		---阻擋(是)
				sleep ( 10 )
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------維持動作
				open_door = 1
			end
			sleep ( 50 )
			DelObj ( door )
			DelObj ( AI )
		end
		local fight = ReadRoleValue ( AI , EM_RoleValue_Register4 )
		if fight == 1 then
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
			WriteRoleValue ( AI , EM_RoleValue_Register4 , 0 )
		end
	end
end
function cl_z21_106103_Welcome_range_2()
	local AI = TargetID()
	local play = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	local open = ReadRoleValue ( AI , EM_RoleValue_Register1 )
	local boss_rand = 0
	if open ~= 1 then
		if ReadRoleValue( play , EM_RoleValue_VOC ) ~= 0 then
			ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_08]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
			sleep ( 20 )
			ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_07]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
			sleep ( 10 )
			boss_rand = DW_Rand(3)
		--	say ( play , "boss_rand="..boss_rand)
			for i = 1 , 3 , 1 do
				local No_face = CreateObjByFlag( 106103 ,781012 , i+4 , 0 ) --i = 旗標編號
				AddToPartition( No_face, RoomID)
				if i == boss_rand then
					WriteRoleValue ( No_face , EM_RoleValue_Register1 , 1 )
				end
				SetAttack( No_face , play )
				WriteRoleValue ( No_face , EM_RoleValue_Register3 , AI )
				BeginPlot( No_face ,"cl_z21_106103_No_face_2_yes" , 0) --
				sleep ( 2 )
			end
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 )
		end
	end
end
function cl_z21_106103_No_face_2_yes()
	local No_face = OwnerID()
	local AI = ReadRoleValue ( No_face , EM_RoleValue_Register3 )
	local boss_NOB = ReadRoleValue ( No_face , EM_RoleValue_Register1 )
	local del_time = 0
	SetPlot(  No_face, "dead","cl_z21_106103_dead_2", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
		sleep ( 10 )
		if boss_NOB ~= 1 then
			if ReadRoleValue ( AI , EM_RoleValue_Register2 ) == 1 then
				DelObj ( No_face )
			end
		end
		if HateListCount( No_face ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
		elseif HateListCount( No_face ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			del_time = del_time + 1
			if del_time >= 10 then
				WriteRoleValue ( AI , EM_RoleValue_Register4 , 1 )
				DelObj ( No_face )
			end
		end
	end
end
function cl_z21_106103_dead_2()
	local No_face = OwnerID()
	local AI = ReadRoleValue ( No_face , EM_RoleValue_Register3 )
	local RoomID = ReadRoleValue ( No_face , EM_RoleValue_RoomID )
	local boss_NOB = ReadRoleValue ( No_face , EM_RoleValue_Register1 )
	if boss_NOB == 1 then
		WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
		sleep ( 10 )
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_09]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
		DelObj ( No_face )
	elseif boss_NOB ~= 1 then
		local X1 = ReadRoleValue ( No_face, EM_RoleValue_X)
		local Y1 = ReadRoleValue ( No_face, EM_RoleValue_Y)
		local Z1 = ReadRoleValue ( No_face, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
		local boss = CreateObj( 106103 , X1, Y1 , Z1 , 0 , 1 )  ------------要生出透明求施放範圍100的AE
		WriteRoleValue ( boss , EM_RoleValue_Register3 , AI )
		WriteRoleValue( boss , EM_RoleValue_Register1 , boss_NOB )
		AddToPartition( boss, RoomID)
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_10]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
		BeginPlot( boss ,"cl_z21_106103_No_face_2_yes" , 0) --掛走旗標+撞到人的判斷
		DelObj ( No_face )
	end
end
function cl_z21_EyeBall()  ----淫蕩眼魔的淫穢招式
	local Eyeball = OwnerID()
	local CombatBegin = 0
	local skill_time1 = 7
	local fighl_go = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( Eyeball , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( Eyeball ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				if fighl_go == 0 then
					CastSpelllv ( Eyeball , AttackTarget , 497585 , 100 )
					sleep ( 10 )
					fighl_go = 1
				end
				skill_time1 = skill_time1 + 1
				if skill_time1 >= 6 then
					CastSpelllv ( Eyeball , AttackTarget , 498261 , 100 )
				end
				if skill_time1 >= 13 then
					while 	ReadRoleValue( Eyeball , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					Addbuff ( Eyeball , 620862 , 0 , -1 )
					local hate_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate=table.getn(hate_Table) ----取出仇恨表內的數量
					local Rand_Num = DW_Rand(hate)  ----隨機選一個值代表TABLE裡的位置
					local X1 = ReadRoleValue ( Eyeball, EM_RoleValue_X)
					local Y1 = ReadRoleValue ( Eyeball, EM_RoleValue_Y)
					local Z1 = ReadRoleValue ( Eyeball, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
					Addbuff ( hate_Table[Rand_Num] , 620866 , 0 , -1 )
					sysCastSpelllv ( Eyeball , hate_Table[Rand_Num] , 490344 , 0 )
					sleep ( 5 )
					CastSpelllv ( Eyeball , hate_Table[Rand_Num] , 498291 , 0 )
					sleep ( 110 )
					skill_time1 = 0
				end
			end
		elseif HateListCount ( Eyeball ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill_time1 = 0
				fighl_go = 0
			end
		end
	end
end
function cl_z21_eyeball_Slip() ------
	local player = OwnerID()
	local Slip_Number = 0
	Slip_Number = DW_Rand(100)
	if ( Slip_Number >= 1 and Slip_Number <= 10) or( Slip_Number >=21 and Slip_Number <= 30 ) or
	   ( Slip_Number >= 41 and Slip_Number <= 50 ) or ( Slip_Number >= 61 and Slip_Number <= 70 ) or
	   ( Slip_Number >= 81 and Slip_Number <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
	   Addbuff ( player , 509284 , 0 , 1 )
	end
end
function cl_z21_106099_EyeBall()---眼魔一直施放隱形
	local eyesball = OwnerID()
	while 1 do
		sleep ( 10 )
		if CheckBuff( eyesball , 620868 ) ~= true then
			Addbuff ( eyesball , 620868 , 0 , 30 )
		end
	end
end
function cl_Z21_106099_SHOW_HIDE() ----法術檢查身上有沒有BUFF
	if CheckBuff( TargetID() , 620868 ) == true then
		return true
	elseif CheckBuff( TargetID() , 620868 ) ~= true then
		return false
	end
end
-----------------------巡邏用
function cl_Z21_05_06() --5~6.7王中間巡邏
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106095,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106088,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106086,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106087,Matrix,3,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(106080,Matrix,5,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(106080,Matrix,5,1)
	--ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark05_06" , 0 )
end
function cl_z21_wark05_06()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_05_06" , 0 )
end
function cl_Z21_05_06_NO2() --5~6.7王中間巡邏
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106095,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106095,Matrix,1,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106088,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106086,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106087,Matrix,3,1)
	--ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,-1)
	--ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,1)
	--ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark05_06_NO2" , 0 )
end
function cl_z21_wark05_06_NO2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_05_06_NO2" , 0 )
end
function cl_Z21_04_05_NO2() --5~6.7王中間巡邏
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,-1)
	BeginPlot( ObjMatrix[1] , "LuaS_Discowood_NowToHide" , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,1)
	BeginPlot( ObjMatrix[2] , "LuaS_Discowood_NowToHide" , 0 )
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark04_05_NO2" , 0 )
end
function cl_z21_wark04_05_NO2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_04_05_NO2" , 0 )
end
function cl_z21_skillchack_HPfull()---噬魂血箭確認HP是否已滿裝態
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )		--讀取BOSS總血量
	local NowHP = ReadRoleValue( TargetID , EM_RoleValue_HP )	
	local HPPercent = ( NowHP / MaxHP )*100	
	if HPPercent > 98 then
		return false
	elseif HPPercent < 97 then
		return true
	end
end