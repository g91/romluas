---------------------------------CheckType----------------------------------------
function Lua_Zone14_PE01_CheckMapID( Obj )
	Obj = Obj or OwnerID()
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	if CheckMapID(x,y,z,418)==true or CheckMapID(x,y,z,1)==true then
		return true
	end
	ScriptMessage( Obj, Obj, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

function Lua_Zone14_PE01_CheckPID01()--�ˬdpid�O�_��140101
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	return FALSE
end

function Lua_Zone14_PE01_CheckPID02()--�ˬdpid�O�_��140102
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	return FALSE
end
function Lua_Zone14_PE01_CheckPID01a()--�ˬdpid�O�_��140101
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE01_CheckPID02a()--�ˬdpid�O�_��140102
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE01_CheckPID03()--�ˬd�O�_���_�I�̩Χ���
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_PID)==140102 or ReadRoleValue(Tid,EM_RoleValue_PID)==140101 then
		if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
			return TRUE
		end
	end
	return FALSE
end

function Lua_Zone14_PE01_CheckPowerFriend()
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		local FriendGroup = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
		for i in pairs(FriendGroup) do
			if ReadRoleValue(FriendGroup[i],EM_RoleValue_OrgID )==Zone14_PE01_Var["Friend"][2] then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR01]" , 0 )--���񦳻�ɤΫ_�I��
				return false
			end
		end
		return true
	elseif ReadRoleValue(Tid,EM_RoleValue_Register7)==1 then--�ؼХ��b���L���a���
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--�o�ӤH���b�P�t�~�@��ⶤ���
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	end
	return false
end

function Lua_Zone14_PE01_CheckAreaCtrl()--�ˬd�P��O�_���_�I��
	local Oid = OwnerID()
	local Group = Zone14_PE01_Var["NPCGroup"]
	local FriendGroup = {}
	for i in pairs(Group) do
		if GetDistance(Oid, Group[i]["Ctrl"] )<=100 then
			FriendGroup = Group[i]["Friend"]
			if table.getn(FriendGroup)==0 then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR02]" , 0 )--�o�̨S���_�I��
				return false
			else
				for j in pairs(FriendGroup) do
					if CheckBuff(FriendGroup[j],509096)==true or CheckBuff(FriendGroup[j],509097)==true then
						return true
					end
				end
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR06]" , 0 )--�����٨S���H��A�_�áA���ӨS�����n�t�W����......
				return false
			end
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR02]" , 0 )--�o�̨S���_�I��
	return false
end

function Lua_Zone14_PE01_CheckBuff01()--�ˬd�d�򤺪��_�I�̬O�_���ت��ӥB�ؼЬO����
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
		if table.getn(Group)==0 then
			return TRUE
		else
			for i in pairs(Group) do
				if CheckBuff(Group[i],509098)~=TRUE then--�S���ت�
					ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR03]" , 0 )--�����٦��_�I��
					return FALSE
				end
			end
			return TRUE
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
		return FALSE
	end
end

function Lua_Zone14_PE01_CheckBuff02()--�ˬd�ؼЬO�����B���аO,�ӥB�P��S���_�I��
	local Oid = OwnerID()
	local Tid = TargetID()--����
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
		if table.getn(Group)==0 then
			return true
		else
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR03]" , 0 )--�����٦��_�I��
			return false
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
		return false
	end
end

function Lua_Zone14_PE01_CheckMap01()--�ˬd�ؼЬ��_�I�̥B�ϰ�b�ԯ����ȥ~
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==1 then
		if ReadRoleValue(Tid,EM_RoleValue_Register6)==1 then--�w���X���~
			if KS_CheckBuffLV(Tid,508960)>=30 then
				return TRUE
			else
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR04]" , 0 )--�ؼШ��W[508960]���F��30�h
			end
		else
			ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
			return FALSE
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
		return FALSE
	end
end

---------------------------------Skill----------------------------------------
function Lua_Zone14_PE01_PlayerAction( Oid , SkillNum )
	Oid = Oid or OwnerID()
	local timer = 0
	local times = 5
	if SkillNum>6 and SkillNum<10 then
		times = 3
	elseif SkillNum>12 and SkillNum<15 then
		times = 6
	end
	while 1 do
		if ReadRoleValue(Oid,EM_RoleValue_Register10)==1 then
			if SkillNum==2 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==4 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==5 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==6 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==7 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==8 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==9 then
				Lua_Zone14_PE01_PlayMotoin(Oid,timer,SkillNum)
			elseif SkillNum==14 then
				Lua_Zone14_PE01_PlayMotoin(Oid,math.random(4),13)
			end
		else
			break
		end
		if timer<times then
			Sleep(10)
			timer = timer+1
		elseif timer >= times then
			Sleep(1)
		end
	end
end

function Lua_Zone14_PE01_PlayMotoin( Oid , Action , SkillType )
	Oid = Oid or OwnerID()
	if SkillType==2 then
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_LAUGH )--�j��
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
		elseif Action ==3 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_VICTORY )--�ӧQ�A�w�I
		end
	elseif SkillType==4 then
		if Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
			local TalkString = { "[SC_PE_ZONE14_01_TALK17]","[SC_PE_ZONE14_01_TALK18]","[SC_PE_ZONE14_01_TALK19]","[SC_PE_ZONE14_01_TALK20]","[SC_PE_ZONE14_01_TALK21]" }
			Say( Oid , TalkString[kg_Rand(5)] )
		elseif Action==4 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--���V
		end
	elseif SkillType==5 then
		if Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_ANGRY )--�ͮ�
			local TalkString = {"[SC_PE_ZONE14_01_TALK22]","[SC_PE_ZONE14_01_TALK23]","[SC_PE_ZONE14_01_TALK24]"}
			Say( Oid , TalkString[kg_Rand(3)] )
		elseif Action==4 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--���V
		end
	elseif SkillType==6 then
		if Action==2 then
			SysCastSpellLv( Oid , Oid , 497248 , 1 ) --�s�鰱����]
			if ReadRoleValue(Oid,EM_RoleValue_Register9)~=0 then
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
				Say(Oid,"[SC_PE_ZONE14_01_TALK02]")--�n���n�ڧ��I�Ƶ��A���ڡH
			else
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y
				Say(Oid,"[SC_PE_ZONE14_01_TALK05]")--���ڭ̻ȳ���|���y�I
			end
		elseif Action==4 then
			SysCastSpellLv( Oid , Oid , 497248 , 0 ) --�s�鰱����]
			if ReadRoleValue(Oid,EM_RoleValue_Register9)~=0 then
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--���V
				Say(Oid,"[SC_PE_ZONE14_01_TALK03]")--���W�_���I�A���ڤp���I�I
				WriteRoleValue(Oid,EM_RoleValue_Register9,0)
			else
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
				Say(Oid,"[SC_PE_ZONE14_01_TALK06]")--�U���A���ڬݨ�A�ոլݡI
				WriteRoleValue(Oid,EM_RoleValue_Register9,1)
			end
		end
	elseif SkillType==7 then
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
			--Say(Oid,"[SC_PE_ZONE14_01_TALK08]")--ť�p�������A�����H���H���C
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
			--Say(Oid,"[SC_PE_ZONE14_01_TALK09]")--ť���A��������X�o�C
		end
	elseif SkillType==8 then
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
			--Say(Oid,"[SC_PE_ZONE14_01_TALK11]")--�ڤ����D�I�j�a���b���A�ҥH��ı�o���Ӹ�A���@�n�C
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
			--Say(Oid,"[SC_PE_ZONE14_01_TALK12]")--���U�I���H���ܧA�i�H�ۤv�h��p�����ݡI
		end
	elseif SkillType==9 then
		if Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
			Say(Oid,"[SC_PE_ZONE14_01_TALK14]")--�n�I�ڨ��I��ڨS�ӹL��F�a�H
		end
	elseif SkillType==13 then--13�P14�@��
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y
		elseif Action==3 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )--���x
		elseif Action==4 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--���V
		end
	end
end

function Lua_Zone14_PE01_AddDeBuff01()--�l�[�Q�{�H
	local Obj = TargetID()
	Lua_Zone14_PE01_AddDeBuff( Obj , 508962 , 1 )
end

function Lua_Zone14_PE01_AddDeBuff01a()--�l�[�Q�{�H�çP�w�����{
	local Oid = OwnerID()
	local Obj = TargetID()
	if ReadRoleValue( Obj,EM_RoleValue_Register8 )==0 then--�����|�����}
		if KS_CheckBuffLV(Obj,508962)+1>=Zone14_PE01_NpcDebuffMax[2]  then
			ks_QuestKill( Oid, 105336, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			--Say(Oid,"I got 2 QuestKey!")
			Say( Obj , "......".."[SC_PE_ZONE14_01_TALK26]" )
		end
		Lua_Zone14_PE01_AddDeBuff( Obj , 508962 , 1 )
	end
end

function Lua_Zone14_PE01_Skill01_Begin()
	local Oid=OwnerID()
	if Lua_Zone14_PE01_CheckMapID(Oid)==true then
		PlayMotion( Oid , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
		return TRUE
	end
	return false
end

function Lua_Zone14_PE01_Skill01()--�o���I......
	local Oid=OwnerID()
	AddBuff(Oid,508968,0,-1)--�ӹL��
	PlayMotion( Oid , ruFUSION_ACTORSTATE_CROUCH_END )
end

function Lua_Zone14_PE01_Skill02()--�j�n�W�W
	local Oid=OwnerID()
	AddBuff(Oid,508971,0,-1)--����
	SysCastSpellLv( Oid , Oid , 497248 , 0 )--������]
	local CheckBuffLV = KS_CheckBuffLV(Oid,508971)
	if CheckBuffLV==1 or CheckBuffLV==3 then
		Lua_Zone14_PE01_PlayMotoin(Oid,math.random(3),2)
	end
end

function Lua_Zone14_PE01_Skill02_End()
	local Oid=OwnerID()
	CancelBuff(Oid,508971)
	SysCastSpellLv( Oid , Oid , 497251 , 0 ) --�s������Ҽ{���H
end

function Lua_Zone14_PE01_Skill03()--�ӹL��......
	local Tid = TargetID()
	local Pid = ReadRoleValue(Tid,EM_RoleValue_PID)
	if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		if Pid ==140101 then
			Say(Tid,"......")
			local CurrentLevel = KS_CheckBuffLV(Tid,508960)
			AddBuff(Tid,508970,14,-1) --���]����
			if CurrentLevel>=15 then
				local BuffLevel = CurrentLevel
				BuffLevel = BuffLevel-3
				CancelBuff(Tid,508960)
				AddBuff(Tid,508960,BuffLevel-1,-1)
				WriteRoleValue(Tid,EM_RoleValue_Register9,BuffLevel)
				--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
			end
		elseif Pid == 140102 then
			if CheckBuff(Tid,508962)~=TRUE then--�Y�S�Ҽ{���H�h�ߨ���o�@�h
				Lua_Zone14_PE01_AddDeBuff( Tid , 508962 , 1 )
			end
		end
	end
end

function Lua_Zone14_PE01_Skill04()--���ƶ�
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then
		WriteRoleValue(Tid,EM_RoleValue_Register7,1)
		AdjustFaceDir( Tid,Oid,0 )
		CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 60 )
		if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497151,"Name") , 50 , 0, 0, 0 , "Lua_Zone14_PE01_Skill04_CheckStatus")==1 then
			WriteRoleValue(Oid,EM_RoleValue_Register10,1)
			CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 4)
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--�o�ӤH���b�P�t�~�@��ⶤ���
	end
end

function Lua_Zone14_PE01_Skill04_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
			local randNum = math.random(100)
			if randNum<(51-kg_CheckBuff(Oid,508967)*5) then--���\�h��o�����{
				CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--�������]
				BeginPlot( Tid,"Lua_Zone14_PE01_NPCLeave",0 )
				ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				--Say(Oid, "I got 1 QuestKey!" )
				Say(Tid,"[SC_PE_ZONE14_01_TALK25]")
			else
				AddBuff(Tid,508978,0,-1) --�L�����O
				Say(Tid,"......")
				WriteRoleValue(Tid,EM_RoleValue_Register7,0)
			end
		else
			Say(Tid,"......")
		end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end


function Lua_Zone14_PE01_Skill05()--���D�o�t
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then
		WriteRoleValue(Tid,EM_RoleValue_Register7,1)
		AdjustFaceDir( Tid,Oid,0 )
		CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 60 )
		if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497152,"Name") , 50 , 0, 0, 0 , "Lua_Zone14_PE01_Skill05_CheckStatus")==1 then
			WriteRoleValue(Oid,EM_RoleValue_Register10,1)
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )
			CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 5)
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--�o�ӤH���b�P�t�~�@��ⶤ���
	end
end

function Lua_Zone14_PE01_Skill05_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		Say(Tid , ".....".."[SC_PE_ZONE14_01_TALK26]" )--�_�I�̦^��
		ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		--Say(Oid, "I got 1 QuestKey!" )
		local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]
		for i in pairs(Group["Friend"]) do
			CancelBuff( Group["Friend"][i] , Zone14_PE01_Var["NPCBuffID"][1] )
			CancelBuff(Group["Friend"][i] , 508978 )
			BeginPlot( Group["Friend"][i],"Lua_Zone14_PE01_NPCLeave",0 )
		end
		for i in pairs(Group["Enemy"]) do
			BeginPlot( Group["Enemy"][i],"Lua_Zone14_PE01_NPCLeave",0 )
			ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			--Say(Oid, "I got 1 QuestKey!" )
		end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end

function Lua_Zone14_PE01_Skill06()--�G�N����
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then
		WriteRoleValue(Tid,EM_RoleValue_Register7,1)
		AdjustFaceDir( Tid,Oid,0 )
		CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 60 )
		if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497153,"Name") , 50 , 0, 0, 0 , "Lua_Zone14_PE01_Skill06_CheckStatus")==1 then
			WriteRoleValue(Oid,EM_RoleValue_Register10,1)
			SysCastSpellLv( Oid , Oid , 497248 , 1 ) --�s�鰱����]
			if ReadRoleValue(Oid,EM_RoleValue_Register9)~=0 then
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )
				Say(Oid,"[SC_PE_ZONE14_01_TALK01]")
			else
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
				Say(Oid,"[SC_PE_ZONE14_01_TALK04]")
			end
			CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 6 )
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--�o�ӤH���b�P�t�~�@��ⶤ���
	end
end

function Lua_Zone14_PE01_Skill06_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		SysCastSpellLv( Oid , Oid , 497252 , 0 )	--�ӹL�����ê�
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
		Say(Tid,"......")
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end

function Lua_Zone14_PE01_Skill06_End()
	local Tid = TargetID()
	local Pid = ReadRoleValue(Tid,EM_RoleValue_PID)
	if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		if Pid ==140101 then
			local CurrentLevel = KS_CheckBuffLV(Tid,508960)
			if CurrentLevel>=15 then
				local BuffLevel = CurrentLevel
				BuffLevel = BuffLevel-3
				CancelBuff(Tid,508960)
				AddBuff(Tid,508960,BuffLevel-1,-1)
				WriteRoleValue(Tid,EM_RoleValue_Register9,BuffLevel)
				--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
			end
		elseif Pid == 140102 then
			Lua_Zone14_PE01_AddDeBuff( Tid , 508962 , 1 )
		end
	end
end

function Lua_Zone14_PE01_CheckFriendBuff( Tid , Type )--�ˬd����_�I�̦��S���_�éΤ��H��
	local Oid =OwnerID()
	local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
	for i in pairs(Group) do
		if Type ==0 then
			if CheckBuff(Tid,509096)==true or CheckBuff(Tid,509097)==true then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_MESSAGE02]" , 0 )--�w�g���H�_�äF......
				return FALSE
			end
		elseif Type==1 then
			if CheckBuff(Tid,509097)==true then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_MESSAGE01]" , 0 )--�A�o�ˤU�h�L�̫����|�o�{���I
				return FALSE
			end
		end
	end
	return TRUE
end

function Lua_Zone14_PE01_Skill07()--���@����
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then--�ӫ_�I�̥ثe�S���Q���󪱮a��w
		if Lua_Zone14_PE01_CheckFriendBuff( Tid , 0)==TRUE then
			WriteRoleValue(Tid,EM_RoleValue_Register7,1)
			AdjustFaceDir( Tid,Oid,0 )
			CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 40 )
			if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497154,"Name") , 30 , 0, 0, 0 , "Lua_Zone14_PE01_Skill07_CheckStatus")==1 then
				WriteRoleValue(Oid,EM_RoleValue_Register10,1)
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
				local CurrentTalk = ReadRoleValue(Oid,EM_RoleValue_Register9)
				if CurrentTalk==1 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK08]")--ť�p�������A�����H���H���C
					WriteRoleValue(Oid, EM_RoleValue_Register9,2)
				elseif CurrentTalk==2 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK09]")--ť���A��������X�o�C
					WriteRoleValue(Oid, EM_RoleValue_Register9,3)
				else
					Say(Oid,"[SC_PE_ZONE14_01_TALK07]")--��ť���p�����n�ԩާA�I
					WriteRoleValue(Oid, EM_RoleValue_Register9,1)
				end
				CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 7 )
			end
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--�o�ӤH���b�P�t�~�@��ⶤ���
	end
end

function Lua_Zone14_PE01_Skill07_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		local randNum = math.random(100)
		if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
			if randNum<(61-kg_CheckBuff(Oid,508967)*5) then--���\�h��o�����{
				Say(Tid,"[SC_PE_ZONE14_01_TALK25]")
				CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--�������]
				BeginPlot( Tid,"Lua_Zone14_PE01_NPCLeave",0 )
				CallPlot(Tid,"Lua_Zone14_PE01_DelAndReborn",30 , 100 )--3������,10��᭫��
				ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				--Say(Oid, "I got 1 QuestKey!" )
			else
				AddBuff(Tid,509096,60,-1) --�_��
				Say(Tid,"......")
				WriteRoleValue(Tid,EM_RoleValue_Register7,0)
			end
		else Say(Tid,"......") end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end

function Lua_Zone14_PE01_Skill08()--�t�@�����Ӷ�
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then--�ӫ_�I�̥ثe�S���Q���󪱮a��w
		if Lua_Zone14_PE01_CheckFriendBuff( Tid , 1 )==TRUE then
			WriteRoleValue(Tid,EM_RoleValue_Register7,1)
			AdjustFaceDir( Tid,Oid,0 )
			CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 40 )
			if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497155,"Name") , 30 , 0, 0, 0 , "Lua_Zone14_PE01_Skill08_CheckStatus")==1 then
				WriteRoleValue(Oid,EM_RoleValue_Register10,1)
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
				local CurrentTalk = ReadRoleValue(Oid,EM_RoleValue_Register9)
				if CurrentTalk==1 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK11]")--�ڤ����D�I�j�a���b���A�ҥH��ı�o���Ӹ�A���@�n�C
					WriteRoleValue(Oid, EM_RoleValue_Register9,2)
				elseif CurrentTalk==2 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK12]")--���U�I���H���ܧA�i�H�ۤv�h��p�����ݡI
					WriteRoleValue(Oid, EM_RoleValue_Register9,3)
				else
					Say(Oid,"[SC_PE_ZONE14_01_TALK10]")--���ڤ]�Oť�O�H����
					WriteRoleValue(Oid, EM_RoleValue_Register9,1)
				end
				CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 8 )
			end
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--�o�ӤH���b�P�t�~�@��ⶤ���
	end
end

function Lua_Zone14_PE01_Skill08_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		local randNum = math.random(100)
		if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
			if randNum<(61-kg_CheckBuff(Oid,508967)*5) then--���\�h��o�����{
				CancelBuff(Tid,509096)--�����_��
				CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--�������]
				BeginPlot( Tid,"Lua_Zone14_PE01_NPCLeave",0 )
				CallPlot(Tid,"Lua_Zone14_PE01_DelAndReborn",30 , 100 )--3������,10��᭫��
				ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				--Say(Oid, "I got 1 QuestKey!" )
			else
				CancelBuff(Tid,509096)--�����_��
				AddBuff(Tid,509097,60,-1) --���H��
				WriteRoleValue(Tid,EM_RoleValue_Register7,0)
			end
		else Say(Tid,"......") end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end

function Lua_Zone14_PE01_Skill09()--��ڨS�ӹL
	local Oid = OwnerID()
	local Tid = TargetID()
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497156,"Name") , 50 , 0, 0, 0 , "Lua_Zone14_PE01_Skill09_CheckStatus")==1 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,1)
		PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
		Say(Oid,"[SC_PE_ZONE14_01_TALK13]")--��F�A�ڬO�@�f�n�N�A�u�ǤߡI
		CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 9 )
	end
end

function Lua_Zone14_PE01_Skill09_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		local randNum = math.random(100)
		if randNum<(61-kg_CheckBuff(Oid,508967)*5) then
			SysCastSpellLv(Oid,Oid,497255,0)--���\�h��ְ_�éΤ��H�����ɶ�
		end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
	end
end

function Lua_Zone14_PE01_Skill09_End()--��ڨS�ӹL��P��_�I�̪��v�T
	local Tid =TargetID()
	local BuffTime = 0
	if CheckBuff(Tid,509096)==TRUE then
		BuffTime = kg_CheckBuffTime( Tid, 509096 )
		BuffTime = BuffTime-30
		if BuffTime<=0 then
			CancelBuff(Tid,509096)
		else
			AddBuff(Tid,509096,BuffTime,-1) --�_��
		end
	elseif CheckBuff(Tid,509097)==TRUE then
		BuffTime = kg_CheckBuffTime( Tid, 509097 )
		BuffTime = BuffTime-30
		if BuffTime<=0 then
			CancelBuff(Tid,509097)
		else
			AddBuff(Tid,509097,BuffTime,-1) --���H��
		end
	end
end

function Lua_Zone14_PE01_Skill10()--�O�K��w
	local Tid =TargetID()--�_�I�̻P����
	local Pid = ReadRoleValue(Tid,EM_RoleValue_PID)
	if Pid == 140101 then
		CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--�������]
		CallPlot(Tid,"Lua_Zone14_PE01_NPCLeave",Tid,0, 10, 100 )
		SysCastSpellLv( Tid,Tid,495735,0 )--�ǰe�S��
	elseif Pid == 140102 then
		CallPlot(Tid,"Lua_Zone14_PE01_EnemyDelayLeave",Tid,70,0)--���Ѫ����}
	end
end

function Lua_Zone14_PE01_DelAndReborn( DelayTime , RebornWaitTime )
	DelayTime = DelayTime or 30
	RebornWaitTime = RebornWaitTime or 100
	local Oid =OwnerID()
	local Pid = ReadRoleValue(Oid,EM_RoleValue_PID)
	local RefObj  = ReadRoleValue( Oid,EM_RoleValue_Register3 )
	if DelayTime>0 then Sleep(DelayTime) end
	if Pid == 140101 then
		CallPlot( RefObj , "Lua_Zone14_PE01_ReBornNPC" , RefObj , 0  , RebornWaitTime )--10��᭫�ͫ_�I�������
	elseif Pid == 140102 then
		CallPlot( RefObj , "Lua_Zone14_PE01_ReBornNPC" , RefObj , 1  , RebornWaitTime )--10��᭫�ͫ_�I�������
	end
	DelObj(Oid)
end

function Lua_Zone14_PE01_Skill11()--�@������
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckBuff(Tid,509099)==TRUE then	----�ǰe�аO
		CallPlot(Tid,"Lua_Zone14_PE01_NPCLeave",Tid,0, 10, 100 )
		SysCastSpellLv( Tid,Tid,495735,0 )--�ǰe�S��
		ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		--Say(Oid, "I got 1 QuestKey!" )
	end
end

function Lua_Zone14_PE01_Skill12()--�z�Z�k��
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckBuff(Oid,509100)==TRUE then--�٦����γN
		AddBuff(Tid,509103,0,-1)--�C��������]��1
	else
		magicinterrupt(Oid)
	end
end

function Lua_Zone14_PE01_Skill_CheckHidePlayer()--�������Ѩ��}�ɩ�d��k�N�������������a��o�����{
	local Tid =TargetID()--���a
	if CheckBuff(Tid,509100)==TRUE then--���γN
		ks_QuestKill( Tid, 105336, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		--Say(Tid, "I got 1 QuestKey!" )
	end
end

function Lua_Zone14_PE01_Skill13()--�ޥ��ʸձ��@��
	local Oid = OwnerID()
	local Tid = TargetID()
	AdjustFaceDir( Tid,Oid,0 )
	AddBuff(Oid,508971,0,-1)--����
	local Ctrl = ReadRoleValue(Tid,EM_RoleValue_Register2)
	AddBuff( Ctrl ,509093,0,-1)--�y�b���ŭ��C��b�s�դ������W
	local CheckBuffLV = KS_CheckBuffLV(Oid,508971)--����
	if CheckBuffLV==1 or CheckBuffLV==3 or CheckBuffLV==5 then
		Lua_Zone14_PE01_PlayMotoin(Oid,math.random(4),13)
	end
end

function Lua_Zone14_PE01_Skill13_End()--�ޥ��ʸձ�����
	local Oid = OwnerID()
	CancelBuff(Oid,508971)--����
end

function Lua_Zone14_PE01_Skill14()--����ʷt��
	local Oid = OwnerID()
	local Tid = TargetID()
	AdjustFaceDir( Tid,Oid,0 )
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497168,"Name") , 60 , 0, 0, 0 , "Lua_Zone14_PE01_Skill14_CheckStatus")==1 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,1)
		Lua_Zone14_PE01_PlayMotoin(Oid,math.random(4),13)
		CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 14 )
	end
end

function Lua_Zone14_PE01_Skill14_CheckStatus( ObjID, CheckStatus ) --����ʷt��
	local Oid =OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		if CheckBuff(Tid,508964)==true then
			CallPlot(Tid,"Lua_Zone14_PE01_EnemyDelayLeave",Tid,1,0)--���Ѫ����}
			ks_QuestKill( Oid, 105336, 10 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			--Say(Oid, "I got 10 QuestKey!" )
		elseif CheckBuff(Tid,508963)==true then
			CallPlot(Tid,"Lua_Zone14_PE01_EnemyDelayLeave",Tid,1,0)--���Ѫ����}
			ks_QuestKill( Oid, 105336, 5 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			--Say(Oid, "I got 5 QuestKey!" )
		else
			local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]--�P�s�ժ��_�I��
			--DebugMsg(0,0,"Group Count = "..table.getn(Group))
			for i in pairs(Group) do
				CallPlot(Group[i],"Lua_Zone14_PE01_AddDeBuff",Group[i],508960,30)
			end
		end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
	end
end

function Lua_Zone14_PE01_Skill15()--�ä����@��
	local Oid = OwnerID()
	local Tid = TargetID()
	local TempString = { "[SC_PE_ZONE14_01_TALK27]","[SC_PE_ZONE14_01_TALK28]","[SC_PE_ZONE14_01_TALK29]","[SC_PE_ZONE14_01_TALK30]","[SC_PE_ZONE14_01_TALK31]" }
	Say( Oid , TempString[kg_Rand(5)] )
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497172,"Name") , 40 , 0, 0, 0 , "Lua_Zone14_PE01_Skill15_CheckStatus")==1 then
		Lua_Zone14_PE01_Skill15_CancelBuff(Oid,Tid)
	end
end

function Lua_Zone14_PE01_Skill15_CheckStatus( ObjID, CheckStatus )
	local Oid =OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		EndCastBar(Oid,CheckStatus)
		Lua_Zone14_PE01_Skill15_CancelBuff(Oid,Tid)
	else
		EndCastBar(Oid,CheckStatus)
	end
end

function Lua_Zone14_PE01_Skill15_CancelBuff(Oid,Tid)
	local randNum = math.random(100)
	if CheckBuff(Tid,508960)==TRUE then
		if randNum<(21-kg_CheckBuff(Oid,508967)*5) then
			CancelBuff(Tid,508960)
			BeginPlot(Tid,"Lua_Zone14_PE01_Skill15_GoAway",1 )
			ks_QuestKill( Oid, 105336, 8 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			--Say(Oid, "I got 8 QuestKey!" )
			randNum = math.random(100)
			if randNum<(41-kg_CheckBuff(Oid,508967)*5) then
				ks_QuestKill( Oid, 105336, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				--Say(Oid, "I got 2 QuestKey!" )
			end
		end
	end
end

function Lua_Zone14_PE01_Skill15_GoAway()
	local Oid = OwnerID()--�_�I��
	local x,y,z,_ = kg_GetRangePos(Oid,nil,100,math.random(360))
	Say(Oid,"[SC_PE_ZONE14_01_TALK16]")
	KS_Move( Oid , 30, x , y , z )
	Sleep(100)
	CallPlot(Oid,"Lua_Zone14_PE01_DelAndReborn",0,0)--0������,0��᭫��
	DelObj(Oid)
end

function Lua_Zone14_PE01_Skill16()--�]�O����
	local Tid = TargetID()
	local BuffLv= KS_CheckBuffLV(Tid,508960)
	BuffLv = BuffLv-2
	if BuffLv>=1 then
		CancelBuff(Tid,508960)
		AddBuff(Tid,508960,BuffLv-1,-1)
		WriteRoleValue(Tid,EM_RoleValue_Register9,BuffLv )--������e���]��
		--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
	else
		CancelBuff(Tid,508960)
		WriteRoleValue(Tid,EM_RoleValue_Register9,0 )--������e���]��
		--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
	end
end

function Lua_Zone14_PE01_Skill17()--�@�{�Y�u
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140102 then
		Lua_Zone14_PE01_NPCLeave( Tid )
		local RefObj  = ReadRoleValue( Tid,EM_RoleValue_Register3 )
		CallPlot( RefObj , "Lua_Zone14_PE01_ReBornNPC" , RefObj , 1  , 100 )
		if KillID( Oid, Tid )==TRUE then
			ks_QuestKill( Oid, 105336, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			--Say(Oid, "I got 1 QuestKey!" )
		end
	end
end

function Lua_Zone14_PE01_Skill18_End()--�ت�����
	local Oid =OwnerID()
	local Group =Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Oid,EM_RoleValue_Register1)]["Enemy"]
	if table.getn(Group)==0 then
		--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--�Ψ�������
		Lua_Zone14_PE01_NPCLeave(Oid )
		Say(Oid,"[SC_PE_ZONE14_01_TALK15]")
		CallPlot(Oid,"Lua_Zone14_PE01_DelAndReborn",30 , 100 )--3������,10��᭫��
	end
end

--==================================================================
function Lua_Zone14_PE01_UnlockSpeak( DelayTime )
	local Oid = OwnerID()--�@��O�_�I��
	local Ctrl = ReadRoleValue(Oid,EM_RoleValue_Register2)
	DelayTime = DelayTime or 100
	Sleep(DelayTime)
	WriteRoleValue(Oid,EM_RoleValue_Register7,0)
	AdjustFaceDir( Oid,Ctrl,0 )
end

function Lua_Zone14PE01_QuestComplete()--�������Ȱ���
	local Player = TargetID()
	if LuaPE_KS_CleanBuff( Player ) == true then
		local BuffID = 509176
		local Buff = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2 )
		if CheckBuff( Player, Buff ) == true and Buff ~= BuffID then
			CancelBuff( Player, Buff )
			WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			DebugMsg(0,0,"14PE01 QuestFin Count = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
			return
		end
		
		local PECount = ReadRoleValue( Player, EM_LuaValueFlag_PECount )		
		local Lv = KS_CheckBuffLV( Player, BuffID )
		DebugMsg(0,0,"Old PECount = "..PECount.."; BuffLV = "..Lv)
		if Lv > 0 or ( Lv == 0 and PECount > 5 ) then--�ثe�i�檺PE���ȧ�������
			if Lv == 0 and PECount > 5 then
				WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			end
			AddBuff( Player, BuffID, 0, -1 )
			WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2, BuffID )--�ثe�i�檺PE�Ҫ��a�����y���A
			DebugMsg(0,0,"New PECount = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
		end

	end
end