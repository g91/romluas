function cl_762_190001AI() -------->多堤林斯控制器
    local AI = OwnerID() ------->命名控制器叫做AI
    local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local open = 0 ---->開戰旗標 生出前門的旗標
	local fiag = 0
	local mobtime1 = 0
	local mobtime2 = 0 
	local mob1 = 0
	local luck = 0
	local luck2 = 0
	local luck3 = 0
	local luck4 = 0
	local ID
	local fun = {"cl_762_1901mob1","cl_762_1901mob2","cl_762_1901mob3"}
	local rand={}
	local mon = {}
	local monster = {105000,105001,105002}--放怪陣列
	local monster1
	local boss = CreateObjByFlag( 104786 , 780767 , 1 , 1 )   -------用控制器將王生在這個旗標的位置
	AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
	WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----在王的PID身上寫入這個值,告訴王誰是控制器
	BeginPlot( boss,"cl_762_190001B", 10 )  -----------將王的scpipt塞進去王身上,讓王執行
	WriteRoleValue ( AI , EM_RoleValue_Register2 ,0 )
	WriteRoleValue ( AI , EM_RoleValue_Register3 , boss )
	local cck = CreateObjByFlag( 105036 , 780767 , 2 , 1 )  ------------
	SetModeEx( cck , EM_SetModeType_Show, false) ----秀出
	SetModeEx( cck , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( cck , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( cck , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( cck , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( cck , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( cck , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( cck , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition(cck,RoomID)
	WriteRoleValue ( cck , EM_RoleValue_PID, AI )
	WriteRoleValue ( cck , EM_RoleValue_Register1, boss )
	BeginPlot( cck , "cl_762_chack" , 0 )
	while 1 do   -------每隔多久就跑一次這個迴圈
	    sleep (10)   -----每隔1秒就檢查一次這個迴圈
		local p = ReadRoleValue( AI , EM_RoleValue_Register1)  ------>P裡面的值代表裡面要做甚麼事情~~控制器去讀取Register1的值
		if p == 1 then   -------從p裡面去取出來我要的值(王會再結束戰鬥的時候才會丟值進去所以這裡我是每秒都在判斷王現在口袋裡的值)因為王進入戰鬥了~值就會變成1所以這裡不用做任何事情
			if open == 0 then  ------->當生門的旗標等於0的時候就生出前門
				open = 1 ------->生完門後~就將旗標寫成1,避免門一直生
			end
			if open == 1 then
				mobtime2 = mobtime2 + 1
				if mobtime2 >= 15 then
					for i=1,table.getn(monster) do
						local x = ReadRoleValue (boss, EM_RoleValue_X)
						local y = ReadRoleValue (boss, EM_RoleValue_Y)
						local z = ReadRoleValue (boss, EM_RoleValue_Z)
						rand = Az_RND_Ary(-150,150,2)
						monster1 = CreateObj ( monster[i] , x+rand[1] , y , z+rand[2] , 0 , 1) --隨機字身周圍生怪
						AddToPartition(monster1,roomID )
						WriteRoleValue(monster1,EM_RoleValue_Livetime,20)  --存活時間
						WriteRoleValue ( monster1 , EM_RoleValue_PID, OwnerID())----
						WriteRoleValue ( monster1 , EM_RoleValue_Register3, boss )
						BeginPlot( monster1,fun[i], 10 )
						table.insert( mon , monster1 )
						sleep ( 2 )
					end
					mobtime2 = 0
				end
			end
		elseif p == 2 then ------從p裡面去取出來我要的值~當王死亡後取得2的值~就會刪掉前後門 , 並且清除場上所有物件
			open = 0 ----->要將開戰旗標寫回去0
			WriteRoleValue ( AI , EM_RoleValue_Register2 ,1 )
			WriteRoleValue ( AI , EM_RoleValue_Register4 ,0 )
			mobtime1 = 0
			mobtime2 = 0
			--local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
			--ID=GetSearchResult()
			--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			--for i = 0 , kk do
				--ID=GetSearchResult()
				--ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--if ID2 == 105003 or ID2 == 105000 or ID2 == 105001 or ID2 == 105002 or ID2 == 105003 then
					--DelObj(ID)
				--end
			--end
			for i = 1 , table.getn(mon), 1 do
				if mon[i] ~= nil then
					DelObj ( mon[i] )
				end
			end
			delobj ( cck )
			sleep ( 100 )
			delobj ( AI )
		elseif p == 3 then ------從P裡面去取出來我要的值~當王離開戰鬥後後取得3的值的話~就要刪掉王~並且種一支新的王別忘記去將王加入物件內~並且告訴王~王是中控器生出來的~也要塞入王的script
			for i = 1 , table.getn(mon), 1 do
				if mon[i] ~= nil then
					DelObj ( mon[i] )
				end
			end
			delobj (boss)  ----刪除BOSS
			delobj ( cck )
			mobtime1 = 0
			mobtime2 = 0
			sleep (50) ----停2秒後再生出王
			boss = CreateObjByFlag( 104786 , 780767 , 1 , 1 )   -------用控制器將王生在這個旗標的位置
			AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
			WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----在王的PID身上寫入這個值,告訴王誰是控制器
			BeginPlot( boss,"cl_762_190001B", 10 )  -----------將王的scpipt塞進去王身上,讓王執行
			WriteRoleValue ( AI , EM_RoleValue_Register2 ,0 )
			WriteRoleValue ( AI , EM_RoleValue_Register3 ,boss )
			cck = CreateObjByFlag( 105036 , 780767 , 2 , 1 )  ------------
			SetModeEx( cck , EM_SetModeType_Show, false) ----秀出
			SetModeEx( cck , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( cck , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( cck , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( cck , EM_SetModeType_Mark, false)			---可點選(是)
			SetModeEx( cck , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( cck , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( cck , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
			AddToPartition(cck,RoomID)
			WriteRoleValue ( cck , EM_RoleValue_PID, AI )
			WriteRoleValue ( cck , EM_RoleValue_Register1, boss )
			BeginPlot( cck , "cl_762_chack" , 0 )
			WriteRoleValue ( AI , EM_RoleValue_Register1 ,0 )  ---->將Register1寫回去0
			WriteRoleValue ( AI , EM_RoleValue_Register4 ,0 )
			open = 0 ----->要將開戰旗標寫回去0
		end
		local black = ReadRoleValue( AI , EM_RoleValue_Register2)  ------>P裡面的值代表裡面要做甚麼事情~~控制器去讀取Register1的值
		if black == 1 then
		elseif black == 2 then
			delobj ( boss )
			sleep ( 20 )
			delobj ( AI )
		end
	end
end
function cl_762_190001B()
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	local skill = 0 ----->普攻技CD時間
	local skill2 = 0 ---->全體AE CD時間
	local skill3 = 0 ----->巨石攻擊
	local mots  -------->宣告誰是透明特效球
	local CombatBegin = 0  ------>宣告王的開戰旗標
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local PlayerInHate2 = {}
	SetPlot( OwnerID(),"dead","cl_762_190001B_dead",10 )  ------>當王死亡後執行這段死王劇情
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep (10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,1 ) ------當王進入戰鬥了~所以我要王再第一個口袋內寫進去1代表他進入戰鬥~這時候前門要生出來
				ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_02]" , 2 )
			end
			   if CombatBegin == 1 then  ----->當開戰旗標內的值變成1的時候執行以下命令
				   skill = skill + 1   ----->skill每秒就+1上去 
				   if skill >= 3 then ----->當Skill的值大於等於5的時候
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_05]" , 2 )
						Luck = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
						if ( Luck >= 1 and Luck <= 10) or( Luck >=21 and Luck <= 30 ) or
						   ( Luck >= 41 and Luck <= 50 ) or ( Luck >= 61 and Luck <= 70 ) or
						   ( Luck >= 81 and Luck <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
						   CastSpell ( OwnerID() , AttackTarget , 496412  )----對當前目標釋放一個巨大傷害
						   sleep ( 20 )   --------->放玩法術後整個迴圈停兩秒
						elseif ( Luck >= 11 and Luck <= 20 ) or( Luck >= 31 and Luck <= 40 ) or
						   ( Luck >= 51 and Luck <= 60 ) or( Luck >= 70 and Luck <= 80 ) or
						   ( Luck >= 91 and Luck <= 100 ) then   ------------>當隨機出來的值等於以上的亂數就施放第二招
						   CastSpelllv ( OwnerID() , OwnerID() , 496411 , 10 )----前方扇形
						   sleep ( 20 )
						end
						skill = 0
					end
					sleep (10)   ------>上一個內迴圈跑完一圈停一秒
					skill2 = skill2 + 1  ------>Skill2每一秒就+1上去
					if skill2 >= 7 then ----->當跑到7的時候就做以下的事情
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(10)
						end
						local Attackplayer = Lua_AP_HateTargetID( OwnerID() )  -----抓取仇恨表內隨機一個人,這裡是包好的function ,Attackplayer=是我抓出來的那個人
						local PlayerName=GetName(Attackplayer)
						local MsgStr="[SC_19001_01][$SETVAR1="..PlayerName.."]"
						ScriptMessage( Attackplayer, -1 , 2 ,MsgStr , 2 )
						X1 = ReadRoleValue ( Attackplayer, EM_RoleValue_X)
						Y1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Y)
						Z1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標 cl_bon
						mots = CreateObj( 104820 , X1, Y1 , Z1 , 0 , 1 )  -----------
						SetModeEx( mots , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( mots , EM_SetModeType_Move, false) ---移動	(否)
						SetModeEx( mots , EM_SetModeType_Searchenemy, false)--索敵(否)
						SetModeEx( mots , EM_SetModeType_Mark, false)			---可點選(是)
						SetModeEx( mots , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
						SetModeEx( mots , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( mots , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
						AddToPartition(mots,RoomID)
						CastSpell ( OwnerID() , mots , 496413 )
						BeginPlot( mots , "cl_762_190000most" , 0 )
						sleep ( 30 )
						skill2 = 0
					end
					skill3 = skill3 + 1
					if skill3 >= 11 then
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_06]" , 2 )
						CastSpelllv ( OwnerID() , AttackTarget , 496410 , 0 )
						sleep ( 30 )
						skill3 = 0
					end
				end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3)  ----當玩家離開戰鬥後~王要重置~所以回傳3的值給第一個口袋
				ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_03]" , 2 )
				--delobj ( mots )
				skill = 0 ----->普攻技CD時間
				skill2 = 0 ---->全體AE CD時間
				skill3 = 0 ----->巨石攻擊
			end
		end
	end
end
function cl_762_190001B_dead() ----Boss 的死王劇情
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_04]" , 2 )
	WriteRoleValue ( AI , EM_RoleValue_Register1, 2 )
end
function cl_762_190000most()  -----特效求施放法術
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	sleep ( 30 )
	CastSpelllv ( OwnerID() , OwnerID() , 496414 , 0 )
	sleep ( 20 )
	delobj ( OwnerID() )
end

function cl_762_1901mob1()  ---隊長
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local skill = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )  -----抓取仇恨表內隨機一個人,這裡是包好的function ,Attackplayer=是我抓出來的那個人
	SetAttack( ownerid() , Attackplayer)
	Addbuff (  ownerid() , 508131 , 0 , -1 )
	sysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
	Addbuff (   Attackplayer , 508179 , 0 , 5 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep (10)
		skill = skill + 1
		if skill >= 5 then
			Attackplayer = Lua_AP_HateTargetID( boss )
			SetAttack( ownerid() , Attackplayer)
			SysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
			Addbuff (   Attackplayer , 508179 , 0 , 5 )
			CastSpelllv ( OwnerID() , Attackplayer , 496542 , 0 )
			sleep ( 10 )
			skill = 0
		end
	end
end
function cl_762_1901mob2() ----劍兵
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local skill = 0
    local Attackplayer = Lua_AP_HateTargetID( boss )  -----抓取仇恨表內隨機一個人,這裡是包好的function ,Attackplayer=是我抓出來的那個人
	SetAttack( ownerid() ,Attackplayer)
	Addbuff (  ownerid() , 508131 , 0 , 5 )
	SysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
	Addbuff (   Attackplayer , 508180 , 0 , 5 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep (10)
		skill = skill + 1
		if skill >= 5 then
			Attackplayer = Lua_AP_HateTargetID( boss )
			SetAttack( ownerid() , Attackplayer)
			SysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
			Addbuff (   Attackplayer , 508180 , 0 , 5 )
			CastSpelllv ( OwnerID() , Attackplayer , 496543 , 0 )
			sleep ( 10 )
			skill = 0
		end
	end
end
function cl_762_1901mob3()  ---衛士
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local skill = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )  -----抓取仇恨表內隨機一個人,這裡是包好的function ,Attackplayer=是我抓出來的那個人
	SetAttack( ownerid() , Attackplayer)
	Addbuff (  ownerid() , 508131 , 0 , -1 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep (10)
		skill = skill + 1
		if skill >= 10 then
			Attackplayer = Lua_AP_HateTargetID( boss )
			SetAttack( ownerid() , Attackplayer)
			CastSpelllv ( OwnerID() , OwnerID() , 496544 , 0 )
			sleep ( 40 )
			skill = 0
		end	
	end
end

function cl_762_chack()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	while 1 do
		sleep (50)
		if ReadRoleValue( boss , EM_RoleValue_IsDead ) ==  0 then
			local oo = GetDistance( OwnerID(), boss );
			if oo >= 1000 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3 )
			end
		elseif ReadRoleValue( boss , EM_RoleValue_IsDead ) ~=  0 then
			delobj ( OwnerID() )
		end
	end
end
function cl762random()  --用Beginplot(OwnerID(),"",0)執行就好
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local boss = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )
local fun = {"cl_762_1901mob1","cl_762_1901mob2","cl_762_1901mob3"}
local rand={}
local mon = {}
local monster = {105000,105001,105002}--放怪陣列
local monster1
	for i=1,table.getn(monster) do
		local x = ReadRoleValue (boss, EM_RoleValue_X)
		local y = ReadRoleValue (boss, EM_RoleValue_Y)
		local z = ReadRoleValue (boss, EM_RoleValue_Z)
		rand = Az_RND_Ary(-150,150,2)
		monster1 = CreateObj ( monster[i] , x+rand[1] , y , z+rand[2] , 0 , 1) --隨機字身周圍生怪
		AddToPartition(monster1,roomID )
		WriteRoleValue(monster1,EM_RoleValue_Livetime,20)  --存活時間
		WriteRoleValue ( monster1 , EM_RoleValue_PID, OwnerID())----
		WriteRoleValue ( monster1 , EM_RoleValue_Register3, boss )
		BeginPlot( monster1,fun[i], 10 )
		sleep ( 2 )
	end
end