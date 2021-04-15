--德國四周年_米佳

----------------  會場清掃 ---------------- 

-- 121805 費羅．凱奇 任務NPC初始對話 
function mika_4years_NPC_01()
	local player = OwnerID()
	local NPC = TargetID()
	local GetQuestKey =  547527  -- 可接任務-清掃環境
	local TodayQuestKey = 547530 -- 今天已完成任務-清掃環境

	if CheckFlag(player, TodayQuestKey) == false then  -- 今天已完成任務-清掃環境
		if CheckFlag(player, GetQuestKey) == false then  -- 可接任務-清掃環境
			SetSpeakDetail( player, "[SC_DE_4TH_Q1_NPC_01]"   );  -- 真是一群讓人傷腦筋的烏鴉啊...。
			AddSpeakOption(player, player, "[SC_DE_4TH_Q1_NPC_02]", "mika_4years_NPC_quest_01", 0  )   --  發生什麼事了？
		else  -- 有接任務的KEY
			LoadQuestOption(player)
		end
	else  --  今天幫過忙
		SetSpeakDetail( player, "[SC_DE_4TH_Q1_NPC_03]" );  -- 會場終於清淨多了，祝你在比賽中獲得佳績。
	end
end

-- 給接任務用的KEY
function mika_4years_NPC_quest_01()
	local player = OwnerID()
	local GetQuestKey =  547527  -- 可接任務-清掃環境

	CloseSpeak(player)
	Setflag(player,547527 , 1 ) -- 給予接任務的KEY
end

-- 完成任務後觸發事件
function mika_4years_NPC_quest_02()
	local player = TargetID()  -- 填在模板事件中, TargetID 是玩家
	local GetQuestKey =  547527  -- 可接任務-清掃環境
	local TodayQuestKey = 547530 -- 今天已完成任務-清掃環境

	Setflag(player,GetQuestKey , 0 ) -- 刪 接任務的KEY
	Setflag(player,TodayQuestKey , 1 ) -- 給 完成任務的KEY
	DesignLog( player , 121805 , "4 years event - venue cleaning complete." )
end

---------------------------- 怪物相關  ----------------------------
--107622 逐光鴉 掛模板初始劇情  -- 索敵 砍殺要拿掉
function mika_4years_ev1_monster_01()
	local Bird = OwnerID()
	local range = 25
	local X = ReadRoleValue(Bird, EM_RoleValue_X )
	local Y = ReadRoleValue(Bird, EM_RoleValue_Y )
	local Z = ReadRoleValue(Bird, EM_RoleValue_Z )	

	WriteRoleValue(bird, EM_RoleValue_Register1, X )
	WriteRoleValue(bird, EM_RoleValue_Register2, Y )
	WriteRoleValue(bird, EM_RoleValue_Register3, Z )

--	local R1 = ReadRoleValue(bird, EM_RoleValue_Register1 )  -- X
--	local R2 = ReadRoleValue(bird, EM_RoleValue_Register2 )  -- Y
--	local R3 = ReadRoleValue(bird, EM_RoleValue_Register3 )  -- Z
--	say(bird, "R1 ="..R1..", R2 = "..R2..", R3 = "..R3 )
	Callplot(Bird, "mika_4years_ev1_monster_02", 0)  -- 掃玩家劇情
	MoveToFlagEnabled( Bird , false )-- 關閉巡邏劇情
	Callplot(Bird, "Hao_Obj_Mobile", bird, 4, range , 1 )
end


-- 搜尋玩家 
function mika_4years_ev1_monster_02()
	local Bird = OwnerID()
	local magicid =	850608
	local R = Rand(2)+1  -- 1 ~ 2
	local CDtime = R*5

	while true do 
		local PID = ReadRoleValue(bird, EM_RoleValue_PID )

	--	WriteRoleValue(bird, EM_RoleValue_Register, 0)

		if PID ~= 99 then  -- 如果pid是99, 則是hide狀態不跑下面
			local allplayeys = SearchRangePlayer(Bird, 10)
			if #allplayeys > 0 then
				SysCastSpellLv( Bird , Bird , magicid , 0 )  -- CD 3 秒
			end
		end
		sleep(10+CDtime)  
	end
end


function mika_4years_ev1_item_check()
	local player = OwnerID()
	local Target = TargetID()
	local npcid = 107622

	if ReadRoleValue(Target, EM_RoleValue_OrgID ) ~= npcid then
		ScriptMessage( player, player, 1, "[SC_421101_0]", 0 );   -- 目標錯誤
		return false
	else
		if PID ~= 99 then
			return true
		end
	end
end

function mika_4years_ev1_item_use()
	local player = OwnerID()
	local Target = TargetID()
	local killid = 107623
	local R = Rand(100)+1
	local rate = 85  -- 成功機率
	local PID = ReadRoleValue(Target, EM_RoleValue_PID )

	if R >= (100-rate+1) then  
		UseItemDestroy()
		DW_QietKillOne(player, killid )  -- 暗暗殺死一隻NPC 
		Callplot(Target, "mika_4years_ev1_monster_reset", 0)
	--	CallPlot( Target, "LuaFunc_ResetObj",Target )
	else
		ScriptMessage( player, player, 1, "[SC_DE_4TH_Q1_ITEM_01]", C_SYSTEM )   -- [107622]靈敏地掙脫了你的捕捉
	end


end

function mika_4years_ev1_monster_reset()
	local bird = OwnerID()
	local Room = ReadRoleValue( bird , EM_RoleValue_RoomID )
	local BirdID = 107622
	local reborntime = 15  -- 重生時間 15
	local range = 25
	local R1 = ReadRoleValue(bird, EM_RoleValue_Register1 )  -- X
	local R2 = ReadRoleValue(bird, EM_RoleValue_Register2 )  -- Y
	local R3 = ReadRoleValue(bird, EM_RoleValue_Register3 )  -- Z

	WriteRoleValue(bird, EM_RoleValue_PID, 99)
	hide(bird)
	Sleep(reborntime*10)  
	local NewBird = CreateObj( BirdID , R1 , R2 , R3 , 0 , 1 )	-- 產生烏鴉
	Hao_Germany_4th_Obj_Status( NewBird , Room , false , true , false , true )	-- 選擇生成狀態(物件、Room、阻擋、頭像框、砍殺、標記)
	BeginPlot( NewBird , "mika_4years_ev1_monster_01" , 0 )
	DelObj(bird)

end