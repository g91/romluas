------------------------------------------------------------- �˪L���� �ˮ`����
function lua_Dy_ChangeHert()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp ) --��̫᪺�ˮ`
	local TransDamage = (LastDamage/ (1-(0.30)) )*(0.30)
	local TD = math.floor(abs(TransDamage))		
	SysCastSpellLv(OwnerID() , Mypet , 493417 , TD )
	--say (OwnerID(), "B")
end
---------------------------------------------------------------------------------------------------- �˪L���� �ˮ`����K�I�d
function lua_Dy_ChangeHert_NoClick()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+9 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 503637 , 0 , 10 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
------------------------------------------------------------�˪L���� �F����� 
function lua_Dy_SoulAtk_PetCheck()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	 ------���d��ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP )	 ------���d��HP�W��
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) 	-----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100	
	if CheckID( MyPet ) == true then 	
		if HPPercent < 30 or HPPercent == 30 then	--HP�ʤ���p��30%�ɦ^�ǿ��~
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "1")
			return false
		end
		--say (OwnerID(), "2")
		return true
	elseif CheckID( MyPet ) == false then 	--�S���d��ID�ɦ^�ǿ��~
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say (OwnerID(), "3")
		return false 
	end
end
function lua_Dy_SoulAtk()	--�k�N�o�ʦ��\�ɦ����
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP ) ------���d������HP
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) -----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100
	local HP = math.floor(abs(MyPetMaxHp*0.3))
	if HPPercent > 30 then 
			WriteRoleValue ( MyPet , EM_RoleValue_HP, MyPetHp-HP)
			--say (OwnerID(), "A")
			return true
	elseif HPPercent < 30 or HPPercent == 30 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "B")
			return false
		end
end
------------------------------------------------------------�˪kLV35 �F�����-20%HP 
function lua_Dy_SoulAtk_PetCheck_2()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	 ------���d��ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP )	 ------���d��HP�W��
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) 	-----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100	
	if CheckID( MyPet ) == true then 	
		if HPPercent < 20 or HPPercent == 20 then	--HP�ʤ���p��30%�ɦ^�ǿ��~
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "1")
			return false
		end
		--say (OwnerID(), "2")
		return true
	elseif CheckID( MyPet ) == false then 	--�S���d��ID�ɦ^�ǿ��~
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say (OwnerID(), "3")
		return false 
	end
end
function lua_Dy_SoulAtk_2()	--�k�N�o�ʦ��\�ɦ����
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP ) ------���d������HP
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) -----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100
	local HP = math.floor(abs(MyPetMaxHp*0.2))
	if HPPercent > 20 then 
			WriteRoleValue ( MyPet , EM_RoleValue_HP, MyPetHp-HP)
			--say (OwnerID(), MyPetHp-HP)
			return true
	elseif HPPercent < 20 or HPPercent == 20 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "B")
			return false
		end
end
---------------------------------------------------------�˪L���� ��ʨ��
function lua_Dy_Actionstop()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503943 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power )		 -------------------------���k�N������
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+5 )
	SysCastSpellLv( BuffOwner, OwnerID(), 493418 , PLevel ) 		 ----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
	CancelBuff(OwnerID() , 503943)
end
-----------------------------------------------------------------------------------------------------------------------------�˪L���� ���F���޾� �d�����^�ۤvSP 
function lua_Dy_Elfintro2()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+24 ) --��D�H¾�~�C������
	if CheckBuff( OwnerID() , 503643 ) == true then
		AddBuff( Master ,503651 , PLevel, 1 )
		end
end
----------------------------------------------------------------�˪� ���F���޾ɧK�I�d�@��
function lua_Dy_Elfintro_NoClick()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+24 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 503643 , 0 , 15 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
---------------------------------------------------------�˪L���� �ƨ��ý�
function lua_Dy_rattan()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503962 ) 	---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID ) 	-------------------------��X���k�N�O�֩�
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power ) 	-------------------------���k�N������
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+3 )
	SysCastSpellLv( BuffOwner , OwnerID() , 493415 , PLevel ) 	----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
end
function lua_Dy_rattan_4()
	--say (TargetID() , "1")
	CancelBuff(TargetID() , 503962)
	CancelBuff(TargetID() , 503634)
end

----------------------------------------------------------------�˪L���� Buff�ۤv KillPet
--function lua_Dy_GoodByeMyPet_1()
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
--	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
--		return false
--	end
--	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
--	if CheckID( Mypet ) == true then 
--		if MypetID == 102297 then
--			if CheckBuff( OwnerID() , 620682) == true then --�ˬd�ۤv���L����F�Q��
--				CancelBuff_NoEvent( OwnerID(), 620682 )
--			end
--			DelObj ( MyPet ) ---�R���d��
--			return true
--		elseif MypetID ~= 102297 then
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
--			return false
--		end
--	end
--end
--function lua_Dy_GoodByeMyPet_2()
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
--	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
--		return false
--	end
--	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
--	if CheckID( Mypet ) == true then 
--		if MypetID == 102324 then
--			if CheckBuff(OwnerID() , 620678) == true then
--				CancelBuff(OwnerID() , 620678) --�ˬd���L����̳Q��
--			elseif CheckBuff(OwnerID() , 620709) == true then
--				CancelBuff(OwnerID() , 620709) --�ˬd�ۤv���L�����35�Q��
--			end
--			DelObj ( MyPet ) ---�R���d��
--			return true
--		elseif MypetID ~= 102324 then
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
--			return false
--		end
--	end
--end
--function lua_Dy_GoodByeMyPet_3()
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
--	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
--		return false
--	end
--	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
--	if CheckID( Mypet ) == true then 
--		if MypetID == 102325 then
--			DelObj ( MyPet ) ---�R���d��
--			return true
--		elseif MypetID ~= 102325 then
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
--			return false
--		end
--	end
--end
-----------------------------------------------------------------------�˪L���� �����z��
function lua_Dy_crystalburst()
	--say ( OwnerID(), "bye")
	DelObj ( OwnerID() )
end	
function lua_Dy_crystalburstcheck(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 	--��D�HID
	local MyPetMaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) 	------���d��HP�W��
	local MyPetHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) 		-----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100 --HP/MAXHP ���ʤ���
	if HPPercent < 10  then						--HP�ʤ���p��10%�ɦ^�ǿ��~
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_6]" , 1 )
		--say (OwnerID(), "B")
		return false
	elseif HPPercent == 10 or HPPercent > 10 then
		if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == true then
			local Petrange = GetDistance( OwnerID(), TargetID() )
			if Petrange < Skillrange or Petrange == Skillrange  then
				--say ( OwnerID(), "True")
				return true
			elseif Petrange > Skillrange then
				ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
				--say ( OwnerID(), "nooooooo")
				return false
			end
		else
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
			return false
		end
	end
end
function lua_Dy_crystalburst_00(Condition)--�k�N�o�ʦ��\�ɦ����
	--local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local MaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) ------���d������HP
	local MyHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) -----���d��HP
	local HPPercent =( MyHp / MaxHp)*100
	local HP = math.floor(abs(MaxHp*1.1))
	if Condition == 0 or Condition == 1 or  Condition == 2  or Condition == 10 then
			KillId( OwnerID() , OwnerID() )
			--WriteRoleValue ( OwnerID(),  EM_RoleValue_HP, MyHp-HP)
			--say (OwnerID() , HP)
	end
end

function lua_Dy_crystalbuffup()
	AddBuff( OwnerID() ,504597 ,0 ,15 )
	return true
end
-----------------------------------------------------------------�˪L���� PET�����L���۸ܡ@�L�۰ʴ`�����ޯ�~���
function lua_Dy_SoFarAwayForEnemy(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == true then
		local Petrange = GetDistance( OwnerID(), TargetID() )
		if Petrange < Skillrange or Petrange == Skillrange  then
			--say ( OwnerID(), "True")
			return true
		elseif Petrange > Skillrange then
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
			--say ( OwnerID(), "nooooooo")
			return false
		end
	else
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
		return false
	end	
end
-----------------------------------------------------------------�˪L���� PET�����L���۸� -- �ͤ�ؼХ�
function lua_Dy_SoFarAwayForParty(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == false then
		local Petrange = GetDistance( OwnerID(), TargetID() )
		if Petrange < Skillrange or Petrange == Skillrange  then
			--say ( OwnerID(), "True")
			return true
		elseif Petrange > Skillrange then
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
			--say ( OwnerID(), "nooooooo")
			return false
		end
	else
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
		return false
	end	
end
----------------------------------------------------------------------�˪L���� �ۦ^�d��
function lua_Dy_PetBackCheck()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
function lua_Dy_PetBack()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	DelObj ( MyPet ) ---�R���d��
	if CheckBuff( OwnerID() , 620682) == true then --�ˬd�ۤv���L����F�Q��
		CancelBuff_NoEvent( OwnerID(), 620682 )
	elseif CheckBuff( OwnerID() , 620678) == true then --�ˬd�ۤv���L����̳Q��
		CancelBuff(OwnerID(),620678)
	elseif CheckBuff( OwnerID() , 620709) == true then --�ˬd�ۤv���L����̴˪k35�Q��
		CancelBuff(OwnerID(),620709)
	elseif CheckBuff( OwnerID(), 503948 ) == true then --�ˬd�ۤv���L�۵M����Q��
		CancelBuff( OwnerID(), 503948 )
	elseif CheckBuff( OwnerID(), 500499 ) == true then --�ˬd�ۤv���L�˹C�H���Q��
		CancelBuff( OwnerID(), 500499 )
	end
end

function lua_Dy_Petcheckbuff(Master)  --�R���e�@���d�����Q�ʮĪG
	if CheckBuff( Master , 620682) == true then --�ˬd�ۤv���L����F�Q��
		CancelBuff_NoEvent( Master, 620682 )
	elseif CheckBuff( Master , 620678) == true then --�ˬd�ۤv���L����̳Q��
		CancelBuff(Master,620678)
	elseif CheckBuff( Master , 620709) == true then --�ˬd�ۤv���L����̴˪k35�Q��
		CancelBuff(Master,620709)
	elseif CheckBuff( Master, 503948 ) == true then --�ˬd�ۤv���L�۵M����Q��
		CancelBuff( Master, 503948 )
	elseif CheckBuff( Master, 500499 ) == true then --�ˬd�ۤv���L�˹C�H���Q��
		CancelBuff( Master, 500499 )
	end
end
-------------------------------------------------------------------------------�˪L���̡@�٤O�z�o�۰ʩ��d��
function lua_Dy_MadMyPet()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+22 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 503641 , PLevel, 30 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		--say (OwnerID(), "PLevel ="..PLevel )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
---------------------------------------------------------------------------------------------�˪� �@�Ϊ��ˬd���L�d���P�Z��150��
function lua_Dy_PetNearU_Check() 
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local Range = GetDistance( OwnerID(), MyPet )
	if Range < 300 or Range == 300 then
		if CheckID( MyPet ) == true then
			--say (OwnerID(), "havepetnearyou")
			return true
		elseif CheckID( MyPet ) == false then
			--say (OwnerID(), "Nooooooo")
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
			return false
		end
	elseif Range > 300 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_11]" , 1 )
		--say (OwnerID(), "havenottpet")
		return false
		
	end
end
---------------------------------------------------------------------------------------------------------------------- �˾�20 �r�~�٤W�d��
function lua_Dy_ViolentPet()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+28)
	if CheckBuff( MyPet , 504843) == true then ------------�ˬd���L�N�o�ɶ���Buff
		return false
	else
		AddBuff( MyPet ,504564 , PLevel, 10 )
		return true
	end
end
function lua_Dy_Hitweak()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+43)
	if CheckBuff( OwnerID() , 504715) == true then ------------�ˬd���L�N�o�ɶ���Buff
		return false
	else
		AddBuff( MyPet ,504569 , PLevel, 15) ---���e�ק���--�쥻10��
		AddBuff( OwnerID() ,504569 , PLevel, 15) ---���e�ק���--�쥻10��
		--say (OwnerID() , "1")
	end
end

-----------------------------------------------------------------------------�˪k25 �H����
function lua_Dy_RockHitMana()
	local MP = ReadRoleValue( OwnerID(), EM_RoleValue_MP )
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+45 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
	local MAXMP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxMP )
	--say(OwnerID() , PLevel)
	if MP >= 5+(2.4*1*PLevel)  then
		AddRoleValue( OwnerID() , EM_RoleValue_MP , -1*(5+(2.4*PLevel)) )
		--say (OwnerID() , ReadRoleValue( OwnerID(), EM_RoleValue_MP ))
		return true
	elseif MP < 5+(2.4*PLevel)  then
		--say (OwnerID() , "NOMP") 
		return false
	end
end
-----------------------------------------------------------------------------�˪k25 ����
function lua_Dy_WindHitMana()
	local MP = ReadRoleValue( OwnerID(), EM_RoleValue_MP )
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+51 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
	local MAXMP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxMP )
	--say(OwnerID() , PLevel)
	if MP >= (20*0.1*PLevel)+22+(1*PLevel)  then
		AddRoleValue( OwnerID() , EM_RoleValue_MP , -1*(2+(1*PLevel)) )
		--say (OwnerID() , ReadRoleValue( OwnerID(), EM_RoleValue_MP ))
		return true
	elseif MP < (20*0.1*PLevel)+22+(1*PLevel)  then
		--say (OwnerID() , "NOMP") 
		return false
	end
end
-------------------------------------------------------------------------�Դ�25 �ͪ�����
function lua_Dy_BiologyFortrue()
	if ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 4 or ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 6 then
		return true
	else 
		return false
	end
end
function lua_Dy_BiologyForfalse()
	if ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 4 or ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 6 then
		return false
	else 
		return true
	end
end
-------------------------------------------------------------------------------------�ƨ��ý�(�˪L����)
function star_skill_RattanCheck()
	AddBuff( OwnerID() , 503962 , 0 , -1 )
end

function star_skill_rattan()
	local RattanBuff = 503628
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , RattanBuff ) == true then
			local Count = BuffCount(ID)				
			for BuffPos=0 , Count-1 do
				--local BuffPos = Lua_BuffPosSearch( ID , RattanBuff )			
				if BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() 
					and BuffInfo(ID , BuffPos , EM_BuffInfoType_BuffID ) == RattanBuff then
					local PLV = BuffInfo( ID , BuffPos , EM_BuffInfoType_Power )	
					--say(OwnerID() , PLV)
					if BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 7 then
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 5 then
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV+3 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 3 then	
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV+6 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 1 then
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV+9 )
					end
				end
			end	
		end
	end	
end
-------------------------------------------------------------------------------------�˼v20 �ƨ��ý�
function lua_Dy_skill_RattanCheck()
	AddBuff( OwnerID() , 504609 , 0 , -1 )
end

function lua_Dy_skill_rattan()
	local RattanBuff = 503628
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , RattanBuff ) == true then
			local Count = BuffCount(ID)				
			for BuffPos=0 , Count-1 do
				--local BuffPos = Lua_BuffPosSearch( ID , RattanBuff )			
				if BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() 
					and BuffInfo(ID , BuffPos , EM_BuffInfoType_BuffID ) == RattanBuff then
					local PLV = BuffInfo( ID , BuffPos , EM_BuffInfoType_Power )	
					--say(OwnerID() , PLV)
					if BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 7 then
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 5 then
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV+3 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 3 then	
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV+6 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 1 then
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV+9 )
						SysCastSpellLv( OwnerID() , OwnerID() , 494206 , PLV )
					end
				end
			end	
		end
	end	
end
------------------------------------------------------------------------------------------------------------�˪��l���d�� �ˬd�� �˹C�ֳt�l��� �˹C50�ϥΫᤣ�i���d���� 0727�s�W70�M�˧ޯ��w����
--function lua_Dy_PetHelpCheck_01()
--	if CheckBuff( OwnerID() , 503946) == true or CheckBuff( OwnerID() , 503953 ) == true then ---�w���d���Y�F
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_13]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 504892) == true then -----�˾�35�ͩR�@��ϥΫ�L�k�l�����F
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 505748) == true then -----�˹C50�ϥΫ�L�k�l��Ҧ��d��
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
		--say (OwnerID(), "WM50")
--		return false
--	elseif CheckBuff( OwnerID() , 503946) == false 
	--and CheckBuff( OwnerID() , 504515) == true 
--	and CheckBuff (OwnerID() , 620951) == true then ---�S�Y�k��+�˹C�ֳt�l��(�R��) + �M�˧ޯ�Q�ʨ�w����
--			AddBuff( OwnerID() ,504566 ,0 , 3) --��A�q�������ĪG�A��w�������
--			ReCalculate(OwnerID() )
			--CancelBuff(OwnerID() , 504515)
			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503946) == false and CheckBuff( OwnerID() , 506461) == true then ---�S�Y�k��+�M�˧ޯ��d���j�v-50%�I�k�t��
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add �I�k��u����ڮĪG
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503946) == false then ---�٨S�Y�k��
--		--say (OwnerID(), "NOsubmit")
--		return true
--	end
--end		
--function lua_Dy_PetHelpCheck_02()
--	if CheckBuff( OwnerID() , 503580) == true then ---�w���d���Y�F
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_13]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 505748) == true then -----�˹C50�ϥΫ�L�k�l��Ҧ��d��
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM50")
--		return false
--	elseif CheckBuff( OwnerID() , 503580) == false 
--	--and CheckBuff( OwnerID() , 504515) == true 
--	and CheckBuff (OwnerID() , 620951) == true then ---�S�Y�k��+�˹C�ֳt�l��(�R��) + �M�˧ޯ�Q�ʨ�w����
--			AddBuff( OwnerID() ,504566 ,0 , 3)--��A�q�������ĪG�A��w�������
--			ReCalculate(OwnerID() )
--			--CancelBuff(OwnerID() , 504515)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503580) == false and CheckBuff( OwnerID() , 506461) == true then ---�S�Y�k��+�M�˧ޯ��d���j�v-50%�I�k�t��
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add �I�k��u����ڮĪG
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503580) == false then --�٨S�Y�k��
--		--say (OwnerID(), "NOsubmit")
--		return true
--	end
--end	
--function lua_Dy_PetHelpCheck_03()
--	if CheckBuff( OwnerID() , 503581) == true then ---�w���d���Y�F
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_13]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 506229) == true then -----�˪k40�ϥΫ�L�k�l��۵M����
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM40")
--		return false
--	elseif CheckBuff( OwnerID() , 505748) == true then -----�˹C50�ϥΫ�L�k�l��Ҧ��d��
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM50")
--		return false
--	elseif CheckBuff( OwnerID() ,503581) == false 
--	--and CheckBuff( OwnerID() , 504515) == true 
--	and CheckBuff (OwnerID() , 620951) == true then ---�S�Y����+�˹C�ֳt�l��(�R��) + �M�˧ޯ�Q�ʨ�w����
--			AddBuff( OwnerID() ,504566 ,0 , 3) --��A�q�������ĪG�A��w�������
--			ReCalculate(OwnerID() )
--			--CancelBuff(OwnerID() , 504515)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503581) == false and CheckBuff( OwnerID() , 506461) == true then ---�S�Y����+�M�˧ޯ��d���j�v-50%�I�k�t��
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add �I�k��u����ڮĪG
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503581) == false then ---�٨S�Y����
--		--say (OwnerID(), "NOsubmit")
--		return true
--	end
--end	
--function lua_Dy_PetHelpCheck_04()
--	if CheckBuff( OwnerID() , 505748) == true then -----�˹C50�ϥΫ�L�k�l��Ҧ��d��
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM50")
--		return false
--	elseif --CheckBuff( OwnerID() , 504515) == true and
--	CheckBuff( OwnerID() , 620951) == true then ----�ֳt�l��(�R��) + �M�˧ޯ�Q�ʨ�w����
--		AddBuff( OwnerID() ,504566 ,0 , 3) --��A�q�������ĪG�A��w�������
--		ReCalculate(OwnerID() )
--		--CancelBuff(OwnerID() , 504515)
--		--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 506461) == true then ---�M�˧ޯ��d���j�v-50%�I�k�t��
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add �I�k��u����ڮĪG
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
--			--say (OwnerID(), "submit")
--		return true
--	else
--		--say (OwnerID(), "NOsubmit") --���W���צ��L�s�b��L�d�����j�ƤO�q�]�i�H�l��X�H��20100614
--		return true
--	end
--end
-------------------------------------------------------------------------�C��25 ���ܷt�b
function lua_Dy_DarkShooter()
	if CheckBuff( OwnerID() , 504588) == true then
		AddBuff( OwnerID() ,504721 ,0 , 1)
			ReCalculate(OwnerID() )
			CancelBuff(OwnerID() , 504588)
			--say (OwnerID(), "submit")
			return true
	elseif CheckBuff( OwnerID() , 504588) == false then
		--say (OwnerID(), "NOsubmit")
		return true
	end
end	
function lua_Dy_DarkShooter_Del()
	CancelBuff(OwnerID() , 504588)
end
-----------------------------------------------------------------------------------------------�v�� Lv20�ðΤj�v
function lua_Dy_HideMaster()
CancelBuff( OwnerID(), 504553 )
	-- 2013.06.20 ���E:�ק�Ĳ�k�k�N�ABuff�����ɡA�I��k�N���X(494343)�A�^�Ƿ�e������Buff�M��ܫ�x�C
	BeginPlot( OwnerID() ,  "Hao_500675_Disappear_BuffList" , 0 )
	--
end
-------------------------------------------------------------------------------------�˾�LV30 ����
function star_skill_WW30()		-------�˾�30������
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	local PLevel = ReadRoleValue( MasterGID , EM_RoleValue_MagicPowerLv_SP+30 )
	AddBuff( MasterGID , 504604 , PLevel , -1 )
	AddBuff( MasterGID , 504892 , 0 , -1 )
end
---------------------------------------------�˼vLV40 �z���@�P
function lua_Dy_CRIWithPet()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	if CheckBuff( Master , 505206)  == true then
		--say (OwnerID(), "no")
		return false
	else
		SysCastSpellLv	( Master, Master, 494600 , 0)
		AddBuff( Master ,505206, 0, 45 )
		--say (OwnerID(), "CRI")
	end
end
---------------------------------------------�˯�LV35 �۵M�u��
function lua_Dy_Mana1PWithPet()
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	if CheckBuff( Master , 505205)  == true then
		return false
	else 
		SysCastSpellLv(Master, Master, 494606 , 0 )
		AddBuff( Master , 505205 , 0, 20 )
		--say (OwnerID(), "CRI")
		return true	
	end
end

--------------------------------------------------------------------------�C��40 ���î� ���ܷt�b�ˮ`+20%	
function lua_Dy_HideBreath()		
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if CheckBuff( OwnerID() , 505193)  == true then
			AddBuff( OwnerID() , 505194, 0 , 3)
			CancelBuff(OwnerID() , 505193)
			return true
		else
			return true
		end
	else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
	end	
end
------------------------------------------------�v�� Lv40 ���F�x��
function lua_Dy_HoldWoodSpirit()
	AddBuff( OwnerID() ,505172 , 0, 1 )
End

----------------------------------------------------------------------�˹C50 
--function lua_Dy_PetByeWS50() 
--local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
--	if ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then ----------------�d�����`��
		--say (OwnerID(), "dead")
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
--		return false
--	elseif CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
--			DelObj ( MyPet )
--			return true
--	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
--		return false
--	end
--end
------------------------------------------------------------------------------------------------------------------------------------------------�C��50	-- 0731--���e�s�W�@�Ӥ���CD�P�P�_
function lua_Dy_SW50CRI(Condition)	
	if Condition == 2 and CheckBuff( OwnerID() , 505715) == false then
		local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+9 )
		AddBuff( TargetID() , 505681 , PLevel , 15)
		AddBuff( OwnerID() , 505715 , 0 , 45)
	end
end
----------------------------------------------------------------------------------------------------------------�˹C45 �d���ޯ�+�D�H�P�ۤv�����j��8%
function lua_Dy_WS45ATKPLUS()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )---��D�HID
	--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+43)
	if CheckBuff( OwnerID() , 505746) or CheckBuff( Master , 505746) == true then ------------�ˬd���L�N�o�ɶ���Buff
		--say (OwnerID() , "0")
		return false
	else
		AddBuff( Master ,505745 , 0, 15 )
		AddBuff( OwnerID() ,505745 , 0, 15 )
		--say (OwnerID() , "1")
	end
end
--------------------------------------------------------------------------------------�v��45 �ˤf����
function lua_Dy_HideHeart()
local MP = ReadRoleValue( OwnerID(), EM_RoleValue_MP )
if CheckBuff( OwnerID() , 505731 ) == true then
	return false
elseif CheckBuff( OwnerID() , 505731 ) == false then
	AddBuff( OwnerID()  , 505731 , 0 , 30)
	--say (OwnerID() , "001")
	return true
	end
end
------------------------------------------------------------�˪k50 ����j��
function lua_Dy_crystalburstcheck_02(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 	--��D�HID
	local MyPetMaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) 	------���d��HP�W��
	local MyPetHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) 		-----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100 --HP/MAXHP ���ʤ���
	if HPPercent < 20  then						--HP�ʤ���p��20%�ɦ^�ǿ��~
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_6]" , 1 )
		--say (OwnerID(), "B")
		return false
	elseif HPPercent == 20 or HPPercent > 20 then
		if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == true then
			local Petrange = GetDistance( OwnerID(), TargetID() )
			if Petrange < Skillrange or Petrange == Skillrange  then
				--say ( OwnerID(), "True")
				return true
			elseif Petrange > Skillrange then
				ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
				--say ( OwnerID(), "nooooooo")
				return false
			end
		else
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
			return false
		end
	end
end
--------------------------------------�˪k50 ����j��+MANA&-80%HP
function lua_Dy_crystalbuffup_02() 
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --�D�HID
	local PetLV = ReadRoleValue ( Master , EM_RoleValue_MagicPowerLv_SP+23) 
	local MaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) ------���d������HP
	local MyHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) -----���d��HP
	local HPPercent =( MyHp / MaxHp)*100
	local HP = math.floor(abs(MaxHp*0.8))
	if MyHp-HP > 0 then
		WriteRoleValue ( OwnerID(),  EM_RoleValue_HP, MyHp-HP)
		SysCastSpellLv( OwnerID() , OwnerID() , 494012 , PetLV )
	elseif MyHp-HP < 0 or MyHp-HP == 0 then
		SysCastSpellLv( OwnerID() , OwnerID() , 494012 , PetLV )
		KillId( OwnerID() , OwnerID() )
		--say (OwnerID() , "OK")
	end
end  
 -------------�˯�50 ����v��-80%HP
 function lua_Dy_crystalbuffup_03()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --�D�HID
	local PetLV = ReadRoleValue ( Master , EM_RoleValue_MagicPowerLv_SP+23) 
	local MaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) ------���d������HP
	local MyHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) -----���d��HP
	local HPPercent =( MyHp / MaxHp)*100
	local HP = math.floor(abs(MaxHp*0.8))
	if MyHp-HP > 0 then
		SysCastSpellLv( OwnerID() , OwnerID() , 494014 , PetLV )
		WriteRoleValue ( OwnerID(),  EM_RoleValue_HP, MyHp-HP)
		--say (OwnerID() , MyHp-HP)
	elseif MyHp-HP < 0 or MyHp-HP == 0 then
		SysCastSpellLv( OwnerID() , OwnerID() , 494014 , PetLV )
		KillId( OwnerID() , OwnerID() )
		--say (OwnerID() , "bye")
	end
end
----------------------------------------------------------------------�Դ�50 �j����AE�ˮ`
function lua_Dy_AirQuake()		
local PLevel = ReadRoleValue ( OwnerID() , EM_RoleValue_MagicPowerLv_SP+64 )
	SysCastSpellLv(OwnerID(), TargetID(), 494975 , 0 )	
end	
-----------------------------------------------------------------------�˾�45 �N�ӥ���
function lua_Dy_VolitionAttackEqCheck_00() -----------���W�w�����EBuff��
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if CheckBuff( OwnerID() , 505850)  == true then ---------------�W�O�٬I�k��1��Buff
			AddBuff( OwnerID() , 505813, 0 , 3)	-------------------------��ڮĪG��Buff		
			ReCalculate(OwnerID() )
			CancelBuff(OwnerID() , 505850)   -----------------�R�������Buff
			return true
		end
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
	end	
end
function lua_Dy_VolitionAttackEqCheck_01() -----------���W�w���r�~Buff��
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if CheckBuff( OwnerID() , 505849)  == true then ---------------�r�~�ˮ`X2��Buff
			AddBuff( OwnerID() , 505807, 0 , 3)	-------------------------��ڮĪG��Buff		
			CancelBuff(OwnerID() , 505849)   -----------------�R�������Buff
			return true
		end
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
		
	end	
end
function lua_Dy_VolitionAttackEqCheck_02() -----------------���W�w���t�@��Buff&�ˬd�T���
	if CheckBuff( OwnerID() , 505842   ) == true then		-----���T��
		return false
	elseif CheckBuff( OwnerID() , 505849   ) == true then   -----���r�~�N�Ӫ�
		return false
	elseif CheckBuff( OwnerID() , 505850   ) == true then   -----�����E�N�Ӫ�
		return false
	else
		return true
	end
end

----------------------------------------------------------�˪k45 ���̰k��
function star_skill_WM45()
	local PetGID = ReadRoleValue( OwnerID() ,EM_RoleValue_PetID )
	local RebirthBuff = 505705
	Setplot( PetGID , "dead" , "star_skill_WM45_PetDead" , 30)
	AddBuff(PetGID , RebirthBuff , 0 , -1)
end

function star_skill_WM45_PetDead()
	--lua_Dy_Protectwm40()						-----------------�˪kLV40 �����@��(�]���L�����`�@���|�Q���̰k�ͻ\��)
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
--	local ReSummon1 = 495059
--	local ReSummon2 = 495060
--	local ReSummon3 = 495061
	if ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == 102297 then			----����F
		SysCastSpellLv( MasterGID , MasterGID , 493333 , 0 )
	elseif ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == 102324 then		----�����
		SysCastSpellLv( MasterGID , MasterGID , 493343 , 0 )
	elseif ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == 102325 then		----�۵M����
		SysCastSpellLv( MasterGID , MasterGID , 493344 , 0 )	
	end
end

function star_skill_WM45_Check()
	local PetGID = ReadRoleValue( OwnerID() ,EM_RoleValue_PetID )
	if CheckID(PetGID) == true and 
	 ReadRoleValue(PetGID , EM_RoleValue_IsDead) == 0 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )	-----�A����S���d��
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------�k��50 �j�a�貪
function star_skill_MWD50(Condition)
	local Buff = 505690
	local ExtraBuff = 505904
	if Condition == 1 or Condition == 2 then
		if CheckBuff(OwnerID() , Buff) == true and 
		 CheckBuff(OwnerID() , ExtraBuff) == true then
			local Pos = Lua_BuffPosSearch( OwnerID() , ExtraBuff )
			local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)	
			--Say(OwnerID() , PLV)
			if PLV < 9 then				
				AddBuff(OwnerID() , ExtraBuff , 0 , -1)								
			end	
		elseif CheckBuff(OwnerID() , Buff) == true and 
		 CheckBuff(OwnerID() , ExtraBuff) == false then
			AddBuff(OwnerID() , ExtraBuff , 0 , -1)
			local Pos = Lua_BuffPosSearch( OwnerID() , ExtraBuff )
			local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)	
			--Say(OwnerID() , PLV)
		end	
	end
end
--------------------------------------------------------------------------------------------------------------------�˼v50 �P��
function star_skill_WDR50()
	--local ChargeSpell = 495071 	-----�P�ߧ���	
	local DamageBuff = 505939
	local PetGID = ReadRoleValue( OwnerID() ,EM_RoleValue_PetID )
	--Say(PetGID , GetName(TargetID()))
	AddBuff(OwnerID() , DamageBuff , 0 , -1)
	AddBuff(PetGID , DamageBuff , 0 , -1)
	--SysCastSpellLv( PetGID , TargetID() , ChargeSpell , 0 )
end
---------------------------------------------------------------------------------------------------------------------�v��50 �ۼv��b
function star_skill_RWD50_Damage()
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse8 , TargetID() )
	return true
end

function star_skill_RWD50_Pet1()	
	AddBuff(OwnerID() , 505848 , 0 , 5)
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	WriteRoleValue( Master , EM_LuaValueFlag_SkillUse6 , OwnerID() )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------������
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------������
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	------��show���
	BeginPlot( Master , "star_skill_RWD50_Master" , 0 )	
end

function star_skill_RWD50_Pet2()	
	AddBuff(OwnerID() , 505848 , 0 , 5)
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	WriteRoleValue( Master , EM_LuaValueFlag_SkillUse7 , OwnerID() )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------������
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------������
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	------��show���	
end

function star_skill_RWD50_Master()
	local pet1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse6)
	local pet2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse7)
	local Target = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse8)
	local TauntSpell = 495072 
	for i=1 , 10 do
		sleep(10)
		--Say(OwnerID() , "pet1="..pet1)
		--Say(OwnerID() , "pet2="..pet2)
		--Say(OwnerID() , "Target="..Target)
		if pet1 ~= 0 and pet2 ~= 0 and Target ~=0 then
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse6 , 0 )
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse7 , 0 )
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse8 , 0 )
			if CheckRelation( OwnerID() , Target , EM_CheckRelationType_Attackable) == true then
				SetModeEx( pet1 , EM_SetModeType_Move , true )			------����
				SetModeEx( pet1 , EM_SetModeType_Strikback , true )	------����
				SetModeEx( pet1 , EM_SetModeType_Fight , true )		------�i���
				SetModeEx( pet1 , EM_SetModeType_Searchenemy , true )	------����
				SetModeEx( pet1 , EM_SetModeType_Mark , true )			------�i�I��
				SetModeEx( pet1 , EM_SetModeType_NotShowHPMP , true )	------show���
				SetModeEx( pet2 , EM_SetModeType_Move , true )			------����
				SetModeEx( pet2 , EM_SetModeType_Strikback , true )	------����
				SetModeEx( pet2 , EM_SetModeType_Fight , true )		------�i���
				SetModeEx( pet2 , EM_SetModeType_Searchenemy , true )	------����
				SetModeEx( pet2 , EM_SetModeType_Mark , true )			------�i�I��
				SetModeEx( pet2 , EM_SetModeType_NotShowHPMP , true )	------show���
				SetAttack(pet1 , Target)
				SetAttack(pet2 , Target)
				SysCastSpellLv( Target , pet1 , TauntSpell , 0 )
				SysCastSpellLv( Target , pet2 , TauntSpell , 0 )
				BeginPlot( pet1 , "star_skill_RWD50_PetSkill" , 0 )
				BeginPlot( pet2 , "star_skill_RWD50_PetSkill" , 0 )
				break
			else
				SetModeEx( pet1 , EM_SetModeType_Move , true )			------����
				SetModeEx( pet1 , EM_SetModeType_Strikback , true )	------����
				SetModeEx( pet1 , EM_SetModeType_Fight , true )		------�i���
				SetModeEx( pet1 , EM_SetModeType_Searchenemy , true )	------����
				SetModeEx( pet1 , EM_SetModeType_Mark , true )			------�i�I��
				SetModeEx( pet1 , EM_SetModeType_NotShowHPMP , true )	------show���
				SetModeEx( pet2 , EM_SetModeType_Move , true )			------����
				SetModeEx( pet2 , EM_SetModeType_Strikback , true )	------����
				SetModeEx( pet2 , EM_SetModeType_Fight , true )		------�i���
				SetModeEx( pet2 , EM_SetModeType_Searchenemy , true )	------����
				SetModeEx( pet2 , EM_SetModeType_Mark , true )			------�i�I��
				SetModeEx( pet2 , EM_SetModeType_NotShowHPMP , true )	------show���
				BeginPlot( pet1 , "star_skill_RWD50_PetSkill" , 0 )
				BeginPlot( pet2 , "star_skill_RWD50_PetSkill" , 0 )
			end	
		end
	end
end

function star_skill_RWD50_PetSkill()
	local Spell = 495105
	local Counter = 0
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	local PLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+66)
	for i=1 , 20 do
		sleep(10)
		Counter = Counter+1
		
		if Counter == 5 then
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			SysCastSpellLv( OwnerID() , AttackTarget , Spell , PLV )
			Counter = 0
		end
	end
end	
--------------------------------------------------------------------------------------------------------------------�k��45 ���F���d
function star_skill_MWD45() 		------Ĳ�obuff����Ĳ�o and �T���Ĳ�o
	local AmuletBuff = 503957		------���F�@��
	local TriggerBuff = 505759
	local ElfBuff = 505755			------��ܦ��ƥ�
	local EffectBuff = 505689
	local ForbiddenBuff = 505903
	if CheckBuff(OwnerID() , AmuletBuff) == true and
	 CheckBuff(OwnerID() , EffectBuff) == false and
	 CheckBuff(OwnerID() , ElfBuff) == false then
		AddBuff(OwnerID() , TriggerBuff , 0 , -1)		
		AddBuff(OwnerID() , ElfBuff , 1 , 10)
		ReCalculate(OwnerID() )
		AddBuff(OwnerID() , EffectBuff , 0 , 10)
	elseif CheckBuff(OwnerID() , ElfBuff) == true then
		ReCalculate(OwnerID() )
		AddBuff(OwnerID() , EffectBuff , 0 , 10)
	end	
end
 
function star_skill_MWD45_2() 		------�ĪGBuff����Ĳ�o
	local AmuletBuff = 503957		------���F�@��
	local TriggerBuff = 505759
	local ElfBuff = 505755			------��ܦ��ƥ�
	local EffectBuff = 505689
	local ForbiddenBuff = 505903
	local Pos = Lua_BuffPosSearch( OwnerID() , ElfBuff )
	local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)
	if PLV == 1 then
		AddBuff(OwnerID() , ForbiddenBuff , 0 , -1)
		CancelBuff(OwnerID() , ElfBuff)
		AddBuff(OwnerID() , ElfBuff , 0 , 10)
	elseif PLV == 0 then
		CancelBuff(OwnerID() , ElfBuff)
	end
end
---------------------------------------------------�˪k40�����@��
function lua_Dy_WM35ADD()
	AddBuff( OwnerID()  , 507332 , 0 , 10)
	AddBuff( OwnerID()  , 507333 , 0 , 10)
end
function lua_Dy_WM35DEL()
	local own = OwnerID()
	if checkbuff(Own,507333) == false then
		if checkbuff(Own,507332) == true then
			CancelBuff_NoEvent( Own, 507332 )
		end
		if checkbuff(Own,505154) ==true then
			CancelBuff( Own, 505154 )
		end
	elseif checkbuff(Own,50732) == false then
		if checkbuff(Own,507333) ==true then
			CancelBuff_NoEvent( Own, 507333 )
		end
		if checkbuff(Own,505154) ==true then
		CancelBuff( Own, 505154 )
		end
	end
end
----------------------------------------------------�s�˪k50�d���j��
function Dy_NEWWM50()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
		if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 620713 , 0, 30 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		--say (OwnerID(), "PLevel ="..PLevel )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
-------------------------------------------------------�s�˪k40�����@��
function Dy_NEWWM40_CHECK()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
		return false
	end
	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
	if CheckID( Mypet ) == true then 
		if MypetID == 102325 then
			return true
		elseif MypetID ~= 102325 then
			return false	
		end
	end	
end
function Dy_NEWWM40()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	SysCastSpellLv ( Master, Master, 498221,  0  )	
end
----------------------------------------�s�۵M����ޯ� �u�@���� ����[�t
function Dy_NEWW14() --����[�t
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	SysCastSpellLv ( Master, Master, 498224,  0  )
end
function Dy_NEWW46() --�u�@����
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	SysCastSpellLv ( Master, Master, 498222,  0  )
end
function Dy_NEWW14_2() --�˪k����[�t
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	SysCastSpellLv ( Master, Master, 498225,  0  )
end
function Dy_NEWW46_2() --�˪k�u�@����
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --��D�HID
	SysCastSpellLv ( Master, Master, 498223,  0  )
end