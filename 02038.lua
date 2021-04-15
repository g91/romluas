function Lua_Pumpkin_na_NPCspeak()	--NPC 貝拉．洛斯林初始化SCRIPT
	LoadQuestOption( OwnerID())
	SetSpeakDetail( OwnerID(), GetString("[SC_PUMPKIN_NA_11]") )	--又到了南瓜豐收的季節了！有點恐怖卻充滿趣味的節日，你今年也有打算對誰惡作劇嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1"), "LuaS_111490_1", 0 )	--關於南瓜節的由來
end

function Lua_Pumpkin_na_createNPC()  -- 活動時間判斷
	if Pumpkin_All == nil then			-- 2010.08.27 新增  全域變數
		Pumpkin_All = {}			--
	end						--
	while true do
		local min = GetSystime(2)
	--	say(OwnerID(), hour )
		--say(OwnerID(), min )
		local ZoneID = ReadRoleValue(OwnerID() , EM_RoleValue_RealZoneID)				
		local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

		if Zone == 15 then
			if  min == 15 or min == 45 then  --每30
				-- 1. 廣播
  				RunningMsg( OwnerID() , 1 , "[SC_PUMPKIN_NA_10]" ) 	--  (0 自己 1 區域 2 全部玩家 )。小南瓜精又出現在達拉尼斯城中搗蛋了！
				--2. 產南瓜
				BeginPlot(OwnerID(), "Lua_Pumpkin_na_createNPC1" , 0 )  --產生南瓜	
			elseif min == 20 or min == 50 then  
				RunningMsg( OwnerID() , 1 , "[SC_PUMPKIN_NA_12]" ) 	--達拉尼斯城中得可疑的南瓜都消失了。
				BeginPlot( OwnerID(),"Lua_Pumpkin_na_DelPumpkin", 0 ) -- 刪除所有南瓜
			end
		end
		Sleep(600)   --一分鐘跑一次
	end
end
--

function Lua_Pumpkin_na_createNPC1()	--南瓜NPC產生函式
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local x = {}	--宣告X為一個table

	for i=0,49,1 do	--for迴圈，起始值為1，共跑50次，隨機出現50個可疑的南瓜
		local RandomNumber = Rand(99)+1	--隨機取一個數字，+1為了讓random數字不會為0
	--	say(OwnerID(), RandomNumber)
		if RandomNumber >= 30 then	--出現 可疑的南瓜，會施放範圍驚嚇BUFF
			x[i] = CreateObjByFlag( 116032 , 780322 , i ,1 )	--物件在旗標的位置重生
			AddToPartition(x[i],RoomID )	--在遊戲中顯示
			BeginPlot(x[i], "Lua_Pumpkin_na_panicbuff" , 0 )  --掃周圍玩家，使用BUFF
		elseif  RandomNumber < 30 then	--出現可疑的南瓜 ，點擊後消失
			x[i] = CreateObjByFlag(115349, 780322 , i ,1 )
			AddToPartition(x[i],RoomID )
		end
	end
	Pumpkin_All = x	-- 2010.08.27 新增  全域變數
end	
------------------------------------------------------------------------------
function Lua_Pumpkin_na_scarymessage()	--受到南瓜精驚嚇的訊息
	ScriptMessage( TargetID() , TargetID() , 1 , GetString("SC_PUMPKIN_NA_01") , C_SYSTEM )	--受到小南瓜精的驚嚇！
	ScriptMessage( TargetID() , TargetID() , 0 , GetString("SC_PUMPKIN_NA_01") , C_SYSTEM )	--受到小南瓜精的驚嚇！
end

------------------------------------------------------------------------------
function Lua_Pumpkin_na_panicbuff()	--恐懼的BUFF
	while true do
		sleep(100) 
		CastSpell(OwnerID(),OwnerID(),496070 )
	end
end

------------------------------------------------------------------------------
--南瓜的觸碰劇情
function Lua_Pumpkin_na_touch1()
	SetPlot( OwnerID() , "touch" , "Lua_Pumpkin_na_touchA" , 50 )
end


function Lua_Pumpkin_na_touch2()
	SetPlot(  OwnerID() , "touch" , "Lua_Pumpkin_na_touchB" , 50 ); --設定物件的觸碰劇情，50為範圍
end


function Lua_Pumpkin_na_touchA()	--壞南瓜
	--OwnerID為玩家
	--TargetID為南瓜
	if ReadRoleValue ( TargetID() , EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1 )
		local cage = CountBodyItem( OwnerID(), 207267)
		if cage >=1 then
			for i=0,table.getn(Pumpkin_All) do	-- 2010.08.27 新增  全域變數
				if Pumpkin_All[i] == TargetID() then	--
					Pumpkin_All[i] = 0	--
				end
			end
			BeginPlot( TargetID(), "Lua_Pumpkin_na_createNPC2", 0)
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_02") , C_SYSTEM )	--發現小南瓜精！
			ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_02") , C_SYSTEM )	--發現小南瓜精！
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--看起來有點可疑的南瓜。
			ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--看起來有點可疑的南瓜。	
		end
	end
end

function Lua_Pumpkin_na_touchB()	--普通南瓜
	--OwnerID為玩家
	--TargetID為南瓜
	local cage = CountBodyItem( OwnerID(), 207267)
	if cage >=1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_03") , C_SYSTEM )	--這只是普通的南瓜。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_03") , C_SYSTEM )	--這只是普通的南瓜。
		for i=0,table.getn(Pumpkin_All) do	-- 2010.08.27 新增  全域變數
			if Pumpkin_All[i] == TargetID() then	--
				Pumpkin_All[i] = 0	--
			end				--
		end					--
		DelObj( TargetID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--看起來有點可疑的南瓜。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--看起來有點可疑的南瓜。	
	end
end

--------------------------------------------------------------------------------
function Lua_Pumpkin_na_createNPC2()	--產生小南瓜精 劇情	
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得南瓜的 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  116033  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在南瓜座標 X.Y.Z.Dir 身上準備創立 小南瓜精
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, true )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	Hide( OwnerID() )
	AddToPartition( NPC , RoomID) -- 建立物件
--	PlayMotion(NPC, 37)  
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	--SetRandMove( NPC, 20, 5, 10)	-- 設定小南瓜精隨機移動，範圍、間隔時間(100為一秒)、最大移動距離
	Say( NPC, "[SC_PUMPKIN_NA_05]" )--唉呀！被發現啦！
	BeginPlot( NPC, "Lua_Pumpkin_na_createNPC3", 80 )
	DelObj(OwnerID())
end

function Lua_Pumpkin_na_createNPC3()	--小南瓜精出現8秒後消失
	Say( OwnerID(), "[SC_PUMPKIN_NA_06]" ) -- 哈哈！你抓不到我。
	Delobj( OwnerID() )	--小南瓜精8秒後刪除
end	

------------------------------------------------------------------------------
function LuaI_207267_Check()  --檢查此物品是否在特定NPC身上，物品 南瓜精捕獸籠 的劇情
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 116033 --小南瓜精

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_07") , C_SYSTEM )	--此獸籠僅只能用於捕捉小南瓜精。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_07") , C_SYSTEM )	--此獸籠僅只能用於捕捉小南瓜精。
		return false	
	end
end

------------------------------------------------------------------------------
function LuaI_207267_Effect()   --機率判定 
--OwnerID為玩家
--TargetID為南瓜精
	local random = rand(100)
	if random >40 then  -- 抓到小南瓜精 機率為60%
		BeginPlot( OwnerID() , "LuaI_207267_Delitem" , 0 )  
	else --抓不到小南瓜精  40%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_08") , C_SYSTEM )	--小南瓜精逃走了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_08") , C_SYSTEM )	--小南瓜精逃走了。
	end
	Delobj(TargetID() )

end
------------------------------------------------------------------------------
function LuaI_207267_Delitem()   --成功抓回        
--Owner 與 Target皆為玩家
	sleep(20)	
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_09") , C_SYSTEM )	--你抓到了小南瓜精！
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_09") , C_SYSTEM )	--你抓到了小南瓜精！
	GiveBodyItem( OwnerID() , 207268 , 1)	--給予 裝著南瓜精的籠子
	DelBodyItem( OwnerID() , 207267 , 1) 	--刪除 南瓜精捕獸籠
end


function Lua_Pumpkin_na_DelPumpkin()	--時間到刪除所有南瓜
	--local NPC = { 115349,116032 }
	--Lua_DavisDelObj(NPC)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	
	for i=0,table.getn(Pumpkin_All) do	-- 2010.08.27 新增  全域變數
		if Pumpkin_All[i] > 0  then	--
			DelObj(Pumpkin_All[i])	--
			Count = Count + 1	--
--	DebugMsg( 0 , RoomID ," Pumpkin_All NM =  "..Pumpkin_All[i] )
		end				--
	end					--
--	DebugMsg( 0 , RoomID ," Remove Count =  "..Count )
	Pumpkin_All = {}			--
end


--------------------------------------------------------------------------------
--南瓜節獎勵

function LuaI_207964( Option ) --南瓜驚奇包
	local PlayerID = OwnerID()
	local PackageID = 207964	
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725450 , 1 )	
	end
end