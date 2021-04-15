
function star_score()
	star_WorldBattle_ScoreCal(1 , 1)	
end

function star_endminute_on()
	SetWorldVar( "star_WorldBattle_GetMinute"  , 1 )
	SetWorldVar( "star_WorldBattle_EndMinute"  , 16 )
end

function star_endminute_off()
	SetWorldVar( "star_WorldBattle_GetMinute"  , 0 )
	SetWorldVar( "star_WorldBattle_EndMinute"  , 0 )
end

------------------------------------------------------------------------------------------------------------------------------------new
function star_auction()
	local Leader = OwnerID()
	local StopCounter = 0
	local MinCounter = 0
	local range = 150		--活動半徑範圍
	--local CTRL = ReadRoleValue( Leader , EM_RoleValue_Register1 )
	--local prize = ReadRoleValue( Leader , EM_RoleValue_Register10 )  --讀出獎品
	local t = 0		--暫存分數
	local Temp = {}
	while 1 do
		sleep(10)
		StopCounter = StopCounter + 1
		MinCounter = MinCounter + 1
--※ 報數 ※--
		if MinCounter >= 5 then
			local Win01 = SearchRangePlayer( Leader , range ) --周圍150玩家
			--Sleep(20)
			local Win02 = SearchRangeNPC ( Leader , range ) --周圍150 NPC
			
			
			--Say( OwnerID() , table.getn(Win01) )
			for x = 0 , table.getn(Win01)-1 do 				--有分數的紀錄
				if CheckBuff( Win01[x] , 623237 ) == true then
					--Say( Win01[x] , "hi" )	
					local buff_lv = star_BuffInfo( Win01[x] , 623237 , EM_BuffInfoType_Power )
					Say( Win01[x] , "lv ="..buff_lv )
					if t < buff_lv then
						t = buff_lv
					end
					Temp[table.getn(Temp)+1] = Win01[x]
				else
					Say( Win01[x] , "no" )
				end
			end
			for y = 0 , table.getn(Win02)-1 do 				--有分數的紀錄
				if CheckBuff( Win02[y] , 623237 ) == true then	
					local buff_lv = star_BuffInfo( Win02[y] , 623237 , EM_BuffInfoType_Power )
					if t < buff_lv then
						t = buff_lv
					end
					Temp[table.getn(Temp)+1] = Win02[y]
				else
					Say( Win02[y] , "no" )
				end
			end
			MinCounter = 0
		end
		if StopCounter >= 18 then			--活動結束
			for z = 1 , table.getn(Temp) do
				Say( Temp[z] , "I" )
				local buff_lv = star_BuffInfo( Temp[z] , 623237 , EM_BuffInfoType_Power )
				if buff_lv == t then
					Say( OwnerID() , getname(Temp[z]).." You r Good!" )
				end
			end
			sleep(20)
			break
		end
	end	



end 

function star_auction_addbuff()
	AddBuff( OwnerID() , 623237 , 0 , 600 )
end


