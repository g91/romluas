
function LuaS_423271_115544()
	LoadQuestOption( OwnerID() )	
	if 	(CheckAcceptQuest(OwnerID(),423271)==true )and( CheckCompleteQuest( OwnerID(),423271)==false) then
		if	(CheckFlag( OwnerID(),543764)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_1]","LuaS_423271_1",0)	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_2]","LuaS_423271_2",0)		
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_3]","LuaS_423271_3",0)	
		end
	end
	
	if 	(CheckAcceptQuest(OwnerID(),423271)==true )and( CheckCompleteQuest( OwnerID(),423271)==false) then
		if	(CheckFlag( OwnerID(),543764)==true)		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_9]","LuaS_423271_4",0)	
		end
	end
end

function LuaS_423271_1()
	SetSpeakDetail(OwnerID(),"[SC_423271_4]")				
	SetFlag( OwnerID() , 543764 , 1 )						--���X��
end

function LuaS_423271_2()
	SetSpeakDetail(OwnerID(),"[SC_423271_5]")				
	SetFlag( OwnerID() , 543764 , 1 )						--���X��
end

function LuaS_423271_3()
	SetSpeakDetail(OwnerID(),"[SC_423271_6]")				
	SetFlag( OwnerID() , 543764 , 1 )						--���X��
end

function LuaS_423271_4()
	SetSpeakDetail(OwnerID(),"[SC_423271_7]")		
end

function LuaS_423271_115541()
	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),423271)==true )and( CheckCompleteQuest( OwnerID(),423271)==false) then
		if	(CheckFlag( OwnerID(),543764)==true)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_10]","LuaS_423271_115541_1",0)	
		end
	end
end

function LuaS_423271_115541_1()
	SetSpeakDetail(OwnerID(),"[SC_423271_8]")
	SetFlag( OwnerID() , 544031, 1 )						--���ݤ����X��

end
-------------------------------------------------------------------

--function LuaS_423274_1()	
--	LoadQuestOption( OwnerID() )
--	if 	(CheckAcceptQuest(OwnerID(),423274)==true )and( CheckCompleteQuest( OwnerID(),423274)==false) then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_1]","LuaS_423274_2",0)	
--	end
--end

function LuaS_423274_2()
	SetSpeakDetail(OwnerID(),"[SC_423274_2]")					
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_3]","LuaS_423274_3",0)	
end

function LuaS_423274_3()
	SetSpeakDetail(OwnerID(),"[SC_423274_4]")				--
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_5]","LuaS_423274_4",0)	--
end

function LuaS_423274_4()
	SetSpeakDetail(OwnerID(),"[SC_423274_6]")				--
	SetFlag( OwnerID() , 543910 , 1 )					--���X��
end

------------------------------------------------------------------

function LuaS_423272_115543()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423272)==true )and( CheckCompleteQuest( OwnerID(),423272)==false) 	then
		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423272_0]","LuaS_423272_2",0) 		
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423272_0]","LuaS_423272_1",0) 
		end	
	end
	if 	(CheckAcceptQuest(OwnerID(),423274)==true )and( CheckCompleteQuest( OwnerID(),423274)==false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_1]","LuaS_423274_2",0)	
	end

	if	(CheckAcceptQuest(OwnerID(),423275)==true )and( CheckCompleteQuest( OwnerID(),423275)==false) and	CheckFlag(OwnerID() , 544040) == false 	then
		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_2",0) 		
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_1",0) 
		end	
	end
end


function LuaS_423272_1()
	SetSpeakDetail(OwnerID(),"[SC_423272_1]")
end


function LuaS_423272_2()
	closespeak(OwnerID())
	WriteRoleValue(TargetID() , EM_RoleValue_Register , 2 )
	BeginPlot(TargetID(), "LuaS_423272_3" , 0 )
end

function LuaS_423272_3()
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423272) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 543765, 1 )							
			AddBuff(Party[i] , 506804, 100 , -1 )  						
		end
	end
	local OBALI = LuaFunc_CreateObjByOBj(115545, OwnerID() )			--�X�{�t���������Q
	DisableQuest(OBALI,true )
	WriteRoleValue(OBALI, EM_RoleValue_Register+1, OwnerID() )
	WriteRoleValue(OBALI, EM_RoleValue_Register+3, TargetID() )

	BeginPlot(OBALI, "LuaS_423272_Range_CHECK" , 0 )			
	BeginPlot(OBALI, "LuaS_423272_4" , 0 )
end

function LuaS_423272_4()
--OwnerID�O115545
	local playerTarget = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local Party = {}
	local Party = LuaFunc_PartyData(playerTarget )

	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local QQMO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115542, 400 )		--�]�j�M���W�������ԡ^
	local MO = LuaFunc_CreateObjByOBj(115559, QQMO)				--�X�{�t����������
	DisableQuest(MO,true )
	WriteRoleValue (MO, EM_RoleValue_Register+1, OwnerID() )

	BeginPlot(MO, "LuaS_423272_MO_CHECK" , 0 )				
	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled(MO, false )

	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423272) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			Tell(Party[i],QQOBALI,"[SC_423272_2]")
			sleep(20)
			Tell(Party[i],QQOBALI,"[SC_423272_3]")	
			sleep(20)
		end
	end

	AdjustFaceDir(MO, QQOBALI, 0 )
	sleep(10)
	Yell(MO, "[SC_423272_4]" , 3 ) 				--���f���K�A���N��O�H
	AdjustFaceDir(QQOBALI, MO, 0 )
	sleep(20)
	Yell(OwnerID(), "[SC_423272_5]" , 3 ) 				--�K�u����ù�Y.�Ǻ��j�H�w�g���F�C
	sleep(20)
	Yell(MO, "[SC_423272_6]" , 3 ) 				--���f���A�A�b�}�����H
	sleep(30)
	Yell(OwnerID(), "[SC_423272_7]" , 3 ) 				--�ַݡK�бz�N�R
	sleep(20)
	Yell(MO, "[SC_423272_8]" , 3 ) 				--�K�ک��աK�߷R��{
	sleep(20)
	Yell(MO, "[SC_423272_9]" , 3 ) 				--�p�G�L���o��h����
	sleep(30)
	Yell(OwnerID(), "[SC_423272_10]" , 3 ) 			--�ַݡK�ڤF�ѱz���ө�
	sleep(30)
	Yell(OwnerID(), "[SC_423272_11]" , 3 )	 		--�бz�����ݤU
	sleep(30)
	BeginPlot( OwnerID() , "LuaS_423272_Finish" , 0 )
	sleep(10)
	Delobj( MO )
	writerolevalue(QQOBALI , EM_RoleValue_Register, 0 )
	Delobj( OwnerID() )
end


function LuaS_423272_Range_CHECK()
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 250)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423272) == true	and
				CheckFlag( Group[i] , 543765) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QQOBALI, EM_RoleValue_Register, 0 )
	Delobj( OwnerID() )
end

function LuaS_423272_Player_CHECK()	--BUFF
	if	(CheckAcceptQuest(OwnerID(),423272)==false )	then
		if 	CheckBuff( OwnerID(), 506804) == true	then
			CancelBuff( OwnerID() , 506804)  
		end
		return false
	end

	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115545	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423272_Player_CHECK_FINAL()	--BUFF
	CancelBuff( OwnerID() , 506804)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 543765, 0 )
end

function LuaS_423272_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 250)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423272) == true	and
			CheckFlag( Gp[i] , 543765) == true		then
			SetFlag(Gp[i] , 543994, 1 )
			CancelBuff( Gp[i] , 506804)
		end
	end
end

function LuaS_423272_MO_CHECK()	
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	for i = 0 , 100 , 1 do
		if	CheckID(QQOBALI) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

------------------------------------------------------------------

--function LuaS_423275_115543()
--	LoadQuestOption( OwnerID() )
--	if	(CheckAcceptQuest(OwnerID(),423275)==true )and( CheckCompleteQuest( OwnerID(),423275)==false) 	then
--		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) == 0)	 then
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_2",0) 		
--		else
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_1",0) 
--		end	
--	end
--end


function LuaS_423275_1()
	SetSpeakDetail(OwnerID(),"[SC_423275_1]")
end


function LuaS_423275_2()
	closespeak(OwnerID())
	WriteRoleValue(TargetID() , EM_RoleValue_Register+8 , 2 )
	BeginPlot(TargetID(), "LuaS_423275_3" , 0 )
end

function LuaS_423275_3()
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423275) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 543995, 1 )							
			AddBuff(Party[i] , 506847, 100 , -1 )  						
		end
	end
	local OBALI = LuaFunc_CreateObjByOBj(115566, OwnerID() )			--�X�{�t���������Q
	DisableQuest(OBALI,true )
	WriteRoleValue(OBALI, EM_RoleValue_Register+1, OwnerID() )
	WriteRoleValue(OBALI, EM_RoleValue_Register+2, TargetID() )
	BeginPlot(OBALI, "LuaS_423275_Range_CHECK" , 0 )			
	BeginPlot(OBALI, "LuaS_423275_4" , 0 )
end

function LuaS_423275_4()
--OwnerID�OOBALI 115566
	local playerTarget= ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Party = {}
	local Party = LuaFunc_PartyData(playerTarget)

	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local QQMO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115542, 400 )		--�]�j�M���W�������ԡ^
	local MO = LuaFunc_CreateObjByOBj(115567, QQMO)				--�X�{�t����������
	DisableQuest(MO,true )
	WriteRoleValue (MO, EM_RoleValue_Register+1, OwnerID() )

	BeginPlot(MO, "LuaS_423275_MO_CHECK" , 0 )				
	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled(MO, false )

	sleep(10)
	AdjustFaceDir(QQOBALI, MO, 0 )
	Yell(OwnerID(), "[SC_423275_2]" , 3 ) 					--�ַݡK
	sleep(20)
	AdjustFaceDir(MO, QQOBALI, 0 )
	Yell(MO, "[SC_423275_3]" , 3 ) 					--��~�A�A��[$playername]������
	sleep(20)
	Yell(OwnerID(), "[SC_423275_4]" , 3 ) 					--���K�ַݡA�ݤU�ܰ���
	sleep(20)
	Yell(MO, "[SC_423275_5]" , 3 ) 					--�U�O�B���ڪ��H���O�L
	sleep(30)
	Yell(OwnerID(), "[SC_423275_6]" , 3 ) 					--�z�ٰO�o���e
	sleep(40)
	Yell(OwnerID(), "[SC_423275_7]" , 3 ) 					--��ɪ��j�H�~����
	sleep(40)
	Yell(MO, "[SC_423275_8]" , 3 ) 					--���f���K
	sleep(20)
	Yell(OwnerID(), "[SC_423275_9]" , 3 ) 					--�z���O�i�l�A
	sleep(20)
	Yell(MO, "[SC_423275_10]" , 3 ) 					--�L�q�Ӥ����K
	sleep(20)
	Yell(OwnerID(), "[SC_423275_11]" , 3 )	 			--�j�H�P��Ү��A
	sleep(30)
	Yell(MO, "[SC_423275_12]" , 3 ) 					--�K�L�l�׬O�ڪ����ˡC
	sleep(20)
	Yell(OwnerID(), "[SC_423275_13]" , 3 ) 				--�z�K�����ܡH
	sleep(20)
	PlayMotion( MO,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell(MO, "[SC_423275_14]" , 3 ) 					--�۳B�����X�~�گ�P��
	sleep(30)
	Yell(OwnerID(), "[SC_423275_15]" , 3 )	 			--�K���¡A�j�H�@�w�|�ܰ����A
	sleep(30)
	Yell(OwnerID(), "[SC_423275_16]" , 3 )	 			--���F�j�H�A�бz�n�n���U�ۤv
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(30)
	Yell(MO, "[SC_423275_17]" , 3 ) 					--���f���A�O�E�ʡA�A������K
	sleep(20)
	Yell(OwnerID(), "[SC_423275_18]" , 3 )	 			--���n��K�S�ƤF
	sleep(40)
	Yell(OwnerID(), "[SC_423275_19]" , 3 )	 			--�Ǻ��@�ڪ��^�����
	sleep(30)
	Yell(OwnerID(), "[SC_423275_20]" , 3 )	 			--�A���F�K������	
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DEAD)
--sleep(20)
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423275) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			ScriptMessage(Party[i]  , Party[i]  , 2 , "[SC_423275_21]" , 0 )	--���f���D���Q�w�w���U�L�O����
			ScriptMessage( Party[i]  , Party[i] , 0 , "[SC_423275_21]" , 0 )
			sleep(20)
		end
	end
	BeginPlot( OwnerID() , "LuaS_423275_Finish" , 0 )
	sleep(20)
	Delobj( MO )
	writerolevalue(QQOBALI, EM_RoleValue_Register+8, 0 )
	Delobj( OwnerID() )
end


function LuaS_423275_Range_CHECK()
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 250)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423275) == true	and
				CheckFlag( Group[i] , 543995) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QQOBALI, EM_RoleValue_Register+8, 0 )
	Delobj( OwnerID() )
end

function LuaS_423275_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423275)==false )	then
		if 	CheckBuff( OwnerID(), 506847) == true	then
			CancelBuff( OwnerID() , 506847)  
		end
		return false
	end
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115566	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423275_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506847)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 543995, 0 )
end

function LuaS_423275_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 250)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423275) == true	and
			CheckFlag( Gp[i] , 543995) == true		then
			SetFlag(Gp[i] , 544040, 1 )
			CancelBuff( Gp[i] , 506847)
		end
	end
end

function LuaS_423275_MO_CHECK()	
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	for i = 0 , 100 , 1 do
		if	CheckID(QQOBALI) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

------------------------------------------------------------------

function LuaS_115569_99()	--���f���D���Q����l�@��
	LuaP_DW_Dead()
	--LuaP_Crouch()
	--LuaP_Crafting()
	--LuaP_Sitting()
end



function LuaS_423276_0()	
	LoadQuestOption( OwnerID() )	--OwnerID�O���a�BTargetID�O115542
	if (CheckAcceptQuest(OwnerID(),423276)==true )and( CheckCompleteQuest( OwnerID(),423276)==false) and	CheckFlag( OwnerID() , 544041) ==false	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423276_0]","LuaS_423276_2",0) --�ڨӵI�ƥL������a�C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423276_0]","LuaS_423276_1",0) --�ڨӵI�ƥL������a�C
		end	
	end
end

function LuaS_423276_1()
	SetSpeakDetail(OwnerID(),"[SC_423276_1]")	--���ڦA�h�ݥL�X���K�L���ڪ��a�ڨ��F�\�h�i���K
end

function LuaS_423276_2()
--	say(TargetID(),"333")	--������
--	say(OwnerID(),"365")	--���a
	closespeak(OwnerID())
	WriteRoleValue(TargetID() , EM_RoleValue_Register+5 , 2 )
	BeginPlot(TargetID(), "LuaS_423276_4" , 0 )
end

function LuaS_423276_4()
--OwnerID�O������115542
	BeginPlot(OwnerID(), "LuaS_423276_Range_CHECK" , 0 )	
	local OBALI= LuaFunc_SearchNPCbyOrgID( OwnerID() , 115569, 300)		--�]�j�M���W������^
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423276) == true		and
			GetDistance(Party[i] , OwnerID() ) < 300			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 544042, 1 )		
			GiveBodyItem(Party[i], 207349, 1 )			--����					
			AddBuff(Party[i] , 506910, 100 , -1 )  			--�t���ˬd��
			AddBuff(Party[i] , 506886, 100 , 30 )  			--��ܧi�����a��(30���n���)	
		end
	end

	local Time = 0
	for k = 1, 35 , 1 do							--�ɶ���N�^�_�쪬
		Time = Time + 1
			if	Time>30		then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 0 )
				local Party = LuaFunc_PartyData(TargetID())
				for i = 1 , Party[0] , 1 do
					if 	CheckBuff( Party[i], 506910 ) == true then	
						CancelBuff( Party[i] , 506886)  
						CancelBuff( Party[i] , 506910)
						DelBodyItem(Party[i], 207349, 1 )
						SetFlag(Party[i] , 544042, 0 )
						ScriptMessage(Party[i]  , Party[i] , 2 , "[SC_423276_5]" , 0 )--�ɶ��W�L�A���ȥ��ѡI
						ScriptMessage(Party[i]  , Party[i] , 0 , "[SC_423276_5]" , 0 )--�ɶ��W�L�A���ȥ��ѡI
					end
				end	
				break							
			end
			if 	(ReadRoleValue( OBALI , EM_RoleValue_Register+1 ) == 2) 	then
				for i = 1 , Party[0] , 1 do
					if 	CheckBuff( Party[i], 506910 ) == true	then	
						SetFlag(Party[i] , 544043, 1 )	
					end
				end		
				BeginPlot(OBALI , "LuaS_423276_5" , 0 )	
				break		
			end
		sleep(10)
	end	
end

function LuaS_423276_5()
--OBALI �OOwnerID	
	sleep(5)
	local QQMO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115542, 300 )		--�]�j�M���W�������ԡ^
	local MO = LuaFunc_CreateObjByOBj(115568, QQMO)				--�X�{�t����������
	MoveToFlagEnabled(MO , false )
	DisableQuest(MO,true )
--	WriteRoleValue(MO , EM_RoleValue_Register+1, QQMO )
	--BeginPlot(MO , "LuaS_423276_Range_CHECK" , 0 )	
	PlayMotionEX(MO,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)	
	Yell(MO, "[SC_423276_2]" , 3 ) 				--�����Q�K�A���ڪ��a�ڰ^�m�X�@�͡K
	sleep(30)
	Yell(MO, "[SC_423276_3]" , 3 ) 				--���ɧ�i���묹���|�նO�K
	sleep(20)
	Yell(MO, "[SC_423276_4]" , 3 ) 				--�ڷ|�O��A���i�|�A����K���ĤH�I�X�N���I
	sleep(50)
	BeginPlot( OwnerID(), "LuaS_423276_Finish" , 0 )
	PlayMotion( MO , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(40)
	Delobj( MO )
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1, 0 )
	writerolevalue(QQMO , EM_RoleValue_Register+5, 0 )
End

function LuaS_423276_Range_CHECK()
--OwnerID�O������115542
--	local QQMO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 300)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423276) == true	and
				CheckFlag( Group[i] , 544042) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(OwnerID(), EM_RoleValue_Register+5, 0 )
end

function LuaS_423276_Player_CHECK()	--BUFF
--OwnerID�OPLAYER
	if	(CheckAcceptQuest(OwnerID(),423276)==false )	then
		if 	CheckBuff( OwnerID(), 506910 ) == true	then
			CancelBuff( OwnerID() , 506910 )  
		end
		if 	CheckBuff( OwnerID(), 506886) == true	then
			CancelBuff( OwnerID() , 506886)  
		end
		SetFlag(OwnerID(), 544043,0 )	
		SetFlag(OwnerID(), 544042,0 )
		return false
	end

	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 300)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115569	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423276_Player_CHECK_FINAL()	--BUFF
	CancelBuff( OwnerID() , 506910)
	CancelBuff( OwnerID()  , 506886) 
	DelBodyItem(OwnerID(), 207349, 1 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544042, 0 )
	SetFlag(OwnerID(), 544043, 0 )
end

function LuaS_423276_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 300)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423276) == true	and
			CheckFlag( Gp[i] , 544042) == true		then
			SetFlag(Gp[i] , 544041, 1 )
			SetFlag(Gp[i] , 544042, 1 )
			SetFlag(Gp[i] , 544043, 0 )
			CancelBuff( Gp[i] , 506910)
		end
	end
end

--�I�����~�e�G
function Lua_423276_FIRE_before()
	if	(CheckAcceptQuest(OwnerID(),423276)==true )and( CheckCompleteQuest( OwnerID(),423276)==false) and	CheckFlag( OwnerID() , 544041) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			if	 CountBodyItem(OwnerID(),207349) > 0 	then
				if	CheckBuff( OwnerID(), 506886) == true	then
					return true
				else
					return false
				end
			end
			if	 CountBodyItem(OwnerID(),207349) <1	then
				ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423276_6]",0) --�A���W�S���I�Ƥ����I
				ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423276_6]",0) --�A���W�S���I�Ƥ����I
				return false
			end
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --�ؼХ��b���L��
		return false
		end
	end
end

--�I�����~��G
function Lua_423276_FIRE()
	local Party = {}
	local Party = LuaFunc_PartyData(OwnerID())
	for i = 1 , Party[0] , 1 do
			if 	CheckAcceptQuest( Party[i] , 423276) == true	and	CheckBuff( Party[i],506886) == true	and
				ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then	
				DelBodyItem(Party[i], 207349, 1 )			--����	
				CancelBuff( Party[i] , 506886)	
				BeginPlot( TargetID() , "Lua_423276_LOOP" , 0 )
			else
				DelBodyItem(Party[i] ,207349, 1 )			--����	
				CancelBuff(Party[i] , 506910)
				ScriptMessage (Party[i] ,Party[i] , 2 , "[SC_423276_5]" , 0 )--�ɶ��W�L�A���ȥ��ѡI
				ScriptMessage(Party[i] ,Party[i] ,  0 , "[SC_423276_5]" , 0 )--�ɶ��W�L�A���ȥ��ѡI
			end
	end
--	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
	return true
end

function Lua_423276_LOOP()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	BeginPlot( OwnerID() , "Lua_423276_FIRE_LOOP" , 0 )
	return true
end

function Lua_423276_FIRE_LOOP()	
	local Fire = LuaFunc_CreateObjByObj (115570, OwnerID())		
	Lua_ObjDontTouch( Fire ) 
	sleep(20)
	AddBuff( Fire , 503605 , 1 , -1 )
	sleep(50)
	AddBuff( Fire , 502724 , 1 , -1 )
	sleep(50)
	DelObj(Fire)

end
