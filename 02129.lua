function Lua_frosty_hideobj_na() --���ê���@��		
	while true do
		local hour = GetSystime(1) --��t�ήɶ�(�p��)
		local min = GetSystime(2) --��t�ήɶ�(����)
	--	say(OwnerID(), hour )
	--	say(OwnerID(), min )
		local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_RealZoneID)				
		local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

		if Zone == 5 then  --�u���X�{�bZONE 5
			if  hour == 23 or hour  == 3 or hour  == 7 or hour  == 11 or hour  ==15 or hour  == 19  then  
				if min == 30 then --30�����ɭԶi��s��
  					RunningMsgEx( OwnerID() , 2 , 3 ,"[SC_FROSTY_NA_01]" ) 	--  (0 �ۤv 1 �ϰ� 2 �������a )�C�b���i�԰��줤�A�ƴ��ۤ��M�`���𮧡C
				elseif min  == 45 then --45���ɶi��s��
  						RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_02]" ) 	-- (0 �ۤv 1 �ϰ� 2 �������a )�C���i�԰��줤���M�`���𮧥��b���E�C
				elseif min == 55 then --55���ɼs���A���泷�H�X�{�@��
					BeginPlot( OwnerID(), "Lua_frosty_begin_na",0 )					
				end
	
		
			elseif hour  == 2 or hour  == 6 or hour  == 10 or hour  == 14 or hour  == 18 or hour  == 22  then
				if min == 0 then --�R�����ﳷ�H���@��
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Count = SetSearchAllNPC( RoomID )
					local Obj
					local NPC = {104497,116655}

					if  Count ~= 0 then
						for i=1 , Count , 1 do
							local ID = GetSearchResult()
							Obj=Role:New(ID)
							if Obj:IsNPC() == true then
								local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
								for j = 1 , table.getn( NPC ) , 1 do
									if Name == NPC[j] then  --�Y���}�C������
									BeginPlot( OwnerID(), "Lua_snowdrift_Del_na", 0 )	--�R������, ���H��
									end
								end
							end
						end
					end
				end
			end
		end
		Sleep(600)   --�@�����]�@��
	end
end

function Lua_frosty_begin_na()	--�M�w�B�����X�{���a�I
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	local random = rand(20)   
	if random <= 10  then   -- 0 -20
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_04]" ) 	-- (0 �ۤv 1 �ϰ� 2 �������a )�C���M�`���𮧦b���i�԰��줤���������v�����E���ΡC
		end
		sleep( 3000) --5��������
		BeginPlot( OwnerID(), "Lua_snowborn1_na" ,0 ) --�X�{�b����
	else
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_05]" ) 	-- (0 �ۤv 1 �ϰ� 2 �������a )�C���M�`���𮧦b���i�԰��줤�����쨦���v�����E���ΡC
		end
		sleep( 3000) --5��������
		BeginPlot( OwnerID(), "Lua_snowborn2_na" ,0 ) --�X�{�b���쨦
	end
end




function Lua_snowborn1_na()  --����X�͡A���c���H���X�{
	local X = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30 }  --30��
	local Y = 0
	local Y6 = {}
	for i = 1 , 15 do   -- ����15��
		Y = Rand(table.getn(X))+1
		Y6[i] = X[Y]
		table.remove(X,Y)
		local snowdrift = {}
		snowdrift[i] = CreateObjByFlag(116655 , 780797, Y6[i] ,1) --�ϥκX�l���ͳ��� npc �X�l�s�� �ƶq 
		SetModeEx( snowdrift[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( snowdrift[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( snowdrift[i]  , EM_SetModeType_Move, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( snowdrift[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( snowdrift[i]  , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( snowdrift[i], 0 )	--�����ﲣ��
		SetPlot(snowdrift[i], "Touch" , "Lua_snowdrift_touch_na" , 50 )
	--	Say(OwnerID(),"Y6"..i.." = "..Y6[i])-- i = �ĴX�� ,  y6[i]  = �Ʀr
	end
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsgEx( OwnerID() , 2 , 3 ,  "[SC_FROSTY_NA_06]" ) 	--  (0 �ۤv 1 �ϰ� 2 �������a )�C�b���i�԰��쪺�������X�{�F�B�����C
	end
	local Frosty = CreateObjByflag( 104497, 780797 , 0 , 1 ) --�b���w�s�����X�l�W���ͦB����(NPC�s��,�X�l�s��,�X�l�s�X,�ƶq)
	AddToPartition( Frosty , 0 ) 
end


function Lua_snowborn2_na()  --����X�͡A���c���H���X�{
	local X = {32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61 }  --30��
	local Y = 0
	local Y6 = {}
	for i = 1 , 15 do   -- ����15��
		Y = Rand(table.getn(X))+1
		Y6[i] = X[Y]
		table.remove(X,Y)
		local snowdrift = {}
		snowdrift[i] = CreateObjByFlag(116655 , 780797, Y6[i] ,1) --�ϥκX�l���ͳ��� npc �X�l�s�� �ƶq 
		SetModeEx( snowdrift[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( snowdrift[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( snowdrift[i]  , EM_SetModeType_Move, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( snowdrift[i]  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( snowdrift[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( snowdrift[i]  , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( snowdrift[i], 0 )	--�����ﲣ��
		SetPlot(snowdrift[i], "Touch" , "Lua_snowdrift_touch_na" , 50 )
	--	Say(OwnerID(),"Y6 "..i.." = "..Y6[i])-- i = �ĴX�� ,  y6[i]  = �Ʀr
	end
--	Say(OwnerID(), "BORN OK")
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_07]" ) 	--  (0 �ۤv 1 �ϰ� 2 �������a )�C�b���i�԰��쪺���쨦���X�{�F�B�����C
	end
	local Frosty = CreateObjByflag( 104497, 780797 , 31 , 1 ) --�b���w�s�����X�l�W���ͦB����(NPC�s��,�X�l�s��,�X�l�s�X,�ƶq)
	AddToPartition( Frosty , 0 ) 
end



--���諸�@��
function Lua_snowdrift_touch_na()	--����Ĳ�I�@��
	SetPlot( OwnerID() , "Touch" , "Lua_snowdrift_touchcheck_na" , 50 )
end

function Lua_snowdrift_touchcheck_na()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if BeginCastBarEvent( O_ID, T_ID,"[SC_FROSTY_NA_14]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_snowdrift_touch01_na" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
	return
	end
end

function Lua_snowdrift_touch01_na(O_ID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			Hide( TargetID() )
			EndCastBar( O_ID, CheckStatus );
			local random = rand(3)   
			if random ==0  then   -- 0 -20
				GiveBodyItem( OwnerID(), 207968, 5) --�����a5���]�k���y
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_08]" , C_SYSTEM )	--�q�g�����F�𮧪����襤���o�F�]�k���y�C
			elseif random == 1 then
				GiveBodyItem( OwnerID(), 207968, 3) --�����a3���]�k���y
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_08]" , C_SYSTEM )
			elseif random == 2 then
				GiveBodyItem( OwnerID(), 207968, 2) --�����a2���]�k���y
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_08]" , C_SYSTEM )
			end

		else
			-- ����
			Hide( TargetID() )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_15]" , C_SYSTEM )
			EndCastBar(O_ID, CheckStatus );			
		end
		Beginplot(TargetID(), "Lua_snowdrift_hide_na" , 0 ) --���泷�y���ü@��
	end
end

function Lua_snowdrift_hide_na()	--�������ü@���A�H����ܮɶ�
	local ran = rand(60)   
	if ran <= 20  then   -- 0 -20
		Sleep(200)  
	elseif ran >= 21 and ran <= 40  then   -- 21 -40
		Sleep(300)  
	elseif ran >= 41 and ran <= 60  then   -- 41 -60
		Sleep(350)  
	end
	Show(OwnerID(), 0)
end



--����R���@��
function Lua_snowdrift_Del_na()  --�R������, ���H��
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsgEx( OwnerID() , 2 , 3 ,  "[SC_FROSTY_NA_10]" ) 	--���i�԰��줤���M�`���𮧤w�g���h�C
	end
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 116655, 104497 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj( ID)
					end
				end
			end
		end
	end
end

--	local TempObj = { 116655 , 104497 }
--	for i = 1 ,table.getn(TempObj) do
--		Lua_DavisDelObj(TempObj[i])
--	end



--�B�������@��
function Lua_frostyborn_na() --�B������l�@���A�@������L��
	say( OwnerID(), "[SC_FROSTY_NA_09]") --�B������ܡG�������I�ݧڪ��B���L�ĳN�I
	PlayMotion( OwnerID(), 83)
	Addbuff(OwnerID(), 508060,0, -1) 
	BeginPlot( OwnerID(), "Lua_frosty_attack_na",0)
end

function Lua_frosty_attack_na()
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --�P�_�O�_�i�J�԰� 1= �O 0= �_
	local random= Rand(15)+1
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then
			if  X > 50 then
				local ran1 = rand(3)
				PlayMotion( OwnerID(), 31 )
				sleep(20)
				CastSpell( OwnerID(), OwnerID(), 496236)
				sleep(50)
				if ran1== 0 then 
					say( OwnerID(), "[SC_FROSTYSPEAK_01]") -- �������I���ڤ@�_���a�I
				end
			elseif X <=50 and X >=30 then
				local ran2 = rand(3)
				if random <5 then --5/15
					if ran2== 0 then 
					say( OwnerID(), "[SC_FROSTYSPEAK_02]") --�O�]�I�ݧڪ��B���ᵲ�N�I�I
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496237)
					sleep(50)
				else	
					if ran2== 1  then 
					say( OwnerID(), "[SC_FROSTYSPEAK_03]") -- �����I�q�q�ܦ����H�a�I
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			elseif X < 30 then --���H����q�C��30%
				local ran3 = rand(3)
				if random == 1 then -- 1/15
					Say( OwnerID(), "[SC_FROSTYSPEAK_05]" ) --���r�I�A�]���o�ӥΤO�F�a�I�ݧڪ��B����_�N�I
					PlayMotion( OwnerID(), 60)
					CastSpell( OwnerID(), OwnerID(), 496086)

				elseif random >1 and random <8 then -- 8/15
					if ran3== 0  then 
					say( OwnerID(), "[SC_FROSTYSPEAK_04]") -- ��u�u�I��u�u�I�ݧڪ��j���y�I�I
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496238)
					sleep(50)
				else
					if ran3== 1  then 
					say( OwnerID(), "[SC_FROSTYSPEAK_03]") -- �����I�q�q�ܦ����H�a�I
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			end
		end
	sleep(100)
	end
end


function Lua_frostydead_na()	--�B�������`�@��
	local Obj = Role:new(OwnerID())
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	Fairy = CreateObj( 116181, BaseX, BaseY, BaseZ, BaseDir, 1 ) --�X�{���H���F
	AddToPartition(Fairy,0)
	say( OwnerID(), "[SC_FROSTY_NA_11]") -- ��I�O�H���o�˴N���ѤF�ڡA�ڤ@�w�|�A�^�Ӫ��I
	BeginPlot( Fairy, "Lua_snowdrift_Del_na", 0 )	--�R���Ҧ���NPC
--	local random = rand(10) --2012 �x�V�`�R��
--	if random < 6 then --60%�����v�}�ҦB����i�Ԫ��J�f
--	--	say( Fairy , random)
--		BeginPlot(  Fairy, "Lua_storm_path_start", 0 ) 	--����ǰe��358�@��
--	end	
--	sleep(50)
	BeginPlot( Fairy, "Lua_snowfairy_Del_na", 0 )	--���泷�H���F�R���@���A�T��������R��
	return true
end

	
--���F���y���@��
function Lua_magicsnowball1_na() --�ϥκ��F���y���ĪG
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Boss = 104497
	--Owner = ���a�ۤv
	--Target=NPC/�䥦���a	
	if CheckDistance( OwnerID(), TargetID(), 150 ) == true then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~=1  and OrgID ~= Boss or TargetID() == OwnerID()  then  --�ؼФ��O���a�]���OBOSS
			ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_FROSTY_NA_16]" , C_SYSTEM ) --<CS>�L�k�惡�ؼШϥκ��F���y�C</CS>
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_FROSTY_NA_16]" , 0 )	--<CS>�L�k�惡�ؼШϥκ��F���y�C</CS>	
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1  and TargetID() ~= OwnerID() then --�ؼЬO���a
			if CheckBuff( TargetID(), 508038 ) == true then --�ˬd���a���W�O�_�����HBUFF�A�ﳷ�H���A�����a�ϥΡA�i�H�Ѱ����H���A
				return true	
			else
				ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_FROSTY_NA_16]" , C_SYSTEM ) --<CS>�L�k�惡�ؼШϥκ��F���y�C</CS>
				ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_FROSTY_NA_16]" , 0 )	--<CS>�L�k�惡�ؼШϥκ��F���y�C</CS>	
				return false
			end
		elseif OrgID == Boss then --�ؼЬOBOSS
			return true
		end
	end
	sleep(1)
end

function Lua_magicsnowball2_na()	--�ˬd�ؼ�
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Boss = 104497

	if CheckBuff( TargetID(), 508038 ) == true then 
		CancelBuff( TargetID(), 508038) -- �R�����HBUFF
		CancelBuff( TargetID(), 508036) --�R���HŸBUFF
		AddBuff( OwnerID(),  508098 , 0, 7200 ) --����ɶ�2�p�ɡA�������a�T�꦳�����B�����A�I�����y������
		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_FROSTY_NA_12]" , C_SYSTEM ) --�A���U�䥦���_�I�̫�_��ˡC
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_FROSTY_NA_12]" , 0 )	--�A���U�䥦���_�I�̫�_��ˡC

		local X = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22) --���U���a�p��
		WriteRoleValue(OwnerID(),  EM_LuaValueFlag_UseItem22 , X+1 )
		local New = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22) --���U���a�p��
	--	Say( OwnerID(), "X="..X..", NEW="..New)

	elseif OrgID == Boss then --�ؼЬ��B����
	--Owner= ���a
	--Target=�B����
		CastSpell( OwnerID() , TargetID() , 496240 ) 
		AddBuff( OwnerID(),  508098 , 0, 7200 ) --����ɶ�2�p�ɡA�������a�T�꦳�����B�����A�I�����y������
		local Y = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21) --�����B�����p��
		WriteRoleValue(OwnerID(),  EM_LuaValueFlag_UseItem21 , Y+1 )	
		local NEW = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21) --�����B�����p��
	--	Say( OwnerID(), "Y="..Y..", NEW="..NEW)
	end
end


--���H���F����l�@��
function Lua_snowfairy_born_na() 
--Owner ���a
--Target ���H
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
--	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��
	SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY2") ) --�ݦ��M�����o�����a�A���ɹ��R���O�H�P�줣�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FROSTY_NA_17"), "Lua_snowfairy_exchange_na", 0 ) --ú��10�i�ڬO���_�_�ҮѧI�����y
	if CheckBuff( OwnerID(), 508098) == true then --�ˬd���a�O�_�������B����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FROSTY_NA_13"), "Lua_snowfairy_reply_na", 0 ) --��U���ѤF�B����
	end
	sleep(10)
end


function Lua_snowfairy_reply_na()
	SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY1") ) --�i�����_�I�̡A�h���F�A����U�~�බ�Q�����B�����C�̪���i�԰���ɱ`�ƴ��ۤ��P�H�����𮧡A�ݨӦB�����٬O�|�����A�ץX�{�A�Ʊ��ɭԧA����~���U�ڭ̧��o�ѥO�H���w���𮧡C
	if CheckFlag ( OwnerID(), 544422) ==false then
		GiveBodyItem( OwnerID(), 206437,1 )
		SetFlag( OwnerID(), 544422, 1 )
	end
	GiveBodyItem( OwnerID(), 725523, 1 ) --�����y			
	CancelBuff(OwnerID(), 508098)
	BeginPlot( OwnerID(), "Lua_snowmantitle_na", 0) 
end

function Lua_snowfairy_exchange_na()
	if CountBodyItem( OwnerID(), 206437) >= 10 then
		DelBodyItem( OwnerID(), 206437, 10 )
		GiveBodyItem( OwnerID(), 725524, 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY3") ) -- �Ʊ�A�|���w�o��§���C�x�V�`�ּ֡I
	else 
		SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY4") ) --�A���G�S���������ڬO���_�_�ҮѡC
	end
end


function Lua_snowmantitle_na()
	local HIT = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21)
	local HELP = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22)

	if HIT >=1000 and HELP >=100  then
		GiveBodyItem( OwnerID(), 530665, 1)
	end
	if HIT >= 500  then 
		GiveBodyItem( OwnerID(), 530663, 1)
	end
	if HELP >= 500  then
		GiveBodyItem( OwnerID(), 530664, 1)
	end
end	

function Lua_snowfairy_Del_na()
	sleep(1800) --3��������R�����H���F�A10���@��
	DelObj(OwnerID())
end



--���ե�
function Lua_snowman_useitem_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem21, 0)
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem22, 0)
end

function Lua_snowman_hit498_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem21, 498)
end

function Lua_snowman_help498_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem22, 498)
end

function Lua_snowman_useitem998_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem21, 998)
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem22, 998)

end

function Lua_snowman_check_na()
	local HIT = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21)
	local HELP = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22)
	Say( OwnerID(), "Hit="..HIT.."/ Help="..HELP)
end


function Lua_Frostyskillcheck_na()
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 68 then				       	    --/*���M�����A
	--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
		return false
	else
		return TRUE
	end
end

function Lua_frosty_na_deldaily()
	SetFlag( OwnerID(), 544422,0 )
end