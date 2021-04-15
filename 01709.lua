--==================================================--
--  雷蹄之丘公眾任務交換獎賞                              --
--==================================================--
function LuaPE_ZONE15_ExChangeTalk()
	local Item1ID = 206871	-- 羅芙洛白色珍珠
	local Item2ID = 206872	-- 羅芙洛黑色珍珠
	local Item3ID = 206873	-- 管理騎士的銅幣
	local ExChangeNum1 = 10
	local ExChangeNum2 = 10
	local ExChangeNum3 = 10

	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EX01][$SETVAR1="..ExChangeNum1.."][$SETVAR2=["..Item1ID.."]]" , "LuaPE_ZONE15_ExChange1" , 0 )	-- 我有 10 個[206871] 可以跟你交換
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EX01][$SETVAR1="..ExChangeNum2.."][$SETVAR2=["..Item2ID.."]]" , "LuaPE_ZONE15_ExChange2" , 0 )	-- 我有 10 個[206872] 可以跟你交換
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EX01][$SETVAR1="..ExChangeNum3.."][$SETVAR2=["..Item3ID.."]]" , "LuaPE_ZONE15_ExChange3" , 0 )	-- 我有 10 個[206873] 可以跟你交換
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_114780_0]","LuaS_114780_DW_0", 0 )    --換黑幣

end

function LuaPE_ZONE15_ExChange1()

	CloseSpeak( OwnerID() )		-- 關閉對話視窗

	local ItemID = 206871	-- 羅芙洛白色珍珠
	local BonusBagID = 206911	-- 巴克斯褐色禮包
	local ExChangeNum = 10

	local ItemNum = CountBodyItem( OwnerID() , ItemID )

	if ItemNum < ExChangeNum then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX02][$SETVAR1=[<S>"..ItemID.."]]" )	-- 你所持有的[206871]數量似乎沒有達到我的要求，你可能得試著去多取得一些。
	else
		local NeedSpace = 1
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false;
		end

		if DelBodyItem( OwnerID() , ItemID , ExChangeNum ) == true then
			SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX03][$SETVAR1=["..BonusBagID.."]]" )	-- 這是你所交換的[206911]，謝謝你的慷慨！
			GiveBodyItem( OwnerID() , BonusBagID , 1 )
		end
	end
end

function LuaPE_ZONE15_ExChange2()

	CloseSpeak( OwnerID() )		-- 關閉對話視窗

	local ItemID = 206872	-- 羅芙洛黑色珍珠
	local BonusBagID = 206912	-- 巴克斯藍色禮包
	local ExChangeNum = 10

	local ItemNum = CountBodyItem( OwnerID() , ItemID )

	if ItemNum < ExChangeNum then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX02][$SETVAR1=[<S>"..ItemID.."]]" )	-- 你所持有的[206872]數量似乎沒有達到我的要求，你可能得試著去多取得一些。
	else
		local NeedSpace = 1
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false;
		end

		if DelBodyItem( OwnerID() , ItemID , ExChangeNum ) == true then
			SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX03][$SETVAR1=["..BonusBagID.."]]" )	-- 這是你所交換的[206912]，謝謝你的慷慨！
			GiveBodyItem( OwnerID() , BonusBagID , 1 )
		end
	end
end

function LuaPE_ZONE15_ExChange3()

	CloseSpeak( OwnerID() )		-- 關閉對話視窗

	local ItemID = 206873	-- 管理騎士的銅幣
	local BonusBagID = 206913	-- 巴克斯綠色禮包
	local ExChangeNum = 10

	local ItemNum = CountBodyItem( OwnerID() , ItemID )

	if ItemNum < ExChangeNum then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX02][$SETVAR1=[<S>"..ItemID.."]]" )	-- 你所持有的[206873]數量似乎沒有達到我的要求，你可能得試著去多取得一些。
	else
		local NeedSpace = 1
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false;
		end

		if DelBodyItem( OwnerID() , ItemID , ExChangeNum ) == true then
			SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX03][$SETVAR1=["..BonusBagID.."]]" )	-- 這是你所交換的[206913]，謝謝你的慷慨！
			GiveBodyItem( OwnerID() , BonusBagID , 1 )
		end
	end
end

function LuaPE_ZONE15_BonusBag1( Option )
	local BonusBagID = 206911 -- 巴克斯褐色禮包
	local NeedSpace = 6

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )		-- 請等待物品完全進入到背包之中！
			return false;
		elseif ( CountBodyItem( OwnerID() , BonusBagID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local BagContentID , BagContentNum = LuaPE_ZONE15_BagContent1()
		for i = 1 , table.getn(BagContentID) do
			GiveBodyItem( OwnerID() , BagContentID[i] , BagContentNum[i] )
			Sleep(5)
		end

		UseItemDestroy() 		--刪除使用中的物品
	end
end
function LuaPE_ZONE15_BagContent1()

	local BagContentID = {}
	local BagContentNum = {}

	BagContentID[1] = 206249	-- 一袋溶解石
	BagContentNum[1] = 2

	BagContentID[2] = 206250	-- 一袋符文
	BagContentNum[2] = 1

	local PotionID = {}
	local PotionNum = {}
	PotionID[1] = 204889	-- 神靈藥草
	PotionID[2] = 204890	-- 神靈元素石
	PotionNum[1] = 10
	PotionNum[2] = 10
	BagContentID[3] = PotionID[1]	-- 神靈藥草
	BagContentNum[3] = PotionNum[1]
	BagContentID[4] = PotionID[2]	-- 神靈元素石
	BagContentNum[4] = PotionNum[2]

	local RNDType = Rand( 100 ) + 1	-- 產生 1~100 的亂數
	
	if RNDType > 1 and RNDType <= 33 then
		local gMaterialID = {}	-- 材料LV53
		gMaterialID[2] = 206696	-- 木之精華
		local gMaterialNum = {}
		gMaterialNum[2] = 5

		BagContentID[5] = gMaterialID[2]	-- 木之精華
		BagContentNum[5] = gMaterialNum[2]
		BagContentID[6] = gMaterialID[2]	-- 木之精華
		BagContentNum[6] = gMaterialNum[2]


	elseif RNDType > 33 and RNDType <= 66 then
		--local PotionID = {}	--  必送藥水
		PotionID[3] = 200229	-- 強效療傷藥
		PotionID[4] = 200270	-- 強效靈感藥水

		--local PotionNum = {}
		PotionNum[3] = 4
		PotionNum[4] = 4

		BagContentID[5] = PotionID[3]	-- 強效療傷藥
		BagContentNum[5] = PotionNum[3]
		BagContentID[6] = PotionID[4]	-- 強效靈感藥水
		BagContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local RNDPotionID = {}	-- 隨機藥水
		RNDPotionID[1] = 200272	-- 聖力藥水
		RNDPotionID[2] = 200113	-- 將軍三色香腸
		RNDPotionID[3] = 200114	-- 奶焗魚肉餡餅
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND3 = Rand( 3 ) + 1	-- 產生 1~3 的亂數
		BagContentID[5] = RNDPotionID[RND3]	-- 隨機藥水
		BagContentNum[5] = RNDPotionNum[RND3]

		local RNDFoodID = {}	-- 隨機食物
		RNDFoodID[1] = 200143	-- 茶香鬆餅
		RNDFoodID[2] = 200144	-- 香草可可酥
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- 產生 1~2 的亂數
		BagContentID[6] = RNDFoodID[RND3]	-- 隨機食物
		BagContentNum[6] = RNDFoodNum[RND3]
	end

	return BagContentID , BagContentNum;

end
function LuaPE_ZONE15_BonusBag2( Option )
	local BonusBagID = 206912 -- 巴克斯藍色禮包
	local NeedSpace = 6

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )		-- 請等待物品完全進入到背包之中！
			return false;
		elseif ( CountBodyItem( OwnerID() , BonusBagID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local BagContentID , BagContentNum = LuaPE_ZONE15_BagContent2()
		for i = 1 , table.getn(BagContentID) do
			GiveBodyItem( OwnerID() , BagContentID[i] , BagContentNum[i] )
			Sleep(5)
		end

		UseItemDestroy() 		--刪除使用中的物品
	end
end
function LuaPE_ZONE15_BagContent2()

	local BagContentID = {}
	local BagContentNum = {}

	BagContentID[1] = 206249	-- 一袋溶解石
	BagContentNum[1] = 2

	BagContentID[2] = 206250	-- 一袋符文
	BagContentNum[2] = 1

	local PotionID = {}
	local PotionNum = {}
	PotionID[1] = 204889	-- 神靈藥草
	PotionID[2] = 204890	-- 神靈元素石
	PotionNum[1] = 10
	PotionNum[2] = 10
	BagContentID[3] = PotionID[1]	-- 神靈藥草
	BagContentNum[3] = PotionNum[1]
	BagContentID[4] = PotionID[2]	-- 神靈元素石
	BagContentNum[4] = PotionNum[2]

	local RNDType = Rand( 100 ) + 1	-- 產生 1~100 的亂數
	
	if RNDType > 1 and RNDType <= 33 then
		local gMaterialID = {}	-- 材料LV53
		gMaterialID[1] = 206695	-- 礦之精華
		local gMaterialNum = {}
		gMaterialNum[1] = 5

		BagContentID[5] = gMaterialID[1]	-- 礦之精華
		BagContentNum[5] = gMaterialNum[1]
		BagContentID[6] = gMaterialID[1]	-- 礦之精華
		BagContentNum[6] = gMaterialNum[1]

	elseif RNDType > 33 and RNDType <= 66 then
		--local PotionID = {}	--  必送藥水
		PotionID[3] = 200229	-- 強效療傷藥
		PotionID[4] = 200270	-- 強效靈感藥水

		--local PotionNum = {}
		PotionNum[3] = 4
		PotionNum[4] = 4

		BagContentID[5] = PotionID[3]	-- 強效療傷藥
		BagContentNum[5] = PotionNum[3]
		BagContentID[6] = PotionID[4]	-- 強效靈感藥水
		BagContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local RNDPotionID = {}	-- 隨機藥水
		RNDPotionID[1] = 200272	-- 聖力藥水
		RNDPotionID[2] = 200113	-- 將軍三色香腸
		RNDPotionID[3] = 200114	-- 奶焗魚肉餡餅
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND3 = Rand( 3 ) + 1	-- 產生 1~3 的亂數
		BagContentID[5] = RNDPotionID[RND3]	-- 隨機藥水
		BagContentNum[5] = RNDPotionNum[RND3]

		local RNDFoodID = {}	-- 隨機食物
		RNDFoodID[1] = 200143	-- 茶香鬆餅
		RNDFoodID[2] = 200144	-- 香草可可酥
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- 產生 1~2 的亂數
		BagContentID[6] = RNDFoodID[RND3]	-- 隨機食物
		BagContentNum[6] = RNDFoodNum[RND3]
	end

	return BagContentID , BagContentNum;

end
function LuaPE_ZONE15_BonusBag3( Option )
	local BonusBagID = 206913 -- 巴克斯綠色禮包
	local NeedSpace = 6

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )		-- 請等待物品完全進入到背包之中！
			return false;
		elseif ( CountBodyItem( OwnerID() , BonusBagID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local BagContentID , BagContentNum = LuaPE_ZONE15_BagContent3()
		for i = 1 , table.getn(BagContentID) do
			GiveBodyItem( OwnerID() , BagContentID[i] , BagContentNum[i] )
			Sleep(5)
		end

		UseItemDestroy() 		--刪除使用中的物品
	end
end
function LuaPE_ZONE15_BagContent3()

	local BagContentID = {}
	local BagContentNum = {}

	BagContentID[1] = 206249	-- 一袋溶解石
	BagContentNum[1] = 2

	BagContentID[2] = 206250	-- 一袋符文
	BagContentNum[2] = 1

	local PotionID = {}
	local PotionNum = {}
	PotionID[1] = 204889	-- 神靈藥草
	PotionID[2] = 204890	-- 神靈元素石
	PotionNum[1] = 10
	PotionNum[2] = 10
	BagContentID[3] = PotionID[1]	-- 神靈藥草
	BagContentNum[3] = PotionNum[1]
	BagContentID[4] = PotionID[2]	-- 神靈元素石
	BagContentNum[4] = PotionNum[2]

	local RNDType = Rand( 100 ) + 1	-- 產生 1~100 的亂數
	
	if RNDType > 1 and RNDType <= 33 then
		local gMaterialID = {}	-- 材料LV53
		gMaterialID[3] = 206697	-- 草之精華
		local gMaterialNum = {}
		gMaterialNum[3] = 5

		BagContentID[5] = gMaterialID[3]	-- 草之精華
		BagContentNum[5] = gMaterialNum[3]
		BagContentID[6] = gMaterialID[3]	-- 草之精華
		BagContentNum[6] = gMaterialNum[3]


	elseif RNDType > 33 and RNDType <= 66 then
		--local PotionID = {}	--  必送藥水
		PotionID[3] = 200229	-- 強效療傷藥
		PotionID[4] = 200270	-- 強效靈感藥水

		--local PotionNum = {}
		PotionNum[3] = 4
		PotionNum[4] = 4

		BagContentID[5] = PotionID[3]	-- 強效療傷藥
		BagContentNum[5] = PotionNum[3]
		BagContentID[6] = PotionID[4]	-- 強效靈感藥水
		BagContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local RNDPotionID = {}	-- 隨機藥水
		RNDPotionID[1] = 200272	-- 聖力藥水
		RNDPotionID[2] = 200113	-- 將軍三色香腸
		RNDPotionID[3] = 200114	-- 奶焗魚肉餡餅
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND3 = Rand( 3 ) + 1	-- 產生 1~3 的亂數
		BagContentID[5] = RNDPotionID[RND3]	-- 隨機藥水
		BagContentNum[5] = RNDPotionNum[RND3]

		local RNDFoodID = {}	-- 隨機食物
		RNDFoodID[1] = 200143	-- 茶香鬆餅
		RNDFoodID[2] = 200144	-- 香草可可酥
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- 產生 1~2 的亂數
		BagContentID[6] = RNDFoodID[RND3]	-- 隨機食物
		BagContentNum[6] = RNDFoodNum[RND3]
	end

	return BagContentID , BagContentNum;

end


function LuaS_114780_DW_0()
	local ExChangeNum = 20
	local Item1ID = 206871	-- 羅芙洛白色珍珠
	local Item2ID = 206872	-- 羅芙洛黑色珍珠
	local Item3ID = 206873	-- 管理騎士的銅幣

	SetSpeakDetail( OwnerID(),"[SC_114780_1]")
	if	CountBodyItem(OwnerID(), Item1ID )>=20	then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EXCHANGE][$SETVAR1="..ExChangeNum.."][$SETVAR2=[<S>"..Item1ID.."]]" , "LuaS_114780_DW_1" , 0 )	-- 我有 [$VAR1] 個[$VAR2] 想跟你交換1個古代遺物！
	end
	if	CountBodyItem(OwnerID(), Item2ID )>=20	then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EXCHANGE][$SETVAR1="..ExChangeNum.."][$SETVAR2=[<S>"..Item2ID.."]]" , "LuaS_114780_DW_2" , 0 )	-- 我有 [$VAR1] 個[$VAR2] 想跟你交換1個古代遺物！
	end
	if	CountBodyItem(OwnerID(), Item3ID )>=20	then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EXCHANGE][$SETVAR1="..ExChangeNum.."][$SETVAR2=[<S>"..Item3ID.."]]" , "LuaS_114780_DW_3" , 0 )	-- 我有 [$VAR1] 個[$VAR2] 想跟你交換1個古代遺物！
	end
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_114780_5]","LuaPE_ZONE15_ExChangeTalk", 0 )
end


function LuaS_114780_DW_1()
	local OID = OwnerID()
	if EmptyPacketCount( OID ) > 0 and QueuePacketCount( OID ) == 0 then
		if	DelBodyItem( OID, 206871, 20 )	then
			YOYO_GetTokenValue( 2, 1);--古代遺物
		end
	else
		ScriptMessage( OID , OID , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
	end
	LuaS_114780_DW_0()
end


function LuaS_114780_DW_2()
	local OID = OwnerID()
	if EmptyPacketCount( OID ) > 0 and QueuePacketCount( OID ) == 0 then
		if	DelBodyItem( OID, 206872,20 )	then
			YOYO_GetTokenValue( 2, 1);--古代遺物
		end
	else
		ScriptMessage( OID, OID, 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
	end
	LuaS_114780_DW_0()
end


function LuaS_114780_DW_3()
	local OID = OwnerID()
	if EmptyPacketCount( OID ) > 0 and QueuePacketCount( OID ) == 0 then
		if	DelBodyItem( OID, 206873,20 )	then
			YOYO_GetTokenValue( 2, 1);--古代遺物
		end
	else
		ScriptMessage( OID, OID, 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
	end
	LuaS_114780_DW_0()
end


function LuaS_115224_DW_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end

function LuaS_115224_DW_1()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600214 , "Test_Shop_Close" );
end