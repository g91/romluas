------------------------------------------------------------------------
function Z23_NPC106617_00()
	Sleep(05)
	if ReadRoleValue( OwnerID(), EM_RoleValue_IsAttackMode ) ==0 then
		local Monster={}
		local Enemy=0
		Monster=SearchRangeNPC( OwnerID(), 90 )
		for i=0,table.getn(Monster) do
			if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID)==106617 then
				Enemy=Monster[i]
				if ReadRoleValue( Enemy, EM_RoleValue_IsAttackMode ) ==0 then
					--SetRoleCampID(Enemy,WF_D) 
					SetAttack( Enemy, OwnerID() )
					SetAttack( OwnerID(), Enemy )
				end
			end
		end
	end
	CallPlot( OwnerID(), "Lua_DW_Idle" ,OwnerID() )
end
------------------------------------------------------------------------
function Z23_NPC106611_00()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_SLEEP)
	AddBuff ( OwnerID(), 622653, 1, -1 )
end
------------------------------------------------------------------------
function Z23_NPC120281_00()--艾爾文．柏格
	SetPlot( OwnerID(),"touch","Z23_Quest425410_00",0 )
end
------------------------------------------------------------------------
function Z23_Quest425410_00()--追根究柢
	if 	CheckAcceptQuest( TargetID(), 425410)==TRUE and
		CountBodyItem( TargetID(), 241324 )>0 then
		if 	CheckFlag( TargetID(), 546297)==False then
			GiveBodyItem( TargetID(), 546297, 1 )
			CloseSpeak( TargetID() )
		end
	end
end
------------------------------------------------------------------------
Function Z23_NPC106620_Fight00()
	while 1 do
		local Target=HateListInfo(OwnerID() ,0 ,EM_HateListInfoType_GItemID )
		PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
		Sleep(10)
		Say(OwnerID(),"Attack!!")
		local Monster=SearchRangeNPC(OwnerID(),200)
		for i=0,table.getn(Monster) do
			if ReadRoleValue(Monster[i], EM_RoleValue_OrgID)==106473 or
			ReadRoleValue(Monster[i], EM_RoleValue_OrgID)==106611 or
			ReadRoleValue(Monster[i], EM_RoleValue_OrgID)==106612 or
			ReadRoleValue(Monster[i], EM_RoleValue_OrgID)==106613 or
			ReadRoleValue(Monster[i], EM_RoleValue_OrgID)==106614 or
			ReadRoleValue(Monster[i], EM_RoleValue_OrgID)==106617 then
			SetAttack(Monster[i], Target) 
			end
		end
	Sleep(50)
	end
End
------------------------------------------------------------------------
function Z23_npc106810_00()
	SetModeEx( OwnerID(), EM_SetModeType_Searchenemy, false )--不索敵
	SetModeEx( OwnerID(), EM_SetModeType_Fight, false )--不可砍殺攻擊
	SetModeEx( OwnerID(), EM_SetModeType_Strikback, false )--不反擊
	SetModeEx( OwnerID(), EM_SetModeType_HideName, false )--顯示名稱
	SetModeEx( OwnerID(), EM_SetModeType_Move, false )--無法移動
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--不顯示血量
	SetModeEx( OwnerID(), EM_SetModeType_Gravity, false )--有重力
	SetModeEx( OwnerID(), EM_SetModeType_Mark, true )--顯示標記
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, false )--不顯示頭像框
	SetModeEx( OwnerID(), EM_SetModeType_HideName , false )--顯示名稱
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--不顯示血量
	SetCursorType( OwnerID() , eCursor_interact ) 
	SetPlot( OwnerID(),"touch","Z23_npc106810_01",40 )
end
------------------------------------------------------------------------
function Z23_npc106810_01()
	if CountBodyItem( OwnerID(), 241226 )>=1 then
		CastSpell( OwnerID(), TargetID(), 850183 )
	else return
	end
end
------------------------------------------------------------------------