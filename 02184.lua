--------------------------------------------------------------------------------------------------------------------------
function LuaPJ_117386_speak()		--���^�i���w���H���۸�
	local Rnum=Rand(4)+1
	local Rnum2=Rand(10)
	local Speak_T={"[SC_117386_01]","[SC_117386_02]","[SC_117386_03]","[SC_117386_04]"}
		if Rnum2==0 then
			PlayMotion(OwnerID(),ruFUSION_MIME_EMOTE_VICTORY)
			say(OwnerID(),Speak_T[Rnum])
		else
		end
end
--------------------------------------------------------------------------------------------------------------------------


-----------------------------------�����s
function LuaPJ_423939_0()		
	DW_QietKillOne(0,105287)
	return 1
end


-------------------------------------������A�^��1e

------------------------------------------------------------------------



Function LuaPJ_117376_0()
	LoadQuestOption(OwnerID)
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE)	
end

--------------------------------------------------------------
function luaPJ_loadquestobtion()
	LoadQuestOption(OwnerID())
end

-----------------------------------------



--==============================--
function PJ_Face_Load()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
end
--==============================--
function PJ_Face_Only()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
end
--==============================--

function LuaPJ_LoadQuest()
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Salute()					--��§
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	LoadQuestOption(OwnerID())	
end
--==============================--
function PJ_Face_Angry()					--�ͮ�
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Laugh()					--��
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_H_Shake()					--���
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Speak()					--����
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Dazed_L()					--�w�tL
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DAZED_LOOP)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Think()					--���
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_THINK)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Eat()					--�Y
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_EAT)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Victory()					--�w�I
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_VICTORY)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Threaten()					--���h
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_THREATEN)
	LoadQuestOption(OwnerID())
end
--==============================--

function PJ_Face_Stretch()					--���i�y
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Stretch_0()					--���i�y
	SetScriptFlag( OwnerID(), 544819, 0)
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),423943) then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423775_04]","LuaPJ_423943_talk_01",0)
	end
end

function LuaPJ_423943_talk_01()
	GiveBodyItem(OwnerID(),209010,10)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_LAUGH)
	CloseSpeak( OwnerID() )
end
--==============================--
function PJ_Face_Kick()					--��H
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_KICK)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Cry()					--��
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Wave()					--����
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_H_Nod()					--�I�Y
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_HEAD_NOD)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Point()					--��
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	LoadQuestOption(OwnerID())
end
--==============================--
function LuaPJ_Load_Speak()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK) --����
	LoadQuestOption(OwnerID())
end
--==============================--
--==============================--
function PJ_Face_Speak_1()					--����for�ȵ�S�F�ϥ�
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),423949) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_117376_01]","luaPJ_117376_01SP",0) --SC_117376_01 �е��ڧ�h������
	end
end

function luaPJ_117376_01SP()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(),208955,5)
	local num=Rand(4)
	if num==0 then
		Say(TargetID(),"[SC_117376_02]")		--SC_117376_02 ���M�o�ӪF���²��@�A�i�O�]�O�J�èϥΪ��I
	elseif num== 1 then		
		Say(TargetID(),"[SC_117376_03]")		--SC_117376_03 �A�O���O���h���աA�i�O���O�ڵ��A�������I
	else
		return TRUE
	end
end

--==============================--
--------------------------------����423962���n�����ޤu�@ 

function luaPJ_423962_closeflag()			--��ܫ�N�T�ӺX������
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest(OwnerID(),423962) == FALSE then	
		SetScriptFlag( OwnerID(), 544799, 0)
		SetScriptFlag( OwnerID(), 544809, 0 )
		SetScriptFlag( OwnerID(), 544810, 0 )
	end
end
--------------------------------------���ޤu�@�G01 start
function luaPJ_423962_0()
	if CheckAcceptQuest(OwnerID(),423962)==true  then
		if CheckFlag(OwnerID(),544799)==true then
			LoadQuestOption(OwnerID())
		else
			LoadQuestOption(OwnerID())
			AdjustFaceDir( TargetID(),OwnerID(), 0 )
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_00]","luaPJ_423962_01",0)  	--�o�O����N��
		end
	else
		LoadQuestOption(OwnerID())
	end
END

function luaPJ_423962_01()

	SetSpeakDetail(OwnerID(),"[SC_423962_01]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_02]","luaPJ_423962_02",0)
end

function luaPJ_423962_02()
	
	SetSpeakDetail(OwnerID(),"[SC_423962_03]")
	CastSpell(OwnerID(),TargetID(),497140)
	SetScriptFlag( OwnerID(), 544799, 1 )		 --�E�y�h��A���ȼҪO�O�o��
	--GiveBodyItem(OwnerID,544799,1)

end

----------------------------------���ޤu�@ 01 end
----------------------------------���ޤu�@ 02 start
function luaPJ_423962_10()
	PlayMotionEX(TargetID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	if CheckAcceptQuest(OwnerID(),423962)==true  then
		if CheckFlag(OwnerID(),544809)==true then
			LoadQuestOption(OwnerID())
		else
			LoadQuestOption(OwnerID())
			AdjustFaceDir( TargetID(),OwnerID(), 0 )
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_10]","luaPJ_423962_11",0)  	
		end
	else
		LoadQuestOption(OwnerID())
	end
END

function luaPJ_423962_11()

	SetSpeakDetail(OwnerID(),"[SC_423962_11]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_12]","luaPJ_423962_12",0)
end

function luaPJ_423962_12()
	
	SetSpeakDetail(OwnerID(),"[SC_423962_13]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_14]","luaPJ_423962_13",0)
end

function luaPJ_423962_13()

	SetSpeakDetail(OwnerID(),"[SC_423962_15]")
	CastSpell(OwnerID(),TargetID(),497140)
	SetScriptFlag( OwnerID(), 544809, 1 )		 --�E�y�h��A���ȼҪO�O�o��
	--GiveBodyItem(OwnerID,544809,1)
end

------------------------------------���ޤu�@02 End
------------------------------------���ޤu�@03 start

function luaPJ_423962_20()
	if CheckAcceptQuest(OwnerID(),423962)==true  then
		if CheckFlag(OwnerID(),544810)==true then
			LoadQuestOption(OwnerID())
		else
			local Rnum=Rand(4)
			if Rnum==0 or Rnum==1 then
				LoadQuestOption(OwnerID())
				AdjustFaceDir( TargetID(),OwnerID(), 0 )
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_20]","luaPJ_423962_21",0)  	
			else
				CallPlot(OwnerID(),"PJ_T_LiveShow",TargetID())
			end
		end
	else
		LoadQuestOption(OwnerID())
	end
END

function luaPJ_423962_21()

	SetSpeakDetail(OwnerID(),"[SC_423962_21]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_22]","luaPJ_423962_22",0)
end

function luaPJ_423962_22()
	
	SetSpeakDetail(OwnerID(),"[SC_423962_23]")
	CastSpell(OwnerID(),TargetID(),497140)
	SetScriptFlag( OwnerID(), 544810, 1 )		 --�E�y�h��A���ȼҪO�O�o��
	--GiveBodyItem(OwnerID,544810,1)

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------���ޤu�@ 03 ��� end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------���ޤu�@ 03 �԰����� end

function PJ_T_LiveShow(Target)								--���ͧ����@��
	CloseSpeak(OwnerID())
	say(Target,"[SC_423962_24]")
	AdjustFaceDir(Target,OwnerID(),0)
	PlayMotion(Target,ruFUSION_ACTORSTATE_UNHOLSTER)
	PlayMotion(Target,ruFUSION_ACTORSTATE_COMBAT_1H)
	CallPlot(OwnerID(),"PJ_L_Battack_0",Target)
end	

function PJ_L_Battack_0(Target)
	local Rnum2 =Rand(4)+1
	local monster_t={105178,105179,105180,105181}
	local monster=Lua_DW_CreateObj("flag",monster_t[Rnum2],780871,5) 			--���ͤ@�ӳD�H
	PJ_UseAdjModEx(monster)
	PJ_UseAdjModEx(Target)
	SetAttack(monster,OwnerID())
	SetAttack(Target,monster)
		for i=1,500 do								--�P�_�����q
			sleep(20)
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==1 then
				Sleep(20)
				DelObj(monster)
				return FALSE
			elseif ReadRoleValue(monster,EM_RoleValue_IsDead)==1 then
				break
			else
				--continue
			end
		End
	PJ_NOUseAdjModEx(Target)
	--DelObj(monster)
	Sleep(20)
	AdjustFaceDir(Target,OwnerID(),0)
	PlayMotion(Target,ruFUSION_MIME_EMOTE_VICTORY)
	Sleep(10)
	Say(Target,"[SC_423962_25]")
	Sleep(20)
	CastSpell(OwnerID(),Target,497140)
	SetScriptFlag( OwnerID(), 544810, 1 )
end
------------------------------------------------------------------------------------------------------------------------------------�}�Ҿ԰����A
function PJ_UseAdjModEx(Obj)

	SetModeEx(Obj,EM_SetModeType_Fight,TRUE) 
	SetModeEx(Obj,EM_SetModeType_Strikback,TRUE) 
	SetModeEx(Obj,EM_SetModeType_Searchenemy,TRUE) 
	--DW_UnFight(Obj,true)
	--DW_UnFight(Obj,false)
	return nil
end
---------------------------------------------------------------------------------------------------------------------------------------�����԰����A
function PJ_NOUseAdjModEx(Obj)

	SetModeEx(Obj,EM_SetModeType_Fight,FALSE) 
	SetModeEx(Obj,EM_SetModeType_Strikback,FALSE) 
	SetModeEx(Obj,EM_SetModeType_Searchenemy,FALSE) 
	--DW_UnFight(Obj,true)
	--DW_UnFight(Obj,false)
	return nil
end
-----------------------------------------------------------------------------------------------------------------end	



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------�a���O��	start


--209115[�G�H���s]
--209009[�z�u��G]
--209005�R���v�Ϩ����s
function LuaPJ_423941_talk()
	AdjustFaceDir( TargetID(),OwnerID(),  0 )
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	LoadQuestOption(OwnerID())
		if CheckAcceptQuest(OwnerID(),423934) then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_01]","LuaPJ_423941_01",0)		--01�ڻݭn�@�ة_�S���s�K
		end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_02]","LuaPJ_423941_02",0)			--02�ڷQ�ʶR�@�ǸG�H���s
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_03]","LuaPJ_423941_04",0)			--03�����ƤF�A�����ڻs�@�R���v�Ϩ����s	
end

function LuaPJ_423941_01()
	SetSpeakDetail(OwnerID(),"[SC_463941_04]")							--04
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0)		--05���٦��䥦���D�K
end

function LuaPJ_423941_02()
	SetSpeakDetail(OwnerID(),"[SC_463941_06]")							--06��n���٦��@�ǡA�C��5�~�A1��300���C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_07]","LuaPJ_423941_03",0)			--07�ʶR
end

function LuaPJ_423941_03()
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Money ) >=300 then			--���p���W��300��
		AddRoleValue ( OwnerID() , EM_RoleValue_Money , -300 )			--���A300
		GiveBodyItem(OwnerID(),209115,5)						--���A���s
		SetSpeakDetail(OwnerID(),"[SC_463941_08]")					--08 �u������O���ȤH�A�ڳ��w�I
	else
		SetSpeakDetail(OwnerID(),"[SC_463941_09]")					--09�A���G�S�����������K
	end
	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0)  	--05���٦��䥦���D�K
end

function LuaPJ_423941_04()
	if (CountBodyItem(OwnerID(),209009)==0) then
		SetSpeakDetail(OwnerID(),"[SC_463941_10]")					--10�A�S��������[209009]�A
		AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0) 
	elseif  (CountBodyItem(OwnerID(),209115)==0) then
		SetSpeakDetail( OwnerID(), "[SC_463941_11]")					--11�A�S��������[209115]�A�ӧڥ��n����C�I�u�O�ӯ��_�F�A��a�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0)  
	else
		SetSpeakDetail(OwnerID(),"[SC_463941_12]")						--12��A�A�`���쨬�������ƤF�ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_13]","LuaPJ_423941_05",0)  	--13 �O���A�����ڻs�@
	end
end

function LuaPJ_423941_05()
	callplot(OwnerID(),"LuaPJ_423941_creat",TargetID())
End

function LuaPJ_423941_creat(Target)
	CloseSpeak(OwnerID())
	CastSpell(Target,Target,497181)
	Sleep(30)
	local num1 = CountBodyItem( OwnerID(), 209115)
	local num2 = CountBodyItem(OwnerID(), 209009 )
	local Maxnum
		if num1>num2 then
			Maxnum = num2
		else
			Maxnum = num1
		end
		DelBodyItem(OwnerID(),209115,Maxnum)
		DelBodyItem(OwnerID(),209009,Maxnum)
		GiveBodyItem(OwnerID(),209005,Maxnum)
	return TRUE
end


----------------------------------------------------------------------------------------------------------------------�a���O�� end
function PJ_117562_SING()	--����ڪ��y�Ӻq
	local num11=rand(4)		
	if	num11==1	then
		Say(OwnerID(),"[SC_117562_01]")					--�}�v~�L����~�C�~���A���۩�t�P�z�Q~�N�N�f
		sleep(40)
		Say(OwnerID(),"[SC_117562_02]")					--�µۦۤv���ؼЫe��~�a�Ҧ�����O���o�H��~�A���W�]���`��~�N�f�N
		sleep(40)
		Say(OwnerID(),"[SC_117562_03]")					--�N�ⰸ���g���F��V~���Y���Q�r�P�ާګe��~�N�N�f
		sleep(40)	
		Say(OwnerID(),"[SC_117562_04]")					--�N����~�W������ê~��۱j������D��~�N�N�f�N
		sleep(40)
		Say(OwnerID(),"[SC_117562_05]")					--�}�v~�L����~�C�~��~�l�v�ڷQ�ä����~�f�շf�թN
	else
		return 1
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaPJ_JugM_Y_N()	
	local Obj = OwnerID()							
	local Target = TargetID()					
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local Target_r=ReadRoleValue(Target,EM_RoleValue_Register)
	if	(TargetOrgID~=105169)	then	
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )		
	elseif	Target_r==50	then
		--Say(Target,Target_r)
		--ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )		--�ؼФw�Q�ϥιL
		return false
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))<1	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	CheckDistance(Obj,Target,50)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	CheckFlag(Obj,544819)==1	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	else
		DelBodyItem(Obj,209010,1)
		SetScriptFlag( Obj, 544819,1)
		--AddBuff(Target,508959,0,10)
		WriteRoleValue(TargetID(),EM_RoleValue_Register,50)
		CallPlot(Target,"LuaPJ_423775_01",Target,Obj)
		return true
	end
	return false
end

function LuaPJ_423775_01(Target,Obj)
	local Rnum1=Rand(5)
	local Rnum2=Rand(7)
		if Rnum1== 0 or Rnum1== 1 or Rnum1== 2 or Rnum1== 3 then
			CastSpell(Obj,Target,497191)				--�Ĳ��ʤ����_
			Sleep(10)
			ScriptMessage(Obj,Obj,0, "[SC_423775_01]", 0 )		--[SC_423775_01]�A�ݨ��J�Ԭ��u�o�X�F�L�z�����~	
		else
			CastSpell(Obj,Obj,497192)				--�Ĳ��ʤ����_
			Sleep(10)
			ScriptMessage(Obj,Obj,0, "[SC_423775_02]", 1 )		--[SC_02]�J�Ԭ��u�o�X�F�������P���A�Aı�o�A�ֳQ�N���F�K
		end
	PJ_NOUseAdjModEx(Target)
	AdjustFaceDir(Target,Obj,0)
	Sleep(10)
		if Rnum2==0 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_DYING)						--�ʧ@�G����				
			ScriptMessage(Obj,Obj,1, "[SC_423775_03]", "0xffffff80" )		--[SC_03]�j���Q�~�F�@���N���������L�h�F�I 
		elseif Rnum2==1 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_CAST_SP01)						--�ʧ@�G�~��
			WriteRoleValue(Target,EM_RoleValue_IsWalk,0)	
			Hide(Target)
			Show(Target,0)			
			Sleep(20)
			DW_MoveDirectToFlag( Target,780871,7,10,1)
			ScriptMessage(Obj,Obj,1, "[SC_423775_05]", "0xffffff80" )		--[SC_05]�j���Y�F�@�媺�k���F �I
		elseif Rnum2==2 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_ATTACK_1H_SP)						--�ʧ@�G�ͮ�	
			WriteRoleValue(Target,EM_RoleValue_IsWalk,0)	
			Hide(Target)
			Show(Target,0)				
			Sleep(20)
			ScriptMessage(Obj,Obj,1, "[SC_423775_06]", "0xffffff80" )		--[SC_06]�~�F�@�����j���N�R�U�ӫ�ͮ𪺶]�}�F�K
			DW_MoveDirectToFlag( Target,780871,7,10,1)
		elseif Rnum2==3 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_IDLE2)						--�ʧ@�G�L�ʧ@	
			AdjustFaceDir(Target,Obj,180)			
			ScriptMessage(Obj,Obj,1, "[SC_423775_07]", "0xffffff80" )		--[SC_07]�@�L�������j���q�q�����Y���h�K���h�ɦ��G�ݨ��F�e�����������K�K
			Sleep(20)
			WriteRoleValue(Target,EM_RoleValue_IsWalk,1)	
			Hide(Target)
			Show(Target,0)
			DW_MoveDirectToFlag( Target,780871,7,10,1)
			Sleep(30)
			PJ_UseAdjModEx(Target)
			SetScriptFlag( Obj, 544819, 0)
			WriteRoleValue(TargetID(),EM_RoleValue_Register,0)
			CallPlot(Target,"LuaFunc_ResetObj",Target)
			return  
		elseif Rnum2==4 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
			ScriptMessage(Obj,Obj,1, "[SC_423775_08]", "0xffffff80" )		--[SC_08]�@�L�������j���K���¬O�@�L�����K�K		
			Sleep(20)
			WriteRoleValue(Target,EM_RoleValue_IsWalk,1)	
			Hide(Target)
			Show(Target,0)
			DW_MoveDirectToFlag( Target,780871,7,10,1)
			Sleep(30)
			PJ_UseAdjModEx(Target)
			SetScriptFlag( Obj, 544819, 0)
			WriteRoleValue(TargetID(),EM_RoleValue_Register,0)
			CallPlot(Target,"LuaFunc_ResetObj",Target)
			return  
		else
			PJ_UseAdjModEx(Target)
			WriteRoleValue(Target,EM_RoleValue_Register1,50)
			CallPlot(Target,"LuaPJ_423775_Atc_Start",Target,Obj)			
			return true
		end
		WriteRoleValue(Target,EM_RoleValue_Register,0)
	Sleep(5)
	PJ_UseAdjModEx(Target)
	Sleep(5)
	SetScriptFlag( Obj, 544819, 0)
	DW_QietKillOne(Obj,105342)
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	return
end
--[SC_09]�ͮ𪺥j���I��ۦP��
function LuaPJ_423775_Atc_Start(Target,Obj)
	local T_PARTNER=SearchRangeNPC(Target,150)
	local Partner
		if T_PARTNER[0]==Target then
			Partner=T_PARTNER[1]
		else
			Partner=T_PARTNER[0]
		end
	WriteRoleValue(Target,EM_RoleValue_Register2,Obj)
	ScriptMessage(Obj,Obj,1, "[SC_423775_09]", 1 )	
	PJ_UseAdjModEx(Target)
	Sleep(10)
	SetAttack(Target,Obj)
		if Partner~=nil or Partner~=0 or Partner ~=-1 then
			SetAttack(Partner,Obj)
		end
	for i=1,45,1 do
		local dead=ReadRoleValue(Target,EM_RoleValue_IsDead)
		if dead==1 then
			return
		end
		if HateListCount(Target)==0 then
			WriteRoleValue(Target,EM_RoleValue_Register,0)
			CallPlot(Target,"LuaFunc_ResetObj",Target)
			return
		end
		Sleep(20)
	end  
	WriteRoleValue(Target,EM_RoleValue_Register,0)
	CallPlot(Target,"LuaFunc_ResetObj",Target)

end
--�j�������`�@��
function LuaI_423775_Dead()
		WriteRoleValue(TargetID(),EM_RoleValue_Register,0)
		SetPlot(OwnerID(),"dead","Lua_AG_423775",0)
end

function Lua_AG_423775()
	local R_num=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if	R_num~=50	then
			return true
		end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
	local Obj=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	SetFlag(Obj,544819,0)
	DW_QietKillOne(Obj,105342)
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------����423902
function LuaPJ_423902_0()	
	local Obj = OwnerID()--���a
	local Target = TargetID()--�ϥι�H
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	if	(TargetOrgID~=105175)	then		--�ؼФ��O�L�C
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )	--�ؼп��~
	elseif	CheckBuff(Target,508691)	then		
		--ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )	--�ؼФw�Q�ϥιL
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))>0.5	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	CheckDistance(Obj,Target, 150)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	else
		DelBodyItem(Obj,208955,1)
		SetStopAttack(Obj)
		return true
	end
	return false--�����z�|
end

function LuaPJ_423902_01()	--½�g��s�A�I��
		CallPlot(TargetID(),"LuaPJ_423902_02",OwnerID(),TargetID())
end

function LuaPJ_423902_02(PlayBoy,Monster)
		AddBuff(Monster,508691,1,10)
		CastSpell(PlayBoy,Monster,496982)
		Sleep(30)
		GiveBodyItem(PlayBoy,208956,1)
		CallPlot(Monster,"LuaFunc_ResetObj",Monster)
end
------------------------------------------------------------------------------------------------------------------------------------------����423932�G�Ҵ߬�s
function LuaPJ_423932_init()
	PJ_UseAdjModEx(OwnerID())
end
function LuaPJ_423932_0()	
	local Obj = OwnerID()--���a
	local Target = TargetID()--�ϥι�H
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local x=ReadRoleValue(Target,EM_RoleValue_Register1)
	if	(TargetOrgID~=105193)	then		--�ؼФ��O
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )	--�ؼп��~
	elseif	x==1	then		
		ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )	--�ؼФw�Q�ϥιL
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))>0.45	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	CheckDistance(Obj,Target, 150)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	else
		SetStopAttack(Obj)
		return true
	end
	return false--�����z�|

end


function LuaPJ_423932_2()
	WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
	--LockHP( TargetID() , ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)*0.4 , "Lua_424225_LockHP" ); 
	CallPlot(TargetID(),"LuaPJ_423932_3",OwnerID(),TargetID())
end
function LuaPJ_423932_3(own,Target)
		Sleep(10)
		GiveBodyItem(Own,208982,1)
		ScriptMessage(Own,Own, 0, "[SC_423932_01]", 0) 	--SC_423932_01 ���ߤW�ʤF�@���������B�H�~�ɶˤߪ����h�F
		PJ_NOUseAdjModEx(Target)
		SetStopAttack(Target)
		DW_MoveDirectToFlag( Target,780871,6,1)
		Sleep(20)
		PJ_UseAdjModEx(Target)
		Sleep(10)
		WriteRoleValue(Target,EM_RoleValue_Register1,0)
		CallPlot(Target,"LuaFunc_ResetObj",Target)
		return TRUE
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�Z�\�w��a�A��m����
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�Z�\�w��a�A��m����
function PJ_423820_0()							--���b�I���Უ�ͼ@��
	local Rnum=Rand(5)
	--DebugMsg(0,0,Rnum)
	if  CountBodyItem(OwnerID(),209050)>0 then
		DelBodyItem(OwnerID(),209050,1)
		DW_QietKillOne(0,105332)
			if Rnum==4 then
				CallPlot(TargetID(),"PJ_423820_01",TargetID())
			end
		return 1
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_SPQUESTSET_NOITEM]",0)
		return FALSE
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function PJ_423820_01(Target)
	

	local num=RandRange(50,100)
	local Xrang=ReadRoleValue(Target,EM_RoleValue_X)
	local Yrang=ReadRoleValue(Target,EM_RoleValue_Y)
	local Zrang=ReadRoleValue(Target,EM_RoleValue_Z)
	local xyz={Xrang+num,Yrang,Zrang+num}
	local Obj_S=Lua_DW_CreateObj("xyz",105178,xyz,1,0,1)		--���ͤ@�Ӫ���

	PJ_NoUseAdjModEx(Obj_S)
	Move( Obj_S, Xrang, Yrang , Zrang ) 
	Sleep(40)
	SysCastSpellLv(Target,Obj_S,497189,1)
	sleep(40)
	DelObj(Obj_S)
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	return 1	
end
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------�Z�\�w��a�A��m����
function luaPJ_FAKE_TRAP()

		local test_table=SearchRangeNPC(OwnerID(),30)
		local menber1=ReadRoleValue(test_table[0],EM_RoleValue_CampID)
		local menber2=ReadRoleValue(test_table[1],EM_RoleValue_CampID)
		local Npc1
		local NpcCamp

			if test_table[0]~= nil  and test_table[0]~= -1 and test_table[0]~=OwnerID() then
					Npc1=test_table[0]
					NpcCamp=menber1
			elseif test_table[1]~= nil  and test_table[1]~= -1 and test_table[1]~=OwnerID() then
					Npc1=test_table[1]	
					NpcCamp=menber2
			else
					return
			End
	
			if npc1~=0 and NpcCamp==3 then
					AddBuff(npc1,508907,1,12)
					--ScriptMessage(OwnerID(),0,1,"[SC_117612TRAP_0]",0)
			else
					--Sleep(200)
					return
			end
		return
		
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


