function  CheckBuff_HouseSpeed_Bouns()
--	Say(OwnerID(),"Checking...")
	if CheckBuff( OwnerID() , 501662 ) == true or  CheckBuff( OwnerID() , 501663 ) == true or CheckBuff( OwnerID() , 502673 ) == true or  CheckBuff( OwnerID() , 502672 ) == true or  CheckBuff( OwnerID() , 505552 ) == true or  CheckBuff( OwnerID() , 505553 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT )	-- ���~�ϥΥ��ѡA���ĪG�w�s�b
	                return false
	else
		return true
	end

end