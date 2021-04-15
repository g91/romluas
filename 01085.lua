---------------------------------------�봵��
function LuaS_110500_Quest()           
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(), 203356 ) > 0  then  --�֦��W�ꪺ�c�l
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421534_1]","LuaS_110500_2",0)  --�аݧA�O�u�n���Y�v�j���ܡH		
	end

	if	CountBodyItem( OwnerID(), 203356 ) > 0	and
		CheckAcceptQuest(OwnerID(),421533)==true 	and
		CheckCompleteQuest( OwnerID() , 421533) == false	and
		CheckCompleteQuest(OwnerID(),421534)==true then  --�w�ѧ��_�ͻs�@����

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421534_4]","LuaS_110500_4",0)  --�i�H�бz�A���ڶ}�@���c�l�ܡH	
	end		
end

function LuaS_110500_2() 

	SetSpeakDetail(OwnerID(),"[SC_421534_2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421534_3]","LuaS_110500_3",0)	
end

function LuaS_110500_3()

	SetFlag(OwnerID() , 542231 , 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_110500_4()
	SetSpeakDetail(OwnerID(),"[SC_421534_5]")
	GiveBodyItem( OwnerID(), 203365, 1 )
	DelBodyItem( OwnerID() , 203356 , 1 ) 
end



-----------------------------------------�L�Y
function LuaS_110060_Quest()           
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(), 203367 ) > 0 then  --�֦��v���u��
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421536_1]","LuaS_110060_1",0)  --�ժܽЧڰe�v�����u���p�C		
	end	
end

function LuaS_110060_1() 

	if DelBodyItem( OwnerID() , 203367 , 1 ) then
		SetSpeakDetail(OwnerID() , "[SC_421536_2]" )
		SetFlag(OwnerID() , 542181 , 1 )
	end

end

-------------------------�d�A�R
function LuaS_110491_Quest()           
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(), 203370 ) > 0 then  --�֦��ժ���߽c
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421538_1]","LuaS_110491_1",0)  		
	end	
end 

function LuaS_110491_1() 
	CloseSpeak( OwnerID() )
	if DelBodyItem( OwnerID(), 203370 , 1 ) then
		--SetSpeakDetail(OwnerID(),"[SC_421538_2]")
		SetFlag(OwnerID() , 542183 , 1 )
		BeginPlot( TargetID() , "LuaS_110491_2" , 0 )
	end
end

function LuaS_110491_2()
	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_421538_2]" )				-- ��H�c�l�̦�����H
	Sleep( 10 )	
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_421538_3]" , 0 )	-- �d�A�R���}�c�l
	local Frog = CreateObjByFlag( 111817 , 780213 , 0 , 1 )
	AddToPartition( Frog , 0 )
	Sleep( 5 )
	Say( OwnerID() , "[SC_421538_4]" )				-- �ڡI�C��I�I
	Say( Frog , "[SC_421538_8]" )				-- �K�I
	Sleep( 5 )
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_421538_5]" , 0 )	-- �A�ݨ�d�A�R��W��������
	Say( OwnerID() , "[SC_421538_6]" )				-- ���}�I�I�I
	CastSpell( OwnerID() , Frog , 492224 )	-- ��t�S�� ���y�N
	Sleep( 20 )
	CastSpell( OwnerID() , Frog , 492224 )	-- ��t�S�� ���y�N
	Sleep( 5 )
	Say( OwnerID() , "[SC_421538_7]" )				-- �i�c�I�ֵ��ڨ��}�I�I
	Say( Frog , "[SC_421538_9]" )				-- �K�I�K�K�I
	LuaFunc_MoveToFlag( Frog , 780213 , 1 , 0 )
	Sleep( 5 )
	CastSpell( OwnerID() , Frog , 492224 )	-- ��t�S�� ���y�N
	Sleep( 20 )
	CastSpell( OwnerID() , Frog , 492224 )	-- ��t�S�� ���y�N
	Sleep( 5 )
	LuaFunc_MoveToFlag( Frog , 780213 , 2 , 0 )
	LuaFunc_MoveToFlag( Frog , 780213 , 3 , 0 )
	if CheckID( Frog ) == true then DelObj( Frog ) end
	DisableQuest( OwnerID() , false )
end

---------------------------------���R�w�ҤH
function LuaS_111830()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421534)==true )and(CountBodyItem( OwnerID(), 203363 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421534]","LuaS_421534_1",0)
	end
end

function LuaS_421534_1()

	GiveBodyItem( OwnerID(), 203363, 1 )
	CloseSpeak( OwnerID() )
end






