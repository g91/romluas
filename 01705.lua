function LuaS_114351_0()
	if CheckFlag( OwnerID() , 543617 ) then
		SetSpeakDetail( OwnerID(),  "[SC_114351_OK]" ) 
		--�A�b�o�ӰV�m�����O�_�ǲߨ�x���۵M���O���Ū��n��O�H�γ\�A�å���ı�A���ЧA�۫H�ڡA�A���T���Ҧ����F�C
		--�p�G�A�ٻ{���ۤv���Ҥ����A���U�ӴN�n�q��Ԥ��������h���g��F�C
		--�Ʊ�N�Ӧb�@�çڭ̸t�a���Ԫ����A�گ�ݨ�A�������O�q�H�δ��z�C
	else
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_0]" ,"LuaS_114351_1", 0 ) --�߰ݦo�b�o�̭t�d���Ʊ�
	if CheckAcceptQuest( OwnerID() , 422863 ) == true or CheckAcceptQuest( OwnerID() , 422930 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_1]" ,"LuaS_114351_2", 0 ) --�߰ݦ۵M���x�V�m���Ʊ�
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_2]" ,"LuaS_114351_3", 0 ) --�ӽб����V�m
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 0  then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_1]" ,"LuaS_114351_2", 0 ) --�߰ݦ۵M���x�V�m���Ʊ�
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_2]" ,"LuaS_114351_3", 0 ) --�ӽб����V�m
	end
end

function LuaS_114351_1()
		SetSpeakDetail( OwnerID(),  "[SC_114351_3]" )
		 --�p�G�A�{�b����`�J���a��e�i�A�A�|�o�{�ڭ̥j�Ѫ��t�a���Q�@�s���ƪ��Τl�ү}�a�ۡA�L�̥��I�k�۳o���t�a���۵M���O�C
		 --���ѩ�ڭ̺��F�w�g���ܪ������v�����g���L�԰��A�]�����M�ڭ֦̾����H��ܳo�ǼĤH���O�q�A�o�ʥF�N�۵M���O�B�Ψ��Ԫ��g��C
		 --�ڷ|�Ө�o��N�O���F�V�m�ڭ̱ڤH�B�Φ۵M���O���覡�C
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114351_0", 0 ) --�^��W�@��
end

function LuaS_114351_2()
		SetSpeakDetail( OwnerID(),  "[SC_114351_4]" )
		 --�ڱN�إߤ@�Ӥ۶H�A�����ĤH�I�k�@�Ӧ۵M���O�ӷ��������A�P�ɽᤩ�����շҪ̥l��Ӫ��۶H�ӹ�ܼĤH����O�C
		 --�C�شӪ��۶H�������P���\��A���n�l��L�̥������Ӧ۵M���O�A�۵M���O�ӷ��|�w�����ͦ۵M���O�A�u�n����K�i�H��o�۵M���O�C
		 --�����շҪ̥����b�ɶ�������۵M���O�ӷ��Q�ĤH�ұ�Ĳ�A�o�N�O�ڪ��V�m�C
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114351_0", 0 ) --�^��W�@��
end

function LuaS_114351_3()
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
			if OwnerID() ~= ReadRoleValue( OwnerID() , EM_RoleValue_Register ) then
				local Name = GetName( ReadRoleValue( OwnerID() , EM_RoleValue_Register ) )
				local Str = "[SC_114351_5][$SETVAR1="..Name.."]" --�ثe[$VAR1]���b�����շҡA�A�i�H�b������ݬݾ԰������p�A���U�Ӵ��A���ɭԧA�N�|������D�ӫ�򰵤F�C
				SetSpeakDetail( OwnerID(),  Str )
				AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(),  "[SC_114351_7]" )
				AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --�^��W�@��
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 8 and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
			SetSpeakDetail( OwnerID(),  "[SC_114351_JOB_ERROR]" ) --�کұб¥H�ΰV�m���O�ϥΦ۵M���O���覡�A�p�G�A���O�۵M���x���ܬO�L�k�B�γo�����Ѫ��C
		else
			CloseSpeak( OwnerID() )
			if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
				Say( TargetID() ,  "[SC_114351_6]" ) --�{�b���H���b�����շҡA�A���[���@�U�A�ݬݹ����B�Φ۵M���O�C
			else
				WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
				Say( TargetID() ,  "[SC_114351_7]" ) --�A�i�H�ݨ쨺�y��ܡH�h���䵥�ݧa�I�V�m�w�g�}�l�F�C
				AddBuff( OwnerID() , 505865 , 0 , 330 )
				BeginPlot( TargetID() , "LuaS_114351_Train" , 0 )
			end
		end
end

function LuaS_114351_Train()
	--Flag 1 �O�� 2��10 �O�۵M���O�����I 11��20 �O�ĤH�������I
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Flag = 780534 
	local Count = 60
	local MonsterGroup = {103096 , 103097 , 103095 }
	local Wave = 0
	local NatureTower = CreateObjByFlag(102978 , Flag , 1 , 1 )
	SetModeEX( NatureTower , EM_SetModeType_Move , false )
	SetModeEX( NatureTower , EM_SetModeType_Mark , false )
	AddToPartition( NatureTower , RoomID )
	local ObjIDGroup = {103096 , 103097 , 103095 , 103072 , 103091 , 103092 , 103093 , 103094 , 103022 , 102978 }
	local ObjList = {}
	local Result = 0
	local temp = 0
	local WaveTable = {}
	local Seed = 1
	table.insert(ObjList, NatureTower) 
	for i = 1 , 300 , 1 do
		local HP = ReadRoleValue( NatureTower , EM_RoleValue_HP )
		local MaxHP = ReadRoleValue( NatureTower , EM_RoleValue_MaxHP )
		if CheckID( Player ) == false or CheckBuff( Player , 505865 ) == false or ReadRoleValue( Player , EM_RoleValue_RoomID) ~= RoomID then
			Result = 1
			break
		end
		if CheckID( NatureTower ) == false then
			Result = 1
			break
		end
		if Wave == 4 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_1]" , 0 ) --�}�l�����Ϋ�A�H�����۵M���O���D�A���H[103091]�H��[103072]�إߨ��m�u�C
		end
		if Wave == 8 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_2]" , 0 ) --�`�N�A�ĤH��������X�{�F�A[103091]�O�L�k���׭����쪺�C
		end	
		if Wave == 12 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_3]" , 0 ) --�ĤH�ƶq�}�l�W�[�A�����n���ɭԴN�l��[103093]�A�L�i�H�l�޼ĤH�����Ӫ����ɶ��C
		end	
		if Wave == 16 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_4]" , 0 ) --�A�@�I�ɶ��N���\�F�A�����ɼĤH�|�ɥ��O��ŧ���A�d�U���i���P�C
		end	
		if Count/5 == math.floor(Count/5) then --�C 5 ���ͤ@�Ӧ۵M���O�A�s�b 10 ��A�� 12 �i����@������ 2 ��
			if Wave >= 12 then
				temp = 3
			elseif Wave >= 6 then
				temp = 2
			else
				temp = 1
			end
			for i = 1 , temp , 1 do
				local Num = DW_Rand( 9 ) + 1
				local Power = CreateObjbyFlag( 103022 , Flag , 1 , 1 )
				SetModeEX( Power , EM_SetModeType_Mark , false )	
				AddToPartition( Power , RoomID )
				if ( Wave == 4 or Wave == 8 or Wave == 12 or Wave==16 ) and Seed == 1 and i == 1 and Count/15 == math.floor(Count/15) then
						AddBuff( Power , 505895 , 0 , -1 )
						WriteRoleValue( Power , EM_RoleValue_LiveTime , 10 )
						Seed = 0
				else
						AddBuff( Power , 502456 , 0 , -1 )
						AddBuff( Power , 505877 , 0 , -1 )
						WriteRoleValue( Power , EM_RoleValue_LiveTime , 20 )
				end
				SetPlot( Power , "range" , "LuaI_103022_Range" , 15 )
				table.insert(ObjList, Power) 
				CallPlot( Power , "LuaFunc_MoveToFlag" , Power , Flag , Num , 0 )
			end
			if HP/MAXHP < 0.1 then
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_114351_LIFE_ALERT_1]" , 0 ) --[102978]�w�g���񧹥��l��					
			elseif HP/MAXHP < 0.5  then
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_114351_LIFE_ALERT_2]" , 0 ) --[102978]�w�g�l���@�b					
			end
		end
		if Count/15 == math.floor(Count/15) and Count ~= 60 then --�C 15 ���ͤ@�i��ŧ
			Wave = Wave + 1
			if Wave <= 3 then
				WaveTable = { 1 , 0 , 0 }
			end
			if Wave > 3 and Wave <= 6 then
				WaveTable = { 2 , 1 , 0 }
			end	
			if Wave > 6 and Wave <= 9 then
				WaveTable = { 3 , 1 , 1 }
			end	
			if Wave > 9 and Wave <= 12 then
				WaveTable = { 3 , 2 , 2 }
			end
			if Wave > 12 and Wave <= 15 then
				WaveTable = { 5 , 2 , 2 }
			end
			if Wave > 15 and Wave <= 18 then
				WaveTable = { 5 , 3 , 3 }
			end
			for pry , obj in pairs(MonsterGroup) do
				if WaveTable[pry] ~= 0 then
					for i = 1 , WaveTable[pry] , 1 do
						local Num = DW_Rand( 10 ) + 10
						local Bugs = CreateObjbyFlag( obj , Flag , Num , 1 )
						local WaitTime = ( i - 1 ) * DW_Rand(3) * 10  
						SetModeEX( Bugs , EM_SetModeType_Mark , false )	
						table.insert(ObjList, Bugs) 
						CallPlot( Bugs , "LuaS_114351_AttackTower" , NatureTower , WaitTime )
					end
				end
			end
		end
		Count = Count + 1
		if Count >= 60 then
			seed = 1
			Count = 0
		end
		sleep( 10 )
	end
	for pry , obj in pairs(ObjList) do --�M���Ҧ��s�X�Ӫ�����
		if CheckID( obj ) == true  and ReadRoleValue( obj , EM_RoleValue_RoomID ) == RoomID then
			for i = 1 , 10 , 1 do
				if ReadRoleValue( obj , EM_RoleValue_OrgID ) == ObjIDGroup[i] then	
					Delobj( Obj )
					break
				end
			end
		end
	end
	
	if CheckID( Player ) == true then
		CancelBuff( Player , 505865 )
		CancelBuff_NoEvent( Player , 505876 )
		if Result == 1 then
			Yell( OwnerID() ,  "[SC_114351_8]" , 3 ) --�ܥi���A�U���A�ոլݧa�I
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_8]" , 0 )
		else
			Yell( OwnerID() ,  "[SC_114351_9]" , 3 ) --�A��{���ܦn�A���ߧA�q�L�F�V�m�C
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_9]" , 0 )
			if CheckAcceptQuest( Player , 422863 ) == true or CheckAcceptQuest( Player , 422930 ) == true then
				SetFlag( player , 543617 , 1 )
			end
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_103022_Range()
	if CheckBuff( OwnerID() , 505865 ) == true then
			if CheckBuff( TargetID() , 505895 ) == true then
				if CheckBuff( OwnerID() , 505876 ) == false then
					AddBuff( OwnerID() , 505876 , 0 , -1 )
					CastSpell(  OwnerID() , TargetID() , 493776 )
					Delobj( TargetID() )
				else
					return
				end
			else
				local BuffPos = Lua_BuffPosSearch(OwnerID()  , 503827 )
				local OrgLv = BuffInfo( OwnerID() , BuffPos , EM_BuffInfoType_Power ) + 1
				if OrgLv  < 10 then
					AddBuff(  OwnerID(), 503827 , 0 , -1 )
					CastSpell(  OwnerID() , TargetID() , 493776 )
					Delobj( TargetID() )
				end
			end
	end
end

function LuaM_505867_Check()
	if CheckBuff( TargetID() , 505865 ) == true then
		local BuffPos = Lua_BuffPosSearch(TargetID() , 503827 )
		local OrgLv = BuffInfo( TargetID() , BuffPos , EM_BuffInfoType_Power ) + 1
		if OrgLv  < 10 then
			return true
		end
	end
	return false
end

function LuaM_505867_Do()
	AddBuff(  TargetID(), 503827 , 0 , -1 )
	CastSpell(  TargetID(),  TargetID() , 493776 )
	Delobj( OwnerID() )
end

function LuaS_114351_AttackTower(tar , time)
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local Obj = Role:new( tar )
	if time ~= 0 then
		sleep( time )
	end
	AddToPartition( OwnerID() , RoomID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 103097 then
		AddBuff( OwnerID() , 505869 , 0 , -1 )
	end
	while 1 do
		if HateListCount( OwnerID() ) == 0 then
			if GetDistance( OwnerID() , tar ) > 30 and CheckBuff( OwnerID() , 505875 ) == false then
				Move( OwnerID() , Obj:X() , Obj:Y() , Obj:Z() )
			else
				SetAttack( OwnerID() , tar )
			end
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
			break
		end
		sleep( 10 )
	end
end

function LuaS_114351_CheckPlayer()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		if CheckID( TargetID() ) == false or CheckBuff( TargetID() , 505865 ) == false or ReadRoleValue( TargetID() , EM_RoleValue_RoomID) ~= RoomID then
			break
		end
		if CheckBuff( TargetID() , 505865 ) == false then
			break
		end
		sleep( 10 )
	end
	Delobj( OwnerID() )
end

function LuaI_114351_BeginBuff()
	AddBuff( OwnerID() , 505868 , 0 , -1 )
end

function LuaI_SpellCheck_Plants()
	local IDTable = {103096 , 103097 , 103095 }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaI_SpellCheck_Bugs()
	local IDTable = {103072 , 103091 , 103092 , 103093 , 103094 }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaI_103094_Heal()
	local Count = 0
	for i = 1 , 10 , 1 do
		if i == 5 then
			AddBuff( OwnerID() , 505873 , 0 , -1 )
		end
		if i == 9 then
			AddBuff( OwnerID() , 505874 , 0 , -1)
		end
		if i == 10 then
			CastSpell( OwnerID() , OwnerID() , 495046 )
		end
		sleep( 10 )
	end
	DelObj( OwnerID() )
end

function LuaM_495047_Check()
	local IDTable = {103096 , 103097  }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaM_505878_Use()
	local IDTable = {103096 , 103097 , 103095 }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return 
	else
		Delobj( TargetID() )
	end
end

function LuaM_505878_Check( result )
	if result == 1 then
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		WriteRoleValue( OwnerID() , EM_RoleValue_HP , 5*MaxHP/100 )
		AddBuff( OwnerID() , 505866 , 0 , 15 )
	end
end

function LuaM_CreatePlant_UseCheck(BuffCount)
	local Pos = Lua_BuffPosSearch( OwnerID() , 503827 )	
	local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )	
	if PLV+1 < BuffCount then
		ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_MAGICSTRING_7]" , 0 )
		return false
	end
	return true
end
function LuaM_CreatePlant_Check(obj , BuffCount)
	local Me = Role:new( OwnerID() )
	local AddBuffCheck = "NO"
	if Obj == 103072 then
		local Grass = LuaFunc_SearchNPCbyOrgID( OwnerID() , 103072 , 20 , 1 )
		if Grass[0] ~= -1 then
			for pry , obj in pairs(Grass) do
				if CheckID(obj) ~= false then
					if CheckBuff( obj , 505870 ) == false and CheckBuff( obj , 505871 ) == false then
						AddBuff( obj , 505870 , 0 , -1 )
						WriteRoleValue( obj , EM_RoleValue_HP , ReadRoleValue( obj , EM_RoleValue_MaxHP ) )
						AddBuffCheck = "Yes"
						CastSpell( obj , obj , 494396 )
						break
					end 
					if CheckBuff( obj , 505870 ) == true and CheckBuff( obj , 505871 ) == false then
						CancelBuff( obj , 505870  )
						AddBuff( obj , 505871 , 0 , -1 )
						WriteRoleValue( obj , EM_RoleValue_HP , ReadRoleValue( obj , EM_RoleValue_MaxHP ) )
						AddBuffCheck = "Yes"
						CastSpell( obj , obj , 494396 )
						break
					end
				end
			end
		end
	end
	if AddBuffCheck == "Yes" then
		AddBuff(OwnerID() , 503827, -BuffCount-1 , -1 )
		return
	end
	local Plant = CreateObj( obj , Me:X() , Me:Y() , Me:Z() , Me:DIR() , 1 )
	SetModeEX( Plant , EM_SetModeType_Mark , false )
	SetModeEX( Plant , EM_SetModeType_Move , false )	
	AddToPartition( Plant , Me:RoomID() )
	if obj == 103094 then
		BeginPlot( Plant , "LuaI_103094_Heal" , 0 )
	else
		BeginPlot( Plant , "LuaS_114351_CheckPlayer" , 0 )
	end
	if obj == 103093 then
		AddBuff(Plant , 505872 , 0 , -1 )
		CastSpell( Plant , Plant , 495045 )
	end
	CastSpell( Plant , Plant , 494747 )
	AddBuff(OwnerID() , 503827, -BuffCount-1 , -1 )
end

function LuaM_505884_Check()
	local PlantID = {103072 , 103091 , 103092 , 103093 , 103094 }
	local Check = "No"
	for pry , obj in pairs(PlantID) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102978 then
		AddRoleValue( TargetID() , EM_RoleValue_HP , ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) / 100  )
		CastSpell( TargetID() , TargetID() , 493776 )
		return false
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaM_505875_Hit(result)
	if result == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 1 )
	end
end

function LuaM_505876_Check()
	if CheckBuff( OwnerID() , 505876 ) == false then
		AddBuff(OwnerID() , 503827, -7-1 , -1 )
		return true
	end
	return false
end

function LuaM_505761_Do()
	SetRoleCamp( TargetID() , "SNPC" )
	SetStopAttack( TargetID() )
	if CheckBuff( TargetID() , 505875 ) == true then
		CancelBuff( TargetID() , 505875 ) 
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 777 )
end