function LuaS_421930()---����
	if   CountBodyItem( OwnerID() , 203952 )< 1  and CheckAcceptQuest( OwnerID(),  421930 ) == true then  
                                LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421930_1]" , "LuaS_421930_1", 0 )  ---�����A�ЧڹL�ӦV�z�ɨ��j�N�ƨ�
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

	end
end
function LuaS_421930_1()
	SetSpeakDetail( OwnerID(),   "[SC_421930_2]" ) 
	GiveBodyItem( OwnerID(),203952, 1 ); --�����������Ȫ��X��
END

-----------------------------------------------------------------------------------
function LuaS_112409()---�u��
	if  CheckFlag(OwnerID(), 542409 ) == false and CheckAcceptQuest( OwnerID(),  421933 ) == true then  
                                      LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421933_1]"  , "LuaS_112409_1" ,  0 )  ---�аݧA���D�����y�v�]�]�θ�����������T�ܡH
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

	end
end
function LuaS_112409_1()
	SetSpeakDetail( OwnerID(),   "[SC_421933_2]"  ) ---�]�]�㫢�������� ���O����F��H�ӡ�ܰs��ܰs��

END
-----------------------------------------------------------
function LuaS_112359()---
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN)
	sleep(30)
                BeginPlot(TargetID() , "LuaS_421932_0" , 0)
end


function LuaS_421933()---�㬥��
	if  CheckFlag(OwnerID(), 542409 ) == false and CheckAcceptQuest( OwnerID(),  421933 ) == true then  
                                 LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421933_1]"  , "LuaS_421933_1" ,  0 )  ---�аݧA���D�����y�v�]�]�θ�����������T�ܡH
		
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
end

function LuaS_421933_1()

	SetSpeakDetail( OwnerID(),   "[SC_421933_3]" ) 
                SetFlag( OwnerID(),542409, 1 );
END

-----------------------------------------------

function LuaS_112355()---ù��
	if   CountBodyItem( OwnerID() , 203945 )< 1  and CheckAcceptQuest( OwnerID(),  421929 ) == true then  
                               LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421929_1]" , "LuaS_421929_1", 0 )  ---�аݧA���S����کұa�Ӫ��j���H
else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO

	end
end
function LuaS_421929_1()
	SetSpeakDetail( OwnerID(),   "[SC_421929_2]" ) ----�o�����G�M�O�A���A�O�o���n���n�A���F�I
	GiveBodyItem( OwnerID(), 203945, 1 ); --�����������Ȫ��X��
END
------------------------------------------------
function LuaS_203978_0(Check)---�aģ����
	if Check == 1 then
	               if   CountBodyItem( OwnerID() , 203962) >=1 then
			return  true
		else
			return false
		end
	else
		if DelBodyItem( OwnerID() , 203962 , 1 ) == true then
			GiveBodyItem(OwnerID() , 223728 , 1)
		end
	end
end

