
function LuaS_420635_callone()
	local playerID = TargetID() --玩家的id存入
	local followobj = CreateObj ( 100650, ReadRoleValue( OwnerID(), EM_RoleValue_X) , ReadRoleValue( OwnerID(), EM_RoleValue_Y) ,     ReadRoleValue( OwnerID(), EM_RoleValue_Z) , 0 , 1 ) --做隻導盲犬出來
	SetRoleCamp( followobj  , "SNPC" )--改變陣營
	AddToPartition( followobj ,    0 ) --把導盲犬放進場景
	WriteRoleValue (  followobj , EM_RoleValue_PID ,  playerID ) --玩家的id放進導盲犬的暫存
	BeginPlot( followobj , "LuaS_420635", 0 )	--命令導盲犬執行程序
	DisableQuest( OwnerID() , true )--關閉接任務
	while 1 do
		if CheckID( followobj ) then
			
		else
			DisableQuest( OwnerID() , false )--OPEN接任務
			break
		end

		Sleep(10)
	end
end

function LuaS_420635()
	local s = 0 --防止無限迴圈的計次變數
	local w = 0 --防止玩家離太遠的變數
	local f = 0 --目前走到第幾根旗子
	local fc =  GetMoveFlagCount( 780074 )--有多少隻旗子 
	local playerID = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --從暫存區中領出玩家id
	local bitch = TargetID() --把目標記入了ID
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 2  )--用走的
	MoveToFlagEnabled( OwnerID() , false )--關閉巡邏劇情
	sleep(10)--等一秒
	while 1 do--無限迴圈
		local fx = GetMoveFlagValue( 780074 , f , EM_RoleValue_X )--抓階段旗的x
		local fy = GetMoveFlagValue( 780074 , f , EM_RoleValue_Y )--抓階段旗的y
		local fz = GetMoveFlagValue( 780074 , f , EM_RoleValue_Z )--抓階段旗的z
		local ox = ReadRoleValue( OwnerID(), EM_RoleValue_X)--自己的x
		local oy = ReadRoleValue( OwnerID(), EM_RoleValue_Y)--自己的y
		local oz = ReadRoleValue( OwnerID(), EM_RoleValue_Z)--自己的z
		local tx = ReadRoleValue( TargetID(), EM_RoleValue_X)--目標的x
		local ty = ReadRoleValue( TargetID(), EM_RoleValue_Y)--目標的y
		local tz = ReadRoleValue( TargetID(), EM_RoleValue_Z)--目標的z
		local hp = ReadRoleValue( OwnerID(), EM_RoleValue_HP)--自己的hp
		local maxhp = ReadRoleValue( OwnerID(), EM_RoleValue_MaxHP)--自己的maxhp
		
		if s > 60000 then--若已執行60000(無窮迴圈)
			DisableQuest( bitch , false )--恢復接任務
			DelObj(OwnerID())--把自己刪掉
			break--跳出
		else
			s = s + 1--計次
		end
		--若玩家離開太遠超過十秒
		if w > 10 then
			ScriptMessage( OwnerID(), playerID, 2 ,GetString("SAY_420635_1"),1)--送訊息叫他重接
			Sleep(10)
			DisableQuest( bitch , false )--恢復接任務w
			DelObj(OwnerID())--把自己刪掉
			break
		end
		--玩家的距離是否在範圍內
		if GetDistance( OwnerID(), playerID ) > 150 then--超過
			ScriptMessage( OwnerID(), playerID, 2 ,GetString("SAY_420635_0"),1)--提醒玩家
			w = w + 1--開始計數
			Move( OwnerID(), ox , oy ,oz )--停住
		else--在範圍內
			w = 0
			--自己有沒有被攻擊
			if hp == maxhp then--血滿
				if ( (fz/10) == (oz/10) ) and ( (fx/10)==(ox/10) ) then--到了
					if f == fc -1 then --終點
						Sleep (27)
						Say ( OwnerID() , GetString("SAY_420635_2"))--叫：能量不足！
						CastSpell( OwnerID() , OwnerID() , 491008 )--放個傳送特效
						DisableQuest( bitch , false )--恢復接任務
						SetFlag( playerID , 540853 , 1 )--給任務完成的重要物品
						DelObj(OwnerID())--把自己刪掉
					else--不是終點
						f = f + 1 --往下一根前進
					end
	
				else--差得遠
					Move ( OwnerID() , fx , fy , fz )--往旗子跑去
				end
			else--沒滿
				Move ( OwnerID() , tx , ty , tz )--打目標
			end
		end
		WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 2  )--用走的

		sleep(10)--等一秒
		
	end
end