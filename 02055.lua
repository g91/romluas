


----------------------------------------------------------------
--制裁者管理函式&行動方針
function LuaS_103120_SanctionHandle()
--------------------------------
	local TeamAmount = GetMoveFlagCount(780081)-1 --分隊總數
	local LimitAmount = 16 --單隊上限
--[0] 陣亡數量計數
--LimitAmount+1  為團隊狀態 [0，全滅或未出生]  [1，需要生產] [2，特效播放]  [3,生產完成]
--LimitAmount+2  重生時間
--LimitAmount+3  特效產生ID
	local Duration = 20--生產間隔
	local SuicideLimit = 9--自爆底限
	local LocalRand = 180 --亂數範圍
--(數值組)技能難度
--制裁者的自爆所產生的傷害%數：496274
	local SkillLV_496274= 0

--分隊整理&重生
	for i=1,TeamAmount,1 do
		if	Sanctions[i] == nil	then
			Sanctions[i] = {}
		end
--隊伍狀態&重生時間
		if	Sanctions[i][LimitAmount+1]==nil	then
			Sanctions[i][LimitAmount+1]=1
		elseif	Sanctions[i][LimitAmount+1]==0	then
			if	Sanctions[i][LimitAmount+2]==nil	then--從未全滅過==>建立重生時間欄位
				Sanctions[i][LimitAmount+2]=1
			elseif	Sanctions[i][LimitAmount+2]<Duration	then--如果重生時間還沒到==>持續累計時間
				Sanctions[i][LimitAmount+2]=Sanctions[i][LimitAmount+2] + 1
			else
				Sanctions[i][LimitAmount+1]=1--開啟生產需求
				Sanctions[i][LimitAmount+2]=0--重置重生時間
			end
		end
		if	Sanctions[i][LimitAmount+1]==1	then--需要生產
			Sanctions[i][LimitAmount+1]=2
--確認生產指令==>播放特效
		elseif	Sanctions[i][LimitAmount+1]==2	then
			if	(Sanctions[i][0] == nil	or	Sanctions[i][0]==0)	then
				Sanctions[i][0] =1
				Sanctions[i][LimitAmount+3] =  DW_CreateObjEX("flag",104612,780081,i,0,LocalRand)
				Lua_ObjDontTouch( Sanctions[i][LimitAmount+3] )--關閉一切屬性
				DW_UnFight(Sanctions[i][LimitAmount+3] )
				AddToPartition(Sanctions[i][LimitAmount+3],0)
				AddBuff(Sanctions[i][LimitAmount+3],507768,20,20)--特效
				break --跳出等下次
			elseif	Sanctions[i][0] <5	then
				Sanctions[i][0] = Sanctions[i][0]+1	
			elseif	Sanctions[i][0] >=5	then
--開始生產(亂數產生位置&執行AI)
				for k=1,LimitAmount,1 do
					if	k==LimitAmount-2	then--特殊制裁者編號不同
						Sanctions[i][k] = DW_CreateObjEX("obj",104614,Sanctions[i][LimitAmount+3],1,180)
					elseif	k==LimitAmount-4	then
						Sanctions[i][k] = DW_CreateObjEX("obj",104615,Sanctions[i][LimitAmount+3],1,180)
					elseif	k==LimitAmount-6	then
						Sanctions[i][k] = DW_CreateObjEX("obj",104616,Sanctions[i][LimitAmount+3],1,180)
					elseif	k==LimitAmount-10	then
						Sanctions[i][k] = DW_CreateObjEX("obj",104617,Sanctions[i][LimitAmount+3],1,180)
					else
						Sanctions[i][k] = DW_CreateObjEX("obj",104613,Sanctions[i][LimitAmount+3],1,180)--普通制裁者
					end

					SetPlot(Sanctions[i][k],"dead","LuaS_SanctionDeadCount",0)
					WriteRoleValue(Sanctions[i][k],EM_RoleValue_Register2,i)
					BeginPlot(Sanctions[i][k],"LuaS_103120_SanctionAI",0)--執行AI
				end
				DW_CheckThenDel(Sanctions[i][LimitAmount+3])--刪除特效
				Sanctions[i][LimitAmount+1]=3--停止生產
				break --跳出等下次
			end
		elseif	Sanctions[i][LimitAmount+1]==3	then
			Sanctions[i][0]=0--存亡計數歸零
--戰鬥狀態==>計數==>更新指令
			for k=1,LimitAmount,1 do
				if	CheckID(Sanctions[i][k])==false	or
					ReadRoleValue(Sanctions[i][k],EM_RoleValue_IsDead)==1	then--如單位死亡==>增加計數
					Sanctions[i][0] = Sanctions[i][0]+1
					if	Sanctions[i][0] >= SuicideLimit	then--若單隊死亡數超過限度就全部引爆
						for k=1,LimitAmount,1 do
							if	CheckID(Sanctions[i][k])==true	and
								ReadRoleValue(Sanctions[i][k],EM_RoleValue_IsDead)==0	then--只要還存活的單位
								SysCastSpellLv(Sanctions[i][k],Sanctions[i][k],496274,SkillLV_496274)--自爆
								SetDefIdleMotion(Sanctions[i][k],ruFUSION_MIME_IDLE_DEAD)
								PlayMotion(Sanctions[i][k],ruFUSION_ACTORSTATE_DYING)

								WriteRoleValue(Sanctions[i][k],EM_RoleValue_LiveTime,1)
							elseif	CheckID(Sanctions[i][k])==true	and ReadRoleValue(Sanctions[i][k],EM_RoleValue_IsDead)==1	then
								DW_CheckThenDel(Sanctions[i][k])
							end
						end
						for k=1,LimitAmount,1 do
							LuaS_103120_Sanction[Sanctions[i][k]] = nil
						end
						Sanctions[i]=nil--標記全滅=>釋放記憶體
						break --跳出等下次
					end
					if	Sanctions[i][0] == LimitAmount	then--如果滅亡數 = 總數
						for k=1,LimitAmount,1 do
							LuaS_103120_Sanction[Sanctions[i][k]] = nil
						end
						Sanctions[i]=nil--標記全滅=>釋放記憶體
						break --跳出等下次
					end
				end
			end
		end
	end
	for i=1,3,1 do
		if	TankSanctions[i]==nil	then
			TankSanctions[i] = DW_CreateObjEX("flag",104809,(780090+i),1,1,500)
			SetPlot(TankSanctions[i],"dead","LuaS_SanctionDeadCount",0)
			WriteRoleValue(TankSanctions[i],EM_RoleValue_Register1,555)
		end
		if	CheckID(TankSanctions[i])==false	then
			TankSanctions[i] = DW_CreateObjEX("flag",104809,(780090+i),1,1,500)
			SetPlot(TankSanctions[i],"dead","LuaS_SanctionDeadCount",0)
			WriteRoleValue(TankSanctions[i],EM_RoleValue_Register1,555)
		end
		if	ReadRoleValue(TankSanctions[i],EM_RoleValue_Register1)==555	then--已停止移動
			if	HateListCount( TankSanctions[i])==0	and
				ReadRoleValue(TankSanctions[i],EM_RoleValue_IsAttackMode)==0	then--非戰鬥才移動
				if	i==1	then
					SetPlot(TankSanctions[i],"range","LuaS_103120_TankRangePlot",350)
				end
				CallPlot(TankSanctions[i],"LuaS_103120_TankSanctionAI",TankSanctions[i],780090+i)--移動
			end
		end
	end
end
function LuaS_103120_TankSanctionAI(Obj,FlagID)
	WriteRoleValue(Obj,EM_RoleValue_Register1,0)
	for i=1,GetMoveFlagCount(FlagID)-1,1 do
		DW_MoveToFlag( Obj , FlagID, i,80,1 )--迴圈=>移動
		if	HateListCount( Obj)~=0	or
			ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1	then--若在戰鬥中就跳出
			break
		end
	end
	WriteRoleValue(Obj,EM_RoleValue_Register1,555) --顯示脫離迴圈
end
function LuaS_103120_TankRangePlot()
	local Obj = OwnerID()--玩家
	local Target = TargetID()--坦克
	SysCastSpellLv(Obj,Target,495751,1)
end
----------------------------------------------------------------
LuaS_103120_Sanction = {}
--行動AI
function LuaS_103120_SanctionAI()
--建立所有戰術列表
	local State = {}
	State[900]=LuaS_SanctionTactical_Initial--初始化
	State[901]=LuaS_SanctionTactical_Normal--採集模式
	State[902]=LuaS_SanctionTactical_Hunt --巡狩模式
	State[995]=LuaS_SanctionTactical_FixAnberale--修復模式
	State[1000]=LuaS_SanctionTactical_Fight --戰鬥模式
	local OwnerID=OwnerID()--記錄此制裁者的ID
	local ThisObj=FSM_Initial(OwnerID,State)--初始化傳值動作:ThisObj為一個table
	ThisObj.Creater = TargetID()
	LuaS_103120_Sanction[OwnerID]=ThisObj--記錄專屬的AI執行
	FSM_DoTransion(ThisObj,900)--初始將從哪一個戰術開始執行
--迴圈執行戰術
	while true do
		sleep(10)
		FSM_Update(ThisObj)
	end
end

----------------------------------------------------------------
function LuaS_SanctionTactical_InitialEnter(OrgID,Obj)
--(數值組)技能難度
--鎖定目標技能(吸怪秒數)：496269
	if	SkillLV_496269==nil	then
		SkillLV_496269 = 10
	end

	if	OrgID==104614	then
		SetModeEx( Obj,EM_SetModeType_Searchenemy,false) --104614不會索敵
	elseif	OrgID==104615	then
		WriteRoleValue(Obj,EM_RoleValue_PID,SkillLV_496269)
		SetPlot(Obj,"dead","LuaS_104615_Dead",0)--104615死亡會爆炸造成傷害並指定目標被圍攻==>死亡劇情
	elseif	OrgID==104616	then
		SetPlot(Obj,"dead","LuaS_104616_Dead",0)--104616死亡會放出範圍傷害dot==>死亡劇情
	elseif	OrgID==104617	then
		SetPlot(Obj,"dead","LuaS_507765_Attach_02",0)--104617死亡要解除連結
	end
end
----------------------------------------------------------------
LuaS_SanctionTactical_Initial = {}
--初始化
function LuaS_SanctionTactical_Initial.enter(ThisObj)
	LuaS_SanctionTactical_InitialEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID)
end

function LuaS_SanctionTactical_Initial.update(ThisObj)
	if	AI_Order_103120~= 900	then
		return AI_Order_103120
	end
end

function LuaS_SanctionTactical_Initial.leave(ThisObj)

end
----------------------------------------------------------------
function LuaS_SanctionTactical_NormalEnter(OrgID,Obj)
	if	OrgID ==104614	then
		AddBuff(Obj,507763,14,-1)--單人很難與104614單挑==>離開戰鬥就補充次數減傷盾
	end
end

function LuaS_SanctionTactical_NormalUpdate(OrgID,Obj)
	if	OrgID ==104614	then
		if	DW_CheckUse(Obj,496276)<=0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then  --104614每三秒鐘會掃描一次附近
			CastSpell(Obj,Obj,496276)
		end
	end
end

function LuaS_SanctionTactical_NormalLoop(Obj)
	MoveToFlagEnabled(Obj, false)
--特殊AI執行
	LuaS_SanctionTactical_NormalUpdate(ReadRoleValue(Obj,EM_RoleValue_OrgID),Obj)
--戰鬥外
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	and
		HateListCount( Obj)==0	then
--先判定附近是否有礦石
		if	CheckBuff(Obj,507879)	then--若有礦石打出來的Buff 代表附近有礦石
			local Rock = BuffInfo(Obj,Lua_BuffPosSearch( Obj , 507879 ),EM_BuffInfoType_OwnerID)--找出是哪一個礦石
			if	CheckID(Rock)==false	then
				CancelBuff(Obj,507879)
				CancelBuff(Obj,507880)
			else
				if	CheckBuff(Obj,507880)	then --已經在挖的
					SetDefIdleMotion(Obj,ruFUSION_MIME_SLEEP_LOOP)--挖礦動作
					WriteRoleValue(Obj,EM_RoleValue_Register1,1)
					if	SanctionMark==1	then
						PE_AddVar("TakeSource",-90)--增加PE的採集點數
					else
						PE_AddVar("TakeSource",-30)--增加PE的採集點數
					end
					if	DW_Rand(999)%7==0	then
						WriteRoleValue(Rock,EM_RoleValue_PID,ReadRoleValue(Rock,EM_RoleValue_PID)+1)
					end
				else
					FaceObj( Obj, Rock)--前往礦區
					AddBuff(Obj,507880,1,-1)--標記已在進行採礦
				end
			end
		else--附近的能源信號消失
			if	ReadRoleValue(Obj,EM_RoleValue_Register1)==1	then
				WriteRoleValue(Obj,EM_RoleValue_Register1,0)
				SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND) --回復平時動作
				CancelBuff(Obj,507880)--取消挖能源的動作
			end
--沒礦才隨機移動
			if	DW_Rand(999)%7==0	then
				if	DW_CheckDis(Obj,780081,ReadRoleValue(Obj,EM_RoleValue_Register2),300)	then
					if	DW_MoveRand(Obj,300)~=false	then
						sleep(20)
					end
				else
					if	DW_MoveRand(Obj,350,1,780081,ReadRoleValue(Obj,EM_RoleValue_Register2))~=false	then
						sleep(20)
					end
				end
			end
		end
	else
--進入戰鬥
		sleep(5)
		return 1000
	end
end
----------------------------------------------------------------
LuaS_SanctionTactical_Normal = {}
--採集模式
function LuaS_SanctionTactical_Normal.enter(ThisObj)
	LuaS_SanctionTactical_NormalEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID	)
end

function LuaS_SanctionTactical_Normal.update(ThisObj)
--確認階段
	if	AI_Order_103120~=901		then
		return AI_Order_103120
	end
	if	LuaS_SanctionTactical_NormalLoop(ThisObj.MonID) == 1000	then
		return	1000
	end
end

function LuaS_SanctionTactical_Normal.leave(ThisObj)
	CancelBuff(ThisObj.MonID,507880)
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
end
---------------------------------------------------------------------------
function LuaS_SanctionTactical_HuntLoop(Obj)
	MoveToFlagEnabled(Obj, false)--關閉路徑移動
--區分是否要進入戰鬥模式
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	and
		HateListCount(Obj)==0	then--戰鬥外
--非戰鬥的戰術執行
		LuaS_SanctionTactical_NormalUpdate(	ReadRoleValue(Obj,EM_RoleValue_OrgID),	
							Obj	)
--進行隨機移動
		if	DW_Rand(999)%7==0	then--隨機判斷要移動
			if	DW_CheckDis(Obj,780081,ReadRoleValue(Obj,EM_RoleValue_Register2),300)	then
				if	DW_MoveRand(Obj,200)~=false	then
					sleep(20)
				end
			else
				if	DW_MoveRand(Obj,350,1,780081,ReadRoleValue(Obj,EM_RoleValue_Register2))~=false	then
					sleep(20)
				end
			end
		end
	else
--進入戰鬥就切換到戰鬥模式
		sleep(5)
		return 1000
	end
end
---------------------------------------------------------------------------
LuaS_SanctionTactical_Hunt = {}
--巡狩模式
function LuaS_SanctionTactical_Hunt.enter(ThisObj)
	LuaS_SanctionTactical_NormalEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID	)
end

function LuaS_SanctionTactical_Hunt.update(ThisObj)
--先判斷現在的階段是否有變動
	if	AI_Order_103120~=902		then
		return AI_Order_103120
	end
	if	LuaS_SanctionTactical_HuntLoop(ThisObj.MonID)==1000	then
		return 1000
	end
end

function LuaS_SanctionTactical_Hunt.leave(ThisObj)
end
----------------------------------------------------------------
function LuaS_SanctionTactical_FightEnter(OrgID,Obj,Target)
	if	SkillLV_496267==nil	then
		SkillLV_496267 = 3--衝鋒擊倒技能(擊倒秒數)：496267
	end
	if	OrgID == 104614	then
		SysCastSpellLv(Target,Obj,496266,1)--鎖定目標
		AddBuff(Obj,506984,7,10)--加速到極快
		CastSpellLV(Obj,Target,496267,SkillLV_496267)--衝鋒目標
	elseif	OrgID == 104613	then
		if	SanctionMark==2	then
			AddBuff(Obj,507929,1,-1)
		end
	end
end

function LuaS_SanctionTactical_FightUpdate(OrgID,Obj,Target,
LvSet1,--特殊制裁者傷害技能(百分比)：496268
LvSet2,--衝鋒擊倒技能(擊倒秒數)：496267
LvSet3,--鎖定目標技能(吸怪秒數)：496269
LvSet4,--符文毀滅力場傷害%數：496273
LvSet5)--制裁者擒拿術持續秒術：496272
	if	OrgID == 104614	then--制裁者27型(特殊潛伏單位)
		if	CheckBuff(Target,507759)==false	then--若未被撲倒==>衝鋒撲倒
			CastSpellLV(Obj,Target,496267,LvSet2)	
		else--如果對方已經被推倒=>持續攻擊
			SysCastSpellLv(Obj,Target,496268,LvSet1)
		end

	elseif	OrgID == 104615	then--制裁者01型(特殊指揮單位)
		if	(DW_Rand(999)%7)==0		then--隨機亂數
			local Target = ReadRoleValue(Obj,EM_RoleValue_AttackTargetID)
			if	CheckBuff(Target,507181)==false	then--挑選還沒被buff 
				if	DW_CheckUse(Obj,496270) <= 0	and
					ReadRoleValue(Obj,EM_RoleValue_SpellMagicID )==0	then--等待CD時間
					CastSpellLV(Obj,Target,496270,1) --給鎖定Buff
					SysCastSpellLv(Target,Target,496269,LvSet3)--叫目標施展仇恨法術
					ScriptMessage( Target, Target, 2 , "[SC_103120_SANC_05]", C_Red ) --提示
				end
			end
		end

	elseif	OrgID == 104616	then--制裁者48型(特殊打擊單位)
		if	DW_CheckUse(Obj,496271)==0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then--等待CD時間
			CancelBuff(Obj,507762)--解除隨機移動的buff
			WriteRoleValue(Obj,EM_RoleValue_PID,LvSet4) --設定技能強度
			CastSpellLV(Obj,Target,496271,1)
			ScriptMessage( Target, Target, 2 , "[SC_103120_SANC_06]", C_Red ) --提示
		else
			if	CheckBuff(Obj,507762)==false	then--持續亂跑
				AddBuff(Obj,507762,100,-1)
			end
		end

	elseif	OrgID == 104617	then--制裁者21型(特殊突擊單位)
		if	DW_CheckUse(Obj,496272)==0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	and
			ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	and --只對玩家放
			CheckBuff(Target,507766)==false	then--等待CD時間&對方身上的效果時間結束
			CancelBuff(Obj,507762)--解除隨機移動的buff
			CastSpellLV(Obj,Target,496272,LvSet5)--同時給自己特殊移動狀態
			CallPlot(Target,"LuaS_507766_CheckCancel",Target,Obj)
			sleep(20)
		else
			if	CheckBuff(Obj,507762)==false	then
				AddBuff(Obj,507762,100,-1)
			end
		end

	end--結尾
end
----------------------------------------------------------------
LuaS_SanctionTactical_Fight = {}
--戰鬥模式
--不同的單位有不同的戰鬥方式
function LuaS_SanctionTactical_Fight.enter(ThisObj)
	LuaS_SanctionTactical_FightEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID,
						ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID)	)
end

function LuaS_SanctionTactical_Fight.update(ThisObj)
--確認是否脫離戰鬥
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==0	or
		HateListCount( ThisObj.MonID)==0				then
		sleep(10)
		return AI_Order_103120
	end
	LuaS_SanctionTactical_FightUpdate(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID,
						ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID),
						0,3,4,0,3	)--執行戰鬥AI
end

function LuaS_SanctionTactical_Fight.leave(ThisObj)
--清除隨機移動buff
	if	CheckBuff(ThisObj.MonID,507762)	then
		CancelBuff(ThisObj.MonID,507762)
	end
	if	CheckBuff(ThisObj.MonID,506984)	then
		CancelBuff(ThisObj.MonID,506984)
	end
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_IsWalk,1)
end
----------------------------------------------------------------
function LuaS_SanctionTactical_FixUpdate(Obj,OrgID,Creater)
--戰鬥外與戰鬥中的反應不同
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	and
		HateListCount(Obj)	==0	then--戰鬥外
--修復模式的戰術(非戰鬥)
		LuaS_SanctionTactical_NormalUpdate(OrgID,Obj)
--以距離決定要隨機移動還是進行修復
		if	CheckDistance(Obj,Creater, 200)	then--距離安柏瑞爾很近
			if	CheckBuff(Obj,507877)	then--已在修復中
				SetDefIdleMotion(Obj,ruFUSION_MIME_CAST_LOOP)--修復動作
				WriteRoleValue(Obj,EM_RoleValue_Register1,1)
				if	SanctionMark ==3	then
					SysCastSpellLv(Obj,Creater,496284,4999)--補5000滴血
				else
					SysCastSpellLv(Obj,Creater,496284,49)--補50滴血
				end
			else
				FaceObj( Obj,Creater)
				AddBuff(Obj,507877,1,-1)
			end
		else--離安柏瑞爾太遠
			if	ReadRoleValue(Obj,EM_RoleValue_Register1)==1	then
				WriteRoleValue(Obj,EM_RoleValue_Register1,0)
				SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND) --回復平時動作
			end
			if	DW_Rand(999)%7==1	then--隨機移動
				if	DW_CheckDis(Obj,780081,ReadRoleValue(Obj,EM_RoleValue_Register2),300)	then
					if	DW_MoveRand(Obj,180)~=false	then
						sleep(20)
					end
				else
					if	DW_MoveRand(Obj,350,1,780081,ReadRoleValue(Obj,EM_RoleValue_Register2))~=false	then
						sleep(20)
					end
				end
			end
		end
	else--戰鬥中
		sleep(5)
		return 1000
	end
end
-----------------------------------------------------------------
LuaS_SanctionTactical_FixAnberale = {}
--修復模式
function LuaS_SanctionTactical_FixAnberale.enter(ThisObj)
--非戰鬥模式的戰術列表(非戰鬥)
	LuaS_SanctionTactical_NormalEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID	)
end

function LuaS_SanctionTactical_FixAnberale.update(ThisObj)
--先判斷現在的階段是否有變動
	if	AI_Order_103120~=995		then
		return AI_Order_103120
	end
	if	LuaS_SanctionTactical_FixUpdate(	ThisObj.MonID,
							ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
							ThisObj.Creater		) == 1000	then
		return 1000
	end
end

function LuaS_SanctionTactical_FixAnberale.leave(ThisObj)
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
	CancelBuff(ThisObj.MonID,507877)
end

----------------------------------------------------------------
--104614用來判定是否進入戰鬥的檢查
function LuaS_507769_MagicCheck()
	local TargetPlayer = TargetID()
	local BuffLocation = Lua_BuffPosSearch( TargetPlayer , 507769 )
	if	BuffLocation ~= -1	then
		if	BuffInfo( TargetPlayer , BuffLocation , EM_BuffInfoType_Power )>=3	then
			ScriptMessage( TargetPlayer, TargetPlayer, 2 , "[SC_103120_SANC_05]", C_Red ) --提示
--讓玩家對女巫型制裁者挑釁
			SysCastSpellLv(TargetPlayer,OwnerID(),495751,3)
		end
	end
	return true
end
----------------------------------------------------------------

function LuaS_507764_Summer(Obj)
	local TID
	if	Obj ==nil	then
		TID = TargetID()
	else
		TID = Obj
	end
	local Summer = Lua_DW_CreateObj("obj",104611,TID,0,(DW_Rand(40)*2))
	DW_UnFight(Summer)--關掉任何會曝光的屬性
	Lua_ObjDontTouch( Summer )
	AddToPartition(Summer,0)
	AddBuff(Summer,507770,1,-1)
--執行劇情
	CallPlot(Summer,"LuaS_507764_Summer_01",ReadRoleValue(OwnerID(),EM_RoleValue_PID),Summer)
--還原104616的PID
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end
----------------------------------------------------------------
function LuaS_507764_Summer_01(SkillLV,Obj)
--施法大約持續9秒
	CastSpellLV(Obj,Obj,496273,SkillLV)
--迴圈判斷
	while	true	do
		sleep(5)
		if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then
			DW_CheckThenDel(Obj)
		end
	end
end
----------------------------------------------------------------
function LuaS_507765_Attach()
--串連參考點
	AttachObj( OwnerID() , TargetID() ,1,"p_hit_point01","p_mouth")
	SysCastSpellLv(TargetID(),OwnerID(),496266,1)
	CallPlot(OwnerID(),"LuaS_507765_Attach_01",TargetID())
end
----------------------------------------------------------------
--玩家死亡或buff消失要解除連結
function LuaS_507765_Attach_01(Target)
	while true do
		sleep(2)
--兩種狀況解除連結
--玩家out
		if	CheckID(Target)==false		or
			ReadRoleValue(Target,EM_RoleValue_IsDead)==1	then
			DetachObj(OwnerID())
			return
		end
--玩家的buff已經解除w
		if	CheckBuff(Target,507766)==false	then
			DetachObj(OwnerID())
			return
		end
	end
end
----------------------------------------------------------------
--死亡劇情解除連結
function LuaS_507765_Attach_02()
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
	DetachObj(OwnerID())
	DW_CheckThenDel(OwnerID())
	return true
end

---------------------------------------------------------------
function LuaS_507766_CheckCancel(Me,Jacky)
	while	true	do
		if	CheckBuff(Me,507766)==false	then --buff沒了
			return
		end
		if	CheckID(Jacky)==false	or	ReadRoleValue(Jacky,EM_RoleValue_IsDead)==1	then --Jacky死了
			CancelBuff(Me,507766)
			return
		end
		sleep(3)
	end
end
----------------------------------------------------------------
function LuaS_104615_Dead()

	local Owner = OwnerID()
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
	SysCastSpellLv(Owner,Owner,496275,1)--特效
	local RealPlayer = {}
--可調整變數
	local HowRange = 85

	local RangePlayer = SearchRangePlayer ( Owner , HowRange )
	for i=0,table.getn(RangePlayer),1 do
		if	ReadRoleValue(RangePlayer[i],EM_RoleValue_IsPlayer)==1	then
			if	ReadRoleValue(RangePlayer[i],EM_RoleValue_IsDead)==0	then
				table.insert(RealPlayer,RangePlayer[i])
			end
		end
	end
	for i=1,table.getn(RealPlayer),1 do
		if	i>2	then
			break
		end
		SysCastSpellLv(RealPlayer[i],RealPlayer[i],496269,ReadRoleValue(Owner,EM_RoleValue_PID))
	end
	DW_CheckThenDel(OwnerID())
	return true
end
----------------------------------------------------------------
function LuaS_104616_Dead()

	local Target = TargetID()
	local Owner = OwnerID()
	if	Boss_103120_BonusCheck ==0	then--防堵
		LuaPE_KS_GetBonus( 1, 1, 4 )
		if	Target ~= nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
				PE_AddVar("KillSanction",1)
				AddBuff(Target,508074,0,-1)
			end
		end
	end
--(數值組)技能難度
--符文毀滅力場傷害%數：496273
	local SkillLV_496273 = 0

	WriteRoleValue(OwnerID(),EM_RoleValue_PID,SkillLV_496273)
	LuaS_507764_Summer(OwnerID())
	DW_CheckThenDel(OwnerID())
	return true
end
----------------------------------------------------------------採集信號
function LuaS_104613_Detect()
	local Array = {}
	Array[1] = 104613
	Array[2] = 104614
	Array[3] = 104615
	Array[4] = 104616
	Array[5] = 104617
	local Target = TargetID()
	local OrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	for i=1,table.getn(Array),1 do
		if	OrgID==Array[i]	then
			return true
		end
	end
	return false
end

---------------------------------------------------------------104617  抓人的

function LuaS_104617_CallHelp()
	local Owner = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
		Say(Target,"[SC_103120_SANC_01]")
	end
end

function LuaS_104614_CallHelp()
	local Owner = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
		Say(Target,"[SC_103120_SANC_02]")
	end
end