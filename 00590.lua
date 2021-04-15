Function LuaI_207042() --package mount 1

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 206275,1 , 202929 , 1 } --永久雪貂坐騎、魔幻寶盒能量50點 
		        } 

	return BaseTressureProc(   itemset , 2  )
end

Function LuaI_207043() --package mount 2

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 203676,1 , 202929 , 1 } --永久獨角獸坐騎 、魔幻寶盒能量50點 
		        } 

	return BaseTressureProc(   itemset , 2  )
end

Function LuaI_207044() --Package 1

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 201086,1 , 202434 , 1 , 201139 , 1 , 202506 , 1 , 201088 , 1} --高等技能重置石、每日任務重置券、大天使的嘆息、黃金修理鎚、進階武器打孔器
		        } 

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207045() --Winner PvP

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 201161,1 , 201141 , 1 , 202506 , 1 , 201450 , 10 , 201457 , 10} --30天小巨人寵物蛋、菲尼克斯的救贖、黃金修理鎚、神願武器石、神願裝備石
		        } 

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207046() --Runner up PvP

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 201161,1 , 201141 , 1 , 202506 , 1 , 201450 , 5 , 201457 , 5} --30天小巨人寵物蛋、菲尼克斯的救贖、黃金修理鎚、神願武器石、神願裝備石
		        } 

	return BaseTressureProc(   itemset , 5  )
end

