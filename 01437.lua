function LuaYu_Mala2_firesite_01() -- 火把燃燒了
	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"touch",  "LuaYu_Mala2_firesite_01_2" , 20 )   --
end

function LuaYu_Mala2_firesite_01_2() 
	BeginPlot( TargetID() , "LuaYu_Mala2_firesite_02" , 0 )  
end

function LuaYu_Mala2_firesite_02()   
	local O_ID = OwnerID() --物件
	local T_ID = TargetID()  --玩家

--	say(O_ID, "OID 1")
--	say(T_ID, "TID 1")
	local Torch =  CountBodyItem( T_ID , 203025 )    --可燃的火把
	local FireTorch =  CountBodyItem( T_ID , 203026 )    --燃燒的火把

	if Torch == 0 and FireTorch == 0 then
		ScriptMessage(T_ID, T_ID , 1 , "[SC_113120_MALA2_46]" , C_SYSTEM )  --熾紅的火焰正熊熊的燃燒著。
	elseif FireTorch >= 1 then
		ScriptMessage(T_ID, T_ID , 1 , "[SC_113120_MALA2_47]" , C_SYSTEM )  --你手上所持的火把將是所有可燃物的終結者。
	else
		-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
		if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
			if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaYu_Mala2_firesite_03" ) ~= 1 then
				ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
				return
			else 
			--	say(T_ID, "test")
				AttachCastMotionTool( T_ID, 211968 ); --置換武器為可燃的火把
			end
		end
	end
end

function LuaYu_Mala2_firesite_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 物件

--	say(O_ID, "OID 2")
--	say(T_ID, "TID 2")
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	
				 AttachCastMotionTool( O_ID, 211969 ); --置換武器為可燃的火把
				GiveBodyItem( O_ID , 203026  , 1 )  
				DelBodyItem( O_ID , 203025 , 1 )
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_firesite_test1()
	local O_ID = OwnerID() -- 玩家
	AttachCastMotionTool( O_ID , 212076 ) -- 將武器置換成空手
	GiveBodyItem( O_ID , 203025  , 1 )  
end

--************************************************************************************--伐木

function LuaYu_Mala2_treecut_01() -- 伐木
	SetCursorType( OwnerID() , eCursor_Fell ); --游標變成 伐木
	SetPlot( OwnerID() ,"touch",  "LuaYu_Mala2_treecut_01_1" , 50 )   --
end

function LuaYu_Mala2_treecut_01_1() 
	BeginPlot( TargetID() , "LuaYu_Mala2_treecut_02" , 0 )  
end

function LuaYu_Mala2_treecut_02()
	local O_ID = OwnerID() --物件
	local T_ID = TargetID()  --玩家

--	say(O_ID, "OID tree")
--	say(T_ID, "TID tree")
	local Torch =  CountBodyItem( T_ID , 203025 )    --可燃的火把
	local FireTorch =  CountBodyItem( T_ID , 203026 )    --燃燒的火把

	if CheckBuff( T_ID , 502864 ) == false then  -- 行動禁制BUFF
		if Torch >= 1 then  -- 有 可燃的火把
			-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
			if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
				if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 15, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_treecut_03_1" ) ~= 1 then
					ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
					return
				else
					AttachCastMotionTool( T_ID, 210509 ); --置換武器為斧頭
				end
			end
		elseif FireTorch >= 1 then   -- 有燃燒的火把
			ScriptMessage(T_ID, T_ID , 1 , "[SC_113120_MALA2_49]" , C_SYSTEM )  --你將火把揮向枝幹，嘗試點燃他。

			-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
			if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
				if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_treecut_03_2" ) ~= 1 then
					ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
					return
				else
					AttachCastMotionTool( T_ID, 211969 ); --置換武器為火把
				end
			end
		else
			-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
			if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
				if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_treecut_03_3" ) ~= 1 then
					ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
					return
				else
				AttachCastMotionTool( T_ID, 210509 ); --置換武器為斧頭
				end
			end
		end
	end
end

function LuaYu_Mala2_treecut_03_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 物件

--	say(O_ID, "OID 2")
--	say(T_ID, "TID 2")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			ScriptMessage(O_ID, O_ID , 1 , "[SC_113120_MALA2_48]" , C_SYSTEM )  --太堅硬了！似乎無法劈落任何枝幹。
		
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_treecut_03_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 物件

--	say(O_ID, "OID 3")
--	say(T_ID, "TID 3")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			
			DelBodyItem( O_ID , 203026  , 1 )   
			SetPlot( T_ID ,"touch",  "" , 30 )
			BeginPlot( T_ID , "LuaYu_Mala2_treecut_03" , 0 )    --開始燒柴
			ScriptMessage(O_ID, O_ID , 1 , "[SC_113120_MALA2_50]" , C_SYSTEM )  --烈火熊熊地燃燒了起來。
		
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_treecut_03_3( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 物件

--	say(O_ID, "OID 4")
--	say(T_ID, "TID 4")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			AttachCastMotionTool( O_ID, 211968 ); --置換武器為可燃的火把
			GiveBodyItem( O_ID , 203025  , 1 )  
			ScriptMessage(O_ID, O_ID , 1 , "[SC_113120_MALA2_51]" , C_SYSTEM )  --雖然藤蔓太過堅固劈砍無效，但也獲得了一些[203025]。可燃的藤蔓枝幹
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_treecut_03()
	local O_ID = OwnerID() -- 物件 藤蔓
	local T_ID = TargetID()  -- 玩家
--	say(O_ID, "OID 5")
--	say(T_ID, "TID 5")

	local RoomID = ReadRoleValue( T_ID ,EM_RoleValue_RoomID) 

	--------------------------------------------------------------------------------------
	-- 2011.08.15  殺死-NPC  燒毀巨型藤蔓	106276
	local npcid = 106276
	DW_QietKillOne( T_ID, npcid )
	--	say(OwnerID(), "kill id = "..npcid )
	--------------------------------------------------------------------------------------

	AddBuff( O_ID ,503990 ,1 , 3 ); --燃燒
	PlaySound( O_ID , "sound\\fx\\skill\\fire\\act_flame01_c_hand.wav", false )
	sleep(30)
	CancelBuff( O_ID ,503047 )
	SetModeEx( O_ID , EM_SetModeType_Obstruct, false )--阻擋
	BeginPlot( O_ID , "LuaP_Dead" , 0 )   
	PlaySound( O_ID , "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	sleep(15)
	Delobj( O_ID )
end


--************************************************************************************--KEY

function LuaYu_Mala2_keyget_01() -- KEY
	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"touch",  "LuaYu_Mala2_keyget_01_1" , 50 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_KEYfloor_dead",0 )   
end

function LuaYu_Mala2_keyget_01_1()
	BeginPlot( TargetID() , "LuaYu_Mala2_keyget_02" , 0 )  
end


function LuaYu_Mala2_keyget_02()
	local O_ID = OwnerID() --物件
	local T_ID = TargetID()  --玩家

--	say(O_ID, "OID key 1")
--	say(T_ID, "TID key 1")
	-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_keyget_03" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
			return
		else
			AttachCastMotionTool( T_ID, 211865 ); --置換武器為鋤頭
		end
	end
end

function LuaYu_Mala2_keyget_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- OBJ

--	say(O_ID, "OID key 2")
--	say(T_ID, "TID key 2")
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			--------------------------------------------------------------------------------------
			-- 2011.08.15  殺死-NPC 獲得寶藏之鑰	106278
			local npcid = 106278
			DW_QietKillOne(O_ID, npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local GetKeys = ReadRoleValue( O_ID ,EM_RoleValue_PID) --本次玩家獲得KEY數			
			ScriptMessage(O_ID, -1 , 1 , "[SC_113120_MALA2_52]" , C_SYSTEM )  --你獲得了一把神秘的KEY。
			ScriptMessage(O_ID, -1 , 0 , "[SC_113120_MALA2_52]" , C_SYSTEM ) 
			GiveBodyItem( O_ID , 203027  , 1 )  
			WriteRoleValue( O_ID  , EM_RoleValue_PID , GetKeys+1 )   --增加KEY數

			BeginPlot( T_ID , "LuaYu_Mala2_keyget_04" , 0 )  
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_keyget_04()
	local O_ID = OwnerID()  -- key

--	say(O_ID, "KEY dead 1")
	SetPlot( O_ID ,"touch",  "" , 40 )  
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

	SetModeEx( O_ID , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( O_ID  , EM_SetModeType_Mark, false )--標記
	SetModeEx( O_ID , EM_SetModeType_Fight , false )--可砍殺攻擊
	BeginPlot( O_ID , "LuaP_Dead" , 0 )   
	sleep(15)
--	local Key = LuaFunc_CreateObjByObj ( 112959 , OwnerID() )

--	SetModeEx( Key  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
--	SetModeEx( Key , EM_SetModeType_Obstruct, false )--阻擋
--	SetModeEx( Key  , EM_SetModeType_Mark, true )--標記
--	SetModeEx( Key   , EM_SetModeType_Move, false )--移動
--	SetModeEx( Key  , EM_SetModeType_Searchenemy, false )--索敵
--	SetModeEx( Key   , EM_SetModeType_HideName, false )--名稱
--	SetModeEx( Key , EM_SetModeType_ShowRoleHead, false )--頭像框
--	SetModeEx( Key , EM_SetModeType_Fight , false )--可砍殺攻擊

--	SetPlot( Key ,"touch",  "LuaYu_KEYfloor_thekey" , 30 )
	Delobj( O_ID )
end

function LuaYu_KEYfloor_dead()

	SetPlot( OwnerID() ,"touch",  "" , 40 )  

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	local Player = SearchRangePlayer( OwnerID() , 300 )


	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OwnerID()  , EM_SetModeType_Mark, false )--標記
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊

	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   

	local Key = LuaFunc_CreateObjByObj ( 112959 , OwnerID() )  -- 奇異的光芒

	SetModeEx( Key  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Key , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Key  , EM_SetModeType_Mark, true )--標記
	SetModeEx( Key   , EM_SetModeType_Move, false )--移動
	SetModeEx( Key  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Key   , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Key , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Key , EM_SetModeType_Fight , false )--可砍殺攻擊

	SetPlot( Key ,"touch",  "LuaYu_KEYfloor_thekey" , 30 )

	Delobj( OwnerID() )


end

function LuaYu_KEYfloor_thekey()
--OwnerID() 玩家
--TargetID() NPC
	SetPlot( TargetID() ,"touch",  "" , 30 )

	local GetKeys = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --本次玩家獲得KEY數			
	ScriptMessage(OwnerID(), -1 , 1 , "[SC_113120_MALA2_52]" , C_SYSTEM )  --你獲得了一把神秘的KEY。
	ScriptMessage(OwnerID(), -1 , 0 , "[SC_113120_MALA2_52]" , C_SYSTEM ) 
	GiveBodyItem( OwnerID() , 203027  , 1 )  

	WriteRoleValue( OwnerID()  , EM_RoleValue_PID , GetKeys+1 )   --增加KEY數
	Delobj( TargetID() )
end




--***********************************************************************************  火砲

function LuaYU_Mala2_fire()--開炮
	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"touch",  "LuaYU_Mala2_fire_1" , 30 )
end

function LuaYU_Mala2_fire_1()
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()    -- 物件

	BeginPlot( TargetID() , "LuaYU_Mala2_fire2" , 0 )  
end

function LuaYU_Mala2_fire2()--開炮
	local O_ID = OwnerID() --物件
	local T_ID = TargetID()  --玩家

--	say(O_ID, "OID bomb 2")
--	say(T_ID, "TID bomb 2")

	-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then

		if CheckBuff( T_ID , 501570) == false then  --增加檢查判斷
			AddBuff(T_ID , 501570,0,-1); --然後給予BUFF
			AddBuff( T_ID , 502864 ,1 ,-1 ); --定身BUFF
		--	say(T_ID, "TID bomb 123")

			MoveToFlagEnabled( T_ID, false )
			DialogCreate( T_ID , EM_LuaDialogType_YesNo ,"[SC_113120_MALA2_53]") --是否裝置火藥轟炸目標？
			DialogSelectStr( T_ID , "[SC_GETTITLE_1]" );
			DialogSelectStr( T_ID , "[SC_CANCEL]" );
			if( DialogSendOpen( T_ID ) == false ) then 
				ScriptMessage( T_ID, T_ID, 1,"[SYS_FIXEQ_DATA_ERROR]",0)	
				--資料送出有問題
				return
			end
			for i = 0 , 1000 , 1 do
				Sleep( 1 );
				SelectID = DialogGetResult( T_ID );
				if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 1000 then
					if ( SelectID == 0 ) then--確認

						WriteRoleValue(  T_ID  , EM_RoleValue_Register+8 ,  O_ID ) --記住砲台
						Beginplot( T_ID ,"LuaYU_Mala2_fire3", 0 )	
						SetPlot( O_ID ,"touch",  "" , 0 )
						CancelBuff( T_ID, 501570 );--最後清除BUFF
						DialogClose( T_ID )
					--	say(T_ID, "TID bomb go 0 ")
						break;
					elseif ( SelectID == 1 ) then
						CancelBuff( T_ID, 501570 );--最後清除BUFF
						DialogClose( T_ID )
						CancelBuff( T_ID, 502864  ) --定身	
					--	say(T_ID, "TID bomb go 1 ")	
						break
					end
				elseif i == 1000 then
					CancelBuff( T_ID, 501570 );--最後清除BUFF
					DialogClose( T_ID )
					CancelBuff( T_ID, 502864  ) --定身
				--	say(T_ID, "TID bomb go 1000 ")		
					break

				elseif ( SelectID == -1 ) then
					CancelBuff( T_ID, 501570 );--最後清除BUFF
					DialogClose( T_ID )	
					CancelBuff( T_ID, 502864  ) --定身
				--	say(T_ID, "TID bomb go -1 ")	
					break
				end
			end
		else
			ScriptMessage( T_ID , T_ID , 0, "[SC_WINDOW_OPENED]", 0 );
		end	
	end
end

function LuaYU_Mala2_fire3()--開炮
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- OBJ

--	say(O_ID, "OID bomb 3")
--	say(T_ID, "TID bomb 3")

	ScriptMessage( O_ID  , -1  , 1 , "[SC_113120_MALA2_54]" ,0 ) -- 請選擇炮擊位置。
	ScriptMessage( O_ID  , -1  , 0 , "[SC_113120_MALA2_54]" ,0 ) 
--	local Firetool = ReadRoleValue( O_ID, EM_RoleValue_Register+8) --火砲

	-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
	if Lua_Hao_Check_SetPlot_Touch( O_ID ) == false then
		if BeginCastBarEvent( O_ID, T_ID,"[SC_113120_MALA2_85]", 10, ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE, ruFUSION_ACTORSTATE_EMOTE_SALUTE, 0, "LuaYU_Mala2_fire4" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
			return
		else
		--	SetCursorType( Firetool , eCursor_Interact ); --游標變成 齒輪
		--	SetPlot( Firetool ,"touch",  "LuaYU_Mala2_fire2_1" , 30 )
			SetCursorType( T_ID , eCursor_Interact ); --游標變成 齒輪
		--	SetPlot( T_ID ,"touch",  "LuaYU_Mala2_fire2_1" , 30 )
		--	say(T_ID, "TID bomb 3_1")
		end
	end
end

function LuaYU_Mala2_fire4(ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 物件

--	say(O_ID, "OID bomb 4")
--	say(T_ID, "TID bomb 4")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			AdjustFaceDir( O_ID , T_ID , 90 ) --面向
			AddBuff( O_ID ,503988 ,1 ,-1 ); --砲擊召喚BUFF
			Say( O_ID, " [SC_113120_MALA2_78]") --砲彈填充完畢
			SetPlot( T_ID ,"touch",  "" , 0 )
		else
			-- 失敗
		--	Say( O_ID, " false")  -- 測試用訊息
			CancelBuff( O_ID, 502864  ) --定身
			SetPlot( T_ID ,"touch",  "LuaYU_Mala2_fire_1" , 30 )
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------------------------   2013 .06整合修改到此結束  ------------------------------------------ 

function LuaYU_Mala2_fire5()--炸彈劇情  OwnerID、TargetID 泡擊目標(箭頭)

--	Say( OwnerID() ," OwnerID " ) --玩家
--	Say( TargetID() ," TargetID " ) --要轟炸的目標

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

	if CheckBuff(  OwnerID() , 503988 ) == true then

		local TARGETGLOD = CreateObj( 113115 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
		AddToPartition( TARGETGLOD , RoomID )  
		SetModeEx( TARGETGLOD  , EM_SetModeType_Gravity, false )--重力
		SetModeEx( TARGETGLOD   , EM_SetModeType_Mark, false )--標記
		SetModeEx( TARGETGLOD  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( TARGETGLOD , EM_SetModeType_ShowRoleHead, false )--頭像框

		WriteRoleValue( TARGETGLOD  , EM_RoleValue_Register ,  OwnerID()  ) --記住玩家

		BeginPlot( TARGETGLOD , "LuaYU_Mala2_fire6" , 0 )   

		CancelBuff( OwnerID() , 503988  ) --取消砲擊BUFF

	end

end

function LuaYU_Mala2_fire6()--指定砲擊目標後劇情

	local Player = ReadRoleValue( OwnerID() ,EM_RoleValue_Register ) --玩家
	local Firetool = ReadRoleValue( Player ,EM_RoleValue_Register+8) --火砲

	AdjustFaceDir( Player, OwnerID() , 0 ) --面向
	sleep(10)
	PlayMotion( Player , 109)  --指揮向前
	Say(Player , " [SC_113120_MALA2_77]")
	sleep(5)
	AdjustFaceDir( Firetool, OwnerID() , 0 ) --面向
	sleep(5)
	PlaySound( Firetool, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlayMotion( Firetool, 161)  --Buff0

	sleep(15)

	CastSpelllv( OwnerID() , OwnerID() , 493655 , 1 )

	--------------------------------------------------------------------------------------
	-- 2011.08.12  殺死-NPC  使用火砲破壞拒馬 106275
	local npcid = 106275
	DW_QietKillOne(Player, npcid )
	--	say(OwnerID(), "kill id = "..npcid )
	--------------------------------------------------------------------------------------

--	sleep(5)
	PlaySound( OwnerID(), "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlaySound( OwnerID(), "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	sleep(30)
	CancelBuff( Player , 502864  ) --定身
--	CancelBuff( Player , 503988  ) --取消砲擊BUFF
	Delobj(  Firetool )
	Delobj(  OwnerID() )

--	
end

function LuaYu_Mala2_skilllimit() -- 限制不可使用移形換影

	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )

	local Building_Code = ReadRoleValue( TargetID() ,EM_RoleValue_Register+1) --大型建築物

	if ( ZoneID == 353 ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --不可再副本使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --不可再副本使用

		return false

	elseif ( ZoneID == 402 ) or ( ZoneID == 31 ) then

		if Building_Code == 38 then --該目標為大型建築物
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --不可再副本使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --不可再副本使用

			return false
		else
			return true
		end
	else
		return true
	end

end


--*************************************************************************************************--禁錮	

function LuaYu_Mala2_ghost_01() --  產生小丑之魂
	local door = OwnerID()  -- 虛空之門
	local PlayerID = ReadRoleValue( door , EM_RoleValue_Register  )  --玩家
	local RoomID = ReadRoleValue( door ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( door , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( door , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( door , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( door , EM_RoleValue_Dir ) 

	local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV  )  
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end

	AddBuff( door ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

	local ghostid= 102369 -- LV 15 的
	local ghost = CreateObj( ghostid , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	WriteRoleValue( ghost , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
	AddToPartition( ghost , RoomID )  
	AddBuff( ghost ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetAttack( ghost , PlayerID )
 
	WriteRoleValue(  door , EM_RoleValue_PID ,  ghost ) --記住小丑之魂
	WriteRoleValue(   ghost , EM_RoleValue_PID ,  door ) --記住虛空之門

	SetPlot( ghost , "dead","LuaYu_Mala2_ghost_02",0 )  -- 小丑之魂 死亡劇情 

end

function LuaYu_Mala2_ghost_02() --小怪死亡劇情  OwnerID = 小丑魂
	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)    -- 虛空之門
	WriteRoleValue(   door , EM_RoleValue_PID ,  0 ) --虛空之門pid清空
	BeginPlot( Door , "LuaYu_Mala2_ghost_01" , 0 )     -- 門再次生小怪

end

function LuaYu_Mala2_ghost_03() --記住虛空之門 死亡劇情   OwnerID = 虛空之門

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Ghost = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --小丑之魂

	Delobj( Ghost )

	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋
	Delobj( OwnerID() )

end

--*************************************************************************************************--傳送門

function LuaYu_Mala2_Door_01() -- OwnerID傳送門

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  

--	Say(OwnerID() ,  "PlayerLV=".. PlayerLV)
--	Say(OwnerID() ,  "ghost=".. ghost)


	while true do
		sleep(10)
		local ghostNeer = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 30 , 1)
	
		if CheckID( ghostNeer[0] )== true then
			for j = 0 ,table.getn( ghostNeer)  do
				BeginPlot( ghostNeer[j] , "LuaYu_Mala2_Door_02" , 0 )  	
			end
		end
	end
end

function LuaYu_Mala2_Door_02() -- 怪物續出劇情  OwnerID=怪物

	AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
	SetFightMode( OwnerID() , 0, 0, 0, 0 )
	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
	SetModeEx( OwnerID()  , EM_SetModeType_Show , false )--顯示

	BeginPlot( OwnerID() , "LuaYu_Mala2_ghost_reset" , 0 )  

end

function LuaYu_Mala2_ghost_reset() -- 怪物續出劇情  OwnerID=怪物

	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) 
	local GhostID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID  ) 

	WriteRoleValue(  Door , EM_RoleValue_PID ,  GhostID ) 

	BeginPlot( Door , "LuaYu_Mala2_ghost_reset_2" , 0 )   

	Delobj( OwnerID() )


end

function LuaYu_Mala2_ghost_reset_2() -- 怪物續出劇情  OwnerID=Door

	sleep(150)

	local GhostID = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) 
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  --玩家

	sleep(30)
	local Newghost = LuaFunc_CreateObjByObj ( GhostID , OwnerID() )

	AddBuff( Newghost ,503993 ,1 , 1 ); --傳送特效
	sleep(20)
	SetAttack( Newghost , PlayerID )

	WriteRoleValue(  OwnerID() , EM_RoleValue_PID ,  Newghost ) 
	WriteRoleValue(   Newghost , EM_RoleValue_PID ,  OwnerID() ) 

	SetPlot( Newghost , "dead","LuaYu_Mala2_ghost_02",0 )

end

function LuaYu_Mala2_Door_03() -- 把玩家傳出去
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	--------------------------------------------------------------------------------------
	-- 2011.08.15  殺死-NPC  穿越魔石之門	106277
	local npcid = 106277
	DW_QietKillOne(OwnerID(), npcid )
	--	say(OwnerID(), "kill id = "..npcid )
	--------------------------------------------------------------------------------------

	AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
	SetPosByFlag( OwnerID() , 780309 , 10 )--傳送到 X 號旗子
end