	function LuaZone_DEFEND_ChoseTower()
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE00]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[101944]" , "LuaZone_DEFEND_ChoseTower1", 0 ) --攻擊箭塔
		AddSpeakOption( OwnerID(), OwnerID(), "[101954]" , "LuaZone_DEFEND_ChoseTower2", 0 ) --緩慢冰塔
		AddSpeakOption( OwnerID(), OwnerID(), "[101964]" , "LuaZone_DEFEND_ChoseTower3", 0 ) --毒素之塔
		AddSpeakOption( OwnerID(), OwnerID(), "[101974]" , "LuaZone_DEFEND_ChoseTower4", 0 ) --雷光之塔
		AddSpeakOption( OwnerID(), OwnerID(), "[101984]" , "LuaZone_DEFEND_ChoseTower5", 0 ) --火焰之塔
	end
	function LuaZone_DEFEND_ChoseTower1()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_01][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower01", 0 ) --確定
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --回上一頁
	end
	function LuaZone_DEFEND_ChoseTower2()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_02][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower02", 0 ) --確定
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --回上一頁
	end
	function LuaZone_DEFEND_ChoseTower3()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_03][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower03", 0 ) --確定
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --回上一頁
	end
	function LuaZone_DEFEND_ChoseTower4()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_04][$SETVAR1="..Money.."]"); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower04", 0 ) --確定
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --回上一頁
	end
	function LuaZone_DEFEND_ChoseTower5()
		local Money = 5
		SetSpeakDetail( OwnerID(),"[SC_DEFEND_TOWERCHOSE_05][$SETVAR1="..Money.."]" ); 
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_OKAY]" , "LuaZone_DEFEND_ChoseTower05", 0 ) --確定
		AddSpeakOption( OwnerID(), OwnerID(), "[SO_BACK]" , "LuaZone_DEFEND_ChoseTower", 0 ) --回上一頁
	end
	function LuaZone_DEFEND_ChoseTowerBB(Target,ID)
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local OldX = ReadRoleValueFloat(  Target , EM_RoleValue_X )
		local OldY = ReadRoleValueFloat(  Target , EM_RoleValue_Y )
		local OldZ = ReadRoleValueFloat(  Target , EM_RoleValue_Z )
		local OldDir = ReadRoleValueFloat(  Target , EM_RoleValue_Dir )
		local NewOne = CreateObj( ID, OldX ,OldY ,OldZ ,OldDir , 1 )
		SetModeEx( NewOne, EM_SetModeType_Fight, false )--可砍殺攻擊
		SetModeEx( NewOne, EM_SetModeType_Strikback, true )--反擊
		SetModeEx( NewOne, EM_SetModeType_Mark, true )--標記
		SetModeEx( NewOne, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( NewOne, EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( NewOne, EM_SetModeType_Gravity, true )--重力
		SetModeEx( NewOne, EM_SetModeType_Move, false )--移動
		SetModeEx( NewOne, EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( NewOne, EM_SetModeType_Searchenemy, true )--索敵
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
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
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
			SetRoleCampID( NewOne, CampID );	--設定旗子陣營
			SetCursorType( NewOne , eCursor_Interact ); --游標變成 齒輪
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]已經建立了
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--你沒有足夠的能量
		end
	end
	function LuaZone_DEFEND_ChoseTower02()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
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
			SetRoleCampID( NewOne, CampID );	--設定旗子陣營
			SetCursorType( NewOne , eCursor_Interact ); --游標變成 齒輪
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]已經建立了
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--你沒有足夠的能量
		end
	end
	function LuaZone_DEFEND_ChoseTower03()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
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
			SetRoleCampID( NewOne, CampID );	--設定旗子陣營
			SetCursorType( NewOne , eCursor_Interact ); --游標變成 齒輪
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]已經建立了
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--你沒有足夠的能量
		end
	end
	function LuaZone_DEFEND_ChoseTower04()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
			return
		end
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
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
			SetRoleCampID( NewOne, CampID );	--設定旗子陣營
			SetCursorType( NewOne , eCursor_Interact ); --游標變成 齒輪
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]已經建立了
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--你沒有足夠的能量
		end
	end
	function LuaZone_DEFEND_ChoseTower05()
		local TTT = TargetID()
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--DebugMsg( 0, RoomID ,"TTT = "..TTT.."1")
		--DebugMsg( 0, RoomID ,"PID = "..ReadRoleValue( TargetID() , EM_RoleValue_PID))
		if CheckID(TTT)== false then
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
			return
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			--DebugMsg( 0, RoomID ,"TTT = "..TTT.."2")
			CloseSpeak( OwnerID())
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
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
			SetRoleCampID( NewOne, CampID );	--設定旗子陣營
			SetCursorType( NewOne , eCursor_Interact ); --游標變成 齒輪
			SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERBUILDING][$SETVAR1=".."["..ID.."]".."]",0)	--[$VAR1]已經建立了
			DelObj(TargetID())
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--你沒有足夠的能量
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
					if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
						AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF					
					-----詢問框
						DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_DEFEND_TOWERCHOSE01][$SETVAR1="..5*(2^(j)).."]")
						DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
						DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
						if( DialogSendOpen( OwnerID() ) == false ) then 
							ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
							--資料送出有問題
							return
						end
						for i = 0 , 100 , 1 do
							Sleep( 1 );
							SelectID = DialogGetResult( OwnerID() );
							if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
								if ( SelectID == 0 ) then							
									CancelBuff( OwnerID(), 501570 );--最後清除BUFF
									DialogClose( OwnerID() )
									Setp = 1
									break;
								elseif ( SelectID == 1 ) then
									CancelBuff( OwnerID(), 501570 );--最後清除BUFF
									DialogClose( OwnerID() )	
									Setp = 2	
									break
								end
							elseif i == 100 then
								CancelBuff( OwnerID(), 501570 );--最後清除BUFF
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
								SetModeEx( NewOne, EM_SetModeType_Fight, false )--可砍殺攻擊
								SetModeEx( NewOne, EM_SetModeType_Strikback, true )--反擊
								SetModeEx( NewOne, EM_SetModeType_Mark, true )--標記
								SetModeEx( NewOne, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
								SetModeEx( NewOne, EM_SetModeType_Obstruct, false )--阻擋
								SetModeEx( NewOne, EM_SetModeType_Gravity, false )--重力
								SetModeEx( NewOne, EM_SetModeType_Move, false )--移動
								SetModeEx( NewOne, EM_SetModeType_Drag , true )--阻力
								SetModeEx( NewOne, EM_SetModeType_ShowRoleHead, true )--頭像框
								SetModeEx( NewOne, EM_SetModeType_Searchenemy, true )--索敵
								AddToPartition(NewOne , RoomID)
								SetRoleCampID( NewOne , Camp )
								SetCursorType( NewOne , eCursor_Interact ); --游標變成 齒輪
								ScriptMessage( TargetID(), OwnerID(), 1, "[SC_DEFEND_TOWERUP]" , C_SYSTEM )	--塔成功升級了！！
								SetPlot(NewOne,"touch","LuaZone_DEFEND_Upgrade01",30)
								--Say(NewOne,"NewX"..ReadRoleValueFloat(  NewOne , EM_RoleValue_X ).." NewY"..ReadRoleValueFloat(  NewOne , EM_RoleValue_Y ).." NewZ"..ReadRoleValueFloat(  NewOne , EM_RoleValue_Z ).." NewDir"..ReadRoleValueFloat(  NewOne , EM_RoleValue_Dir))
								DelObj(TargetID())
								break
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--你沒有足夠的能量
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
			ScriptMessage( TargetID(), OwnerID(), 1, "[SC_DEFEND_TOWERTOP]" , C_SYSTEM )	--塔已經是最高等級的了！！
		end
	end

	function DavisTest_BornMonster288(MonsterID,Count)	--生怪劇情
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--取得所在room
		local FlagObj = {}--建立一個空的陣列
		for i=1, Count do 
			FlagObj[i] = CreateObjByFlag( MonsterID , 780288 , 0 , 1 ) 	--建立一個怪物在0號旗子上
			SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--反擊
			SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( FlagObj[i], EM_SetModeType_Mark, true )--標記
			SetModeEx( FlagObj[i], EM_SetModeType_Move, true )--移動
			SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( FlagObj[i], EM_SetModeType_HideName, true )--名稱
			SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, true )--頭像框
			SetModeEx( FlagObj[i], EM_SetModeType_Fight , true )--可砍殺攻擊
			SetModeEx( FlagObj[i], EM_SetModeType_Drag , true )--阻力
			WriteRoleValue( FlagObj[i] ,EM_RoleValue_IsWalk , 0  )
			AddToPartition(FlagObj[i] , RoomID)
			if i ==10 then
				AddBuff(FlagObj[i] ,504336 ,1 ,-1 ); --特殊標記邪惡怪
			end
			AddBuff(FlagObj[i] ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			BeginPlot(FlagObj[i],"Lua_Moveto288",0)	--要所有的怪物執行這個劇情
			SetPlot( FlagObj[i] ,"dead","LuaZone_DEFEND_DeadAddMoney1",0)
			Sleep(10)
		end
		return FlagObj
	end
	function Lua_Moveto288()	--怪物沿著288走劇情
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--取得所在room
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
	function DavisTest_BornMonster192(MonsterID,Count)	--生怪劇情
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--取得所在room
		local FlagObj = {}--建立一個空的陣列
		for i=1, Count do 
			FlagObj[i] = CreateObjByFlag( MonsterID ,780192 , 0 , 1 ) 	--建立一個怪物在0號旗子上
			SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--反擊
			SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( FlagObj[i], EM_SetModeType_Mark, true )--標記
			SetModeEx( FlagObj[i], EM_SetModeType_Move, true )--移動
			SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( FlagObj[i], EM_SetModeType_HideName, true )--名稱
			SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, true )--頭像框
			SetModeEx( FlagObj[i], EM_SetModeType_Fight , true )--可砍殺攻擊
			SetModeEx( FlagObj[i], EM_SetModeType_Drag , true )--阻力
			WriteRoleValue( FlagObj[i] ,EM_RoleValue_IsWalk , 0  )
			AddToPartition(FlagObj[i] , RoomID)
			if i == 10 then
				AddBuff(FlagObj[i] ,504336 ,1 ,-1 ); --特殊標記邪惡怪
			end
			AddBuff(FlagObj[i] ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			BeginPlot(FlagObj[i],"Lua_Moveto192",0)	--要所有的怪物執行這個劇情
			SetPlot( FlagObj[i] ,"dead","LuaZone_DEFEND_DeadAddMoney",0)
			Sleep(10)
		end
		return FlagObj
	end
	function Lua_Moveto192()	--怪物沿著288走劇情
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );--取得所在room
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