--Pet_NPC      542203
function LuaYU_PetSystemGG_00()

	SetPlot( OwnerID(),"touch","LuaYU_PetSystemGG_01",20 )
end

function LuaYU_PetSystemGG_01()

--	Say(OwnerID(), "OwnerID".."1"  ) ���a
--	Say(TargetID(), "TargetID".."1"  ) ��
	MoveToFlagEnabled(TargetID (), false )

	local food =  CountBodyItem( OwnerID() , 204789 ) --�}�ƥ]
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID ) 
	local GG = ReadRoleValue( TargetID() , EM_RoleValue_Register+5  ) --�P�_���O�_�n�ͳJ�F
	local GGsMaster = ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) --�P�_���L��n�ͳJ���O��
	local Xgg = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) --�P�_������l��m

	local P = 100
	local XX = Rand( P )    

--	Say(  TargetID() , GG )
--	Say(  TargetID() , GGsMaster )
--	Say(  OwnerID() , GGsMaster )

	if GG == 6 then --���n�ͳJ�F�A���w�v��

		if GGsMaster == OwnerID()  then

			Say(  OwnerID(), "[SC_PETSYS_02]" )--���a������ �[�o
			if BeginCastBar( OwnerID(), "[SC_PETSYS_03]", 10 , ruFUSION_ACTORSTATE_EMOTE_VICTORY , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	

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

					local TargetX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
					local TargetY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
					local TargetZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 

					PlayMotion( TargetID(), 161) 	
					sleep(10)
					PlayMotion( TargetID(), 120) 	
					sleep(20)
					PlayMotion( TargetID(), 33) 	
					sleep(10)

					WriteRoleValue( TargetID()  , EM_RoleValue_IsWalk , 1 )

					WriteRoleValue( TargetID()  , EM_RoleValue_Register+5 , 0 ) --�M�����ͳJ���A
					WriteRoleValue( TargetID()  , EM_RoleValue_Register+1  , 0  ) --�M�����O�Ъ��a

					local NewEgg = 0 --�ŧi�@���J

					local GMtest =  CountBodyItem( OwnerID() , 203477 ) --�S��@��Ĳ�o�_��
				--	if (XX < 5) or (GMtest > 0)  then
					if GMtest > 0 then	-- 2012.03.30 �N���ͪ����J(204792)��5%���v�ä[�����A�����{�b�u�|���ͷs�A�����J(204795)
						NewEgg = CreateObj ( 114931 , TargetX , TargetY+1 , TargetZ , 0 , 1) --��G�J�X�{�F
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_04]" , "0xffffff00")  --�O���J�I
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_04]", "0xffffff00")  --�O���J�I
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --�J�N���a�O�_��(�Ҧ��v)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06_golden",40 )--���J�@��
					else
						NewEgg = CreateObj ( 112958 , TargetX , TargetY+1 , TargetZ , 0 , 1) --�J�X�{�F
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_05]" , "0xffffff00")  --���J�F
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_05]", "0xffffff00")  --���J�F
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --�J�N���a�O�_��(�Ҧ��v)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06",40 )
					end
					SetModeEx( NewEgg , EM_SetModeType_Gravity, false )--���O
					AddToPartition( NewEgg , RoomID )  
					AddBuff( NewEgg , 503589 , 1 , -1 )--�G����
				--	if (XX < 5) or (GMtest > 0)  then
				--	if GMtest > 0 then	-- 2012.03.30 �N�����Ͳ��X�����J(204792)��5%���v�����A�{�b�A�����u�|�Ͳ��X�s�A�����J(204795)
				--		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_04]" , "0xffffff00")  --�O���J�I
				--		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_04]", "0xffffff00")  --�O���J�I
				--		WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --�J�N���a�O�_��(�Ҧ��v)
				--		SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06_golden",40 )--���J�@��
				--	else
				--		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_05]" , "0xffffff00")  --���J�F
				--		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_05]", "0xffffff00")  --���J�F
				--		WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --�J�N���a�O�_��(�Ҧ��v)
				--		SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06",40 )
				--	end
					BeginPlot( NewEgg , "LuaYU_PetSystemGG_07" , 0 ) --�ɶ���L�D�v
					SetPlot( TargetID(),"touch","",0 )
					LuaFunc_MoveToFlag( TargetID() , 780307 , Xgg-1 , 0 ) --���ͧ��J���V��l�I
					SetPlot( TargetID(),"touch","LuaYU_PetSystemGG_01",20 )
					MoveToFlagEnabled( TargetID(), true )
				end
			end
		else
--			ScriptMessage(OwnerID(), OwnerID() , 1 , " NO~~~It's not your G~ " , 0 )  --���ள�J
--			ScriptMessage(OwnerID(), OwnerID() , 0 , " NO~~~It's not your G~ " , 0 )  --���ள�J
		end

	elseif GG == 5 then  --15���S�H�ޭn�ͳJ�����A�L�v������H�ҥi���J

			Say(  OwnerID(), "[SC_PETSYS_02]" )--���a������ �[�o
			if BeginCastBar( OwnerID(), "[SC_PETSYS_03]", 10 , ruFUSION_ACTORSTATE_EMOTE_VICTORY , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	

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

					local TargetX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
					local TargetY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
					local TargetZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 

					PlayMotion( TargetID(), 161) 	
					sleep(10)
					PlayMotion( TargetID(), 120) 	
					sleep(20)
					PlayMotion( TargetID(), 33) 	
					sleep(10)

					WriteRoleValue( TargetID()  ,EM_RoleValue_IsWalk , 1 )

					WriteRoleValue(  TargetID()  , EM_RoleValue_Register+5 ,  0 ) --�M�����ͳJ���A
					WriteRoleValue(  TargetID()  , EM_RoleValue_Register+1  , 0  ) --�M�����O�Ъ��a


					local NewEgg = 0 --�ŧi�@���J

					local GMtest =  CountBodyItem( OwnerID() , 203477 ) --�S��@��Ĳ�o�_��
				--	if (XX < 5) or (GMtest > 0)  then
					if GMtest > 0 then	-- 2012.04.13 �N���ͪ����J(204792)��5%���v�ä[�����A�����{�b�u�|���ͷs�A�����J(204795)
						NewEgg = CreateObj ( 114931 , TargetX , TargetY+1 , TargetZ , 0 , 1) --��G�J�X�{�F
					else
						NewEgg = CreateObj ( 112958 , TargetX , TargetY+1 , TargetZ , 0 , 1) --�J�X�{�F
					end
					SetModeEx( NewEgg   , EM_SetModeType_Gravity, false )--���O
					AddToPartition( NewEgg , RoomID )  

					AddBuff( NewEgg ,503589 ,1 ,-1 )--�G����

				--	if (XX < 5) or (GMtest > 0)  then
					if GMtest > 0 then	-- 2012.03.30 �N���ͪ����J(204792)��5%���v�ä[�����A�����{�b�u�|���ͷs�A�����J(204795)
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_04]" , "0xffffff00")  --�O���J�I
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_04]", "0xffffff00")  --�O���J�I
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --�J�N���a�O�_��(�Ҧ��v)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06_golden",40 )--���J�@��
					else
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_05]" , "0xffffff00")  --�O�J�I
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_05]", "0xffffff00")  --�O�J�I
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --�J�N���a�O�_��(�Ҧ��v)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06",40 )
					end

					BeginPlot( NewEgg , "LuaYU_PetSystemGG_07" , 0 ) --�ɶ���L�D�v
					SetPlot( TargetID(),"touch","",0 )
					LuaFunc_MoveToFlag( TargetID() , 780307 , Xgg-1 , 0 ) --���ͧ��J���V��l�I
					SetPlot( TargetID(),"touch","LuaYU_PetSystemGG_01",20 )
					MoveToFlagEnabled( TargetID(), true )
				end
			end

	elseif GG == 0 and  food >= 1 then --�S�H��

		if XX >50 and XX < 100 then --40%
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+8 , TargetID()  )
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1  , OwnerID()  ) --�O���a
			BeginPlot( OwnerID() , "LuaYU_PetSystemGG_02" , 0 ) --���a���i
			BeginPlot( TargetID() , "LuaYU_PetSystemGG_04" , 0 )--�ʪ��ʧ@�^�X 
		else -- 60%
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+8 , TargetID()  )
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1  , OwnerID()  ) --�O���a
			BeginPlot( OwnerID() , "LuaYU_PetSystemGG_03" , 0 ) 
			BeginPlot( TargetID() , "LuaYU_PetSystemGG_04" , 0 ) 
		end

	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_74]" , 0 )  --�S�󤣯���
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_74]" , 0 )  --�S�󤣯���
			MoveToFlagEnabled(TargetID (), true )
	end
end


function LuaYU_PetSystemGG_02() --���a����

--	Say(OwnerID(), "OwnerID".."2"  )
--	Say(TargetID(), "TargetID".."2"  )
	local GG = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8  ) --��

	SetPlot( GG,"touch","",0 )

	if BeginCastBar( OwnerID(), "[SC_PETSYS_06]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	

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
			
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_07]" , "0xffffff00")  --�A�ܶ��Q�����������C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_07]" , "0xffffff00")  --�A�ܶ��Q�����������C
			DelBodyItem( OwnerID() , 204789 , 1 )
			WriteRoleValue(  GG , EM_RoleValue_Register+1  , OwnerID()  ) --�N���a�O�_��
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_08]" , "0xffffff00")  --���n�ͳJ�F�C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_08]" , "0xffffff00")  --���n�ͳJ�F�C
			SetPlot( GG,"touch","",0 )
			BeginPlot( GG , "LuaYU_PetSystemGG_05" , 0 ) 

		elseif  ( result == "DAME" ) then

			SetPlot( GG,"touch","LuaYU_PetSystemGG_01",20 )
			MoveToFlagEnabled( GG, true )


		end


	end


end



function LuaYU_PetSystemGG_03() --���a����

	local GG = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8  ) --��

	SetPlot( GG,"touch","",0 )

	if BeginCastBar( OwnerID(), "[SC_PETSYS_06]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	

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
			
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_09]" , 0 )  --�A�⦣�}�ê����������C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_09]" , 0 )  --�A�⦣�}�ê����������C

			DelBodyItem( OwnerID() , 204789 , 1 )

			SetPlot( GG,"touch","LuaYU_PetSystemGG_01",20 )
			MoveToFlagEnabled( GG, true )


		elseif  ( result == "DAME" ) then

			SetPlot( GG,"touch","LuaYU_PetSystemGG_01",20 )
			MoveToFlagEnabled( GG, true )

		end
	end



end

function LuaYU_PetSystemGG_04() -- �ʪ��ʧ@�^�X

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --���a

--	Say(Player, "Player".."2"  )
--	Say(OwnerID(), "OwnerID".."2"  )	

	AdjustFaceDir( OwnerID(), Player , 0 ) --���V
	sleep(10)
	PlayMotion( OwnerID(), 121) 	
		
	sleep(20)
	PlayMotion( OwnerID(), 121) 	

	sleep(20)
	PlayMotion( OwnerID(), 122) 	


end

function LuaYU_PetSystemGG_05() -- ���ͳJ�@��

--	Say(OwnerID(), "OwnerID")
--	Say(TargetID(), "TargetID")

	local Xegg = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --�P�_�ͳJ��m
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --���a

	AddBuff( OwnerID() ,503141 ,1 ,20 )--��Y
	sleep(10)

	WriteRoleValue( OwnerID()  ,EM_RoleValue_IsWalk , 0 )

	LuaFunc_MoveToFlag( OwnerID() , 780307 , Xegg , 0 )
--	sleep(5)
	SetPosByFlag( OwnerID(), 780307 , Xegg )

	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+5 , 6  )
	SetPlot( OwnerID(),"touch","LuaYU_PetSystemGG_01",20 )

	BeginPlot( OwnerID() , "LuaYU_PetSystemGG_08" , 0 ) --�ɶ���A���L�D�v
	

end

function LuaYU_PetSystemGG_06() -- ���J�@��

--	Say(OwnerID(), "OwnerID" )
--	Say(TargetID(), "TargetID" )

	local GGsMaster = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --�P�_�J���Ҧ��v

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+3) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_Register+3, 1 ) --��w�B����

	if GGsMaster == OwnerID()  then

		if BeginCastBar( OwnerID(), "[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

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

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_10]" , "0xffffff00")  --����J
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_10]", "0xffffff00")  --����J
				SetPlot( TargetID(),"touch","",0 )--���J�@��			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204795 , 1 ) --�s�A�����J

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --�Ѱ���w

			end


		end

	elseif GGsMaster == 0 then


		if BeginCastBar( OwnerID(),"[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

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

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_10]" , "0xffffff00")  --����J
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_10]", "0xffffff00")  --����J
				SetPlot( TargetID(),"touch","",0 )--���J�@��			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204795 , 1 ) --�s�A�����J

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --�Ѱ���w

			end


		end

	end

end

function LuaYU_PetSystemGG_06_golden() -- �����J�@��

--	Say(OwnerID(), "OwnerID" )
--	Say(TargetID(), "TargetID" )

	local GGsMaster = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --�P�_�J���Ҧ��v

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+3) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_Register+3, 1 ) --��w�B����

	if GGsMaster == OwnerID()  then

		if BeginCastBar( OwnerID(),"[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

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

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_11]" , "0xffffff00")  --����J
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_11]", "0xffffff00")  --����J
				SetPlot( TargetID(),"touch","",0 )--���J�@��			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204792 , 1 ) --���J

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --�Ѱ���w

			end


		end

	elseif GGsMaster == 0 then


		if BeginCastBar( OwnerID() ,"[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

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

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_11]" , "0xffffff00")  --����J
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_11]", "0xffffff00")  --����J
				SetPlot( TargetID(),"touch","",0 )--���J�@��			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204792 , 1 ) --���J

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --�Ѱ���w

			end


		end

	end

end



function LuaYU_PetSystemGG_07() -- �ɶ���A�J�L�D�v

--	sleep(150)
	if CheckID(  OwnerID()  ) == true then
		WriteRoleValue(  OwnerID()  , EM_RoleValue_PID  , 0  ) --�J�N���a�O�_��(�Ҧ��v)
	end
end

function LuaYU_PetSystemGG_08() -- �ɶ���A���L�D�v

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --���a

--	sleep(150)

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+5  ) == 6 and Player == ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  )  then
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+5 , 5 )
	end	
end

function Lua_Hao_PetSystem_Egg()	-- 2012.03.30 �s�W�A�������a�C�ѭ����������������[�o�ɡA���w�|�����@�������J(204792)�C
	
	local Player = TargetID()
	local Key = { 542576 , 542578 }
	SetFlag( Player , Key[1] , 1 )
	SetFlag( Player , Key[2] , 0 )
end

function Lua_Hao_PetSystem_Egg_0()	-- 2012.04.02 �s�W�A�iZone�ɵ������a�C��X�� - 542577�A�P�ɡA�̷ӺX�е����ä[�ʭ��n���~ - 542578

	local Npc = OwnerID()
	SetPlot( Npc , "Range" , "Lua_Hao_PetSystem_Egg_1" , 500 )
end

function Lua_Hao_PetSystem_Egg_1()	-- 2012.04.02 �s�W
	
	local Player = OwnerID()
	local Key = { 542576 , 542577 , 542578 }
	local QuestID = 425174	

	if CheckFlag( Player , Key[2] ) == false then
		SetFlag( Player , Key[2] , 1 )
		SetFlag( Player , Key[3] , 1 )
	--	DeleteQuest( Player , QuestID )
	end
end

function Lua_Hao_PetSystem_Egg_2()	-- 2012.03.30 �s�W�A���a�Pnpc��ܮɡA�Y���W�S�����n���~542576�A�h�j��R�����Х���
	
	local Player = OwnerID()
	local QuestID = 425174
	local Key = { 542576 , 542577 , 542578 }
	
	if CheckFlag( Player , Key[1] ) == false then
		SetFlag( Player , Key[2] , 1 )
		SetFlag( Player , Key[3] , 1 )
		DeleteQuest( Player , QuestID )
	end
	LoadQuestOption( Player )
end

function Lua_Hao_PetSystem_Egg_Reset()	-- 2012.04.02 �s�W�A���m���a��饼�����Ȫ����A
	
	local Player = OwnerID()
	local QuestID = 425174
	local Key = { 542576 , 542577 , 542578 }
	
	for i = 1 , table.getn(Key) , 1 do
		SetFlag( Player , Key[i] , 0 )
	end
end