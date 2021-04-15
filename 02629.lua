--Z23_05劍塚主線 與摩瑞克會合-
function Dy_Z23_S01fight()
	Z23_DeMagicCavy_00()
	local black = 106676 --黑曜石精銳
	local nakui = 106617 --拿酷伊精英
	local s1 = {"[SC_Q425210_S01_01]","[SC_Q425210_S01_02]","[SC_Q425210_S01_03]"}
	local s2 = {"[SC_Q425210_S01_11]","[SC_Q425210_S01_12]","[SC_Q425210_S01_13]"}
	local RoomID = ReadRoleValue(TargetID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(TargetID() , EM_RoleValue_X)
	local Y = ReadRoleValue(TargetID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(TargetID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(TargetID() , EM_RoleValue_Dir)	
	local Pos = Lua_BuffPosSearch( TargetID() , 622104 )                      ---------------------抓出身上的法術代號
	local PLV = BuffInfo( TargetID() , Pos , EM_BuffInfoType_Power )			 -------------------------此法術的等級
	SetPlot( OwnerID(),"dead","Dy_Z23_Ndead",10 )---- 死亡劇情
	LoadQuestOption(TargetID()) 
	if CheckAcceptQuest(TargetID(), 425214  )  == true then
		if PLV <  2 then
			--say(TargetID() , "PLV = "..PLV)
			local bk1 = CreateObj ( black , X+30 , Y , Z+30  , Dir , 1) 
			SetModeEx( bk1  ,EM_SetModeType_Show, true )--顯示*
			SetModeEx( bk1  ,EM_SetModeType_Searchenemy , true ) --索敵*
			SetModeEx( bk1  ,EM_SetModeType_Save , true ) --儲存*
			SetModeEx( bk1  ,EM_SetModeType_Revive , false ) --重生*
			SetModeEx( bk1  ,EM_SetModeType_Obstruct , false )--阻擋*
			SetModeEx( bk1  ,EM_SetModeType_Strikback , true ) --反擊*
			SetModeEx( bk1  ,EM_SetModeType_Fight , true ) --砍殺*
			SetModeEx( bk1  ,EM_SetModeType_Gravity , true ) --重力*	
			SetModeEx( bk1  ,EM_SetModeType_Move , true ) --移動*
			SetModeEx( bk1  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
			SetModeEx( bk1  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
			SetModeEx( bk1  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
			AddToPartition( bk1, RoomID)	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , bk1) --存到怪的容器1裡面
			WriteRoleValue( bk1 , EM_RoleValue_Register1 , OwnerID())
			local bk2 = CreateObj ( black , X-30 , Y , Z-30  , Dir , 1)
			SetModeEx( bk2  ,EM_SetModeType_Show, true )--顯示*
			SetModeEx( bk2  ,EM_SetModeType_Searchenemy , true ) --索敵*
			SetModeEx( bk2  ,EM_SetModeType_Save , false ) --儲存*
			SetModeEx( bk2  ,EM_SetModeType_Revive , false ) --重生*
			SetModeEx( bk2  ,EM_SetModeType_Obstruct , false )--阻擋*
			SetModeEx( bk2  ,EM_SetModeType_Strikback , true ) --反擊*
			SetModeEx( bk2  ,EM_SetModeType_Fight , true ) --砍殺*
			SetModeEx( bk2  ,EM_SetModeType_Gravity , true ) --重力*	
			SetModeEx( bk2  ,EM_SetModeType_Move , true ) --移動*
			SetModeEx( bk2  ,EM_SetModeType_ShowRoleHead , false ) --頭像框*
			SetModeEx( bk2  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
			SetModeEx( bk2  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
			AddToPartition( bk2, RoomID)
			WriteRoleValue( OwnerID() , EM_RoleValue_Register2 , bk2) -- 存到怪的容器2裡面
			WriteRoleValue( bk2 , EM_RoleValue_Register2 , OwnerID())
			
			--出現精英!
			if CheckBuff (TargetID() , 622104) == false and PLV == 0 then --失敗1次的喊話 
				say ( bk1 , s1[1])
				say ( bk2 , s2[1])
				AddBuff( TargetID() , 622104 , 0 ,-1) --失敗計次BUFF	
			elseif CheckBuff (TargetID() , 622104) == true and PLV == 0  then --失敗2次的喊話
				say ( bk1 , s1[2])
				say ( bk2 , s2[2])	
				AddBuff( TargetID() , 622104 , 0 ,-1) --失敗計次BUFF
			elseif CheckBuff (TargetID() , 622104) == true and PLV == 1 then --3次生精英
				say ( bk1 , s1[3])
				say ( bk2 , s2[3])
				local M3 = CreateObj ( nakui , X , Y , Z  , Dir , 1)
				SetModeEx( M3  ,EM_SetModeType_Show, true )--顯示*
				SetModeEx( M3  ,EM_SetModeType_Searchenemy , true ) --索敵*
				SetModeEx( M3  ,EM_SetModeType_Save , false ) --儲存*
				SetModeEx( M3  ,EM_SetModeType_Revive , false ) --重生*
				SetModeEx( M3  ,EM_SetModeType_Obstruct , false )--阻擋*
				SetModeEx( M3  ,EM_SetModeType_Strikback , true ) --反擊*
				SetModeEx( M3  ,EM_SetModeType_Fight , true ) --砍殺*
				SetModeEx( M3  ,EM_SetModeType_Gravity , true ) --重力*	
				SetModeEx( M3  ,EM_SetModeType_Move , true ) --移動*
				SetModeEx( M3  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
				SetModeEx( M3  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
				SetModeEx( M3  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
				AddToPartition( M3, RoomID)
				BeginPlot( M3, "Dy_Z23_M3die", 10) 
				CancelBuff	(TargetID() , 622104)
				--AddBuff( M3 , 622207 , 0 ,-1) --變大隻w
				SetAttack(bk1 , M3 )
				SetAttack(bk2 , M3 )
			end
			
			sysCastSpellLv	( bk1,  OwnerID() , 850031 , 0 ) ---自己吸引黑曜石精銳的注意
			sysCastSpellLv	( bk2,  OwnerID() , 850031 , 0 )

			
			sleep(10)
			SetAttack( bk1 , OwnerID() ) --叫黑曜石精銳打自己
			SetAttack( bk2 , OwnerID() ) 
		end
	end
end
--黑曜石傭兵與改造受部分
function Dy_Z23_Ndead ()
	local bk1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) 
	local bk2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 ) 
	if CheckID( bk1 ) == true then
		DelObj(bk1)
	end
	if CheckID( bk2 ) == true then
		DelObj(bk2)
	end	
end
--新的精英部分
function Dy_Z23_M3die () --5分鐘後消失
	local count = 0
	while 1 do
		sleep(10)
		count = count +1
		--say (OwnerID() , "d = "..count)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --讀正在攻擊的目標
		if count > 300 and AttackTarget == 0  and ( CheckID( OwnerID() ) ) == true then
			DelObj(OwnerID())
		end
	end
end
--摩瑞克部分
function Dy_Z23_Mgivecheck()
	setplot(OwnerID(),"range","Dy_Z23_Mgive",100 ) 
end
function Dy_z23_Mchat()
	local num=0
	local npc= SearchRangeNPC( OwnerID(), 100 )
	for i=0,table.getn(npc) do
		if ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106611 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106612 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106613 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106614 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106617 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106620 then
			num=num+1
		end
	end
	if num==0 then
		LoadQuestOption(OwnerID())
		SetSpeakDetail( TargetID(), "[SC_Q425210_M01]" )
	else	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_NPC120275_00]", C_SYSTEM )--附近有可疑的敵人，摩瑞克暫時無法給你更進一步的消息！
		SetSpeakDetail( TargetID(), "[SC_Q425210_M02]" )
		BeginPlot( TargetID() , "Dy_Z23_chat02" , 20 )
	end
end
function Dy_Z23_chat02()
	CloseSpeak( TargetID() )
end
function Dy_Z23_Mgive()
	--say (OwnerID() , "2") --Player
	--say (TargetID() , "Target") --NPC
	if CheckFlag( OwnerID() , 546197 ) == true then
		GiveBodyItem( OwnerID(), 546198, 1 ) --給予找到摩瑞克的任務條件
		--say (TargetID() , "here")
	end
end
function Dy_Z23_fin()--完成任務變回沒有偽裝的型態
	Lua_ZonePE_3th_GetScore(50)
	GiveBodyItem( TargetID(), 546240, 1 ) --會合後給的重要物品1
	GiveBodyItem( TargetID(), 547007, 1 ) --會合後給的重要物品2
end

---Z23_06 破壞裝置劇情部分
function Dy_Z23_06_CHECK() --使用符文石241226的檢查
	local set = 106810 --裝置的ID
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),425215) == true then --檢查有沒有接任務
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == set then --如果目標是裝置
			if CheckBuff( TargetID() , 622577 ) == false then --檢查身上有沒有燃燒的BUFF	沒有的話
				return true
			elseif CheckBuff( TargetID() , 622577 ) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z23_Q425215_10]" , 0 )  --裝置已被中和
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z23_Q425215_10]" , 0 )				
				return false
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_03]" , 0 )  --目標錯誤
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_03]" , 0 )	
			return false
		end
	end
end function Dy_Z23_06_USE() --使用符文石241226的劇情
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)	
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
		DW_QietKillOne(OwnerID(), 106809  )  -- 偷殺死NPC - 已破壞裝置
		AddBuff( TargetID() , 622577 , 0 , -1) --中和反應
		AddBuff( OwnerID() , 622579 , 0 ,-1) --定身Buff
		DelBodyItem( OwnerID(), 241226, 1 )--刪除翠綠符文石
		DelBodyItem( OwnerID() , 546240 , 1 ) --刪除可以見到沒偽裝的摩瑞克的重要物品1
		GiveBodyItem( OwnerID(), 546520, 1 ) --給予摩瑞克回營地的重要物品
		local show06 = CreateObj ( 106848 , X , Y , Z  , Dir , 1)  --建立中控器06
		SetModeEx( show06  ,EM_SetModeType_Show, true )--顯示*
		SetModeEx( show06  ,EM_SetModeType_Searchenemy , false ) --索敵*
		SetModeEx( show06  ,EM_SetModeType_Save , true ) --儲存*
		SetModeEx( show06  ,EM_SetModeType_Revive , false ) --重生*
		SetModeEx( show06  ,EM_SetModeType_Obstruct , false )--阻擋*
		SetModeEx( show06  ,EM_SetModeType_Strikback , false ) --反擊*
		SetModeEx( show06  ,EM_SetModeType_Fight , false ) --砍殺*
		SetModeEx( show06  ,EM_SetModeType_Gravity , true ) --重力*	
		SetModeEx( show06  ,EM_SetModeType_Move , false ) --移動*
		SetModeEx( show06  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
		SetModeEx( show06  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
		SetModeEx( show06  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
		AddToPartition( show06, RoomID)
		BeginPlot( show06, "Dy_Z23_06_show", 10) 	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register5 , show06) --將中控器存到自己的容器5裡面
		WriteRoleValue( show06 , EM_RoleValue_Register5 , OwnerID()) --將自己存到中控器的容器5裡面	
		WriteRoleValue( TargetID() , EM_RoleValue_Register6 , show06) --將中控器存到目標的容器6裡面
		WriteRoleValue( show06 , EM_RoleValue_Register6 , TargetID()) --將目標存到中控器的容器6裡面			

end

function Dy_Z23_06_show() --表演
	--say (OwnerID() , "111")
	local gill = 120915
	local nakui = 120913 
	local black = 120916
	local namob = 120914
	local namobc = {}
	local blackc = {}
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )  --讀出玩家的ID
	local set = ReadRoleValue( OwnerID() , EM_RoleValue_Register6 ) --讀出裝置的ID
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local XG = {-8044.5 , -8023.6 , -7548.1,703.9}
	local XN = {-7904, -7938.9,-7474.8,842.2}
	local YG = {924.9, 984.1 , 1065.7,-257.2 }
	local YN = {927.4, 983.5, 1066.9 , -240}
	local ZG = {-19736.5, -20316.5, -20335.5,-1056.3}
	local ZN = {-19804.8, -20195.6, -20178.2,-1080}
	local DG = {30, 302.1, 295.4,12.1}
	local DN = {178.6, 136.4, 118.2,178.3}
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
	local Y1 = math.abs(Y - 940)
	local Y2 = math.abs(Y - 990)
	local Y3 = math.abs(Y - 1070)
	local YTEST = math.abs(Y + 256)
	local nakui_c
	local gillc
	--say(set , "PPP")
	if Y1 <= 20 then --在第一區使用的時候
		nakui_c = CreateObj ( nakui , XN[1] , YN[1]+1 , ZN[1]  , DN[1] , 1) 
		Dy_Z23_06SET(nakui_c)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --存到怪的容器1裡面
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[1]+(5*i) , YN[1]+40 , ZN[1]-(3*i)  , DN[1] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --存到怪的容器1裡面
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[1] , YG[1] , ZG[1]  , DG[1] , 1) 
		Dy_Z23_06SET(gillc)	
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --重力*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --存到怪的容器1裡面
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[1]-(5*i) , YG[1] , ZG[1]+(5*i)  , DG[1] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --重力*	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --存到怪的容器1裡面
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		
		say (gillc , "[SC_Z23_Q425215_06]")
	elseif Y2 <= 20 then --第二區
		nakui_c = CreateObj ( nakui , XN[2] , YN[2]+1 , ZN[2]  , DN[2] , 1) 
		Dy_Z23_06SET(nakui_c)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --存到怪的容器1裡面
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[2]+(5*i) , YN[2]+40 , ZN[2]-(5*i)  , DN[2] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --存到怪的容器1裡面
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[2] , YG[2] , ZG[2]  , DG[2] , 1) 
		Dy_Z23_06SET(gillc)
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --重力*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --存到怪的容器1裡面
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[2]-(5*i) , YG[2] , ZG[2]+(5*i)  , DG[2] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --重力*
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --存到怪的容器1裡面
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		
		say (gillc , "[SC_Z23_Q425215_06]")
	elseif Y3 <= 30 then --第三區
		nakui_c = CreateObj ( nakui , XN[3] , YN[3]+1 , ZN[3]  , DN[3] , 1) 
		Dy_Z23_06SET(nakui_c)	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --存到怪的容器1裡面
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[3]+(5*i) , YN[3]+40 , ZN[3]-(5*i)  , DN[3] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --存到怪的容器1裡面
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[3] , YG[3] , ZG[3]  , DG[3] , 1) 
		Dy_Z23_06SET(gillc)	
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --重力*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --存到怪的容器1裡面
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[3]-(5*i) , YG[3] , ZG[3]+(5*i)  , DG[3] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --重力*
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --存到怪的容器1裡面
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		say (gillc , "[SC_Z23_Q425215_06]")	
		
	elseif YTEST <= 30 then --測試區測試
		say (OwnerID() , "111")
		nakui_c = CreateObj ( nakui , XN[4] , YN[4]+40 , ZN[4]  , DN[4] , 1) 
		Dy_Z23_06SET(nakui_c)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --存到怪的容器1裡面
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[4]+(5*i) , YN[4]+40 , ZN[4]-(5*i)  , DN[4] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --存到怪的容器1裡面
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[4] , YG[4] , ZG[4]  , DG[4] , 1) 
		Dy_Z23_06SET(gillc)
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --重力*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --存到怪的容器1裡面
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[4]-(5*i) , YG[4] , ZG[4]+(5*i)  , DG[4] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --重力*
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --存到怪的容器1裡面
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		
		say (gillc , "[SC_Z23_Q425215_06]")		
	end
	
	--開始打鬥
	SetAttack( gillc , nakui_c )
--	debugmsg(0,0,"nakui_c is"..nakui_c)
	SetAttack( nakui_c , gillc )
	SetAttack( blackc[1] , namobc[1] )
	SetAttack( namobc[1] , blackc[1] )
	SetAttack( blackc[2] , namobc[2] )
	SetAttack( namobc[2] , blackc[2] )	
	SetAttack( blackc[3] , namobc[3] )
	SetAttack( namobc[3] , blackc[3] )
	--將NPC都勾上重力
	SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --重力*
	SetModeEx( nakui_c  ,EM_SetModeType_Gravity , true ) --重力*
	for i = 1 , 3 , 1 do
		SetModeEx( namobc[i]  ,EM_SetModeType_Gravity , true ) --重力*
		SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --重力*
	end
	sleep(20)
	say (gillc , "[SC_Z23_Q425215_00]")
	sleep(20)
	say (nakui_c , "[SC_Z23_Q425215_01]")
	sleep(20)
	DelObj ( namobc[1] )
--	sleep (10)
--	Move( blackc[1], X+1 , Y , Z+1 ) 
	sleep(20)
	say (gillc , "[SC_Z23_Q425215_02]")
 
	say (blackc[1] , "[SC_Z23_Q425215_03]" )
	
	--傳送玩家回營地
	sleep (30)
	if CheckID( player ) == true then
		ScriptMessage( player , player , 1 , "[SC_Z23_Q425215_07]" , 2 )  --
		CancelBuff( player , 622579 )
		--SetPos( player, -9409.3 , 932.6, -18310.9 , 121.5 )
		--SetPos( player, 953 , -257.2, -967.7 , 137 )
		SetPosByFlag( player, 781168 , 1 ) 
	else
		
	end

	sleep(20)
	DelObj ( gillc )
	DelObj ( nakui_c )
	DelObj ( blackc[1])
	for i = 2 , 3 , 1 do
		DelObj ( namobc[i] ) 
		DelObj ( blackc[i] )
	end		
	CancelBuff_NoEvent( set, 622577 )  --刪除裝置的燃燒Buff
	DelObj ( OwnerID() )
end
function Dy_Z23_06SET(NPC06) --設定NPC
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	SetModeEx( NPC06  ,EM_SetModeType_Show, true )--顯示*
	SetModeEx( NPC06  ,EM_SetModeType_Searchenemy , false ) --索敵*
	SetModeEx( NPC06  ,EM_SetModeType_Save , false ) --儲存*
	SetModeEx( NPC06  ,EM_SetModeType_Revive , false ) --重生*
	SetModeEx( NPC06  ,EM_SetModeType_Obstruct , false )--阻擋*
	SetModeEx( NPC06  ,EM_SetModeType_Strikback , true ) --反擊*
	SetModeEx( NPC06  ,EM_SetModeType_Fight , true ) --砍殺*
	SetModeEx( NPC06  ,EM_SetModeType_Gravity , false ) --重力*	
	SetModeEx( NPC06  ,EM_SetModeType_Move , true ) --移動*
	SetModeEx( NPC06  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
	SetModeEx( NPC06  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
	SetModeEx( NPC06  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
	AddToPartition( NPC06, RoomID)	
end
function Dy_Z23_06END() --吉兒回營地表演
	Lua_ZonePE_3th_GetScore(150)
	DelBodyItem( OwnerID() , 547007, 1 ) --刪除可以見到沒偽裝的摩瑞克的重要物品2
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID ) 
	local gill06 = CreateObjByFlag( 120857, 781142 , 4 , 1 )--表演用的吉兒艾克辛
	AddBuff( TargetID() , 622578 , 0 , 15) --可以看見吉兒飛回營地
	GiveBodyItem( TargetID(), 546687, 1 ) --給予看得到吉兒的重要物品
	GiveBodyItem( TargetID(), 546520, 1 )
	sleep(10)
	SetModeEx( gill06  ,EM_SetModeType_Show, true )--顯示*
	SetModeEx( gill06  ,EM_SetModeType_Searchenemy , false ) --索敵*
	SetModeEx( gill06  ,EM_SetModeType_Save , false ) --儲存*
	SetModeEx( gill06 ,EM_SetModeType_Revive , false ) --重生*
	SetModeEx( gill06  ,EM_SetModeType_Obstruct , false )--阻擋*
	SetModeEx( gill06  ,EM_SetModeType_Strikback , false ) --反擊*
	SetModeEx( gill06  ,EM_SetModeType_Fight , false ) --砍殺*
	SetModeEx( gill06  ,EM_SetModeType_Gravity , true ) --重力*	
	SetModeEx( gill06  ,EM_SetModeType_Move , true ) --移動*
	SetModeEx( gill06  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
	SetModeEx( gill06  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
	SetModeEx( gill06  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到*
	MoveToFlagEnabled( gill06, true ) --關掉巡邏劇情
	WriteRoleValue(gill06,EM_RoleValue_IsWalk,0) --設定跑步動作 --0為跑步 1為走路
	AddToPartition( gill06, RoomID)	
	LuaFunc_MoveToFlag( gill06, 781142 , 5 ,0 )
	say (gill06 , "[SC_Q425216_00]")
	sleep(20)
	DelObj ( gill06 )
end

--Z23_08 吉兒想念勞勃 對話劇情
function Dy_Z23_Gtalk00 () --任務對話劇情
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),425217) == true and
	CheckScriptFlag( OwnerID(), 546274 )==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_Q0]","Dy_Z23_Gtalk_00", 0 )
	else
	
	end
end
function Dy_Z23_Gtalk_00 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_00]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_01]","Dy_Z23_Gtalk_01", 0 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_02]","Dy_Z23_Gtalk_N", 0 )
end
function Dy_Z23_Gtalk_01 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_10]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_11]","Dy_Z23_Gtalk_02", 0 )
end
function Dy_Z23_Gtalk_N ()
	CloseSpeak( OwnerID() )
end
function Dy_Z23_Gtalk_02 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_20]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_21]","Dy_Z23_Gtalk_03", 0 )
end
function Dy_Z23_Gtalk_03 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_30]")
	GiveBodyItem( OwnerID(), 546274, 1 ) --與吉兒講完話會給的重要物品
end
function Dy_Z23_08show()
	Lua_ZonePE_3th_GetScore(50)
	AddBuff( TargetID() , 622858 , 0 , 18 ) --可以看見士兵通報勞勃有異
	local num=0
	local npc=SearchRangeNPC( OwnerID(), 50 )
	for i=0, table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID) == 106848 then
			num=num+1
		end
	end
	if num==0 then
		local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
		local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
		local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
		local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
		local show08 = CreateObj ( 106848 , X , Y , Z  , Dir , 1)
		CallPlot( show08, "TempControlNpcSetting_00", show08 )
		AddToPartition( show08, 0 )
		CallPlot( show08, "Dy_Z23_Gshow08", OwnerID(), TargetID() )
	end
end
function Dy_Z23_Gshow08 ( Gill, PlayerID )
	local Controller=OwnerID()----標的出中控器
	local Pasofu=0--標的出帕普赫索夫
	local npc=SearchRangeNPC( Controller, 100 )
	for i=0, table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID) == 120273 then
			Pasofu=npc[i]	
		end
	end
	local x,y,z,dir=DW_Location(Pasofu)
	local NewPasofu=CreateObj( 120998, x, y, z, dir, 1 )
	local NewGill=LuaFunc_CreateObjByObj( 120999, Gill )--產生演戲用吉兒並置入場景
	local Solider=CreateObjByFlag( 120997, 781147 , 0 , 1 )--產生演戲用士兵
	local SetList={NewGill, Solider, NewPasofu}
	for i=1, table.getn(SetList) do--設定演員的細節參數
		MoveToFlagEnabled( SetList[i], true )--關掉巡邏劇情
		WriteRoleValue( SetList[i], EM_RoleValue_IsWalk, 1 )--設定跑步動作(0為跑步/1為走路)
		SetModeEx( SetList[i], EM_SetModeType_Show, true )--顯示
		SetModeEx( SetList[i], EM_SetModeType_Gravity , true )--有重力
		SetModeEx( SetList[i], EM_SetModeType_Move, true )--可移動
		SetModeEx( SetList[i], EM_SetModeType_Searchenemy, false )--不索敵
		SetModeEx( SetList[i], EM_SetModeType_Save, false )--不儲存
		SetModeEx( SetList[i], EM_SetModeType_Revive, false )--不重生
		SetModeEx( SetList[i], EM_SetModeType_Obstruct, false )--不阻擋
		SetModeEx( SetList[i], EM_SetModeType_Strikback, false ) --不反擊
		SetModeEx( SetList[i], EM_SetModeType_Fight, false )--不可砍殺
		SetModeEx( SetList[i], EM_SetModeType_ShowRoleHead, false )--無頭像框
		SetModeEx( SetList[i], EM_SetModeType_HideName, true)--無名稱顯示
		SetModeEx( SetList[i], EM_SetModeType_SearchenemyIgnore, true )--不會被搜尋
		SetModeEx( SetList[i], EM_SetModeType_Mark, false )--不標記
		SetModeEx( SetList[i], EM_SetModeType_NotShowHPMP, true )--不顯示血條
	end
	AddToPartition( NewPasofu, 0 )--說話用帕普赫索夫 
	AddToPartition( Solider, 0 )--將演戲用士兵置入場景
	sleep(5) AdjustFaceDir( Solider, Pasofu, 0)
	sleep(5) DelBodyItem( PlayerID, 546687, 1 )
	sleep(5) LuaFunc_MoveToFlag( Solider, 781147 , 1 , 0 )
	sleep(5) AdjustFaceDir( NewGill, Solider, 0)
	npcsay( Solider, "[SC_Q425217_SHOW1]" )--報告，勞勃情況有異，請您指示如何應對！
	sleep(20) npcsay( NewPasofu, "[SC_Q425217_SHOW2]" )--什麼！？情況如何？你立刻帶幾個醫護兵過去！
	sleep(20) npcsay( Solider, "[SC_Q425217_SHOW3]" )--是！
	CallPlot( NewGill, "Dy_Z23_Gshow08_2", NewGill, Solider )
	sleep(10) LuaFunc_MoveToFlag( Solider, 781147 , 0 ,0 )
	DelObj( NewPasofu )
	SetDefIdleMotion( Solider, ruFUSION_MIME_RUN_FORWARD )
	sleep(5) DelObj( Solider )
	sleep(5) DelObj( Controller )
end
function Dy_Z23_Gshow08_2( NewGill, Solider )
	sleep(10) SetDefIdleMotion( NewGill, ruFUSION_MIME_JUMP_LOOP )
	npcsay( NewGill, "[SC_Q425217_SHOW4]" )--等等！勞勃！！勞勃怎麼了！！！？
	sleep(20) LuaFunc_MoveToFlag( NewGill, 781147 , 0 ,0 )
	DelObj( NewGill )
end
Function Z23_QUEST425215_00()
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register1)==0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1 )
		CallPlot( OwnerID(),"Z23_QUEST425215_01",OwnerID() )
	else return
	end
end
Function Z23_QUEST425215_01()
	local x,y,z,dir=DW_Location(OwnerID())
	local Mrk=CreateObj( 121354, x, y, z, dir, 1 )
	SetModeEx( Mrk, EM_SetModeType_Save, false )--不儲存
	SetModeEx( Mrk, EM_SetModeType_Mark, false )--不顯示標記
	SetModeEx( Mrk, EM_SetModeType_HideName , true )--不顯示名稱
	SetModeEx( Mrk, EM_SetModeType_NotShowHPMP, true )--不顯示血量
	SetModeEx( Mrk, EM_SetModeType_ShowRoleHead, false )--不顯示頭像框
	SetModeEx( Mrk, EM_SetModeType_Fight , false )--不可砍殺攻擊
	SetModeEx( Mrk, EM_SetModeType_Searchenemy , false )--不索敵
	SetModeEx( Mrk, EM_SetModeType_Strikback , false )--不反擊
	SetModeEx( Mrk, EM_SetModeType_Gravity, true )--有重力
	MoveToFlagEnabled( Mrk, false )
	AddBuff ( Mrk, 623374, 0, -1 )
	AddToPartition( Mrk, 0 )
	sleep(10) LuaFunc_MoveToFlag( Mrk, 781142, 7, 1 )
	SetDefIdleMotion( Mrk, ruFUSION_MIME_SNEAK_FORWARD )
	NpcSay( Mrk, "[SC_421273_4]" )--快走吧，那邊有人過來巡邏了。
	sleep(10) LuaFunc_MoveToFlag( Mrk, 781142, 8, 1 )
	NpcSay( Mrk, "[SC_423462_12]" )--不要輕敵！小心一點！
	sleep(20) DelObj( Mrk )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end

function Z23_425217_flagive()	--為了拯救看不見吉兒的人們
	if CheckCompleteQuest(OwnerID(),425215)==true and 
  	 CheckCompleteQuest(OwnerID(),425217)==false and 
   	CheckFlag(OwnerID(),546687)==false then
		SetFlag(OwnerID(),546687,1)
		SetFlag(OwnerID(),546520,1)
	end
	if CheckCompleteQuest( OwnerID(), 425210 )==true then--戰事告急
		SetFlag( OwnerID(), 546507, 0 )
	end
end
