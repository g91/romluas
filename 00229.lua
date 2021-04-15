function LuaS_112763_0() --���M
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_MOUNTH_SHOP_B]" , "LuaS_MOUTH_SHOP_B", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_MOUNTH_SHOP_BB]" , "LuaS_MOUTH_SHOP_BB", 0 ) --/*���ɧ��M
end

function LuaS_112781_0() --�����
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENAC]", "LuaS_112781_1", 0 ) --/*�}�ҩ���
end

function LuaS_112781_1()
	CloseSpeak( OwnerID() )
	MyOpenAC()
end

function LuaS_112778_0() --�H�c
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]", "LuaS_112778_1", 0 ) --/*�}�ҫH�c
end

function LuaS_112778_1()
	CloseSpeak( OwnerID() )
	MyOpenMail()	
end

function LuaI_112793_0()
	SetPlot( OwnerID() , "range" , "LuaI_112793_1" , 100 )
end

function LuaI_112793_1()
	if CheckFlag( OwnerID() , 542557 ) == false then
		SetFlag( OwnerID() , 542557 , 1 )
	end

	if CheckFlag( OwnerID()  , 540794 ) == false then --�ˬd�O�_���Y�ΡG�u�s��_�I�̡v
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("ST_NEWHAND"));
			DialogSelectStr( OwnerID() , GetString("SO_NEWHANDYES") );
			DialogSelectStr( OwnerID() , GetString("SO_NEWHANDNO") );
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
				--��ưe�X�����D
				return;
			end
			local SelectID = Hsiang_GetDialogResoult( OwnerID() );
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

			if SelectID == 0  then
				if  ChangeZone( OwnerID() , 100, -1,3230, 7, 3704, 270) == true then
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
				GiveBodyItem ( OwnerID() , 530042 , 1 )	-- �Y�ΡG�u�s��_�I�̡v
			--	ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_NEWADV") , C_SYSTEM )	--�e�������T���G���o�Y�ΡG�u�s��_�I�̡v
			--	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_NEWADV") , 0 )		--�t�ΰT���G���o�Y�ΡG�u�s��_�I�̡v
				SetFlag( OwnerID()  , 540794 , 1 );
				return
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end
end