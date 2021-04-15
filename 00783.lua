


function LuaS_421428_0()
	DisableQuest( OwnerID() , true )--����������

	CastSpell( OwnerID() , OwnerID() , 491276 )
	sleep(40)

	local ClassHighNo = LuaS_Discowood_FlagShowMonster( 100889 , "NoTarget" , 780089 , 3 , "LuaS_421428_6"  )
	local Monster1 = LuaS_Discowood_FlagShowMonster( 100885 , ClassHighNo , 780089 , 2 , "LuaS_421428_1" )
	local Monster2 = LuaS_Discowood_FlagShowMonster( 100885 , ClassHighNo , 780090 , 2 , "LuaS_421428_2" )
	local Monster3 = LuaS_Discowood_FlagShowMonster( 100885 , ClassHighNo , 780091 , 2 , "LuaS_421428_3" )
	local Monster4 = LuaS_Discowood_FlagShowMonster( 100886 , ClassHighNo , 780092 , 2 , "LuaS_421428_4" )
	local Monster5 = LuaS_Discowood_FlagShowMonster( 100886 , ClassHighNo , 780093 , 2 , "LuaS_421428_5" )
	local sec = 0
	local Friend = {}
	local Monster = {
			[1] = Monster1,
			[2] = Monster2,
			[3] = Monster3,
			[4] = Monster4,
			[5] = Monster5
			}
	local ifdead = 0
	while true  do
		sleep(10)
		sec = sec + 1

		ifdead = ReadRoleValue( ClassHighNo , EM_RoleValue_IsDead) 

		if 	CheckID( ClassHighNo ) and
			ifdead == 0 then
			if CheckID( Monster1 ) or CheckID( Monster2 ) or CheckID( Monster3 ) or CheckID( Monster4 ) or CheckID( Monster5 ) then
			else
				Say( ClassHighNo , GetString("SC_421428_5") )--�}�G�������A�V�J�p�S�I�o���ڭ�Ĺ���}�G�I
				local Array = LuaFunc_PartyData( TargetID() )
				for i=1 , Array[0] do
					if 	CheckDistance( OwnerID(), Array[i] , 500 ) and
						CheckAcceptQuest( Array[i] , 421428 ) and
						ReadRoleValue( Array[i] , EM_RoleValue_IsDead) == 0 then
						SetFlag( Array[i] , 541592 , 1)
					end
				end

				for i=1 , table.getn(Friend) do
					if CheckID( Friend[i] ) then
						DelObj( Friend[i] )
					end
				end
				DelObj( ClassHighNo )
				DisableQuest( OwnerID() , false )--�}�񱵥���
				break
			end
		else
			if 	sec >= 20 then

				for i=1 , table.getn(Friend) do
					if CheckID( Friend[i] ) then
						DelObj( Friend[i] )
					end
				end
			end

			if CheckID( Monster1 ) or CheckID( Monster2 ) or CheckID( Monster3 ) or CheckID( Monster4 ) or CheckID( Monster5 ) then
			else
				break
			end
		end

		if 	sec == 20 and
			ifdead == 0 then
			for i=1, table.getn(Monster) do
				if CheckID(Monster[i]) then
					Tar = Monster[i]
					break
				end
			end
			local Friend1 = LuaS_Discowood_FlagShowMonster( 100892 , "NoTarget" , 780089 , 0 , "LuaS_421428_7"   )
			Say( Friend1 , GetString("SC_421428_6") )--�Ϊ����M�I�I�S�̭̤W�ڡI
			local Friend2 = LuaS_Discowood_FlagShowMonster( 100890 , "NoTarget" , 780091 , 0  , "LuaS_421428_7"  )
			local Friend3 = LuaS_Discowood_FlagShowMonster( 100890 , "NoTarget" , 780092 , 0  , "LuaS_421428_7"  )
			local Friend4 = LuaS_Discowood_FlagShowMonster( 100890 , "NoTarget" ,  780093 , 0 , "LuaS_421428_7"  )
			Friend = {
					[1] = Friend1 ,
					[2] = Friend2 ,
					[3] = Friend3 ,
					[4] = Friend4 
				}
		end

		if 	sec > 20 and
			ifdead == 0 then

			local s =0
			local R = 0
			while 1 do
				if s>600 then
					break
				end

				R = Rand( table.getn(Monster) ) + 1
				if CheckID( Monster[R] )  then
					break
				else
					s=s+1
				end
				
			end

			for i=1 , table.getn(Friend)  do
				if CheckID( ReadRoleValue( Friend[i] , EM_RoleValue_AttackTargetID ) ) == false then
					if CheckID( Monster[R] )  then
						SetAttack( Friend[i] , Monster[R] )
					end
				end
			end
		end
	end
	DisableQuest( OwnerID() , false )--�}�񱵥���
end




function LuaS_421428_1()
	SetPlot(OwnerID() , "dead" , "LuaS_421428_8" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421428_2()
	sleep(10)
	Say(OwnerID() , GetString("SC_421428_2") ) -- �o�O�j�n���|�I�O���L�]�F�I
	SetPlot(OwnerID() , "dead" , "LuaS_421428_8" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421428_3()
	SetPlot(OwnerID() , "dead" , "LuaS_421428_8" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421428_4()
	SetPlot(OwnerID() , "dead" , "LuaS_421428_8" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421428_5()
	SetPlot(OwnerID() , "dead" , "LuaS_421428_8" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421428_6()
	sleep(60)
	Say(OwnerID() , GetString("SC_421428_4") ) -- �I���I�{�b�٤���V�J�p�S�X�����ɭԡI
end

function LuaS_421428_7()
	local FlagID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	MoveToFlagEnabled( OwnerID() , false )--�������޼@��
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )--�Ψ���
	local fx = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_X )--�춥�q�X��x
	local fy = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_Y )--�춥�q�X��y
	local fz = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_Z )--�춥�q�X��z
	local ox = ReadRoleValue( OwnerID(), EM_RoleValue_X)--�ۤv��x
	local oy = ReadRoleValue( OwnerID(), EM_RoleValue_Y)--�ۤv��y
	local oz = ReadRoleValue( OwnerID(), EM_RoleValue_Z)--�ۤv��z
	local done = false

	local s = 0
	MoveDirect( OwnerID(), fx , fy , fz )
	while 1 do
		ox = ReadRoleValue( OwnerID(), EM_RoleValue_X)--�ۤv��x
		oy = ReadRoleValue( OwnerID(), EM_RoleValue_Y)--�ۤv��y
		oz = ReadRoleValue( OwnerID(), EM_RoleValue_Z)--�ۤv��z
		if 	( (fz/10) == (oz/10) ) and 
			( (fx/10)==(ox/10) ) then--��F
			if done == false then
				SetRoleCamp( OwnerID()  , "SNPC" )--���ܰ}��
				done = true
			end
			break
		else
			MoveDirect( OwnerID(), fx , fy , fz )
		end
		sleep(5)
	end
	while 1 do
		if s>600 then
			break
		end
		if CheckID( ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ) == false then
			AdjustFaceDir( OwnerID(), TargetID(), 0 ) 		
		end
		s=s+1
		sleep(10)
	end
end


function LuaS_421428_8()
	DelObj(OwnerID())
	return false
end