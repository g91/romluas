
local g_SetMaxDurability = 12000;	-- 最大耐久度 ( 100 為遊戲中的 1，最大為 120 )
local g_SetDurability = 100;	-- 提高耐久度時的最小單位 ( 100 為遊戲中的 1 )

local g_SortDefine = {};	-- 索引空間的巨集宣告類型
g_SortDefine[0] = EM_ItemPacketType_Body;	-- 0 ~ 49 商城背包空間，50 ~ 59 魔幻寶盒空間，60 ~ 239 玩家背包空間
g_SortDefine[1] = EM_ItemPacketType_Bank;	-- 銀行
g_SortDefine[2] = EM_ItemPacketType_EQ;	-- 0 ~ 21 為當前裝備

local g_IndexID = {};	-- 索引資料庫中的編號類型( Sort = 0 時為武器、1 時為防具 )
g_IndexID[0] = { Sort = 0, Minimum = 210000, Maxmum = 219999 };	-- 武器
g_IndexID[1] = { Sort = 1, Minimum = 220000, Maxmum = 239999 };	-- 防具

local g_IndexPos = { };	-- 索引資料庫中的「裝備部位」欄位
g_IndexPos[0] = {};
g_IndexPos[1] = {};
g_IndexPos[0][0] = { 0, 1, 2, 3, 5 };	-- 武器：主手、副手、主副手、雙手、弓
g_IndexPos[1][0] = { 0, 1, 2, 3, 4, 5, 6, 7, 11 };	-- 防具：頭、手套、鞋子、上身、下身、披風、腰帶、肩甲、盾牌
g_IndexPos[1][1] = { 8, 9, 10 };	-- 防具.飾品：項鍊、戒指、耳環
g_IndexPos[1][2] = { 13 };	-- 防具.裝飾品：裝飾品

function IncreaseDurability(Sort,Pos)	-- 提高物品耐久度，使用前檢查

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ID = GetItemInfo( Owner, g_SortDefine[Sort], Pos, EM_ItemValueType_OrgObjID );
	local MaxDurable = GetItemInfo( Owner, g_SortDefine[Sort], Pos, EM_ItemValueType_MaxDurable );	-- 最大耐久度
	local SortResult = false;	-- 物品分類：武器、防具、物品

--	DebugMsg( Owner, Room, "Sort = "..Sort..", Pos = "..Pos..", ID = "..ID..", MaxDurable = "..MaxDurable );

	if MaxDurable == 0 then	-- 耐久度為 0 的物品無法使用
		DebugMsg( Owner, Room, "耐久度為0，無法使用" );
		return false;
	end

	for Index, Value in pairs(g_IndexID) do
	--	DebugMsg( Owner, Room, "最小值 = "..tostring(Value.Minimum)..", 最大值 = "..tostring(Value.Maxmum) );
		if ID >= Value.Minimum and ID <= Value.Maxmum then
			SortResult = Value.Sort;
		--	DebugMsg( Owner, Room, "SortResult = "..tostring(SortResult) );
			break;
		end
	end

	-- 符合武器、防具其中之一的類型，卻在比對後與現有索引編號不符合時即無法使用，避免日後資料庫編號擴增時導致錯誤的問題。
	if not SortResult then
		DebugMsg( Owner, Room, "ID不符，無法使用" );
		return false;
	end

	local EqPos

	if SortResult == 0 then	-- 武器
		EqPos = GameObjInfo_Int( ID, "WeaponPos" );	-- 用以判定為何種武器
	elseif SortResult == 1 then	-- 防具
		EqPos = GameObjInfo_Int( ID, "ArmorPos" );	-- 用以判定是何種裝備類型：防具、飾品、裝飾品
	end
	DebugMsg( Owner, Room, "SortResult = "..SortResult..", EqPos = "..EqPos.." , Totally = "..tostring(#g_IndexPos[SortResult]) );

	local SortResultSub = nil; -- 子項目分類，對應 g_IndexPos

	for Index, Value in ipairs(g_IndexPos[SortResult]) do
		DebugMsg( Owner, Room, "64.Value = "..tostring(Value)..", Totally = "..#Value..", Index = "..Index );
		for i = 0, #Value do
			DebugMsg( Owner, Room, "SortResult = "..SortResult..", EqPos = "..EqPos.." , Value = "..Value[i] );
			if EqPos == Value[i] then
				SortResultSub = EqPos;
				break;
			end
		end
	--	if SortResultSub then
	--		break;
	--	end
	end
	DebugMsg( Owner, Room, "子項目 = "..tostring(SortResultSub) );
	if not SortResultSub then
		DebugMsg( Owner, Room, "子項目不符，無法使用" );	-- 忽略彈藥、採集工具、法寶
		return false;
	end
	return;
end

	-- Armor 防具
	-- Accessory 飾品
	-- Weapon 武器
	-- Back 裝飾品