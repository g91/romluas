function LuaI_241845() --2012年南瓜節 愛搞怪裝飾包

	local itemset  = {	2500	, ""	, { 203231 , 1 } ,		-- 燭光南瓜裝飾
				5000	, ""	, { 203232 , 1 } ,		-- 幽靈造景裝飾
				7500	, ""	, { 203233 , 1 } ,		-- 幽靈聖歌裝飾
				10000	, ""	, { 203234 , 1 }	}	-- 巫婆造景裝飾
	return BaseTressureProc4( itemset , 1 )
end

function LuaI_241846() --2012年南瓜節 小搗蛋夥伴包

	local RoleName = GetName( OwnerID() )
	local Package = "[241846]"	-- 禮包ID
	local Gift = {}			-- 廣播物品ID
	local Msg  = {}
	Gift[1] = "[241837]"	-- 永久搗蛋鬼300寵物蛋 
	Gift[2] = "[241842]"	 -- 永久地獄三頭犬寵物蛋
	Gift[3] = "[241805]"	 -- 永久小惡魔2000坐騎
	Msg[1] = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2="..Package.."][$SETVAR3="..Gift[1].."]"
	Msg[2] = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2="..Package.."][$SETVAR3="..Gift[2].."]"
	Msg[3] = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2="..Package.."][$SETVAR3="..Gift[3].."]"

	local itemset  = {	2400	, ""	, { 241835 , 1 } ,		-- 7天搗蛋鬼300寵物蛋		
				3200	, ""	, { 241836 , 1 } ,		-- 30天搗蛋鬼300寵物蛋		
				3375	, Msg[1] , { 241837 , 1 } ,		-- 永久搗蛋鬼300寵物蛋		
				5775	, ""	, { 241840 , 1 } ,		-- 7天地獄三頭犬寵物蛋		
				6575	, ""	, { 241841 , 1 } ,		-- 30天地獄三頭犬寵物蛋		
				6750	, Msg[2] , { 241842 , 1 } ,		-- 永久地獄三頭犬寵物蛋		
				9150	, ""	, { 209480 , 1 } ,		-- 7天小惡魔2000坐騎
				9950	, ""	, { 209481 , 1 } ,		-- 30天小惡魔2000坐騎
				10000	, Msg[3] , { 241805 , 1 }	}	-- 永久小惡魔坐騎
	return BaseTressureProc4( itemset , 1 )
end

function LuaI_241847() --2012年南瓜節 攝魂魔丑驚奇禮盒(男性)

	local itemset  = {	2500	, ""	, { 227546 , 1 } ,		-- 攝魂魔丑手套(男)
				3500	, ""	, { 227547 , 1 } ,		-- 攝魂魔丑正裝(男)
				5000	, ""	, { 227548 , 1 } ,		-- 攝魂魔丑護肩(男)
				7500	, ""	, { 227551 , 1 } ,		-- 攝魂魔丑長靴(男)
				9000	, ""	, { 227549 , 1 } ,		-- 攝魂魔丑長褲(男)
				10000	, ""	, { 227550 , 1 }	}	-- 攝魂魔丑面具(男)
	return BaseTressureProc4( itemset , 1 )
end

function LuaI_241848() --2012年南瓜節 攝魂魔丑頑皮禮盒(女性)

	local itemset  = {	2500	, ""	, { 228675 , 1 } ,		-- 攝魂魔丑護手(女)
				3500	, ""	, { 228676 , 1 } ,		-- 攝魂魔丑正裝(女)
				5000	, ""	, { 228677 , 1 } ,		-- 攝魂魔丑護肩(女)
				7500	, ""	, { 228678 , 1 } ,		-- 攝魂魔丑巫鞋(女)
				9000	, ""	, { 228679 , 1 } ,		-- 攝魂魔丑短褲(女)
				10000	, ""	, { 228680 , 1 }	}	-- 攝魂魔丑面具(女)
	return BaseTressureProc4( itemset , 1 )
end