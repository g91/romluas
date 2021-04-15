function Hao_Gathering_Exchange(ItemID,ExChangeID)	-- �Ķ�������ơAItemID ����ƫe�����~�AExChangeID����ƫ᪺���~

	local Player = OwnerID()	-- �����

	if Check_Bag_Space( Player , 1 ) == false then	-- ���a���W���I�]�Ŷ��p��1�ɡA�h����
		ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	-- �z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		return false
	end

	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )	-- Ū�� Room
	local ItemType = GameObjInfo_Int( ItemID , "ItemType" )	-- Ū�����~����
	
	if ItemType >= 5 and ItemType <= 7 then
		local Rare = GameObjInfo_Int( ItemID , "Rare" )	-- Ū���Ӫ��~���}����
		local Count = {}	-- ��ƭ��v
		Count[1] = 1	-- ����ժ��ƶq�A�쬰2
		Count[2] = 6	-- ����ժ��ƶq�A�쬰8
		Count[3] = 36	-- ����ժ��ƶq�A�쬰48
		GiveBodyItem( Player , ExChangeID , Count[Rare] )
	else
		DebugMsg( Player , Room , "ItemType Error" )	-- ���~�������~
		return false
	end
end