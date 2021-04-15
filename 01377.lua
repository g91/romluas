--Hsiang_PetLootTreasure  寵物自動撿寶  script編號：700533
--event_module  玩家/NPC 死亡劇情  script編號：701584
function CultivatePet_AutoPlot( )--寵物召喚時初始判斷

--OwnerID()  寵物
--TargetID()  主人

--ReadPetValue( GItemID , PetPos , ValueType )    讀取寵物(OwnerID(主人), 第幾隻寵物,什麼屬性)
--WritePetValue( GItemID , PetPos , ValueType , Value )  寫入寵物(OwnerID(主人), 第幾隻寵物,什麼屬性,寫入值)
--AddPetValue( GItemID , PetPos , ValueType , Value )  加寫入寵物(OwnerID(主人), 第幾隻寵物,什麼屬性,寫入值)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Mode = -1
	local ModePet = -1
	local PetSayTime = 60
	local PetEvent = 10

	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵

	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+7 , 0  ) --防堵過ZONE 寵物的撿寶功能失效的問題。

	for i = 0,5 do

		Mode = ReadPetValue( TargetID(), i ,EM_CultivatePetStructValueType_EventType ) --寵物狀態(正被召喚(2)、正在旅行(4)、正在生產(8)...etc)

		if Mode == 2 then
			ModePet = i	--寫入i為正在召喚出來的寵物欄位序號
		end
	end
		
	local PetType = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Property ) --寵物屬性   -1無 0地、1水、2火、3風、4光、5暗
	local PetLv = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Lv )--讀取寵物蛋等級

PetType = 1 --因為目前只有一種寵物說話，無分屬性
	local Hunger = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Hunger )--飽食度
	local PetHelp = 0
	if (Hunger >= 80) then
		PetHelp = 100
	elseif (Hunger >= 60) and (Hunger < 80) then
		PetHelp = 80
	elseif (Hunger >= 40) and (Hunger < 60) then
		PetHelp = 60
	elseif (Hunger >= 20) and (Hunger < 40) then
		PetHelp = 40
	elseif (Hunger >= 0) and (Hunger < 20) then
		PetHelp = 20
	end
	local PetStr = "[SC_PETSYS_75][$SETVAR1="..PetHelp.."]" -- 召喚成功，輔助力X%
	ScriptMessage( TargetID() , TargetID() , 1 , PetStr , "0xff00ffff" )
	ScriptMessage( TargetID() , TargetID() , 0 , PetStr , "0xff00ffff" )

	local Master_Lv = ReadRoleValue( TargetID() , EM_RoleValue_LV )--讀取主人等級
	WriteRoleValue(  OwnerID() , EM_RoleValue_LV , Master_Lv  ) --寵物成長係數等於主人等級

	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+9 , ModePet  ) --讓寵物記住他是第幾隻
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+6 , 1010  ) --記錄此NPC為寵物(防止強P寵物，寵物死亡也出藏蛋鼠)
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+8 , TargetID()  ) --讓寵物記住他的主人
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+3 , PetSayTime  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+4 , PetEvent  ) --參數，讓寵物10分鐘擲骰一次是否發生事件，若有發生事件了，則大約一小時後才能再擲
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+1 , PetHelp  ) --記住寵物目前的輔助力( 已告訴過玩家了 )

	AddBuff( OwnerID() ,505517 ,85 ,-1 )--被NPC攻擊傷害減少
	AddBuff( OwnerID() ,505921 ,85 ,-1 )--被玩家攻擊傷害減少
	AddBuff( OwnerID() , 503480 , 0 , -1 ) -- 2012.03.08 新增所有範圍傷害無效

	local ScalePet = math.ceil(PetLv/20)--無條件進位，取整數

--	Say( TargetID() , "ScalePet="..ScalePet)
	ScalePet = 0.5+ScalePet/10

	if ScalePet >= 0.8 then
		ScalePet = 0.8
	end

--	Say( TargetID() , "ScalePet_2="..ScalePet)
	SetModelScale( OwnerID() , ScalePet ) --SetModelScale( Ownerid(),縮放比例 ) 
--	Say( OwnerID(),"What's Pet="..ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  ))

	local Loyal = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度 第二參數為第幾隻寵
--	Say( OwnerID() , "Loyal="..Loyal)

	sleep(10)

	YU_PetAI_CallAiFun( PetType , PetLv )--開始執行AI
end

function YU_PetAI_CallAiFun( PetType , PetLv )
	YU_PetAI[PetType]( PetLv );	
end

function Init_YU_PetAI_List() --寵物分類CALL "function" (寵物AI)

	YU_PetAI ={}

	YU_PetAI[0] = Fun_YU_PetAI_00		--無屬性
	YU_PetAI[1] = Fun_YU_PetAI_00		--地屬性
	YU_PetAI[2] = Fun_YU_PetAI_00		--水屬性
	YU_PetAI[3] = Fun_YU_PetAI_00		--火屬性
	YU_PetAI[4] = Fun_YU_PetAI_00		--風屬性
	YU_PetAI[5] = Fun_YU_PetAI_00		--光屬性
	YU_PetAI[6] = Fun_YU_PetAI_00		--暗屬性
end

function Fun_YU_PetAI_00( Lv )--無屬性
	local ThePet = OwnerID()	--寵物
	local Master = TargetID()	--主人
	local SleepTime = 10 
	local idelTime = 20 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local PetSayTime = 60

	local TrickKEY =  CountBodyItem( Master , 204226 ) --寵物毒藥，有此物品，當主人進入戰鬥時，寵物必參戰。

	BeginPlot( ThePet , "Fun_YU_Pet_GettingHunger_00" , 0 )    --寵物被召喚，開啟自然飽食度下降劇情 公式：200 / 忠誠度+50  (每10秒下降一次)

--	Say( OwnerID() , "Func0 LV= " .. Lv );

	SetModeEx( ThePet , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( ThePet  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( ThePet , EM_SetModeType_Searchenemy, false )--索敵

	local ModePet = ReadRoleValue( ThePet,  EM_RoleValue_Register+9  )--第幾隻寵物
	local PetType = ReadPetValue( Master, ModePet ,EM_CultivatePetStructValueType_Property ) --寵物屬性   -1無 0地、1水、2火、3風、4光、5暗，讀取者要為主人
--Say(ThePet,"PetType="..PetType)
--Say(ThePet,"ModePet="..ModePet)
	sleep(15)
	BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Start" , 0 )    --剛召喚之問候語
	sleep(15)
	while true do
	sleep(SleepTime)	
		local P_Count = ReadRoleValue( ThePet,  EM_RoleValue_Register+3  )--參數，讓寵物60秒才執行一個話題/攻擊
		local Loyal = ReadPetValue( Master, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度 第二參數為第幾隻寵，讀取者要為主人
		local Hunger = ReadPetValue( Master, ModePet ,EM_CultivatePetStructValueType_Hunger )--飽食度
		local MasterIsAttack = ReadRoleValue(Master ,EM_RoleValue_IsAttackMode  )--主人處於戰鬥模式 0 非戰鬥， 1 戰鬥中
		local PetIsAttack = ReadRoleValue(ThePet ,EM_RoleValue_IsAttackMode  )--寵物處於戰鬥模式 0 非戰鬥， 1 戰鬥中
		local AttackTarget = ReadRoleValue( Master , EM_RoleValue_AttackTargetID )
		local AutoTreasures = ReadRoleValue( ThePet ,EM_RoleValue_Register+7) --該寵物是否已開起自動撿寶功能
		if (CheckBuff( Master , 503479 ) == true) and (AutoTreasures ~= 530) then
			BeginPlot( ThePet , "Hsiang_PetLootTreasure" , 0 )    --寵物自動撿寶劇情
			WriteRoleValue(  ThePet , EM_RoleValue_Register+7 , 530  ) --記錄該寵物開啟自動撿寶功能
		elseif (CheckBuff( Master , 503479 ) == FALSE ) and (AutoTreasures == 530) then
			WriteRoleValue(  ThePet , EM_RoleValue_Register+7 , 0  ) --記錄該寵物關閉自動撿寶功能
		end
--DebugMsg( 0, RoomID ,"PetIsAttack="..PetIsAttack)
		local P = 30
		local PetSay = Rand( P )      
--DebugMsg( 0, RoomID ,"Loyal="..Loyal)
--DebugMsg( 0, RoomID ,"Hunger="..Hunger)
--DebugMsg( 0, RoomID ,"MasterIsAttack="..MasterIsAttack)
--DebugMsg( 0, RoomID ,"PetIsAttack="..PetIsAttack)
--DebugMsg( 0, RoomID ,"P_Count="..P_Count)

		if (ReadRoleValue( Master , EM_RoleValue_IsDead ) == 1 ) then	--如果玩家死翹翹，寵物也別想活...
			SetModeEx( ThePet , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( ThePet  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( ThePet , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( ThePet  , EM_SetModeType_Move, false )--移動
			SetModeEx( ThePet , EM_SetModeType_DisableRotate, true )--不轉向
			SetModeEx( ThePet , EM_SetModeType_NotShowHPMP, true )--不顯示血條
			PlayMotion( ThePet , 12)--死亡動作
			BeginPlot( ThePet , "YU_MasterPet_dead" , 0 )--移除寵物
			break
		elseif MasterIsAttack == 0 then--主人非戰鬥中
			SetModeEx( ThePet , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( ThePet  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( ThePet , EM_SetModeType_Searchenemy, false )--索敵
			if P_Count == 0 then
				if (Hunger < 40) then

					if (PetSay == 1) then --每秒 1/30 的機率說話
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Hunger" , 0 )--寵物肚子餓
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
					end

				elseif (Hunger >= 40) then
					if (PetSay == 1) then --每秒 1/30 的機率說話
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Pop" , 0 )--主人非戰鬥寵物沒事做
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
					end
				end
			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+3 , -1  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
			end
		elseif (MasterIsAttack == 1) and (PetIsAttack == 0) then--主人戰鬥中，寵物尚未參與
			if (P_Count == 0) or (P_Count == 30) then
				if (TrickKEY > 0) then --寵物毒藥，有此物品，當主人進入戰鬥時，寵物必參戰。

					SetModeEx( ThePet , EM_SetModeType_Fight , true )--可砍殺攻擊
					SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--反擊
					SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--索敵
					BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
					SetAttack( ThePet , AttackTarget ) --單純攻擊  
					WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
					WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --記住寵物目前的攻擊目標
					BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--目標是不是死了

				elseif (PetSay == 1) then --每秒 1/30 的機率說話
					BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Fight" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊

				elseif (Loyal <= 75) and (Loyal > 60) then --寵物忠誠度60~75
					local F = 100
					local YY = Rand( F )    

					if YY >= 0 and YY < 5 then   --5%機率參戰
						SetModeEx( ThePet , EM_SetModeType_Fight , true )--可砍殺攻擊
						SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--索敵
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
						SetAttack( ThePet , AttackTarget ) --單純攻擊  
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
						WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --記住寵物目前的攻擊目標
						BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--目標是不是死了
					end
				elseif (Loyal <= 90) and (Loyal > 75) then --寵物忠誠度75~90
					local F = 100
					local YY = Rand( F )      

					if YY >= 90 and YY < 100 then   --10%機率參戰
						SetModeEx( ThePet , EM_SetModeType_Fight , true )--可砍殺攻擊
						SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--索敵
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
						SetAttack( ThePet , AttackTarget ) --單純攻擊  
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
						WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --記住寵物目前的攻擊目標
						BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--目標是不是死了
					end
				elseif (Loyal <= 100) and (Loyal > 90) then --寵物忠誠度90~100
					local F = 100
					local YY = Rand( F )      

					if YY >= 70 and YY < 85 then   --15%機率參戰
						SetModeEx( ThePet , EM_SetModeType_Fight , true )--可砍殺攻擊
						SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--索敵
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
						SetAttack( ThePet , AttackTarget ) --單純攻擊  
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
						WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --記住寵物目前的攻擊目標
						BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--目標是不是死了
					end
				end
			elseif (TrickKEY > 0) then --寵物毒藥，有此物品，當主人進入戰鬥時，寵物必參戰。

				SetModeEx( ThePet , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--索敵
				BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
				SetAttack( ThePet , AttackTarget ) --單純攻擊  
				WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
				WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --記住寵物目前的攻擊目標
				BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--目標是不是死了

			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+3 , -1  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
			end
		elseif (MasterIsAttack == 1) and (PetIsAttack == 1) then--主人戰鬥中，寵物戰鬥中
			local TheTarget = ReadRoleValue(ThePet ,EM_RoleValue_Register+2  )--寵物參與戰鬥後之目標

			if (TheTarget == 0) then
				sleep(15)
				local AttackTarget = ReadRoleValue( Master , EM_RoleValue_AttackTargetID )
				SetModeEx( ThePet , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--索敵
				SetAttack( ThePet , AttackTarget ) --單純攻擊  
				WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
				WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --記住寵物目前的攻擊目標
				BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--目標是不是死了
			
			elseif P_Count == 0 then
				if (PetSay == 1) then --每秒 1/30 的機率說話
					BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , PetSayTime  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
				end
			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+3 , -1  ) --參數，讓寵物60秒才執行一個事件/話題/攻擊
			end
		end
	end

end

function YU_AttackTarget_isDead_00()								--判斷 寵物 參戰時所選定的目標是否已死
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	while true do
	sleep(10)
		local TheTarget = ReadRoleValue(OwnerID() ,EM_RoleValue_Register+2  )--寵物參與戰鬥後之目標
		local TargetIsDead = ReadRoleValue( TheTarget , EM_RoleValue_IsDead )

		if (TargetIsDead == 1) or (CheckID(TheTarget) == FALSE) or (TheTarget==0) then --當初參戰的目標已死
--DebugMsg( 0, RoomID ,"TheTarget is dead")
--DebugMsg( 0, RoomID ,"TheTarget = "..TheTarget)
--DebugMsg( 0, RoomID ,"TargetIsDead = "..TargetIsDead)

			SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
			SetStopAttack( OwnerID() )  --停止攻擊
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+2 , 0  ) --清空攻擊目標
			break
		end
	end
end

function Fun_YU_Pet_GettingHunger_00( ) -- 寵物飽食度自然下降   公式：200 / 忠誠度+50  (每10秒下降一次)

	local ThePet = OwnerID()	--寵物
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--主人
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--第幾隻寵物
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local SleepTime = 6000 --10分鐘
	local PerHunger = 250 --每10分鐘固定下降量

	local Trick =  CountBodyItem( Player , 203477 ) --特殊劇情觸發鑰匙，有此鑰匙，事件發生頻率改成30秒檢查一次，事件發生機率從15%增加為50%
	if Trick > 0 then
		SleepTime = 300
		PerHunger = 1
	end

	while true do
		sleep(SleepTime)	
		local Hunger = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Hunger )--飽食度
		local P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 ) --參數，讓寵物10分鐘擲骰一次是否發生事件，若有發生事件了，則大約一小時後才能再擲
		local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度
		local GetHunger = math.ceil(PerHunger/(Loyal+50))--無條件進位，取整數
		local PetHelpSay = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+1  )--寵物目前已告訴過玩家的輔助力效果

		if (Hunger-GetHunger) < 0 then
			WritePetValue( Player , ModePet , EM_CultivatePetStructValueType_Hunger , 0 )  
		else
			AddPetValue( Player , ModePet , EM_CultivatePetStructValueType_Hunger , -GetHunger )  
		end

		Hunger = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Hunger )--飽食度

		local PetHelp = 0
		if (Hunger >= 80) then
			PetHelp = 100
		elseif (Hunger >= 60) and (Hunger < 80) then
			PetHelp = 80
		elseif (Hunger >= 40) and (Hunger < 60) then
			PetHelp = 60
		elseif (Hunger >= 20) and (Hunger < 40) then
			PetHelp = 40
		elseif (Hunger >= 0) and (Hunger < 20) then
			PetHelp = 20
		end
	
		if (PetHelpSay ~= PetHelp) then

			if (Hunger >= 80) then
				local PetStr = "[SC_PETSYS_76][$SETVAR1="..PetHelp.."]" -- 輔助力X%
				ScriptMessage( Player , Player , 1 , PetStr , "0xff00ffff" )
				ScriptMessage( Player , Player , 0 , PetStr , "0xff00ffff" )
			elseif (Hunger >= 60) and (Hunger < 80) then
				local PetStr = "[SC_PETSYS_77][$SETVAR1="..PetHelp.."]" -- 輔助力X%
				ScriptMessage( Player , Player , 1 , PetStr , 0 )
				ScriptMessage( Player , Player , 0 , PetStr , 0 )
			elseif (Hunger >= 0) and (Hunger < 60) then
				local PetStr = "[SC_PETSYS_78][$SETVAR1="..PetHelp.."]" -- 輔助力X%
				ScriptMessage( Player , Player , 1 , PetStr , 0 )
				ScriptMessage( Player , Player , 0 , PetStr , 0 )
			end
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+1 , PetHelp  ) --記住寵物目前的輔助力( 已告訴過玩家了 )

		end

		if Trick > 0 then
			P_Event = 0
			WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 0  )--參數，讓寵物10分鐘擲骰一次是否發生事件，若有發生事件了，則大約一小時後才能再擲
		end

		if (P_Event == 0) then
------------------------------------------------------------------------------------------------------"*--《冒險事件》--*"-----------------------------------------------------------------------------------------------------------------------
			local AA = Rand( 100 )

			local RA = 15--預留學習寵物技能後，增加觸發機率的空間
			if Trick > 0 then
				RA = 50
			end
			RA = 50+RA
			P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 )
			if (AA >= 50) and (AA < RA) then   --15%機率觸發事件
				if (P_Event == 0) then 
					ScriptMessage( Player , Player , 1 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )
					ScriptMessage( Player , Player , 0 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )

					BeginPlot( Player , "Yuyu_Pet_Event_Adventure_01" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 10  )
				end
			end
------------------------------------------------------------------------------------------------------"*--《情感事件》--*"-----------------------------------------------------------------------------------------------------------------------
			local BB = Rand( 100 )

			local RB = 15--預留學習寵物技能後，增加觸發機率的空間
			if Trick > 0 then
				RB = 50
			end
			RB = 30+RB
			P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 )
			if (BB >= 30) and (BB < RB) then   --15%機率觸發事件
				if (P_Event == 0) then 
					ScriptMessage( Player , Player , 1 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )
					ScriptMessage( Player , Player , 0 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )

					BeginPlot( Player , "Yuyu_Pet_Event_Emotion_01" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 10  )
				end
			end
------------------------------------------------------------------------------------------------------"*--《生活事件》--*"-----------------------------------------------------------------------------------------------------------------------
			local CC = Rand( 100 )

			local RC = 15--預留學習寵物技能後，增加觸發機率的空間
			if Trick > 0 then
				RC = 50
			end
			RC = 10+RC
			P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 )
			if (CC >= 10) and (CC < RC) then   --15%機率觸發事件
				if (P_Event == 0) then 
					ScriptMessage( Player , Player , 1 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )
					ScriptMessage( Player , Player , 0 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )

					BeginPlot( Player , "Yuyu_Pet_Event_Life_01" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 10  )
				end
			end
		else
			local DD = Rand( 2 ) + 1
			if (P_Event - DD) < 0 then
				WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 0  )
			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+4 , -DD  )
			end
		end
	end
end
------------------------------------------------------------------------------------------------------"*--《胡亂測試》--*"-----------------------------------------------------------------------------------------------------------------------
function Fun_YU_PetAI_00_TEST_TEST( )
	SetModelScale( OwnerID() , 10 ) 
	sleep(30)
	SetModelScale( OwnerID() , 2 ) 
end

function YU_MasterPet_dead( )
	sleep(30)
	Delobj(OwnerID())
end