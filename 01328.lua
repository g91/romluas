--�����B�A

function Lua_Haoplaymusic_00()

	SetPlot( OwnerID(),"touch","Lua_Haoplaymusic_01",50 ) --Ĳ�I�@��

end


function Lua_Haoplaymusic_01()

--	Say(  OwnerID(),"OwnerID" )  --���a
--	Say(  TargetID(),"TargetID" ) --����


	local  ZONEID = ReadRoleValue( OwnerID() ,EM_RoleValue_ZoneID)


	if BeginCastBar( OwnerID(), "[SYS_SKILLNAME_MINING]", 50 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
 	AttachCastMotionTool( OwnerID(), 210508 ); --�m���Z��������

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


			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then   --�P�_���a�I�]�Ŷ�������


				SetPlot( TargetID(),"touch","",0 ) -- ������L�k�A��Ĳ�o���q�@��



				if ZONEID == 110 then --���H���]�a��
				
					GiveBodyItem( OwnerID(), 204527, 1 ) --���a��o���~

				elseif ZONEID == 102 then --�o��׹D�|

					GiveBodyItem( OwnerID(), 204528, 1 )

				elseif ZONEID == 251 then --�Ĵ���S

					GiveBodyItem( OwnerID(), 204530, 1 )

				elseif ZONEID == 103 then --�褧�ӫ�

					GiveBodyItem( OwnerID(), 204529, 1 )

				end


				Hide(TargetID()) --���ê���

				BeginPlot( TargetID() , "Lua_Haoplaymusic_02" , 0 )  --����Ĳ�o���m����


			else
				SetSpeakDetail( OwnerID(), GetString("SC_TREASURE_NOSPACE")   )--�I�]�S���Ŷ�
			end






		end
	end


end

function Lua_Haoplaymusic_02() --OwnerID  ������

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	sleep(1000000)
	Show(OwnerID(),RoomID)
	BeginPlot( OwnerID() , "Lua_Haoplaymusic_00" , 0 ) 

end



function Lua_YUmusicmaker_00()

--	Say(OwnerID()  , "OwnerID") --NPC
--	Say(TargetID()  , "TargetID") --���a

	local music01 =  CheckFlag( TargetID()  , 542622 ) --�Q�w

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --�P�_���a�I�]�Ŷ�������

				
					GiveBodyItem( TargetID(), 204534, 1 ) --���a��o���~
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]�N�H����a���]�k�־����A�եΡA���֨ϥάݬݧa�I
					SetFlag( TargetID()  , 542622 , 1 )  --�S���L���X��

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--�I�]�S���Ŷ�
			end


	end


end

function Lua_YUmusicmaker_01()


	local music01 =  CheckFlag( TargetID()  , 542623 ) --�N�L

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --�P�_���a�I�]�Ŷ�������

				
					GiveBodyItem( TargetID(), 204533, 1 ) --���a��o���~
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]�N�H����a���]�k�־����A�եΡA���֨ϥάݬݧa�I
					SetFlag( TargetID()  , 542623 , 1 )  --�S���L���X��

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--�I�]�S���Ŷ�
			end


	end


end

function Lua_YUmusicmaker_02()


	local music01 =  CheckFlag( TargetID()  , 542624 ) --�ħJ����

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --�P�_���a�I�]�Ŷ�������

				
					GiveBodyItem( TargetID(), 204532, 1 ) --���a��o���~
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]�N�H����a���]�k�־����A�եΡA���֨ϥάݬݧa�I
					SetFlag( TargetID()  , 542624 , 1 )  --�S���L���X��

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--�I�]�S���Ŷ�
			end


	end


end

function Lua_YUmusicmaker_03()


	local music01 =  CheckFlag( TargetID()  , 542625 ) --�F�a

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --�P�_���a�I�]�Ŷ�������

				
					GiveBodyItem( TargetID(), 204536, 1 ) --���a��o���~
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]�N�H����a���]�k�־����A�եΡA���֨ϥάݬݧa�I
					SetFlag( TargetID()  , 542625 , 1 )  --�S���L���X��

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--�I�]�S���Ŷ�
			end


	end


end

function Lua_YUmusicmaker_04()


	local music01 =  CheckFlag( TargetID()  , 542626 ) --�a��

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --�P�_���a�I�]�Ŷ�������

				
					GiveBodyItem( TargetID(), 204535, 1 ) --���a��o���~
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]�N�H����a���]�k�־����A�եΡA���֨ϥάݬݧa�I
					SetFlag( TargetID()  , 542626 , 1 )  --�S���L���X��

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--�I�]�S���Ŷ�
			end


	end


end