function Lua_bk_fd_04_102737()--------------------------------------火線追人
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local wb=OwnerID()
	local sb={}
	local wbx=0
	local wby=0
	local wbz=0
	local wbd=0
	local i=0
	while 1 do 
	sleep(3)
	i=i+1
		wbx=ReadRoleValue(wb ,EM_RoleValue_X)
		wby=ReadRoleValue(wb ,EM_RoleValue_Y)
		wbz=ReadRoleValue(wb ,EM_RoleValue_Z)
		wbd=ReadRoleValue(wb ,EM_RoleValue_Dir)
		sb[i]=CreateObj(102737,wbx,wby,wbz,wbd,1)-----------------------每ㄧ秒多一個火球
		SetModeEx( sb[i] , EM_SetModeType_Show, true) ----秀出
		SetModeEx( sb[i] , EM_SetModeType_Mark, false) ----標記
		SetModeEx( sb[i] , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( sb[i] , EM_SetModeType_Move, false) ---移動	
		SetModeEx( sb[i] , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( sb[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( sb[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( sb[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( sb[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
		AddToPartition( sb[i] , RoomID )
		AddBuff(sb[i],504853,1,600)--------------原地放火
		WriteRoleValue(sb[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		if i==30 then 
		DelObj(wb)
		break
		end
	end
end
function Lua_bk_bfAB_102670()------------------------火牆燒人A-B
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local dbfm={}
local bfm={}
local bf=0
	while 1 do 
	sleep(20)
	bf=bf+1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	bf=bf+1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime	
	---	if bf==1 then 
	----		for i=1,6,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show,true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
--		end
		if bf==2 then 
			for i=1,15,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark,false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
		--if bf==3 then 
		--	for i=16,26,1 do 
		--	dbfm[i]=CreateObjByFlag(102739,780425,i,1)
		--	SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		---	SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
		--	SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		--	SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
		--	SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
		--	SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
		--	SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		--	SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
		--	SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
		--	AddToPartition( dbfm[i] , RoomID )
		--	AddBuff( dbfm[i] ,504780,1,-1 )
		--	WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
		--	end
	--	end
		if bf==4 then 
			for i=16,37,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	--	if bf==5 then 
	--		for i=38,48,1 do 
	--		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	--		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	--		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	--		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	--		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	--		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	--		AddToPartition( dbfm[i] , RoomID )
	--		AddBuff( dbfm[i] ,504780,1,-1 )
	--		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
	--	end
		if bf==6 then 
			for i=38,59,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight ,false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false)--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	--	if bf==7 then 
	--		for i=60,70,1 do 
	--		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	--		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	--		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	--		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	--		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	--		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	--		AddToPartition( dbfm[i] , RoomID )
	--		AddBuff( dbfm[i] ,504780,1,-1 )
	--		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
	--	end
		if bf==8 then 
			for i=60,81,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight ,false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark,false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	--	if bf==9 then 
	--		for i=82,92,1 do 
	--		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	--		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	--		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	--		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	--		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	----		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	--		AddToPartition( dbfm[i] , RoomID )
	--		AddBuff( dbfm[i] ,504780,1,-1 )
	--		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
	--	end
		if bf==10 then 
			for i=82,101,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
		if bf==12 then
			for i=102,108,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,3)	---------------存在時間livetime
			end
			break
		end
		if bf==14 then
			sleep(30)
		end
	end
end
function Lua_bk_bfBA_102670()------------------------火牆燒人B-A
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local dbfm={}
local bfm={}
local bf=12
	while 1 do 
	sleep(20)
	bf=bf-1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	bf=bf-1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
		---	if bf==1 then 
	----		for i=1,6,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show,true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
--		end
		if bf==2 then 
			for i=1,15,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark,false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
		--if bf==3 then 
		--	for i=16,26,1 do 
		--	dbfm[i]=CreateObjByFlag(102739,780425,i,1)
		--	SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		---	SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
		--	SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		--	SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
		--	SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
		--	SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
		--	SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		--	SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
		--	SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
		--	AddToPartition( dbfm[i] , RoomID )
		--	AddBuff( dbfm[i] ,504780,1,-1 )
		--	WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
		--	end
	--	end
		if bf==4 then 
			for i=16,37,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	--	if bf==5 then 
	--		for i=38,48,1 do 
	--		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	--		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	--		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	--		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	--		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	--		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	--		AddToPartition( dbfm[i] , RoomID )
	--		AddBuff( dbfm[i] ,504780,1,-1 )
	--		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
	--	end
		if bf==6 then 
			for i=38,59,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight ,false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false)--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	--	if bf==7 then 
	--		for i=60,70,1 do 
	--		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	--		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	--		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	--		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	--		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	--		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	--		AddToPartition( dbfm[i] , RoomID )
	--		AddBuff( dbfm[i] ,504780,1,-1 )
	--		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
	--	end
		if bf==8 then 
			for i=60,81,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight ,false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark,false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	--	if bf==9 then 
	--		for i=82,92,1 do 
	--		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	--		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	--		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	--		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	--		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	--		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	--		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	----		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	--		AddToPartition( dbfm[i] , RoomID )
	--		AddBuff( dbfm[i] ,504780,1,-1 )
	--		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	--		end
	--	end
		if bf==10 then 
			for i=82,101,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
		if bf==12 then
			for i=102,108,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,3)	---------------存在時間livetime
			end
			break
		end
		if bf==0 then
		break
		end
	end
end
function Lua_bk_bfCD_102670()------------------------火牆燒人C-D
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local dbfm={}
local bfm={}
local bf=11
	while 1 do 
	sleep(20)
	bf=bf+1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	bf=bf+1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
---		if bf==12 then 
	---		for i=109,115,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==13 then 
			for i=109,124,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780 ,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==14 then 
	---		for i=125,135,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==15 then 
			for i=125,146,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==16 then 
	---		for i=147,157,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	------		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==17 then 
			for i=147,168,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==18 then 
	---		for i=169,179,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show,true)--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==19 then 
			for i=169,190,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==20 then 
	---		for i=191,200,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	------		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==21 then 
			for i=191,209,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
		if bf==23 then
			for i=210,216,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
			break
		end
		if bf==25 then
		break
		end
	end
end
function Lua_bk_bfDC_102670()------------------------火牆燒人D-C
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local dbfm={}------傷害球
local bfm={}-------特效球
local bf=23
	while 1 do 
	sleep(20)
	bf=bf-1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	bf=bf-1
	bfm[bf]=CreateObjByFlag(102739,780426,bf,1)--------------這邊生出一開始的控制器
	SetModeEx( bfm[bf] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bfm[bf] , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( bfm[bf] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( bfm[bf] , EM_SetModeType_Mark, false )--標記
	SetModeEx( bfm[bf] , EM_SetModeType_Move, false )--移動
	SetModeEx( bfm[bf] , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bfm[bf] , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( bfm[bf] , EM_SetModeType_HideName, false )--名稱
	SetModeEx( bfm[bf] , EM_SetModeType_Show, true )--名稱
	AddToPartition( bfm[bf] , RoomID )
	AddBuff( bfm[bf] ,504857,1,-1 )
	WriteRoleValue(bfm[bf], EM_RoleValue_Livetime,2)	---------------存在時間livetime
		---		if bf==12 then 
	---		for i=109,115,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==13 then 
			for i=109,124,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780 ,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==14 then 
	---		for i=125,135,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==15 then 
			for i=125,146,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==16 then 
	---		for i=147,157,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	------		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==17 then 
			for i=147,168,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==18 then 
	---		for i=169,179,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	---		SetModeEx( dbfm[i] , EM_SetModeType_Show,true)--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==19 then 
			for i=169,190,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
	---	if bf==20 then 
	---		for i=191,200,1 do 
	---		dbfm[i]=CreateObjByFlag(102739,780425,i,1)
	---		SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
	---		SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	---		SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
	---		SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
	---		SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
	---		SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
	---		SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
	------		SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
	---		AddToPartition( dbfm[i] , RoomID )
	---		AddBuff( dbfm[i] ,504780,1,-1 )
	---		WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
	---		end
	---	end
		if bf==21 then 
			for i=191,209,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
		end
		if bf==23 then
			for i=210,216,1 do 
			dbfm[i]=CreateObjByFlag(102739,780425,i,1)
			SetModeEx( dbfm[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( dbfm[i] , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( dbfm[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( dbfm[i] , EM_SetModeType_Mark, false )--標記
			SetModeEx( dbfm[i] , EM_SetModeType_Move, false )--移動
			SetModeEx( dbfm[i] , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( dbfm[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( dbfm[i] , EM_SetModeType_HideName, false )--名稱
			SetModeEx( dbfm[i] , EM_SetModeType_Show, true )--名稱
			AddToPartition( dbfm[i] , RoomID )
			AddBuff( dbfm[i] ,504780,1,-1 )
			WriteRoleValue(dbfm[i], EM_RoleValue_Livetime,2)	---------------存在時間livetime
			end
			break
		end
		if bf==11 then
		break
		end
	end
end
function Lua_bk_smfire_102780()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local fm=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)------------記錄幾隻
local hate={}
local fim=0--------------火球數量
	hate=star_HateListSort(boss)------------
	if fm == 0 then 
	fim=3
	end
	if fm == 1 then 
	fim=6
	end
	if fm == 2 then 
	fim=9
	end
	if fm == 3 then 
	fim=12
	end
	for i=1 ,fim ,1 do 
		if table.getn(hate) > 0 then
			local Temp = Rand(table.getn(hate))+1
			if 	ReadRoleValue( hate[Temp] , EM_RoleValue_IsDead) == 0 and 
			ReadRoleValue( hate[Temp] , EM_RoleValue_IsPlayer) == 1 and 
			ReadRoleValue( hate[Temp] , EM_RoleValue_VOC ) ~= 0 then
			CastSpellLV( OwnerID() , hate[Temp] , 494248 , 0 )	
			table.remove ( hate, Temp)
			end
		end
	sleep(10)
	end
end
function Lua_fd_fd_fw_504800()
	if CheckBuff( TargetID(), 504998) == true then 
		return false
	else
		return true
	end
end 