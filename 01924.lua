function un_GW_Siege_Born() --【載具攻防加點初始劇情】
--用 OrgID判斷 不要用PCALL

	local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --目前載具之OrgID
	local Siege = {102756,--弩砲台
			 102757,--連弩車
			 102758,--驅逐弩砲車
			 102759,--衝門鎚
			 102760,--鐵環衝車
			 102761,--無畏雄獅鎚
			 102762,--發石台
			 102763,--投石車
			 102764}--烈焰雙砲車

	local BuffKind = 0 

	for i = 1,9 do

		if Siege[i]==OwnerIDOrgID then
			BuffKind = i
		end
	end

	local SiegeA={505513,80,505516,300,505514,100,505512,25}--弩砲台 		攻NPC衰弱、增防NPC、攻玩家增傷、被玩家攻衰弱
	local SiegeB={505513,75,505516,300,505514,100,505512,25}--連弩車
	local SiegeC={505513,70,505516,300,505514,100,505512,25}--驅除弩砲車 
	--{ 攻NPC傷減、被NPC攻加、攻玩家傷加、被玩家攻加 }
	local SiegeD={505923,160,505516,300,505515,70,505921,5}--衝門鎚
	local SiegeE={505923,180,505516,300,505515,65,505921,5}--鐵環衝車
	local SiegeF={505923,200,505516,300,505515,60,505921,5}--無畏雄獅鎚 
	--{ 攻NPC傷加、被NPC攻加、攻玩家傷減、被玩家攻減 }
	local SiegeG={505923,160,505516,300,505514,80,505512,25}--發石台
	local SiegeH={505923,160,505516,300,505514,80,505512,25}--投石車 
	local SiegeI={505923,180,505516,300,505514,80,505512,25}--烈焰雙砲車
	--{ 攻NPC傷加、被NPC攻加、攻玩家傷加、被玩家攻加 }
	local Buff ={SiegeA,SiegeB,SiegeC,SiegeD,SiegeE,SiegeF,SiegeG,SiegeH,SiegeI}

	AddBuff( OwnerID() ,Buff[BuffKind][1] ,Buff[BuffKind][2] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][3] ,Buff[BuffKind][4] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][5] ,Buff[BuffKind][6] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][7] ,Buff[BuffKind][8] ,-1 );  
	AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

	if BuffKind == 1 then
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
		--local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

		local StageNpc = CreateObj( 113694 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)--弩砲台建築點
		AddToPartition( StageNpc , RoomID )  
		--SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

		sleep(5)
		SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
		SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
		SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
		SetPlot( StageNpc , "touch" , "" , 0 )	--公會城戰時
		WriteRoleValue( OwnerID() , EM_RoleValue_Register, StageNpc ) --記住建築基地號碼
		SetPlot(  OwnerID(), "dead","Yuyu_GW_Siege_eq_2_05",0 )     
	end
end
function un_GuildWarAC_1_00(Seat,UpDown) -- 公會戰時，【載具初始劇情】
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

	SkillID[1] = -1
	SkillID[2] = -1
	SkillID[3] = -1
	SkillID[4] = -1
	SkillID[5] = -1
	SkillID[6] = -1
	SkillID[7] = -1
	SkillID[8] = -1

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
function un_21345345334()
	addbuff(OwnerID(),508111,0,-1)
end		
function V()
	say(OwnerID(),"123")
end
function un_monsterskill_test()
	local silltime = 0
	local AttackTarget
	while true do
	sleep(10)
		silltime=silltime+1
		if silltime%7 ==0 then
			AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			CastSpell ( OwnerID() , AttackTarget , 496468  )
		end
	end
end
function un_BUFF_test()
	addbuff(OwnerID(),506738,0,-1)
end
function un_testsearch()
	local TableA ={}
	local TableB ={}
	local TableC ={}
	TableA = SearchRangeNPC ( OwnerID() , 100 )
	TableB = SearchRangePlayer ( OwnerID() ,100 )
	--say(OWnerID(),"tableA = "..table.getn(TableA))
	--say(OWnerID(),"tableb = "..table.getn(Tableb))
	local x = table.getn(TableA)  --X =  TableA內的數量 ，因為系統table是從1開始判定，但是讀取是從0開始讀取
	local y = table.getn(Tableb)  -- 所以如果要用到FOR迴圈執行話要做出一個暫存值 -1數量開始讀取
	for i=0 , x-1 do              
		table.insert(TableC,TableA[i])  --把TableA[i]內的東西丟到TableC
	end
	for i=0 , y-1 do
		table.insert(TableC,Tableb[i])  --把Tableb[i]內的東西丟到TableC
	end
	local z = table.getn(TableC)
	--say(OWnerID(),"tablec = "..table.getn(TableC))
	for i=0 , z-1 do
		say(OwnerID(),"tableC"..i+1 .."= "..TableC[i+1])
	end
end

