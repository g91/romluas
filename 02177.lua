function kg_105039_01()	--Boss中控器
	local Ctrl= OwnerID()	--中控器自身
	local BossID = 105039	--Boss 物件編號
	local RoomID = ReadRoleValue( Ctrl,EM_RoleValue_RoomID)
	local Parent = ReadRoleValue(Ctrl,EM_RoleValue_Register3)	--取得母物件ID

	local FlagID = 780805	--路徑旗標ID
	local PathA = {13,14,15,21}	--路徑A旗標陣列
	local PathB = {16,17,18,24}	--路徑B旗標陣列
	local RandStart	--Boss起始旗標編號
	local Path	--Boss最後路徑旗標陣列
	
	--隨機設定路徑
	if math.random(100)<51 then
		RandStart=PathA[1]
		Path=PathA
		--debugmsg(0,0,"RandStart= "..RandStart.." Path[1]= "..Path[1])
	else
		RandStart=PathB[1]
		Path=PathB
		--debugmsg(0,0,"RandStart= "..RandStart.." Path[1]= "..Path[1])
	end

	local Goal = 4	
	local step = 2	

	local Boss = CreateObjByFlag( BossID, FlagID , RandStart , 1 )	--創建Boss
	MoveToFlagEnabled( Boss, false )	--關閉巡邏路徑劇情
	WriteRoleValue(Ctrl,EM_RoleValue_Register1,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register3,Parent)
	AddToPartition( Boss , RoomID )		--繪製Boss
	BeginPlot(Boss,"kg_105039_BossAI",1)
	SetPlot(Boss,"dead","kg_105039_BossDead",30)
	--debugmsg(0,0,"WTF!!!!")

	while true do
		if KS_InCombat(Boss) ~= true then	--假如不在戰鬥中
			WriteRoleValue(Boss,EM_RoleValue_IsWalk, 1 )	--Boss用走的移動
			if CheckBuff(Boss,508173)==true then
				CancelBuff(Boss,508173)
			end
			if step<=Goal then
				if DW_CheckDis( Boss, FlagID, Path[step], 30 ) == true and step < Goal  then	--判定當走到當前旗標時，繼續往下個旗標走
					if  step==2 and KS_InCombat(Boss) ~= true then	--使用傳送
						sleep(10)
						SetPosByFlag( Boss, FlagID , Path[step+1] )
						step = step + 2
					else 
						step = step + 1
					end
				
				elseif DW_CheckDis( Boss, FlagID, Path[step], 30 ) == true and step == Goal  then
					--break--到達終點
				elseif step<=Goal then
					KS_Move( Boss, 30, FlagID , Path[step] )	--移動到指定旗標
				end
			end
		end
		if ReadRoleValue(Boss,EM_RoleValue_IsDead)==1 or CheckID(Boss)==FALSE then	--Boss死亡則跳出迴圈
			--DebugMsg(0,0,"Boss is Dead!!!")
			WriteRoleValue(Parent,EM_RoleValue_Register9,3)
			break
		end
		sleep(10)
	end
end

function kg_105039_BossAI()
--EM_RoleValue_Register1 中控器ID
--EM_RoleValue_Register2 小花計量器
--EM_RoleValue_Register3 中控器的ParentID

	local timer =0
	local EnterFight = 0
	local ALL = 496771	--心靈鎮壓
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 , 0 )	--設定小花計量器的初始值為0
	
	while 1 do
		if KS_InCombat(OwnerID())==true then
			if EnterFight == 0 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_105039_03]" , 1 )
				--嗯哼！？你們這些醜陋又卑劣的殘兵竟能來到這裡？
				EnterFight = 1
			end
			
			if timer>1 and timer%7==0 then		--女力+狂花之戀(心有所屬)
				kg_105039_WorldSkill()
			end
			if timer>1 and timer%18==0 then	--飄香(空動作)
				kg_105039_FinalCounter()
			end
			if timer>1 and timer%25==0	--百花撩亂(生小花)
			 and ReadRoleValue( OwnerID() , EM_RoleValue_Register2)<20 
			 and (ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))*100<60 then	
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register2)<0 then	--假如小花計數器小於零，則歸零
				 	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 , 0 )
				 end
				 ScriptMessage( OwnerID() , -1 , 2 , "[SC_105039_01]" , 1 )
				 -----------我可愛的兒女們，來吧! 為我奉獻你們的精力!
				kg_105039_04()
			end
			if timer>1 and timer%30==0  then	--花枝招展
				kg_105039_ShareCounter()
			end
			if timer>1 and timer%37==0 then	--心靈鎮壓
				SysCastSpellLv( OwnerID(), OwnerID() , ALL , 2 )
			end
			
			timer = timer +1
		else
			EnterFight = 0
			timer =0
		end
		sleep(10)
	end
end

function kg_105039_WorldSkill()		---RAND
	local Skill = { 496765 , 496766 }		---女力，狂花之戀(心有所屬)
	local SkillLv = { 40 , 53 }			---(500+500*11)*0.78=4680 , (500*55)=27500 , DOT(100*55)=5500
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())
	local BossTarget
	local SkillIndex
	---local TargetTable = {}
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1	--隨機抓仇恨表內的玩家
		BossTarget = PlayerInHate[RandTarget1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2		
		for m=1 , table.getn(PlayerInHate) do
			local temp2 = PlayerInHate[m]			 
			if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM排除
			 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp2 				--找到的玩家放進TABLE
			end	
		end
		--Say(OwnerID() , "Before ="..table.getn(LuckyPlayer))
		if table.getn(LuckyPlayer) >= 5 then							------大於5人就rand 5個
			for n=1 , 5 do						
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1						--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say(OwnerID() , "After ="..table.getn(LuckyPlayer))
			end	
		else													-------5人以下就全中
			for p=1 , table.getn(LuckyPlayer) do				
				if ( LuckyPlayer[p] ~= nil ) and ( ReadRoleValue( LuckyPlayer[p] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[p] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end
	--Say( OwnerID() , "Nice Good job!!" )	
end


function kg_105039_Sasa_FinalCounter()				--------香水有毒檢查倒數
	local Pos = Lua_BuffPosSearch( OwnerID() , 508403 )		--檢查
	local Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
	
	if CheckBuff( OwnerID() , 508402 ) == false and Time > 2 then			--連續產生
		CancelBuff( OwnerID() , 508403 )
	elseif CheckBuff( OwnerID() , 508402 ) == false and Time <= 2 then		
		SysCastSpellLv( OwnerID() , OwnerID() , 496769 , 0 )	--倒數確認，施放飄香(10%/20%)=30% , DOT(100/50%)=600
		CancelBuff( OwnerID() , 508403 )
	end	
end

function kg_105039_FinalCounter()
					local Final = 496767							--飄香(空動作)
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort( OwnerID() )
					--sleep(10)
					--Say(OwnerID() , "FinalCounter ="..FinalCounter)
					local LuckyFarmer = {}				--播種農夫X5					
					--local Farmer = {}				--農夫們
					for i=1 , table.getn(PlayerInHate1) do
						local temp2 = PlayerInHate1[i]			 
						if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM排除
						 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0       	--死人排除
						 and GetDistance( temp2 , OwnerID() ) <= 600 then				--距離600以內
							LuckyFarmer[table.getn(LuckyFarmer)+1] = temp2 				--找到的玩家放進TABLE
						end	
					end
					--Say(OwnerID() , "FarmerCounter ="..table.getn(LuckyFarmer))
					if table.getn(LuckyFarmer) >= 5 then							------大於5人就rand 5個
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--就是你了，親愛的，替[104666]好好地散發魅力激素吧！
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--飄香(空動作)
						sleep(15)
						for j=1 , 5 do						
							local Lucky2 = Rand(table.getn(LuckyFarmer))+1						--RAND到的數字	
							if ( LuckyFarmer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyFarmer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "LuckyFarmer ="..LuckyFarmer[Lucky2] )
								AddBuff( LuckyFarmer[Lucky2] , 508402 , 0 , 5 )	--香水有毒 : 單純的dubuff，無任何效果，只會倒數5秒
								AddBuff( LuckyFarmer[Lucky2] , 508403 , 0 , 7 )	--檢查倒數 : 持續7秒，每一秒產生香水有毒劇情，對自己施展，會執行sasa_FinalCounter					
							end
							table.remove(LuckyFarmer , Lucky2)
							sleep(1)														
						end	
					else													-------5人以下就全中
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--就是你了，親愛的，替[104666]好好地散發魅力激素吧！
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--飄香(空動作)
						sleep(15)
						for l=1 , table.getn(LuckyFarmer) do	
							--Say(OwnerID() , "LuckyFarmer = "..GetName(LuckyFarmer[l]))
							if ( LuckyFarmer[l] ~= nil ) and ( ReadRoleValue( LuckyFarmer[l] , EM_RoleValue_IsDead ) == 0 ) then
								AddBuff( LuckyFarmer[l] , 508402 , 0 , 5 )	--香水有毒
								AddBuff( LuckyFarmer[l] , 508403 , 0 , 7 )	--檢查倒數									
							end
							sleep(1)
						end
					end

end

function kg_105039_ShareCounter()
					local Share = 496770							--花枝招展
					local PlayerInHate2 = {}
					PlayerInHate2 = star_HateListSort( OwnerID() )	--只搜尋仇恨玩家的Gid
					local RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
					while 1 do
						sleep(1)
						if ReadRoleValue( RandTarget1 , EM_RoleValue_Voc ) == 0 then	--職業非GM
							for ii=1 , table.getn(PlayerInHate2) do
								if RandTarget1 == PlayerInHate2[ii] then
									table.remove( PlayerInHate2 , ii )	
									break	
								end	
							end
							sleep(5)	
							RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
							--Say(OwnerID() , "HateCount ="..table.getn(PlayerInHate2) )	
						else
							break
						end	
					end	
					local PlayerName = GetName( RandTarget1 )
					local MessageString = "[SC_104666_02][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
					ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
					--[$VAR1]，讓我試試你有多少能耐！
					sleep(30)
					local SharedPlayer = {}
					local TempShare = {}
					SharedPlayer = SearchRangePlayer( RandTarget1 , 80 )
					for m=0 , table.getn(SharedPlayer)-1 do							
						if ReadRoleValue( SharedPlayer[m] , EM_RoleValue_Voc ) ~= 0 				--GM排除
						 and GetDistance( SharedPlayer[m] , OwnerID() ) <= 600
						 and SharedPlayer[m] ~= nil												
						 and ReadRoleValue( SharedPlayer[m] , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							TempShare[table.getn(TempShare)+1] = SharedPlayer[m]
							--table.remove( SharedPlayer , m )
						end
					end	
					local TotalDamage = 240000						--分擔數字
					local PLV = math.floor( TotalDamage/(table.getn(TempShare)*100) )					
					CastSpellLv( OwnerID() , RandTarget1 , Share , PLV )
					--for ii=1 , table.getn(TempShare) do
						--Say( OwnerID() , GetName(TempShare[ii]) )
					--end
					sleep(40)

end



function kg_105039_BossDead()
	local Parent = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_104666_04]" , 1 )	--美麗的…花朵…，終將…凋…謝…
	WriteRoleValue(Parent,EM_RoleValue_Register9,3)
	--DebugMsg(0,0,"Boss is Dead!!!")
end

function kg_105039_04()	--百花撩亂(生小花)
	local Boss=OwnerID()
	local FlowerCount=ReadRoleValue(Boss,EM_RoleValue_Register2)	--取得當前的小花數量
	local FlowerMaxCount=20	--小花可產生的最大數量
	local FlowerID=117116	--小花的物件編號
	local Flower	--小花的GitemID
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local HP=ReadRoleValue(Boss,EM_RoleValue_HP)
	local MaxHP=ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local HPP=(HP/MaxHP)*100	--血量百分比
	if HPP<60 and KS_InCombat(Boss)==true and FlowerCount<FlowerMaxCount then	--HP低於60%且戰鬥中且場上的花還沒到上限
		local Max = math.random(3,5)	--每次產生的小花數量上限
		if Max+FlowerCount>FlowerMaxCount then
			Max=FlowerMaxCount-FlowerCount
			DebugMsg(0,0,"Max= "..Max)
		end
		for i=1,Max do	--隨機產生小花
			Sleep(1)
			FlowerCount=FlowerCount+1
			WriteRoleValue(Boss,EM_RoleValue_Register2,FlowerCount)
			Flower =  LuaFunc_CreateObjByObj(FlowerID,Boss)
			WriteRoleValue(Flower,EM_RoleValue_Register3,Boss)	--將BossGID放在小花的口袋3
			SetModeEx( Flower , EM_SetModeType_HideName, false)	---物件頭上是否顯示名稱
			SetModeEx( Flower , EM_SetModeType_Move, false) ---移動
			SetModeEx( Flower , EM_SetModeType_Revive, false)	--可重生
			ks_RandRangeSetPos(Flower,Boss,nil,100)	--在100碼內隨機設定位置
			AdjustDir(Flower,math.random(-180,180))	--隨機轉向
			AddToPartition(Flower,RoomID)
			BeginPlot(Flower,"kg_105039_05",0)
			DebugMsg(0,0,"There are "..FlowerCount.." flowers")
		end
	end

end