--�ݭn203178
--2011.03.03 ���������ĦX���� �]��4.0.0�w�}���]�k���o

function Lua_RabbitEquipment(Option )
	local PlayerID = OwnerID()
	local PackageID = 204111		--�Ԥ�߸˩��]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --�j�Ѫ��_��
		if ( NeedSpaceStatus  == false ) then
                                ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_22]",0)
                                ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_22]",0)
			return false
		elseif  CountBodyItem( PlayerID , PackageID ) >= 1  and KEY > 0  then
			return true
		else 
               		  ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_30]",0)
                               	 ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_30]",0)
			return false
		end
	elseif ( Option == "USE" ) then
		local SEX = ReadRoleValue(PlayerID , EM_RoleValue_SEX )
		if SEX == 0 then
			GiveBodyItem( PlayerID , 724263 , 1 )	--�k��
		--	GiveBodyItem( PlayerID , 204073 , 1 )	  --2011.03.03 ���������ĦX���� �]��4.0.0�w�}���]�k���o
			DelBodyItem( PlayerID , 203178, 1 )	
		elseif SEX == 1 then
			GiveBodyItem( PlayerID , 724408, 1 )	--�k��
		--	GiveBodyItem( PlayerID , 204073 , 1 )	 --2011.03.03 ���������ĦX���� �]��4.0.0�w�}���]�k���o
			DelBodyItem( PlayerID , 203178, 1 )	
		--GiveBodyItem( PlayerID , 724263 , 1 )	
		--DelBodyItem( PlayerID, 203178, 1 ) 
                        	end
	end
end