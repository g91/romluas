function thanksgiving_transport_talk()
	SetSpeakDetail( OwnerID(), "[SC_TRANSPOT_TALK_1]" )--�����F�I�����F�I�C����F�����`�N�æ��@�絰�I���Ȥ����`�������j�\�b�u�A�ݨD�j�q��³���A���L�B�e³�����H�⤣���A�_�I�̨C�ѥi�H�ӧڳo�̨�U�x��³��@���A�M��Ӥu�@���ĵ����@�w�����y�C
	if CheckFlag( OwnerID()  , 543463) ~= true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_2]" , "thanksgiving_transport_talk2", 0 ) --�ڷQ��U�x��³��
	end
end
function thanksgiving_transport_talk2()
	SetSpeakDetail( OwnerID(), "[SC_TRANSPOT_TALK_3]" )--�]���ɶ��ܻ��A�B�e³�󪺤H���i�H��گ��ήy�M�A[505068]�]�t100�H�A���λݭn3000�����F[505069]�]�t150�H�A���λݭn�@��[202903]�A�o��ذ��t�y�M���ܦn�ΡA�i�H�����A���Ĳv�A���O�n�`�N�@�I�A�N�O���t�b���U���y�M�n�`�N[505016]�A��[505016]��F��100�ɡA�Ӯy�M�|�X�{10�����u[505014]�v�����A�A�n�קK�����A�A�N�n�b���~���g�L�@��[113920]�A �u�n�q[113920]����g�L�N�i�H���C�ǳ\[505016]�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_4]" , "thanksgiving_transport_start", 0 ) --�ڭn��[505076]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_5]" , "thanksgiving_transport_start1", 0 ) --�ڷQ��[505068]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_6]" , "thanksgiving_transport_start2", 0 ) --�ڷQ��[505069]
end
function thanksgiving_transport_start()
	CloseSpeak(OwnerID())
	ClockClose(OwnerID())
	local Dis = GetDistance( OwnerID(), TargetID() )
	if Dis < 150 then
		BeginPlot(OwnerID(),"thanksgiving_transport_st_run",0)
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422810_1]",0)	--�Z���ӹL�����A�L�k�ϥΡC
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_422810_1]",0)	--�Z���ӹL�����A�L�k�ϥΡC
	end
end
function thanksgiving_transport_st_run()	
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end
	
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TRANSPOT_TALK_4_1]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--��ưe�X�����Ds
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				--�}�l�p��
				if CheckFlag( OwnerID()  , 543463) ~= true then
					--���o�B³buff
					AddBuff(OwnerID(),505015,0,-1)
					--�ŧi�ӤH�n���B�M�ŭӤH�n��
					if THANKSGIVEINGTRAN ==nil then
						THANKSGIVEINGTRAN = {}
					end
					THANKSGIVEINGTRAN[DBID] = {}
					THANKSGIVEINGTRAN[DBID][1]=0
					THANKSGIVEINGTRAN[DBID][2]=0
					THANKSGIVEINGTRAN[DBID][3]=0	--�����O�_��L���y
					--�}�l�p��
						AddBuff(OwnerID(),505076,0,1800)
						--AddBuff(OwnerID(), 505016,4,-1)
						SetFlag( OwnerID()  , 543463 , 1 )
						ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_Out_ending"  , "Lua_thanksgiving_ending" );--�ɶ��H���
					--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID][1])
					Debuglog(2 , "THANKSGIVEINGTRAN3 = "..THANKSGIVEINGTRAN[DBID][3])
				end

				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function thanksgiving_transport_start1()
	CloseSpeak(OwnerID())
	ClockClose(OwnerID())
	local Dis = GetDistance( OwnerID(), TargetID() )
	if Dis < 150 then
		BeginPlot(OwnerID(),"thanksgiving_transport_st1_run",0)
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422810_1]",0)	--�Z���ӹL�����A�L�k�ϥΡC
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_422810_1]",0)	--�Z���ӹL�����A�L�k�ϥΡC
	end
end
function thanksgiving_transport_st1_run()
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end

	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)	
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TRANSPOT_TALK_5_1]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--��ưe�X�����Ds
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				--�}�l�p��
				if CheckFlag( OwnerID()  , 543463) ~= true then
					--�ŧi�ӤH�n���B�M�ŭӤH�n��
					if THANKSGIVEINGTRAN ==nil then
						THANKSGIVEINGTRAN = {}
					end
					THANKSGIVEINGTRAN[DBID] = {}
					THANKSGIVEINGTRAN[DBID][1]=0
					THANKSGIVEINGTRAN[DBID][2]=0
					THANKSGIVEINGTRAN[DBID][3]=0--�����O�_��L���y
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money  ) >= 3000 then
		 				AddMoney( OwnerID() ,  EM_ActionType_PlotDestory , -3000 )
						--���o�B³buff�B��o�M�������ޯ�
						AddBuff(OwnerID(),505015,0,-1)
						AddBuff(OwnerID(),505068,0,1800)
						--AddBuff(OwnerID(), 505016,4,-1)
						SetFlag( OwnerID()  , 543463 , 1 )
						ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_Out_ending"  , "Lua_thanksgiving_ending" );--�ɶ��H���
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TALK_7]", C_SYSTEM ); --/*�ܩ�p�A�A�ǳƪ����B�����C
						--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID])
						Debuglog(2 , "THANKSGIVEINGTRAN3 = "..THANKSGIVEINGTRAN[DBID][3])
					else
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111454_20]", 0 ); --/*�ܩ�p�A�A�ǳƪ����B�����C
					end
				end
				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )	
			break
		end
	end

end

function thanksgiving_transport_start2()
	CloseSpeak(OwnerID())
	ClockClose(OwnerID())
	local Dis = GetDistance( OwnerID(), TargetID() )
	if Dis < 150 then
		BeginPlot(OwnerID(),"thanksgiving_transport_st2_run",0)
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422810_1]",0)	--�Z���ӹL�����A�L�k�ϥΡC
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_422810_1]",0)	--�Z���ӹL�����A�L�k�ϥΡC
	end
end

function thanksgiving_transport_st2_run()
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end

	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TRANSPOT_TALK_6_1]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--��ưe�X�����D
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				--�}�l�p��
				if CheckFlag( OwnerID()  , 543463) ~= true then
					--�ŧi�ӤH�n���B�M�ŭӤH�n��
					if THANKSGIVEINGTRAN ==nil then
						THANKSGIVEINGTRAN = {}
					end
					THANKSGIVEINGTRAN[DBID] = {}
					THANKSGIVEINGTRAN[DBID][1]=0
					THANKSGIVEINGTRAN[DBID][2]=0
					THANKSGIVEINGTRAN[DBID][3]=0--�����O�_��L���y
					if CountBodyItem(OwnerID(),202903) >= 1 then
						DelBodyItem(OwnerID(),202903,1)
						--���o�B³buff�B��o�M�������ޯ�
						AddBuff(OwnerID(),505015,0,-1)
						AddBuff(OwnerID(),505069,0,1800)
						--GiveBodyItem(OwnerID(),206319,1)
						SetFlag( OwnerID()  , 543463 , 1 )
						ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_Out_ending"  , "Lua_thanksgiving_ending" );--�ɶ��H���
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TALK_7]", C_SYSTEM ); --/*�ܩ�p�A�A�ǳƪ����B�����C
						--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID][1])
						Debuglog(2 , "THANKSGIVEINGTRAN3 = "..THANKSGIVEINGTRAN[DBID][3])
					else
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112502_NO]", 0 ); --/*�A���������~�ƶq������I
					end
				end
				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function Lua_thanksgiving_ending()
	ClockClose(OwnerID())
	CancelBuff(OwnerID(),505016)
	CancelBuff(OwnerID(),505076)
	CancelBuff(OwnerID(),505068)
	CancelBuff(OwnerID(),505069)
	CancelBuff(OwnerID(),505017)
	CancelBuff(OwnerID(),505018)
	CancelBuff(OwnerID(),505019)
	thanksgiving_transport_finish()
	--BeginPlot(OwnerID(),"thanksgiving_transport_finish",0)
end
function Lua_thanksgiving_OutGame()
	CancelBuff_NoEvent(OwnerID(),505015)
	CancelBuff(OwnerID(),505016)
	CancelBuff(OwnerID(),505076)
	ClockClose(OwnerID())
end
function thanksgiving_transport_finish()
	CancelBuff_NoEvent(OwnerID(),505015)
	--�������
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	local Score = THANKSGIVEINGTRAN[DBID][1]
	local ticketID = 206266
	local Gife = {2,3,4,5}
	--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID])[1]
	--�������y
	if Score <= 30 then
		GiveBodyItem(OwnerID(),ticketID,Gife[1])
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[1].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[1].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
	elseif Score <= 50 then
		GiveBodyItem(OwnerID(),ticketID,Gife[2])
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[2].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[2].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
	elseif Score <= 99 then
		GiveBodyItem(OwnerID(),ticketID,Gife[3])
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[3].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[3].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
	elseif Score >= 100 then
		GiveBodyItem(OwnerID(),ticketID,Gife[4])
		GiveBodyItem(OwnerID(),206308,1)
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[4].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[4].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*�ɶ���A������U³��x���A�A���n����[$VAR1]�A�i�H��o[$VAR2]��[$VAR3]
	end
	Debuglog(2 , "Write THANKSGIVEINGTRAN3 to 1 #######################")
	THANKSGIVEINGTRAN[DBID][1] = 0
	THANKSGIVEINGTRAN[DBID][2] = 1
	THANKSGIVEINGTRAN[DBID][3] = 1
end
function Luatg_transport_take_range()
	--Say(OwnerID(),"CheckBuff...")
	--�ˬd�O�_���B³buff�B�B�|�����o³��
	local NPCID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local BuffOK = 0
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		--Say(OwnerID(),"BuffID = "..BuffID)
		if BuffID == 505015 then
			BuffOK = BuffOK + 1
			--Say(OwnerID(),"BuffID = "..BuffID.." BuffOk = "..BuffOk)
		end
		if BuffID == 505017 or BuffID == 505018 or BuffID == 505019 then
			BuffOK = BuffOK + 1
			--Say(OwnerID(),"BuffID = "..BuffID.." BuffOk = "..BuffOk)
		end
	end
	--Say(OwnerID(),"BuffOk = "..BuffOk)
	if BuffOk == 1 then
		--�ʧ@���Y³��
		--Say(OwnerID(),"Casting")
		CastSpell(TargetID(),OwnerID(),494454)
		--���o³��
		if  NPCID == 113766 then
			--505017
			AddBuff(OwnerID(), 505017,0,-1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_GETFOOD]", C_SYSTEM ); --/*�A���o�F�@�U³��
		elseif  NPCID == 113767 then
			--505018
			AddBuff(OwnerID(), 505018,0,-1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_GETFOOD]", C_SYSTEM ); --/*�A���o�F�@�U³��
		elseif  NPCID == 113768 then
			--505019
			AddBuff(OwnerID(), 505019,0,-1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_GETFOOD]", C_SYSTEM ); --/*�A���o�F�@�U³��
		else
			--Say(OwnerID(),"NoBuff")
		end
	elseif BuffOk >= 2 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TAKE_ALREADY]", C_SYSTEM ); --/*�A�w�g��a�F�@��³��
	end
end
function Luatg_transport_back_range()
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID][2])
	if THANKSGIVEINGTRAN ~= nil then
		if THANKSGIVEINGTRAN[DBID] ~= nil then
			if THANKSGIVEINGTRAN[DBID][2] == 0 then
				local BuffKind = 0
				--�ˬd�O�_���o³��
				local BuffType = 0
				local Count = BuffCount ( OwnerID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
					if BuffID == 505015 then
						BuffKind = BuffKind + 1
					elseif BuffID == 505017 then
						--���^³��
						--Say(OwnerID(),"Casting..17")
						CastSpell(OwnerID(),TargetID(),494454)
						CancelBuff(OwnerID(),505017)
						--�W�[�n��
						local Score = 2
						BuffKind = BuffKind + 1
						THANKSGIVEINGTRAN[DBID][1] = THANKSGIVEINGTRAN[DBID][1] + Score
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505017]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*�A�e�^�F[$VAR1]�A�n������[$VAR2]�A�A�{�b���n���O[$VAR3]
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505017]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*�A�e�^�F[$VAR1]�A�n������[$VAR2]�A�A�{�b���n���O[$VAR3]
					elseif BuffID == 505018 then
						--���^³��
						--Say(OwnerID(),"Casting..18")
						CastSpell(OwnerID(),TargetID(),494454)
						CancelBuff(OwnerID(),505018)
						--�W�[�n��
						local Score = 5
						BuffKind = BuffKind + 1
						THANKSGIVEINGTRAN[DBID][1] = THANKSGIVEINGTRAN[DBID][1] + Score
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505018]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*�A�e�^�F[$VAR1]�A�n������[$VAR2]�A�A�{�b���n���O[$VAR3]
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505018]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*�A�e�^�F[$VAR1]�A�n������[$VAR2]�A�A�{�b���n���O[$VAR3]
					elseif BuffID == 505019 then		
						--���^³��
						--Say(OwnerID(),"Casting..19")
						CastSpell(OwnerID(),TargetID(),494454)
						CancelBuff(OwnerID(),505019)
						--�W�[�n��
						local Score = 10
						BuffKind = BuffKind + 1
						THANKSGIVEINGTRAN[DBID][1] = THANKSGIVEINGTRAN[DBID][1] + Score
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505019]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*�A�e�^�F[$VAR1]�A�n������[$VAR2]�A�A�{�b���n���O[$VAR3]
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505019]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*�A�e�^�F[$VAR1]�A�n������[$VAR2]�A�A�{�b���n���O[$VAR3]
					end
				end
				if BuffKind == 1 then
					ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_HERRYUP]", C_SYSTEM ); --/*�ⴤ�ɶ��A���֥h��U�A�����S����
				end
			end
		end
	end
end
function Luatg_transport_eat_range()
	--Say(OwnerID(),"drinking")
	--�ˬd�O�_���h�ҫ�buff�B��֯h�ҫ�
	local BuffOK = 0
	local BuffType = 0
	local BuffClear = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505016 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if (BuffLv-30) >= 4 then
				CancelBuff(OwnerID(),BuffID)
				AddBuff(OwnerID(), BuffID,(BuffLv-30),-1)
				BuffClear = BuffClear +1
				break
			else 
				CancelBuff(OwnerID(),BuffID)
				AddBuff(OwnerID(), BuffID,4,-1)
				BuffClear = BuffClear +1
				break
			end
		end
	end
	if BuffClear > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_EATING]", 0 ); --/*�A���y�M�h�ҫפU���F�\�h
	end
end
function Luatg_transport_take()
	AddBuff(OwnerID(),503217,0,-1)
	SetPlot(OwnerID(),"Range","Luatg_transport_take_range",150)
end
function Luatg_transport_back()
	AddBuff(OwnerID(),503217,0,-1)
	SetPlot(OwnerID(),"Range","Luatg_transport_back_range",150)
end
function Luatg_transport_eat()
	SetPlot(OwnerID(),"Range","Luatg_transport_eat_range",70)
end
function thanksgiving_CheckBuff()
	AddBuff(OwnerID(), 505016,4,-1)
end
function thanksgiving_AddBuff()
	local BuffType = 0
	local BuffAdd = 0
	local BuffRide = 0
	local BuffNoRide = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		--Say(OwnerID(),"BuffID = "..BuffID)
		if BuffID == 505016 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv >= 99 then
				CancelBuff(OwnerID(),BuffID)
				AddBuff(OwnerID(), 505014,0,10)
				AddBuff(OwnerID(), 505016,4,-1)
			else
				AddBuff(OwnerID(), 505016,4,-1)
			end
			BuffAdd = BuffAdd +1
		elseif BuffID == 505015 then
			BuffRide = BuffRide +1
		elseif BuffID == 505068 or BuffID == 505076 then
			BuffNoRide = BuffNoRide + 1
		end
	end
	--Say(OwnerID(),"BuffAdd = "..BuffAdd)
	if BuffAdd == 0 then
		AddBuff(OwnerID(), 505016,4,-1)
	end
	if BuffNoRide == 0 then
		CancelBuff(OwnerID(),505016)
	end
	if BuffRide == 0 then
		CancelBuff(OwnerID(),505076)
		CancelBuff(OwnerID(),505017)
		CancelBuff(OwnerID(),505018)
		CancelBuff(OwnerID(),505019)
	end
end

function Lua_thanksgiving_Out_ending()
	ClockClose(OwnerID())
	CancelBuff(OwnerID(),505016)
	CancelBuff(OwnerID(),505076)
	CancelBuff(OwnerID(),505068)
	CancelBuff(OwnerID(),505069)
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
--	Say(OwnerID(),"Buff Gone,ZoneID = "..ZoneID)
	Debuglog(2 , " OUT END ZoneID = "..ZoneID)
--	if THANKSGIVEINGTRAN[DBID][3] == 0 then	--�S��L
		if ZoneID == 2 then
		--	local BuffOK = 0
		--	local Count = BuffCount ( OwnerID())
		--	for i = 0 , Count do
		--		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
				--Say(OwnerID(),"BuffID = "..BuffID)
		--		if BuffID == 505015 then
		--			BuffOK = BuffOK + 1
		--			Debuglog(2 , "BuffID = "..BuffID.." BuffOk = "..BuffOk)
					--Say(OwnerID(),"BuffID = "..BuffID.." BuffOk = "..BuffOk)
		--		end
		--	end
		--	if BuffOK == 0 then
				Debuglog(2 , "Buff is Gone !!!!!!!!!!!!!!!!!!!!!!")
				CancelBuff(OwnerID(),505016)
				CancelBuff(OwnerID(),505076)
				CancelBuff(OwnerID(),505017)
				CancelBuff(OwnerID(),505018)
				CancelBuff(OwnerID(),505019)
				CancelBuff(OwnerID(),505015)
				GiveBodyItem(OwnerID(),206266,1)
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_OUTGAMEGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*�A�b���ʶi�椤���}�C���A���ȥ��ѡA�ȱo��1��[$VAR1]
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_OUTGAMEGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*�A�b���ʶi�椤���}�C���A���ȥ��ѡA�ȱo��1��[$VAR1]
		--	end
			Debuglog(2 , "Write THANKSGIVEINGTRAN3 to 1 #######################")
			THANKSGIVEINGTRAN[DBID][1] = 0
			THANKSGIVEINGTRAN[DBID][2] = 1
			THANKSGIVEINGTRAN[DBID][3] = 1
		else
			Debuglog(2 , "Buff is Gone and Wrong Zone!!!!!!!!!!!!!!!!!!!!!!")
			ClockClose(OwnerID())
			CancelBuff(OwnerID(),505016)
			CancelBuff(OwnerID(),505076)
			CancelBuff(OwnerID(),505017)
			CancelBuff(OwnerID(),505018)
			CancelBuff(OwnerID(),505019)
			CancelBuff(OwnerID(),505015)
			GiveBodyItem(OwnerID(),206266,1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_OUTGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*�A�b���ʶi�椤���}�F�ȴ餧���A���ȥ��ѡA�ȱo��1��[$VAR1]
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_OUTGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*�A�b���ʶi�椤���}�F�ȴ餧���A���ȥ��ѡA�ȱo��1��[$VAR1]
		end
--	end
end