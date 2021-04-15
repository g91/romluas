function LuaI_110352()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
	SetPosture( OwnerID(), 8 , ruFUSION_ACTORSTATE_DYING );
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_DEAD )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaI_420329()
	SetPosture( OwnerID(), 8 , ruFUSION_ACTORSTATE_DYING );
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_DEAD ) --���`�ʧ@�A��Y�������e��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "touch" , "LuaQ_420329_CHECK" , 40 )
end

function LuaI_110350() --����n�����a�~��i�H�I�s���A�ҥH����μҪ��g
	SetPlot( OwnerID() , "touch" , "LuaI_110350_GIVE" , 40 )
end

function LuaI_110350_GIVE()
	if CheckAcceptQuest( OwnerID() , 420328 ) or CheckCompleteQuest( OwnerID() , 420328 ) then
		GiveBodyItem( OwnerID() , 200910 , 1 )
		SetIdleMotion( TargetID(),ruFUSION_ACTORSTATE_DEAD ) 
		SetPlot( TargetID() , "touch" , "" , 0 )
		BeginPlot( TargetID() , "LuaI_110350_Check" , 0 )
	end
end

function LuaI_110350_Check() --�ˬd����O�_�w���E�⤣�������A�����ܵ�����Ҧ������Ȫ��H�������Ȫ��X��
	local Member = GetPartyID( TargetID(), -1 )
	local Count = 0
	for i = 1 , Member , 1 do
		Count = Count + CountBodyItem( GetPartyID( TargetID(), Member ) , 200910 )
		if i == Member then
			if Count >= 9 then
				break
			else
				return
			end
		end
	end

	for i = 1 , Member , 1 do
		if CheckAcceptQuest( GetPartyID( TargetID(), Member ) , 420328 ) then
			SetFlag(  GetPartyID( TargetID(), Member ) , 540229 , 1 )
		end
	end
end

function LuaQ_420329_CHECK()
	if CountBodyItem( OwnerID() , 200910 ) == 0 then
		ScriptMessage( TargetID(), OwnerID(), 0, GetString("EM_420329_0"), 0 ); --/*�����n�����������C
	elseif ReadRoleValue( TargetID() , EM_RoleValue_PID) ~= 0 then
		ScriptMessage( TargetID(), OwnerID(), 0, GetString("EM_420329_1"), 0 ); --/*���x�W���U�N�ۤ��������C		
	else
		DelBodyItem( OwnerID() , 200910, 1 )
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 10 )
		SetIdleMotion( TargetID(),ruFUSION_ACTORSTATE_NORMAL )  --���`�ʧ@�A��Y�U�N���e��
		BeginPlot( TargetID() , "LuaQ_420329_Magic" , 0 )
	end
end

function LuaQ_420329_Magic()

	local Count = 0
	local State = {}
	local One = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110352 , 500 )
	local Check = ReadRoleValue( One , EM_RoleValue_PID)
	local Digi = 1
	local Address = 1
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) - 110460
	SAY( OWnerID() , Check )
	Say( OwnerID() , "ID = "..ID ) --Test
	if ID ~= 0 then
		for i = 1 , ID , 1 do
			Digi = Digi*2
			SAY(OwnerID() ,"Digi = " ..Digi)--Test
			Address = Address + Digi
			SAY(OwnerID() ,"Address = "..Address)--Test
		end

	end
	
	Check = Check + Digi
	Say( OwnerID() ,"Check = "..Check )--Test
	if Check ~= Address then
		Check = 77777	
	end

	WriteRoleValue( One , EM_RoleValue_PID , Check )	

	for i = 0 , 8 , 1 do 
		State[i] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110460 + i , 500 ) --�N�Ҧ����x��ID���J�}�C		

		if ReadRoleValue( State[i] , EM_RoleValue_PID ) ~= 0 then--�ˬd���h�֥��x�w�I�U
			Count = Count + 1 
		end
	end
	
	if Count == 9 then
		if Check == 77777 then
			ScriptMessage( OwnerID(), 0, 0, GetString("EM_420329_2"), 0 ); --/*���x�o�X�ǲ����n���C
			for i = 0 , 8 , 1 do --��l�ƥ��x
				BeginPlot( State[i] ,"LuaI_420329" , 0 )
			end

			sleep( 30 )
			ScriptMessage( OwnerID(), 0, 0, GetString("EM_420329_3"), 0 ); --/*�����������G�^���Ӫ��a��F�C
			WriteRoleValue( One , EM_RoleValue_PID , 0 )

			local fire = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110350 , 2000 )
			for i = 0 , 8 , 1 do --��l�Ƥ��V
				SetIdleMotion( fire[i],ruFUSION_ACTORSTATE_NORMAL )
				SetPlot( fire[i] ,"touch" , "LuaI_110350_GIVE" , 40 )
			end
			return
		else
			BeginPlot( One , "LuaQ_420329_Play" , 0 )
		end				
	end

end

function LuaQ_420329_Play() --�������԰��@��
	local State = {}
	local SNPC = {}
	local Monster = {}
	local Pailody = CreateObjByFlag( 110349 , 780038 , 3 , 1 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local timer = 0
	local j = 0
	local Race

	CastSpell( OwnerID(), OwnerID(), 490102 ) --�N���]�O�������S��
	
	for i = 0 , 8 , 1 do --�N���x�m��������q��
		State[i] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110460 + i , 500 ) 
		SNPC[i] = LuaFunc_CreateObjByObj( 100289 , State[i] ) --�N��
		AddToPartition( SNPC[i] ,Room )
		Hide(State[i])
		SetRoleCamp( SNPC[i] , "SNPC" )
	end

	AddToPartition( Pailody , Room )
	SetPlot( Pailody , "touch" , "LuaFunc_Obj_Nothing" , 40 )
	PlayMotion( Pailody , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Pailody , GetString("SAY_110349_0") ) --/*�K�K�E������q�Q�]�ڵo�{�F�A�ڭ̭n�O�@���K�I
	while 1 do
		if timer == 30 then
			Say( Pailody , GetString("SAY_110349_1") ) --/*��q���E���Y�N���ΡA�ٮt�@�I�I�I
		elseif timer == 33 then
			break
		end
		if timer == 0 or timer == 10 or timer == 20 or timer == 30 then
			j = timer*3/10
			for i = 4 , 6 , 1 do
				Race = Rand( 5 )
				if Race > 2 then
					Monster[j] = CreateObjByFlag( 100039 , 780038 , i , 1 ) --�N��
				else
					Monster[j] = CreateObjByFlag( 100041 , 780038 , i , 1 ) --�N��
				end
				AddToPartition( Monster[j] , Room )
				BeginPlot( Monster[j] , "LuaQ_420329_Sui" , 0 )
				j = j + 1
			end
		end
		for i = 0 , 8 , 1 do
			if CheckID( SNPC[i] ) == false then --���ѳB�z�A���^���Ǫ�
				CancelBuff( OwnerID(), 500902 ); --�M���S��
				Say( Pailody , GetString("SAY_110349_2") ) --/*���K�w�g�����A�ڭ̥��ѤF�C
				sleep( 20 )
				DelObj( Pailody )
				return
			end
		end
		timer = timer + 1 
		sleep( 60 )
	end
	--���\�@�ë᪺�@��
	for i = 0 , 11 , 1 do --�R���p��
		if CheckID(Monster[i]) then
			DelObj( Monster[i] )
		end
	end

	for i = 0 , 8 , 1 do --�N���x�m���^��
		DelObj( SNPC[i] )
		Show(State[i],Room)
	end

	local Players = SearchRangePlayer( OwnerID() , 500 )
	j = 0
	while 1 do
		if players[j] == -1 then 
			break
		end
		CastSpell( players[j] , players[j] , 490408 ) --�N��
		j = j + 1
	end
	sleep( 30 )
	local ChronosOmu = CreateObjByFlag( 100135 , 780038 , 5 , 1 )
	AddToPartition( ChronosOmu , Room )
	SetPlot( ChronosOmu , "dead" , "LuaQ_420329_dead" , 40 )
	PlayMotion( Pailody , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	CastSpell( Pailody,Pailody,490098) 
	Say( Pailody , GetString("SAY_110349_3") ) --/*�i�̡̭A�����ڪ��O�q�A�����ɶ��������a�I
	j = 0
	while 1 do
		if players[j] == -1 then 
			break
		end
		CancelBuff( players[j], 500828 )--�N��
		j = j + 1
	end
	sleep( 30 )
	while 1 do
		if CheckID( ChronosOmu ) == false then
			CancelBuff( OwnerID(), 500902 )
			Say( Pailody , GetString("SAY_110349_4") ) --/*�P�§A�̡A�i�̡̭A��q�w�g�����A�ڲש��q�I�Τ��d���F�C
			sleep( 10 )
			CastSpell( Pailody,Pailody,490098) 
			sleep( 10 )
			DelObj( Pailody )
			CastSpell( OwnerID() , OwnerID() , 490101 ) --�N��
			SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL )
			SetPlot( OwnerID() , "touch" , "" , 0 )
			break
		end
		sleep( 60 )
	end
		
end

function LuaQ_420329_Sui()
	LuaFunc_Obj_Suicide(300)
end

function LuaQ_420329_dead()
	local Member = GetPrtyID(TargetID() , -1)
	for i = 1 , member , 1 do
		if CheckAcceptQuest( GetPrtyID(TargetID() , i ) , 420329 ) and CheckDistance( OwnerID(), GetPrtyID(TargetID() , i ) , 200 ) then
			SetFlag(GetPrtyID(TargetID() , i ) , 540230 , 1)
		end
	end
end

function LuaQ_420330_Accept()
	local HolpEgg = CreateObjByFlag( 110351 , 780038 , 3 , 1 )
	local Target = Role:new( TargetID() )
	Say( OwnerID() , GetString("SAY_110349_5") )--/*�ڥΧڪ��O�q�N�o�]�а_�ӡA���U�ӴN���U�A�F�C
	LuaFunc_WaitMoveTo( HolpEgg, Target:X() , Target:Y() , Target:Z() )
	DelObj( HolpEgg )
	GiveBodyItem(TargetID(),200911,1)
end