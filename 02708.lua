--�Ԥh
function lua_bico_warr_ro_es_70()    --���a�{�ͧP�_�禡         
	local own = OwnerID()
	if CheckBuff( own , 622950 ) == true then
		return true
	else
		return false
	end
end

function lua_bico_warr_ward_es_70() --���Z�B�M�P�_�禡
	local tar = TargetID()  --�ǥ���
	local own = OwnerID()
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --�ѾlHP�ʤ���
	if nowhp<30 then
		--Say(own,"1")  --�p�G�ؼЦ�q<30,��Ĳ�o�k�N,���a�|say"1"
		return true
	else
		--Say(own,"2")  --�p�G�ؼЦ�q>30,�LĲ�o�k�N,���a�|say"2"
		return false
	end
end

function lua_bico_secondhandcheck_shield( )--GUID==�ؼ�   Type=�˳Ʀ�m 16=�Ƥ�  (�P�_����˳���쪫�~)
	local own = OwnerID()
	local DBID = GetItemInfo ( own , EM_ItemPacketType_EQ , 16 , 0 )
	local DBTYPE = GameObjInfo_Int( DBID , "ArmorType" )
	if DBTYPE == 5 then
		return true
	else
		return false
	end
end

function lua_bico_warr_knight_es_60() --�t�F����޵P���P�_
	local own = OwnerID()
	if lua_bico_secondhandcheck_shield() == true then
	--Say(own,"1")
		return true
	else
	--Say(own,"2")
		return false
	end
end

--���q
function lua_bico_pri_sco_es_60() --���������d��ɦ�(�t�άI�k)
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+9 )
	local tar_X = ReadRoleValue( tar , EM_RoleValue_X )
	local tar_Y = ReadRoleValue( tar , EM_RoleValue_Y )
	local tar_Z = ReadRoleValue( tar , EM_RoleValue_Z )
	--sysCastSpelllv ( own , tar , 499964 , powerLV )
	SysCastSpellLv_Pos ( own , tar_X , tar_Y , tar_Z , 499964 , powerLV ) 
end

function lua_bico_pri_sco_es_70() --��¡�b���o
	local own = OwnerID()
	KS_ResetColdown( own , 492636 , 0 )
end

function lua_bico_pri_ro_es_60_1() --�r�D�A�G���mCD��
local own = OwnerID()
local Pos = Lua_BuffPosSearch( own , 623030 )                      ---------------------��X���W���k�N�N��
local BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
local x = DW_rand(2) --50%���vĲ�o
	if x == 1 then
		addbuff(BuffOwner,623038,0,-1)
		SetFlag(BuffOwner,546866,1) --���v���N���o�X��
	end
end

function lua_bico_pri_ro_es_60_4() --�v���q�[��buff
	local own = OwnerID()
	addbuff(own,623007,0,2)
	return true
end

function lua_bico_pri_ro_es_60_3() --�v¡�N���o �R���X��
	local own = OwnerID()
	SetFlag( own, 546866, 0 )
	CancelBuff( own, 623038 )
end

function lua_bico_pri_ro_es_60_2() 
	local own = OwnerID()
	SetFlag( own, 546866, 0 )
	CancelBuff( own, 623007 )
	return true
end

function lua_bico_holuikencheck()
	local own = OwnerID()
	local tar = TargetID()
	if CheckBuff(tar,623001) == true or 
	CheckBuff(tar,623050) == true then
	--Say(own,"false")
	return false
	else
	--Say(own,"true")
	return true
	end
end

--���x

function lua_bico_dru_warr_es_60() --�Q�r��ƥ����@�Ψ禡(��ƾԪk)
	local own = OwnerID()
	local plv = FN_CountBuffLevel(own,623080)
	if  CheckFlag(own,546833) == true then --�ˬd�ۤv���W�O�_����ƾԪk��keyitem
		if	plv == 4	then
			addbuff(own,623080,plv,15)
		else
			cancelbuff(own,623080) --�ncancel���@��,�~�|1.2.3.4~�|�W�h
			addbuff(own,623080,plv+1,15)
		end
	else
	return true
	end
end

function Lua_Skill499935_main()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+32 )
	local BuffTable = {623109, 623111, 623115}
	--say(OwnerID(),"powerLV = "..powerLV)
	if Lua_PercentHP(tar)<50 then
		for i=1,table.getn(BuffTable) do
			CancelBuff(tar, BuffTable[i])
		end
		--AddBuff(tar, 623115, powerLV, 6)
		sysCastSpellLv(own,tar,499654,powerLV)
		return false
	end
	if CheckBuff( tar, 503753 ) == true then
		return false
	end 
	return true
end

function Lua_Skill499935_main_fixPet()	--�ư��|�ɭP���q�d��"���æۧ�"�������D
	if CheckBuff( TargetID() , 503753 ) == true then
		return false
	else
		return true
	end
end


function lua_bico_dru_mag_es_70()    --�F�P�ܲ{�P�_�禡         
	local own = OwnerID()
	if CheckBuff( own , 505163 ) == true then
		return true
	else
		return false
	end
end

function star_skill_DM50_bico()  --���L���O�d��k�N
	local SummerBuff = 623141
	local SummerPowerBuff = 499932
	local Pos = Lua_BuffPosSearch( OwnerID() , SummerBuff )
	local BuffOwner = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_OwnerID)
	local own = OwnerID()
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	if GetDistance( OwnerID() , BuffOwner ) < 500 then
		if ReadRoleValue(OwnerID() , EM_RoleValue_ParryState) == 1 then
			SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , SummerPowerBuff  , 0 ) 
		end
	end	
end

function lua_bico_dru_warr_es_60_heal() --����60�d��v��
	local own = OwnerID()
	local BuffOwner 

	if CheckBuff(own, 623124) == true then
		local Pos = Lua_BuffPosSearch( own , 623124 )                      		--��X���W���k�N�N�� 
		BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )	--��X���k�N�O�֩�
		local powerLV = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+77 )
		sysCastSpellLv(BuffOwner,own,499939,powerLV)
	elseif CheckBuff(own, 623126) == true then
		BuffOwner = own
		local powerLV = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+77 )
		sysCastSpellLv(BuffOwner,own,499939,powerLV)
	end
	
--	local powerLV = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+77 )
--	--
--	--if powerLV ~= 0 then
--		sysCastSpellLv(BuffOwner,own,499939,powerLV)
--	--end
end

function lua_bico_dru_ward_es_70()   --����70�d��v��
	local	own = OwnerID()
	local	plv = FN_CountBuffLevel(own,503827)
			--Cl_Read_BuffLv( ObjID , BuffID , Value ) --0=BUFF���� , 1=BUFF�I�i��
			sysCastSpellLv(own,own,499937,plv)
			CancelBuff( own, 503827 )
end

function lua_bico_dru_ward_es_70_1()    --����߰ʧP�_�禡         
	local own = OwnerID()
	if CheckBuff( own , 503827 ) == true then
		return true
	else
		return false
	end
end

--�M�h

function lua_bico_kni_warr_es_70_1(PLV)	-----�ھڥ��L�Ư��]70�ź�^�ޯ�ץ����]�q
	local MpSpell = 499927
	SysCastSpellLv( OwnerID() , OwnerID() , MpSpell , PLV ) 	------0�Ŧ�1%�]�O	
end


function lua_bico_kni_sco_es_60()
	local race = ReadRoleValue( TargetID() , EM_RoleValue_Race ) 
   	if Race == 5  then                    -----����
		return true
	elseif Race == 12  then	              -----�c�]
		return true	
	else
		return false
	end	
end

function lua_bico_kni_sco_es_70() --�大��������ˮ`
	local own = OwnerID()
	if CheckBuff(TargetID() , 500137) == true or
	 CheckBuff(TargetID() , 500138) == true or
	 CheckBuff(TargetID() , 500139) == true then
		if CheckBuff( own , 500871 ) == true then
		Addbuff (own,623168,0,-1)   --�W��buff
		end
	 return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_17]" , 1 )		------�ؼШ��W�S�����L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end

function lua_bico_kni_sco_es_70_bloodcheck() --�大��������W��buff
	local own = OwnerID()
	CancelBuff( own , 623168 )
end

function lua_bico_kni_sco_es_70_blood() --��b�ˬd
	local own = OwnerID()
	if  CheckBuff( own , 500871 ) == false then 
		CancelBuff( own , 623167 )
	end
end

function lua_bico_kni_rag_es_70() --�y�\���୰CD
	local own = OwnerID()
	KS_ResetColdown( own , 495402 , 10 )
end

function lua_bico_kni_pri_es_70()
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+72 )
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499911 , powerLV ) 
end



function lua_bico_kni_pri_es_15()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+50 )
	if  CheckBuff(tar, 623188) == false and
		CheckBuff(tar, 623189) == false and
		CheckBuff(tar, 623190) == false then
		SysCastSpellLv( own , tar , 499880 , powerLV )
	elseif CheckBuff(tar, 623188) == true and
		CheckBuff(tar, 623189) == false and
		CheckBuff(tar, 623190) == false then
		CancelBuff(tar, 623188)
		SysCastSpellLv( own , tar , 499881 , powerLV )
	elseif CheckBuff(tar , 623188) == false and
		CheckBuff(tar , 623189) == true and
		CheckBuff(tar, 623190) == false then
		CancelBuff(tar, 623189)
		SysCastSpellLv( own , tar , 499882 , powerLV )
	elseif CheckBuff(tar, 623188) == false and
		CheckBuff(tar, 623189) == false and
		CheckBuff(tar, 623190) == true then
		CancelBuff(tar, 623190)
		SysCastSpellLv( own , tar , 499882 , powerLV )
	end
end


function lua_bico_kni_pri_es_20() --���t����
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+51 )
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	if	CheckBuff( tar , 623188 ) == true then
	CancelBuff( tar , 623188 )
	sysCastSpelllv ( own , own , 499904 , powerLV )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499907 , powerLV )
	end
	if	CheckBuff( tar , 623189 ) == true then
	CancelBuff( tar , 623189 )
	sysCastSpelllv ( own , own , 499905 , powerLV )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499908 , powerLV )
	end
	if	CheckBuff( tar , 623190 ) == true then
	CancelBuff( tar , 623190 )
	sysCastSpelllv ( own , own , 499906 , powerLV )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499890 , powerLV )
	end
end

function lua_bico_kni_warr_es_70_2()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+64 )
	Addbuff(own,623155,powerLV,-1)
end

function lua_bico_kni_warr_es_70_3()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+64 )
	Addbuff(own,623234,powerLV,-1)
end

function lua_bico_kni_warr_es_70_4()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+64 )
	Addbuff(own,623235,powerLV,-1)
end

--�˪L����

function lua_bico_ward_warr_es_70()
	local own = OwnerID()
	local tar = TargetID()
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	if CheckBuff(own,623248) == true then
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499901 , 0 ) 
	end
end

function lua_bico_ward_mage_es_60()
	local own = OwnerID()
	--KS_ResetColdown( own , 493347 , 5 )
	Lua_CDtime_set(own,493347,-5)
end

function lua_bico_ward_mage_es_70() --�˪k�g�����-�٤O�z�o
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+22 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 623265 , PLevel, 30 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		--say (OwnerID(), "PLevel ="..PLevel )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end

function lua_bico_ward_dri_es_70()
	local own = OwnerID()
	KS_ResetColdown( own , 499885 , 5 )
end

function bico_check()    --�ˬd��
	local own = OwnerID()
	say(own,"1")
end


function un_499482() --�ժ����P������
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
	
	SetModeEx(OwnerID(),EM_SetModeType_Mark, false)
	AddBuff (OwnerID() , 507186 , (ATK*0.05) , -1)
	AddBuff (OwnerID() , 507190 , (DMG*0.08) , -1)
local own = OwnerID()
addbuff(own,623024,0,20)
	while 1 do
		CastSpellLV(own,own,499503,0)
		sleep(20)
	end
end

--�F���
function bico_623416_cooldown()
	local own = OwnerID()
	--say(own,"hi")
	KS_ResetColdown( own , 498739 , 0 )
end

function bico_623419_cooldown()
	local own = OwnerID()
	--say(own,"hi")
	KS_ResetColdown( own , 498742 , 3 )
end

--�ԦK
function bico_623422_bloodact()
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+111 )
	sysCastSpelllv ( own , own , 499821 , powerLV )
end

--�v�F
function bico_499803_check() --lv60�F����ˬd
	local own = OwnerID()
	if Checkbuff(own,621568) == false then
	Cancelbuff(own,623424)
	end
end

function bico_RangeSkill_623430() --�g�b����--�۹��60�Ū���^�ޯ�
	local own = OwnerID()
	local tar = TargetID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local monster = LuaFunc_CreateObjByObj ( 106517 , tar )
	--local master =ReadRoleValue(own,EM_RoleValue_register3)
	local skilllv = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+88 )
	--local table = {498826,498830,498837,498828,499816}	
	--for i = 1 , #(table) do
		--KS_ResetColdown( own , table[i] , 5 )
	--end	
	WriteRoleValue(monster,EM_RoleValue_register2,tar)
	WriteRoleValue(monster,EM_RoleValue_register3,own)
	addbuff(monster,621602,0,-1) 					   --�����buff
	WriteRoleValue(monster,EM_RoleValue_register1,tar) --�ؼмg������
	WriteRoleValue(monster,EM_RoleValue_Livetime,4)
		SetModeEx(monster,EM_SetModeType_Mark,true)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, true) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
	AddToPartition( monster, RoomID)
	Beginplot(monster,"bico_RangeSkill_623430_1",0)
end

function bico_RangeSkill_623430_1() --�g�b����1--�۹��60�Ū���^�ޯ�
	local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_register1)
	local master =ReadRoleValue(own,EM_RoleValue_register3)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+88 )
	--local table = {498826,498830,498837,498828,499816}	
	--for i = 1 , #(table) do
	--	KS_ResetColdown( master , table[i] , 5 )
	--end	
	while 1 do
		sleep(10)
		SysCastSpellLv(own,tar,498827,skilllv)
	end
end

function bico_RangeSkill_623428()--�B�E����
	local own = OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )-- ���D�H
	local x = ReadRoleValue(own,EM_RoleValue_X)
	local y = ReadRoleValue(own,EM_RoleValue_Y)
	local z = ReadRoleValue(own,EM_RoleValue_Z)
	local monster = CreateObj ( 106524 , x , y , z, 0 , 1)
	--local monster = LuaFunc_CreateObjByObj ( 106524 , own ) 
		SetModeEx(monster,EM_SetModeType_Mark,false)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, false) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,true)           ---����ܦ��
	AddToPartition(monster,RoomID)
	WriteRoleValue(monster,EM_RoleValue_register1,Master)
	WriteRoleValue(monster,EM_RoleValue_Livetime,5)
	Beginplot(monster,"bico_RangeSkill_623428_1",0)

end
function bico_RangeSkill_623428_1()--�B�E�����ĪG
	local own = OwnerID()
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+90 )
	--local table = {498826,498830,498837,498828,499816}
	--for i = 1 , #(table) do
	--	KS_ResetColdown( master , table[i] , 5 )
	--end
	while 1 do
		sleep(10)
		SysCastSpellLv(master,own,498832,skilllv)
	end
end

function bico_RangeSkill_498828() --�l������--�������Ǿɦ^�X
	local own = OwnerID()
	local table = {498826,498830,498837,499816}
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )
	--SetPlot( tar,"range","",0 )
	for i = 1 , #(table) do
		KS_ResetColdown( Master , table[i] , 5 )
	end
	SetPlot( OwnerID(),"range","bico_RangeSkill_498828_1",20 ) --Ĳ�o35�X
end
function bico_RangeSkill_498828_1() --�l������1--���ɪ��uOwnerID�v�O�����a�A�uTargetID�v�O�l������--�������Ǿɦ^�X
	local tar = TargetID()
	local point = ReadRoleValue(tar,EM_RoleValue_register1)
	local own = OwnerID()
	SysCastSpellLv(tar,own,498829,0)
	sleep(5)
	WriteRoleValue(tar,EM_RoleValue_register1,point+1)
	point = ReadRoleValue(tar,EM_RoleValue_register1)
	--say(tar,"point = "..point)
	if point == 6 then
		delobj(tar)
	end
	BeginPlot(tar , "un_RangeSkill_498828" , 0)
end

function bico_trapcooldown() --lv60���Ǿɦ^�X�P�_--�I������
	local own = OwnerID()
	--local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )
	local table = {498826,498830,498837,498828,499816}
	for i = 1 , #(table) do
	KS_ResetColdown(own , table[i] , 5 )
    end
	return true
end

--�k�Flv 70
function bico_firecri_check1(result)
	local own = OwnerID()
	local tar = TargetID()
	--say(own,"hi")
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+112 )
	if result == 2 then
	addbuff(tar,623436,powerLV,10)
	end
end

--�k�K lv 70
function bico_623445_check()
	local own = OwnerID()
	if CheckBuff(own,621634) == false then
	Cancelbuff(own,623444)
	end	
end

--���K lv 70
function bico_622994_addbuff()--�����pô
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+102 )
	Addbuff(tar,623068,powerLV,2)
	Addbuff(own,622622,powerLV,2)
end

--���F lv 60
function bico_623175_Check()--�Ŷ����D(498628)
	local OID = OwnerID()
	local TID = TargetID()
	--local TID = {}
	--TID = SearchRangePlayer( OwnerID() , 180 )
--for i = 0 , #(TID)-1 do 
	if ReadRoleValue( TID, EM_RoleValue_IsNPC ) == 1 then
		if GetModeEx(TID,EM_SetModeType_Strikback)==false or GetModeEx(TID,EM_SetModeType_Move)==false then--������or�����ʪ�����L��
			return;
		end
		local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		for i=1, 5 do
			if GameObjInfo_Int( OrgID, "AvoidMagicType"..i ) == 101 then
				return;
			end
		end
	end
--end
	local Dis = 0
	local PosX = ReadRoleValue( OID, EM_RoleValue_X )
	local PosY = ReadRoleValue( OID, EM_RoleValue_Y )
	local PosZ = ReadRoleValue( OID, EM_RoleValue_Z )
	local PosDir = ReadRoleValue( OID, EM_RoleValue_Dir )
	local radian = (math.pi/180)*( PosDir )--�|��
	PosX = PosX +(Dis*math.cos(radian))
	PosZ = PosZ -(Dis*math.sin(radian))
	PosY  = GetHeight( PosX, PosY, PosZ )
	--for i = 0 , #(TID)-1 do
	SetPos( TID, PosX, PosY, PosZ, PosDir )
	--end
end

--�v�Klv 70
function bico_623471_strick()
	local own = OwnerID()
	local tar = TargetID()
	--local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_Normal+1 )
	addbuff(tar,621166,0,10)
end

function lua_bico_targetisfaile_notself()
	local own = OwnerID()
	local tar = TargetID()
	if own == tar then
--	KS_ScriptMessage("[SYS_CASTSPELL_TARGET_ERROR]")
	ScriptMessage( own, own, 1, "[SYS_CASTSPELL_TARGET_ERROR]", "|cffff0000" )
	return false
	else
	return true
	end
end

function bioc_Shutdown_debuff()
	local own= OwnerID()
	SysCastSpellLv( own, own, 499849,0 )
end

function bico_499816() --�q�D�����۴���
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
		SetModeEx(OwnerID(),EM_SetModeType_Mark,false)
		SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
		SetModeEx(OwnerID(), EM_SetModeType_Move, false)
		SetModeEx(OwnerID(),EM_SetModeType_Fight, false) 
		SetModeEx(OwnerID(),EM_SetModeType_Strikback, false) 
		SetModeEx(OwnerID(),EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(OwnerID(),EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
	SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED)    --��������ʧ@
	AddBuff (OwnerID() , 507186 , (ATK*0.05) , -1)
	AddBuff (OwnerID() , 507190 , (DMG*0.08) , -1)
	local table = {498826,498830,498837,498828}
	for i = 1 , #(table) do
		KS_ResetColdown( Master , table[i] , 5 )
	end
	sleep(10)
	--KS_ResetColdown( Master , 499816 , 5 )
local own = OwnerID()
	while 1 do
		SysCastSpellLv(own,own,499815,0)
		sleep(10)
	end
end