----------------------------------------------------���q �]�O�ť�
function lua_Dy_MANARUNES()
	GiveBodyItem( OwnerID(), 203607, 1 )
end

function AP_MANARUNES_Check() ---2010-0830�A���e�s�W�I�]�Ŷ��P�_�A�k�N���X
	if EmptyPacketCount( OwnerID() ) >= 1 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
		return false
	end
end
---------------------------------------���q�M�˧ޯ�2 
function lua_Dy_Priset2()
CancelBuff(OwnerID() , 506515)
end
-----------------------------------------���x�˼ƺؤl
function lua_Dy_MathSeed()
local Pos = Lua_BuffPosSearch( OwnerID() , 506518 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	SysCastSpellLv	( BuffOwner, OwnerID(), 495558 , 0 ) 					 ----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
	CancelBuff(OwnerID() , 506518)
	--say (OwnerID(), "+++")
end
function Dy_MathSeed_65()
local Pos = Lua_BuffPosSearch( OwnerID() , 506518 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	SysCastSpellLv	( BuffOwner, OwnerID(), 497852 , 0 ) 					 ----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
	CancelBuff(OwnerID() , 506518)
	--say (OwnerID(), "+++")
end
------------------------------------------------�˪�58LV�M�˧ޯ� �R�b���n
function lua_Dy_DancewithCheck()
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "BUBU")
		return false
	end
local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
	if CheckID( Mypet ) == true then 
		if MypetID == 102324 then
			return true
		elseif MypetID ~= 102324 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_14]" , 1 )
			--say ( Mypet , "BUBUBU")
			return false
		end
	end
end
function lua_Dy_DancewithCK2()
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	SysCastSpellLv( MyPet , MyPet , 495721 , 0 ) 
	--say ( Mypet , "DINDON")
end
------------------------------------------------------------------------�ؼб�������+�T��
function lua_Dy_Skill_ForMobCD(BuffID)		--------���Ǫ��ĪG
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	elseif CheckBuff( TargetID() , BuffID ) == true then
		return false
	else	
		return true
	end
end

function lua_Dy_Skill_ForPlayerCD(BuffID)		---------��缾�a�ĪG
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		if CheckBuff( TargetID() , BuffID ) == true then
			return false
		else
			return true
		end
	else
		return false
	end	
end

-----------------------------------------------Z17 �˪���?�K�I�d���@��
function lua_Dy_Z17WA_NoClick()
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
function lua_Dy_Z17WA()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 507489 , 0 , 5 )
		return true
end
--------------------------------------------------Z17 �C�L�s�@���ͼ@��
function lua_Dy_Z17SC()
	GiveBodyItem( OwnerID(), 212754, 999 )
end
function lua_Dy_Z17SC_DEL()
	local X = CountBodyItem( OwnerID(), 212754 ) 
	DelBodyItem( OwnerID(), 212754, X );
	--say (OwnerID() , "X="..CountBodyItem( OwnerID(), 212754 ))
end
--------------------------------------------------Z17 ���x�A�ͺؤl�@��
function lua_Dy_Z17DRU()
	GiveBodyItem( OwnerID(), 208120, 1 )
end
function lua_Dy_Z17DRU_Check(count)
	local Nature = 503827		----------------�۵M���O
	local FreePower = 503817	--------�j�a�ĦX
	if Checkbuff( OwnerID() , FreePower ) == false then
		if Checkbuff( OwnerID() , Nature ) == true then
			local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
			local NowCount = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )+1
			if NowCount < Count then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_7]" , 1 )
				return false
			elseif NowCount >= Count then
				if EmptyPacketCount( OwnerID() ) >= 1 then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
					return false
				end	
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_7]" , 1 )
			return false
		end
	elseif EmptyPacketCount( OwnerID() ) >= 1 then
		return true
	elseif EmptyPacketCount( OwnerID() ) < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
		return false
	else
		return true
	end
end
----------------------�@�ɾԳ�2.3�M�˧ޯ�ǰe��
----------------------�bzone100�H�U��400���p�Τ~��ϥΧޯ�
----------------------�ޯ�CD10�����A�}�����ɭԦP�ɵ����ͤJ�����ABUFF������s�b3����
function un_zone191_magiccheck() --�ޯ�P�_zone
	local roneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)--Ū���I�񪺤H��zone
	if roneID<=100 then
	return true
	else
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE191_GET]" , 1 ) --�^��false�P�ɸ򪱮a���"�ݭn�b�@��ϰ�H�Τp�Τ~��}��"
	return false
	end
end
function un_zone191_door_open()  --�ХX�ǰe��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door = LuaFunc_CreateObjByObj ( 117210 , OwnerID())
	WriteRoleValue(door,EM_RoleValue_Livetime,180)            --�s�b3����
	SetModeEx(door,EM_SetModeType_NotShowHPMP,false)
	SetModeEx(door,EM_SetModeType_HideName,true)
	WriteRoleValue(door,EM_RoleValue_Register1,0)
	AddToPartition( door, RoomID)
	BeginPlot(door,"zone191_in",0)
end
function zone191_in()  --Ĳ�I�@��
	SetPlot( OwnerID(),"touch","zone191_in_02",30 )
end
function zone191_in_02()  --Ĳ�I�@���ˬd

		if CheckBuff( OwnerID(), 508480 )==true then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
		BeginPlot(TargetID(),"zone191_in",0)
		elseif CheckBuff( OwnerID(), 508428 )==true then
		BeginPlot( OwnerID(), "un_zone191_in", 0 )
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
		BeginPlot(TargetID(),"zone191_in",0)
		end

	sleep(5) --�קK�����I��X�u�ϰ쥼�}��

end
function un_zone191_in() --Ĳ�I���G
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then------------Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 191 , -1 , -2815 , 211 , -15 , 45 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 191 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end

		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 or  PartyInstanceLv( OwnerID() ) == 1 then--Ū������x���׿��
			if ChangeZone( OwnerID() , 191 , -1 , -2815 , 211 , -15 , 45 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 191 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function zone191_Out()
	SetPlot( OwnerID() , "Collision" , "un_zone191_Out" , 0 )
end
function un_zone191_Out()
	if ChangeZone( OwnerID() , 2 , 0, 4936 , 115 , -2228 , 240 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
--*****************************************************************************************************************
                                            --�H�U���@�ɾԳ�3
--*****************************************************************************************************************
function un_zone192_magiccheck() --�ޯ�P�_zone
	local roneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)--Ū���I�񪺤H��zone
	if roneID<=100 then
	return true
	else
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE191_GET]" , 1 ) --�^��false�P�ɸ򪱮a���"�ݭn�b�@��ϰ�H�Τp�Τ~��}��"
	return false
	end
end
function un_zone192_door_open()  --�ХX�ǰe��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door = LuaFunc_CreateObjByObj ( 117209 , OwnerID())
	WriteRoleValue(door,EM_RoleValue_Livetime,180)            --�s�b3����
	SetModeEx(door,EM_SetModeType_NotShowHPMP,false)
	SetModeEx(door,EM_SetModeType_HideName,true)
	AddToPartition( door, RoomID)
	WriteRoleValue(door,EM_RoleValue_Register1,0)
	BeginPlot(door,"zone192_in",0)
end
function zone192_in()  --Ĳ�I�@��
	SetPlot( OwnerID(),"touch","zone192_in_02",30 )
end
function zone192_in_02()  --Ĳ�I�@���ˬd
		if CheckBuff( OwnerID(), 508480 )==true then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
			BeginPlot(TargetID(),"zone192_in",0)
		elseif CheckBuff( OwnerID(), 508431 )==true then
			BeginPlot( OwnerID(), "un_zone192_in", 0 )
		else
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
			BeginPlot(TargetID(),"zone192_in",0)
		end
	sleep(5)--�קK�����I��X�u�ϰ쥼�}��
end
function un_zone192_in() --�I�����G
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then------------Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 192 , -1 , 2273 , -6 , -2371 , 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 192 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 or  PartyInstanceLv( OwnerID() ) == 1 then--Ū������x���׿��
			if ChangeZone( OwnerID() , 192 , -1 , 2273 , -6 , -2371 , 180 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 192 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function zone192_Out()
	SetPlot( OwnerID() , "Collision" , "un_zone192_Out" , 0 )
end
function un_zone192_Out()
	if ChangeZone( OwnerID() , 6 , 0, -23232 ,-260 , 4726 , 57 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end											
-----------------------65�v��̮M�˧ޯ�_�����
function lua_Dy_Z19THI()
	sysCastSpellLV( OwnerID() , TargetID() , 497133 , 0 )
end
function lua_Dy_Z19THI_check()
	if Checkbuff ( TargetID() , 508530 ) ==  true then
		return false
	elseif Checkbuff ( TargetID() , 508530 ) ==  false then
		return true
	end
end

---------------------- 65�˪L���̮M�˧ޯ�_�~�F�k 
function Dy_Z19WARDEN()
	if Checkbuff( TargetID() , 508639 ) == false then
		AddBuff( OwnerID() , 508639 , 0 , 25 )
	end
end
function Dy_Z19WARDEN_2() --�W�ۤv�ܦϤ���
	if Checkbuff( OwnerID() , 508639 ) == true or Checkbuff( OwnerID() , 508638 ) == true then
		
	elseif Checkbuff( OwnerID() , 508639 ) == false or Checkbuff( OwnerID() , 508638 ) == false then	
		AddBuff( OwnerID() , 508638 , 0 , 10 )
	end
end
function Dy_Z19WARDEN_Check() -- 65�˪L���̮M�˧ޯ�_�~�F�k
	if Checkbuff( OwnerID() , 508639 ) == true or Checkbuff( OwnerID() , 508638 ) == true then
		return false
	elseif Checkbuff( OwnerID() , 508639 ) == true or Checkbuff( OwnerID() , 508638 ) == true then
		return true
	end
end		
-------------------65�k�v�M�˧ޯ�_�]�N����
function Dy_Z19mag() ---�k�v�M�˧ޯ�_�]�N�����G��@��
	local Buff_1 = 508534
	local Buff_2 = 508539
	local Chose = Rand(100)+1
	if Chose <= 100 and Chose >= 80 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 79 and Chose >= 60 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 59 and Chose >= 40 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 39 and Chose >= 20 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 19 and Chose >= 10 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)	
	elseif Chose <= 9 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)	
	end
end																						
----------------------------------------------------65�M�˧ޯ�_���q_�]�N�v���v�� 
function Dy_Z19aug()
	GiveBodyItem( OwnerID(), 205730, 1 )
end

function Dy_Z19aug_Check() --65�M�˧ޯ�_���q_�]�N�v���v�� �I�]�ˬd
	if EmptyPacketCount( OwnerID() ) >= 1 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
		return false
	end
end	
-----------------------------------------------67�M�˧ޯ�_�˪�_�٦�
function Dy_Z20WARDEN()
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( MyPet ) == true then
		if Checkbuff( MyPet , 620125 ) == true or Checkbuff( MyPet , 620120 ) == true then --�d�����W���T��P�䴩�ĪG��
			SysCastSpellLv	( OwnerID(), MyPet, 497793 , 0 ) ---�I��^��
		elseif Checkbuff( MyPet , 620125 ) == false and Checkbuff( MyPet , 620120 ) == false then
			SysCastSpellLv	( OwnerID(), MyPet, 497793 , 0 ) ---�I��^��
			AddBuff (MyPet , 620120 , 0 , 20) --�W�䴩
		end
	elseif CheckID( MyPet ) == true then
	end
end
--------------------------------------------------Z21 70�C�L�d�Ф��v�@��
function lua_Dy_Z21SC()
	GiveBodyItem( OwnerID(), 213620, 999 )
end
function lua_Dy_Z21SC_DEL()
	local X = CountBodyItem( OwnerID(), 213620 ) 
	DelBodyItem( OwnerID(), 213620, X );
	--say (OwnerID() , "X="..CountBodyItem( OwnerID(), 212754 ))
end					
-----------------------------------------Z21 70���x�˼ƺؤl2
function Dy_MathSeed_70()
local Pos = Lua_BuffPosSearch( OwnerID() , 620970 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	--SysCastSpellLv	( BuffOwner, OwnerID(), 498377 , 0 ) 					 ----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
	--CancelBuff(OwnerID() , 620970)
	SysCastSpellLv	( OwnerID() , OwnerID(), 498377 , 0 ) 					 ----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
	SysCastSpellLv	( OwnerID() , OwnerID(), 498387 , 0 ) 					 ----------------------------�I��k�N (��k�N���H , �k�N�ؼ� , �k�N�s�� , �k�N����)
	--say (OwnerID(), "+++")
end
--����Z23�ϰ조��
-------------------------------------Z23 73 �k�v�M�˧ޯ�_��Z�i�D�����w
function Dy_Z23mag() ---�k�v�M�˧ޯ�_��Z�i�D�����w�T��@��
	local Buff_1 = 622434 --��
	local Buff_2 = 622435 --��
	local Buff_3 = 622436 --�a
	local Chose = Rand(100)+1
	if Chose <= 100 and Chose >= 80 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 79 and Chose >= 60 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 59 and Chose >= 40 then
		AddBuff (OwnerID() , Buff_3 , 0 , 10)
	elseif Chose <= 39 and Chose >= 20 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 19 and Chose >= 10 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)	
	elseif Chose <= 9 then
		AddBuff (OwnerID() , Buff_3 , 0 , 10)	
	end
end	
function Dy_clearbuff(Buff1,Buff2,Buff3)  --BUFF�ˬd�s�b�Y�R���ۤv���@��
	if CheckBuff( OwnerID() , Buff1) == true then
		Cancelbuff(OwnerID(),Buff1)
	end
	if CheckBuff( OwnerID() , Buff2) == true then
		Cancelbuff(OwnerID(),Buff2)
	end
	if CheckBuff( OwnerID() , Buff3) == true then
		Cancelbuff(OwnerID(),Buff3)
	end
end