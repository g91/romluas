--位置記錄並轉換物件
function Sys_SavePosition()	-- 測量者碎片

	local Ret = ItemSavePos( 201104 );
	if Ret == false then
		ScriptMessage ( OwnerID() , OwnerID() , 0 , GetString("ITEM_TRANSFER_1") , 0 );	-- 此處不可記錄位置
	end

	return Ret

end

function Sys_SavePosition_Core()	-- 測量者核心

	local Ret = ItemSavePos( 201447 );
	if Ret == false then
		ScriptMessage ( OwnerID() , OwnerID() , 0 , GetString("ITEM_TRANSFER_1") , 0 );	-- 此處不可記錄位置
	end

	return Ret

end
