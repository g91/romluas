function LuaI_204425_Check()
	if CheckAcceptQuest( OwnerID() , 420812 ) == false or CheckFlag( OwnerID() , 542562 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204425_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204425_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local IDGroup = {101755,101756,101757,101758,101760,101761,101762,101763}
	local Search = "No"
	for i = 1 , table.getn( IDGroup ) , 1 do
		if OrgID == IDGroup[i] then
			Search = "Yes"
			break
		end
	end
	if Search == "No" then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204425_1]" , 0 ) --�ؼФ����T
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204425_1]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 200 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204425_5]" , 0 ) --�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204425_5]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204425_2]" , 0 ) --�ؼХ��b�԰���
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204425_2]" , 0 )
		return false
	end
	if CheckBuff( TargetID() , 501463 ) == true or CheckBuff( TargetID() ,500977 ) == true or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_3]" , 0 );--��ܰT���G�ؼв{�b�����A���A�X�@����
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204425_3]" , 0 );
		return false--�^�� false �Ө����I�k�A�õ���Script		
	end
	return true
end

function LuaI_204425_Use()
	BeginPlot( TargetID() , "LuaI_204425_Play" , 0 )
end

function LuaI_204425_Play()
	local Corpse = Lua_CreateObjByDir( OwnerID() , 112791 , 15 , 0)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Lua_ObjDontTouch( Corpse )
	AddToPartition( Corpse , RoomID )
	SetRoleCamp( OwnerID() , "Visitor" )
	Yell( OwnerID() , "?" , 2 )
	sleep( 20 )
	Yell( OwnerID() , "!" , 2 )
	AddBuff( OwnerID() , 501463 , 5 , 1 )
	sleep( 30 )
	if CheckID( TargetID() ) == true then
		ScriptMessage ( TargetID() ,  TargetID() , 1, "[SC_204425_4]" , 0 );--�ݨӥ��]���ӳ��w�o�Ө��D
		ScriptMessage(TargetID() ,  TargetID() , 0, "[SC_204425_4]" , 0 );
		SetFlag( TargetID() , 542562 , 1 )
	end
	DelObj( Corpse )
	Hide( OwnerID() )
	CancelBuff( OwnerID() , 501463 )
	SetRoleCamp( OwnerID() , "Monster" )
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_112738_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420816 ) == true and CountBodyItem( OwnerID() , 204472 ) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112738_0]","LuaS_112738_1",0) --�J���ˬd����	
	end
end
function LuaS_112738_1()
	SetSpeakDetail( OwnerID(), "[SC_112738_1]"  ) --�o����骺���p�۷��~�G......
	if CheckAcceptQuest( OwnerID() , 420816 ) == true and CountBodyItem( OwnerID() , 204472 ) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112738_2]","LuaS_112738_2",0) --����[204472]
	end
end
function LuaS_112738_2()
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() , 204472 , 1 )
end

function LuaS_112646_0()
	if ( CheckAcceptQuest( OwnerID() , 420818 ) == true or CheckCompleteQuest( OwnerID() , 420818 ) == true ) and CheckCompleteQuest( OwnerID() , 420865 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_112646_0]"  ) --([112646]�ݰ_�Ӧ��G���J�F���g�C�^
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_112670_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420935 ) == true and CheckCompleteQuest( OwnerID() , 420935 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112670_0]","LuaS_112670_1",0) --ť[112670]�ԭz����L�h���^��	
	end
end

function LuaS_112670_1()
	SetSpeakDetail( OwnerID(), "[SC_112670_1]"  ) --�b���٫ܤp���ɭ�......
	SetFlag( OwnerID() , 542561 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_112670_2]","LuaS_112670_0",0) --�����o�Ӹ��D	
end