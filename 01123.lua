function LuaYU_cbend_0()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )   
	local F={}
	local FF={}
	local M={}
	local Obj = Role:new( OwnerID() )
	--2013.03.27 修正單一區域有2個以上的分流時，在旗標上建立物件時會出現 lua 報錯的問題，將EM_RoleValue_RealZoneID還原成EM_RoleValue_ZoneID。
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) --會讀到真實的分流區域
	--
	local OldGuard1= nil
	local OldGuard2= nil
	local NewGuard1= nil
	local NewGuard2= nil
	local Monster1= nil
	local Monster2 = nil
	local Monster3 = nil
	local Monster4 = nil
	local Monster5 = nil
	local Monster6 = nil
	local SayString2= nil
	local BaseX =  nil
	local BaseY =  nil
	local BaseZ =  nil
	local BaseDir = nil
	if ZoneID == 1 then
		 OldGuard1=100946
		 OldGuard2=100947
		 NewGuard1=101474
		 NewGuard2=101475
		 Monster1= 101478
		 Monster2 = 101479
		 Monster3 = 100071
		 Monster4 = 100653
		 Monster5 = 101476
		 Monster6 = 101477
		 SayString2= "[SC_YU_CBEND_2]"
		 BaseX = -460
		 BaseY = 40
		 BaseZ = -6069
		 BaseDir = 68
	elseif ZoneID == 2 then
		 OldGuard1=100946
		 OldGuard2=100947
		 NewGuard1=101474
		 NewGuard2=101475
		 Monster1= 101480
		 Monster2 = 101481
		 Monster3 = 100071
		 Monster4 = 100653
		 Monster5 = 101476
		 Monster6 = 101477
		 SayString2= "[SC_YU_CBEND_2]"
		 BaseX = 3690
		 BaseY = 65
		 BaseZ = -501
		 BaseDir = 59
	elseif ZoneID == 4 then
		 OldGuard1=100948
		 OldGuard2=100949
		 NewGuard1=101482
		 NewGuard2=101483
		 Monster1= 101480
		 Monster2 = 101481
		 Monster3 = 100071
		 Monster4 = 100653
		 Monster5 = 101476
		 Monster6 = 101477
		 SayString2= "[SC_YU_CBEND_3]"
		 BaseX = -5330
		 BaseY = 580
		 BaseZ = 3141
		 BaseDir = 301
	elseif ZoneID == 5 then
		 OldGuard1=100950
		 OldGuard2=100951
		 NewGuard1=101484
		 NewGuard2=101485
		 Monster1= 101480
		 Monster2 = 101481
		 Monster3 = 100071
		 Monster4 = 100653
		 Monster5 = 101476
		 Monster6 = 101477
		 SayString2= "[SC_YU_CBEND_7]"
		 BaseX = -13831
		 BaseY = 800
		 BaseZ = -319
		 BaseDir = 148
	end

	F[0] = CreateObjByFlag( OldGuard1, 780232, 0 , 1 );           
	F[1] = CreateObjByFlag( OldGuard2, 780232, 1 , 1 );     
	F[2] = CreateObjByFlag( OldGuard1, 780232, 2 , 1 );    
	F[3] = CreateObjByFlag( OldGuard2, 780232, 3 , 1 );           
	F[4] = CreateObjByFlag( OldGuard1, 780232, 4 , 1 );          
	F[5] = CreateObjByFlag( OldGuard2, 780232, 5 , 1 );            
	for i=0, table.getn(F) do
		AddToPartition( F[i], 0) 
		WriteRoleValue( F[i] , EM_RoleValue_PID , OwnerID() )   
		BeginPlot( F[i] , "LuaYU_cbend_1" , 0 )  
	end
	while true do
		sleep(30)
		local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		if LD == 5 then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )   
			for i=0,table.getn(F) do    -- table.getn(F)  搜尋 F 全部
				Delobj( F[i] )
			end
			FF[0] = CreateObjByFlag( NewGuard1, 780232, 0 , 1 );            
			FF[1] = CreateObjByFlag( NewGuard2, 780232, 1 , 1 );           
			FF[2] = CreateObjByFlag( NewGuard1, 780232, 2 , 1 );           
			FF[3] = CreateObjByFlag( NewGuard2, 780232, 3 , 1 );           
			FF[4] = CreateObjByFlag( NewGuard1, 780232, 4 , 1 );          
			FF[5] = CreateObjByFlag( NewGuard2, 780232, 5 , 1 );       
			for i=0, table.getn(FF) do
				AddToPartition( FF[i] , 0) 
				WriteRoleValue( FF[i] , EM_RoleValue_PID , OwnerID() )   
				BeginPlot( FF[i] , "LuaYU_cbend_1" , 0 )  
			end
			sleep(10)	

			ClientSkyType( EM_ClientSkyProcType_Night ) --改變遊戲時間為 夜晚

			sleep(50)	
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_YU_CBEND_0]".. "|r" , 0 ) --哈哈哈哈！可恨的人類！夜晚將永遠來臨！迎接你們的末日吧！
			sleep(30)	
			M[0] = CreateObjByFlag( Monster1, 780233, 0 , 1 );            
			M[1] = CreateObjByFlag( Monster2, 780233, 1 , 1 );            
			M[2] = CreateObjByFlag( Monster2, 780233, 2 , 1 );            
			M[3] = CreateObjByFlag( Monster3, 780233, 3 , 1 );            
			M[4] = CreateObjByFlag( Monster4, 780233, 4 , 1 );            
			M[5] = CreateObjByFlag( Monster3, 780233, 5 , 1 );            
			M[6] = CreateObjByFlag( Monster4, 780233, 6 , 1 );            
			M[7] = CreateObjByFlag( Monster3, 780233, 7 , 1 );            
			for i=0, 7 do
				AddToPartition( M[i] , 0) 
				SetAttack( M[i] , FF[rand(2)] )
			end
			M[8] = CreateObjByFlag( Monster1, 780233, 8 , 1 );            
			M[9] = CreateObjByFlag( Monster2, 780233, 9 , 1 );            
			M[10] = CreateObjByFlag( Monster2, 780233, 10 , 1 );            
			M[11] = CreateObjByFlag( Monster3, 780233, 11 , 1 );            
			M[12] = CreateObjByFlag( Monster4, 780233, 12 , 1 );            
			M[13] = CreateObjByFlag( Monster3, 780233, 13 , 1 );            
			M[14] = CreateObjByFlag( Monster4, 780233, 14 , 1 );            
			for i=8, 14 do
				AddToPartition( M[i] , 0) 
				SetAttack( M[i] , FF[rand(2)+2] )
			end
			M[15] = CreateObjByFlag( Monster1, 780233, 15 , 1 );            
			M[16] = CreateObjByFlag( Monster2, 780233, 16 , 1 );            
			M[17] = CreateObjByFlag( Monster2, 780233, 17 , 1 );            
			M[18] = CreateObjByFlag( Monster3, 780233, 18 , 1 );            
			M[19] = CreateObjByFlag( Monster4, 780233, 19 , 1 );            
			M[20] = CreateObjByFlag( Monster3, 780233, 20 , 1 );            
			M[21] = CreateObjByFlag( Monster4, 780233, 21 , 1 );            
			for i=15, 21 do
				AddToPartition( M[i] , 0) 
				SetAttack( M[i] , FF[rand(2)+4] )
			end
			for i=0, table.getn(M) do
	 			MoveToFlagEnabled( M[i] , false )
			end

			sleep(80)
			if ZoneID == 1 then
				RunningMsg( OwnerID() , 2 , "[SC_YU_CBEND_8]" )  --凡瑞娜絲城警備隊通報，惡靈安多利爾目前正在大舉侵略羅格鎮，請求立即支援！

			elseif ZoneID == 2 then
				RunningMsg( OwnerID() , 2 , "[SC_YU_CBEND_9]" )  --凡瑞娜絲城警備隊通報，惡靈安多利爾目前正在大舉侵略凡瑞娜絲城，請求立即支援！
			elseif ZoneID == 4 then
				RunningMsg( OwnerID() , 2 , "[SC_YU_CBEND_10]" )  --銀瀑村警備隊通報，惡靈安多利爾目前正在大舉侵略銀瀑村，請求立即支援！
			elseif ZoneID == 5 then
				RunningMsg( OwnerID() , 2 , "[SC_YU_CBEND_11]" )  --黑曜石警備隊通報，惡靈安多利爾目前正在大舉侵略哈沃夫交易站，請求立即支援！
			end



			sleep(350)
			for i=0 , 5 do
				if CheckID( FF[i] ) == true then
					BeginPlot( FF[i] , "LuaP_Dead" , 0 )   
					sleep(20)
					Delobj(  FF[i]  )
				end
			end
			FF[7] = CreateObjByFlag( NewGuard2, 780232, 6 , 1 ); 
			WriteRoleValue(FF[7],EM_RoleValue_Register1,7)
			FF[8] = CreateObjByFlag( NewGuard1, 780232, 6 , 1 );  
			WriteRoleValue(FF[8],EM_RoleValue_Register1,8)
			FF[9] = CreateObjByFlag( NewGuard2, 780232, 7 , 1 );  
			WriteRoleValue(FF[9],EM_RoleValue_Register1,9)
			FF[10] = CreateObjByFlag( NewGuard1, 780232, 7 , 1 );  
			WriteRoleValue(FF[10],EM_RoleValue_Register1,10)
			FF[11] = CreateObjByFlag( NewGuard2, 780232, 8 , 1 ); 
			WriteRoleValue(FF[11],EM_RoleValue_Register1,11)
			FF[12] = CreateObjByFlag( NewGuard1, 780232, 8 , 1 ); 
			WriteRoleValue(FF[12],EM_RoleValue_Register1,12)
			for i=7, 12 do
				AddToPartition( FF[i] , 0) 
	 			MoveToFlagEnabled( FF[i] , false )
				SetPlot( FF[i]  , "dead","LuaYU_cbend_3",0 )   
				sleep(10)
				BeginPlot( FF[i] , "LuaYU_cbend_run_0" , 0 )
			end
 			for i=0, 7 do
			WriteRoleValue(M[i],EM_RoleValue_Register1,i)
			BeginPlot( M[i] , "cbend_move" , 0 )  
			end
			for i=8, 14 do
			WriteRoleValue(M[i],EM_RoleValue_Register1,i)
			BeginPlot( M[i] , "cbend_move1" , 0 )  
			end
			for i=15, 21 do
			WriteRoleValue(M[i],EM_RoleValue_Register1,i)
			BeginPlot( M[i] , "cbend_move2" , 0 )  
			end
 			sleep(100)
			for i=15, 21 do
			SetAttack( M[i] , FF[rand(2)+9]  )
			end
			sleep(50)
			for i=8, 14 do
			SetAttack( M[i] , FF[rand(2)+7]  )
			end
			for i=0, 7 do
			SetAttack( M[i] , FF[rand(2)+11]  )
			end
			sleep(200)
			M[22] = CreateObj ( 112060 , BaseX , BaseY , BaseZ , BaseDir , 1)     -- 特效   照座標     
			SetModeEx( M[22]    , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( M[22]    , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( M[22]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( M[22]    , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( M[22]    , EM_SetModeType_Gravity, false )--重力
			SetModeEx( M[22]    , EM_SetModeType_Move, false )--移動
			SetModeEx( M[22]   , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( M[22]    , EM_SetModeType_Searchenemy, false )--索敵
			SetPlot( M[22],"touch","LuaYU_cbendrenew",50 )
			AddToPartition( M[22] , 0) 
			WriteRoleValue( M[22] , EM_RoleValue_PID , OwnerID() )   
			sleep(30)	
			M[23] = CreateObjByFlag( Monster5, 780234, 28 , 1 );            
			AddToPartition( M[23] , 0) 
			M[24] = CreateObjByFlag( Monster6, 780234, 29 , 1 );            
			AddToPartition( M[24] , 0) 
			M[25] = CreateObjByFlag( Monster6, 780234, 30 , 1 );            
			AddToPartition( M[25] , 0) 
			sleep(20)
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .. SayString2  .. "|r" , 0 ) 
			break
		end
	end

	while true do
		sleep(10)
		local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		if LD == 8 then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )   
			for i=0, table.getn(F) do
				if CheckID(F[i]) == true then
					Delobj(F[i])
				end
			end
			for i=0, 5 do
				if CheckID(FF[i]) == true then
					Delobj(FF[i])
				end
			end
			for i=7, 12 do
				if CheckID(FF[i]) == true then
					Delobj(FF[i])
				end
			end
			for i=0, table.getn(M) do
				if CheckID(M[i]) == true then
					Delobj(M[i])
				end
			end	
			sleep(30)
			break
		end
			
	end
		local HIDEX = LuaFunc_CreateObjByObj ( 111810 , OwnerID()  )         
		SetModeEx( HIDEX   , EM_SetModeType_Show , false ) --不顯示
		SetModeEx( HIDEX   , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( HIDEX   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( HIDEX   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( HIDEX   , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( HIDEX   , EM_SetModeType_Mark, false )--標記
		SetModeEx( HIDEX   , EM_SetModeType_Move, false )--移動
		SetModeEx( HIDEX   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( HIDEX   , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( HIDEX   , EM_SetModeType_HideName, false )--名稱
		sleep(10)
		Hide(HIDEX)
		Show(HIDEX , 0)
		BeginPlot( HIDEX , "LuaYU_cbend_0" , 0 )  
		AddToPartition( HIDEX  , 0) 
		sleep(10)	
		Delobj(OwnerID() )
end

function LuaYU_cbend_1() 
	SetCursorType( OwnerID() , 1)
	SetPlot( OwnerID(),"touch","LuaYU_cbend_2",50 )
end

function LuaYU_cbend_2()
	local KEY =  CountBodyItem( OwnerID() , 203479 )  --特殊劇情觸發鑰匙
	local KeyMan = ReadRoleValue( TargetID() , EM_RoleValue_PID  )  
	local KEYON = ReadRoleValue( KeyMan , EM_RoleValue_PID  )  
	local Obj = Role:new( OwnerID() )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if KEY >= 1 and KEYON == 0 then	
		WriteRoleValue( KeyMan , EM_RoleValue_PID , 5 )   
		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .. "[SC_YU_CBEND_1]"  .. "|r" , 0 ) --永夜末日即將開始
	elseif KEY >= 1 and KEYON == 5 then
		WriteRoleValue( KeyMan , EM_RoleValue_PID , 5 )   
		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .. "[SC_YU_CBEND_1]"  .. "|r" , 0 ) --永夜末日即將開始
	elseif KEY >= 1 and KEYON == 1 then	
		Say( TargetID() , GetString("SC_YU_101340_00") )  	--我們正在執行勤務。
	else
		if ZoneID == 1 or ZoneID == 2 then
			Say( TargetID() , GetString("SAY_VANGUARDSPEAK_COM") )  	--維護凡瑞娜絲城內以及週遭地區的安全，就是我們警備隊的職責。
		elseif ZoneID == 4 then
			Say( TargetID() , GetString("SC_YU_CBEND_4") )  	--維護銀瀑村內以及週遭地區的安全，是我們守衛的職責。
		elseif ZoneID == 5 then
			Say( TargetID() , GetString("SC_YU_CBEND_6") )  	--維護哈洛夫交易站內以及週遭地區的安全，是我們警備隊的職責。
		end

	end
end

function LuaYU_cbend_3() 
	BeginPlot( OwnerID()  , "LuaYU_cbend_4" , 0 )  
	return false
end

function LuaYU_cbend_4() 
	SetStopAttack( OwnerID() )  --停止攻擊
	SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OwnerID()   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( OwnerID()   , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--標記
	SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
	SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OwnerID()   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( OwnerID()   , EM_SetModeType_HideName, false )--名稱

	Hide(OwnerID())
	Show(OwnerID() , 0)
	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
end

function LuaYU_cbend_run_0() 
	local NUM = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	SetStopAttack( OwnerID() )  
--	SetFightMode( OwnerID() , 0, 1, 0, 0 )
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780234 , NUM-7 , 0 )
--	SetFightMode( OwnerID() , 1, 1, 0, 1 )
	Hide(OwnerID())
	Show(OwnerID() , 0)
end

--怪物移動
function cbend_move() 
	local NUM = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	SetStopAttack( OwnerID() )  
--	SetFightMode( OwnerID() , 0, 1, 0, 0 )
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780234 , 20+ NUM , 0 )
	sleep(10)
--	SetFightMode( OwnerID() , 1, 1, 0, 1 )
	Hide(OwnerID())
	Show(OwnerID() , 0)
end

function cbend_move1() 
	local NUM = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	SetStopAttack( OwnerID() )  
--	SetFightMode( OwnerID() , 0, 1, 0, 0 )
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag(OwnerID() , 780234 , 5+NUM , 0 )
	sleep(10)
--	SetFightMode( OwnerID() , 1, 1, 0, 1 )
	Hide(OwnerID())
	Show(OwnerID() , 0)
end

function cbend_move2() 
	local NUM = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	SetStopAttack( OwnerID() )  
--	SetFightMode( OwnerID() , 0, 1, 0, 0 )
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag(OwnerID() , 780234 , NUM-9 , 0 )
	sleep(10)
--	SetFightMode( OwnerID() , 1, 1, 0, 1 )
	Hide(OwnerID())
	Show(OwnerID() , 0)
end




--重起機制
function LuaYU_cbendrenew()
	local KEY =  CountBodyItem( OwnerID() , 203479 )  --特殊劇情觸發鑰匙
	local KeyMan = ReadRoleValue( TargetID() , EM_RoleValue_PID  )  
	local KEYON = ReadRoleValue( KeyMan , EM_RoleValue_PID  )  
	if KEY >= 1 and KEYON == 1 then	

		WriteRoleValue( KeyMan , EM_RoleValue_PID , 8 )   
		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .. "[SC_YU_CBEND_5]"  .. "|r" , 0 ) --末日聖戰活動重置
	end
end