--��m�O�����ഫ����
function Sys_SavePosition()	-- ���q�̸H��

	local Ret = ItemSavePos( 201104 );
	if Ret == false then
		ScriptMessage ( OwnerID() , OwnerID() , 0 , GetString("ITEM_TRANSFER_1") , 0 );	-- ���B���i�O����m
	end

	return Ret

end

function Sys_SavePosition_Core()	-- ���q�̮֤�

	local Ret = ItemSavePos( 201447 );
	if Ret == false then
		ScriptMessage ( OwnerID() , OwnerID() , 0 , GetString("ITEM_TRANSFER_1") , 0 );	-- ���B���i�O����m
	end

	return Ret

end
