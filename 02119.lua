function LuaAS_test_01()
	local X = 2
	local Y = 2
		while X < 10 do
			while Y < 10 do
				Say(OwnerID(),X.."x"..Y.."="..X*Y)
				Sleep(10)
				Y = Y+1
			end
			if 	X == 4	 	and
				Y == 10 		then
			break
			end
			X = X+1
			Y = 2
		end
end

	

function LuaAS_test_02()
	local AS_StringTable = {"1","2","3","4","5"}
	for Y =1,5 	do
		local X = Rand(4)
		X = X+1
		Say(OwnerID(),AS_StringTable[X])
		sleep(10)
	end
end


Function LuaAS_test_03() 

local Player = {1,5,7,10,30,40}
-- 會有六個玩家經過喔，有上面這六個不同等級的人。
local MonsterTable = {100015,100017,100055}
-- 我有三種怪物喔，上面這三種。
local monster = {}
-- 我等等要把出現過哪些怪物，一次次都記在monster這個table裡面喔。
local BornCount = {0,0,0}
-- 然後我有三種怪物，我要個別計算他們出現過幾次。
local PC_LV
-- 等等程式跟我說經過玩家幾等級的時候我要放進去喔～

PC_LV = player[rand(5)+1]
-- 隨便從六個玩家裡面抓一隻出來！

say (OwnerID() , "我" .. PC_LV .. "級喔！")
-- 報告自己的等級！

if PC_LV < 11 then
-- 所以玩家是不是十級以內？
	table.insert(monster, monstertable[1])
	-- 把monstertable裡面第1格的怪物，插進monster的最後面，記錄起來。
	BornCount[1] = BornCount[1] +1
	-- 在BornCount的第1格，記錄我（又）放了一次第1種怪物。
elseif PCLV < 31 then
-- 所以玩家是不是三十級以內？
	table.insert(monster, monstertable[2])
	-- 把monstertable裡面第2格的怪物，插進monster的最後面，記錄起來。
	BornCount[2] = BornCount[2] +1
	-- 在BornCount的第2格，記錄我（又）放了一次第2種怪物。
else
-- 都不是喔？
	table.insert(monster, monstertable[3])
	-- 把monstertable裡面第3格的怪物，插進monster的最後面，記錄起來。
	BornCount[3] = BornCount[3] +1
	-- 在BornCount的第3格，記錄我（又）放了一次第3種怪物。
end

end


function LUAfafa_test_01()

local Player = {800011,800012,800013,800014,800015,800016}
local Kill = {10,5,9,2,1,4}
-- 題目提示內容。
local resort_kill = {0}
local resort_id = {1}
local PCnum = gottable.getn (Player)
local KLnum = gottable.getn (Kill)
local RSnum
local check_a = 0
local i = 2
local j
local k
local l = 1


	resort_kill[1] = Kill[1]
	resort_kill[1] = Kill[1]
	while i < (PCnum+1)	do
		j = 1
		while j < (PCnum+1)	do
			if Kill[i] > resort_kill[j] 	then
				table.insert(resort_kill, 0)
				table.insert(resort_id, 0)
				RSnum = gottable.getn (resort_kill)
				k = 1
				while k < (RSnum-j+1)	do
					resort_kill[RSnum-k+1] = resort_kill[RSnum-k]
					resort_id[RSnum-k+1] = resort_id[RSnum-k]
					k = k + 1
				end
				resort_kill[j] = kill[i]
				resort_id[j] = i
				check_a = 1
			end 
			j = j + 1
		end
		if check_a == 0	 then
			table.insert(resort_kill, Kill[i])
			table.insert(resort_id, i)
		end
		check_a = 0
		i = i + 1
	end
	say (OwnerID() , gottable.getn (resort_id) .. " player(s), The place is:")
	while l < (gottable.getn (resort_id)+1)	do
		say (OwnerID() , "ID:" .. Player[resort_id[l]])
		l = l + 1
	end


end

function LuaAS_addbuff_01()
	AddBuff ( OwnerID(), 509276, 0, -1 )
end