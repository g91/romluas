function LuaYU_MalaTina_Goodman( Option )      -- 瑪拉蒂娜遊戲重置券

	local PlayerID = OwnerID()
	local PackageID = 205814		-- 瑪拉蒂娜重置券
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false

		elseif ( ZoneID > 100 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可再副本使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可再副本使用

			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--瑪拉1
		SetFlag( OwnerID()  , 543270 , 0 ) -- 重置機制觸發
		SetFlag( OwnerID()  , 542245 , 0 ) -- 重要物品
		SetFlag( OwnerID()  , 542246 , 0 ) -- 重要物品挑戰決定

		--瑪拉2
		SetFlag( OwnerID()  , 542991 , 0 ) -- 重要物品
		SetFlag( OwnerID()  , 542992 , 0 ) -- 重置與否
		SetFlag( OwnerID()  , 543170 , 0 ) -- 通關

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_55]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_55]" , C_SYSTEM )  --重置OK


	end
end

function LuaYU_MalaTina_Goodman01( Option )      --  生存遊戲重置券

	local PlayerID = OwnerID()
	local PackageID = 205815		-- 生存遊戲重置券
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false

		elseif ( ZoneID > 100 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可再副本使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可再副本使用

			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--瑪拉1
		SetFlag( OwnerID()  , 543270 , 0 ) -- 重置機制觸發
		SetFlag( OwnerID()  , 542245 , 0 ) -- 重要物品
		SetFlag( OwnerID()  , 542246 , 0 ) -- 重要物品挑戰決定

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_75]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_75]" , C_SYSTEM )  --重置OK


	end
end


function LuaYU_MalaTina_Goodman02( Option )      -- 奪寶遊戲重置券

	local PlayerID = OwnerID()
	local PackageID = 205816		-- 瑪拉蒂娜重置券
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false

		elseif ( ZoneID > 100 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可再副本使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可再副本使用

			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		Sleep(10)

		--瑪拉2
		SetFlag( OwnerID()  , 542991 , 0 ) -- 重要物品
		SetFlag( OwnerID()  , 542992 , 0 ) -- 重置與否
		SetFlag( OwnerID()  , 543170 , 0 ) -- 通關


		Sleep(10)

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_76]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_76]" , C_SYSTEM )  --重置OK


	end
end


function LuaYU_MalaTina_SPBOOK01( Option )      -- 奪寶遊戲特殊道具_火砲置換捲軸

	local PlayerID = OwnerID()
	local PackageID = 203029		-- 將 範圍50內的  封印(巨型藤蔓) 轉換為 封印(重型火砲)
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     

	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用

			return false

		elseif tree[0] == -1 then	

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --目標不在作用範圍內。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --目標不在作用範圍內。
			return false

		elseif CheckBuff( OwnerID() , 502864 ) == true then --定身狀態(也許進行教學)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目標不在作用範圍內。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目標不在作用範圍內。
			return false


		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK



		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--		local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     


		if tree[0] ~= -1 then
			SetPlot( tree[0]  ,"touch",  "" , 0 ) 
			AddBuff( OwnerID() ,503991 ,1 , 3 ); --火焰領域特效

			local OwnerX = ReadRoleValue( tree[0] , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( tree[0] , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( tree[0] , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( tree[0] , EM_RoleValue_Dir ) 

			local NewfloorX = CreateObj( 113109 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

			SetModeEx( NewfloorX , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--移動
			SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--標記
			SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--名稱
			SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--阻擋

			Hide(NewfloorX)
			Show( NewfloorX,RoomID)		
			
			AddToPartition( NewfloorX , RoomID )  


			Delobj( tree[0]  )		
		end



	end
end

function LuaYU_MalaTina_SPBOOK02( Option )      -- 奪寶遊戲特殊道具_瞬間傳送捲軸

	local PlayerID = OwnerID()
	local PackageID = 203030		-- 將 自身傳送至奪寶遊戲入口(寶箱所在地)。
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local Canusethis = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+3) --玩家是否正在關卡內的旗標


	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用

			return false

		elseif CheckBuff( OwnerID() , 502864 ) == true then --定身狀態(也許進行教學)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目前狀態不可使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目前狀態不可使用
			return false

		elseif Canusethis ~= 1314 then --在寶箱區
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --目前狀態不可使用。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --目前狀態不可使用。
			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
		SetPosByFlag( OwnerID() , 780309 , 14 )--傳送到 X 號旗子
		WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 5566 )   --取消達成特別任務的資格。
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --玩家返回寶箱區，不可使用"瞬移捲軸"的旗標。

		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );

		SetModeEx( ffdeler  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ffdeler , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ffdeler  , EM_SetModeType_Mark, false )--標記
		SetModeEx( ffdeler   , EM_SetModeType_Move, false )--移動
		SetModeEx( ffdeler  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ffdeler   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( ffdeler , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ffdeler , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --不顯示

		AddToPartition( ffdeler , RoomID )  

		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --預先清除所有地板



	end
end

function LuaYU_MalaTina_SPBOOK03( Option )      -- 奪寶遊戲特殊道具_邪惡驅逐捲軸

	local PlayerID = OwnerID()
	local PackageID = 203031		-- 將範圍150內的所有小丑之魂永久凍結行動
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local Ghost = {}


	Ghost[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 150 , 1)     
	Ghost[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102373, 150 , 1)  
	Ghost[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102377, 150 , 1)     
	Ghost[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102381, 150 , 1)     
	Ghost[5] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102385, 150 , 1)  


	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用

			return false
		elseif  (Ghost[1][0] == -1) and (Ghost[2][0] == -1) and (Ghost[3][0] == -1) and (Ghost[4][0] == -1) and (Ghost[5][0] == -1)  then	

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --目標不在作用範圍內。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --目標不在作用範圍內。
			return false	

		elseif CheckBuff( OwnerID() , 502864 ) == true then --定身狀態(也許進行教學)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目標不在作用範圍內。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目標不在作用範圍內。
			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK
		AddBuff( OwnerID() ,503992 ,1 , 3 ); --冰封領域特效



		for i=1 , table.getn(Ghost) do	
			if Ghost[i] ~= -1 then
				for j = 0 ,table.getn(Ghost[i])  do

					local Door = ReadRoleValue( Ghost[i][j] ,EM_RoleValue_PID) 

					SetStopAttack( Ghost[i][j]  )
					AddBuff( Ghost[i][j] , 502357 ,1 , -1 ); --冰凍
					BeginPlot( Ghost[i][j] , "LuaP_Dead" , 0 )   
					sleep(20)

					Delobj( Ghost[i][j] )	

					SetStopAttack( Door )
					AddBuff( Door , 502357 ,1 , -1 ); --冰凍
					BeginPlot( Door , "LuaP_Dead" , 0 )   
					sleep(20)

					Delobj( Door )
				


				end
			end
		end


	end
end


function LuaYU_rundomgoods_01( Option )
	local PlayerID = OwnerID()
	local PackageID = 203028		--中繼配方包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720590 , 1 )	
	

	end
end

function LuaYU_rundomgoods_02( Option )
	local PlayerID = OwnerID()
	local PackageID = 203033		--隨機坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720587 , 1 )	
	

	end
end

function LuaYU_rundomgoods_03( Option )
	local PlayerID = OwnerID()
	local PackageID = 203635		--樂器素材包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720588 , 1 )	
	

	end
end

function LuaYU_rundomgoods_04( Option )
	local PlayerID = OwnerID()
	local PackageID = 205819		--巫術卷軸包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720559 , 1 )	
	

	end
end

function LuaYU_rundomgoods_05( Option )
	local PlayerID = OwnerID()
	local PackageID = 205818		--王級家具配方包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720593 , 1 )	
	

	end
end

function LuaYU_rundomgoods_06( Option )
	local PlayerID = OwnerID()
	local PackageID = 205820		--樂器包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720589 , 1 )	
	

	end
end

function LuaYU_rundomgoods_07( Option )
	local PlayerID = OwnerID()
	local PackageID = 205821		--短期駿馬使用券
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720594 , 1 )	
	

	end
end