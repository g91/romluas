function Lua_Hao_SONGKRAN_000( Option ) -- ����e�T�{

	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
			--	local BuffType = 0
			--	local Count = BuffCount ( TargetID())
			--	for i = 0 , Count do
			--		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
			--		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			--			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			--			break
			--		end
			--	end
			--	if BuffType == 68 then				       	    --/*���M�����A
			--		ScriptMessage(OwnerID() , OwnerID() , 1 , "[SC_MOUNT_CAN_NOT_BE_USED]" , 0 )  --�A�L�k�b�M�����A�U�ϥθӪ��~�C
			--		return false
			--	else
					if CheckBuff( TargetID() , 506326 ) == true then  -- ������`���֪����A�U
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--
						return false
					else
						return true
					end
			--	end
			else	--�Y��H���O�ۤv
				if CheckBuff( TargetID() , 506326 ) == true then  -- ������`���֪����A�U
					if GetDistance( OwnerID(), TargetID() )  <= 100 then
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--
						return false
--					elseif GetDistance( OwnerID(), TargetID() )  > 100 then
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_GAMEMSGEVENT_101]" , 0 )	--�I�k�Z���L���C
--						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SYS_GAMEMSGEVENT_101]" , 0 )	--
						return false
					end
				else
					return true
				end
			end
		else -- ���H�D���a�A�Ӭ�NPC�������
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ONLY_FOR_PLAYER]" , C_SYSTEM )	--�����~�u��缾�a�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ONLY_FOR_PLAYER]"  , C_SYSTEM )	--�����~�u��缾�a�ϥΡC
			return false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_001() -- �[����`�n

--	Say( TargetID() , "1" )	-- ����
--	Say( OwnerID() , "2" )	-- ����
	AddBuff( OwnerID() , 506324 , 0 , -1 )
--	SetPlot( OwnerID() , "touch" , "Lua_Hao_SONGKRAN_002" , 50 )
end	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_Hao_SONGKRAN_002() -- �Ķ��[����
--
----	Say( TargetID() , "3" )	-- ����
----	Say( OwnerID() , "4" )	-- ���a
--
----	SetPlot( TargetID() , "touch" , " " , 50 )
--
--	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 			--����Ƽƪ��a��P�ɺK���ᦷ�C
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0)	--���L���A�еy�ԦA�աC
--		return									--
--	end										--
--	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )				--
--
--	if BeginCastBar( OwnerID() , "[SC_THAILAND_SONGKRAN_002]" , 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	
--	--/*�}�l�I�k�A�ϥΪ� , �ɶ����W����r , �i��ɶ� , �_�l�ʧ@ , �����ʧ@ , ���_���� ( 0�����ʤ��_ )		[SC_THAILAND_SONGKRAN_002] �K���ᦷ
--
--		while true do
--		sleep( 2 )
--			local CastBarStatus = CheckCastBar( OwnerID() )
--			if ( CastBarStatus ~= 0 ) then 
--				if ( CastBarStatus > 0) then -- ���\
--					result = "OKOK"
--					EndCastBar( OwnerID() , CastBarStatus )
--					break
--				elseif ( CastBarStatus < 0 ) then -- ����
--					result = "DAME"
--					EndCastBar( OwnerID() , CastBarStatus )
--					break
--				end
--			end
--		end
--
--		if ( result == "OKOK" ) then
--
--			if CheckID( TargetID() ) == true then
--				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
--
----					GiveBodyItem( OwnerID() , 207085 , 1 )
----					SetModeEx( TargetID() , EM_SetModeType_Mark , false )--�аO
----					CancelBuff( TargetID() , 506324 )
----					SetModeEx( TargetID() , EM_SetModeType_Show, false )--���
----					sleep(0)
----					SetModeEx( TargetID() , EM_SetModeType_Mark , true )--�аO
----					SetModeEx( TargetID() , EM_SetModeType_Show,  true )--���
----					AddBuff( TargetID() , 506324 , 0 , -1 )
--					WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
--				else
--					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
--					WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
----					SetPlot( TargetID() , "touch" , "Lua_Hao_SONGKRAN_002" , 50 )
--				end	
--			end
--
--		elseif ( result == "DAME" ) then
--			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )	-- ����Ƽƪ��a��P���I�������D
----			SetPlot( TargetID() , "touch" , "Lua_Hao_SONGKRAN_002" , 50 )
--		end
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003() -- �IĲ����NPC��A�۰���V

--	Say( TargetID() , "1" )	-- ���a
--	Say( OwnerID() , "2" )	-- NPC

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 112 )
	LoadQuestOption( OwnerID() )  --���J���ȼҪO

--	SetSpeakDetail( OwnerID() , "[SC_GERMANY_1YEAR_00]" ) -- �A�Q�F�ѧ�h����g�~�y���Ʊ��ܡH
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_THAILAND_SONGKRAN_004]" ,  "Lua_Hao_SONGKRAN_003_3" ,  0 ) ; --  ����O����`�C
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_THAILAND_SONGKRAN_006]" ,  "Lua_Hao_SONGKRAN_003_4" ,  0 ) ; --  �ڸӥh����M[206618]�H
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_THAILAND_SONGKRAN_008]" ,  "Lua_Hao_SONGKRAN_003_5" ,  0 ) ; --  [207084]�٦��t�~���γB�ܡH
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_1() -- �������ȫ�A�A���檺Script�C

--	Say( TargetID() , "1" )	-- ���a
--	Say( OwnerID() , "2" )	-- NPC

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 106 )
	Sleep(20)
	PlayMotion( OwnerID() , 254 )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_2() -- �������ȫ�A�A���檺Script�C

--	Say( TargetID() , "3" )	-- ���a
--	Say( OwnerID() , "4" )	-- NPC

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 102 )
	Sleep(20)
	PlayMotion( OwnerID() , 251 )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_3() -- ����O����`

	PlayMotion( TargetID() , 106 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_005]" ) 
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --�^��W�@��
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_4() -- �ڸӥh����M[206618]�H

	PlayMotion( TargetID() , 106 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_007]" ) 
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --�^��W�@��
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_5() -- [207084]�٦��t�~���γB�ܡH

	PlayMotion( TargetID() , 106 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_009]" ) -- [207084]��b�O�Ѥ����D�A���F���I��L�H���ݨD�A�`�y���ʴ����A�u�n�A��5��[207084]���ڡA�ڴN��[207084]��A�洫�ڡC
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_BEERDAY_29]" ,  "Lua_Hao_SONGKRAN_003_6" ,  0 ) ; -- �ڷQ�I���C
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --�^��W�@��
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_6() -- �n���A�ڷQ�I���C

	if CountBodyItem( OwnerID() , 207084 ) >= 5 then
		GiveBodyItem( OwnerID() , 203675 , 1 )
		DelBodyItem( OwnerID() , 207084 , 5 )
		CloseSpeak( OwnerID() )
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 251 )
	else
		SetSpeakDetail( OwnerID() , " [SC_112311_6]" ) -- �z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --�^��W�@��
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 107 )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_004() -- ����ĪG

	local You = GetName( OwnerID() )
--	PlayMotion( OwnerID() , 115 )

	if ( TargetID() ~= OwnerID() ) then
		PlayMotion( TargetID() , 115 )
	else
		PlayMotion( TargetID() , 103 )
	end
	AddBuff( TargetID() , 506324 , 0 , 30 )

	if ( TargetID() ~= OwnerID() )   then   --�Y��H���O�ۤv
		ScriptMessage( OwnerID() , TargetID() , 0 , You.."[SC_THAILAND_SONGKRAN_001]" , C_SYSTEM )	-- xxx ��A����A�A�Pı��@�ѺZ�֪��M�D�P�C
		ScriptMessage( OwnerID() , TargetID() , 1 , You.."[SC_THAILAND_SONGKRAN_001]" , C_SYSTEM )	-- xxx ��A����A�A�Pı��@�ѺZ�֪��M�D�P�C
	end
end
