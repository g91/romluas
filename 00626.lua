--魔化奧古達戰鬥AI
function LuaB_OGD_AI_SYSYTEM()

	Local SP
	Local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	Local HP
	Local CheckTime = 60 --每60秒檢查一次
	Local CastingTime = 50 --施法時的等待時間，必須小於檢查時間
	local Count = 0
	local CheckA = "NO" --檢查是否已經狂暴
	local Skill
	CastSpell( OwnerID() , OwnerID() , 491200) --幫自己上魔甲術
--	Say( OwnerID() ,"Begin" )
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if CheckBuff( OwnerID() , 501597 ) ~= true and CheckBuff( OwnerID() , 500960 ) ~= true then
--				CastSpell( OwnerID() , OwnerID() , 491200)		--重上魔甲術	
				Addbuff( OwnerID() , 501597 , 1 , -1 )	
			end
			HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
--			Say( OwnerID() ,"HP = "..HP )
			SP = ReadRoleValue( OwnerID() , EM_RoleValue_SP_Sub)
--			Say( OwnerID() ,"SP ="..SP )
			if HP <= MaxHp/4 then --當 HP 小於最大HP的1/4時狂暴，同時解除魔甲術
				if CheckA == "NO" then
					Yell( OwnerID() , "[SAY_100274_3]" , 5 )
					CastSpell( OwnerID() , OwnerID() , 491094 ) --狂暴
					CancelBuff(OwnerID(),501597) --解除魔甲術
					CheckA = "YES"
				end
				--判斷並對血量最低的玩家進行攻擊
				local Player = LuaFunc_PartyData(AttackTarget )  
				for i = 1 , Player[0] , 1 do
					if ReadRoleValue( Player[i] ,EM_RoleValue_HP) < ReadRoleValue( AttackTarget ,EM_RoleValue_HP) and 50 > GetDistance( OwnerID(), Player[i]) then
						AttackTarget = Player[i]
						WriteRoleValue( OwnerID() , EM_RoleValue_AttackTargetID,AttackTarget  )
					end
				end
				CastSpell( OwnerID() , AttackTarget ,491020)			
			elseif Count >= 50 then --戰意達到50觸發特攻
				EnableNpcAI( OwnerID() , false );
				sleep(15)
				local Player = LuaFunc_PartyData(AttackTarget )  
				for i = 1 , Player[0] , 1 do --對最遠的目標進行衝鋒
					if GetDistance( OwnerID(), Player[i]) > GetDistance( OwnerID(), AttackTarget) then
						AttackTarget = Player[i]
						WriteRoleValue( OwnerID() , EM_RoleValue_AttackTargetID,AttackTarget  )
					end
				end
--				Say( OwnerID() ," Target = "..AttackTarget )
				--隨機使用破陣擊或爆裂旋風
				Skill = Rand(2) + 1
				if Skill == 1 then 
					Yell( OwnerID() , "[SAY_100274_1]" , 5 )
					sleep(15)
					CastSpell( OwnerID(),AttackTarget , 492496 ) --衝鋒+破陣擊
				elseif Skill == 2 then
					Yell( OwnerID() , "[SAY_100274_2]" , 5 )
					sleep(15)
					CastSpell( OwnerID(),AttackTarget , 492497 ) --衝鋒 + 爆裂旋風
				end
--				AddRoleValue( OwnerID() , EM_RoleValue_HP , -(MaxHP/20) ) --觸發後自己減掉 1/20 的血
				EnableNpcAI( OwnerID() , true );
				Count = 0
			else
				sleep(CastingTime)
			end
			if Count < 100 then 
				Count = Count + 5 --進入戰鬥後，戰意持續增加
			else
				Count = 0
			end
			sleep(CheckTime-CastingTime)
		else
			if CheckBuff( OwnerID() , 501597 ) ~= true then
--				CastSpell( OwnerID() , OwnerID() , 491200)		--重上魔甲術	
				Addbuff( OwnerID() , 501597 , 1 , -1 )	
			end
			if CheckBuff( OwnerID() , 500960 ) == true then
				CancelBuff( OwnerID() , 501470 )		--清除狂暴	
				CheckA = "NO"
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_SP_Sub, 0) 
			sleep(CheckTime)
		end
	end
end