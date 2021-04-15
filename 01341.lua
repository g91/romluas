function LuaYU_hello2009_trips_01()--����3�غؤl99
	AddBuff( OwnerID() ,504940 ,99 , 600 ); --�ūn��
	AddBuff( OwnerID() ,504941 ,99 , 600 ); --�ūn��
	AddBuff( OwnerID() ,504942 ,99 , 600 ); --�ūn��
end

function LuaYU_hello2009_trips_02()--���R
		local ToDel = {}

		ToDel[1] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102644, 300 , 1)     
		ToDel[2] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102765, 300 , 1)     
		ToDel[3] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102766, 300 , 1)     
		ToDel[4] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102767, 300 , 1)     
		ToDel[5] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102768, 300 , 1)     
		ToDel[6] = LuaFunc_SearchNPCbyOrgID( TargetID() , 112961, 300 , 1)     
		ToDel[7] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113202, 300 , 1)     

		for i=1 , table.getn(ToDel) do	

			if ToDel[i] ~= -1 then
				for j = 0 ,table.getn(ToDel[i])  do

					Delobj(ToDel[i][j])
				end
			end
		end
end



function LuaYU_hello2009_onfire_01()--���������@��
   
	AddBuff( OwnerID() ,503047 ,1 , 5 ); --���K�ۨ�

end

function LuaYU_hello2009_00() -- �ʧ@����

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local BigPumpkin = CreateObjByFlag( 102644, 780328 , 0 , 1 );--����j�n��
	SetModeEx( BigPumpkin  , EM_SetModeType_Mark, false )--���аO.
--	SetModeEx( BigPumpkin , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( BigPumpkin , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( BigPumpkin  , EM_SetModeType_HideName, true )--�W��
	AddToPartition( BigPumpkin , RoomID )  
--	AddBuff( BigPumpkin ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

	local fire = CreateObjByFlag( 102768, 780328 , 0 , 1 );--�������Τ�
	SetModeEx( fire  , EM_SetModeType_Mark, false )--���аO.
	SetModeEx( fire , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( fire , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( fire  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( fire  , EM_SetModeType_Move, false )--����
	SetModeEx( fire  , EM_SetModeType_Gravity, false )--���O
	AddToPartition( fire , RoomID )  

	WriteRoleValue( BigPumpkin , EM_RoleValue_Register+8 ,  fire  ) --�O���Τ�
	SetPlot( BigPumpkin , "dead","LuaYU_hello2009_Kingdead_00",0 )--����j�n���z�F����

                SetPlot( fire,"range", "LuaYU_hello2009_onfire_01" , 30 ) 

	local OwnerX = ReadRoleValue( fire , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( fire , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( fire , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( fire , EM_RoleValue_Dir ) 

	OwnerY = OwnerY +20

	SetPos( fire , OwnerX, OwnerY, OwnerZ , OwnerDIR )

	while true do
	

		PlayMotion( BigPumpkin , 147) 	
		sleep(30)
		CastSpell(BigPumpkin ,BigPumpkin,493656)
--		CastSpell(fire ,fire,493656)
--Say(fire,"fire")
		PlayMotion( BigPumpkin , 145) 	
		sleep(65)


				local Pumpkin={}

				for q = 1 ,8 do  --���ͫn��

					Pumpkin[q] = CreateObjByFlag( 113202, 780328 , q , 1 );

					WriteRoleValue( Pumpkin[q]  , EM_RoleValue_Register ,  BigPumpkin  ) 

				end

			--�H�U�H���P�_���ͫn�ʦ�m
				local floorX={}

				for i= 1,table.getn(Pumpkin) do
					floorX[i]=Pumpkin[i]

				end

				local Y={}

				for i=1 , 8 do
					local W = rand(table.getn(floorX)) +1   -- �x�}�H�����ˡA+1�t���q1�}�l�C

					Y[i] = floorX[W]

					table.remove(floorX,W)
				end

				for i=1, 2 do

					AddToPartition( Y[i] , RoomID )  
					AddBuff( Y[i] ,501642 ,1 , 2 ); --���K�`��

					BeginPlot(  Y[i]  , "LuaYU_hello2009_motion_01" , 0 )  

				end

				for i=3, 4 do

					AddToPartition( Y[i] , RoomID )  
					AddBuff( Y[i] ,501642 ,1 , 2 ); --���K�`��

					BeginPlot(  Y[i]  , "LuaYU_hello2009_motion_02" , 0 )  

				end

				for i=5, 6 do

					AddToPartition( Y[i] , RoomID )  
					AddBuff( Y[i] ,501642 ,1 , 2 ); --���K�`��

					BeginPlot(  Y[i]  , "LuaYU_hello2009_motion_03" , 0 )  

				end

				for i=7, 8 do

					AddToPartition( Y[i] , RoomID )  
					AddBuff( Y[i] ,501642 ,1 , 2 ); --���K�`��

					BeginPlot(  Y[i]  , "LuaYU_hello2009_motion_04" , 0 )  

				end

		sleep(25)

		PlayMotion( BigPumpkin , 147) 	

		sleep(140)

		for X=1 , table.getn(Pumpkin) do	

			if CheckID( Pumpkin[X] ) == true then
				Delobj(Pumpkin[X])
			end
		end
		sleep(10)

	end

end

function LuaYU_hello2009_01() -- �ͫn���_�_
--OwnerID--���a

	if CheckBuff( OwnerID() , 504979) == true  then

		SetPlot( TargetID() ,"touch",  "" , 0 )  
		BeginPlot(  TargetID() , "LuaYU_hello2009_01_2" , 0 )  
		WriteRoleValue( TargetID()  , EM_RoleValue_Register+1 ,  555  ) --����h�}

		local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 
		Score = Score+1
		SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) 
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Score  ) --�O������

	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_15]".. "|r" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_15]".. "|r" , 0 ) 
	end
end

function LuaYU_hello2009_01_2() -- �ͫn���_�_

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local BigPumpkin = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register) 

	SetModeEx(  OwnerID()   , EM_SetModeType_Show , false ) --�����

	local Monster = CreateObj( 101227 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx( Monster  , EM_SetModeType_Mark, false )--���аO.
	SetModeEx( Monster , EM_SetModeType_Fight , false )--�i�������
	AddBuff( Monster ,502546 ,1 ,-1 ); --�ܤj 1.3
	AddToPartition( Monster , RoomID )  
	WriteRoleValue( Monster  ,EM_RoleValue_IsWalk , 0 ) --�b�]
	WriteRoleValue( Monster  , EM_RoleValue_PID ,  TargetID()  ) 
	WriteRoleValue( Monster  , EM_RoleValue_Register ,  BigPumpkin  ) 

	BeginPlot(  Monster , "LuaYU_hello2009_01_3" , 0 )  

--	sleep(20)
	Delobj(OwnerID())
end

function LuaYU_hello2009_01_3() -- �n���_�_�g�b

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local Player = ReadRoleValue( OwnerID()  ,EM_RoleValue_PID) 
	local BigPumpkin = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register) --����n�ʤ�

	local PMaxHp = ReadRoleValue( BigPumpkin  ,EM_RoleValue_MaxHP) 


	Npcsay(  OwnerID()  , "|off00ff00" .."[SC_RUNRUNPUMPKIN_01]".. "|r" )

	sleep(5)

	WriteRoleValue(OwnerID()  ,EM_RoleValue_IsWalk , 0 ) --�b�]
	MoveToFlagEnabled( OwnerID() , false )

	sleep(5)

	Hide(OwnerID() )
	Show(OwnerID() ,RoomID)

	PlayMotion( OwnerID() , 120) 
	sleep(30)
	FaceFlag ( OwnerID()  , 780328 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780328 , 0 ,0 )

	Npcsay(  OwnerID()  , "|off00ff00" .."[SC_RUNRUNPUMPKIN_02]".. "|r" )

	PlayMotion( OwnerID() , 122) 
	AddBuff( OwnerID() ,503047 ,1 , 2 ); --���K�ۨ�
	sleep(20)
	CastSpell(OwnerID() ,OwnerID() ,494150)



	sleep(5)
	BeginPlot( OwnerID()  , "LuaP_Dead" , 0 )   

	local FaceDir = 360
	local XX = Rand( FaceDir )      

	AdjustFaceDir( OwnerID(), BigPumpkin , XX ) --���V

	BeginPlot( OwnerID()  , "LuaYU_hello2009_thegun_01" , 0 )   

	ScriptMessage( Player , Player , 0 , "|off00ff00" .."[SC_RUNRUNPUMPKIN_04]".. "|r" , 0 ) 
	ScriptMessage( Player , Player , 0 , "|off00ff00" .."[SC_RUNRUNPUMPKIN_04]".. "|r" , 0 ) 
	sleep(20)
	Delobj(OwnerID() )
end

function LuaYU_hello2009_02() -- �ͩǪ��n��
--Say( OwnerID(), "O= " )���a
--Say( TargetID(), "T= " )�n��

	if CheckBuff( OwnerID() , 504979) == true  then
		SetPlot( TargetID() ,"touch",  "" , 0 )  
		BeginPlot(  TargetID() , "LuaYU_hello2009_02_2" , 0 )  
		WriteRoleValue( TargetID()  , EM_RoleValue_Register+1 ,  555  ) --����h�}

	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_15]".. "|r" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_15]".. "|r" , 0 ) 
	end
end

function LuaYU_hello2009_02_2() -- 

--Say(OwnerID(),"OwnerID()")
	CastSpell(OwnerID() ,OwnerID() ,492453)
	ScriptMessage( TargetID() , TargetID() , 1 , "|off00ff00" .."[SC_RUNRUNPUMPKIN_03]".. "|r" , 0 ) 
	ScriptMessage( TargetID() , TargetID() , 0 , "|off00ff00" .."[SC_RUNRUNPUMPKIN_03]".. "|r" , 0 ) 

--	sleep(10)
	AddBuff( TargetID() ,501642 ,1 , 2 ); --���K�`��
--	sleep(5)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local BigPumpkin = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register) --����n�ʤ�

	SetModeEx(  OwnerID()   , EM_SetModeType_Show , false ) --�����

	local P = 3
	local XX = Rand( P )      
	local CMonsterID = 0
	
	if XX == 0 then   --33%

		CMonsterID = 102765

	elseif XX == 1 then   --33%

		CMonsterID = 102766
	else
		CMonsterID = 102767
	end

	local Monster = CreateObj( CMonsterID , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

--	SetModeEx( Monster  , EM_SetModeType_Mark, false )--���аO.
	SetModeEx( Monster , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( Monster , RoomID )  
	WriteRoleValue( Monster  , EM_RoleValue_PID ,  TargetID()  ) 
	WriteRoleValue( Monster  , EM_RoleValue_Register ,  BigPumpkin  ) 
	BeginPlot(  Monster , "LuaYU_hello2009_02_4" , 0 )  
	SetAttack( Monster, TargetID())
--	sleep(5)
	Delobj(OwnerID())
end

function LuaYU_hello2009_02_4() -- ���c�n�ʩ�AI

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local Player = ReadRoleValue( OwnerID()  ,EM_RoleValue_PID) 
	local BigPumpkin = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register) --����n�ʤ�



--	SetRandMove( OwnerID()  , 100 ,300,50 )

	sleep(300)
	local Killed = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+2) --�өǬO�_�Q8�즳3��BUFF
	if Killed == 666 then
		sleep(300)
		BeginPlot( OwnerID()  , "LuaP_Dead" , 0 )   
		sleep(20)
		Delobj(OwnerID() )

	else

		BeginPlot( OwnerID()  , "LuaP_Dead" , 0 )   
		sleep(20)
		Delobj(OwnerID() )
	

	end

end

function LuaYU_hello2009_motion_01() -- �n�ʸH��
	while true do
		local PumpkinNow = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+1 ) --�P�_�i�I���޲��n�ʥثe�����p  555�N���H�I�F

		local RAND_A = rand(2)
		local RAND_B = rand(1)
		
		if PumpkinNow == 555 then

			break
		else

			RAND_A = (RAND_A+1)*10
			RAND_B = (RAND_B+1)*10

			SetCursorType( OwnerID()  , eCursor_Interact ); --����ܦ� ���� 
			SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_02" , 10 ) 
			PlayMotion( OwnerID(), 147) 
			sleep(RAND_A)
			if PumpkinNow == 555 then

				break
			else
				SetCursorType( OwnerID()  , eCursor_Interact ); 
				SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_01" , 10 )  -- �ͫn��
				PlayMotion( OwnerID(), 145) 
				sleep(RAND_B)
			end
		end

	end
end

function LuaYU_hello2009_motion_02() -- �n�ʸH��
	while true do
		local PumpkinNow = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+1 ) --�P�_�i�I���޲��n�ʥثe�����p  555�N���H�I�F
		
		local RAND_A = rand(4)
		local RAND_B = rand(1)

		if PumpkinNow == 555 then

			break
		else

			RAND_A = (RAND_A+1)*10
			RAND_B = (RAND_B+1)*10

			SetCursorType( OwnerID()  , eCursor_Interact ); --����ܦ� ���� 
			SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_02" , 10 ) 
			PlayMotion( OwnerID(), 147) 
			sleep(RAND_A)

			if PumpkinNow == 555 then

				break
			else
				SetCursorType( OwnerID()  , eCursor_Interact );
				SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_01" , 10 )   -- �ͫn��
				PlayMotion( OwnerID(), 145) 
				sleep(RAND_B)
			end
		end
	end
end

function LuaYU_hello2009_motion_03() -- �n�ʸH��
	while true do
		local PumpkinNow = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+1 ) --�P�_�i�I���޲��n�ʥثe�����p  555�N���H�I�F

		local RAND_A = rand(6)
		local RAND_B = rand(1)
		
		if PumpkinNow == 555 then

			break
		else

			RAND_A = (RAND_A+1)*10
			RAND_B = (RAND_B+1)*10

			SetCursorType( OwnerID()  , eCursor_Interact ); --����ܦ� ���� 
			SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_02" , 10 ) 
			PlayMotion( OwnerID(), 147) 
			sleep(RAND_A)

			if PumpkinNow == 555 then
				break
			else
				SetCursorType( OwnerID()  , eCursor_Interact ); 
				SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_01" , 10 )   -- �ͫn��
				PlayMotion( OwnerID(), 145) 
				sleep(RAND_B)
			end
		end
	end
end

function LuaYU_hello2009_motion_04() -- �n�ʸH��
	while true do
		local PumpkinNow = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+1 ) --�P�_�i�I���޲��n�ʥثe�����p  555�N���H�I�F
		local RAND_A = rand(8)
		local RAND_B = rand(1)
		
		if PumpkinNow == 555 then

			break
		else

			RAND_A = (RAND_A+1)*10
			RAND_B = (RAND_B+1)*10

			SetCursorType( OwnerID()  , eCursor_Interact ); --����ܦ� ���� 
			SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_02" , 10 ) 
			PlayMotion( OwnerID(), 147) 
			sleep(RAND_A)

			if PumpkinNow == 555 then
				break
			else
				SetCursorType( OwnerID()  , eCursor_Interact ); 
				SetPlot( OwnerID() ,"touch",  "LuaYU_hello2009_01" , 10 )   -- �ͫn��
				PlayMotion( OwnerID(), 145) 
				sleep(RAND_B)
			end
		end
	end
end



function LuaYU_hello2009_thegun_01() --�n�ʬ�

	local BOXLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID )

	local P = 5--�ؤl��
	local XX = Rand( P )    
	         XX = XX+1

	local Q = 3--�ؤl��
	local YY = Rand( Q )    
	         YY = YY+1

	local R = 70 --�Z��
	local ZZ = Rand( R )    
		if ZZ < 55 then
			ZZ = 55+XX+YY
		end

	local S = 50--�Z��
	local AA = Rand( S )    
		if AA < 40 then
			AA = 40+XX+YY
		end


	local MonsterGroup = Lua_Davis_BornByMultilateral( 112961 , XX , ZZ )
--	local MonsterGroup = Lua_Davis_BornByMultilateral( MonsterID , X , dis )

	for i=1 , table.getn(MonsterGroup) do
			SetPlot( MonsterGroup[i] ,"touch",  "LuaYU_hello2009_thegun_02" , 10 ) 
			BeginPlot( MonsterGroup[i]   , "LuaYU_hello2009_thegun_03" , 0 )  
	end

	local MonsterGroup2 = Lua_Davis_BornByMultilateral( 112961 , YY , AA )
--	local MonsterGroup = Lua_Davis_BornByMultilateral( MonsterID , X , dis )

	for i=1 , table.getn(MonsterGroup2) do
			SetPlot( MonsterGroup2[i] ,"touch",  "LuaYU_hello2009_thegun_02" , 10 ) 
			BeginPlot( MonsterGroup2[i]   , "LuaYU_hello2009_thegun_03" , 0 )  
	end

end



function LuaYU_hello2009_thegun_02() --�ߨ쪺�n�ʬ�BUFF

	if CheckBuff( OwnerID() , 504979) == FALSE  then

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_15]".. "|r" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_15]".. "|r" , 0 ) 

	else

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
			return
		end
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

		if BeginCastBar( OwnerID(), "[SC_RUNRUNPUMPKIN_05]", 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				if CheckID( TargetID() ) == true then
		--			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
					local BuffType = 0
					local Count = BuffCount ( OwnerID())

					local SetA = -1--�Ŧ⪺�Ӽ�
					local SetB = -1--��
					local SetC = -1--��

					for i = 0 , Count do
						local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
						if BuffID == 504940 then
							local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

							SetA = BuffLv

						elseif BuffID == 504941 then
							local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

							SetB = BuffLv


						elseif BuffID == 504942 then
							local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

							SetC = BuffLv

						end
					end

					local P = 3
					local XX = Rand( P )      
					
					if XX == 0 then   --��

						CancelBuff(OwnerID(),504940)
						AddBuff(OwnerID(), 504940,SetA+1,600)

						if SetB > -1 then
							CancelBuff(OwnerID(),504941)
							AddBuff(OwnerID(), 504941,SetB,600)
						end
						if SetC > -1 then
							CancelBuff(OwnerID(),504942)
							AddBuff(OwnerID(), 504942,SetC,600)
						end

						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_06]".."[504940]" , 0 ) 



					elseif XX == 1 then   --��



						if SetA > -1 then
							CancelBuff(OwnerID(),504940)
							AddBuff(OwnerID(), 504940,SetA,600)
						end

						CancelBuff(OwnerID(),504941)
						AddBuff(OwnerID(), 504941,SetB+1,600)

						if SetC > -1 then
							CancelBuff(OwnerID(),504942)
							AddBuff(OwnerID(), 504942,SetC,600)
						end
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_06]".."[504941]" , 0 ) 

					else--��


						if SetA > -1 then
							CancelBuff(OwnerID(),504940)
							AddBuff(OwnerID(), 504940,SetA,600)
						end
						if SetB > -1 then
							CancelBuff(OwnerID(),504941)
							AddBuff(OwnerID(), 504941,SetB,600)
						end

						CancelBuff(OwnerID(),504942)
						AddBuff(OwnerID(), 504942,SetC+1,600)

						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_RUNRUNPUMPKIN_06]".."[504942]" , 0 ) 


					end

			--			GiveBodyItem( OwnerID() , 720598 , 1 );  --LV4

						Delobj( TargetID() )
		
		--			else
		--				ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

	--				end	
				end

			elseif ( result == "DAME" ) then

	--			SetPlot( TargetID(),"touch","LuaYU_VN_BOXGood_0",10 )
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
			end
		end
	end
end

function LuaYU_hello2009_thegun_03() --�@�q�ɶ��n�ʬ����
	sleep(300)

	if CheckID( OwnerID() ) == true then
		Delobj( OwnerID() )
	end

end


function LuaYU_hello2009_Kingdead_00() -- �j�n���z�F

	local fire = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+8) --���Τ�

	BeginPlot( fire   , "LuaYU_hello2009_Kingdead_01" , 0 )  

	return false
end

function LuaYU_hello2009_Kingdead_01() -- �j�n���z�F

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local ball = CreateObjByFlag( 112060, 780328 , 0 , 1 );--�²y�S��
	SetModeEx( ball  , EM_SetModeType_Mark, false )--���аO.
	SetModeEx( ball , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( ball  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( ball  , EM_SetModeType_Move, false )--����
	SetModeEx( ball  , EM_SetModeType_Gravity, false )--���O
	AddToPartition( ball , RoomID )  

	local OwnerX = ReadRoleValue( ball , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( ball , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( ball , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( ball , EM_RoleValue_Dir ) 

	OwnerY = OwnerY +20

	SetPos( ball , OwnerX, OwnerY, OwnerZ , OwnerDIR )

	ScriptMessage( OwnerID() , 0 , 1 , "|off00ff00" .."[SC_RUNRUNPUMPKIN_16]".. "|r" , 0 ) 
	ScriptMessage( OwnerID() , 0 , 0 , "|off00ff00" .."[SC_RUNRUNPUMPKIN_16]".. "|r" , 0 ) 

	BeginPlot( ball   , "LuaYU_hello2009_Kingdead_02" , 0 )  

end

function LuaYU_hello2009_Kingdead_02() 

	sleep(50)
	Delobj( OwnerID() )

end

