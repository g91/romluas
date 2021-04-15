function un_762_190001AI() -------->多堤林斯控制器
    --local AI = OwnerID() ------->命名控制器叫做AI
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local open = 0 ---->開戰旗標 生出前門的旗標
	---local door2 = 0 ------>前門
	local bossrand = DW_rand(2)
	local timeup = 0
	local mob1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1)
	if bossrand ==1 then
		local boss = CreateObjByFlag( 104920 , 780794 , 5 , 1 )   -------用控制器將王生在這個旗標的位置
		AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
	WriteRoleValue ( boss , EM_RoleValue_PID, OwnerID() )  -----在王的PID身上寫入這個值,告訴王誰是控制器
	WriteRoleValue ( boss , EM_RoleValue_Register1, mob1 )
	BeginPlot( boss,"un_762_190001B", 10 )  -----------將王的scpipt塞進去王身上,讓王執行
	
		WriteRoleValue ( boss , EM_RoleValue_Register4,1 )
	elseif bossrand == 2 then
		local boss = CreateObjByFlag( 104920 , 780794 , 7 , 1 )   -------用控制器將王生在這個旗標的位置
		AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
	WriteRoleValue ( boss , EM_RoleValue_PID, OwnerID() )  -----在王的PID身上寫入這個值,告訴王誰是控制器
	WriteRoleValue ( boss , EM_RoleValue_Register1, mob1 )
	BeginPlot( boss,"un_762_190001B", 10 )  -----------將王的scpipt塞進去王身上,讓王執行
	
		WriteRoleValue ( boss , EM_RoleValue_Register4,2 )
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register2 ,0 )  -----當我把王生出來後就開始去讀取王身上的值,當值改變就會被我叫去做指定的事情
	
	
	while 1 do   -------每隔多久就跑一次這個迴圈
	    sleep (10)   -----每隔1秒就檢查一次這個迴圈
		--local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		local p = ReadRoleValue( OwnerID() , EM_RoleValue_Register2)  ------>P裡面的值代表裡面要做甚麼事情~~控制器去讀取Register1的值
		if p == 1 then   -------從p裡面去取出來我要的值(王會再結束戰鬥的時候才會丟值進去所以這裡我是每秒都在判斷王現在口袋裡的值)因為王進入戰鬥了~值就會變成1所以這裡不用做任何事情
			if open == 0 then  ------->當生門的旗標等於0的時候就生出前門
				ScriptMessage( OWNERID(), -1 , 2 , "[SC_104920_01]" , 2 )
			open = 1 ------->生完門後~就將旗標寫成1,避免門一直生
			end
			--timeup=timeup+1
		elseif p == 2 then ------從p裡面去取出來我要的值~當王死亡後取得2的值~就會刪掉前後門 , 並且清除場上所有物件
			---DelObj ( door1 ) ------刪掉後門
			---delobj (door2) -----刪掉前門
			open = 0 ----->要將開戰旗標寫回去0
		elseif p == 3 then ------從P裡面去取出來我要的值~當王離開戰鬥後後取得3的值的話~就要刪掉王~並且種一支新的王別忘記去將王加入物件內~並且告訴王~王是中控器生出來的~也要塞入王的script	
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register2 ,0 )  ---->將Register1寫回去0
			open = 0 ----->要將開戰旗標寫回去0
			--timeup=0
		end
		--if timeup>=300 then
			--if checkID(boss) == true then
				--addbuff(boss,507663,0,-1)
			--elseif	checkID(boss)==false then
			--	delobj(OwnerID())
		--	end
		--end
	end
end
function un_762_190001B()
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	local skill = 0 ----->普攻技CD時間
	local skill2 = 0 ---->全體AE CD時間
	local skill3 = 0 ----->巨石攻擊
	local skill4 = 0 
	local mots  -------->宣告誰是透明特效球
	local CombatBegin = 0  ------>宣告王的開戰旗標
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local bossrand = ReadRoleValue ( OwnerID() , EM_RoleValue_Register4)
	if bossrand == 1 then
		beginplot(OwnerID(),"un_PE3MOB1_9898",0) --移動1
	elseif bossrand ==2 then
		beginplot(OwnerID(),"un_PE3MOB1_9898_1",0) --移動2
	end
	--local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	SetPlot( OwnerID(),"dead","un_762_190001B_dead",10 )  ------>當王死亡後執行這段死王劇情
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep (10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			StopMove(OwnerID(),false)
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
			   CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			   WriteRoleValue ( AI , EM_RoleValue_Register2 ,1 ) ------當王進入戰鬥了~所以我要王再第一個口袋內寫進去1代表他進入戰鬥~這時候前門要生出來
			end
			   if CombatBegin == 1 then  ----->當開戰旗標內的值變成1的時候執行以下命令
				   skill = skill + 1   ----->skill每秒就+1上去 
				   if skill >= 3 then ----->當Skill的值大於等於5的時候
					  Luck = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
						if ( Luck >= 1 and Luck <= 10) or( Luck >=21 and Luck <= 30 ) or
						   ( Luck >= 41 and Luck <= 50 ) or ( Luck >= 61 and Luck <= 70 ) or
						   ( Luck >= 81 and Luck <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
						   CastSpell ( OwnerID() , AttackTarget , 496412  )----對當前目標釋放一個巨大傷害
						   sleep ( 20 )   --------->放玩法術後整個迴圈停兩秒
						elseif ( Luck >= 11 and Luck <= 20 ) or( Luck >= 31 and Luck <= 40 ) or
							   ( Luck >= 51 and Luck <= 60 ) or( Luck >= 70 and Luck <= 80 ) or
							   ( Luck >= 91 and Luck <= 100 ) then   ------------>當隨機出來的值等於以上的亂數就施放第二招
							   CastSpelllv ( OwnerID() , OwnerID() , 496411 , 19 )----前方扇形
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
						X1 = ReadRoleValue ( Attackplayer, EM_RoleValue_X)
						Y1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Y)
						Z1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
						mots = CreateObj( 104820 , X1, Y1 , Z1 , 0 , 1 )  ------------
						SetModeEx( mots , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( mots , EM_SetModeType_Move, false) ---移動	(否)
						SetModeEx( mots , EM_SetModeType_Searchenemy, false)--索敵(否)
						SetModeEx( mots , EM_SetModeType_Mark, false)			---可點選(是)
						SetModeEx( mots , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
						SetModeEx( mots , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( mots , EM_SetModeType_NotShowHPMP , false) ----不顯示HP條
						AddToPartition(mots,RoomID)
						CastSpell ( OwnerID() , mots , 496413 )
						BeginPlot( mots , "un_762_190000most" , 0 )
						sleep ( 30 )
						skill2 = 0
					end
					skill3 = skill3 + 1
					if skill3 >= 11 then
					   CastSpelllv ( OwnerID() , AttackTarget , 496410 , 13 )
					   sleep ( 30 )
					   skill3 = 0
					end
					skill4 = skill4+1
					if skill4>=20 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(10)
						end
						CastSpelllv ( OwnerID() , OwnerID() , 495621 , 12 )
							sleep(55)
						skill4 = 0
					end
				end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
			   CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
			   WriteRoleValue ( AI , EM_RoleValue_Register2 ,3)  ----當玩家離開戰鬥後~王要重置~所以回傳3的值給第一個口袋
			end
		end
	end
end

function un_762_190001B_dead() ----Boss 的死王劇情
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local bossmon =  ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	ScriptMessage( OWNERID(), -1 , 2 , "[SC_104920_2]" , 2 )
	WriteRoleValue ( AI , EM_RoleValue_Register2, 2 )
	WriteRoleValue ( bossmon , EM_RoleValue_Register9, 1 )
	--say(OwnerID(),"return  for "..bossmon.." regest9 = 1")
end

function un_762_190000most()  -----特效求施放法術
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	sleep ( 30 )
	CastSpelllv ( OwnerID() , OwnerID() , 496414 , 13 )
	sleep ( 20 )
	killid ( OwnerID() , OwnerID() )
end
function un_PE3MOB1_9898()---走旗標
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			--say(OwnerID(),"mob9898="..mob9898)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				--SetPosByFlag( OwnerID() , 780716, 2 )
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,2,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				SetPosByFlag( OwnerID() , 780805, 3 )
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function un_PE3MOB1_9898_1()---走旗標
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			--say(OwnerID(),"mob9898="..mob9898)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				--SetPosByFlag( OwnerID() , 780716, 2 )
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				SetPosByFlag( OwnerID() , 780805,6 )
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end	