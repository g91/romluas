function LuaI_201367() --春季電腦展禮包

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202322 , 1 , 202264 , 1 , 202320 , 1 , 201139 , 1 , 203576 , 1 , 203047 , 2 , 203048 , 2 , 206277 , 1} }	
	-- 高效幸運藥劑、一天經驗藥劑、一天技能藥劑、大天使的嘆息、大師黃金修理鎚、完美護佑武器石 203047 X2、完美護佑裝備石 203048 X2 、30天雪貂坐騎 206277 (水上飛)

	return BaseTressureProc(   itemset , 8 )
end