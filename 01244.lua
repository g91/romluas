-----function LuaI_204068_Quest()---����
------	ClearBorder( OwnerID());	--��l�ƥ۸O����
-------	AddBorderPage( OwnerID(), "[SC_204068]")
--------                    ShowBorder( OwnerID(), 421941, GetObjNameByGUID(GetUseItemGUID(OwnerID())), "ScriptBorder_Texture_Paper" )	

------end


function LuaS_111257()---������g
	if   CountBodyItem( OwnerID() , 203961 )< 1  and CheckAcceptQuest( OwnerID(),  421943 ) == true then  
                                LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421943_1]" , "LuaS_421943_1", 0 )  ---�����A�ЧڹL�ӦV�A�ɨ��u�t�����I
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

	end
end
function LuaS_421943_1()
	SetSpeakDetail( OwnerID(),   "[SC_421943_2]" ) ---�����Q�ɨ��u�t�����H�ڬO�o�򪺥��}�L�A���n���ɤF�A�ڬƦ��@�N�N�շt�����e�L�I�o�N�O�շt�����A�A���ڮ����L�a�I�������]�S���Y�A�u�n�گ����W�����a��A���޻��a�I
                                                                     
	GiveBodyItem( OwnerID() , 203961 , 1 ); --�����������Ȫ��X��
END
-------------------------------------------------------------------------------------------------

function LuaI_203984() --���K�H��
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_203984]");
	ShowBorder( OwnerID(), 0, "[203984]", "ScriptBorder_Texture_Paper" );
end
--------------------------------------------------------------------------------------------------
function LuaI_112404_0()----�u�@�̥l���
 	SetPlot( OwnerID() , "Range" , "LuaI_112404_1" , 50 )
end
function LuaI_112404_1()
	if(CheckAcceptQuest( OwnerID() , 421948 ) == true and Countbodyitem( OwnerID() , 203964 ) >=1)  then
	BeginPlot( OwnerID() , "LuaI_112404_2" , 0 )
	end
end
function LuaI_112404_2()
	if Countbodyitem( OwnerID() , 203964 ) >=1  and CountBodyItem( OwnerID() , 203977 ) ==0 then
	    ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112404]", 0)
	     GiveBodyItem( OwnerID() , 203977 , 1 )
                      DelBodyItem ( OwnerID() , 203964 , 1 )	

	END
END

