--副職業取得

function LuaS_545159_QuestGet()
	local Obj = TargetID()--注意;這裡是TargetID
	ScriptMessage( Obj, Obj, 0, "[SC_545159_1]", C_YELLOW )	--你現在可以找指導員們學習職業技巧！
	if	CheckFlag(Obj,540820)==true then
		return
	end

end

function LuaS_545159_GetJob()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	local PlayerRace = ReadRoleValue(Obj,EM_RoleValue_Race);
	local IsFirstSignJob = (CheckFlag(Obj,540804)==false);
	if	PlayerRace <=1 then
		if	IsFirstSignJob==true	then
			if ReadRoleValue(Obj,EM_RoleValue_VOC)<9 then
				SetFlag(Obj,ReadRoleValue(Obj,EM_RoleValue_VOC)+544753,1);
				SetFlag(Obj,540804,1);
			end
		end
	end
	--前置任務判斷--
	if	CheckFlag(Obj,545159)==false	then						--判斷是否有完成前置任務(名聲良好)
		return
	end
	
	--種族類型判斷--
	local RaceOccupationList = {}
	RaceOccupationList[0] = {1,2,3,4,5,6};
	RaceOccupationList[1] = {1,2,3,4,[7]=7,[8]=8};
	RaceOccupationList[2] = {1,[3]=3,[4]=4,[5]=5,[9]=9,[10]=10};
	local JobIndex = math.floor(ReadRoleValue(Target,EM_RoleValue_PID)/10)	--利用PID的十位數代替職業
	if	PlayerRace>=2 then
		return;--種族不符合就結束
	else
		if	RaceOccupationList[PlayerRace][JobIndex]==nil	then
			return;--種族不符合就結束
		end
	end
	--職業資料列表--
	local VocArray = {
							[1]={[1]=EM_RoleValue_VOCLV_Warrior	,[2]="SO_GETWARRIOR_1"},
							[2]={[1]=EM_RoleValue_VOCLV_Ranger	,[2]="SO_GETRANGER_1"},
							[3]={[1]=EM_RoleValue_VOCLV_Rogue		,[2]="SO_GETROGUE_1"},
							[4]={[1]=EM_RoleValue_VOCLV_Wizard	,[2]="SO_GETMAGE_1"},
							[5]={[1]=EM_RoleValue_VOCLV_Priest		,[2]="SO_GETPRIEST_1"},
							[6]={[1]=EM_RoleValue_VOCLV_Knight		,[2]="SO_GETKNIGHT_1"},
							[7]={[1]=EM_RoleValue_VOCLV_RuneDancer	,[2]="SO_GETWARDEN_1"},
							[8]={[1]=EM_RoleValue_VOCLV_Druid		,[2]="SO_GETDRUID_1"}

																			}
	local VocNum = 0
	for i=1,8,1 do
		if	ReadRoleValue(Obj,VocArray[i][1])~=0	then
			VocNum = VocNum +1
		end
	end
	
	--職業上限判斷--
	local CheckVocNumPass = true				--職業上限判斷
	if	ReadRoleValue( Obj , EM_RoleValue_VocCount )<=VocNum	then
		CheckVocNumPass = false
	end
	if	CheckVocNumPass == false	then		--如果職業到上限則停止
		return
	end
	
	--已有職業判斷--
	local VocType = math.floor(ReadRoleValue(Target,EM_RoleValue_PID)/10)
	if	ReadRoleValue(Obj,VocArray[VocType][1])~=0	then	--如果已經有此職業則停止
		return
	end
	
	
	AddSpeakOption(Obj,Obj,"["..VocArray[VocType][2].."]","LuaS_545159_GetJob_GoUp", 0 )
end

function LuaS_545159_GetJob_GoUp()
	local Obj = OwnerID()
	local Target = TargetID()
	CloseSpeak(Obj);
	local String = {
		[1]="SC_545159_2",
		[2]="SC_545159_3",
		[3]="SC_545159_4",
		[4]="SC_545159_5",
		[5]="SC_545159_6",
		[6]="SC_545159_7",
		[7]="SC_545159_8",
		[8]="SC_545159_9"
					}
	local VocType = math.floor(ReadRoleValue(Target,EM_RoleValue_PID)/10)
	WriteRoleValue(Obj,EM_RoleValue_VOC_SUB,VocType)		--給予職業
	ScriptMessage( Obj, Obj, 0, "["..String[VocType].."]", C_YELLOW )
	SetFlag(Obj,540820,1)	--副職業資格
	if CheckFlag( OwnerID() , 540190 ) == false then		--傳送術
		SetFlag(OwnerID(),540190,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
	end
	if CheckFlag( OwnerID() , 540191 ) == false then		--傳送術
		SetFlag(OwnerID(),540191,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
	end
end

--進化的代價：承諾
function LuaS_424346_ReturnQuestPlot()
	local Obj = TargetID()--注意;這裡是TargetID
	local VocAmount = ReadRoleValue( Obj , EM_RoleValue_VocCount )
	local NewVocAmount = VocAmount+1
	ScriptMessage( Obj, Obj, 0, "[SC_424346_06]", C_SYSTEM )
	AddRoleValue( Obj,EM_RoleValue_VocCount,1 )
	local MessageString = "[SC_202831_1][$SETVAR1="..NewVocAmount.."]"	--字串組合
	ScriptMessage( Obj, Obj, 0 , MessageString , C_YELLOW )-- 你目前可取得職業數增加為 [$VAR1] 個。
	SetFlag(Obj,545160,1)				--第三職業資格
end

function LuaS_118560_ConversationPlot()
	local Obj = OwnerID()
	if	CheckBuff(Obj,620013)==false	then			--任務非進行中
		LoadQuestOption(Obj);
		if	CheckAcceptQuest(Obj,424346)==true	and		--接任務
			CheckFlag(Obj,545157)==false		then	--未完成
			AddSpeakOption(Obj,Obj,"[SC_424346_04]","LuaS_118560_AcceptPlot", 0 );
			AddSpeakOption(Obj,Obj,"[SC_424346_05]","LuaS_118560_RejectPlot", 0 );
		end
	else
		CloseSpeak(Obj);								--任務進行中;關閉對話
	end
end

function LuaS_118560_AcceptPlot()
	local Obj = OwnerID();
	CloseSpeak(Obj);								--關閉對話
	if	CheckAcceptQuest(Obj,424346)==true	then	--任務仍在
		AddBuff(Obj,620013,1,10)
		BeginPlot(Obj,"LuaS_118560_Complete424346",0)
	end
end

function LuaS_118560_RejectPlot()
	local Obj = OwnerID();
	if	CheckAcceptQuest(Obj,424346)==true	then			--任務仍在
		SetSpeakDetail( Obj,"[SC_424346_07]");
		AddSpeakOption(Obj,Obj,"[SC_424346_04]","LuaS_118560_AcceptPlot",0)
	else
		CloseSpeak(Obj)										--任務不在;關閉對話
	end
end


function LuaS_118560_Complete424346()
	local Obj = OwnerID()
	ScriptMessage( Obj, Obj, 1, "[SC_424346_00]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_00]", C_YELLOW )
	sleep(20)
	ScriptMessage( Obj, Obj, 1, "[SC_424346_01]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_01]", C_YELLOW )
	sleep(30)
	ScriptMessage( Obj, Obj, 1, "[SC_424346_02]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_02]", C_YELLOW )
	sleep(30)
	ScriptMessage( Obj, Obj, 1, "[SC_424346_03]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_03]", C_YELLOW )
	sleep(20)
	SetFlag(Obj,545157,1)
	CancelBuff(Obj,620013)
end

--海爾芬副隊長找你
--完成升至17級
function LuaS_424018_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,16000)
end

function LuaS_423867_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,8500)
end

function LuaS_423860_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,3500)
end

function LuaS_423783_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,1100)
end



--擊殺海德拉
--給予狀態，狀態會附加三種法術集合
--每個法術都要限定區域使用和目標
function LuaS_423854_GetQPlot()--接取任務執行
	local Obj = OwnerID()
	local Target = TargetID()
	AddBuff(Target ,509158,0,-1)
end

function LuaS_423854_OverQPlot()--完成任務執行
	local Obj = OwnerID()
	local Target = TargetID()
	CancelBuff(Target ,509158)
end


function LuaS_423854_SpellCheck(ToWho)--法術集合檢查
	local Obj = OwnerID()
	local Target = TargetID()
	local AllowMapID = 364
	if	DW_CheckMap(Obj,AllowMapID)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--警告訊息：你現在還不能使用！
		return false
	end
	local TargetType
	if	ToWho==nil	then
		TargetType = Obj
	else
		TargetType =ToWho
	end
	if	ReadRoleValue(Target,EM_RoleValue_OrgID)~=TargetType	then
		ScriptMessage( Obj, Obj, 1, "[EM_BAHU_3]", 0 )--警告訊息：目標錯誤
		return false
	end
	return true
end

function LuaS_423854_InitialPlot()--海德拉出生劇情
	local Obj = OwnerID()
	SetPlot(Obj,"dead","LuaS_423854_DeadPlot",0)
	local MaxHP = ReadRoleValue(Obj,EM_RoleValue_MaxHP)
	while true	do
		sleep(10)
		local HP = ReadRoleValue(Obj,EM_RoleValue_HP)
		if	(MaxHP - HP) > 10000	then
			AddRoleValue(Obj,EM_RoleValue_HP,20000)
		end
	end
end

function LuaS_423854_DeadPlot()--海德拉死亡劇情
	local Obj = OwnerID()
	local Target = TargetID()
	local Killer = {}
	for i=0,HateListCount(Obj),1 do
		local TempID
		TempID = HateListInfo(Obj,i , EM_HateListInfoType_GItemID)
		if	ReadRoleValue(TempID,EM_RoleValue_IsPlayer)==1	then
			if	CheckAcceptQuest(TempID,423854)==true	then
				SetFlag(TempID,544746,1)
			end
			if	CheckCompleteQuest(TempID,423954)==false	and
				(CheckAcceptQuest(TempID,423854)==true or CheckCompleteQuest(TempID,423854)==true)	then
				GiveBodyItem(TempID,209211,1)
			end
		end
	end
	return true
end

function LuaS_423854_AcceptPlot()
	local Obj = TargetID()
	ScriptMessage( Obj, Obj, 0, "[SC_423954_4]", C_YELLOW )
	ScriptMessage( Obj, Obj, 2, "[SC_423954_4]", 0)
end

--怪物佈置用
--鱷魚步伐
--冰妖抓蛇人施法
function DW_SlowPace_OutFight()
	local Obj = OwnerID()
	if	CheckBuff(Obj,509161)==false	then
		AddBuff(Obj,509161,0,-1)
	end
end


function LuaS_105184_SearchAll()
	local Obj = OwnerID()
	local NearNPC = {}
	NearNPC = SearchRangeNPC ( Obj , 120 )
	for i=0,table.getn(NearNPC),1 do
		local TempValue = NearNPC[i]
		if	ReadRoleValue(TempValue,EM_RoleValue_OrgID)==105178	and --目標正確
			ReadRoleValue(TempValue,EM_RoleValue_IsDead)==0		then--仍存活
			if	HateListCount(TempValue)==0	and--非戰鬥中
				ReadRoleValue(TempValue,EM_RoleValue_SpellMagicID)==0	then--無施法
				BeginPlot(TempValue,"LuaS_105184_CheckEnterFight",0)
			end
		end
	end
end

function LuaS_105184_CheckEnterFight()
	local Obj = OwnerID()--施法者
	local Target = TargetID()--冰妖
	if	CastSpell(Obj,Target,492184)==true	then --注入能量
		SetPlot(Obj,"range","LuaS_105184_RangePlot",100)
		while	HateListCount(Target)==0	and
			HateListCount(Obj)==0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)~=0	do
			sleep(5)
			if	HateListCount(Obj)~=0	then --自己在戰鬥中
				if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==492184	then
					MagicInterrupt(Obj)
				end
				return
			end
			if	HateListCount(Target)~=0	then -- 冰妖在戰鬥中
				local WillAttack = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
				SetAttack(Obj,WillAttack)
			end
		end
		MagicInterrupt(Obj)
		return
	else
		DeBugMSG(0,0,"Cast failed")
	end
end

function LuaS_105184_RangePlot()
	local Obj = OwnerID()
	local Target = TargetID()
	SetPlot(Target,"range","",0)
	MagicInterrupt(Target)
	SetAttack(Target,Obj)
end

--飽餐一頓
--餐卷檢查
function LuaS_423781_0()
	local Obj = OwnerID()
	if	CountBodyItem(Obj,209014)>0	then
		return 1
	end
	return -1
end

--PE獎勵物品
--補充經驗值
--給予證書

function LuaS_209231_ExecutePlot()
	local Obj = OwnerID()
	AddRoleValue(Obj,EM_RoleValue_EXP,DW_Rand(999))
	AddRoleValue(Obj,EM_RoleValue_Money,DW_Rand(399))
	if	DW_CheckBackpage(Obj,1)==true	then
		local Main_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC)
		local Sub_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC_SUB)
		if	Sub_Voc >0	then --若有副職
			local Lv_Progress = DW_EliteSkill_CheckLv(Main_Voc,Sub_Voc)
			local Key_Progress = DW_EliteSkill_CheckProgress(Main_Voc,Sub_Voc)
			if	Key_Progress == 10000	then
DeBugMSG(0,0,"Had Learn All")
				return true
			end
			if	Lv_Progress >= Key_Progress	then --等級已到達門檻
				local Prove_Book = DW_EliteSkill_ItemNum(Key_Progress)
				if	CountBodyItem(Obj,Prove_Book)==0	then --身上還沒有證書
					GiveBodyItem(Obj,Prove_Book,1)
				end
			end
		else
DeBugMSG(0,0,"No Sub")
		end
	end
	return true
end


--擅長之處
--收服冰妖
--情報匯集

function LuaS_424016_CheckPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckDistance(Obj,Target, 100)==false	then													--目標太遠
		ScriptMessage( Obj, Obj, 1, "[SAY_420635_0]", 0 )--警告訊息：警告！你離得太遠了！
		return false
	end
	if	CheckRelation( Obj , Target , EM_CheckRelationType_Attackable  )==false	then					--目標是友善的
		ScriptMessage( Obj, Obj, 1, "[SC_422202_5]", 0 )--警告訊息：目標錯誤！
		return false
	end
	if	CheckFlag(Obj,544973)	then																	--已經使用過
		ScriptMessage( Obj, Obj, 1, "[SC_207464_0]", 0 )--警告訊息：你不能再使用此物品！
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_HP)<=0	then												--目標已死
		ScriptMessage( Obj, Obj, 1, "[SC_493625_2]", 0 )--警告訊息：目標已死亡
		return false
	end
	return true
end
function LuaS_424016_ExecutePlot()
	local Obj = OwnerID()
	local Target = TargetID()
	SysCastSpellLv(Obj,Target,497484,0)
	SetFlag(Obj,544973,1)
end
function LuaS_424020_CheckPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	local MaxHP = ReadRoleValue(Target,EM_RoleValue_MaxHP)
	if	CheckDistance(Obj,Target, 100)==false	then													--目標太遠
		ScriptMessage( Obj, Obj, 1, "[SAY_420635_0]", 0 )--警告訊息：警告！你離得太遠了！
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_OrgID)~=105184	then										--目標錯誤
		ScriptMessage( Obj, Obj, 1, "[SC_422202_5]", 0 )--警告訊息：目標錯誤！
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_HP)>(MaxHP*0.7)	then										--目標的血量還太多
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--警告訊息：你現在還不能使用！
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_HP)<=0	then												--目標已死
		ScriptMessage( Obj, Obj, 1, "[SC_493625_2]", 0 )--警告訊息：目標已死亡
		return false
	end
	return true
end
function LuaS_424020_ExecutePlot()
	local Obj = OwnerID()
	local Target = TargetID()
	sleep(10)
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	GiveBodyItem(Obj,209423,1)
end

function LuaS_424017_RangePlot()
	local Obj = OwnerID()
	SetPlot(Obj,"range","LuaS_424017_RangeExecute",200)
end
function LuaS_424017_RangeExecute()
	local Obj = OwnerID()
	if	CheckFlag(Obj,544974)==false	then
		SetFlag(Obj,544974,1)
	end
end

--快速升級
function DW_LvUpUp(Lv,Me)--( 要提升至多少級,填1是TargetID()自己不用填 )
	local Obj
	if	Me==nil	then
		Obj=OwnerID()
	elseif	Me==1	then
		Obj=TargetID()
	else
		Obj=OwnerID()
	end
	local Temp=ReadRoleValue(Obj,EM_RoleValue_Lv)
	if	Temp<Lv	then
		WriteRoleValue(Obj,EM_RoleValue_Lv,Lv)
		SysCastSpellLv(Obj,Obj,497488,0)
	end
end


--實戰的功效

function LuaS_423909_AcceQuePlot()
	local Obj = OwnerID()			--海爾芬
	local Target = TargetID()		--玩家
	local Pet = DW_CreateObjEX("obj",105624,Target)
	WriteRoleValue(Pet ,EM_RoleValue_IsWalk,0)
	Hide(Pet )
	Show(Pet ,0)
	CallPlot(Pet,"LuaS_423909_ExecuteOnPet",Target)
end

function LuaS_423909_ExecuteOnPet(Target)
	local Obj = OwnerID()
	MoveToFlagEnabled(Obj, false)	--關閉巡邏劇情
	local ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
	while	true	do
		sleep(10)
----------------------------------------
--判斷資格區
----------------------------------------
		if	Target~=nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1 				or	--玩家死了
				LuaS_111256_ZoneID(ReadRoleValue(Target,EM_RoleValue_ZoneID))~=13	or	--不在13
				CheckCompleteQuest(Target,423909)==true					or	--已完成任務
				CheckAcceptQuest(Target,423909)==false					then	--放棄任務
				break
			end
		else
			break
		end
----------------------------------------
--行動判斷區
----------------------------------------
		ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
		local IsInFight = HateListCount(Obj)
		if	ATarget==0 and IsInFight==0	then					--非戰鬥狀態
			if	CheckDistance(Obj,Target, 50)==false	then
				DW_MoveRand(Obj,60,1,Target)
			else
				StopMove(Obj,false)			
			end
		else
			if	HateListCount(Obj)==0	then
				StopMove(Obj,false)
				if	CheckDistance(Obj,Target, 50)==false	then
					DW_ChangePosToObj(Obj,Target)
				end
				SetAttack(Obj,ATarget)
			end
		end
	end
	DeBugMSG(0,0,"Del!!")
	DelObj(Obj)
	return
end



--指引海爾芬
--偷襲海盜首領
---------------------
--初始劇情;約定地點;進行全域宣告
---------------------
function LuaS_423916_DatePointInit()
	local Obj = OwnerID()
	Zone14_423916_DatePoint = Obj
end

function LuaS_423916_ItemCheck()
	local Obj = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	then
		return false
	end
	---------------------
	--指引海爾芬
	---------------------
	if	CheckAcceptQuest(Obj,423916)==true	then
		if	CheckFlag(Obj,545000)==true	then
			return false
		end
		if	DW_CheckDis(Obj,780085,1,100)==false	then
			ScriptMessage( Obj, Obj, 0, "[SC_423916_05]", C_Red )
			return false
		end
		return true
	---------------------
	--偷襲海盜首領
	---------------------
	elseif	CheckAcceptQuest(Obj,423917)==true	then
		if	CheckFlag(Obj,545011)==true	then
			return false
		end
		if	DW_CheckDis(Obj,780898,12,150)==false	then
			ScriptMessage( Obj, Obj, 1, "[SC_102623_17]", 0 )--警告訊息：目標過遠！
			return false
		end
		if	CheckDistance(Obj,Target, 150)==false	then
			ScriptMessage( Obj, Obj, 2, "[SC_102623_17]", C_Red )		--目標過遠
			return false
		end
		if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1	then
			ScriptMessage( Obj, Obj, 2, "[SC_422565_2]", C_Red )		--目標已死
			return false
		end
		if	ReadRoleValue(Target,EM_RoleValue_OrgID)~=105285	then
			ScriptMessage( Obj, Obj, 2, "[SC_422203_4]", C_Red )		--目標錯誤
			return false
		end
		if	HateListCount(Target)==0	then
			ScriptMessage( Obj, Obj, 2, "[SC_423916_10]", C_Red )		--目標需要處於戰鬥狀態下
			return false
		end
		return true
	end
	return false
end

function LuaS_423916_ItemExecute()
	local Obj = OwnerID()
	local Target = TargetID()
	---------------------
	--指引海爾芬
	---------------------
	if	CheckAcceptQuest(Obj,423916)==true	then	
		if	ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1)==99	then
			if	CheckDistance(Obj,ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2), 300)==false	then
				CallPlot(Obj,"DW_ChooseOneFromTwo",Obj,"[SC_QUESTEXECUTESURE_1]","LuaS_423916_WantGroupPlot","LuaS_423916_RejectGroupPlot")
			end
		else
			WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1,99)				--標記任務開始
			local HigherVenLady = DW_CreateObjEX("flag",105361,780085,2)
			WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2,HigherVenLady)	--記錄海爾芬的id
			SetPlot(Obj,"dead","LuaS_423916_LadyDeadPlot",0)
			BeginPlot(HigherVenLady,"LuaS_423916_LadyFollowPlot",0)							--海爾芬的檢查劇情
			Say(HigherVenLady,"[SC_423916_01]")												--海爾芬的抱怨
			ScriptMessage( Obj, Obj, 0, "[SC_423916_02]", 0 )								--提醒
		end
	---------------------
	--偷襲海盜首領
	---------------------
	elseif	CheckAcceptQuest(Obj,423917)==true	then
		if	ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3)==0	then		--核對標記
			local FightLady = DW_CreateObjEX("obj",105361,obj,1,50)							--創出海爾芬
			DeBugMSG(0,0,"FightLady="..FightLady)
			WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,FightLady)		--標記偷襲開始
			SetPlot(FightLady,"dead","LuaS_423916_IfFightLadyDead",0)						--海爾芬的死亡劇情
			CallPlot(FightLady,"LuaS_423916_PlotOfFightLady",Target)						--海爾芬戰鬥劇情
			SysCastSpellLv(Target,FightLady,496266,1)										--至死方休
		end
	else
		return false
	end
end

function LuaS_423916_WantGroupPlot()
	local Obj = OwnerID()
	local Target = ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2)
	if	Target~=nil	then
		if	CheckID(Target)==true	then
			if	ReadRoleValue(Target,EM_RoleValue_IsDead)==0	then
				DW_ChangePosToObj(Obj,Target)
				return
			end
		end
	end
	ScriptMessage( Obj, Obj, 0, "[SC_423916_06]", C_Red )
end

function LuaS_423916_RejectGroupPlot()
	local Obj = OwnerID()
	ScriptMessage( Obj, Obj, 0, "[SC_423916_04]", C_Yellow )
end

function LuaS_423916_LadyFollowPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	AddBuff(Obj,509554,0,240)		--海爾芬的耐心
	MoveToFlagEnabled(Obj,false)	--關閉巡邏劇情
	local ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
	while	true	do
		sleep(10)
----------------------------------------
--判斷資格區
----------------------------------------
		if	Target~=nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1 				or			--玩家死了
				LuaS_111256_ZoneID(ReadRoleValue(Target,EM_RoleValue_ZoneID))~=13	or	--不在13
				CheckAcceptQuest(Target,423916)==false					then			--放棄任務
				break
			end
		else
			break
		end
----------------------------------------
--行動判斷區
----------------------------------------
		ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
		local IsInFight = HateListCount(Obj)
		if	ATarget==0 and IsInFight==0	then								--非戰鬥狀態
			AttachObj( Obj , Target , 0 ,"p_hit_point01","p_hit_point02")	--跟隨
		else
			if	IsInFight==0	then										--自己未進入戰鬥
				DetachObj(Obj)												--分離
				DW_ChangePosToObj(Obj,Target)
				SetAttack(Obj,ATarget)										--幫打
			end
		end
----------------------------------------
--劇情判斷區
----------------------------------------
		if	IsInFight==0	then											--非戰鬥狀態
			if	DW_CheckDis(Obj,780086,1,100)==true		then
				SetModeEx(Obj,EM_SetModeType_Fight,false)
				DetachObj(Obj)
				Say(Obj,"[SC_423916_03]")									--台詞
				DW_MoveToFlag( Obj , 780086,1,0 )
				local Player = SearchRangePlayer ( Obj , 250 )
				for index,value in pairs(Player) do
					if	ReadRoleValue(value,EM_RoleValue_IsPlayer)==1	then
						if	CheckAcceptQuest(value,423916)==true	and	ReadRoleValue(Obj,EM_RoleValue_IsDead)==0	then
							SetFlag(value,545000,1)
						end
					end
				end
				break
			end
			if	CheckBuff(Obj,509554)==false	then						--耐心用完
				ScriptMessage( Obj, 0, 2, "[SC_423916_09]", C_Yellow )
				ScriptMessage( Obj, 0, 0, "[SC_423916_09]", C_Yellow )
				break
			end
		end
	end
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1,0)		--重置標記
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2,0)		--清空id紀錄
	LuaS_423916_ResetPlot()
	DelObj(Obj)
	return
end

function LuaS_423916_ResetPlot()
	local Player = SearchRangePlayer(Zone14_423916_DatePoint,300)
	for index,value in pairs(Player) do
		if	CheckAcceptQuest(value,423916)==true	then
			ScriptMessage( value, value, 0, "[SC_423916_12]", C_Yellow )
			ScriptMessage( value, value, 2, "[SC_423916_12]", C_Yellow )
		end
	end
end

function LuaS_423916_LadyDeadPlot()
	local Obj = OwnerID()
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1,0)		--重置標記
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2,0)		--清空id紀錄
	LuaS_423916_ResetPlot()
end

function LuaS_423916_IfFightLadyDead()
	local Obj = OwnerID()
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,0)		--清空id紀錄
	return true
end

function LuaS_423916_PlotOfFightLady(Target)
	local Obj = OwnerID()		--海爾芬
								--Target是海盜首領
	while	true	do
		for i=1,2,1 do
			sleep(10)
			if	HateListCount(Obj)==0	then											--戰鬥結束
				local Player = SearchRangePlayer ( Obj , 350 )
				for index,value in pairs(Player) do
					if	CheckAcceptQuest(value,423917)==true	and
						ReadRoleValue(value,EM_RoleValue_IsDead)==0	then
						SetFlag(value,545011,1)
					end
				end
				Say(Obj,"[SC_423916_07]")												--很好！真是成功的突擊！既然事情已經解決......
				sleep(30)
				Say(Obj,"[SC_423916_08]")												--那我就先回營地，你儘快跟來，可別迷路啦！
				sleep(10)
				WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,0)		--清空id紀錄
				DelObj(Obj)
			end
		end
		local HateListN = HateListCount(Target)
		for i=0,HateListN-1,1 do
			local TempID = HateListInfo(Target,i ,EM_HateListInfoType_GItemID)
			if	TempID~=nil	then
				if	ReadRoleValue(TempID,EM_RoleValue_IsPlayer)==1	then
					break
				end
			end
			if	i==HateListN-1	then
				WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,0)		--清空id紀錄
				DelObj(Obj)																--沒玩家;退場
			end
		end
		sleep(10)
	end
end