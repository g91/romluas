--================================================�H�U���k�N

function LuaYU_hello2009_magic_limit_01() --���Y�ؼЭ���  ��

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

						ScriptMessage(OwnerID(), OwnerID() , 1 , " [SC_RUNRUNPUMPKIN_07]" , C_SYSTEM )  --�ө�BUFF�w�|���T��
						ScriptMessage(OwnerID(), OwnerID() , 0 , " [SC_RUNRUNPUMPKIN_07] " , C_SYSTEM )  
						return false


					else
						return true


					end
				end
			end

		end

	elseif  ( TargetID() == OwnerID() ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --�A���i��ۤv�ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --�A���i��ۤv�ϥ�
		return false

	else

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --���i�ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --���i�ϥ�
		return false
	end


end

function LuaYU_hello2009_magic_limit_02() --���Y�ؼЭ���  ��

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

						ScriptMessage(OwnerID(), OwnerID() , 1 , " [SC_RUNRUNPUMPKIN_07]" , C_SYSTEM )  --�ө�BUFF�w�|���T��
						ScriptMessage(OwnerID(), OwnerID() , 0 , " [SC_RUNRUNPUMPKIN_07] " , C_SYSTEM )  
						return false


					else
						return true


					end
				end
			end
		end

	elseif  ( TargetID() == OwnerID() ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --�A���i��ۤv�ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --�A���i��ۤv�ϥ�
		return false

	else

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --���i�ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --���i�ϥ�
		return false
	end

end

function LuaYU_hello2009_magic_limit_03() --���Y�ؼЭ���  ��

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

						ScriptMessage(OwnerID(), OwnerID() , 1 , " [SC_RUNRUNPUMPKIN_07]" , C_SYSTEM )  --�ө�BUFF�w�|���T��
						ScriptMessage(OwnerID(), OwnerID() , 0 , " [SC_RUNRUNPUMPKIN_07] " , C_SYSTEM )  
						return false


					else
						return true


					end
				end
			end
		end

	elseif  ( TargetID() == OwnerID() ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --�A���i��ۤv�ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_08]" , C_SYSTEM )  --�A���i��ۤv�ϥ�
		return false

	else

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --���i�ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_RUNRUNPUMPKIN_09]" , C_SYSTEM )  --���i�ϥ�
		return false
	end

end

function LuaYU_hello2009_magic_del_01() --���buff���|�q ��


	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
	Score = Score+1
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --�O������


	local BuffType = 0
	local Count = BuffCount ( OwnerID())

	local SetA = -1--�Ŧ⪺�Ӽ�
	local SetB = -1--��
	local SetC = -1--��

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

function LuaYU_hello2009_magic_del_02() --���buff���|�q ��

	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
	Score = Score+1
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --�O������

	local BuffType = 0
	local Count = BuffCount ( OwnerID())

	local SetA = -1--�Ŧ⪺�Ӽ�
	local SetB = -1--��
	local SetC = -1--��

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

function LuaYU_hello2009_magic_del_03() --���buff���|�q ��

	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
	Score = Score+1
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --�O������

	local BuffType = 0
	local Count = BuffCount ( OwnerID())

	local SetA = -1--�Ŧ⪺�Ӽ�
	local SetB = -1--��
	local SetC = -1--��


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


function LuaYU_hello2009_magic_monsterBuffCount_01() --�Ǫ����W��buff���|�q ��

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
				SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--���аO

			end
		end
	end

end

function LuaYU_hello2009_magic_monsterBuffCount_02() --�Ǫ����W��buff���|�q ��

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
				SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--���аO

			end
		end
	end

end

function LuaYU_hello2009_magic_monsterBuffCount_03() --�Ǫ����W��buff���|�q ��

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
				SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--���аO

			end
		end
	end

end

function LuaYU_hello2009_magic_monsterBuffCount_04() --�Ǫ����W��buff���|���A�����n�ʤ�

	local BigPumpkin = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register) --����n�ʤ�
	MoveToFlagEnabled(OwnerID() , false )


--	Say( OwnerID() , "OwnerID() " )
--	Say( BigPumpkin , "BigPumpkin " )

	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--����
--	SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����

--	Hide(OwnerID())
--	Show(OwnerID(),0)
	SetStopAttack( OwnerID()) 
	AdjustFaceDir( OwnerID(), BigPumpkin , 0 ) --���V
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

function Lua_na_spell_check_Kaz()  --2013/11/12 �s�W�ˬd�I��̬�NPC�A�קK���a�ϥΦ��ޯ� 493656
	local Owner = OwnerID()
	if ReadRoleValue( Owner , EM_RoleValue_IsNPC) == true then
		return true
	else
		return false
	end
end