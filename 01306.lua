	function LuaZone_DEFEND_ChoseTower()
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE00]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[101944]" , "LuaZone_DEFEND_ChoseTower1", 0 ) --�����b��
		AddSpeakOption( OwnerID(), OwnerID(), "[101954]" , "LuaZone_DEFEND_ChoseTower2", 0 ) --�w�C�B��
		AddSpeakOption( OwnerID(), OwnerID(), "[101964]" , "LuaZone_DEFEND_ChoseTower3", 0 ) --�r������
		AddSpeakOption( OwnerID(), OwnerID(), "[101974]" , "LuaZone_DEFEND_ChoseTower4", 0 ) --�p������
		AddSpeakOption( OwnerID(), OwnerID(), "[101984]" , "LuaZone_DEFEND_ChoseTower5", 0 ) --���K����
	end
	function LuaZone_DEFEND_ChoseTower1()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_01][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower01", 0 ) --�T�w
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --�^�W�@��
	end
	function LuaZone_DEFEND_ChoseTower2()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_02][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower02", 0 ) --�T�w
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --�^�W�@��
	end
	function LuaZone_DEFEND_ChoseTower3()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_03][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower03", 0 ) --�T�w
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --�^�W�@��
	end
	function LuaZone_DEFEND_ChoseTower4()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_04][$SETVAR1="..Money.."]"); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower04", 0 ) --�T�w
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --�^�W�@��
	end
	function LuaZone_DEFEND_ChoseTower5()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_05][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower05", 0 ) --�T�w
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --�^�W�@��
	end
	function LuaZone_DEFEND_ChoseTowerBB(Target,ID)
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local OldX = ReadRoleValueFloat(  Target , EM_RoleValue_X )
		local OldY = ReadRoleValueFloat(  Target , EM_RoleValue_Y )
		local OldZ = ReadRoleValueFloat(  Target , EM_RoleValue_Z )
		local OldDir = ReadRoleValueFloat(  Target , EM_RoleValue_Dir )
		local NewOne = CreateObj( ID, OldX ,OldY ,OldZ ,OldDir , 1 )
		SetModeEx( NewOne, EM_SetModeType_Fight, false )--�i�������
		SetModeEx( NewOne, EM_SetModeType_Strikback, true )--����
		SetModeEx( NewOne, EM_SetModeType_Mark, true )--�аO
		SetModeEx( NewOne, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NewOne, EM_SetModeType_Obstruct, false )--����
		SetModeEx( NewOne, EM_SetModeType_Gravity, true )--���O
		SetModeEx( NewOne, EM_SetModeType_Move, false )--����
		SetModeEx( NewOne, EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( NewOne, EM_SetModeType_Searchenemy, true )--����
		AddToPartition(NewOne , RoomID)
		return NewOne
	end
	function LuaZone_DEFEND_ChoseTower01()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end 
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )
		CloseSpeak( OwnerID())
		local CampID = GetRoleCampID(OwnerID())
	--	Say(OwnerID(),"CampID = "..CampID)
		local Money = 0
		if CampID == 9 then
			Money = T1Score[RoomID]
		elseif CampID == 8 then
			Money = T2Score[RoomID]
		end
		if Money >= 5 then
			if CampID == 9 then
				T1Score[RoomID] = T1Score[RoomID] - 5
				SetVar(RoomID, 2 , T1Score[RoomID])
				--DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
			elseif CampID == 8 then
				T2Score[RoomID] = T2Score[RoomID] - 5
				SetVar( RoomID, 1, T2Score[RoomID] )
				--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			end
			local ID = 101944
			local NewOne = LuaZone_DEFEND_ChoseTowerBB(TargetID(),ID)
			SetRoleCampID( NewOne, CampID );	--�]�w�X�l�}��
			SetCursorType( NewOne , eCursor_Interact ); --����ܦ� ����
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]�w�g�إߤF
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
		end
	end
	function LuaZone_DEFEND_ChoseTower02()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end 
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )
		CloseSpeak( OwnerID())
		local CampID = GetRoleCampID(OwnerID())
	--	Say(OwnerID(),"CampID = "..CampID)
		local Money = 0
		if CampID == 9 then
			Money = T1Score[RoomID]
		elseif CampID == 8 then
			Money = T2Score[RoomID]
		end
		if Money >= 5 then
			if CampID == 9 then
				T1Score[RoomID] = T1Score[RoomID] - 5
				SetVar(RoomID, 2 , T1Score[RoomID])
				--DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
			elseif CampID == 8 then
				T2Score[RoomID] = T2Score[RoomID] - 5
				SetVar( RoomID, 1, T2Score[RoomID] )
				--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			end
			local ID = 101954
			local NewOne =LuaZone_DEFEND_ChoseTowerBB(TargetID(),ID)
			SetRoleCampID( NewOne, CampID );	--�]�w�X�l�}��
			SetCursorType( NewOne , eCursor_Interact ); --����ܦ� ����
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]�w�g�إߤF
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
		end
	end
	function LuaZone_DEFEND_ChoseTower03()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end 
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )
		CloseSpeak( OwnerID())
		local CampID = GetRoleCampID(OwnerID())
	--	Say(OwnerID(),"CampID = "..CampID)
		local Money = 0
		if CampID == 9 then
			Money = T1Score[RoomID]
		elseif CampID == 8 then
			Money = T2Score[RoomID]
		end
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."3")
		if Money >= 5 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."4")
			if CampID == 9 then
				T1Score[RoomID] = T1Score[RoomID] - 5
				SetVar(RoomID, 2 , T1Score[RoomID])
				--DebugMsg( 0, RoomID ,"TTT = "..TTT.."5")
				----DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
			elseif CampID == 8 then
				T2Score[RoomID] = T2Score[RoomID] - 5
				SetVar( RoomID, 1, T2Score[RoomID] )
				--DebugMsg( 0, RoomID ,"TTT = "..TTT.."5")
				--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			end
			local ID = 101964
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."6")
			local NewOne =LuaZone_DEFEND_ChoseTowerBB(TargetID(),ID)
			SetRoleCampID( NewOne, CampID );	--�]�w�X�l�}��
			SetCursorType( NewOne , eCursor_Interact ); --����ܦ� ����
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]�w�g�إߤF
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
		end
	end
	function LuaZone_DEFEND_ChoseTower04()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )
		CloseSpeak( OwnerID())
		local CampID = GetRoleCampID(OwnerID())
	--	Say(OwnerID(),"CampID = "..CampID)
		local Money = 0
		if CampID == 9 then
			Money = T1Score[RoomID]
		elseif CampID == 8 then
			Money = T2Score[RoomID]
		end
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."3")
		if Money >= 5 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."4")
			if CampID == 9 then
				T1Score[RoomID] = T1Score[RoomID] - 5
				SetVar(RoomID, 2 , T1Score[RoomID])
				--DebugMsg( 0, RoomID ,"TTT = "..TTT.."5")
				--DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
			elseif CampID == 8 then
				T2Score[RoomID] = T2Score[RoomID] - 5
				SetVar( RoomID, 1, T2Score[RoomID] )
				--DebugMsg( 0, RoomID ,"TTT = "..TTT.."5")
				--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			end
			local ID = 101974
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."6")
			local NewOne =LuaZone_DEFEND_ChoseTowerBB(TargetID(),ID)
			SetRoleCampID( NewOne, CampID );	--�]�w�X�l�}��
			SetCursorType( NewOne , eCursor_Interact ); --����ܦ� ����
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]�w�g�إߤF
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
		end
	end
	function LuaZone_DEFEND_ChoseTower05()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end 
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )
		CloseSpeak( OwnerID())
		local CampID = GetRoleCampID(OwnerID())
	--	Say(OwnerID(),"CampID = "..CampID)
		local Money = 0
		if CampID == 9 then
			Money = T1Score[RoomID]
		elseif CampID == 8 then
			Money = T2Score[RoomID]
		end
		if Money >= 5 then
			if CampID == 9 then
				T1Score[RoomID] = T1Score[RoomID] - 5
				SetVar(RoomID, 2 , T1Score[RoomID])
				--DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
			elseif CampID == 8 then
				T2Score[RoomID] = T2Score[RoomID] - 5
				SetVar( RoomID, 1, T2Score[RoomID] )
				--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			end
			local ID = 101984
			local NewOne =LuaZone_DEFEND_ChoseTowerBB(TargetID(),ID)
			SetRoleCampID( NewOne, CampID );	--�]�w�X�l�}��
			SetCursorType( NewOne , eCursor_Interact ); --����ܦ� ����
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]�w�g�إߤF
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
		end
	end
	function LuaZone_DEFEND_Upgrade01()
		local Camp = GetRoleCampID(OwnerID())
		local TowerCamp = GetRoleCampID(TargetID())
		if Camp ~= TowerCamp then
		--	Say(OwnerID(),"Camp = "..Camp.." TowerCamp = "..TowerCamp)
			return
		end
		SetPlot(TargetID(),"touch","",0)
		--Say(TargetID(),"OldX"..ReadRoleValueFloat(  TargetID() , EM_RoleValue_X ).." OldY"..ReadRoleValueFloat(  TargetID() , EM_RoleValue_Y ).." OldZ"..ReadRoleValueFloat(  TargetID() , EM_RoleValue_Z ).." OldDir"..ReadRoleValueFloat(  TargetID() , EM_RoleValue_Dir ))	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local ID = {}
		ID[1] = { 101944,101945,101946,101947,101948,101949,101950,101951,101952,101953 }
		ID[2] = { 101954,101955,101956,101957,101958,101959,101960,101961,101962,101963 }
		ID[3] = { 101964,101965,101966,101967,101968,101969,101970,101971,101972,101973 }
		ID[4] = { 101974,101975,101976,101977,101978,101979,101980,101981,101982,101983 }
		ID[5] = { 101984,101985,101986,101987,101988,101989,101990,101991,101992,101993 }
		local OwnerOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		local Count = table.getn(ID[1])
		--DebugMsg( 0, RoomID ,"OwnerOrgID = "..OwnerOrgID.."Count = "..Count.."ID[Count] = "..ID[Count])
		local OldX = ReadRoleValueFloat(  TargetID() , EM_RoleValue_X )
		local OldY = ReadRoleValueFloat(  TargetID() , EM_RoleValue_Y )
		local OldZ = ReadRoleValueFloat(  TargetID() , EM_RoleValue_Z )
		local OldDir = ReadRoleValueFloat(  TargetID() , EM_RoleValue_Dir )	
		local Money = 0
		local Kind = 1
		if Camp == 9 then
			Money = T1Score[RoomID]
		elseif Camp == 8 then
			Money = T2Score[RoomID]
		end
		for i = 1 , table.getn(ID) do
			for j = 1 , table.getn(ID[i]) do
				if OwnerOrgID == ID[i][j] then
					Kind = i
				end
			end
		end
		if OwnerOrgID ~= ID[Kind][Count] then
			for j = 1 , table.getn(ID[Kind]) do
				if OwnerOrgID == ID[Kind][j] then
					if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
						AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF					
					-----�߰ݮ�
						DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_DEFEND_TOWERCHOSE01][$SETVAR1="..5*(2^(j)).."]")
						DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
						DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
						if( DialogSendOpen( OwnerID() ) == false ) then 
							ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
							--��ưe�X�����D
							return
						end
						for i = 0 , 100 , 1 do
							Sleep( 1 );
							SelectID = DialogGetResult( OwnerID() );
							if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
								if ( SelectID == 0 ) then							
									CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
									DialogClose( OwnerID() )
									Setp = 1
									break;
								elseif ( SelectID == 1 ) then
									CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
									DialogClose( OwnerID() )	
									Setp = 2	
									break
								end
							elseif i == 100 then
								CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
								DialogClose( OwnerID() )	
								Setp = 2	
								break
							end
						end

						if Setp == 1 then
							if Money >= 5*(2^(j)) then
								if Camp == 9 then
									T1Score[RoomID] = T1Score[RoomID] - 5*(2^(j))
									SetVar( RoomID, 2, T1Score[RoomID] )
									--DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
								elseif Camp == 8 then
									T2Score[RoomID] = T2Score[RoomID] - 5*(2^(j))
									SetVar( RoomID, 1, T2Score[RoomID] )
									--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
								end
								--DebugMsg( 0, RoomID ,"ID[j] = "..ID[j].."ID[j+1] = "..ID[j+1])
							 	local NewOne = CreateObj( ID[Kind][j+1], OldX ,OldY ,OldZ ,OldDir , 1 )
								SetModeEx( NewOne, EM_SetModeType_Fight, false )--�i�������
								SetModeEx( NewOne, EM_SetModeType_Strikback, true )--����
								SetModeEx( NewOne, EM_SetModeType_Mark, true )--�аO
								SetModeEx( NewOne, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
								SetModeEx( NewOne, EM_SetModeType_Obstruct, false )--����
								SetModeEx( NewOne, EM_SetModeType_Gravity, false )--���O
								SetModeEx( NewOne, EM_SetModeType_Move, false )--����
								SetModeEx( NewOne, EM_SetModeType_Drag , true )--���O
								SetModeEx( NewOne, EM_SetModeType_ShowRoleHead, true )--�Y����
								SetModeEx( NewOne, EM_SetModeType_Searchenemy, true )--����
								AddToPartition(NewOne , RoomID)
								SetRoleCampID( NewOne , Camp )
								SetCursorType( NewOne , eCursor_Interact ); --����ܦ� ����
								ScriptMessage( TargetID(), OwnerID(), 1, "[SC_DEFEND_TOWERUP]" , C_SYSTEM )	--�𦨥\�ɯŤF�I�I
								SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
								--Say(NewOne,"NewX"..ReadRoleValueFloat(  NewOne , EM_RoleValue_X ).." NewY"..ReadRoleValueFloat(  NewOne , EM_RoleValue_Y ).." NewZ"..ReadRoleValueFloat(  NewOne , EM_RoleValue_Z ).." NewDir"..ReadRoleValueFloat(  NewOne , EM_RoleValue_Dir))
								DelObj(TargetID())
								break
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
								SetPlot(TargetID(),"touch","LuaZone_DEFEND_Upgrade01",30)
							end
							
						elseif Setp == 2 then
							SetPlot(TargetID(),"touch","LuaZone_DEFEND_Upgrade01",30)
							break
						end
					else
						ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
						break
					end
				end
			end
		else
			ScriptMessage( TargetID(), OwnerID(), 1, "[SC_DEFEND_TOWERTOP]" , C_SYSTEM )	--��w�g�O�̰����Ū��F�I�I
		end
	end

	function DavisTest_BornMonster288(MonsterID,Count)	--�ͩǼ@��
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--���o�Ҧbroom
		local FlagObj = {}--�إߤ@�ӪŪ��}�C
		for i=1, Count do 
			FlagObj[i] = CreateObjByFlag( MonsterID , 780288 , 0 , 1 ) 	--�إߤ@�өǪ��b0���X�l�W
			SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--����
			SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--����
			SetModeEx( FlagObj[i], EM_SetModeType_Mark, true )--�аO
			SetModeEx( FlagObj[i], EM_SetModeType_Move, true )--����
			SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--����
			SetModeEx( FlagObj[i], EM_SetModeType_HideName, true )--�W��
			SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, true )--�Y����
			SetModeEx( FlagObj[i], EM_SetModeType_Fight , true )--�i�������
			SetModeEx( FlagObj[i], EM_SetModeType_Drag , true )--���O
			WriteRoleValue( FlagObj[i] ,EM_RoleValue_IsWalk , 0  )
			AddToPartition(FlagObj[i] , RoomID)
			if i ==10 then
				AddBuff(FlagObj[i] ,504336 ,1 ,-1 ); --�S��аO���c��
			end
			AddBuff(FlagObj[i] ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			BeginPlot(FlagObj[i],"Lua_Moveto288",0)	--�n�Ҧ����Ǫ�����o�Ӽ@��
			SetPlot( FlagObj[i] ,"dead","LuaZone_DEFEND_DeadAddMoney1",0)
			Sleep(10)
		end
		return FlagObj
	end
	function Lua_Moveto288()	--�Ǫ��u��288���@��
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--���o�Ҧbroom
		local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
		Temp =   { 102404,102396,102397,102398,102399,102400 }
		MoveToFlagEnabled( OwnerID() , false )
		local FlagCount = GetMoveFlagCount ( 780288 ) - 1
		local LostScore = 1
		for i = 0 , FlagCount , 1 do
			--Say(OwnerID(),"Mo to Flag "..i)
			LuaFunc_MoveToFlagandWait(OwnerID() , 780288, i, 0)
		end
		for i = 1, table.getn(Temp) do
			--DebugMsg( 0, RoomID ,"OrgID = "..OrgID.."Temp = "..Temp[i].."i = "..i)
			if OrgID == Temp[i] then
				LostScore = 1+(i-1)*2
			end
		end
		--debugMsg( 0, RoomID ,"T2 Lost Point = "..LostScore)
		T2Point[RoomID] = T2Point[RoomID] - LostScore
		SetScore( RoomID, 1, T2Point[RoomID] )
		DelObj(OwnerID())
	end
	function DavisTest_BornMonster192(MonsterID,Count)	--�ͩǼ@��
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--���o�Ҧbroom
		local FlagObj = {}--�إߤ@�ӪŪ��}�C
		for i=1, Count do 
			FlagObj[i] = CreateObjByFlag( MonsterID ,780192 , 0 , 1 ) 	--�إߤ@�өǪ��b0���X�l�W
			SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--����
			SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--����
			SetModeEx( FlagObj[i], EM_SetModeType_Mark, true )--�аO
			SetModeEx( FlagObj[i], EM_SetModeType_Move, true )--����
			SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--����
			SetModeEx( FlagObj[i], EM_SetModeType_HideName, true )--�W��
			SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, true )--�Y����
			SetModeEx( FlagObj[i], EM_SetModeType_Fight , true )--�i�������
			SetModeEx( FlagObj[i], EM_SetModeType_Drag , true )--���O
			WriteRoleValue( FlagObj[i] ,EM_RoleValue_IsWalk , 0  )
			AddToPartition(FlagObj[i] , RoomID)
			if i == 10 then
				AddBuff(FlagObj[i] ,504336 ,1 ,-1 ); --�S��аO���c��
			end
			AddBuff(FlagObj[i] ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			BeginPlot(FlagObj[i],"Lua_Moveto192",0)	--�n�Ҧ����Ǫ�����o�Ӽ@��
			SetPlot( FlagObj[i] ,"dead","LuaZone_DEFEND_DeadAddMoney",0)
			Sleep(10)
		end
		return FlagObj
	end
	function Lua_Moveto192()	--�Ǫ��u��288���@��
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--���o�Ҧbroom
		local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
		Temp =   { 102404,102396,102397,102398,102399,102400 }
		MoveToFlagEnabled( OwnerID() , false )
		local FlagCount = GetMoveFlagCount ( 780192 ) - 1
		local LostScore = 1
		for i = 0 , FlagCount , 1 do
			--Say(OwnerID(),"Mo to Flag "..i)
			LuaFunc_MoveToFlagandWait(OwnerID() , 780192, i, 0)
		end
		for i = 1, table.getn(Temp) do
			--DebugMsg( 0, RoomID ,"OrgID = "..OrgID.."Temp = "..Temp[i].."i = "..i)
			if OrgID == Temp[i] then
				LostScore = 1+(i-1)*2
			end
		end
		--debugMsg( 0, RoomID ,"T1 Lost Point = "..LostScore)
		T1Point[RoomID] = T1Point[RoomID] - LostScore
		SetScore( RoomID,2, T1Point[RoomID] )
		DelObj(OwnerID())
	end