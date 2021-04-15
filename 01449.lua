-------------------------------------------------------------------------------------------------------

--�A��������

-------------------------------------------------------------------------------------------------------
function NewGuildFarmForProduct()	--�A��������
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
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_2_02" , 100 )	--���|���Ԯ�		
		SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --���`�@��
	else
		if ClickObj  == 112810 then	--1"0"~1"9"�����ؿv������1~10
			TempX = 10
		elseif ClickObj  == 112811 then
			TempX = 11
		elseif ClickObj  == 112812 then
			TempX = 12
		elseif ClickObj  == 112813 then
			TempX = 13	
		elseif ClickObj  == 112814 then
			TempX = 14		
		elseif ClickObj  == 112815 then
			TempX = 15
		elseif ClickObj  == 112816 then
			TempX = 16
		elseif ClickObj  == 112817 then
			TempX = 17		
		elseif ClickObj  == 112818 then
			TempX = 18	
		elseif ClickObj  == 112819 then
			TempX = 19		
		end
		SetPlot( OwnerID() , "touch" , "NewGuildFarmForProduct1" , 100 )		
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register10 , TempX ) --TempX �g��1X��ܹA�СA�g��2X��ܥ����A�g��3X��ܧM�Ҽt
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildFarmForProduct1()	---���A����Ĳ�I�ƥ�
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local TempInt = ReadRoleValue( TargetID() , EM_RoleValue_Register10)
	local Count = 0
	
	if PlayerGuildID ~= BuildingGuildID then	--�P�_�O���O�P���|
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
		if GuildFarmer[RoomID][2] >= GuildFarmer[RoomID][1]  then --[1]�O�W���A[2]�O�ϥΤH��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[GUILD_FARM3]", C_SYSTEM ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[GUILD_FARM3]", C_SYSTEM ) 

		elseif  GuildFarmer[RoomID][2] < GuildFarmer[RoomID][1]  then
			local PlayerLV=ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			local Itemget =  CheckFlag( OwnerID()  , 540025 ) --���ѻ���L �A�Ѥu��
			local Tools =  CountBodyItem( OwnerID() , 204831 )  --�A�Ѿ���
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
				GiveBodyItem( OwnerID() ,  204831  , 99 ) --���A�Ѿ���
				SetFlag( OwnerID()  , 540025 , 1 ) -- ���Ѥw����X��
				BeginPlot( OwnerID() , "NewGuildFarmForProduct1" , 0 )
				return
			end
			if Itemget == TRUE and Tools ~= 0 then
				AddBuff(OwnerID() ,502308,TempInt-10,SS) 
				WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , TempInt)	--��ؿv���� Register �g�쪱�a���W�A�קK���U�ӥ� BeginPlot ���ɭԥX���D
				if BeginCastBarEvent( OwnerID(), OwnerID() , "[GUILD_FARM1]", SS, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END , 0 , "NewGuildFarmForProduct2") ~= 1 then
					CancelBuff( OwnerID(),  502308)
				else
					AttachCastMotionTool( OwnerID(), 210508 ); --CastingBarĲ�o���\�A�m���Z��������
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_FACTORY4]" , C_SYSTEM )--�A�w���Ԫ��B�Χ��Ҧ����Ͳ�����A<CB>����</CB>�N��o�s���t�B�C
				ScriptMessage( OwnerID(), OwnerID(), 0, "[GUILD_FACTORY4]" , C_SYSTEM )--�A�w���Ԫ��B�Χ��Ҧ����Ͳ�����A<CB>����</CB>�N��o�s���t�B�C
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildFarmForProduct2( ObjID, CheckStatus )	--�A�������� ---�nrand�ܦh�ز���
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( OwnerID(), CheckStatus );
			local PlayerID = TargetID()
			local NeedSpace = 1
			local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
			local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
			local Item = {204784,
				         204827,
				         204828,
				         205216,
				         205217,
				         205218,
				         205219,
				         205220,
				         205221,
				         205222}
			--
			local BuildLV = FN_CountBuffLevel(PlayerID,502308)	 --�p�⪱�aBuff���ŨӨM�w�n��������
			BuildLV = BuildLV+1
			--
			if ( NeedSpaceStatus  == true ) then
				GiveBodyItem( PlayerID , Item[BuildLV] , 1 )	 
				DelBodyItem( PlayerID , 204831 , 1 )--��֤@�ӹA�Ѥu��
				ScriptMessage( PlayerID, PlayerID, 1, "[GUILD_FARM2]" , C_SYSTEM )--�g�L�F���Ԧa�ѺءA�A��o�F�į�C
				CancelBuff( PlayerID,  502308)
				GuildFarmer[RoomID][2] = GuildFarmer[RoomID][2] - 1
				BeginPlot( PlayerID , "NewGuildFarmForProduct1" , 0 )
			else
				ScriptMessage( PlayerID, PlayerID, 1, "[SC_DAN_111700_22]" , C_SYSTEM )
			end
		else
			-- ����
			WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , 0)
			CancelBuff( OwnerID(),  502308)
			EndCastBar( OwnerID(), CheckStatus )
		end
	end


end