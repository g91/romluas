-------------------�S�O��q(422877)---
function LuaS_422877_0()-----���b���~SERVER�ݼ@��...����k�G�~�L������
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102496	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_0]", 0 ); -----�o��[206444]���G�u���[102496]�ϥΡC
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_1]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[206444]�C
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>=0.9	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_8]", 0 ); ----�A�S���ϥΤO�q�A��[206444]�����[102496]�C
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_2]", 0 ); ----[102496]���O�ä㤤�A�A�L�k���Q�ϥ�[206444]�C
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --�e�w�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
		return false
	end

	return true
end

function LuaS_422877_1()
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_3]", 0 ); -------�A���[102496]�F�I
	DelBodyItem(OwnerID(),206444,1)
	GiveBodyItem(OwnerID(),206454,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end
function LuaS_422877_3()----
	if 	CountBodyItem( OwnerID() , 206454 ) > 0 	then
		SetSpeakDetail ( OwnerID(),"[SC_422877_3]" )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_4]","LuaS_422877_4",0) 
	end
end
function LuaS_422877_4()
	DelBodyItem(OwnerID(),206454,1)
	GiveBodyItem(OwnerID(),543515,1)----����a������A�����~�򩹤U��ܡC
	SetSpeakDetail ( OwnerID(),"[SC_422877_5]" )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_6]","LuaS_422877_5",0) 
end
function LuaS_422877_5()
	SetSpeakDetail ( OwnerID(),"[SC_422877_7]" )
	SetFlag(OwnerID() ,543509, 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422727_0",0)
end 



---------------------------------------------------------------------
function LuaI_206452() --��Ӥ��e
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_206452]");
	ShowBorder( OwnerID(), 0, "[206452]", "ScriptBorder_Texture_Paper" );
end
