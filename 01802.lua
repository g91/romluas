function LuaS_422932_0()-----���b���~207153�ϥΤU��<�ˬdlua>���U�C
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102815	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422932_1]", 0 ); -----�o��[205871]���G�u���[113447]�ϥΡC
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 70  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[205871]�C
		return false
	end
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --�ؼФw�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	end
	if	DW_CheckRide() == true	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422932_3]" , 0 ) --�M���ɤ��i�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422932_3]" , 0 )	
		return false	
	end

	return true

end

function LuaS_422932_1()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422932_2]", 0 ); -------�A��쬡�۶îM��[102815]�F�I
	DelBodyItem(OwnerID(),207153,1)
	GiveBodyItem(OwnerID(),207154,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end


--�������ȫ�
function LuaS_422932_2()	--���b����422932����������
	if	 CountBodyItem( TargetID(), 207154)>0	 then 
		 DelBodyItem( TargetID(), 207154, 1 )
	end
	
end

function LuaS_422933_0()
	--say(OwnerID(),"I'm Owner")       --�����D�֬OOWNER
	say(OwnerID(),"[SC_422933]")
	AdjustFaceDir(OwnerID(),TargetID(),0)
	Playmotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
end

function LuaS_115022()
	while 1 do
		sleep(100)
		say(OwnerID(),"[SC_115022_9]")   	  --�����D�§Q�̪�L������
		sleep(300)
		say(OwnerID(),"[SC_115022_10]")	  --�u�t�H��ߪ�

		sleep(1000)
	end
end

function LuaS_115022_0()
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115022_0]","LuaS_115022_1",0)    --�x��?
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115022_2]","LuaS_115022_2",0)	   --�i�D�o[115029]�̪񪺪��p
	if CheckAcceptQuest(OwnerID(),422945) == true and CheckCompleteQuest(OwnerID(),422945) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_115022_4]","LuaS_115022_3",0)		--����o�ʫH...
	end
end
function LuaS_422945_accept()
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	say(OwnerID(),"[SC_115022_11]")
end
function LuaS_115022_1()
	SetSpeakDetail(OwnerID(),"[SC_115022_1]")
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_115022_0", 0 ) --/*�^�W�@��	
end

function LuaS_115022_2()
	SetSpeakDetail(OwnerID(),"[SC_115022_3]")
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_115022_0", 0 ) --/*�^�W�@��		
end

function LuaS_115022_3()
	SetSpeakDetail(OwnerID(),"[SC_115022_5]")	
end
function LuaS_115022_complete()
	CloseSpeak(OwnerID())
	AddBuff( TargetID(),  506741 , 1 , 300)                                         ---��L���Ȫ����a�~�ݨ�
	local bedi = Lua_DW_CreateObj("obj",115045,OwnerID())   --BEDI���H
	Lua_ObjDontTouch( bedi ) 	---����IBEDI���H
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	MoveToFlagEnabled(bedi,false)
	AdjustFaceDir( bedi ,TargetID(), 0 )
	sleep(5)
	PlayMotion( bedi ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)
	say(bedi,"[SC_115022_6]")		--�Ի~�z�Ӧh�ɶ��F
	sleep(20)
	--PlayMotion( bedi ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)
	say(bedi,"[SC_115022_7]")		--�u���ܷP���M�h�j�H������
	sleep(20)	
	local NPC12 = Lua_DW_CreateObj("flag" ,115079,780594,0)
	sleep(20)
	say(NPC12,"[SC_115022_12]")		--������i�H�����Ӧ��ܡH
	AdjustFaceDir( bedi ,NPC12,0 )
	delobj(NPC12)
	sleep(20)
	AdjustFaceDir( bedi ,TargetID(), 0 )	
	sleep(20)	
	say(bedi,"[SC_115022_8]")                     --��..���n�N��...
	sleep(20)	
	say(bedi,"[SC_115022_13]")                   --�n�����Ʊ��n���N�����e�F...
	sleep(20)	
	PlayMotion( bedi ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(30)	
	DW_MoveToFlag(bedi,780594 , 1,0 ,1)	
	DW_MoveToFlag(bedi,780594 , 2,0 ,1)	
	DW_MoveToFlag(bedi,780594 , 3,0 ,1)	
	sleep(20)	
	delobj(bedi)
	CancelBuff( TargetID()  , 506741  ) 	--
end

function LuaS_115029_0()
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),422936) == true and CheckCompleteQuest(OwnerID(),422936) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_115029_0]","LuaS_115029_1",0)		 --���˦ۥh��[115022]�k�h��?
	end
end
function LuaS_422936_accept()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DAZED_BEGIN)
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	say(OwnerID(),"[SC_115029]")
end
function LuaS_115029_1()
	SetSpeakDetail(OwnerID(),"[SC_115029_1]")		--���ܦh�Ʊ����O�μL�����N�i�H�z�Ѫ��C�ӥB�M�h�V�m�]�٦b�i�椤�A���i�H�H�N�涤�O�C
end

function LuaS_422945_complete()
	
	say(OwnerID(),"[SC_115029_2]")
end


function LuaS_test_complete()
	say(OwnerID(),"i'm owner")
	say(TargetID(),"i'm Target")	
end

Function movestop()
	MoveToFlagEnabled(OwnerID(),flase)
	SetPlot(OwnerID(),"touch","touchmove",110)
end

Function nearmove()
	MoveToFlagEnabled(OwnerID(),flase)	
end

Function touchmove()
	MoveToFlagEnabled(TargetID(),true)	
	CallPlot(TargetID(),DW_MoveToFlag,TargetID(),780594 , 0,0 ,1)
end

Function target_is_talk()
	--CallPlot(TargetID(),DW_MoveToFlag,TargetID(),780594 , 0,0 ,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_IS_TALK]"  , 0 ) --�C	
end

Function say_dbid()
	say(OwnerID(),OwnerID())
end