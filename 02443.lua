function Lua_na_jackbox_use()  --使用物品，執行劇情
	BeginPlot( OwnerID(), "Lua_na_jackbox_01" , 0 )
end


function Lua_na_jackbox_01() --抓玩家座標產生物件
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  114966  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件  嚇人傑克箱
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件

end
	 

--嚇人傑克箱初始劇情
function Lua_na_jackbox()
	PlayMotion( OwnerID() , 148 )
	sleep(50)  --停留5秒鐘
	PlayMotion( OwnerID(),  15 )  --播放動作   
	CastSpell( OwnerID(), TargetID(), 497644 )  --施放5秒範圍恐懼法術 150內50名玩家
	Npcsay( TargetID(), "[SC_240192_02]" )
	sleep(30)
	DelObj( OwnerID()) --刪除
end 



function Lua_na_jackbox_message()
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_240192_01]" ,0 )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_240192_01]" ,0)	
end