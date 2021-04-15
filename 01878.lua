function bk_129_100123_count()------------------16副本中央控制器
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------控制器本身	
	local x=0 
	local count=0
	local final=0
	local b3=0
	local b4=0
	b3=CreateObj( 103934 ,1965, 680 , 2150, 0 , 1)------------------------------持政官103934
	SetFightMode( b3 , 0 , 0 , 0 , 0 )
 	SetModeEx( b3 , EM_SetModeType_Gravity, false) 
	SetModeEx( b3 , EM_SetModeType_AlignToSurface, false) 
	SetModeEx( b3 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( b3 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b3 , EM_SetModeType_Searchenemy, false)
	AddToPartition(b3 , RoomID )
	WriteRoleValue( b3 ,EM_RoleValue_IsWalk , 1 )
	SetPlot( b3 , "dead" , "Cang_129_oh_dead" , 10 )
	WriteRoleValue(start ,EM_RoleValue_Register8,b3)---------------------持政官
	b4=CreateObj( 103935 ,1980, 680 ,2165, 40 , 1)------------------------------爵士103941
	SetFightMode( b4 , 0 , 0 , 0 , 0 )
 	SetModeEx( b4 , EM_SetModeType_Gravity, false) 
	SetModeEx( b4 , EM_SetModeType_AlignToSurface, false) 
	SetModeEx( b4 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( b4 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b4 , EM_SetModeType_Searchenemy, false)
	AddToPartition(b4 , RoomID )
	WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
	AddBuff( b4 , 506853 , 1 , -1 )
	SetPlot( b4 , "dead" , "Cang_129_baron_dead" , 10 )
	WriteRoleValue(start ,EM_RoleValue_Register9,b4)---------------------紀錄爵士
	while 1 do 
		sleep(10)
		---say(start,"x="..x)
		x=ReadRoleValue(start,EM_RoleValue_Register1)--------------------------------紀錄目前的值來紀錄打到打到哪隻王
		if x==0 then 
			count = CreateObjByFlag(115548,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( count , EM_SetModeType_Mark, true)
			----SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----重力
			SetModeEx( count , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( count , EM_SetModeType_Move, true) ---移動	
			SetModeEx( count , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)
			WriteRoleValue(count ,EM_RoleValue_Register2,b4)---------------------count 紀錄爵士
			WriteRoleValue(start, EM_RoleValue_Register1,1)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==1 then --------妖龍戰鬥中
			
		elseif x==2 then --------妖龍死亡
			count = CreateObjByFlag(115549,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( count , EM_SetModeType_Mark, true)
			----SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			------------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----重力
			SetModeEx( count , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( count , EM_SetModeType_Move, true) ---移動	
			SetModeEx( count , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)	
			WriteRoleValue(start, EM_RoleValue_Register1,3 )
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==3 then --------大鬥士戰鬥中
		
		elseif x==4 then --------大鬥士死亡
			-----say(ownerid(),"11111111111")
			count = CreateObjByFlag(115550,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( count , EM_SetModeType_Mark, true)
			---------SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			----------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----重力
			SetModeEx( count , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( count , EM_SetModeType_Move, true) ---移動	
			SetModeEx( count , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)	
			DelObj(b3)
			b3=CreateObj( 103934 ,1965, 680 , 2150, 0 , 1)------------------------------持政官103934
			SetFightMode( b3 , 0 , 0 , 0 , 0 )
			SetModeEx( b3 , EM_SetModeType_Gravity, false) 
			SetModeEx( b3 , EM_SetModeType_AlignToSurface, false) 
			SetModeEx( b3 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( b3 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( b3 , EM_SetModeType_Searchenemy, false)
			AddToPartition(b3 , RoomID )
			WriteRoleValue( b3 ,EM_RoleValue_IsWalk , 1 )
			SetPlot( b3 , "dead" , "Cang_129_oh_dead" , 10 )
			WriteRoleValue(start ,EM_RoleValue_Register8,b3)---------------------持政官
			WriteRoleValue(start, EM_RoleValue_Register1,5)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==5 then --------執政官戰鬥中
			---say(ownerid(),"4654564645645645645645645645643")
		elseif x==6 then --------執政官死亡	
			count = CreateObjByFlag(115551,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( count , EM_SetModeType_Mark, true)
			---------SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			----------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----重力
			SetModeEx( count , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( count , EM_SetModeType_Move, true) ---移動	
			SetModeEx( count , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)
			Delobj(b4)
			b4=CreateObj( 103935 ,1980, 680 ,2165, 40 , 1)------------------------------爵士103941
			SetFightMode( b4 , 0 , 0 , 0 , 0 )
			SetModeEx( b4 , EM_SetModeType_Gravity, false) 
			SetModeEx( b4 , EM_SetModeType_AlignToSurface, false) 
			SetModeEx( b4 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( b4 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( b4 , EM_SetModeType_Searchenemy, false)
			AddToPartition(b4 , RoomID )
			WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
			AddBuff( b4 , 506853 , 1 , -1 )
			SetPlot( b4 , "dead" , "Cang_129_baron_dead" , 10 )
			WriteRoleValue(start ,EM_RoleValue_Register9,b4)---------------------紀錄爵士
			WriteRoleValue(start, EM_RoleValue_Register1,7)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==7 then --------爵士戰鬥中
		
		elseif x==8 then --------爵士死亡
			final = ReadRoleValue(start,EM_RoleValue_Register7)--------------讀取雙子控制器
			count = CreateObjByFlag(115552,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( count , EM_SetModeType_Mark, true)
			----------------SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			---------------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----重力
			SetModeEx( count , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( count , EM_SetModeType_Move, true) ---移動	
			SetModeEx( count , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)	
			sleep(10)
			Delobj(final)
			WriteRoleValue(start, EM_RoleValue_Register1,9)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==9 then --------雙子戰鬥中
		
		elseif x==10 then -------雙子死亡
			
		end			
	end	
end
function bk_129_103932_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103932_c2", 0 ); --你準備好了嗎?
end
function bk_129_103933_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103933_c2", 0 ); --你準備好了嗎?
end
function bk_129_103934_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103934_c2", 0 ); --你準備好了嗎?
end
function bk_129_103935_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103935_c2", 0 ); --你準備好了嗎?
end
function bk_129_finl_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_finl_c2", 0 ); --你準備好了嗎?
end
function bk_129_103932_c2()
	BeginPlot( TargetID( ) ,"bk_129_103932_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103933_c2()
	BeginPlot( TargetID( ) ,"bk_129_103933_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103934_c2()
	BeginPlot( TargetID( ) ,"bk_129_103934_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103935_c2()
	BeginPlot( TargetID( ) ,"bk_129_103935_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_finl_c2()
	BeginPlot( TargetID( ) ,"bk_129_finl_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103932_op()-------------妖龍馬提洛斯招換儀式
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------讀取中央控器
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_09]" , 1 )
	Say(OwnerID(),"[SC_103932_09]")
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local b4= ReadRoleValue(start,EM_RoleValue_Register9)--------------讀取爵士
	SetModeEx( b4 , EM_SetModeType_Move, true)
	SetModeEx( b4 , EM_SetModeType_Gravity, true) ---重力
	CastSpell( b4 , b4 , 495699 )
	SetPos( b4, 2095, 514.3 , 2043 , 45 )---將王傳到一個地方去
	MoveToFlagEnabled ( b4,  false )
	WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_05]" , 1 )---噢，你們就是今天的挑戰者吧，放心，這個競技場一切的比賽都是公平的，只是不保證你們的性命罷了
	say(OwnerID(),"[SC_103932_05]")---噢，你們就是今天的挑戰者吧，放心，這個競技場一切的比賽都是公平的，只是不保證你們的性命罷了
	sleep(30)
	LuaFunc_MoveToFlag( b4, 780667 , 2 , 10)--------------------------------爵士行走至這個位置發動昭煥龍的技能
	CastSpell( b4 , b4 , 495698 )
	say(OwnerID(),"[SC_103932_06]")----馬提洛斯，你這隻又老又懶的爬蟲，準備上場戰鬥了
	local dcseat=CreateObjByFlag(103971,780665,1,1)
	SetModeEx( dcseat , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( dcseat , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( dcseat , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( dcseat , EM_SetModeType_Searchenemy, false)
	SetModeEx( dcseat , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( dcseat , EM_SetModeType_Mark, false)
	SetModeEx( dcseat , EM_SetModeType_Move, false)
	SetModeEx( dcseat , EM_SetModeType_Fight, false) ---可砍殺
	AddToPartition(dcseat , RoomID )
	AddBuff( dcseat , 506820 , 1 , -1 )
	WriteRoleValue(dcseat, EM_RoleValue_Livetime,5)
	sleep(30)
	SetPos( b4, 1980 , 680 , 2165 , 40 )---將王傳到一個地方去
	SetModeEx( b4 , EM_SetModeType_Move, false)
	SetModeEx( b4 , EM_SetModeType_Gravity, false) ---重力
	local dc=CreateObjByFlag(103932,780665,1,1)
	AddToPartition( dc , RoomID )
	BeginPlot( dc ,"bk_129_103932",0)---------------------------------王劇情模式
	SetPlot( dc , "dead" , "bk_129_103932_dead" , 10 )
	WriteRoleValue( dc, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,1)
	sleep(20)
	Delobj(OwnerID())
end
function bk_129_103933_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------讀取中央控器
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103933_05]" , 1 )
	Say(OwnerID(),"[SC_103933_05]")
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local big=CreateObjByFlag(103933,780666,1,1)-----------------------大鬥士走出來
	SetModeEx( big , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( big , EM_SetModeType_Mark, false)
	-----SetModeEx( big , EM_SetModeType_HideName, true)
	SetModeEx( big , EM_SetModeType_ShowRoleHead, true)
	----SetModeEx( big , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( big , EM_SetModeType_Obstruct, false)   -----重力
	SetModeEx( big , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( big , EM_SetModeType_Move, true) ---移動	
	SetModeEx( big , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( big , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( big , EM_SetModeType_Searchenemy, false)
	SetModeEx( big , EM_SetModeType_Show, true)
	AddToPartition( big , RoomID )
	SetPlot( big , "dead" , "bk_129_103933_dead" , 10 )
	MoveToFlagEnabled ( big,  false )
	LuaFunc_MoveToFlag(big, 780666 , 2 , 10)--------------------------------請大鬥士走到這個位置  (這個function 他是迴圈)
	SetPosByFlag( big, 780666 , 3 )
	LuaFunc_MoveToFlag(big, 780666 , 4 , 10)--------------------------------請大鬥士走到這個位置  (這個function 他是迴圈)
	SetModeEx( big , EM_SetModeType_Mark, true)
	SetModeEx( big , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( big , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( big , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( big , EM_SetModeType_Searchenemy, true)
	BeginPlot( big ,"bk_129_103933",0)---------------------------------王劇情模式
	WriteRoleValue( big, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,3)
	sleep(20)
	Delobj(OwnerID())
end
function bk_129_103934_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------讀取中央控器
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local b3 = ReadRoleValue(start,EM_RoleValue_Register8)--------------讀取持政官
	SetModeEx( b3 , EM_SetModeType_Move, true)
	SetModeEx( b3 , EM_SetModeType_Gravity, true) ---重力
	sleep(10)
	SetModeEx( b3 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( b3 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b3 , EM_SetModeType_Searchenemy, false)
	CastSpell( b3 , b3 , 495699 )
	SetPos( b3, 2095, 514.3 , 2043 , 45 )---將王傳到一個地方去
	MoveToFlagEnabled ( b3,  false )
	WriteRoleValue( b3 ,EM_RoleValue_IsWalk , 1 )
	sleep(30)
	LuaFunc_MoveToFlag( b3, 780667 , 2 , 10)--------------------------------爵士行走戰鬥位置
	SetModeEx( b3 , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( b3 , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( b3 , EM_SetModeType_Searchenemy, true)
	BeginPlot( b3 ,"Cang_129_oh",20)---------------------------------王劇情模式
	WriteRoleValue( b3, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,5)
	sleep(10)
	Delobj(OwnerID())
end
function bk_129_103935_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------讀取中央控器
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local b4 = ReadRoleValue(start,EM_RoleValue_Register9)--------------讀取持政官
	SetModeEx( b4 , EM_SetModeType_Move, true)
	SetModeEx( b4 , EM_SetModeType_Gravity, true) ---重力
	sleep(10)
	SetModeEx( b4 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( b4 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b4 , EM_SetModeType_Searchenemy, false)
	CancelBuff( b4 ,  506853 )
	CastSpell( b4 , b4 , 495699 )
	SetPos( b4, 2095, 514.3 , 2043 , 45 )---將王傳到一個地方去
	MoveToFlagEnabled ( b4,  false )
	WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
	sleep(30)
	LuaFunc_MoveToFlag( b4, 780667 , 2 , 10)--------------------------------爵士行走戰鬥位置
	SetModeEx( b4 , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( b4 , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( b4 , EM_SetModeType_Searchenemy, true)
	BeginPlot( b4 ,"Cang_129_baron",20)---------------------------------王劇情模式
	WriteRoleValue( b4, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,7)
	sleep(10)
	Delobj(OwnerID())
end
function bk_129_finl_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------讀取中央控器
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local final=CreateObjByFlag(103933,780666,1,1)-----------------------大鬥士走出來
	SetModeEx( final , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( final , EM_SetModeType_Mark, false)
	SetModeEx( final , EM_SetModeType_HideName, false)
	SetModeEx( final , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( final , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( final , EM_SetModeType_Obstruct, false)   -----重力
	SetModeEx( final , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( final , EM_SetModeType_Move, false) ---移動	
	SetModeEx( final , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( final , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( final , EM_SetModeType_Searchenemy, false)
	SetModeEx( final , EM_SetModeType_Show, false)
	AddToPartition( final , RoomID )
	BeginPlot( final ,"Cang_129_2bo_all",20)---------------------------------王劇情模式
	WriteRoleValue(start, EM_RoleValue_Register1,9)
	WriteRoleValue(start, EM_RoleValue_Register7,final)
	WriteRoleValue(final, EM_RoleValue_Register1,start)
	sleep(10)
	Delobj(OwnerID())
end

