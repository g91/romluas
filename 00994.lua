function LuaYU_111576_0()

	LoadQuestOption( OwnerID() )

	local BuffType = 0
	local Count = BuffCount ( OwnerID())

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_0")   )
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_11") , "LuaYU_111576_12", 0 ) --�ʰ��j�C��W�h����
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111576_YU_00") , "LuaYU_111576_1", 0 ) --�ʰ��j�C��W�h����
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111576_YU_03") , "LuaYU_111576_3", 0 ) --�ڭn���W
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111576_YU_01") , "LuaYU_111576_2", 0 ) --�I���C�����§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_0")   )
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_16") , "LuaYU_111576_13", 0 ) --�ܨ�
			end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111576_13()

		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_15")   )  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_17") , "LuaYU_111576_14", 0 ) --�e�ڹL�h


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111576_12()

		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_12")   )  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111576_0", 0 ) --�^��W�@��


end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111576_1()

		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_02")   )  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111576_YU_03") , "LuaYU_111576_3", 0 ) --�ڭn���W


end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111576_2()
	local Map01 =  CheckFlag( OwnerID() , 542154 )
	local Map02 =  CheckFlag( OwnerID() , 542155 )
	local Map03 =  CheckFlag( OwnerID() , 542156 )
	local Map04 =  CheckFlag( OwnerID() , 542157 )
	local Map05 =  CheckFlag( OwnerID() , 542158 )
	local Map06 =  CheckFlag( OwnerID() , 542159 )
	local Map07 =  CheckFlag( OwnerID() , 542160 )
	local Map08 =  CheckFlag( OwnerID() , 542161 )

	local BOX =  CheckFlag( OwnerID()  , 542162 ) --�ˬd���W�X��
	local Mapgo =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if Map01 == true and Map02 == true and Map03 == true and Map04 == true and Map05 == true and Map06 == true and Map07 == true and Map08 == true and BOX == false and Mapgo >= 1 then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_04")   )			
				DelBodyItem( OwnerID() ,  203236   , 1 ) --�ʰ��j�C��a��
				GiveBodyItem( OwnerID() ,  203237  , 1 )  --�ʰ��j�C��§��
				SetFlag( OwnerID()  , 542154 , 0 )  --�����X��
				SetFlag( OwnerID()  , 542155 , 0 )  
				SetFlag( OwnerID()  , 542156 , 0 )  
				SetFlag( OwnerID()  , 542157 , 0 )  
				SetFlag( OwnerID()  , 542158 , 0 )  
				SetFlag( OwnerID()  , 542159 , 0 )  
				SetFlag( OwnerID()  , 542160 , 0 )  
				SetFlag( OwnerID()  , 542161 , 0 )  

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end	
		elseif BOX == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_14")   )  --��L�I

		elseif Mapgo == 0 then

			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   )  --��L�I
		else
 
			SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_06")   ) 
		end	

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111576_3()

	local Map =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��
	local Leaderg = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101289, 100 , 1)       --�k�ɹC	
	local Leaderb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101290, 100 , 1)       --�k�ɹC

	if GetSystime(2) > 0 and GetSystime(2) < 10 then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_07") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 ) --�ʰ��j�C��a��
					WriteRoleValue( Leaderb[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_08") ) 
				end

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end
	
	elseif GetSystime(2) > 10 and GetSystime(2) < 20  then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_09") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 ) 
					WriteRoleValue( Leaderb[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_10") ) 
				end

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end
	
	elseif GetSystime(2) > 20 and GetSystime(2) < 30  then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_11") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 ) 
					WriteRoleValue( Leaderb[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_12") ) 
				end
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end

	elseif GetSystime(2) == 30  then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_11") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 ) 
					WriteRoleValue( Leaderb[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_YU_HW_111611_0") ) 
				end
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end

	elseif GetSystime(2) > 30 and GetSystime(2) < 40  then


			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_13") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 ) 
					WriteRoleValue( Leaderg[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_14") ) 
				end

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end
	
	elseif GetSystime(2) > 40 and GetSystime(2) < 50  then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_15") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 )
					WriteRoleValue( Leaderg[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_16") ) 
				end

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end

	elseif GetSystime(2) > 50 and GetSystime(2) < 60 then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_17") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 )
					WriteRoleValue( Leaderg[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_18") ) 
				end

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end

	elseif GetSystime(2) == 0 then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				if Map == 0 then
					SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_17") ) 			
					GiveBodyItem( OwnerID() ,  203236  , 1 )
					WriteRoleValue( Leaderg[0] , EM_RoleValue_PID , 1 )
				else
					SetSpeakDetail( OwnerID(), GetString("SC_YU_HW_111611_0") ) 
				end

			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )
			end


	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111576_14()


	ChangeZone( OwnerID(), 2, 0, 4978.7, 104.4, -2481.1, 85 )
	CloseSpeak( OwnerID() )                     --������ܼҪ�
end