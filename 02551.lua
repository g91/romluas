function FN_Skill_BattleStyle()	--����ܨ����A���ɶ���B�z
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)

	WriteRoleValue( own, EM_RoleValue_SoulPoint, 0)
	--------�@��v�T

	--------��^�ޯ�v�T
	--�F/�v
	if MainClass == 9 and SubClass == 3 and CheckFlag( own, 545890 ) == true then 
		WriteRoleValue( own, EM_RoleValue_SoulPoint, 1)
	end
	return true
end

--�W�[�F���I���P�_�A���b�򥻪k�N�����GLUA �ˬd
function Add_SoulP_1()	--�W�[ 1 �I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+1)	
	end
end

function Add_SoulP_2()	--�W�[ 2 �I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+2)	
	end
end

function Add_SoulP_3()	--�W�[ 3 �I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+3)	
	end
end
function Add_SoulP_6()	--�W�[ 6 �I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+6)	
	end
end
function Add_SoulP_10()	--�W�[ 10 �I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+10)	
	end
end

function Add_SoulP_1_1()	--�W�[ 1 �I ���A���]�i�[�I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+1)	
end

function Add_SoulP_2_2()	--�W�[ 2 �I ���A���]�i�[�I
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+2)	
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------

function un_skill_498556()  --�X��ӤJ�v�T���ߥ���(498545)�H�δb�����D(498553)
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV

	--------��¾�ޯ�j��
	--�X��ӤJ(498556)
	powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+18 )
	--say(own,"plv = "..powerLV)
	if powerLV ~= 0 and CheckBuff(tar,501577) == true and CheckBuff(own,621281)==false then
		AddBuff(own,621281,powerLV,-1)
	end
	return TRUE
end

function un_skill_497957_1()  --�F��b�B���t�����B�Ӯz´�G�ɶˮ`���B�~�ĪG��----�F/��
	local own = OwnerID()
	local RoomID = ReadRoleValue( own , EM_RoleValue_RoomID)
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)	----�F/��
	if MainClass == 9 and SubClass == 1 then
		--�ծ�(498634)
		local RandNum = DW_Rand(100)
		if CheckFlag(own,545883) == TRUE and RandNum <= 20 then	
			 Lua_CDtime_set(own,498639,0)
		else
			DebugMsg( own , RoomID , "set CoolDown fail")
		end
	end
	----�F/��
	if MainClass == 9 and SubClass == 5 then
		--���t�v��(498633)
		if CheckFlag( own, 545904 ) == true and DW_Rand(4) == 1 then 
			GiveBodyItem( own, 546056, 1 )
			addbuff(own,621324,0,-1)
		end
	end
	return TRUE
end

function un_skill_497958()	--���t�������B�~�ĪG��
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV = 0
	--------��¾�ޯ�j��
	--�Ӯz���A�j�ƶˮ`
	powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_normal+2 )
	if CheckBuff(tar,501577) == true then
		AddBuff(own,501588,powerLV,-1)
	end
	--------��^�ޯ�j��
	----�F/��
	
	return TRUE
end

function un_skill_497959()	--�Ӯz´�G���B�~�ĪG��
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV
	--------��¾�ޯ�j��
	--------��^�ޯ�j��
	----�F/��
	if MainClass == 9 and SubClass == 1 then
		--�ծ�(498634)
		--powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+22 )
		local RandNum = DW_Rand(100)
		if CheckFlag(own,545883) == TRUE and RandNum <= 20 then
			
			 Lua_CDtime_set(own,498639,0)
		end
	end
	return TRUE
end
function un_RangeSkill_498542() --�ߩ��̻�
	local OwnerID = OwnerID()
	addbuff(OwnerID,621202,0,-1)
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+6 ) --+12�OŪ���D¾�M�ݪ�¾�~�C��
	for i= 1 , 5 do
		SysCastSpellLv(OwnerID,OwnerID,498543,powerLV)
		sleep(20)
	end
end	
function un_skill_498544() --�L���ŧP
	local tar = TargetID()  --�ǥ���
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+7 )  --+12�OŪ���D¾�M�ݪ�¾�~�C��
	sleep(5)
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --�˾lHP�ʤ���
	--say(own,"hp ="..nowhp)
	if powerLV >=50 then
		powerLV = 50
	end
	if nowhp<20 then
		addbuff(own,621199,powerLV,20)
	end
end
function un_skill_498545() --���ť���
	local tar = TargetID()
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --�˾lHP�ʤ���
	--say(tar,"hp = "..nowhp)
	if nowhp >70 then
		return true
	else
		return false
	end
end

function un_skill_497964() --���F�W�h���B�~�ĪG��
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV
	--------��^�ޯ�j��
	----�F/��
	if MainClass == 9 and SubClass == 1 then
		--����X�@(498636)
		powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+28 )
		if CheckFlag(own,545887) == TRUE then
			AddBuff(own,621327,powerLV,-1)
		end
	end
	return TRUE
end
----------------------------------------------------------------------------------------��^�ޯ�
----�F/��
function un_skill_498633() --�R�����^�_�N���o�X��
	local own = OwnerID()
	SetFlag( own, 546056, 0 )
	if CheckBuff(own, 621324) == TRUE then
		 CancelBuff( own, 621324 )
	end
end

function un_skill_498644_check() --�F��E�y �����^�_�N�ܬ����o
	local own = OwnerID()
	local Type  = GameObjInfo_Int( 498644 , "ColdownType" )	-- ��o�Ӫk�N���������N�o���O
	if ReadRoleValue( own , EM_RoleValue_Coldown_Job + Type ) == 0 then	--�p�G�o�Ӫk�N�bCD���A�N���|�����W�jBuff
		addbuff(own,621322,0,-1)	--�]�������o �j���F��E�y���ˮ`
	end
	return true
end

function un_skill_498644()	--�F��E�y ���^�_�N���o
	local own = OwnerID()
	local x = DW_rand(4)
	if x ==1 then
		SetFlag( own, 546056, 1 )
		addbuff(own,621324,0,-1)
	end	
end

function un_skill_498648() --�߹ҧ��@ ���^�_�N��18%���v���m�Τߤ������N�o�ɶ�
	Lua_CDtime_set(OwnerID(),498641,0)
end

function un_skill_498663() --�H����Ĳ���mCD��
local own = OwnerID()
local Pos = Lua_BuffPosSearch( own , 621330 )                      ---------------------��X���W���k�N�N��
local BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
local x = DW_rand(2) --50%���vĲ�o
	if x == 1 then
		addbuff(BuffOwner,621394,0,-1)
		SetFlag( BuffOwner, 541860, 1 ) --���F��b���o�X��
		Lua_CDtime_set(BuffOwner,498644,0)  --���m�E�y����CD�ɶ�
	end
end

function un_skill_498666() --�F��b���o �R���X��
	local own = OwnerID()
	Add_SoulP_1()
	SetFlag( own, 541860, 0 )
	CancelBuff( own, 621394 )
end

function un_skill_498786()
	local own = OwnerID()
	SetFlag( own, 541860, 0 )
	return true
end

function un_skill_498668() --���Ӥ@��Ĳ�o�F�P
	local own = OwnerID()
	local bufflv = FN_CountBuffLevel(own,621398) --Ū��buff�h��
	--say(own,"buff = "..bufflv)
	if bufflv == 6  then 
		Lua_CDtime_set(own,498777,0)
		CancelBuff( OwnerID(), 621398 )
		return false
	end	
end
----�F/��
function FN_skill_498637()	--�F��b �Q����X�@�j��
	local tar = TargetID()
	local own = OwnerID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)

	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage+20))
	return TRUE
end

function FN_skill_498642()	--�N���y��
	local Player = OwnerID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local SoulPoint = ReadRoleValue(Player, EM_RoleValue_SoulPoint)
	local Add

	Add = Math.floor(Rage/35)
	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage-Add*35))
	WriteRoleValue(Player, EM_RoleValue_SoulPoint, (SoulPoint+Add))
end

function FN_skill_498645()	--���߬��X
	local Player = OwnerID()
	local Target = TargetID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local AddTime = Math.floor(Rage/20)
	
	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage-20*AddTime))
	AddBuff(Target, 621321, 0, 2+AddTime)
end

function FN_skill_498646_end()	--�e����
	local Player = OwnerID()
	local Tar = TargetID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local powerLV = ReadRoleValue( Player , EM_RoleValue_MagicPowerLv_normal+1 )

	if CheckBuff(Tar, 501577) == TRUE then
		--Say(Player, "powerLV="..powerLV)
		AddBuff(Tar, 501577, powerLV, 15)
		WriteRoleValue(Player, EM_RoleValue_SP_Sub, 100)
	end
end

---------------------------------------------�F/�v

function un_skill_498695()
	local own = OwnerID()
	local PartyNum = GetPartyID( own, -1 )
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+34 )

	for i=1,PartyNum do
		local PartyMember = GetPartyID( own, i )
		if checkbuff(PartyMember,621432) == false then
			AddBuff(PartyMember, 621433, powerLV, 10)
		end
	end
end

function un_skill_498699_check()	--�׵��N��
	local own = OwnerID()
	local tar = TargetID()
	--Say(own,"1")
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --HP�ʤ���
	if nowhp <= 35 then
		--Say(own,"2")
		AddBuff(own, 621436, 0, 4)
	end
end

function un_skill_498699() --�׵��N��
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	WriteRoleValue( own, EM_RoleValue_SoulPoint, (SoulP+1))
end

function un_skill_498700() --�o�P�@
	
	local own = OwnerID()
	local tar = TargetID()
	local skilllv = 0     --buff�h��
	local powerLV
	local buff = {621188,621701,621399} --�n�P�_��3��buff
	local Spell = {498557,498559,498782} --�n�I�i��3�ӧޯ�
	local MagicPowerLv = { EM_RoleValue_MagicPowerLv_normal, EM_RoleValue_MagicPowerLv_normal, EM_RoleValue_MagicPowerLv_SP }
	local MagicPowerPos = { 4, 0, 29 }

	if CheckBuff(own, 501571) == false then
		return false
	end

	for i = 1, 3 do
		if  checkbuff(tar,buff[i]) == true then
			powerLV = ReadRoleValue( own , MagicPowerLv[i]+MagicPowerPos[i] )
			SysCastSpellLv(own,tar,Spell[i],powerLV) --���F�W�h
			skilllv = skilllv + 1
		end
	end
	if skilllv > 0 then  --�h�Ʀ��@�h�H�W�~��
			addbuff(own, 621441, (skilllv-1), 4) --�W�[�k�˪�buff
	end
	return true
end

--function un_skill_498700() --�o�P�@
--	
--	local own = OwnerID()
--	local tar = TargetID()
--	local skilllv = 0     --buff�h��
--	local powerLV
--	local buff = {621188,621701,621399} --�n�P�_��3��buff
--	for i= 1 , 3 do
--		if checkbuff(tar,buff[i]) == true then
--			if buff[i] == buff[1] then
--				powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+0 )
--				--say(own,"skill1"..powerLV)
--				SysCastSpellLv(own,tar,498557,powerLV) --���F�W�h
--			elseif buff[i] == buff[2] then
--				powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_normal+4 )
--				--say(own,"skill2"..powerLV)
--				SysCastSpellLv(own,tar,498559,powerLV) --�P���c��
--			elseif buff[i] == buff[3] then
--				powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+29 )
--				--say(own,"skill3"..powerLV)
--				SysCastSpellLv(own,tar,498782,powerLV) --���F�r��
--			end
--			--say(own,"buff = "..powerLV)
--			skilllv = skilllv+1
--		end
--	end
--		
--	if skilllv>0 then  --�h�Ʀ��@�h�H�W�~��
--			addbuff(own,621441,skilllv,-1) --�W�[�k�˪�buff
--	end
--	return true
--end----�F/�u
function FN_skill_498650_add5()	--�ķ洵�����(����@��)
	AddBuff(OwnerID(), 621331, 4, -1)
end

function FN_skill_498650()	--�ķ洵�����(�������A)
	local Player = OwnerID()
	local Tar = TargetID()
	local BuffLV = FN_CountBuffLevel(Tar,621331)

	CancelBuff(Tar, 621331)
	if BuffLV == 0 then
		return
	else
		AddBuff(Tar, 621331, BuffLV-1, -1)
	end

end

function FN_skill_500279()	--�ķ洵�����(�w���ˬd)
	if FN_CountBuffLevel( OwnerID() , 621331 ) < 0 then	--�Y���W��BuffLV < 0�A�h��������
		CancelBuff( OwnerID() , 621331 )
	end
end

function FN_skill_498676()	--����b��
	local Player = OwnerID()
	local Tar = TargetID()
	local Focus = ReadRoleValue(Player, EM_RoleValue_SP)

	CancelBuff(Tar, 621190)
	WriteRoleValue(Player, EM_RoleValue_SP, Focus+35)
end

----�F/�k
function Skill_lua_498701()	--���t�{�U
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_Normal+2 )

	SysCastSpellLv( own, own, 498702, powerLV)
end

function Skill_Lua_498711_check()	--����W��
	local Player = OwnerID()
	local Focus = ReadRoleValue(Player, EM_RoleValue_SP)
	local MaxFocus = ReadRoleValue(Player, EM_RoleValue_MaxSP)

	if Focus == MaxFocus then
		return TRUE
	end
	return FALSE
end

function Skill_Lua_498710_ReSetCD()	--�O��v��
	local own = OwnerID()
	Lua_CDtime_set(own,498697,0)
end

------------------------------------��/�F
function un_skill_498706() --���F����
local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_AttackTargetID)
	local Targ=ReadRoleValue(tar,EM_RoleValue_AttackTargetID) --�ؼЪ������ؼ�

	if Targ == own then
		
		--say(OWnerID(),"1")
		return true
	else
		--say(OWnerID(),"2")
		return false
	end
end
function un_skill_498706_2() --���F����
local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_AttackTargetID)
	local Targ=ReadRoleValue(tar,EM_RoleValue_AttackTargetID) --�ؼЪ������ؼ�

	if Targ == own then
		
		--say(OWnerID(),"1")
		return false
	else
		--say(OWnerID(),"2")
		return true
	end
end
function un_skill_498735() --�F��ԧq81
	local own = OwnerID()
	if checkbuff( own, 621478 ) == true then  
		local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+81 )
		SysCastSpellLv(own,own,498736,powerLV)
	end
end
function un_skill_498739() --�F�భ�B
	cancelbuff(OwnerID(),621477)
	return true
end
function un_RangeSkill_498742() --�F�b����
	local OwnerID = OwnerID()
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)
	addbuff(OwnerID,621499,0,-1)
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+85 ) --+12�OŪ���D¾�M�ݪ�¾�~�C��
	for i= 1 , 6 do
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498743 , powerLV )
		sleep(10)
	end
end	
------------------------------------��/��
function FN_skill_498612_HPcheck()	--¡�߲ů� �Q��¡�j��
	local tar = TargetID()
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --HP�ʤ���
	
	if nowhp <=40 then
		return TRUE
	end
	return FALSE
end

function FN_skill_498620()	--�ХͫH��
	local own = OwnerID()
	local tar = ReadRoleValue(own, EM_RoleValue_Register10)
	--Say(own, "OwnerID")
	--Say(own, "TargetID="..tar)
	--Say(tar, "TargetID")
	if ReadRoleValue(own, EM_RoleValue_Register10) == 0 then
		local PartyNum = GetPartyID(own , -1)
		local TempID
		--Say(own, "1")
		--
		for i=1,PartyNum do
			TempID = GetPartyID(own , i)
			local Pos = Lua_BuffPosSearch( TempID , 620489 )
			local BuffOwner = BuffInfo( TempID , Pos , EM_BuffInfoType_OwnerID )  
			--
			if CheckBuff(TempID, 620489) == TRUE and BuffOwner == own then
				--Say(TempID, "TempID is me")
				tar = TempID
				WriteRoleValue(own, EM_RoleValue_Register10, tar)
			end
		end
	else
		--Say(own, "3")
		tar = ReadRoleValue(own, EM_RoleValue_Register10)
	--	Say(tar, "tar is me")
	end
	------
	--Say(own, "4")
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+88 )
	SysCastSpellLv( own, tar, 498622, powerLV )
	--Say(own, "5")
end

function FN_skill_498620_cleanRegister()
	local own = OwnerID()

	WriteRoleValue(own, EM_RoleValue_Register10, 0)
end

function FN_lua_Skill_498614()	--�@���ŦL
	local own = OwnerID()

	if CheckBuff(own, 621548) == FALSE then
		CancelBuff(own, 621549)
		return TRUE
	end

	local Pos = Lua_BuffPosSearch( own , 621548 )                      		--��X���W���k�N�N��
	local BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )	--��X���k�N�O�֩�
	local Ran = DW_Rand(100)

	if Ran <= 12 then
		Lua_CDtime_set(BuffOwner,498612,0)
	end
	return TRUE
end
function Dy_newhpcheck() --�k�N���X����q�ˬd
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
	if HPPercent < 5 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_18]" , 1 )
		return false
	else
		return true
	end	
end	
function Un_skill_499869()	--�j�ƷN���y��
	local Player = OwnerID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local SoulPoint = ReadRoleValue(Player, EM_RoleValue_SoulPoint)
	local Add

	Add = Math.floor(Rage/20)
	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage-Add*20))
	WriteRoleValue(Player, EM_RoleValue_SoulPoint, (SoulPoint+Add))
end	

function YoYo_Skill_501573_EndUse()	--2014/05/26�ק�G�ϥΫ�|�Ѱ��u�K��"�s���X��"���A
	Add_SoulP_1()	--����1�I�F���I
	Cl_ArtisanSkillChackBuff()	--�Ѱ�"�s���X��"���A
end