-- �s���ٸ����� ���~�ϥμ@��

-----���ʥ��Ȭ������~-------------------------------------------

function Lua_mika_240618( Option )      -- ���_�C���S��D��_�����m�����b

	local PlayerID = OwnerID()
	local PackageID = 203029		-- �N �d��50����  �ʦL(�����ý�) �ഫ�� �ʦL(��������)
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     

	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�
			return false
		elseif tree[0] == -1 then	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			return false
		elseif CheckBuff( OwnerID() , 502864 ) == true then --�w�����A(�]�\�i��о�)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK

		--------------------------------------------------------------------------------------
			-- 2011.08.12  ����-NPC  �ϥΧũG���b(�����m��) 106274
				local npcid = 106274
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
		--------------------------------------------------------------------------------------

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--		local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     

		if tree[0] ~= -1 then
			SetPlot( tree[0]  ,"touch",  "" , 0 ) 
			AddBuff( OwnerID() ,503991 ,1 , 3 ); --���K���S��

			local OwnerX = ReadRoleValue( tree[0] , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( tree[0] , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( tree[0] , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( tree[0] , EM_RoleValue_Dir ) 

			local NewfloorX = CreateObj( 113109 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

			SetModeEx( NewfloorX , EM_SetModeType_Strikback, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--�аO
			SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--�W��
			SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--����

			Hide(NewfloorX)
			Show( NewfloorX,RoomID)		
			AddToPartition( NewfloorX , RoomID )  
			Delobj( tree[0]  )		
		end
	end
end




-----�t�Υ��Ȭ������~-------------------------------------------


-- ����-���_
function lua_mika_240199_check()
	local voc = ReadRoleValue(OwnerID(), EM_RoleValue_VOC ) -- �ۤv�D¾
	local voc_target = ReadRoleValue(TargetID(), EM_RoleValue_VOC ) -- ���D¾
	
	if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		if voc == voc_target then
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(), 1,"[SC_424142_1]", 0)	-- �ϥΥؼп��~�I
			ScriptMessage( OwnerID(),OwnerID(), 0,"[SC_424142_1]", 0)	-- �ϥΥؼп��~�I
			return false
		end
	end

end

function lua_mika_240199_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_08][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM) 	-- �A�w�b[$VAR1]���W���n�j���C
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_09][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM)	-- [$VAR1]�w�b�A���W���n�j���C

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY )
	DW_QietKillOne(OwnerID(), 106252 )
end
-------------------------------
--����-�q§ 
function lua_mika_240200_check()
	local sex = ReadRoleValue(OwnerID(), EM_RoleValue_SEX ) -- �ۤv�ʧO
	local sex_target = ReadRoleValue(TargetID(), EM_RoleValue_SEX ) -- ���ʧO

	if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		if sex ~= sex_target then 
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(), 1,"[SC_424142_1]", 0)	-- �ϥΥؼп��~�I
			ScriptMessage( OwnerID(),OwnerID(), 0,"[SC_424142_1]", 0)	-- �ϥΥؼп��~�I
			return false
		end
	end
end

function lua_mika_240200_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_10][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM )	-- �A��[$VAR1]��§���a��F§�C
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_11][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM )	-- [$VAR1]��A��§���a��F§�C

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	DW_QietKillOne(OwnerID(), 106253 )

end

-------------------------------
--����-�����y 
function lua_mika_240201_check()
	local Race = ReadRoleValue(OwnerID(), EM_RoleValue_RACE ) -- �ۤv�ر�
	local Race_target = ReadRoleValue(TargetID(), EM_RoleValue_RACE ) -- ���ر�

	if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		if Race == Race_target then
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(), 1,"[SC_424142_1]", 0)	-- �ϥΥؼп��~�I
			ScriptMessage( OwnerID(),OwnerID(), 0,"[SC_424142_1]", 0)	-- �ϥΥؼп��~�I
			return false
		end
	end
end

function lua_mika_240201_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_14][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM )
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_15][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM )

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CUTE1 )
	DW_QietKillOne(OwnerID(), 106254 )
end
-------------------------------
--����-���R 
function lua_mika_240202_check()

	if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		return true
	end
end


function lua_mika_240202_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_12][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM )
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_13][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM )

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_TAPDANCE )
	DW_QietKillOne(OwnerID(), 106255 )
end

-------------------------------
-- ���ի��O
function lua_mika_killone(npcid)
	DW_QietKillOne(OwnerID(), npcid )
	say(OwnerID(), "kill id = "..npcid )
end

function lua_mika_playmotion(motionid)
	PlayMotion(OwnerID(), motionid )
end
---------------------------------------------------------------------------
function Lua_ying_240044_check()

	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X ) --���aX�b
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) --���aY�b
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) --���aZ�b
--	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) -- RoomID
	local Key = { 545690 , 545710 , 545711 , 545712 , 545713 , 545714 , 545715 , 545716 , 545717 , 545718, 547728, 547729 }
	local Area = { 462 , 57 , 153 , 530 , 203 , 254 , 111 , 569 , 765 , 824, 233, 313 }
	local Item = { 240191 , 240193 , 240194 , 240195 , 240196 , 240197 , 240198 , 240619 , 240620 , 240621, 242416, 242417 }

	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	for i = 1 , #Key  do 
		if CheckFlag( OwnerID() , key[i] ) == true then
		--	DebugMsg( OwnerID() , 0 , " Key = "..Key[i].." Area = "..Area[i] )
		--	if CheckMapID( X , Y , Z , Area[i] ) == true then
			if  DW_CheckMap(OwnerID(), Area[i] ) then
				if CountBodyItem( OwnerID() , Item[i] ) < 3 then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_18]" , 0 ) --�A�w�����F���������ۡI
					return false
				end
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_17]" , 0 )--�D���T�ϰ� --���ɦa�I�����T�I
				return false
			end	
		end
	end
end
----------�ϥ��ˬdLUA-�k�N���X-----------------------------------------------------------------------------------------------------------------------
function Lua_ying_498397_motion()
	local OID = OwnerID()
	local Type = GameObjInfo_Int( 498397, "ColdownType" ) -- ��o�Ӫk�N���N�o���O(�k�N���X-�I�k�N�o������)

	if ReadRoleValue( OID, EM_RoleValue_Coldown_Item+Type ) == 0 then
		AttachCastMotionTool(  OID, 210327 ) --�m���Z�����Q�r��
		CallPlot( OID, "PlayMotion" , OID, ruFUSION_ACTORSTATE_MINING_BEGIN ) --���q�ʧ@
		CallPlot( OID , "Lua_ying_mining_motion", 0 )
		return true
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_mining_motion()
	local OID = OwnerID()
	
	for i = 1 , 6 do
		if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0  then
			AttachCastMotionTool( OID , 212076 )  --�m���Z�����Ť�
			PlayMotion( OID, ruFUSION_ACTORSTATE_MINING_END ) --���q�ʧ@����
			break
		end
		sleep(5)
	end
end
----------�ϥΪ��~-���ɥΤQ�r��-------------------------------------------------------------------------------------------------------------------------
function Lua_ying_240044_use()

	local Key = { 545690 , 545710 , 545711 , 545712 , 545713 , 545714 , 545715 , 545716 , 545717 , 545718, 547728, 547729 }
	local Item = { 240191 , 240193 , 240194 , 240195 , 240196 , 240197 , 240198 , 240619 , 240620 , 240621, 242416, 242417 }

	AttachCastMotionTool( OwnerID() , 212076 )  --�m���Z�����Ť�
	CallPlot( OwnerID() , "PlayMotion" , OwnerID() , ruFUSION_ACTORSTATE_MINING_END ) --���q�ʧ@����

	for i = 1 , table.getn(Key) , 1 do --1 , 10 , 1 do
		if CheckFlag( OwnerID() , key[i] ) == true then
			if Rand(100) < 30 then
				GiveBodyItem( OwnerID() , Item[i] , 1 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_19][$SETVAR1=".."["..Item[i] .."]".."]" , C_SYSTEM ) --�A���\������FXX���ۡI
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_20]" , C_SYSTEM ) --�A�b���B�i��F���ɡA���@�L����K
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------

function Lua_mika_240044_test()
	local mapid = { 
			201, 221, 222, 223, 224,
			225, 226, 231, 232, 233,
			235, 241, 242, 243, 244, 
			245, 246 
			}
		
	for i = 1, #mapid do	
		DebugMsg( OwnerID() , 0 , "map  -"..i )
		if  DW_CheckMap(OwnerID(), mapid[i] ) then
			DebugMsg( OwnerID() , 0 , "map  -"..i.."  = "..mapid[i] )
		end
	end

end