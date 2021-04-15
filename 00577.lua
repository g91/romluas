function CounterNo2()
	BeginPlot( OwnerID() , "FightCounter", 0 )
end

function FightCounter()
	local P_Sec = 0	-- 測試秒數
	local M_Sec = 0

	local m = 0
	local n = 1

	local TalkGroup = MonsterTalkFormat( GetString("ST_FIGHT_TEST") )

	while true do
		Sleep( 1 )	--  0.1秒檢查一次	
		n = n + 1
		if n > 36000 then -- 防無窮迴圈
			ScriptMessage( OwnerID() , OwnerID() , 0, "無窮迴圈", 0 )
			break
		end

		local P_MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
		local P_NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		local P_MaxMP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )
		local P_NowMP = ReadRoleValue( OwnerID() , EM_RoleValue_MP )
		local AttackStatue = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )
		local P_HP = P_MaxHP - P_NowHP
		local P_MP = P_MaxMP - P_NowMP

		local AttackTargetID = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		local M_MaxHP = ReadRoleValue( AttackTargetID , EM_RoleValue_MaxHP )
		local M_NowHP = ReadRoleValue( AttackTargetID , EM_RoleValue_HP )
		local M_HP = M_MaxHP - M_NowHP
		local P_Time = P_Sec / 10
		local M_Time = M_Sec / 10
		local MDPS = string.format( "%.1f" , P_HP / M_Time ) 
		local DPS = string.format( "%.1f" , M_HP / P_Time )

		if  ( AttackStatue == 1 ) then  --檢查是否進入戰鬥
			if ( P_Sec == 0 ) then
				ScriptMessage( OwnerID() , OwnerID(), 0, TalkGroup[1] , 0 )	-- 戰鬥計時開始
				BeginPlot( AttackTargetID , "FightCounterPlayer", 0 )
			end

			P_Sec = P_Sec + 1	-- 戰鬥計時

			if ( P_NowHP ~= P_MaxHP ) then
				M_Sec = M_Sec + 1
			end
		else
			if ( P_Sec > 0 ) then
				FightCounterFinishTalk( P_Time, M_Time, P_HP, M_HP, P_MP, MDPS, DPS, TalkGroup )

				WriteRoleValue( OwnerID() , EM_RoleValue_HP , P_MaxHP )
				WriteRoleValue( OwnerID() , EM_RoleValue_MP , P_MaxMP )
				WriteRoleValue( OwnerID() , EM_RoleValue_EXP , 0 )
				P_Sec = 0
				M_Sec = 0
				m = n+1
			end
		end
	end
end

function FightCounterPlayer()
	local P_Sec = 0	-- 測試秒數
	local M_Sec = 0

	local m = 0
	local n = 1

	local TalkGroup = MonsterTalkFormat( GetString("ST_FIGHT_TEST") )

	while true do
		Sleep( 10 )	--  0.1秒檢查一次	
		n = n + 1
		if n > 360 then -- 防無窮迴圈
			ScriptMessage( OwnerID() , OwnerID() , 0, "無窮迴圈", 0 )
			break
		end

		local P_MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
		local P_NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		local P_MaxMP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )
		local P_NowMP = ReadRoleValue( OwnerID() , EM_RoleValue_MP )
		local AttackStatue = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )
		local P_HP = P_MaxHP - P_NowHP
		local P_MP = P_MaxMP - P_NowMP

		local AttackTargetID = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		local M_MaxHP = ReadRoleValue( AttackTargetID , EM_RoleValue_MaxHP )
		local M_NowHP = ReadRoleValue( AttackTargetID , EM_RoleValue_HP )
		local M_HP = M_MaxHP - M_NowHP
		local P_Time = P_Sec / 10
		local M_Time = M_Sec / 10
		local MDPS = string.format( "%.1f" , P_HP / M_Time ) 
		local DPS = string.format( "%.1f" , M_HP / P_Time )

		if  ( AttackStatue == 1 ) then  --檢查是否進入戰鬥
			--Say(OwnerID() , string.format( "%.1f" , M_NowHP / M_MaxHP*100 ).."%" )
			M_Sec = M_Sec + 1	-- 戰鬥計時

			if ( M_NowHP ~= M_MaxHP ) then
				P_Sec = P_Sec + 1
			end
			if ( P_Sec > 0 ) and ( M_NowHP == 0 ) then
					
				FightCounterFinishTalk( P_Time, M_Time, P_HP, M_HP, P_MP, MDPS, DPS, TalkGroup )
				P_Sec = 0
				M_Sec = 0
				m = n+1
				break
			end
		end
	end
end

function FightCounterFinishTalk( P_Time, M_Time, P_HP, M_HP, P_MP, MDPS, DPS, TalkGroup )
	Say( OwnerID() , TalkGroup[2]..P_Time )
--	Say( OwnerID() , TalkGroup[3]..M_Time )
	Say( OwnerID() , TalkGroup[4]..P_HP )
	Say( OwnerID() , TalkGroup[5]..M_HP )
	Say( OwnerID() , TalkGroup[6]..P_MP )
--	Say( OwnerID() , TalkGroup[7]..MDPS )
--	Say( OwnerID() , TalkGroup[8]..DPS  )
	Say( OwnerID() , "===================" )
end 