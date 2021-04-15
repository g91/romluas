kg_BossGV = {}

function kg_CtrlInit( Obj )--中控器專用設定
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Obj , EM_SetModeType_Revive, false )	--可重生
	SetModeEx( Obj , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
end

function kg_MoveCtrl( Obj )--可移動中控器
	Obj = Obj or OwnerID()
	SetModeEx( Obj , EM_SetModeType_Revive, false )	--可重生
	SetModeEx( Obj , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
end

function kg_DoorInit( Obj )--阻擋門專用設定
	Obj = Obj or OwnerID()
	kg_CtrlInit( Obj )
	SetModeEx( Obj , EM_SetModeType_Obstruct, true) 		---阻擋(是)
end

function kg_ActorInit( Obj )
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
end

function kg_InvisibleObjInit( Obj )--隱形物件
	Obj = Obj or OwnerID()
	kg_CtrlInit( Obj )
	SetModeEx( Obj , EM_SetModeType_Show, FALSE)--是否繪製出模型
end

function kg_BoxInit( Obj )--寶箱
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, TRUE) 	---頭像框(否)
	SetModeEx( Obj , EM_SetModeType_Mark, true)
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Obstruct, true) 			--阻擋(是)
	SetModeEx( Obj , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
	SetModeEx( Obj , EM_SetModeType_NotShowHPMP, true)
end

function kg_Target( Obj )--木頭人
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Obj , EM_SetModeType_Fight, TRUE) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
end

function kg_MoveTarget( Obj )--移動木頭人
	Obj = Obj or OwnerID()
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Fight, TRUE) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
end

function kg_DeadBody( Obj )--屍體
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---可砍殺(否)
	SetModeEx( Obj , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---索敵(否)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, true) 	---頭像框(否)
	SetModeEx( Obj , EM_SetModeType_Mark, true)
end