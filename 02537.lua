--01尋找艾力克研究員 對話
function Dy_Z22_01_discuss()
	local rans = Rand(100)+1
	LuaP_Crafting()
	if rans <= 100 and rans >= 85 then
		
	elseif rans <= 84 and rans >= 75 then
		say (OwnerID() , "[SC_Z22_Q424782_02]")
	elseif rans <= 74 and rans >= 60 then
		say (OwnerID() , "[SC_Z22_Q424782_01]")
	elseif rans <= 59 and rans >= 45 then
		say (OwnerID() , "[SC_Z22_Q424782_04]")
	elseif rans <= 44 and rans >= 30 then
		say (OwnerID() , "[SC_Z22_Q424782_03]")
	elseif rans <= 29 and rans >= 15 then
		
	elseif rans <= 14 then
	end
end
function Dy_Z22_01_discuss2()
	local rans = Rand(100)+1
	LuaP_Crafting()
	if rans <= 100 and rans >= 85 then
		
	elseif rans <= 84 and rans >= 75 then
		say (OwnerID() , "[SC_Z22_Q424782_02]")
	elseif rans <= 74 and rans >= 60 then
		say (OwnerID() , "[SC_Z22_Q424782_01]")
	elseif rans <= 59 and rans >= 45 then
		say (OwnerID() , "[SC_Z22_Q424782_04]")
	elseif rans <= 44 and rans >= 30 then
		say (OwnerID() , "[SC_Z22_Q424782_03]")
	elseif rans <= 29 and rans >= 15 then
		
	elseif rans <= 14 then
	end
end
function Dy_Z22_01_talk() 
--參考702035的NPC部分 **星期三**
	--MoveToFlagEnabled( OwnerID(), true )
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),424782)	and CheckFlag( OwnerID(), 545835 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424782_1]","Dy_Z22_01_talk_01", 0 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424782_2]","Dy_Z22_01_talk_N", 0 )
		--MoveToFlagEnabled( OwnerID(), false )
	elseif CheckAcceptQuest(OwnerID(),424919) or CheckAcceptQuest(OwnerID(),425178) and CheckFlag( OwnerID(), 545835 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424782_1]","Dy_Z22_01_talk_01", 0 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424782_2]","Dy_Z22_01_talk_N", 0 )		
	end
end
function Dy_Z22_01_talk_01()
	if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == 119789 then 
		SetSpeakDetail( OwnerID(), "[SC_424782_7]")   
	elseif ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == 119790 then 
		SetSpeakDetail( OwnerID(), "[SC_424782_3]")   
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424782_4]","Dy_Z22_01_talk_N", 0 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424782_5]","Dy_Z22_01_talk_02", 0 )
end
function Dy_Z22_01_talk_N()
	CloseSpeak( OwnerID() )
end
function Dy_Z22_01_talk_02()
	local npcp = {}
    npcp = SearchRangePlayer( OwnerID() , 80 ) 
	local num = table.getn(npcp) 
	for i=0,num,1 do
		if CheckAcceptQuest( npcp[i], 424782) == true and CheckFlag( npcp[i], 545835 ) == false then
			GiveBodyItem( npcp[i] , 545835, 1 )
		end
	end
	sysCastSpellLv	( OwnerID(),  TargetID() , 498936 , 0 )
	say (TargetID() , "[SC_424782_6]")
	GiveBodyItem( OwnerID(), 545835, 1 )
	CloseSpeak( OwnerID() )
	BeginPlot(TargetID(), "Dy_Z22_01_talk_HIDE", 15 )
end
function Dy_Z22_01_talk_HIDE()
	local N1 = 119789
	local Y1 = 106602
	local N2 = 119790
	local Y2 = 106603
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
	if ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == N1 then --
		local newN1 = CreateObj ( Y1 , X , Y , Z , Dir , 1) 
		SetModeEx( newN1  ,EM_SetModeType_Show, true )--顯示*
		SetModeEx( newN1  ,EM_SetModeType_Searchenemy , false ) --索敵*
		SetModeEx( newN1  ,EM_SetModeType_Save , true ) --儲存*
		SetModeEx( newN1  ,EM_SetModeType_Revive , false ) --重生*
		SetModeEx( newN1  ,EM_SetModeType_Obstruct , false )--阻擋*
		SetModeEx( newN1  ,EM_SetModeType_Strikback , false ) --反擊*
		SetModeEx( newN1  ,EM_SetModeType_Fight , false ) --砍殺*
		SetModeEx( newN1  ,EM_SetModeType_Gravity , true ) --重力*	
		SetModeEx( newN1  ,EM_SetModeType_Move , true ) --移動*
		SetModeEx( newN1  ,EM_SetModeType_ShowRoleHead , false ) --頭像框*
		SetModeEx( newN1  ,EM_SetModeType_HideName , false) --物件頭上的名稱是否顯示*
		SetModeEx( newN1  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
		AddToPartition( newN1, RoomID)
		MoveDirect( newN1 , -19473 , Y , -24117 )  --座標要再換
		Hide(OwnerID())
		sleep(10)  -- 15S
		DelObj (newN1)
		sleep(100)  -- 15S
		Show( OwnerID(), RoomID ) 
	elseif ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == N2 then --
		--say (OwnerID() , "plant")
		local newN2 = CreateObj ( Y2 , X , Y , Z , Dir , 1) 
		SetModeEx( newN2  ,EM_SetModeType_Show, true )--顯示*
		SetModeEx( newN2  ,EM_SetModeType_Searchenemy , false ) --索敵*
		SetModeEx( newN2  ,EM_SetModeType_Save , true ) --儲存*
		SetModeEx( newN2  ,EM_SetModeType_Revive , false ) --重生*
		SetModeEx( newN2  ,EM_SetModeType_Obstruct , false )--阻擋*
		SetModeEx( newN2  ,EM_SetModeType_Strikback , false ) --反擊*
		SetModeEx( newN2  ,EM_SetModeType_Fight , false ) --砍殺*
		SetModeEx( newN2  ,EM_SetModeType_Gravity , true ) --重力*	
		SetModeEx( newN2  ,EM_SetModeType_Move , true ) --移動*
		SetModeEx( newN2  ,EM_SetModeType_ShowRoleHead , false ) --頭像框*
		SetModeEx( newN2  ,EM_SetModeType_HideName , false) --物件頭上的名稱是否顯示*
		SetModeEx( newN2  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
		AddToPartition( newN2, RoomID)
		MoveDirect( newN2 , -19259 , Y , -22765 )  --座標要再換
		Hide(OwnerID())
		sleep(10)  -- 15S
		DelObj (newN2)
		sleep(100)  -- 15S
		Show( OwnerID(), RoomID ) 
	end
end


--02
function Dy_Z22_02_give1()
	GiveBodyItem( OwnerID(), 240760, 1 )
end
function Dy_Z22_02_give2()
	GiveBodyItem( OwnerID(), 240761, 1 )
end
function Dy_Z22_02_give3()
	GiveBodyItem( OwnerID(), 240762, 1 )
end
function Dy_Z22_02_rand()
	local rans = Rand(100)+1
	if rans <= 100 and rans >= 85 then
		AddBuff( TargetID() , 621758 , 0 , 60)
	elseif rans <= 84 and rans >= 75 then
		say (TargetID() , "[SC_Z22_Q424783_01]")
	elseif rans <= 74 and rans >= 60 then
		AddBuff( TargetID() , 621758 , 0 , 60)
	elseif rans <= 59 and rans >= 45 then
		say (TargetID() , "[SC_Z22_Q424783_02]")
	elseif rans <= 44 and rans >= 30 then
		AddBuff( TargetID() , 621759 , 0 , 60)		
	elseif rans <= 29 and rans >= 15 then
		say (TargetID() , "[SC_Z22_Q424783_01]")
	elseif rans <= 14 then
		say (TargetID() , "[SC_Z22_Q424783_02]")
	end
end 
function Dy_Z22_02_check01()
	local fire1 = 106466
	local fire2 = 106465
	if CheckAcceptQuest(OwnerID(), 424783  )  == true 
	or CheckAcceptQuest(OwnerID(), 425179  ) == true
	or CheckAcceptQuest(OwnerID(), 425183  ) == true	then  -- 有沒有接此任務
		if CountBodyItem( OwnerID() , 240760) == 2 then --物品為2以上 已達需求數量
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_05]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_05]" , 0 )
			return false
		end
		if  ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == fire1 or --目標對不對
			ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == fire2 then
			if CheckBuff( TargetID() , 621758) == true 
			or CheckBuff( TargetID() , 621759) == true then --有BUFF時
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_04]" , 0 )  --已受到符文影響
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_04]" , 0 )	
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_03]" , 0 )  --目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_03]" , 0 )	
		end
	end
end
function Dy_Z22_02_check02()
	local fire1 = 106466
	local fire2 = 106465
	if CheckAcceptQuest(OwnerID(), 424783  )  == true 
	or CheckAcceptQuest(OwnerID(), 425179  ) == true
	or CheckAcceptQuest(OwnerID(), 425183  ) == true	then  -- 有沒有接此任務
		if CountBodyItem( OwnerID() , 240761) == 2 then --物品為2以上 已達需求數量
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_05]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_05]" , 0 )
			return false
		end
		if  ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == fire1 or --目標對不對
			ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == fire2 then
			if CheckBuff( TargetID() , 621758) == true 
			or CheckBuff( TargetID() , 621759) == true then --有BUFF時
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_04]" , 0 )  --已受到符文影響
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_04]" , 0 )	
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_03]" , 0 )  --目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_03]" , 0 )	
		end
	end
end

--03
function Dy_Z22_03_Fight()
	CloseSpeak( OwnerID() )
	say (TargetID() , "出發吧。")
	--傳送+戰鬥劇情
end
function Dy_Z22_03_NoFight() 
	SetSpeakDetail( OwnerID(), "[SC_424784_2]") 
end


--04 自然之心與生命 424785  106458 106457 240763
--[[function Dy_Z2204_check() --使用乳白光芒之籽時的檢查
	local plant = 119794 
	local ani = 119792
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(), 424785  )  == true then  -- 有沒有接此任務
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == plant then -- 如果目標是異常的植物
			--say (OwnerID() , "plant check")
			return true
		elseif ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == ani then -- 如果目標是異常的動物
			--say (OwnerID() , "ani check")
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424785_01]" , 0 )  --目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424785_01]" , 0 )
			return false
		end
	elseif CheckAcceptQuest(OwnerID(), 425181  )  == true then
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == plant then -- 如果目標是異常的植物
			--say (OwnerID() , "plant check")
			return true
		elseif ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == ani then -- 如果目標是異常的動物
			--say (OwnerID() , "ani check")
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424785_01]" , 0 )  --目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424785_01]" , 0 )
			return false
		end		
	elseif CheckAcceptQuest(OwnerID(), 425185  )  == true then
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == plant then -- 如果目標是異常的植物
			--say (OwnerID() , "plant check")
			return true
		elseif ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == ani then -- 如果目標是異常的動物
			--say (OwnerID() , "ani check")
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424785_01]" , 0 )  --目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424785_01]" , 0 )
			return false
		end
	end
end]]
-- Z22 任務物品 - 240763 乳白光芒之籽 
function Dy_Z2204_use00() --塞入觸碰劇情
	SetPlot( TargetID(),"touch","Dy_Z2204_use",40 ) 
end

function Dy_Z2204_use()
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(), 424785  )  == true 
	or CheckAcceptQuest(OwnerID(), 425181  )  == true 
	or CheckAcceptQuest(OwnerID(), 425185  )  == true then  -- 有沒有接此任務
		if CheckBuff( TargetID() , 622120 ) == false and CountBodyItem( OwnerID() , 240763) == 1 then
			CastSpell( OwnerID(), TargetID(), 494423 ) 
			AddBuff( TargetID() , 622120 , 0 , 5)
		elseif CountBodyItem( OwnerID() , 240763) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424785_01]" , 0 )  --你身上沒有[240763]！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424785_01]" , 0 )			
			--say (TargetID() , "123")
		elseif CheckBuff( TargetID() , 622120 ) == true then
		
		end
	end
end
function Dy_Z2204_use01()
	local plant = 119794
	local ani = 119792
	if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == plant then --如果自己是異常的植物
		BeginPlot(TargetID(), "Dy_Z2204_hide", 10 ) --觸發隱藏植物的劇情
		DW_QietKillOne(OwnerID(), 106458  )  -- 偷殺死NPC - 已治療異常植物
	elseif ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == ani then -- 如果目標是異常的動物
		BeginPlot(TargetID(), "Dy_Z2204_hide", 10 ) --觸發隱藏動物的劇情	
		DW_QietKillOne(OwnerID(), 106457  )  -- 偷殺死NPC - 已治療異常動物
	end
end

function Dy_Z2204_hide() --點了以後隱藏
	--say (OwnerID() , "Owner")
	--say (TargetID() , "Target")
	local plant = 119794
	local norplant = 119945
	local ani = 119792
	local nroani = 119793
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X )
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y )
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z )
	local dir = ReadRoleValue ( OwnerID(), EM_RoleValue_Dir )
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )	
	if ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == plant then --如果自己是異常的植物
		--say (OwnerID() , "plant")
		local normal_01 = CreateObj ( norplant , x , y , z , dir , 1) 
		AddToPartition( normal_01, RoomID)
		Hide(OwnerID())
		sleep(50)  -- 15S
		DelObj (normal_01)
		sleep(100)  -- 15S
		Show( OwnerID(), RoomID ) 
	elseif ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == ani then -- 如果目標是異常的動物
		--say (OwnerID() , "ani")
		local normal_02 = CreateObj ( nroani , x , y , z , dir , 1) 
		AddToPartition( normal_02, RoomID)
		MoveDirect( normal_02 , -387 , -257 , -266 )  --座標要再換
		Hide(OwnerID())
		sleep(50)  -- 15S
		DelObj (normal_02)
		sleep(100)  -- 15S
		Show( OwnerID(), RoomID )
	end
end
function Dy_Z2204_end()
	AddBuff( TargetID() , 621778 , 0 , 3600)
	--say (TargetID() , " 123 ")
end
function Dy_Z2204_end_2()
	Lua_ZonePE_3th_GetScore(50)
	AddBuff( TargetID() , 621778 , 0 , 3600)
	--say (TargetID() , " 123 ")
end

--05撲滅火苗
function Dy_Z2205_use00() --塞入觸碰劇情
	SetPlot( TargetID(),"touch","Dy_Z2205_use",65 ) 
end
function Dy_Z2205_use() --使用水藍結晶之籽
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(), 424786  )   
	or CheckAcceptQuest(OwnerID(), 425182  ) 
	or CheckAcceptQuest(OwnerID(), 425186  )  then  -- 有沒有接此任務
		if CheckBuff( TargetID() , 622120 ) == false and CountBodyItem( OwnerID() , 240764) == 1 then
			BeginPlot(TargetID(), "Dy_Z2205_hide", 10 ) --觸發隱藏的劇情
			AddBuff( TargetID() , 622120 , 0 , 5)
			DW_QietKillOne(OwnerID(), 106454  )  -- 偷殺死NPC - 已撲滅火苗
		elseif CountBodyItem( OwnerID() , 240764) == 0  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424786_01]" , 0 )  --你身上沒有[240764]！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424786_01]" , 0 )			
			--say (TargetID() , "123")
		elseif CheckBuff( TargetID() , 622120 ) == true then
		
		end
	end
end
function Dy_Z2205_hide()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	AddToPartition( OwnerID(), RoomID)
	Hide(OwnerID())
	sleep(50)  -- 15S
	Show( OwnerID(), RoomID ) 
end