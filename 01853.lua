 --=====================================================--
 -- �X���H�� 115482 �ĤT���k(�t����) 115424�w�S�Jù(�ݩR��) 115423 �w�S�Jù(�t����) 
 -- Lua_423269_2 �B�z�̫�@�q�@��
 -- ���ʺX�� FlagGroup = 780595 �w�]�Ȩ���s��1 
 -- ks_MoveToFlag( Obj, FlagGroup, FlagNum, Range ) 
 --             �n���ʨ���                ���ʪ��üƽd�� 
 --=====================================================--
function Lua_423269()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,423269 ) == true then	
		AddSpeakOption( OwnerID(), TargetID(), "[SC_422509_2]", "Lua_423269_do", 0 ) --�ڸӫ�򰵡H	
	end
end

function Lua_423269_test()
	local princess = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115482, 200, 0) --�ĤT���k
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)
	CancelBuff_NoEvent( OwnerID(), 506710 ) --�����@��
	CancelBuff_NoEvent( OwnerID(), 503977 ) --�Ѱ��w��
	CancelBuff_NoEvent( princess, 506710 ) --�����@��
	CancelBuff_NoEvent( OwnerID(), 506112 )
	WriteRoleValue( ant_Idle, EM_RoleValue_Register, 0 )
	local reg = ReadRoleValue( ant_Idle, EM_RoleValue_Register )
	WriteRoleValue( princess, EM_RoleValue_Register, 0 )
	Say( OwnerID(), ReadRoleValue( ant_Idle, EM_RoleValue_Register ) )
end

function Lua_423269_do()
	local player = OwnerID() --���a����
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)	
	local ant_Act = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115423, 200, 0)	
	if ReadRoleValue( ant_Idle, EM_RoleValue_Register ) == 0 then
		AddBuff( player, 506112, 1, 300 )
		BeginPlot( ant_Act, "Lua_423269_0", 0 ) 		 
		WriteRoleValue( ant_Idle, EM_RoleValue_Register, 1 )
	else
		SetSpeakDetail( player, "[SC_423269_0]" )--���ݦo�P�D���ɶî𮧵y�L���R...
	end
end

function Lua_423269_0()
	local player = TargetID() --���a
	local ant_Act = OwnerID() --�w�S�Jù����
	local princess = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115482, 200, 0) --�ĤT���k	
	DisableQuest(princess,true)
	WriteRoleValue( princess, EM_RoleValue_Register, 0 )
	WriteRoleValue( ant_Act, EM_RoleValue_IsWalk, 1 )
	CloseSpeak( player )
	
	Sleep(20)
	PlayMotion( ant_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( ant_Act, "[SC_423269_1]" )--��I�H���A�̷ӫ��ܦ�ʡA�A�|�@�v�L�ˡC
	Sleep(20)
	CastSpell( player, player, 495597 )--���a�Q�w��(503977)
	SetPosByFlag( player, 780608, 20 )
	Sleep(10)
	CallPlot( ant_Act, "Lua_423269_1", player ) --�}�l�I�k
	Say( ant_Act, "[SC_423269_2]" ) --�ƥh�����H�A���E�F��N�ӡA�O���P�۵M�P�B���ߡC
	Sleep(30)
	Say( ant_Act, "[SC_423269_3]" ) --�ҨD�q�`�A�����N�׶��ɶî𮧦��ΡA�e�����D�N���S�A�v�T�p���ëD���M�O�d�о�C	
end

function Lua_423269_1( player )
	local ant_Act = OwnerID() --�w�S�Jù����	
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)
	local princess = LuaFunc_SearchNPCbyOrgID( ant_Act, 115482, 200, 0) --�ĤT���k
	local fireGroup = {}
	local time = 15
	AddBuff( ant_Act, 502662, 1, 300 ) --��o��	
	PlayMotionEX( ant_Act,ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP ) --�I�k�ʧ@
	Sleep(20)
	CastSpell( ant_Act, princess, 495598 )
	sleep(30)
	BeginPlot( princess, "Lua_423269_princess", 0 )	
	Sleep(10)
	CancelBuff_NoEvent( ant_Act, 502662 ) --�Ѱ��o��	
	Sleep(20)	
	PlayMotion( ant_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( ant_Act, "[SC_423269_4]" ) --���ɦo�P�D���ɶî𮧵y�L���R�A�ЧA��O�qѺ�`�i�K���P�K���C	
	CancelBuff_NoEvent( player, 503977 ) --�Ѱ��w��
	Sleep(20)
	for i=0, time do
		sleep(10)
		if ReadRoleValue( princess, EM_RoleValue_Register ) == 1 then 
			CallPlot( ant_Act, "Lua_423269_2", player )			
			break
		end
		if i == time/3 then
			Say( ant_Act, "[SC_423269_11]") --���L����A�K�n���ԤU�@���ɾ��C
		elseif i == time then
			fireGroup = LuaFunc_SearchNPCbyOrgID( ant_Act, 115425, 200, 0) --���K�s
			Say( ant_Act, "[SC_423269_10]" ) --�̦n���ɾ��w�L�A���ݯɶî𮧵y�L���R�ɦA���i��C
			for i=0, table.getn( fireGroup )-1 do							
				DelObj( fireGroup[i] )					
			end
			WriteRoleValue( ant_Idle, EM_RoleValue_Register, 0 )
			CancelBuff_NoEvent( player, 506112 )
		end
	end	
end

function Lua_423269_2( player )
	local ant_Act = OwnerID() --�w�S�Jù����	
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)
	local princess = LuaFunc_SearchNPCbyOrgID( ant_Act, 115482, 200, 0) --�ĤT���k	
	local FlagGroup = 780608
	WriteRoleValue( ant_Act, EM_RoleValue_IsWalk, 1 )
	Sleep(40)
	Say( ant_Act, "[SC_423269_5]" ) --�Ȯɥ��p���B�z�A���îڷ����X��d�о�K 
	CancelBuff_NoEvent( princess, 506710 ) --�����@��
	while true do
		ks_MoveToFlag( ant_Act, FlagGroup, 20, 0 ) --�ਭ����
		sleep(10)
		ks_MoveToFlag( ant_Act, FlagGroup, 21, 0 ) 
		sleep(10)
		if DW_CheckDis( ant_Act, FlagGroup, 21, 30 ) == true then
			Say( ant_Act, "[SC_423269_6]" ) --���A�O��Q�����K
			SetFlag( player, 543908, 1 )	--���o��������
			ks_MoveToFlag( ant_Act, FlagGroup, 22, 0 ) 
			sleep(10)
			CancelBuff_NoEvent( player, 506112 )
			LuaFunc_ResetObj( ant_Act )
			WriteRoleValue( ant_Idle, EM_RoleValue_Register, 0 )
			WriteRoleValue( princess, EM_RoleValue_Register, 0 )
			break
		end
	end

end

function Lua_423269_princess()
	Lua_Davis_BornByMultilateral( 115425 , 8 , 15 )
end

function Lua_423269_fire()	
	SetPlot( OwnerID(),"touch", "Lua_423269_fire_d", 30 )
end

function Lua_423269_fire_d()	
	local player = OwnerID() --���a
	local fire = TargetID() --���K����	
	local princess = LuaFunc_SearchNPCbyOrgID( fire, 115482, 200, 0) --�ĤT���k
	WriteRoleValue( princess, EM_RoleValue_Register, 1 )
	CallPlot( fire, "Lua_423269_fire_do", player, fire )	
end

function Lua_423269_fire_do( player, fire )	
	local princess = LuaFunc_SearchNPCbyOrgID( fire, 115482, 200, 0) --�ĤT���k
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( fire, 115424, 200, 0) --�w�S�Jù����				
	local fireGroup = LuaFunc_SearchNPCbyOrgID( fire, 115425, 200, 0) --���K�s
	for i=0, table.getn( fireGroup )-1 do	
		SetModeEx( fireGroup[i], EM_SetModeType_Mark , false )
		SetPlot( fireGroup[i],"touch", "", 0 )
		sleep(2)
		if fireGroup[i] ~= fire then
			DelObj( fireGroup[i] )
		end
	end
	CastSpell( fire, princess, 495601 ) --��·¶ 582769
	Sleep(30)
	DelObj( fire )
end

