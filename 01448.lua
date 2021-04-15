-------------------------------------------------------------------------------------------------------

--�M�ұ�����

-------------------------------------------------------------------------------------------------------
function NewGuildFactoryForProduct()	--�M�ұ�����
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local ClickObj = ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)
	local TempX

	if GuildCheckTimer == nil then
		GuildCheckTimer = {}
	end
	if GuildCheckTimer[RoomID] == nil then
		GuildCheckTimer[RoomID] = CreateObjbyObj(113693,OwnerID())	--���Ϊ���ӱ��ˬd�Ϊ��@�Ψƥ�
		SetModeEx( GuildCheckTimer[RoomID], EM_SetModeType_HideName, false )
		SetModeEx( GuildCheckTimer[RoomID], EM_SetModeType_Mark, false )
		BeginPlot( GuildCheckTimer[RoomID], "GuildProductBuildingCheck", 0 )  --�Ұʦ@�Ψƥ�
	end

	if (ZoneID == 402) or (ZoneID == 47)  then
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--����
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		AddBuff( OwnerID() , 505921 , 69, -1 )	--70%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--�QNPC�����ˮ`�W�[ �k�N���� 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
		SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_2_02" , 100 )	--���|���Ԯ�
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --���`�@��
	else
		if ClickObj  == 112703 then	--3"0"~3"9"�����ؿv������1~10
			TempX = 30
		elseif ClickObj  == 112704 then
			TempX = 31
		elseif ClickObj  == 112705 then
			TempX = 32
		elseif ClickObj  == 112706 then
			TempX = 33	
		elseif ClickObj  == 112707 then
			TempX = 34		
		elseif ClickObj  == 112708 then
			TempX = 35
		elseif ClickObj  == 112709 then
			TempX = 36
		elseif ClickObj  == 112710 then
			TempX = 37		
		elseif ClickObj  == 112711 then
			TempX = 38	
		elseif ClickObj  == 112712 then
			TempX = 39		
		end
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register10 , TempX ) --TempX �g��1X��ܹA�СA�g��2X��ܥ����A�g��3X��ܧM�Ҽt
		SetPlot( OwnerID() , "touch" , "NewGuildFactoryForProduct1" , 100 )
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildFactoryForProduct1()	---���M�Ҫ�Ĳ�I�ƥ�
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local TempInt = ReadRoleValue( TargetID() , EM_RoleValue_Register10)
	local Count = 0
	
	if PlayerGuildID ~= BuildingGuildID then	--�P�_�O���O�P���|
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
		if GuildFactory[RoomID][2] >= GuildFactory[RoomID][1]  then --[1]�O�W���A[2]�O�ϥΤH��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[GUILD_FACTORY3]", C_SYSTEM ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[GUILD_FACTORY3]", C_SYSTEM ) 

		elseif  GuildFactory[RoomID][2] < GuildFactory[RoomID][1]  then
			local PlayerLV=ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			local Itemget =  CheckFlag( OwnerID()  , 540026 ) --���ѻ���L �M�徹��
			local Tools =  CountBodyItem( OwnerID() , 204832 )  --�M�徹��
			local SS = 0	--�p��һݮɶ�

			--�H�U�����a���ŻP�u�@�Ӯ�
			--��¦360��A�C5�Ŵ��30��sww
			--�p�G���a���ŶW�L51�|�ɭP�p�⵲�G�|�C��60��A�h�����]��60��
			if PlayerLV >= 51 then
				SS = 600
			else
				SS = math.floor(PlayerLV/5)
				SS = (360-(SS*30))*10
			end
			--�ˬd�O�_����C��u�@�u��A���ˬd�u��O�_�ӺɡC
			if Itemget == false then
				GiveBodyItem( OwnerID() ,  204832  , 99 ) --���M�徹��
				SetFlag( OwnerID()  , 540026 , 1 ) -- ���Ѥw����X��
				BeginPlot( OwnerID() , "NewGuildFactoryForProduct1" , 0 )
				return
			end
			if Itemget == TRUE and Tools ~= 0 then
				AddBuff(OwnerID() ,505749,TempInt-30,SS) 
				WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , TempInt)	--��ؿv���� Register �g�쪱�a���W�A�קK���U�ӥ� BeginPlot ���ɭԥX���D
				if BeginCastBarEvent( OwnerID(), OwnerID() , "[GUILD_FACTORY1]", SS, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_NORMAL , 0 , "NewGuildFactoryForProduct2") ~= 1 then
					CancelBuff( OwnerID(),  505749)
				else
					AttachCastMotionTool( OwnerID(), 210339 ); --CastingBarĲ�o���\�A�m���Z��������
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_FACTORY4]" , C_SYSTEM )--�A�w���Ԫ��B�Χ��Ҧ����Ͳ�����A<CB>����</CB>�N��o�s���t�B�C
				ScriptMessage( OwnerID(), OwnerID(), 0, "[GUILD_FACTORY4]" , C_SYSTEM )--�A�w���Ԫ��B�Χ��Ҧ����Ͳ�����A<CB>����</CB>�N��o�s���t�B�C
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildFactoryForProduct2( ObjID, CheckStatus )	--�M�ұ����� ---�nrand�ܦh�ز���
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( OwnerID(), CheckStatus );
			local PlayerID = TargetID()
			local NeedSpace = 1
			local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
			local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
			local Item = {204785,
					204829,
					204830,
					205209,
					205210,
					205211,
					205212,
					205213,
					205214,
					205215}
			--
			local BuildLV = FN_CountBuffLevel(PlayerID,505749)	 --�p�⪱�aBuff���ŨӨM�w�n��������
			BuildLV = BuildLV+1
			--
			if ( NeedSpaceStatus  == true ) then
				GiveBodyItem( PlayerID , Item[BuildLV] , 1 )	 
				DelBodyItem( PlayerID , 204832 , 1 )--��֤@�ӧM�徹��
				ScriptMessage( PlayerID, PlayerID, 1, "[GUILD_FACTORY2]" , C_SYSTEM ) --�g�L�F�u�{���㪺��ߤκ�ҭ�ƪ��L�{�A�A�o��F�������q���C
				CancelBuff( PlayerID,  505749)
				GuildFactory[RoomID][2] = GuildFactory[RoomID][2] - 1
				BeginPlot( PlayerID , "NewGuildFactoryForProduct1" , 0 )
			else
				ScriptMessage( PlayerID, PlayerID, 1, "[SC_DAN_111700_22]" , C_SYSTEM )
			end
		else
			-- ����
			WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , 0)
			CancelBuff( OwnerID(),  505749)
			EndCastBar( OwnerID(), CheckStatus )
		end
	end


end