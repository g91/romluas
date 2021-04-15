--在玩家前方每50距離建立1個箱子共10個箱子，在箱子上面坐10個不一樣的npc，每次執行上面的npc隨機分配

function Teacat_homework2()
	local Owner = Role:new( OwnerID() )
	local Target=Role:new(TargetID())
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Target:Dir();
--	local RoomID = ReadRoleValue( me ,EM_RoleValue_RoomID)
	local n = 0
	local a = 0 
	local NPC = {114770; --葬儀社助手
		         114383; --皇家傳送師
		         118501; --技能大師
		         118502; --經驗大師
		         118503;--獵寶大師
		         118504; --寬恕大師
		         110019; --蘿莎．毗爾斯敦
		         110022; --路凡
		         118580; --交易所推廣員
		         110072;}--布里
	for C = 1 , 50 do
		local RNumber = DW_Rand(10) 
		local MNumber = table.remove( NpC , RNumber )
		table.insert( Npc, MNumber )
	end

	for i = 0, 9 do----創立箱子
	n=n+50
	local box1 =  CreateObj( 110267 , BaseX+n, BaseY , BaseZ, BaseDir, 1)
	SetModeEx( box1   , EM_SetModeType_Mark, false )--標記
	SetModeEx( box1  , EM_SetModeType_HideName, false )--名稱
	SetModeEx( box1 , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( box1 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( box1  , EM_SetModeType_Move, false)--移動
	SetModeEx( box1 , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( box1 , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( box1 , EM_SetModeType_NotShowHPMP, true )--不顯示血條
--	WriteRoleValue( box1  , EM_RoleValue_Register , me) 
	AddToPartition( box1 , 0)
	end
	

--	while true do
--	sleep(20)
--	
		for C = 1 , 50 do
			local RNumber = DW_Rand(10) 
			local MNumber = table.remove( NpC , RNumber )
			table.insert( Npc, MNumber )
		end

	 	local R = 0
		for m=0, 9 do
		r=r+1
		a=a+50
		local renpc =  CreateObj( Npc[r] , BaseX+a,  BaseY+30, BaseZ, BaseDir, 1)
		SetModeEx( renpc   , EM_SetModeType_Mark, false )--標記
		SetModeEx( renpc  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( renpc , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( renpc , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( renpc  , EM_SetModeType_Move, false)--移動
		SetModeEx( renpc,  EM_SetModeType_Gravity, true)--重力
		SetModeEx( renpc , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( renpc , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( renpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		AddToPartition( renpc , 0 )
		SetDefIdleMotion ( renpc , ruFUSION_MIME_SIT_CHAIR_LOOP)
		end
--	sleep(100)
--	DelObj(renpc)
--	end

end
