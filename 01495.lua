function LuaS_113352_0()
	if CheckAcceptQuest( OwnerID() , 422544 ) == false and CheckCompleteQuest( OwnerID() , 422544 ) == false then
		SetSpeakDetail( OwnerID(),  "[SC_113352_0]"  ) --��I�O��ߡA�A�ݨ쪺�O�کҾ��a���]���A�ڲ{�b���b�t�@�Ӧa��z�L����A��͡C
	else
		LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_113352_1]" ,"LuaS_113352_1", 0 ) --�ڭn�i�J�ר��h������
		if CountBodyItem( OwnerID() , 205718 ) > 0 then
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_113352_2]" ,"LuaS_113352_2", 0 ) --�ڱo��F[205718]�A�аݳo������@�ΡH
		end
	end
end

function LuaS_113352_2()
	SetSpeakDetail( OwnerID(),  "[SC_113352_3]"  ) --[205718]�O�ڹҤ��������]�����]�O�ӷ�......
end

function LuaS_113352_1()
	CloseSpeak( OwnerID() )
	if ChangeZone(OwnerID() ,208 , 0, 780 , 118 , -1747 ,  270 ) == true then
		if CheckAcceptQuest( OwnerID() , 422544 ) == true then
			SetFlag( OwnerID() , 542949 , 1 )
		end
		local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),208,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
	end
end

function LuaI_113350_0()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
end

function LuaI_Zone208_Out()
	SetPlot( OwnerID() , "range" , "Lua_Zone208_OutPoint" , 50 )
end

function Lua_Zone208_OutPoint()
	if ChangeZone(OwnerID(),  2 , 0, 2717 , 53 , -979 , 320 ) == true then

	else
		ScriptMessage(OwnerID(),  OwnerID(), 1 ,"[WARRING_ZONE_NOT_OPEN]", 1 ) 
	end
end

function Lua_205719_RuneBag(Kind,Lv,Range) 
--Kind �O�Ť��ݩʺ����A�u���J����ơA�̤j��11�A�H�����ǥѤW��U
--Lv ���Ť��H���o�쪺�̧C����
--Range ���Ť��H�����d��Aex�GLv 3  Range 2   �N�O 3��4
	local MDEF = 520221
	local DEF = 520201
	local MATK = 520181
	local ATK = 520161
	local MP = 520141
	local HP = 520121
	local AGI = 520101
	local MND = 520081
	local INT = 520061
	local STA = 520041
	local STR = 520021

	local Rune = {
			{MDEF,MDEF+1,MDEF+2,MDEF+3,MDEF+4},
			{DEF,DEF+1,DEF+2,DEF+3,DEF+4},
			{MATK,MATK+1,MATK+2,MATK+3,MATK+4},
			{ATK,ATK+1,ATK+2,ATK+3,ATK+4},
			{MP,MP+1,MP+2,MP+3,MP+4},
			{HP,HP+1,HP+2,HP+3,HP+4},
			{AGI,AGI+1,AGI+2,AGI+3,AGI+4},
			{MND,MND+1,MND+2,MND+3,MND+4},
			{INT,INT+1,INT+2,INT+3,INT+4},
			{STA,STA+1,STA+2,STA+3,STA+4},
			{STR,STR+1,STR+2,STR+3,STR+4}
			}

	return	GiveBodyItem(OwnerID(),Rune[DW_Rand(Kind)][DW_Rand(Range)+Lv-1],1)
end

function LuaI_205719_Use()
	local Result = DW_Rand(100)
	local Check = "No"
	local NeedSpace = 2

	if EmptyPacketCount( OwnerID() ) >= NeedSpace and QueuePacketCount( OwnerID() ) == 0 then
		if Lua_205719_RuneBag(11,4,1) then
			Check = "Yes"
		end

		if Result > 99 then
			if Lua_205719_RuneBag(11,5,1) then
				Check = "Yes"	
			end
		elseif Result > 80 then
			if Lua_205719_RuneBag(11,1,3) then
				Check = "Yes"	
			end
		else

			if DW_Rand(2) == 1 then
				if GiveBodyItem(OwnerID(), 200820 ,10)  then
					Check = "Yes"
				end
			else
				if GiveBodyItem(OwnerID(), 201061 ,10)  then
					Check = "Yes"	
				end
			end
		end

		if Check == "Yes" then
			UseItemDestroy()
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 0, GetString("MSG_SONGSONGBAGWARN"), 0 ); 		
	end

end