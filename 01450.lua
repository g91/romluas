-------------------------------------------------------------------------------------------------------

--��챾����

-------------------------------------------------------------------------------------------------------
function NewGuildLumberForProduct()	--��챾����
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

	if (ZoneID == 402) or (ZoneID >= 900 )  then
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
		if ClickObj  == 113141 then	--2"0"~2"9"�����ؿv������1~10
			TempX = 20
		elseif ClickObj  == 113142 then
			TempX = 21
		elseif ClickObj  == 113143 then
			TempX = 22
		elseif ClickObj  == 113144 then
			TempX = 23	
		elseif ClickObj  == 113145 then
			TempX = 24		
		elseif ClickObj  == 113146 then
			TempX = 25
		elseif ClickObj  == 113147 then
			TempX = 26
		elseif ClickObj  == 113148 then
			TempX = 27		
		elseif ClickObj  == 113149 then
			TempX = 28	
		elseif ClickObj  == 113150 then
			TempX = 29		
		end
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register10 , TempX ) --TempX �g��1X��ܹA�СA�g��2X��ܥ����A�g��3X��ܧM�Ҽt
		SetPlot( OwnerID() , "touch" , "NewGuildLumberForProduct1" , 100 )
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildLumberForProduct1()	---����쪺Ĳ�I�ƥ�
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local TempInt = ReadRoleValue( TargetID() , EM_RoleValue_Register10)
	local Count = 0
	
	if PlayerGuildID ~= BuildingGuildID then	--�P�_�O���O�P���|
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
		if GuildLumber[RoomID][2] >= GuildLumber[RoomID][1]  then --[1]�O�W���A[2]�O�ϥΤH��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[GUILD_WOODFACTORY3]", C_SYSTEM ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[GUILD_WOODFACTORY3]", C_SYSTEM ) 

		elseif  GuildLumber[RoomID][2] < GuildLumber[RoomID][1]  then
			local PlayerLV=ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			local Itemget =  CheckFlag( OwnerID()  , 540027 ) --���ѻ���L ��쾹��
			local Tools =  CountBodyItem( OwnerID() , 204833 )  --��쾹��
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
				GiveBodyItem( OwnerID() ,  204833  , 99 ) --�����u��
				SetFlag( OwnerID()  , 540027 , 1 ) -- ���Ѥw����X��
				BeginPlot( OwnerID() , "NewGuildLumberForProduct1" , 0 )
				return
			end
			if Itemget == TRUE and Tools ~= 0 then
				AddBuff(OwnerID() ,505750,TempInt-20,SS) 
				WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , TempInt)	--��ؿv���� Register �g�쪱�a���W�A�קK���U�ӥ� BeginPlot ���ɭԥX���D
				if BeginCastBarEvent( OwnerID(), OwnerID() , "[GUILD_WOODFACTORY2]", SS, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END , 0 , "NewGuildLumberForProduct2") ~= 1 then
					CancelBuff( OwnerID(),  505750)
				else
					AttachCastMotionTool( OwnerID(), 210363 ); --CastingBarĲ�o���\�A�m���Z��������
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_FACTORY4]" , C_SYSTEM )--�A�w���Ԫ��B�Χ��Ҧ����Ͳ�����A<CB>����</CB>�N��o�s���t�B�C
				ScriptMessage( OwnerID(), OwnerID(), 0, "[GUILD_FACTORY4]" , C_SYSTEM )--�A�w���Ԫ��B�Χ��Ҧ����Ͳ�����A<CB>����</CB>�N��o�s���t�B�C
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildLumberForProduct2( ObjID, CheckStatus )	--��챾���� ---�nrand�ܦh�ز���
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( OwnerID(), CheckStatus );
			local PlayerID = TargetID()
			local NeedSpace = 1
			local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
			local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
			local Item = {205223,
				         205224,
				         205225,
				         205226,
				         205227,
				         205228,
				         205229,
				         205230,
				         205231,
				         205232}
			--
			local BuildLV = FN_CountBuffLevel(PlayerID,505750)	 --�p�⪱�aBuff���ŨӨM�w�n��������
			BuildLV = BuildLV+1
			--
			if ( NeedSpaceStatus  == true ) then
				GiveBodyItem( PlayerID , Item[BuildLV] , 1 )	 
				DelBodyItem( PlayerID , 204833 , 1 )--��֤@�ӥ��u��
				ScriptMessage( PlayerID, PlayerID, 1, "[GUILD_WOODFACTORY1]" , C_SYSTEM )--�g�L�F�u�{���㪺��ߤκ�ҭ�ƪ��L�{�A�A��o�F�u�{������q���C
				CancelBuff( PlayerID,  505750)
				GuildLumber[RoomID][2] = GuildLumber[RoomID][2] - 1
				BeginPlot( PlayerID , "NewGuildLumberForProduct1" , 0 )
			else
				ScriptMessage( PlayerID, PlayerID, 1, "[SC_DAN_111700_22]" , C_SYSTEM )
			end
		else
			-- ����
			WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , 0)
			CancelBuff( OwnerID(),  505750)
			EndCastBar( OwnerID(), CheckStatus )
		end
	end


end