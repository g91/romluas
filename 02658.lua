function Cl_Z23Quest_Test()
	local OwnerID = OwnerID()
	SetPlot( OwnerID, "touch","Cl_Z23Quest_Test_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function Cl_Z23Quest_Test_touch()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if	BeginCastBarEvent( OwnerID , TargetID , "[SC_REPAIR_0]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "Cl_Z23Quest_Test_touchOk") ~=1	then
		ScriptMessage( OwnerID, OwnerID, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end
function Cl_Z23Quest_Test_touchOk(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		CallPlot( OwnerID() , "Cl_Z23Quest_425269" , TargetID() )
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function Cl_Z23Quest_425269(TargetID)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	if CheckAcceptQuest ( OwnerID , 425269 ) == true then
		if CheckScriptFlag( OwnerID , 546273 ) ~= true then
			if 	Z23_CrystalSeries_JillState~="Exist" then
				Z23_CrystalSeries_JillState="Exist";
				local Npc_X,y,Npc_Z = kg_GetPosRX( TargetID , nil , 60 , 0 , 0 )
				local Npc_Y = ReadRoleValue ( TargetID , EM_RoleValue_Y )
				local NpcID = CreateObj( 120599 , Npc_X, Npc_Y+20 , Npc_Z , 0 , 1 )  ------------�ͥX�]�N�U
				SetModeEx( NpcID , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( NpcID , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( NpcID , EM_SetModeType_Gravity , false) ---�i���(�O)
				--SetModeEx( NpcID , EM_SetModeType_Drag , false) 
				SetIdleMotion( NpcID , ruFUSION_ACTORSTATE_COMBAT_UNARMED )----------------------�����ʧ@ 
				WriteRoleValue ( NpcID , EM_RoleValue_Register1 , TargetID )
				MoveToFlagEnabled( NpcID , false ) ---�t�Τ��ت����|����
				AdjustFaceDir( NpcID , TargetID , 0 )
				AddToPartition( NpcID , RoomID )
				CallPlot( NpcID , "CL_Z23Quest_425269Jill" , 0)
			end
		end
		--�������ȱ����b�p�����䰵
	end
end
function CL_Z23Quest_425269Jill()
	local OwnerID = OwnerID()
	local TargetID = ReadRoleValue( OwnerID , EM_RoleValue_Register1 )
	local String = Cl_Z23Quest425269_String(0)
	Addbuff (  OwnerID , 622370 , 0 , -1 ) ---
	local Play_Table = SearchRangePlayer ( OwnerID , 100 )
	local Play_Num = table.getn( Play_Table )
	local Quest_Table = {}
	local TableMusicID={};--���֪����y
	for i = 0 , Play_Num-1 , 1 do
		if CheckScriptFlag( Play_Table[i] , 546273 ) ~= true and
			CheckAcceptQuest ( Play_Table[i] , 425269 ) == true then
			Addbuff (  Play_Table[i] , 622367 , 0 , -1 ) ---�ߤl�ܤj
			ScriptMessage ( Play_Table[i] , Play_Table[i] , 1 , String[1][1] , C_SYSTEM )
			table.insert( Quest_Table , Play_Table[i] )
			BeginPlot(Play_Table[i],"Cl_Z23Quest425269_MusicBreak",0)
		end
	end
	local Npc_Y = ReadRoleValue ( TargetID , EM_RoleValue_Y )
	local Npc_X,Y,Npc_Z = kg_GetPosRX( TargetID , nil , 20 , 0 , 0 )
	LuaFunc_WaitMoveTo( OwnerID , Npc_X , Npc_Y+5 , Npc_Z )
	local Quest_Num = table.getn( Quest_Table )
	for i = 1 , 3 , 1 do
		say ( OwnerID , String[i+1][1] )
		if i == 2 then
			for X = 1 , Quest_Num , 1 do
				ScriptMessage ( Quest_Table[X] , Quest_Table[X] , 1 , String[3][3] , C_SYSTEM )
				ScriptMessage ( Quest_Table[X] , Quest_Table[X] , 0 , String[3][3] , C_SYSTEM )
			end
		end
		sleep ( String[i+1][2] )
	end
	CastSpelllv ( OwnerID , TargetID , 850144 , 5 )
	sleep ( 25 )
	BeginPlot(TargetID,"Lua_Z23_CrystalSetBroken",0)--�N�����A���}�a
	sleep ( 10 )
	Npc_X,y,Npc_Z = kg_GetPosRX( OwnerID , nil , -20 , 0 , 0 )
	Npc_Y = ReadRoleValue ( TargetID , EM_RoleValue_Y )
	sleep(MoveDirect(OwnerID , Npc_X , Npc_Y+10 , Npc_Z))
	sleep ( 10 )
	Addbuff (  OwnerID , 622368 , 15 , -1 ) ---�ߤl�ܤj622370
	say ( OwnerID , String[5][1] )
	sleep ( String[5][2] )
	SetModeEx( OwnerID , EM_SetModeType_Drag , false) 
	Npc_X,y,Npc_Z = kg_GetPosRX( OwnerID , nil , 130 , 0 , 0 )
	Npc_Y = ReadRoleValue ( TargetID , EM_RoleValue_Y )
	sleep(MoveDirect(OwnerID , Npc_X , Npc_Y-50 , Npc_Z))
	for i = 1 , Quest_Num , 1 do
		if CheckID(Quest_Table[i]) == true then
			if CheckBuff( Quest_Table[i] , 622367 ) ==  true then
				if CheckID( Quest_Table[i] )  == true then
					GiveBodyItem ( Quest_Table[i], 546273 , 1 )
					CancelBuff_NoEvent( Quest_Table[i] , 622367 ) ---�M��BUFF3
				end
			end
		end
	end
	Z23_CrystalSeries_JillState="Un-Exist";
	delobj ( OwnerID )
end
function Cl_Z23Quest425269_MusicBreak()
	local Player=OwnerID();
	local MusicID;
	local QuestBuff=
	Lua_StopBGM(Player);
	MusicID=PlayMusicToPlayer(Player,"music/dungeon/Pesche/ancient_wars_07_MKS_warriors_arise!.mp3",true)
	for Sec=0,52,1 do
		sleep(10)
	end
	if CheckBuff(Player,622367)==true then
		for Sec=0,52,1 do
			if CheckBuff(Player,622367)==false then
				break;
			end
			sleep(10)
		end
	end
	StopSound(Player,MusicID);
	Lua_PlayBGM(Player);
end
function Cl_Z23Quest425269_reset()
	Z23_CrystalSeries_JillState="Un-Exist";
end
function Cl_Z23Quest425269_String(Str)
	local String = {}
	String[1] = {"[SC_Z23QUEST425269_01]", 20 }  --�t�Φr��[�}�ĥ��x�~�X�{�F�@�Ӽ��x�����v�I]
	String[2] = {"[SC_Z23QUEST425269_02]",25 }  --�N��:�A..�I���O�A�I�H
	String[3] = {"......",30,"[SC_Z23QUEST425269_03]"}  --�N��G......(��ܵ����T��:�N�ण�o�@�y�A��K���Y�A���G�A�Q�Ǥ���)
	String[4] = {"[SC_Z23QUEST425269_04]", 20 }  --�N��:�A���}�I�ڤ��Q�P�A�԰��I
	String[5] = {"[SC_Z23QUEST425269_05]", 20 }  --�N��:�A���}�I�ڤ��Q�P�A�԰��I---115891
	if Str == nil or str == 0 then
		return String
	elseif Str >= 1 then
		return String[Str]
	end
end

function Cl_testXYZ()
	local OwnerID = OwnerID()
	local X,Y,Z = Cl_Read_OwnerXYZ(OwnerID)
	say( OwnerID , "X="..X)
	say( OwnerID , "Y="..Y)
	say( OwnerID , "Z="..Z)
end

------------------
function Cl_Z23Quest425269_Jill_Client()
	if CheckFlag( 546273 ) == 0 and
		CheckQuest ( 425269 ) == 1 and
		Lua_CheckAllBuff(622367) ==  true then
		return false
	else
		return true
	end
end