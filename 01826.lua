function Apon_Check_Job(ID) ----�P�_¾�~��
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	
	if ID == 1 then
		if Job == 1 or Job_sub == 1 or Job == 10 or Job_sub == 10 then
			return true
		else
			return false
		end
		
	elseif ID == 2 then	
		if Job == 2 or Job_sub == 2 or Job == 9 or Job_sub == 9 then 
			return true
		else
			return false
		end
	
	elseif ID == 3 then
		if Job == 3 or Job_sub == 3 then 
			return true
		else
			return false
		end
	end
end

function Apon_Check_Job_45678() ----�P�_¾�~��
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
		
	if Job ~= 1 and Job_sub ~= 1 and Job ~= 2 and Job_sub ~= 2 and Job ~= 3 and Job_sub ~= 3 
		and Job ~= 9 and Job_sub ~= 9	and Job ~= 10 and Job_sub ~= 10   then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SKILLTIPS_495494]" , 1 )
	else
		return true
	end
end

function Apon_Suitskill_495481()---- �M�˧ޡA�k�v�A�]�O�^�y�s���ˬdbuff��
	if CheckBuff( OwnerID() , 506456) == false then
		SysCastSpellLV( OwnerID() , OwnerID() , 495584 , 0 )
		--AddBuff (OwnerID() , 506456 , 0 , 60)
	end
end

function Apon_Suitskill_495482()---�M�˧ޯ�A�k�v�A����A�G��@��
	local Buff_1 = 506670
	local Buff_2 = 506582
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

function Apon_115230_QNPC() ---Zone15 �M�˧ޯ�����v
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_115230_1]" , "Apon_115230_QNPC_1", 0 )--�M�˧ޯ઺�B�θ��	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_115230]" , "Hsiang_OpenSuitSkill", 0 )--�ڷQ�ݬݧA�檺�F��
end

function Apon_115230_QNPC_1() ---Zone15 �M�˧ޯ�����v
	SetSpeakDetail( OwnerID(), "[SC_115230_2]"   )--�����M�˧ޯ઺�B��
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Apon_115230_QNPC", 0 ) --�^��W�@��
end

function AP_suitskill_magic_60()
	local MasterID = 104453 ----�Y��������NPC
	local MagicID = 496096 ---�Y�����ߪ��k�N�ĪG
	local MasterEffectBuff = 507727		------�j�a�Y�����߯S��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Master = star_CreateObj_NoAdd( OwnerID() , MasterID , 0 , 0 , 0 , Room , 0)
	SetModeEx( Master , EM_SetModeType_Move , false )			------������
	SetModeEx( Master , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Master , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Master , EM_SetModeType_Searchenemy , false )	------������		
	SetModeEx( Master , EM_SetModeType_Mark , false )			------���i�I��	(�u�n���o�ӴN�i�H���]�X���)
	SetModeEx( Master , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEx( Master , EM_SetModeType_HideName , false ) 		-------����ܦW��
	AddToPartition( Master , Room )
	AddBuff(Master , MasterEffectBuff , 0 , -1)
	WriteRoleValue( Master , EM_RoleValue_Livetime , 30)
	SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse10 , Master ) ----�N�Y������NPC�s�J���a�Ȧs����
	WriteRoleValue( Master , EM_RoleValue_register1 , OwnerID()) ---�N�I�k�̪�ID�s�J�Y������NPC
	BeginPlot( Master , "AP_suitskill_magic_60_Mob" , 0 )
	--Setplot( Master , "range" , "star_skill_DWD50_2" , 80)	
end

function AP_suitskill_magic_60_NPC()  ----�Y�����ĪG --���b�I�k�̨��W���s�򲣥ͪk�N
	local MagicID = 496096
	local Master = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_SkillUse10 )
	if Master ~= nil and ( CheckID(Master)) == true then
		SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	end
end

function AP_suitskill_magic_60_Mob() --�Y������NPC�ͥ۬W
	local Player = ReadRoleValue ( OwnerID() , EM_RoleValue_register1 )
	local Mob_skill = 496098
	local Counter = 0
	local Mob_Num = 0
	local Temp = {}
	Temp = AP_BornByMultilateral( 104451 , 5 , 50 )---�]����s�� �A ����ƶq�A���󶡪��Z���^--������
	for i = 1 , 5 , 1 do
		SysCastSpellLV( Player , Temp[i] , Mob_skill , 0 )---���a�I�񳴨���۬W���}�U
		Delobj(Temp[i])
	end
	while 1 do
		sleep(10)
		Counter = Counter + 1
		local Check_life = {}
		local Check_life_Num = 0
		if Counter == 3 then
			local Search = SearchRangeNPC ( OwnerID() , 60 )
			for i = 0 , table.getn(Search)+1 do
				if Search[i] ~= OwnerID() and Search[i] ~= nil then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104452	then
						table.insert( Check_life , Search[i] )
					end
				end
			end
			Counter = 0
			local Check_life_Num = table.getn(Check_life)
			--say(OwnerID(),"Check_life_Num ="..Check_life_Num)	
			if Check_life_Num == 0 then
				Delobj(OwnerID())
				break
			end
		end
	end
end

function AP_suitskill_magic_60_Mob_1() ---�۬W����l�@��
	AddBuff (OwnerID() , 507502 , 0 , -1) ---�۬W�W���S��
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_HitLv) ---- Ū�D�H���k�N�R������
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_Dmg) ---Ū�D�H���k�NDmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_ATK) ---Ū�D�H���k�NATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---Ū�D�H������
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.1
	AddBuff (OwnerID() , 507501 , Skill_Lv , 60) ---ATK & DMG & HIT
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_ATK)
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_HitLv)
	--say(OwnerID(),"22222")
	--say(TargetID(),"33333")
end
----------------------------------------------------------------------------------------------------------------------------65���Y��
function un_suitskill_magic_60()
	local MasterID = 104453 ----�Y��������NPC
	local MagicID = 497829 ---�Y�����ߪ��k�N�ĪG
	local MasterEffectBuff = 507727		------�j�a�Y�����߯S��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Master = star_CreateObj_NoAdd( OwnerID() , MasterID , 0 , 0 , 0 , Room , 0)
	SetModeEx( Master , EM_SetModeType_Move , false )			------������
	SetModeEx( Master , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Master , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Master , EM_SetModeType_Searchenemy , false )	------������		
	SetModeEx( Master , EM_SetModeType_Mark , false )			------���i�I��	(�u�n���o�ӴN�i�H���]�X���)
	SetModeEx( Master , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEx( Master , EM_SetModeType_HideName , false ) 		-------����ܦW��
	AddToPartition( Master , Room )
	AddBuff(Master , MasterEffectBuff , 0 , -1)
	WriteRoleValue( Master , EM_RoleValue_Livetime , 30)
	SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse10 , Master ) ----�N�Y������NPC�s�J���a�Ȧs����
	WriteRoleValue( Master , EM_RoleValue_register1 , OwnerID()) ---�N�I�k�̪�ID�s�J�Y������NPC
	BeginPlot( Master , "un_suitskill_magic_60_Mob" , 0 )
	--Setplot( Master , "range" , "star_skill_DWD50_2" , 80)	
end

function un_suitskill_magic_60_NPC()  ----�Y�����ĪG --���b�I�k�̨��W���s�򲣥ͪk�N
	local MagicID = 497829
	local Master = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_SkillUse10 )
	if Master ~= nil and ( CheckID(Master)) == true then
		SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	end
end

function un_suitskill_magic_60_Mob() --�Y������NPC�ͥ۬W
	local Player = ReadRoleValue ( OwnerID() , EM_RoleValue_register1 )
	local Mob_skill = 497831
	local Counter = 0
	local Mob_Num = 0
	local Temp = {}
	Temp = AP_BornByMultilateral( 104451 , 5 , 50 )---�]����s�� �A ����ƶq�A���󶡪��Z���^--������
	for i = 1 , 5 , 1 do
		SysCastSpellLV( Player , Temp[i] , Mob_skill , 0 )---���a�I�񳴨���۬W���}�U
		Delobj(Temp[i])
	end
	while 1 do
		sleep(10)
		Counter = Counter + 1
		local Check_life = {}
		local Check_life_Num = 0
		if Counter == 3 then
			local Search = SearchRangeNPC ( OwnerID() , 60 )
			for i = 0 , table.getn(Search)+1 do
				if Search[i] ~= OwnerID() and Search[i] ~= nil then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104452	then
						table.insert( Check_life , Search[i] )
					end
				end
			end
			Counter = 0
			local Check_life_Num = table.getn(Check_life)
			--say(OwnerID(),"Check_life_Num ="..Check_life_Num)	
			if Check_life_Num == 0 then
				Delobj(OwnerID())
				break
			end
		end
	end
end

function un_suitskill_magic_60_Mob_1() ---�۬W����l�@��
	AddBuff (OwnerID() , 507502 , 0 , -1) ---�۬W�W���S��
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_HitLv) ---- Ū�D�H���k�N�R������
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_Dmg) ---Ū�D�H���k�NDmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_ATK) ---Ū�D�H���k�NATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---Ū�D�H������
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.1
	AddBuff (OwnerID() , 507501 , Skill_Lv , 60) ---ATK & DMG & HIT
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_ATK)
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_HitLv)
	--say(OwnerID(),"22222")
	--say(TargetID(),"33333")
end
----------------------------------------------------------------------------------------------------------65�����B
function un_Suitskill_495482()---�M�˧ޯ�A�k�v�A����A�G��@�� --65�ŧ󴫥�
	local Buff_1 = 509962
	local Buff_2 = 509963
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












