function Lua_bk_wall_start_102469()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local door = CreateObjByFlag(104162,780470,9,1)----------------------出現ㄧ個觸碰劇情
	SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( door , EM_SetModeType_Mark, false)
	SetModeEx( door , EM_SetModeType_HideName, false)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( door , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( door , EM_SetModeType_Searchenemy, false)
	SetModeEx( door , EM_SetModeType_Show, false)
	AddToPartition(door,RoomID)
	SetPlot( door , "range" , "Lua_bk_wall_ran_102706" , 100 )----寫入範圍劇情
end
function Lua_bk_wall_ran_102706()
	SetPlot( TargetID()  ,"range", "" ,50 )
	sleep(10)
	BeginPlot( TargetID() , "Lua_bk_wall_102706",0 )---開始觸發式劇情
end
function Lua_bk_wall_touch_102706()
	local start= ReadRoleValue(TargetID() ,EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,40 )
	WriteRoleValue(start, EM_RoleValue_Register9,1)
	PlayMotionEX( TargetID() ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
end
function Lua_bk_wall_102706()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local start=OwnerID()
	local twice=0
	local gg=0
	local door={}
	local dm1=0
	local dm2=0
	local ggcount = CreateObjByFlag(113417,780470,8,1)----------------------出現ㄧ個觸碰劇情
	AddToPartition( ggcount , RoomID )
	WriteRoleValue(ggcount,EM_RoleValue_PID,start)
	SetPlot( ggcount , "touch" , "Lua_bk_wall_touch_102706" , 50 )----寫入關閉劇情
	for i=1 , 7 do
		door[i] = CreateObjByFlag(104163,780470,i,1)----------------------出現ㄧ個觸碰劇情
		SetModeEx( door[i] , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( door[i] , EM_SetModeType_Mark, false)
		SetModeEx( door[i] , EM_SetModeType_HideName, false)
		SetModeEx( door[i] , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( door[i] , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door[i] , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
		SetModeEx( door[i] , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( door[i] , EM_SetModeType_Move, false) ---移動	
		SetModeEx( door[i] , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( door[i] , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( door[i] , EM_SetModeType_Searchenemy, false)
		SetModeEx( door[i] , EM_SetModeType_Show, true)
		AddToPartition( door[i] , RoomID )
	end
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_05]" , 1 )---------------機關啟動
	sleep(20)
	while 1 do 
	sleep(15)
	twice=twice+1
		gg=ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
		if gg==0 then 
			if twice<=7 then 
				---PlayMotionEX( door[twice], ruFUSION_ACTORSTATE_activate_begin,ruFUSION_ACTORSTATE_activate_loop  )
				SetDefIdleMotion(door[twice],ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx(door[twice],EM_SetModeType_Obstruct, true )--阻擋
			end
			if twice >= 16 then 
			WriteRoleValue(OwnerID(), EM_RoleValue_Register9,2)
			end
		end
		if gg==1 then 
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_06]" , 1 )---------------機關啟動
			for j=7,1,-1 do 
				SetModeEx(door[j], EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion(door[j],ruFUSION_MIME_IDLE_STAND)
				--PlayMotionEX(door[j],ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
				sleep(10)
				DelObj(door[j])
			end
			sleep(20)
			break
		end
		if gg==2 then 
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_07]" , 1 )---------------機關啟動
			for j=7,1,-1 do 
				SetModeEx(door[j], EM_SetModeType_Obstruct, false )--阻擋
				--PlayMotionEX(door[j],ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
				SetDefIdleMotion(door[j],ruFUSION_MIME_IDLE_STAND)
				sleep(10)
				DelObj(door[j])
			end
			dm1= CreateObjByFlag(102810,780470,10,1)----------------------小怪
			SetModeEx( dm1 , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( dm1 , EM_SetModeType_Mark, true)
			SetModeEx( dm1 , EM_SetModeType_HideName, true)
			SetModeEx( dm1 , EM_SetModeType_ShowRoleHead, true)
			SetModeEx( dm1 , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( dm1 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
			SetModeEx( dm1 , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( dm1 , EM_SetModeType_Move, true) ---移動	
			SetModeEx( dm1 , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( dm1 , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( dm1 , EM_SetModeType_Searchenemy, true)
			SetModeEx( dm1 , EM_SetModeType_Show, true)
			AddToPartition(dm1 , RoomID )
			dm2= CreateObjByFlag(102810,780470,11,1)----------------------小怪
			SetModeEx( dm2 , EM_SetModeType_Gravity, true) ---重力
			SetModeEx( dm2 , EM_SetModeType_Mark, true)
			SetModeEx( dm2 , EM_SetModeType_HideName, true)
			SetModeEx( dm2 , EM_SetModeType_ShowRoleHead, true)
			SetModeEx( dm2 , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( dm2 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
			SetModeEx( dm2 , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( dm2 , EM_SetModeType_Move, true) ---移動	
			SetModeEx( dm2 , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( dm2 , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( dm2 , EM_SetModeType_Searchenemy, true)
			SetModeEx( dm2 , EM_SetModeType_Show, true)
			AddToPartition(dm2 , RoomID )
			sleep(20)
			break
		end
	end
	DelObj(OwnerID())
end
function Lua_bk_fire0_206467()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local fire=Lua_CreateObjByDir( OwnerID() , 102953 , 50 , 0) --參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件
	SetModeEx( fire , EM_SetModeType_Show, true) ----秀出
	SetModeEx( fire , EM_SetModeType_Mark, false) ----標記
	SetModeEx( fire , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( fire , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( fire , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( fire , EM_SetModeType_Move, false) ---移動	
	SetModeEx( fire , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( fire , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( fire , EM_SetModeType_Searchenemy, false)  ---鎖敵
	AddToPartition( fire , RoomID )
	BeginPlot( fire,"Lua_bk_fire1_206467",0)
end
function Lua_bk_fire1_206467()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local x={}
	for i=1,9 do 
		if i==1 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,0,0,0,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==2 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,30,0,0,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==3 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,-30,0,0,RoomID,0)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==4 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,0,0,30,RoomID,0)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==5 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,30,0,30,RoomID,0)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==6 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,-30,0,30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==7 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,0,0,-30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==8 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,30,0,-30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
		if i==9 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,-30,0,-30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----秀出
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---移動	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---鎖敵
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------原地放火
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------存在時間livetime
		end
	end	
end
function Lua_bk_hand_102686()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)---播放倒在地上動作-------------掙扎的動作 
	sleep(40)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_STAND)
end
function Lua_cang_speak_102686()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_EMOTE_SPEAK)
	sleep(100)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_STAND)
end
----------102948  隱形的怪物
----------102949  現出來的隱形的怪物
function Lua_bk_fire_ch_206467()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102948 then ----------102949  隱形的怪物
		AddBuff( TargetID(), 504838 , 0 , -1)---------------恐懼buff	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102706_08]" , 1 )
		CancelBuff( TargetID() , 505370 )
		SetModeEx( TargetID() , EM_SetModeType_HideName, true)
		SetModeEx( TargetID() , EM_SetModeType_Mark, true) ----標記
	end
end
function Lua_bk_fire_505333()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102953 or 
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113379 or 
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113336 or ----------102949  隱形的怪物
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114295 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114296 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113721 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102680 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104162 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113720 then
		return false
	else
		return true
	end
end

function Lua_bk_chan_505338()-------------------劇情怪物
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102952 then ----------102949  隱形的怪物
		local x=star_CreateObj_NoAdd(TargetID(),114123,0,0,0,RoomID,0)
		AddToPartition( x , RoomID )
		BeginPlot( x , "Lua_bk_chnpc_1_114123",0)----直接變成任務npc 給他ㄧ段
		DelObj(TargetID())
	else 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102706_13]" , 1 )
	end
	
end
function Lua_bk_chnpc_1_114123()
--	if	CountBodyItem(OwnerID(),206467)>0	then
--		SetSpeakDetail(OwnerID(),"[SC_102706_12]")
---	else
	if CheckBuff( OwnerID() , 505358) then 
		SetSpeakDetail(OwnerID(),"[SC_102706_09]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_102706_10]","Lua_bk_chnpc_2_114123", 0 )
	end
---	end
end


function Lua_bk_chnpc_2_114123()
	closespeak(OwnerID())
	GiveBodyItem(OwnerID(),206467,1)
	DisableQuest(TargetID(),true)
	if ReadRoleValue(TargetID(), EM_RoleValue_PID) ~=5 then 
		WriteRoleValue(TargetID(), EM_RoleValue_Livetime,5)
		say( TargetID(),"[SC_102706_11]")
		SetDelayPatrolTime( OwnerID(), 0 )--------------------------把npc設定時間設定  為0
		WriteRoleValue(TargetID(), EM_RoleValue_PID,5)	
		---DW_MoveToFlag(TargetID(),780000,1,0,1)
	end
end
function Lua_bk_lowdm_102948()
	while 1 do	
	AddBuff( OwnerID() , 501055 , 1 , 3600 ) 
	AddBuff( OwnerID(), 505370 , 0 , -1)---------------降低傷害
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false)
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false) ----標記	
		for i = 0 , 30 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			sleep(10)			 	
			if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(150)				
			end				
		end
	end
end
function lua_bk_505376_TransferDM()	--------因為觸發法術的被攻擊觸發只有物理攻擊才能觸發，所以改用每秒產生法術來做( 504034連續產生用 )
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp )	-------最後一次被傷害值( 這個值並不會自己清空 )
	local LastTemp = 0														-------暫存前一次的最後被傷害值
	if ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 0 then  		-------register5用來判斷是當次的被傷害值還是前一次的
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register6 , LastDamage )	-------register6存放當次被傷害值
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register7 , LastDamage )	-------register7存放前一次被傷害值
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register6 )
	end		 
	local TransDamage = LastDamage*1										--------轉移玩家攻擊分身傷害比例
	local TD = math.floor(abs(TransDamage))	
	-----local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if LastDamage ~= LastTemp then
		SysCastSpellLV(OwnerID() , OwnerID() , 494730 , TD )
	end	
end
function Lua_bk_120_206467()------------------------檢查目標  
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == 120 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	
		return false
	end	
end
