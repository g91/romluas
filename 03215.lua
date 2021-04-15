--123563 皮傑爾 的初始劇情中會產生 艾利露
--123564 艾利露
--123618 艾利露(遊戲)

--皮傑爾初始劇情
function Lua_na_6thYears_123563()
	local Owner= OwnerID()
	LuaN_miyon_action02()
	WriteRoleValue( Owner , EM_RoleValue_PID , 0) --可接任務
--	Say( Owner , ReadRoleValue( Owner , EM_RoleValue_PID) )
	SetModeEx(Owner , EM_SetModeType_Mark, true  )
	local Ru = CreateObjByFlag( 123564 , 781357 , 0 , 1 )
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)  --產生艾利露
	WriteRoleValue( Owner, EM_RoleValue_Register9 , Ru ) --讓皮傑爾記住艾利露
	WriteRoleValue( Ru, EM_RoleValue_Register9 , Owner ) --讓艾利露記住皮爾傑
	SetModeEx(Ru, EM_SetModeType_Mark, true )--標記
	SetModeEx(Ru, EM_SetModeType_Move, true )--移動
	AddToPartition( Ru, Room )
end

--皮爾傑對話劇情，領取獎勵、進行遊戲
function Lua_na_6thYears_Jie() --皮傑爾 
	local Owner = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)
	AdjustFaceDir( Target , Owner , 0)

	if CheckFlag( Owner , 549358) == true then
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK4]" ) -- 歡迎你明天再來幫忙檢驗艾利露的表演技巧。
	elseif CheckFlag( Owner , 549357 ) == true then --領獎勵
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK3] " ) -- 我果然沒看錯人！
		GiveBodyItem( Owner , 209561 , 1)  --一個青蛙憑證	
		GiveBodyItem( Owner ,241128 , 1 ) --必爾汀圓貝禮包(小)
		SetFlag( Owner , 549358 , 1 ) --給予本日已領取獎勵的旗標
	elseif CheckFlag( Owner , 549355 ) == true then
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK2] " ) -- 我相信你的眼力應該不差...
		GiveBodyItem( Owner , 724509 , 1 ) --給予必爾汀藥水
		SetFlag( Owner , 549358, 1 )
	elseif PID == 0 then
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK1]" ) --我們是為了慶祝ROM周年慶而來到這裡的！...
		AddSpeakOption( Owner , Owner, "[SC_6YEARS_OPT1]" , "Lua_na_6thYears_Jie2(1)",0 ) --我想先練習一下
		AddSpeakOption( Owner , Owner, "[SC_6YEARS_OPT2]" , "Lua_na_6thYears_Jie2(2)",0 ) --直接正式開始
	else	
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK5]" ) --（目前[123563]正專注的觀察艾利露的表現。)
	end
end

--玩家點即進行的活動模式 練習or正式
function Lua_na_6thYears_Jie2(mode)
	local Owner = OwnerID() --玩家
	local Target = TargetID() --皮傑爾
	local Ru = ReadRoleValue( Target , EM_RoleValue_Register9) --艾利露
	local PID = ReadRoleValue ( Target , EM_RoleValue_PID)
	if PID == 0 then
		CloseSpeak(Owner)
		WriteRoleValue( Target, EM_RoleValue_PID , 1 ) --將皮傑爾的可接任務關閉
		if mode == 1 then --練習模式
			BeginPlot( Ru ,"Lua_na_6thYears_Ru2", 10)
		else --正式進行
			SetFlag( Owner , 549356 , 1 ) --正式進行的KEY
			BeginPlot( Ru ,"Lua_na_6thYears_Ru2", 10)
		end
	else
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK5]" )  --（目前[123563]正專注的觀察艾利露的表現。)
	end
end 


function Lua_na_6thYears_Ru2() 
	local Owner = OwnerID()  --艾利露
	local Target = TargetID() --玩家
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	local x, y, z, dir = DW_Location( 781357 , 1)
	Callplot( Owner, "Lua_na_6thYears_step" , Target ) 
	WriteRoleValue( Owner, EM_RoleValue_Register1 , Target ) --讓艾利露記住玩家
	MoveDirect(Owner ,x,y,z)
end


function Lua_na_6thYears_step(Player)  -- 產生NPC，開始遊戲
	local Owner = OwnerID() --艾利露
	local Jie = ReadRoleValue( Owner , EM_RoleValue_Register9)
	Callplot ( Jie , "Lua_na_6thYears_checkplayer" , Player)
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	local F = { } --全部的位置
	local R = DW_Rand(12)
	for i = 1 , 12 , 1 do
		F[i]= i  --1~12
 	end
------------------產生12個NPC-----------------------
	sleep(10)
	local Ru2 = { } --產生的物件群組，產生12個NPC
	local R = DW_Rand(#F)
	hide( Owner)
	ScriptMessage( Player , Player , 3 , "[SC_6YEARS_SPEAK8]" , 0 )  --我要開始囉！準備好了嗎？
	sleep(10)
	for i = 1 , #F do
		Ru2[i] = CreateObjByFlag( 123618, 781357 , i , 1 )  --遊戲中產生的艾利露分身
		SetModeEx( Ru2[i], EM_SetModeType_Mark, false )
		WriteRoleValue( Ru2[i], EM_RoleValue_IsWalk , 0 )
		MoveToFlagEnabled( Ru2[i], false )
		WriteRoleValue( Ru2[i], EM_RoleValue_PID , i )
		WriteRoleValue( Ru2[i], EM_RoleValue_Register9 , Jie)
		AddToPartition( Ru2[i], Room) 
		if i == R then
			WriteRoleValue( Ru2[i], EM_RoleValue_Register9 , Jie)
			WriteRoleValue( Ru2[i] , EM_RoleValue_Register6 , 6 )
			Say(Ru2[i], "[SC_6YEARS_SPEAK7]") --嘿！我在這裡喔！
		end	
		WriteRoleValue( Ru2[i], EM_RoleValue_Register1 , Player ) --讓艾利露記住玩家
		sleep(1)
	end
	for i = 1 , #Ru2 do
		AdjustFaceDir( Ru2[i], Jie , 0 )
	end
----------------------------------------------------------
	sleep(10)
	StartClientCountDown ( Player, 5, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--玩家Client顯示倒數5秒
	sleep(50)
	if CheckFlag( Player , 549356) == true then
		AddBuff( Player , 626284 , 2 , -1)  --加BUFF
		for i = 1 , #Ru2 do
			AddBuff( Ru2[i] , 626285 , 0 , -1)
		end
		Lua_na_6thYears_change(Ru2)
		sleep(20)
		Lua_na_6thYears_Move2(Ru2)
		sleep(20)
		Lua_na_6thYears_Move1(Ru2)

	else 		--練習模式
		Lua_na_6thYears_Move2(Ru2)
		sleep(30)
		Lua_na_6thYears_Move1(Ru2)
	end

	sleep(30)
	for j = 1 , #Ru2 do
		local NEW_PID =  ReadRoleValue(Ru2[j] , EM_RoleValue_PID)
		LuaFunc_MoveToFlag( Ru2[j] , 781357 , NEW_PID , 0 )	
	end
	sleep(10)
	for i = 1 , #Ru2 do
		AdjustFaceDir( Ru2[i], Jie , 0 )
		SetModeEx(Ru2[i], EM_SetModeType_Mark, true )--標記
		SetPlot( Ru2[i] , "touch" , "Lua_na_6thYears_Answer" , 10)
	end
	ScriptMessage( Player , Player , 3, "[SC_6YEARS_SPEAK6]" , 0 ) --請在20秒鐘內找到艾利露
	StartClientCountDown( Player, 30, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]") --直接正式開始
--	ScriptMessage( Player , Player , 2 , "[SC_6YEARS_SPEAK9]" , 0 )  --尋找出真正的艾利露
	Callplot ( Jie , "Lua_na_6thYears_Count30" , Player)
	sleep(50)
	DelObj( Owner)
end
	

function Lua_na_6thYears_Answer()	
	local Owner = OwnerID() --玩家
	local Target = TargetID() --艾利露
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID )
	local Answer = ReadRoleValue( Target ,  EM_RoleValue_Register6 )
	local Jie = ReadRoleValue(Target , EM_RoleValue_Register9)
	local Player = ReadRoleValue( Target , EM_RoleValue_Register1 )
	local R = DW_Rand(100)
	if Owner == Player then
		if Answer == 6 then
			if CheckFlag( Owner , 549355) == true or CheckFlag( Owner , 549357) == true then
				return
			else
				CancelBuff_NoEvent( Owner , 626284)
				local x, y, z ,dir = DW_Location( Target)
				local Ru = CreateObj( 123564 , x , y , z , dir , 1 )
				local x1, y1, z1, dir1 = DW_Location( 781357 , 0)
				if CheckFlag( Owner , 549356 ) == true then
					SetFlag( Owner , 549357, 1) 
					ScriptMessage( Owner , Owner, 3 , "[SC_6YEARS_SPEAK19]" , 0 )
				end
				SetModeEx( Ru, EM_SetModeType_Mark, false ) --表演用關閉可點擊
				StartClientCountDown( Owner, 0, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]" )	--倒數計時歸零
				StartClientCountDown (Owner, 0, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--玩家Client顯示倒數5秒
				BeginPlot( Jie , "Lua_na_6thYears_DelNPC",10)
				if R  < 35 then
					Say( Target , "[SC_6YEARS_SPEAK10]" ) --哎呀！被你看出來了！
				elseif R < 75  then
					Say( Target , "[SC_6YEARS_SPEAK11]" ) --你的眼力還不錯嘛！
				else
					Say( Target , "[SC_6YEARS_SPEAK12]" ) --被你看穿了！下一次絕對不會讓你找到！
				end
				DelObj( Target)
				AddToPartition( Ru , Room)
				MoveDirect( Ru ,x1,y1,z1)
				sleep(50)
				delobj(Ru)
				WriteRoleValue( Jie , EM_RoleValue_PID , 0 )
			end
		else
			if CheckFlag( Owner , 549355) == true or CheckFlag( Owner , 549357) == true then
				return
			else
				if R  < 35 then
					Say ( Target ," [SC_6YEARS_SPEAK13]" ) --哈哈！你猜錯了喔！
				elseif R < 75  then
					Say ( Target ," [SC_6YEARS_SPEAK14]" ) --答錯啦！這只是我的幻影！
				else
					Say ( Target ," [SC_6YEARS_SPEAK15]" ) --我才不會這麼容易讓你識破呢！
				end
				if CheckBuff( Owner , 626284) == true then
					local BuffLV = FN_CountBuffLevel(Owner,626284)
					if BuffLV == 0 then 
						if CheckFlag( Owner , 549356 ) == true then
							SetFlag( Owner , 549355, 1) 
							ScriptMessage( Owner , Owner, 3 , "[SC_6YEARS_SPEAK19]" , 0 )
						end
						CancelBuff_NoEvent( Owner , 626284)
						ScriptMessage( Owner , Owner, 1 , "[SC_6YEARS_SPEAK16]" , 0 ) --分辨次數已用盡，判斷結束。
						StartClientCountDown( Owner, 0, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]" )	--倒數計時歸零
						WriteRoleValue( Jie , EM_RoleValue_PID , 0 )
					else
						CancelBuff_NoEvent( Owner , 626284)
						AddBuff( Owner , 626284 , BuffLV-1 , -1)
						DelObj( Target)
					end	
				else
					DelObj( Target)
				end
			end		
		end
	else
		ScriptMessage( Target , Target , 2, "[SC_6YEARS_SPEAK18]", 0 )  --（[123564]目前無暇回應你）
	end
end


function Lua_na_6thYears_checkplayer(Player) --活動開始後，皮傑爾檢查玩家距離
	local Owner = OwnerID()
	local Ru = ReadRoleValue( Owner, EM_RoleValue_Register9 ) --艾利露
	while true do
		local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
		if PID == 1 then
			if CheckID( Player) == true then  --如果玩家在場
				local Dis = GetDistance( Owner , Player)
				if Dis > 120 then
					DelObj( Ru)
					ScriptMessage(Owner , Player, 1, " [SC_6YEARS_SPEAK9]", 0 ) 	--離開活動範圍，活動結束。
					StartClientCountDown( Player, 0, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]" )	--倒數計時歸零
					if CheckFlag( Player , 549356 ) == true then
						SetFlag( Player , 549355 , 1 ) --給予活動基本獎勵旗標
						ScriptMessage( Player , Player , 3 , "[SC_6YEARS_SPEAK19]" , 0 )
					end
					CancelBuff_NoEvent( Player , 626284)
					WriteRoleValue( Owner , EM_RoleValue_PID, 0 )	
					BeginPlot( Owner , "Lua_na_6thYears_DelNPC" , 10)
					break
				elseif  Dis > 60 then
					ScriptMessage( Owner , Player , 1, "[SC_6YEARS_SPEAK17]", 0 ) --注意！你即將離開活動範圍！
				end	
			else
				WriteRoleValue( Owner , EM_RoleValue_PID, 0 )	
				DelObj( Ru)
			end
		else 
			BeginPlot( Owner , "Lua_na_6thYears_DelNPC" , 10)
			DelObj( Ru)
			break
		end
		sleep(10)
	end
	Lua_na_6thYears_123563()
end


function Lua_na_6thYears_Count30(Player)
	local Owner = OwnerID()
	local N = 0
	for i = 1 , 30 do
		if ReadRoleValue( Owner , EM_RoleValue_PID) == 1 then
			N = N+1
			if N == 30 then
				WriteRoleValue( Owner , EM_RoleValue_PID, 0 )	
				if CancelBuff( Player , 626284 ) == true then
					CancelBuff( Player , 626284 )
					SetFlag( Player , 549355 , 1 )
					ScriptMessage( Player , Player , 3 , "[SC_6YEARS_SPEAK19]" , 0 )
				end
				break
			end
			sleep(10)
		else
			break
		end
	end	
end

function Lua_na_6thYears_DelNPC()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 120)
	for i = 0, #NPC do
		if ReadRoleValue(NPC[i] , EM_RoleValue_OrgID ) == 123618 then
			DelObj(NPC[i])
		end
	end
end

function Lua_na_6thYears_Buffdel()
	local Owner = OwnerID()
	SetFlag( Owner , 549355 , 1 )
	return
end

----------------------------------------------------------------------------

--------------------------種圓形旗標用的----------------------------------
function Lua_Na_6thYearS_SetNPC()	-- 產生種NPC的圓形位置
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner  , EM_RoleValue_RoomID )
	local Obj = Role:new( Owner  )
	local x,y,z,dir = DW_Location(Owner)
	local RusterGroup = {}
	local RusterID = 113105 -- 隱藏物件
	local S = { 12 }-- 幾邊型
	local D = { 40 } -- 距離圓心的距離
	local Count = 1

	for i = 1 , table.getn(S) do
		for j = 1 , S[i] , 1 do
			RusterGroup[Count] = CreateObj( RusterID , x-D[i]*math.cos(math.pi*2*(j/S[i])),y,z+D[i]*math.sin(math.pi*2*(j/S[i])),Dir, 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(RusterGroup) do
		AddToPartition( RusterGroup[i] , RoomID )
	end
end


function Lua_na_6thYears_Clearflag()
	local Owner = OwnerID()
	local Flag = {	549355, 549356, 549357, 549358	}
	for i = 1 , #Flag do
		SetFlag( Owner , Flag[i] , 0 )
	end
end



-- Na_Del_NPC(113105)


--五周年登入禮包
Function LuaI_205036() --五週年慶禮包
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[205036]][$SETVAR3=[202936]]" 

	local itemset  = {	1 , Prize1Str 	, { 202936 , 1 }	
				, 1 ,""	, { 202936 , 1 }			--永久黃色蘑菇人坐騎*1 	202936		
				, 201 ,""	, { 202934 , 1 }			--30天黃色蘑菇人坐騎*1 202934	
				, 500 ,""	, { 202434 , 1 } 	   		--每日任務重置券*3 202434
				, 1050 ,""	, { 202434 , 3 } 	   	--每日任務重置券*1 202434
				, 1600 ,""	, { 201141 , 1 }		--菲尼克斯的救贖*1 201141
				, 2600 ,""	, { 242723 , 3 }		--進階星屑武器石*3 242723
				, 3600 ,""	, { 242724 , 3 }		--進階星屑裝備石*3 242724
				, 4600 ,""	, { 242725 , 3 }		--進階星屑首飾石*3 242725
				, 6400 ,""	, { 202435 , 5 }		--家的羈絆*5 202435
				, 8200 ,""	, { 202902 , 5 }		--空間紀錄墨水*5 202902
				, 10000 ,""	, { 202903 , 5 }	}	--傳送者符文*5 202903

	return BaseTressureProc4(   itemset , 1  )

end

--測試廣播訊息用
function LuaI_205036_Cast()
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[205036]][$SETVAR3=[202936]]" 
	RunningMsgEx( OwnerID() , 2 , 2 , Prize1Str )
end