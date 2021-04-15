----423368--115952�I���e�ˬd�G
function LuaS_423368()
	if	(CheckAcceptQuest(OwnerID(),423368)==true )and( CheckCompleteQuest( OwnerID(),423368)==false) and	CheckFlag( OwnerID() , 544290 ) ==false	then
			if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				if	CountBodyItem(OwnerID(),207729) > 0 	then
					return true
				else
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423368_0]",0) --�A���W�S����;�I
					ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423368_0]",0) --�A���W�S����;�I
					return false
				end	
			else
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--�ؼХ��b���L��
			return false
			end
		else
		return false
	end
end

--�I����t���G
function LuaS_423368_after()

	if 	CheckAcceptQuest( OwnerID() , 423368) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(OwnerID() , 544234, 1 )						--544299�P�_�Z����		
		AddBuff(OwnerID() , 507206 , 1 , 120)  						
	end

	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
	DelBodyItem(OwnerID(), 207729, 1 )							

	local WATER= LuaFunc_CreateObjByOBj(116013, TargetID() )				--�X�{�t�����g��116013
	DisableQuest( WATER, true )
	WriteRoleValue( WATER,EM_RoleValue_Register+2,OwnerID())				--�⪱�a�g�i�Ѻt���g��
	WriteRoleValue( WATER,EM_RoleValue_Register+3,TargetID())				--���g��g�i�t���g��
	BeginPlot( WATER, "LuaS_423368_Range_CHECK" , 0 )					--���t���g��j���ˬd--���a���b�N�R���t���g��
	BeginPlot( WATER, "Lua_423368_end" , 0 )
	
	local TREE= Lua_DW_CreateObj("flag" ,116014,780655,1,1)				--�إX�[��δӪ�
	DisableQuest( TREE, true )
	WriteRoleValue(  TREE,EM_RoleValue_Register+3,WATER)				--��t���g��g�i�t����]
	BeginPlot(  TREE, "Lua_423368_22" , 0 )

	return true
end


function LuaS_423368_Range_CHECK()
	local QWATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 120 , 1 do
		Num = 0
			if	CheckAcceptQuest( player , 423368) == true	and
				CheckFlag( player , 544234) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	Setposbyflag(player , 780694, 6 ) 							--�ǰe���a�^��a�A�X�l�s��780694�B6
	writerolevalue(QWATER , EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end


function Lua_423368_22()
	local WATER= ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)			--�t���g��
	for i = 0 , 120 , 1 do
		if	CheckID(WATER) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423368_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423368)==false )	then
		if 	CheckBuff( OwnerID(), 507206) == true	then
			CancelBuff( OwnerID() , 507206)  
		end
		return false
	end
	local ANT= {}
	ANT= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ANT)-1 do
		if	ReadRoleValue(ANT[i] , EM_RoleValue_OrgID) == 115953		then
			return false
		end
		if	i == table.getn(ANT)	then
			return true
		end
	end
end

function LuaS_423368_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507206)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544234, 0 )
end


function Lua_423368_end()
	sleep(10)
	local PLAY=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	local QWATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	
	Setposbyflag(PLAY, 780655, 7 ) 							--�ǰe���a�A�X�l�s��780655�B7
	
	local ANT = Lua_DW_CreateObj("flag" ,115953,780655,2,1)				--115953�w�S�Jù�B�X�l�s��780655�B2
	DisableQuest(  ANT , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( ANT , false )
	WriteRoleValue(  ANT ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  ANT,EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t���w�S
	BeginPlot(  ANT, "Lua_423368_22" , 0 )						--���w�S�j���ˬd--WATER���b�N�R���w�S							
	AdjustFaceDir( PLAY, ANT, 0 )		

	local ELY = Lua_DW_CreateObj("flag" ,115965,780655,3,1)				--115965��Q�����B�X�l�s��780655�B3
	DisableQuest(  ELY , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( ELY , false )
	WriteRoleValue(  ELY ,EM_RoleValue_IsWalk , 1 )
--	WriteRoleValue(  ANT,EM_RoleValue_Register+4,ELY)					--��t����Q�g�i�t���g��
	WriteRoleValue(  ELY,EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t����Q����
	BeginPlot(  ELY	, "Lua_423368_22" , 0 )						--����Q�j���ˬd--�t���g�藍�b�N�R����Q

	local IB = Lua_DW_CreateObj("flag" ,115963,780655,4,1)					--115963�㨩�B�X�l�s��780655�B4
	DisableQuest(  IB , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( IB , false )
	WriteRoleValue(  IB ,EM_RoleValue_IsWalk , 1 )
--	WriteRoleValue(  ANT,EM_RoleValue_Register+5,STAR)					--��㨩�g�i�t���w�S
	WriteRoleValue(  IB,EM_RoleValue_Register+3,OwnerID())					--��t���g��g�i�t���㨩
	BeginPlot(  IB	, "Lua_423368_22" , 0 )	


	local NI = Lua_DW_CreateObj("flag" ,115964,780655,5,1)					--115964�g�J���B�X�l�s��780655�B5
	DisableQuest(  NI , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(NI , false )
	WriteRoleValue(  NI ,EM_RoleValue_IsWalk , 1 )
--	WriteRoleValue(  ANT,EM_RoleValue_Register+5,STAR)					--��g�J���g�i�t���w�S
	WriteRoleValue(  NI,EM_RoleValue_Register+3,OwnerID())					--��t���w�S�g�i�t���g�J��
	BeginPlot(  NI, "Lua_423368_22" , 0 )	
	CastSpell( NI  , NI   , 494399)

	local People = {}
	local amount = 8
	For i=1, amount  do
		sleep(5)	
		local R = Rand( 3 ) 
		if	R ==0	then
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 116060, 780700, 9 , 0 )  
				Lua_ObjDontTouch( People[i] )	
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)	
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 116061, 780700, 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			else
				People[i] = CreateObjByFlag( 116062, 780700, 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			end	
		elseif	R ==1	then	
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 116060, 780700, 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 116061, 780700, 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			else
				People[i] = CreateObjByFlag( 116062, 780700, 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			end	
		else
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 116060, 780700, 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 116061, 780700, 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			else
				People[i] = CreateObjByFlag( 116062, 780700, 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--��t���w�S�g�i�t�������F
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--��t���g��g�i�t�������F
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--���j���ˬd
			end	
		end
	End
	local BODO = Lua_DW_CreateObj("flag" ,116015,780700,12,1)				--115966�w�S�Jù�B�X�l�s��780700�B12
	SetModeEX( BODO , EM_SetModeType_Mark , false )
	CastSpell( BODO  , BODO   , 494399)	
	sleep(30)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423368_8]" , 3 )			--��Q�G�A�̬O�_�]�P����o�ѯº骺�۵M���O�H
	sleep(20)
	CastSpell( NI  , NI   , 494399)
	CastSpell( BODO   , BODO    , 494399)
	sleep(10)	
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423368_9]" , 3 )			--��Q�G�w�S�Jù...�ڭ̪����F���̡A�N�ڭ̱q���b��������F������C
	sleep(20)
	CastSpell( BODO    , BODO     , 494399)
	sleep(10)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( ELY , "[SC_423368_10]" , 3 )			--��Q�G�c�P��u�g�����ܡA�ڭ̤]��o���͡C
	sleep(20)
	CastSpell( BODO   , BODO    , 494399)
	Yell( People[1] , "[SC_423368_11]" , 3 )			--�����F
	For i=1, 8  do						--�����F�U��
		PlayMotionEX( People[i] , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end
	PlayMotion( IB , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(10)
	CastSpell( BODO   , BODO    , 494399)
	CastSpell( NI  , NI  , 494399)
	Yell( ANT , "[SC_423368_1]" , 3 )			--�w�G�A�ܪ��a���L�k�A�Ӿ�~�O�z�Z�A�U�������۵M�A�ɶ���v¡�˲��C
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Yell( ELY , "[SC_423368_2]" , 3 )			--��Q�G�`���@�ѡA�o�̷|��_����l�j�L���ҼˡA�کӿեβ��ͤߤO���ɳy�����ˮ`�C
	sleep(20)
	AdjustFaceDir( ANT , ELY , 0 )	
	sleep(10)	
	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ANT , "[SC_423368_3]" , 3 )			--�w�G�ڱN�P�p�@�P�u�@�L�̡C
	sleep(20)
	AdjustFaceDir( ANT , IB, 0 )				--<���V�㨩���g��>
	CastSpell( ANT  , ANT  , 491276  )
	sleep(20)
	PlayMotion( ANT , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( ANT , "[SC_423368_4]" , 3 )			--�w�G[115963]�A[ZONE_JYRNATHERIN_FOREST]��q���ê��A�������A�ڦ������d�U����]�C
	sleep(20)
	Yell( ANT , "[SC_423368_7]" , 3 )			--�w�G�ʦL���Ԥw�g�L�h�A���F�̤��A�X�A���j�ҡA�Ч�ڪ��H���t�C�a�^�X�����ҥ浹���F��[112854]�@��
	sleep(40)
	Yell( IB , "[SC_423368_5]" , 3 )			--�㨩���g���G�O�I
	PlayMotion( IB , ruFUSION_ACTORSTATE_CROUCH_END)
	AddBuff( IB   , 501119, 1 , 10 )	
	For i=1, 8  do		
		AddBuff( People[i]  , 501119, 1 , 10 )	
	end
	sleep(10)
	BeginPlot(  IB , "Lua_423368_IBNI_MOVE" , 0 )	
	sleep(20)
	AdjustFaceDir( NI , ANT, 0 )				--<�g�J���W���~���V���F��>
	sleep(10)
	Yell(NI , "[SC_423368_6]" , 3 )			--�g�J���W���~�G�P�§A�̰����@���A�ڤ]�|�~��u�@�o�y�˪L�B�u�@�ۧA��...
	sleep(20)
	For i=1, 8  do
	PlayMotion( People[i] , ruFUSION_ACTORSTATE_CROUCH_END)
	end
	sleep(10)
	if	CheckFlag( PLAY , 544290 ) == false	then
		SetFlag( PLAY, 544290 , 1 )
	end
	if	CheckBuff( PLAY, 507206) == true	then
		CancelBuff( PLAY, 507206)  
	end
	DelObj(OwnerID())
	Setposbyflag(PLAY, 780694, 6 ) 							--�ǰe���a�^��a�A�X�l�s��780694�B6
	WriteRoleValue( QWATER  , EM_RoleValue_Register+1 , 0 )
end

function LuaS_423368_PeopleGo()
	local ANT= ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	MoveToFlagEnabled(OwnerID(), false)
	LuaFunc_MoveToFlag(OwnerID() , 780700, ReadRoleValue(OwnerID(),EM_RoleValue_PID),0  )
	AdjustFaceDir( OwnerID(), ANT, 0 )	
end

function Lua_423368_IBNI_MOVE()
	LuaFunc_MoveToFlag(OwnerID(), 780655,6,0)		--<�㨩���g�����h>
	sleep(20)
	DelObj(OwnerID())
end