kg_BossGV = {}

function kg_CtrlInit( Obj )--�������M�γ]�w
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( Obj , EM_SetModeType_Revive, false )	--�i����
	SetModeEx( Obj , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
end

function kg_MoveCtrl( Obj )--�i���ʤ�����
	Obj = Obj or OwnerID()
	SetModeEx( Obj , EM_SetModeType_Revive, false )	--�i����
	SetModeEx( Obj , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
end

function kg_DoorInit( Obj )--���ת��M�γ]�w
	Obj = Obj or OwnerID()
	kg_CtrlInit( Obj )
	SetModeEx( Obj , EM_SetModeType_Obstruct, true) 		---����(�O)
end

function kg_ActorInit( Obj )
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
end

function kg_InvisibleObjInit( Obj )--���Ϊ���
	Obj = Obj or OwnerID()
	kg_CtrlInit( Obj )
	SetModeEx( Obj , EM_SetModeType_Show, FALSE)--�O�_ø�s�X�ҫ�
end

function kg_BoxInit( Obj )--�_�c
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, TRUE) 	---�Y����(�_)
	SetModeEx( Obj , EM_SetModeType_Mark, true)
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Obstruct, true) 			--����(�O)
	SetModeEx( Obj , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
	SetModeEx( Obj , EM_SetModeType_NotShowHPMP, true)
end

function kg_Target( Obj )--���Y�H
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, TRUE) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
end

function kg_MoveTarget( Obj )--���ʤ��Y�H
	Obj = Obj or OwnerID()
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, TRUE) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
end

function kg_DeadBody( Obj )--����
	Obj = Obj or OwnerID()
	MoveToFlagEnabled( Obj, false )
	SetModeEx( Obj , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Obj , EM_SetModeType_Fight, false) ---�i���(�_)
	SetModeEx( Obj , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false)	---����(�_)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, true) 	---�Y����(�_)
	SetModeEx( Obj , EM_SetModeType_Mark, true)
end