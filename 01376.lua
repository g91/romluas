--------------------------------�s�W�ճ��ƥ��`�N�ƶ�---------------------------------
--�j�M function LuaFN_GuildGame_PlayAgain �b���ƥ󤺲K�[�A�ҷs�W���ճ��ƥ���KEYITEM--

function LuaYu_clock_close01() -- �����d�򤺪��a���p�ɾ�
	SetPlot( OwnerID() ,"range",  "LuaYu_clock_close02" , 40 )  
end
function LuaYu_clock_close02() 
	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )
end
function LuaYU_TRainertransport_start()
--Say(OwnerID(),"3")
--Say(TargetID(),"4")	
	SetPlot( TargetID() , "Touch" , "LuaYU_Trainertransport_00" , 150 )	

end
function LuaDan_Trainermotion_0()
	SetPlot( OwnerID() , "Range" , "LuaDan_Trainermotion_1" , 200 )		
end
function LuaDan_Trainermotion_1()
	Say(TargetID(), "Welcome! Welcome!")
	PlayMotion( TargetID(), 112) 
end

function LuaYU_Trainertransport_00()
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
--Say(OwnerID(),"1")
--Say(TargetID(),"2")

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

		SetModeEx( TargetID()   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( TargetID()  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( TargetID() , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( TargetID() , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( TargetID()  , EM_SetModeType_Move, false )--����
		SetModeEx( TargetID() , EM_SetModeType_Obstruct, true )--����
		SetModeEx( TargetID()  , EM_SetModeType_Strikback, false )--����
		SetModeEx( TargetID() , EM_SetModeType_DisableRotate, false )--��V
		SetModeEx( TargetID() , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( TargetID() , EM_SetModeType_NotShowHPMP, false )--��ܦ��
	
		AddBuff( TargetID() , 505921 , 39 , -1 )	--40%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( TargetID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

--	Say( TargetID() ,"TargetID" )--�ճ�
--	Say( OwnerID() ,"OwnerID" )--���a
--		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(),"[GUILD_REMINDER]")
--		else
			CloseSpeak( OwnerID() )  
			SetPlot( TargetID() , "touch" , "Yuyu_GuildWarBuliding_1_02" , 60 )
--		end

	elseif PlayerGuildID ~= BuildingGuildID then
		SetSpeakDetail(OwnerID(),"[GUILD_REMINDER]")
		--ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		--ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
--Say(OwnerID(),"1")players
--Say(TargetID(),"2") building
		--SetPlot( TargetID() , "Touch" , "" , 150 )
		LoadQuestOption(OwnerID())	-- ���J�� NPC ������ ( �]�A��ܤΥ��� )
		--sleep(10)
		--SetSpeakDetail( TargetID(), "[GUILD_NEWGUILDGETREADY]" )
		--AddSpeakOption( TargetID(), OwnerID(), GetString("GUILD_NEWGUILD"), "Sys_CreateGuild_Open", 0 );	--�Хߤ��|
		AddSpeakOption(OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainertransport_01", 0 )--�T�w
		--AddSpeakOption( TargetID(), OwnerID(), "YES" , "",0 )
		BeginPlot( TargetID() , "LuaYU_TRainertransport_start" , 0)
	end
end

function LuaYU_Trainertransport_01()

	local NPCOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID  ) --�өǦb��Ʈw���Τ@ID

	local NpcID= {		112896,			--�ճ��ŧO LV1 �H������
				112897,
				112898,
				112899,
				112900,
				112901,
				112902,
				112903,
				112904,
				112905
					}

	local NpcLV = 0--�����ճ�����
	local Countflag = 0--�O�����a�X�м�

	local NpcFlag= {	542745,--�������		--�ճ����ʺX��
				542748,--�ڭn���U�h
				542244,--�R�B�n�n��
				542175,--�w��շ�
				542176,--�����T�_
				542177,--�����Ԥh
				542178,--�϶˸շ�
				542247,--�i���϶˸շ�
				542248,--�����Ĭ�
				542249 -- LV 10 �T�ӤF(4.0.2 ���X)
					}
	for i = 1 , 10 do
		if NPCOrgID == NpcID[i] then
			NpcLV = i
		end
	end

	for j = 1,NpcLV do
		local play =  CheckFlag( OwnerID()  , NpcFlag[j] ) --�X��
		if play == true then
			Countflag = Countflag+1
		end
	end


	if NpcLV > Countflag then  --�p�G �ճ�����(�i���ƶq) > �ثe�X�мƶq  ����٦��i��������
		CloseSpeak( OwnerID() )  
		WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  NPCOrgID  ) --�ճ�����
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+9  ,  6688  ) --����O�_���i��L���󬡰ʤF
	
		BeginPlot( OwnerID() , "LuaYU_Trainertransport_02" , 0 )  
	else
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
	end

end

function LuaYU_Trainertransport_02()

	if ChangeZone( OwnerID(), 354 , -1 , 5121.3, 13.4, 2515.2, 269.9 ) then   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			--���o���a��¾����
		DesignLog(OwnerID(),354," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��

	end
end


------------------�H�U�� �ճ��ƥ������@��-------------------------

function LuaYU_GuildTrainer_00()

	PlayMotion( TargetID(), 112) 

	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~
  	local GuildGameLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --�ճ�����
	local PlayerRegister = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9  ) --����O�_���i��L���󬡰ʤF
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	if PlayerRegister == 6688 then

		WriteRoleValue(  TargetID()  , EM_RoleValue_PID  ,  GuildGameLV ) --�O��Ӫ��a�����|�ճ�������
		sleep(10)
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+9  ,  0 ) --�����аO��A�Ӫ��a���|���Ťw�Q�O��

	end

	local SchoolLV = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) --�ճ�����
	----------------
	if GuildGameLVArea == nil then
		GuildGameLVArea = {}
	end
	GuildGameLVArea[RoomID] = (SchoolLV - 112895)
	----------------

	local NpcLV= {		112896,		
				112897,
				112898,
				112899,
				112900,
				112901,
				112902,
				112903,
				112904,
				112905
					}
	if CheckBuff(OwnerID(),502941) ~= TRUE then
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME00] "   ) --�L�Q���|���A�n�I�ڬO[112066]�A�аݧA�Q�n�i�椰�򬡰ʡH

--		if PlayerVoc == 0 then   --GM

			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME01] " , "LuaYU_GuildTrainer_G01", 0 ) --1.�������
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME02] " , "LuaYU_GuildTrainer_G02", 0 ) --2.�ڭn���U�h
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME03] " , "LuaYU_GuildTrainer_G03", 0 ) --3.�R�B�n�n��
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME04] " , "LuaYU_GuildTrainer_G04", 0 ) --4.�w��շ�
			AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME_05] " , "LuaYU_GuildTrainer_G05", 0 ) --5.�����T�_
			
			AddSpeakOption( OwnerID(), TargetID(), "[SC_DAN_112698_34]" , "LuaYU_GuildTrainer_01", 0 ) --�U�@��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --���}�ճ���^���|��
--		else
--			if SchoolLV >= NpcLV[1] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME01] " , "LuaYU_GuildTrainer_G01", 0 ) --1.�������
--			end
--			if SchoolLV >= NpcLV[2] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME02] " , "LuaYU_GuildTrainer_G02", 0 ) --2.�ڭn���U�h
--			end
--			if SchoolLV >= NpcLV[3] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME03] " , "LuaYU_GuildTrainer_G03", 0 ) --3.�R�B�n�n��
--			end
--			if SchoolLV >= NpcLV[4] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME04] " , "LuaYU_GuildTrainer_G04", 0 ) --4.�w��շ�
--			end
--			if SchoolLV >= NpcLV[5] then
--				AddSpeakOption( OwnerID(), TargetID(), " [SC_GUILDGAME_05]" , "LuaYU_GuildTrainer_G05", 0 ) --5.�����T�_
--			end
--			if SchoolLV >= NpcLV[6] then
--				AddSpeakOption( OwnerID(), TargetID(), "[SC_DAN_112698_34]" , "LuaYU_GuildTrainer_01", 0 ) --�U�@��
--			end
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --���}�ճ���^���|��
--		end
	else
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME00_STOP] "   ) --�ܩ�p�A�z�{�b�����{��Ǫ������L�k�ѻP�ճ����S�V�C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) 
	end
end

function LuaYU_GuildTrainer_01()

	PlayMotion( TargetID(), 112) 

	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	local SchoolLV = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) -- �ճ�����

	local NpcLV= {		112896,		
				112897,
				112898,
				112899,
				112900,
				112901,
				112902,
				112903,
				112904,
				112905
					}

	SetSpeakDetail( OwnerID(), " [SC_GUILDGAME00] "   ) --�L�Q���|���A�n�I�ڬO[112066]�A�аݧA�Q�n�i�椰�򬡰ʡH


--	if PlayerVoc == 0 then   --GM

		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_06]" , "LuaYU_GuildTrainer_G06", 0 ) --6.�����Ԥh
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_07]" , "LuaYU_GuildTrainer_G07", 0 ) --7.�϶˸շ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_08]" , "LuaYU_GuildTrainer_G08", 0 ) --8.�i���϶˸շ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_09]" , "LuaYU_GuildTrainer_G09", 0 ) --9.�����Ĭ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_10]" , "LuaYU_GuildTrainer_G10", 0 ) --10. �T�ӤF�I (4.0.2 ���X)
		
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --���}�ճ���^���|��
--	else
--		if SchoolLV >= NpcLV[6]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_06]" , "LuaYU_GuildTrainer_G06", 0 ) --6.�����Ԥh
--		end
--		if SchoolLV >= NpcLV[7]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_07]" , "LuaYU_GuildTrainer_G07", 0 ) --7.�϶˸շ�
--		end
--		if SchoolLV >= NpcLV[8]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_08]" , "LuaYU_GuildTrainer_G08", 0 ) --8.�i���϶˸շ�
--		end
--		if SchoolLV >= NpcLV[9]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_09]" , "LuaYU_GuildTrainer_G09", 0 ) --9.�����Ĭ�
--		end
--		if SchoolLV >= NpcLV[10]  then
--			AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME_10]" , "LuaYU_GuildTrainer_G10", 0 ) --10. �T�ӤF (4.0.2���X)
--		end
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGAME06]" , "LuaYU_Guild_House_Enter2", 0 ) --���}�ճ���^���|��
--	end
	
end

-----------------------------------�ĤG�h--------------------------------------------�T�{�ﶵ-------------------------------------------

function LuaYU_GuildTrainer_G01() --�������

	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542745 ) --���Ѥw�g�ӹL
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~


	if CheckBuff (OwnerID(), 503783) == true then 
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

	else	
		If play == true and PlayerVoc ~= 0 then

			SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

		else
			SetSpeakDetail(OwnerID(), "[GUILD_TC_HITPLATYPUS]" )                                   --�ճ��Щx��ܤ��e
			AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_1]", "LuaDan_113034_Teleportion6", 0) --����C�����e
			AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_2]", "LuaDan_113034_Teleportion5", 0) --�i�J�C��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

		end
	end
	

end
-----------------------------------------
function LuaYU_GuildTrainer_G02() --�ڭn���U�h

	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542748 ) --���Ѥw�g�ӹL
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	If play == true and PlayerVoc ~= 0 then

		SetSpeakDetail( OwnerID(), "[SC_112502_END]") --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

	else

		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME05]  "   ) --�A�ҿ�ܪ��S�V���ʬO�G�ڭn���U�h �A�O�_�T�w�i��H
		AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_1]", "LuaDan_SurvivalGame_Info", 0) --����C�����e
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "Lua_TC_TalkScript2", 0 ) --�T�w
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G03() --�R�B�n�n��

	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542244 ) --���Ѥw�g�ӹL
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	If play == true and PlayerVoc ~= 0 then

		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

	else
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME03_1] "   ) --�A�ҿ�ܪ��S�V���ʬO�G�R�B�n�n�� �A�O�_�T�w�i��H
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "LuaYU_ClickFunGo", 0 )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start03", 0 ) --�T�w
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��

	end

end
-----------------------------------------
function LuaYU_GuildTrainer_G04() --�w��շ�
	
	PlayMotion( TargetID(), 112)
	
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	if CheckFlag( OwnerID()  , 542175 ) == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else
		SetSpeakDetail( OwnerID(), " [SC_GUILDGAME04_1] "   ) --���I�A��ܪ��O �w��շ� �A�Q�n���զۤv�������ܡH
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_FN_DDR_teach", 0 )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start04", 0 ) --�T�w
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G05() --�����T�_
	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542176) --���Ѥw�g�ӹL
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	If play == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else
			SetSpeakDetail( OwnerID(), "[SC_SW_CHOSEONE]" )--�A�Q��ܭ��@��H
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_SW_JOINWHITE]" , "Lua_SW_TalkScript1", 0 ) --�ڷQ����
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_SW_JOINBLACK]" , "Lua_SW_TalkScript2", 0 ) --�ڷQ����
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G06() --�����Ԥh
	PlayMotion( TargetID(), 112) 

	local play =  CheckFlag( OwnerID()  , 542177 ) --���Ѥw�g�ӹL
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	if CheckBuff (OwnerID(), 503783) == true then 
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else	
		If play == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
		else
		SetSpeakDetail( OwnerID(), " [SC_GUILD_WARRIOR_6] "   ) -- �A�T�w�n�ѥ[���嬡�� - �����Ԥh�ܡH
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_Hao_GuildwarriorGo", 0 ) -- �C���о�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start06", 0 ) --�T�w�@�ǰe��NPC
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
		end
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G07()--�϶˸շ�
	PlayMotion( TargetID(), 112)
	
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	if CheckFlag( OwnerID()  , 542178 ) == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else
		SetSpeakDetail( OwnerID(), " [SC_RESCUE_STRING_NAME] "   ) --���I�A��ܪ��O �϶˸շ� �A�Q�n���զۤv�������ܡH
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_FN_RESCUE_RULE", 0 ) -- �C���о�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start07", 0 ) --�T�w
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G08()--�i���϶˸շ�
	PlayMotion( TargetID(), 112)
	
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	if CheckFlag( OwnerID()  , 542247 ) == true and PlayerVoc ~= 0 then
		SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else
		SetSpeakDetail( OwnerID(), " [SC_RESCUEII_STRING_NAME] "   ) --���I�A��ܪ��O �i���϶˸շ� �A�Q�n���զۤv�������ܡH
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_TC_HITPLATYPUS_1]"  , "Lua_FN_RESCUEII_RULE", 0 ) -- �C���о�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_Trainer_Start08", 0 ) --�T�w
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G09()--�����Ĭ�

	PlayMotion( TargetID() , 112 ) 

	local play =  CheckFlag( OwnerID()  , 542248 ) --���Ѥw�g�ӹL
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	if CheckBuff ( OwnerID() , 503783 ) == true then 
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else	
		If play == true and PlayerVoc ~= 0 then
			SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
		else
			SetSpeakDetail( OwnerID(), " [SC_GUILD_BARRAGE_11] "   ) -- �A�T�w�n�ѥ[�շҬ��� - �����Ĭ�ܡH
			AddSpeakOption( OwnerID() , TargetID() , "[GUILD_TC_HITPLATYPUS_1]" , "Lua_Hao_Guild_Barrage", 0 ) -- �C���о�
			AddSpeakOption( OwnerID() , TargetID() , "[SC_202800_2]" , "LuaYU_Trainer_Start09", 0 ) --�T�w�@�ǰe��NPC
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
		end
	end
end
-----------------------------------------
function LuaYU_GuildTrainer_G10()  -- ����10 �T�ӤF (4.0.2)

	PlayMotion( TargetID() , 112 ) 

	local play =  CheckFlag( OwnerID()  , 542249 ) --���Ѥw�g�ӹL (LV10�� KEY )
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~

	if CheckBuff ( OwnerID() , 503783 ) == true then 
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
	else	
		If play == true and PlayerVoc ~= 0 then
			SetSpeakDetail( OwnerID(), "[SC_112502_END]"   ) --���Ѫ��L�o!
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_00", 0 ) --�^�W�@��
		else
			SetSpeakDetail( OwnerID(), "[SC_TRAIN10_NPC_SPEAK00]"   ) -- �г�10 �Щx��ܤ��e
			AddSpeakOption( OwnerID() , TargetID() , "[GUILD_TC_HITPLATYPUS_1]" , "lua_mika_wolfcome_intro", 0 ) -- �C���о� 
			AddSpeakOption( OwnerID() , TargetID() , "[SC_202800_2]" , "LuaYU_Trainer_Start10", 0 ) --�T�w�@�ǰe�ܬ���NPC
			AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
		end
	end

end

function LuaYU_ClickFunGo()

		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID(), 112) 
		SetSpeakDetail(  OwnerID(), " [SC_CLICKFUNGO08] "  ) 
--�y�R�B�n�n���z�ҵ{�`�N�ƶ��A
	--1.�C���ɶ�5�����C
	--2.10�^�X���C�^�X�X�{�ƶq���P���_�c�A�}�����T��[112068]�N��o<CB>���y����</CB>�C
	--3.���y��������<CB>[205017]</CB>�P<CB>[205018]</CB>�b�C��������N�i�I�����y§�~�C
--�t�~�A�b�C���L�{���ڤ]�|�����۹諸���ܨ�U�A�ЯS�O�`�N�A���z�n�B�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G03", 0 )--�^�W�@��

end

function Lua_Hao_GuildwarriorGo() -- �����Ԥh�о�

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(  OwnerID(), " [SC_GUILD_WARRIOR_4] " ) 
--	�y�����Ԥh�z�ҵ{�`�N�ƶ��G
--	1.�C���ɶ�<CS>15</CS>�����A�Цb�ɭ����A���˧�h���ؼСC
--	2.����<CM>�C�B�ޡB�����A</CM>�ޯవ�ഫ�A�H�ۤv���A���ʰ��վ�C
--	3.�b�U�ث��A�U�A���ѧ�h���ؼСA�i�H��o��h��<CM>�ޯ�</CM>��<CM>�j�ƪk�N</CM>�C
--	4.��C���ɶ������A�N�H�ֿn�����ƴ������y�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G06", 0 )--�^�W�@��
end

function Lua_Hao_Guild_Barrage() -- �����Ĭ�о�

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 112 ) 
	SetSpeakDetail( OwnerID() , " [SC_GUILD_BARRAGE_7]" ) 
--�y�����Ĭ�z�ҵ{�`�N�ƶ��G
--�@�շҮɶ���<CY>2</CY>�����A�շҶ}�l��|��o<CY>[507593]</CY>�A�åB�}�l�X�{<CY>����B�Ŧ�B����</CY>�T�ط|���ʪ��y�C
--�@�@(1).�C���IĲ��<CY>����y</CY>�ɡA�|���<CR>1</CR>�I<CY>[507593]</CY>�A��<CY>[507593]</CY>��֦�<CR>0</CR>�ɡA�շҧY�����C
--�@�@(2).�C���IĲ��<CY>�Ŧ�y</CY>�ɡA�|��o<CY>����</CY>��<CY>�Ųy�ĪG</CY>�A�ĪG�ɶ������иIĲ�Ŧ�y�ɡA�|�̷��Ųy�ĪG��������o�B�~�����Ƥγt�סC
--�@�@(3).�C���IĲ��<CY>����y</CY>�ɡA�|��o<CY>�@�ض��y�ĪG</CY>�A�ĪG�ɶ������иIĲ����y�ɡA�|��o<CY>10</CY>�I���ơA�����|Ĳ�o�䥦���y�ĪG�C
--�@�շҵ����ɡA�|�̷ӹC���ɨ��o�����ơA���⬰<CY>�a�A�I��</CY>�������y
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G09", 0 )--�^�W�@��
end

-- �г�10 �T�ӤF �W�h (�Ω�Щxnpc ����npc�ﶵ)
function lua_mika_wolfcome_intro()

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 112 ) 
	SetSpeakDetail( OwnerID(), "[SC_TRAIN10_MSG_00]"   ) -- �W�h����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_GuildTrainer_G10", 0 )--�^�W�@��
end

-----------------------------------���ĤT�h-------------------------------------------�ǰe�ö}�ҩҦ�NPC------------------------------------------

function LuaYU_Trainer_Start01()

	CloseSpeak( OwnerID() )  



end
function LuaYU_Trainer_Start02()

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TC_JOINGAME]" , "Lua_TC_TalkScript2", 0 ) --�ڷQ���W	

end

function LuaYU_Trainer_Start03() -- �R�B�n�n��

	CloseSpeak( OwnerID() )  

--	Say(OwnerID() ,"0")
--	Say(TargetID() ,"1")

	BeginPlot(  TargetID()   , "LuaYU_Trainer_Start03_2" , 0 )  	
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	PlayMotion( TargetID(), 111) 

end

function LuaYU_Trainer_Start03_2()

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local CenterNPC = CreateObjByFlag( 112067 , 780308 , 0 , 1 );	--����NPC   �ճ��Щx
	
	SetModeEx( CenterNPC   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( CenterNPC , EM_SetModeType_Obstruct, false )--����
	SetModeEx( CenterNPC  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( CenterNPC    , EM_SetModeType_Move, false )--����
	SetModeEx( CenterNPC  , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( CenterNPC, RoomID) 

	Hide( CenterNPC )
	Show( CenterNPC , RoomID)

	AddBuff( TargetID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	ChangeZone( TargetID(), 354 , RoomID , 2092.4, 13.4, 3436.4, 270.0)
	SetFlag( TargetID()  , 542244 , 1 ) -- ���n���~

end
function LuaYU_Trainer_Start04() --�w��շ�
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)

	AddBuff( OwnerID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	ChangeZone( OwnerID(), 354 , RoomID , 2052.6, 44.5, 2604.1, 91.5)
	CloseSpeak( OwnerID())  
end
function LuaYU_Trainer_Start05()

	CloseSpeak( OwnerID() )  


end
function LuaYU_Trainer_Start06() --�����Ԥh

	CloseSpeak( OwnerID() )  
	BeginPlot(  TargetID()   , "LuaYU_Trainer_Start06_2" , 0 )  	
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	PlayMotion( TargetID(), 111) 
end
function LuaYU_Trainer_Start06_2() --�����Ԥh

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local QNPC = CreateObjByFlag( 114332 , 780371 , 0 , 1 )	--����NPC   �ճ��Щx

	SetModeEx( QNPC , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( QNPC , EM_SetModeType_Obstruct, false )--����
	SetModeEx( QNPC , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( QNPC , EM_SetModeType_Move, false )--����
	SetModeEx( QNPC , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( QNPC , RoomID) 

	Hide( QNPC )
	Show( QNPC , RoomID)

	Beginplot( QNPC , "Lua_Hao_Guildwarrior_Clear" , 0 )

	AddBuff( TargetID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	ChangeZone( TargetID() , 354 , RoomID , 4110.1 , 16.3 , 3337.4 , 269.7 )	
end
function LuaYU_Trainer_Start07() --�϶˸շ�
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)

	AddBuff( OwnerID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)
	ChangeZone( OwnerID(), 354 , RoomID , 3101.6 ,20.8 ,2455.4, 273.2)
	CloseSpeak( OwnerID())  
end
function LuaYU_Trainer_Start08() --�i���϶˸շ�
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)

	AddBuff( OwnerID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)
	ChangeZone( OwnerID(), 354 , RoomID , 4097.9 ,13.4 ,2451.8, 270.2)
	CloseSpeak( OwnerID() ) 
end
function LuaYU_Trainer_Start09()

	CloseSpeak( OwnerID() )  
	BeginPlot( TargetID() , "LuaYU_Trainer_Start09_2" , 0 )  	
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID(), 111) 
end
function LuaYU_Trainer_Start09_2()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local QNPC = CreateObjByFlag( 116472 , 780373 , 0 , 1 )	--����NPC   �ճ��Щx

	SetModeEx( QNPC , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( QNPC , EM_SetModeType_Obstruct, false )--����
	SetModeEx( QNPC , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( QNPC , EM_SetModeType_Move, false )--����
	SetModeEx( QNPC , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( QNPC , RoomID)

	AddBuff( TargetID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	ChangeZone( TargetID() , 354 , RoomID , 4110.1 , 16.3 , 3468.4 , 269.7 )
end

function LuaYU_Trainer_Start10()  --�г�10 �ǰe (4.0.2)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)
	local Xpos = 5385
	local Ypos = 40
	local Zpos = 4942
	local dir = 160

	CloseSpeak( OwnerID())  
	AddBuff( OwnerID() ,507602 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	ChangeZone( OwnerID(), 354 , RoomID , Xpos , Ypos, Zpos, dir )
end

function LuaYU_Guild_House_Enter2()


	--Say(OwnerID() ,"OwnerID=".." 1 "  )
	--Say(TargetID() ,"TargetID=".." 1 "  )

	local GuildStateID = GuildState( OwnerID() )			-- 0 �S�����| 1 �s�p���| 2 �@�뤽�|(�٭n�P�_�O�_�����|���A�H�Τ��|����)

	if ( GuildStateID >= 2 ) then

		if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) ==1 then   ---���|��

			OpenVisitGuildHouse( true ); --�^�ۤv�Ы�
			CloseSpeak( OwnerID() )		-- ������ܵ���
	--Say(OwnerID() ,"OwnerID=".." 2 " .."G="..GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) )
	--Say(TargetID() ,"TargetID=".." 2 ".."G="..GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) )
		else
			SetSpeakDetail( OwnerID(), "[GUILD_BUILD_5]" )

	--Say(OwnerID() ,"OwnerID=".." 3 "  )
	--Say(TargetID() ,"TargetID=".." 3 "  )
		end
			
	else
		SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )
		AddBuff( OwnerID() ,507602 ,1 , 1 )
		sleep(10)	
		ChangeZone( OwnerID(), 2, 0, 4745.0, 115.7, -1968.0, 51.0)

	--Say(OwnerID() ,"OwnerID=".." 4 "  )
	--Say(TargetID() ,"TargetID=".." 4 "  )

	end
end

function LuaDan_SurvivalGame_Info() --�ڭn���U�h�C������

	SetSpeakDetail( OwnerID(), "[SC_GUILDGAME08]"   ) --�A�ҿ�ܪ��S�V���ʬO�G�ڭn���U�h �A�O�_�T�w�i��H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_G02", 0 ) --�^�W�@��
end

function LuaFN_GuildGame_PlayAgain( Option )      -- ���|�ճ����m��
	if ( Option == "USE" ) then
		SetFlag( OwnerID() , 542745 , 0 ) -- �������
		SetFlag( OwnerID() , 542244 , 0 ) -- �R�B�n�n��
		SetFlag( OwnerID() , 542748 , 0 ) -- �ڭn���U�h
		SetFlag( OwnerID() , 542176 , 0 ) -- �����T�_
		SetFlag( OwnerID() , 542177 , 0 ) -- �����Ԥh
		SetFlag( OwnerID() , 542175 , 0 ) -- �w��շ�
		SetFlag( OwnerID() , 542178 , 0 ) -- �϶˸շ�
		SetFlag( OwnerID() , 542247 , 0 ) -- �϶˸շ�2
		SetFlag( OwnerID() , 542248 , 0 ) -- �����Ĭ�
		SetFlag( OwnerID() , 542249 , 0 ) -- �T�ӤF (4.0.2 �}�� )
		Sleep(10)

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_GUILDGAME_11]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_GUILDGAME_11]" , C_SYSTEM )  --���mOK
	end
end

function FN_GuildGame_Honor( Player, Score )
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local GuildGameLV = GuildGameLVArea[RoomID]
	Score = Score * (0.9+(0.1*GuildGameLV))
	CallPlot( Player , "YOYO_GetTokenValue" , 7 , Score ) --�W�[�a�A�I��
	--ScriptMessage( Player, Player, 3, "[GUILD_TC_HITPLATYPUS_REWARD]"..Score, C_SYSTEM)	--�ª��T��
end