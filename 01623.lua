--生flag用script

--命運盒子 x8
function Lua_mika_losttreasure_desborn() --命運盒子
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local des={}
	for i = 0,7 do  --8個
		des[i] = CreateObjByFlag(113616,780512, i ,1) --使用旗子產生 npc 旗子編號 數量 
		SetModeEx( des[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( des[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( des[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( des[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( des[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( des[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( des[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( des[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( des[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( des[i],RoomID )	--讓物件產生
		SetPlot( des[i]  ,"touch",  "Lua_mika_losttreasuredes02" , 20 )   
	end
end
----------------------------------------------------------------------------------
--石版 x5
function Lua_mika_losttreasure_stoneborn() --石版
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local stone={}
	for i = 0,4 do  --5個
		stone[i] = CreateObjByFlag(114080,780513, i ,1) --使用旗子產生 npc 旗子編號 數量 
		SetModeEx( stone[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( stone[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( stone[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( stone[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( stone[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( stone[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( stone[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( stone[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( stone[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( stone[i],RoomID )	--讓物件產生
		SetPlot( stone[i]  ,"touch",  "Lua_mika_losttreasurebox_08" , 20 )   
	end
end
----------------------------------------------------------------------------------
--黑洞產生 x12
function Lua_mika_losttreasure_hallborn() --黑洞產生
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local black={}
	for i = 0,11 do  --12個洞
		black[i] = CreateObjByFlag(114081,780311, i ,1) --使用旗子產生兔子 npc 旗子編號 數量 
		SetModeEx( black[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( black[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( black[i]    , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( black[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( black[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( black[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( black[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( black[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( black[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( black[i],RoomID )	--讓物件產生
		SetPlot( black[i]  ,"touch",  "lua_mika_losttreasure_dark2" , 50 )   
	end
end

----------------------------------------------------------------------------------
--淨化燭台產生 x8
function Lua_mika_losttreasure_cureborn() --淨化燭台生成 x8
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local cure={}
	for i = 0,7 do  --8個燭台
		cure[i] = CreateObjByFlag(114079,780515, i ,1) --使用旗子產生兔子 npc 旗子編號 數量 
		SetModeEx( cure[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( cure[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( cure[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( cure[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( cure[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( cure[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( cure[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( cure[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( cure[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( cure[i],RoomID )	--讓物件產生
		SetPlot( cure[i]  ,"touch",  "lua_mika_losttreasurecure02" , 20 )   
	end
end
----------------------------------------------------------------------------------
--冰燄燭台1
function Lua_mika_losttreasure_iceborn1()  --左
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local P = 100
	local X = Rand( P )    
--	Say(TargetID(), X)
	if X >= 0 and X <=50  then  
		ice0 = CreateObjByFlag(113614,780489, 0 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice0    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice0    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice0    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice0    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice0    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice0    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice0    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice0 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice0 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice0 ,RoomID )	--讓物件產生
		SetPlot( ice0, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 51 and X <=100  then  
		ice1 = CreateObjByFlag(113614, 780489, 1 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice1    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice1    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice1    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice1    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice1    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice1    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice1    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice1 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice1 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice1 ,RoomID )	--讓物件產生
		SetPlot( ice1, "touch", "Lua_mika_losttreasure_blue2", 20 );
	end
end
----------------------------------------------------------------------------------
--冰燄燭台2
function Lua_mika_losttreasure_iceborn2()  --右
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local P = 100
	local X = Rand( P )    
--	Say(TargetID(), X)
	if X >= 0 and X <=50  then  
		ice2 = CreateObjByFlag(114117,780489, 2 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice2    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice2    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice2    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice2    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice2    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice2    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice2    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice2 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice2 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice2 ,RoomID )	--讓物件產生
		SetPlot( ice2, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 51 and X <=100  then  
		ice3 = CreateObjByFlag(114117,780489, 3 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice3    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice3    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice3    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice3    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice3    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice3    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice3    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice3 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice3 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice3 ,RoomID )	--讓物件產生
		SetPlot( ice3, "touch", "Lua_mika_losttreasure_blue2", 20 );
	end
end
----------------------------------------------------------------------------------
--冰燄燭台3
function Lua_mika_losttreasure_iceborn3()  --中
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local P = 100
	local X = Rand( P )    
--	Say(TargetID(), X)
	if X >= 0 and X <=30  then  --30
		ice4 = CreateObjByFlag(114118,780489, 4 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice4    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice4    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice4    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice4    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice4    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice4    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice4 , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice4 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice4 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice4 ,RoomID )	--讓物件產生
		SetPlot( ice4, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 31 and X <= 50  then  --20
		ice5 = CreateObjByFlag(114118,780489, 5 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice5    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice5    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice5    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice5    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice5    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice5    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice5    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice5 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice5 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice5 ,RoomID )	--讓物件產生
		SetPlot( ice5, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 51 and X <= 75  then  --25
		ice6 = CreateObjByFlag(114118,780489, 6 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice6    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice6    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice6    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice6    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice6    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice6    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice6    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice6 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice6 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice6 ,RoomID )	--讓物件產生
		SetPlot( ice6, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 76 and X <= 100  then  --25
		ice7 = CreateObjByFlag(114118,780489, 7 ,1) --使用旗子產生npc 旗子編號 數量 
		SetModeEx( ice7    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ice7    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ice7    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ice7    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ice7    , EM_SetModeType_Move, false )--移動
		SetModeEx( ice7    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ice7    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ice7 , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ice7 , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( ice7 ,RoomID )	--讓物件產生
		SetPlot( ice7, "touch", "Lua_mika_losttreasure_blue2", 20 );
	end
end
----------------------------------------------------------------------------------

function Lua_MadeRectangleByXYZ_noyell(OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
		local RoomID = ReadRoleValue(TargetID() , EM_RoleValue_RoomID)
		local Cal = (math.pi/180)*(OldDir) 
		local hindrance = {}
		local CC = 1
		local dis = 0
		local NewX
		local NewY
		local NewZ
		local NewDir
		local WnmX = (Wnm-1)/2
		DebugMsg( 0, RoomID ,"WnmX = "..WnmX)
		for i = 1 , Lnm do
			dis = dis + Ldis
			DebugMsg( 0, RoomID ,"dis = "..dis.." i = "..i)
			hindrance[CC] = CreateObj( OrgID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
			local NewX = OldX- dis*math.cos(Cal)
			local NewY = OldY
			local NewZ = OldZ +dis*math.sin(Cal)
			CC = CC + 1
			DebugMsg( 0, RoomID ,"CC = "..CC)
			local WdisX = 0
			for j = 1, WnmX do
				WdisX = WdisX + Wdis
				DebugMsg( 0, RoomID ,"Wdis = "..Wdis.." j = "..j)
				hindrance[CC] = CreateObj( OrgID, NewX+WdisX*math.sin(Cal) ,NewY ,NewZ +WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
				hindrance[CC] = CreateObj( OrgID, NewX-WdisX*math.sin(Cal) ,NewY ,NewZ -WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
			end
		end

		for i=1,table.getn(hindrance) do
			AddToPartition( hindrance[i] ,  RoomID  )
		--	Yell(hindrance[i] ,"hindrance = "..hindrance[i].." i = "..i,5)
		end
		return hindrance
end

function Lua_mika_losttreasure_boxtest1()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local norbox = Lua_MadeRectangleByXYZ_noyell(113617 , 3860 , 49 , 3839 , 181 , 13 , 20 , 5 , 1) -- npcid , x, y ,z , dir , 位置, 位置,  行數, 列數 
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(norbox) do	
		SetModeEx( norbox[x] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( norbox[x] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( norbox[x] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( norbox[x] , EM_SetModeType_Mark, true )--標記
		SetModeEx( norbox[x] , EM_SetModeType_Move, false )--移動
		SetModeEx( norbox[x] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( norbox[x] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( norbox[x] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( norbox[x] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( norbox[x] , EM_SetModeType_DisableRotate, false )--轉向
		AddToPartition( norbox[x], RoomID )	--讓物件產生
	end
end

function Lua_mika_losttreasure_boxtest11()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local norbox = Lua_MadeRectangleByXYZ_noyell(113617 , 3817 , 49 , 3840 , 0 , 13 , 20 , 5 , 1)
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(norbox) do	
		SetModeEx( norbox[x] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( norbox[x] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( norbox[x] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( norbox[x] , EM_SetModeType_Mark, true )--標記
		SetModeEx( norbox[x] , EM_SetModeType_Move, false )--移動
		SetModeEx( norbox[x] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( norbox[x] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( norbox[x] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( norbox[x] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( norbox[x] , EM_SetModeType_DisableRotate, false )--轉向
		AddToPartition( norbox[x], RoomID )	--讓物件產生
	end
end

function Lua_mika_losttreasure_boxtest2()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local goodbox = Lua_MadeRectangleByXYZ_noyell(113618 , 3840 , 49 , 3832 , 270 , 13 , 20 , 5 , 1)
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(goodbox) do	
		SetModeEx( goodbox[x] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( goodbox[x] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( goodbox[x] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( goodbox[x] , EM_SetModeType_Mark, true )--標記
		SetModeEx( goodbox[x] , EM_SetModeType_Move, false )--移動
		SetModeEx( goodbox[x] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( goodbox[x] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( goodbox[x] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( goodbox[x] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( goodbox[x] , EM_SetModeType_DisableRotate, false )--轉向
		AddToPartition( goodbox[x], RoomID )	--讓物件產生
	end
end

function Lua_mika_losttreasure_boxtest3()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local mallbox = Lua_MadeRectangleByXYZ_noyell(113619 , 3840 , 49 , 3849 , 270 , 13 , 20 , 5 , 1)
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(mallbox) do	
		SetModeEx( mallbox[x] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( mallbox[x] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( mallbox[x] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( mallbox[x] , EM_SetModeType_Mark, true )--標記
		SetModeEx( mallbox[x] , EM_SetModeType_Move, false )--移動
		SetModeEx( mallbox[x] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( mallbox[x] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( mallbox[x] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( mallbox[x] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( mallbox[x] , EM_SetModeType_DisableRotate, false )--轉向
		AddToPartition( mallbox[x], RoomID )	--讓物件產生
	end
end