function YUYULua_PetsGo_00()

	SetPlot( OwnerID() , "dead","YUYULua_PetsGo_01",0 )           

end

function YUYULua_PetsGo_01()

--	local HateC = HateListCount( OwnerID() ) --����C��
	local MaxHate = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID ) --����C��̰���

	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID  ) --�өǦb��Ʈw���Τ@ID

	local PlayerLV = ReadRoleValue( MaxHate , EM_RoleValue_LV  ) --�Ӥ���̰��̤�����
	local MonsterLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  ) --�өǤ�����

	Say(   MaxHate , PlayerLV )

	local P = 100
	local XX = Rand( P )    
  

	if Math.abs(MonsterLV - PlayerLV) <= 5 then

	
		if XX >= 95 and XX <= 100 then   --5%

			local Peter = LuaFunc_CreateObjByObj ( 112770 , OwnerID() ) 
			AddToPartition( Peter , 0 )  

			WriteRoleValue( Peter ,EM_RoleValue_PID  , MaxHate  )
			WriteRoleValue( Peter ,EM_RoleValue_Register+1  , MonsterID  )

			BeginPlot( Peter , "YUYULua_PetsGo_02" , 0 )    
--			Say(   Peter , "YES" )

		elseif XX >= 55 and XX <= 60 then   --5%


			local Peter = LuaFunc_CreateObjByObj ( 112770 , OwnerID() )
			AddToPartition( Peter , 0 )  

			WriteRoleValue( Peter ,EM_RoleValue_PID  , MaxHate  )
			WriteRoleValue( Peter ,EM_RoleValue_Register+1  , MonsterID  )

			BeginPlot( Peter , "YUYULua_PetsGo_02" , 0 )    
--			Say(   Peter , "YES" )

--		elseif XX >= 0 and XX <= 5 then   --5%
		else
--		elseif XX >= 0 and XX <= 30 then   --30%

			local Peter = LuaFunc_CreateObjByObj ( 112770 , OwnerID() ) 
			AddToPartition( Peter , 0 )  

			WriteRoleValue( Peter ,EM_RoleValue_PID  , MaxHate  )
			WriteRoleValue( Peter ,EM_RoleValue_Register+1  , MonsterID  )

			BeginPlot( Peter , "YUYULua_PetsGo_02" , 0 )    
--			Say(   Peter , "YES" )
		
		end
	else

		ScriptMessage( OwnerID() , -1 , 1 , "Your LV - Monster's LV must =< 5 " , C_SYSTEM )      -- ���ŤӰ����i��X�d���C5�Ť��~��
		ScriptMessage( OwnerID() , -1 , 0 , "Your LV - Monster's LV must =< 5" , C_SYSTEM )

	end




end


function YUYULua_PetsGo_02()

	local Player = ReadRoleValue( OwnerID()  , EM_RoleValue_PID  ) 
	local MonsterID = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+1  ) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

--	Say( OwnerID() , "OwnerID!!" ) --NPC
--	Say( TargetID() , "TargetID!!" ) --�Ǫ�
--	Say( Player , "Player" ) --���a


	ScriptMessage( Player , Player , 1 , "Peter is coming!" , C_SYSTEM )      -- �o�{�F�ͪ���s���I�L���G���M�I�F�I�л������U�L�I
	ScriptMessage( Player , Player , 0 , "Peter is coming!" , C_SYSTEM )

	local X = ReadRoleValue( OwnerID()  , EM_RoleValue_X  ) 
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y  ) 
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z  ) 
	local D = ReadRoleValue( OwnerID()  , EM_RoleValue_Dir  ) 

	local M1 = CreateObj ( MonsterID , X , Y , Z , D , 1)
	local M2 = CreateObj ( MonsterID , X , Y , Z , D , 1)
	local M3 = CreateObj ( MonsterID , X , Y , Z , D , 1)

	SetFollow( OwnerID() , Player )

	Say( OwnerID() , "Help!!" ) --�ϩR�r�I
	sleep(25)

	AddToPartition( M1 , RoomID) 
	SetPlot( M1 , "dead","YUYULua_PetsGo_06",0 )        
	SetAttack( M1 , Player  )
	sleep(15)

	Say( OwnerID() , "Help!!" ) --�ϩR�r�I
	AddToPartition( M2 , RoomID) 
	SetPlot( M2 , "dead","YUYULua_PetsGo_06",0 )        
	SetAttack( M2 , Player  )
	sleep(15)

	Say( OwnerID() , "Help!!" ) --�ϩR�r�I
	AddToPartition( M3 , RoomID) 
	SetPlot( M3 , "dead","YUYULua_PetsGo_06",0 )        
	SetAttack( M3 , Player  )

	while true do
	sleep(10)
		if ReadRoleValue( M1 , EM_RoleValue_IsDead ) == 1 or CheckID( M1 ) == false or ReadRoleValue( M1 , EM_RoleValue_IsPlayer ) == 1 then
			if ReadRoleValue( M2 , EM_RoleValue_IsDead ) == 1 or CheckID( M2 ) == false or ReadRoleValue( M2 , EM_RoleValue_IsPlayer ) == 1 then
				if ReadRoleValue( M3 , EM_RoleValue_IsDead ) == 1 or CheckID( M3 ) == false or ReadRoleValue( M3 , EM_RoleValue_IsPlayer ) == 1 then


					Say( OwnerID() , "Thank You!! I've a gift fot you!!" ) -- ���§A�ϤF�ڡI�i�_���U�ڪ��p§���H
					sleep(10)

					WriteRoleValue( OwnerID()  , EM_RoleValue_Register+2  , 5  )
--					Say( OwnerID() , ReadRoleValue( OwnerID()  , EM_RoleValue_Register+2  ) )

					sleep(10)
					SetFollow( OwnerID() ,  OwnerID() )
					BeginPlot( OwnerID() , "YUYULua_PetsGo_05" , 0 )    
					break

				end
			end



		elseif ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or CheckID( Player ) == false  then
			
			if CheckID(M1) == true then
				SetAttack( M1 , OwnerID()  )
			end
			if CheckID(M2) == true then
				SetAttack( M2 , OwnerID()  )
			end
			if CheckID(M3) == true then
				SetAttack( M3 , OwnerID()  )
			end
			sleep(600)
			BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
			sleep(30)
			Delobj( OwnerID() )
			break
		end
	end

end

function YUYULua_PetsGo_03() -- ���b����NPC   112770

--	local Player = ReadRoleValue( OwnerID()  , EM_RoleValue_PID  ) 
--	local MonsterID = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+1  ) 
--	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 




--	while true do
--	sleep(10)

--Say( OwnerID() , "OwnerID!!" ) 
--Say( TargetID() , "TargetID!!" ) 

		local Petgive = ReadRoleValue( TargetID()  , EM_RoleValue_Register+2  ) --�O�_�����Ǫ�

--		Say( OwnerID() , ReadRoleValue( OwnerID()  , EM_RoleValue_Register+2  ) )

		if Petgive == 5 then

			SetSpeakDetail( OwnerID(), "OK,I take it!"  ) --�T�{
			AddSpeakOption( OwnerID(), TargetID( ), "OK" , "YUYULua_PetsGo_04", 0 )

		else
			SetSpeakDetail( OwnerID(), "Help!!"  ) 
		end
--	end


end


function YUYULua_PetsGo_04()

--Say( OwnerID() , "OwnerID!!" ) 
--Say( TargetID() , "TargetID!!" ) 

	local Player = ReadRoleValue( TargetID()  , EM_RoleValue_PID  ) 
	local NowMID = ReadRoleValue( TargetID()  , EM_RoleValue_Register+1  ) --�������Ǫ�ID
	local Petgive = ReadRoleValue( TargetID()  , EM_RoleValue_Register+2  ) --�O�_�����Ǫ�


--�H�U���Ǫ��B�d���J��Ӫ�

	local EggID= {	204236,
			204236,
			204227
			}
	local MonsterID= {	100643,
				101996,
				100878
			}


	local NewEgg = 0

	for i= 1 , table.getn(MonsterID) do

		if NowMID == MonsterID[i] then 
			NewEgg = EggID[i]
		end
	end

	if Petgive == 5 and Player == OwnerID()  then	 --�[�J"�D ��w�����a ���iĲ�oĲ�I�@��"

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

			CloseSpeak( OwnerID()  )	
			GiveBodyItem( OwnerID() ,  NewEgg  , 1 ) --�d���J
			WriteRoleValue( TargetID()  ,EM_RoleValue_Register+2  , 0  )	

			Say( TargetID() , "Bye~" ) --���§A�I�A���I
			PlayMotion( TargetID() , 116) 
			sleep(20)
			Delobj( TargetID() )


		else
			SetSpeakDetail( OwnerID(), "[SC_111576_YU_05]"   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
		end
	end


end


function YUYULua_PetsGo_05()


	sleep(600)

	Say( TargetID() , "You don't want it ? OK!Bye~" ) --���§A�I�A���I
	PlayMotion( TargetID() , 116) 
	sleep(50)
	Delobj( TargetID() )




end

function YUYULua_PetsGo_06()--�X�{���ǰ��W��

	Delobj( OwnerID() )

end

