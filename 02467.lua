------------------------------------------------------------------------
--設定角色119178移動為步行動作（初始劇情）
function William_119178_npc1()
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0 )
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true ) --顯示
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --索敵
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --標記
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --儲存
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --反擊
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --砍殺
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --重力	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true ) --移動
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false ) --物件頭上的名稱是否顯示
end
------------------------------------------------------------------------
--設定角色119179移動為步行動作（初始劇情）
function William_119179_npc2()
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0 )
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true ) --顯示
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --索敵
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --標記
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --儲存
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --反擊
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --砍殺
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --重力	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true ) --移動
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false ) --物件頭上的名稱是否顯示
end
------------------------------------------------------------------------
--設定角色119355移動為步行動作（初始劇情）
function William_119355_npc3()
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0 )
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true ) --顯示
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --索敵
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --標記
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --儲存
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --反擊
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --砍殺
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --重力	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true ) --移動
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false ) --物件頭上的名稱是否顯示
end
------------------------------------------------------------------------
--按下按鈕後
function William_show424578_01()
	CloseSpeak( OwnerID() )
	DelObj ( TargetID() )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local controller1=CreateObjByFlag( 118119, 781009 , 0 , 1 ) --產生表演控制器118119於781009-0                              
	local controller2= CreateObjByFlag( 119437, 781009 , 1 , 1 ) --產生判斷控制器119437於781009-1
	SetModeEx( controller1  ,EM_SetModeType_Show , false ) --顯示
	SetModeEx( controller1  ,EM_SetModeType_Searchenemy , false ) --索敵
	SetModeEx( controller1  ,EM_SetModeType_Mark , false ) --標記
	SetModeEx( controller1  ,EM_SetModeType_Save , false ) --儲存
	SetModeEx( controller1  ,EM_SetModeType_Strikback , false ) --反擊
	SetModeEx( controller1  ,EM_SetModeType_Fight , false ) --砍殺
	SetModeEx( controller1  ,EM_SetModeType_Gravity , true ) --重力	
	SetModeEx( controller1  ,EM_SetModeType_Move , false ) --移動
	SetModeEx( controller1  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	SetModeEx( controller1  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	SetModeEx( controller1  ,EM_SetModeType_HideName , true ) --物件頭上的名稱是否顯示 
	SetModeEx( controller2  ,EM_SetModeType_Show , false ) --顯示
	SetModeEx( controller2  ,EM_SetModeType_Searchenemy , false ) --索敵
	SetModeEx( controller2  ,EM_SetModeType_Mark , false ) --標記
	SetModeEx( controller2  ,EM_SetModeType_Save , false ) --儲存
	SetModeEx( controller2  ,EM_SetModeType_Strikback , false ) --反擊
	SetModeEx( controller2  ,EM_SetModeType_Fight , false ) --砍殺
	SetModeEx( controller2  ,EM_SetModeType_Gravity , true ) --重力	
	SetModeEx( controller2  ,EM_SetModeType_Move , false ) --移動
	SetModeEx( controller2  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	SetModeEx( controller2  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	SetModeEx( controller2  ,EM_SetModeType_HideName , true ) --物件頭上的名稱是否顯示 
	sleep(10)
	AddToPartition( controller1,RoomID )
	AddToPartition( controller2,RoomID )
end
------------------------------------------------------------------------
--表演控制器產生後
function William_show424578_02()
	--SetModeEx( OwnerID()  ,EM_SetModeType_Show , false ) --顯示
	--SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --索敵
	--SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --標記
	--SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --儲存
	--SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --反擊
	--SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --砍殺
	--SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --重力	
	--SetModeEx( OwnerID()  ,EM_SetModeType_Move , false ) --移動
	--SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	--SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	--SetModeEx( OwnerID()  ,EM_SetModeType_HideName , true ) --物件頭上的名稱是否顯示
	local npc1=Lua_DW_CreateObj( "flag" , 119178, 781006 , 0 , 1 , 1 ) --產生119178於781006-0
	sleep(10)
	Say( npc1, "[SC_119178_01]" ) --SC_119178_01：來吧～！我們馬上就會知道答案了！
	sleep(15)
	LuaFunc_MoveToFlag( npc1, 781006 , 1 , 1 ) --使119178走至781006-1
	sleep(25)
	FaceFlag ( npc1, 781007 , 1 ) --使119178轉面向朝781007-1
	AdjustDir( npc1,0) --轉面向
	sleep(10)
	Say( npc1, "[SC_119178_02]" ) --SC_119178_02：弟兄們...把人帶出來！
	sleep(15)
	local npc3=Lua_DW_CreateObj( "flag" , 119355, 781008 , 0 , 1 , 1 ) --產生119355於781008-0
	sleep(10)
	Say( npc3, "[SC_119355_01]" )--SC_119355_01：報告～是！
	sleep(05)
	local npc2=Lua_DW_CreateObj( "flag" , 119179, 781007 , 0 , 1 , 1 ) --產生119179於781007-0
	sleep(10)
	Say( npc2, "[SC_119179_01]" )--SC_119179_01：哼～維拉斯！原來是你搞的鬼...
	sleep(05)
	LuaFunc_MoveToFlag( npc3, 781008 , 1 , 1 ) --使119355走至781008-1
	LuaFunc_MoveToFlag( npc2, 781007 , 1 , 1 ) --使119179走至781007-1
	sleep(25)
	FaceFlag ( npc3, 781006 , 1 ) --使119355轉面向朝781006-1
	AdjustDir( npc3,0) --轉面向
	sleep(05)
	FaceFlag ( npc2, 781006 , 1 ) --使119179轉面向朝781006-1
	AdjustDir( npc2,0) --轉面向
	Say( npc1, "[SC_119178_03]" ) --SC_119178_03：安克斯！其它多餘的廢話我想我們也不必多說了，你現在有二種選擇...
	sleep(35)
	Say( npc1, "[SC_119178_04]" ) --SC_119178_04：第一，將你送進城內並交給王國軍，你身為盜賊、逃犯、和叛將，下場會是如何你應該很清楚...
	sleep(35)
	Say( npc1, "[SC_119178_05]" ) --SC_119178_05：第二，與我們合作演出一場戲並救出威爾王儲，不論成功或失敗，你仍然可以繼續做為一名盜賊...
	sleep(35)
	Say( npc1, "[SC_119178_06]" ) --SC_119178_06：而逃犯和叛將這些罪名，將會只是對於現在的王國軍而言...
	sleep(35)
	Say( npc1, "[SC_119178_07]" ) --SC_119178_07：安克斯～你沒有多少時間可以考慮...
	sleep(30)
	Say( npc2, "[SC_119179_02]" )--SC_119179_02：哈～你求人的方式還真是沒有格調...
	sleep(35)
	Say( npc2, "[SC_119179_03]" )--SC_119179_03：不過～既然我是盜賊，你這種下流手段對我而言當然也是不足為奇...
	sleep(35)
	Say( npc2, "[SC_119179_04]" )--SC_119179_04：我可以跟你合作，但是我會有我自己的理由...
	sleep(35)
	Say( npc2, "[SC_119179_05]" )--SC_119179_05：不論成功或失敗，都將會與你們反抗軍毫無關係...
	sleep(30)
	Say( npc1, "[SC_119178_08]" ) --SC_119178_08：呵呵！有或沒有格調都好，我希望到時後大家都是遵守約定的人！
	sleep(35)
	Say( npc1, "[SC_119178_09]" ) --SC_119178_09：好～那麼其他有參與行動的成員，就依照原來的分配下去進行準備...
	sleep(30)
	Say( npc1, "[SC_119178_10]" ) --SC_119178_10：完成之後我們立刻出發！
	sleep(25)
	LuaFunc_MoveToFlag( npc1, 781006 , 0 , 1 ) --使119178走回781006-0
	sleep(20)
	FaceFlag ( npc1, 781006 , 1 ) --使119178轉面向朝781006-1
	AdjustDir( npc1,0) --轉面向
	DelObj ( npc1 )--刪除119178
	sleep(05)
	Lua_DW_CreateObj( "flag" , 119060, 781006 , 0 , 1 , 1 ) --產生119060於781006-0
	sleep(05)
	DelObj ( npc2 )--刪除119179
	DelObj ( npc3 )--刪除119355
	DelObj ( OwnerID() )--刪除118119（自己）
end
------------------------------------------------------------------------
--判斷控制器產生後
function William_show424578_03()
	--SetModeEx( OwnerID()  ,EM_SetModeType_Show , false ) --顯示
	--SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --索敵
	--SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --標記
	--SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --儲存
	--SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --反擊
	--SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --砍殺
	--SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --重力	
	--SetModeEx( OwnerID()  ,EM_SetModeType_Move , false ) --移動
	--SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	--SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --此物件不會被搜尋到
	--SetModeEx( OwnerID()  ,EM_SetModeType_HideName , true ) --物件頭上的名稱是否顯示
	local x={}
	local y=0
		for i=0,36,1 do
			x=SearchRangePlayer ( OwnerID() , 150 )
			local num=table.getn(x)
				for j=0,num,1 do
					if	CheckAcceptQuest( x[j], 424578)==TRUE	then
						AddBuff(x[j] ,620755 ,0 ,-1)
					end
				end
			Sleep(15)	
		end
	sleep(10)
	CallPlot( OwnerID(), "William_show424578_04", OwnerID() )
	sleep(10)
	DelObj ( OwnerID() ) 
end
------------------------------------------------------------------------
function William_show424578_04()
	local x={}
        	x=SearchRangePlayer( OwnerID() , 150 ) 
	local num=table.getn(x)		
		for i=0,num,1 do
			if CheckAcceptQuest( x[i], 424578)==TRUE then
			   	local buffA=Lua_BuffPosSearch( x[i] ,620755)
				if BuffInfo( x[i] , buffA , EM_BuffInfoType_Power )>=30 then
				   SetFlag( x[i], 545497, 1 )
				   CancelBuff( x[i], 620755 )
				   DelBodyItem( x[i], 545579, 1 ) 
				end
			end
		end
end
------------------------------------------------------------------------