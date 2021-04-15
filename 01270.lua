function LuaS_422055()  --�������M�I�I
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422055)==true)and( CheckCompleteQuest( OwnerID() , 422055) == false) and (CheckFlag( OwnerID(), 542436 ) ==false )	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422055_1]","LuaS_422055_1",0)--�k�h��^���̧a�C 
	end
end

function LuaS_422055_1()	
	CloseSpeak( OwnerID())
	Yell( TargetID(),"[SC_422055_2]",2)	--��!�ڭn�����L�̡I
	MoveToFlagEnabled(TargetID(), true )	--���}���������޼@��(true���})	
	DisableQuest( TargetID() , true )	--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	SetDelayPatrolTime( TargetID(), 0 )

end

function LuaS_422055_2()	--���޸��|�ĤT�I
	local Fish = {}
	local amount = 5
	local Player = {}
	MoveToFlagEnabled(OwnerID (),false )
	ScriptMessage(OwnerID (), 0, 1, "[SC_422055_3]", 0 )
	sleep(10)
	For i=1, amount  do
		Fish[i] = Lua_DW_CreateObj("flag" ,101854, 780293, i )
		SetPlot(Fish[i],"dead","LuaS_422055_3",0 )
		SetAttack(OwnerID(),Fish[i])
		SetAttack(Fish[i],OwnerID())
		BeginPlot(Fish[i], "LuaS_Discowood_CheckPeace" , 0 )
	End
	while ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1 do
		sleep(10)
	end
	sleep(10)
	Player = SearchRangePlayer(OwnerID() , 350)
	For i=0,table.getn(Player)-1 do
		If	CheckAcceptQuest( Player[i], 422055 )	and
			CheckFlag( Player[i] , 542472 )		then
			SetFlag(Player[i] , 542436 , 1)
		end
	end
	MoveToFlagEnabled(OwnerID(), true )
	sleep(10)
	Say(OwnerID() , "[SC_422055_4]")
	Sleep(20)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_422055_3() --�Ǫ����`�@��
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422055 )	then
			SetFlag( Player   , 542472, 1 )
		end	
	end	
	return true
End

function LuaS_422055_4()	--���޸��|�ĥ|�I
	SetPosByFlag( OwnerID(), 780293 , 6 )
	Hide( OwnerID() )
	sleep(20)
	Show( OwnerID(), 0)
	MoveToFlagEnabled(OwnerID (), false )	--���}���������޼@��(false����)
	DisableQuest( OwnerID () , false )	--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(false���})
end



Function LuaS_422057()   --�ѱϧ��� �X�l�ϥ�780298(1-5)
	--WriteRoleValue (OwnerID() , EM_RoleValue_PID,1  ) 
	local OBSL = Lua_DW_CreateObj("flag" ,112575,780298,1 )
	LuaFunc_MoveToFlag( OBSL,780298,2,0)
	sleep(5)
	Say(OBSL, "[SC_422057]")  --�j�Ƥ��n�F���D�D�A�ֱ̧ϤH�I��V�w�D���L�Q�ǳå�n�W�F��
	sleep(20)
	Say(OBSL, "[SC_422057_1]")  -- ��ڨӡA�b�o��I
	sleep(10)
	Say(OwnerID(), "[SC_422057_2]") --�·ЧA���L�h�ݬݱ��p�A�ڦA�h���h����ӡC
	LuaFunc_MoveToFlag( OBSL,780298,3,0) 
	LuaFunc_MoveToFlag( OBSL,780298,4,0) 
	DelObj (OBSL)
end


function LuaS_422057_1()
	
	SetPlot( OwnerID(),"range","LuaS_422057_2", 100)
	WriteRoleValue (OwnerID(), EM_RoleValue_PID,TargetID())	
end


Function LuaS_422057_2()
		SetPlot( TargetID(),"range","", 0)
		BeginPlot( TargetID() , "LuaS_422057_5" , 0 )
	if	 (CheckAcceptQuest(OwnerID(),422057)==true )and( CheckCompleteQuest( OwnerID() , 422057)==false) and (CheckFlag( OwnerID(), 542437 )== false)	then 
		local FISHORZ = Lua_DW_CreateObj("flag" ,101854,780298,5)
		WriteRoleValue (FISHORZ , EM_RoleValue_PID,TargetID())
		WriteRoleValue (TargetID(), EM_RoleValue_PID,FISHORZ )
		local TND = ReadRoleValue(FISHORZ,EM_RoleValue_PID)
		Yell(TND, "[SC_422057_4]",2)	--�ϩR��O���ڡI�O���ڡI�ڧ�����������A��
		SetPlot(FISHORZ,"dead","LuaS_422057_3",0 )
	end	
End

function LuaS_422057_5()
	local FISHORZ = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 1, 50 , 1 do
		if CheckID(FISHORZ) == false or ReadRoleValue(  FISHORZ , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(  FISHORZ , EM_RoleValue_OrgID ) ~= 101854 then
			break
		end
		sleep( 60 )
	end
	if CheckID(FISHORZ) == true and ReadRoleValue(  FISHORZ , EM_RoleValue_IsDead ) == 0 and ReadRoleValue(  FISHORZ , EM_RoleValue_OrgID ) == 101854 then
		Delobj( FISHORZ )
	end
	SetPlot(OwnerID() , "range","LuaS_422057_2", 100)
end

function LuaS_422057_3() --�Ǫ����`�@��
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422057 )	then
			SetFlag( Player  , 542437, 1 )
			local TND = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
			Say(TND, "[SC_422057_3]")	--���٬��ۡI�O�A�ϤF�ڡ�u�O�ӷP�§A�F�I
		end	
	end	
	
	return true
End


function LuaS_422057_4()	--�������ȫ�
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
end



Function LuaS_422059()	--���A���o��(�K�y)
	tell(TargetID(),OwnerID(),"[SC_422059]")
	return true			
end

Function LuaS_422059_1()	
	say(OwnerID(),"[SC_422059_1]")			
end





function LuaS_422060()  --�i�}�լd
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422060)==true )and( Checkflag( OwnerID() , 542307) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422060]","LuaS_422060_1",0) --�n�A���@�N��U�լd�C
	end
	if (CheckAcceptQuest(OwnerID(),420629)==true )and( CheckCompleteQuest( OwnerID() ,420629) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_420629_0]","LuaS_420629_1",0) --�߰ݳD�H���Ʊ�
	end
end


function LuaS_422060_1()  
	SetSpeakDetail(OwnerID(),"[SC_422060_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422060_2]","LuaS_422060_2",0)	--
end

function LuaS_422060_2()  
	SetFlag(OwnerID() ,542307, 1 )
	CloseSpeak( OwnerID())
end



function LuaS_422061()  --�Ƥ�H��
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422061)==true)and( CheckCompleteQuest( OwnerID() , 422061) == false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422061_1]","LuaS_422061_1",0) 	
	end	
end

function LuaS_422061_1()
	CloseSpeak( OwnerID())
	Say( TargetID(), "[SC_422061_2]" )
	sleep(30)
	Say( TargetID(), "[SC_422061_3]" )
	sleep(30)
	Say( TargetID(), "[SC_422061_4]" )
	SetFlag(OwnerID() ,542480, 1 )
end


function LuaS_422062()  --���L�̳ܪ�
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422062)==true )and( CheckCompleteQuest( OwnerID() , 422062) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422062]","LuaS_422062_1",0) 
end
end

function LuaS_422062_1()  
	SetSpeakDetail(OwnerID(),"[SC_422062_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422062_2]","LuaS_422062_2",0) 
end

function LuaS_422062_2()  
	SetSpeakDetail(OwnerID(),"[SC_422062_3]")
	setFlag(OwnerID() ,542445, 1 )
	CloseSpeak( OwnerID())
end


function LuaS_422062_3()
	local R = Rand( 100 ) + 1
		if R >= 0 and R < 75 and (CountItem (OwnerID(), 204299 )<1) and ( CheckCompleteQuest( OwnerID() , 422090) == false) then
	GiveBodyItem( OwnerID(),204299, 1 )
	Return 1
	End
	GiveBodyItem( OwnerID(),204298, 1 )
	Return 1
end


function LuaS_422064_2()	--�@�ɥ���H
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==101740 or ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==101741 then
			return true		
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422064]", 0 )
	return false
end


function LuaS_422064()
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_422064_1]", 0 )
	ScriptMessage( OwnerID(), OwnerID(), 2 ,"[SC_422064_1]", 0 )
	BeginPlot( OwnerID(), "LuaS_422064_1", 0 )
End


function LuaS_422064_1()
	GiveBodyItem (OwnerID(),204239,1)	--�������a����
	DelBodyItem( OwnerID(), 204136,1 )	--�R�����a���W����
	Sleep(10)
	SetFlag( OwnerID(),542476, 1 )
end



function LuaS_422065_2()	--���ߤ@���Ʊ�
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==112519	then
			return true		
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422065]" , 0 )
	return false
end


function LuaS_422065()
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_422065_1]", 0 )
	BeginPlot( OwnerID(), "LuaS_422065_1", 0 )
End


function LuaS_422065_1()
	GiveBodyItem (OwnerID(),204137,1)
	DelBodyItem( OwnerID(),204238 ,1 )	
	Sleep(10)
	SetFlag( OwnerID(),542481, 1 )
end


function LuaS_422065_3()
	if (CheckAcceptQuest(OwnerID(),422065)==true )  and CountBodyItem( OwnerID() , 204238 ) > 0 then	
	tell(OwnerID(), TargetID() ,"[SC_422065_2]")
	ScriptMessage( OwnerID(), OwnerID(), 2 ,"[SC_422065_2]", 0 )
	end
end



function LuaS_422065_4()
	SetPlot(OwnerID(),"range","LuaS_422065_3",150)
end



function LuaS_422067()	--�X�l�ϥ�780298(6-8)
	local ULI = Lua_DW_CreateObj("flag" ,112656,780298,6 )
	BeginPlot(ULI,"LuaS_422067_1", 0 )
	sleep(80)
	MoveToFlagEnabled (ULI  , false)	--��������
	Say(ULI,"[SC_422067]")		--�f�纸���͡A�o����ܦM�I�A�ЧA�a�۫Ĥl�^�����̧a�C
	Sleep(20)
	Say(OwnerID(),"[SC_422067_1]")	--��ߡA�Ĥl�ڷ|�n�n�ݵۡA�O�A�ӥ��Z�ڪ���s�F��
	Sleep(20)
	Say(ULI,"[SC_422067_2]")		--�f�纸���͡K�ЧO���ڭ̻ݭn�ʥΪZ�O��A�a���K�ƶ����w�g���F�o��Ʊ��Ф߫ܤ[�C
	Sleep(25)
	Say(OwnerID(),"[SC_422067_3]")	--�ҹ���S�H���O�٦��ܦh�Ʊ����L�Ъ��ܡH�����}�����S���O�Ӫ����A��s�o��[�]�S�X�ơA�A�٬O�֥h���ާO�B�a��
	Sleep(30)
	Say(ULI,"[SC_422067_4]")		--�f�纸���͡K�K
	Sleep(20)
	Say(OwnerID(),"[SC_422067_5]")	--�A�֨��A�ڦۤv�|�ݱ��p����I
	Sleep(30)
	Say(ULI,"[SC_422067_6]")		--�K�K�Цۤv�p�ߡK�K
	WriteRoleValue( ULI ,EM_RoleValue_IsWalk , 1 )--�Ψ���
	sleep(20)
	MoveToFlagEnabled (ULI  , true)
	LuaFunc_MoveToFlag(ULI , 780298, 8 , 0 )
	DelObj (ULI)
end


function LuaS_422067_1()
	LuaFunc_MoveToFlag(OwnerID() , 780298, 7 , 0 )
end



function LuaS_422068()	--�Ѥ��@�� 
	--SetDelayPatrolTime( TargetID(), 0 )
	BeginPlot( TargetID() , "LuaI_112520_0" , 0 )
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422068)==true )and( CheckCompleteQuest( OwnerID() , 422068) == false) and
	CountBodyItem ( OwnerID(), 204201)>0 then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422068]","LuaS_422068_1",0)
	End

	if (CheckAcceptQuest(OwnerID(),422068)==true )and( CheckCompleteQuest( OwnerID() , 422068) == false) and
	CountBodyItem ( OwnerID(), 204202)>0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_2]","LuaS_422068_2",0)
	end

	if (CheckAcceptQuest(OwnerID(),422068)==true )and( CheckCompleteQuest( OwnerID() , 422068) == false) and
	CountBodyItem ( OwnerID(), 204203)>0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_4]","LuaS_422068_3",0)
	end	
end

function LuaI_112520_0()		--���`���W����
	while 1 do
	Say(OwnerID(),"[SC_112520]")
	sleep(20)
	Say(OwnerID(), "[SC_112520_1]")
	sleep(300)
	end
end




function LuaS_422068_1()
	SetSpeakDetail(OwnerID(),"[SC_422068_6]") 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_9]","LuaS_422068_4",0)	--�C
End

function LuaS_422068_4()
	SetSpeakDetail(OwnerID(),"[SC_422068_1]")
end

function LuaS_422068_2()
	SetSpeakDetail(OwnerID(),"[SC_422068_7]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_10]","LuaS_422068_5",0) --�C
End

function LuaS_422068_5()
	SetSpeakDetail(OwnerID(),"[SC_422068_3]")
end

function LuaS_422068_3()
	SetSpeakDetail(OwnerID(),"[SC_422068_8]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422068_11]","LuaS_422068_6",0)
End

function LuaS_422068_6()
	SetSpeakDetail(OwnerID(),"[SC_422068_5]")
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	SetFlag(OwnerID() ,542449, 1 )
	CloseSpeak( OwnerID())
	say(TargetID(),"[SC_422068_12]")
end


function LuaS_422068_7()	--�ˬd�P�������ѥu��֦��@�� 
	if	CountItem( OwnerID(), 204202 )==0	then
		GiveBodyItem(OwnerID (), 204202, 1 )
		Return 1
	end

	if 	CountItem( OwnerID(), 204201 )==0	then
		GiveBodyItem(OwnerID (), 204201, 1 )
		Return 1
	end

	if 	CountItem( OwnerID(), 204203 )==0	then
		GiveBodyItem(OwnerID (), 204203, 1 )
		Return 1
	end
end

function LuaS_422069()	--��s���R
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422069)==true )and( CheckCompleteQuest( OwnerID() , 422069) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422069]","LuaS_422069_1",0) --�ƶ����Ч������լd�B�ѨM�೽�H��M�����H������]�C
	end
end

function LuaS_422069_1()  
	SetSpeakDetail(OwnerID(),"[SC_422069_1]")
	SetFlag(OwnerID() ,542447, 1 )
	CloseSpeak( OwnerID())
end



