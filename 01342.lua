--================================================以下為法術

function LuaYU_hello2009_magic_limit_01() --投擲目標限制  藍

--	local AttackTargetID = ReadRoleValue(OwnerID() ,EM_RoleValue_AttackTargetID )

--	Say( OwnerID(),"AttackTargetID"  )
--	Say( AttackTargetID,"AttackTargetID"  )
--	Say( TargetID() ,"TargetID"  )
--	Say( OwnerID() ,"OwnerID"  )

	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID )
 

	if ( TargetOrgID == 102765 ) then

		local BuffType = 0
		local Count = BuffCount ( TargetID())
		if Count == 0 then

			return true

		else


			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )


				if BuffID == 504943 then

					local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )

					if BuffLv == 2  then

						ScriptMessage(OwnerID(), OwnerID() , 1 , " [SC_RUNRUNPUMPKIN_07]" , C_SYSTEM )  --該怪BUFF已疊滿三個
						ScriptMessage(OwnerID(), OwnerID() , 0 , " [SC_RUNRUNPUMPKIN_07] " , C_SYSTEM )  
						return false


					else
						return true


					end
				end
			end

		end

	elseif  ( TargetID() == OwnerID() ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --你不可對自己使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --你不可對自己使用
		return false

	else

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --不可使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --不可使用
		return false
	end


end

function LuaYU_hello2009_magic_limit_02() --投擲目標限制  紅

--	local AttackTargetID = ReadRoleValue(OwnerID() ,EM_RoleValue_AttackTargetID )

--	Say( OwnerID(),"AttackTargetID"  )
--	Say( AttackTargetID,"AttackTargetID"  )
--	Say( TargetID() ,"TargetID"  )

	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID )
 
	if ( TargetOrgID == 102766 ) then

		local BuffType = 0
		local Count = BuffCount ( TargetID())

		if Count == 0 then

			return true

		else

			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )


				if BuffID == 504944 then

					local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )

					if BuffLv == 2  then

						ScriptMessage(OwnerID(), OwnerID() , 1 , " [SC_RUNRUNPUMPKIN_07]" , C_SYSTEM )  --該怪BUFF已疊滿三個
						ScriptMessage(OwnerID(), OwnerID() , 0 , " [SC_RUNRUNPUMPKIN_07] " , C_SYSTEM )  
						return false


					else
						return true


					end
				end
			end
		end

	elseif  ( TargetID() == OwnerID() ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --你不可對自己使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --你不可對自己使用
		return false

	else

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --不可使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --不可使用
		return false
	end

end

function LuaYU_hello2009_magic_limit_03() --投擲目標限制  黃

--	local AttackTargetID = ReadRoleValue(OwnerID() ,EM_RoleValue_AttackTargetID )

--	Say( OwnerID(),"AttackTargetID"  )
--	Say( AttackTargetID,"AttackTargetID"  )
--	Say( TargetID() ,"TargetID"  )

	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID )
 
	if ( TargetOrgID == 102767 ) then

		local BuffType = 0
		local Count = BuffCount ( TargetID())
		if Count == 0 then

			return true

		else

			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )


				if BuffID == 504945 then

					local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )

					if BuffLv == 2  then

						ScriptMessage(OwnerID(), OwnerID() , 1 , " [SC_RUNRUNPUMPKIN_07]" , C_SYSTEM )  --該怪BUFF已疊滿三個
						ScriptMessage(OwnerID(), OwnerID() , 0 , " [SC_RUNRUNPUMPKIN_07] " , C_SYSTEM )  
						return false


					else
						return true


					end
				end
			end
		end

	elseif  ( TargetID() == OwnerID() ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --你不可對自己使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --你不可對自己使用
		return false

	else

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --不可使用
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --不可使用
		return false
	end

end

function LuaYU_hello2009_magic_del_01() --減少buff堆疊量 藍


	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
	Score = Score+1
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --記錄分數


	local BuffType = 0
	local Count = BuffCount ( OwnerID())

	local SetA = -1--藍色的個數
	local SetB = -1--紅
	local SetC = -1--黃

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 504940 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetA = BuffLv

		elseif BuffID == 504941 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv


		elseif BuffID == 504942 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetC = BuffLv

		end
	end


	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )

		if BuffID == 504940 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

--		Say( OwnerID() ,"BuffLv="..BuffLv )

			if BuffLv > 0 then

				CancelBuff(OwnerID(),504940)
				AddBuff(OwnerID(), 504940,SetA-1,600)

				if SetB > -1 then
					CancelBuff(OwnerID(),504941)
					AddBuff(OwnerID(), 504941,SetB,600)
				end
				if SetC > -1 then
					CancelBuff(OwnerID(),504942)
					AddBuff(OwnerID(), 504942,SetC,600)
				end
				break

			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end


end

function LuaYU_hello2009_magic_del_02() --減少buff堆疊量 紅

	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
	Score = Score+1
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --記錄分數

	local BuffType = 0
	local Count = BuffCount ( OwnerID())

	local SetA = -1--藍色的個數
	local SetB = -1--紅
	local SetC = -1--黃

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 504940 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetA = BuffLv

		elseif BuffID == 504941 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv


		elseif BuffID == 504942 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetC = BuffLv

		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )

		if BuffID == 504941 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

--		Say( OwnerID() ,"BuffLv="..BuffLv )

			if BuffLv > 0 then



				if SetA > -1 then
					CancelBuff(OwnerID(),504940)
					AddBuff(OwnerID(), 504940,SetA,600)
				end

				CancelBuff(OwnerID(),504941)
				AddBuff(OwnerID(), 504941,SetB-1,600)

				if SetC > -1 then
					CancelBuff(OwnerID(),504942)
					AddBuff(OwnerID(), 504942,SetC,600)
				end
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end


end

function LuaYU_hello2009_magic_del_03() --減少buff堆疊量 黃

	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
	Score = Score+1
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --記錄分數

	local BuffType = 0
	local Count = BuffCount ( OwnerID())

	local SetA = -1--藍色的個數
	local SetB = -1--紅
	local SetC = -1--黃


	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 504940 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetA = BuffLv

		elseif BuffID == 504941 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv


		elseif BuffID == 504942 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetC = BuffLv

		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )


		if BuffID == 504942 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

--		Say( OwnerID() ,"BuffLv="..BuffLv )

			if BuffLv > 0 then




				if SetA > -1 then
					CancelBuff(OwnerID(),504940)
					AddBuff(OwnerID(), 504940,SetA,600)
				end
				if SetB > -1 then
					CancelBuff(OwnerID(),504941)
					AddBuff(OwnerID(), 504941,SetB,600)
				end

				CancelBuff(OwnerID(),504942)
				AddBuff(OwnerID(), 504942,SetC-1,600)

				break

			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end


end


function LuaYU_hello2009_magic_monsterBuffCount_01() --怪物身上的buff堆疊量 藍

	BeginPlot( OwnerID()  , "LuaYU_hello2009_magic_del_01" , 0 )  
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 504943 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )

--	Say( OwnerID() , "BuffLv= "..BuffLv )
--	Say( TargetID() , "BuffLv= "..BuffLv )
			if BuffLv == 0  then

				WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  666  ) 

			elseif BuffLv == 1  then

				BeginPlot( TargetID()  , "LuaYU_hello2009_magic_monsterBuffCount_04" , 0 )  
				SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--不標記

			end
		end
	end

end

function LuaYU_hello2009_magic_monsterBuffCount_02() --怪物身上的buff堆疊量 紅

	BeginPlot( OwnerID()  , "LuaYU_hello2009_magic_del_02" , 0 )  
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 504944 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )

--	Say( OwnerID() , "BuffLv= "..BuffLv )
--	Say( TargetID() , "BuffLv= "..BuffLv )
			if BuffLv == 0  then

				WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  666  ) 

			elseif BuffLv == 1  then

				BeginPlot( TargetID()  , "LuaYU_hello2009_magic_monsterBuffCount_04" , 0 )  
				SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--不標記

			end
		end
	end

end

function LuaYU_hello2009_magic_monsterBuffCount_03() --怪物身上的buff堆疊量 黃

	BeginPlot( OwnerID()  , "LuaYU_hello2009_magic_del_03" , 0 )  
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 504945 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )

--	Say( OwnerID() , "BuffLv= "..BuffLv )
--	Say( TargetID() , "BuffLv= "..BuffLv )
			if BuffLv == 0  then

				WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  666  ) 

			elseif BuffLv == 1  then

				BeginPlot( TargetID()  , "LuaYU_hello2009_magic_monsterBuffCount_04" , 0 )  
				SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--不標記

			end
		end
	end

end

function LuaYU_hello2009_magic_monsterBuffCount_04() --怪物身上的buff堆疊滿，攻擊南瓜王

	local BigPumpkin = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register) --旋轉南瓜王
	MoveToFlagEnabled(OwnerID() , false )


--	Say( OwnerID() , "OwnerID() " )
--	Say( BigPumpkin , "BigPumpkin " )

	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--索敵
--	SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動

--	Hide(OwnerID())
--	Show(OwnerID(),0)
	SetStopAttack( OwnerID()) 
	AdjustFaceDir( OwnerID(), BigPumpkin , 0 ) --面向
	sleep(10)
	Say( OwnerID(),"[SC_YU_NEWPLAYERGO_10]" )
	CastSpell( OwnerID(), BigPumpkin ,494151)	
	sleep(30)
	BeginPlot( BigPumpkin  , "LuaYU_hello2009_thegun_01" , 0 )   
	BeginPlot( OwnerID()  , "LuaYU_hello2009_magic_monsterBuffCount_05" , 0 )  



end

function LuaYU_hello2009_magic_monsterBuffCount_05()
	sleep(5)
	BeginPlot( OwnerID()  , "LuaP_Dead" , 0 )   

	sleep(25)
	Delobj(OwnerID() )
end

function Lua_na_spell_check_Kaz()  --2013/11/12 新增檢查施放者為NPC，避免玩家使用此技能 493656
	local Owner = OwnerID()
	if ReadRoleValue( Owner , EM_RoleValue_IsNPC) == true then
		return true
	else
		return false
	end
end