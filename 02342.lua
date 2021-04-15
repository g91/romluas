function cl_136_105305_N()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local cordnumber = 0
	cordnumber = DW_Rand(10)
	local cord = CreateObjByFlag( 118139 , 780873 , 0 , 1 )  ---神秘儀器
	SetModeEx( cord , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( cord , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( cord , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( cord , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( cord , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( cord , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( cord , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	AddToPartition ( cord , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( cord , EM_RoleValue_PID, OwnerID() )
	WriteRoleValue ( cord , EM_RoleValue_Register1 ,cordnumber)
	BeginPlot( cord,"cl_givekeyitem03_N", 0 )
	local lmst = CreateObjByFlag( 105623 , 780873 , 2 , 1 )  ---生出小王
	AddToPartition ( lmst , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( lmst , EM_RoleValue_PID, OwnerID() )
	WriteRoleValue ( lmst , EM_RoleValue_Register1 ,cordnumber )
	BeginPlot( lmst,"cl_105307lmst_N", 0 )
	local door = CreateObjByFlag( 105306 , 780873 , 1 , 1 )  ---神秘儀器
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( door , EM_RoleValue_PID, OwnerID() )
	WriteRoleValue ( door , EM_RoleValue_Register1 ,cordnumber)
	WriteRoleValue ( cord , EM_RoleValue_Register4 ,door)
end
function cl_105307lmst_N()
	local lmst = OwnerID()
	local RoomID = ReadRoleValue( lmst , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local cordnumber = ReadRoleValue ( lmst , EM_RoleValue_Register1 )
	SetPlot( lmst, "dead","cl_136_105307_dead_N", 0 ) --boss執行死亡劇情,將直傳回給中控器判斷階段
end
function cl_136_105307_dead_N()
	local lmst = OwnerID()
	local RoomID = ReadRoleValue( lmst , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local cordnumber = ReadRoleValue ( lmst , EM_RoleValue_Register1 )
	local hp = ReadRoleValue( lmst , EM_RoleValue_HP )
	local x = ReadRoleValue ( lmst, EM_RoleValue_X)
	local y = ReadRoleValue ( lmst, EM_RoleValue_Y)
	local z = ReadRoleValue ( lmst, EM_RoleValue_Z)
	local lmstnpc = CreateObj ( 117549 , x , y , z , 0 , 1) --隨機字身周圍生怪
	SetModeEx( lmstnpc , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( lmstnpc , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( lmstnpc , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( lmstnpc , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( lmstnpc , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( lmstnpc , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	SetModeEx( lmstnpc , EM_SetModeType_Fight, false) ---可砍殺(是)
	AddToPartition ( lmstnpc , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( lmstnpc , EM_RoleValue_Register1 ,cordnumber )
	WriteRoleValue ( lmstnpc , EM_RoleValue_HP , hp )
	BeginPlot( lmstnpc,"LuaP_Dead",0)
	Addbuff (  lmstnpc , 508120 , 0 ,-1 ) ---
	SetPlot( lmstnpc, "touch","cl_117549_touch_N", 20 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	delobj ( lmst )
end
function cl_117549_touch_N()
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	if	BeginCastBarEvent( player , headgear , "[SC_CORDLOAD_01]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_giveitem_N") ~=1	then
		ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end
function cl_136_giveitem_N(Executer,Result) ---嘗試著抓取兔子
	if	Result > 0 then --成功狀態
		EndCastBar(Executer,Result)--清除施法條
		BeginPlot( TargetID() , "cl_117549_N" , 0)
	else --失敗狀態
		EndCastBar(Executer,Result)--清除施法條
	end
end
function cl_117549_N()
	local cordnumber = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local cordcar = { 209105 , 209106 , 209107 , 209108 , 209109 ,
	209110 , 209111 , 209112 , 209113 , 209114 }
	GiveBodyItem ( TargetID(), cordcar[cordnumber], 1 )
	sleep ( 10 )
	delobj ( OwnerID() )
end
---------------------密碼輸入葉面------------
function cl_talk_cord_N()
	local Obj = OwnerID()
	local Target = TargetID()
	local cordnumber = ReadRoleValue( Target , EM_RoleValue_Register1 )
	local nocordnumber = ReadRoleValue ( Target , EM_RoleValue_Register9 )
	local keyitem = ReadRoleValue ( Target , EM_RoleValue_Register8 )
	local door = ReadRoleValue( Target , EM_RoleValue_Register4 )
	local cordcar = { 209105 , 209106 , 209107 , 209108 , 209109 , 209110 , 209111 , 209112 , 209113 , 209114 }
	local cordcarII = { 209125 , 209126 , 209127 , 209128 , 209129 , 209140 , 209141 , 209142 , 209143 , 209144 }
	if ReadRoleValue ( Obj , EM_RoleValue_VOC ) ~= 0 then
		if	CountBodyItem(Obj,cordcar[cordnumber]) == 0	and CountBodyItem(Obj,cordcarII[cordnumber]) == 0 then
			LoadQuestOption( Obj )
			return
		elseif CountBodyItem(Obj,cordcar[cordnumber]) ~= 0 or CountBodyItem(Obj,cordcarII[cordnumber]) ~= 0 then
			if	ReadRoleValue(Target,EM_RoleValue_Register2) == 0 then
				SetSpeakDetail(Obj,GetString("SC_CORDNOC_12"))
			else
				if	ReadRoleValue(Target,EM_RoleValue_Register2) == 1 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_01"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 2 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_02"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 3 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_03"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 4 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_04"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 5 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_05"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 6 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_06"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 7 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_07"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 8 then
					SetSpeakDetail(Obj,GetString("SC_CORDNOC_08"))
				elseif ReadRoleValue(Target,EM_RoleValue_Register2) == 9 then-----
					DelBodyItem( Obj, cordcar[cordnumber], 1 )
					DelBodyItem( Obj, cordcarII[cordnumber], 1 )
					ScriptMessage( Obj , -1 , 2 ,"[SC_CORDNOC_11]" , 2 )
					delobj ( door )
					cl_clasetalk()
					if keyitem == 0 then
						if CountBodyItem ( Obj, 530672 ) == 0 then
							GiveBodyItem ( Obj, 530672, 1 )
						end
					end
					return
				end
			end
			AddSpeakOption( Obj,Target, "[SC_CORD_00]", "cl_chitem_talk_0_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_01]", "cl_chitem_talk_1_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_02]", "cl_chitem_talk_2_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_03]", "cl_chitem_talk_3_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_04]", "cl_chitem_talk_4_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_05]", "cl_chitem_talk_5_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_06]", "cl_chitem_talk_6_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_07]", "cl_chitem_talk_7_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_08]", "cl_chitem_talk_8_N", 0 )
			AddSpeakOption( Obj,Target, "[SC_CORD_09]", "cl_chitem_talk_9_N", 0 )
		end
	elseif ReadRoleValue ( Obj , EM_RoleValue_VOC ) == 0 then
		LoadQuestOption( Obj )
		AddSpeakOption( Obj,Target, "[SC_CORD_000]", "cl_chitem_talk_GM_N", 0 )----給GM迅速測試用
	end
end
function cl_clasetalk_N()
	if ReadRoleValue(TargetID(),EM_RoleValue_Register2) == 9 then-----
		CloseSpeak( OwnerID() )
	end
end
function cl_chitem_cord_N()
	local Obj = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID )
	local TableNumber = ReadRoleValue(Target,EM_RoleValue_Register1)
	local InputNumber = ReadRoleValue(Target,EM_RoleValue_Register2)+1
	local nocordnumber = ReadRoleValue ( Target , EM_RoleValue_Register9 )
	local keyitem = ReadRoleValue ( Target , EM_RoleValue_Register8 )
	local Input = ReadRoleValue(Target,EM_RoleValue_Register3)
	local RightCode = {	{1 ,7 ,2 ,9 ,3 ,2 ,4 ,5 ,1},
						{2 ,2 ,8 ,5 ,6, 7, 3, 2, 6},
						{7 ,7 ,3, 4, 9, 5, 3, 1, 0},
						{4 ,9 ,3, 4, 9, 7, 3, 8, 7},
						{5 ,1 ,5 ,7 ,5 ,4 ,5, 4 ,3},
						{5 ,3 ,4 ,3, 5, 6 ,1, 2, 3},
						{7 ,1 ,6 ,6 ,4 ,9, 7, 6 ,5},
						{6 ,3 ,7 ,5 ,2 ,2 ,3, 8 ,8},
						{7 ,8 ,9 ,9 ,3 ,5 ,6 ,9, 9},
						{9, 4 ,3, 6 ,7 ,1, 9 ,0, 0}}
	if	Input == RightCode[TableNumber][InputNumber]then
		if	InputNumber <= 9 then
			WriteRoleValue(Target,EM_RoleValue_Register2,InputNumber)
			ScriptMessage( Obj , -1 , 2 ,"[SC_CORDNOC_09]" , 2 )
		end
		cl_talk_cord()
	else
		CloseSpeak( Obj )
		ScriptMessage( Obj , -1 , 2 ,"[SC_CORDNOC_10]" , 2 )
		local door = CreateObjByFlag( 105308 , 780873 , 3 , 1 )  ---神秘儀器
		SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( door , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
		AddToPartition ( door , RoomID ) ----物件加入場景,例行公事
		WriteRoleValue ( door , EM_RoleValue_PID, Target )
		WriteRoleValue ( door , EM_RoleValue_Register1 , Obj )
		BeginPlot( door,"cl_105308_N", 0 )
		WriteRoleValue ( door , EM_RoleValue_Livetime , 5 )
		WriteRoleValue ( Target , EM_RoleValue_Register9 , nocordnumber+1 )
		if nocordnumber >= 9 then
			CloseSpeak( Obj )
			ScriptMessage( Obj , -1 , 2 ,"[SC_CORDNOC_10]" , 2 )
			local door = CreateObjByFlag( 105308 , 780873 , 3 , 1 )  ---神秘儀器
			SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
			SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( door , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
			AddToPartition ( door , RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( door , EM_RoleValue_PID, Target )
			WriteRoleValue ( door , EM_RoleValue_Register1 , Obj )
			BeginPlot( door,"cl_105308_big_N", 0 )
			WriteRoleValue ( door , EM_RoleValue_Livetime , 5 )
			WriteRoleValue ( Target , EM_RoleValue_Register9 , 0 )
		end
		WriteRoleValue ( Target , EM_RoleValue_Register8 , keyitem+1 )
	end
end
function cl_105308_N()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local play = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local joker = 0
	local big_joker = 0
	joker = CreateObjByFlag( 105596 , 780873 , 3 , 1 )  ---神秘儀器
	AddToPartition ( joker , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( joker , EM_RoleValue_Register1 , play )
	big_joker = CreateObjByFlag( 105597 , 780873 , 3 , 1 )  ---神秘儀器
	AddToPartition ( big_joker , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( big_joker , EM_RoleValue_Register1 , play )
	BeginPlot( big_joker,"cl_136_joker_N", 0 )
	sleep ( 1 )
	BeginPlot( joker,"cl_136_joker_N", 0 )
	sleep ( 1 )
end
function cl_105308_big_N()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local play = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local joker = CreateObjByFlag( 105614 , 780873 , 3 , 1 )  ---神秘儀器
	AddToPartition ( joker , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( joker , EM_RoleValue_PID , AI )
	WriteRoleValue ( joker , EM_RoleValue_Register1 , play )
	BeginPlot( joker,"cl_136_bigjoker_N", 0 )
	sleep ( 1 )
end
function cl_136_joker_N() ---
	local joker = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( joker , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local play = ReadRoleValue ( joker , EM_RoleValue_Register1 )
	SetAttack( joker , play )
	while 1 do
		sleep (10)
		if HateListCount( joker ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
		elseif HateListCount( joker ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			delobj ( joker )
		end
	end
end
function cl_136_bigjoker_N() ---雜耍師的助手
	local joker = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( joker , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local play = ReadRoleValue ( joker , EM_RoleValue_Register1 )
	SetPlot( joker, "dead","cl_136_bigjoker_dead_N", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	SetAttack( joker , play )
	while 1 do
		sleep (10)
		if HateListCount( joker ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
		elseif HateListCount( joker ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			delobj ( joker )
		end
	end
end
function cl_136_bigjoker_dead_N()
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local keyitem_3 = ReadRoleValue ( AI , EM_RoleValue_Register7 )
	WriteRoleValue ( AI , EM_RoleValue_Register7 , keyitem_3+1 )
end
function cl_chitem_talk_0_N()
	local Obj = OwnerID()
	local Target = TargetID()
	WriteRoleValue(Target,EM_RoleValue_Register3,0)
	cl_chitem_cord_N()
end
function cl_chitem_talk_1_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,1)
	cl_chitem_cord_N()
end
function cl_chitem_talk_2_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,2)
	cl_chitem_cord_N()
end
function cl_chitem_talk_3_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,3)
	cl_chitem_cord_N()
end
function cl_chitem_talk_4_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,4)
	cl_chitem_cord_N()
end
function cl_chitem_talk_5_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,5)
	cl_chitem_cord_N()
end
function cl_chitem_talk_6_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,6)
	cl_chitem_cord_N()
end
function cl_chitem_talk_7_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,7)
	cl_chitem_cord_N()
end
function cl_chitem_talk_8_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,8)
	cl_chitem_cord_N()
end
function cl_chitem_talk_9_N()
	local Obj = OwnerID()
	WriteRoleValue(TargetID(),EM_RoleValue_Register3,9)
	cl_chitem_cord_N()
end
function cl_chitem_talk_GM_N()
	local Obj = OwnerID()
	local Target = TargetID()
	local door = ReadRoleValue( Target , EM_RoleValue_Register4 )
	delobj ( door )
	CloseSpeak( OwnerID() )
end
function cl_givekeyitem03_N()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖  ---旗標可使用到8號
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register7 , 0 )
	while 1 do
		sleep ( 10 )
		local give = ReadRoleValue ( OwnerID() , EM_RoleValue_Register7 )
		if give == 3 then
			local PPL = SetSearchAllPlayer(RoomID )
			for i = 1 , PPL , 1 do  
				local ID = GetSearchResult()
				if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
					if CountBodyItem ( ID, 530673 ) == 0 then
						GiveBodyItem( ID, 530673, 1 )
					end
				end	
			end
		end
	end
end