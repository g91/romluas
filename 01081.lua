-----�ժܪ����֯�(�g�ۤ@���u��)

function LuaI_203355_Quest()
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_203355]" );
	ShowBorder( OwnerID(), 0,"[203355]", "ScriptBorder_Texture_Paper" )	
end

-----�ժܪ����֯�(�g�ۤG���u��)

function LuaI_203358_Quest()
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_203358]" );
	ShowBorder( OwnerID(), 0, "[203358]", "ScriptBorder_Texture_Paper" )	
end

-----�ժܪ����֯�(�g�ۤT���u��)

function LuaI_203369_Quest()
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_203369]" );
	ShowBorder( OwnerID(), 0, "[203369]", "ScriptBorder_Texture_Paper" )	
end

-----�ժܪ����_��

function LuaI_203371_Quest()

	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if PLAYERLV < 10 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203371_1]" , 0 )	--���F�Ӫ��~�ϥε��šA�ݨ�F����10�~��}�ҡC	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203371_1]" , C_SYSTEM )	
	else
		ClearBorder( OwnerID());	--��l�ƥ۸O����
		AddBorderPage( OwnerID(), "[SC_203371]");
		ShowBorder( OwnerID(), 421539, "[203371]", "ScriptBorder_Texture_Paper" )	
	end
end







-----�}�ꪺ�c�l��������

function LuaI_203365_Quest()

	GiveBodyItem( OwnerID(), 203357, 1 )
	UseItemDestroy() 		--�R���ϥΤ������~

end



-----ù�i���_�c

function LuaI_203372_Quest()
	if CheckFlag( OwnerID() , 542292 ) == false and CheckCompleteQuest( OwnerID() , 421539 ) == false then
		GiveBodyItem( OwnerID(), 211517, 1 )
		GiveBodyItem( OwnerID(), 211518, 1 )
		GiveBodyItem( OwnerID(), 211519, 1 )
		SetFlag(OwnerID() , 542292 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421669]" , C_SYSTEM )	
	end
	UseItemDestroy() 		--�R���ϥΤ������~

end


