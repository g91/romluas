function Lua_Hao_ClickFunGo_Test_DelOBJ()

	local NPC = { 101553 , 101554 , 112068 , 112067 }	-- 命運的阻礙者、厄運召喚者、寶箱怪
	local Target = {}
	local Count = 0

	for i = 1 , table.getn(NPC) , 1 do
		Lua_Hao_NPCofAll_Clear(NPC[i])
	end
end
------------------------------------------------------------------------------2011.06.13 修正遊戲進行中關掉重登及卡點回報時，若使用公會校場重置卷，進入後會看到兩隻NPC的問題
function Lua_Hao_ClickFunGo_DelObj( Player , Range )

	local NPC = { 101553 , 101554 , 112068 }	-- 命運的阻礙者、厄運召喚者、寶箱怪
	local Target = {}

	while true do
		if CheckID(Player) == false then	-- 如果玩家不在此區域
			DelObj( OwnerID() )
			break
		elseif CheckDistance( OwnerID() , Player , Range ) == false then	-- 如果玩家不在此校場範圍內
			BeginPlot( Player , "Lua_Clockending" , 0 )
			BeginPlot( Player , "LuaYU_ClickFunGo_06" , 0 )


			local Boxdel = LuaFunc_SearchNPCbyOrgID( OwnerID(), 112068, 300 , 1)       --刪掉所有箱子

			if CheckID(Boxdel[0]) == true then
				for i = 0 , table.getn(Boxdel) do

					Delobj(Boxdel[i])
				end
			end

			sleep(10)

			local BoxMonster = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101553, 300 , 1)       --刪掉所有寶箱怪

			if CheckID(BoxMonster[0]) == true then
				for i = 0 , table.getn(BoxMonster) do

					Delobj(BoxMonster[i])
				end
			end

			local BoxMboss = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101554, 300 , 1)       --刪掉所有厄運BOSS

			if CheckID(BoxMboss[0]) == true then
				for i = 0 , table.getn(BoxMboss) do

					Delobj(BoxMboss[i])
				end
			end

			sleep(5)
			DelObj( OwnerID() )
			break
		end
		sleep(10)
	end
end
------------------------------------------------------------------------------
function LuaYU_ClickFunGo_Start()

	SetPlot( OwnerID() , "range" , "LuaYU_ClickFunGo_Start_1" , 300 )
	
end

function LuaYU_ClickFunGo_Start_1()
------------------------------------------------------------------------------2011.06.13 修正遊戲進行中關掉重登及卡點回報時，若使用公會校場重置卷，進入後會看到兩隻NPC的問題
	CallPlot( TargetID() , "Lua_Hao_ClickFunGo_DelObj" , OwnerID() , 500 )
------------------------------------------------------------------------------
	Sleep(20)
	--Say(TargetID(), "[SC_CLICKFUNGO01]")
	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_CLICKFUNGO01]".. "|r" , 0 )
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_CLICKFUNGO01]".. "|r" , 0 )  
	PlayMotion( TargetID(), 116) 
	Sleep(10)
	PlayMotion( TargetID(), 112) 
	Sleep(10)
	PlayMotion( TargetID(), 123) 
end

function LuaYU_ClickFunGo_00()

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	--Say(TargetID(), "Welcome! Welcome!")
	local ChangeGift = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) 
	
		if ChangeGift == 0 then

			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO01]"  ) --你好，我是校場訓練課程：『命運好好玩』的管理員XXX，請問有什麼事情嗎？
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO02]"  , "LuaYU_ClickFunGo_01", 0 )--課程規則說明
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO03]"  , "LuaYU_ClickFunGo_02", 0 )--進行『命運好好玩』
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaYU_ClickFunGo_leave_0", 0 )--離開校場

		elseif ChangeGift == 168 then

			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO07]"  ) --從課程中獲得的<CB>[205017]</CB>與<CB>[205018]</CB>可兌換獎勵禮品，其中<CB>[205017]</CB>若離開校場前沒有兌換完畢將<CS>全部消失</CS>，請特別注意！
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO24]"  , "LuaYU_ClickFunGo_Gift_1", 0 )--兌換獎勵
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaYU_ClickFunGo_leave_0", 0 )--離開校場

		end


end

--以下開始遊戲------------************************************--------------------------
function LuaYU_ClickFunGo_01()

		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID(), 112) 
		SetSpeakDetail(  OwnerID(), " [SC_CLICKFUNGO08] "  ) 

--『命運好好玩』課程注意事項，
	--1.遊戲時間5分鐘。
	--2.10回合內每回合出現數量不同的寶箱，開中正確的[112068]將獲得<CB>獎勵勳章</CB>。
	--3.獎勵勳章分為<CB>[205017]</CB>與<CB>[205018]</CB>在遊戲結束後將可兌換獎勵禮品。

--另外，在遊戲過程中我也會給予相對的提示協助，請特別注意，祝您好運！

		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_00", 0 )--回上一頁

end

function LuaYU_ClickFunGo_02()--開始遊戲 玩家紀錄活動NPC

	CloseSpeak( OwnerID() ) 
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	BeginPlot( OwnerID() , "LuaYU_ClickFunGo_03" , 0 )

	SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--標記

	Hide(TargetID())
	Show(TargetID() , RoomID )
	WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  TargetID() ) 

end

function LuaYU_ClickFunGo_03() 

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 

	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+7 ,  0 ) --命運獎章
	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+8 ,  0 ) --幸運獎章

	SetModeEx( Manager  , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Manager  , EM_SetModeType_Fight , true )--可砍殺攻擊

	Hide(Manager)
	Show(Manager, RoomID)

				

	local MissionNow= {		1,		--目前進行回合數
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9,
				10
					}

	local BoxCount= {		2,		--對應之寶箱數
				2,
				3,
				3,
				4,
				4,
				5,
				6,
				7,
				8
					}



	sleep(10)
	LuaDan_HitShrew_CheckOK(5,5,0)--倒數五秒進行
	sleep(30)
	AdjustFaceDir( Manager, OwnerID() , 0 ) --面向
	sleep(10)
	PlayMotion( Manager, 111) 
	sleep(10)
	ClockOpen( OwnerID() ,EM_ClockCheckValue_4,300,300,0,"Lua_Clockending","LuaYU_ClickFunGo_06") --倒數計時器 (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_CLICKFUNGO09]".. "|r" , 0 ) 
	Say(Manager,"[SC_CLICKFUNGO09]")
	PlayMotion( Manager, 115) 


	while true do

		sleep(10)

		local BoxNo = ReadRoleValue( Manager , EM_RoleValue_PID  ) --判斷目前第幾回合 
		local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --完成回合數

	--	local Token = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+7  ) --命運徽章
	--	local LuckyToken = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+8  ) --幸運徽章

		if MissionOK ==  10 then
			Callplot(OwnerID(), "LuaYU_ClickFunGo_03_1", 0 )
			break

		elseif MissionOK ==  BoxNo then --表示關卡完成，進行下一關


			local Boxdel = LuaFunc_SearchNPCbyOrgID( Manager, 112068, 300 , 1)       --刪掉所有箱子

			if CheckID(Boxdel[0]) == true then
				for i = 0 , table.getn(Boxdel) do

					SetPlot( Boxdel[i] ,"touch",  "" , 0 )   
					Delobj(Boxdel[i])
				end
			end

			local BoxMonster = LuaFunc_SearchNPCbyOrgID( Manager, 101553, 300 , 1)       --刪掉所有箱子

			if CheckID(BoxMonster[0]) == true then
				for i = 0 , table.getn(BoxMonster) do

					Delobj(BoxMonster[i])
				end
			end

			BoxNo = BoxNo+1
			WriteRoleValue(  Manager  , EM_RoleValue_PID ,  BoxNo ) --下一關

			local CCCBOX = {}
			if BoxNo == 10 then 
				PlayMotion( Manager, 109) 
				Say(Manager,"[SC_CLICKFUNGO10]".."[SC_CLICKFUNGO40]")--下一回合開始吧！

			else
				PlayMotion( Manager, 109) 
				Say(Manager,"[SC_CLICKFUNGO10]"..BoxNo)--下一回合開始吧！
			end

			sleep(10)

			for q = 1 ,8 do  --產生寶箱
				CCCBOX[q] = CreateObjByFlag( 112068, 780308 , q , 1 );
				WriteRoleValue(  CCCBOX[q]  , EM_RoleValue_PID ,  Manager ) 
			end
				
			local Boxtotal = 0 --應出寶箱總數量


			for i = 1 , table.getn(MissionNow) do

				if BoxNo == MissionNow[i] then   --哪一回合
					Boxtotal = BoxCount[i]   --出多少量的箱子
				end
			end

		--以下隨機判斷產生寶箱位置
			local floorX={}
			for i= 1,table.getn(CCCBOX) do
				floorX[i]=CCCBOX[i]
			end


			sleep(10)


			local Y={}

			for i=1 , Boxtotal do
				local W = rand(table.getn(floorX)) +1   -- 矩陣隨機取樣，+1暗指從1開始。
				Y[i] = floorX[W]
				table.remove(floorX,W)
			end
			sleep(10)
	
			for i=1, 1 do
				local RoomID = ReadRoleValue( Manager ,EM_RoleValue_RoomID) 

				SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_01" , 10 )   
		--		Show( Y[i] , RoomID )
				AddToPartition( Y[i] , RoomID )  
				Hide( Y[i]  )
				Show( Y[i]  , RoomID)
				--Say( Y[i] , "HERE")
			end

			for i=2, Boxtotal do

					local P = 100
					local XX = DW_Rand( P )     
								
					if XX > 95 and XX <= 100 then   --5%    厄運BOSS   Game Over

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_02" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)

					elseif XX > 75 and XX <= 95 then   --20%    命運遙控器    加速

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_03" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					elseif XX > 55 and XX <= 75 then   --20%    命運遙控器    減速

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_04" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					elseif XX > 40 and XX <= 55 then   --15%    命運遙控器    停止

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_05" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					elseif XX > 20 and XX <= 40 then   --20%    命運阻礙者    嚇一跳

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_06" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					else --20%    命運阻礙者    干擾

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_07" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)
					end
			end
		end
	end
end

function LuaYU_ClickFunGo_03_1()
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	local Token = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+7  ) --命運徽章
	local LuckyToken = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+8  ) --幸運徽章

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CLICKFUNGO11]"..Token.." ".."[SC_CLICKFUNGO12]"..LuckyToken , 1 ) --遊戲結束，本次共獲得<CB>[205017]</CB>：
	Say(Manager,"[SC_CLICKFUNGO11]"..Token.." ".."[SC_CLICKFUNGO12]"..LuckyToken )		

	PlayMotion( Manager, 111) 

	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )  	--關閉計時器

	local Boxdel = LuaFunc_SearchNPCbyOrgID( Manager, 112068, 300 , 1)       --刪掉所有箱子

	if CheckID(Boxdel[0]) == true then
		for i = 0 , table.getn(Boxdel) do
			Delobj(Boxdel[i])
		end
	end

	local BoxMonster = LuaFunc_SearchNPCbyOrgID( Manager, 101553, 300 , 1)       --刪掉所有寶箱怪

	if CheckID(BoxMonster[0]) == true then
		for i = 0 , table.getn(BoxMonster) do
			Delobj(BoxMonster[i])
		end
	end

	local BoxMboss = LuaFunc_SearchNPCbyOrgID( Manager, 101554, 300 , 1)       --刪掉所有厄運BOSS

	if CheckID(BoxMboss[0]) == true then
		for i = 0 , table.getn(BoxMboss) do
			Delobj(BoxMboss[i])
		end
	end

	SetModeEx( Manager   , EM_SetModeType_Mark, true )--標記
	Hide( Manager )
	Show( Manager , RoomID )

	WriteRoleValue(  Manager  , EM_RoleValue_PID ,  168 ) 

	if Token > 0 or LuckyToken > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CLICKFUNGO23]" , 1 ) --來換獎
		Say(Manager,"[SC_CLICKFUNGO23]")		
		PlayMotion( Manager, 116) 
	end

	FN_GuildGame_Honor( OwnerID(), 100 )
end


function LuaYU_ClickFunGo_04()--換獎品

	SetSpeakDetail(  OwnerID(), " Exchange gifts "  ) 
	AddSpeakOption( OwnerID(), TargetID( ), "The rule of ClickFunGo."  , "LuaYU_ClickFunGo_01", 0 )

end

function LuaYU_ClickFunGo_05()--寶箱怪殺手

--	WriteRoleValue( OwnerID()  ,EM_RoleValue_IsWalk , 1 )

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	while true do
		sleep(10)

		local Attacking = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local BoxMonster = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101553, 50 , 1)       --寶箱怪

		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --完成回合數

		if Attacking == 0 then
			if CheckID(BoxMonster[0])== true then

				Say( OwnerID(), "[SC_CLICKFUNGO22]" ) --幫忙

				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, true )--索敵
				Hide(OwnerID())
				Show(OwnerID(), RoomID)

				SetModeEx( BoxMonster[0] , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( BoxMonster[0] , EM_SetModeType_Revive , false )--可重生
				Hide(BoxMonster[0])
				Show(BoxMonster[0], RoomID)

				local BoxMonster = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101553, 50 , 1)       --寶箱怪

				SetAttack( OwnerID() , BoxMonster[0] )
				WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  1 ) --戰鬥中
				WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+1,  BoxMonster[0] ) --戰鬥中	

			end

		elseif Attacking == 1 then
			if CheckID(AttackTarget)== false then	

				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--索敵
				Hide(OwnerID())
				Show(OwnerID(), RoomID)

				WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  0 ) --戰鬥中

			end
		end
	end

end

function LuaYU_ClickFunGo_06()--寶箱怪殺手

	local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --教官

	WriteRoleValue(  Manager  , EM_RoleValue_Register+1 ,  10 ) 
end





function LuaYU_ClickFunGo_leave_0()--離開校場

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章
			
		if Token > 0 then
			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO05]"  ) --您尚有未兌換的<CB>[205017]</CB>，若離開校場將<CS>全部消失</CS>，您確定嗎？
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]"  , "LuaYU_ClickFunGo_leave_1", 0 )--確定
		else
			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO06]"  ) --您確定要離開校場訓練課程：『命運好好玩』嗎？
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]"   , "LuaYU_ClickFunGo_leave_1", 0 )--確定
		end

end

function LuaYU_ClickFunGo_leave_1()--離開訓練場

	CloseSpeak( OwnerID() ) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	DelObj( TargetID() )	 	--	2010/12/08 修正遊戲完成後，若使用公會校場重置卷，進入後會看到兩隻NPC的問題。

end


--以下開始    獎勵兌換------------************************************--------------------------

function LuaYU_ClickFunGo_Gift_1()--兌換獎勵

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章
	local LuckyToken =  CountBodyItem( OwnerID() , 205018 )  --幸運徽章


	SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO25]".."     ".."[SC_CLICKFUNGO36]"..Token.." ".."[SC_CLICKFUNGO12]"..LuckyToken  ) --兌換明細
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO26]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--命運幣兌換獎勵
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO27]"  , "LuaYU_ClickFunGo_Gift_3", 0 )--幸運幣兌換獎勵

end

function LuaYU_ClickFunGo_Gift_2()--命運幣兌換獎勵

	SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO23]"  )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO28]"  , "LuaYU_Click_GiftExchange_01", 0 )--命運遙控器
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO29]"  , "LuaYU_Click_GiftExchange_02", 0 )--幸運藥劑
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO30]"  , "LuaYU_Click_GiftExchange_03", 0 )--大天使嘆息	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO31]"  , "LuaYU_Click_GiftExchange_04", 0 )--再玩一次	

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO32]"  , "LuaYU_Click_GiftExchange_05", 0 )--必爾汀神奇水60%	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO33]"  , "LuaYU_Click_GiftExchange_06", 0 )--必爾汀魔力藥水50%	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO34]"  , "LuaYU_Click_GiftExchange_07", 0 )--必爾汀生命藥水50%	

end

function LuaYU_ClickFunGo_Gift_3()--幸運幣兌換獎勵

	SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO23]"  )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO35]"  , "LuaYU_Click_GiftExchange_08", 0 )--命運遙控器
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO41]"  , "LuaYU_Click_GiftExchange_09", 0 )--命運遙控器
end


function LuaYU_Click_GiftExchange_01()--命運遙控器兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 30 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 205019 , 1 );  
			DelBodyItem( OwnerID() , 205017 , 30 )	
			PlayMotion( TargetID(), 111) 
		end

	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	
	end	

end

function LuaYU_Click_GiftExchange_02()--幸運藥劑兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 25 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 202322 , 1 );  
			DelBodyItem( OwnerID() , 205017 , 25 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	

	end	

end

function LuaYU_Click_GiftExchange_03()--大天使嘆息兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 20 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 201139 , 1 );  
			DelBodyItem( OwnerID() , 205017 , 20 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	
	end	

end

function LuaYU_Click_GiftExchange_04()--再玩一次兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 15 then

		DelBodyItem( OwnerID() , 205017 , 15 )	
		PlayMotion( TargetID(), 111) 

		CloseSpeak( OwnerID() ) 
		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

		WriteRoleValue(  TargetID()  , EM_RoleValue_PID ,  0 ) 
		WriteRoleValue(  TargetID()  , EM_RoleValue_Register+1  ,  0 ) 

		BeginPlot( OwnerID() , "LuaYU_ClickFunGo_03" , 0 )

		SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--標記

		Hide(TargetID())
		Show(TargetID() , RoomID )
	
		WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  TargetID() ) 


	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	
	end		

end

function LuaYU_Click_GiftExchange_05()--必爾汀神奇水60%兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 10 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 203493 , 3 );  
			DelBodyItem( OwnerID() , 205017 , 10 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	
	end	

end

function LuaYU_Click_GiftExchange_06()--必爾汀魔力藥水50%兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 4 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 203497 , 2 );  
			DelBodyItem( OwnerID() , 205017 , 4 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	
	end	

end

function LuaYU_Click_GiftExchange_07()--必爾汀生命藥水50%兌換

	local Token =  CountBodyItem( OwnerID() , 205017 )  --命運徽章

	if Token >= 4 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 203502 , 2 );  
			DelBodyItem( OwnerID() , 205017 , 4 )	
			PlayMotion( TargetID(), 111) 
		end
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--上一頁

	
	end		

end

function LuaYU_Click_GiftExchange_08()--兌換命運遙控

	local LuckyToken =  CountBodyItem( OwnerID() , 205018 )  --幸運徽章

	if LuckyToken >= 50 then
---------------------------------------2011.07.06 修改命運指環掉落數量-----------------------------------------
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
			GiveBodyItem( OwnerID() , 205019 , 1 )
			DelBodyItem( OwnerID() , 205018 , 50 )	
			PlayMotion( TargetID(), 111) 
		end
-----------------------------------------------------------------------------------------------------------------------
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_3", 0 )--上一頁

	
	end	

end

function LuaYU_Click_GiftExchange_09()--兌換魔物精華

	local LuckyToken =  CountBodyItem( OwnerID() , 205018 )  --幸運徽章

	if LuckyToken >= 20 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 202916 , 1 );  
			DelBodyItem( OwnerID() , 205018 , 20 )	
			PlayMotion( TargetID(), 111) 
		end
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --不足
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_3", 0 )--上一頁

	
	end	

end