--z27主線=======================================
--=======================================
--426457 島上的三巨頭
--=======================================
--Function Z27_NPC122796SPEAK_00()
--	local PID=OwnerID()
--	local NPC=TargetID()
--	if CheckAcceptQuest( PID, 426436 )==true and
--	CheckFlag( PID, 548341 )==false then
--		LoadquestOption( PID )
--		AddSpeakOption( PID, NPC, "[SC_NPC122796SPEAK_00]", "Z27_NPC122796SPEAK_01", 0 )
--	elseif DW_CheckQuestAccept("or",PID,426457)==true	and
--	CheckFlag(PID, 548344)==false			then
--		SetSpeakDetail(PID, "[SC_Z27Q426457_01]")
--		AddSpeakOption(PID,NPC, "[SC_Z27Q426457_02]", "LuaPG_426457_TalktoNicholas(2)", 0 )
--	else	LoadquestOption( PID )
--	end
--	LoadquestOption( PID )
--End

function LuaPG_426457_TalktoNicholas(Num)
	local Player = OwnerID()
	local NPC = TargetID()
	if Num == 1		then
		SetSpeakDetail(Player, "[SC_Z27Q426457_01]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426457_02]", "LuaPG_426457_TalktoNicholas(2)", 0 )
	elseif Num == 2	then
		SetSpeakDetail(Player, "[SC_Z27Q426457_03]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426457_04]", "LuaPG_426457_TalktoNicholas(3)", 0 )
	elseif Num == 3	then
		SetSpeakDetail(Player, "[SC_Z27Q426457_05]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426457_06]", "LuaPG_426457_TalktoNicholas(4)", 0 )
	elseif Num == 4	then
		SetSpeakDetail(Player, "[SC_Z27Q426457_07]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426457_08]", "LuaPG_426457_TalktoNicholas(5)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z27Q426457_09]", "LuaPG_426457_TalktoNicholas(1)", 0 )
	elseif Num == 5	then
		SetFlag(Player, 548344, 1)
		SetSpeakDetail(Player, "[SC_Z27Q426457_10]")
	end
end


--=======================================
--426458 飲食生活
--=======================================
function LuaPG_426457_GiveSomething()
	local Player = OwnerID()
	local NPC = TargetID()	

	if DW_CheckQuestAccept("or",Player,426458)==true		and
	CheckFlag(Player, 548345)==false				and
	CountBodyItem(Player, 242944)>=10				then
		LoadQuestOption(Player)
		AddSpeakOption(Player,NPC, "[SC_Z27Q426458_01]", "LuaPG_426457_GiveSomething_02", 0 )
	elseif DW_CheckQuestAccept("or",Player,426460)==true	and
	CountBodyItem(Player, 242947)==0				then
		if CountBodyItem(Player, 242946)==0			then
			SetSpeakDetail(Player, "[SC_Z27Q426460_01]")
			GiveBodyItem(Player, 242946, 1)
		else
			LoadQuestOption(Player)
		end
	else
		LoadQuestOption(Player)	
	end
end

function LuaPG_426457_GiveSomething_02()
	local Player = OwnerID()
	local Num = CountBodyItem(Player, 242944)
	CloseSpeak(Player)
	DelBodyItem(Player, 242944, Num)
	SetFlag(Player, 548345, 1)
end


--=======================================
--426459 岸邊的醫藥箱
--=======================================
function LuaPG_426459_GiveSomething()
	local Player = OwnerID()
	local NPC = TargetID()	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426459)==true		and
	CheckFlag(Player, 548346)==false				and
	CountBodyItem(Player, 242945)>=5				then
		AddSpeakOption(Player,NPC, "[SC_Z27Q426459_01]", "LuaPG_426459_GiveSomething_02", 0 )
	end
end

function LuaPG_426459_GiveSomething_02()
	local Player = OwnerID()
	local Num = CountBodyItem(Player, 242945)
	CloseSpeak(Player)
	DelBodyItem(Player, 242945, Num)
	SetFlag(Player, 548346, 1)
end

--=======================================
--426460 肉食文化
--=======================================
function LuaPG_426460_Touch()		--火堆的碰觸劇情
	local Fire = OwnerID()
	SetCursorType( Fire , 23)		----改變點擊的圖示
	SetPlot( Fire, "touch", "LuaPG_426460_Touch_02", 35 )
end

function LuaPG_426460_Touch_02()
	local Player = OwnerID()
	local Fire = TargetID()
	local Num01=ReadRoleValue(Fire,EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)						--取消騎乘狀態
	if DW_CheckQuestAccept("or",Player,426460)==true	and		--如果條件符合
	CountBodyItem(Player, 242946)>0			and
	CountBodyItem(Player, 242947)==0			then
		if	Num01==0					then
								----判斷參數
			WriteRoleValue(Fire , EM_RoleValue_Register1 , 999)
								----將計數functuon鎖起來									
			ScriptMessage( Player , Player, 1,"[SC_Z26Q426168_06]", 0 )
								----利用移動控制火候
			CallPlot(Fire,"LuaPG_426460_Count",Fire,Player)

			if 	BeginCastBarEvent( Player, Fire ,"[SC_Z27Q426460_05]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_426460_Touch_03" ) ~= 1 then
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

function LuaPG_426460_Touch_03(Player, CheckStatus)
	local Player = OwnerID()
	local Fire = TargetID()
	EndCastBar( Player, CheckStatus)
	WriteRoleValue(Fire , EM_RoleValue_Register1 , 0)
	Sleep(10)
	local Num02=ReadRoleValue(Fire,EM_RoleValue_Register2)
		if( CheckStatus ~= 0 ) then
			if Num02 <= 40 then
				ScriptMessage( Player, Player, 1,"[SC_Z27Q426460_02]", C_SYSTEM  )
			elseif Num02 <=60 then
				ScriptMessage( Player, Player, 1,"[SC_Z27Q426460_03]", C_SYSTEM  )
				GiveBodyItem(Player,242947,1)
			else
				ScriptMessage( Player, Player, 1,"[SC_Z27Q426460_04]", C_SYSTEM )
			end
		else
			EndCastBar( Player, CheckStatus)
		end
	WriteRoleValue(Fire,EM_RoleValue_Register2,0)
end

function LuaPG_426460_Count(Fire, Player)
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

--=======================================
--426461 千洞磐岩的線索？
--=======================================
--Function Z27_NPC122795SPEAK_00()
--	local PID=OwnerID()
--	local NPC=TargetID()
--	if CheckAcceptQuest( PID, 426435 )==true and
--	CheckFlag( PID, 548340 )==false then
--		LoadquestOption( PID )
--		AddSpeakOption( PID, NPC, "[SC_NPC122795SPEAK_00]", "Z27_NPC122795SPEAK_01", 0 )
--	elseif DW_CheckQuestAccept("or",PID,426461)==true	and
--	CheckFlag(PID, 548347)==false				then
--		SetSpeakDetail(PID, "[SC_Z27Q426461_01]")
--		SetFlag(PID, 548347, 1)			
--	else	LoadquestOption( PID )
--	end
--	LoadquestOption( PID )
--End

--接下後演戲
--=======================================
--CliBuff:624532
--WalkFlag:781337 no.1~2
function LuaPG_426461_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624532
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426461_Accept_02" , NPC, Player, CliBuff)	----接演戲function
	end
end

function LuaPG_426461_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local New_NPC =  CreateObjByFlag( 122857, WalkFlag, 1, 1)			----生成演戲
	ks_ActSetMode( New_NPC )
	WriteRoleValue( New_NPC , EM_RoleValue_IsWalk , 0 )
	Sleep(10)
	DW_MoveToFlag( New_NPC , WalkFlag, 2, 0, 1)  
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426462  有所隱瞞
---------------------------------------------------------------------------
function LuaPG_426462_Cancel_Buff()		--如果取消任務，buff就消失
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426462)==true	then
		return true
	else
		CancelBuff(Player,624727)
	end
end

function LuaPG_426462_Give_Buff()		--接任務後給個計算時間的buff
	local Player = TargetID()	
	AddBuff( Player, 624727, 1, 300)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
	ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )		----(限時任務，已開始倒數計時)
end

function LuaPG_426462_Tell()			--勝負判斷
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426462)==true		then
		if CountBodyItem(Player, 242948)>=10		and
		CheckFlag(Player, 548348)==false			then
			if CheckBuff(Player, 624727)==true		then
				local Num = CountBodyItem(Player, 242948)
				SetFlag(Player, 548348, 1)
				CancelBuff(Player, 624727)
				DelBodyItem(Player, 242948, Num)
			elseif  CheckBuff(Player, 624727)==false	then
				ScriptMessage( Player, Player, 1,"[SC_425248_LOSE]", 0 )
				ScriptMessage( Player, Player, 0,"[SC_425248_LOSE]", 0 )
			end	
		end
	end
end

--結束後演戲
--=======================================
--CliBuff:623282
--WalkFlag:781337 no.3~4
function LuaPG_426462_Compete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 623282
	CallPlot(Player, "LuaPG_426462_Compete_03" , NPC, Player)
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426462_Compete_02" , NPC, Player, CliBuff)	----接演戲function
	end
end

function LuaPG_426462_Compete_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	Sleep(20)
	local New_NPC =  CreateObjByFlag( 122858, WalkFlag, 3, 1)			----生成演戲
	ks_ActSetMode( New_NPC )
	Sleep(10)
	PlayMotion(New_NPC, ruFUSION_ACTORSTATE_EMOTE_WAVE)
	Yell(New_NPC,"[SC_Z27Q426462_03]",3)
	Sleep(25)
	DW_MoveToFlag( New_NPC , WalkFlag, 4, 0, 1)
	Yell(New_NPC,"[SC_Z27Q426462_04]",3)
	Sleep(25)
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end

function LuaPG_426462_Compete_03(NPC, Player)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_Z27Q426462_02]", C_SYSTEM  )
	ScriptMessage( Player, Player, 0,"[SC_Z27Q426462_02]", C_SYSTEM  )
end


--=======================================
--426463 初次交易
--=======================================
function LuaPG_426463_Rockwood()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426463)==true		and
	CheckFlag(Player, 548357)==false				then
		AddSpeakOption(Player,NPC, "[SC_Z27Q426463_01]", "LuaPG_426463_Rockwood_02(1)", 0 )
	end
end

function LuaPG_426463_Rockwood_02(Num)
	local Player = OwnerID()
	local NPC = TargetID()
	if Num==1		then
		SetSpeakDetail(Player, "[SC_Z27Q426463_02]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426463_03]", "LuaPG_426463_Rockwood_02(2)", 0 )		
	elseif Num==2	then
		SetSpeakDetail(Player, "[SC_Z27Q426463_04]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426463_05]", "LuaPG_426463_Rockwood_02(3)", 0 )
	elseif Num==3	then
		SetSpeakDetail(Player, "[SC_Z27Q426463_06]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426463_07]", "LuaPG_426463_Rockwood_02(4)", 0 )
	elseif Num==4	then	
		SetSpeakDetail(Player, "[SC_Z27Q426463_08]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426463_09]", "LuaPG_426463_Rockwood_02(5)", 0 )
	elseif Num==5	then
		CloseSpeak(Player)
		SetFlag(Player, 548357, 1)
	end
end


--=======================================
--426464 引薦標準
--=======================================
function LuaPG_426464_Complete()
	local Player = TargetID()
	local Nicholas = OwnerID()
	local Will = LuaFunc_SearchNPCbyOrgID( Nicholas, 122852, 180, 0 )
	Tell(Player, Will, "[SC_Z27Q426464_01]")
end