function Lua_GoblinGacha() -- 2014.08.21�s�W �����L�{�{��J�A50�ӫi�̾������@����J
	local RoleName = GetName( OwnerID() ) 	
	if Check_Bag_Space( OwnerID() , 1 ) == false then
		return false
	end
	local itemset = {	  1 ,""	, { 520643 ,1 } --
		        		, 2 ,""	, { 520623 , 1 } -- 
				, 27,""	, { 724941 , 2 } --III���Ť�
				,100, ""	, { 720529 , 1 }	}  --�ӫ��D���
	BaseTressureProc7(   itemset , 1 );
	return true;

end


--6.1.1����}�l�ϥγo�Ӫ���(�x���r�u���e�������X)
function Lua_na_GoblinTitle0()
	local Owner = OwnerID()
	local Target = TargetID()
	local Title = {	530375 , 530376 , 530377 , 530988	}

	if CountBodyItem(Owner , Title[4] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE005]" )--�@	
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(15)", 0) --��15��<CM>[205037]</CM>���������L�{�{��J[205037]
	elseif CountBodyItem(Owner , Title[3] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE004]" )--�@
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(400)", 0) --��400��<CM>[205037]</CM>�����ٸ�<CP>�u�����L�n�B�͡v</CP>
	elseif CountBodyItem(Owner , Title[2] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE003]" )--�@
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(250)", 0) --��250��<CM>[205037]</CM>�����ٸ�<CP>�u���_�ݡv</CP>
	elseif CountBodyItem(Owner , Title[1] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE002]" )--�@
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(100)", 0) --��100��<CM>[205037]</CM>�����ٸ�<CP>�u½�u�a�A�����L�I�v</CP>
	else
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE001]" )--�@
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(10)", 0) --��10��<CM>[205037]</CM>�����ٸ�<CP>�u�����L�i�h�v</CP>		
	end
end


function Lua_na_GoblinTitle_Check(num)
	local Owner = OwnerID()
	local Item = 205037
	local Title = {	[10] = 530375 , 
			[100] = 530376 , 
			[250] = 530377 , 
			[400] = 530988 , 
			[15] = 205688	}
	if CountBodyItem( Owner, Item ) >= num then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE007]" )
		GiveBodyItem( Owner , Title[num], 1 )
		DelBodyItem( Owner , Item , num )
	else
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--�A�S��������<CP>[205037]</CP>
	end
end