--※※支線劇情※※
--02
function Dy_Z23_12CHECK () --檢查士兵還在不在
	local Player,Soldier = OwnerID(),TargetID();
	if DW_CheckQuestAccept("or",Player,425294,425304,425299)==true then
		local OrgID=ReadRoleValue(Soldier,EM_RoleValue_OrgID);
		if OrgID>=106776 and OrgID<=106781 then
			if CheckBuff(Soldier,622209)==true or CheckBuff(Soldier,622210)==true or CheckBuff(Soldier,622211)==true then
				ScriptMessage(Player,Player,1,"[SC_Z23_Q425294_02]",C_YELLOW);--有人協助此士兵！ 
				return false;
			else
				return true;
			end
		else
			ScriptMessage(Player,Player,1,"[SC_Z22_Q424783_03]",C_YELLOW);--目標錯誤！
			return false;
		end
	else
		ScriptMessage( Player, Player , 1 , "[SC_Z22_Q424786_02]" , 0 )  --沒有接受任務！
		return false;
	end
end
function Dy_Z23_1201() --使用物品後施放的法術
	CastSpell( OwnerID(), TargetID(), 850186 );
end
function Lua_425294_BuffCheck()--掛在622209的命中前檢查
	local Player,Soldier = OwnerID(),TargetID();
	local MaxHP=ReadRoleValue(Soldier,EM_RoleValue_MaxHP);
	local HP=ReadRoleValue(Soldier,EM_RoleValue_HP);
	local Rate=HP/MaxHP;
	if Rate>0.5 then
		AddBuff(Soldier,622210,0,-1);--原buff不命中，改上buff2，
		return false;
	else
		return true;--照法術集合上buff1, 立刻撤退
	end
end
function Lua_425294_ItemExecute()--法術集合850186中的基本法術622585
	local Player,Soldier = OwnerID(),TargetID();
	BeginPlot(Soldier,"Lua_425294_JumpPlot",20);
end
function Lua_425294_JumpPlot()
	local Soldier,Player = OwnerID(),TargetID();
	local RetreatFlag=780091
	local RetreatBuff,PowerBuff,MarkBuff=622209,622210,622211
	for Pos=0,BuffCount(Soldier) do
		local BuffID=BuffInfo(Soldier,Pos,EM_BuffInfoType_BuffID)
		if BuffID==RetreatBuff then
			for SN=0,HateListCount(Soldier) do
				local Ant=HateListInfo(Soldier,SN , EM_HateListInfoType_GItemID);
				SysCastSpellLv(Player,Ant,496266,0);
			end
			Lua_425316_SoldierRetreat(Soldier,RetreatFlag,Player)--戰士撤退，script 02650
			DW_QietKillOne(Player,106862);
			return;
		end
		if BuffID==PowerBuff then
			while HateListCount(Soldier)~=0 do
				if CheckID(Player)==true and CheckDistance(Soldier,Player,250)==true then
					if CheckBuff(Soldier,PowerBuff)==false then
						ScriptMessage( Player, Player, 3, "[SC_Z23_Q425294_03]", C_YELLOW )--魔法的效果消失，盡快對[聯盟戰士]使用[祈願符石]！
						return;
					end
				else
					CancelBuff_NoEvent(Soldier,PowerBuff);
					return
				end
				sleep(30)
			end
			AddBuff(Soldier,MarkBuff,0,-1);
			NPCSay(Soldier,"[SC_Z23_Q425294_04]");--謝謝你，這裡沒問題了，你先去幫其他人吧！
			PlayMotion(Soldier,ruFUSION_ACTORSTATE_EMOTE_SALUTE);
			DW_QietKillOne(Player,106886);
			return;
		end
	end
end
function Dy_Z23_12_50up() --50%以上的劇情(沒用到)
	local Player,Soldier = OwnerID(),TargetID();
	local Pos = Lua_BuffPosSearch( OwnerID() , 622210 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local Mode = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) --檢查自己的戰鬥狀態
	if Mode == 0 then --不在戰鬥狀態
		DW_QietKillOne(BuffOwner, 106862  ) --協助士兵保留戰力成功
		CancelBuff_NoEvent( OwnerID(), 622210 ) 
		CancelBuff_NoEvent( OwnerID(), 622211 ) 
	else 
	
	end
end
function Dy_Z23_12_50down() --50%以下的劇情(沒用到)
	--local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	local Pos = Lua_BuffPosSearch( OwnerID() , 622211 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local ant = ReadRoleValue( OwnerID() , EM_RoleValue1 ) 
	--※※關掉索敵與反擊※※
	SetModeEx( OwnerID() ,EM_SetModeType_Searchenemy , false ) --索敵*
	SetModeEx( OwnerID() ,EM_SetModeType_Strikback , false ) --反擊*
	LuaFunc_MoveAllFlag( OwnerID(), 781150 ) --往後移動 
	sleep (50)--5秒後	
	if CheckBuff( OwnerID() , 622209) == true then --如果Buff還在就執行
		CancelBuff_NoEvent( OwnerID(), 622209 ) 
		say (OwnerID() , "[SC_Z23_Q425294_01]") --接下來的路我能自己走，謝謝你，[$playername]...。
		DW_QietKillOne(BuffOwner, 106886  ) --協助士兵撤退
		KillID( OwnerID()  , OwnerID() )
	end
end
function Dy_Z23_12_BuffEND() --Buff結束時 失敗的表演(沒用到)
	--local ant = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local Pos = Lua_BuffPosSearch( OwnerID() , 622211 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	if CheckBuff( OwnerID() , 622211) == true then --如果Buff還在就執行
		say (OwnerID(), "[SC_Z23_Q425294_00]") --字串撐不下去了...
		CancelBuff( OwnerID(), 622211 ) 
		KillID( OwnerID()  , OwnerID() )
	else
		
	end
end
--03
function Dy_Z23_13_TAKE() --拾取殘骸時做的事情 --改為隱藏NPC
	local Player,Corpse = OwnerID(),TargetID();
	local IsSearched=622208
	if CheckBuff(Corpse,IsSearched)==false then
		AddBuff(Corpse,IsSearched,0,-1);
		GiveBodyItem(Player,241229,1);
		DisableQuest(Corpse,true);
		WriteRoleValue(Corpse,EM_RoleValue_Register+6,1);--通知控制器回收屍體的暗號
	end
	CloseSpeak(Player);
end
--04
--※※庫勒奇蟻的判定部分※※
function Dy_Z23_14_KantDIE00()--塞入死亡劇情
	SetPlot( OwnerID() ,"dead","Dy_Z23_14_KantDIE01",10 )
end
function Dy_Z23_14_KantDIE01()--庫勒奇蟻的判定部分
	--say(OwnerID() , "111")
	--say(TargetID() , "123")
	LoadQuestOption(TargetID())  --檢查有沒有任務
	if CheckAcceptQuest(TargetID(),425296) == true 
	or CheckAcceptQuest(TargetID(),425301) == true 
	or CheckAcceptQuest(TargetID(),425306) == true then 
		if CheckScriptFlag( TargetID() , 546276 ) == true then --有重要物品的話給予BUFF
			AddBuff( TargetID() , 622580 , 0 ,30) --英勇光環
			--say(TargetID() , "123")
		elseif CheckScriptFlag( TargetID() , 546276 ) == false then --沒有重要物品的話給予重要物品
			GiveBodyItem( TargetID(), 546276, 1 )
			--say(TargetID() , "yai")
		end
	else
		--say(TargetID() , "none")
	end
end
function Dy_Z23_14_yunki()--英勇光環的判斷
	for i = 0 , 5 ,1 do
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == 106776+i then --如果是聯盟士兵的代號就殺了任務條件與給士氣BUFF
			DW_QietKillOne(OwnerID(), 106860  )
			AddBuff( TargetID() , 622582 , 0 , 5) 
			--say(TargetID() , "yai")
		else
			--say(TargetID() , "=w=")
		end
	end
end
--05
function Dy_Z23_15_check () --物品使用檢查
	local badant = 106865
	if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == badant then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_03]" , 0 )  --目標錯誤！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_03]" , 0 )			
		return false
	end
end 
function Dy_Z23_15antshow() --蓋提蟻表演劇情
	if ReadRoleValue( TargetID(),EM_RoleValue_Register8)==3 then 	--判斷是否重覆發生
		local tmpt = SearchRangeNPC( TargetID(),100 )
			for i=0,#tmpt,1 do 
				if ReadRoleValue( tmpt[i] ,EM_RoleValue_OrgID ) == 106866 then 
					AddBuff( tmpt[i],622564,0,30 )
					DebugMsg( 0,0,"tesstAddBuff" )
				end
			end
			return
	end
	local Player = OwnerID()
	local Rnum = 3-ReadRoleValue( TargetID(),EM_RoleValue_Register8 )
	local badant = 106865 --監軍蟻的編號
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local x,y,z,dir = DW_Location( Player )
	local ant = ant or {}
 	local ant=Lua_CreateObjToRandownPos( Player,106866,Rnum,50,false )
		GiveBodyItem( Player, 546503, 1 )	--給任務旗標
		SetAttack( TargetID(),Player )	--強制仇恨
		--DebugMsg( 0,0,"test="..Rnum )
	for i = 1 , Rnum , 1 do
		AddToPartition( ant[i],RoomID)
		local Xnum = ReadRoleValue( TargetID(),EM_RoleValue_Register8 )+1
		--DebugMsg( 0,0,"test="..xnum )
		WriteRoleValue( TargetID(),EM_RoleValue_Register8,Xnum )
		SetModeEx( ant[i]  ,EM_SetModeType_Show, true )--顯示*
		SetModeEx( ant[i]  ,EM_SetModeType_Searchenemy , false ) --索敵*
		SetModeEx( ant[i]  ,EM_SetModeType_Save , false ) --儲存*
		SetModeEx( ant[i]  ,EM_SetModeType_Revive , false ) --重生*
		SetModeEx( ant[i]  ,EM_SetModeType_Obstruct , false )--阻擋*
		SetModeEx( ant[i]  ,EM_SetModeType_Strikback , true ) --反擊*
		SetModeEx( ant[i]  ,EM_SetModeType_Fight , true ) --砍殺*
		SetModeEx( ant[i]  ,EM_SetModeType_Gravity , false ) --重力*	
		SetModeEx( ant[i]  ,EM_SetModeType_Move , true ) --移動*
		SetModeEx( ant[i]  ,EM_SetModeType_ShowRoleHead , true ) --頭像框*
		SetModeEx( ant[i]  ,EM_SetModeType_HideName , true) --物件頭上的名稱是否顯示*
		SetModeEx( ant[i]  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
		WriteRoleValue( ant[i] ,EM_RoleValue_Register8,TargetID() )
		AddToPartition( ant[i],RoomID)
		--DebugMsg(0,0,"testQuestCreatAnt="..ant[i])
		SetPlot( ant[i],"dead","Dy_Z23_15ANTDIE",0 )
		SetPlot( TargetID(),"dead","Dy_Z23_15DIE",0 )
		SysCastSpellLv( TargetID(),ant[i],499110,1 )

	end
	
end
function Dy_Z23_15DIE() --監軍蟻死亡劇情
	--say (OwnerID(), "123")
	--※※刪除蓋提蟻※※
	local ant = {} 
	WriteRoleValue( OwnerID(),EM_RoleValue_Register8,0 )
	ant = SearchRangeNPC ( OwnerID() , 100 ) 
	for i=0 ,table.getn(ant) ,1 do 
		if ReadRoleValue( ant[i] , EM_RoleValue_OrgID) == 106866 then
			DelObj ( ant[i] )
		else
		
		end
	end	
	Local num = HateListCount( OwnerID() )
	for i=0,num-1 do
		local ID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID );
		local HatePoint = HateListInfo(OwnerID() ,i , EM_HateListInfoType_HatePoint );
		if ReadRoleValue( ID , EM_RoleValue_IsNPC ) ~= 1 and HatePoint>=500 then
			DW_QietKillOne( ID, 106861  )
		end
	end	
end
function Dy_Z23_15ANTDIE()
	local badant = ReadRoleValue( OwnerID() ,EM_RoleValue_Register8 )
	local num = ReadRoleValue( badant,EM_RoleValue_Register8 )-1
	WriteRoleValue( badant,EM_RoleValue_Register8,num )
end