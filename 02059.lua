------------------------------------------------------------------------------威脅度判定
function LuaS_103120_507410Check()
	local Player = TargetID()
	if	Player == OwnerID()	then
		return false
	end
	if	CheckBuff(Player,507410)	then
		local PosOfBuff = Lua_BuffPosSearch( Player , 507410 )
		local PowerLv = BuffInfo(Player,PosOfBuff,EM_BuffInfoType_Power)
		if	PowerLv >8	then
			AddBuff(Player,507412,1,-1) --gg指令
			local DontSeeBall = DW_CreateObjEX("obj",116755,Player,0,0)--透明球(放大法術)
			Lua_ObjDontTouch( DontSeeBall )--隱形物件
			AddToPartition(DontSeeBall,0)
			SysCastSpellLv(OwnerID(),DontSeeBall,496393,1)--制裁者震波(傷害)(script)
		end
	end
	return true
end
--------------------------------------------------------------------------------空降制裁者
function LuaS_103120_496393Create()
	if	CheckBuff(TargetID(),507412)	then
		CancelBuff(TargetID(),507412) --取消訊號
		local NO16 = DW_CreateObjEX("obj",104809,TargetID(),1,0) --創立16型
		SysCastSpellLv(TargetID(),NO16,496266,1)--鎖定目標
		CallPlot(NO16,"LuaFunc_Obj_Suicide",100) --設定16的消失條件
	end
end
------------------------------------------------------------------------------空間扭曲效應
function LuaS_103120_508073Check()
	local Player = TargetID()
	local PosOfBuff = Lua_BuffPosSearch( Player , 508073 )
	local PowerLv = BuffInfo(Player,PosOfBuff,EM_BuffInfoType_Power)
	if	PowerLv ==13	then
		ScriptMessage( Player, Player, 2 , "[SC_103120_SANC_12]", "0xFF98E0E7" )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_13]", 0 )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_12]", "0xFF98E0E7" )
	elseif	PowerLv == 8	then
		ScriptMessage( Player, Player, 2 , "[SC_103120_SANC_11]", "0xFF98E0E7" )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_09]", 0 )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_11]", "0xFF98E0E7" )
	elseif	PowerLv == 0	then
		ScriptMessage( Player, Player, 2 , "[SC_103120_SANC_10]", "0xFF98E0E7" )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_09]", 0 )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_10]", "0xFF98E0E7" )
	end
end
--------------------------------------------------------------------------------裝檢光環
function LuaS_103120_LightCercle(Obj)
	SetPlot(Obj,"range","LuaS_103120_LightCercleMessage",390)
	AddBuff(Obj,508005,1,-1)
	while	true	do
		sleep(30)
		if	PE_GetActivePhaseIndex(1)~=0	then
			SysCastSpellLv(Obj,Obj,496390,2)
			SysCastSpellLv(Obj,Obj,496392,1)
		else
			return
		end
	end
end

function LuaS_103120_LightCercleMessage()
	ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_103120_CON_05004]", 0 )
end

function LuaS_103120_LightCercleNoSelf()
	if	TargetID() == OwnerID()	then
		return false
	end
	return true
end
------------------------------------------------------------------------------------火力模式控制
function LuaS_103120_TargetBuild(Num,BossID)
	local Target = {}--目標=數量+1
	for i=1,4,1 do --4次
		Target[i] = {}
		for d=1,3,1 do
			local Temp=CreateObj_ByObjPoint(BossID,104775,Boss_103120_ReferencePoint[i])
			local TempObj=LuaS_103120_AidBuild_0(Temp,1,true,d,1);
			Target[i][d]=	LuaS_103120_AidBuild_0(	--【基準點】以槍口為準產生
						Lua_CreateObjByDir( 
						 TempObj,
						104776 ,
						200 ,
						 0),
					1,--完全獨立於戰鬥外
					false,--不可攻擊
					d	) --改變面向
			CallPlot(Target[i][d],"LuaS_103120_AidBuild_1",Target[i][d],BossID) --讓它們自己隨機移動
		end
	end
	return Target --將【基準點】的陣列回傳
end
--------------------------------------------------------------------
--------------------------------------------------------------------
function LuaS_103120_AidBuild_0(Obj,Condtition,BanAttack,DirChange,LiveTime)
	if	Condtition == 1	then--完全獨立於戰鬥外
		DW_UnFight(Obj)
	elseif	Condtition ==2	then--保持索敵和任務
		SetModeEx(Obj,EM_SetModeType_Fight,false) 
	end
	Lua_ObjDontTouch( Obj ) --隱形物件
	AddToPartition(Obj,0) -- 加入場景
	MoveToFlagEnabled(Obj, false)
	if	BanAttack==true	then
		AddBuff(Obj,507899,1,-1)--不可攻擊
	end
	SetDir( Obj, (ReadRoleValue(Obj,EM_RoleValue_Dir)+(DirChange-2)*45)%360 )
	if	LiveTime~=nil	then
		WriteRoleValue(Obj,EM_RoleValue_LiveTime,LiveTime)
	end
	return Obj
end
--------------------------------------------------------------------
--------------------------------------------------------------------自由移動
function LuaS_103120_AidBuild_1(Obj,BossID)
	if	Obj == nil	then
		DeBugMSG(0,0,"Warming!! LuaS_103120_AidBuild_1==>Obj is nil")
		return false
	elseif	BossID==nil	then
		DeBugMSG(0,0,"Warming!! LuaS_103120_AidBuild_1==>BossID is nil")
		return false
	end
	local x,y,z
	While	true	do
		sleep(10)
		if	ReadRoleValue(Obj,EM_RoleValue_NpcOnMove)==0	then--移動中不算
			if	CheckDistance(Obj,BossID, 400)	then
				x=ReadRoleValue(Obj,EM_RoleValue_X)-150+DW_Rand(300)
				z=ReadRoleValue(Obj,EM_RoleValue_Z)+150-DW_Rand(300)
				y=GetHeight( x , ReadRoleValue(Obj,EM_RoleValue_Y) , z )
				if	DW_XYZCheckDis(x,y,z,ReadRoleValue(BossID,EM_RoleValue_X),ReadRoleValue(BossID,EM_RoleValue_Y),ReadRoleValue(BossID,EM_RoleValue_Z))<=400	then
					MoveDirect( Obj, x , y , z ) --合格才移動
					Sleep((DW_Rand(99)%3+1)*10)
				end
			else
				FaceObj( Obj, BossID)
				Sleep((DW_Rand(99)%3+1)*10)
			end
		end
	end
end
--------------------------------------------------------------------
--------------------------------------------------------------------刪除釋放
function LuaS_103120_AidBuild_2(Array)
	for i=1,4,1 do
		if	Array[i]~= nil	then
			for d=1,3,1 do
				if	Array[i][d]~=nil	then
					DW_CheckThenDel(Array[i][d])
				end
			end
		end
	end
end
--------------------------------------------------------------------
function LuaS_103120_MuzzleBuild(Array,Lv,Obj,boolin)
	for i=1,4,1 do --4次
		for d=1,3,1 do		
			if	DW_Rand(999)%23==0	or boolin==true	then
				local Temp = CreateObj_ByObjPoint(Obj,104775,Boss_103120_ReferencePoint[i])
				local TempObj = LuaS_103120_AidBuild_0(Temp,1,true,1,6)
				SysCastSpellLv(TempObj,Array[i][d],Boss_103120_KillerWeaponList[DW_Rand(5)],Lv)
				if	boolin==nil	then
					break -- 一個參考點最多開炮一次
				end
			end
		end
	end
end
--附屬單位控制
--------------------------------------------------------------------
--幽魂區
--------------------------------------------------------------------
LuaS_103120_Ghost_Controler = {}
function LuaS_103120_Ghost_Controler.enter(Ghost)
	local GhostValue = FSM_GetState(Ghost,"Execute")
	GhostValue.Array = {}
	GhostValue.Num = GetMoveFlagCount(780085)-1--幽魂的數量 = 780085旗總數-1
end
-------------------------------------
function LuaS_103120_Ghost_Controler.update(Ghost)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	"Over"
	end

	local GhostValue = FSM_GetState(Ghost,"Execute")
	for i=1,GhostValue.Num,1 do
		if	GhostValue.Array[i]==nil	then
--第一次
			GhostValue.Array[i] = DW_CreateObjEX("flag",104620,780085,i,1,200)
			AddBuff(GhostValue.Array[i],507927,1,-1)
		else
--後續處理
--如果幽魂葛屁
			if	CheckID(GhostValue.Array[i])==false	or
				ReadRoleValue(GhostValue.Array[i],EM_RoleValue_IsDead)==1	then
--再送一隻出來
				GhostValue.Array[i] = DW_CreateObjEX("flag",104620,780085,i,1,200)
				AddBuff(GhostValue.Array[i],507927,1,-1)
			end
		end
--隨機移動
		if	DW_Rand(999)%17==0	then
			DW_MoveRand(GhostValue.Array[i],100,1,780085,i)
			sleep(20)
		end
	end
end
-------------------------------------
function LuaS_103120_Ghost_Controler.leave(Ghost)
--刪除所有的幽魂
	local GhostValue = FSM_GetState(Ghost,"Execute")
	for i=1,GhostValue.Num,1 do
		DW_CheckThenDel(GhostValue.Array[i])
	end
end

--------------------------------------------------------------------
LuaS_103120_Ghost_Dispear = {}
function LuaS_103120_Ghost_Dispear.update(Ghost)
	LuaS_103120_Ghost_Controler = {}
--秀個訊息也可以
end
--------------------------------------------------------------------儀器的接續射擊
function LuaS_103120_TargetSearch()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
end
----------------------------------------------------------------------------
--第四階段的艾力克區
--------------------------------------------------------------------
--艾力克不死劇情
function LuaS_104618_DontDie()
	local Me = OwnerID()
	Say(Me,"[SC_103120_CON_40105]")
	WriteRoleValue(Me,EM_RoleValue_LiveTime,1)
	WriteRoleValue(Me,EM_RoleValue_HP,(ReadRoleValue(Me,EM_RoleValue_MaxHP)*0.3))
	return false
end
--前往設備並操作它
function LuaS_103120_Freezer(Equip,Obj)
	while	true	do
		sleep(5)
--要活著
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==0	then
--非戰鬥中
			if	HateListCount( Obj)==0	or
				ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
--在裝備旁邊
				if	CheckDistance(Obj,Equip, 70)	then
--沒施法
					if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then
--如果裝備被施法
						if	CheckBuff(Equip,507773)==true	then
							CancelBuff(Equip,507876)
							local Ran = DW_Rand(999)
							if	Ran % 11==0	then
--嘲弄
								PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
								Say(Obj,"[SC_103120_CON_40102]")
							elseif	Ran % 17==0	then
--大叫
								Say(Obj,"[SC_103120_CON_40103]")
							end
						else
							sleep(20)
							if	CheckBuff(Equip,507773)==false	then--確認保險
								CastSpellLv(Obj,Equip,496280,1)--開始施法遲緩
								AddBuff(Equip,507876,1,3)
							end
						end
					else
--已經在施法的話 要判斷有沒有buff
						local Ran = DW_Rand(999)
						if	CheckBuff(Equip,507773)==true	then
							CancelBuff(Equip,507876)
							SysCastSpellLv(Equip,Obj,492185,1)
							if	Ran%7==0	then
								Say(Obj,"[SC_103120_CON_40104]")
							end
						end
					end
				else
					DW_GetClose(Obj,Equip,55)
				end
			end
		end
	end
end

----------------------------------------------------------------------------
--前往設備並偷取它
function LuaS_103120_Thief(Equip,Obj)
	while	true	do
		sleep(15)
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==0	then
			if	HateListCount( Obj)==0	or
				ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
				if	CheckDistance(Obj,Equip,50)	then
					if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then
						--挖礦動作
						CastSpellLv(Obj,Equip,496281,1)
						AddBuff(Equip,507773,1,3)
					end
				else
					DW_GetClose(Obj,Equip,40)
				end
			end
		end
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------安全刪除
function LuaS_103120_SafeDelObj(Obj)
	if	Obj==nil	then
		return false
	elseif	CheckID(Obj)==false or	ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	then
		return false
	else
		DelObj(Obj)
		return true
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------力場的設定區
function LuaS_103120_Phase402_ForceSet(Obj)
	DW_UnFight(Obj)--不可戰鬥
	Lua_ObjDontTouch( Obj )--不被發現
	AddToPartition(Obj,0)
	AddBuff(Obj,507774,1,-1)--特效
	SetPlot(Obj,"range","LuaS_103120_ForceTouch",35) --開啟力場
	return Obj
end

---------------------------------------------------------------------------------------------------
--搗亂觸發boss的艾力克區
--------------------------------------------------------------------
function LuaS_103120_EricTMan(Anborel)
	local TMan = OwnerID()
--有木頭人的buff代表是停著的
	while	true	do
		sleep(10)
		if	PE_GetActivePhaseIndex(1)~=50	then
			break
		end
		if	CheckBuff(TMan,507892)	then
			SetDefIdleMotion(TMan,ruFUSION_MIME_CRAFTING_LOOP)
			if	DW_Rand(999)%5==0		then
				PlayMotion(TMan,ruFUSION_ACTORSTATE_EMOTE_KICK)
			elseif	DW_Rand(999)%17==0	then
				PE_AddVar("EricTouchAmount",1)
			end
		else
			FaceObj( TMan, Anborel )
			AddBuff(TMan,507892,1,-1)
		end
	end
end

---------------------------------------------------------------------------------------------------
--能源吸取器區
--------------------------------------------------------------------------------------------------
function LuaS_104761_Dead()
	return false
end
--------------------------------------------------------------------------------------------
--採集高密度能源
function LuaS_116726_SetPlot()
	local Sec = 20 --打出能源信的間隔
	local Owner = OwnerID()
	SetPlot(Owner,"dead","LuaS_104761_Dead",0)--永不死亡
	SetPlot(Owner,"touch","LuaS_116726_Touch",40)
	while	true	do
		sleep(20)
		if	ReadRoleValue(Owner,EM_RoleValue_PID)>12	then
			ScriptMessage( Owner, 0, 2, "[SC_103120_SANC_03]", 0 )
			DW_CheckThenDel(Owner) --能量耗盡
		end
		SysCastSpellLv(Owner,Owner,496375,1)--打出能源信號(每2秒)
	end
end


function LuaS_116726_Touch()
	local Owner = OwnerID()
	local Target = TargetID()
	if	CheckBuff(Owner,507926)	then
		ScriptMessage( Owner, Owner, 1,"[SC_103120_SANC_08]", 0 )--你已經帶有能源了！
		return false
	end
	if	BeginCastBarEvent(Owner,Target,"[SC_USING]",10,ruFUSION_ACTORSTATE_CAST_BEGIN,ruFUSION_ACTORSTATE_CAST_BEGIN,0 ,"LuaS_116726_GetSource")~=1	then
		ScriptMessage( Owner, Owner, 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end
function LuaS_116726_GetSource(Executer,Result)
	if	Result>0	then
--成功狀態
		local Target = TargetID()
		local PID = ReadRoleValue(Target,EM_RoleValue_PID)
		EndCastBar(Executer,Result)--清除施法條
		local Obj = SearchRangeNPC( Executer , 52 ) --檢查範圍內的礦點
		for i=0,table.getn(Obj),1 do
			if	ReadRoleValue(Obj[i],EM_RoleValue_OrgID)==104757	then
				if	Boss_103120_BonusCheck ==0	then--防堵
					PE_AddVar("GetSource",10)
					LuaPE_KS_SetBonus( 1, 1, 8 , Executer )
					AddBuff(Executer,508075,0,-1)--計數
				end
				ScriptMessage( Executer, Executer, 2, "[SC_103120_SANC_07]", 0 ) --提示玩家
				break
			end
			if	i==table.getn(Obj)	then --範圍內無則給予buff
				AddBuff(Executer,507926,1,-1)
			end
		end
		WriteRoleValue(Target,EM_RoleValue_PID,PID+1)--累計一次
		if	PID==11	then--只能被採集十次
			ScriptMessage( Target, 0, 2, "[SC_103120_SANC_03]", 0 )
			DW_CheckThenDel(Target)--刪除
		end
	else
--失敗狀態
		EndCastBar(Executer,Result)--清除施法條
	end
end

function LuaS_116726_CancelBuff_01()
	local Owner = OwnerID()
	if	CheckBuff(Owner,507926)==true	then
		if	Boss_103120_BonusCheck ==0	then--防堵
			LuaPE_KS_SetBonus( 1, 1, 8,Owner )
			CancelBuff(Owner,507926)
			PE_AddVar("GetSource",10)--PE
			AddBuff(Owner,508075,0,-1)--計數
		end
	end
	if	CheckBuff(Owner,508073)	then
		ScriptMessage( Owner, Owner, 0 ,"[SC_103120_SANC_14]", C_Yellow )
		CancelBuff(Owner,508073)
	end
end

function LuaS_116726_CancelBuff_02()
	local Owner = OwnerID()
	if	CheckBuff(Owner,508073)	then
		ScriptMessage( Owner, Owner, 0 ,"[SC_103120_SANC_14]", C_Yellow )
		CancelBuff(Owner,508073)
	end
end
-----------------------------------------------------------------------

--能源產生與控管
function LuaS_116726_OutputControl(GIDArray, ResetTimeArray,CreateRange,IfInitial)
	if	IfInitial==false	then
		for i=1,GetMoveFlagCount(780087)-1,1 do
			if	GIDArray[i]==nil	then
				if	ResetTimeArray[i] > 60	then
					GIDArray[i] = LuaS_116726_InitialSetPlot(DW_CreateObjEX("flag",116726,780087,i,1,CreateRange))
				else
					ResetTimeArray[i] = ResetTimeArray[i]+1
				end
			elseif	CheckID(GIDArray[i])==false	then
				GIDArray[i] = nil
				ResetTimeArray[i]=0
			end
		end
	else
		for i=1,GetMoveFlagCount(780087)-1,1 do
			GIDArray[i] = LuaS_116726_InitialSetPlot(DW_CreateObjEX("flag",116726,780087,i,1,CreateRange))
			ResetTimeArray[i] = 0
		end
	end
	return GIDArray,ResetTimeArray
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
function LuaS_116726_InitialSetPlot(Obj)
	BeginPlot(Obj,"LuaS_116726_SetPlot",0)
	return Obj
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
function LuaS_116726_AllClear(Array)
	for i=1,table.getn(Array),1 do
		DW_CheckThenDel(Array[i])
	end
end
-----------------------------------------------------------------------
function LuaS_SanctionDeadCount()
	local Target = TargetID()
	if	Boss_103120_BonusCheck ==0	then--防堵
		LuaPE_KS_GetBonus( 1, 1, 4 )
		if	Target ~= nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
				PE_AddVar("KillSanction",1)
				AddBuff(Target,508074,0,-1)
			end
		end
	end
	DW_CheckThenDel(OwnerID())
	return true
end


---------------------------------------------------------------------- 物品包裏的程式指令
function LuaS_103120_ItemDropList(Option)
	local PlayerID = OwnerID()
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725504 , 1 ) 
		GiveBodyItem( PlayerID , 206593 , 5 ) 
		if	DW_Rand(10000)<5	then
			GiveBodyItem( PlayerID , 725317 , 1) 
		end
		-----------   5.0.2  公會boss家具新增配方與材料掉落  --------------
		local R1 = Rand(100)+1
	--	Say(PlayerID, "R1 ="..R1 )
		if R1 > 95 then  -- random 1 ~ 100 , 5%掉落配方
				if DW_Rand(100)>20 then --  80% 給a配方
					GiveBodyItem( PlayerID , 552085 , 1)   -- 給a配方
				else  -- 10%給b配方
					GiveBodyItem( PlayerID , 552086 , 1)   -- 給b配方
				end
		end
		local R2 = Rand(100)+1
--		Say(PlayerID, "R2 ="..R2 )
		if R2 >95 then  -- random 1 ~ 100 , 5%掉落特殊材料
				if DW_Rand(100)>20 then --  80% 給a材料
					GiveBodyItem( PlayerID , 241753 , 1)   -- 給a材料
				else  -- 20%給b材料
					GiveBodyItem( PlayerID , 241754 , 1)   -- 給b材料
				end
		end

		-------------------------------------------------

	end
end

-----------------------------------------------------------------------王的掉寶劇情
function LuaS_103120_BossDrop(Obj)
	ScriptMessage( Obj, -1, 2, "[SC_103120_CON_00000]", C_Yellow )
	for i=1,GetMoveFlagCount(780090),1 do
		LuaS_103120_DropNPCSet(DW_CreateObjEX("flag",116784,780090,i,1,140))
	end
end

function LuaS_103120_DropNPCSet(Obj)
	SetModeEx(Obj,EM_SetModeType_ShowRoleHead,false)  --不秀血條
	SetModeEx(Obj,EM_SetModeType_HideName,true)  --不秀名稱
	SetPlot(Obj,"touch","LuaS_103120_DropTouchPlot",30)--觸碰劇情
	WriteRoleValue(Obj,EM_RoleValue_LiveTime,30) --存活時間
	AddBuff(Obj,505498,1,-1) --特效
	return Obj
end


function LuaS_103120_DropTouchPlot()
	SetPlot(TargetID(),"touch","",0)
	if	CheckAcceptQuest(OwnerID(),423651)==true	and
		CountBodyItem(OwnerID(),208310)==0	then
		GiveBodyItem(OwnerID(),208310,1)
	end
	GiveBodyItem(OwnerID(),240665,1)--給予稱號
	GiveBodyItem(OwnerID(),208435,1)--王的掉落物
	DW_CheckThenDel(TargetID())
end

-----------------------------------------------------------------------進入蒙諾卡遺址的碰撞劇情
function LuaS_Zone16to210_01()
	SetPlot(OwnerID(),"collision","LuaS_Zone16to210_02",0)
end

function LuaS_Zone16to210_02()
	local Coordinate = {}
	Coordinate[1] = {-1426.2,125,120,300.7}
	Coordinate[2] = {238.4,10,1764.8,72.9}
	Coordinate[3] = {2156.3,-125.1,184.5,176.2}
	Coordinate[4] = {75.9,10,-1368.9,287.2}

	local i = DW_Rand(999)%4+1
	ChangeZone( OwnerID() , 210 , 0 , Coordinate[i][1] , Coordinate[i][2] , Coordinate[i][3] , Coordinate[i][4] )
end

-------------------------------------------------------------------------力場檢測

function LuaS_103120_IfOwnForceBuff()
	if	CheckBuff(TargetID(),507775)	then
		return false
	end
	return true
end