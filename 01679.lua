function Lua_FN_DDR_NPCtalk() --���bNPC�W���}����׳���ܨƥ�
	--Owner�O���a Target�ONPC
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, OwnerID())
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)

	SetSpeakDetail( OwnerID(), "[SC_DDR_STRING01_START]"  ) --NPC�}�l�C���e�x��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RULE]"  , "Lua_FN_DDR_teach", 0 ) --�ﶵ:�W�h����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_DDR_STRING03]"  , "Lua_FN_DDR_Main", 0 ) --�ﶵ:�}�l���R
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_DDR_leave", 0 ) --�ﶵ:���}

end

function Lua_FN_DDR_Main()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register2 , 0 )  --2015/04/20 �`�`�s�W
	BeginPlot( TargetID(), "Lua_FN_DDR_Dance", 0 ) --Target�ONPC
end

function Lua_DelItem10sec()			--���[�����~�R���ۤv��function
	sleep( 100 )
	DelObj( OwnerID() )
end

function Lua_DelItem6sec()			--���[�����~�R���ۤv��function
	sleep( 60 )
	DelObj( OwnerID() )
end

function Lua_DelItem4sec()			--���[�����~�R���ۤv��function
	sleep( 40 )
	DelObj( OwnerID() )
end

function Lua_DDRBonus()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register2, ReadRoleValue ( OwnerID() , EM_RoleValue_Register2)+5) --�Ϊ��a��Register2�ӰO���[��
end

--�гy�a�O--
function Lua_FN_DDR_Dance()
	say (OwnerID(),"[SC_DDR_STRING05]") --OwnerID�O��NPC
	local DDR_finish = true --true���S�ٵ����Afalse������
	local PLAYER = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local GameLevel = 1 --�������d����
	local GameWave = 12 --�C���d���Ūi��
	local GameWaveCheck = 0 --�ΨӧP�_���a����ĴX�i
	local DDRScore = 0
	local slptime01 = 20 --�q  �o�� ��     ��    �����j
	local slptime02 = 10  --�q   ��  ��  �U���o�� �����j
	local Bonuslocation = 0
	SetFlag( PLAYER  , 542175 , 1 ) -- �O������w�g���L
	SetSmallGameMenuType( PLAYER , 6 , 1 ) --�O���O�A��1���гy�A��2������
	SetSmallGameMenuStr( PLAYER , 6 , 1 , "[SC_DDR_STRING07_STATE][$SETVAR1="..DDRScore.."]" )
	SetSmallGameMenuStr( PLAYER , 6 , 2 , "[SC_DDR_STRING07_SCORE][$SETVAR1="..DDRScore.."]" )

	
--�гy�a�O--
	local DDRfloor = Lua_MadeRectangleByXYZ(112046 , 2052 , 44 , 2579 , 269 , 39 , 39 , 5 , 5)
--	local DDRfloor = Lua_MadeByRectangle(112046 , 39 , 39 , 5 , 5)
	for x=1 , table.getn(DDRfloor) do	
		SetModeEx( DDRfloor[x] , EM_SetModeType_Strikback, false )--����
		SetModeEx( DDRfloor[x] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( DDRfloor[x] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( DDRfloor[x] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( DDRfloor[x] , EM_SetModeType_Move, false )--����
		SetModeEx( DDRfloor[x] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( DDRfloor[x] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( DDRfloor[x] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( DDRfloor[x] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( DDRfloor[x] , EM_SetModeType_DisableRotate, false )--��V
	end

--�]�w�a�O�զX--
	local Hit = {}
	Hit[1] = {1,2,4,6,7,9,15,13,11,12,14,20,18,16,25,23,21}
	Hit[2] = {5,3,1,2,4,10,9,15,11,14,20,19,25,23,21,22,24}
	Hit[3] = {3,1,4,8,6,9,13,11,14,18,16,19,23,21,24}
	Hit[4] = {5,1,2,10,6,7,15,11,12,20,16,17,25,21,22}
	Hit[5] = {3,1,2,8,6,7,13,11,12,18,16,17,23,21,22}
	Hit[6] = {10,8,6,7,9,15,13,11,12,14,20,18,16,17,19}
	Hit[7] = {3,2,10,6,9,13,12,20,16,19,23,22}
	Hit[8] = {5,3,2,4,10,8,7,9,11,20,18,17,19,23,25,22,24}
	Hit[9] = {5,3,1,10,8,6,15,13,11,12,14,16,17,19,21,22,24}
	Hit[10] = {3,2,10,8,6,7,9,13,12,20,18,16,17,19,23,22}
	Hit[11] = {8,6,7,13,11,12,18,16,17}
	Hit[12] = {5,1,4,8,7,15,11,14,18,17,25,21,24}
	Hit[13] = {5,3,1,2,4,10,8,6,7,9,20,18,16,17,19}
	Hit[14] = {5,3,1,2,4,15,13,11,12,14,20,18,16,17,19}
	Hit[15] = {3,1,2,10,8,6,7,15,13,11,12,20,18,16,17}
	Hit[16] = {8,6,7,9,13,11,12,14,18,16,17,19,23,21,22}
	Hit[17] = {1,8,7,15,14,18,17,21,6,13,12,16}
	Hit[18] = {5,3,1,2,4,15,13,11,12,14,25,23,21,22,24}
	Hit[19] = {5,4,10,8,7,9,15,13,11,12,14,20,18,17,19,25,24}
	Hit[20] = {5,3,1,2,4,8,6,7,11,18,16,17,25,23,21,22,24}

	
	CloseSpeak( TargetID() )
	sleep(10)
	SetPos(TargetID(), 2049,45,2460,271)	--�ǰe���a����a����
	AddBuff(TargetID(),505638,1 ,-1 );  --�������a�ϥέ쥻¾�~�ޯ�
	Hide( OwnerID() )

	sleep(50) 
--�{�q�@��--
	local TempTable = {}
	local TempNPC =  SearchRangeNPC ( TargetID() , 300 )
	for i=0,table.getn(TempNPC) do
		if ReadRoleValue( TempNPC[i], EM_RoleValue_OrgID  ) == 101273 then
			local TempPID =  ReadRoleValue( TempNPC[i], EM_RoleValue_PID  ) 
			TempTable[TempPID] = TempNPC[i]
		end
	end
	
-------------
	for j=1,10 do
		if DDR_finish == true then
			for i=1,GameWave do 	--------------------------------------------------------------��ӹC�����D�n�L�{��
				local hitselect = Rand(table.getn(Hit))
				for x=1,table.getn(Hit[hitselect+1]) do --���Hit�����C�@�Ӧa�O����ʧ@
					ChangeObjID(DDRfloor[Hit[hitselect+1][x]],114338)
				end
				sleep(1)
				for x=1,table.getn(Hit[hitselect+1]) do --���Hit�����C�@�Ӧa�O����ʧ@
					ChangeObjID(DDRfloor[Hit[hitselect+1][x]],112046)
				end
				sleep(slptime01)
				for x=1,4 do --�{�q�@��I�k
					if x == 4 then
						CastSpellLv( TempTable[4],TempTable[1], 495328 , 20 )
					else
						CastSpellLv( TempTable[x],TempTable[x+1], 495328 , 20 )
					end
				end
				for x=1,table.getn(Hit[hitselect+1]) do --���Hit�����C�@�Ӧa�O����ʧ@
					SysCastSpellLv(DDRfloor[Hit[hitselect+1][x]],DDRfloor[Hit[hitselect+1][x]],494798,1)-- �o��O����몺�ʧ@
				end
				for x=1,4 do --�{�q�@��I�k
					if x == 4 then
						CastSpellLv( TempTable[4],TempTable[1], 495328 , 20 )
					else
						CastSpellLv( TempTable[x],TempTable[x+1], 495328 , 20 )
					end
				end

				if GameLevel >= 3 then	--�����[�����~
					if GameWaveCheck%4 == 0 then	--�C��4�����ƪi���~���X�[�����~
						
						ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING13]","0xffffffff" );
						Bonuslocation = Rand(table.getn(Hit[hitselect+1]))+1
						local BonusItem = CreateObjByObj ( 205026 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						if GameLevel >= 6 then		--lv6 ����s�b�ɶ��ܪ�
							BeginPlot( BonusItem, "Lua_DelItem10sec", 0 ) 		--�ɶ���R���[�����~
						else
							BeginPlot( BonusItem, "Lua_DelItem6sec", 0 ) 		--�ɶ���R���[�����~
						end
					end
					if GameWaveCheck%3 == 0 then	--�C��3�����ƪi���~���X���U���~�A�T��@
						Bonuslocation = Rand(table.getn(Hit[hitselect+1]))+1
						local DDRITEM = Rand(3)
						local BonusItem
						if DDRITEM == 0 then 
							BonusItem = CreateObjByObj ( 205027 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						elseif DDRITEM == 1 then 
							BonusItem = CreateObjByObj ( 205028 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						elseif DDRITEM == 2 then 
							BonusItem = CreateObjByObj ( 205029 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						end
						if GameLevel >= 6 then		--lv6 ����s�b�ɶ��ܪ�
							BeginPlot( BonusItem, "Lua_DelItem6sec", 0 ) 		--�ɶ���R���[�����~
						else
							BeginPlot( BonusItem, "Lua_DelItem4sec", 0 ) 		--�ɶ���R���[�����~
						end
					end
				end
				sleep(slptime02)
				if ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 or CheckID(TargetID()) == FALSE then  --�P�_���a�O�_���`�A���`����break
					--WriteRoleValue ( TargetID() , EM_RoleValue_Register2,2 )
					DDR_finish = false
					break
				else
					GameWaveCheck = GameWaveCheck + 1
					DDRScore = DDRScore + 1 + ReadRoleValue( TargetID() , EM_RoleValue_Register2) --�[�W���a�Y��[�����~���B�~����
					SetSmallGameMenuStr( PLAYER , 6 , 1 , "[SC_DDR_STRING07_STATE][$SETVAR1="..DDRScore.."]" ) --���ܰO���O
					WriteRoleValue ( TargetID() , EM_RoleValue_Register2, 0) --�[�����~���B�~���Ʀ]���w�g��i�hDDRScore�F�A�ҥH�k0
				end
			end			--------------------------------------------------------------��ӹC�����D�n�L�{��

			if DDR_finish == true then --�P�_���a�q�L���i�ơA�O�_�ŦX�ӵ��Ūi�ơA�ŦX��ܳq�L
				GameLevel = GameLevel + 1
				GameWaveCheck = 0

				if GameLevel == 1 or GameLevel == 3 or GameLevel == 5 or GameLevel == 7 or GameLevel == 9 then --�P�_�C�����ŨӴ�������
					slptime01 = slptime01-2
					slptime02 = slptime02-1
				end

				if GameLevel >= 11 then --�P�_���a�O�_������Ӹշ�
					Show(OwnerID(),RoomID)
					sleep(50)
					ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING12]", "0xffffffff" )--�O�H��Y!! �A�q�L�F�շ�!!
					--WriteRoleValue ( TargetID() , EM_RoleValue_Register2,2 )
					DDR_finish = false
					
					SetSmallGameMenuType( TargetID() , 6 ,2 )
					local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID)
--					AddRoleValue(TargetID(),EM_RoleValue_Honor,DDRScore)--�����a�A��
					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING14]", "0xffffffff" )
--					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING15]"..DDRScore, "0xffffffff" )
					--------------------------------------------------------------------// 2013/04/23 FN�i��ճ��Τ@���y
					FN_GuildGame_Honor( TargetID(), DDRScore )
--					local GuildGameLV = GuildGameLVArea[RoomID]
--					local Honor = DDRScore * (1+(0.1*GuildGameLV))
--					AddRoleValue(TargetID(), EM_RoleValue_Honor, Honor) -- �W�[�a�A��
--					ScriptMessage( TargetID(), TargetID(), 3, "[SC_DDR_STRING15]"..Honor, C_SYSTEM )
					--------------------------------------------------------------------
					sleep(30)
					ChangeZone( TargetID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )
				else
					ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING06]"..GameLevel.."[SC_DDR_STRING08]", "0xffffffff" )
					SetSmallGameMenuStr( PLAYER , 6 , 2 , "[SC_DDR_STRING07_SCORE][$SETVAR1="..GameLevel.."]" )
					sleep(100)
				end
			else	--���a�p�G���`�|�]�o��
				if CheckID(TargetID()) == TRUE then
					GameWaveCheck = GameWaveCheck+1
					SetSmallGameMenuType( TargetID() , 6 ,2 )
					local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID)
					--------------------------------------------------------------------// 2013/04/23 FN�i��ճ��Τ@���y
					FN_GuildGame_Honor( TargetID(), DDRScore )
					--------------------------------------------------------------------
					CancelBuff_NoEvent( TargetID(), 505638 ) --cancel���L�k�ϥ�¾�~�ޯ઺���A
					sleep(15)
					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING14]", "0xffffffff" )
					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING15]"..DDRScore, "0xffffffff" )
					ChangeZone( TargetID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )
					Revive( TargetID(), 354 , 5121.3, 13.4, 2515.2, 269.9 )
					sleep(15)
					ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING09]"..GameLevel.."[SC_DDR_STRING10]"..GameWaveCheck.."[SC_DDR_STRING11]", "0xffffffff" );
				end
				Show(OwnerID(),RoomID)
			end
		else
			break
		end
	end
	for y=1,table.getn(DDRfloor) do
		DelObj(DDRfloor[y])
	end
end

function Lua_FN_DDR_teach() --�C���о�
	SetSpeakDetail( OwnerID(), "[SC_DDR_STRING01_TEACH]"  ) --NPC�x��
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_FN_DDR_NPCtalk", 0 ) --�^�W�@��
end


function Lua_FN_DDR_leave() --���h
	CloseSpeak( OwnerID() )
	--WriteRoleValue ( OwnerID() , EM_RoleValue_Register2,1 )
	SetSmallGameMenuType( OwnerID() , 6 ,2 ) --�O���O�A��1���гy�A��2������
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	AddRoleValue(OwnerID(),EM_RoleValue_Honor,DDRScore)--�����a�A�� 2015/04/20  �̽�����A�ץ��������D
--	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DDR_STRING14]", "0xffffffff" );
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)
end