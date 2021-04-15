function LuaZone_RACEGAME_Main()
	SetZoneReviveScript( "LuaZone_RACEGAME_Revive" );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Mark,hindrance = Lua_Race_BronFlagMiddle(OwnerID())
	local	pX, pY, pZ;
	-- ���Ͱ_�I����
	pX=2669
	pY=36
	pZ=2295
	local StartCOO = CreateObj( 112122, pX, pY, pZ, 187, 1)
	SetModeEx( StartCOO, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StartCOO, EM_SetModeType_Strikback, false )--����
	SetModeEx( StartCOO, EM_SetModeType_Mark, false )--�аO
	SetModeEx( StartCOO, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( StartCOO, EM_SetModeType_Obstruct, true )--����
	SetModeEx( StartCOO, EM_SetModeType_Gravity, false )--���O
	SetModeEx( StartCOO, EM_SetModeType_Move, false )--����
	SetModeEx( StartCOO, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StartCOO, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StartCOO, EM_SetModeType_Show, false )--���
	AddToPartition( StartCOO ,  RoomID  )
	--���ͪ�
	pX=2658
	pY=36
	pZ=2297
	local StartDoor = CreateObj( 112123, pX, pY, pZ, 10, 1)
	SetModeEx( StartDoor, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StartDoor, EM_SetModeType_Strikback, false )--����
	SetModeEx( StartDoor, EM_SetModeType_Mark, false )--�аO
	SetModeEx( StartDoor, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( StartDoor, EM_SetModeType_Obstruct, true )--����
	SetModeEx( StartDoor, EM_SetModeType_Gravity, false )--���O
	SetModeEx( StartDoor, EM_SetModeType_Move, false )--����
	SetModeEx( StartDoor, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StartDoor, EM_SetModeType_Searchenemy, false )--����
	AddToPartition( StartDoor ,  RoomID  )
	BeginPlot( StartDoor , "Lua_RaceRideing" , 0 )
	-- ���Ͳ��I����
	pX=4441
	pY=-29
	pZ=4250
	local FinalDoor = CreateObj( 112122, pX, pY, pZ, 28, 1)
	SetModeEx( FinalDoor, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( FinalDoor, EM_SetModeType_Strikback, false )--����
	SetModeEx( FinalDoor, EM_SetModeType_Mark, false )--�аO
	SetModeEx( FinalDoor, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( FinalDoor, EM_SetModeType_Obstruct, false )--����
	SetModeEx( FinalDoor, EM_SetModeType_Gravity, false )--���O
	SetModeEx( FinalDoor, EM_SetModeType_Move, false )--����
	SetModeEx( FinalDoor, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( FinalDoor, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( FinalDoor, EM_SetModeType_Show, false )--���
	AddToPartition( FinalDoor ,  RoomID  )
	--�b���I�[�W�I���@��
	SetPlot( FinalDoor , "Collision" , "Lua_Race_CollisionWin" , 50 )
	-- �ˬd�H�Ƴ����F�~�}�l�˼�
	local CheckTime = 0;
	local CheckClock = 0
	local Setp = 0
	--�Գ��}��60���ˬd�O�_���ƨ��
	while 1 do
		local CountOneTeam = GetNumEnterTeamMember(RoomID,1) --�Ĥ@���`�M�H��
		local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --�ĤG���`�M�H��
		local CountThreeTeam = GetNumEnterTeamMember(RoomID,3) --�ĤT���`�M�H��
		local CountFourTeam = GetNumEnterTeamMember(RoomID,4) --�ĥ|���`�M�H��
		local CountFiveTeam = GetNumEnterTeamMember(RoomID,5) --�Ĥ����`�M�H��
		local CountSexTeam = GetNumEnterTeamMember(RoomID,6) --�Ĥ����`�M�H��
		local CountSevenTeam = GetNumEnterTeamMember(RoomID,7) --�ĤC���`�M�H��
		local CountEightTeam = GetNumEnterTeamMember(RoomID,8) --�ĤK���`�M�H��
		if (CountOneTeam + CountTwoTeam + CountThreeTeam + CountFourTeam + CountFiveTeam + CountSexTeam + CountSevenTeam + CountEightTeam) >= 8 then
			--�H�ƥ����
			ScriptMessage( OwnerID(), -1 , 2, "[SC_RACEGAME_EMFULL]" , 0 )	--�Ҧ����a�Ҷi�J�����j�D�A���ɧY�N�}�l
			DebugMsg( 0, RoomID ,"LuaZone_RACEGAME_CheckOK = 0 0 1")
			LuaZone_RACEGAME_CheckOK(70,1,1)
			Setp = 0
			break
		else	--�H�ƥ����
			DebugMsg( 0, RoomID ,"LuaZone_RACEGAME_CheckOK = 70 "..(70-CheckTime).." 1")
			LuaZone_RACEGAME_CheckOK(70,(70-CheckTime),1)	--���aClient��ܭ˼�
			if CheckTime >= 69 then
				--�W�L60��H�Ƥ�������H�U
				if (CountOneTeam + CountTwoTeam + CountThreeTeam + CountFourTeam + CountFiveTeam + CountSexTeam + CountSevenTeam + CountEightTeam) < 6 then
					--�H�Ƥp��6�H�Գ�����
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_COUNTERROR]" , 0 )	--���ɤH�Ƥ����A���ɵ���
					for i=1,8 do
						local CountPeople = GetNumEnterTeamMember(RoomID,i)		--�Ӷ��`�M�H��
						if CountPeople ~= 0 then
							SetScore( RoomID, i , 255 );			--�]�w�Ӷ�����Ƭ�����
						end
					end
					EndBattleGround( RoomID, -1 );
					Setp = 2
					break
				else	--�H�ƶW�L6�H�Գ��ӱ`�i��
					Setp = 0
					break			
				end
			elseif CheckTime < 70 then
				if CheckClock == 5 then
					ScriptMessage( OwnerID(), -1 , 2, "[SC_RACEGAME_WAITEM]" , 0 )	--���ݨ�L���i�J�����j�D
					CheckClock = 0
				end
				--�p��60��H�Ƥ����ɡA��ܵ��ݰT��
				local Obj
				local Count = SetSearchAllPlayer(RoomID)
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == true then
						Lua_PVPAllFull(ID)	--�ɺ����A
					end
				end		
			end
		end
		CheckClock = CheckClock + 1
		CheckTime = CheckTime + 1
		Sleep(10)
	end
	local CheckTime2 = 0
	local CheckFlag = 0;

	if Setp == 0 then
		DebugMsg( 0, RoomID ,"LuaZone_RACEGAME_CheckOK = 10 10 0")
		LuaZone_RACEGAME_CheckOK(10,10,0)	--���aClient��ܭ˼�
		local FirstTemp = 0
		local SecondTemp = 0
		local ThridTemp = 0
		local FourthTemp = 0
		local FifthTemp = 0
		local SixthTemp = 0
		local SeventhTemp = 0
		local EighthTemp = 0
		local WinnerCount = 0
		local CheckFlagBig = 0 
		While 1 do
			if Setp == 0 then	--�˼ƶ��q
				if CheckTime2 <= 10 then		
					--�ˬd�O�_���������
					local CountNomalTeam = 0
					local CountLeaveTeam = 0
					local ThisTeam = {}
					for i=1,8 do
						local CountTeam = GetNumEnterTeamMember(RoomID,i)		--�Ӷ��`�M�H��
						if CountTeam == 0 then
							if GetScore( RoomID, i ) ~= 0 then
								SetScore( RoomID, i , 255 );			--�]�w���Ƭ�����
							end
							ThisTeam[i] = 0
							CountLeaveTeam = CountLeaveTeam + 1
						elseif CountTeam ~= 0 then
							ThisTeam[i] = 1
							CountNomalTeam = CountNomalTeam + 1
						end
					end
					if CountNomalTeam == 1 then
						for k=1,8 do
							if ThisTeam[k] == 1 then
								SetScore( RoomID, k , 1 );	--�]�w���Ƭ��Ĥ@�W
								EndBattleGround( RoomID, k )
								--�������y
								AddTeamItem(RoomID, k , 203038 , 100)
							end
						end
						Setp = 2
						break
					end
					if CheckTime2 == 8 then
						DelObj(StartCOO)
					end
				else
					Setp = 1
					LuaZone_RACEGAME_cancelbuff()	--������
					-- �˼Ƶ����A���}�]��
					--ScriptMessage( OwnerID(),  -1, 2, "[SC_RACEGAME_START]" , 0 )	--���ɶ}�l
					PlayMotionEX( StartDoor, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				end
				CheckTime2 = CheckTime2 + 1
			end
			if Setp == 1 then	--���ɶ��q
				-- �ˬd�O�_���������
				local CountNomalTeam = 0
				local CountLeaveTeam = 0
				local ThisTeam = {}
				for i=1,8 do
					local CountTeam = GetNumEnterTeamMember(RoomID,i)	--�Ӷ��`�M�H��
					if CountTeam == 0 then
						if GetScore( RoomID, i ) ~= 0 then
							SetScore( RoomID, i , 255 );			--�]�w���Ƭ�����
						end
						ThisTeam[i] = 0
						CountLeaveTeam = CountLeaveTeam + 1
					elseif CountTeam ~= 0 then
						ThisTeam[i] = 1
						CountNomalTeam = CountNomalTeam + 1
					end
				end
				DebugMsg( 0, RoomID ,"CountNomalTeam ="..CountNomalTeam.."CountLeaveTeam ="..CountLeaveTeam)
				if CountNomalTeam == 1 then	--�ѤU�@����ɪ�
					for k=1,8 do
						if ThisTeam[k] == 1 then
							SetScore( RoomID, k , 1 );	--�]�w���Ƭ��Ĥ@�W
							EndBattleGround( RoomID, k )
							--�������y
							AddTeamItem(RoomID, k , 203038 , 100)
						end
					end
					Setp = 2
					break
				end
				-- �D�n�j��, �ˬd���L��Ӫ�
				-- �ˬd���L�}��ì��
				--DebugMsg( 0, RoomID ,"Starting Checking Winner !")
				for i=1, 8, 1 do	
					if( GetScore( RoomID, i ) == 1 ) and FirstTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."FirstTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						FirstTemp = i
					elseif ( GetScore( RoomID, i ) == 2 ) and SecondTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."SecondTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						SecondTemp = i
					elseif ( GetScore( RoomID, i ) == 3 ) and ThridTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."ThridTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						ThridTemp = i
					elseif ( GetScore( RoomID, i ) == 4 ) and FourthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."FourthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						FourthTemp = i
					elseif ( GetScore( RoomID, i ) == 5 ) and FifthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."FifthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						FifthTemp = i
					elseif ( GetScore( RoomID, i ) == 6 ) and SixthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."SixthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						SixthTemp = i
					elseif ( GetScore( RoomID, i ) == 7 ) and SeventhTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."SeventhTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						SeventhTemp = i
					elseif ( GetScore( RoomID, i ) == 8 ) and EighthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."EighthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						EighthTemp = i
					end
				end
				--DebugMsg( 0, RoomID ,"Checking Winner End!")
				--�Ҧ����W���a�Ҧ��W��, �ϥμ@��, �N�Ҧ����`�� buff ����, ����, 
				DebugMsg( 0, RoomID ,"WinnerCount ="..WinnerCount.."CountNomalTeam ="..CountNomalTeam)
				if WinnerCount >= CountNomalTeam then
				DebugMsg( 0, RoomID ,"Now ! WinnerCount >= CountNomalTeam")
					local Obj
					local Count = SetSearchAllPlayer(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local ID = GetSearchResult()
							Obj = Role:New( ID )
							if Obj:IsPlayer() == true and ID ~= OwnerID() then
								AddBuff(ID,502690,0,-1)		--���ݤ��ɵ���
							end
						end	
					end	
					-- �M���Ҧ��L�O
					for i=0, table.getn(Mark) do
						DelObj(Mark[i])
					end
					for i=0, table.getn(hindrance) do
						for j=0, table.getn(hindrance[i]) do
							DelObj(hindrance[i][j])
						end
					end
					--CheckBGWinner()---�ˬd�O�_���H����..���޶]���P�_..���s�ƦW��
					local CountWinnerF = {}
					for i=1, 8 do
						local CountTeam = GetNumEnterTeamMember(RoomID,i)	--�Ӷ��`�M�H��
						if CountTeam == 0 then
								SetScore( RoomID, i , 255 );			--�]�w���Ƭ�����
								CountWinnerF[i] = {i,255}
						else
							CountWinnerF[i] = {i,GetScore( RoomID, i )}
						end
					end
					local Min = {}
					local MinTeam = {}
					local BaseTeam = {}
					for j=1, 8 do  
						for i=1, table.getn(CountWinnerF) do
							if Min[j] == nil then
								Min[j] = CountWinnerF[i][2]
								MinTeam[j] = CountWinnerF[i][1]
								BaseTeam[j] = i
								DebugMsg( 0, RoomID ,"1MinTeam[j]="..MinTeam[j])
								DebugMsg( 0, RoomID ,"1CountWinnerF[i]="..CountWinnerF[i][2])
							end
							if CountWinnerF[i][2] ~= 0 then
								if CountWinnerF[i][2] > 0 and CountWinnerF[i][2] < Min[j] then
									Min[j] = CountWinnerF[i][2]
									MinTeam[j] = CountWinnerF[i][1]
									BaseTeam[j] = i
									DebugMsg( 0, RoomID ,"3MinTeam[j]="..MinTeam[j])
									DebugMsg( 0, RoomID ,"3CountWinnerF[i]="..CountWinnerF[i][2])
								end
							end
						end
						DebugMsg( 0, RoomID ,"4MinTeam[j]="..MinTeam[j])
						DebugMsg( 0, RoomID ,"5Min[j]="..Min[j])
						local Remo = BaseTeam[j]
						DebugMsg( 0, RoomID ,"========!!Team ="..MinTeam[j].." Score ="..CountWinnerF[Remo][2])
						SetScore( RoomID, MinTeam[j], CountWinnerF[Remo][2] );	--�]�w�Ĥ@�W����
						table.remove(CountWinnerF,Remo)
					end
					Sleep(15)
					EndBattleGround( RoomID, MinTeam[1] );
					if GetServerDataLanguage() == "kr" then
					else
						if MinTeam[1] ~= 0 and GetScore( RoomID, MinTeam[1] ) < 9 then
						AddTeamItem(RoomID, MinTeam[1] , 203038 , 45)
						end
						if MinTeam[2] ~= 0 and GetScore( RoomID, MinTeam[2] ) < 9 then
						AddTeamItem(RoomID, MinTeam[2] , 203038 , 25)
						end
						if MinTeam[3] ~= 0 and GetScore( RoomID, MinTeam[3] ) < 9 then
						AddTeamItem(RoomID, MinTeam[3] , 203038 , 15)
						end
						if MinTeam[4] ~= 0 and GetScore( RoomID, MinTeam[4] ) < 9 then
						AddTeamItem(RoomID, MinTeam[4] , 203038 , 5)
						end
					end
					Setp = 2
					break
				end
				-- �ˬd�Գ��}�l�ɶ��ܤ��w�h�[, �Y�F��������������, �h�����Գ�
				if CheckFlagBig == 1 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_60]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 30 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_30]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 55 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_5]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 56 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_4]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 57 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_3]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 58 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_2]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 59 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_1]---" , 0 )	--���ɮɶ��L�[
				elseif CheckFlagBig == 60 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_0]---" , 0 )	--���ɮɶ��L�[
					-- �ɶ��w��, �ϥμ@��, �N�Ҧ����`�� buff ����, ����, 
					local Obj
					local Count = SetSearchAllPlayer(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local ID = GetSearchResult()
							Obj = Role:New( ID )
							if Obj:IsPlayer() == true and ID ~= OwnerID() then
								AddBuff(ID,502690,0,-1)		--���ݤ��ɵ���
							end
						end	
					end
					for i=1, 8 do
						if GetScore( RoomID, i ) == 0 then
							SetScore( RoomID, i , 100 );		--�]�w���Ƭ�����
						end
					end
					---- �M���Ҧ��L�O
					--for i=0, table.getn(Mark) do
					--	DelObj(Mark[i])
					--end
					--for i=0, table.getn(hindrance) do
					--	for j=0, table.getn(hindrance[i]) do
					--		DelObj(hindrance[i][j])
					--	end
					--end
					--CheckBGWinner();
					---�ˬd�O�_���H����..���޶]���P�_..���s�ƦW��
					local CountWinnerF = {}
					for i=1,8 do
						local CountTeam = GetNumEnterTeamMember(RoomID,i)	--�Ӷ��`�M�H��
						if CountTeam == 0 then
							if GetScore( RoomID, i ) ~= 0 then
								SetScore( RoomID, i , 255 );			--�]�w���Ƭ�����
								CountWinnerF[i] = {i,255}
							end
						else
							CountWinnerF[i] = {i,GetScore( RoomID, i )}
						end
					end
					local Min = {}
					local MinTeam = {}
					local BaseTeam = {}
					for j=1, 8 do  
						for i=1, table.getn(CountWinnerF) do
							if Min[j] == nil then
								Min[j] = CountWinnerF[i][2]
								MinTeam[j] = CountWinnerF[i][1]
								BaseTeam[j] = i
								DebugMsg( 0, RoomID ,"1MinTeam[j]="..MinTeam[j])
								DebugMsg( 0, RoomID ,"1CountWinnerF[i]="..CountWinnerF[i][2])
							end
							if CountWinnerF[i][2] ~= 0 then
								if CountWinnerF[i][2] > 0 and CountWinnerF[i][2] < Min[j] then
									Min[j] = CountWinnerF[i][2]
									MinTeam[j] = CountWinnerF[i][1]
									BaseTeam[j] = i
									DebugMsg( 0, RoomID ,"3MinTeam[j]="..MinTeam[j])
									DebugMsg( 0, RoomID ,"3CountWinnerF[i]="..CountWinnerF[i][2])
								end
							end
						end
						DebugMsg( 0, RoomID ,"4MinTeam[j]="..MinTeam[j])
						DebugMsg( 0, RoomID ,"5Min[j]="..Min[j])
						local Remo = BaseTeam[j]
						DebugMsg( 0, RoomID ,"========!!Team ="..MinTeam[j].." Score ="..CountWinnerF[Remo][2])
						SetScore( RoomID, MinTeam[j], CountWinnerF[Remo][2] );	--�]�w�Ĥ@�W����
						table.remove(CountWinnerF,Remo)
					end
					Sleep(15)
					EndBattleGround( RoomID, MinTeam[1] );

					if MinTeam[1] ~= 0 and GetScore( RoomID, MinTeam[1] ) < 9 then
					AddTeamItem(RoomID, MinTeam[1] , 203038 , 45)
					end
					if MinTeam[2] ~= 0 and GetScore( RoomID, MinTeam[2] ) < 9 then
					AddTeamItem(RoomID, MinTeam[2] , 203038 , 25)
					end
					if MinTeam[3] ~= 0 and GetScore( RoomID, MinTeam[3] ) < 9 then
					AddTeamItem(RoomID, MinTeam[3] , 203038 , 15)
					end
					if MinTeam[4] ~= 0 and GetScore( RoomID, MinTeam[4] ) < 9 then
					AddTeamItem(RoomID, MinTeam[4] , 203038 , 5)
					end
					Setp = 2
					break
				end
				if FirstTemp ~= 0 then
					CheckFlagBig = CheckFlagBig + 1	
				end
				CheckFlag = CheckFlag + 1;
			end
			Sleep(10)
		end
	end
	if Setp == 2 then	--�������q
		ScriptMessage( OwnerID(),  -1, 2, "[SC_RACEGAME_CLOSEGROUND]" , 0 )	--���ɤw�����A�v�޳��N�b�����������
		Sleep(1200)
		CloseBattleGround(RoomID)
	end
end

function LuaZone_RACEGAME_Revive()
	-- �ϰ쭫�ͼ@��
	local	X 	= 2378
	local	Y	= 55
	local	Z 	= 2338
	local	Dir	= 19
	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );

end

function LuaZone_RACEGAME_JoinQueue( dbid, isTeam, numTeamPeople )

	local totalteam 		= GetNumTeam();	-- ���o�o�Գ��̦h���\������ƶq
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember( i ); --���o

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- �Ǧ^�ӤH���n�i���Ӧ�C
end
function LuaZone_RACEGAME_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


	local totalteam 		= GetNumTeam();	-- ���o�o�Գ��̦h���\������ƶq
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember(LevelGroupID, i ); --���o

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- �Ǧ^�ӤH���n�i���Ӧ�C
end
function LuaZone_RACEGAME_AssignLevelGroup( dbid, lv, worldid )
	return 1
end
function LuaZone_RACEGAME_RoleEnterBattleGround( dbid, teamID )
	local Owner = GetGUIDByDBID(dbid)
	--CancelBuff(Owner, 503080)
	SetHourseColor(Owner,0,0,0,0)
	SetBattleGroundObjCampID( dbid, 6 );	--�]�����߰}��
end

function LuaZone_RACEGAME_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	if teamid == 1 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2378, 60, 2338, 19 );	--�]�w�X���I
	elseif teamid == 2 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2380, 60, 2351, 19 );	--�]�w�X���I
	elseif teamid == 3 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2383, 60, 2363, 19 );	--�]�w�X���I
	elseif teamid == 4 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2386, 60, 2384, 19 );	--�]�w�X���I
	elseif teamid == 5 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2387, 60, 2391, 19 );	--�]�w�X���I
	elseif teamid == 6 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2375, 60, 2318, 19 );	--�]�w�X���I
	elseif teamid == 7 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2373, 60, 2306, 19 );	--�]�w�X���I
	elseif teamid == 8 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2371, 60, 2288, 19 );	--�]�w�X���I
	end
end

function LuaZone_RACEGAME_CheckOK(Time,NowTime,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�10��
			end
		end	
	end
end

function LuaZone_RACEGAME_cancelbuff()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				CancelBuff(ID, 503080)
			end
		end	
	end
end
function LuaZone_PCall_350_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		return 1;	-- ���[�J
	end	
	if (CheckBuff( iObjID , 503080 ) == false) then
		CallPlot( iObjID, "LuaZone_PCall_350_JoinBattleGround", iObjID, iBattleGroundID, iPartyID, iSrvID )
		return 1;	-- ���[�J
	else
		return 0;	-- �����[�J
	end	
end

function LuaZone_PCall_350_JoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	if CheckBuff( iObjID, 501570) == false then  --�W�[�ˬd�P�_
		AddBuff( iObjID, 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( iObjID , EM_LuaDialogType_YesNo ,"[SC_RACEGAME_GETTACKT]")
		DialogSelectStr( iObjID , "[SC_GETTITLE_1]" );
		DialogSelectStr( iObjID , "[SC_CANCEL]" );
		if( DialogSendOpen( iObjID ) == false ) then 
			ScriptMessage( iObjID,iObjID,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--��ưe�X�����D
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( iObjID );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if (CountBodyitem(iObjID,203038) >= 15 )then
						AddBuff(iObjID, 503080, 0, -1)		--���o����
						DelBodyitem(iObjID,203038,15)
						CancelBuff( iObjID, 501570 );--�̫�M��BUFF
						DialogClose( iObjID )
						--�n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
						JoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
						break;
					else
						ScriptMessage( iObjID,iObjID,1,"[SC_111813_YU_36]",0)	
						--
						CancelBuff( iObjID, 501570 );--�̫�M��BUFF
						DialogClose( iObjID )
						-- 2012.07.16 �ץ����a����W����A���v�� - �����j�D(Zone 441)�ɡA�b�����ťN��(203038)�������������p�U�A�����I���T�w���W��A�|���ܵ�����ܡu�w�g�}�Ҥ@�ӹ�ܿﶵ�v�����D�C					
						break;
					end
				elseif ( SelectID == 1 ) then
					CancelBuff( iObjID, 501570 );--�̫�M��BUFF
					DialogClose( iObjID )		
					break
				end
			elseif i == 100 then
				CancelBuff( iObjID, 501570 );--�̫�M��BUFF
				DialogClose( iObjID )		
				break
			end
		end
	else
		ScriptMessage( iObjID, iObjID, 0, "[SC_WINDOW_OPENED]", 0 );
	end
end