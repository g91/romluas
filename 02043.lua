function bk_130_116466()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room            
	local afdoor = CreateObjByFlag(104579,780687,4,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----重力
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	AddToPartition( afdoor , RoomID )
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,afdoor)---- 在控制器身上放入王的id
	local hard =0 
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,hard)---- 寫入一個難度選擇鎖
end
function bk_hard_easy_op() --對話，第一層
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_00]" , "bk_hard_easy_op_1", 0 ) --進入下一頁，說明。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_01]" , "bk_hard_easy_00", 0 ) --直接進入普通級副本
end
function bk_hard_easy_op_1() --對話，第二層
	SetSpeakDetail( OwnerID(), "[SC_116466_02]"   ) --對話內容--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_03]" , "bk_hard_easy_op_2", 0 ) --
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_04]" , "bk_hard_easy_00", 0 ) --直接進入普通級副本
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_hard_easy_op", 0 ) --回到上一頁
end
function bk_hard_easy_op_2() --對話，第三層
	SetSpeakDetail( OwnerID(), "[SC_116466_05]"   ) --對話內容--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_06]" , "bk_hard_easy_01", 0 ); --1級難度。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_07]" , "bk_hard_easy_02", 0 ); --2級難度。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_08]" , "bk_hard_easy_03", 0 ); --3級難度。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_09]" , "bk_hard_easy_04", 0 ); --4級難度。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_10]" , "bk_hard_easy_05", 0 ); --5級難度。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_hard_easy_op_1", 0 ) --回到上一頁
end
function bk_hard_easy_00()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----讀取控制器
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----讀取鎖
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------寫進難度鎖的部分
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----取出來的是數量
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,6)------------寫進難度選擇的部分
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------變成成特明球
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_00_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	end
end
function bk_hard_easy_01()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----讀取控制器
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----讀取鎖
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------寫進難度鎖的部分
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----取出來的是數量
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,1)------------寫進難度選擇的部分
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------變成成特明球
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_01_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	end
end
function bk_hard_easy_02()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----讀取控制器
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----讀取鎖
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------寫進難度鎖的部分
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----取出來的是數量
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,2)------------寫進難度選擇的部分
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------變成成特明球
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_02_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	end
end
function bk_hard_easy_03()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----讀取控制器
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----讀取鎖
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------寫進難度鎖的部分
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----取出來的是數量
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,3)------------寫進難度選擇的部分
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------變成成特明球
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_03_op",0)---------------------------------把招換模式放在生出來的任務npc身上.
	end
end
function bk_hard_easy_04()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----讀取控制器
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----讀取鎖
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------寫進難度鎖的部分
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----取出來的是數量
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,4)------------寫進難度選擇的部分
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------變成成特明球
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_04_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	end
end
function bk_hard_easy_05()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----讀取控制器
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----讀取鎖
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------寫進難度鎖的部分
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----取出來的是數量
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end
		
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,5)------------寫進難度選擇的部分
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------變成成特明球
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_05_op",0)---------------------------------把招換模式放在生出來的任務npc身上
	end
end
function bk_hard_easy_00_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
	local npcde = GetSearchResult()			-------------逐一取每個npc編號	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
		    CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
		end
	end
end


function bk_hard_easy_01_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
	local x=0
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
	local npcde = GetSearchResult()			-------------逐一取每個npc編號	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
		    CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_02_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
	local x=1
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
	local npcde = GetSearchResult()			-------------逐一取每個npc編號	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除			
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_03_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
	local x=2
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
	local npcde = GetSearchResult()			-------------逐一取每個npc編號	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_04_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
	local x=3
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
	local npcde = GetSearchResult()			-------------逐一取每個npc編號	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_05_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
	local x=4
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
	local npcde = GetSearchResult()			-------------逐一取每個npc編號	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------清除
			CancelBuff(npcde , 507718 )-------清除
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end