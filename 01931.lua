function LuaS_423367_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423367)==true )and( CheckCompleteQuest( OwnerID(),423367)==false) and	CheckFlag( OwnerID() , 544281) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423367_0]","LuaS_423367_1",0)	--�ڤw�g�ǳƦn�F�C
			else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423367_0]","LuaS_423367_2",0)	--�ڤw�g�ǳƦn�F�C
		end
	end
end

function LuaS_423367_2()
	SetSpeakDetail(OwnerID(),"[SC_423367_1]")	--�w�G��A�٦��X��B�ͩ|����ӡA�L�̨ӦۦU�B�C     								
end

function LuaS_423367_1()
	CloseSpeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue(TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(),"LuaS_423367_3",0 )
	end
end

function LuaS_423367_3()
	Yell( OwnerID(), "[SC_423367_2]" , 3 )		
	sleep(20)
	local ANT = Lua_DW_CreateObj("flag" ,115933,780694,1,1)				--�X�{�t�����w�S
	DisableQuest(  ANT , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( ANT , false )
	WriteRoleValue(  ANT ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  ANT ,EM_RoleValue_Register+2,TargetID())				--�⪱�a�g�i�w�S
	WriteRoleValue(  ANT ,EM_RoleValue_Register+3,OwnerID())				--���lANT�g�i�t���w�S

	BeginPlot(ANT , "LuaS_423367_Range_CHECK" , 0 )					--�����ˬd�I�I
	Setposbyflag(TargetID(), 780694, 7 ) 							--�ǰe���a�A�X�l�s��780694�B7
	sleep(10)
	if 	CheckAcceptQuest( TargetID() , 423367) == true		and
		GetDistance(TargetID(), ANT  ) < 300		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		AddBuff( TargetID()  , 507183 , 1 , 180 )						
	end
	
	BeginPlot(ANT, "LuaS_423367_4_LOOP" , 0 )
end

function LuaS_423367_4_LOOP()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QANT = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)

	local ELY = Lua_DW_CreateObj("flag" ,115934,780694,2,1)				--115934��Q�����B�X�l�s��780694�B2
	DisableQuest(  ELY , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( ELY , false )
	WriteRoleValue(  ELY ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+4,ELY)				--��t����Q�g�i�t���w�S
	WriteRoleValue(  ELY,EM_RoleValue_Register+3,OwnerID())				--��t���w�S�g�i�t����Q����
	WriteRoleValue(  ELY,EM_RoleValue_Register+2,player )					--�⪱�a�g�i��Q����
	BeginPlot(ELY, "LuaS_423367_MO_CHECK" , 0 )					--����Q�j���ˬd--�t���w�S���b�N�R����Q
	BeginPlot(ELY, "LuaS_423367_ELY" , 0 )						--������							
	sleep(40)
	Yell( OwnerID(), "[SC_423367_3]" , 3 )							--�M�`��A�N�i�檺�ơC					
	sleep(10)
	LuaFunc_MoveToFlag(OwnerID(), 780694,4,0)						--�w�B��Q���V�c�P��u780694,4
	BeginPlot(  ELY, "LuaS_423367_MOVE" , 0 )
	sleep(10)
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP)	--�w�I�k�ʧ@
--	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CAST_BEGIN)
	sleep(20)
	local BOX= Lua_DW_CreateObj("flag" ,115966,780694,11,1)				--115966�B�X�l�s��780694�B11
	SetModeEX( BOX, EM_SetModeType_Mark , false )
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+7,BOX)				--��t��BOX�g�i�t���w�S
	WriteRoleValue(  BOX,EM_RoleValue_Register+3,OwnerID())				--��t���w�S�g�i�S��
	BeginPlot(BOX, "LuaS_423367_MO_CHECK" , 0 )
	Lua_ObjDontTouch( BOX)
	sleep(10)
	CastSpell( OwnerID(), BOX, 495601)							--ANT���W�X�{�I�k�S��
	sleep(20)

	local STAR = Lua_DW_CreateObj("flag" ,115935,780694,3,1)				--�a�W�إX(or client���)���~�P�x115935�X�l�s��780694�B3
	DisableQuest(  STAR , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	SetModeEX( STAR , EM_SetModeType_Mark , false )
--	SetModeEX( STAR , EM_SetModeType_Obstruct , true )
	MoveToFlagEnabled( STAR , false )
	WriteRoleValue(  STAR ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+5,STAR)				--�⤻�~�P�g�i�t���w�S
	WriteRoleValue(  ELY,EM_RoleValue_Register+2,STAR)					--�⤻�~�P�g�i�t����Q
	WriteRoleValue(  STAR,EM_RoleValue_Register+3,OwnerID())				--��t���w�S�g�i�t�����~�P	
	BeginPlot(STAR, "LuaS_423367_MO_CHECK" , 0 )					--�����~�P�j���ˬd--�t���w�S���b�N�R��

	local POINT = Lua_DW_CreateObj("flag" ,115936,780694,10,1)				--115936�B�X�l�s��780694�B10
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+6,POINT )				--���I���g�i�t���w�S
	WriteRoleValue(  POINT ,EM_RoleValue_Register+3,OwnerID())				--��t���w�S�g�i�I��
	BeginPlot(POINT , "LuaS_423367_MO_CHECK" , 0 )

	WriteRoleValue(  POINT ,EM_RoleValue_Register+1,BOX)					--��S�ļg�i�I��
	
	sleep(20)
	Yell( OwnerID(), "[SC_423367_4]" , 3 )							--�w�G[$playername]�A�ɧA�ү�A���������B��C
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_END)
	sleep(30)
	LuaFunc_MoveToFlag(OwnerID(), 780694,5,0)						--�w���W�@��(���_�����q���C)
	AdjustFaceDir( OwnerID(), STAR, 0 )
	sleep(10)
	--SetDefIdleMotion(OwnerID(),ruFUSION_MIME_RUN_CHARGE)
	
	--PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_INSTANT)
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP)
	--�����@���������C�b�a�W���ʧ@
	local Time = 0
	for i = 1, 75 , 1 do									--�ɶ���N�R����lNPC�A�^�_�쪬
	Time = Time + 1
	
		if	CheckID( player  ) == false or ReadRoleValue( player  , EM_RoleValue_IsDead ) == 1 		then
			WriteRoleValue( QANT   , EM_RoleValue_Register+1 , 0 )
			DelObj (OwnerID())
			if	CheckBuff( player   , 507183) == true	then
				CancelBuff( player   , 507183)  
			end
			if	CheckFlag( player   , 544283 ) == true	then
				SetFlag( player   , 544283 , 0 )
			end
			break
		end

		if	Time==2	or	Time==4	or	Time==6		then
			if	CheckBuff(player   , 507184) == false	and	CheckBuff(player   , 507205) == false	then
				ScriptMessage(player  ,player  ,2,"[SC_423367_8]",0)		--Ĳ�I���~�P�}�A�X�ʭ����B��
				ScriptMessage(player  ,player  ,0,"[SC_423367_8]",0)
				sleep(20)
			end
		end
		if	Time>5		then
			if	CheckBuff(player   ,507205) == true	then
				ScriptMessage(player  ,player  ,1,"[SC_423367_5]",0)			--�����B���ͩ󰱺�......
				ScriptMessage(player  ,player  ,0,"[SC_423367_5]",0)			--�����B���ͩ󰱺�......
				sleep(20)
			end		
		end

		if	Time>8		then
			if	(CheckBuff(player  , 507184) == false)	and	(CheckBuff(player  , 507205) == false)	then
				ScriptMessage(player ,player ,1,"[SC_423367_6]",0)		--���a�T�ҲŤ媺�������ѡA�������ݤU�����|�I
				ScriptMessage(player ,player ,0,"[SC_423367_6]",0)
				WriteRoleValue( QANT   , EM_RoleValue_Register+1 , 0 )
				DelObj (OwnerID())
				if	CheckBuff( player  , 507183) == true then
					CancelBuff( player  , 507183)  
				end
				if	CheckFlag( player  , 544283 ) == true	then
					SetFlag( player  , 544283 , 0 )
				end
				break
			end
		end
		
		if	Time==10		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				Yell( OwnerID(), "[SC_423367_10]" , 3 )						
			end
		end


		if	Time==20		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				Yell( OwnerID(), "[SC_423367_11]" , 3 )						
			end
		end

		if	Time==30		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				Yell( OwnerID(), "[SC_423367_12]" , 3 )						
			end
		end

		if	Time>40		then
			if	(CheckBuff(player   , 507184) == true)	or	(CheckBuff(player   , 507205) == true)	then
				if	CheckFlag( player   , 544283 ) == false 	then
					SetFlag( player   , 544283 , 1 )
				end
			end
		end	

		if	CheckFlag( player   , 544283 ) == true 	then
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_END)
			BeginPlot( OwnerID(), "LuaS_423367_4" , 0 )		
			break		
		end
		sleep(20)
	end
end

function LuaS_423367_Range_CHECK()
	local QANT = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 180 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423367) == true	then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
		if	CheckFlag( play  , 544283 ) == true	then
			SetFlag( play  , 544283 , 0 )
		end
	sleep(10)
		if 	CheckBuff( play  , 507183) == true	then
			CancelBuff( play  , 507183)  
		end
		if 	CheckBuff( play  , 507184) == true	then
			CancelBuff( play  , 507184)  
		end
		if 	CheckBuff( play  , 507205) == true	then
			CancelBuff( play  , 507205)  
		end
	WriteRoleValue( QANT, EM_RoleValue_Register+1 , 0 )
	Setposbyflag(play  , 780694, 6 ) 						--�ǰe���a�^��a�A�X�l�s��780694�B6
	Delobj( OwnerID() )
end

function LuaS_423367_BUFF_CHECK()
	local Num
	for i = 0 , 20 , 1 do
		Num = 0
			if	CheckAcceptQuest( OwnerID(), 423367) == true	then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
		if	CheckFlag( play  , 544283 ) == true	then
			SetFlag( play  , 544283 , 0 )
		end
		if 	CheckBuff( OwnerID(), 507183) == true	then
			CancelBuff( OwnerID(), 507183)  
		end
	return false	
end


function LuaS_423367_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423367)==false )	then
		if 	CheckBuff( OwnerID(), 507183) == true	then
			CancelBuff( OwnerID() , 507183)  
		end
		return false
	end
	local ANT= {}
	ANT= SearchRangeNPC(OwnerID() , 30000)
	for i=0,table.getn(ANT)-1 do
		if	ReadRoleValue(ANT[i] , EM_RoleValue_OrgID) == 115933		then
			return false
		end
		if	i == table.getn(ANT)	then
			return true
		end
	end
end

function LuaS_423367_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507183)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )				--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544301, 0 )
end


function LuaS_423367_4()
	local player=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	local QANT=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	local ELY	=ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )		
	local STAR=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 )
	local POINT =ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )
	local BOX=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )
	Lua_ObjDontTouch( POINT ) 
	local WATER = Lua_DW_CreateObj("flag" ,115966,780694,12,1)
	WriteRoleValue(  WATER ,EM_RoleValue_Register+3,OwnerID())				--��t���w�S�g�i�S��	
	BeginPlot(WATER , "LuaS_423367_MO_CHECK" , 0 )					--���S�İj���ˬd--�t���w�S���b�N�R��
	SetModeEX( WATER , EM_SetModeType_Mark , false )
	
	sleep(10)
	AdjustFaceDir( OwnerID(), WATER , 0 )

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)				--�w�|�C���V�c�P��u
	AddBuff( WATER ,  505453 , 0 , -1 )							--�S�ĩ�j3

	PlayMotion(ELY,ruFUSION_ACTORSTATE_CAST_END)
	sleep(20)
	DelObj (POINT )
	DelObj (BOX)
	CastSpell( OwnerID(), WATER , 495598)	
	sleep(10)
	CastSpell( STAR, STAR, 495601)					--STAR���W�X�{�I�k�S�ġA�̫�@�ӯS�ıq���~�P�������T�T�W�ɡA�c�P��u�إX�z���S��
	sleep(20)
	DelObj (STAR)
	AddBuff( WATER   , 501119, 1 , 5 )	
	sleep(10)
	DelObj (WATER )
	AdjustFaceDir( ELY , STAR, 0 )
	Yell( ELY , "[SC_423367_7]" , 3 )							--��Q�G�����F...�@��...
	sleep(10)
	if	CheckFlag( player, 544281 ) == false	then
		SetFlag( player, 544281 , 1 )
	end

	if	(CheckBuff(player, 507184) == true)	then
		CancelBuff( player, 507184)  
	end

	if	CheckBuff( player, 507183) == true	then
		CancelBuff( player, 507183)  
	end
	sleep(20)
	if	(CheckBuff(player, 507205) == true)	then
		CancelBuff( player, 507205)  
	end
	DelObj (OwnerID())
	Setposbyflag(player, 780694, 6 ) 							--�ǰe���a�^��a�A�X�l�s��780694�B6
	WriteRoleValue( QANT, EM_RoleValue_Register+1 , 0 )
end

function LuaS_423367_MOVE()
	LuaFunc_MoveToFlag(OwnerID(), 780694,5,0)
	sleep(10)
	LuaFunc_MoveToFlag(OwnerID(), 780694,8,0)						--��Q���W�@��
end

function LuaS_423367_MO_CHECK()	
	local ANT = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)				--�t���w�S
	for i = 0 , 180 , 1 do
		if	CheckID(ANT ) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423367_ELY()								--������
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)				--�������D���a
	local Time = 0
	for i = 1, 20 , 1 do							
	Time = Time + 1
										
		if	Time>5		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				BeginPlot( OwnerID(), "LuaS_423367_ELY_LOOP" , 0 )		
				break		
			end
		end
	sleep(20)
	end
end

function LuaS_423367_ELY_LOOP()								--�b��Q���W�]���@��
		local STAR= ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
		PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	
		local spiritA = Lua_DW_CreateObj("flag" ,115937,780695,1,1)				--115937������B�X�l�s��780695�B1
		DisableQuest(spiritA , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled( spiritA , false )
		SetModeEX( spiritA , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritA ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritA,EM_RoleValue_Register+3,OwnerID())				--��t����Q�g�i�t��������
		BeginPlot(  spiritA, "LuaS_423367_ELY_CHECK" , 0 )					--��������j���ˬd--��Q���b�N�R��������
		BeginPlot(  spiritA, "LuaS_423367_SA_MOVE" , 0 )					--����

		sleep(20)
	
		local spiritB = Lua_DW_CreateObj("flag" ,115938,780695,2,1)				--115938������B�X�l�s��780695�B2
		DisableQuest(spiritB , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled( spiritB , false )
		SetModeEX( spiritB  , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritB ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritB,EM_RoleValue_Register+3,OwnerID())				--��t����Q�g�i�t��������
		BeginPlot(  spiritB, "LuaS_423367_ELY_CHECK" , 0 )					--��������j���ˬd--��Q���b�N�R��������
		BeginPlot(  spiritB, "LuaS_423367_SB_MOVE" , 0 )					--����
		
		sleep(20)

		local spiritC = Lua_DW_CreateObj("flag" ,115949,780695,3,1)				--115938���B�X�l�s��780695�B3
		DisableQuest(spiritC , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled( spiritC , false )
		SetModeEX( spiritC , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritC ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritC,EM_RoleValue_Register+3,OwnerID())				--��t����Q�g�i�t�����
		BeginPlot(  spiritC, "LuaS_423367_ELY_CHECK" , 0 )					--�����j���ˬd--��Q���b�N�R�����
		BeginPlot(  spiritC, "LuaS_423367_SC_MOVE" , 0 )					--����
		
		sleep(20)

		local spiritD = Lua_DW_CreateObj("flag" ,115950,780695,4,1)				--115938������B�X�l�s��780695�B4
		DisableQuest(spiritD , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled( spiritD , false )
		SetModeEX( spiritD , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritD ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritD,EM_RoleValue_Register+3,OwnerID())				--��t����Q�g�i�t��������
		BeginPlot(  spiritD, "LuaS_423367_ELY_CHECK" , 0 )					--��������j���ˬd--��Q���b�N�R��������
		BeginPlot(  spiritD, "LuaS_423367_SD_MOVE" , 0 )					--����
		
		sleep(20)

		local spiritE = Lua_DW_CreateObj("flag" ,115951,780695,5,1)				--115938������B�X�l�s��780695�B5
		DisableQuest(spiritE , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled( spiritE , false )
		SetModeEX( spiritE , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritE ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritE,EM_RoleValue_Register+3,OwnerID())				--��t����Q�g�i�t��������
		BeginPlot(  spiritE, "LuaS_423367_ELY_CHECK" , 0 )					--��������j���ˬd--��Q���b�N�R��������
		BeginPlot(  spiritE, "LuaS_423367_SE_MOVE" , 0 )					--����	
		return true
end

function LuaS_423367_ELY_CHECK()	
	local ELY = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--�t����Q
	for i = 0 , 120 , 1 do
		if	CheckID(ELY ) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423367_SA_MOVE()	--��
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SB_MOVE()	--��
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SC_MOVE()	--��
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)	
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SD_MOVE()	--��
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SE_MOVE()	--��
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,7,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,8,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,7,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,8,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,9,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,7,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,8,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

--�I��115936��
function LuaS_115936_0()
	local BOX=ReadRoleValue( TargetID() , EM_RoleValue_Register+1 )

	if	(CheckBuff(OwnerID() , 507184) == false)	and	(CheckBuff(OwnerID() , 507205) == false)	then
		AddBuff( OwnerID()  , 507184, 1 , 12 )
		AddBuff( BOX,  505463 , 0 , 13 )
		AddBuff( BOX,  505453 , 0 , -1 )		--�S�ĩ�j3
		return true
	end
	if	(CheckBuff(OwnerID() , 507184) == false)	and	(CheckBuff(OwnerID() , 507205) == true)	then
		CancelBuff(OwnerID() , 507205)
		AddBuff( OwnerID()  , 507184, 1 , 12 )
		AddBuff( BOX,  505463 , 0 , 13 )
		AddBuff( BOX,  505453 , 0 , -1 )		--�S�ĩ�j3
		return true
	end
	if	(CheckBuff(OwnerID() , 507184) == true)	and	(CheckBuff(OwnerID() , 507205) == false)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423367_9]",0)		--�����O�q�B�椤�A�ȮɵL�k���ƬI��
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423367_9]",0)
		return false
	end
end