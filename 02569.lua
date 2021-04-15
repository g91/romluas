--�ޯ�

function Lua_na_11xmas_warmbuff()  --�ŷx�u�@BUFF
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local Player = ReadRoleValue( T_ID , EM_RoleValue_IsPlayer )

	if Player == 1 then
		local Count = BuffCount ( T_ID )		-- Ū�����a���W���Ҧ��k�N�ƶq
		for i = 0 , Count do
			local BuffID = BuffInfo ( T_ID , i , EM_BuffInfoType_BuffID )		-- Ū�����a���W���k�NID
			if BuffID == 621897 then
				local BuffLv = BuffInfo (  T_ID , i , EM_BuffInfoType_Power )
				if BuffLv >= 2 then
					CancelBuff( T_ID , 621897 )
					AddBuff ( T_ID , 621897 , BuffLv - 1 , 120 )
				elseif BuffLv == 1 then
					CancelBuff( T_ID , 621897 )
					AddBuff ( T_ID ,621897 , 0 , -1 )
				else
					CancelBuff( T_ID , 621897 )	
				end	
				break
			end
		end
		return true 
	else
		return false
	end				
end


function Lua_na_11xmas_coldbuff() --�H�N��
	local O_ID = OwnerID()
	while true do  --���ʵ������e�A �C3��I��@���H�NBUFF 
		SysCastSpellLv( O_ID , O_ID , 498902, 0 )
	--	say( O_ID , " COLD")
		sleep(30)
	end
end



function Lua_na_11xmas_saintfire_CHECK()  --�ˬd��H�O�_�i�H�ǻ��t�K
	local Owner = OwnerID()
	local Target = TargetID()

	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==1  then  -- �ؼЬO���a
		if CheckBuff( Target , 621727 ) == true then --�p�G�ؼЪ��a���W��"�ݯd���t�K"�ABUFF����ɶ����L�k�����Ϫ�
			ScriptMessage( Owner, Owner ,  1 , "[SC_2011XMAS_04]" , 0) --�ؼй�H���W���ݯd���t�K�A�ȮɵL�k���������Ϫ�
			ScriptMessage( Owner , Owner ,  0 , "[SC_2011XMAS_04]" , 0) --�ؼй�H���W���ݯd���t�K�A�ȮɵL�k���������Ϫ�	
			return false
		elseif Owner ~= Target and CheckBuff ( Target , 621731) == true and  CheckBuff ( Target , 621715) == false then --�p�G�ؼЪ��a�֦��U�����ޯ�άO�ؼЬ�BOSS
			return true
			
		else --��L���i�Ҫ����p
			ScriptMessage( Owner, Owner ,  1 ,"[ SC_204425_1]" , 0 ) --�ؼФ����T
			return false
		end
	elseif ReadRoleValue( Target , EM_RoleValue_OrgID ) == 106539 then
		return true
	else
		return false
	end
end


function Lua_na_11xmas_saintfire_CHECK1()  --�ˬd��H�O�_�i�H�ǻ��t�K
	local Owner = OwnerID()
	local Target = TargetID()

	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==1  then -- �ؼЬO���a
		return true
	else
		return false
	end
end
--
--
--
function Lua_na_11xmas_saintfire_CHECK2()  --�ˬd��H�O�_��Boss
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ==106539 then --�p�G�ؼЬO��
		return true
	else --��L���i�Ҫ����p
		return false
	end
end


		
function Lua_na_11xmas_saintfire_change()  --�t�K�ǻ�
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local O_score = ReadRoleValue( O_ID , EM_RoleValue_Register2 )
	local T_score = ReadRoleValue( T_ID , EM_RoleValue_Register2 )
--	CastSpell(  O_ID  , T_ID  , 498909 ) --��ؼЬI��t�K�ǻ����ޯ�
	AddBuff(  O_ID  , 621731 , 0 , -1 ) --�o��U��BUFF�A�����t�K�Ϫ�
	AddBuff(  O_ID  , 621727, 0 , 90) --�o��ݯd���t�K

	local CountHateList_Mob = HateListCount(StormMan)
	local HatePos_Scout = -1	
	for j=0 , CountHateList_Mob-1 do
		if HateListInfo( StormMan , j , EM_HateListInfoType_GItemID ) == O_ID then
			HateValue1 = HateListInfo( StormMan , j , EM_HateListInfoType_HatePoint)
			HatePos_Scout = j			
		end	
	end
	if ( HatePos_Scout > -1 ) then	--�Y�O�]�w����ȥؼФ��s�b	
		SetHateListPoint( StormMan , HatePos_Scout , 0 )
	end

	AddBuff ( T_ID , 621729 , 0 , 60) --�����ؼиt�K
	AddRoleValue( T_ID , EM_RoleValue_Register2 , 10 )
	local newscore = ReadRoleValue ( T_ID, EM_RoleValue_Register2)
	CancelBuff( T_ID , 621897 ) --�R���ؼШ��W���H�N��
--	local StormMan = LuaFunc_SearchNPCbyOrgID( O_ID , 106539  ,1400 , 0 )
	SysCastSpellLv( T_ID , StormMan , 498905 , 1 )
	SetAttack( StormMan , T_ID )
end


function Lua_na_11xmas_saintfire_attack()  --�ﳷ�H�I��J��	
	local O_ID = OwnerID() --�e���t�K�Ϫ�
	local T_ID = TargetID() --�������t�K�Ϫ�
--	local StormMan = LuaFunc_SearchNPCbyOrgID( O_ID , 106539  ,1400 , 0 )
	CastSpell( T_ID , StormMan , 498905 )
end


--���a�ϥ��I���ޯ�
function Lua_na_11xmas_fire_check()--�U���ޯ��ˬd�ؼ�
	local Owner = OwnerID()
	local Target = TargetID()
	local score = ReadRoleValue ( Owner , EM_RoleValue_Register2 )
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )
	local wood =  120083--�����
	local Boss = 106539

	if OrgID == wood then -- �Y�ؼЬ����ꪺ�����: ����k�N
		return true
	elseif ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==1 and CheckBuff ( Target , 621715) ==true then --�I����H�O���a�A�B���W���B�᪺���A
		if Target == Owner then
			ScriptMessage( Owner , Owner  ,  1 , "[SC_2011XMAS_15]" , C_SYSTEM )  --���ޯ�L�k��ۤv�ϥΡI
			ScriptMessage( Owner , Owner , 0 , "[SC_2011XMAS_15]" , 0 ) --���ޯ�L�k��ۤv�ϥΡI	
		else
			CancelBuff( Target , 621715) --�R���N�᪬�A
			AddRoleValue ( Owner , EM_RoleValue_Register2, 10 ) -- 1���U�ؼй�H�ѭ�A�b���a���W�O����+10
		end
		return false
	elseif OrgID == Boss then --�p�G�ؼЬO�ɭ����H
		ScriptMessage( Owner , Owner  ,  1 , "[SC_204425_1]" , C_SYSTEM ) --�ؼФ����T
		ScriptMessage( Owner , Owner , 0 , "[SC_204425_1]" , 0 )	--�ؼФ����T
		return false
	elseif Target == Owner then
		ScriptMessage( Owner , Owner  ,  1 , "[SC_2011XMAS_15]" , C_SYSTEM )  --���ޯ�L�k��ۤv�ϥΡI
		ScriptMessage( Owner , Owner , 0 , "[SC_2011XMAS_15]" , 0 ) --���ޯ�L�k��ۤv�ϥΡI
		return false	
	end

end



function Lua_na_11xmas_fire()-- �U��
	local Owner = OwnerID()
	local Target = TargetID()
	local score = ReadRoleValue ( Owner , EM_RoleValue_Register2 )
	sleep(10)
	ChangeObjID( Target , 120084 )  -- �ഫ�����������A	
	AddRoleValue ( Owner , EM_RoleValue_Register2, 5 ) -- �b���a���W�O����+5
	local newscore = ReadRoleValue ( Owner  , EM_RoleValue_Register2 ) --�̷s����
--	say( Owner, newscore)
end



----�p���������ˮ`�P�_
function Lua_na_11xmas_checkboss()  --�ˬd�ؼЬO�_����
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local OrgID = ReadRoleValue( T_ID , EM_RoleValue_OrgID )
	if OrgID  == 106539 then --�p�G�ؼЬO��
		if CheckBuff( T_ID , 621724 ) == true then --�p�G�����W���ɳ��@��
			BeginPlot ( O_ID , "Lua_na_11xmas_delfire", 0 ) --�R������
			CancelBuff( T_ID , 621724 )  --�R���@��
			return false --�����H�ˮ`
		else --�S���@��
			BeginPlot ( O_ID , "Lua_na_11xmas_delfire" , 0 ) --�R������
			return true --�����ˮ`
		end
	else
		return false --�D���a�A�����H�ˮ`
	end				
end


function Lua_na_11xmas_delfire()  --����y���ˮ`�������áA�ഫ���L�������A�A�����
	local Owner = OwnerID()
--	Hide( Owner)
	SetDefIdleMotion( Owner , 242 ) 	
	Hide( Owner)
	sleep(300)
	ChangeObjID( Owner , 120083 )  -- �ഫ�����������A
	Show( Owner , 0)			
end

-----

function Lua_na_11xmas_checkcold() --����|�[��19�h
	local Owner = OwnerID()
	local Target = TargetID()
 	local Count = BuffCount ( Target )		-- Ū�����a���W���Ҧ��k�N�ƶq
--	Say( Target , "Hello")
	if CheckBuff ( Target , 621713 ) == true then --�ŷx�u�@
		return false	
	else
		return true
	end				
end


function Lua_na_11xmas_checkcold1() --����|�[��19�h
	local Owner = OwnerID()
	local Target = TargetID()
 	local Count = BuffCount ( Target) -- Ū�����a���W���Ҧ��k�N�ƶq
	if  CheckBuff( Target , 621715) == true or CheckBuff( Target , 621729) == true then --�p�G���B��B�t�K�Ϫ̡A�������|�[�H�N��
		return false
	elseif CheckBuff( Target , 621897 ) == true then 
		for i = 0 , Count do
			local BuffID = BuffInfo (  Target , i , EM_BuffInfoType_BuffID )	--Ū�����a���W���k�NID
			if BuffID == 621897 then
				local BuffLv = BuffInfo ( Target, i , EM_BuffInfoType_Power )
				if BuffLv < 18 then 			
					AddBuff( Target , 621897 , 0 , 120 )
				elseif  BuffLv ==18 then
					CancelBuff( Target, 621897)
					AddBuff( Target , 621715 , 0 ,10 ) --0��1�h�A2��2�h
				end
			end
		end
	else
		AddBuff( Target , 621897 , 0 , 120 )
	end				
end

--function Lua_na_11xmas_checkcold2() -- �I��B��BUFF�e���ˬd
--	local T_ID = TargetID()
--	local Count = BuffCount ( T_ID )		-- Ū�����a���W���Ҧ��k�N�ƶq
--	if CheckBuff (T_ID , 621713 ) == true then
--		return false
--	else
--		for i = 0 , Count do
--			local BuffID = BuffInfo (  T_ID , i , EM_BuffInfoType_BuffID )		-- Ū�����a���W���k�NID
--			if BuffID == 621897 then
--				local BuffLv = BuffInfo (  T_ID , i , EM_BuffInfoType_Power )
--				if BuffLv <19  then 		
--					return false
--				elseif  BuffLv ==19 then
--					CancelBuff( T_ID , 621897 )
--					return true
--				end
--			elseif BuffID == 621715 or BuffID == 621729 then --�p�G���B��B�t�K�Ϫ̡B�ŷx�u�@�A���|Ĳ�o�B��
--				return false
--			end
--		end
--	end				
--end
--


function Lua_na_11xmas_clearReg()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_RoleValue_Register2 , 0 )
--	local Reg = ReadRoleValue( Owner , EM_RoleValue_Register2 )
--	Say( Owner , "Reg = "..Reg )
end


----------------
--�ɭ����H��l�@��
--�B�������@��
function Lua_na_stormborn() --�ɭ����H�A�@������L��
	Addbuff(OwnerID(), 508060,0, -1) 
	BeginPlot( OwnerID(), "Lua_na_storm_attack",0)
end

function Lua_na_storm_attack()
	local Owner = OwnerID()

	while true do
	local attack = ReadRoleValue( Owner , EM_RoleValue_IsAttackMode )           --�P�_�O�_�i�J�԰� 1= �O 0= �_
	local random= Rand(15)
	local NowHP = ReadRoleValue( Owner , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then
			local ran1 = Rand(3)
			if ran1 < 1 then
				say( Owner, "[SC_STORMSPEAK_02]") --�����I�ڭn�������I�I
			end
			if  X > 50 then
				PlayMotion( Owner, 31 )
				sleep(20)
				CastSpell( Owner, Owner, 498970) --��������
				sleep(50)

			elseif X <=50 and X >=30 then
				if random <5 then --5/15
					local ran2 = Rand(3)
					if ran2 <=1 then
						say( Owner, "[SC_STORMSPEAK_02]") --�����I�ڭn�������I�I
					end
					PlayMotion( Owner, 31 )
					sleep(20)
					CastSpell( Owner , Owner, 498970) --��������
					sleep(50)
				else	
					PlayMotion( Owner , 31 )
					sleep(20)
					say( Owner , "[SC_STORMSPEAK_01]") --�B������ڧ��j�I�I�I
					CastSpell( Owner, Owner, 498969) --�ɳ��@��
					sleep(50)
				end
			elseif X < 30 then --���H����q�C��30%
				if random <=2 then -- 2/15
					Say( Owner , "[SC_STORMSPEAK_03]" ) --�n��......�n���r�I�ڻݭn�@�ǧN�Ů�I
					PlayMotion(  Owner , 60)
					CastSpell( Owner, Owner , 498972) --�N����¶

				elseif random >3 and random <10 then -- 8/15
					say( Owner , "[SC_STORMSPEAK_04]") -- �ƷȷȡI���B���a���ƷȷȡI
					PlayMotion( Owner , 51 )
					sleep(20)
					CastSpell( Owner , Owner, 498971) --�}���Ʒȷ�
					sleep(50)
				else
					PlayMotion( Owner , 31 )
					sleep(20)
					say( Owner , "[SC_STORMSPEAK_01]") --�B������ڧ��j�I�I�I
					CastSpell(  Owner , Owner , 498969) --�ɳ��@��
					sleep(50)
				end
			end
		end
	sleep(100)
	end
end


function Lua_na_Fireskill() --�ɭ����H���ޯ�
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_OrgID) == 120084 then
		BeginPlot( Target ,"Lua_na_11xmas_delfire" , 0 )
	end
end