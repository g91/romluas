function LuaS_421750_7()---�F�J
	if  CheckFlag(OwnerID(), 542367) == true  then 
		LoadQuestOption( OwnerID() ) 
	else
		SetSpeakDetail( OwnerID(), "[SC_421750_6]"  );--/*�不��ȡH��~�o�ӦW�r�A�A�ѭ���ť�Ӫ��H
          		if  CheckFlag(OwnerID(), 542308) == false  and  CheckFlag(OwnerID(), 542316) ==true and  CheckFlag(OwnerID(), 542317) ==true and CheckAcceptQuest( OwnerID(),  421750 ) == true and CountBodyItem( OwnerID() , 203644 ) > 0 and CountBodyItem( OwnerID() , 203631 ) > 0 then  
			AddSpeakOption( OwnerID(), TargetID(), "[SC_421750_7]" , "LuaS_421750_8", 0 )  ---�ƹ�W�A�ڥ��b�M����в��饢�ܪ����~�A���h�êF��N�b�不��Ȫ���W�C	
			    	
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_8()
               SetSpeakDetail( OwnerID(), "[SC_112155_1]" )---�p�l�A�ڬݤ��O�o��^�Ƨa~�o�O�ڭ��ѧA���W���o���H��~�Ѥ��e�����A���F�讣�ȴN�O�ǻ����h�~�e�f���������w�p�j�I?�a~�o�O���^�ơH
          	AddSpeakOption( OwnerID(), TargetID(), "[SC_112155_2]" , "LuaS_112155_1", 0 )---�Ʊ����p�A�ҷQ�������ˡA�A�⤤���ȱ��N�O����~
	DelBodyItem ( OwnerID(),   203644, 1 )
	DelBodyItem ( OwnerID(),   203631, 1 )

end
function LuaS_112155_1()
	CloseSpeak( OwnerID());	--������ܵ���
	SetFlag( OwnerID(),542308,1 ); --�����������Ȫ��X��
                SetFlag( OwnerID(),542367,1 )

end

-----------------------
