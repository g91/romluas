-----�X�l780517
-----543506����
-----543507���\

function LuaS_422865_Gulida_Born()

	local OriginalSakis = Lua_DW_CreateObj( "flag" , 114205 ,780517 , 1 )	--�B���F��l�@���إX�F�_�q
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID, OriginalSakis )	
end


function LuaS_422865_Gulida_Again()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422865 ) == true		and
		CheckFlag( OwnerID(), 543477 )==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422865_25]","LuaS_422865_Gulida_ahaha",0)	--�����ڦA�����U�F�_�q�A���s�l���D���F
	end
end

function LuaS_422865_Gulida_ahaha()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() , 206387 ) == 0 and CountBodyItem( OwnerID() , 206390 ) == 0 then
		GiveBodyItem( OwnerID() , 206387 , 1 )
	end
	BeginPlot( TargetID() , "LuaS_422865" , 0 )
end


function LuaS_422865()
	
	if	ReadRoleValue( OwnerID() ,EM_RoleValue_Register  ) == 0	then
		Say(OwnerID() , "[SC_422865_0]")		
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )	
		BeginPlot( OwnerID() , "LuaS_422865_1" , 0 )
	else
		Say(OwnerID() , "[SC_422865_1]")		
	end
end

function LuaS_422865_1()
	local OriginalSakis = ReadRoleValue( OwnerID() ,EM_RoleValue_PID  ) 
	Hide(OriginalSakis)
	local Sakis = CreateObjByFlag( 114072 , 780517 , 1 , 0 )		--�F�_�q
	local Wind = CreateObjByFlag( 114074 , 780517 , 2 , 0 )		--�������βy
	local Earth = CreateObjByFlag( 114075 , 780517 , 3 , 0 )		--�g�����βy�]�ئb����������^
	local Fire = CreateObjByFlag( 114092 , 780517 , 4 , 0 )		--�������βy
	AddToPartition( Sakis , 0 )
	AddToPartition( Wind , 0 )
	AddToPartition( Earth , 0 )
	AddToPartition( Fire , 0 )
	Lua_ObjDontTouch( Wind)			--���|����Y���إH�ΦW�r�A�]����Q�IĲ
	Lua_ObjDontTouch( Earth) 
	Lua_ObjDontTouch( Fire) 
	MoveToFlagEnabled( Sakis , false)

	LuaFunc_MoveToFlag( Sakis , 780517 , 6  ,  0 )
	Say( Sakis , "[SC_422865_2]")		--(�F�_�q�i�D���a�L�n�}�l����)
	sleep(20)
	AdjustFaceDir( Sakis, Wind, 0 )
	SetFightMode ( Sakis ,0 ,0 ,0 ,0 )

	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_3]")		--(�F�_�q�l�ꭷ���F�����)
	AddBuff( Wind ,  505463, 0 , -1 )		--�b�������βy�W�X�{�S��
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(20)
	AddBuff( Wind ,  505452 , 0 , -1 )		--���S�ĩ�j2
	sleep(20)
	AddBuff( Wind ,  505453 , 0 , -1 )		--���S�ĩ�j3
	sleep(20)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_END)
	sleep(30)

	AdjustFaceDir( Sakis, Earth, 0 )
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_4]")		--(�F�_�q�l��g���F�����)
	AddBuff( Earth ,  505462, 0 , -1 )		--�b�g�����βy�W�X�{�S��
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(20)
	AddBuff( Earth ,  505452 , 0 , -1 )		--�g�S�ĩ�j2
	sleep(20)
	AddBuff( Earth ,  505453 , 0 , -1 )		--�g�S�ĩ�j3
	sleep(20)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_END)
	sleep(30)

	AdjustFaceDir( Sakis, Fire, 0 )
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_5]")		--(�F�_�q�l������F�����)
	AddBuff( Fire ,  505471 , 0 , -1 )		--�b�������βy�W�X�{�S��
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(20)
	AddBuff( Fire ,  505453 , 0 , -1 )		--���S�ĩ�j3
	sleep(20)
	AddBuff( Fire ,  505455 , 0 , -1 )		--���S�ĩ�j5
	sleep(20)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_END)
	sleep(30)
	SetFightMode ( Sakis ,0 ,1 ,0 ,0 )

	AdjustFaceDir( Sakis, Earth, 0 )
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_6]")		--(�F�_�q�I��p�p�������F�����)
	sleep(30)
	local Water = CreateObjByFlag( 114203 , 780517 , 5 , 0 )		--�������βy
	AddToPartition( Water , 0 )
	WriteRoleValue( Water , EM_RoleValue_PID , Sakis )
	AddBuff( Water ,  505464 , 0 , -1 )		--�b�������βy�W�X�{�S��
	sleep(20)
	AddBuff( Water ,  505451 , 0 , -1 )	
	BeginPlot( Water , "LuaS_422865_Water_CHECK" , 0 )
	SetFightMode ( Sakis ,0 ,1 ,0 ,0 )

	Say( Sakis , "[SC_422865_7]")		--(�F�_�q�}�l���R���H�H��)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	BeginPlot( Sakis , "LuaS_422865_Sakis_CHECK" , 0 )
	while true do
		sleep(20)
		PlayMotion(Sakis , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
		sleep(20)
		PlayMotion(Sakis , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
		if	ReadRoleValue( Sakis ,EM_RoleValue_Register) > 0	then
			SetFlag(Sakis , 543506 , 1 )		--�ɶ���A���ȥ���
			break
		end
		if	CheckBuff( Water , 505455 )== true	then
			SetFlag(Sakis , 543507 , 1 )		--�l�꧹���A���Ȧ��\
			break
		end
		if	CheckFlag( Sakis ,543506 )== true	  	then	--�������ɱo�쪺�X��
			break
		end	
	end

	if	CheckFlag( Sakis ,543506 )== true		then
		Say(Sakis, "[SC_422865_8]")			--�������Ѫ��o��
		Delobj( Water )
		sleep(30)
		LuaFunc_MoveToFlag( Sakis , 780517 , 1  ,  0 )
		Delobj( Fire )
		Delobj( Wind )
		Delobj( Earth )
		Delobj( Sakis )
		Show(  OriginalSakis  , 0 )
		BeginPlot( OwnerID() , "LuaS_422865_Quest_Fail" , 0 )
	end

	if	CheckFlag( Sakis ,543507 )== true		then
		Say(Sakis, "[SC_422865_9]")			--�������\���o��
		Lua_ObjDontTouch( Water )	
		sleep(30)
		LuaFunc_MoveToFlag( Sakis , 780517 , 1  ,  0 )
		Delobj( Water )
		Delobj( Fire )
		Delobj( Wind )
		Delobj( Earth )
		Delobj( Sakis )
		Show(  OriginalSakis  , 0 )
		BeginPlot( OwnerID() , "LuaS_422865_Quest_Success" , 0 )
	end
end

function LuaS_422865_Sakis_CHECK()

	local Time = 0
	for i = 0 , 500 , 1 do
		sleep( 20 )
		Time = Time + 1
		if	Time  >  300	then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )		--�W�L�ɶ�
			break
		end

		if	CheckFlag( OwnerID() , 543507) == true	or
			CheckFlag( OwnerID() , 543506) == true	then		--���Ȧ��\��A���A�p��
			break
		end
	end
end

function LuaS_422865_Water_CHECK()
	local Sakis = ReadRoleValue(OwnerID(), EM_RoleValue_PID )
	local Water = 0
	local OLDWater = 0
	local Num = 0
	for i = 0 , 200 , 1 do
		sleep(50)
		OLDWater = Water
		Water = ReadRoleValue(OwnerID(), EM_RoleValue_Register )
		if	OLDWater > Water	then
			Say(Sakis, "[SC_422865_10]")			--���ܤp�F���������
			Num = 0

		elseif	OLDWater < Water	then
			Say(Sakis, "[SC_422865_11]")			--���o�ܦn�A�~��O�����������
			Num = 0
		else
			Say(Sakis, "[SC_422865_12]")			--���S�ܮɪ��o��
			Num = Num + 1
			if	Num > 15	then
				if	CheckBuff(OwnerID(), 505454 ) == true	then	--�ĥ|�h
					AddBuff( OwnerID() ,  505453 , 0 , -1 )		--��W�ĤT�h

				elseif	CheckBuff(OwnerID(), 505453 ) == true	then	--�ĤT�h
					AddBuff( OwnerID() ,  505452 , 0 , -1 )		--��W�ĤG�h

				elseif	CheckBuff(OwnerID(), 505452 ) == true	then	--�ĤG�h
					AddBuff( OwnerID() ,  505451 , 0 , -1 )		--��W�Ĥ@�h

				elseif	CheckBuff(OwnerID(), 505451 ) == true	then	--�Ĥ@�h
					CancelBuff(OwnerID() , 505451 )			--�R���Ĥ@�h
					SetFlag(Sakis , 543506 , 1 )			--�����F�A���ȥ���
				end

				Num = 0
			end
		end
		Sleep( 30 )
		if	CheckBuff(OwnerID(), 505451 ) == true	then
			Say(Sakis, "[SC_422865_13]")			--�Ĥ@�h�p�������
		end

		if	CheckBuff(OwnerID(), 505452 ) == true	then
			Say(Sakis, "[SC_422865_14]")			--�ĤG�h�p�������
		end

		if	CheckBuff(OwnerID(), 505453 ) == true	then
			Say(Sakis, "[SC_422865_15]")			--�ĤT�h�p�������
		end

		if	CheckBuff(OwnerID(), 505454 ) == true	then
			Say(Sakis, "[SC_422865_16]")			--�ĥ|�h�p�������
		end

		if	CheckBuff(OwnerID(), 505455 ) == true	then
			Say(Sakis, "[SC_422865_17]")			--�Ĥ��h�p�������
			break
		end
		if	CheckFlag( Sakis , 543506) == true	then
			break
		end
	end
end

function LuaS_422865_USE_CHECK()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114056	then		--��������Ůe��
		if	CountBodyItem( OwnerID(), 206387 )>0	or
			CountBodyItem( OwnerID(), 206390 )>0	then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422865_18]", 0 )		--�A�����W�w�g���@�ӪŮe��
			return false
		else
			return true
		end

	elseif	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114073	then		--�I������
		if	CountBodyItem( OwnerID(), 206387 )>0	then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422865_19]", 0 )		--�A�ݭn�@�ӨV�����Ůe��
			return false
		end
	else
--		if	ReadRoleValue( TargetID() , EM_RoleValue_Register2  ) == 0 	then
			if	CheckAcceptQuest(OwnerID(),422865)==true	and
				CheckCompleteQuest( OwnerID(),422865)==false	then
--				if	CountBodyItem( OwnerID(),206390) >0	then
--					WriteRoleValue( TargetID() , EM_RoleValue_Register2 , 1 )
--					BeginPlot( TargetID() , "LuaS_422865_USE_WATEROK" , 0 )
--					return false
--				end
				if	CountBodyItem( OwnerID(),206390) <1	and
					CheckFlag( OwnerID(), 543477 )==false	then
					ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_20]" , 0 )		--�A�ʤֲ��������e��
					return false
				end
				if	CheckFlag( OwnerID(),543477 )== true	  	then	
					ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_21]" , 0 )		--�A�w�g���U�L�F�_�q
					return false
				end
				return	true
			end
--		else
--			say(OwnerID(),ReadRoleValue( TargetID() , EM_RoleValue_Register2  ) )
--			ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_22]" , 0 )				--�ؼХ��Q�ϥΤ�
--			return false
--		end
	end
end

function LuaS_422865_USE_OK()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114073	then
		SetFlag(OwnerID() , 543502 , 1 )			--���g�V���L��	
		DelBodyItem ( OwnerID(),206387 , 1 )
		return	true
	elseif
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114203	then
--		WriteRoleValue( TargetID() , EM_RoleValue_Register2 , 0 )
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_26]" , 0 )				--�`�O��
		DelBodyItem ( OwnerID(),206390 , 1 )
--		GiveBodyItem( TargetID(), 206387, 1 )
		if	CheckBuff(TargetID(), 505454 ) == true	then	--�ĥ|�h
			AddBuff( TargetID() ,  505455 , 0 , -1 )		--�W�Ĥ��h
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 5 )
			return	true

		elseif	CheckBuff(TargetID(), 505453 ) == true	then	--�ĤT�h
			AddBuff( TargetID() ,  505454 , 0 , -1 )		--�W�ĥ|�h
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 4 )
			return	true

		elseif	CheckBuff(TargetID(), 505452 ) == true	then	--�ĤG�h
			AddBuff( TargetID() ,  505453 , 0 , -1 )		--�W�ĤT�h
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 3 )
			return	true

		elseif	CheckBuff(TargetID(), 505451 ) == true	then	--�Ĥ@�h
			AddBuff( TargetID() ,  505452 , 0 , -1 )		--�W�ĤG�h
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 )
			return	true

		else
			AddBuff( TargetID() ,  505451 , 0 , -1 )		--�W�Ĥ@�h
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
			return	true
		end
	else
		return	true
	end
end

function LuaS_422865_Quest_Fail()

 	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do 
		local Player = GetSearchResult()
		if	CheckAcceptQuest( Player ,422865 ) == true	and
			CheckFlag( Player, 543477 )==false		and
			CheckFlag( Player, 543502 )==true		then
			ScriptMessage( Player , Player , 1 , "[SC_422865_23]" , 0 )		--(��D���F�l�ꥢ�ѡI)
			SetFlag(Player , 543502 , 0 )
			if	CountBodyItem( Player, 206390 )>0	then
				DelBodyItem ( Player , 206390 , CountBodyItem( Player, 206390 ) )
			end		
		end
	end
 	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )	
end

function LuaS_422865_Quest_Success()

 	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do 
		local Player = GetSearchResult()
		if	CheckAcceptQuest( Player ,422865 ) == true	and
			CheckFlag( Player, 543477 )==false		and
			CheckFlag( Player, 543502 )==true		then
			ScriptMessage( Player , Player , 1 , "[SC_422865_24]" , 0 )		--(��D���F�l�ꦨ�\�I)
			SetFlag(Player , 543502 , 0 )
			SetFlag(Player , 543477 , 1 )
			if	CountBodyItem( Player, 206390 )>0	then
				DelBodyItem ( Player , 206390 , CountBodyItem( Player, 206390 ) )
			end
			if	CountBodyItem( Player, 206387 )>0	then
				DelBodyItem ( Player , 206387 , CountBodyItem( Player, 206387 ) )
			end		
		end
	end
 	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )	
end








