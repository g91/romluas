function LuaS_421429_0()
	DisableQuest( OwnerID() , true )--����������
	Discowood_421429 = 0

	CastSpell( OwnerID() , OwnerID() , 491276 )
	sleep(40)


	local Monster = {}
	local ClassHighNo = LuaS_Discowood_FlagShowMonster( 100889 , "NoTarget" , 780089 , 3 , "LuaS_421429_1" )
	local Chailek = LuaS_Discowood_FlagShowMonster( 100888 , ClassHighNo , 780094 , 2 , "LuaS_421429_3" )
	Monster = {
			[1] = LuaS_Discowood_FlagShowMonster( 100887 , ClassHighNo , 780089 , 2 , "LuaS_421429_5" ),
			[2] = LuaS_Discowood_FlagShowMonster( 100887 , ClassHighNo , 780090 , 2  , "LuaS_421429_5" ),
			[3] = LuaS_Discowood_FlagShowMonster( 100887 , ClassHighNo , 780091 , 2  , "LuaS_421429_5" ),
			[4] = LuaS_Discowood_FlagShowMonster( 100886 , ClassHighNo , 780092 , 2  , "LuaS_421429_5" ),
			[5] = LuaS_Discowood_FlagShowMonster( 100886 , ClassHighNo , 780093 , 2  , "LuaS_421429_5" )
			}
	WriteRoleValue( ClassHighNo , EM_RoleValue_PID , TargetID() )--�n�O�o��^target
	WriteRoleValue( Chailek , EM_RoleValue_PID , TargetID() )--�n�O�o��^target


	local Array = {}

	while true do
		Array = LuaFunc_PartyData( TargetID() )

		if	Discowood_421429 == 1 then
------------------------------�԰������A�N�����E�����H�ܤ͵�
			Hide(Chailek)
			SetRoleCamp( Chailek  , "SNPC" )--���ܰ}��
			Show(Chailek , 0)
			for i=1 , table.getn(Monster) do
				if CheckID( Monster[i] ) then
					Hide( Monster[i] )
					SetRoleCamp( Monster[i]  , "SNPC" )--���ܰ}��
					Show( Monster[i]  , 0)
				end
			end
----------------------------------�t�X�@��
			Say( Chailek , GetString("SC_421429_1")  )--����I
			sleep(20)
			Say( Chailek , GetString("SC_421429_2")  )--�ڤ���Ӧ��A�ä��O�n�M�A�@�M�ͦ��C

			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_3")  )--�����l���K�K����A�Q�ͩM�H

			sleep(20)
			Say( Chailek , GetString("SC_421429_4")  )--�S���A�ڷQ�A�̨Ӧ����ت��]���O���ɱ����a�I
			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_5")  )--���K�K�ڭ̴N�H��d���Ǵ��e���ɡA�ڪ��H�|�h��n��C

			sleep(20)
			Say( Chailek , GetString("SC_421429_6")  )--�p�G�A�������U�A�ڷQ�ڭ̥i�H�����ä[���M���K�K

			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_7")  )--���N�o�򻡩w�F�A�ʹ��������A�ګܰ������ѯ�M�A�����C

			sleep(20)
			Say( Chailek , GetString("SC_421429_8")  )--�ڤ]�O�C�٦��A���ѬO�ڥ��L���}�����@�M�C

			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_9")  )--�������I�ڤS������O�K�K
			sleep(35)
-------------------------------------------------
			DelObj( ClassHighNo )
			DelObj( Chailek )
			for i=1 , table.getn(Monster) do
				if CheckID( Monster[i] ) then
					DelObj( Monster[i] )
				end
			end
-------------------------------------------
			for i=1 , Array[0] do
				if 	(  Checkflag ( Array[i] , 541593 ) or CheckFlag( Array[i] , 541594 )  ) and -- �԰�����ɭԥL�n�b
					CheckDistance( OwnerID(), Array[i] , 500 ) and --���������ӻ�
					CheckAcceptQuest( Array[i] , 421429 ) and -- ���W������
					ReadRoleValue( Array[i] , EM_RoleValue_IsDead ) == 0 then -- �����O���۪�

					SetFlag( Array[i] , 541793 , 1 )
				end
			end
			break


		end

		sleep(20)

	end

	DisableQuest( OwnerID() , false )--�}�񱵥���
end

function LuaS_421429_1()
	SetPlot( OwnerID() , "dead" , "LuaS_421429_2" , 30 )
end

function LuaS_421429_2()
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local Array = LuaFunc_PartyData( Target )

	for i=1 , Array[0] do

		if 	CheckDistance( OwnerID(), Array[i] , 500 ) and
			CheckAcceptQuest( Array[i] , 421429 ) and
			ReadRoleValue( Array[i] , EM_RoleValue_IsDead) == 0 then

			SetFlag( Array[i] , 541593 , 1 )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_HP ,  HP )
	Discowood_421429 = 1
	return false
end




function LuaS_421429_3()
	SetPlot( OwnerID() , "dead" , "LuaS_421429_4" , 30 )
end

function LuaS_421429_4()
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local Array = LuaFunc_PartyData( Target )


	for i=1 , Array[0] do
		if 	CheckDistance( OwnerID(), Array[i] , 500 ) and
			CheckAcceptQuest( Array[i] , 421429 ) and
			ReadRoleValue( Array[i] , EM_RoleValue_IsDead) == 0 then

			SetFlag( Array[i] , 541594 , 1 )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_HP ,  HP )
	Discowood_421429 = 1
	return false
end

function LuaS_421429_5()
	SetPlot(OwnerID() , "dead" , "LuaS_421429_6" , 30)
end

function LuaS_421429_6()
	DelObj(OwnerID())
	return false
end