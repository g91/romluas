function CuberBackpackage()
---------------------------------------------庫柏人的背包-----------------------------------------------------

	local LuckyNum = Rand(3);

	if LuckyNum == 0 then
		if CountItem( OwnerID(),200164) == 0 then
			GiveBodyItem( OwnerID() , 200164 , 1 )	-- 庫柏人的食物
		else
			GiveBodyItem( OwnerID() , 200618 , 1 )	-- 破皮革
		end
	elseif LuckyNum == 1 then
		if CountItem( OwnerID(),200166) == 0 then
			GiveBodyItem( OwnerID() , 200166 , 1 )	-- 庫柏人的工具
		else
			GiveBodyItem( OwnerID() , 200619 , 1 )	-- 毀損的工具
		end
	elseif LuckyNum == 2 then
		if CountItem( OwnerID(),200165) == 0 then
			GiveBodyItem( OwnerID() , 200165 , 1 )	-- 庫柏人的蠟燭
		else
			GiveBodyItem( OwnerID() , 200620 , 1 )	-- 燒過的蠟燭
		end
	else
		GiveBodyItem( OwnerID() , 200619 , 1 )	-- 毀損的工具
	end
--------------------------------------------------------------------------------------------------------------
end