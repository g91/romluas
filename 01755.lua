function Lua_Hao_KR_New_Semester_00()

--	Say( OwnerID() , "1" )	--玩家
--	Say( TargetID() , "2" )	--NPC
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向

	SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_00]"  ) --[$PLAYERNAME]，最近，<CB>精靈王[112854]</CB>為了培養大家的文學素質，發起了全民寫日記的活動，只要你每天持續編輯日記，當日記的頁數達到第<CY>9</CY>頁與第<CY>13</CY>頁時，就能跟我兌換獎勵歐。

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_KR_NEW_SEMESTER_01]"  , "Lua_Hao_KR_New_Semester_01", 0 )-- 我要編輯日記
end

function Lua_Hao_KR_New_Semester_01()

--	Say( OwnerID() , "3" )	-- 玩家
--	Say( TargetID() , "4" ) 	-- NPC
	if CheckFlag( OwnerID() , 543634 ) == false then
		SetFlag( OwnerID() , 543634 , 1 )
		AddBuff( OwnerID() , 505887 , 0 , -1 )
		CastSpell( OwnerID() , OwnerID() , 491010 )
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 106 )
		CloseSpeak( OwnerID() )
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 505887 then
				local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				local BuffLvv = BuffLv + 1
				if BuffLv == 8 then -- 當Buff等級累積為9，給允玩家背包2號
					if CheckFlag( OwnerID() , 543637 ) == false then
						GiveBodyItem( OwnerID() , 206900 , 1  )
						SetFlag( OwnerID() , 543637 , 1 )
						CloseSpeak( OwnerID() )
						AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
						PlayMotion( TargetID() , 102 )
					end
				elseif BuffLv == 12 then -- 當Buff等級累積為13，給允玩家背包1號
					if CheckFlag( OwnerID() , 543636 ) == false then
						GiveBodyItem( OwnerID() , 206899 , 1 )
						SetFlag( OwnerID() , 543636 , 1 )
						CloseSpeak( OwnerID() )
						AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
						PlayMotion( TargetID() , 111 )
					end
				end
			end
		end
	else -- 重覆選項時對話
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 505887 then
				local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				local BuffLvv = BuffLv + 1
				if BuffLv == 8 then -- 當Buff等級累積為9的對話
					SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_04][$SETVAR1="..BuffLvv.."]"  ) -- 強化你的武器，在戰鬥中才會有更好的表現。
					AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
					PlayMotion( TargetID() , 102 )
				elseif BuffLv == 12 then -- 當Buff等級累積為13的對話
					SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_05]"  ) -- 恭喜你，完成了13天的日記全記錄，希望你會喜歡這些禮物。
					AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
					PlayMotion( TargetID() , 111 )
				elseif BuffLv < 12 then -- 當玩家Buff未到達累積次數時。
					SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_02][$SETVAR1="..BuffLvv.."]"  ) -- 你已經寫過今天的日記嘍，目前日記本的頁數為：<CS>[$VAR1]</CS>
					AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
					PlayMotion( TargetID() , 106 )
				end
			elseif CheckFlag( OwnerID() , 543634 ) == true and CheckBuff( OwnerID() , 505887 ) == false then
				SetSpeakDetail(  OwnerID(), "You must use the correct way to test this activity , Something wrong  , Please try again ."  ) -- 你必須使用正確的方式測試這個活動。有些錯誤，請重新嘗試
				AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
				PlayMotion( TargetID() , 107 )
			end
		end    
	end
end

function Lua_Hao_KR_Semester_Reset0()
	SetFlag( OwnerID() , 543634 , 0 )
end
function Lua_Hao_KR_Semester_Reset1()
	SetFlag( OwnerID() , 543636 , 0 )
	SetFlag( OwnerID() , 543637 , 0 )
end

--===========================================
--	2011年
--===========================================
function FN_KR_NewSemester_NPC114944()
	SetSpeakDetail(OwnerID(),"[SC_KR_NEW_SEMESTER_07]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_KR_NEW_SEMESTER_08]", "FN_KR_NewSemester_give", 0 )
end

function FN_KR_NewSemester_give()
	--Say(OwnerID(),"OwnerID") --Player
	--Say(TargetID(),"TargetID") --NPC
	if CheckBuff(OwnerID(),505889) == TRUE then
		SetSpeakDetail(OwnerID(),"[SC_KR_NEW_SEMESTER_10]")
	else
		GiveBodyItem(OwnerID(),209566,1)
		AddBuff(OwnerID(),505889,0,-1)
		CancelBuff(OwnerID(),506955)
		AddBuff(OwnerID(),506955,0,3600)
		CloseSpeak(OwnerID())
	end
end

function FN_KR_NewSemester_Item209566(Type,ItemID)
	if Type == "check" then
		if CheckBuff(OwnerID(),506955) == FALSE then
			return TRUE
		else
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_KR_NEW_SEMESTER_06]",0)	--你身上已經擁有效果
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_KR_NEW_SEMESTER_06]",0)	--你身上已經擁有效果
			return FALSE
		end
	elseif Type == "use" then
		local ItemTable = {209566,209567,209568,209569}
		local BuffLV = FN_CountBuffLevel(OwnerID(),505889)
		--視玩家所使用哪階的符文來給予多強的Buff
		AddBuff(OwnerID(),506955,ItemID-1,3600)
		-- 統計玩家身上的Buff來得知玩家使用第幾次
		if BuffLV == -1 then
			AddBuff(OwnerID(),505889,0,-1)
		else
			CancelBuff(OwnerID(),505889)
			AddBuff(OwnerID(),505889,BuffLV+1,-1)
			BuffLV = FN_CountBuffLevel(OwnerID(),505889)
			if BuffLV == 3 then	--表示玩家已經累記使用3次
				if ItemID == 4 then	--檢查玩家是不是已經使用最高階的符文 若是則給予禮包
					CancelBuff(OwnerID(),505889)
					--DelBodyItem(OwnerID(),209569)
					--GiveBodyItem(OwnerID(),209570,1)
					BeginPlot(OwnerID(),"FN_KR_NewSemester_Item209566_end",0)
				else
					--刪掉現有的Buff 重新計算使用次數
					CancelBuff(OwnerID(),505889)
					AddBuff(OwnerID(),505889,0,-1)
					--刪掉現有的符文給予下一階的符文
					BeginPlot(OwnerID(),"FN_KR_NewSemester_Item209566_end",0)
				end
			end
		end
	end
end

function FN_KR_NewSemester_Item209566_end()
	local ItemTable = {209566,209567,209568,209569,209570}
	for i = 1,4 do
		if CountBodyItem(OwnerID(),ItemTable[i]) >= 1 then
			DelBodyItem(OwnerID(),ItemTable[i],1)
			GiveBodyItem(OwnerID(),ItemTable[i+1],1)
			if i ~= 4 then 
				AddBuff(OwnerID(),505889,0,-1)
				--
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_KR_NEW_SEMESTER_09][$SETVAR1=".."["..ItemTable[i].."]".."][$SETVAR2=".."["..ItemTable[i+1].."]".."]",C_SYSTEM) --發出光芒進化了
				ScriptMessage(OwnerID(),OwnerID(),1,"[SC_KR_NEW_SEMESTER_09][$SETVAR1=".."["..ItemTable[i].."]".."][$SETVAR2=".."["..ItemTable[i+1].."]".."]",C_SYSTEM) --發出光芒進化了
			end
			return
		end
	end

end

function FN_KR_NewSemester_Item209566_Del()	--刪除新學期符文的事件
	CancelBuff(OwnerID(),505889)
end


Function LuaI_209570()  --2011新學期背包
	local itemset  = {	3 ,"" 	, { 203298 , 1 }	
				, 13 ,""	, { 203321 , 1 }	
				, 23 ,""	, { 202506 , 10 } 
				, 40 ,""	, { 203038 , 100 }	
				, 60 ,""	, { 203091 , 5 }
				, 80 ,""	, { 201134 , 5 }	
				, 100 ,"" , { 201610 , 5 }	
							}

	return BaseTressureProc(   itemset , 1  )
end

function FN_KR_NewSemester_test()
	CancelBuff(OwnerID(),506955)
end