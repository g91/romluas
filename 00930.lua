function LuaS_101057_Clock()	--�������p�ɾ�
	Wind_DiffHour = 0--�ŧi�����ܼ�!!!!
	Wind_DiffMin = 0
	local Step = "false"
	local hour = 0
	local min = 0
	local Array = {}
	local MonsterID = 101057	--���ͩǪ�ID
	local Wind = 0
	local Flag = 780197		--�X�l�s��
	local Count = GetMoveFlagCount(Flag)
------------------------------------------------
	while true do
----------------------------------------------�ɶ��B�z
		hour = GetSystime(1)
		min = GetSystime(2)

		if 	Wind_DiffHour ~= nil and
			Wind_DiffMin ~= nil then

			if 	Wind_DiffHour == 0 and
				Wind_DiffMin == 0 then
			else
				hour = GetSystime(1) + Wind_DiffHour
				min = GetSystime(2) + Wind_DiffMin

				if hour >23 then
					hour = hour - 24
				end

				if min > 59 then
					min = min - 60
				end
			end
		end
		if hour == 19 and (min >= 0 ) then
			if  (Step == "false") then
				Step = "true"
				--�Ыح�����
				local RAND = rand(Count-1)
				Wind = CreateObjByFlag( MonsterID, Flag , RAND , 1 )
				AddToPartition(Wind ,0)
				CallPlot( Wind , "LuaN_101057_Ai" , RAND )
				MoveToFlagEnabled ( Wind, false )
			end
		elseif (Step == "true") then
			Step = "false"
			--�R��������
			DelObj(Wind)
		end
		sleep(20)
	end
end
--? runplot Refer_101057_DiffTime �d�ߥثe�e�i�F�h�[���ɶ�
function Refer_101057_DiffTime()
	Say(OwnerID(), Wind_DiffHour )
	Say(OwnerID(), Wind_DiffMin )
end

--? runplot Reset_101057_DiffTime �N�e�i���ɶ��k�s
function Reset_101057_DiffTime()
	Wind_DiffHour = 0
	Wind_DiffMin = 0
end

--? pcall Set_Wind_DiffHour(hour) �u ( ) �v ����hour �N��A�Q�n�e�i���p�ɼƶq  �d��u��O0~23 �ó]���H��G�ۭt...
function Set_Wind_DiffHour(hour)
	if hour >= 48 then
	else
		if hour >= 24 then
		Wind_DiffHour = hour - 24
		else
		Wind_DiffHour = hour
		end
	end
end

--������AI
function LuaN_101057_Ai(RAND)
	SetPlot( OwnerID() , "dead" , "Lua_101057_deadlog_1" , 0 )
	local FlagNmber = RAND
	local CheckTime = 20
	local Time = 0
	local Flag = 780197		--�X�l�s��
	local Count = GetMoveFlagCount(Flag)
	local NPC = {}
	local HelpMonster = {}
	local HelpCount = 0
	local AttackTaget = {}
	While 1 do
	local AttackTargetID = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTargetID ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
		else
			if FlagNmber > (Count - 1) then
--				Say(OwnerID(), "Reset")
				FlagNmber = 0
				Time = 0
			end
			if Time == 0 then
--				Say(OwnerID(), "Move to "..FlagNmber  )
				LuaFunc_MoveToFlag( OwnerID(), Flag , FlagNmber , 0 )
				FlagNmber = FlagNmber + 1
			else
				if (Time/200) == FlagNmber then
--					Say(OwnerID(), "Move to "..FlagNmber  )
					LuaFunc_MoveToFlag( OwnerID(), Flag , FlagNmber , 0 )
					FlagNmber = FlagNmber + 1
				end
			end	
			NPC = SearchRangeNPC(OwnerID() , 250 )
				for i=1 , table.getn(NPC) do
					if ReadRoleValue(NPC[i] , EM_RoleValue_OrgID) == 100210 then
						HelpMonster[HelpCount] = NPC[i] 
						if ReadRoleValue( NPC[i], EM_RoleValue_AttackTargetID ) ~= 0 then
							AttackTaget[HelpCount] = ReadRoleValue( NPC[i], EM_RoleValue_AttackTargetID )
							ScriptMessage( AttackTaget[HelpCount], AttackTaget[HelpCount] , 1, GetString("SC_AMES_ATTACK"), "0xFFFFF266" )
							SetAttack(OwnerID(),AttackTaget[HelpCount])
							CastSpell(OwnerID(),AttackTaget[HelpCount],490618)	--�ļ�
							break
						end
						HelpCount = HelpCount + 1
					end
				end
--			Say(OwnerID(), "Sec = "..Time/10  )
			Time = Time + CheckTime
		end
		sleep(CheckTime)		--�C2���ˬd�@��
	end
end