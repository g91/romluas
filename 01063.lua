function Lua_BloodSpiderSurvive()				--�Ǫ����`�����ܼ�
	BloodSpiderSurvive = BloodSpiderSurvive + 1
	return true
end

function Lua_BloodSpider_deadlog()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),101344,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_GetRangeJobPlayer(Range,Job)	--���X�d�򤺯S�w¾�~�����a(JOB=¾�~�s��)
	local OtherTarget = {}
	local count = 1
	local Player = SearchRangePlayer ( OwnerID(), Range )--�N���񪱮a�����}�C
--	Say( OwnerID() , "table.getn = "..table.getn(Player))
	for i= 0 , table.getn(Player) do
--		Say( OwnerID() , "Player[i] "..Player[i])
		local Voc = ReadRoleValue(  Player[i] , EM_RoleValue_VOC )
		If CheckID( Player[i] ) == true and Job == Voc then
			OtherTarget[count] = Player[i]
			count = count + 1
		end
	end
	return OtherTarget
end

function Lua_Ai_BloodSpider()
	SetPlot( OwnerID() , "dead" , "Lua_BloodSpider_deadlog" , 0 );
	Discowood_OnlyOne_Check()
	BloodSpiderSurvive = 0			--�ŧi���`�����ܼ�
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local CheckTime = 10		-- �@���ˬd�@��
	local MonsterID = 101345		--���ͪ��p��
	local N = 0			--�s��i�j�p�ɾ�
	local M = 0			--�c�r���p�ɾ�
	local O = 0			--�r�G�Q�g�p�ɾ�
	local P = 0			--�s����p�ɾ�
	local Q = 0			--�����p�ɾ�
	local NColdown = 30		--�s��i�jcoldown
	local MColdown = 60		--�c�r���coldown
	local OColdown = 30		--�r�G�Q�gcoldown
	local PColdown = 8			--�s����coldown
	local QColdown = 60		--����coldown
	local MagicIDP = 492149		--�s����
	local MagicIDN = 492154		--�s��i�j
	local MagicIDM = 492155		--�c�r���
	local MagicIDO = 492150		--�r�G�Q�g
	local MonsterGroup = {}		--�l���Ǫ����}�C
	local HowMuch = 10		--�̤j�۳�ƶq
	local AllDead = 0			--�ŧi���`�`��
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			--���ɧޯ�
			if P >= PColdown then
				CastSpellLV( OwnerID(), OwnerID(), MagicIDP , 1 )	--�ϥθs����
				P = 0
			elseif M >= MColdown then
--				Say( OwnerID() , "M = "..M )
				CastSpell( OwnerID(), OwnerID(), MagicIDM )				--�ϥδc�r���
				M = 0
			elseif N >= NColdown then
--				Say( OwnerID() , "N = "..N )
				CastSpell( OwnerID(), OwnerID(), MagicIDN )				--�ϥθs��i�j
				N = 0
			end
			-- �� 3/4 �s�W�ޯ�r�G�Q�g
			if ( HPPercent <= 0.75 )  then
				if ( HP75 == "false" ) then
--					Say( OwnerID() , "NowHP = 75%")
					HP75 = "Finsh"								
--					Say( OwnerID() , "HP75 = Finsh")
					O = 60
				elseif ( HP75 == "Finsh" ) then
--					Say( OwnerID() , "O = "..O )
					if O >= OColdown then
					local RouletteTarget = PartyRoulette( AttackTarget )
						CastSpell( OwnerID(), RouletteTarget, MagicIDO )				--�ϥάr�G�Q�g
						O = 0
					end
				end 
			end
			-- �� 2/4 
			if ( HPPercent <= 0.50 ) then				
				if ( HP50 == "false" ) then
--					Say( OwnerID() , "NowHP = 50%")
					Say(OwnerID(),GetString("SC_FRFEX_4"))	--�X�ӧa�I
					MonsterGroup , HowMuch = CreateMonsterByBaseXYZ(MonsterID,HowMuch,"Lua_BloodSpiderSurvive")	--���ͤp�L�è��o�ƶq
					HP50 = "Called"								--�l���L���O��
--					Say( OwnerID() , "HP50 = Called")
				elseif ( HP50 == "Called" ) then
--					Say( OwnerID() , "BloodSpiderSurvive = "..BloodSpiderSurvive)
					if HowMuch == 1 then
						if BloodSpiderSurvive >= HowMuch then
							if CheckID(MonsterGroup[1]) == true then
								DelObj(MonsterGroup[1])
							end
							HP50 = "false"
							BloodSpiderSurvive = 0
						end
					elseif HowMuch == 2 then
						if BloodSpiderSurvive >= 1 then
							for i = 1 , table.getn(MonsterGroup) do
								if CheckID(MonsterGroup[i]) == true then
									DelObj(MonsterGroup[i])
								end
							end
							HP50 = "false"
							BloodSpiderSurvive = 0
						end
					elseif HowMuch >= 3 then
						if BloodSpiderSurvive >= HowMuch - 2 then
							for i = 1 , table.getn(MonsterGroup) do
								if CheckID(MonsterGroup[i]) == true then
									DelObj(MonsterGroup[i])
								end
							end
							HP50 = "false"
							BloodSpiderSurvive = 0
						end
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
						local Dest = Role:new(OwnerID())
						local NewX = Dest :X()
						local NewY = Dest :Y()
						local NewZ = Dest :Z()
						local NewDir = Dest :Dir()
						local Obj = Role:new(OwnerID())
						local BaseX = Obj :X()
	 					local BaseY = Obj :Y()
	 					local BaseZ = Obj :Z()
						local BaseDir = Obj:Dir()
						local TrainTarget = Lua_GetRangeJobPlayer( 300, 6)
						local TrainTarget2 = Lua_GetRangeJobPlayer( 300, 5)
--						Say( OwnerID() , table.getn(TrainTarget))
--						Say( OwnerID() , table.getn(TrainTarget2))
						local Traincount = 0
					if Q >= QColdown then
						if table.getn(TrainTarget) == 0 or table.getn(TrainTarget2) == 0 then
--						Say( OwnerID() , "SearchTrainTarget..ing")
						else
							if table.getn(TrainTarget) > table.getn(TrainTarget2) then
								Traincount = table.getn(TrainTarget2)
							elseif table.getn(TrainTarget) <= table.getn(TrainTarget2) then
								Traincount = table.getn(TrainTarget)
							end
							for i = 1, Traincount do
								Dest = Role:new(TrainTarget[i])
								NewX = Dest :X()
								NewY = Dest :Y()
								NewZ = Dest :Z()
								NewDir = Dest :Dir()
								Obj = Role:new(TrainTarget2[i])
								BaseX = Obj :X()
	 							BaseY = Obj :Y()
	 							BaseZ = Obj :Z()
								BaseDir = Obj:Dir()
								SetPos(TrainTarget2[i], NewX, NewY, NewZ, NewDir)
								SetPos(TrainTarget[i], BaseX, BaseY, BaseZ, BaseDir)
							end
						end
						ClearHateList( OwnerID() , -1 )
						local NewTarget = Lua_GetRangePlayer(200,AttackTarget)
						SetAttack(OwnerID(), NewTarget)
						Q= 0
					end
				end 
			end
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
	N = N + 1
	M = M + 1
	O = O + 1
	P = P + 1
	Q = Q + 1
	Sleep( CheckTime )
	end
end