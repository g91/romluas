----�U�ƭȼW�[------------------

--EM_LuaValueFlag_UseItem15  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���O�q����
--EM_LuaValueFlag_UseItem16  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���ӱ�����
--EM_LuaValueFlag_UseItem17  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���@�O����
--EM_LuaValueFlag_UseItem18  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I�����z����
--EM_LuaValueFlag_UseItem19  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���믫����

--�O�q
function LuaS_111367_ADDSTR()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 ) --�I������
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --��F�j�ƪ��̤j���סA�L�k�A�I���I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
--		Say(OwnerID(), time )  --�w�I������ -------VAR1
--		Say(OwnerID(), time+1 )  --�����I������
--		Say(OwnerID(), 50-time )  --�|�i�I������ ----VAR2
--		Say(OwnerID(), STR ) --�ثe���ɹL�I��-�O�q
--		Say(OwnerID(), uppoint[time+1] ) --�����|�W�[����O�I��---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --�ݭn���Ӫ��о��I��------------VAR4
--		Say(OwnerID(), STR+uppoint[time+1] ) --�[�L����O��
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE01][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--�ثe�w�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR1]</CR>
		--�|�i�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR2]</CR>
		--�����I��<CR>[$VAR3]</CR>�I<CB>[SC_OLDBRINGNEW_KEY01]</CB>�ݭn<CR>[$VAR4]</CR>�I�о��I�ơA�T�w�n�I���ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTR2", 0 ) --�T�w
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

function LuaS_111367_ADDSTR2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 ) --�I������

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --���������о��I��
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --���ݭn���Ӫ��о��I��
		AddRoleValue( OwnerID() , EM_RoleValue_STR , uppoint[time+1] ) --�����|�W�[����O�I��
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 , 1 ) --����+1 (�O�q)
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD01][$SETVAR1="..uppoint[time+1].."]"   )  --�A���O�q�W�[�F1�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --��p�A�A�S���������a�A�n���i�H�I���I�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end


--�ӱ�
function LuaS_111367_ADDAGI()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 ) --�I������
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --��F�j�ƪ��̤j���סA�L�k�A�I���I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
--		Say(OwnerID(), time )  --�w�I������ -------VAR1
--		Say(OwnerID(), time+1 )  --�����I������
--		Say(OwnerID(), 50-time )  --�|�i�I������ ----VAR2
--		Say(OwnerID(), AGI ) --�ثe���ɹL�I��-�O�q
--		Say(OwnerID(), uppoint[time+1] ) --�����|�W�[����O�I��---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --�ݭn���Ӫ��о��I��------------VAR4
--		Say(OwnerID(), AGI+uppoint[time+1] ) --�[�L����O��
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE02][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--�ثe�w�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR1]</CR>
		--�|�i�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR2]</CR>
		--�����I��<CR>[$VAR3]</CR>�I<CB>[SC_OLDBRINGNEW_KEY01]</CB>�ݭn<CR>[$VAR4]</CR>�I�о��I�ơA�T�w�n�I���ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDAGI2", 0 ) --�T�w
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

function LuaS_111367_ADDAGI2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 ) --�I������

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --���������о��I��
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --���ݭn���Ӫ��о��I��
		AddRoleValue( OwnerID() , EM_RoleValue_AGI , uppoint[time+1] ) --�����|�W�[����O�I��
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 , 1 ) --����+1 (�O�q)
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD02][$SETVAR1="..uppoint[time+1].."]"   )  --�A��XX�W�[�F1�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --��p�A�A�S���������a�A�n���i�H�I���I�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

--�@�O
function LuaS_111367_ADDSTA()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 ) --�I������
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --��F�j�ƪ��̤j���סA�L�k�A�I���I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
--		Say(OwnerID(), time )  --�w�I������ -------VAR1
--		Say(OwnerID(), time+1 )  --�����I������
--		Say(OwnerID(), 50-time )  --�|�i�I������ ----VAR2
--		Say(OwnerID(), STA ) --�ثe���ɹL�I��-
--		Say(OwnerID(), uppoint[time+1] ) --�����|�W�[����O�I��---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --�ݭn���Ӫ��о��I��------------VAR4
--		Say(OwnerID(), STA+uppoint[time+1] ) --�[�L����O��
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE03][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--�ثe�w�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR1]</CR>
		--�|�i�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR2]</CR>
		--�����I��<CR>[$VAR3]</CR>�I<CB>[SC_OLDBRINGNEW_KEY01]</CB>�ݭn<CR>[$VAR4]</CR>�I�о��I�ơA�T�w�n�I���ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTA2", 0 ) --�T�w
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

function LuaS_111367_ADDSTA2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 ) --�I������

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --���������о��I��
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --���ݭn���Ӫ��о��I��
		AddRoleValue( OwnerID() , EM_RoleValue_STA , uppoint[time+1] ) --�����|�W�[����O�I��
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 , 1 ) --����+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD03][$SETVAR1="..uppoint[time+1].."]"   )  --�A��XX�W�[�F1�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --��p�A�A�S���������a�A�n���i�H�I���I�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end


--���z
function LuaS_111367_ADDINT()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 ) --�I������
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --��F�j�ƪ��̤j���סA�L�k�A�I���I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
--		Say(OwnerID(), time )  --�w�I������ -------VAR1
--		Say(OwnerID(), time+1 )  --�����I������
--		Say(OwnerID(), 50-time )  --�|�i�I������ ----VAR2
--		Say(OwnerID(), INT ) --�ثe���ɹL�I��-INT
--		Say(OwnerID(), uppoint[time+1] ) --�����|�W�[����O�I��---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --�ݭn���Ӫ��о��I��------------VAR4
--		Say(OwnerID(), INT+uppoint[time+1] ) --�[�L����O��
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE04][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--�ثe�w�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR1]</CR>
		--�|�i�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR2]</CR>
		--�����I��<CR>[$VAR3]</CR>�I<CB>[SC_OLDBRINGNEW_KEY01]</CB>�ݭn<CR>[$VAR4]</CR>�I�о��I�ơA�T�w�n�I���ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDINT2", 0 ) --�T�w
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

function LuaS_111367_ADDINT2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 ) --�I������

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --���������о��I��
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --���ݭn���Ӫ��о��I��
		AddRoleValue( OwnerID() , EM_RoleValue_INT , uppoint[time+1] ) --�����|�W�[����O�I��
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 , 1 ) --����+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD04][$SETVAR1="..uppoint[time+1].."]"   )  --�A��XX�W�[�F1�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --��p�A�A�S���������a�A�n���i�H�I���I�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

--�믫
function LuaS_111367_ADDMND()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 ) --�I������
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --��F�j�ƪ��̤j���סA�L�k�A�I���I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
--		Say(OwnerID(), time )  --�w�I������ -------VAR1
--		Say(OwnerID(), time+1 )  --�����I������
--		Say(OwnerID(), 50-time )  --�|�i�I������ ----VAR2
--		Say(OwnerID(), MND ) --�ثe���ɹL�I��-MND
--		Say(OwnerID(), uppoint[time+1] ) --�����|�W�[����O�I��---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --�ݭn���Ӫ��о��I��------------VAR4
--		Say(OwnerID(), MND+uppoint[time+1] ) --�[�L����O��
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE05][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--�ثe�w�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR1]</CR>
		--�|�i�I��[SC_OLDBRINGNEW_KEY01]���ơG<CR>[$VAR2]</CR>
		--�����I��<CR>[$VAR3]</CR>�I<CB>[SC_OLDBRINGNEW_KEY01]</CB>�ݭn<CR>[$VAR4]</CR>�I�о��I�ơA�T�w�n�I���ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDMND2", 0 ) --�T�w
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

function LuaS_111367_ADDMND2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --�W�[�I��
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 ) --�I������

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --���������о��I��
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --���ݭn���Ӫ��о��I��
		AddRoleValue( OwnerID() , EM_RoleValue_MND , uppoint[time+1] ) --�����|�W�[����O�I��
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 , 1 ) --����+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD05][$SETVAR1="..uppoint[time+1].."]"   )  --�A��XX�W�[�F1�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --��p�A�A�S���������a�A�n���i�H�I���I�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end


function LuaS_111367_ADDTP()
--	CloseSpeak( OwnerID() )
	local needstr = 10 --�ݨD�I��
	local uppoint = 4500  --�W�[�I��
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE06][$SETVAR1="..needstr.."][$SETVAR2="..uppoint.."]"  )  
	--�A�{�b�I��[$VAR2]�I[SC_OLDBRINGNEW_KEY06]�ݭn[$VAR1]�I�о��I�ơA�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDTP2", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
end

function LuaS_111367_ADDTP2()
	local needstr = 10 --�ݨD�I��
	local uppoint = 4500  --�W�[�I��

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr   then  --���������о��I��
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr ) )  --���о��I��
		AddRoleValue( OwnerID() , EM_RoleValue_TPEXP , uppoint ) --�[
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD06][$SETVAR1="..uppoint.."]"   )  --�A���ޯ��I�ƼW�[
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --��p�A�A�S���������a�A�n���i�H�I���I�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end