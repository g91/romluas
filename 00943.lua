function LuaI_101023_YU_1() --沃特死亡劇情

	local Golu = ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) --紫色寶箱的id

	local StoneMaker = ReadRoleValue( OwnerID() , EM_RoleValue_Register )                      --讀取石像的編號
	local PurpleID  = ReadRoleValue( Golu , EM_RoleValue_Register+1 ) --藍色寶箱的id
	local RedID  = ReadRoleValue( Golu , EM_RoleValue_Register+2 )  --紅色寶箱的id


	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 



	local COW = ReadRoleValue( OwnerID(), EM_RoleValue_PID )                         --讀里昂id

		if ReadRoleValue( COW , EM_RoleValue_IsDead ) == 1 or CheckID( COW ) == false or ReadRoleValue( COW , EM_RoleValue_IsPlayer ) == 1 then

			local ID = CreateObj ( 112306 , X , Y , Z , 0 , 1)

			SetModeEx( ID  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( ID  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( ID  , EM_SetModeType_Obstruct, true )--阻擋
			SetModeEx( ID  , EM_SetModeType_Mark, true )--標記
			SetModeEx( ID  , EM_SetModeType_Move, false )--移動
			SetModeEx( ID  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( ID  , EM_SetModeType_HideName, false )--名稱
			SetModeEx( ID  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( ID  , EM_SetModeType_Fight , false )--可砍殺攻擊

			Hide(ID)
			Show(  ID , 0)
			AddToPartition( ID , 0) 

			SetFightMode (  ID , 0, 0, 0, 0 )	
			WriteRoleValue( ID,EM_RoleValue_Register , StoneMaker )
			WriteRoleValue( ID,EM_RoleValue_Register+1 , PurpleID  )
			WriteRoleValue( ID,EM_RoleValue_Register+2 , RedID  )
			BeginPlot( ID, "LuaI_112306_YU_0" , 0 )   

		end 
end    

function LuaI_101222_YU_1() --里昂死亡劇情
	local Coolbo = ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) --紫色寶箱的id

	local StoneMaker = ReadRoleValue( OwnerID() , EM_RoleValue_Register )                      --讀取石像的編號
	local PurpleID  = ReadRoleValue( Coolbo , EM_RoleValue_Register+1 ) --紫色寶箱的id
	local RedID  = ReadRoleValue( Coolbo , EM_RoleValue_Register+2 )  --紅色寶箱的id


	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 

	local COW = ReadRoleValue( OwnerID(), EM_RoleValue_PID )                          --讀沃特id

		if ReadRoleValue( COW , EM_RoleValue_IsDead ) == 1 or CheckID( COW ) == false or ReadRoleValue( COW , EM_RoleValue_IsPlayer ) == 1 then

			local ID = CreateObj ( 112306 , X , Y , Z , 0 , 1)

			SetModeEx( ID  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( ID  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( ID  , EM_SetModeType_Obstruct, true )--阻擋
			SetModeEx( ID  , EM_SetModeType_Mark, true )--標記
			SetModeEx( ID  , EM_SetModeType_Move, false )--移動
			SetModeEx( ID  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( ID  , EM_SetModeType_HideName, false )--名稱
			SetModeEx( ID  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( ID  , EM_SetModeType_Fight , false )--可砍殺攻擊

			Hide(ID)
			Show(  ID , 0)
			AddToPartition( ID , 0) 

			SetFightMode (  ID , 0, 0, 0, 0 )
			WriteRoleValue( ID,EM_RoleValue_Register , StoneMaker )
			WriteRoleValue( ID,EM_RoleValue_Register+1 , PurpleID  )
			WriteRoleValue( ID,EM_RoleValue_Register+2 , RedID  )
			BeginPlot( ID, "LuaI_112306_YU_0" , 0 )   

		end 
end    





function LuaI_112306_YU_0()
	local StoneMaker = ReadRoleValue( OwnerID(), EM_RoleValue_Register )                      --讀取石像的編號
	local PurpleID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) --紫色寶箱的id
	local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 )  --紅色寶箱的id

	SAY( OwnerID() , GetString("SC_101222_YU_06") )  		
	ScriptMessage( OwnerID() , 0 , 1 , GetString("SC_101222_YU_06") , C_Default )

	SetPlot( OwnerID(),"touch","LuaI_112306_YU_1",40 )

	local StoneMaker = ReadRoleValue( OwnerID(), EM_RoleValue_Register )                      --讀取石像的編號
	local EYE01= ReadRoleValue( StoneMaker , EM_RoleValue_Register+1 )     
	local EYE02= ReadRoleValue( StoneMaker , EM_RoleValue_Register+2 )   
	local EYE03= ReadRoleValue( StoneMaker , EM_RoleValue_Register+3 )   
	local EYE04= ReadRoleValue( StoneMaker , EM_RoleValue_Register+4 )   
	local EYE05= ReadRoleValue( StoneMaker , EM_RoleValue_Register+5 )                    

	if ReadRoleValue( EYE01, EM_RoleValue_IsDead ) ~= 1 or CheckID( EYE01) ~= false or ReadRoleValue( EYE01, EM_RoleValue_IsPlayer ) ~= 1 then
		sleep(40)
		SAY( EYE01 , GetString("SC_101222_YU_11") )

		if  CheckID( EYE01) ~= false then
			CastSpell( EYE01, EYE01, 491922)
		end
		if  CheckID( EYE02) ~= false then
			CastSpell( EYE02, EYE02, 491922)
		end
		if  CheckID( EYE03) ~= false then
			CastSpell( EYE03, EYE03, 491922)
		end
		if  CheckID( EYE04) ~= false then
			CastSpell( EYE04, EYE04, 491922)
		end
		if  CheckID( EYE05) ~= false then
			CastSpell( EYE05, EYE05, 491922)
		end
			sleep(40)	
			Delobj( EYE01 )	
			Delobj( EYE02 )
			Delobj( EYE03 )
			Delobj( EYE04 )
			Delobj( EYE05 )

	elseif  ReadRoleValue( EYE02, EM_RoleValue_IsDead ) ~= 1 or CheckID( EYE02) ~= false or ReadRoleValue( EYE02, EM_RoleValue_IsPlayer ) ~= 1 then
		sleep(40)

		SAY( EYE02 , GetString("SC_101222_YU_11") )

		if  CheckID( EYE01) ~= false then
			CastSpell( EYE01, EYE01, 491922)
		end
		if  CheckID( EYE02) ~= false then
			CastSpell( EYE02, EYE02, 491922)
		end
		if  CheckID( EYE03) ~= false then
			CastSpell( EYE03, EYE03, 491922)
		end
		if  CheckID( EYE04) ~= false then
			CastSpell( EYE04, EYE04, 491922)
		end
		if  CheckID( EYE05) ~= false then
			CastSpell( EYE05, EYE05, 491922)
		end
			sleep(40)	
			Delobj( EYE01 )	
			Delobj( EYE02 )
			Delobj( EYE03 )
			Delobj( EYE04 )
			Delobj( EYE05 )

	elseif  ReadRoleValue( EYE03, EM_RoleValue_IsDead ) ~= 1 or CheckID( EYE03) ~= false or ReadRoleValue( EYE03, EM_RoleValue_IsPlayer ) ~= 1 then
		sleep(40)

		SAY( EYE03 , GetString("SC_101222_YU_11") )

		if  CheckID( EYE01) ~= false then
			CastSpell( EYE01, EYE01, 491922)
		end
		if  CheckID( EYE02) ~= false then
			CastSpell( EYE02, EYE02, 491922)
		end
		if  CheckID( EYE03) ~= false then
			CastSpell( EYE03, EYE03, 491922)
		end
		if  CheckID( EYE04) ~= false then
			CastSpell( EYE04, EYE04, 491922)
		end
		if  CheckID( EYE05) ~= false then
			CastSpell( EYE05, EYE05, 491922)
		end
			sleep(40)	
			Delobj( EYE01 )	
			Delobj( EYE02 )
			Delobj( EYE03 )
			Delobj( EYE04 )
			Delobj( EYE05 )

	elseif  ReadRoleValue( EYE04, EM_RoleValue_IsDead ) ~= 1 or CheckID( EYE04) ~= false or ReadRoleValue( EYE04, EM_RoleValue_IsPlayer ) ~= 1 then
		sleep(40)

		SAY( EYE04 , GetString("SC_101222_YU_11") )

		if  CheckID( EYE01) ~= false then
			CastSpell( EYE01, EYE01, 491922)
		end
		if  CheckID( EYE02) ~= false then
			CastSpell( EYE02, EYE02, 491922)
		end
		if  CheckID( EYE03) ~= false then
			CastSpell( EYE03, EYE03, 491922)
		end
		if  CheckID( EYE04) ~= false then
			CastSpell( EYE04, EYE04, 491922)
		end
		if  CheckID( EYE05) ~= false then
			CastSpell( EYE05, EYE05, 491922)
		end
			sleep(40)	
			Delobj( EYE01 )	
			Delobj( EYE02 )
			Delobj( EYE03 )
			Delobj( EYE04 )
			Delobj( EYE05 )

	elseif  ReadRoleValue( EYE05, EM_RoleValue_IsDead ) ~= 1 or CheckID( EYE05) ~= false or ReadRoleValue( EYE05, EM_RoleValue_IsPlayer ) ~= 1 then
		sleep(40)

		SAY( EYE05 , GetString("SC_101222_YU_11") )

		if  CheckID( EYE01) ~= false then
			CastSpell( EYE01, EYE01, 491922)
		end
		if  CheckID( EYE02) ~= false then
			CastSpell( EYE02, EYE02, 491922)
		end
		if  CheckID( EYE03) ~= false then
			CastSpell( EYE03, EYE03, 491922)
		end
		if  CheckID( EYE04) ~= false then
			CastSpell( EYE04, EYE04, 491922)
		end
		if  CheckID( EYE05) ~= false then
			CastSpell( EYE05, EYE05, 491922)
		end
			sleep(40)	
			Delobj( EYE01 )	
			Delobj( EYE02 )
			Delobj( EYE03 )
			Delobj( EYE04 )
			Delobj( EYE05 )
	end

	sleep(1200)

--			BeginPlot( StoneMaker , "LuaI_100_YU_1" , 0 )   
			BeginPlot( PurpleID  , "LuaI_112306_YU_reset" , 0 )   
--			BeginPlot( RedID  , "LuaI_101022_2_0" , 0 )   
			BeginPlot( OwnerID()  , "LuaI_112306_YU_2" , 0 )   

end

function LuaI_112306_YU_1()

--Say(OwnerID(), "OwnerID()")--玩家
--Say(TargetID(), "TargetID()")--禁錮石

	local O_EPC = EmptyPacketCount( OwnerID() )
	local T_EPC = EmptyPacketCount( TargetID() )

--Say(OwnerID(), "O_EPC="..O_EPC) == 0
--Say(TargetID(), "T_EPC="..T_EPC) == 0

	local QQ = CheckAcceptQuest( OwnerID(), 421458 );                                        --判斷該角色有沒有接任務
	local RSstone =  CountBodyItem( OwnerID() , 203039 )    --被禁錮的薩摩格靈神

	if (QQ == true) and (RSstone == 0) and (CheckFlag( OwnerID()  , 542179) == false) then


		if (EmptyPacketCount( OwnerID() ) >= 2)  and (QueuePacketCount( OwnerID() ) == 0) then

			GiveBodyItem( OwnerID() , 203039  , 1 )  --被禁錮的薩摩格靈神
			GiveBodyItem( OwnerID() , 203034  , 2 )  --神祕的符文碎片
			SetFlag( OwnerID()  , 542179, 1 )	--沒走過給旗標
	--		SetFlag( OwnerID()  , 541589, 1 )         --今日無法再次觸發劇情


		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。

		end
	else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_422804_14]" , 0 ) --你已完成任務條件。

	end

end

function LuaI_112306_YU_reset()

	sleep(36000) --任務重置時間

--	ScriptMessage(OwnerID() , -1 , 0 , "Cow reset" , C_SYSTEM )
	BeginPlot( OwnerID()  , "LuaI_101022_0" , 0 )   

end

function LuaI_112306_YU_2()
	sleep(10)
	Delobj( OwnerID() )
end