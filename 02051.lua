--���|�г�-10. �T�ӤF


------------------------------------------------------------------
--����Y �@��
-- ���a������ ( ��buff ����)
-- �T������ ( ���ͩR��) ��֯T���WR+1��

function lua_mika_wolfcome_stone_go()  --��֦���(���a)
--	Say(OwnerID(), "O")  -- Owner  = ���a
--	Say(TargetID(), "T")  --  Target  = �T

	local BuffType = 0
	local Count = BuffCount ( TargetID())
	local SetA = -1

	Playmotion(TargetID(), 18 ) -- �T����ʧ@ ���� (18 or 19 )

	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 507701 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv

			if BuffLv > 1 then  -- �T�� > 1
				local random = rand(100)+1   
			--	Say(OwnerID(), "R ="..random )

				if random >=1 and random <= 45 then   -- 0 -45 (45)

			--		Say(TargetID(), "life -1 " )
					CancelBuff(TargetID(), 507701 )
					AddBuff(TargetID(), 507701, SetA-1 , -1 )
					local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--		Say(TargetID(), "life is "..life )

				elseif random >=46 and random <= 80 then   -- 46 -80 (35)

					if BuffLv > 2 then  -- �T�� > 3
			--			Say(TargetID(), "life -2 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-2 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					elseif BuffLv > 1 then  -- �T�� > 1
			--			Say(TargetID(), "life -1 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-1 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					end
				else  -- 81 - 100 (20)

					if BuffLv > 3 then  -- �T�� > 3
			--			Say(TargetID(), "life -3 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-3 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					elseif BuffLv > 2 then  -- �T�� > 2
			--			Say(TargetID(), "life -2 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-2 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					elseif BuffLv > 1 then  -- �T�� > 1
			--			Say(TargetID(), "life -1 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-1 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					end
				end
	
			else
				CancelBuff(TargetID(),BuffID)
			--	Say(TargetID(), "I will die" ) 
				WriteRoleValue( TargetID(), EM_RoleValue_Register3, 1 )  -- �g�J���T�w��flag
				local wolfdead =  ReadRoleValue( TargetID(), EM_RoleValue_Register3 )  -- �T�w��  r3 = 1 �T���F , r3 = 0 �T����
			--	Say(OwnerID(), "wolfdead = "..wolfdead )
				Beginplot(TargetID(), "lua_mika_wolfcome_npcdie", 10 )  -- ���񦺤`�s��ʧ@, ��3��
			end
			break
		end
	end
end

Function lua_mika_wolfcome_npcdie()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
	Delobj(OwnerID())  --  �۱�
end

-------------------------------------
--�ޯ�- �X����   ���ؼЦϩ��e��

function lua_mika_wolfcome_skill()
--	say(OwnerID(), "OwnerID")  --player
--	say(TargetID(), "TargetID" )  --sheep

	local dis = Rand( 65 )+1    --���ʶZ��50-65
	if dis < 50 then
		dis = 50
	end
--	Say(TargetID(), "Move="..dis )
	AdjustFaceDir(TargetID(), OwnerID() , 180 ) --���V �I��
	WriteRoleValue( TargetID()  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
	sleep(10)
	Lua_MoveLine( TargetID() , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)

end

-- �ޯ� �X���� �k�N�ˬd
function lua_mika_wolfcome_skill_check()
--	say(OwnerID(), "OwnerID")  --player
--	say(TargetID(), "TargetID" )  --sheep
	
	if CheckBuff(TargetID(), 507702 ) == true then  -- ����buff
		ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_08]" , 0 )  -- [105023]���G�]���ߦ�ť����A�������K
		ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_08]" , 0 )  
		return false
	else
		return true
	end

end