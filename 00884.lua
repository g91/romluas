function LuaI_TheThiefKing_DoorEnter()--�J�f���@��
	SetPlot( OwnerID() , "touch" , "LuaI_TheThiefKing_DoorEnter_1" , 50 )
end

function LuaI_TheThiefKing_DoorExit()--�X�f���@��
--	Hide( OwnerID() )
end

function LuaI_TheThiefKing_DoorEnter_1()
	if CheckFlag( OwnerID() , 542127) == true or CheckCompleteQuest( OwnerID() , 421465 ) == true then
		ScriptMessage( TargetID(), 0, 0,GetString("SC_111368_16"), 1 ) 
		SetPlot( TargetID() , "touch" , "" , 0 )
		Hide(TargetID())
	else
		ScriptMessage( TargetID(), 0, 0,GetString("SC_111368_0"), 1 ) --�ݨӦ��G�ݭn�����Y�ӱ���~��}�ҳo�����C
	end
end

function LuaS_TheThiefKing_Exit() --�ǰe��~�����@��
	SetPlot( OwnerID() , "Range" , "LuaS_ZONE251_OUT" , 50 )
end

function LuaS_ZONE251_OUT()
	ChangeZone( OwnerID() , 10 , 0 , -38264, -129, -3176, 270 );
end

function LuaI_ZONE251_Enter() --�ǰe��̭����@��
	SetPlot( OwnerID() , "Range" , "LuaI_ZONE251_Enter_2" , 50 )
end

function LuaI_ZONE251_Enter_2()
	if ChangeZone( OwnerID() , 251 , -1 , 1429 , 41, 1068, 270 )then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),251,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_111463_0() --�_�c�W���@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111374 , 250 , 0)
	local Exit = LuaFunc_SearchNPCbyOrgID(  OwnerID()  , 111375 , 250 , 0)
	Hide( Exit )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , Door )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 2 , Exit )
	SetPlot(OwnerID(),"Range" , "LuaI_TheThiefKing_Treasure_1" , 50 )
end
--�s�X�`�إD���H
function LuaI_TheThiefKing_Treasure_1()
	ScriptMessage( TargetID(), 0, 0,GetString("SC_111368_17"), 1 ) 
	SetPlot(TargetID(),"Range" , "" , 0 )
	Hide( TargetID() )
	BeginPlot(TargetID(), "LuaI_TheThiefKing_Treasure_2" , 0 )
end

function LuaI_TheThiefKing_Treasure_2()
	local ThiefKing = 111368
	local Flag = 780095
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local ThiefKing = CreateObjByFlag( ThiefKing, Flag , 0 , 1 );
	local Party = LuaFunc_PartyData(TargetID())
	local Game
	local State
	local Torch = {}
	local Door = {}

	Torch[1] = CreateObjByFlag( 111369, Flag , 1 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 1 , Torch[1] )
	Torch[2] = CreateObjByFlag( 111370, Flag , 2 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 2 , Torch[2] )
	Torch[3] = CreateObjByFlag( 111371, Flag , 3 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 3 , Torch[3] )
	Torch[4] = CreateObjByFlag( 111372, Flag , 4 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 4 , Torch[4] )
	Torch[5] = CreateObjByFlag( 111373, Flag , 5 , 1 );
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 5 , Torch[5] )

	Door["IN"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 6 , Door["IN"] )
	Door["Out"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	WriteRoleValue( ThiefKing , EM_RoleValue_Register + 7 , Door["Out"] )

	WriteRoleValue( ThiefKing  , EM_RoleValue_Register + 9 , 3 )
	AddToPartition( ThiefKing , RoomID )

	while 1 do --�ˬd�d�򤺨S���۪����a�N�}��
		local Player = SearchRangePlayer (Thiefking, 250 )
		Game = "OVER"
		for i = 0 , table.getn(Player) , 1 do --�����a�b�d�򤺬��۴NOK

			if Player[i] == -1 then
				break
			end

			if ReadRoleValue( Player[i] , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Player[i], EM_RoleValue_IsPlayer ) == 1 then
				if CheckID(Player[i]) == true and ReadRoleValue( Player[i], EM_RoleValue_IsDead ) == 0 then
					Game = "OK"
					WriteRoleValue( ThiefKing  , EM_RoleValue_Register + 8 , Player[i] )
				end
			end
		end
		if Game == "OVER" then
			Hide(Door["IN"])
		end
		sleep(10)
	end

end

--�`�إD���H����ܤ��e
function LuaS_TheThiefKing_0()

	local State = ReadRoleValue( TargetID() , EM_RoleValue_Register + 9 )
	if CheckFlag( OwnerID() , 540505 ) == true or CheckCompleteQuest( OwnerID() , 421080 ) == true then
		if State  >= 9 then 
			SetSpeakDetail( OwnerID(), GetString("SC_111368_1") ); --�p�G�Q�n��h���_�áA�N�h�@�ɤW�M��a�I
		else
			if State == 3 then 
				SetSpeakDetail( OwnerID(), GetString("SC_111368_2") ); --�w��Ө�ڪ��_�îw�A�s��̡F�ڬO�A�̪����Ĵ��_�S�A�A�J�M����o��ڪ��_�͡A�ڴN���\�A��o�ڪ��_�áA���A�����q�L�ڪ��շҡC
			elseif State == 5  then 
				SetSpeakDetail( OwnerID(), GetString("SC_111368_3") );--�A�ǳƦn�~�򱵨��D�ԤF�ܡH
			elseif State  == 7  then 
				SetSpeakDetail( OwnerID(), GetString("SC_111368_4") );--�o�O�̫᪺�D�ԤF�A�ڥi�O�ܴ��ݪ��C
			else
				SetSpeakDetail( OwnerID(), State)
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111368_5") , "LuaS_TheThiefKing_1", 0 ); --�}�l�a�I
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111368_6")); --�w��Ө�ڪ��_�îw�A�s��̡F�������֦��ڪ������_�͡A�~�����o�_�ê����C
	end
end

function LuaS_TheThiefKing_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_TheThiefKing_Play" , 0 )
end