function LuaZ13WS_209117_0()	
	--����
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaZ13WS_209117_1",0)
end


function LuaZ13WS_209117_1()
	if	(CountBodyItem(TargetID(),209117))>0 then
		Addbuff(TargetID(),508200,1,100)
	end
end


function LuaZ13WS_209116_0()	
	--���
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG

		Beginplot(TargetID(),"LuaZ13WS_209116_1",0)
end


function LuaZ13WS_209116_1()
	if DW_CheckMap(TargetID(), 364 )==true then
		if	(CountBodyItem(TargetID(),209116))>0 then
			Addbuff(TargetID(),508199,1,100)
		end
	else
		ScriptMessage(TargetID(), TargetID() , 2 , "[SC_423851_0]" , 0 )
		ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423851_0]" , 0 )
		--�A���b�H���������A�L�k�ϥ�
	end
end


--========================================================================================================================================
--�V��k�} 
--========================================================================================================================================

function LuaZ13WS_117603_0()
		
	while 1 do
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_BUFF_BEGIN, ruFUSION_ACTORSTATE_BUFF_LOOP )
		CastSpell(OwnerID(),OwnerID(),497200)
		sleep(600)
	end
end

--========================================================================================================================================
--�V�j�����q��
--========================================================================================================================================
function LuaZ13WS_423852_BuffCheck()
	local TID = TargetID()
	if 	CheckAcceptQuest(TID ,423852)==true		and
		CheckCompleteQuest(TID ,423852)==false		and
		CheckFlag(TID ,544745)==false			then
		return true
	end
	return false
end

function LuaZ13WS_423852_0()
	local OID = OwnerID()
	while true do
		CastSpell( OID, OID, 497201 )
		sleep(10)
	end
	--SetPlot(OwnerID(),"range","Luaz13WS_423852_1",50)
end
--[[
function LuaZ13WS_423852_1()
	say(OwnerID(),"0")
	say(TargetID(),"1")
	while true do
		if	CheckDistance( OwnerID(), TargetID(), 50 )	then 
			CastSpell( OwnerID(), TargetID(), 497201 )
		end
		sleep(10)
	end
end
--]]




function LuaZ13_423852_209226()
--���b�ϥΪ��~scipt�@���U
	Beginplot(TargetID(),"LuaZ13_423852_209226_1",0)
end

function LuaZ13_423852_209226_1()
	if	CountBodyItem(TargetID(),209226)>0	then
		if	CheckBuff(TargetID(),509024)==true	then
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423852_0]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423852_0]", 0 )
			PlayMotionEX(TargetID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
			--�A���ձҰ�[209226]......
			Sleep(20)
			ScriptMessage( TargetID(), TargetID(), 1,"[SC_423852_1]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423852_1]", 0 )
			--[209226]�G�F�F......�R...�F�F......
			sleep(30)
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423852_2]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423852_2]", 0 )
			--[209226]�o�X��ժ��n���A���G�G�٤F
			sleep(30)
			Setflag(TargetID(),544745,1)
			PlayMotion(TargetID(), ruFUSION_ACTORSTATE_CRAFTING_END)
		else
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423852_3]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423852_3]", 0 )
			--�A�����b�T�������I�A�~��ϥ�[209226]�C
		end	
	end
end


--========================================================================================================================================
--�񻴸}�B&�����w�Ԫ��P�_(��_�ݨ�����)
--========================================================================================================================================
function LuaZ13WS_423851_0()
	SetPlot(OwnerID(),"range","Luaz13WS_423851_1",20)
end

function Luaz13WS_423851_1()
	if 	CheckAcceptQuest(OwnerID(),423851)==true	and
		CheckCompleteQuest(OwnerID(),423851)==false	and
		Checkflag(OwnerID(),544747)==false			then
		Beginplot(TargetID(),"Luaz13WS_423851_2",0)
	end
end

function Luaz13WS_423851_2()
		ScriptMessage( TargetID(), TargetID(), 1,"[SC_423851_1]", 0 )
		ScriptMessage( TargetID(), TargetID(), 0,"[SC_423851_1]", 0 )
		--�A�o�{�髬�e�j���T�Y�D[105365]�I
		Sleep(30)
		Setflag(TargetID(),544747,1)	
end
-------
--========================================================================================================================================
--423954�t�@�T�T�ҲŤ�
--========================================================================================================================================
function LuaZ13WS_423954_0()
	
	if	CheckAcceptQuest(OwnerID(),423954)==true		and
		CheckCompleteQuest(OwnerID(),423954)==false		and
		Checkflag(OwnerID(),544777)==false				then
		if	CountBodyItem(OwnerID(),209211)>0				then
			SetSpeakDetail(OwnerID(), "[SC_423954_0]" ) 
			--�A�b��ä���H�T�ҲŤ�ä��O�A�o���٤���j�j���_�I�̯�������A���u�|�a���A�L�ɪ��M�I�P�·СC�N���浹�ڡC
			AddSpeakOption( OwnerID(), TargetID(), "[SC_423954_1]", "LuaZ13WS_423954_give",0)
			--��A�A�����O�C(�N�T�ҲŤ嵹��[117569]�ɮv)
			AddSpeakOption( OwnerID(), TargetID(), "[SC_423954_2]", "LuaZ13WS_423954_reject",0)
			--���A�o�O�ڪ��ԧQ�~�C(�A�M�w����X�T�ҲŤ�)
		else
			CloseSpeak( OwnerID() )
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423954_3]", 0 )
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423954_3]", 0 )
			--�A�èS��[209211]�C
		end
	else
	LoadQuestOption(OwnerID())
	end
end

----��
function LuaZ13WS_423954_give()
	CloseSpeak( OwnerID() )
	Beginplot(TargetID(),"LuaZ13WS_423954_give_1",0)
end

function LuaZ13WS_423954_give_1()

	DisableQuest(OwnerID(), true )
	--OwnerID�O����
	Addbuff(TargetID(),509025,1,600)
	local Pan=LuaFunc_CreateObjByObj( 117649 , OwnerID() )
	DisableQuest(OwnerID(), Pan )
	Hide(Pan)
	Show(Pan,0)
	Setflag(TargetID(),544777,1)
	DelBodyItem(TargetID(),209211,1)
	WriteRoleValue(Pan, EM_RoleValue_IsWalk, 1)
	Say(Pan,"[SC_423954_A1]")
	--�A�|�C
	Sleep(30)
	Beginplot(Pan,"LuaZ13WS_423954_give_2",0)
	Sleep(60)
	Delobj(Pan)
	Cancelbuff(TargetID(),509025)
	DisableQuest(OwnerID(), false )
end

function LuaZ13WS_423954_give_2()
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	DW_MoveToFlag(OwnerID(),780810,4,0,1)
end
	
-------�ڵ�	
function LuaZ13WS_423954_reject()
	CloseSpeak( OwnerID() )
	Beginplot(TargetID(),"LuaZ13WS_423954_reject_1",0)
end

function LuaZ13WS_423954_reject_1()

	DisableQuest(OwnerID(), true )
	--OwnerID�O����
	Addbuff(TargetID(),509027,1,600)
	local Pan= LuaFunc_CreateObjByObj( 117709 , OwnerID() )
	DisableQuest(OwnerID(), Pan )
	WriteRoleValue(Pan, EM_RoleValue_IsWalk, 1)
	Hide(Pan)
	Show(Pan,0)
	
	AdjustFaceDir( Pan , TargetID() ,3 )
	Say(Pan,"[SC_423954_A4]")
	--��̤����զb���o�C

	SysCastSpellLv( Pan, TargetID(), 494224, 1 )
	Sleep(10)
	SetPosByFlag( TargetID(), 780810 , 5 )  
	Sleep(10)
	PlayMotion(Pan,ruFUSION_ACTORSTATE_CAST_SP01)
	SysCastSpellLv( Pan, TargetID(), 494224, 1 )
	AdjustFaceDir( Pan , TargetID() ,3 )
	AdjustFaceDir(  TargetID(),Pan  ,3 )
	--Addbuff(TargetID(),505440,1,20)
	Sleep(10)
	Addbuff(TargetID(),502860,1,2)
	ScriptMessage( TargetID(), TargetID(), 1,"[SC_423954_A2]", 0 )
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_423954_A2]", 0 )
	--����I�k�_�h�A�C
	sleep(20)
	Say(Pan,"[SC_423954_A3]")
	--�T�ҲŤ大�k�ݥѤ��o�A�M�w�C
	Setflag(TargetID(),544777,1)
	DelBodyItem(TargetID(),209211,1)
	Sleep(20)
	Beginplot(Pan,"LuaZ13WS_423954_give_2",0)
	Sleep(60)
	Delobj(Pan)
	Cancelbuff(TargetID(),509027)
	DisableQuest(OwnerID(), false )
end



















