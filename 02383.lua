----------------------------------------------------------------------------------------------------------------------�k�M50 �^�]�ĪG
function lua_Dy_MK50lighthit()
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+51 )     	
		AddBuff( OwnerID() , 503746 , PLevel , -1 )
end
function lua_Dy_testlighthit(Condition)
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+51 )     	
	if Condition == 2 then
		if CheckBuff( OwnerID() , 503541)  == true then
			AddBuff( OwnerID() , 503542 , PLevel , 1)
		return true
	else
		return false
		end	
	end	
end

-------------------------------------------------------------------------------------�˪kLV40 �����@��
function lua_Dy_Protectwm40()		
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	SysCastSpellLv	(MasterGID , MasterGID , 494604 , 0 )
end
--------------------------------------------------------------�˪k40�����@�� �L�k�l��۵M����
function lua_Dy_WM40Check(BuffID)	
	if CheckBuff( OwnerID() , BuffID ) == true or CheckBuff( TargetID() , BuffID ) == true then		
		return false
	else
		return true
	end
end
function lua_Dy_WM40Check2()	
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
		return false
	end
	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )	
	if MypetID ~= 102325 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
		return false
	elseif CheckID( Mypet ) == true then 
		if MypetID == 102325 then
			local skilltable = {501901,509801,504878,509793,503826,509796,503802,509795,505683,509805,505154,507332} --���|��buff
			for i= 1 ,table.getn(skilltable) do
				if checkbuff(TargetID(),skilltable[i]) == true then
					ScriptMessage( OwnerID(), OwnerID() , 1 ,"[SC_BUFFSKILLCHECK]" , 2 )
					return false
				elseif CheckBuff( OwnerID() , 506230 ) == true then		
					return false
				elseif CheckBuff( OwnerID() , 505154 ) == false or
					CheckBuff( OwnerID() , 507332 ) == false then
					return true
				end
			end	
		end			
	end
end
function lua_Dy_WM40DEL()
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
--------------------------------------------------------------------------------------------------------------------�k��50 ���F���k
function Dy_skill_MD65()
	local TriggerBuff = 509916
	local EnergyBuff = 509917
	local ChargeBuff = 509918
	local BurstSpellBuff = 509919
	if CheckBuff(OwnerID() , EnergyBuff) == true then
		AddBuff(OwnerID() , TriggerBuff , 0 , -1)
		local Pos = Lua_BuffPosSearch( OwnerID() , ChargeBuff )
		local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)
		--Say(OwnerID() , PLV)	
		if PLV < 4 then	
			AddBuff(OwnerID() , ChargeBuff , 0 , -1)
		elseif	PLV == 4 then
			AddBuff(OwnerID() , BurstSpellBuff , 0 , -1)
			CancelBuff(OwnerID() , ChargeBuff)
		end	
	end
end
function Dy_skill_MD65_2()
	CancelBuff(OwnerID() , 509919)
	return true
end
----------------------------------------------------------------------------------------------------�P�_���W�w�g����buff�����|+��ܦr�괣��
function un_buffskillcheck()
local skilltable = {501901,509801,504878,509793,503826,509796,503802,509795,505683,509805,505154,507332,
                    501802,509772,503813,509797,505183,509794,500212,503281,503259,501940,506876,500478,
					501114,507227,501995} --���|��buff
local tag = TargetID()
local own = OwnerID()
	for i= 1 ,table.getn(skilltable) do
		if checkbuff(tag,skilltable[i]) == true then
			ScriptMessage( OwnerID(), own , 1 ,"[SC_BUFFSKILLCHECK]" , 2 )
			return false
		end
	end
	return true
end
---------------------------------------------------------------------------------------------------------����޾ɷs�P�_
function lua_un_SkillCheck_NoneSelf() --����޾ɷs�P�_
	local partymember = LuaFunc_PartyData( OwnerID() )
	local InParty = 0	
	for i = 1 , partymember[0] , 1 do
		if TargetID() == partymember[i]  then
			InParty = 1 
		end
	end
	if InParty == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ؼЫD������I
		return false
	elseif ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ؼп��~
		return false
	elseif TargetID() ~= OwnerID() then
		--local x
		--x = un_buffskillcheck()
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ؼп��~
		return false
	end	

end
--------------------------------------------------------------------------------�����@�ҷs�P�_
function un_buffskillcheck1()  --for ����
local skilltable = {501901,509801,504878,509793,503826,509796,503802,509795,505683,509805,505154,507332,
                    501802,509772,503813,509797,505183,509794,500212,503281,503259,501940,506876,500478,
					501114,507227,501995,504536,504580} --���|��buff
local tag = TargetID()
local own = OwnerID()
	for i= 1 ,table.getn(skilltable) do
		if checkbuff(tag,skilltable[i]) == true then
			ScriptMessage( OwnerID(), own , 1 ,"[SC_BUFFSKILLCHECK]" , 2 )
			return false
		end
	end
	return true
end
-------------------------------------------------------------------------------�N���@�޷s�P�_

function un_buffskillcheck2()  --for�N���@��
local skilltable = {500478,501114,501995,507227} --���|��buff
local tag = TargetID()
local own = OwnerID()
	for i= 1 ,table.getn(skilltable) do
		if checkbuff(tag,skilltable[i]) == true or checkbuff(own,skilltable[i]) then
			ScriptMessage( OwnerID(), own , 1 ,"[SC_BUFFSKILLCHECK]" , 2 )
			return false
		end
	end
	return true
end
-------------------------------------------------------------------------------�˪L���̡@���F��֦۰ʩ��d��
function Dy_healMyPet()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+4 )
		SysCastSpellLv	( OwnerID(), MyPet, 497921 , PLevel )		
end
function Dy_healMyPet_2() --��^�ޯ�j�ƪ�
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+4 )
		SysCastSpellLv	( OwnerID(), MyPet, 497922 , PLevel )
end
----------------------------------------------------------------------------------�y�\����cancelbuff
function un_495402_cancelbuff()  --�y�\����cancelbuff
	local own = OwnerID()
	local skilltable = {620144,620141,620142,620143}
	for i=1 , table.getn(skilltable) do
		if checkbuff(own,skilltable[i]) == true then
			CancelBuff_NoEvent(own,skilltable[i])
		end
	end	
end
----------------------------------------------------------------------------------�������Ocancelbuff
function un_498220_cancelbuff()  --�������Ocancelbuff
	local own = OwnerID()
	local skilltable = {620707,620752,620753}
	for i=1 , table.getn(skilltable) do
		if checkbuff(own,skilltable[i]) == true then
			CancelBuff_NoEvent(own,skilltable[i])
		end
	end	
end
--------------------------------------------�s�˯�50����v���ˬd
function Dy_NEWWD_50()
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
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
			return false
		end
	end
end