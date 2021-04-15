function Z24_test ()
	local time1 = 0
	local time2 = 0
	local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) --讀出Boss在哪一層
	local BCN  
	local BCS 
	
	--種判定距離的透明球
	BCN = CreateObjByFlag( 106652 , 781081 , 1 , 1 ) ---距離判定球
	SetModeEx( BCN , EM_SetModeType_Show, true) ----秀出
	SetModeEx( BCN , EM_SetModeType_Mark, false) ----標記
	SetModeEx( BCN , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( BCN , EM_SetModeType_Move, false) ---移動	
	SetModeEx( BCN , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( BCN , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( BCN , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( BCN , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( BCN , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( BCN   , EM_SetModeType_Obstruct, false )--阻擋	
	AddToPartition( BCN,roomid )
	
	BCS = CreateObjByFlag( 106652 , 781081 , 2 , 1 ) ---距離判定球
	SetModeEx( BCS , EM_SetModeType_Show, true) ----秀出
	SetModeEx( BCS , EM_SetModeType_Mark, false) ----標記
	SetModeEx( BCS , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( BCS , EM_SetModeType_Move, false) ---移動	
	SetModeEx( BCS , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( BCS , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( BCS , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( BCS , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( BCS , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( BCS   , EM_SetModeType_Obstruct, false )--阻擋	
	AddToPartition( BCS,roomid )

	while 1 do
		sleep(10)
		time1 = time1 + 1 
		time2 = time2 + 2
		if time1 % 10 ==0 then
			time2 = 0 --停止普招的計時
			local time3 = 0 --大絕結束計時
			local player2 ={}
			local luck3 --定身的抓人
			local luck4 --亂射的抓人
			local ALLP = SetSearchAllPlayer(roomID ) --搜尋全部玩家
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_106609_01]" , 2 )
			player2 = DW_HateRemain(0) --仇恨表找人   填0代表 不排除主坦
			sleep(10)

			--距離判定開始
			if GetDistance( OwnerID(), BCN ) >= GetDistance( OwnerID(), BCS ) then
				--當BOSS在N方向時，踢玩家到S方向
				AddBuff (OwnerID() , 622028 ,0 , 30) --BOSS不動 
				FA_FaceFlagEX ( OwnerID() , 781081 , 1 , 0 , 0)  --面向N方向旗標

				for i = 1 , ALLP ,1 do --把玩家抓到S區域
					local PID = GetSearchResult()
					if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
					ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
					ReadRoleValue( PID , EM_RoleValue_RoomID  ) == roomID then --在同層
					SetPosByFlag( PID , 781081 , 1 ) --全抓到S方向
					end
				end

			elseif GetDistance( OwnerID(), BCS ) > GetDistance( OwnerID(), BCN ) then
				--當BOSS在S方向時，踢玩家到N方向
				AddBuff (OwnerID() , 622028 ,0 , 30) --BOSS不動 
				FA_FaceFlagEX ( OwnerID() , 781081 , 2 , 0 , 0)  --面向S方向旗標
				local ALLP = SetSearchAllPlayer(roomID ) --搜尋全部玩家
				for i = 1 , ALLP ,1 do --把玩家抓到S區域
					local PID = GetSearchResult()
					if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
					ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
					ReadRoleValue( PID , EM_RoleValue_RoomID  ) == roomID then --在同層
					SetPosByFlag( PID , 781081 , 2 ) --全抓到S方向
					end
				end
			end
			--距離判定結束

			
			if ALLP >= 3 then -- 玩家有3人以上
				luck3 = Az_RND_Ary(1,6,3) --從1~6中取出3個]]
				AddBuff( player2[luck3[1]] , 621939 , 0 , 8) --定身8秒
				AddBuff( player2[luck3[2]] , 621939 , 0 , 8) --定身8秒
				AddBuff( player2[luck3[3]] , 621940, 0 , 10) --標記第三個人
				
				sleep(30)
				say (OwnerID() , "show")
				--表演--
				--亂射
				for i =1 , 10 , 1 do
					luck4 = Rand(table.getn(player2))+1	
					sleep(10)
					CastSpellLv	( OwnerID(),  player2[luck4] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luck4] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luck4+1] , 499072, 0 )
					sleep(10)
				end								
			elseif ALLP == 2 then --剩下2人
				local luckp = Az_RND_Ary(1,2,2)
				AddBuff( player2[luckp[1]] , 621939 , 0 , 8) --定身8秒
				AddBuff( player2[luckp[2]] , 621940, 0 , 10) --標記第2個人
				sleep(30)
				say (OwnerID() , "show2")
				--表演--
				--亂射
				for i = 1 , 10 , 1 do
					CastSpellLv	( OwnerID(),  player2[luckp[1]] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luckp[1]] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luckp[2]] , 499072, 0 ) 
					sleep(10)
				end
			elseif ALLP == 1 then --剩下1人
				AddBuff( player2[1] , 621939 , 0 , 8) --定身8秒
				AddBuff( player2[1] , 621940, 0 , 10) --標記第2個人
				sleep(30)
				say (OwnerID() , "show3")
				--表演--
				--亂射
				for i = 1 , 10 , 1 do
					CastSpellLv	( OwnerID(),  player2[1] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[1] , 499072 , 0 ) 
					sleep(10)
				end
			end

			--10秒沒有人在BOSS100範圍內則+BOSS攻擊傷害
			local npcp = {}
			npcp = SearchRangePlayer( OwnerID() , 100 ) 
			local num = table.getn(npcp)
			if num == 0 then
				AddBuff( OwnerID() , 621943 , 0 , -1)
			end
			CancelBuff (OwnerID() , 622028) --去除定身
		end	
	end
end

--------------------------------------------------Lv50 遊影 防禦擊潰2
function lua_Dy_weakdef(Condition)	
	if Condition == 1 then
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+9 )
		AddBuff( TargetID() , 503404 , PLevel , 8)
	end	
end
---------------------------------------------------Lv50 祭戰 妖精光環2
function lua_Dy_fireHalo2()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 
	AddBuff( Master , 502854 , 0 , 10)	
end	

-------------------------------------------------------- 森林牧者 自然晶體之晶體爆裂
function lua_Dy_CrystalExplosionCheck() ---檢查有無寵物
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( MyPet ) == true then --有寵物ID的話
		say (OwnerID(), "pet")
		return true
	elseif CheckID( MyPet ) == false then --沒有寵物ID時回傳錯誤
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		say (OwnerID(), "nopet")
		return false 
	end
end
function lua_Dy_CrystalExplosionDel()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( MyPet ) == true then
		DelObj ( MyPet ) ---刪除寵物
		return true
	end
end
function lua_Dy_GoodByeMyPet_t()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( Mypet ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		say ( OwnerID() , "11")
		return false
	end
	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
	if CheckID( Mypet ) == true then 
		if MypetID == 102297 then
			DelObj ( MyPet ) ---刪除寵物
			return true
		elseif MypetID ~= 102297 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			say ( Mypet , "11")
			return false
		end
	end
end
function lua_Dy_DarkHeart()
	local RattanBuff = 505753
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , RattanBuff ) == true then
			local Count = BuffCount(ID)				
			for BuffPos=0 , Count-1 do
				--local BuffPos = Lua_BuffPosSearch( ID , RattanBuff )			
				if BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() 
					and BuffInfo(ID , BuffPos , EM_BuffInfoType_BuffID ) == RattanBuff then
					local PLV = BuffInfo( ID , BuffPos , EM_BuffInfoType_Power )	
					--say(OwnerID() , PLV)
					if BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 1 then
						SysCastSpellLv( OwnerID() , ID , 494963 , PLV )
					end
				end
			end	
		end
	end	
end
function lua_Dy_DarkHeartCheck()
	AddBuff( OwnerID() , 505808 , 0 , -1 )
end
function lua_Dy_SoulAtk_test()	--法術發動成功時扣血用
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP ) ------抓寵物滿血HP
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) -----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100
	local HP = math.floor(abs(MyPetMaxHp*0.2))
	if HPPercent > 20 then 
			WriteRoleValue ( MyPet , EM_RoleValue_HP, MyPetHp-HP)
			say (OwnerID(), MyPetHp-HP)
			return true
	elseif HPPercent < 20 or HPPercent == 20 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "B")
			return false
		end
end

function lua_Dy_testODO()
	say (OwnerID(), " First")
end
function dy_test_01()
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	say (MasterGID , "Master")
	say (OwnerID() , "owner")
	say (TargetID() , "target")
end
function Dy_Z23DIE ()
	SetPlot( OwnerID() ,"dead","Dy_DIETEST",10 )
end
function Dy_DIETEST()--
	say (TargetID() , "target")
end
function Dy_BOSS_T ()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_WALK_FORWARD)  
	LuaFunc_MoveToFlag( OwnerID(), 781142 , 2 ,0 ) 
end
function Dy_z23_12TEST() --戰鬥表演測試用
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
	local ant =  CreateObj ( 101672 , X+35 , Y , Z+35  , Dir , 1) 
	SetModeEx( ant  ,EM_SetModeType_Show, true )--顯示*
	SetModeEx( ant  ,EM_SetModeType_Searchenemy , false ) --索敵*
	SetModeEx( ant  ,EM_SetModeType_Save , true ) --儲存*
	SetModeEx( ant  ,EM_SetModeType_Revive , false ) --重生*
	SetModeEx( ant  ,EM_SetModeType_Obstruct , false )--阻擋*
	SetModeEx( ant  ,EM_SetModeType_Strikback , true ) --反擊*
	SetModeEx( ant  ,EM_SetModeType_Fight , true ) --砍殺*
	SetModeEx( ant  ,EM_SetModeType_Gravity , false ) --重力*	
	SetModeEx( ant  ,EM_SetModeType_Move , true ) --移動*
	SetModeEx( ant  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
	SetModeEx( ant  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
	SetModeEx( ant  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
	AddToPartition( ant, RoomID)
	AddBuff( OwnerID() , 502957 , 0 ,600)
	SetAttack( ant , OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,ant ) --存到怪的容器1裡面
	WriteRoleValue( ant , EM_RoleValue_Register1 , OwnerID())	

end