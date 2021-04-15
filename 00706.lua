function LuaS_421159_0()

	if CheckAcceptQuest( OwnerID() , 421159 ) == true and CheckFlag( OwnerID() , 541299 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_421159_1")   ); --/*�ڪ��D�F�A�O����...�O����...�ڻ��N�O�F�C
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421159_2"),  "LuaS_421159_2",  0 ); --/*�߰ݶ���
	else		
		LoadQuestOption( OwnerID() );
		if CheckAcceptQuest( OwnerID() , 421159 ) == true and CheckFlag( OwnerID() , 541299 ) == false then
			AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421159_0"),  "LuaS_421159_1",  0 ); --/*�N�}�g���ܧi�D����
		end
	end
end

function LuaS_421159_1()
	SetSpeakDetail( OwnerID(), GetString("SC_421159_3")   );
	--/*���򤣴M�`���F��H�ڤ~�S���I����F��I�V�b�I
	--/*�A�̳o�Ƕ��`�M�h�Ϊ������I���`�M�h�κ⤰��H
	--*��@��H�h���٤��O����Ĺ�W�����H�A�u�|�b����[����ϡA�{�b�٥i�H�H�K�N�h�äH�ڡI
	if CheckAcceptQuest( OwnerID() , 421159 ) == true and CheckFlag( OwnerID() , 541296 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421159_4"),  "LuaS_421159_3",  0 ); --/*�ΪZ�O�����ϧN�R
	end
end

function LuaS_421159_2()
	SetSpeakDetail( OwnerID(), GetString("SC_421159_5")   );
	--/*�گu���S���o�{����_�Ǫ��F��C
	--/*���L...�s���B��򩳪��d�F�V�ۤ@�Ǻ���A�ڳ̪�`�`���������Ǻ���_��...
	--/*���Ǻ������D���ګ������A���O�̭����@�Ǫ��ݥi�H���ҥX�ӡA�ڴN����`
	--/*�M�h�ΰt�������ݰ����ð_�ӡA�γo�Ǫ��ݰ����L�̭׸ɲ���...
	--/*�o�N�O�����F�I�n���B�@�ڳ������I���O�A��H�ӥ��ڤF...
	SetFlag( OwnerID() , 541296 , 1 )
end

function LuaS_421159_3()
	CloseSpeak(OwnerID())
	DisableQuest( TargetID() , true )

	BeginPlot( TargetID() , "LuaS_421159_4" , 0 )
end

function LuaS_421159_4()
	local GreenOtto,Player=OwnerID(),TargetID();
	Hide( GreenOtto )
	local GetLoc=function(GUID_or_FlagID,FlagNum)
		local x,y,z,dir
		if	FlagNum==nil	then
			--Obj
			local Obj = GUID_or_FlagID;
			x=ReadRoleValueFloat(Obj,EM_RoleValue_X);
			y=ReadRoleValueFloat(Obj,EM_RoleValue_Y);
			z=ReadRoleValueFloat(Obj,EM_RoleValue_Z);
			dir=ReadRoleValueFloat(Obj,EM_RoleValue_Dir);
		else
			--Flag
			local FlagID = GUID_or_FlagID
			x=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_X);
			y=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Y);
			z=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Z);
			dir=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Dir);
		end
		return x,y,z,dir;
	end
	local UnKnowValue=EM_RoleValue_PID;
	WriteRoleValue( GreenOtto , UnKnowValue , 10 )
	MoveToFlagEnabled( GreenOtto , false )
	local x,y,z,dir=GetLoc(GreenOtto)
	local RedOtto=CreateObj(100736,x,y,z,dir,1);
	AddtoPartition(RedOtto,0);
	SetAttack( RedOtto, Player )
	SetPlot( RedOtto , "dead" , "LuaS_421159_dead" , 0 )
	CallPlot( RedOtto , "LuaFunc_Obj_Suicide" , 10 ) 
	Say( RedOtto , "[SC_421159_7]" ) --/*�����ڡH�ӰڡI
	while true do
		sleep(10)
		if CheckID(RedOtto)==false or HateListCount(RedOtto)==0 or ReadRoleValue(RedOtto,EM_RoleValue_IsDead)==1 then
			break;
		end
		x,y,z,dir=GetLoc(RedOtto);
	end
	SetPos( GreenOtto , x,y,z,dir )
	Show( GreenOtto , 0 )
	local DBID = ReadRoleValue( Player, EM_RoleValue_DBID ) 
	if Luafunc_Player_Alive( Player,DBID,250 ) == true and ReadRoleValue( Player, EM_RoleValue_IsDead) ~= 1 and CheckFlag( Player , 541299 ) == true then
		Say( GreenOtto , "[SC_421159_6]" ) --/*�O���F�I�O���F�I�ڻ��N�O�F�C
		PlayMotion( GreenOtto ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	end
	sleep(50)
	WriteRoleValue( GreenOtto , UnKnowValue , 0 )
	MoveToFlagEnabled( GreenOtto , true )
	DisableQuest( GreenOtto , false )
end

function LuaS_421159_dead()

	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckAcceptQuest( TargetID() , 421159 ) == true then 
		SetFlag( TargetID() , 541299, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_421159_Reset()
	LuaFunc_Obj_Suicide(10)
end