function LuaS_421750_1()---�ئ̺�
	if  CheckFlag(OwnerID(), 542316) == false and CheckAcceptQuest( OwnerID(),  421750 ) == true then  
		SetSpeakDetail( OwnerID(), "[SC_421750_0]"  );--/*�不��ȡH�ڷ�M���D~�u���L~
		if  CountBodyItem( OwnerID() , 203644 ) > 1 then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_421750_1]" , "LuaS_421750_2", 0 )  ---�o�O���S�A�е��ڬ����������a�C
		end
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
	
end

function LuaS_421750_2()
                DelBodyItem ( OwnerID(),   203644, 1 )	
               SetSpeakDetail( OwnerID(), "[SC_421750_2]" )	
	AddSpeakOption( OwnerID(), TargetID() ,  "[SC_421750_3]" , "LuaS_421750_3", 0 ) 	

end

function LuaS_421750_3()
	CloseSpeak( OwnerID() );	--������ܵ���
	SetFlag( OwnerID(),542316, 1 ); --�����������Ȫ��X��


end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_4()---�Ķ��w
          	if  CheckFlag(OwnerID(), 542317) == false and CheckAcceptQuest( OwnerID(),  421750 ) == true and CountBodyItem( OwnerID() , 203644 ) > 1 then  
		SetSpeakDetail( OwnerID(), "[SC_421750_4]"  );--/*�不��ȡH��~�A�Q�Φh�ֳ��S�����o�ӱ���?
		if  CountBodyItem( OwnerID() , 203644 ) > 1 then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_421750_1]" , "LuaS_421750_5", 0 )  ---�o�O���S�A�е��ڬ����������a�C
		end
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_5()
              DelBodyItem ( OwnerID(),   203644, 1 )	
               SetSpeakDetail( OwnerID(), "[SC_421750_5]" )---���]�ۡH�o�ˬO�Ӥ���������I

	AddSpeakOption( OwnerID(), TargetID() ,  "[SC_421750_3]" , "LuaS_421750_6", 0 ) 	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_6()
	CloseSpeak( OwnerID() );	--������ܵ���
	SetFlag( OwnerID(),542317, 1 ); --�����������Ȫ��X��
END

---------------------------------------------------------------------------------------------------
function LuaS_421718()---�ȥ���
	if   CountBodyItem( OwnerID() , 203631 )< 1  and CheckCompleteQuest( OwnerID(),  421802  ) == true  and    CheckCompleteQuest( OwnerID(),  421750  ) ==  FALSE    and CheckCompleteQuest( OwnerID(),  421718  ) == FALSE      then  
                               LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421718_1]" , "LuaS_421718_1", 0 )  ---�аݧA���ݨ쥴�}�_�c�᪺���i[203631]�ܡH
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

	end
end

function LuaS_421718_1()
	SetSpeakDetail( OwnerID(),   "[SC_421718_2]" ) ----  ���Ǥ��e���Ǽ��x�A���h�a�I���n�A���F�I
	GiveBodyItem( OwnerID(),  203631 , 1 ); --�������~
END
