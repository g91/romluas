function LuaS_422633()  --
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422633)== true )and( CheckCompleteQuest( OwnerID() , 422633) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422633_1]","LuaS_422633_0",0) --�Чi�D�ڧa�I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422578_2]","LuaS_422633_1",0) --��
end
end

function LuaS_422633_0()
                SetSpeakDetail(OwnerID(),"[SC_422633_2]") ---���ڨӧi�D�A
                SetFlag(OwnerID() ,542998, 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422633",0) 
end

function LuaS_422633_1()  
	SetSpeakDetail(OwnerID(),"[SC_422633_3]") --- �A......
               AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422633",0) 
end


--===============================
function LuaQ_422637_Complete()
	DisableQuest( OwnerID() , true )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	MoveToFlagEnabled( OwnerID() , false )
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	Yell( OwnerID() , "[SC_422637_1]" , 3 ) --�ڰO�o���˴��g�����ڬݹL���د��_���p�ۤl�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 25 )
	Yell( OwnerID() , "[SC_422637_2]" , 3 ) --���G�s���^���ۡA�q�`�O�ΨӺ��������F��......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 25 )
	Yell( OwnerID() , "[SC_422637_3]" , 3 ) --�]�\����......�L���ܷQ�i�D��......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 25 )
	Yell( OwnerID() , "[SC_422637_4]" , 3 ) --�ڥ�����ť�A�L�ҷQ�n�i�D�ڪ��ܡC
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 15 )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_THROW )
	sleep( 10 )
	local Ball = Lua_CreateObjByDir( OwnerID() , 113372 , 10 , 0) 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Lua_ObjDontTouch( Ball ) 
	AddToPartition( Ball , RoomID )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	CastSpell( Ball , Ball , 493776 )
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_5]" , "0xffffc600" ) --�o�O�Q�x�b������󪺲ĤT�ѡC
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_5]" , "0xffffc600" ) --�o�O�Q�x�b������󪺲ĤT�ѡC
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_6]" , "0xffffc600" ) --�ڭ̥�[102444]��F�@�ǹs��C
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_6]" , "0xffffc600" ) --�ڭ̥�[102444]��F�@�ǹs��C
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_7]" , "0xffffc600" ) --�b������L�K�@���e�{���ʪ�......�x......
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_7]" , "0xffffc600" ) --�b������L�K�@���e�{���ʪ�......�x......
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_8]" , "0xffff8000"  ) --�ʤF�I�L�ʤF�I
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_8]" , "0xffff8000"  ) --�ʤF�I�L�ʤF�I
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_9]" , "0xffff8000"  ) --�w�J�A���L���@�I�A�֡I�O�b�L���e�o���C
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_9]" , "0xffff8000"  ) --�w�J�A���L���@�I�A�֡I�O�b�L���e�o���C
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_10]" , "0xffffc600" ) --��......
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_10]" , "0xffffc600" ) --��......
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_11]" , "0xffff8000"  ) --�Ѱڡ�
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_11]" , "0xffff8000"  ) --�Ѱڡ�
	sleep( 20 )
	CastSpell( Ball , Ball , 493776 )
	sleep( 10)
	Delobj( Ball )
	MoveToFlagEnabled( OwnerID() , true )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	DisableQuest( OwnerID() , false )
end