--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/24
--�ק���: 2009/04/05
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--�Ԥ��§��     204380   
--�ݭn �j�Ѫ��_�� 203178 �~�i�}��
------------------------------------------------------------------------------
function LuaI_204380box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204380 	--�Ԥ��§�� 
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
		GiveBodyItem( PlayerID , 724410 , 1 )	 -- �Ԥ��§�������_
		DelBodyItem( OwnerID() , 203178 , 1 ) --�R �j�Ѫ��_��
	end
end
-------------------------------------------------------------------------------
--  �Ԥ��§��  ran�X���~    
------------------------------------------------------------------------------
--  �ߤl�ܨ��Ĥ�§��
--  �Ԥ�߸�§��
-------------------------------------------------------------------------------