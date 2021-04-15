function Lua_EarthDragonSurvive()				--�Ǫ����`�����ܼ�
	EarthDragonSurvive = EarthDragonSurvive + 1
	return true
end

function LuaN_EarthDragonSkill()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OldCamp = GetRoleCampID(OwnerID())
	local CountBuff = BuffCount ( OwnerID())
	local BuffOK = false
	for j = 0 , CountBuff do
		local BuffID = BuffInfo ( OwnerID(), j , EM_BuffInfoType_BuffID )
		if (BuffID == 502531) then
			BuffOK = true
			DebugMsg( 0, RoomID,"BuffOK = true")
		end
	end
	if OldCamp ~= 3 and BuffOK == true then
		DebugMsg( 0, RoomID,"OldCamp = "..OldCamp)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,OldCamp)
		SetRoleCampID( OwnerID() , 3 )
		DebugMsg( 0, RoomID,"NewCamp = "..GetRoleCampID(OwnerID()))
	end
end

function LuaN_EarthDragonSkillClear()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	DebugMsg( 0, RoomID,"NowCamp = "..GetRoleCampID(OwnerID()))
	local OldCamp = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	DebugMsg( 0, RoomID,"OldCamp = "..OldCamp)
	if GetRoleCampID(OwnerID()) == 3 then
		SetRoleCampID( OwnerID() , OldCamp )
	end
	DebugMsg( 0, RoomID,"NewCamp = "..GetRoleCampID(OwnerID()))
end

function Lua_SayAndCastDelay(TargetID,SayString,MagicID,DelayTime)
	Say(OwnerID(),SayString)
	Sleep(DelayTime)
	CastSpell( OwnerID(), TargetID, MagicID )	--�ϥίP�K��
end
function Lua_Ai_EarthDragon()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	Discowood_OnlyOne_Check()
	SetPlot( OwnerID() , "dead" , "Lua_100625_deadlog_1" , 0 );
	EarthDragonSurvive = 0			--�ŧi���`�����ܼ�
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local CheckTime = 10		-- �@���ˬd�@��
	local MonsterID = 100372		--���ͪ��p��
	local N = 0			--�s��_���p�ɾ�
	local M = 0			--���K���p�ɾ�
	local O = 0			--���K�Q�g�p�ɾ�
	local P = 0			--�P�K�𮧭p�ɾ�
	local Q = 0			--�s�������p�ɾ�
	local NColdown = 30		--�s��_��coldown
	local MColdown = 50		--���K���coldown
	local OColdown = 25		--���K�Q�gcoldown
	local PColdown = 8		--�P�K��coldown
	local QColdown = 60		--�s������coldown
	local MagicIDP = 492176		--�P�K��
	local MagicIDN = 492156		--�s��_��
	local MagicIDM = 492157		--���K���
	local MagicIDO = 492151		--���K�Q�g
	local MagicIDQ = 492317		--�s������Ĳ�o
	local MonsterGroup = {}		--�l���Ǫ����}�C
	local HowMuch = 3		--�̤j�۳�ƶq
	local AllDead = 0			--�ŧi���`�`��
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			--���ɧޯ�
			if P >= PColdown then
				Lua_SayAndCastDelay(OwnerID(), "[SC_EARTHDRAGON_1]", MagicIDP, 20)	--�ϥίP�K��
--						DebugMsg( 0, RoomID ,"AddBuff Begin")
--						Lua_EarthDragon_AddBuff()
--						DebugMsg( 0, RoomID ,"AddBuff End")
				P = 0
			elseif M >= MColdown then
--				Say( OwnerID() , "M = "..M )
				Lua_SayAndCastDelay(OwnerID(), "[SC_EARTHDRAGON_2]", MagicIDM, 20)	--�ϥΤ��K���
				M = 0
			elseif N >= NColdown then
--				Say( OwnerID() , "N = "..N )
				Lua_SayAndCastDelay(OwnerID(), "[SC_EARTHDRAGON_3]", MagicIDN, 20)	--�ϥθs��_��
				N = 0
			end
			if ( HPPercent <= 0.75 )  then
				if ( HP75 == "false" ) then
--					Say( OwnerID() , "NowHP = 50%")
					MonsterGroup , HowMuch = CreateMonsterByBaseXYZ(MonsterID,HowMuch,"Lua_EarthDragonSurvive","[SC_EARTHDRAGON_SUMMON]")	--���ͤp�L�è��o�ƶq
					HP75 = "Finsh"								--�l���L���O��
--					Say( OwnerID() , "HP50 = Called")
				elseif ( HP75 == "Finsh" ) then
--					Say( OwnerID() , "BloodSpiderSurvive = "..BloodSpiderSurvive)
					if HowMuch == 1 then
						if EarthDragonSurvive >= HowMuch then
							if CheckID(MonsterGroup[1]) == true then
								DelObj(MonsterGroup[1])
							end
							HP50 = "false"
							EarthDragonSurvive = 0
						end
					elseif HowMuch == 2 then
						if EarthDragonSurvive >= 1 then
							for i = 1 , table.getn(MonsterGroup) do
								if CheckID(MonsterGroup[i]) == true then
									DelObj(MonsterGroup[i])
								end
							end
							HP50 = "false"
							BloodSpiderSurvive = 0
						end
					elseif HowMuch >= 3 then
						if EarthDragonSurvive >= HowMuch - 2 then
							for i = 1 , table.getn(MonsterGroup) do
								if CheckID(MonsterGroup[i]) == true then
									DelObj(MonsterGroup[i])
								end
							end
							HP50 = "false"
							EarthDragonSurvive = 0
						end
					end
				end 
			end
			-- �� 2/4 �s�W�ޯ���K�Q�g
			if ( HPPercent <= 0.50 ) then				
				if ( HP50 == "false" ) then
--					Say( OwnerID() , "NowHP = 75%")
					HP50 = "Finsh"								
--					Say( OwnerID() , "HP75 = Finsh")
					O = 30
				elseif ( HP50 == "Finsh" ) then
--					Say( OwnerID() , "O = "..O )
					if O >= OColdown then
					local RouletteTarget = PartyRoulette( AttackTarget )
--						Say( RouletteTarget , "TargetIsMe" )
						Lua_SayAndCastDelay( RouletteTarget , "[SC_EARTHDRAGON_1]", MagicIDO, 20)	--�ϥΤ��K�Q�g
						O = 0
					end
				end 
			end
			-- �� 1/4 
			if ( HPPercent <= 0.25 ) then
				if ( HP25 == "false" ) then
--					Say( OwnerID() , "NowHP = 25%")
					HP25 = "Finsh"
--					Say( OwnerID() , "HP25 = Finsh")
					Q = 60
				elseif ( HP25 == "Finsh" ) then
--					Say( OwnerID() , "Q = "..Q)
					if Q >= QColdown then
						DebugMsg( 0, RoomID ,"AddBuff Begin")
						Lua_EarthDragon_AddBuff()
						DebugMsg( 0, RoomID ,"AddBuff End")
						CastSpell( OwnerID(), OwnerID(), MagicIDQ )				--�S��
--						local RANDJOB = rand(6)+1
--						DebugMsg( 0, RoomID ,"RANDJOB ="..RANDJOB)
--						local TrainTarget = Lua_GetRangeJobPlayer( 300, RANDJOB)
--						for i=1, table.getn(TrainTarget) do
--							Say(TrainTarget[i] , "buffme")
--							AddBuff( TrainTarget[i] , 502531 , 1 , -1 )		--�ϥ��s������
--							BeginPlot(TrainTarget[i], "LuaN_EarthDragonSkill", 0)
--						end
--						local NewTarget = Lua_GetRangePlayer(200,AttackTarget)
--						SetAttack(OwnerID(), NewTarget)
						ClearHateList( OwnerID() , -1 )
						Q= 0
					end
				end 
			end
			N = N + 1
			M = M + 1
			O = O + 1
			P = P + 1
			Q = Q + 1
		else
			for i = 1 , table.getn(MonsterGroup) do		--�R���۳��
				if CheckID(MonsterGroup[i]) == true then
					DelObj(MonsterGroup[i])
				end
			end
			HP75 = "false"		-- �D�԰��A�k�s�O��
			HP50 = "false"	
			HP25 = "false"	
		end
	Sleep( CheckTime )
	end
end
function Lua_EarthDragon_AddBuff()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local HitPlayer = SearchRangePlayer ( OwnerID(), 100 )--�N���񪱮a�����}�C
	for i= 0 , table.getn(HitPlayer) do
		DebugMsg( 0, RoomID ,"the "..i.." player is "..GetName(HitPlayer[i]))
		If CheckID( HitPlayer[i] ) == true then
			DebugMsg( 0, RoomID ,"AddBuff 502531 to "..GetName(HitPlayer[i]))
			AddBuff( HitPlayer[i] , 502531 , 0 , -1 )		--�ϥ��s������
			BeginPlot(HitPlayer[i], "LuaN_EarthDragonSkill", 0)
		end
	end
end