function LuaI_101022_0()

	sleep(20)

	local HideMonster1 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100693, 200 , 1)       --範圍劇情：隱藏紅色寶箱
	local HideMonster2 = LuaFunc_SearchNPCbyOrgID(HideMonster1[0] , 100694, 200 , 1)       --範圍劇情：隱藏紫色寶箱

	M1 = CreateObjByFlag( 101030, 780097, 5 , 1 );            --怪
	M2 = CreateObjByFlag( 101030, 780097, 6 , 1 );            --怪


	SetModeEx( M1  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( M1  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( M1  , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( M1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( M1  , EM_SetModeType_Move, false )--移動
	SetModeEx( M1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( M1  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( M1  , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( M1  , EM_SetModeType_Fight , false )--可砍殺攻擊

	Hide(M1)
	Show(  M1 , 0)
	AddToPartition( M1 , 0) 

	SetModeEx( M2  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( M2  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( M2  , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( M2  , EM_SetModeType_Mark, false )--標記
	SetModeEx( M2  , EM_SetModeType_Move, false )--移動
	SetModeEx( M2  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( M2  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( M2  , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( M2  , EM_SetModeType_Fight , false )--可砍殺攻擊

	Hide(M2)
	Show(  M2 , 0)
	AddToPartition( M2 , 0) 


	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+5 , M1)
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+6 , M2)
	BeginPlot( HideMonster2[0] , "LuaI_101024_1" , 0 )    
                SetPlot( OwnerID(),"range", "LuaI_101022_1" , 100 )                                      --設定劇情
                
end

function LuaI_101022_1()

	local QQ = CheckAcceptQuest( OwnerID(), 421458 );                                        --判斷該角色有沒有接任務

	if QQ == true and CheckFlag( OwnerID()  , 542179 ) == false  then            --判斷今天有沒有走過此路經有沒有接任務		

		SetPlot( TargetID(),"range","",0 )                                                                     --給一個空個function，取消再次觸發範圍劇情的可能。     
		BeginPlot( TargetID() , "LuaI_101022_2" , 0 )                                                   --命令指定角色呼叫 Script

	end
end

function LuaI_101022_2()     	   --TargetID() 玩家
	

--	local QQ = CheckAcceptQuest( TargetID(), 421458 );                                        --判斷該角色有沒有接任務

--	if QQ == true and CheckFlag( TargetID()  , 541589 ) == false  then    --判斷今天有沒有走過此路經有沒有接任務		
--		SetFlag( TargetID()  , 542179, 1 )	--沒走過給旗標	
	
		local HideMonster1 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100693, 200 , 1)       --範圍劇情：隱藏紅色寶箱
		local HideMonster2 = LuaFunc_SearchNPCbyOrgID(HideMonster1[0] , 100694, 200 , 1)       --範圍劇情：隱藏紫色寶箱
		local Samog = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101022, 200 , 1)       --薩摩格
		local Solay = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101027, 200 , 1)       --薩摩格的手下		
		local EYE01 = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101025, 200 , 1)             --賢者
		local EYE02 = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101026, 200 , 1)             --賢者
		local Minotaur = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101024, 200 , 1)             --戰牛祭司
		local Golu= LuaFunc_SearchNPCbyOrgID( HideMonster2[0] , 101028, 200 , 1)             --隱藏施法目標


		WriteRoleValue( HideMonster1[0] , EM_RoleValue_PID , OwnerID())

--		WriteRoleValue( HideMonster2[0] ,EM_RoleValue_PID , 0 )

	sleep(10)
 		BeginPlot( Golu[0] , "LuaI_101024_2" , 0 )                                                   --指定紫色寶箱顯現祭司

		if Samog[0] == -1 or  Samog[0] == nil  then                                         --如果薩摩格不存在就產生
			Samog = CreateObjByFlag( 101022, 780097, 0 , 1 );            
 			SetFightMode(  Samog , 0, 0, 0, 0 )
			AddToPartition( Samog  , 0) 

			if CheckBuff( Samog , 500900 ) == false then                                                                       --檢查目前是否有此buff
				CastSpell( Golu[0] , Golu[0], 490101)                                                              
			end

		end

		if Solay[0] == -1 or  Solay[0] == nil  then

			Solay1 = CreateObjByFlag( 101027, 780097, 1 , 1 );            --產生手下1 
 			SetFightMode(  Solay1 , 0, 0, 0, 0 )			
			AddToPartition( Solay1 , 0) 
			SetPlot( Solay1 , "dead","LuaI_101022_3",0 )
		end

		if Solay[1] == -1 or  Solay[1] == nil  then
			Solay2 = CreateObjByFlag( 101027, 780097, 2 , 1 );            --產生手下2
 			SetFightMode(  Solay2 , 0, 0, 0, 0 )
			AddToPartition( Solay2 , 0) 
			SetPlot( Solay2 , "dead","LuaI_101022_3",0 )
		end

		if EYE01[0] == -1 or  EYE01[0] == nil  then
			EYE01 = CreateObjByFlag( 101025, 780097, 3 , 1 );            --產生賢者
 			SetFightMode(  EYE01, 0, 0, 0, 0 )
			AddToPartition( EYE01 , 0) 

		end

		if EYE02[0] == -1 or  EYE02[0] == nil  then
			EYE02 = CreateObjByFlag( 101026, 780097, 4 , 1 );            --產生賢者
 			SetFightMode(  EYE02 , 0, 0, 0, 0 )
			AddToPartition( EYE02 , 0) 


		end



		WriteRoleValue(  HideMonster1[0] , EM_RoleValue_Register+5 , ReadRoleValue( OwnerID(),  EM_RoleValue_Register+5  ))
		WriteRoleValue(  HideMonster1[0] , EM_RoleValue_Register+6 , ReadRoleValue( OwnerID(),  EM_RoleValue_Register+6  ))
	
		sleep(30)

		BeginPlot( HideMonster1[0] , "LuaI_101022_2_2" , 0 )      

--	end

end

function LuaI_101022_3()  
			BeginPlot( OwnerID() , "LuaI_101022_4" , 0 )        
end

function LuaI_101022_4()  
			BeginPlot( OwnerID() , "LuaP_Dead" , 0 )        
			sleep(30)
			Delobj( OwnerID() )
end