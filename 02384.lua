function LuaS_118336_1()
	local Player = OwnerID();
	local NPC = TargetID();
	--reg10 �|���j�w
	--reg9 1:�w�b���W,2:�w�N�w��
	LoadQuestOption(Player);
	--[[
	if CheckAcceptQuest(Player,424250)==true and kg_Reg(NPC,9)==2 then--�@�����}�l
		SetSpeakDetail( Player , "[SC_424250_TALK_WITH]" )--��������o�ǳج����H������......���M�ڭn���^�h......
		AddSpeakOption( Player, NPC, "[SC_424250_CHOICE]" , "LuaS_118336_2",0 )--������ج����H����
	else
		LoadQuestOption(Player);
	end
	]]--
end
--[[
function LuaS_118336_2()--�ŧi�@���}�l
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==2 then--�קK���a�O�d���ȵ��� , �b���W�S���@�����ɭԫ��U�h
		WriteRoleValue(NPC,EM_RoleValue_Register9,3)--�@����w
	end
	CloseSpeak(Player)
end
]]--
function LuaQ_118336_Accept()--���a�����Ȯɰ���,�i�H�ϥ�sleep , ���]�����a�����ȴN�|����, so �קKsleep
	local NPC = OwnerID();
	local Player = TargetID();
	if kg_Reg(NPC,9)==0 then--�T�H��|���X��
		WriteRoleValue( NPC,EM_RoleValue_Register9,2 )--�@���}�l
		CallPlot( NPC, "Lua_118336_Show" , NPC,Player )
	end
end

function Lua_118336_Show( NPC,Player )
	local Actor = Lua_118336_GroupBorn();
	local Bucket = ReadRoleValue( NPC, EM_RoleValue_Register1 );
	for i=1,5 do
		SetDefIdleMotion( Actor[i].Gid, ruFUSION_MIME_IDLE_COMBAT_1H );
	end
	--NPC���ܪ��a
	AdjustFaceDir( NPC,Bucket,0 );
	Yell( NPC,"[SC_424250_TALK07]" , 2 );	--�ѰڡI�L�̤S�ӤF�I
	Sleep(10)
	PlayMotion( NPC ,109 );--���V
	Sleep(30);
	Yell( Actor[3].Gid , "[SC_424250_TALK08]" , 2 );	--�i�c���b�ݤH�I����n�A�̥I�X�N���I
	Sleep(15)
	--���貾��
	local x,y,z;
	for i =1,5 do
		if i<4 then
			x,y,z,_ = kg_GetPosRX( Actor[i].Gid , nil , 25 , 0 );--��C���R���H�e������m
		else
			x,y,z,_ = kg_GetPosRX( Actor[i].Gid , nil , 15 , 0 );--��C���R���H�e������m
		end
		MoveDirect( Actor[i].Gid , x,y,z );
	end
	local PlayerArray = SearchRangePlayer( NPC , 300 );
	for i=0,#PlayerArray do
		if CheckAcceptQuest(PlayerArray[i],424250)==true then
			ScriptMessage( NPC , PlayerArray[i] , 0 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffffffff" )
			ScriptMessage( NPC , PlayerArray[i] , 2 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffff0000" )
		end
	end
	Sleep(10);--���Բ��ʨ�w��
	
	local Step = 0
	local FailTimer = 0
	while 1 do
		if kg_Reg(NPC,9)~=3 then--�ݪ��aĲ�o�@���ƥ�
			Step = math.random( 1,3 );
			PlayMotion( Actor[Step].Gid  , ruFUSION_ACTORSTATE_ATTACK_1H )
			Step = math.random( 4,5 );
			PlayMotion( Actor[Step].Gid  , ruFUSION_ACTORSTATE_ATTACK_1H )
		else
			break
		end
		if FailTimer>=30 then
			PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i=0,#PlayerArray do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 0 , "[SC_424250_HAVE_TO_QUIT]", "0xffffffff" )
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 2 , "[SC_424250_HAVE_TO_QUIT]", "0xffff0000" )
				end
			end
			WriteRoleValue(NPC,EM_RoleValue_Register9,4)
			CallPlot(NPC,"Lua_118336_ShowEnd",NPC)
			return
		elseif FailTimer==20 then
			PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i=0,#PlayerArray do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 0 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffffffff" )
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 2 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffff0000" )
				end
			end
		end
		Sleep(10)
		FailTimer = FailTimer +1;
	end
	--Sleep(50)
	Say( Actor[1].Gid,"[SC_424250_TALK01]" )
	Sleep(25)
	Say( Actor[4].Gid,"[SC_424250_TALK02]" )
	Sleep(25)
	Say( Actor[5].Gid,"[SC_424250_TALK03]" )
	Sleep(15)
	DebugMsg( 0,0,"balabalabala.." )
	--�]�wABC�i���
	for i =1,5 do
		Hide( Actor[i].Gid )
		SetModeEx( Actor[i].Gid  , EM_SetModeType_Strikback, true) ---����(�_)
		SetModeEx( Actor[i].Gid  , EM_SetModeType_Fight, true) ---�i���(�_)
		SetModeEx( Actor[i].Gid  , EM_SetModeType_Searchenemy, true)	---����(�_)
		Show( Actor[i].Gid ,0 )
	end
	kg_Reg(NPC,9,4)
	for i=1,3 do
		for j = 4,5 do
			SysCastSpellLv( Actor[i].Gid,Actor[j].Gid,496946,0 )
			SysCastSpellLv( Actor[j].Gid,Actor[i].Gid,496946,0 )
		end
	end
	DebugMsg(0,0,"RealFight!!")
	--�C���ˬd�԰�
	local PlayerCheck = 0;
	local PlayersInHate = {};
	while 1 do
		Sleep(10)
		if ReadRoleValue(NPC,EM_RoleValue_Register9)==5 or ReadRoleValue(NPC,EM_RoleValue_Register9)==0 then
			break
		end
		for i=1,3 do
			PlayersInHate = KS_GetHateList( Actor[i].Gid , 3 )
			if table.getn(PlayersInHate)==0 then
				PlayerCheck = PlayerCheck+1
			else
				PlayerCheck=0
			end
		end
		DebugMsg(0,0,"PlayerCheck="..PlayerCheck)
		if PlayerCheck>=105 then
			local PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i in pairs(PlayerArray) do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Bucket , PlayerArray[i] , 0 , "[SC_424250_HAVE_TO_QUIT]", "0xffffffff" )
					ScriptMessage( Bucket , PlayerArray[i] , 2 , "[SC_424250_HAVE_TO_QUIT]", "0xffff0000" )
				end
			end
			WriteRoleValue(NPC,EM_RoleValue_Register9,4)
			CallPlot(NPC,"Lua_118336_ShowEnd",NPC)
			break
		elseif PlayerCheck==90 then
			local PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i in pairs(PlayerArray) do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Bucket , PlayerArray[i] , 0 , "[SC_424250_HAVE_TO_FIGHT]", "0xffffffff" )
					ScriptMessage( Bucket , PlayerArray[i] , 2 , "[SC_424250_HAVE_TO_FIGHT]", "0xffff0000" )
				end
			end
		end
	end
end

function Lua_118336_ShowEnd( NPC , mode )--mode����:���ê�30%��qĲ�o
	DebugMsg(0,0,"ShowEnd Start")
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==4 then
		WriteRoleValue( NPC,EM_RoleValue_Register9 , 5)
		local PlayersInHate = {}
		local tempPlayerInHate = {}
		if mode==1 then
			--���ê̦��`
			DebugMsg(0,0,"Def Event")
			local Bucket = kg_Reg( NPC,1 )
			local PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i=0,#PlayerArray do
			if CheckAcceptQuest(PlayerArray[i],424250)==true then
				ScriptMessage( Bucket , PlayerArray[i] , 0 , "[SC_424250_DWARF_BEEN_KILLED]", "0xffffffff" )
				ScriptMessage( Bucket , PlayerArray[i] , 2 , "[SC_424250_DWARF_BEEN_KILLED]", "0xffff0000" )
			end
			Sleep(10)
		end
		elseif mode == 2 then
			--�I����30%��q�ƥ�
			DebugMsg(0,0,"Atker Event")
			--local Find = 0
			for i=1,3 do
				tempPlayerInHate = KS_GetHateList( Zone20_kg_118336_Actors[i].Gid , 3 )
				for j in pairs(tempPlayerInHate) do
					table.insert(PlayersInHate,tempPlayerInHate[j])
				end
			end
			--�M����
			for i=1,5 do
				ClearHateList( Zone20_kg_118336_Actors[i].Gid , -1 )
				kg_ActorInit( Zone20_kg_118336_Actors[i].Gid )
				SetStopAttack( Zone20_kg_118336_Actors[i].Gid  )
				WriteRoleValue(Zone20_kg_118336_Actors[i].Gid,EM_RoleValue_IsWalk,0)
				Hide( Zone20_kg_118336_Actors[i].Gid )
				Show( Zone20_kg_118336_Actors[i].Gid , 0 )
				if i<4 then
					LockHP( Zone20_kg_118336_Actors[i].Gid  ,0,"" )
				end
			end
			DebugMsg(0,0,"ClearHateList..done..")
			--�t�h����
			Say( Zone20_kg_118336_Actors[2].Gid,"[SC_424250_TALK04]" );--�b�ݤH������ܱj�I�M�h�I�M�h�I
			Sleep(20)
			local RefPos = kg_GetPosTable( 780953 ,0 );--��@���X�Ц�m�N�n
			local x,y,z
			local Angle = -15
			for i=1,3 do
				x,y,z,_ = kg_GetPosRX(RefPos,nil,200,0,Angle);
				Move( Zone20_kg_118336_Actors[i].Gid,x,y,z );
				Angle = Angle+15;
			end
			Sleep(10);
			AdjustFaceDir( Zone20_kg_118336_Actors[4].Gid , Zone20_kg_118336_Actors[2].Gid ,0 )
			AdjustFaceDir( Zone20_kg_118336_Actors[5].Gid , Zone20_kg_118336_Actors[2].Gid ,0 )
			Say( Zone20_kg_118336_Actors[4].Gid , "[SC_424250_TALK05]" );--����Y�I�O�Q�]�I
			Sleep(15);
			Say( Zone20_kg_118336_Actors[5].Gid , "[SC_424250_TALK06]" );--�i�c�I
			Sleep(50);
			--�������a���y
			for i in pairs(PlayersInHate) do
				if CheckFlag( PlayersInHate[i], 545078 )~=true then
					SetFlag( PlayersInHate[i], 545078 ,1 )
				end
			end
		else
			--��L�����`
			DebugMsg(0,0,"Other Event")
		end
		for i=1,5 do
			if CheckID( Zone20_kg_118336_Actors[i].Gid )==true then
				DelObj(Zone20_kg_118336_Actors[i].Gid)
			end
			Zone20_kg_118336_Actors[i].Gid=0
		end
		SetDir( NPC , ReadRoleValue(NPC,EM_RoleValue_Register2) );
		kg_Reg(NPC,9,0)
		--Say(NPC,"Show End")
		Lua_118336_GroupBorn(1)
	end
end

function Lua_118336_Born()--�ϸ`F�X�ͼ@��,���ͨⰦ�u�ƧL�@��
	local NPC = OwnerID()
	WriteRoleValue( NPC , EM_RoleValue_Register2 , ReadRoleValue( NPC, EM_RoleValue_Dir ) );--�s����l��V
	Zone20_kg_118336_Actors = {	NPC=NPC;
					{Orgid = 105752,Gid=0},	--�ج����ԤhA
					{Orgid = 105754,Gid=0},	--�ج����ԤhC--���q�\����
					{Orgid = 105753,Gid=0},	--�ج����ԤhB
					{Orgid = 105504,Gid=0},	--D
					{Orgid = 105750,Gid=0}	--E
					};
	local Bucket = kg_Reg(NPC,1);
	if CheckID(Bucket)==true and ReadRoleValue(Bucket,EM_RoleValue_OrgID)==117201 then
		DelObj(Bucket);
	end
	Bucket = kg_GetPosRX( {780953,0}, 117201 );
	kg_Reg(NPC,1,Bucket)
	kg_InvisibleObjInit( Bucket )
	AddToPartition( Bucket,0 )
	SetPlot( Bucket,"range","Lua_118336_EnterBattleEvent",70 );
	Lua_118336_GroupBorn(1)
end

function Lua_118336_EnterBattleEvent()
	local Player = OwnerID();
	local NPC = Zone20_kg_118336_Actors.NPC;
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==2 and CheckAcceptQuest(Player,424250)==true then--
		--Say( Player, "BattleEvent Start!!" );
		WriteRoleValue(NPC,EM_RoleValue_Register9,3)--�@����w
	end
end

function Lua_118336_GroupBorn( mode )--���ͪ�t�s��,mode:�u���͸G�H
	local RefPos = kg_GetPosTable( 780953 ,0 );--��@���X�Ц�m�N�n
	if mode ~=nil then
		Zone20_kg_118336_Actors[4].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[4].Orgid  , 25, 0 , 90 , -3 );
		kg_ActorInit( Zone20_kg_118336_Actors[4].Gid )
		WriteRoleValue( Zone20_kg_118336_Actors[4].Gid , EM_RoleValue_IsWalk,0 );
		AddToPartition( Zone20_kg_118336_Actors[4].Gid , 0 )
		AddBuff(Zone20_kg_118336_Actors[4].Gid,508887,0,-1)
		Zone20_kg_118336_Actors[5].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[5].Orgid  , 25, 0 , -90 , -3 );
		kg_ActorInit( Zone20_kg_118336_Actors[5].Gid )
		WriteRoleValue( Zone20_kg_118336_Actors[5].Gid , EM_RoleValue_IsWalk,0 );
		AddToPartition( Zone20_kg_118336_Actors[5].Gid , 0 )
		AddBuff(Zone20_kg_118336_Actors[5].Gid,508887,0,-1)
		--�]�w���`�@�� , ���`�ɭ��m�Ҧ���t
		SetPlot( Zone20_kg_118336_Actors[4].Gid , "dead" , "Lua_118336_DefGroupDead" , 0  )
		SetPlot( Zone20_kg_118336_Actors[5].Gid , "dead" , "Lua_118336_DefGroupDead" , 0  )
		return
	end
	local x,y,z;
	local Angle = -10;
	local Dis=150;
	local Dir = RefPos[4]+180;
	if Dir>360 then Dir = Dir-360; end
	for i=1,3 do
		if i==2 then
			Zone20_kg_118336_Actors[i].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[i].Orgid , Dis+25 , 0 , Angle , Dir  );--���q�b�᭱
		else
			Zone20_kg_118336_Actors[i].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[i].Orgid , Dis , 0 , Angle , Dir  );
		end
		kg_ActorInit( Zone20_kg_118336_Actors[i].Gid );
		WriteRoleValue( Zone20_kg_118336_Actors[i].Gid,EM_RoleValue_IsWalk , 0 );--�]�B
		AddToPartition( Zone20_kg_118336_Actors[i].Gid , 0 );
		AddBuff(Zone20_kg_118336_Actors[i].Gid,508887,0,-1);--���^��
		x,y,z,_ = kg_GetPosRX( Zone20_kg_118336_Actors[i].Gid , nil , 90 , 0 );--��C���R���H�e������m
		MoveDirect( Zone20_kg_118336_Actors[i].Gid , x,y,z );
		LockHP( Zone20_kg_118336_Actors[i].Gid , ReadRoleValue(Zone20_kg_118336_Actors[i].Gid,EM_RoleValue_MaxHP)*0.3 , "Lua_118336_ActorHpEvent" );--30%��q�hĲ�o�ƥ�
		Angle = Angle+10;
	end
	return Zone20_kg_118336_Actors
end

function Lua_118336_DefGroupDead()
	DebugMsg(0,0,"Def Dead!!")
	local Actor = OwnerID()
	if ReadRoleValue(Zone20_kg_118336_Actors.NPC,EM_RoleValue_Register9)==4  and kg_Reg(Actor,10)==0 then
		kg_Reg(Actor,10,1)
		CallPlot( Zone20_kg_118336_Actors.NPC , "Lua_118336_ShowEnd" ,  Zone20_kg_118336_Actors.NPC,1 )
	end
end

function Lua_118336_ActorHpEvent()--30%HP�ƥ�
	DebugMsg(0,0,"Atker Lose")
	local Actor = OwnerID();
	--local Atker = TargetID();
	if kg_Reg(Actor,10)==0 then
		kg_Reg(Actor,10,1)
		if ReadRoleValue(Zone20_kg_118336_Actors.NPC,EM_RoleValue_Register9)==4  then
			CallPlot( Zone20_kg_118336_Actors.NPC , "Lua_118336_ShowEnd" ,  Zone20_kg_118336_Actors.NPC , 2 )
		end
		
	end
end