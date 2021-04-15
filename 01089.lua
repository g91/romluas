function LuaYU_goodman( Option )
	sleep(10)
	local PlayerID = OwnerID()
	local PackageID = 203476		-- 我是好人卡
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Creash =  CountBodyItem( PlayerID , 203034 ) --神祕的符文碎片
	local BookZ =  CountBodyItem( PlayerID , 203266 ) --鑑定卷軸

	local Book =  CountBodyItem( PlayerID , 203267 ) --高級鑑定卷軸


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			sleep(10)
			return true
		end
	elseif ( Option == "USE" ) then

	Say( PlayerID,"神呀！讓我人品爆發吧！" )

	if Book > BookZ then

		if Creash > Book then
			if Book >= 20 then
				DelBodyItem( PlayerID , 203034 , 20 )
				DelBodyItem( PlayerID , 203267 , 20 )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , 20 )	
				sleep(20)	
			else
				DelBodyItem( PlayerID , 203034 , Book )
				DelBodyItem( PlayerID , 203267 , Book )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , Book )	
				sleep(20)	
			end


		elseif Book > Creash then

			if Creash >= 20 then
				DelBodyItem( PlayerID , 203034 , 20 )
				DelBodyItem( PlayerID , 203267 , 20 )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , 20 )	
				sleep(20)	
			else

				DelBodyItem( PlayerID , 203034 , Creash )
				DelBodyItem( PlayerID , 203267 , Creash )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , Creash )	
				sleep(20)	
			end

		elseif Book == Creash then

			if Creash >= 20 then
				DelBodyItem( PlayerID , 203034 , 20 )
				DelBodyItem( PlayerID , 203267 , 20 )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , 20 )	
				sleep(20)	
			else

				DelBodyItem( PlayerID , 203034 , Creash )
				DelBodyItem( PlayerID , 203267 , Creash )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , Creash )	
				sleep(20)	
			end
		end

	elseif BookZ >= Book then
		if Creash > BookZ then
			if BookZ >= 20 then
				DelBodyItem( PlayerID , 203034 , 20 )
				DelBodyItem( PlayerID , 203266 , 20 )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , 20 )	
				sleep(20)	
			else
				DelBodyItem( PlayerID , 203034 , BookZ )
				DelBodyItem( PlayerID , 203266 , BookZ )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , BookZ )	
				sleep(20)	
			end


		elseif BookZ > Creash then

			if Creash >= 20 then
				DelBodyItem( PlayerID , 203034 , 20 )
				DelBodyItem( PlayerID , 203266 , 20 )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , 20 )	
				sleep(20)	
			else

				DelBodyItem( PlayerID , 203034 , Creash )
				DelBodyItem( PlayerID , 203266 , Creash )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , Creash )	
				sleep(20)	
			end

		elseif BookZ == Creash then

			if Creash >= 20 then
				DelBodyItem( PlayerID , 203034 , 20 )
				DelBodyItem( PlayerID , 203266 , 20 )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , 20 )	
				sleep(20)	
			else

				DelBodyItem( PlayerID , 203034 , Creash )
				DelBodyItem( PlayerID , 203266 , Creash )
				sleep(10)
				GiveBodyItem( PlayerID , 724253 , Creash )	
				sleep(20)	
			end
		end
	end

--	Sleep(10)
	--行善暖冬節重置key
--		SetFlag( OwnerID()  , 542242 , 1 )
--		SetFlag( OwnerID()  , 542232 , 1 )
--		SetFlag( OwnerID()  , 542233 , 1 )
--		SetFlag( OwnerID()  , 542234 , 1 )
--		SetFlag( OwnerID()  , 542235 , 1 )
--		SetFlag( OwnerID()  , 542236 , 1 )
--		SetFlag( OwnerID()  , 542237 , 1 )
--		SetFlag( OwnerID()  , 542238 , 1 )
--		SetFlag( OwnerID()  , 542239 , 1 )
--		SetFlag( OwnerID()  , 542240 , 1 )
--		SetFlag( OwnerID()  , 542241 , 1 )
--	Sleep(10)

--		SetFlag( OwnerID()  , 542173 , 1 )

--		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 15 )   
--		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , 35 )   


--	Say(PlayerID , GetString("SC_111584_YU_25"))

	--瑪拉蒂娜說出現在全破幾次
--	Say(PlayerID , ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3))


	end
end

function LuaYU_goodman2( Option )
	local PlayerID = OwnerID()
	local PackageID = 203477		-- 特殊劇情觸發鑰匙
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
	Sleep(10)
	--行善暖冬節所有key(救援成功)
--		SetFlag( OwnerID()  , 542242 , 1 )

--		SetFlag( OwnerID()  , 542163 , 1 )
--		SetFlag( OwnerID()  , 542164 , 1 )
--		SetFlag( OwnerID()  , 542165 , 1 )
--		SetFlag( OwnerID()  , 542166 , 1 )
--		SetFlag( OwnerID()  , 542167 , 1 )
--		SetFlag( OwnerID()  , 542168 , 1 )
--		SetFlag( OwnerID()  , 542169 , 1 )
--		SetFlag( OwnerID()  , 542170 , 1 )
--		SetFlag( OwnerID()  , 542171 , 1 )
--		SetFlag( OwnerID()  , 542172 , 1 )

--		SetFlag( OwnerID()  , 542232 , 1 )
--		SetFlag( OwnerID()  , 542233 , 1 )
--		SetFlag( OwnerID()  , 542234 , 1 )
--		SetFlag( OwnerID()  , 542235 , 1 )
--		SetFlag( OwnerID()  , 542236 , 1 )
--		SetFlag( OwnerID()  , 542237 , 1 )
--		SetFlag( OwnerID()  , 542238 , 1 )
--		SetFlag( OwnerID()  , 542239 , 1 )
--		SetFlag( OwnerID()  , 542240 , 1 )
--		SetFlag( OwnerID()  , 542241 , 1 )

	--情人節的
		local Rose =  CountBodyItem( OwnerID() , 530051 ) --稱號
		SetFlag( OwnerID()  , 542173 , 1 )
		SetFlag( OwnerID()  , 542174 , 1 )

		if Rose == 1 then
			DelBodyItem( OwnerID() ,  530051  , 1 ) --稱號
		end

	--戰牛旗標
		SetFlag( OwnerID()  , 541589, 0 )
	--瑪拉蒂娜加勝利次數100次
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3 , 100 )   

	Sleep(10)
	Say(PlayerID , GetString("SC_111584_YU_25"))

	end
end


function LuaYU_goodman3( Option )  --精英技能用
	local PlayerID = OwnerID()
	local PackageID = 203485		-- 特殊劇情觸發鑰匙
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
	Sleep(10)

		SetFlag( OwnerID()  , 540001, 1 )
		SetFlag( OwnerID()  , 540002, 1 )
		SetFlag( OwnerID()  , 540003, 1 )
		SetFlag( OwnerID()  , 540334, 1 )
		SetFlag( OwnerID()  , 540336, 1 )
		SetFlag( OwnerID()  , 540397, 1 )
		SetFlag( OwnerID()  , 540526, 1 )
		SetFlag( OwnerID()  , 540794, 1 )
		SetFlag( OwnerID()  , 541056, 1 )
		SetFlag( OwnerID()  , 541129, 1 )
		SetFlag( OwnerID()  , 541313, 1 )
		SetFlag( OwnerID()  , 541604, 1 )
		SetFlag( OwnerID()  , 541795, 1 )
		SetFlag( OwnerID()  , 541885, 1 )
		SetFlag( OwnerID()  , 541886, 1 )
		SetFlag( OwnerID()  , 541887, 1 )
		SetFlag( OwnerID()  , 541888, 1 )
		SetFlag( OwnerID()  , 541889, 1 )
		SetFlag( OwnerID()  , 541890, 1 )
		SetFlag( OwnerID()  , 541891, 1 )
		SetFlag( OwnerID()  , 541892, 1 )
		SetFlag( OwnerID()  , 541893, 1 )
		SetFlag( OwnerID()  , 541894, 1 )
		SetFlag( OwnerID()  , 541895, 1 )
		SetFlag( OwnerID()  , 541896, 1 )
		SetFlag( OwnerID()  , 541897, 1 )
		SetFlag( OwnerID()  , 541898, 1 )
		SetFlag( OwnerID()  , 541899, 1 )
		SetFlag( OwnerID()  , 541900, 1 )
		SetFlag( OwnerID()  , 541901, 1 )
		SetFlag( OwnerID()  , 541902, 1 )
		SetFlag( OwnerID()  , 541903, 1 )
		SetFlag( OwnerID()  , 541904, 1 )
		SetFlag( OwnerID()  , 541905, 1 )
		SetFlag( OwnerID()  , 541906, 1 )
		SetFlag( OwnerID()  , 541907, 1 )
		SetFlag( OwnerID()  , 541908, 1 )
		SetFlag( OwnerID()  , 541909, 1 )
		SetFlag( OwnerID()  , 541910, 1 )
		SetFlag( OwnerID()  , 541911, 1 )
		SetFlag( OwnerID()  , 541912, 1 )
		SetFlag( OwnerID()  , 541913, 1 )
		SetFlag( OwnerID()  , 541914, 1 )
		SetFlag( OwnerID()  , 541915, 1 )
		SetFlag( OwnerID()  , 541916, 1 )
		SetFlag( OwnerID()  , 541917, 1 )
		SetFlag( OwnerID()  , 541918, 1 )
		SetFlag( OwnerID()  , 541919, 1 )
		SetFlag( OwnerID()  , 541920, 1 )
		SetFlag( OwnerID()  , 541921, 1 )
		SetFlag( OwnerID()  , 541922, 1 )
		SetFlag( OwnerID()  , 541923, 1 )
		SetFlag( OwnerID()  , 541924, 1 )
		SetFlag( OwnerID()  , 541925, 1 )
		SetFlag( OwnerID()  , 541926, 1 )
		SetFlag( OwnerID()  , 541927, 1 )
		SetFlag( OwnerID()  , 541928, 1 )
		SetFlag( OwnerID()  , 541929, 1 )
		SetFlag( OwnerID()  , 541930, 1 )
		SetFlag( OwnerID()  , 541931, 1 )
		SetFlag( OwnerID()  , 541932, 1 )
		SetFlag( OwnerID()  , 541933, 1 )
		SetFlag( OwnerID()  , 541934, 1 )
		SetFlag( OwnerID()  , 541935, 1 )
		SetFlag( OwnerID()  , 541936, 1 )
		SetFlag( OwnerID()  , 541937, 1 )
		SetFlag( OwnerID()  , 541938, 1 )
		SetFlag( OwnerID()  , 541939, 1 )
		SetFlag( OwnerID()  , 541940, 1 )
		SetFlag( OwnerID()  , 541941, 1 )
		SetFlag( OwnerID()  , 541942, 1 )
		SetFlag( OwnerID()  , 541943, 1 )
		SetFlag( OwnerID()  , 541944, 1 )
		SetFlag( OwnerID()  , 541945, 1 )
		SetFlag( OwnerID()  , 541946, 1 )
		SetFlag( OwnerID()  , 541947, 1 )
		SetFlag( OwnerID()  , 541948, 1 )
		SetFlag( OwnerID()  , 541949, 1 )
		SetFlag( OwnerID()  , 541950, 1 )
		SetFlag( OwnerID()  , 541951, 1 )
		SetFlag( OwnerID()  , 541952, 1 )
		SetFlag( OwnerID()  , 541953, 1 )
		SetFlag( OwnerID()  , 541954, 1 )
		SetFlag( OwnerID()  , 541955, 1 )
		SetFlag( OwnerID()  , 541956, 1 )
		SetFlag( OwnerID()  , 541957, 1 )
		SetFlag( OwnerID()  , 541958, 1 )
		SetFlag( OwnerID()  , 541959, 1 )
		SetFlag( OwnerID()  , 541960, 1 )
		SetFlag( OwnerID()  , 541961, 1 )
		SetFlag( OwnerID()  , 541962, 1 )
		SetFlag( OwnerID()  , 541963, 1 )
		SetFlag( OwnerID()  , 541964, 1 )
		SetFlag( OwnerID()  , 541965, 1 )
		SetFlag( OwnerID()  , 541966, 1 )
		SetFlag( OwnerID()  , 541967, 1 )
		SetFlag( OwnerID()  , 541968, 1 )
		SetFlag( OwnerID()  , 541969, 1 )
		SetFlag( OwnerID()  , 541970, 1 )
		SetFlag( OwnerID()  , 541971, 1 )
		SetFlag( OwnerID()  , 541972, 1 )
		SetFlag( OwnerID()  , 541973, 1 )
		SetFlag( OwnerID()  , 541974, 1 )
		SetFlag( OwnerID()  , 541975, 1 )
		SetFlag( OwnerID()  , 541976, 1 )
		SetFlag( OwnerID()  , 541977, 1 )
		SetFlag( OwnerID()  , 541978, 1 )
		SetFlag( OwnerID()  , 541979, 1 )
		SetFlag( OwnerID()  , 541980, 1 )
		SetFlag( OwnerID()  , 541981, 1 )
		SetFlag( OwnerID()  , 541982, 1 )
		SetFlag( OwnerID()  , 541983, 1 )
		SetFlag( OwnerID()  , 541984, 1 )
		SetFlag( OwnerID()  , 541985, 1 )
		SetFlag( OwnerID()  , 541986, 1 )
		SetFlag( OwnerID()  , 541987, 1 )
		SetFlag( OwnerID()  , 541988, 1 )
		SetFlag( OwnerID()  , 541989, 1 )
		SetFlag( OwnerID()  , 541990, 1 )
		SetFlag( OwnerID()  , 541991, 1 )
		SetFlag( OwnerID()  , 541992, 1 )
		SetFlag( OwnerID()  , 541993, 1 )
		SetFlag( OwnerID()  , 541994, 1 )
		SetFlag( OwnerID()  , 541995, 1 )
		SetFlag( OwnerID()  , 541996, 1 )
		SetFlag( OwnerID()  , 541997, 1 )
		SetFlag( OwnerID()  , 541998, 1 )
		SetFlag( OwnerID()  , 541999, 1 )
		SetFlag( OwnerID()  , 542000, 1 )
		SetFlag( OwnerID()  , 542001, 1 )
		SetFlag( OwnerID()  , 542002, 1 )
		SetFlag( OwnerID()  , 542003, 1 )
		SetFlag( OwnerID()  , 542004, 1 )
		SetFlag( OwnerID()  , 542005, 1 )
		SetFlag( OwnerID()  , 542230, 1 )
		SetFlag( OwnerID()  , 542295, 1 )
		SetFlag( OwnerID()  , 542296, 1 )
--35精英技能
		SetFlag( OwnerID()  , 542006 , 1 )
		SetFlag( OwnerID()  , 542007 , 1 )
		SetFlag( OwnerID()  , 542008 , 1 )
		SetFlag( OwnerID()  , 542009 , 1 )
		SetFlag( OwnerID()  , 542010 , 1 )
		SetFlag( OwnerID()  , 542011 , 1 )
		SetFlag( OwnerID()  , 542012 , 1 )
		SetFlag( OwnerID()  , 542013 , 1 )
		SetFlag( OwnerID()  , 542014 , 1 )
		SetFlag( OwnerID()  , 542015 , 1 )
		SetFlag( OwnerID()  , 542016 , 1 )
		SetFlag( OwnerID()  , 542017 , 1 )
		SetFlag( OwnerID()  , 542018 , 1 )
		SetFlag( OwnerID()  , 542019 , 1 )
		SetFlag( OwnerID()  , 542020 , 1 )
		SetFlag( OwnerID()  , 542021 , 1 )
		SetFlag( OwnerID()  , 542022 , 1 )
		SetFlag( OwnerID()  , 542023 , 1 )
		SetFlag( OwnerID()  , 542024 , 1 )
		SetFlag( OwnerID()  , 542025 , 1 )
		SetFlag( OwnerID()  , 542026 , 1 )
		SetFlag( OwnerID()  , 542027 , 1 )
		SetFlag( OwnerID()  , 542028 , 1 )
		SetFlag( OwnerID()  , 542029 , 1 )
		SetFlag( OwnerID()  , 542030 , 1 )
		SetFlag( OwnerID()  , 542031 , 1 )
		SetFlag( OwnerID()  , 542032 , 1 )
		SetFlag( OwnerID()  , 542033 , 1 )
		SetFlag( OwnerID()  , 542034 , 1 )
		SetFlag( OwnerID()  , 542035 , 1 )
--40精英技能
		
--45精英技能
--50精英技能





	Sleep(10)
	Say(PlayerID , GetString("SC_111584_YU_25"))

	end
end