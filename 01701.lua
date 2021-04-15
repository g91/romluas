function LuaS_114350_0()
	if CheckFlag( OwnerID() , 543616 ) then
		SetSpeakDetail( OwnerID(),  "[SC_114350_0]" ) 
		--�A��{���ܦn�I�����A���^���q�ɤ��C
		--���M�O�Ȯɪ��A���ڭ̥i�H�w�ߤ@�}�l�F�C
		--���§A�����U�C
	else
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_1]" ,"LuaS_114350_1", 0 ) --�߰ݥL�b�o�̪���]
	if (CheckAcceptQuest( OwnerID() , 422862 ) == true or CheckAcceptQuest( OwnerID() , 422929 ) == true ) and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 7 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --�߰ݭn�������
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_3]" ,"LuaS_114350_3", 0 ) --���X�Ѧۤv����������ĳ
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 0  then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --�߰ݦۤv�������������
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_3]" ,"LuaS_114350_3", 0 ) --���X�Ѧۤv����������ĳ
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == OwnerID() and ReadRoleValue(TargetID() , EM_RoleValue_Register + 1 ) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_13]" ,"LuaS_114350_5", 0 ) --�ŧi�Ȯɩ��
	end
end

function LuaS_114350_1()
		SetSpeakDetail( OwnerID(),  "[SC_114350_4]" )
		 --�o�̥X�{�F�|���o�X�޲��]�k��q�������A�o���]�k��q�v�T�F�o���񪺦۵M���O�A�y�����ҥH�Υͪ����ͲV�áC
		 --�ڧ���k�i�H�N�����e�ܯ�q�ɤ��A�b���̥��̵L�k�v�T�ڭ̩ҳB�o�@�ɡA�����G���t�@�ѤO�q�l�޵ۥL�̨Ө�o�ӥ@��......
		 --�]���ڥ����u�@�b�o�̡A���ݤ������{�X�Ӫ��ɭԦA���N�L�����^��q�ɡC
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --�^��W�@��
end

function LuaS_114350_2()
		SetSpeakDetail( OwnerID(),  "[SC_114350_5]" )
		 --�����ܡH��......�A�O�Ӵ˪L����......�n�I
		 --�p�G�Q�ʪ����ݤ����X�{�A������ɭԷ|�ӶO�j�q�믫�A���p�G�b������q�|���R�K���ɭԴN�⥦�̱q��q�ɩԥX�ӡA�ñj�����L�̧�O�q���񱼡A�o�˴N�i�H����믫�a�����̦^���q�ɡC
		 --�ӥB�o������X�Ӫ���q�b�ڭ̪��ʱ��U�]���|��P�D�y���v�T�C
		 --
		 --��k�O�o�˪��A�o��Ӥ������O�a�ۤ��P�ۦ쪺��q�A�u�n���ͪ�����A�o�ǯ�q�N�|�ֿn�b�ͪ����餺�C
		 --�ӳo�ǯ�q���ӯS��A���P�ۦ쪺��q����ɷ|���۩�P�A�åB�|����X����d��P�D���`�i�ʪ��O�q�A�ڭ̴N�O�n�Q�γo�ӯS�x������W�����`�i�ʯ�q�d��ܹs�C
		 --
		 --�A�M�A���٦�n�����Ʊ��N�O�U����a�@�جۦ쪺��q�A�æb������������X�d��`�i�ʪ��O�q�C
		 --���o��Ӥ����|�����o��v�T�A�p�G�@�Ӥ������h�F�O�q�ӥt�@�Ӥ����٨㦳�O�q���ܡA�L�@�q�ɶ����h�O�q�������]�|�^��R���O�q�����A�A�ҥH������Ӥ����b�u�ɶ����P�ɶi�J���h�O�q�����p�O�ܭ��n���C
		 --
		 --�٦��A�`�N�@��ơA�A������b����X�O�q��u�ɶ����|�L�k�A���Ө����e�ҩӨ����ۦP�O�q�A�p�G�b����ۦP�O�q���v�T�A�A���餣�ȷ|���ˡA�ٷ|���o�X�W�T���O�q��������o�R��C
		 --���F�o�ر��ΥH�~�A�O�q�b�A�餺�n�W�Ӥ[�άO�A�b�餺���O�q�|�������e�S�����F��h�P�˪��O�q�A�o���|�y���ۦP�����p�C
		 --
		 --�������I�����A���A�չL�X�����ӴN���A�ѧکһ����C
		 --�p�G�A�P�즳�M�I�N���Ȯ����������@�I�A����_����A�~��o�ӥ��ȡC
		 --���L�p�G�W�L�@�w���ɶ��A�����|��P�D�}�l���ͥä[���v�T�A���F�קK�o�ͳo�ӨƱ��A�ڷ|�j��N�����e�^��q�ɡA�ҥH�A�������֧����o�ӥ��ȡC
		if (CheckAcceptQuest(OwnerID() , 422862 ) == true or CheckAcceptQuest( OwnerID() , 422929 ) == true) and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 7 then
		 	AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --�w�g���D�覡�A�}�l�������
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 0  then	
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --�w�g���D�覡�A�}�l�������	 
		end
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --�^��W�@��
end

function LuaS_114350_3()
		SetSpeakDetail( OwnerID(),  "[SC_114350_6]" )
		 --�A���D�n�����Ʊ��O����ܡH
 		if (CheckAcceptQuest(OwnerID() , 422862 ) == true or CheckAcceptQuest( OwnerID() , 422929 ) == true) and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 7 then
 			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --�߰ݭn�������
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --�w�g���D�覡�A�}�l�������
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 0  then
 			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --�߰ݭn�������
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --�w�g���D�覡�A�}�l�������
		end
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --�^��W�@��
end

function LuaS_114350_4()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		CloseSpeak( OwnerID() )
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
				local ID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
				if CheckID(ID) == false or ReadRoleValue(ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(ID , EM_RoleValue_IsNPC ) == 1 then
					Say( TargetID() , "[SC_114350_12]" ) --�{�b��������q�٨S�����ӺɡA�ڻݭn�A���O�q�C
				else
					local Name = GetName( ID )
					local Str = "[SC_114350_8][$SETVAR1="..Name.."]" --�ثe[$VAR1]���b����o�ӥ��ȡA�γ\�A�i�H���U�L�C
					Say( TargetID() ,  Str ) 
				end
		else
				WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
				WriteRoleValue( TargetID() , EM_RoleValue_Register + 1 , 777 )				
				Say( TargetID() ,  "[SC_114350_9]" ) --�ڲ{�b�ߨ������q��q�ɤ��ޥX�ӡC
				BeginPlot( TargetID() , "LuaS_114350_Work" , 0 )
		end
	else
		local Name = GetName( ReadRoleValue( OwnerID() , EM_RoleValue_Register ) )
		local Str = "[SC_114350_8][$SETVAR1="..Name.."]" --�ثe[$VAR1]���b����o�ӥ��ȡA�γ\�A�i�H���U�L�C
		SetSpeakDetail( OwnerID(),  Str )
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --�^��W�@��
	end
end

function LuaS_114350_5()
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID() , EM_RoleValue_Register + 1 , 0 )
end

function LuaS_114350_Work()
	Addbuff( OwnerID() , 504935 , 0 , -1 )
	Addbuff( OwnerID() , 504936 , 0 , -1 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	local Flag = 780534
	local Tower = {}
	local Point = {}
	Tower[1] = CreateObjByFlag( 102977 , Flag , 1 , 1 )
	Tower[2] = CreateObjByFlag( 102977 , Flag , 2 , 1 )
	Point[1] = CreateObjByFlag( 112307 , Flag , 1 , 1 )
	Point[2] = CreateObjByFlag( 112307 , Flag , 2 , 1 )
	for i = 1 , 2 , 1 do
		Lua_ObjDontTouch( Point[i] ) 
		AddToPartition( Point[i] , 0 )
	end
	local Buff = { 505856 , 505857 }
	local DeBuff = {505860 , 505861 }
	local Result = 0
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	for i = 1 , 2 , 1 do
		if i == 1 then
			WriteRoleValue( Tower[i], EM_RoleValue_PID , Tower[2] )
			WriteRoleValue( Tower[i] , EM_RoleValue_Register , Buff[2] )
		else
			WriteRoleValue( Tower[i] , EM_RoleValue_PID , Tower[1] )
			WriteRoleValue( Tower[i] , EM_RoleValue_Register , Buff[1] )
		end
		SetModeEX( Tower[i] , EM_SetModeType_Move , false )
		AddToPartition( Tower[i] , 0 )
		SetPlot( Tower[i] , "dead" , "LuaI_102977_dead" , 0 )
		BeginPlot( Tower[i] , "LuaI_102977_ReBuff" , 0 )
		AddBuff( Tower[i] , Buff[i] , 9 , -1 )
		AddBuff( Tower[i] , 504113 , 0 , -1 )
		WriteRoleValue( Tower[i] , EM_RoleValue_Register+1 , Buff[i] )
		CastSpell( Point[i] , Point[i] ,493776 )
	end
	for i = 1 , 300 , 1 do
		if CheckBuff(Tower[1] , DeBuff[1]) == true and CheckBuff(Tower[2] , DeBuff[2]) == true then
			Result = 1
			break 
		end
		if ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1 ) == 0 then
			Result = 2
			break
		end
		if i > 30 then
			if CheckID(player) == false or ReadRoleValue(player , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(player , EM_RoleValue_IsNPC ) == 1 or GetDistance( OwnerID() , Player ) > 350 then
				local Check = 0
				for i = 1 , 2 , 1 do
					if 	HateListCount( Tower[i] ) > 0 then
						for i = 1 , HateListCount( Tower[i] ) , 1 do
							local ID = HateListInfo(Tower[i]  ,i-1 , EM_HateListInfoType_GItemID )
							if ReadRoleValue(ID , EM_RoleValue_IsPlayer ) == 1 then
								player = ID
								WriteRoleValue( OwnerID() , EM_RoleValue_Register ,player)
								break
							end
						end
						Check = 1
						break 
					end
				end
				if Check == 0 then
					Result = 2
					break
				end
			end
		end
		if i/10 == math.floor( i / 10 ) then
			for j = 1 , 2 , 1 do
			--	if CheckBuff(Tower[j] , Buff[j] ) == true then
					CastSpell( Tower[j] , Tower[j] , 495033 )
			--	end
			end
		end
		if i == 270 then
				Yell(  OwnerID() , "[SC_102977_TIME_LIMIT_1]" , 3 ) --�о��֡A���������Ҫ��v�T�}�l�W�j�F�I
		end
		if i == 290 then
				Yell(  OwnerID() , "[SC_102977_TIME_LIMIT_2]" , 3 ) --�֨Ӥ��ΤF�A�ڭn�ǳƶ}�l�N�o�Ǥ������^��q�ɤF�I
		end
		sleep(10)
	end
	Cancelbuff( OwnerID() , 504935 )
	Cancelbuff( OwnerID() , 504936 )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_END)
	if Result == 1 then
		Yell( OwnerID() ,  "[SC_114350_10]" , 3) --�ܦn�I�����n�^���q�ɤF�I
	else
		if Result == 0 then
			Yell( OwnerID() ,  "[SC_114350_11]" , 3) --����I����A��U�h�F�I�ڥ����ߨ�����o�Ǥ����^���q�ɡI
		else
			Yell( OwnerID() ,  "[SC_114350_14]" , 3) --�ݨӨƱ��i�檺�ä����Q......�ڰ��W�N��������^��q�ɡC
		end
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_SP01 )
	end
	for i = 1 , 2 , 1 do
		CastSpell( Point[i] , Point[i] ,492668 )
		WriteRoleValue( Point[i] , EM_RoleValue_LiveTime , 3 )
	end
	for i = 1 , 2 , 1 do
		DelObj( Tower[i] )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_102977_dead()
	return false
end

function LuaI_102977_ReBuff()
	local Battle = 0
	local Reload = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			if Battle == 0 then
				Battle = 1
			end
		else
			if Battle == 1 then
				Battle = 0
				if CheckBuff( OwnerID() , Reload + 4 ) == false then
					Lua_CancelAllBuff( OwnerID() ) 
					local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
					local Reload = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
					AddBuff( OwnerID() , Reload , 9 , -1 )
				end
			end
		end
		sleep( 60 )
	end
end

function Lua_505858_Check() 
	if CheckBuff( OwnerID() , 505860 ) == false then
		if CheckBuff(TargetID() , 505858 ) == true then
			CastSpell( TargetID() , TargetID() , 495035 )
			return false
		end
		if CheckBuff(TargetID() , 505860 ) == true then
			CancelBuff( TargetID() , 505860 )
			CastSpell( TargetID() , TargetID() , 495035 )
			return true
		end
	else
		if CheckBuff(TargetID() , 505858 ) == true then
			return false
		end
		if CheckBuff(TargetID() , 505860 ) == true then
			CancelBuff( TargetID() , 505860 )
			return true
		end	
	end
	return true
end

function Lua_505859_Check() 
	if CheckBuff( OwnerID() , 505861 ) == false then
		if CheckBuff(TargetID() , 505859 ) == true then
			CastSpell( TargetID() , TargetID() , 495035 )
			return false
		end
		if CheckBuff(TargetID() , 505861 ) == true then
			CancelBuff( TargetID() , 505861 )
			CastSpell( TargetID() , TargetID() , 495035 )
			return true
		end
	else
		if CheckBuff(TargetID() , 505859 ) == true then
			return false
		end
		if CheckBuff(TargetID() , 505861 ) == true then
			CancelBuff( TargetID() , 505861 )
			return true
		end
	end
	return true
end

function Lua_505863_Check() 
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ==  102977 then
		local Buff = 0
		if CheckBuff( TargetID() , 505856 ) == true then
			Buff = 505856 
		end
		if CheckBuff( TargetID() , 505857 ) == true then
			Buff = 505857
		end
		if Buff~= 0 then
			Lua_SubtractBuff( TargetID() , Buff , 0 , 0 ) 
			if CheckBuff( TargetID() , Buff ) == false then
				local Another = ReadRoleValue( TargetID() , EM_RoleValue_PID )
				local AnotherBuff = ReadRoleValue( TargetID() , EM_RoleValue_Register )
				if CheckBuff( Another , AnotherBuff ) == false then
					local Count = HateListCount( TargetID() )
					for i = 1 , Count , 1 do
						local ID = HateListInfo(TargetID() ,i-1 , EM_HateListInfoType_GItemID )
						if CheckAcceptQuest( ID , 422862 ) == true or CheckAcceptQuest( ID , 422929 ) == true then
							SetFlag( ID , 543616 , 1 )
						end
					end
				end
				Lua_CancelAllBuff( TargetID()) 
				SetStopAttack(TargetID() )
				AddBuff( OwnerID() , 504113 , 0 , -1 )
				--SetRoleCamp( TargetID() , "Visitor" )
				AddBuff( TargetID()  , Buff + 4 , 0 , 15 )
			end
		end
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then
		local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 , 102106 , 102107, 102108, 102297, 102324, 102325, 102803 }	
		for pry , obj in pairs(PetID) do
			if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == obj then
				return true
			end
		end
		return false
	end
	return true
end
function Lua_505864_Check() 
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ==  102977 then
		local Buff = 0
		if CheckBuff( TargetID() , 505856 ) == true then
			Buff = 505856 
		end
		if CheckBuff( TargetID() , 505857 ) == true then
			Buff = 505857
		end
		if Buff~= 0 then
			local BuffPos = Lua_BuffPosSearch(TargetID()  , Buff )
			local OrgLv = BuffInfo( TargetID() , BuffPos , EM_BuffInfoType_Power ) + 1
			if OrgLv < 10 then
				AddBuff(TargetID() , Buff , 0 , -1 )
			end
		end
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then
		local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 , 102106 , 102107, 102108, 102297, 102324, 102325, 102803 }	
		for pry , obj in pairs(PetID) do
			if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == obj then
				return true
			end
		end
		return false
	end
	return true
end
function Lua_505862_Check()
	local BuffSelf , BuffTarget = 0 , 0 
	if CheckBuff( OwnerID() , 505858 ) == true then
		BuffSelf = 505858
		BuffTarget = 505859
	end
	if CheckBuff( OwnerID() , 505859 ) == true then
		BuffSelf = 505859
		BuffTarget = 505858
	end
	if BuffSelf ~= 0 and BuffTarget ~= 0 then
		if CheckBuff( TargetID() , BuffSelf ) == true and TargetID() ~= OwnerID() then
			CancelBuff_NoEvent( OwnerID() , BuffSelf )
			CancelBuff_NoEvent( TargetID() , BuffSelf )
			CastSpell( OwnerID() , OwnerID() , 495035 )
			AddBuff( OwnerID() , BuffSelf + 2 , 0 , 15 )
			AddBuff( TargetID() , BuffSelf + 2 , 0 , 15 )
		end
		if CheckBuff( TargetID() , BuffTarget ) == true and TargetID() ~= OwnerID() then
			CancelBuff_NoEvent( OwnerID() , BuffSelf )
			CancelBuff_NoEvent( TargetID() , BuffTarget )
			CastSpell( OwnerID() , OwnerID() , 495036 )
			AddBuff( OwnerID() , BuffSelf + 2 , 0 , 15 )
			AddBuff( TargetID() , BuffTarget + 2 , 0 , 15 )
		end	
	end
end

function Lua_505896_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 102977 then
		return true
	else
		return false
	end
end

function Lua_505896_Use()
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 102977 then
		Lua_CancelAllBuff( OwnerID() ) 
		AddBuff( OwnerID() , 504113 , 0 , -1 )
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
		local Reload = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
		AddBuff( OwnerID() , Reload , 9 , -1 )
--		SetRoleCamp( OwnerID() , "Wagon" )
	end
end

function Lua_114350_TEST_CMD()
	CastSpell( OwnerID() , OwnerID() , 495036 )
end