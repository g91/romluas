function Fun_Pets_Test_callPets(PetsID)

	GiveItem_Pet( OwnerID()   , 204507 , 1 , 1 , 3 , PetsID ); 

end
function YU_Pets_SayCamp()
	local O_ID = OwnerID()
	local Npc_Camp = ReadRoleValue( O_ID , EM_RoleValue_CampID  )   --NPC的陣營,需特別判斷，排除技能型寵物(EX：森林牧者的)    3為Monster
	Say(O_ID,"My Camp is "..Npc_Camp)
end
function YU_Pets_GOGOEXP(EXP)--增加第一顆寵物蛋的經驗值。(此指令只對第一顆蛋有效)
	AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_Exp , EXP )  
	ReCalPetLv(OwnerID(),0)
end

function YU_Scale_GOBig_00()
	SetModelScale( OwnerID() , 5 ) 
end

function YUTest_callPetsTEST_EXP()
	local PlayerID = OwnerID()
	local Mode = -1
	local ModePet = -1

	for i = 0,5 do

		Mode = ReadPetValue( PlayerID , i ,EM_CultivatePetStructValueType_EventType ) --寵物狀態(正被召喚(2)、正在旅行(4)、正在生產(8)...etc)

		if Mode == 2 then
			ModePet = i	--寫入i為正在召喚出來的寵物欄位序號
			ModePet = ModePet+1	--介面使用，寵物欄位從1開始
		end
	end

	ReCalPetLv(PlayerID,ModePet)

end

function YUTest_callPetsADD_EXP(LifeSkill)-- 遊戲中用GM指令的Pcall呼叫只能有一個參數--增加第一顆寵物蛋的生產經驗值50%。(此指令只對第一顆蛋有效)


	if LifeSkill == 1 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill1 , 0.5 )  

	elseif LifeSkill == 2 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill2 , 0.5 )  

	elseif LifeSkill == 3 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill3 , 0.5 )  

	else
		Say(OwnerID() , "No Way~The Range is 1~3 !")
	end

end

function YUTest_callPetsADD_EXP2(LifeSkill)-- 遊戲中用GM指令的Pcall呼叫只能有一個參數--增加第一顆寵物蛋的生產經驗值99%。(此指令只對第一顆蛋有效)


	if LifeSkill == 1 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill1 , 0.99 )  

	elseif LifeSkill == 2 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill2 , 0.99 )  

	elseif LifeSkill == 3 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill3 , 0.99 )  

	else
		Say(OwnerID() , "No Way~The Range is 1~3 !")
	end

end



function LuaYU_PetSystem_test01( Option )      -- 寵物測試

	local PlayerID = OwnerID()
	local PackageID = 204794		-- 
--	local NeedSpace = 1
--	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
--	local ZoneID = ReadPetValue( OwnerID(), 0 ,EM_RoleValue_ZoneID )


	if ( Option == "CHECK" ) then

		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end

	elseif ( Option == "USE" ) then


--		GiveItem_Pet( OwnerID(), 204476 ,10,1,2)  --GiveItem_Pet( OwnerID(), int ItemOrgID , int Lv )   給一個寵物蛋(給誰,  哪顆蛋,  幾級的蛋)
		--GiveItem_Pet( int GItemID , int ItemOrgID , int Lv , int Range , int MaxTotalPoint )--Range：屬性之增幅　MaxTotalPoint：增幅總和上限
--ReadPetValue( GItemID , PetPos , ValueType )    讀取寵物(OwnerID(主人), 第幾隻寵物,什麼屬性)
--WritePetValue( GItemID , PetPos , ValueType , Value )  寫入寵物(OwnerID(主人), 第幾隻寵物,什麼屬性,寫入值)
--AddPetValue( GItemID , PetPos , ValueType , Value )  加寫入寵物(OwnerID(主人), 第幾隻寵物,什麼屬性,寫入值)

--		Say( OwnerID(), "WHO's Bad !" ) --主人

--		ScriptMessage(OwnerID(), OwnerID() , 1 , " START "  , C_SYSTEM )  
--		ScriptMessage(OwnerID(), OwnerID() , 0 , " START "  , C_SYSTEM )  

		local ItemOrgID = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_ItemOrgID )		-- 寵物蛋的編號
		local CreateTime = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_CreateTime )
		local OrgObjID = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_OrgObjID )			--寵物的編號
		local Lv = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Lv )				--寵物等級
		local PetType = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_PetType ) 			--寵物種族(個性)
		local EventColdown = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_EventColdown )
		local EventType = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_EventType )		--寵物狀態(正被召喚(2)、正在旅行(4)、正在生產(8)...etc)

			--EM_CultivatePetCommandType_None		0	沒狀態(停止生活技能)
			--EM_CultivatePetCommandType_OnTimeEvent	1	client 端每10秒通知Server 看那隻寵物(處理說話or特別事件)
			--EM_CultivatePetCommandType_Summon	2	召喚寵物
			--EM_CultivatePetCommandType_Feed		3	餵食
			--EM_CultivatePetCommandType_Trave		4	旅行
			--EM_CultivatePetCommandType_Free		5	放生
			--EM_CultivatePetCommandType_Train		6	特訓
			--EM_CultivatePetCommandType_Return		7	召喚出的寵物回收
			--EM_CultivatePetCommandType_LiftSkill		8	從事生產


		local LifeSkillTablePos = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_LifeSkillTablePos )
		local Exp = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Exp ) 				--經驗
		local SKillPoint = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_SKillPoint )			--目前技能點
		local TotalSkillPoint = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_TotalSkillPoint )		--總技能點數
		local Loyal = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Loyal )				--忠誠度
		local Hunger = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Hunger )			--飽食度
		local Talent = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Talent )				--資質
		local Spirit = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Spirit )				--歷練
		local Mode = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Mode )				--寵物模式
		local Str = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Str )
		local Sta = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Sta )
		local Agi = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Agi )
		local Int = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Int )
		local Mnd = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Mnd )
		local Property = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Property )			--寵物屬性   0地、1水、2火、3風、4光、5暗
		local TrainCount = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_TrainCount )

		ScriptMessage(OwnerID(), OwnerID() , 0 , " ItemOrgID="..ItemOrgID  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " CreateTime="..CreateTime  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " OrgObjID="..OrgObjID  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Lv="..Lv  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " PetType="..PetType  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " EventColdown="..EventColdown  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " EventType="..EventType  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " LifeSkillTablePos="..LifeSkillTablePos  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Exp="..Exp  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " SKillPoint="..SKillPoint  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " TotalSkillPoint="..TotalSkillPoint  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Loyal="..Loyal  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Hunger="..Hunger  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Talent="..Talent  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Spirit="..Spirit  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Mode="..Mode  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Str="..Str  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Sta="..Sta  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Agi="..Agi  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Int="..Int  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Mnd="..Mnd  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Property="..Property  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " TrainCount="..TrainCount  , C_SYSTEM )  

	end
end
--以下為測試用
-- 2013.03.11 阿浩：(5.0.10)更新寵物系統各區域捕捉寶貝蛋的等級區間，重新修改以下劇情
function LuaYU_TakePetEGG_01_test(ZoneID) --以下為測試用劇情，玩家取蛋 執行 /gm ? runplot LuaYU_TakePetEGG_01_test

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) 
	local PetEggLv = 1 --寵物蛋等級

	if ZoneID == nil then
		ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	end

	local PetLvRange = {	[1] = 7 ,	-- Zone ID , 帕奇寵物(寵物蛋)產生時的等級隨機區間。
				[2] = 14 , 	-- Zone 2，帕奇寵物產生時的等級隨機區間為 1 ~ 14
				[3] = 33 ,
				[4] = 20 ,
				[5] = 27 ,
				[6] = 33 ,
				[7] = 34 ,
				[8] = 36 ,
				[9] = 36 ,
				[10] = 14 ,
				[11] = 23 ,
				[12] = 6 ,
				[13] = 28 ,
				[14] = 33 ,
				[15] = 38 ,
				[16] = 38 ,
				[17] = 40 ,
				[18] = 41 ,
				[19] = 43 ,
				[20] = 44 ,
				[21] = 46 ,
				[22] = 50 ,
				[23] = 50 ,
				[24] = 51 ,
				[25] = 53 ,
				[26] = 54 ,
				[27] = 56 ,
				[28] = 58 ,
				[29] = 60 ,
				[30] = 61 ,
				[31] = 6 ,
				[32] = 63 ,
				[33] = 64 ,
				[34] = 66	}
	
	if PetLvRange[ZoneID] ~= nil then	-- 當前 Zone 屬於 PetLvRange 中定義的 Zone 時執行
		PetEggLv = Math.random(PetLvRange[ZoneID])
		DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..PetLvRange[ZoneID].." , EggLv = "..PetEggLv )
	else	-- 當前 Zone 不屬於 PetLvRange 中定義的任何 Zone 時執行
		local MaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取該伺服器當前設定好的玩家最高等級
		PetEggLv = Math.random( Math.floor( MaxLv*(2/3) ) )	-- 寵物蛋等級 = (玩家最高等級*2/3)的整數
		DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..MaxLv.." , EggLv = "..PetEggLv )
	end	
-----------------------以下為了組合出 寵物蛋 《蛋的ID》------------------------------

	local Egg = { }
	Egg[0] = {204476,204477,204478,204479,204480,204481}	--野生寶貝蛋		
	Egg[1] = {204482,204483,204484,204485,204486,204487}	--野生寶貝蛋2	
	Egg[2] = {204488,204489,204490,204491,204492,204493}	--奇異寶貝蛋	
	Egg[3] = {204506,204507,204508}				--符文寶貝蛋		
	Egg[4] = {204494,204495,204496,204497,204498,204499}	--奇異寶貝蛋2	
	Egg[5] = {204500,204501,204502,204503,204504,204505}	--聖紋寶貝蛋	

	local MouseOrgID = 103566    --棕色帕奇鼠
	local RareEgg = 0 --蛋的種類變數
	local EggItem = 0 --蛋的排列位置

	if MouseOrgID==103566 then --棕色帕奇鼠
		local RuneEggRand = Rand(100)	
		RareEgg = Rand(4)
		if RareEgg == 3 then
			if (RuneEggRand >=30) and (RuneEggRand <100) then	--70%
				EggItem = 2
			elseif (RuneEggRand >=5) and (RuneEggRand <30) then	--25%
				EggItem = 3
			else	--5%
				EggItem = 1
			end
		else
			EggItem = rand(table.getn(Egg[RareEgg]))+1
		end

	elseif MouseOrgID==103567 then --金色帕奇鼠
   		local RuneEggRand = Rand(100)
		RareEgg = Rand(6)    
		if RareEgg < 2 then
			RareEgg = 3
		end

		if RareEgg == 3 then
			if (RuneEggRand >=30) and (RuneEggRand <100) then	--70%
				EggItem = 2
			elseif (RuneEggRand >=5) and (RuneEggRand <30) then	--25%
				EggItem = 3
			else	--5%
				EggItem = 1
			end
		else
			EggItem = rand(table.getn(Egg[RareEgg]))+1
		end
	end	
-----------------------以下為了組合出寵物蛋包含之寵物OrgID-----------------------
--一般區域性寵物
	local Pets = { }
	Pets[0] = {103610,103611,103612,103613,103614,103615,103616,103617,103618,103619,
	                    103622,103629,103624,103630,103642,103628,103710,103693,103694,103695,
	                    103691,103636,103660,103668}									--一般全域寵
	Pets[1] = {103622,103624,103625,103626,103627,103628}							--Zone1
	Pets[2] = {103629,103630,103631,103632,103633,103634}							--Zone2
	Pets[3] = {103635,103636,103637}										--Zone3
	Pets[4] = {103642,103643,103644,103645}									--Zone4
	Pets[5] = {103649,103650,103651,103652}									--Zone5
	Pets[6] = {103657,103658,103659,103660,103661}								--Zone6
	Pets[7] = {103666,103667,103668,103669,103670,103671,103672}						--Zone7
	Pets[8] = {103676,103677,103678,103679}									--Zone8
	Pets[9] = {103684,103685,103686,103687}									--Zone9
	Pets[10] = {103691,103692,103693,103694,103695}								--Zone10
	Pets[11] = {103697,103698,103699,103701,103700}								--Zone11
	Pets[12] = {103706,103707,103708,103709,103710}								--Zone12
--稀有區域性寵物
	local ElitePets = { }
	ElitePets[0] = {103620,103621,103718,103719,103720,103721,103722,103723,103724,103725,103726,
		            103711,103681,103713,103696,103623 }								--稀有全域寵
	ElitePets[1] = {103623}												--Zone1
	ElitePets[2] = {103717}												--Zone2
	ElitePets[3] = {103639,103640,103638}										--Zone3
	ElitePets[4] = {103646,103647,103648}										--Zone4
	ElitePets[5] = {103653,103654,103655,103656}									--Zone5
	ElitePets[6] = {103662,103663,103664,103665}									--Zone6
	ElitePets[7] = {103673,103674,103675}										--Zone7
	ElitePets[8] = {103680,103681,103682,103683}									--Zone8
	ElitePets[9] = {103690}												--Zone9
	ElitePets[10] = {103696}												--Zone10
	ElitePets[11] = {103702,103703}											--Zone11
	ElitePets[12] = {103711,103712,103713}										--Zone12

	local RunePets = {103714,103715,103716}--符文寵物

	local PGroup = Rand(100)    
	local PetNpcGroup = 0		--寵物種類：一般全域寵(1)/稀有全域寵(2)/一般區域寵(3)/稀有區域寵(4)/符文寵(5)
	local PetSet= 0			--該群組寵物蛋之位置
	local PetOrgID= 0		--寵物ID
	--DebugMsg( Player , RoomID ,"PGroup="..PGroup )
	if RareEgg == 3 then		--此次之寵物蛋為：符文寶貝蛋
		PetNpcGroup = 5		--符文寵(5)

	elseif (ZoneID > 12) then		--12區之後新開之區域
		if (PGroup >= 20)  and  (PGroup < 100) then	--80%
			PetNpcGroup = 1	--一般全域寵(1)
		else						--20%
			PetNpcGroup = 2	--稀有全域寵(2)
		end

	elseif (PGroup >= 60)  and  (PGroup < 100) then	--40%
		PetNpcGroup = 1		--一般全域寵(1)

	elseif (PGroup >= 20)  and  (PGroup < 60) then		--40%
		PetNpcGroup = 3		--一般區域寵(3)

	elseif (PGroup >= 10)  and  (PGroup < 20) then		--10%
		PetNpcGroup = 2		--稀有全域寵(2)
	else							--10%
		PetNpcGroup = 4		--稀有區域寵(4)
	end
	--DebugMsg( Player , RoomID ,"PetNpcGroup="..PetNpcGroup )
	if PetNpcGroup == 1 then			--一般全域寵(1)
		PetSet = rand(table.getn(Pets[0]))+1
		PetOrgID = Pets[0][PetSet]
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	elseif PetNpcGroup == 2 then			--稀有全域寵(2)
		PetSet = rand(table.getn(ElitePets[0]))+1
		PetOrgID = ElitePets[0][PetSet]
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	elseif PetNpcGroup == 3 then			--一般區域寵(3)
		PetSet = rand(table.getn(Pets[ZoneID]))+1
		PetOrgID = Pets[ZoneID][PetSet]
	--DebugMsg( Player , RoomID ,"ZoneID="..ZoneID)
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	elseif PetNpcGroup == 4 then			--稀有區域寵(4)
		PetSet = rand(table.getn(ElitePets[ZoneID]))+1
		PetOrgID = ElitePets[ZoneID][PetSet]
	--DebugMsg( Player , RoomID ,"ZoneID="..ZoneID)
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	else						--符文寵(5)
		PetSet = rand(table.getn(RunePets))+1
		PetOrgID = RunePets[PetSet]
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	end
--	ScriptMessage( Player , Player , 2 , "You get the Egg!" , "0xff00ffff" )
--	ScriptMessage( Player , Player , 0 , "You get the Egg!" , "0xff00ffff" )
	local LvAddRange = math.ceil(2+(0.3*PetEggLv))--無條件進位，取整數
	local TotalLvAdd = LvAddRange*2
	local play =  CheckFlag( Player , 542570 ) --是否參與過免費練習
	local FreeEgg =  CheckFlag( Player , 542573 ) --第一顆免費蛋

	if ( play == true ) and ( FreeEgg == false ) and (ZoneID == 304) then--未獲得過免費蛋，而且玩家正處於米拉牧場
		GiveItem_Pet( Player   , 204509 , 1 , LvAddRange ,    TotalLvAdd   , 103714 )
		SetFlag( Player , 542573 , 1 ) -- 獲得第一顆免費蛋
	else
		GiveItem_Pet( Player , Egg[RareEgg][EggItem] , PetEggLv , LvAddRange , TotalLvAdd   , PetOrgID )
		-- 給予人、寶貝蛋ID、寶貝蛋、寶貝蛋等級、成長率、寵物ID
	--	DebugMsg( Player , RoomID , "EggID : "..Egg[RareEgg][EggItem].." , PetID : "..PetOrgID.." , EggLv : "..PetEggLv )
	end
end