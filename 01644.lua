
function Yuyu_GuildWarAC_1_00(Seat,UpDown) -- 公會戰時，【載具初始劇情】
--Say(OwnerID(),OwnerID())--玩家
--Say(TargetID(),TargetID())--載具
--Seat 回傳玩家目前所在的載具位置
--Kind 回傳載具種類
--SetExSkill()( int GItemID , int SpellerID , int SkillID , int SkillLv );
--設定載具用法術在玩家身上 
--DelExSkill( int GItemID , int SpellerID , int SkillID );
--刪除企劃設定法術 SpellID = -1 表示忽略檢查施法者, SkillID = -1 表示忽略技能類型
--Seat		載具乘坐位置
--UpDown	上車 是 1 下車是 0
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local TargetIDOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前載具之OrgID
	local AC_Kind = {102756,--弩砲台	1
			 102757,--連弩車	2
			 102758,--驅逐弩砲車	3

			 102759,--衝門鎚	4
			 102760,--鐵環衝車	5
			 102761,--無畏雄獅鎚	6

			 102762,--發石台	7
			 102763,--投石車	8
			 102764}--烈焰雙砲車	9

	local Kind = 0 

	for i = 1,9 do

		if AC_Kind[i]==TargetIDOrgID then
			Kind = i
			break
		end
	end

--Say(OwnerID(),"Kind="..Kind)
--Say(TargetID(),"TargetIDSeat="..Seat)
--Say(OwnerID(),"OwnerIDSeat="..Seat)
--Say(TargetID(),"TargetIDUpDown="..UpDown)
--Say(OwnerID(),"OwnerIDUpDown="..UpDown)
	
	local Skill_AC_A = {	495085,--弩砲射擊	--弩
				495090,--連續掃射	
				495091,--範圍掃射	
				495099,--守護之箭	
				495238}--疾馳之箭	


	local Skill_AC_B = {	495083,--重槌撞擊	--鎚
				495240,--摧毀標記	
				495092,--安心修理鎚	
				495093,--銅鑼撞擊	
				495241,--摧毀標記	
				495239,--巨鎚撞擊	
				495242,--摧毀標記	
				495094}--疾馳衝撞	

	local Skill_AC_C = {	495082,--火球投擲	--石
				495084,--碎石投擲							
				495088,--石塊投擲	
				495089}--焦油投擲	

	local Skill_ALL = {Skill_AC_A,Skill_AC_B,Skill_AC_C}

	local SkillID = {}

	SkillID[1] = 0
	SkillID[2] = 0
	SkillID[3] = 0
	SkillID[4] = 0
	SkillID[5] = 0
	SkillID[6] = 0
	SkillID[7] = 0
	SkillID[8] = 0

	local SkillLV = {}

	SkillLV[1] = 0
	SkillLV[2] = 0
	SkillLV[3] = 0
	SkillLV[4] = 0
	SkillLV[5] = 0
	SkillLV[6] = 0
	SkillLV[7] = 0
	SkillLV[8] = 0

	local sB = 5
	local sV = 70


	if (Kind == 1) or (Kind == 2) or (Kind == 3) then		--弩砲
		for i = 1,table.getn(Skill_ALL[1]) do
			SkillID[i] = Skill_AC_A[i]
			SkillLV[i] = (SkillLV[i] + (Kind-1))*sB+sV+sB
		end

	elseif (Kind == 4) or (Kind == 5) or (Kind == 6) then		--衝車
		for i = 1,table.getn(Skill_ALL[2]) do
			SkillID[i] = Skill_AC_B[i]
			SkillLV[i] = (SkillLV[i] + (Kind-1))*sB+sV+sB
		end

	elseif (Kind == 7) or (Kind == 8) or (Kind == 9) then		--投石
		for i = 1,table.getn(Skill_ALL[3]) do
			SkillID[i] = Skill_AC_C[i]
			SkillLV[i] = (SkillLV[i] + (Kind-1))*sB+sV+sB
		end
	end
--弩砲台	1
--連弩車	2
--驅逐弩砲車	3

--衝門鎚	4
--鐵環衝車	5
--無畏雄獅鎚	6

--發石台	7
--投石車	8
--烈焰雙砲車	9

	if UpDown == 1 then--上車時
		SetFlag( OwnerID()  , 543769 , 1 )--玩家在載具上之旗標
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , TargetID())	
		if (Kind == 1) or (Kind == 4) or (Kind == 7) then --操作和放技能是同一個人 (坐在位置0)

			if PassCard > 0 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			elseif Seat == 0 then --坐在位置1的 
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
			elseif Seat == 1 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			end

		elseif (Kind == 2)  or (Kind == 5) or (Kind == 8) or (Kind == 3) or (Kind == 6) or (Kind == 9) then

			if PassCard > 0 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
				SetExSkill( OwnerID() , TargetID() , SkillID[3] , SkillLV[3] )
				SetExSkill( OwnerID() , TargetID() , SkillID[4] , SkillLV[4] )
				SetExSkill( OwnerID() , TargetID() , SkillID[5] , SkillLV[5] )
				SetExSkill( OwnerID() , TargetID() , SkillID[6] , SkillLV[6] )
				SetExSkill( OwnerID() , TargetID() , SkillID[7] , SkillLV[7] )
				SetExSkill( OwnerID() , TargetID() , SkillID[8] , SkillLV[8] )
			elseif Seat == 0 then --坐在位置1的 
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
			elseif Seat == 1 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			elseif Seat == 2 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[3] , SkillLV[3] )
			elseif Seat == 3 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[4] , SkillLV[4] )
			elseif Seat == 4 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[5] , SkillLV[5] )
			elseif Seat == 5 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[6] , SkillLV[6] )
			elseif Seat == 6 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[7] , SkillLV[7] )
			elseif Seat == 7 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[8] , SkillLV[8] )
			end
		end
--以下為乘客增益--


		local BuildStr = {
				  "[SC_YU_GUILDWAR_BUILD_79]",	--弩

				  "[SC_YU_GUILDWAR_BUILD_81]",	--衝

				  "[SC_YU_GUILDWAR_BUILD_80]"}	--石	 --科技說明文

		local UPStr = 0	--說明法術

		local SkillBuffID = 0

		if (Kind == 1) or (Kind == 2) or (Kind == 3) then --弩砲系列
			SkillBuffID = 506157
			UPStr = BuildStr[1]
		elseif (Kind == 4) or (Kind == 5) or (Kind == 6) then --衝車系列
			SkillBuffID = 506159
			UPStr = BuildStr[2]
		elseif (Kind == 7) or (Kind == 8) or (Kind == 9) then --發石系列
			SkillBuffID = 506158
			UPStr = BuildStr[3]
		end

		local Set_A =-1
		local Count = BuffCount ( TargetID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
			if BuffID == SkillBuffID then
				local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
				Set_A = BuffLv

			end
		end

		if Set_A>-1 then
			Set_A = Set_A+1
			CancelBuff( TargetID() , SkillBuffID )
			AddBuff( TargetID() , SkillBuffID , Set_A , -1 )
		else
			AddBuff( TargetID() , SkillBuffID , 0 , -1 )
		end

		ScriptMessage( OwnerID() , OwnerID() , 1 , UPStr, C_SYSTEM ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , UPStr, C_SYSTEM ) 



--****************--


	elseif UpDown == 0 then--下車時
		SetFlag( OwnerID()  , 543769 , 0 )--玩家在載具上之旗標
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
		for i = 1, 3 do
			for j=1 , table.getn(Skill_ALL[i]) do
				DelExSkill( OwnerID() , TargetID() , Skill_ALL[i][j] )
			end
		end



--以下為乘客增益--
		local SkillBuffID = 0

		if (Kind == 1) or (Kind == 2) or (Kind == 3) then --弩砲系列
			SkillBuffID = 506157
		elseif (Kind == 4) or (Kind == 5) or (Kind == 6) then --衝車系列
			SkillBuffID = 506159
		elseif (Kind == 7) or (Kind == 8) or (Kind == 9) then --發石系列
			SkillBuffID = 506158
		end

		local Set_A =-1
		local Count = BuffCount ( TargetID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
			if BuffID == SkillBuffID then
				local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
				Set_A = BuffLv

			end
		end

		if Set_A == 0 then
			CancelBuff( TargetID() , SkillBuffID )
		else
			Set_A = Set_A-1
			CancelBuff( TargetID() , SkillBuffID )
			AddBuff( TargetID() , SkillBuffID , Set_A , -1 )
		end

--****************--

		DelExSkill( OwnerID() , -1 , -1 )
	
		DelExSkill( OwnerID() , TargetID() ,495085 )
		DelExSkill( OwnerID() , TargetID() ,495090 )
		DelExSkill( OwnerID() , TargetID() ,495091 )
		DelExSkill( OwnerID() , TargetID() ,495099 )
		DelExSkill( OwnerID() , TargetID() ,495238 )
		DelExSkill( OwnerID() , TargetID() ,495083 )
		DelExSkill( OwnerID() , TargetID() ,495240 )
		DelExSkill( OwnerID() , TargetID() ,495092 )
		DelExSkill( OwnerID() , TargetID() ,495093 )
		DelExSkill( OwnerID() , TargetID() ,495241 )
		DelExSkill( OwnerID() , TargetID() ,495239 )
		DelExSkill( OwnerID() , TargetID() ,495242 )
		DelExSkill( OwnerID() , TargetID() ,495094 )
		DelExSkill( OwnerID() , TargetID() ,495082 )
		DelExSkill( OwnerID() , TargetID() ,495084 )
		DelExSkill( OwnerID() , TargetID() ,495088 )
		DelExSkill( OwnerID() , TargetID() ,495089 )

		DelExSkill( OwnerID() , TargetID() ,495085 )
		DelExSkill( OwnerID() , TargetID() ,495090 )
		DelExSkill( OwnerID() , TargetID() ,495091 )
		DelExSkill( OwnerID() , TargetID() ,495099 )
		DelExSkill( OwnerID() , TargetID() ,495238 )
		DelExSkill( OwnerID() , TargetID() ,495083 )
		DelExSkill( OwnerID() , TargetID() ,495240 )
		DelExSkill( OwnerID() , TargetID() ,495092 )
		DelExSkill( OwnerID() , TargetID() ,495093 )
		DelExSkill( OwnerID() , TargetID() ,495241 )
		DelExSkill( OwnerID() , TargetID() ,495239 )
		DelExSkill( OwnerID() , TargetID() ,495242 )
		DelExSkill( OwnerID() , TargetID() ,495094 )
		DelExSkill( OwnerID() , TargetID() ,495082 )
		DelExSkill( OwnerID() , TargetID() ,495084 )
		DelExSkill( OwnerID() , TargetID() ,495088 )
		DelExSkill( OwnerID() , TargetID() ,495089 )
	end
end

--====================================================================================================================

function Yuyu_GuildWarAC_2_0() -- 【載具】安心修理槌
--Say(OwnerID(),"OwnerID")--載具本身
--Say(TargetID(),"TargetID")--被治療者

	local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --目前載具之OrgID
	local TarOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --被治療者之OrgID

	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )--被治療者

	local AC_Kind = {102756,--弩砲台		
			 102757,--連弩車		
			 102758,--驅逐弩砲車		
			 102759,--衝門鎚		4
			 102760,--鐵環衝車		5
			 102761,--無畏雄獅鎚		6
			 102762,--發石台	
			 102763,--投石車	
			 102764}--烈焰雙砲車	

	local Kind = 0 
	local Cure = 0 

	for i = 1,9 do

		if AC_Kind[i]==OwnerIDOrgID then
			Kind = i
			break
		end
	end

--Say(OwnerID(),"Kind="..Kind)
--Say(OwnerID(),"MaxHP="..MaxHP)


	if Kind > 0 then
		MaxHP = MaxHP *0.05
		Cure = (Kind-4)*MaxHP
		Cure = math.ceil(Cure)--小數點以下均捨去
		AddRoleValue( TargetID()  , EM_RoleValue_HP ,  Cure  )

	--	Say(OwnerID(),"Cure="..Cure)
	--	Say(OwnerID(),"Cure=".."["..TarOrgID.."]")


		local TargetIDName = "|cffffff20".."["..TarOrgID.."]".."|r"
		local str = "[SC_YU_GUILDWAR_BUILD_70][$SETVAR1="..TargetIDName.."][$SETVAR2="..Cure.."]"--修理了多少HP

		ScriptMessage( OwnerID() , 0 , 1 , str, 0 ) 
		ScriptMessage( OwnerID() , 0 , 0 , str, 0 ) 

	else
		ScriptMessage( OwnerID() , 0 , 1 , "[SC_YU_GUILDWAR_BUILD_56]", C_SYSTEM ) --施法對象不正確
		ScriptMessage( OwnerID() , 0 , 0 , "[SC_YU_GUILDWAR_BUILD_56]", C_SYSTEM ) 

	end

end



--====================================================================================================================

function Yuyu_GW_SBSkill_0_0( ) --【載具發石車】焦油投擲

	local OID = OwnerID()
	local TID = TargetID()	

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( TargetID() )--玩家的陣營

	local VOC = ReadRoleValue( TID , EM_RoleValue_VOC )--玩家職業

--Say(OwnerID(),"OwnerID")--插杖物件
--Say(TargetID(),"TargetID")--玩家

	local StageNpc = CreateObj( 103136 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

	AddToPartition( StageNpc , RoomID )  

--Say(StageNpc , "StageNpc")--新物件
	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條

	BeginPlot( StageNpc , "Yuyu_GW_SBSkill_0_1" , 0 )  
	BeginPlot( StageNpc , "Yuyu_GW_BigSkill_0_03" , 0 )  
end

function Yuyu_GW_SBSkill_0_1( ) --【載具發石車】焦油投擲 惡火肆虐

--Say(OwnerID(),"OwnerID")--新物件
--Say(TargetID(),"TargetID")--新物件
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

--	local StageNpc = CreateObj( 113693 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	local Npc_1 = CreateObj( 103136 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	AddToPartition( Npc_1 , RoomID )  

	SetModeEx( Npc_1 , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Npc_1 , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Npc_1 , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Npc_1 , EM_SetModeType_Mark, false )--標記
	SetModeEx( Npc_1 , EM_SetModeType_Move, false )--移動
	SetModeEx( Npc_1 , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Npc_1 , EM_SetModeType_HideName, true )--名稱
	SetModeEx( Npc_1 , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Npc_1 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Npc_1 , EM_SetModeType_DisableRotate, true )--轉向
	SetModeEx( Npc_1  , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	SetRoleCampID( Npc_1, PlayerGuildID )--寫入陣營
	BeginPlot( Npc_1 , "Yuyu_GW_SBSkill_0_4" , 0 )  
	BeginPlot( Npc_1 , "Yuyu_GW_SBSkill_0_2" , 0 )  
	AddBuff( Npc_1 , 506161 , 0 , -1 )	--火海特效

	sleep(50)

	local Npc_2 = Lua_Davis_BornByMultilateral( 103136 , 3 , 40 ) --(物件ID,生出幾個,半徑)

	for j=1 , table.getn(Npc_2) do	

		SetModeEx( Npc_2[j] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Npc_2[j] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Npc_2[j] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Npc_2[j] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Npc_2[j] , EM_SetModeType_Move, false )--移動
		SetModeEx( Npc_2[j] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Npc_2[j] , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Npc_2[j] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Npc_2[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Npc_2[j] , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( Npc_2[j]  , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		SetRoleCampID( Npc_2[j], PlayerGuildID )--寫入陣營
		BeginPlot( Npc_2[j] , "Yuyu_GW_SBSkill_0_4" , 0 )  
		BeginPlot( Npc_2[j] , "Yuyu_GW_SBSkill_0_3" , 0 )  
		AddBuff( Npc_2[j] , 506161 , 0 , -1 )	--火海特效
	end

end

function Yuyu_GW_SBSkill_0_2( ) --【大絕招】惡火肆虐 生存時間
	sleep(50)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_SBSkill_0_3( ) --【大絕招】惡火肆虐 生存時間
	sleep(50)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_SBSkill_0_4( ) --【惡火肆虐持續施法】

	while true do
		CastSpelllv( OwnerID() , OwnerID() , 495096 , 1 )
		sleep(10)
	end
end

--====================================================================================================================

function Yuyu_GW_SBSkill_1_0( ) --【載具衝車】疾馳衝撞

--Say(OwnerID(),"OwnerID()")
--Say(TargetID(),"TargetID()")

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	------------------- 在目標前面一定距離內產生一個物件，如果該點無法產生物品，則在目標位置產生（不會addToPartition）---------------
	local StageNpc = Lua_CreateObjByDir( OwnerID() , 103447 , 100 , 0) --參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件

	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
--Say(OwnerID(),PlayerGuildID)

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, true )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	WriteRoleValue( StageNpc  , EM_RoleValue_Register , OwnerID()) 
	AddToPartition( StageNpc , RoomID ) 
 
--Say(StageNpc,"StageNpc()")
--Say(StageNpc , "StageNpc")--新物件
--	if PlayerGuildID == 7 then
--		SetRoleCampID(StageNpc,8)--寫入陣營
--		PlayerGuildID = GetRoleCampID( StageNpc )--玩家的陣營
--Say(StageNpc,PlayerGuildID.."StageNpc")
--	elseif PlayerGuildID == 8 then
--		SetRoleCampID(StageNpc,7)--寫入陣營
--		PlayerGuildID = GetRoleCampID( StageNpc )--玩家的陣營
--Say(StageNpc,PlayerGuildID.."StageNpc")
--	end

	BeginPlot( StageNpc , "Yuyu_GW_SBSkill_1_1" , 0 )  
	BeginPlot( StageNpc , "Yuyu_GW_SBSkill_1_2" , 0 )  

end

function Yuyu_GW_SBSkill_1_1( ) --【載具衝車】疾馳衝撞
	sleep(20)
	local Monster = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register )
--Say(OwnerID(),"OwnerID")--新物件
--Say(TargetID(),"TargetID")--新物件
--Say(Monster,"Monster")--新物件

--	CastSpelllv( OwnerID() , Monster , 495095 , 30 )
	CastSpelllv( Monster , OwnerID() , 495095 , 30 )

end

function Yuyu_GW_SBSkill_1_2( ) --【載具衝車】疾馳衝撞 生存時間
	sleep(50)
	Delobj(OwnerID())
end

--====================================================================================================================