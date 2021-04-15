-----------------------------------------------------------------------------------------------------------
--���`��
-----------------------------------------------------------------------------------------------------------
function LuaI_110484()

	SetPlot( OwnerID(),"range","LuaI_110484_Detail",75 );

end
-----------------------------------------------------------------------------------------------------------
function LuaI_110484_Detail()

	SetFlag( OwnerID() , 541313 , 1)		--�}��ù����Ȫ̤���

	if CheckFlag( OwnerID()  , 540794 ) == false then --�ˬd�O�_���Y�ΡG�u�s��_�I�̡v
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("ST_NEWHAND"));
			DialogSelectStr( OwnerID() , GetString("SO_NEWHANDYES") );
			DialogSelectStr( OwnerID() , GetString("SO_NEWHANDNO") );
	--		DialogSelectStr( OwnerID() , "Yes" );
	--		DialogSelectStr( OwnerID() , "NO");
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF


			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
				--��ưe�X�����D
				return;
			end
			local SelectID = Hsiang_GetDialogResoult( OwnerID() );
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
	--		SAY(TargetID(),SelectID);
			if SelectID == 0  then

				if  ChangeZone( OwnerID() , 100, -1,3230, 7, 3704, 272) == true then
	--			--	ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_NEWADV") , C_SYSTEM )	--�e�������T���G���o�Y�ΡG�u�s��_�I�̡v
	--			--	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_NEWADV") , 0 )		--�t�ΰT���G���o�Y�ΡG�u�s��_�I�̡v
	--				GiveBodyItem ( OwnerID() , 530042 , 1 )	-- �Y�ΡG�u�s��_�I�̡v
	--				SAY(TargetID(),"give 540794");
	--				SetFlag( OwnerID()  , 540794 , 1 );
	--				SAY(TargetID(),"give 540851");

					----�����i�J��m
					local Obj = Role:new( OwnerID() );
					local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
					if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then
						local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
						if( Ret == false ) then
							ScriptMessage( OwnerID(), OwnerID(), 0, "Save Location Error" , 0 )	
							return;
						end
					elseif ZoneID> 100 or Obj:RoomID() ~= 0 then
						local Ret = SaveReturnPos_ZoneDef( OwnerID() )
						if( Ret == false ) then
							ScriptMessage( OwnerID(), OwnerID(), 0, "Save Location Error" , 0 )	
							return;
						end
					else
							ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
							return;
					end
					-----

					SetFlag( OwnerID()  , 540851 , 1 );
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]" , 1 )
				end
				return
			else
				Tell ( OwnerID() , TargetID(),  GetString("ST_110484_6") );	--���ӤF�ڡK�s��_�I�̴N�O�o��X�z.........�C
				--SAY( TargetID() ,  GetString("ST_110484_6") );
				GiveBodyItem ( OwnerID() , 530042 , 1 )	-- �Y�ΡG�u�s��_�I�̡v
			--	ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_NEWADV") , C_SYSTEM )	--�e�������T���G���o�Y�ΡG�u�s��_�I�̡v
			--	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_NEWADV") , 0 )		--�t�ΰT���G���o�Y�ΡG�u�s��_�I�̡v
				SetFlag( OwnerID()  , 540794 , 1 );
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	else
		if CheckAcceptQuest( OwnerID(), 420660) == true then
			Tell ( OwnerID() ,  TargetID(),  GetString("ST_110484_5") );	--�֩��}���E���h�a�I
			--SAY(TargetID(),  GetString("ST_110484_5") );
		elseif CheckcompleteQuest( OwnerID(),420660) ==true then
		else
			Tell ( OwnerID() , TargetID(),  GetString("ST_110484_6") );	--���ӤF�ڡK�s��_�I�̴N�O�o��X�z.........�C
		end
	end
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110484()

	LoadQuestOption( OwnerID() );  --���J���ȼҪO

	if CheckAcceptQuest( OwnerID(), 420700 ) == true then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_NEWER"),   "LuaS_110484_Detail_NEWer",    0 );	--�W�[�@�ӿﶵ�A�s��_�I��
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_ES"),             "LuaS_110484_Detail_EastSouth",0 );	--�W�[�@�ӿﶵ�A�F�n��
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_WALK"),      "LuaS_110484_Detail_Walk",       0 );	--�W�[�@�ӿﶵ�A����
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_MISSION"), "LuaS_110484_Detail_Mission", 0 );	--�W�[�@�ӿﶵ�A����
	elseif CheckcompleteQuest( OwnerID(), 420700) ==true then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_NEWER"),   "LuaS_110484_Detail_NEWer",    0 );	--�W�[�@�ӿﶵ�A�s��_�I��
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_ES"),             "LuaS_110484_Detail_EastSouth",0 );	--�W�[�@�ӿﶵ�A�F�n��
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_WALK"),      "LuaS_110484_Detail_Walk",       0 );	--�W�[�@�ӿﶵ�A����
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110484_MISSION"), "LuaS_110484_Detail_Mission", 0 );	--�W�[�@�ӿﶵ�A����
	end

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110484_Detail_NEWer()

	SetSpeakDetail( OwnerID(), GetString("ST_110484_1") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110484",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����

end
-----------------------------------------------------------------------------------------------------------

function LuaS_110484_Detail_EastSouth()

	SetSpeakDetail( OwnerID(), GetString("ST_110484_2") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110484",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110484_Detail_Walk()

	SetSpeakDetail( OwnerID(), GetString("ST_110484_3") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110484",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110484_Detail_Mission()

	SetSpeakDetail( OwnerID(), GetString("ST_110484_4") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110484",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110484_Exit()

	CloseSpeak( OwnerID() );	--������ܵ���

end
-----------------------------------------------------------------------------------------------------------


