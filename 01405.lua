function Z24_test ()
	local time1 = 0
	local time2 = 0
	local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) --Ū�XBoss�b���@�h
	local BCN  
	local BCS 
	
	--�اP�w�Z�����z���y
	BCN = CreateObjByFlag( 106652 , 781081 , 1 , 1 ) ---�Z���P�w�y
	SetModeEx( BCN , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( BCN , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( BCN , EM_SetModeType_Strikback, false) ---����
	SetModeEx( BCN , EM_SetModeType_Move, false) ---����	
	SetModeEx( BCN , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( BCN , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( BCN , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( BCN , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( BCN , EM_SetModeType_Searchenemy, false)  ---����
	SetModeEx( BCN   , EM_SetModeType_Obstruct, false )--����	
	AddToPartition( BCN,roomid )
	
	BCS = CreateObjByFlag( 106652 , 781081 , 2 , 1 ) ---�Z���P�w�y
	SetModeEx( BCS , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( BCS , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( BCS , EM_SetModeType_Strikback, false) ---����
	SetModeEx( BCS , EM_SetModeType_Move, false) ---����	
	SetModeEx( BCS , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( BCS , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( BCS , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( BCS , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( BCS , EM_SetModeType_Searchenemy, false)  ---����
	SetModeEx( BCS   , EM_SetModeType_Obstruct, false )--����	
	AddToPartition( BCS,roomid )

	while 1 do
		sleep(10)
		time1 = time1 + 1 
		time2 = time2 + 2
		if time1 % 10 ==0 then
			time2 = 0 --����۪��p��
			local time3 = 0 --�j�������p��
			local player2 ={}
			local luck3 --�w������H
			local luck4 --�îg����H
			local ALLP = SetSearchAllPlayer(roomID ) --�j�M�������a
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_106609_01]" , 2 )
			player2 = DW_HateRemain(0) --������H   ��0�N�� ���ư��D�Z
			sleep(10)

			--�Z���P�w�}�l
			if GetDistance( OwnerID(), BCN ) >= GetDistance( OwnerID(), BCS ) then
				--��BOSS�bN��V�ɡA�𪱮a��S��V
				AddBuff (OwnerID() , 622028 ,0 , 30) --BOSS���� 
				FA_FaceFlagEX ( OwnerID() , 781081 , 1 , 0 , 0)  --���VN��V�X��

				for i = 1 , ALLP ,1 do --�⪱�a���S�ϰ�
					local PID = GetSearchResult()
					if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
					ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
					ReadRoleValue( PID , EM_RoleValue_RoomID  ) == roomID then --�b�P�h
					SetPosByFlag( PID , 781081 , 1 ) --�����S��V
					end
				end

			elseif GetDistance( OwnerID(), BCS ) > GetDistance( OwnerID(), BCN ) then
				--��BOSS�bS��V�ɡA�𪱮a��N��V
				AddBuff (OwnerID() , 622028 ,0 , 30) --BOSS���� 
				FA_FaceFlagEX ( OwnerID() , 781081 , 2 , 0 , 0)  --���VS��V�X��
				local ALLP = SetSearchAllPlayer(roomID ) --�j�M�������a
				for i = 1 , ALLP ,1 do --�⪱�a���S�ϰ�
					local PID = GetSearchResult()
					if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
					ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
					ReadRoleValue( PID , EM_RoleValue_RoomID  ) == roomID then --�b�P�h
					SetPosByFlag( PID , 781081 , 2 ) --�����S��V
					end
				end
			end
			--�Z���P�w����

			
			if ALLP >= 3 then -- ���a��3�H�H�W
				luck3 = Az_RND_Ary(1,6,3) --�q1~6�����X3��]]
				AddBuff( player2[luck3[1]] , 621939 , 0 , 8) --�w��8��
				AddBuff( player2[luck3[2]] , 621939 , 0 , 8) --�w��8��
				AddBuff( player2[luck3[3]] , 621940, 0 , 10) --�аO�ĤT�ӤH
				
				sleep(30)
				say (OwnerID() , "show")
				--��t--
				--�îg
				for i =1 , 10 , 1 do
					luck4 = Rand(table.getn(player2))+1	
					sleep(10)
					CastSpellLv	( OwnerID(),  player2[luck4] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luck4] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luck4+1] , 499072, 0 )
					sleep(10)
				end								
			elseif ALLP == 2 then --�ѤU2�H
				local luckp = Az_RND_Ary(1,2,2)
				AddBuff( player2[luckp[1]] , 621939 , 0 , 8) --�w��8��
				AddBuff( player2[luckp[2]] , 621940, 0 , 10) --�аO��2�ӤH
				sleep(30)
				say (OwnerID() , "show2")
				--��t--
				--�îg
				for i = 1 , 10 , 1 do
					CastSpellLv	( OwnerID(),  player2[luckp[1]] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luckp[1]] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[luckp[2]] , 499072, 0 ) 
					sleep(10)
				end
			elseif ALLP == 1 then --�ѤU1�H
				AddBuff( player2[1] , 621939 , 0 , 8) --�w��8��
				AddBuff( player2[1] , 621940, 0 , 10) --�аO��2�ӤH
				sleep(30)
				say (OwnerID() , "show3")
				--��t--
				--�îg
				for i = 1 , 10 , 1 do
					CastSpellLv	( OwnerID(),  player2[1] , 499072 , 0 ) 
					sysCastSpellLv	( OwnerID(),  player2[1] , 499072 , 0 ) 
					sleep(10)
				end
			end

			--10��S���H�bBOSS100�d�򤺫h+BOSS�����ˮ`
			local npcp = {}
			npcp = SearchRangePlayer( OwnerID() , 100 ) 
			local num = table.getn(npcp)
			if num == 0 then
				AddBuff( OwnerID() , 621943 , 0 , -1)
			end
			CancelBuff (OwnerID() , 622028) --�h���w��
		end	
	end
end

--------------------------------------------------Lv50 �C�v ���m����2
function lua_Dy_weakdef(Condition)	
	if Condition == 1 then
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+9 )
		AddBuff( TargetID() , 503404 , PLevel , 8)
	end	
end
---------------------------------------------------Lv50 ���� �������2
function lua_Dy_fireHalo2()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 
	AddBuff( Master , 502854 , 0 , 10)	
end	

-------------------------------------------------------- �˪L���� �۵M���餧�����z��
function lua_Dy_CrystalExplosionCheck() ---�ˬd���L�d��
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( MyPet ) == true then --���d��ID����
		say (OwnerID(), "pet")
		return true
	elseif CheckID( MyPet ) == false then --�S���d��ID�ɦ^�ǿ��~
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		say (OwnerID(), "nopet")
		return false 
	end
end
function lua_Dy_CrystalExplosionDel()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( MyPet ) == true then
		DelObj ( MyPet ) ---�R���d��
		return true
	end
end
function lua_Dy_GoodByeMyPet_t()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	if CheckID( Mypet ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		say ( OwnerID() , "11")
		return false
	end
	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
	if CheckID( Mypet ) == true then 
		if MypetID == 102297 then
			DelObj ( MyPet ) ---�R���d��
			return true
		elseif MypetID ~= 102297 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			say ( Mypet , "11")
			return false
		end
	end
end
function lua_Dy_DarkHeart()
	local RattanBuff = 505753
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , RattanBuff ) == true then
			local Count = BuffCount(ID)				
			for BuffPos=0 , Count-1 do
				--local BuffPos = Lua_BuffPosSearch( ID , RattanBuff )			
				if BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() 
					and BuffInfo(ID , BuffPos , EM_BuffInfoType_BuffID ) == RattanBuff then
					local PLV = BuffInfo( ID , BuffPos , EM_BuffInfoType_Power )	
					--say(OwnerID() , PLV)
					if BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 1 then
						SysCastSpellLv( OwnerID() , ID , 494963 , PLV )
					end
				end
			end	
		end
	end	
end
function lua_Dy_DarkHeartCheck()
	AddBuff( OwnerID() , 505808 , 0 , -1 )
end
function lua_Dy_SoulAtk_test()	--�k�N�o�ʦ��\�ɦ����
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP ) ------���d������HP
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) -----���d��HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100
	local HP = math.floor(abs(MyPetMaxHp*0.2))
	if HPPercent > 20 then 
			WriteRoleValue ( MyPet , EM_RoleValue_HP, MyPetHp-HP)
			say (OwnerID(), MyPetHp-HP)
			return true
	elseif HPPercent < 20 or HPPercent == 20 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "B")
			return false
		end
end

function lua_Dy_testODO()
	say (OwnerID(), " First")
end
function dy_test_01()
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	say (MasterGID , "Master")
	say (OwnerID() , "owner")
	say (TargetID() , "target")
end
function Dy_Z23DIE ()
	SetPlot( OwnerID() ,"dead","Dy_DIETEST",10 )
end
function Dy_DIETEST()--
	say (TargetID() , "target")
end
function Dy_BOSS_T ()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_WALK_FORWARD)  
	LuaFunc_MoveToFlag( OwnerID(), 781142 , 2 ,0 ) 
end
function Dy_z23_12TEST() --�԰���t���ե�
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
	local ant =  CreateObj ( 101672 , X+35 , Y , Z+35  , Dir , 1) 
	SetModeEx( ant  ,EM_SetModeType_Show, true )--���*
	SetModeEx( ant  ,EM_SetModeType_Searchenemy , false ) --����*
	SetModeEx( ant  ,EM_SetModeType_Save , true ) --�x�s*
	SetModeEx( ant  ,EM_SetModeType_Revive , false ) --����*
	SetModeEx( ant  ,EM_SetModeType_Obstruct , false )--����*
	SetModeEx( ant  ,EM_SetModeType_Strikback , true ) --����*
	SetModeEx( ant  ,EM_SetModeType_Fight , true ) --���*
	SetModeEx( ant  ,EM_SetModeType_Gravity , false ) --���O*	
	SetModeEx( ant  ,EM_SetModeType_Move , true ) --����*
	SetModeEx( ant  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
	SetModeEx( ant  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
	SetModeEx( ant  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
	AddToPartition( ant, RoomID)
	AddBuff( OwnerID() , 502957 , 0 ,600)
	SetAttack( ant , OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,ant ) --�s��Ǫ��e��1�̭�
	WriteRoleValue( ant , EM_RoleValue_Register1 , OwnerID())	

end