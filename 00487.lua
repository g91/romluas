---------------�F�l���ШD�]�b�������¤W����l�@���P�_���a�O�_�i�J�ӽd��^-------------------------------------------------------
function LuaI_420604_range()
	SetPlot(OwnerID(),"Range","LuaS_420604_flag",180);
end
---------------�Y�O���a�i�J�d��h����Ӭq--------------------------------------
function LuaS_420604_flag()
	if(CheckAcceptQuest(OwnerID(), 420604) == true )then --�令�ˬd���ȡA�קK�����Ȫ��H�]�i����X��
		if(CheckFlag(OwnerID(), 540798) == false)then
			SetFlag(OwnerID(), 540798, 1);
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420604_0"), 0 ); --���ӰT�������a���D�L�լd����
		end
	end
end
-----------------�I�����Q���Ť��Ĳ�o--------------------------------
function LuaS_420605_range()
	local m=LuaFunc_SearchNPCbyOrgID( OwnerID(), 100075,30, 1);
	if m[0]== -1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420605_0"), 0 ); --/*�A�����b���u�@�̪���ϥΥ��I�C
		return false
	else
-----------�Y�O��������񦳦u�@�̰���Ӭq-----------------------
		if CountBodyItem( OwnerID(), 201276 ) >0 then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420605_1"), 0 ); --/*�h��N�ǦA���i�ϥ֯ȡI
			return false
		end
	end
end

function LuaS_420605_Effect()
		if CountBodyItem( OwnerID(), 201276 ) >0 then
			DelBodyItem( OwnerID(), 201276,1);
			GiveBodyItem( OwnerID(), 201277, 1 );
		end
end
----------------------------------------------------------------------------------------
function LuaQ_420605_Complete()
	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( OwnerID() , False)
	LuaFunc_MoveToFlag( OwnerID(), 780016 , 1 ,0 )
	local tar = LuaFunc_SearchNPCbyOrgID(OwnerID(),110217,60,0);
	PlayMotion( tar , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	SAY( tar , GetString("SAY_420605_1") )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	SAY( OwnerID() , GetString("SAY_420605_2"))
	sleep(30)
	PlayMotion( tar , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	SAY( tar , GetString("SAY_420605_3"))
	sleep(10)
	SAY( tar , GetString("SAY_420605_6"))
	sleep(20)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL )
	SAY( OwnerID() , GetString("SAY_420605_4"))
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	SAY( OwnerID() , GetString("SAY_420605_5"))
	sleep( 30 )
	LuaFunc_MoveToFlag( OwnerID(), 780016 , 0 ,0 )
	MoveToFlagEnabled( OwnerID() , True)
	DisableQuest( OwnerID() , false )
end