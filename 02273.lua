function PJ_AddBuff_ByHimSelfe()	--�ۤv�[buff
	AddBuff(OwnerID(),509420,1,1800)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function PJ_Click_The_Machine_01()--�d���ǹq�I���Უ�ͼ@��
	local machine2=ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local Rnum=Rand(2)+1
	local Rnum_T={20,10,15}

		if	machine2==117580	then
				CancelBuff_NoEvent( OwnerID(), 509044 )
				sleep(1)
				AddBuff(OwnerID(),509044,1,300)
				return 1
		elseif	CheckBuff(OwnerID(),509044)==TRUE and CheckBuff(TargetID(),509420)==FALSE then
				AddBuff(TargetID(),509420,1,Rnum_T[Rnum])
				DW_QietKillOne(0,105356)
				return 1
		elseif	CheckBuff(OwnerID(),509044)==FALSE then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423957_01]",0)
				return 1
		elseif	CheckBuff(TargetID(),509420)==TRUE then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423957_02]",0)
				return 1
		else
			return false
	
		end
	return false
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function luaPJ_test001()
	Say(OwnerID(),"1")
	Hide(OwnerID())
	DebugMsg(0,0,"1")
	Sleep(80)
	Show(OwnerID(),0)
	DebugMsg(0,0,"2")
end
---------------------------------------------------------------------

function LuaPJ_test_iswalk()
	local Obj=OwnerID()
	PlayMotion(Obj,ruFUSION_ACTORSTATE_ATTACK_1H_SP)						--�ʧ@�G�ͮ�					
	Sleep(10)
	WriteRoleValue(Obj,EM_RoleValue_IsWalk,1)			--������
	--Hide(Obj)
	--Show(Obj,0)
	DW_MoveDirectToFlag(Obj,780871,7,10,1)
	say(Obj,"num")

end

function LuaPJ_test_PlayMotion()
	LuaFunc_WaitMoveTo( OwnerID(), -737, -158 , -1018 ) 
	say(OwnerID(),"OK")
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PJ_testtest011()
	local Obj1=OwnerID()
	local Obj=Lua_DW_CreateObj("obj",117560,OwnerID())
	while 1 do
	SysCastSpellLv(Obj,Obj1,497554,499)
	Sleep(5)
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--(1)����Ĳ�I�@��

function LuaPJ_BeginCastBar_test00()--Ĳ�I�@��
	SetPlot( OwnerID(),"touch","LuaPJ_BeginCastBar_test01",30 )
end


--(2)����BeginCastBar�P�_

function LuaPJ_BeginCastBar_test01() --���a�ޭ�
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	if BeginCastBarEvent( O_ID, T_ID,"KILL", 30,  ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaPJ_BeginCastBar_test02" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		 callplot(O_ID,"LuaPJ_SITINTHECHEAR",O_ID,T_ID)--�m���Z�����s�A������  <---��ܪ��a�}�lBeginCastBar������檺�欰
	end
end


--(3)����BeginCastBar�ᤧ���G


function LuaPJ_BeginCastBar_test02(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			ScriptMessage(O_ID, O_ID , 1 , "OK" , "0xffffff00" )  --BeginCastBar���\�F�C
			ScriptMessage(O_ID, O_ID , 0 , "OK" , "0xffffff00" )  
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );

			ScriptMessage(O_ID, O_ID , 1 , "Fail" , "0xffffff00" )  --BeginCastBar���ѤF�C
			ScriptMessage(O_ID, O_ID , 0 , "Fail" , "0xffffff00" )  
		end
	end
end

--CheckStatus  �w�] = 0 

--CheckStatus  > 0 �P�_ BeginCastBar ���榨�\ 

--CheckStatus  < 0 �P�_ BeginCastBar ���椣���\ 

--CheckStatus  = 0 �P�_ BeginCastBar ������ 

function LuaPJ_SITINTHECHEAR(O_ID,T_ID)
	local npc=SearchRangeNPC(T_ID,30)
	local X=ReadRoleValue(T_ID,EM_RoleValue_X)
	local Y=ReadRoleValue(T_ID,EM_RoleValue_Y)
	local Z=ReadRoleValue(T_ID,EM_RoleValue_Z)
	local Dir=ReadRoleValue(T_ID,EM_RoleValue_Dir)
		Sleep(30)
		setpos(O_ID, X, Y, Z, Dir)
		Sleep(10)
	PlayMotionEX( O_ID, ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
end


----------------------------------------------------------------------------------------------------------------------------------------------------���T�W�n�G423776..START
function LuaPJ_423776_talk_1()
	LoadQuestOption(OwnerID())	
	--PlayMotion( TargetID(),ruFUSION_ACTORSTATE_SLEEP_END)
	if CheckAcceptQuest( OwnerID(), 423776)==TRUE  and CountBodyItem( OwnerID(), 209004 )~=0  then	
		AdjustFaceDir( TargetID(),OwnerID(), 0 )	
		AddBuff(TargetID(),508789,0,1)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423776_01]","LuaPJ_423776_talk_2",0)
	end
end
function LuaPJ_423776_talk_2()
	local Rnum=Rand(2)
		if Rnum==0 then
			SetSpeakDetail(OwnerID(),"[SC_423776_02]")
		else
			SetSpeakDetail(OwnerID(),"[SC_423776_10]")				
		end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423776_03]","LuaPJ_423776_talk_3",0)
end
function LuaPJ_423776_talk_3()
	CloseSpeak( OwnerID() )
	SetModeEx(TargetID(),EM_SetModeType_Mark,false)
	CallPlot(TargetID() , "LuaPJ_423776_live", TargetID(),OwnerID())
end
function LuaPJ_423776_live(Obj,Player)
		PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_DRINK)
		DelBodyItem( Player, 209004, 1 )
		ScriptMessage(Player,Player,0,"[SC_423776_06]",0)
		Sleep(10)
		Say(Obj,"[SC_423776_04]")
		Sleep(30)
		Say(Player,"[SC_423776_05]")
	local Rnum=Rand(3)
		CastSpell(Obj,Obj,496709)
		Sleep(20)
		Say(Obj,"[SC_423776_07]")
		PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_DANCE)
		sleep(20)
		PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		if Rnum==1 or Rnum==2 then
			Say(Obj,"[SC_423776_08]")
		else
			Say(Obj,"[SC_423776_13]")
		end
		DW_QietKillOne(Player,105302)
		sleep(30)
		if Rnum==0 then
			Say(Obj,"[SC_423776_09]")			
		elseif Rnum==1 then
			Say(Obj,"[SC_423776_11]")			
		else
			Say(Obj,"[SC_423776_12]")			
		end		
		DW_MoveDirectToFlag( Obj,780871,4,10,1)
		Sleep(20)
		SetModeEx(Obj,EM_SetModeType_Mark,true)
		CallPlot(Obj,"LuaFunc_ResetObj",Obj)
end
----------------------------------------------------------------------------------------------------------------------------------------------------���T�W�n�G423776..end

function AG_544867_OPEN_0()
	--DebugMsg(0,0,TargetID())
	--DebugMsg(0,0,OwnerID())
	SetFlag(TargetID(),544867,1)
end

function AG_544867_CLOSE_1()
	--DebugMsg(0,0,"0")
	SetFlag(TargetID(),544867,0)
end

--���T�W�n�Ϊ�l�@���C
function Luapj_423776_dazed()
	PlayMotion(OwnerID(),148)
end