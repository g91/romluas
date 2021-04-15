------------------------------------------------------------------------
Function Z23_HeroSoul_01()
	AddBuff ( OwnerID(),621848,1,-1)
End
------------------------------------------------------------------------
function Z23_DragonSoulPieces_FX01()
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local xyz1={x,y-10,z}
	local npc1=Lua_DW_CreateObj( "xyz" , 120278, xyz1 , 0, 1, 1 )--創建破碎的龍魂
	SetModeEx( npc1, EM_SetModeType_Searchenemy , false )-- 索敵
	SetModeEx( npc1, EM_SetModeType_Fight , false )-- 可砍殺攻擊
	SetModeEx( npc1, EM_SetModeType_Strikback , false )-- 反擊
	SetModeEx( npc1, EM_SetModeType_ShowRoleHead , false )-- 頭像框
	SetModeEx( npc1, EM_SetModeType_Mark , true )-- 標記
	SetModeEx( npc1, EM_SetModeType_HideName , true )-- 名稱
	SetModeEx( npc1, EM_SetModeType_Move , true )-- 移動
	SetModeEx( npc1, EM_SetModeType_NotShowHPMP, true )-- HP
	SetModeEx( npc1, EM_SetModeType_Gravity, false )--重力
	SetModeEx( npc1, EM_SetModeType_Save, true )--儲存
	AddToPartition( npc1 , 0 )
end
------------------------------------------------------------------------
function Z23_DragonSoulPieces_FX02()
	AddBuff ( OwnerID(),622263,1,-1)
end
------------------------------------------------------------------------
function Z23_HeroSoul_Cast01()
	SetPlot( OwnerID(),"touch","Z23_HeroSoul_Cast02",25 ) 
end
------------------------------------------------------------------------
function Z23_HeroSoul_Cast02()
	CastSpell( OwnerID(), TargetID(), 499303)
end
------------------------------------------------------------------------
function Z23_Transport_FX01()
	AddBuff ( OwnerID(),622375,1,-1)
end
------------------------------------------------------------------------
function Z23_ReproducedRune_FX01()
	AddBuff ( OwnerID(),622507,1,-1)
end
------------------------------------------------------------------------
function Z23_GuardianBuff_01()
	AddBuff ( OwnerID(),622587,1,-1)
	Cl_ZoneMonster_RandBuff()
end
------------------------------------------------------------------------
function Z23_Skill622588_01()
	if CheckBuff( TargetID(), 622587)==true then
		CancelBuff( TargetID(), 622587)
		DW_QietKillOne(OwnerID(), 106805 )
		local Num=Rand(3)
			if Num==0 then 
				SetAttack( TargetID(), OwnerID())
			end
	end
end
------------------------------------------------------------------------
Function Z23_GuardianCast_FX00()
	local Stone=SearchRangeNPC(OwnerID(), 50)
	for i=0,table.getn(Stone) do
		if ReadRoleValue( Stone[i] , EM_RoleValue_OrgID)==120279 then
			if ReadRoleValue ( Stone[i], EM_RoleValue_Register2 )==0 then
				WriteRoleValue (Stone[i], EM_RoleValue_Register2, 1)
				SetModeEx( OwnerID(), EM_SetModeType_Searchenemy , false )
				SetModeEx( OwnerID(), EM_SetModeType_Strikback , false )
				MoveToFlagEnabled( OwnerID(), false )
				CallPlot( Stone[i], "Z23_StrangeStone_FX05", Stone[i] )
				Callplot( OwnerID() ,"Z23_GuardianCast_FX01", Stone[i])
				return
			else PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
			end
		else PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
		end
	end
end
------------------------------------------------------------------------
function Z23_GuardianCast_FX01(Stone)
	FaceObj( OwnerID(), Stone)
	AdjustFaceDir( OwnerID(), Stone, 0 )
	local X=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local Y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local Z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local S={X, Y, Z}
	local NPC=Lua_DW_CreateObj( "xyz", 120724, S, 0, 1, 1 )
	SetModeEx( NPC, EM_SetModeType_Searchenemy , false )-- 索敵
	SetModeEx( NPC, EM_SetModeType_Fight , false )-- 可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Strikback , false )-- 反擊
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead , false )-- 頭像框
	SetModeEx( NPC, EM_SetModeType_Mark , false )-- 標記
	SetModeEx( NPC, EM_SetModeType_HideName , true )-- 名稱
	SetModeEx( NPC, EM_SetModeType_Move , false )-- 移動
	SetModeEx( NPC, EM_SetModeType_NotShowHPMP, true )-- HP
	SetModeEx( NPC, EM_SetModeType_Gravity, true )--重力
	SetModeEx( NPC, EM_SetModeType_Save, false )--儲存
	Sleep(10)
	AddToPartition( NPC , 0 )
	AttachObj( NPC, OwnerID() ,1 , "p_hit_point01" , "p_hit_point01" )
	Sleep(20)
	CastSpell( OwnerID(),OwnerID(),850163)
	Sleep(10)
	CastSpell( Stone, Stone, 850181)
	Sleep(20)
	AddBuff ( OwnerID(),622587,1,-1)
	CallPlot(Stone,"LuaFunc_ResetObj",Stone)
	Sleep(10)
	MoveToFlagEnabled( OwnerID(), true )
	SetModeEx( OwnerID(), EM_SetModeType_Searchenemy , true)
	SetModeEx( OwnerID(), EM_SetModeType_Strikback , true)
end
------------------------------------------------------------------------
function Z23_GuardianCast_FX02()
	AddBuff ( OwnerID(),622554,1,-1)
	Sleep(10)
	CastSpell( OwnerID(),OwnerID(),850158)
	Sleep(60)
	DetachObj(OwnerID() )
	Sleep(20)
	DelObj ( OwnerID() )
end
------------------------------------------------------------------------
Function Z23_NPC120720_01()
	local QuestX={ 425408, 425596, 425615 }--醫者之心
	local QuestY={ 425397, 425587, 425606 }--意外所獲
	for i = 1, table.getn(QuestX) do
		if CheckAcceptQuest( OwnerID(), QuestX[i] )==TRUE then
			SetSpeakDetail( OwnerID(), "[SC_425408_01]" )--嗯嗯....[120736]那邊的情況我也有聽說吶！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425397_04"), "Z23_Quest425397_02", 0 )--沒問題，我已經準備好了。
			return
		end
	end
	LoadQuestOption( OwnerID() )
	for i = 1, table.getn(QuestY) do
		if CheckAcceptQuest( OwnerID(), QuestY[i] )==TRUE then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425397_01"), "Z23_Quest425397_01", 0 )--向[120720]說明你的來意。
		end
	end
end
------------------------------------------------------------------------
Function Z23_Quest425397_01()
	if	CheckFlag( OwnerID(), 546291 )==false then
		SetSpeakDetail( OwnerID(), "[SC_425397_02]" )--嗯.....是[120284]的特別指示嗎？
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425397_04"), "Z23_Quest425397_02", 0 )--沒問題，我已經準備好了。
	else 	SetSpeakDetail( OwnerID(), "[SC_425397_03]" )--印象中.....我好像才協助過你，不是嗎？
	end
end
------------------------------------------------------------------------
Function Z23_Quest425408_01()
	if	CheckFlag( OwnerID(), 546291)==true then
		SetSpeakDetail( OwnerID(), "[SC_425397_03]" )
	else 	SetSpeakDetail( OwnerID(), "[SC_425408_01]" )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425397_04"), "Z23_Quest425397_02", 0 )
	end
end
------------------------------------------------------------------------
Function Z23_Quest425397_02()
	if CheckFlag( OwnerID(), 546291 )==false then
		SetScriptFlag( OwnerID(), 546291, 1 )
		AddBuff ( OwnerID(),622589,1,-1)
		local Num=Rand(3)+1
		if Num==1 then
			ChangeZone( OwnerID(), 22, 0, -17707, 562, -23552, 2 )
		end
		if Num==2 then
			ChangeZone( OwnerID(), 22, 0, -17296, 683, -23936, 314 )
		end
		if Num==3 then
			ChangeZone( OwnerID(), 22, 0, -16298, 883, -23730, 216 )
		end
	else	SetSpeakDetail( OwnerID(), "[SC_425397_03]" )--印象中.....我好像才協助過你，不是嗎？
	end
end
------------------------------------------------------------------------
Function Z23_Quest425397_03()
	if CheckAcceptQuest(OwnerID(),425397)==true and	
	CountBodyItem( OwnerID(), 241284 )==1 then
	DelBodyItem( OwnerID(), 241284, 1 )
	GiveBodyItem( OwnerID(), 546290, 1 )
	end
	if CheckAcceptQuest(OwnerID(),425587)==true and	
	CountBodyItem( OwnerID(), 241284 )==1 then
	DelBodyItem( OwnerID(), 241284, 1 )
	GiveBodyItem( OwnerID(), 546290, 1 )
	end
	if CheckAcceptQuest(OwnerID(),425606)==true and	
	CountBodyItem( OwnerID(), 241284 )==1 then
	DelBodyItem( OwnerID(), 241284, 1 )
	GiveBodyItem( OwnerID(), 546290, 1 )
	end
	CloseSpeak( OwnerID() )
end
------------------------------------------------------------------------
Function Z23_Quest425397_04()
	--Lua_ZonePE_3th_GetScore(150)
	SetScriptFlag( TargetID(), 546291, 0 )
	ScriptMessage( OwnerID(), TargetID(), 2, "[SC_425397_07]", 0 )
	sleep(45)
	ChangeZone( TargetID(), 23, 0, -10761.5, 906.6, -18196.9, 18.3 )
end
------------------------------------------------------------------------
Function Z23_Quest425397_05()
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_425397_05]", 0 )
	sleep(10)
	CancelBuff( OwnerID(), 622590)
end
------------------------------------------------------------------------
function Z23_StrangeStone_FX01()
	AddBuff ( OwnerID(),622317,1,-1)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 5)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register2, 0)
	SetPlot( OwnerID(),"touch","Z23_StrangeStone_FX02",20 )
end
------------------------------------------------------------------------
function Z23_StrangeStone_FX02()
	if ReadRoleValue ( TargetID(), EM_RoleValue_Register2 )==0 then
		WriteRoleValue ( TargetID(), EM_RoleValue_Register2, 1)
		local Stone=ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
		local X=Rand(3)+1
		local Num=Stone-X
		FaceObj( OwnerID(), TargetID())
		AdjustFaceDir( OwnerID(), TargetID(), 0 )
		CallPlot( TargetID(), "Z23_StrangeStone_FX04", TargetID() )
		CastSpell( OwnerID(), TargetID(), 850197)
		Sleep(60)
		if Num<=0 then 
			CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
		else WriteRoleValue( TargetID() , EM_RoleValue_Register1, Num)
		end
	else return False
	end
end
------------------------------------------------------------------------
function Z23_StrangeStone_FX03()
	GiveBodyItem( OwnerID(), 241322, 1 )
end
------------------------------------------------------------------------
function Z23_StrangeStone_FX04()
	SetPlot( OwnerID(),"touch","",0 )
	Sleep(60)
	WriteRoleValue ( OwnerID(), EM_RoleValue_Register2, 0 )
	SetPlot( OwnerID(),"touch","Z23_StrangeStone_FX02",20 )
end
------------------------------------------------------------------------
function Z23_StrangeStone_FX05()
	SetPlot( OwnerID(),"touch","",0 )
	Sleep(80)
	SetPlot( OwnerID(),"touch","Z23_StrangeStone_FX02",20 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register2, 0)
end
------------------------------------------------------------------------
Function Z23_GuardianDead_FX00()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_DEAD)
	AddBuff ( OwnerID(),622317,1,-1) 
end
------------------------------------------------------------------------
function Z23_NPCHide106614_00()
	local Num=Rand(3)
	if Num==0 then
		CallPlot( OwnerID(), "Lua_DW_Idle", OwnerID())
	else	CallPlot( OwnerID(), "Lua_DW_Idle", OwnerID())
		AddBuff ( OwnerID(), 622861 , 0, 15)
	end
end
------------------------------------------------------------------------
function Z23_NPC120284_01()--莫那．堤加達對話
	LoadQuestOption( OwnerID() )	
End
------------------------------------------------------------------------
