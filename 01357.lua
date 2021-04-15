--���_�ѹF ���s�� 112866
function LuaS_112866_0()
	LoadQuestOption(OwnerID())
	if ( CheckCompleteQuest( OwnerID() , 422282 ) == false or CheckCompleteQuest( OwnerID() , 422283 ) == false or CheckCompleteQuest( OwnerID() , 422284 ) == false ) then
		if CountBodyItem( OwnerID() , 204615 ) == 0 then
			local Check = 0
			if ( CheckAcceptQuest( OwnerID() , 422281 ) == true or CheckCompleteQuest( OwnerID() , 422281 ) == true ) then
				if  ( CheckAcceptQuest( OwnerID() , 422282 ) ==true and CountBodyItem( OwnerID() , 204616 ) == 0 ) then
					Check = 1
				end
				if  ( CheckAcceptQuest( OwnerID() , 422283 ) ==true and CountBodyItem( OwnerID() , 204617 ) == 0 ) then
					Check = 1
				end
				if  ( CheckAcceptQuest( OwnerID() , 422284 ) ==true and CountBodyItem( OwnerID() , 204618 ) == 0 ) then
					Check = 1
				end
			end
			if Check == 1 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_112866_0]","LuaS_112866_1",0) --���K���L�e��L�F��
			end
		end
	end
end
function LuaS_112866_1()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() , 204615 ) == 0 then
		GiveBodyItem( OwnerID() , 204615 , 1 )
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		Beginplot( TargetID() , "LuaS_112866_2" , 0 )
	end
end

function LuaS_112866_2()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 1 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_112866_1]" ) --�U�l���٦��@�ǭn���ǥ̪ͭ��F��A�A�i�H�q�F��W�Y�p�ȱ��������A�Ѩ��Ǿǥͪ���m�A�·ЧA�]���D���ڱN�F��e�L�h���L�̧a�I
	sleep(30)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 0 )		
end
--���_�ѹF���U�l
function LuaI_204615_0()
	local Bag = 0
	if CheckAcceptQuest( OwnerID() , 422281 ) == true or CheckCompleteQuest( OwnerID() , 422281 ) == true or CheckAcceptQuest( OwnerID() , 422282 ) ==true or CheckAcceptQuest( OwnerID() , 422283 ) == true or CheckAcceptQuest( OwnerID() , 422284 ) == true then
			if CountBodyItem( OwnerID() , 204616 ) < 1 and CheckCompleteQuest( OwnerID() , 422282 ) == false then
				GiveBodyItem( OwnerID() , 204616, 1 )
				Bag = Bag + 1
			end
			if CountBodyItem( OwnerID() , 204617 ) < 1 and CheckCompleteQuest( OwnerID() , 422283 ) == false then
				GiveBodyItem( OwnerID() ,204617, 1 )
				Bag = Bag + 1
			end
			if CountBodyItem( OwnerID() , 204618 ) < 1 and CheckCompleteQuest( OwnerID() , 422284 ) == false then
				GiveBodyItem( OwnerID() , 204618 , 1 )
				Bag = Bag + 1
			end
			if Bag == 0 then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204615_0]" , 0  ) --�o�ӳU�l���S������F��
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204615_0]" , 0  )
			end
	else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204615_1]" , 0  ) --�o�ӳU�l��A�ӻ��������N�q
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204615_1]" , 0  )
	end
	UseItemDestroy()
end

--���_�ѹF����y
function LuaI_204616_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 422282, 1 ));
	ShowBorder( OwnerID(), 422282, str ,"ScriptBorder_Texture_Paper" )
end
--���_�ѹF����L�d�O
function LuaI_204617_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 422283, 1 ));
	ShowBorder( OwnerID(), 422283, str , "ScriptBorder_Texture_Paper" )
end
--���_�ѹF��ñ�W�e��
function LuaI_204618_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 422284, 1 ));
	ShowBorder( OwnerID(), 422284, str , "ScriptBorder_Texture_Paper" )
end
--�˦۫��� ���Ƚs�� 422286
function LuaQ_422286_Complete()
	DisableQuest( OwnerID() , true)
	local Org = Role:new( OwnerID()  )
	local Pos = {}
	local Dir = Org:Dir()
	local  NewRole
	local Cal

	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Org:X() +(70*math.cos(Cal))
	Pos["Z"] = Org:Z() - (70*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] )
	Pos["X2"] = Org:X() +(30*math.cos(Cal))
	Pos["Z2"] = Org:Z() - (30*math.sin(Cal))
	Pos["Y2"] = GetHeight( Pos["X2"] , Org:Y() , Pos["Z2"] )
	local Dir2 = Dir + 180
	if Dir2 > 360 then
		Dir2 = Dir2 - 360 
	end
	local Teacher = CreateObj ( 112866 , Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir2 , 1)
	DisableQuest( Teacher , true)
	Lua_ObjDontTouch( Teacher  ) 
	AddToPartition( Teacher  , 0 )
	MoveToFlagEnabled( Teacher , false )
	WriteRoleValue( Teacher , EM_RoleValue_IsWalk , 1 )
	sleep(10)
	Move( Teacher  , Pos["X2"] , Pos["Y2"] , Pos["Z2"] )
	AdjustFaceDir( OwnerID(), Teacher, 0 ) 
	sleep( 30 )
	PlayMotion(Teacher  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Teacher , "[SC_422286_0]" )--ť���A�b�ǲߤW�J��~�V�A������H
	sleep( 30 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_422286_1]" )--�u���O���_�ѹF�j�v�I�ڳ��M���o�Ӻa���A��j�v�o���Z�������ܡC
	sleep( 30 )
	PlayMotion(Teacher  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Teacher , "[SC_422286_2]" )--�A�N�@�󥭤Z���Ʊ��L�׸رi�F�A�Ĥl�C�b�X�����Ҹ̾ǲߡA�u�n�A��������D�A�H�ɳ��i�H�ӧ�ڪ��C
	sleep( 30 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_422286_3]" )--�گu���i�H�ܡH�j�v�C
	sleep( 30 )
	PlayMotion( Teacher , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Teacher , "[SC_422286_4]" )--�A��M�i�H�A�Ĥl�C�ǳƦn��A�N������ԧ޽m�߳��ӧa�A���ڹ�ڬݬݧA���ʧ@�A�A�w��A�����I�����A��ĳ�C
	sleep( 30 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_422286_5]" )--�O���A�j�v�C�ڱN�m�ߥΪ��ԧ��@���n�A���W�N��m�߳��h�C
	sleep( 30 )
	Move( Teacher  , Pos["X"] , Pos["Y"] , Pos["Z"] )
	sleep( 20 )
	SetDir( OwnerID(), Dir )
	sleep( 10 )
	DelObj( Teacher )
	DisableQuest( OwnerID() , false)
end