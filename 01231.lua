function LuaI_203782_Quest()---�ج�����
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_421914]")
                      ShowBorder( OwnerID(), 421914,str , "ScriptBorder_Texture_Paper" )	

end

function LuaS_421922_1()---���Z���^��
	if  CheckFlag(OwnerID(), 542402 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                                LoadQuestOption( OwnerID() )  
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_2", 0 )  ---�������G���ܤF�A�аݧA�����󪺬��������ܡH
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

end
end
function LuaS_421922_2()
	SetSpeakDetail( OwnerID(),   "[SC_421922_2]"  ) 
	SetFlag( OwnerID(),542402, 1 ); --�����������Ȫ��X��
END


function LuaS_421922_3()---�f��諸�^��
	if  CheckFlag(OwnerID(), 542403 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                                LoadQuestOption( OwnerID() )  
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_4", 0 )  ---�������G���ܤF�A�аݧA�����󪺬��������ܡH
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
end
end
function LuaS_421922_4()
	SetSpeakDetail ( OwnerID(),   "[SC_421922_3]" ) 	
	SetFlag( OwnerID(),542403, 1 ); --�����������Ȫ��X��
END

function LuaS_421922_5()---�ƾ����^��
	if  CheckFlag(OwnerID(), 542404 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                                LoadQuestOption( OwnerID() )  
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_6", 0 )  ---�������G���ܤF�A�аݧA�����󪺬��������ܡH
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

end
end
function LuaS_421922_6()
	SetSpeakDetail ( OwnerID(),   "[SC_421922_4]" ) 	
	SetFlag( OwnerID(),542404, 1 ); --�����������Ȫ��X��
END

function LuaS_421922_7()---��J�����^��
	if  CheckFlag(OwnerID(), 542405 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                      LoadQuestOption( OwnerID() )  
	     AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_8", 0 )  ---�������G���ܤF�A�аݧA�����󪺬��������ܡH
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
end
end
function LuaS_421922_8()
	SetSpeakDetail ( OwnerID(),  "[SC_421922_5]" ) 	
	SetFlag( OwnerID(),542405, 1 ); --�����������Ȫ��X��
END

----------------------------�P�_�O�_�F��19��

function LuaI_421923_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 18 )and(CheckFlag( OwnerID() , 542406 )==false)then
		SetFlag(OwnerID() , 542406 , 1 )
	end
end

---------------------------
function LuaI_203923() --�W��203923
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_203923]");
	ShowBorder( OwnerID(), 0, "[203923]", "ScriptBorder_Texture_Paper" );
end


