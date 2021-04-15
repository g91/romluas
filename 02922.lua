--z26支線、PE、委託=======================================
--=======================================
--426168 好廚藝需要技巧
--=======================================
function LuaPG_426168_Touch()		--火堆的碰觸劇情
	local Fire = OwnerID()
	SetCursorType( Fire , 23)							----改變點擊的圖示
	SetPlot( Fire, "touch", "LuaPG_426168_Touch_02", 10 )
end

function LuaPG_426168_Touch_02()
	local Player = OwnerID()
	local Fire = TargetID()
	local Num01=ReadRoleValue(Fire,EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)						----取消騎乘狀態
	if DW_CheckQuestAccept("or",Player,426168,426338,426333)==true	and		--如果條件符合
	CountBodyItem(Player, 242576)>0					and
	CountBodyItem(Player, 242575)<5					then
		if	Num01==0					then
								----判斷參數
			WriteRoleValue(Fire , EM_RoleValue_Register1 , 999)
								----將計數functuon鎖起來									
			ScriptMessage( Player , Player, 1,"[SC_Z26Q426168_06]", 0 )
								----利用移動控制火候
			CallPlot(Fire,"LuaPG_426168_Count",Fire,Player)

			if 	BeginCastBarEvent( Player, Fire ,"[SC_Z26Q426168_05]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_426168_Touch_03" ) ~= 1 then
										----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player, Player, 1,"[SC_Z26Q426168_04]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z26Q426168_04]", "0xffbf0b2b" )			
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
	end
end

function LuaPG_426168_Touch_03(Player, CheckStatus)
	local Player = OwnerID()
	local Fire = TargetID()
	EndCastBar( Player, CheckStatus)
	WriteRoleValue(Fire , EM_RoleValue_Register1 , 0)
	Sleep(10)
	local Num02=ReadRoleValue(Fire,EM_RoleValue_Register2)
		if( CheckStatus ~= 0 ) then
			if Num02 <= 40 then
				ScriptMessage( Player, Player, 1,"[SC_Z26Q426168_03]", 0 )
				DelBodyItem(Player, 242576,1)
			elseif Num02 <=60 then
				ScriptMessage( Player, Player, 1,"[SC_Z26Q426168_02]", 0 )
				DelBodyItem(Player, 242576,1)
				GiveBodyItem(Player,242575,1)
			else
				ScriptMessage( Player, Player, 1,"[SC_Z26Q426168_01]", 0 )
				DelBodyItem(Player, 242576,1)
			end
		else
			EndCastBar( Player, CheckStatus)
		end
	WriteRoleValue(Fire,EM_RoleValue_Register2,0)
end

function LuaPG_426168_Count(Fire, Player)
	for i=1,80,1 do
		local Num01=ReadRoleValue(Fire,EM_RoleValue_Register1)
		if Num01==0 then
			return
		end
		Sleep(1)
		local y=i%10					----每10（1秒）一次判斷，共8次						
			if y==0 then
				WriteRoleValue(Fire,EM_RoleValue_Register2,i)
			end
		--Say(NPC,y..","..i)
	end
	return
end

function LuaPG_426168_Retake()		--重新拿蛋
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426168,426338,426333)==true	and
	CountBodyItem(Player, 242576)==0			and
	CountBodyItem(Player, 242575)<5			then
		AddSpeakOption(Player,NPC, "[SC_Z24Q426168_01]", "LuaPG_426168_Retake_02", 0 )
	elseif DW_CheckQuestAccept("or",Player,426169)==true	and
	CountBodyItem(Player, 242585)==0			and
	(CheckFlag(Player, 548042)==false or 
	CheckFlag(Player, 548043)==false or
	 CheckFlag(Player, 548044)==false or
	CheckFlag(Player, 548045)==false)			then
		AddSpeakOption(Player,NPC, "[SC_Z24Q426169_AN_1]", "LuaPG_426169_Retake", 0 )
	end
end

function LuaPG_426168_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	local Num = 5-CountBodyItem(Player, 242575)
	for i = 1, Num do
		GiveBodyItem(Player, 242576, 1)
	end
end



--=======================================
--426169 用餐愉快
--=======================================
function LuaPG_426169_GiveEgg()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local FlagNum = {}
	FlagNum[122196] = 548042
	FlagNum[122171] = 548043
	FlagNum[122172] = 548044
	FlagNum[122173] = 548045
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426169)==true	and
	CheckFlag(Player, FlagNum[NPCOrgID])==false	and
	CountBodyItem(Player, 242585)>0			then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426169_01]", "LuaPG_426169_GiveEgg_02", 0 )
	end
end

function LuaPG_426169_GiveEgg_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local SayWhat = {}
	SayWhat[122196] = {"[SC_Z26Q426169_02]",548042}
	SayWhat[122171] = {"[SC_Z26Q426169_03]",548043}
	SayWhat[122172] = {"[SC_Z26Q426169_04]",548044}
	SayWhat[122173] = {"[SC_Z26Q426169_05]",548045}
	
	DelBodyItem(Player, 242585,1)
	SetSpeakDetail(Player, SayWhat[NPCOrgID][1])
	SetFlag(Player, SayWhat[NPCOrgID][2], 1)
end

function LuaPG_426169_Retake()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_Z24Q426169_AN_2]")
	GiveBodyItem(Player, 242585, 4)
end 



--=======================================
--426255 秘密書卷
--=======================================
function LuaPG_426255_ClickBefore()
	local Player = OwnerID()
	local Floor = TargetID()
	if CountBodyItem(Player, 242653)<5	then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z26Q426255_01]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z26Q426255_01]", 0 )	
		return false
	end
end

function LuaPG_426255_ClickAfter()
	local Player = OwnerID()
	local Floor = TargetID()
	local Num = DW_Rand(10)
	PlayMotionEX(Floor, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP)	--地板破裂動作
	CallPlot(Floor, "LuaPG_426255_Reset", Floor)							--觸發劇情
	if Num>=9	then
--		DebugMsg(0, 0,">4")
		GiveBodyItem(Player, 242653,1)
	else
--		DebugMsg(0, 0,"<4")
		ScriptMessage( Player, Player, 1,"[SC_Z26Q426255_02]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z26Q426255_02]", 0 )		
	end
	return 1
end


function LuaPG_426255_Reset(Floor)
--	PlayMotionEX(Floor, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP)	--地板破裂動作
	Sleep(80)
	Hide(Floor)
	Sleep(150)
	KillID(Floor,Floor)
end

function LuaPG_426255_Reset_02()
	PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_NORMAL, ruFUSION_ACTORSTATE_NORMAL)
end

--=======================================
--426258 魔法彈丸
--=======================================
function LuaPG_426258_Cancel()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426258)==false	then
		CancelBuff(Player, 624353)
	end
end

function LuaPG_242656_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID)
	local BuffCheck=Lua_BuffPosSearch( Player ,624353)			--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--確認BUFF層數
	local Dis = GetDistance(Player, NPC)
--	Say(Player, "Check")
	if DW_CheckQuestAccept("or",Player,426258)==false	or		--判斷任務
	CheckFlag(Player, 548093)==true			or		--判斷旗標
	BuffLv>=5						then		--判斷buff層數
		ScriptMessage( Player, Player, 1, "[SC_Z24Q425567_01]","0xffbf0b2b" )
		ScriptMessage( Player, Player, 0, "[SC_Z24Q425567_01]","0xffbf0b2b" )		
		return false
	end
	if Dis>80	then							--判斷怪物編號
		ScriptMessage( Player, Player, 1, "[SC_204592_2]","0xffbf0b2b" )
		ScriptMessage( Player, Player, 0, "[SC_204592_2]","0xffbf0b2b" )
		return false
	end
	if NPCOrgID ~= 107725	then						--判斷怪物編號
		ScriptMessage( Player, Player, 1, "[SC_424142_1]","0xffbf0b2b" )
		ScriptMessage( Player, Player, 0, "[SC_424142_1]","0xffbf0b2b" )
		return false
	end
	DW_CancelTypeBuff(68,Player)						--取消騎乘狀態
	return true
end

function LuaPG_242656_Use()
	local Player = OwnerID()
	local NPC = TargetID()
--	local BuffCheck=Lua_BuffPosSearch( Player ,624353)			--找玩家身上判斷BUFF的位子
	local BuffLv =  FN_CountBuffLevel( Player , 624353 ) 			--檢查玩家身上BUFF
--	Say(Player, "Use")
--	Say(Player, "BuffLv="..BuffLv )
	AddBuff(Player, 624353, 0, -1)
	DelBodyItem(Player, 242656, 1)
	if BuffLv==3	then
		SetFlag(Player, 548093, 1)
	end
end

function LuaPG_426258_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426258)==true	and
	CountBodyItem(Player, 242656)==0			and
	CheckFlag(Player, 548093)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426258_01]", "LuaPG_426258_Retake_02", 0 )
	end
end

function LuaPG_426258_Retake_02()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 242656, 5)
end


--=======================================
--426259 等待支援
--=======================================
function LuaPG_426259_GiveBox()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426259,426342,426349)==true	and
	CountBodyItem(Player, 242657)>0					then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426259_01]", "LuaPG_426259_GiveBox_02", 0 )
	end
end

function LuaPG_426259_GiveBox_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local SayWhat = {}
	SayWhat[122318] = {"[SC_Z26Q426259_02]",548094}
	SayWhat[122325] = {"[SC_Z26Q426259_03]",548095}

	DelBodyItem(Player, 242657,1)
	SetSpeakDetail(Player, SayWhat[NPCOrgID][1])
	SetFlag(Player, SayWhat[NPCOrgID][2], 1)
end

function LuaPG_426259_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426259,426342,426349)==true		and
	(CheckFlag(Player, 548094)==false or CheckFlag(Player, 548095)==false)	and
	CountBodyItem(Player, 242657)==0					then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426259_04]", "LuaPG_426259_Retake_02", 0 )
	end
end

function LuaPG_426259_Retake_02()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 242657, 2)
end


--=======================================
--426263 膽小鬼的偽裝偵查
--=======================================
function LuaPG_242660_Check()
	local Player = OwnerID()

	if DW_CheckMap(Player,652)==false		then	--王城修道院
		CancelBuff(Player, 624375)
		ScriptMessage( Player , Player , 1 , "[SC_ITEMRULE_01]" , 0 ) 		----你無法在此區域使用這項物品。
		ScriptMessage( Player , Player , 0 , "[SC_ITEMRULE_01]" , 0 )
		return false
	end
	
	if CheckBuff( Player , 620665 ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426263_CHECK]" , 0 ) 		----你已經換上[242660]了
		ScriptMessage( Player , Player , 0 , "[SC_Z26Q426263_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_423191_D_3]" , 0 ) 	----你無法在騎乘時換裝
			ScriptMessage( Player , Player , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_242660_Use()
	local Player = OwnerID()		--偽裝

	AddBuff(Player ,624375,0,-1)
	ScriptMessage( Player , Player , 1 , "[SC_Z26Q426263_WEAR]" , 0 ) 		----換裝
	ScriptMessage( Player , Player , 0 , "[SC_Z26Q426263_WEAR]" , 0 )
end

function LuaPG_426263_ClickBefore()		--點擊文件檢查
	local Player = OwnerID()
	if CheckBuff(Player, 624375)== false	then
		ScriptMessage( Player, Player, 1,"[SC_Z26Q426263_02]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z26Q426263_02]", 0 )
		return false		
	end
	if CheckBuff(Player,624375)==true	and
	CheckFlag(Player, 548111)==false		then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z26Q426255_01]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z26Q426255_01]", 0 )	
		return false
	end
end

function LuaPG_426263_ClickAfter()
	SetFlag(OwnerID(), 548111, 1)
	return 1
end

function LuaPG_426263_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426263,426344,426351)==true		and
	CheckFlag(Player, 548111)==false						and
	CountBodyItem(Player, 242660)==0						then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426263_01]", "LuaPG_426263_Retake_02", 0 )
	end
end

function LuaPG_426263_Retake_02()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 242660, 1)
end

function LuaPG_426263_DeleteBuff()
	local Player = OwnerID()
	if DW_CheckMap(Player,652)==false		then	--王城修道院
		CancelBuff(Player, 624375)
	end
end

--=======================================
--426265 監視的眼睛
--=======================================
function LuaPG_242659_Put_Check()		--使用偵查器的檢查
	local Player = OwnerID()
	local Place = SearchRangeNPC(Player, 15)
	local Num = table.getn(Place)
	local BuffCheck=Lua_BuffPosSearch( Player ,624437)					--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--確認BUFF層數	
	local Got = 0
	local PutPlace

	if DW_CheckQuestAccept("or",Player,426265,426345,426352)==true		and		--有接任務
	ReadRoleValue(Player, EM_RoleValue_Register3)<8				and
	Place~=nil									then
		for i =0,Num do
			PutPlace = ReadRoleValue(Place[i], EM_RoleValue_OrgID)
				if PutPlace ==122331					then	--附近有指定地點物件
					Got=Got+1
					break
				else
					ScriptMessage( Player, Player, 1,"[SC_Z26Q426265_02]", 0 )	
					ScriptMessage( Player, Player, 0,"[SC_Z26Q426265_02]", 0 )					
					return false
				end
		end
	end
	
	if Got==1	then
		DW_CancelTypeBuff(68,Player)							----取消騎乘狀態
		return true
	end
end

function LuaPG_242659_Put()			--使用後產生的效果
	local Player = OwnerID()
--	local Center = LuaFunc_SearchNPCbyOrgID( Player, 122335, 70, 0 )
	local Place = LuaFunc_SearchNPCbyOrgID( Player, 122331, 70, 0 )
	local Num = ReadRoleValue(Player, EM_RoleValue_Register3)

	BeginPlot(Player,"LuaPG_426265_Act",10)						--玩家放置動作
	Num = Num+1
	WriteRoleValue(Player, EM_RoleValue_Register3, Num)
	AddBuff(Player, 624437, 0, -1)								--堆疊計數用BUFF
	DW_QietKillOne(0,107821)								--靜靜的殺死怪，前者殺死後者，0代表為玩家
	BeginPlot(Place, "luaPG_426265_HideandShow", 0 )					-- 擺放記號HIDE
--	UseItemDestroy()
--	DelBodyItem(Player, 242659, 1)
end

function luaPG_426265_HideandShow()	-- HIDE之後經過一定秒數出現
	local Place = OwnerID()  
	Sleep(15)
	Hide(Place)
	sleep(200)
	Show( Place, 0) 
end

function LuaPG_426265_Act()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)
end

function LuaPG_426265_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	local Num = ReadRoleValue(Player, EM_RoleValue_Register3)
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426265,426345,426352)==true		and
	Num<10									and
	CountBodyItem(Player, 242659)==0						then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426265_01]", "LuaPG_426265_Retake_02", 0 )
	end
end

function LuaPG_426265_Retake_02()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 242659, 10)
end


--=======================================
--426262 奇異水晶
--=======================================
function LuaPG_426262_CreateVehicle() 		--掛在NPC身上產生載具劇情
	local Npc = OwnerID()
	local RoomID = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Vehicle = {}
	Lua_jiyi_2013Fire_CancelVehicle() --先刪除場上所有載具再生成新的載具
	for j = 0 , 2 do
		Vehicle[j] = CreateObjByFlag( 107560 , 781258 , j , 1 ) --產生載具
		WriteRoleValue( Vehicle[j] , EM_RoleValue_PID , j ) --載具寫入自己的PID值
		SetModeEx( Vehicle[j] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( Vehicle[j] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( Vehicle[j] , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( Vehicle[j] , EM_SetModeType_Mark , true )--標記
		SetModeEx( Vehicle[j] , EM_SetModeType_Move , true )--移動
		SetModeEx( Vehicle[j] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Vehicle[j] , EM_SetModeType_HideName , true )--名稱
		SetModeEx( Vehicle[j] , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( Vehicle[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Vehicle[j] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( Vehicle[j] , EM_SetModeType_Show , true )--顯示
		AddToPartition( Vehicle[j] , RoomID )
	end
end

function LuaPG_426262_CancelVehicle()  		--刪除載具劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 107560 }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID )
					end
				end
			end
		end
	end
end


--=======================================
--426221 救命之恩
--=======================================
function LuaPG_242671_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if (CheckCompleteQuest( Player, 426221) == true		and
	CheckCompleteQuest( Player, 426223) == false)		and
	CountBodyItem(Player, 242671)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426221_AN_1]", "LuaPG_242671_Retake_02", 0 )
	end
end


function LuaPG_242671_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242671,1)
end