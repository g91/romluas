--※ 頭銜(稱號)SCRIPT ※--

function sasa_test(check)
	if check == 0 then
		Say( OwnerID() , "A" )
	elseif check == 1 then
		Say( OwnerID() , "B" )
	end
end

function lua_sasa_104083_Counter()			--模式計時器
	local counter1 = 0			-------階段1計時
	local counter2 = 0			-------階段2計時
	local Mode = 0				-------判斷模式用
	local ModeTime1 = 60		-------模式1時間間隔
	local ModeTime2 = 60		-------模式2時間間隔
	
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local Boss = CreateObjByFlag( 104084 , 780689 , 1 , 1 )				----在旗標生物件
	AddToPartition( Boss , Room )										----把物件加到某層
	BeginPlot( Boss , "lua_sasa_104084_Boss" , 0 )						----叫物件執行"內容",始動秒數
	
	local EnterFight = 0												----進入戰鬥開關
	
	while 1 do
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	----讀攻擊目標
		if  ( BossTarget ~= 0 ) and ( CheckID( Boss ) == true) then			----王攻擊目標,王在不在
			counter1 = counter1 + 1											----每秒+1
			if EnterFight == 0 then											----0=開,1=關
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )	----暫存區(通知王執行哪個模式,數字是模式)
				EnterFight = 1
			end	
			if Mode == 1 then												----假設模式=1
				if counter1 >= ModeTime1 then								----計時的變數大於設定的秒數
					Mode = 2
					WriteRoleValue( Boss , EM_RoleValue_register1 , 2 )
					counter1 = 0											----要歸0,不然會超時
				end	
			elseif Mode == 2 then
				if counter1 >= ModeTime2 then
					Mode = 1
					WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
					counter1 = 0
				end
			end
			
		else																----重置
		
			EnterFight = 0													----再開一次
			counter1 = 0													----歸0
			Mode = 1

			if ReadRoleValue( Boss , EM_RoleValue_register10) == 10 then
				sleep(50)
				Boss = CreateObjByFlag( 104084 , 780689 , 1 , 1 )
				AddToPartition( Boss , Room )
				BeginPlot( Boss , "lua_sasa_104084_Boss" , 0 )
			end
		end
	end		
end

function lua_sasa_104084_Skill_1()		-----Boss技能施放
	local Skill = { 495883 , 495884 }		-----喵吉之印,貓神沖擊
	local SkillLv = { 20 , 0 }
	local SkillString = { "[SC_104084_01]" , "[SC_104084_02]" }				--喵嗚…腳印塞滿～	--藉由貓咪之神來懲罰你～喵！
	local Luck = Rand(100)													----取亂數放技能
	local PlayerInHate = star_HateListSort(OwnerID())						----取出仇恨表內的玩家
	local BossTarget 														----存BOSS要打的目標
	local SkillIndex 														----取TABLE內的位置

	if (Luck >= 0 and Luck < 50) then										----從0~ 取一個數
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1				---隨機抓仇恨表內的玩家
		BossTarget = PlayerInHate[RandTarget1]
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		BossTarget = OwnerID()												---自身範圍,PlayerInHate[1]=第一個
	end
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )		--喊話(誰講,-1=全區玩家,2=黃色警告(不會被洗掉)
	--Yell( OwnerID() , SkillString[SkillIndex] , 5),另一種喊話,可以設範圍
	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	--技能等級(SysCastSpellLV=系統放)
	--Sleep(10)
end

function lua_sasa_104084_Skill_2()
	local Skill = { 495885 , 495886 }		-----瘋貓刃,魚切
	local SkillLv = { 0 , 0 }
	local SkillString = { "[SC_104084_03]" , "[SC_104084_04]" }				--喵嗚…來玩吧！！	--魚肥果熟入我肚，喵吉我來親下廚！
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())
	local BossTarget
	local SkillIndex

	if (Luck >= 0 and Luck < 50) then
		SkillIndex = 1
		BossTarget = OwnerID()
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		BossTarget = PlayerInHate[1]
	end
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
	--Sleep(10)
end

function lua_sasa_104084_Boss()			------Boss本體
	while 1 do
		Sleep(10)
		local Counter1 = 0						-------小怪計時
		local Counter2 = 0						-------技能計時
		local mode = 0							-------判斷模式用
		local mob1 = {}							-------生小怪的變數
		local mob2 = {}
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			--讀攻擊的目標
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true) then						--王攻擊目標,王在不在
				mode = ReadRoleValue( OwnerID() , EM_RoleValue_register1)					--讀之前寫入的模式
				WriteRoleValue( OwnerID() , EM_RoleValue_register10 , 10 )							--告訴計時器已進入戰鬥
				if mode == 1 then
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					if counter1 >= 20 then
						mob1[table.getn(mob1)+1] = CreateObjByFlag( 104085 , 780689 , 2 , 1 )
						AddToPartition( mob1[table.getn(mob1)] , Room )
						counter1 = 0
					elseif counter2 >= 6 then
						lua_sasa_104084_Skill_1()					
						counter2 = 0
					end
				elseif mode == 2 then
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					if counter1 >= 10 then
						mob2[table.getn(mob2)+1] = CreateObjByFlag( 104086 , 780689 , 3 , 1 )
						AddToPartition( mob2[table.getn(mob2)] , Room )
						counter1 = 0
					elseif counter2 >= 6 then
						lua_sasa_104084_Skill_2()					
						counter2 = 0
					end
				end

			else																	--離開戰鬥
			
				if ReadRoleValue( OwnerID() , EM_RoleValue_register10) == 10 then
					DelObj( OwnerID() )													--刪除王
					for i = 1, table.getn(mob1)	do										--table.getn取TABLE內的總數量
						if mob1[i] ~= nil and CheckID(mob1[i]) then						--判斷第一階段的小怪是否還在場上
							DelObj(mob1[i])
						end
					end
					for i = 1, table.getn(mob2)	do
						if mob2[i] ~= nil and CheckID(mob2[i]) then
							DelObj(mob2[i])
						end
					end
				end
				
				break
			end
		end
	end
end


