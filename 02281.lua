-----------------------���ȡG423794�����e�\�s�y�I���b�I������Უ�ͪ��@���Istart
function luaPJ_423794_0()			--�������\�s�y�A�I���@��
	local num=rand(4)	
		if num==0 then
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423794_01]",0)	
		else
			AddBuff(OwnerID(),508789,0,5)				
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423794_0]",0)	
			BeginPlot(OwnerID(),"luaPJ_423794_01",5)			
		end
	return 1
end
function luaPJ_423794_01()	
	DW_QietKillOne(OwnerID(),105287)
	SetFlag(OwnerID(),544972,1)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN) --�ʧ@�w��
	sleep(15)
	AddBuff(OwnerID(),506098,0,3)				     	  --���e�@��
	ChangeZone(OwnerID(), 13 , 0 , -2428,247.3,-4374.4,289.6)		--��������
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_END)		--���_��
end

--------------------------------���ȡG423794�����e�\�s�y�Iend
---------------------------------------------------------------------------�Ĥ@���q�AĲ�o
function PJ_TM_423796_River()
	local Player_T= SearchRangePlayer(OwnerID(),180)
	local P_Count=Table.getn(Player_T)
		for i=0,P_Count-1 do
			if	CheckAcceptQuest(Player_T[i],423796)==TRUE	and
				CheckFlag(Player_T[i],544831)==false	and 
				checkbuff(Player_T[i],506277)==FALSE	and
				ReadRoleValue(Player_T[i],EM_RoleValue_Register10)==0 then
				local ObjID = Lua_DW_CreateObj( "obj" , 114357 , OwnerID() , 0 , 1 )
				CallPlot(ObjID,"PJ_TM_423796_River_TalkAbout",Player_T[i],ObjID)
			else
				Player_T={0}
			end
		end				
end
-------------------------�ĤG���q�A�ݨ�����				--�O�o�����a��npc��ܮɡA�NEM_RoleValue_Register2��^0
function PJ_TM_423796_River_TalkAbout(PlayBoy,Monster)		--�Ƕi��ӭ� 1.���a 2.Ĳ�o��
			AddBuff(PlayBoy,506277,0,20)					--�w��buff
			ScriptMessage(PlayBoy,PlayBoy,1,"[SC_423796_01_2]",0)
			Sleep(30)
			ScriptMessage(PlayBoy,PlayBoy,0,"[SC_423796_01]","0xffffffff")
			Sleep(20)
			ScriptMessage(PlayBoy,PlayBoy,0,"[SC_423796_02]","0xffffffff")
			Sleep(40)
			ScriptMessage(PlayBoy,PlayBoy,0,"[SC_423796_03]","0xffffffff")
			Sleep(50)
			ScriptMessage(PlayBoy,PlayBoy,0,"[SC_423796_04]","0xffffffff")
			Sleep(30)
			ScriptMessage(PlayBoy,PlayBoy,0,"[SC_423796_05]","0xffffffff")
			WriteRoleValue(PlayBoy,EM_RoleValue_Register10,1)
			Sleep(30)
			SetFlag(PlayBoy,544831,1)
			DelObj(Monster)
end
-------------------------�ĤT���q

--�ޡA�A�O�֡A�b���̰�����I
--�L�O�W����ť�ڭ̻��ܪ��H�A�֧�L���A�O���L�]�F�I

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PJ_touch_set_register_01()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register10,0)
	LoadQuestOption(OwnerID())
end

function PJ_Animal_River_Fire()
	local Player_T= SearchRangePlayer(OwnerID(),120)
	local P_Count=Table.getn(Player_T)
		for i=0,P_Count-1 do
			if	CheckAcceptQuest(Player_T[i],423797)==TRUE 	and  
				ReadRoleValue(Player_T[i],EM_RoleValue_Register2)==0	and
				CheckFlag(Player_T[i],544822)==false	then
				local ObjID = Lua_DW_CreateObj( "obj" , 114357 , OwnerID() , 0 , 1 )
				callplot(ObjID, "PJ_TM_River_Attack",Player_T[i],ObjID)			--�Ƕi��ӭ� 1.���a 2.Ĳ�o��
			else
				Player_T={0}
			end
		end				
end

function PJ_TM_River_Attack(PlayBoy,Fire)
	local X=ReadRoleValue(Fire,EM_RoleValue_X)
	local Y=ReadRoleValue(Fire,EM_RoleValue_Y)
	local Z=ReadRoleValue(Fire,EM_RoleValue_Z)
	local num1=RandRange( 80,130)
	local num2=RandRange( 80,130)
		WriteRoleValue(PlayBoy,EM_RoleValue_Register2,500)				--�ק�Ȭ�500
	local Range_T1={X-num1,Y,Z-num2}
	local Range_T2={X-(num1+30),Y,Z-(num2+30)}
	local Mon_Scr1=Lua_DW_CreateObj("xyz",105240,Range_T1,1,0,1)			--�y�в��ͤ@����105240
			PJ_NOUseAdjModEx(Mon_Scr1)
	local Mon_Scr2=Lua_DW_CreateObj("xyz",105241,Range_T2,1,0,1)			--�y�в��ͤ@����105241
			PJ_NOUseAdjModEx(Mon_Scr2)

		AdjustFaceDir(Mon_Scr2,PlayBoy,0)
		Say(Mon_Scr2,"[SC_423796_06]")
		Sleep(20)
		AdjustFaceDir(Mon_Scr2,PlayBoy,0)
		Say(Mon_Scr1,"[SC_423796_07]")

			PJ_UseAdjModEx(Mon_Scr1)
			PJ_UseAdjModEx(Mon_Scr2)
		Sleep(10)
		SetAttack(Mon_Scr1,PlayBoy)
		SetAttack(Mon_Scr2,PlayBoy)
			for i=1,90 do		
				--DebugMsg(0,0,"PJ_03")						--3�������j��A�C2��P�w�@��
				if not CheckDistance(Fire,PlayBoy,300) then
					callplot(Fire,"PJ_Distance_SoFar",PlayBoy,Mon_Scr1,Mon_Scr2)
					return FALSE
				elseif ReadRoleValue(Mon_Scr1,EM_RoleValue_IsDead)==1 and ReadRoleValue(Mon_Scr2,EM_RoleValue_IsDead)==1 then
					return TRUE
				elseif ReadRoleValue(PlayBoy,EM_RoleValue_IsDead)==1 then
					callplot(Fire,"PJ_Distance_SoFar",PlayBoy,Mon_Scr1,Mon_Scr2,Fire)
				else
				end
			Sleep(20)
			end	
	WriteRoleValue(PlayBoy,EM_RoleValue_Register2,0)				--�ק�Ȭ�0
	DelObj(Fire)
	return 
end	

function PJ_Distance_SoFar(PlayBoy,Mon_Scr1,Mon_Scr2,Fire)			---�Z���ӻ��N�R��
		DelObj(Mon_Scr1)
		DelObj(Mon_Scr2)
		WriteRoleValue(PlayBoy,EM_RoleValue_Register2,0)
	return 
end

----------------------------------------------------------------------------------------------------------
--�ߨ��_�ͫ�A����ʪ�
--�I���c
function PJ_Release_Animal_key()
		
		if CheckBuff(OwnerID(),509033)==FALSE and CheckFlag(OwnerID(),544822)==FALSE and CountBodyItem(OwnerID(),209157)>0 then
			return TRUE		
		else
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423796_08]",0)		--�A����ϥ�
			return FALSE
		end
end

function PJ_Release_Animal_key_01()
		local ObjID = Lua_DW_CreateObj( "obj" , 114357 , OwnerID() , 0 , 1 )
		CallPlot(ObjID,"PJ_Release_Animal_key_02",OwnerID(),ObjID)
		return 1
end
function PJ_Release_Animal_key_02(PlayBoy,ObjID)
			AddBuff(PlayBoy,509033,1,60)
			--����
		local Mon_Scr1=Lua_DW_CreateObj("flag",105153,780871,11)   	--117468,117469,117470 ���ͩǪ�
			PJ_NOUseAdjModEx(Mon_Scr1)
			SetModeEx(Mon_Scr1,EM_SetModeType_Mark,FALSE) 
			SetModeEx(Mon_Scr1, EM_SetModeType_HideName,TRUE)
			sleep(10)
			local Mon_Scr2=Lua_DW_CreateObj("flag",105156,780871,12)  
			PJ_NOUseAdjModEx(Mon_Scr2)
			SetModeEx(Mon_Scr2,EM_SetModeType_Mark,FALSE)
			SetModeEx(Mon_Scr2, EM_SetModeType_HideName,TRUE)
			sleep(10)
			local Mon_Scr3=Lua_DW_CreateObj("flag",105160,780871,13)  
			PJ_NOUseAdjModEx(Mon_Scr3)
			SetModeEx(Mon_Scr3,EM_SetModeType_Mark,FALSE) 
			SetModeEx(Mon_Scr3, EM_SetModeType_HideName,TRUE)
			sleep(10)
			DW_MoveDirectToFlag( Mon_Scr1,780871,14,10,1)
			sleep(10)
			DW_MoveDirectToFlag( Mon_Scr2,780871,14,10,1)
			sleep(10)
			DW_MoveDirectToFlag( Mon_Scr3,780871,14,10,1)
			sleep(30)
			DelObj(Mon_Scr1)
			DelObj(Mon_Scr2)
			DelObj(Mon_Scr3)
			SetFlag(PlayBoy,544822,1)				--�ѩ�ʪ�
			DelObj(ObjID)
			return
end
---------------------------------------------------------------------------------------------------------
--�����@��

function PJ_Last_LeaveWoft()
		CloseSpeak(TargetID())
		SetFlag(TargetID(),544822,0)
		SetFlag(TargetID(),544965,1)
		local xyz1={-3252,49,-2573}--60
		local xyz2={-3242,50,-2596}--222
		local npc1=Lua_DW_CreateObj( "xyz" , 118000 , xyz1 , 1 , 60 , 1 )
			SetModeEx(npc1,EM_SetModeType_Mark,FALSE) 
		local npc2=Lua_DW_CreateObj( "xyz" , 117450 , xyz2 , 1 , 222 , 1 )
			SetModeEx(npc2,EM_SetModeType_Mark,FALSE) 
		local npc3=Lua_DW_CreateObj("obj",118116,OwnerID())
			SetModeEx(npc3,EM_SetModeType_Mark,FALSE) 
			Sleep(10)
			DW_MoveDirectToFlag( npc1,780864,1,10,1)
			sleep(10)
			AdjustFaceDir(npc2,npc3,0)
			AdjustFaceDir(npc3,npc2,0)
			sleep(10)
			Say(npc3,"[SC_423797_AF_01]")
			sleep(40)
			say(npc2,"[SC_423797_AF_02]")
			sleep(10)
			PlayMotion(npc3 , ruFUSION_ACTORSTATE_EMOTE_CRY)
			--DW_MoveDirectToFlag( npc2,780871,10,10,1)780864
			DW_MoveDirectToFlag( npc2,780864,1,10,1)
			Sleep(30)
			Delobj(npc1)
			Delobj(npc2)
			Delobj(npc3)
			SetFlag(TargetID(),544965,0)
end

--�����@��
function lua_z14q423835_Complete()
	SetFlag(TargetID(),544980,1)
	SetFlag(TargetID(),544981,1)
end