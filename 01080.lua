function lua_star_resetmagic()
	CancelBuff( OwnerID() , 500662 )
end
-------------------------------------------------------------------------------------------------------------------------�Ȫecheck
function lua_star_galaxy_check()
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 
		if GetDistance( OwnerID(), TargetID() ) <= 165 then
			if CheckBuff( OwnerID() , 501549 ) == false then
				--AddBuff( OwnerID() , 501549 , 1 , 3 )  --�p��20120523�b��
				return true
			elseif CheckBuff( OwnerID() , 501549 ) == true then
				return false
			end	
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_8]" , 1 ) -----------�I�k�Z���L��
			return false
		end			
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ޯ�ؼп��~
		return false
	end	
end

---------------------------------------------------------------------------------------------------------�M���q��ҵoBuff
function lua_star_cancelelect()
	CancelBuff( OwnerID() , 501554 )
   	 return true
end
---------------------------------------------------------------------------------------------------------��̬y��ޯ�
function lua_star_laceration_bleed()             ----�ˤf�����y���B�~�ˮ`
	local bleedbuffpos1 = {}
	local bleedbuffpos2 = {}
	local bleedbuffpos3 = {}	
	local Count = BuffCount( TargetID() )
	if CheckBuff( TargetID() , 500654 ) == true then				
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500654 then
				bleedbuffpos1[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos1[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos1[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then											
					return true
				end
			end
		end		
	elseif CheckBuff( TargetID() , 500655 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500655 then
				bleedbuffpos2[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos2[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos2[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	elseif CheckBuff( TargetID() , 620313 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 620313 then
				bleedbuffpos2[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos2[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos2[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end		
	elseif CheckBuff( TargetID() , 500726 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500726 then
				bleedbuffpos3[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos3[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos3[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	elseif CheckBuff( TargetID() , 620297 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 620297 then
				bleedbuffpos3[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos3[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos3[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end		
	else	
		return false
	end	
end

---------------------------------------------------------------------------------------------------------��̩��ޯ�
function lua_star_laceration_wound()             ----�ˤf��������B�~�ˮ`
	local woundbuffpos = {}
	local Count = BuffCount( TargetID() )
	if CheckBuff( TargetID() , 500704 ) == true then		
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500704 then
				woundbuffpos[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if woundbuffpos[i] ~= nil then
				if BuffInfo( TargetID() , woundbuffpos[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	elseif CheckBuff( TargetID() , 620314 ) == true then		
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 620314 then
				woundbuffpos[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if woundbuffpos[i] ~= nil then
				if BuffInfo( TargetID() , woundbuffpos[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	else
		return false
	end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------�q�ध��
function lua_star_electnet()
	CancelBuff( OwnerID(), 501554 )
	lua_star_controlcheck( 501555 )
	return true
end
function lua_star_electnet_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	CancelBuff( OwnerID(), 501554 )
	lua_star_controlcheck( 501555 )
	return IsMob
end
function lua_star_electnet_ForPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		CancelBuff( OwnerID(), 501554 )
		lua_star_controlcheck( 503838 )
		return true
	else
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------�����^��
function lua_star_controlhealing()
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	if (NowHP+MaxHP*0.25) <= MaxHP then
		AddRoleValue( TargetID() , EM_RoleValue_HP , MaxHP*0.25 )	--------�אּ�C2��^25%
	else
		WriteRoleValue( TargetID() , EM_RoleValue_HP , MaxHP )		--------�ɪ��q�W�L�̤j�Ȯɪ����g�J�̤j��
	end	
end		
----------------------------------------------------------------------------------------------------------------------------------------------�����u��P�ɱ���@�ӥؼ�
function lua_star_controlcheck( CCBuffId )
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , CCBuffId ) == true and ID ~= TargetID() then
			local BuffPos = Lua_BuffPosSearch( ID , CCBuffId )			
			if BuffPos >= 0 and BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() then
				CancelBuff( ID , CCBuffId )				
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------�¾K���b
function lua_star_SleepDagger()
	lua_star_controlcheck( 500737 )
	return true
end
function lua_star_SleepDagger_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	lua_star_controlcheck( 500737 )
	return IsMob
end
function lua_star_SleepDagger_ForPlayer()
	local IsPlayer = lua_star_Skill_ForPlayer()
	lua_star_controlcheck( 503046 )
	return IsPlayer
end
------------------------------------------------------------------------------------------------------------------------------------------------�M���u��
function lua_star_RopeTool()	
	lua_star_controlcheck( 500924 )		
	return true
end
function lua_star_RopeTool_ForMob()			-------��Ǫ��ĪG
	lua_star_controlcheck( 500924 )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	else 
		return true
	end	
end

function lua_star_RopeTool_ForPlayer()			-------�缾�a�ĪG
	lua_star_controlcheck( 502955 )		------1214�p�ʭק�buff�s��
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return true								
	else 
		return false
	end	
end
function lua_star_RopeTool2_ForMob()			-------��Ǫ��ĪG
	lua_star_controlcheck( 502559 )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	else 
		return true
	end	
end

function lua_star_RopeTool2_ForPlayer()			-------�缾�a�ĪG
	lua_star_controlcheck( 503849)			------1214�p�ʭק�buff�s��
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return true								
	else 
		return false
	end	
end

------------------------------------------------------------------------------------------------------------------------------------------------�Y��N
function lua_star_Freeze()
	lua_star_controlcheck( 501961 )
	return true
end
function lua_star_Freeze_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	lua_star_controlcheck( 501961 )
	return IsMob
end
function lua_star_Freeze_ForPlayer()
	local IsPlayer = lua_star_Skill_ForPlayer()
	lua_star_controlcheck( 503844 )
	--if IsPlayer == true then
		--Say(OwnerID() , "true")
	--else
		--Say(OwnerID() , "false")
	--end
	return IsPlayer
end
------------------------------------------------------------------------------------------------------------------------------------------------------�D�԰Ƽv�y�믫�d�z�z
function lua_star_SpiritCurse_Master()	
	local MaxMP = ReadRoleValue( TargetID() , EM_RoleValue_MaxMP )
	local MaxSP = ReadRoleValue( TargetID() , EM_RoleValue_MaxSP )		
	local MaxSP_Sub = ReadRoleValue( TargetID() , EM_RoleValue_MaxSP_Sub )
	local MP = 0
	local SP = 0
	local SP_Sub = 0
		
	if MaxMP ~= 0  then
		MP = ReadRoleValue( TargetID() , EM_RoleValue_MP )
		WriteRoleValue( TargetID() , EM_RoleValue_MP , MP-MaxMP*0.15 )
	end
	if MaxSP ~= 0  then
		SP = ReadRoleValue( TargetID() , EM_RoleValue_SP )
		WriteRoleValue( TargetID() , EM_RoleValue_SP , SP-MaxSP*0.5 )	
	end
	if MaxSP_Sub ~= 0 then
		SP_Sub = ReadRoleValue( TargetID() , EM_RoleValue_SP_Sub )
		WriteRoleValue( TargetID() , EM_RoleValue_SP_Sub , SP_Sub-MaxSP_Sub*0.5 )
	end	
end
--------------------------------------------------Lv50 �Լv �믫�d�z
function lua_Dy_weaksoul(Condition)	
	if Condition == 1 then
		AddBuff( TargetID() , 503721 , 0 , 25)	
	end	
end
------------------------------------------------�v��35LV �r�ʷP�V
function lua_Dy_DrugCancel()
local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+24 )
SysCastSpellLv	( OwnerID(), TargetID() , 492955 , PLevel)
CancelBuff( TargetID(), 502894 )
end

-------------------------------------------------------------------------------------------------------------------------------�M�h �]�O�^�X�s��
function star_skill_Knight_ReMPCheck()
	if CheckBuff(TargetID() , 501773) == true or
	 CheckBuff(TargetID() , 501774) == true or
	 CheckBuff(TargetID() , 501775) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_16]" , 1 )		------�ؼШ��W�S���t�L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end

function star_skill_Knight_ReMP()
	local PLV = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+2 )
	if CheckBuff(TargetID() , 501773) == true then			-----�t�L1
		SysCastSpellLv( OwnerID() , OwnerID() , 495075 , PLV )
		CancelBuff(TargetID() , 501773)
	elseif CheckBuff(TargetID() , 501774) == true then		-----�t�L2
		SysCastSpellLv( OwnerID() , OwnerID() , 495076 , PLV )
		CancelBuff(TargetID() , 501774)
	elseif CheckBuff(TargetID() , 501775) == true then		-----�t�L3
		SysCastSpellLv( OwnerID() , OwnerID() , 495077 , PLV )
		CancelBuff(TargetID() , 501775)
	end
end
----------------------------------------------------------------------------------------------------------------------------�M�h �t�L�s��
function star_skill_Knight_HolySym()
	if CheckBuff(TargetID() , 501773) == false and
	 CheckBuff(TargetID() , 501774) == false and
	 CheckBuff(TargetID() , 501775) == false then
		AddBuff(TargetID() , 501773 , 0 , -1)
	elseif CheckBuff(TargetID() , 501773) == true and
	 CheckBuff(TargetID() , 501774) == false and
	 CheckBuff(TargetID() , 501775) == false then
		CancelBuff(TargetID() , 501773)
		AddBuff(TargetID() , 501774 , 0 , -1)
	elseif CheckBuff(TargetID() , 501773) == false and
	 CheckBuff(TargetID() , 501774) == true and
	 CheckBuff(TargetID() , 501775) == false then
		CancelBuff(TargetID() , 501774)
		AddBuff(TargetID() , 501775 , 0 , -1)		
	elseif CheckBuff(TargetID() , 501773) == false and
	 CheckBuff(TargetID() , 501774) == false and
	 CheckBuff(TargetID() , 501775) == true then
		CancelBuff(TargetID() , 501775)
		AddBuff(TargetID() , 501775 , 0 , -1)
	end
end
--------------------------------------------------------------------------------------------------------------------------------�M�k35 �j�O�]�O�^�X�s��
function star_skill_KM35_ReMPCheck()
	if CheckBuff(TargetID() , 501773) == true or
	 CheckBuff(TargetID() , 501774) == true or
	 CheckBuff(TargetID() , 501775) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_16]" , 1 )		------�ؼШ��W�S���t�L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end

function star_skill_KM35_ReMP()
	local PLV = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+2 )
	if CheckBuff(TargetID() , 501773) == true then			-----�t�L1
		SysCastSpellLv( OwnerID() , OwnerID() , 495078 , PLV )
		CancelBuff(TargetID() , 501773)
	elseif CheckBuff(TargetID() , 501774) == true then		-----�t�L2
		SysCastSpellLv( OwnerID() , OwnerID() , 495079, PLV )
		CancelBuff(TargetID() , 501774)
	elseif CheckBuff(TargetID() , 501775) == true then		-----�t�L3
		SysCastSpellLv( OwnerID() , OwnerID() , 495080 , PLV )
		CancelBuff(TargetID() , 501775)
	end
end
--------------------------------------------------------------------------------------------------------------------------------�M�h ����s��
function star_skill_Kight_Punish()
	if CheckBuff(TargetID() , 500137) == true or
	 CheckBuff(TargetID() , 500138) == true or
	 CheckBuff(TargetID() , 500139) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_17]" , 1 )		------�ؼШ��W�S�����L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end

function star_skill_Kight_Punish_2(PLV)	-----�ھڥ��L�Ư��]
	local MpSpell = 495102
	SysCastSpellLv( OwnerID() , OwnerID() , MpSpell , PLV ) 	------0�Ŧ�2%�]�O	
end

--------------------------------------���q��������t�C�W�D�H�S��Buff
function lua_Dy_spirit(BUFFID)
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) ---��D�HID
AddBuff( Master , BUFFID , 0 , 900 ) ---���e�קאּ900��
end
--------------------------------------���C50���������B�b+10%�k��
function lua_Dy_IceKnife()
if CheckBuff( OwnerID() , 506317) == false then
	return true
elseif CheckBuff( OwnerID() , 506317) == true then 
	AddBuff( OwnerID() ,506319 ,0 , 3)
	ReCalculate(OwnerID() )
	--say (OwnerID(), "submit")
	return true
	end
end
--------------------------------------����50�R���������𬵵�+20%�ˮ`
function lua_Dy_PW50()
if CheckBuff( OwnerID() , 506351) == false then
		return true
elseif CheckBuff( OwnerID() , 506351) == true then
		AddBuff( OwnerID() ,506353 ,0 , 3)
		ReCalculate(OwnerID() )
		--say (OwnerID(), "submit")
		return true
	end
end	
--------------------------------------���k50 �v¡�N+15%�v���¤O
function lua_Dy_PM50heal()
if CheckBuff( OwnerID() , 506534) == false then
	--say (OwnerID(), "submit")
	return true
elseif CheckBuff( OwnerID() , 506534) == true then 
	AddBuff( OwnerID() ,506535 ,0 , 3)
	ReCalculate(OwnerID() )
	--say (OwnerID(), "submit")
		return true
	end
end
function lua_Dy_PM50dealheal()
CancelBuff(OwnerID() , 506535)
--say (OwnerID() , "O_O")
end	
---------------------------------�������äW���a
function lua_Dy_PRIHideBuff(BUFFID1)
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	AddBuff( Master ,BUFFID1 ,0 , 7)
end
----------------------------�v��50 ��q�ܪ��OCD
function lua_Dy_ENGCD()
	if CheckBuff( TargetID() , 506219) == true then		
		return false
	else
		AddBuff( TargetID(),506219 ,0 ,3 )
		return true
	end
end
function dy_tm15() --�@�r����
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID ) --��X�񳴨����H
	local PLV = ReadRoleValue( Master ,EM_RoleValue_MagicPowerLv_SP+35 )
	--say (Master , "Master")
	SysCastSpellLv( Master , TargetID() , 491444 , PLV )

end