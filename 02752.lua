--------------------------------------------------------------------------------------------
--任務NPC 121396 赫斯嘉
--------------------------------------------------------------------------------------------
function Lua_na_121396_speak() --對話劇情
	local Owner = OwnerID()
	local Target = TargetID()
	local BuffID = 623456
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
	if CheckFlag( Owner ,  547022 ) == true then --本日已經領取過獎勵
		SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC06]") --你是否也會偶爾覺得身後一陣涼意呢？尤其是最近的情況特別頻繁！
	elseif CheckFlag( Owner ,  547021 ) == true then --如果玩家已經結束活動，未領獎勵
		if CheckBuff( Owner , BuffID ) == true then --如果玩家有抓到鬼靈
			if BuffLv > 9 then -- 10 表現很不錯唷！
				SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC08]") 
				if BuffLv >= 14 then  -- 15
					GiveBodyItem( Owner , 530794 , 1 ) --給稱號 "聞名遐邇的抓鬼大師"
				end
				GiveBodyItem( Owner , 209433 , 3 )
			elseif BuffLv >= 5 and  BuffLv <= 9 then  --6~10
				SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC09]") --表現還算可以！	
				GiveBodyItem( Owner , 209433 , 2 )
			elseif  BuffLv <=4 then -- 1~5
				SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC10]") --該說是失望嗎？
				GiveBodyItem( Owner , 209433 , 1 )
			end
			CancelBuff( Owner , 623456 )	--刪除 逐漸消散的鬼靈
			CancelBuff( Owner , 623443 )	
			CancelBuff( Owner , 623439 )			

		else --身上沒有鬼靈
			SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC07]") --該不會是親眼看到鬼靈之後，就害怕退縮了吧？
			GiveBodyItem( Owner , 724059 , 1 )

		end
		SetFlag( Owner , 547022 , 1 ) --開啟已領取獎勵旗標
		Lua_Festival_10_All(Owner)

	elseif CheckBuff( Owner , 623442) == true then --如果玩家正在進行活動
		SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC05]")
	else
		SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC01]") --你是否也會偶爾覺得身後一陣涼意呢？尤其是最近的情況特別頻繁！ ...
		AddSpeakOption( Owner , Owner ,"[SC_2012_GHOST_OPT1]" ,  "Lua_na_121396_speak2",0 ) --參加「抓鬼」的訓練課程
		AddSpeakOption( Owner , Owner ,"[SC_2012_GHOST_OPT2]" ,  "Lua_na_121396_speak3",0 ) --抓…抓鬼啊……我再考慮一下好了……
	end
end


function Lua_na_121396_speak2() --參加活動
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC02]") --規則說明
	AddSpeakOption( Owner , Owner ,"[SC_2012_GHOST_OPT3]" ,  "Lua_na_121396_start",0 ) --抓鬼的工作就交給我！
end


function Lua_na_121396_speak3() --不參加活動
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC03]") --希望你能再考慮看看
end


function Lua_na_121396_start() --活動開始，給予玩家5分鐘的活動BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner , EM_RoleValue_LV_SUB )
	DesignLog( Owner , 121396 , "Lv = "..Lv.." SubLv = "..SubLv )  --回傳活動參與值
	CloseSpeak( Owner)
	ScriptMessage( Owner , Owner , 2 , "[SC_2012_GHOST_NPC04]" , C_SYSTEM) --去吧！去展現你的身手吧！
	AddBuff( Owner ,623442 , 0 , -1 ) --靈視之眼
	AddBuff( Owner ,623440 , 0 , -1 ) --玩家技能
end


-------------------------------------------------------------------------------------------
--鬼靈的判斷劇情
-------------------------------------------------------------------------------------------
function Lua_na_2012_ghost() -- 鬼靈的初始劇情
	local Owner = OwnerID() -- 鬼靈
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
	while true do --鬼靈搜尋
		local P = SearchRangePlayer( Owner , 20 ) --玩家不能太接近鬼靈
		local Reg1 = ReadRoleValue( Owner , EM_RoleValue_Register1)
		
		if Reg1 ~= 0 then
			Lua_na_2012_ghost_hide()

		elseif Reg1 == 0 then
			SysCastspellLv( Owner , Owner , 499669, 0 ) --施展扇形範圍法術e
			if table.getn(P) >= 1 then --如果範圍中有玩家
				for i = 0 , table.getn(P) do
					if CheckBuff( P[i] , 623442 ) == true and CheckBuff( P[i] , 623443) == false then 
						WriteRoleValue( Owner , EM_RoleValue_Register1 , 1 )	
						PlayMotion( Owner ,ruFUSION_MIME_BUFF_SP01)
						SysCastspellLv( Owner , Owner , 499672, 0 ) --施放恐慌
					--	Say( Owner , "YES" )
						break
					end
				end
			end
		end
		sleep( 10 )
	end
end


function Lua_na_2012_ghost_hide()
	local Owner = OwnerID()
	local R = Rand(3)+2
--	Say( Owner , "HIDE")
	Hide( Owner)
	Sleep( R*100) --20 / 30 / 40秒，重生
	Show( Owner , 0) 
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
end


function Lua_na_2012ghost_spell()
	local Owner = OwnerID() --npc
	local Target = TargetID() --玩家

--	Sleep(30)
	if CheckBuff ( Target , 623442 ) == true and CheckBuff ( Target , 623443 ) == false then --目標為有參加活動的玩家
		WriteRoleValue( Owner , EM_RoleValue_Register1 , 2 )	
	--	Say( Owner ,  "R = "..ReadRoleValue( Owner ,  EM_RoleValue_Register1) )
		ScriptMessage( Target , Target , 1 , "[SC_2012_GHOST_MES1]" , 0)  --既然你…看的見…我………那就…感受…恐懼吧…… 
		ScriptMessage( Target , Target , 2 , "[SC_2012_GHOST_MES8]" , 0)  --快使用技能不怕！不怕！，平撫心中的恐懼。
		SysCastspellLv( Owner , Target , 499570 , 0 )
		AddBuff( Target , 623443 , 0 , -1)
		AddBuff( Target , 623439 , 4, -1) 
		BeginPlot( Target , "Lua_na_ghost_cry", 0)
		AdjustFaceDir(Owner, Target , 180 ) --面向 背對
		WriteRoleValue( Owner  ,EM_RoleValue_IsWalk , 0  )--用跑的
		Lua_MoveLine( Owner , 40 ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
	else --沒有參加活動的玩家
		ScriptMessage( Target , Target, 2 , "[SC_2012_GHOST_MES0]" ,  0 ) --背脊突然感受到一股寒意……
	end
end 


function Lua_na_2012_Ghost_JoinPlayer() --恐慌的檢查玩家是否有參加劇情
	local Target = TargetID()
	if CheckBuff( Target , 623442) == true and CheckBuff( Target , 623443) == false then --檢查目標玩家是否有參加活動
		return TRUE
	else
		return FALSE
	end
end
		


-------------------------------------------------------------------------------------------
--捕捉鬼靈，檢查目標是否為鬼靈 499670
-------------------------------------------------------------------------------------------
function Lua_na_2012_Ghost_Tar() --刪除驚嚇BUFF，檢查自己是否有驚嚇BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local Ghost = 121395
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )
	
	if  OrgID ~= Ghost then --目標不是鬼靈
		ScriptMessage( Owner , Owner , 1 , "[SC_422202_5]" , 0 )
		return false
	else -- 沒有驚嚇
		return true	
	end	
end


function Lua_na_ghost_cry()  --玩家播放哭泣的動作
	local Owner =OwnerID() 	
--	while true do
	for i = 1 , 2 do
		if CheckBuff( Owner , 623439 ) == true then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_EMOTE_CRY)		
		else
			break
		end
		Sleep(30)
	end
end

---------------------------------------------------------------------------------------------------------------------------------
--玩家使用的技能
---------------------------------------------------------------------------------------------------------------------------------
function Lua_na_ghost_catch_check() --捕捉鬼靈
	local Owner = OwnerID() --玩家
	local Target = TargetID() --鬼靈
	local reg1 = ReadRoleValue( Target , EM_RoleValue_Register1 ) 
	
	if CheckID( Target) == true then
		if CheckBuff( Owner , 623442 ) == true then --如果玩家身上的"靈視之眼"BUFF尚未消失
			if reg1 ~= 0  then -- 鬼靈不可以捕捉
				ScriptMessage( Owner , Owner , 1 , "[SC_2012_GHOST_MES2]" , 0)  --無法捕捉目標！
				return false
			else
				return true
			end
		else
			ScriptMessage( Owner , Owner , 2 , "[SC_2012_GHOST_MES3]" , 0) --無法感受到[121395]。
			return false					
		end	
	else
		ScriptMessage( Owner , Owner ,1 , "[SC_2012_GHOST_MES4]" , 0) --[121395]已經消失。	
		return false
	end
end


function Lua_na_ghost_catch() --捕捉鬼靈
	local Owner = OwnerID() --玩家
	local Target = TargetID() --鬼靈
	local reg1 = ReadRoleValue( Target , EM_RoleValue_Register1 ) 
	if reg1 == 0 then
		AddBuff( Owner , 623455 , 0 , -1 ) --背負的鬼靈，疊+BUFF一層， 每一層會降低跑速1%
		WriteRoleValue( Target , EM_RoleValue_Register1 , 1 )	
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_2012_GHOST_MES2]" , 0)  --無法捕捉目標！
	end
end



function Lua_na_2012_ghost_Delsk() --"不怕不怕"，查詢玩家身上是否有驚嚇的BUFF，有的話刪除一層
	local Owner = OwnerID()
	local Target = TargetID()
	local BuffID = 623439
	local BuffLv =  FN_CountBuffLevel(Target,BuffID)
--	Say( Owner , BuffLv )

	if BuffLv >=1 then
		Cancelbuff( Target , BuffID)
		AddBuff(Target ,BuffID,BuffLv-1,-1)
	elseif BuffLv == 0 then
		Cancelbuff( Target , BuffID)	
		Cancelbuff_NoEvent( Target , 623443)
	--	Say( Owner, "CANCEL" )
	else
		ScriptMessage( Owner, Owner , 2 , "[SC_2012_GHOST_MES6]" , 0 ) --目前情緒穩定，沒有恐懼的感覺。
	end
end


function Lua_na_2012_ghost_delbuff() --若是時間內沒有消除身上的驚嚇BUFF，活動結束
	local Owner = OwnerID()
	--刪除活動相關BUFF
	CancelBuff(Owner , 623439) --驚嚇BUFF 
	if CheckBuff( Owner , 623442 ) == true then
		CancelBuff(Owner , 623442) -- 靈視之眼 BUFF 
	end
end



function Lua_na_ghost_buffend() --靈視BUFF消失之後，統計分數
	local Owner = OwnerID()
	local BuffID = 623455
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
--	DebugMsg( Owner , 1, "SPELL" ) 
	SetFlag( Owner , 547021 , 1 ) --給予活動結束進行FLAG
	Cancelbuff( Owner , 623443)
	CancelBuff(Owner , 623440) --活動技能
	if BuffLv >=0 then
		CancelBuff ( Owner , BuffID ) --刪除鬼靈計次BUFF
		ScriptMessage( Owner , Owner , 3 , "[SC_2012_GHOST_MES5]" , 0) --在鬼靈掙脫束縛前，僅快交給[121396]。
		AddBuff( Owner , 623456 , BuffLv , -1 )  --給予有時間的鬼靈計次BUFF
	else
		ScriptMessage( Owner , Owner , 3 , "[SC_2012_GHOST_MES7]" , 0 ) --向中央廣場區的[121396]回報結果。
	end
end


-----------------------------------------------------------------
--測試指令
-----------------------------------------------------------------
function Lua_na_ghost_join() --進行活動的狀態
	local Owner = OwnerID()
	AddBuff( Owner ,623442 , 0 , -1 ) --靈視之眼 3層
	AddBuff( Owner ,623440 , 0 , -1 ) --玩家技能
end



function Lua_na_ghost_delflag() --刪除活動相關旗標
	local Owner = OwnerID()
	SetFlag( Owner , 547021 , 0 )
	SetFlag( Owner , 547022 , 0 )
	say( Owner , "CLEAR!")
end


function Lua_na_ghost_addbuff(LV) --增加計分BUFF，使用PCALL，填入層數BUFF
	addbuff( OwnerID(), 623455 , LV , -1 )
end