function CuberBackpackage()
---------------------------------------------�w�f�H���I�]-----------------------------------------------------

	local LuckyNum = Rand(3);

	if LuckyNum == 0 then
		if CountItem( OwnerID(),200164) == 0 then
			GiveBodyItem( OwnerID() , 200164 , 1 )	-- �w�f�H������
		else
			GiveBodyItem( OwnerID() , 200618 , 1 )	-- �}�֭�
		end
	elseif LuckyNum == 1 then
		if CountItem( OwnerID(),200166) == 0 then
			GiveBodyItem( OwnerID() , 200166 , 1 )	-- �w�f�H���u��
		else
			GiveBodyItem( OwnerID() , 200619 , 1 )	-- ���l���u��
		end
	elseif LuckyNum == 2 then
		if CountItem( OwnerID(),200165) == 0 then
			GiveBodyItem( OwnerID() , 200165 , 1 )	-- �w�f�H������
		else
			GiveBodyItem( OwnerID() , 200620 , 1 )	-- �N�L������
		end
	else
		GiveBodyItem( OwnerID() , 200619 , 1 )	-- ���l���u��
	end
--------------------------------------------------------------------------------------------------------------
end