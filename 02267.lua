---------------------------------CheckType----------------------------------------
function Lua_Zone14_PE01_CheckMapID( Obj )
	Obj = Obj or OwnerID()
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	if CheckMapID(x,y,z,418)==true or CheckMapID(x,y,z,1)==true then
		return true
	end
	ScriptMessage( Obj, Obj, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

function Lua_Zone14_PE01_CheckPID01()--檢查pid是否為140101
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	return FALSE
end

function Lua_Zone14_PE01_CheckPID02()--檢查pid是否為140102
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	return FALSE
end
function Lua_Zone14_PE01_CheckPID01a()--檢查pid是否為140101
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE01_CheckPID02a()--檢查pid是否為140102
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE01_CheckPID03()--檢查是否為冒險者或村民
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
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR01]" , 0 )--附近有領導及冒險者
				return false
			end
		end
		return true
	elseif ReadRoleValue(Tid,EM_RoleValue_Register7)==1 then--目標正在跟其他玩家對話
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--這個人正在與另外一位領隊對話
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	end
	return false
end

function Lua_Zone14_PE01_CheckAreaCtrl()--檢查周圍是否有冒險者
	local Oid = OwnerID()
	local Group = Zone14_PE01_Var["NPCGroup"]
	local FriendGroup = {}
	for i in pairs(Group) do
		if GetDistance(Oid, Group[i]["Ctrl"] )<=100 then
			FriendGroup = Group[i]["Friend"]
			if table.getn(FriendGroup)==0 then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR02]" , 0 )--這裡沒有冒險者
				return false
			else
				for j in pairs(FriendGroup) do
					if CheckBuff(FriendGroup[j],509096)==true or CheckBuff(FriendGroup[j],509097)==true then
						return true
					end
				end
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR06]" , 0 )--附近還沒有人對你起疑，應該沒有必要演獨角戲......
				return false
			end
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR02]" , 0 )--這裡沒有冒險者
	return false
end

function Lua_Zone14_PE01_CheckBuff01()--檢查範圍內的冒險者是否有目盲而且目標是村民
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
		if table.getn(Group)==0 then
			return TRUE
		else
			for i in pairs(Group) do
				if CheckBuff(Group[i],509098)~=TRUE then--沒有目盲
					ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR03]" , 0 )--附近還有冒險者
					return FALSE
				end
			end
			return TRUE
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
		return FALSE
	end
end

function Lua_Zone14_PE01_CheckBuff02()--檢查目標是村民且有標記,而且周圍沒有冒險者
	local Oid = OwnerID()
	local Tid = TargetID()--村民
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140102 and ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
		if table.getn(Group)==0 then
			return true
		else
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR03]" , 0 )--附近還有冒險者
			return false
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
		return false
	end
end

function Lua_Zone14_PE01_CheckMap01()--檢查目標為冒險者且區域在拉索斐亞外
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140101 and ReadRoleValue(Tid,EM_RoleValue_Register8)==1 then
		if ReadRoleValue(Tid,EM_RoleValue_Register6)==1 then--已走出村外
			if KS_CheckBuffLV(Tid,508960)>=30 then
				return TRUE
			else
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR04]" , 0 )--目標身上[508960]未達到30層
			end
		else
			ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
			return FALSE
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
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
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_LAUGH )--大笑
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
		elseif Action ==3 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_VICTORY )--勝利，歡呼
		end
	elseif SkillType==4 then
		if Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
			local TalkString = { "[SC_PE_ZONE14_01_TALK17]","[SC_PE_ZONE14_01_TALK18]","[SC_PE_ZONE14_01_TALK19]","[SC_PE_ZONE14_01_TALK20]","[SC_PE_ZONE14_01_TALK21]" }
			Say( Oid , TalkString[kg_Rand(5)] )
		elseif Action==4 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--指向
		end
	elseif SkillType==5 then
		if Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_ANGRY )--生氣
			local TalkString = {"[SC_PE_ZONE14_01_TALK22]","[SC_PE_ZONE14_01_TALK23]","[SC_PE_ZONE14_01_TALK24]"}
			Say( Oid , TalkString[kg_Rand(3)] )
		elseif Action==4 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--指向
		end
	elseif SkillType==6 then
		if Action==2 then
			SysCastSpellLv( Oid , Oid , 497248 , 1 ) --群體停止著魔
			if ReadRoleValue(Oid,EM_RoleValue_Register9)~=0 then
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
				Say(Oid,"[SC_PE_ZONE14_01_TALK02]")--要不要我找點事給你做啊？
			else
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭
				Say(Oid,"[SC_PE_ZONE14_01_TALK05]")--給我們銀野協會丟臉！
			end
		elseif Action==4 then
			SysCastSpellLv( Oid , Oid , 497248 , 0 ) --群體停止著魔
			if ReadRoleValue(Oid,EM_RoleValue_Register9)~=0 then
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--指向
				Say(Oid,"[SC_PE_ZONE14_01_TALK03]")--莫名奇妙！你給我小心點！
				WriteRoleValue(Oid,EM_RoleValue_Register9,0)
			else
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
				Say(Oid,"[SC_PE_ZONE14_01_TALK06]")--下次再讓我看到你試試看！
				WriteRoleValue(Oid,EM_RoleValue_Register9,1)
			end
		end
	elseif SkillType==7 then
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
			--Say(Oid,"[SC_PE_ZONE14_01_TALK08]")--聽小隊長說你媽媽寄的信剛到。
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
			--Say(Oid,"[SC_PE_ZONE14_01_TALK09]")--聽說你的隊伍剛剛出發耶
		end
	elseif SkillType==8 then
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
			--Say(Oid,"[SC_PE_ZONE14_01_TALK11]")--我不知道！大家都在講，所以我覺得應該跟你說一聲。
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
			--Say(Oid,"[SC_PE_ZONE14_01_TALK12]")--拜託！不信的話你可以自己去找小隊長問！
		end
	elseif SkillType==9 then
		if Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
			Say(Oid,"[SC_PE_ZONE14_01_TALK14]")--好！我走！當我沒來過行了吧？
		end
	elseif SkillType==13 then--13與14共用
		if Action==1 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
		elseif Action==2 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭
		elseif Action==3 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )--鼓掌
		elseif Action==4 then
			PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )--指向
		end
	end
end

function Lua_Zone14_PE01_AddDeBuff01()--追加想閃人
	local Obj = TargetID()
	Lua_Zone14_PE01_AddDeBuff( Obj , 508962 , 1 )
end

function Lua_Zone14_PE01_AddDeBuff01a()--追加想閃人並判定關鍵表現
	local Oid = OwnerID()
	local Obj = TargetID()
	if ReadRoleValue( Obj,EM_RoleValue_Register8 )==0 then--村民尚未離開
		if KS_CheckBuffLV(Obj,508962)+1>=Zone14_PE01_NpcDebuffMax[2]  then
			ks_QuestKill( Oid, 105336, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
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

function Lua_Zone14_PE01_Skill01()--得找點......
	local Oid=OwnerID()
	AddBuff(Oid,508968,0,-1)--太過分
	PlayMotion( Oid , ruFUSION_ACTORSTATE_CROUCH_END )
end

function Lua_Zone14_PE01_Skill02()--大聲嚷嚷
	local Oid=OwnerID()
	AddBuff(Oid,508971,0,-1)--次數
	SysCastSpellLv( Oid , Oid , 497248 , 0 )--停止著魔
	local CheckBuffLV = KS_CheckBuffLV(Oid,508971)
	if CheckBuffLV==1 or CheckBuffLV==3 then
		Lua_Zone14_PE01_PlayMotoin(Oid,math.random(3),2)
	end
end

function Lua_Zone14_PE01_Skill02_End()
	local Oid=OwnerID()
	CancelBuff(Oid,508971)
	SysCastSpellLv( Oid , Oid , 497251 , 0 ) --群體村民考慮換人
end

function Lua_Zone14_PE01_Skill03()--太過分......
	local Tid = TargetID()
	local Pid = ReadRoleValue(Tid,EM_RoleValue_PID)
	if ReadRoleValue(Tid,EM_RoleValue_Register8)==0 then
		if Pid ==140101 then
			Say(Tid,"......")
			local CurrentLevel = KS_CheckBuffLV(Tid,508960)
			AddBuff(Tid,508970,14,-1) --著魔停止
			if CurrentLevel>=15 then
				local BuffLevel = CurrentLevel
				BuffLevel = BuffLevel-3
				CancelBuff(Tid,508960)
				AddBuff(Tid,508960,BuffLevel-1,-1)
				WriteRoleValue(Tid,EM_RoleValue_Register9,BuffLevel)
				--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
			end
		elseif Pid == 140102 then
			if CheckBuff(Tid,508962)~=TRUE then--若沒考慮換人則立刻獲得一層
				Lua_Zone14_PE01_AddDeBuff( Tid , 508962 , 1 )
			end
		end
	end
end

function Lua_Zone14_PE01_Skill04()--交辦事項
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
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--這個人正在與另外一位領隊對話
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
			if randNum<(51-kg_CheckBuff(Oid,508967)*5) then--成功則獲得關鍵表現
				CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--取消著魔
				BeginPlot( Tid,"Lua_Zone14_PE01_NPCLeave",0 )
				ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				--Say(Oid, "I got 1 QuestKey!" )
				Say(Tid,"[SC_PE_ZONE14_01_TALK25]")
			else
				AddBuff(Tid,508978,0,-1) --無視指令
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


function Lua_Zone14_PE01_Skill05()--藉題發飆
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
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--這個人正在與另外一位領隊對話
	end
end

function Lua_Zone14_PE01_Skill05_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		Say(Tid , ".....".."[SC_PE_ZONE14_01_TALK26]" )--冒險者回覆
		ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		--Say(Oid, "I got 1 QuestKey!" )
		local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]
		for i in pairs(Group["Friend"]) do
			CancelBuff( Group["Friend"][i] , Zone14_PE01_Var["NPCBuffID"][1] )
			CancelBuff(Group["Friend"][i] , 508978 )
			BeginPlot( Group["Friend"][i],"Lua_Zone14_PE01_NPCLeave",0 )
		end
		for i in pairs(Group["Enemy"]) do
			BeginPlot( Group["Enemy"][i],"Lua_Zone14_PE01_NPCLeave",0 )
			ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			--Say(Oid, "I got 1 QuestKey!" )
		end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end

function Lua_Zone14_PE01_Skill06()--故意找碴
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then
		WriteRoleValue(Tid,EM_RoleValue_Register7,1)
		AdjustFaceDir( Tid,Oid,0 )
		CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 60 )
		if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497153,"Name") , 50 , 0, 0, 0 , "Lua_Zone14_PE01_Skill06_CheckStatus")==1 then
			WriteRoleValue(Oid,EM_RoleValue_Register10,1)
			SysCastSpellLv( Oid , Oid , 497248 , 1 ) --群體停止著魔
			if ReadRoleValue(Oid,EM_RoleValue_Register9)~=0 then
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_POINT )
				Say(Oid,"[SC_PE_ZONE14_01_TALK01]")
			else
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
				Say(Oid,"[SC_PE_ZONE14_01_TALK04]")
			end
			CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 6 )
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--這個人正在與另外一位領隊對話
	end
end

function Lua_Zone14_PE01_Skill06_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		SysCastSpellLv( Oid , Oid , 497252 , 0 )	--太過分隱藏版
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

function Lua_Zone14_PE01_CheckFriendBuff( Tid , Type )--檢查附近冒險者有沒有起疑或不信任
	local Oid =OwnerID()
	local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]
	for i in pairs(Group) do
		if Type ==0 then
			if CheckBuff(Tid,509096)==true or CheckBuff(Tid,509097)==true then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_MESSAGE02]" , 0 )--已經有人起疑了......
				return FALSE
			end
		elseif Type==1 then
			if CheckBuff(Tid,509097)==true then
				ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_MESSAGE01]" , 0 )--再這樣下去他們持早會發現的！
				return FALSE
			end
		end
	end
	return TRUE
end

function Lua_Zone14_PE01_Skill07()--撒一個謊
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then--該冒險者目前沒有被任何玩家鎖定
		if Lua_Zone14_PE01_CheckFriendBuff( Tid , 0)==TRUE then
			WriteRoleValue(Tid,EM_RoleValue_Register7,1)
			AdjustFaceDir( Tid,Oid,0 )
			CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 40 )
			if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497154,"Name") , 30 , 0, 0, 0 , "Lua_Zone14_PE01_Skill07_CheckStatus")==1 then
				WriteRoleValue(Oid,EM_RoleValue_Register10,1)
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
				local CurrentTalk = ReadRoleValue(Oid,EM_RoleValue_Register9)
				if CurrentTalk==1 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK08]")--聽小隊長說你媽媽寄的信剛到。
					WriteRoleValue(Oid, EM_RoleValue_Register9,2)
				elseif CurrentTalk==2 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK09]")--聽說你的隊伍剛剛出發耶
					WriteRoleValue(Oid, EM_RoleValue_Register9,3)
				else
					Say(Oid,"[SC_PE_ZONE14_01_TALK07]")--我聽說小隊長要拉拔你！
					WriteRoleValue(Oid, EM_RoleValue_Register9,1)
				end
				CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 7 )
			end
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--這個人正在與另外一位領隊對話
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
			if randNum<(61-kg_CheckBuff(Oid,508967)*5) then--成功則獲得關鍵表現
				Say(Tid,"[SC_PE_ZONE14_01_TALK25]")
				CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--取消著魔
				BeginPlot( Tid,"Lua_Zone14_PE01_NPCLeave",0 )
				CallPlot(Tid,"Lua_Zone14_PE01_DelAndReborn",30 , 100 )--3秒後消失,10秒後重生
				ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				--Say(Oid, "I got 1 QuestKey!" )
			else
				AddBuff(Tid,509096,60,-1) --起疑
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

function Lua_Zone14_PE01_Skill08()--另一個謊來圓
	local Oid = OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register7)==0 then--該冒險者目前沒有被任何玩家鎖定
		if Lua_Zone14_PE01_CheckFriendBuff( Tid , 1 )==TRUE then
			WriteRoleValue(Tid,EM_RoleValue_Register7,1)
			AdjustFaceDir( Tid,Oid,0 )
			CallPlot( Tid, "Lua_Zone14_PE01_UnlockSpeak" , 40 )
			if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497155,"Name") , 30 , 0, 0, 0 , "Lua_Zone14_PE01_Skill08_CheckStatus")==1 then
				WriteRoleValue(Oid,EM_RoleValue_Register10,1)
				PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
				local CurrentTalk = ReadRoleValue(Oid,EM_RoleValue_Register9)
				if CurrentTalk==1 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK11]")--我不知道！大家都在講，所以我覺得應該跟你說一聲。
					WriteRoleValue(Oid, EM_RoleValue_Register9,2)
				elseif CurrentTalk==2 then
					Say(Oid,"[SC_PE_ZONE14_01_TALK12]")--拜託！不信的話你可以自己去找小隊長問！
					WriteRoleValue(Oid, EM_RoleValue_Register9,3)
				else
					Say(Oid,"[SC_PE_ZONE14_01_TALK10]")--其實我也是聽別人說的
					WriteRoleValue(Oid, EM_RoleValue_Register9,1)
				end
				CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 8 )
			end
		end
	else
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_01_ERROR05]" , 0 )--這個人正在與另外一位領隊對話
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
			if randNum<(61-kg_CheckBuff(Oid,508967)*5) then--成功則獲得關鍵表現
				CancelBuff(Tid,509096)--取消起疑
				CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--取消著魔
				BeginPlot( Tid,"Lua_Zone14_PE01_NPCLeave",0 )
				CallPlot(Tid,"Lua_Zone14_PE01_DelAndReborn",30 , 100 )--3秒後消失,10秒後重生
				ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				--Say(Oid, "I got 1 QuestKey!" )
			else
				CancelBuff(Tid,509096)--取消起疑
				AddBuff(Tid,509097,60,-1) --不信任
				WriteRoleValue(Tid,EM_RoleValue_Register7,0)
			end
		else Say(Tid,"......") end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		WriteRoleValue(Tid,EM_RoleValue_Register7,0)
	end
end

function Lua_Zone14_PE01_Skill09()--當我沒來過
	local Oid = OwnerID()
	local Tid = TargetID()
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497156,"Name") , 50 , 0, 0, 0 , "Lua_Zone14_PE01_Skill09_CheckStatus")==1 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,1)
		PlayMotion( Oid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
		Say(Oid,"[SC_PE_ZONE14_01_TALK13]")--算了，我是一番好意，真灰心！
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
			SysCastSpellLv(Oid,Oid,497255,0)--成功則減少起疑或不信任的時間
		end
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
	end
end

function Lua_Zone14_PE01_Skill09_End()--當我沒來過對周圍冒險者的影響
	local Tid =TargetID()
	local BuffTime = 0
	if CheckBuff(Tid,509096)==TRUE then
		BuffTime = kg_CheckBuffTime( Tid, 509096 )
		BuffTime = BuffTime-30
		if BuffTime<=0 then
			CancelBuff(Tid,509096)
		else
			AddBuff(Tid,509096,BuffTime,-1) --起疑
		end
	elseif CheckBuff(Tid,509097)==TRUE then
		BuffTime = kg_CheckBuffTime( Tid, 509097 )
		BuffTime = BuffTime-30
		if BuffTime<=0 then
			CancelBuff(Tid,509097)
		else
			AddBuff(Tid,509097,BuffTime,-1) --不信任
		end
	end
end

function Lua_Zone14_PE01_Skill10()--保密協定
	local Tid =TargetID()--冒險者與村民
	local Pid = ReadRoleValue(Tid,EM_RoleValue_PID)
	if Pid == 140101 then
		CancelBuff(Tid,Zone14_PE01_Var["NPCBuffID"][1])--取消著魔
		CallPlot(Tid,"Lua_Zone14_PE01_NPCLeave",Tid,0, 10, 100 )
		SysCastSpellLv( Tid,Tid,495735,0 )--傳送特效
	elseif Pid == 140102 then
		CallPlot(Tid,"Lua_Zone14_PE01_EnemyDelayLeave",Tid,70,0)--失敗的離開
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
		CallPlot( RefObj , "Lua_Zone14_PE01_ReBornNPC" , RefObj , 0  , RebornWaitTime )--10秒後重生冒險者獲村民
	elseif Pid == 140102 then
		CallPlot( RefObj , "Lua_Zone14_PE01_ReBornNPC" , RefObj , 1  , RebornWaitTime )--10秒後重生冒險者獲村民
	end
	DelObj(Oid)
end

function Lua_Zone14_PE01_Skill11()--一網打盡
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckBuff(Tid,509099)==TRUE then	----傳送標記
		CallPlot(Tid,"Lua_Zone14_PE01_NPCLeave",Tid,0, 10, 100 )
		SysCastSpellLv( Tid,Tid,495735,0 )--傳送特效
		ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		--Say(Oid, "I got 1 QuestKey!" )
	end
end

function Lua_Zone14_PE01_Skill12()--干擾法鎮
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckBuff(Oid,509100)==TRUE then--還有隱形術
		AddBuff(Tid,509103,0,-1)--每次受到著魔降1
	else
		magicinterrupt(Oid)
	end
end

function Lua_Zone14_PE01_Skill_CheckHidePlayer()--村民失敗走開時放範圍法術讓有隱身的玩家獲得關鍵表現
	local Tid =TargetID()--玩家
	if CheckBuff(Tid,509100)==TRUE then--隱形術
		ks_QuestKill( Tid, 105336, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		--Say(Tid, "I got 1 QuestKey!" )
	end
end

function Lua_Zone14_PE01_Skill13()--技巧性試探劇情
	local Oid = OwnerID()
	local Tid = TargetID()
	AdjustFaceDir( Tid,Oid,0 )
	AddBuff(Oid,508971,0,-1)--次數
	local Ctrl = ReadRoleValue(Tid,EM_RoleValue_Register2)
	AddBuff( Ctrl ,509093,0,-1)--魅惑等級降低放在群組中控器上
	local CheckBuffLV = KS_CheckBuffLV(Oid,508971)--次數
	if CheckBuffLV==1 or CheckBuffLV==3 or CheckBuffLV==5 then
		Lua_Zone14_PE01_PlayMotoin(Oid,math.random(4),13)
	end
end

function Lua_Zone14_PE01_Skill13_End()--技巧性試探結束
	local Oid = OwnerID()
	CancelBuff(Oid,508971)--次數
end

function Lua_Zone14_PE01_Skill14()--堵住性暗示
	local Oid = OwnerID()
	local Tid = TargetID()
	AdjustFaceDir( Tid,Oid,0 )
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497168,"Name") , 60 , 0, 0, 0 , "Lua_Zone14_PE01_Skill14_CheckStatus")==1 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,1)
		Lua_Zone14_PE01_PlayMotoin(Oid,math.random(4),13)
		CallPlot(Oid,"Lua_Zone14_PE01_PlayerAction",Oid, 14 )
	end
end

function Lua_Zone14_PE01_Skill14_CheckStatus( ObjID, CheckStatus ) --堵住性暗示
	local Oid =OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
		if CheckBuff(Tid,508964)==true then
			CallPlot(Tid,"Lua_Zone14_PE01_EnemyDelayLeave",Tid,1,0)--失敗的離開
			ks_QuestKill( Oid, 105336, 10 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			--Say(Oid, "I got 10 QuestKey!" )
		elseif CheckBuff(Tid,508963)==true then
			CallPlot(Tid,"Lua_Zone14_PE01_EnemyDelayLeave",Tid,1,0)--失敗的離開
			ks_QuestKill( Oid, 105336, 5 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			--Say(Oid, "I got 5 QuestKey!" )
		else
			local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Tid,EM_RoleValue_Register1)]["Friend"]--同群組的冒險者
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

function Lua_Zone14_PE01_Skill15()--永不放棄劇情
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
			ks_QuestKill( Oid, 105336, 8 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			--Say(Oid, "I got 8 QuestKey!" )
			randNum = math.random(100)
			if randNum<(41-kg_CheckBuff(Oid,508967)*5) then
				ks_QuestKill( Oid, 105336, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				--Say(Oid, "I got 2 QuestKey!" )
			end
		end
	end
end

function Lua_Zone14_PE01_Skill15_GoAway()
	local Oid = OwnerID()--冒險者
	local x,y,z,_ = kg_GetRangePos(Oid,nil,100,math.random(360))
	Say(Oid,"[SC_PE_ZONE14_01_TALK16]")
	KS_Move( Oid , 30, x , y , z )
	Sleep(100)
	CallPlot(Oid,"Lua_Zone14_PE01_DelAndReborn",0,0)--0秒後消失,0秒後重生
	DelObj(Oid)
end

function Lua_Zone14_PE01_Skill16()--魔力衝擊
	local Tid = TargetID()
	local BuffLv= KS_CheckBuffLV(Tid,508960)
	BuffLv = BuffLv-2
	if BuffLv>=1 then
		CancelBuff(Tid,508960)
		AddBuff(Tid,508960,BuffLv-1,-1)
		WriteRoleValue(Tid,EM_RoleValue_Register9,BuffLv )--紀錄當前著魔數
		--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
	else
		CancelBuff(Tid,508960)
		WriteRoleValue(Tid,EM_RoleValue_Register9,0 )--紀錄當前著魔數
		--Say( Tid ,"My CurrentDeBuffLv = "..ReadRoleValue(Tid,EM_RoleValue_Register9) )
	end
end

function Lua_Zone14_PE01_Skill17()--一閃即逝
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140102 then
		Lua_Zone14_PE01_NPCLeave( Tid )
		local RefObj  = ReadRoleValue( Tid,EM_RoleValue_Register3 )
		CallPlot( RefObj , "Lua_Zone14_PE01_ReBornNPC" , RefObj , 1  , 100 )
		if KillID( Oid, Tid )==TRUE then
			ks_QuestKill( Oid, 105336, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			--Say(Oid, "I got 1 QuestKey!" )
		end
	end
end

function Lua_Zone14_PE01_Skill18_End()--目盲結束
	local Oid =OwnerID()
	local Group =Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Oid,EM_RoleValue_Register1)]["Enemy"]
	if table.getn(Group)==0 then
		--WriteRoleValue(Oid,EM_RoleValue_IsWalk, 0 )	--用走的移動
		Lua_Zone14_PE01_NPCLeave(Oid )
		Say(Oid,"[SC_PE_ZONE14_01_TALK15]")
		CallPlot(Oid,"Lua_Zone14_PE01_DelAndReborn",30 , 100 )--3秒後消失,10秒後重生
	end
end

--==================================================================
function Lua_Zone14_PE01_UnlockSpeak( DelayTime )
	local Oid = OwnerID()--一般是冒險者
	local Ctrl = ReadRoleValue(Oid,EM_RoleValue_Register2)
	DelayTime = DelayTime or 100
	Sleep(DelayTime)
	WriteRoleValue(Oid,EM_RoleValue_Register7,0)
	AdjustFaceDir( Oid,Ctrl,0 )
end

function Lua_Zone14PE01_QuestComplete()--完成任務執行
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
		if Lv > 0 or ( Lv == 0 and PECount > 5 ) then--目前進行的PE任務完成次數
			if Lv == 0 and PECount > 5 then
				WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			end
			AddBuff( Player, BuffID, 0, -1 )
			WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2, BuffID )--目前進行的PE所附帶的獎勵狀態
			DebugMsg(0,0,"New PECount = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
		end

	end
end