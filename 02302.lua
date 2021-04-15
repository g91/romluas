-------------------------------Initialization--------------------------------------------
function kg_Z14PE03_Init()
	Lua_Zone14_PE03_GlobalSet()
	Lua_Zone14_PE03_PESet()
end

function Lua_Zone14_PE03_GlobalSet()--變數宣告
	Zone14_PE03_PEIndex = 1403
	Zone14_PE03_UndeadCount = 0--冒險者屍體加上重生為不死生物的當前數量
	Zone14_PE03_UndeadMax = 10--冒險者屍體與重生為不死生物的上限
	Zone14_PE03_FlagID = 780885
	Zone14_PE03_FinishLine = 0--終點
	Zone14_PE03_QuestNPC = 0
	Zone14_PE03_WagonTrain = {}--車隊
	Zone14_PE03_Var = {}
	Zone14_PE03_Var["MapID"] = 433
	Zone14_PE03_Var["Enemy"] = {	105433,	--骷髏士兵	--PID 140302
					105434,	--骷髏法師
					105435,	--骷髏將軍
					105436	--骷髏導師
					}
	Zone14_PE03_Var["Friend"] = {   105437,	--冒險者1234	--PID 140301
					105438,	
					105439,	
					105440	
					}
	Zone14_PE03_FriendDeadDialogue = { "[SC_PE_ZONE14_03_TALK11]","[SC_PE_ZONE14_03_TALK12]","[SC_PE_ZONE14_03_TALK13]","[SC_PE_ZONE14_03_TALK14]","[SC_PE_ZONE14_03_TALK15]" }
end

function Lua_Zone14_PE03_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE14_03_NAME"					-- 後勤前送
	local PE_Desc = "SC_PE_ZONE14_03_DESC"					-- 前線營地急需要補給，但補給隊卻被遺跡中的不死生物層層阻擾，賢者之眼不允許這種事情的發生。
	local PEIndex = Zone14_PE03_PEIndex
	local PHIndex = Zone14_PE03_PHIndex
	local TestID = 1
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , Zone14_PE03_Var["MapID"] )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	PE_AddPhase( PEIndex , 10 , "SC_PE_ZONE14_03_PH1_NAME", "SC_PE_ZONE14_03_PH1_DESC", 0 , 1 , 1 , 0 )
	PE_PH_AddObjective_Greater( PEIndex , 10, 10, "", "", "" , 0, 1,  true )
	PE_OB_SetVisible( PEIndex, 10, 10, false )
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	PE_SetCallBackOnPlayerEnter (PEIndex, "Lua_Zone14_PE03_Enter" )--進入區域
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone14_PE03_Leave" )--離開區域
	PE_Start( PEIndex , 10 )--事件啟動
end

function Lua_Zone14_PE03_Enter( PEIndex , Player )
	--DebugMsg(0,0,GetName(Player).."("..Player..")".." Enter "..PEIndex )
end

function Lua_Zone14_PE03_Leave( PEIndex ,Player )
	--DebugMsg(0,0,GetName(Player).."("..Player..")".." Leave "..PEIndex )
	Lua_Zone14_PE03_ClearPlayerBuff( Player )
end

----------------------------------------------技能----------------------------------------------------------------------------------------------
function Lua_Zone14_PE03_ReBuffBag()--大背包被攻擊
	local Oid = OwnerID()
	local Tid = TargetID()
	local NewBuffLv = KS_CheckBuffLV(Oid,509188)-1
	CancelBuff(Oid,509188)--取消大背包Buff
	if NewBuffLv>0 then
		AddBuff(Oid,509188,NewBuffLv-1,-1)
	else
		ScriptMessage( Oid, Oid, 2 , "[SC_PE_ZONE14_03_MESSAGE01]" , "0xffff0f0f" )--你的物資背袋似乎已經空了…
	end
end

function Lua_Zone14_PE03_Skill01()--挖掘礦石
	local Oid = OwnerID()
	local Tid = TargetID()
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497336,"Name") , 50 , 148, 150, 0 , "Lua_Zone14_PE03_Skill01_CheckStatus")==1 then
		--WriteRoleValue(Oid,EM_RoleValue_Register10,1)
	end
end

function Lua_Zone14_PE03_Skill01_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		EndCastBar(Oid,CheckStatus)
		if CheckBuff(Oid,509242)==true then
			CancelBuff(Oid,509242)
			SetModeEx( Tid , EM_SetModeType_Show, false)--是否繪製出模型
			CallPlot( Tid,"LuaFunc_ResetObj",Tid )--強制重生
			kg_Z14PE03_GetQuestKey( Oid , 3 )--玩家,數量
		end
	else
		EndCastBar(Oid,CheckStatus)
	end
end

function Lua_Zone14_PE03_Skill02()--絕不正面迎戰
	local Oid = OwnerID()--玩家
	local Tid =TargetID()--不死生物
	if KillID( Oid, Tid )==TRUE then
		kg_Z14PE03_GetQuestKey( Oid , 1 )--玩家,數量
	end
end

function Lua_Zone14_PE03_Skill03()--洗滌
	CancelBuff(OwnerID(),509223)--清除玩家身上的黑暗詛咒
end

function Lua_Zone14_PE03_Skill04()--補給物資
	local Oid = OwnerID()--玩家
	local Tid = TargetID()--NPC
	CallPlot( Tid , "Lua_Zone14_PE03_Skill04_01", Oid , Tid )
end

function Lua_Zone14_PE03_Skill04_01( Oid , Tid )--NPC跟玩家對話與關鍵表現
	if CheckBuff(Oid,509188)==true then
		Say(Tid,"[SC_PE_ZONE14_03_MESSAGE04]")--你竟然獨自背負補給突破重圍而來…這真是…太了不起了！
		Sleep(10)
		local QuestNum=KS_CheckBuffLV(Oid,509188)
		kg_Z14PE03_GetQuestKey( Oid , QuestNum )--玩家,數量
		CancelBuff(Oid,509188)
	else
		Say(Tid,"[SC_PE_ZONE14_03_MESSAGE02]")--補給？你的背袋都破了，東西早就掉光啦…
		Sleep(15)
		ScriptMessage( Oid, Oid, 2 , "[SC_PE_ZONE14_03_MESSAGE03]" , "0xffff0f0f" )--你自行查看物資背袋，發現果然空空如也。只好再回去拿一趟了…
	end
end

function Lua_Zone14_PE03_Skill05()--讚美生命
	local Oid = OwnerID()
	local Tid =TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register10)==0 then
		WriteRoleValue(Tid,EM_RoleValue_Register10,1)--已經被玩家燒了
		kg_Z14PE03_GetQuestKey( Oid , 3 )--玩家,數量
		Zone14_PE03_UndeadCount = Zone14_PE03_UndeadCount-1
		if Zone14_PE03_UndeadCount<0 then Zone14_PE03_UndeadCount=0 end
		DebugMsg( 0,0,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount )
	end
end

function Lua_Zone14_PE03_Skill06()--招喚載具
	local Oid = OwnerID()--玩家
	local Vehicle = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if CheckID(Vehicle)==true then
		DelObj( Vehicle )
		WriteRoleValue(Oid,EM_RoleValue_Register9,0)
	end
	Vehicle = kg_GetRangePos(Oid,105480,30,-90)--在玩家左邊 距離30碼
	WriteRoleValue( Oid,EM_RoleValue_Register9,Vehicle )--在玩家身上記住載具
	WriteRoleValue( Vehicle,EM_RoleValue_Register9,Oid )
	AddToPartition( Vehicle,ReadRoleValue(Oid,EM_RoleValue_RoomID) )
end

function Lua_Zone14_PE03_Skill07()--護送專家
	local Tid =TargetID()--馬車
	CancelBuff(Tid,509222)
	AddBuff(Tid,509195,0,-1)
end

function Lua_Zone14_PE03_Skill07_01()--讓馬車給護送的玩家關鍵表現
	local Tid =TargetID()--玩家
	if CheckBuff( Tid, 509182 )==true and KS_CheckBuffLV(Tid,509250)>=10 then
		CancelBuff(Tid,509250)
		kg_Z14PE03_GetQuestKey( Tid , 15 )--玩家,數量
	end
end

function Lua_Zone14_PE03_Skill07_02()--利用buff來判斷馬車與玩家間的距離
	local Oid = OwnerID()--玩家
	local Horse = Zone14_PE03_WagonTrain.Horse
	if kg_GetDis(Oid,Horse)>=300 or CheckID(Horse)~=true then
		CancelBuff(Oid,509250)
	end
end

function Lua_Zone14_PE03_Skill08()--振奮前行(招喚小白)	SC_NORIDE_2	--你無法在此使用坐騎。
	local Oid = OwnerID()--玩家
	if CheckBuff( Oid, 509196 )==true then--在小白上則加速
		local Goods = ReadRoleValue( ReadRoleValue(Oid,EM_RoleValue_Register10) , EM_RoleValue_Register9 );
		if CheckID(Goods)==true and ReadRoleValue(Goods,EM_RoleValue_IsNPC)==1 then
			AddBuff( Goods , 509257, 30, 20 );
		end
		AddBuff(Oid,509982,0,-1);
	end
	if kg_GetDis( Oid , Zone14_PE03_FlagID , 0 )>150 and CheckBuff( Oid, 509196 )~=true then
		ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	else
		if ReadRoleValue(Oid, EM_RoleValue_AttachObjGUID)~=-1 then
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_03_ERROR01]" , 0 )--請先離開坐騎
		elseif CheckBuff( Oid, 509196 )~=true then--身上沒有馬車buff就給予馬車buff
			local RoomID =ReadRoleValue(Oid,EM_RoleValue_RoomID)
			Lua_Z14PE03_Skill08_DelHorse( Oid )--刪除之前的馬車
		
			local Horse = kg_GetPos( Oid, 105481 )--產生隱形小白
			kg_InvisibleObjInit( Horse )
			WriteRoleValue(Horse,EM_RoleValue_IsWalk,0)
			WriteRoleValue(Horse,EM_RoleValue_PassengerAttackable,1)--乘員可砍殺
		
			local Goods = kg_GetRangePos(Oid,105441,30,180)
			MoveToFlagEnabled( Goods, false )
			SetModeEx( Goods , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
			kg_MoveTarget( Goods )--會移動的標靶
		
			WriteRoleValue( Horse,EM_RoleValue_Register9,Goods )
			WriteRoleValue( Goods,EM_RoleValue_Register9,Horse )
			WriteRoleValue( Oid,EM_RoleValue_Register10,Horse )
			WriteRoleValue( Horse,EM_RoleValue_Register10,Oid )
			WriteRoleValue( Goods,EM_RoleValue_Register10,Oid )
			AddToPartition( Goods,RoomID )
			AddToPartition( Horse,RoomID )
			SetCursorType( Horse , 40 )
			BeginPlot(Horse,"Lua_Zone14_PE03_Skill08_HorseCheckPlayer",0)
			SetPlot(Goods,"dead","Lua_Zone14_PE03_Dead04_02",0)
			AddBuff(Goods,508887,0,-1)--不回血
			AddBuff( Goods, 507514, 0, -1 )--免疫治療
			AddBuff(Oid,509196,0,-1)--騎乘buff
			AttachObj( Horse , Oid , 2 ,"p_down","p_top" )--馬連玩家
			AttachObj( Goods , Horse , 0 ,"p_down","p_top" )--拉車連馬
		end
	end
end

function Lua_Zone14_PE03_Skill08_GoodsCheckBuff()
	local Goods=OwnerID()
	local Player = ReadRoleValue( Goods, EM_RoleValue_Register10 )--在PE區域的世界貨物群組中，reg10 為"馬"
	if CheckBuff(Player,509196)==true or ReadRoleValue(Player,EM_RoleValue_OrgID)==105481 then	--檢查玩家是否在馬上
		AddBuff( Player ,508560, 1 ,-1 )--不可移動
	end
end

function Lua_Zone14_PE03_Skill08_HorseCheckPlayer()--控制器查玩家是否斷線或死亡
	local Horse = OwnerID()
	local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9)
	local Player = ReadRoleValue(Horse,EM_RoleValue_Register10)
	local timer = 0
	--DebugMsg(0,0,"HorseCheckPlayer Start..")
	while 1 do
		SysCastSpellLv( Goods,Goods,497450,0 )--群嘲
		if timer%2==0 then
			if CheckID(Player)~=true or ReadRoleValue(Player,EM_RoleValue_IsDead)==1 or GetDistance(Player,Horse)>=300 or ReadRoleValue(Player,EM_RoleValue_IsPlayer)~=1 then
				Lua_Z14PE03_Skill08_DelHorse(Horse)
				break
			else
				if CheckBuff(Player,509196 )==true or ReadRoleValue(Player,EM_RoleValue_IsAttackMode)==1 then--當玩家沒有在馬上或進入戰鬥則開始疊加貨物安全的Buff,用來充當馬車的閒置計數器,每10秒一疊
					CancelBuff(Goods,509259)
				else
					if KS_CheckBuffLV(Goods,509259)>=1 and ReadRoleValue(Player,EM_RoleValue_IsAttackMode)==0 then
						Lua_Z14PE03_Skill08_DelHorse(Horse)
						break
					end
					AddBuff(Goods,509259,0,-1)--加上貨物很安全
				end
			end
		end
		Sleep(50)
		timer = timer+1
	end
end

function Lua_Zone14_PE03_Skill08_01()--下馬,玩家被怪物打時也會下馬
	local Oid = OwnerID()--玩家
	CancelBuff(Oid,508560)--定身消失
	local Horse =  ReadRoleValue(Oid,EM_RoleValue_Register10 )
	if CheckID(Horse)==true and Lua_Zone14_PE03_CheckMapID(Oid)==true then
		local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9)
		DetachObj(Horse)
		SetPos( Horse,kg_GetPos(Oid) )
		DetachObj(Goods)
		SetPos( Goods,kg_GetRangePos(Horse,nil,25,180))
		Lua_Z14PE03_Skill08_HorseSetup(Horse,true)
		SysCastSpellLv( Goods,Goods,497377,0 )
	end
	CancelBuff_NoEvent(Oid,509196)
end

function Lua_Z14PE03_Skill08_TouchHorse()--點擊上馬
	local Oid = OwnerID()--玩家
	local Horse = TargetID()
	--Say(Horse,"TouchHorse....Horse="..Horse)
	local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9)
	--DebugMsg(0,0,"Player Reg10= "..ReadRoleValue(Oid,EM_RoleValue_Register10) )
	if ReadRoleValue(Oid,EM_RoleValue_AttachObjGUID)~=-1 then
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_03_ERROR01]" , 0 )--技能條件不符
	elseif ReadRoleValue(Oid,EM_RoleValue_Register10)==Horse then
		Lua_Z14PE03_Skill08_HorseSetup(Horse,false)
		SetPos(Oid,kg_GetPos(Horse))
		AddBuff(Oid,509196,0,-1)
		AttachObj( Horse , Oid , 2 ,"p_down","p_top" )
		AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
	end
end

function Lua_Z14PE03_Skill08_HorseSetup(Horse,Visible)
	Hide(Horse)
	SetModeEx( Horse , EM_SetModeType_ShowRoleHead, Visible) 	---頭像框(否)
	SetModeEx( Horse , EM_SetModeType_Mark, Visible)
	SetModeEx( Horse , EM_SetModeType_Show, Visible)--是否繪製出模型
	if Visible==true then
		SetPlot( Horse , "touch" , "Lua_Z14PE03_Skill08_TouchHorse" , 30)
	else
		SetPlot( Horse , "touch" , "" , 30)
	end
	Show(Horse,0)
end

function Lua_Z14PE03_Skill08_DelHorse(Obj)--玩家死亡時也會呼叫
	Obj = Obj or OwnerID()
	if ReadRoleValue(Obj,EM_RoleValue_IsPlayer)==1 then
		CancelBuff_NoEvent(Obj,509196)
		local Horse =  ReadRoleValue(Obj,EM_RoleValue_Register10)
		if CheckID(Horse)==true then
			WriteRoleValue(Obj,EM_RoleValue_Register10,0)
			local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9 )
			DetachObj( Goods )
			DelObj( Goods )
			DelObj( Horse )
		end
	elseif ReadRoleValue(Obj,EM_RoleValue_OrgID)==105481 then
		local Player = ReadRoleValue(Obj,EM_RoleValue_Register10)
		if CheckID(Player)==true then CancelBuff_NoEvent(Player,509196) end
		local Goods = ReadRoleValue(Obj,EM_RoleValue_Register9 )
		DetachObj( Goods )
		DelObj( Goods )
		DelObj( Obj )
	end
end

function Lua_Zone14_PE03_MonsterSkill01()--招喚不死生物
	local Oid = OwnerID()--怪物本身
	local RoomID =ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local BossID = Zone14_PE03_Var["Enemy"][3]--將軍
	local MageID = Zone14_PE03_Var["Enemy"][2]--法師
	local Undead=0
	for i=1,3 do
		if i==1 then
			Undead = kg_GetRangePos(Oid,BossID,60)
		elseif i==2 then
			Undead = kg_GetRangePos(Oid,MageID,60,45)
		else
			Undead = kg_GetRangePos(Oid,MageID,60,-45)
		end
		SetModeEx( Undead , EM_SetModeType_Revive, false )	--可重生
		AddToPartition(Undead,RoomID)
		AddBuff(Undead,509477,0,-1)
	end
end
----------------------------------------------Check-----------------------------------------------------------------------------
function Lua_Zone14_PE03_CheckMapID( Obj )
	Obj = Obj or OwnerID()
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	if CheckMapID(x,y,z,433)==true or CheckMapID(x,y,z,1)==true then
		return true
	end
	ScriptMessage( Obj, Obj, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

function Lua_Zone14_PE03_CheckTarget01()--判定目標是否為礦石
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==117783 and CheckBuff(Oid,509242)==true then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE03_CheckTarget02()--判定目標是否為骷髏將軍
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==105435 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end 

function Lua_Zone14_PE03_CheckTarget03()--判定目標是否為推車(骷髏導師用)
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==105441 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end 

function Lua_Zone14_PE03_CheckTarget04()--判定目標是否為繳回物資的NPC
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==117781 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end 

function Lua_Zone14_PE03_CheckPID01s()--判定目標是否為冒險者屍體
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140301  then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE03_CheckPID01ss()--判定目標是否為冒險者屍體
	local Oid =OwnerID()
	local Tid = TargetID()
	if (ReadRoleValue(Tid,EM_RoleValue_PID)==140301 or ReadRoleValue(Tid,EM_RoleValue_PID)==140303) and CheckBuff(Tid,509248) then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE03_CheckPID02s()--判定目標是否為不死生物
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140302 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE03_CheckPID02ss()--判定目標是否為不死生物(霹靂車用)
	local Oid =OwnerID()
	local Tid = TargetID()
	local Player = ReadRoleValue(Oid,EM_RoleValue_Register10)
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140302 and Player~=0 then
		return TRUE
	end
	ScriptMessage( Player, Player, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone14_PE03_CheckArea01()--判定是否在NPC=>A附近
	local Oid = OwnerID()--玩家
	if kg_GetDis( Oid , Zone14_PE03_FlagID , 0 )<=150 then
		return true
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

function Lua_Zone14_PE03_CheckBuff01()--檢查玩家身上有沒有E buff ,馬車用
	local Tid = TargetID()--玩家
	if CheckBuff( Tid , 509182 ) then
		return true
	end
	return false
end

function Lua_Zone14_PE03_CheckTicket()--檢查玩家身上有沒有載具車票
	local Vehicle = OwnerID()
	local Player =TargetID()
	if ReadRoleValue(Player, EM_RoleValue_AttachObjGUID)~=-1 then
		ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE14_03_ERROR01]" , 0 )--請先離開坐騎
	elseif ReadRoleValue(Player,EM_RoleValue_Register9)==Vehicle and CheckBuff(Player,509180)==true then
		if ReadRoleValue(Vehicle,EM_RoleValue_Register10)~=-1 then
			return true
		else
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE14_03_MESSAGE06]" , "0xffff0f0f" )--忙碌中
		end
	else
		ScriptMessage( Player, Player, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	end
	return false
end

----------------------------------------------Born------------------------------------------------------------------------------------
function Lua_Zone14_PE03_Born( Oid )--出生共用
	Oid = Oid or OwnerID()
	SetFlag( Oid, 544801, 1 )--關閉帕奇鼠
end

function Lua_Zone14_PE03_Born01() --不死生物出生
	local Oid =OwnerID()--不死生物
	Lua_Zone14_PE03_Born(Oid)
	WriteRoleValue(Oid,EM_RoleValue_PID,140302)
end

function Lua_Zone14_PE03_Born02()--冒險者,若為PE唯一馬車成員則為140303
	local Oid =OwnerID()--冒險者
	Lua_Zone14_PE03_Born(Oid)
	SetDefIdleMotion(Oid,-1)--設定初始動作
	WriteRoleValue(Oid,EM_RoleValue_Register7,0)--死亡鎖定，避免同時被一堆怪物打死導致屍體計算錯誤
	WriteRoleValue(Oid,EM_RoleValue_Register10,0)--被玩家救贖
	WriteRoleValue(Oid,EM_RoleValue_PID,140301)
end

function Lua_Zone14_PE03_Born03()--推車
	local Oid =OwnerID()--推車
	Hide(Oid)
	Lua_Zone14_PE03_Born(Oid)
	kg_Target(Oid)
	SetModeEx( Oid , EM_SetModeType_Revive, false )	--可重生
	Show(Oid,0)
	AddBuff(Oid,509251,0,-1)--定時找玩家堆疊保護buff
end

function Lua_Zone14_PE03_Born04()--終點範圍劇情
	local Oid =OwnerID()--終點
	Zone14_PE03_FinishLine=Oid
	Hide(Oid)
	kg_InvisibleObjInit( Oid )
	Show(Oid,0)
	setplot( Oid,"range","Lua_Zone14_PE03_FinishLine",100 )
	Lua_Zone14_PE03_WTCtrlInit()
end

function Lua_Zone14_PE03_Born05()--防掉地板的範圍劇情
	function Lua_Zone14_PE03_FloorGetHeight()
		local Player = OwnerID()--玩家
		local Obj = TargetID()--範圍劇情的主人
		local Vehicle = ReadRoleValue(Player,EM_RoleValue_Register10)--霹靂車: 玩家有載具而且正坐在上面,小白: 小白的GID
		if CheckBuff( Player , 509180 )==true and ReadRoleValue(Vehicle,EM_RoleValue_OrgID)==105480 then
			SetPos( Player, kg_GetPosRX( Player  ,nil , 0 , 0 ) )
			--Say(Player,"Vehicle GetHeight!!")
		elseif CheckBuff( Player , 509183 )==true and CheckBuff( Player , 509196 )==true and ReadRoleValue(Vehicle,EM_RoleValue_OrgID)==105481 then
			local Goods = ReadRoleValue(Vehicle,EM_RoleValue_Register9)--取得貨物
			DetachObj(Goods)
			SetPos( Goods,kg_GetPosRX(Player,nil,25,0,180) )
			AttachObj( Goods , Vehicle , 0 ,"p_down","p_top" )
			--Say(Goods,"GetHeight!!")
		end
	end
	
	SetPlot( OwnerID(),"range","Lua_Zone14_PE03_FloorGetHeight",150 )
end

function Lua_Zone14_PE03_Born06()--任務NPC將自己記在全域變數,為了跟車隊隊員對話用
	Zone14_PE03_QuestNPC=OwnerID()
end

function Lua_Zone14_PE03_FinishLine()--玩家抵達營地判定是否拿到關鍵表現
	local Player = OwnerID()
	if CheckBuff(Player,509183)==true and CheckBuff(Player,509196)==true then
		kg_Z14PE03_GetQuestKey( Player , 15 )
		Lua_Z14PE03_Skill08_DelHorse(Player)
	end
end

function Lua_Zone14_PE03_VehicleBorn()--掛在模板上
	local Oid =OwnerID()
	Lua_Zone14_PE03_Born( Oid )
	WriteRoleValue(Oid,EM_RoleValue_Register10,0)--主人沒有在在載具上
	SetModeEx( Oid , EM_SetModeType_Revive, false )	--可重生
	AddBuff(Oid,508887,0,-1)--不回血
	AddBuff( Oid, 507514, 0, -1 )--免疫治療
	BeginPlot( Oid,"Lua_Zone14_PE03_VehicleLiveTimer",0 )
end

function Lua_Zone14_PE03_VehicleTouch( Seat , UpDown )--玩家點選上車
	local Player = OwnerID()
	local Vehicle = TargetID()
	--DebugMsg(0,0,"Seat = "..Seat)--玩家上車後的位置，下車會變-1
	--DebugMsg(0,0,"UpDown = "..UpDown)--上車1 下車0
	local SkillID = {}
	SkillID[1]={ 497341 , 0  }--衝撞
	SkillID[2]={ 497342 , 0  }--加速
	if UpDown==1 then
		WriteRoleValue(Player,EM_RoleValue_Register10,Vehicle)--將衝車記在玩家身上
		WriteRoleValue(Vehicle,EM_RoleValue_Register10,Player)--將衝車記在玩家身上
		for i in pairs(SkillID) do
			SetExSkill( Player , Vehicle , SkillID[i][1] , SkillID[i][2] )
		end
	elseif UpDown ==0 then
		WriteRoleValue(Player,EM_RoleValue_Register10,0)
		WriteRoleValue(Vehicle,EM_RoleValue_Register10,-1)
		DelExSkill( Player , -1 , -1 )
		BeginPlot(Vehicle,"Lua_Zone14_PE03_VehicleExplode",0)
	end
end

function Lua_Zone14_PE03_VehicleLiveTimer()--玩家剛招喚出來10秒內都沒上車就刪除,每10秒檢查是否超出區域範圍
	local Vehicle = OwnerID()
	for i =1 , 10 do
		Sleep(10)
		if ReadRoleValue(Vehicle,EM_RoleValue_Register10)>0 then--玩家上載具則跳出刪除判定
			break
		elseif i==10 then
			DelObj(Vehicle)
		end
	end
	while 1 do
		local X = ReadRoleValue( Vehicle , EM_RoleValue_X )
		local Y = ReadRoleValue( Vehicle , EM_RoleValue_Y )
		local Z = ReadRoleValue( Vehicle , EM_RoleValue_Z )
		if Zone14_PE03_Var["MapID"]~=nil then
			--DebugMsg(0,0,"Vehicle MapID="..Zone14_PE03_Var["MapID"])
			if CheckMapID(X,Y,Z,Zone14_PE03_Var["MapID"])~=true and CheckMapID(X,Y,Z,1)~=true and ReadRoleValue(Vehicle,EM_RoleValue_Register10)~=-1 then
				KillID(Vehicle,Vehicle)
			end
		else
			DebugMsg(0,0,"MapID==nil!")
			KillID(Vehicle,Vehicle)
		end
		Sleep(100)
	end
end

function Lua_Zone14_PE03_VehicleExplode()--玩家下車爆破
	local Vehicle = OwnerID()
	local Player = ReadRoleValue(Vehicle,EM_RoleValue_Register9)
	SysCastSpellLv( Vehicle,Vehicle,497373,10)--範圍挑釁
	ScriptMessage( Player, Player, 2 , "[SC_PE_ZONE14_03_MESSAGE05]" , "0xffff0f0f" )
	Sleep(30)
	SysCastSpellLv(Vehicle,Vehicle,497372,0)--自爆
	Sleep(3)
	KillID(Vehicle,Vehicle)
end

function Lua_Zone14_PE03_VehicleAttack()
	local Vehicle = OwnerID()
	local Undead = TargetID()
	KillID(Vehicle,Undead)
end

----------------------------------------------Dead--------------------------------------------------------------------------------------------
function Lua_Zone14_PE03_UndeadDead( Oid , Tid )--不死生物死亡共用
	if ReadRoleValue(Oid,EM_RoleValue_Register10)==1 then--表示為冒險者重生出來的
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		Zone14_PE03_UndeadCount = Zone14_PE03_UndeadCount-1
		if Zone14_PE03_UndeadCount<0 then Zone14_PE03_UndeadCount=0 end
		DebugMsg(0,0,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount)
	end
	
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==105480 then--霹靂車
		local Player = ReadRoleValue(Tid,EM_RoleValue_Register9)--找玩家
		if CheckBuff( Player, 509180 )==true then
			kg_Z14PE03_GetQuestKey( Player , 1 )--玩家,數量
		end
	end
end

function Lua_Zone14_PE03_Dead01()--不死生物死亡 EM_RoleValue_Register10 表示此不死生物為冒險者重生的
	local Oid =OwnerID()--不死生物
	local Tid =TargetID()--光明霹靂車or 其他
	Lua_Zone14_PE03_UndeadDead( Oid , Tid )
	local PickOwner = GetGUIDByDBID( ReadRoleValue(Oid,EM_RoleValue_BeginAtkDBID) )
	if PickOwner>0 then Tid=PickOwner end
	if CheckBuff(Tid,509184)==true and ReadRoleValue(Tid,EM_RoleValue_IsPlayer)==1 then--可能需要判定GM
		kg_Z14PE03_GetQuestKey( Tid , 1 )--玩家,數量
	end
	return true
end

function Lua_Zone14_PE03_Dead02()--骷髏導師死亡
	local Oid =OwnerID()--不死生物
	local Tid =TargetID()--光明霹靂車or 其他
	Lua_Zone14_PE03_UndeadDead( Oid ,Tid )
	local PickOwner = GetGUIDByDBID( ReadRoleValue(Oid,EM_RoleValue_BeginAtkDBID) )
	if PickOwner>0 then Tid=PickOwner end
	if CheckBuff(Tid,509185)==true and ReadRoleValue(Tid,EM_RoleValue_IsPlayer)==1 then
		kg_Z14PE03_GetQuestKey( Tid , 15 )--玩家,數量
	elseif CheckBuff(Tid,509184)==true and ReadRoleValue(Tid,EM_RoleValue_IsPlayer)==1 then--可能需要判定GM
		kg_Z14PE03_GetQuestKey( Tid , 1 )--玩家,數量
	end
	return true
end

function Lua_Zone14_PE03_Dead03()--冒險者死亡
	local Oid =OwnerID()--冒險者
	if ReadRoleValue(Oid,EM_RoleValue_Register10)==1 then--已經被火燒
		return true
	end
	if ReadRoleValue(Oid,EM_RoleValue_Register7)==0 then
		WriteRoleValue(Oid,EM_RoleValue_Register7,1)--鎖定死亡，避免被怪物重複打死
		Say(Oid, Zone14_PE03_FriendDeadDialogue[kg_Rand(5)] )
		PlayMotion(Oid,ruFUSION_ACTORSTATE_DYING)--播放死亡動作
		SetDefIdleMotion(Oid,ruFUSION_MIME_IDLE_DEAD)--設預設動作為死亡
		local FriendArray = Zone14_PE03_WagonTrain.Friend
		if FriendArray~=nil then
			for i in pairs(FriendArray) do
				if FriendArray[i]==Oid then
					DebugMsg(0,0,"Pe1403_RemoveWTMember.."..Oid)
					Debuglog(2,"Pe1403_RemoveWTMember.."..Oid)
					table.remove( Zone14_PE03_WagonTrain.Friend,i )
					DebugMsg(0,0,"Pe1403_WTMemberCount="..table.getn(Zone14_PE03_WagonTrain.Friend))
					Debuglog(2,"Pe1403_WTMemberCount.."..table.getn(Zone14_PE03_WagonTrain.Friend))
					break
				end
			end
		end
		CancelBuff(Oid, 509304 )
		AddBuff(Oid,509248,0,-1)--屍體buff
		Hide(Oid)
		kg_DeadBody( Oid )
		Show(Oid,0)
		local UndeadCount = Zone14_PE03_UndeadCount+1
		if UndeadCount<= Zone14_PE03_UndeadMax  then
			Zone14_PE03_UndeadCount=UndeadCount
			DebugMsg(0,0,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount)
			Debuglog(2,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount)
			CallPlot( Oid,"Lua_Zone14_PE03_UndeadReborn",Oid,1 )
			return false
		end
		CallPlot( Oid,"Lua_Zone14_PE03_UndeadReborn",Oid,0 )
		return false
	end
end

function Lua_Zone14_PE03_UndeadReborn( Oid , UndeadBorn )--冒險者重生為不死生物,Oid:冒險者,
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	Sleep(100)
	if ReadRoleValue(Oid,EM_RoleValue_Register10)~=1 and UndeadBorn==1 then --玩家沒有被玩家燒
		WriteRoleValue(Oid,EM_RoleValue_Register10,2)--已進入重生階段
		local UnDeadID = Zone14_PE03_Var["Enemy"][kg_Rand(3)]
		local UnDead = kg_GetPos(Oid,UnDeadID)
		SetModeEx( UnDead , EM_SetModeType_Revive, false )	--可重生
		WriteRoleValue( UnDead,EM_RoleValue_Register10,1 )
		AddToPartition(UnDead,RoomID)
	end
	if ReadRoleValue(Oid,EM_RoleValue_PID)==140301 then
		CallPlot( Oid,"LuaFunc_ResetObj",Oid )--強制重生
	else
		DelObj(Oid)
	end
end

function Lua_Zone14_PE03_Dead04_01()--推車死亡
	local Oid =OwnerID()--推車
	BeginPlot(Zone14_PE03_FinishLine,"Lua_Zone14_PE03_WtFail",0 )
	BeginPlot(Zone14_PE03_FinishLine,"Lua_Zone14_PE03_WTCtrlInit",300)--30秒後重生車隊
	return true
end

function Lua_Zone14_PE03_Dead04_02()--玩家招喚出來的推車死亡
	local Goods =OwnerID()--推車
	local Horse = ReadRoleValue(Goods,EM_RoleValue_Register9)
	local Player = ReadRoleValue(Horse,EM_RoleValue_Register10)
	CancelBuff_NoEvent(Player,509196)
	DetachObj(Horse)
	SetPos( Horse,kg_GetPos(Player) )
	DetachObj(Goods)
	SetPos( Goods,kg_GetPosRX(Horse,nil,25,0,180,-3))
	Hide(Horse)
	SetModeEx( Horse , EM_SetModeType_Show, true)--是否繪製出模型
	Show(Horse,0)
	BeginPlot( Horse,"kg_Z14PE03_HorseRunAway", 1 )
	WriteRoleValue(Player,EM_RoleValue_Register10,0)
	return true
end