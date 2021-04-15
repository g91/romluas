
--======================================================================================================
--423331
--======================================================================================================
function LuaS_423331_0()
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423331)== true ) 	and
			Checkflag(OwnerID(),544239)== false		then
			if	CountBodyItem( OwnerID(), 207467)>0	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_1]","LuaS_423331_1",0)
				--�A�n�A�Ц��U�o����C
			else
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[207467]:[SC_110497_5]", 0 )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[207467]:[SC_110497_5]", 0 )

			end
		end
end

function LuaS_423331_1()
	SetSpeakDetail(OwnerID(),"[SC_423331_2]")
	--�o�ӯ����ܡH�ڬݬ�.....���ȴX�ӿ����C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_3]","LuaS_423331_2",0)
	--�Юe�ڦV�A��ܡA�@�ؤ����q��ӨӪ��ɼ}���N......
end

function LuaS_423331_2()
	SetSpeakDetail(OwnerID(),"[SC_423331_4]")
	--�ܡI�S�O�@�ӨӥܷR���A�֩w�O����ӵL�᪺�H����Ӫ��³J�A�o���L�̤S�b������F�H�@�����N�޿�A�٬O�@������J�|�A�Ф��аڡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_5]","LuaS_423331_3",0)
	--�c......
end

function LuaS_423331_3()
	SetSpeakDetail(OwnerID(),"[SC_423331_6]")
	--�A���a�A�ڷ|�A�M����ӳå���ڳQ�L�̳o�د}�ꪱ���������ɶ��ӷl���������A�}�����A�ڥi�O�@�w���N�n�X�d�����q��̶i�X���j�ӤH�o�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_7]","LuaS_423331_4",0)
	--��p�A���Z�F�C
	end
	
function LuaS_423331_4()
	
	if (CheckAcceptQuest(OwnerID(),423331)== true ) 	then
		Setflag(OwnerID(),544239,1)
		DelBodyItem( OwnerID(),207467,1)
	end
	CloseSpeak(OwnerID())
end

------------��������������������������������������������--------------

function LuaS_115926_423331_1()		--���b�γժ���ܤ��U
	LoadQuestOption(OwnerID())

end


--======================================================================================================
--423333
--======================================================================================================

function LuaI_423333_accept()	--���b���U����423333����A���Ǵ����L���ȤS�d�ǩ��A�����W�����p�ɪ̡A�i���s�p��
	local QuestID = 423333
	local Q_flag = 544238
	local Q_buff = 506931
	if 	CheckAcceptQuest(TargetID(),QuestID)==true 	and
		Checkflag(TargetID(),Q_flag)== false		then
		if (CheckBuff(TargetID(), Q_buff) == true)	then
			Say(OwnerID(),"[SC_423333_0]")
			--�Q�n���s�}�l�D�ԶܡH�n�I
			Cancelbuff(TargetID(),Q_buff)
			Sleep(30)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423333_8]" , C_SYSTEM )	
			--SC_423333_8
			AddBuff( TargetID()  , Q_buff , 1 , 600 ) 
		else
			AddBuff( TargetID()  , Q_buff , 1 , 600) 
		end
	end
end

	
function LuaI_423333_check()	--���bnpc���U��115925����ܼ@�����U
	LoadQuestOption(OwnerID())
	local QuestID = 423333
	local Q_flag = 544238
	local Q_buff = 506931
		if 	(CheckAcceptQuest(OwnerID(),QuestID)== true ) 	and 
			(CheckFlag(OwnerID(), Q_flag )==false)			then 
			if	(Countbodyitem(OwnerID(),207475)>0	)		and
				(Countbodyitem(OwnerID(),207476)>0	)		then
				if	(CheckBuff( OwnerID(), Q_buff) == true)				then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_1]","LuaI_423333_speak_1",0)
					--�ڧ�ؼЪ����a�^�ӤF�C
				else
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_1]","LuaI_423333_speak_2",0)
				end
			else
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_95]","LuaI_423333_speak_5",0)
			end
		end
end

function LuaI_423333_speak_1()
	SetSpeakDetail(OwnerID(),"[SC_423333_2]")
	--�A���F���I����
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423028_4]","LuaI_423333_speak_3",0)
end

function LuaI_423333_speak_3()
	Setflag(OwnerID(),544238,1)
	CloseSpeak( OwnerID() )
end

function LuaI_423333_speak_2()
	SetSpeakDetail(OwnerID(),"[SC_423333_3]")
	--�T�ͿO�o���N���F�A�i���ڡA�ڪ��B�͡A�A�n�A�դ@���ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_4]","LuaI_423333_speak_4",0)
	--�n�A�����ڦA�դ@���C
end

function LuaI_423333_speak_4()
	if (CheckBuff( OwnerID(), 506931) == false)	then
		DelBodyItem( OwnerID(), 207475, 1 )
		DelBodyItem( OwnerID(), 207476, 1 )
		AddBuff( OwnerID()  , 506931 , 1 , 600 ) 
		GiveBodyItem( OwnerID() , 208067 , 1 )
		Say(TargetID(),"[SC_111368_5]")
		--�}�l�a�I
		ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_423333_8]" , C_SYSTEM )	
	else	
		Say(TargetID(),"[SC_423333_4]")
		--�O�o�٥��U�ɡA�A�٦��ɶ��A�İڡI�B�͡I
	end
	CloseSpeak( OwnerID() )
end

function LuaI_423333_speak_5()
	if 	(CheckBuff( OwnerID(), 506931) == true)	then
		SetSpeakDetail(OwnerID(),"[SC_423333_6]")
		--�B�͡A�A�S�����تi�Q�i���a�^�ӡC
	else
		SetSpeakDetail(OwnerID(),"[SC_423333_3]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_4]","LuaI_423333_speak_4",0)
	end
end
	
function LuaI_423333_Complete()
	CancelBuff( TargetID()  , 506931  )	
	if (CountBodyItem(TargetID(),208067))>0 then
		DelBodyItem(TargetID(),208067,1)
	end
end

function LuaI_423333_506932() --
	
	if CheckCompleteQuest(OwnerID(),423333)==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423333_7]" , C_SYSTEM )	
	
	end
end

------------��������������������������������������������--------------
function LuaI_s7_208067()	--����l

	Beginplot(TargetID(),"LuaI_s7_208067_1",0)
end

function LuaI_s7_208067_1()
	if	(CheckBuff( TargetID(), 506931)) == true	then
		CancelBuff( TargetID()  , 506931  )
	end

end

--======================================================================================================
--------------------------------------------------------������
--======================================================================================================

function LuaS_ModTalkToOtherxd()
	local Self_Dir = ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_APPLAUSE
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE


	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	end

	for i = 11 , 14 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	end
	while true do
		Local j = rand(14) + 1
		Motion = Speak[j]
		
		sleep(rand(20) +30)
		if Self_Dir  == ReadRoleValue(OwnerID(),EM_RoleValue_Dir) then
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) ~= 1 then
				PlayMotion( OwnerID(),Speak[j] )
			end
		else
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)  ~= 1 then
				SetDir( OwnerID(), Self_Dir)
				PlayMotion( OwnerID(),Speak[j])
			end
		end
	end
end


-----------------------------------------------------------�u�@Cat
Function LuaP_Gather_cat()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_GATHER_LOOP)		
end
