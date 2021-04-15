--------���J���Ĩ�H��
function LuaS_424371_GO()
	local Player = OwnerID()
	local Arc = TargetID()

	if	CheckAcceptQuest( Player , 424371 ) == TRUE	then
		AddSpeakOption( Player , Arc , "[SC_424371_GO]" , "LuaS_424371_GOGO" , 0 ) --�ڷǳƦn�F�A�W�a�I
	end
	LoadQuestOption(Player)
end

function LuaS_424371_GOGO()
	local Player = OwnerID()
	local Arc = TargetID()

		if	ReadRoleValue( Arc, EM_RoleValue_Register1 ) == 1 then
			FA_Busy("[118603]")
			return
		else
			WriteRoleValue( Arc, EM_RoleValue_Register1, 1 )
			AddBuff( Player , 620240 , 1 , -1 )
			CloseSpeak(Player)
			GiveBodyItem( Player , 209598 , 1)		--����A
			SetFlag(Player , 544995 , 1)			--���J���Ĩ�H�͡Aclient��flag
			say( Arc,"[SC_424371_GOGO]")			--�����ڴ��Ӧ�A......
			Callplot(Arc,"LuaS_424371_GOGOGO",Player)
		end
end

function LuaS_424371_GOGOGO(Player)
	local Arc = OwnerID()
	local NewArc = Lua_DW_CreateObj( "obj" , 118487 , Arc , 1 , 1 )

--	WriteRoleValue( NewArc , EM_RoleValue_IsWalk , 1)
	AddBuff( NewArc , 509257 , 60 , -1 )
	Sleep(20)
	say( NewArc,"[SC_424371_GOGOGO]")			--�n�A���N�İڡI�I

	DW_MoveToFlag( NewArc , 780949 , 7 , 0 , 1 )
	Sleep(10)

	say(NewArc,"[SC_424371_GOGOGOGO]" )		--�������A�A�ʧ@�ӺC�աI�I
	DW_MoveToFlag( NewArc , 780949 , 8 , 0 , 1 )
	DW_MoveToFlag( NewArc , 780949 , 9 , 0 , 1 )

	DelObj(NewArc)

	WriteRoleValue( Arc, EM_RoleValue_Register1, 0 )
	CancelBuff( Player , 620240)
end

----------���H���������Ȧ�
Function LuaS_424387_00()
	local Kante = OwnerID()
	local DialogTable = {	[1] = "[SC_424387_00]" ,
				[2] = "[SC_424387_01]" ,
				[3] = "[SC_424387_02]" ,
				[4] = "[SC_424387_03]" ,
				[5] = "[SC_424387_04]"	}
	local DialogID = Rand(5)+1

	PlayMotion( Kante , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	npcsay( Kante , DialogTable[DialogID] )
end

function LuaS_424387_02()
	local Kante = TargetID()
	local Player = OwnerID()

	AddBuff(Player , 620375 , 1, -1 )				--�t��buff
	CloseSpeak( Player )
	WriteRoleValue( Kante, EM_RoleValue_Register1, 1 )
	Sleep(10)
	CallPlot( Kante , "LuaS_424387_03" , Player )
end

function LuaS_424387_03( Player )
	local Kante = OwnerID()
	local Sherline
	local NewKante

	NewKante = Lua_DW_CreateObj( "obj" , 118841 , Kante , 1 , 1 )
	Sherline = Lua_DW_CreateObj( "flag" , 118843 , 780949 , 3 , 1 , 1 )
	DelFromPartition (Kante)

	ks_ActSetMode( NewKante )
	ks_ActSetMode( Sherline )
	AdjustFaceDir( NewKante , Sherline , 0 )

	DW_MoveToFlag( Sherline , 780949 , 4 , 0 , 1 )
	AdjustFaceDir( Sherline , NewKante , 0 )
	say( Sherline , "[SC_424387_05]" )
	PlayMotion( Sherline , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(20)

	say( NewKante , "[SC_424387_06]" )
	PlayMotion( NewKante , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(20)

	say( NewKante , "[SC_424387_07]" )
	PlayMotion( NewKante , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(40)

	say( Sherline , "[SC_424387_08]" )
	PlayMotion( Sherline , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(50)

	say( NewKante , "[SC_424387_09]" )
	PlayMotion( NewKante , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(40)

	say( Sherline , "[SC_424387_10]" )
	PlayMotion( Sherline , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(40)

	say( NewKante , "[SC_424387_11]" )
	Sleep(40)
	WriteRoleValue( Kante , EM_RoleValue_Register1 , 0 )

	say( Sherline , "[SC_424387_12]" )
	Sleep(20)
	DW_MoveToFlag( Sherline , 780949 , 3 , 0 , 1 )

	CancelBuff(Player , 620375 )			--�t��buff����
	SetFlag( Player , 545230 , 1 )
	AddToPartition(Kante,0)
	DelObj(Sherline)
	DelObj(NewKante)
end

function LuaS_424388_00()
	local Player = OwnerID()
	local Kante = TargetID()

	if	CheckAcceptQuest( Player , 424388 ) == TRUE then
		AddSpeakOption( Player , Kante , "[SC_424388_O_START_1]" , "LuaFA_424388_START" , 0 )	-- �����ժ��ܥû������|���D���G�A�X�o�a�I

	elseif	CheckAcceptQuest( Player , 424387 ) == true and
		CheckFlag( Player , 545230 ) == FALSE then

		if	ReadRoleValue( Kante, EM_RoleValue_Register1 ) == 1 then
			ScriptMessage ( Player , Player , 0 , "[SC_422804]" , 0 )
			ScriptMessage ( Player , Player , 1 , "[SC_422804]" , 0 )
			return
		else
			AddSpeakOption( Player, Kante, "[SC_424387_ANS]" , "LuaS_424387_02", 0 )	--�]���ڬO�~�Ӫ̡B���A�̻�D�����O���p
		end
	end

	LoadQuestOption( Player )
end



function LuaFA_424388_START()
	local Player = OwnerID()
	local Kante = TargetID()

	if	ReadRoleValue(Kante, EM_RoleValue_Register2) == 1 then
		SetSpeakDetail(Player, "[SC_424388_LOCKED_01]")				-- �A�ǳƦn�F�ܡH[����][����]���@�U�A�o�줯�S�b������ܡC
		AddSpeakOption(Player, Kante, "[SC_424388_O_START_2]", "LuaFA_424388_START_1", 0)	-- ���{�b�A�n�F�S�r�H
	else
		LuaFA_424388_OK( Player, Kante )
	end
end

function LuaFA_424388_START_1()
	local Player = OwnerID()
	local Kante = TargetID()

	if	ReadRoleValue(Kante, EM_RoleValue_Register2) == 1 then
		SetSpeakDetail(Player, "[SC_424388_LOCKED_02]")			-- �A�O���^��......[����][����]���@�U���A�o�H�٦b������ܰڡI
		AddSpeakOption(Player, Kante, "[SC_424388_O_START_2]", "LuaFA_424388_START_1", 0)	-- ���{�b�A�n�F�S�r�H
	else
		LuaFA_424388_OK( Player, Kante )
	end
end

function LuaFA_424388_OK( Player, Kante )
	WriteRoleValue(Kante, EM_RoleValue_Register1, 1)
	WriteRoleValue(Kante, EM_RoleValue_Register2, 1)
	SetSpeakDetail(Player, "[SC_424388_GO]")					-- �n�F�A�ڭ̪������s�D�h�a�I
	AddBuff(Player, 620196, 1, -1)							-- �}�l��t
	SetFlag( Player, 545233 , 0 )
	SetPosByFlag(Player, 780949, 6)
	AddBuff(Player ,506098,0,-1)							--FadeIn FadeOut
	CallPlot(Lua_DW_CreateObj( "flag", 118712, 780949, 4, 1, 1 ) , "LuaFA_424388_Chatter", Kante)
	CallPlot(Lua_DW_CreateObj( "flag", 118473, 780949, 11, 1, 1 ) , "LuaFA_424388_01", Player, Kante)
end

function LuaFA_424388_01(Player, OldKante)
	local Kante = OwnerID()
	local Bad = {	Lua_DW_CreateObj( "flag", 118846, 780949, 12, 1, 1 )	,
			Lua_DW_CreateObj( "flag", 118847, 780949, 13, 1, 1 )	}
	local Sherline = Lua_DW_CreateObj( "flag", 118844, 780949, 14, 1, 1 )

	WriteRoleValue( Kante, EM_RoleValue_Register3, Sherline )

--	for i = 1, 3	do
		SetRolecamp( Bad[1], "Visitor")
		SetRolecamp( Bad[2], "Visitor")
--	end

	Sleep(30)
	CancelBuff( Player, 506098 )		--FadeIn FadeOut
	AddBuff( Player, 503977, 0, 14 )	--�ĨĬ���


	AdjustFaceDir(Kante , Sherline , 0)
	AdjustFaceDir(Bad[1] , Kante , 0 )
	AdjustFaceDir(Bad[2] , Kante , 0 )

	Say(Kante, "[SC_424388_00]")		-- �ڭ̨�F......�x...���ܨ�H�I
	Sleep(20)
	
	Say(Bad[1], "[SC_424388_01]")		-- ��...�A�ݬݡA���̪��D���ӤF�C�o���k�H�~�M�ۤv�]�ӳo��s�ک�L�A�I
	Sleep(20)

	Say(Sherline, "[SC_424388_02]")		-- �֯S�I�O�ާڡA�ְk�r�I�I
	Sleep(20)

	Say(Kante, "[SC_424388_03]")		-- �O�ΧA��ż��I�o�I��}�o�I
	SetDefIdleMotion( Kante, ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep(20)

	Say(Bad[1], "[SC_424388_04]")		-- ���o�n�I
	PlayMotion( Bad[1], ruFUSION_ACTORSTATE_ATTACK_2H)
	Sleep(5)

	Say(Sherline, "[SC_424388_05]")		-- �ڡ��I�I
	SetDefIdleMotion( Sherline, ruFUSION_MIME_DEATH_LOOP )
	Sleep(5)

	Say(Kante, "[SC_424388_06]")		-- ���ܨ�I�I�I�I
	WriteRoleValue( Kante, EM_RoleValue_IsWalk, 0 )
	BeginPlot ( Kante, "LuaFA_424388_CryAndRun", 0 )
	Sleep(10)

	Say(Bad[1], "[SC_424388_07]")		-- ���I���U�ӴN���A�̤F�I
	Sleep(20)

	local Bad2 = {	Lua_DW_CreateObj( "flag", 105836, 780949, 12, 1, 1 )	,
			Lua_DW_CreateObj( "flag", 105769, 780949, 13, 1, 1 )	}

	DelObj(Bad[1])
	DelObj(Bad[2])
	CallPlot( Kante, "LuaFA_424388_02", Player, Bad2[1], Bad2[2], OldKante, Sherline)
	SetFlag( Player, 545233 , 1 )	--�}��
	CancelBuff( Player, 503977 )	--�ĨĬ���

	SetAttack( Bad2[1], Player )
	SetAttack( Bad2[2], Player )
	SysCastSpellLv( Bad[2], Player, 497928, 1) 


end

function LuaFA_424388_CryAndRun()
	local Kante = OwnerID()
	DW_MoveToFlag( Kante, 780949, 15, 0, 1)
	PlayMotionEX( Kante, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
end

function LuaFA_424388_02(Player, Bad1, Bad2, OldKante, Sherline)
	local Kante = OwnerID()
	local Done = false

	repeat
		Sleep(10)
		if  (CheckDistance( Player, Bad1, 300 ) == FALSE and CheckDistance( Player, Bad2, 300 ) == FALSE)
		or  CheckID( Player ) == FALSE or CheckAcceptQuest(Player, 424388 ) == FALSE then
			LuaFA_424388_End( Player, Bad1, Bad2, Kante, Sherline, OldKante)
			ScriptMessage ( Player , Player , 0 , "[SC_424388_FAILED]" , 0 )	-- �A�䤣��L�̤F......�Э��s�������ȡC
			ScriptMessage ( Player , Player , 1 , "[SC_424388_FAILED]" , 0 )
			return
		end

		if	ReadRoleValue (Bad1, EM_RoleValue_IsDead) == 1	and
			ReadRoleValue (Bad2, EM_RoleValue_IsDead) == 1	then
			Done = true 

		elseif	not CheckID(Bad1)	and
			not CheckID(Bad2)	then
			Done = true
		end

	until Done
	DelObj(Kante)
	DelObj(Sherline)

	CancelBuff(Player, 620196 )
	SetFlag( Player , 545232 , 1 )
	WriteRoleValue(OldKante, EM_RoleValue_Register1, 0)
end

function LuaFA_424388_End( Player, Bad1 , Bad2, Kante, Sherline, OldKante )
	CancelBuff(Player, 620196 )
	SetFlag(Player, 545233, 0)
	DelObj(Bad1)
	DelObj(Bad2)
	DelObj(Kante)
	DelObj(Sherline)
	WriteRoleValue(OldKante, EM_RoleValue_Register1, 0)
end

function LuaFA_424388_Chatter(Kante)
	local Chatter = OwnerID()
	DW_MoveToFlag(Chatter , 780949 , 5 , 0 , 1 )

	repeat
		Sleep(40)
		PlayMotion( Chatter,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	until ReadRoleValue(Kante, EM_RoleValue_Register1) == 0

	DW_MoveToFlag(Chatter , 780949 , 4 , 0 , 1 )
	DelObj(Chatter)
	WriteRoleValue(Kante, EM_RoleValue_Register2, 0)
end

function LuaFA_424388_Comp()						-- ���ȵ����@�����o��
	SetFlag( TargetID() , 545233, 0)
end