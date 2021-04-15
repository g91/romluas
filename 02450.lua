function lua_weave_kors_begain() --掛標至AND時間迴圈
	BeginPlot(OwnerID(),"LuaN_miyon_action02",0)
	BeginPlot(OwnerID(),"lua_weave_kors_NPC",0)
end

function lua_weave_kors_NPC()--掛時間開放用
	while true do
	local min = GetSystime(2) --抓系統時間(分鐘)
	local hr = GetSystime(1)-- 抓小時
		if  hr == 13 or   hr == 16  or hr == 19 or  hr == 22  then
			if min < 59 then --0分時執行出現劇情
			local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p == 0 then	
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				end				
			end
			if min == 59 then --刪除劇情
				local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p ~= 0 then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				end
			end
		end
	Sleep(600)
	end
end


function lua_weave_kors_NRmove()--掛給其他NPC亂走用
SetRandMove(OwnerID(),150,150,20) 
end		

function lua_weave_kors_Nother()--遊蕩NPC對話
local name = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_08][$SETVAR1=["..name.."]]")
end

function lua_weave_kors_00() --活動主持NPC初始劇情
DW_CancelTypeBuff( 68,  OwnerID() )-- 消除騎乘狀態
local key1 = CheckFlag(OwnerID(),545467)--接任務與否判斷
local key2 = CheckFlag(OwnerID(),545468)--任務完成判斷
local key3 = CheckFlag(OwnerID(),545469)--領獎完成
local key4 = CheckFlag(OwnerID(),545470)--被推銷成功KEY
local key5 = CheckFlag(OwnerID(),545471)--推銷獎勵已領
local p = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if p ~= 0 then --開放時間
		if key1 == FALSE and key3 == FALSE then --當日未玩承接
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_00]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_01]","lua_weave_kors_01",0)
				if key4 == TRUE and key5 == FALSE then --領被推銷獎勵
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_01]","lua_weave_kors_det",0) --綵織節的由來
		elseif key1 == TRUE and key2 == FALSE then--活動進行中
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_05]")
				if key4 == TRUE and key5 == FALSE then--領被推銷獎勵
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end	
		elseif key2 == TRUE and key3 == FALSE then--完成推銷回報
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_05]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_06]","lua_weave_kors_AW",0)
				if key4 == TRUE and key5 == FALSE then--領被推銷獎勵
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end	
		elseif key2 == TRUE and key3 == TRUE then--當日已完成過
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_15]")
				if key4 == TRUE and key5 == FALSE then--領被推銷獎勵
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end			
		end
	elseif p == 0 then --非開放時間
		SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_07]")
			if key4 == TRUE and key5 == FALSE then --領被推銷獎勵
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
			end
			if key2 == TRUE and key3 == FALSE then--完成推銷回報
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_06]"," lua_weave_kors_AW",0)
			end
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_01]","lua_weave_kors_det",0) --綵織節的由來
	end
end

function lua_weave_kors_det()	--綵織節節慶背景。
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_weave_kors_00",0)
end

function lua_weave_kors_01() --活動說明暨承接
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_03]","lua_weave_kors_star",0)
end

function lua_weave_kors_star() -- 活動開始給予物品
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_04]")

	local itemR = Rand(99)
		if itemR <= 25 then 
			GiveBodyItem(OwnerID(),240516,1)
		elseif itemR > 25 and itemR <=50 then
			GiveBodyItem(OwnerID(),240517,1)
		elseif itemR >50 and itemR <= 75 then
			GiveBodyItem(OwnerID(),240517,1)
		elseif itemR >75 then
			GiveBodyItem(OwnerID(),240517,1)
		end
	SetFlag(OwnerID(),545467,1)
end

function lua_weave_kors_CH()
local bufT = {620604,620605,620606,620607}
local T = TargetID()
local U = OwnerID()
	if T ~= U then
		for i = 1 ,4 do
			if CheckBuff(TargetID(),bufT[i]) == TRUE then
				ScriptMessage(OwnerID(),OwnerID(),1,"[SC_0908SEANSON_MAG14]",C_SYSTEM)
				return FALSE
			end
		end
	return TRUE
	elseIF T == U then
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_COLORWEAVE_KORS_21]",C_SYSTEM)
	return FALSE
	end
end
function lua_weave_kors_itemU() --USEITEM
local ItemT = {240516,240517,240518,240519}
local Bbuf =FN_CountBuffLevel(TargetID(),620608) --判斷說服成功否
	if Bbuf >= 8 then--說服成功
	local t = Rand(99)
	local sex = ReadRoleValue(TargetID(),EM_RoleValue_SEX)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_COLORWEAVE_KORS_11]",C_SYSTEM)--告訴自己說服成功
		CancelBuff(TargetID(),620608)
		SetFlag(TargetID(),545470,1)--給予被推銷成功旗標
		if sex == 0 then	--男性
			if t < 50 then
			AddBuff(TargetID(),620604,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)--告訴對方被說服變身了
			elseif t >=50 then
			AddBuff(TargetID(),620605,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)
			end
		elseif sex == 1 then --女性
			if t < 50 then
			AddBuff(TargetID(),620606,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)
			elseif t >=50 then
			AddBuff(TargetID(),620607,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)
			end
		end
	local Sbuf = FN_CountBuffLevel(OwnerID(),620610) --玩家成功次數給予
		CancelBuff(OwnerID(),620610)
		AddBuff(OwnerID(),620610,Sbuf+1,-1)
	elseif Bbuf < 8 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_COLORWEAVE_KORS_10]",C_SYSTEM)
	end
	BeginPlot(OwnerID(),"lua_weave_kors_AWCH",0)
end

function lua_weave_kors_AWCH()
local count = FN_CountBuffLevel(OwnerID(),620610) --個人成功次數判斷
	if count >2 then
	SetFlag(OwnerID(),545468,1)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_COLORWEAVE_KORS_12]",C_SYSTEM)
	end
end	

function lua_weave_kors_AW() --領獎專用
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_09]")
local ItemT = {240516,240517,240518,240519}
	for i = 1,4 do
		local it = CountBodyItem(OwnerID(),ItemT[i])
		if it ~= 0 then
			DelBodyItem(OwnerID(),ItemT[i],it)
		end
	end
	CancelBuff(OwnerID(),620610)
	GiveBodyItem(OwnerID(),725650,1)
	SetFlag(OwnerID(),545469,1)
end

function lua_weave_kors_se() --被推銷獎勵
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_13]")
	GiveBodyItem(OwnerID(),725650,1)
	SetFlag(OwnerID(),545471,1)
end

function lua_weave_kors_giftUse(gift)--獎勵玩具的SCRIPT
local bufT = {620604,620605,620606,620607}
local sex = ReadRoleValue(TargetID(),EM_RoleValue_SEX)
	local Name = GetName( OwnerID())
	local Name2 = GetName( TargetID())
			ScriptMessage( OwnerID(), OwnerID(),  0,  "[SC_COLORWEAVE_KORS_18][$SETVAR1="..Name2.."]", 0 ) --你對[$VAR1]施展了[204214]！[VAR1]獲得了[204214]效果！
			ScriptMessage( OwnerID(), TargetID(), 0,  "[SC_COLORWEAVE_KORS_19][$SETVAR2="..Name.."]", 0 ) --[$VAR1]對你施展了[204214]！你獲得了[204214]效果！
			local H = Rand(99)+1
				if H <=95 then	
					if sex == 0 then	--男性
						local RR = Rand(50)
						if RR < 24 then
						AddBuff(TargetID(),620604,1,600)
						elseif RR >=24 then
						AddBuff(TargetID(),620605,1,600)
						end
					elseif sex == 1 then --女性
						local RR = Rand(50)
						if RR < 24 then
						AddBuff(TargetID(),620606,1,600)
						elseif RR >=24 then
						AddBuff(TargetID(),620607,1,600)
						end
					end
				elseif H > 95 then
					if sex == 0 then
						AddBuff(TargetID(),620632,1,600)	
					elseif sex == 1 then
						AddBuff(TargetID(),620631,1,600)
					end	
				end
end
		
function lua_weave_kors_re() --redo指令
local ItemT = {240516,240517,240518,240519}
local bufT =  {498173,498174,498175,498176}
	for I = 1,4 do
		local CNT = CountBodyItem(OwnerID(),ItemT[I])
		if CNT ~= 0 then
		DelBodyItem(OwnerID(),ItemT[I],cnt)
		end
		CancelBuff_NoEvent(OwnerID(),bufT[I])
	end
local keyT = {545467,545468,545469,545470,545471}
	for K = 1,5 do
		SetFlag(OwnerID(),keyT[K],0)
	end
end

function lua_weave_kors_TEST()
local npcm=SetSearchRangeInfo( OwnerID() , 250 )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 118982 then
				WriteRoleValue(npcde,EM_RoleValue_PID,1)
				end
		end
end

function lua_weave_kors_TESTEND()
local npcm=SetSearchRangeInfo( OwnerID() , 250 )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 118982 then
				WriteRoleValue(npcde,EM_RoleValue_PID,0)
				end
		end
end