----------------------------------------------------------
--�ݭn�_�ͤ~�ॴ�}���_�c
----------------------------------------------------------
function LuaI_treasure( Option, KeyID , SelfID , Item )	--(���A,�_��ID,�ۤvID,����������ID)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( PlayerID, PlayerID, 0, GetString("SC_TREASURE_NOSPACE"), 0 )	--�A���I�]�Ŷ�����
			return false
		elseif ( CountBodyItem( PlayerID , SelfID ) >= 1 ) and ( CountBodyItem( PlayerID , KeyID ) >= 1 ) then
			return true
		else
			ScriptMessage( PlayerID, PlayerID, 0, GetString("SC_TREASURE_NOKEY"), 0 )		--�A�S���j�Ѫ��_��
			return false
		end
		
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item , 1 )
		DelBodyItem( PlayerID , KeyID , 1 )

		local Lv90ChestID = { 208358 , 208359 , 208360 }	--Lv.90�H�W���_�c
		local ExtraChan = 181	--�������F�B�~�M�˧��Ʊ������v�]18.1%�^���i�j��MaxChan
		local MaxChan = 1000	--100%�����v�Ʀr
		
		for i = 1 , #Lv90ChestID do
			if	SelfID == Lv90ChestID[ i ] then	--�ˬd�B�~�M�˧��Ʊ������
				if RandRange( 1 , MaxChan ) <= ExtraChan then	--�ˬd���v
					GiveBodyItem ( OwnerID() , 720369 , 1 )	--�������F�B�~�M�˧��Ʊ���
				end
			end
		end
		
	end
end

----------------------------------------------------------
--�����_�ͧY�i���}���_�c
----------------------------------------------------------
function LuaI_freetreasure( Option , SelfID , Item )	--(���A,�ۤvID,����������ID)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( PlayerID, PlayerID, 0, GetString( "SC_TREASURE_NOSPACE" ) , 0 )	--�A���I�]�Ŷ�����
			return false
		elseif ( CountBodyItem( PlayerID , SelfID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item , 1 )					
	end
end