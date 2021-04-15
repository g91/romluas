function cl_762_193304AI() -------->堤阿里斯控制器
	local AI = OwnerID() ------->命名控制器叫做AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local mob = ReadRoleValue( AI ,EM_RoleValue_Register4) --------控制器由阿展的控制器生出來
	local npcboss = ReadRoleValue( AI ,EM_RoleValue_Register6)
	local open = 0
	open = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
	if (open >=1 and open <=10 ) or
		( open >=21 and open <= 30 ) or
		( open >= 41 and open <= 50 ) or 
		( open >= 61 and open <= 70 ) or
		( open >= 81 and open <= 90 ) then
		--BeginPlot( AI,"cl_762_193304AIDOWN", 0 )		
		local boss = CreateObjByFlag( 104897 , 780805 , 20 , 1 ) ------------宣告在這個旗標位置生出王~我命名王為BOSS
		AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
		WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器AI產生的
		WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
		BeginPlot( boss,"cl_193304B_1", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
		BeginPlot( boss,"cl_193304w_1", 0 )  -----------同時間讓王的走路scpipt一起
		BeginPlot( boss,"cl_192boss_bon", 0 ) ----------執行計時360秒後要施法傳送到本鎮NPC旁直接殺掉他
		ScriptMessage( boss , -1 , 2 ,"[SC_19204_01]" , 2 ) ----開場說話
		while 1 do
		sleep ( 10 )
			local del = ReadRoleValue( AI ,EM_RoleValue_Register8) ---del讀取R8的值
			if del == 1 then ---如果=1就先晾著吧
				WriteRoleValue( mob , EM_RoleValue_Register9 , 4 ) ---那就在阿展的中控器寫入 =4
			end
			local kil = ReadRoleValue( AI ,EM_RoleValue_Register2) ---kill
			if kil == 1 then
			elseif kil == 2 then
				local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			elseif kil == 3 then
				local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue( ID , EM_RoleValue_OrgID )
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			end
		end
	elseif (open >= 11 and open <= 20 ) or
		( open >= 31 and open <= 40 ) or
		( open >= 51 and open <= 60 ) or
		( open >= 70 and open <= 80 ) or
		( open >= 91 and open <= 100 ) then
		---BeginPlot( AI,"cl_762_193304AIUP", 0 )
		local boss = CreateObjByFlag( 104897 , 780805 , 23 , 1 ) ------------宣告在這個旗標位置生出王~我命名王為BOSS
		AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
		WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器產生的
		WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
		BeginPlot( boss,"cl_193304B_1", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
		BeginPlot( boss,"cl_193304w_2", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
		BeginPlot( boss,"cl_192boss_bon", 0 )
		ScriptMessage( boss, -1 , 2 ,"[SC_19204_01]" , 2 )
		while 1 do
		sleep ( 10 )
			local del = ReadRoleValue( AI ,EM_RoleValue_Register8)
			if del == 1 then
				WriteRoleValue( mob , EM_RoleValue_Register9 , 4 )
			end
			local kil = ReadRoleValue( AI ,EM_RoleValue_Register2)
			if kil == 1 then
			elseif kil == 2 then
				local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			elseif kil == 3 then
				local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			end
		end
	end
end
function cl_193304B_1()  ----戰鬥用
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	local skill = 0 ----->普攻技CD時間
	local skill1 = 0 ----->普攻技CD時間
	local skill2 = 0 ---->全體AE CD時間
	local skill3 = 0 ----->巨石攻擊
	local skill4 = 0
	local Six_Table = {}  -----放入重整過後的仇恨表
	local Six_Table2 = {}  -----放入重整過後的仇恨表
	local Rand_Num = 0 ---Rand 數字用
	local Finel_Table = {} --抓出來的六個隨機目標放置的Table
	local CombatBegin = 0
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local bkma = 0
	local Finel_Num = 0
	local ggyy = 0
	local hot = 0
	SetPlot( OwnerID(),"dead","cl_762_193304B_dead",10 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		--Six_Table2 = star_HateListSort(OwnerID())  ----將仇恨表內的玩家依照仇恨高低排列
		--hot=table.getn(Six_Table2) ----重整這個Table
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
			   CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			   WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
			end
				if CombatBegin == 1 then
					--skill = skill + 1   ----->skill每秒就+1上去 
					--if skill >= 3 then ----->當Skill的值大於等於3的時候
						--CastSpelllv ( OwnerID() , OwnerID(), 496488 , 15 )----對當前目標釋放一個巨大傷害
						--sleep ( 10 )   --------->放玩法術後整個迴圈停兩秒
						--skill = 0
					--end
					skill1 = skill1 + 1
					if skill1 >= 5 then
						CastSpelllv ( OwnerID() , OwnerID(), 496488 , 35  )----對當前目標釋放一個巨大傷害  AE
						sleep ( 10 )   --------->放玩法術後整個迴圈停兩秒
						skill1 = 0
					end
					skill2 = skill2 + 1
					if skill2 >= 13 then
						CastSpelllv ( OwnerID() , AttackTarget, 496489 , 100 )----對當前目標釋放一個巨大傷害
						sleep ( 20 )
						skill2 = 0
					end
					skill3 = skill3 + 1
					if skill3 >= 28 then ----->當跑到7的時候就做以下的事情
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(10)
						end
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_04]" , 2 )
						--Six_Table = star_HateListSort(OwnerID())  ----將仇恨表內的玩家依照仇恨高低排列
						Six_Table = DW_HateRemain(1)  ----將仇恨表內的玩家依照仇恨高低排列
						--ggyy=table.getn(Six_Table) ----重整這個Table
						--table.remove ( Six_Table , 1 ) ----排除第一仇恨
						bkma=table.getn(Six_Table) ----重整這個Table
						for i = 0 , 5 , 1 do ---隨機抓出六個人
							Rand_Num = DW_Rand(bkma)
							if bkma > 0 then
								table.insert( Finel_Table , Six_Table[Rand_Num] )
								table.remove ( Six_Table , Rand_Num )
								bkma=table.getn(Six_Table)
							end
						end
						Finel_Num = table.getn(Finel_Table)
						for i = 1 , Finel_Num , 1 do
							Addbuff (  Finel_Table[i] , 508054 , 0 ,-1 ) ---施放水晶BUFF
							X1 = ReadRoleValue ( Finel_Table[i], EM_RoleValue_X)
							Y1 = ReadRoleValue ( Finel_Table[i], EM_RoleValue_Y)
							Z1 = ReadRoleValue ( Finel_Table[i], EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
							local ball = CreateObj( 104899 , X1, Y1 , Z1 , 0 , 1 )  ------------
							SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
							SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
							SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
							SetModeEx( ball , EM_SetModeType_Mark, false)			---可點選(是)
							SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
							SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
							SetModeEx( ball , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
							AddToPartition(ball,RoomID)
							WriteRoleValue ( ball , EM_RoleValue_Register7 , OwnerID() ) --------對ball說是王生的
							local fin = Finel_Table[i]
							WriteRoleValue ( ball , EM_RoleValue_Register5 , fin )
							BeginPlot( ball,"cl_CancelBuff", 0 )
							sleep ( 1 )
						end
						skill3 = 0
						Rand_Num = 0
						Finel_Num = 0
						bkma = 0
						Finel_Table = {}
						Six_Table = {}
					end
					skill4 = skill4 + 1
					if skill4 >= 19 then
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_03]" , 2 )
						sysCastSpelllv ( OwnerID() , AttackTarget , 496490 , 0 )  --感染
						sleep ( 10 )
						skill4 = 0
					end
				end
		elseif HateListCount ( OwnerID() ) == 0 then --非戰鬥中 ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 3 )
			end
		end
		sleep (10)
	end
end

function cl_762_193304B_dead() ----Boss 的死王劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_02]" , 2 )
	WriteRoleValue ( AI , EM_RoleValue_Register8 , 1 )
	WriteRoleValue ( AI , EM_RoleValue_Register2 , 2 )
end
function cl_762_AIchbuff() ----Boss 的死王劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] )  == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--檢查玩家是不是還在；檢查是否死亡
			if CheckBuff( ThesePlayer[i] , 508052 ) or CheckBuff( ThesePlayer[i] , 508054 ) ==  true then
				CancelBuff(ThesePlayer[i], 508052)
				CancelBuff(ThesePlayer[i], 508054)
			end
		end					
	end
end
function cl_CancelBuff() ----透明球
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_register7)  ------>讀取是王昇我出來的
	local time1 = 0
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register5)
	sleep ( 40 )
	if CheckBuff(  player , 508054 ) == true then
		sleep (10)
		X1 = ReadRoleValue (  player, EM_RoleValue_X)
		Y1 = ReadRoleValue (  player, EM_RoleValue_Y)
		Z1 = ReadRoleValue (  player, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
		local bil = CreateObj( 104898 , X1, Y1 , Z1 , 0 , 1 )  ------------
		SetModeEx( bil , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( bil , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( bil , EM_SetModeType_Searchenemy, true)--索敵(否)
		SetModeEx( bil , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( bil , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( bil , EM_SetModeType_Fight, true) ---可砍殺(是)
		SetModeEx( bil , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
		AddToPartition(bil,RoomID)
		WriteRoleValue ( bil , EM_RoleValue_Register3 , OwnerID() ) --------對BOSS說是中控器產生的
		BeginPlot( bil,"cl_19205bon", 0 )
		SetPlot( bil,"dead","cl_bil_dead",10 )
	elseif CheckBuff(  player , 508054 ) == false then
		sleep ( 10 )
		delobj ( OwnerID() )
	end
end
function cl_19205bon() ----水晶用的
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local ball = ReadRoleValue( OwnerID() , EM_RoleValue_register3)  ------>讀取是王昇我出來的
	local boss = ReadRoleValue( ball , EM_RoleValue_register7)
	local time2 = 0
	addbuff ( OwnerID() , 508120 , 0 , -1 )
	local most = {}
	local mostbon = {}
	most = SearchRangeNPC ( OwnerID() , 30 )
	local mostno = table.getn(most)
	for i=1 , mostno , 1 do
		if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 104898 then
			table.insert( mostbon , most[i] )
		end	
	end
	local belin = table.getn(mostbon)
	if belin >= 2 then
		CastSpelllv ( OwnerID() , OwnerID() , 496789 , 0 )
	end
	while 1 do
		sleep ( 10 )
		time2 = time2 + 1
		if time2 >= 15 then
			CastSpelllv ( OwnerID() , boss , 496492 , 0 )
			sysCastSpelllv ( OwnerID() , OwnerID() , 496493 , 0 )
			sleep ( 10 )
			delobj ( ball )
			sleep ( 10 )
			delobj ( OwnerID() )
		end
	end
end
function cl_bil_dead() ----Boss 的死王劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local ball = ReadRoleValue( OwnerID() , EM_RoleValue_register3)
	X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	local hide = CreateObj( 104901 , X1, Y1 , Z1 , 0 , 1 )  ------------
	SetModeEx( hide , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( hide , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( hide , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( hide , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( hide , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( hide , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( hide , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition( hide , RoomID )
	BeginPlot( hide,"cl_Bon_2", 0 )
	delobj ( ball )
	delobj ( OwnerID() )
end
function cl_Bon_2()  -----特效求施放法術
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	CastSpelllv ( OwnerID() , OwnerID() , 496493 , 0 )
	sleep ( 20 )
	delobj ( OwnerID() )
end
function cl_193304w_1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	local go = 0
	while 1 do
		sleep ( 10 )
		if	HateListCount( OwnerID())~= 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 1	then --非戰鬥中
			StopMove(OwnerID(),false)
			if go == 0 then
				go = 1
			end
		elseif HateListCount( OwnerID() )== 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 0	then --非戰鬥中 
			if go == 1 then
				go = 0
			end
			if go == 0 then
				MoveToFlagEnabled(OwnerID(), false) ---系統內建的路徑關掉
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 , 21 , 0 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,go+1)
			end
		end
	end
end
function cl_193304w_2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	local go = 0
	while 1 do
		sleep ( 10 )
		if	HateListCount( OwnerID())~= 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 1	then --非戰鬥中
			StopMove(OwnerID(),false)
			if go == 0 then
				go = 1
			end
		elseif HateListCount( OwnerID() )== 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 0	then --非戰鬥中
			if go == 1 then
				go = 0
			end
			if go == 0 then
				MoveToFlagEnabled(OwnerID(), false) ---系統內建的路徑關掉
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 , 24 , 0 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,go+1)
			end
		end
	end
end
function cl_192boss_bon()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的 
	local skill = 0 ----->普攻技CD時間
	local CombatBegin = 0
	local open = 0
	local npcboss = ReadRoleValue( OwnerID() ,EM_RoleValue_Register6)
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 360 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
				sleep(10)
			end
			if open == 0 and CombatBegin == 0 then
				ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_05]" , 2 )
				Addbuff ( OwnerID() , 508056 , 0 , -1 )
				CastSpelllv ( OwnerID() , OwnerID() , 496495 , 0 )
				sleep ( 30 )
				local Xnpcboss=0
				local Ynpcboss=0
				local Znpcboss=0
				Xnpcboss=ReadRoleValue(npcboss ,EM_RoleValue_X)
				Ynpcboss=ReadRoleValue(npcboss ,EM_RoleValue_Y)
				Znpcboss=ReadRoleValue(npcboss ,EM_RoleValue_Z)
				SetPos( OwnerID(), Xnpcboss-90, Ynpcboss, Znpcboss , 0 )
				AddToPartition(OwnerID(),RoomID)
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否)
				for i = 0 , 3 do
					sleep ( 20 )
					CastSpelllv ( OwnerID() , npcboss , 496494 , 0 )
				end
				open = 1
				CombatBegin = 1
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊(否)
			end
		end
	end 
end
function cl_762_193304AIUP() -------->堤阿里斯控制器
	local AI = OwnerID() ------->命名控制器叫做AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local mob = ReadRoleValue( AI ,EM_RoleValue_Register4) --------控制器由阿展的控制器生出來
	local npcboss = ReadRoleValue( AI ,EM_RoleValue_Register6)
	local boss = CreateObjByFlag( 104897 , 780805 , 23 , 1 ) ------------宣告在這個旗標位置生出王~我命名王為BOSS
	AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
	WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器產生的
	SetPlot( boss,"dead","cl_762_193304B_dead",10 )
	WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
	BeginPlot( boss,"cl_193304B_1", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	BeginPlot( boss,"cl_193304w_2", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	BeginPlot( boss,"cl_192boss_bon", 0 )
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_01]" , 2 )
	while 1 do
	sleep ( 10 )
		local del = ReadRoleValue( AI ,EM_RoleValue_Register8)
		if del == 1 then
			WriteRoleValue( mob , EM_RoleValue_Register9 , 4 )
		end
		local kil = ReadRoleValue( AI ,EM_RoleValue_Register2)
		if kil == 1 then
		elseif kil == 2 then
			local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		elseif kil == 3 then
			local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		end
	end
end
function cl_762_193304AIDOWN() -------->堤阿里斯控制器
	local AI = OwnerID() ------->命名控制器叫做AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local mob = ReadRoleValue( AI ,EM_RoleValue_Register4) --------控制器由阿展的控制器生出來
	local npcboss = ReadRoleValue( AI ,EM_RoleValue_Register6)
	local boss = CreateObjByFlag( 104897 , 780805 , 20 , 1 ) ------------宣告在這個旗標位置生出王~我命名王為BOSS
	AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
	SetPlot( boss,"dead","cl_762_193304B_dead",10 )----生出來就加入死亡劇情
	WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器AI產生的
	WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
	BeginPlot( boss,"cl_193304B_1", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	BeginPlot( boss,"cl_193304w_1", 0 )  -----------同時間讓王的走路scpipt一起
	BeginPlot( boss,"cl_192boss_bon", 0 ) ----------執行計時360秒後要施法傳送到本鎮NPC旁直接殺掉他
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_01]" , 2 ) ----開場說話
	while 1 do
	sleep ( 10 )
		local del = ReadRoleValue( AI ,EM_RoleValue_Register8) ---del讀取R8的值
		if del == 1 then ---如果=1就先晾著吧
			WriteRoleValue( mob , EM_RoleValue_Register9 , 4 ) ---那就在阿展的中控器寫入 =4
		end
		local kil = ReadRoleValue( AI ,EM_RoleValue_Register2) ---kill
		if kil == 1 then
		elseif kil == 2 then
			local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		elseif kil == 3 then
			local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue( ID , EM_RoleValue_OrgID )
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		end
	end
end