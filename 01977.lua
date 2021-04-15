function LuaI_240045() --經典花神祝福禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 223371 , 1 } , --亞當金鱗手套		機率	30/ 100
				55 , "" , { 223372 , 1 } , --亞當金鱗長靴		機率	25/ 100
				70 , "" , { 223373 , 1 } , --亞當盛夏短褲		機率	15/ 100
				85 , "" , { 223374 , 1 } , --亞當桂冠 		機率	15/ 100
				100 , "" , { 223370 , 1 } } --亞當野性披肩	機率	15/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 223366 , 1 } , --夏娃花瓣手套		機率	30/ 100
				60 , "" , { 223367 , 1 } , --夏娃草環長靴		機率	30/ 100
				75 , "" , { 223368 , 1 } , --夏娃盛夏短褲		機率	15/ 100
				90 , "" , { 223369 , 1 } , --夏娃花環帽飾		機率	15/ 100
				100 , "" , { 223365 , 1 } } --夏娃盛夏上衣	機率	10/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
-------------------------------------------------------------------------------------------------------------------------
function LuaI_240046() --經典巴洛克禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 223399 , 1 } , --巴洛克貴族手套	機率	30/ 100
				55 , "" , { 223398 , 1 } , --巴洛克貴族長靴	機率	25/ 100
				75 , "" , { 223395 , 1 } , --巴洛克貴族帽子	機率	20/ 100
				90 , "" , { 223397 , 1 } , --巴洛克貴族長褲	機率	15/ 100
				100 , "" , { 223396 , 1 } } --巴洛克貴族上衣	機率	10/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 223394 , 1 } , --巴洛克貴族手套	機率	30/ 100
				55 , "" , { 223393 , 1 } , --巴洛克貴族長靴	機率	25/ 100
				75 , "" , { 223390 , 1 } , --巴洛克貴族帽子	機率	20/ 100
				90 , "" , { 223392 , 1 } , --巴洛克貴族長褲	機率	15/ 100
				100 , "" , { 223391 , 1 } } --巴洛克貴族上衣	機率	10/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
-------------------------------------------------------------------------------------------------------------------------
function LuaI_240047() --經典嘉年華禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 223418 , 1 } , --愛樂嘉年華長靴	機率	30/ 100
				55 , "" , { 223420 , 1 } , --愛樂嘉年華肩飾	機率	25/ 100
				75 , "" , { 223417 , 1 } , --愛樂嘉年華長褲	機率	20/ 100
				90 , "" , { 223416 , 1 } , --愛樂嘉年華上衣	機率	15/ 100
				100 , "" , { 223419 , 1 } } --愛樂嘉年華面具	機率	10/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 223422 , 1 } , --愛樂嘉年華長靴	機率	30/ 100
				60 , "" , { 223425 , 1 } , --愛樂嘉年華肩飾	機率	30/ 100
				85 , "" , { 223424 , 1 } , --愛樂嘉年華髮飾	機率	25/ 100
				100 , "" , { 223421 , 1 } } --愛樂嘉年華上衣	機率	15/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240048() --經典吸血惡魔禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 222738 , 1 } , --吸血伯爵手套		機率	30/ 100
				55 , "" , { 222739 , 1 } , --吸血伯爵鞋		機率	25/ 100
				75 , "" , { 222740 , 1 } , --吸血伯爵褲		機率	20/ 100
				90 , "" , { 222741 , 1 } , --吸血伯爵頭盔		機率	15/ 100
				100 , "" , { 222737 , 1 } } --吸血伯爵上衣	機率  	10/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 222743 , 1 } , --惡魔少女手套		機率	30/ 100
				55 , "" , { 222744 , 1 } , --惡魔少女鞋 		機率	25/ 100
				75 , "" , { 222745 , 1 } , --惡魔少女褲		機率	20/ 100
				90 , "" , { 222746 , 1 } , --惡魔少女頭飾		機率	15/ 100
				100 , "" , { 222742 , 1 } } --惡魔少女上衣	機率	10/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240049() --經典詭譎小丑禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	25 , "" , { 225156 , 1 } , --男詭譎小丑手套	機率	25/ 100
				50 , "" , { 225161 , 1 } , --男詭譎小丑肩甲	機率	25/ 100
				70 , "" , { 225155 , 1 } , --男詭譎小丑鞋子	機率	20/ 100
				85 , "" , { 225160 , 1 } , --男詭譎小丑褲子	機率	15/ 100
				95 , "" , { 225162 , 1 } , --男詭譎小丑上衣	機率	10/ 100
				100 , "" , { 225157 , 1 } } --男詭譎小丑帽子	機率 	5/ 100
	elseif Sex == 1 then --女性
		itemset = {	25 , "" , { 225173 , 1 } , --女詭譎小丑手套	機率	25/ 100
				50 , "" , { 225164 , 1 } , --女詭譎小丑肩甲	機率	25/ 100
				70 , "" , { 225174 , 1 } , --女詭譎小丑鞋子	機率	20/ 100
				85 , "" , { 225169 , 1 } , --女詭譎小丑褲子	機率	15/ 100
				95 , "" , { 225163 , 1 } , --女詭譎小丑上衣	機率	10/ 100
				100 , "" , { 225172 , 1 } } --女詭譎小丑帽子	機率	5/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240050() --經典金色暖冬禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	25 , "" , { 222975 , 1 } , --金色暖冬手套	機率	25/ 100
				50 , "" , { 222976 , 1 } , --金色暖冬長靴	機率	25/ 100
				70 , "" , { 222977 , 1 } , --金色暖冬長褲	機率	20/ 100
				80 , "" , { 222974 , 1 } , --金色暖冬上衣	機率	10/ 100
				90 , "" , { 222979 , 1 } , --金色暖冬肩飾	機率	10/ 100
				100 , "" , { 222978 , 1 } } --金色暖冬帽	機率	10/ 100
	elseif Sex == 1 then --女性
		itemset = {	25 , "" , { 222981 , 1 } , --金色暖冬手套	機率	25/ 100
				50 , "" , { 222982 , 1 } , --金色暖冬長靴	機率	25/ 100
				70 , "" , { 222983 , 1 } , --金色暖冬短褲	機率	20/ 100
				80 , "" , { 222980 , 1 } , --金色暖冬上衣	機率	10/ 100
				90 , "" , { 222985 , 1 } , --金色暖冬肩飾	機率	10/ 100
				100 , "" , { 222984 , 1 } } --金色暖冬帽	機率	10/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240051() --經典踏日逐空禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 221917 , 1 } , --荊棘荒野手套		機率	30/ 100
				55 , "" , { 221916 , 1 } , --荊棘荒野長靴		機率	25/ 100
				75 , "" , { 221915 , 1 } , --荊棘荒野下褲		機率	20/ 100
				90 , "" , { 221913 , 1 } , --荊棘荒野頭盔		機率	15/ 100
				100 , "" , { 221914 , 1 } } --荊棘荒野上衣	機率	10/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 221895 , 1 } , --迷之彩蝶便鞋		機率	30/ 100
				60 , "" , { 221894 , 1 } , --迷之彩蝶下褲		機率	30/ 100
				85 , "" , { 221892 , 1 } , --迷之彩蝶髮夾		機率	25/ 100
				100 , "" , { 221893 , 1 } } --迷之彩蝶上衣	機率	15/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240052() --經典狂野魅惑禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 222993 , 1 } , --狂野戰士手飾		機率	30/ 100
				55 , "" , { 222992 , 1 } , --狂野戰士腳飾		機率	25/ 100
				75 , "" , { 222989 , 1 } , --狂野戰士紋身		機率	20/ 100
				90 , "" , { 222990 , 1 } , --狂野戰士長褲		機率	15/ 100
				100 , "" , { 222991 , 1 } } --狂野戰士頭盔	機率  	10/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 223389 , 1 } , --性感兔女郎手套	機率	30/ 100
				55 , "" , { 222987 , 1 } , --性感兔女郎長靴 	機率	25/ 100
				75 , "" , { 222986 , 1 } , --性感兔女郎短裙	機率	20/ 100
				90 , "" , { 222869 , 1 } , --性感兔女郎上衣	機率	15/ 100
				100 , "" , { 222988 , 1 } } --性感兔女郎長耳	機率	10/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_240053() --經典時尚扮裝禮盒

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = {	30 , "" , { 221922 , 1 } , --凡爾賽晚宴長靴	機率	30/ 100
				60 , "" , { 221923 , 1 } , --凡爾賽晚宴手套	機率	30/ 100
				85 , "" , { 221921 , 1 } , --凡爾賽晚宴長褲	機率	25/ 100
				100 , "" , { 221920 , 1 } } --凡爾賽晚宴上衣	機率  	15/ 100
	elseif Sex == 1 then --女性
		itemset = {	30 , "" , { 221926 , 1 } , --蕾絲牛仔長靴		機率	30/ 100
				60 , "" , { 221925 , 1 } , --蕾絲牛仔短褲 		機率	30/ 100
				85 , "" , { 221924 , 1 } , --蕾絲牛仔外套		機率	25/ 100
				100 , "" , { 221927 , 1 } } --蕾絲牛仔帽		機率	15/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end

-------------------------------------------------------------------------------------------------------
-- 6.0.2  2013 綵織節 新增
-------------------------------------------------------------------------------------------------------
function LuaI_242697()  -- 經典白銀聖使禮盒
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = { 
			20 , "" , { 231984 , 1 } , 
			45 , "" , { 231985 , 1 } , 
			65 , "" , { 231986 , 1 } , 
			70 , "" , { 231987 , 1 } , 
			80 , "" , { 231988 , 1 } , 
			100 , "" , { 231989 , 1 } 
			}
	elseif Sex == 1 then --女性
		itemset = { 
			20 , "" , { 231990 , 1 } , 
			45 , "" , { 231991 , 1 } , 
			65 , "" , { 231992 , 1 } , 
			70 , "" , { 231993 , 1 } , 
			80 , "" , { 231994 , 1 } , 
			100 , "" , { 231995 , 1 } 
			}	
	end
	return BaseTressureProc(   itemset , 1 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242698()  -- 經典暗夜復仇禮盒
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = { 
			10 , "" , { 231976 , 1 } , 
			40 , "" , { 231977 , 1 } , 
			65 , "" , { 231978 , 1 } , 
			100 , "" , { 231979 , 1 } 
			}
	elseif Sex == 1 then --女性
		itemset = { 
			10 , "" , { 231980 , 1 } , 
			40 , "" , { 231981 , 1 } , 
			65 , "" , { 231982 , 1 } , 
			100 , "" , { 231983 , 1 } 
			}	
	end
	return BaseTressureProc(   itemset , 1 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242699()  -- 經典獰笑影者禮盒
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = { 
			5 , "" , { 228681 , 1 } , 
			25 , "" , { 228682 , 1 } , 
			35 , "" , { 228683 , 1 } , 
			60 , "" , { 228684 , 1 } , 
			75 , "" , { 228685 , 1 } , 
			100 , "" , { 228686 , 1 } 
			}
	elseif Sex == 1 then --女性
		itemset = {
			5 , "" , { 228687 , 1 } , 
			25 , "" , { 228688 , 1 } , 
			35 , "" , { 228689 , 1 } , 
			60 , "" , { 228690 , 1 } , 
			75 , "" , { 228691 , 1 } , 
			100 , "" , { 228692 , 1 } 
			}	
	end
	return BaseTressureProc(   itemset , 1 )
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242700() -- 經典耀日銀月禮盒
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = { 
			5 , "" , { 230760 , 1 } , 
			20 , "" , { 230759 , 1 } , 
			50 , "" , { 230761 , 1 } , 
			85 , "" , { 222915 , 1 } , 
			87 , "" , { 212446 , 1 } , 
			90 , "" , { 211677 , 1 } , 
			95 , "" , { 211676 , 1 } , 
			100 , "" , { 211678 , 1 } 
			}
	elseif Sex == 1 then --女性
		itemset = { 
			5 , "" , { 230757 , 1 } , 
			20 , "" , { 220929 , 1 } , 
			50 , "" , { 230758 , 1 } , 
			85 , "" , { 230756 , 1 } , 
			87 , "" , { 212446 , 1 } , 
			90 , "" , { 211677 , 1 } , 
			95 , "" , { 211676 , 1 } , 
			100 , "" , { 211678 , 1 } 
			}
	end
	return BaseTressureProc(   itemset , 1 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242701()  -- 經典紫影暗殺禮盒
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = { 
			5 , "" , { 230170 , 1 } , 
			30 , "" , { 230171 , 1 } , 
			60 , "" , { 230172 , 1 } , 
			70 , "" , { 230173 , 1 } , 
			85 , "" , { 230174 , 1 } , 
			95 , "" , { 230175 , 1 } , 
			100 , "" , { 230176 , 1 } , 
			}
	elseif Sex == 1 then --女性
		itemset = { 
			5 , "" , { 230177 , 1 } , 
			30 , "" , { 230178 , 1 } , 
			60 , "" , { 230179 , 1 } , 
			70 , "" , { 230180 , 1 } , 
			85 , "" , { 230181 , 1 } , 
			95 , "" , { 230182 , 1 } , 
			100 , "" , { 230183 , 1 } , 
			}
	end
	return BaseTressureProc(   itemset , 1 )
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242702()  -- 經典公爵淑女禮盒
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男性
		itemset = { 
			20 , "" , { 222900 , 1 } , 
			30 , "" , { 222901 , 1 } , 
			55 , "" , { 222904 , 1 } , 
			80 , "" , { 222903 , 1 } , 
			90 , "" , { 222902 , 1 } , 
			100 , "" , { 221424 , 1 } , 
			}
	elseif Sex == 1 then --女性
		itemset = { 
			25 , "" , { 221934 , 1 } , 
			35 , "" , { 221935 , 1 } , 
			65 , "" , { 221938 , 1 } , 
			90 , "" , { 221937 , 1 } , 
			100 , "" , { 221936 , 1 } , 
			}
	end
	return BaseTressureProc(   itemset , 1 )
end