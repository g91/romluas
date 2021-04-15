--公會教場-10. 狼來了 -- 羊
-- [此段函式功能如有疑問 可洽 阿信 ]

--筆記區

-- zone354 產羊專用函式 
function Lua_Zone354_Create( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range )
	--FlagObjID 旗幟物件編號
	--FlagNum 旗幟數量	
	--Obj 種植物件編號
	--ObjNum 種植物件數量
	--counterObj 中控物件編號	
	--resetTime 重製時間(秒)
	--Range 生怪範圍
	local ctrl = OwnerID() --中控物件
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID ) --區域編號
	Zone354_GlobalSheep = {}
	local create = Zone354_GlobalSheep
	local num
	local random
	local objID
	local count = 0
	local x
	local y
	local z

	if ObjNum > FlagNum then
		ObjNum  = FlagNum 
	end
		
	--debugmsg( 0, 0, "counter = "..counter )
	for i=0, FlagNum do
		create[i] = 0 
	end
		
	while true do
		count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
--		DebugMsg(0,0,"Sheep Count = "..count )
		
		if count < ObjNum then
			for i=count, ObjNum-1 do
				Sleep(1)				
				random = rand(FlagNum)
				if  create[random ] > 1 then
					while true do
						sleep(1)
						random = ks_CreateObjSearch( create, FlagNum, 0 )
						if random ~= nil then break	 end
						random = rand(FlagNum)
						if  create[ random ] > 1 then break end
					end
				end

				if random ~= nil then 
					x = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_X ) 
					y = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_Y ) 
					z = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_Z ) 	
						
					create[random] = CreateObj( Obj, x+math.random(-Range,Range), y, z+math.random(-Range,Range), rand(360), 1 )
					
					SetModeEx( create[random], EM_SetModeType_Fight, false )
					SetModeEx( create[random], EM_SetModeType_Searchenemy, false )
					WriteRoleValue( create[random], EM_RoleValue_Register1, ctrl )
					WriteRoleValue( create[random], EM_RoleValue_Register2, random )
					AddToPartition( create[random], RoomID )
					
					CallPlot( create[random], "Lua_Zone354_SheepMove", 0 )  -- 
					
					AddRoleValue( ctrl, EM_RoleValue_Register1, 1 )
					Sleep(1)					
				end
				count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
			end
		end
			
		for i=1, resetTime*2 do
			local ResetFlag = ReadRoleValue( ctrl, EM_RoleValue_Register2 )
			if ResetFlag ~= 0 then
		--		DebugMsg(0,0,"ResetFlag "..ResetFlag)
				create[ResetFlag] = 0
				WriteRoleValue( ctrl, EM_RoleValue_Register2, 0 )
			end
			sleep(5)
		end
	end
end





-- 羊出生後執行劇情
--- 狼 > 草 >  隨機移動

function Lua_Zone354_SheepMove()--羊移動
	local Sheep = OwnerID()

	AddBuff(Sheep, 506292, 2, -1 )  --羊出生掛buff , 血量 等級3
	local life =  FN_CountBuffLevel(Sheep, 506292 )  
--	Say( Sheep, "life is "..life )

	local timer = 0
--	Say( Sheep, "timer ="..timer )
	sleep(30)
	MoveToFlagEnabled( sheep, false )

	while true do
		sleep(10)
		timer = timer +1	
	--	DebugMsg( 0 , 0 , "sheep timer = "..timer )		

		if timer%6 == 0 then   -- 每5秒跑一次
		--	DebugMsg( 0 , 0 , "sheep timer % = 5")

			local count1 = Lua_Hao_NPC_Range_Search( Sheep ,105024 , 150 )  -- range 內物件數量 (狼) 
			local count2 = Lua_Hao_NPC_Range_Search( Sheep , 117052, 50 )  -- range 內物件數量 ( 草)

	--		DebugMsg( 0 , 0 , "wolf count is "..count1 )
	--		DebugMsg( 0 , 0 , "grass count is "..count2 )

			if count1 > 0  then -- 有狼
				local Wolf = Lua_Hao_NPC_Closest_Search( Sheep , 105024  , 150 ) -- 以Owner為中心做范圍搜尋，回傳最接近的物件
				local wolfdead =  ReadRoleValue( wolf, EM_RoleValue_Register3 )  -- 狼已死  r3 = 1 狼死了 , r3 = 0 狼活著

				if wolfdead == 0 and CheckBuff( Sheep, 507702) == false then  -- 如果沒恐懼buff
					sleep(20)
					AdjustFaceDir(Sheep, wolf, 0 ) --面向
				--	Say( Sheep, "there is a wolf !")
					CastSpell( Sheep, Sheep,492444 )  -- 放驚嘆號
					sleep(5)
					Addbuff( Sheep, 507702, 0 , 10 )  -- 給恐懼Buff 
				end

			elseif count2 > 0 then  --有草
				local grassbuff = CheckBuff(Sheep, 507700 ) -- 羊是否有飼料buff

				if CheckBuff( Sheep ,  507702 ) == false  and grassbuff == false  then  -- 沒 恐懼BUFF + 沒 食物BUFF

					local Grass = Lua_Hao_NPC_Closest_Search( Sheep , 117052  , 50 )-- 以Owner為中心做范圍搜尋，回傳最接近的物件
					local dis2 = GetDistance(Sheep, Grass )  -- 羊 和 找到的草的距離

				--	Say( Sheep, "Find food !")   --發現食物時說話
				--	Say( Grass , "I am the closest  one " )
					AdjustFaceDir(Sheep, Grass, 0 ) --面向
					sleep(15)
					PlayMotion( Sheep, 120 )  -- 播放idle動作 吃東西
					sleep(5)
					AddBuff(Sheep, 507700, 0 , -1 )
					ks_CreateObj_reset( true, Grass )-- 告知中控物件此位置已清空
				else
			--		Say( Sheep, " I don't want eat now ..." )
				end

			--	Say(Sheep, "check grass end" )
			else
				--	Say( Sheep, " do nothing.." )
			end

		elseif timer%23 == 0 then  --每X秒跑一次
	--		DebugMsg( 0 , 0 , "sheep timer % = 23")

			local X = ReadRoleValue( Sheep, EM_RoleValue_X )
			local Y = ReadRoleValue( Sheep, EM_RoleValue_Y )
			local Z = ReadRoleValue( Sheep, EM_RoleValue_Z )
			local D = ReadRoleValue( Sheep, EM_RoleValue_Dir )

			local Range = 20 +  rand(6) --亂數移動範圍

			if D > 170 then
				local dir = D-rand(20)
		--		Say(Sheep, "sheep dir  1 = "..dir )
				AdjustDir( sheep, dir )
			else 
				local dir = D+rand(20)
		--		Say(Sheep, "sheep dir  2 = "..dir )
				AdjustDir( sheep, dir )
			end

	--		say(Sheep, "sheep move range = "..range )
			sleep(30) 
			MoveDirect( Sheep, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )

		end
	end
end


-- zone354專用 產生位置清空
-- [此函式功能如有疑問 可洽 阿信]
function Lua_Zone354_Reset( Obj )--Delete (是否刪除); Obj (對象)
	Obj = Obj or OwnerID()
	local ctrl = ReadRoleValue( Obj, EM_RoleValue_Register1 )
	local Flag = ReadRoleValue( Obj, EM_RoleValue_Register2 )
	AddRoleValue( ctrl, EM_RoleValue_Register1, -1 )--count-1
	WriteRoleValue( ctrl, EM_RoleValue_Register2, Flag )--FlagClear
--	DebugMsg(0,0,"Flag "..Flag.."; Ctrl = "..Ctrl )
	Sleep(5)
	DelObj( Obj )
end