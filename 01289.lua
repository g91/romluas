--1289
--2011.03.03 ���������ĦX���� �]��4.0.0�w�}���]�k���o

--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/24
--�ק���: 2009/04/03
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--�m�J��§��      204121    �a�ߤl�^�a�h ���ʥ�
------------------------------------------------------------------------------
function LuaI_204121eggbox( Option )
	local PlayerID = OwnerID()
	local PackageID = 204121		--�m�J��§�� 
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
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 724333 , 1 )	 --�]�k�ͪ�
		--	GiveBodyItem( PlayerID , 204073 , 1 )	 --2011.03.03 ���������ĦX���� �]��4.0.0�w�}���]�k���o
			DelBodyItem( PlayerID , 203178, 1 )
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724409 , 1 )	 --�]�k�ͪ�
		--	GiveBodyItem( PlayerID , 204073 , 1 )	 --2011.03.03 ���������ĦX���� �]��4.0.0�w�}���]�k���o
			DelBodyItem( PlayerID , 203178, 1 )
		end
	end
end