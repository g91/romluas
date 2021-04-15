-- 2013.05.07  6.0.1 活動副本調整 - 哥布林首領對話劇情
function Lua_Hao_113245_00()

	local Player = OwnerID()
	local Npc = TargetID()
	local KingSpeaking = ReadRoleValue( Npc , EM_RoleValue_Register+1 )	-- 哥布林首領的對話

	AdjustFaceDir( Npc , Player , 0 )	-- 面向

	if CheckFlag( Player , 542743 ) == false then	-- 檢查玩家是否已付30枚必爾汀代幣
		ScriptMessage( Npc , Player , 1 , "[GUILD_BUILD_12]" , 0 )	-- 你沒有權限
		PlayMotion( Npc , 107 )	-- 搖頭
		return
	end
	
	if CheckFlag( Player , 542904 ) == false then	-- 已領取哥布林首領發放的獎勵
		if ReadRoleValue( Npc , EM_RoleValue_Register+1 ) == 1 then	-- 過關完成，給予關卡內每位玩家獎勵
			SetSpeakDetail( Player , "[SC_GOBLINARENA_42]" )	-- 很好，好好珍惜這個獎勵。遇到我是你天大的幸運，知道嗎？
			AddSpeakOption( Player , Npc , "[SC_GOBLINARENA_40]" , "Lua_Hao_113245_01", 0 )	-- 我要領取[205074]
		else
			SetSpeakDetail( Player , "[SC_GOBLINARENA_41]" )
		end
	else 
		SetSpeakDetail ( Player , "[SC_DAN_111700_24]") --你今天已經兌換過獎勵了
	end
end

function Lua_Hao_113245_01()

	local Player = OwnerID()
	local Npc = TargetID()
	
	local Present ={		25 , 203086 ,		-- 哥布林變身藥水
				50 , 205078 ,		-- 鎚牙智者變身藥水
				60 , 203182 ,		-- 7天哥布林寵物箱
				70 , 205081 ,		-- 7天鎚牙智者寵物箱
				71 , 201134 ,		-- 經驗藥劑
				72 , 201610 ,		-- 技能藥劑
				82 , 201619 ,		-- 幸運藥劑
				87 , 202902 ,		-- 空間記錄墨水
				92 , 202903 ,		-- 傳送者符文			
				96 , 202435 ,		-- 家的羈絆
				100 , 203784	}	-- 公會城堡傳送石	
	
	CloseSpeak(Player)
	if EmptyPacketCount( Player ) >= 1 and QueuePacketCount( Player ) == 0 then --檢查背包欄位
		local Random = math.random(100)
		GiveBodyItem( Player , 205817 , 1 )	-- 6.0.1 後新增征服者的戰利品
		for i = 1 , #Present , 2 do		
			if Random <= Present[i] then
		    		GiveBodyItem( Player , Present[i+1] , 1 )
		    		break
		    	end
		end
		SetFlag( Player , 542904 , 1 )
	else
		SetSpeakDetail( Player , "[SC_DAN_111700_22]" )  -- 您的背包空間不足，請清理一下再來吧。
	end
end