--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--�m�J§��      204379    �a�ߤl�^�a�h ���ʥ�
------------------------------------------------------------------------------
function LuaI_204379box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204379		--�m�J§�� 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
                                ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_22]",0)
                                ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_22]",0)
			return false
		elseif  CountBodyItem( PlayerID , PackageID ) >= 1  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724441 , 1 )	 -- �m�J§�������_
	end
end
-------------------------------------------------------------------------------