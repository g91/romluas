function Lua_Hao_thanksday_Crowd_01()   -- �U�����b�k�����\
		SetPlot( OwnerID() , "touch" , "Lua_Hao_thanksday_Crowd_02" , 50 );
	end	
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Crowd_02()

	local Buff = { 505026 , 505027 , 505028 , 505029 } 	 	-- ��j�N�B�Y�p�N�B�M���[�t�B���B���{
	local key = { 544561, 544562, 544563, 544564 } 		-- ���ιL�U�ح����o�쪺key

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+1) ==1 then			-- ����Ƽƪ��a��P�ɶ}�ҡA����o�쪺���D�C 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		-- ���L���A�еy�ԦA�աC
		return										--
	end											--

	for i = 1 , 4 , 1 do
		if CheckBuff ( OwnerID() , Buff[i] ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_THANKSGIVING_17]" , C_SYSTEM )  -- �{�b�٤��j
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_THANKSGIVING_17]" , C_SYSTEM )  -- �{�b�٤��j
--			say ( OwnerID() , "[SC_THANKSGIVING_17]" )
			return
		end
	end

--	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )	

		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 1 ) 
	
		if BeginCastBar( OwnerID(), "[SC_THANKSGIVING_18]", 30 , ruFUSION_ACTORSTATE_EMOTE_EAT , ruFUSION_ACTORSTATE_EMOTE_EAT , 0 ) == 1 then	
			--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
			
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
			
					if CheckID( TargetID() ) == true then
	
						local RANDOWN = rand(100)
							if RANDOWN <= 30  then
								AddBuff( OwnerID() , Buff[1] , 1 , 3600 )
								if Checkflag(OwnerID(), key[1] ) == false then
									Setflag( OwnerID(), key[1] , 1 )
								end
							elseif  RANDOWN <=60  and RANDOWN > 30 then
								AddBuff( OwnerID() , Buff[2] , 1 , 3600 )
								if Checkflag(OwnerID(), key[2] ) == false then
									Setflag( OwnerID(), key[2] , 1 )
								end
							elseif  RANDOWN <=80  and RANDOWN > 60 then
								AddBuff( OwnerID() , Buff[3] , 1 , 3600 )
								if Checkflag(OwnerID(), key[3] ) == false then
									Setflag( OwnerID(), key[3] , 1 )
								end
							elseif  RANDOWN <=100  and RANDOWN > 80 then
								AddBuff( OwnerID() , Buff[4] , 1 , 3600 )
								if Checkflag(OwnerID(), key[4] ) == false then
									Setflag( OwnerID(), key[4] , 1 )
								end
							end
							if CountBodyItem(OwnerID(), 530631 ) == 0 then  --��S���ٸ�
								if Checkflag(OwnerID(), key[1] ) == true and Checkflag(OwnerID(), key[2] ) == true and Checkflag(OwnerID(), key[3] ) == true and Checkflag(OwnerID(), key[4] ) == true then
									GiveBodyItem(OwnerID(), 530631, 1)
									GiveBodyItem(OwnerID(), 206266, 5 )
									Setflag(OwnerID(),  544561 , 0)
									Setflag(OwnerID(),  544562 , 0)
									Setflag(OwnerID(),  544563 , 0)
									Setflag(OwnerID(),  544564 , 0)
								end
							end
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY ) ;

							sleep(30)
							WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 
					end

				elseif ( result == "DAME" ) then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 	-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY ) ;

					SetPlot( TargetID(),"touch","Lua_Hao_thanksday_Crowd_02",50 )
				end
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Item() -- �ϥ��b�k�j�\

--	ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_THANKSGIVING_24]", C_SYSTEM )		-- ���q�O�ݻŪ�
--	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_THANKSGIVING_24]", C_SYSTEM )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 113706, BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	AddBuff( NPC , 504665 , 1 , 15 )
	BeginPlot ( NPC , "Lua_Hao_thanksday_DelItem" , 0 )
	sleep(10)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_DelItem() -- �屼�b�k�j�\
	Sleep(1800)
	DelObj ( OwnerID() )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_01()   -- ���a�ϥΦ����ƪ��b�k�j�\
		SetPlot( OwnerID() , "touch" , "Lua_Hao_thanksday_02" , 50 );
	end	
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_02()

	local Buff = { 505055 , 505057 , 505058 } 		-- �ͩR�u�@�B�]�O�u�@�B�����u�@
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )

--	Say(  TargetID() ,"PID="..PID)

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+1) ==1 then			-- ����Ƽƪ��a��P�ɶ}�ҡA����o�쪺���D�C 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		-- ���L���A�еy�ԦA�աC
		return										--
	end											--	

		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 1 ) 
	
		if BeginCastBar( OwnerID(), "[SC_THANKSGIVING_18]", 20 , ruFUSION_ACTORSTATE_EMOTE_EAT , ruFUSION_ACTORSTATE_NORMAL , 0 ) == 1 then	

			--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
			
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
			
					if CheckID( TargetID() ) == true then
	
						local RANDOWN = rand(100)
							if RANDOWN <= 35  then
								AddBuff( OwnerID() , Buff[1] , 1 , 3600 )
							elseif  RANDOWN <=70  and RANDOWN > 35 then
								AddBuff( OwnerID() , Buff[2] , 1 , 3600 )
							elseif  RANDOWN <=100  and RANDOWN > 70 then
								AddBuff( OwnerID() , Buff[3] , 1 , 3600 )
							end			
						PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY ) ;
						WriteRoleValue( TargetID() , EM_RoleValue_PID, PID+1 )	
						if PID == 9 then
							DelObj ( TargetID() )
						else
							WriteRoleValue( TargetID() , EM_RoleValue_PID, PID+1 )	
							sleep(20)
							WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 
						end
					end
			
				elseif ( result == "DAME" ) then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 	-- ����Ƽƪ��a��P�ɶ}�ҡA����o�쪺���D�C
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY ) ;
					SetPlot( TargetID(),"touch","Lua_Hao_thanksday_02",50 )
				end
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Action() --��ܵ���

	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_APPROVAL ) 
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_03]"   )  -- �A�n�A�_�I��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_04]" , "Lua_Hao_thanksday_about1", 0 ) --�ڷQ���D���@�`���ѨӡC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_05]" , "Lua_Hao_thanksday_about3", 0 ) -- ����³��x��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_06]" , "Lua_Hao_thanksday_about4", 0 ) -- �����b�k�j�\
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_07]" , "Lua_Hao_thanksday_about5", 0 ) -- �`���׮۸�
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_08]" , "Lua_Hao_thanksday_about6", 0 ) -- �ڷQ�I��[���y���~]

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_2010_NPC04]" , "Lua_mika_thankday_npc03", 0 ) --�ڷQ�I��[208292]  --���@�`���m��
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about1() -- �ڷQ���D���@�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_01]"   )  --���e����01
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_20]" , "Lua_Hao_thanksday_about2", 0 ) -- �Ѫ��A�o�ͤF����Ʊ�
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about2() -- �ڷQ���D���@�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_02]"   )  --���e����02
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_21]" , "Lua_Hao_thanksday_about2_1", 0 ) -- ���U�өO�H
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about2_1() -- �ڷQ���D���@�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_02_2]"   )  --���e����02
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about3() -- ����³��x��
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_11]"   )  --���[ZONE_VARANAS]�������f����[113765]���b�x�H�����A�p�G�A�@�N��U�L...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about4() -- �����b�k�j�\
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_12]"   )  --�C�~��F�o�өu�`�A�U�a�������F�w�y���@�`����ӡA���|�\�񭻮�|�����N�b�k�j�\�P�ӳX���ȤH�@�P���ɡA���~...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about5() -- ����`��[206265]
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_13]"   )  --�ڥ��b�`��[206265]�A�u���f�t�o�دS���ƪ��N�b�k�A�~�ٱo�W�O�̬������Ʋz�A��A�`����10�Ӥ���A�Х浹��...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_15]" , "Lua_Hao_thanksday_about5_1", 0 ) -- ��I10�Ӧ׮۸�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_22]" , "Lua_Hao_thanksday_about5_2", 0 ) -- �ڸӦp����o�׮۸�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about5_2() -- �ڸӦp����o�׮۸�
	SetSpeakDetail( OwnerID()  , "[SC_THANKSGIVING_23]" ) -- �u�n���ѻP�A���D¾���Ŭ۪񪺩Ǫ��A�N�����|�b�B������o�׮۸��C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about5_1() -- ����`��[206265]

	local today= CheckFlag(OwnerID()  , 543288) -- ���Ѱѥ[�L
	local item = CountBodyItem(OwnerID() , 206265 ) -- �׮۸�

	if today == true then
		SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_16]"   )  --�A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
	else
		if item >= 10 then
			DelBodyItem( OwnerID() , 206265 , 10 ) -- �׮۸�
			GiveBodyItem( OwnerID() , 206266 , 1 ) -- �P���`���ʰѥ[����
			GiveBodyItem( OwnerID() , 206248 , 3 ) -- ���~�G�b�k�j�\
			SetFlag( OwnerID() , 543288 , 1 )
			SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_09]"   )  --���\�I����
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
		else
			SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   )  --�A�ҫ������~�ƶq����
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h	
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about6() -- �ڷQ�I��[206309]�M[240747]
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_14]"   )  -- �I��<CB>[206309]</CB>�M<CB>[240747]</CB>�����n20�i<CB>[206266]</CB>�A�T�w�n�I���ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111284_6]" , "Lua_Hao_thanksday_about6_1", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about6_1() -- �ڷQ�I��206309 ���@����§�� �M 240747

	local item = CountBodyItem(OwnerID() , 206266 ) -- �P���`���ʰѥ[����
	if item >= 15 then
		DelBodyItem( OwnerID() , 206266 , 15 ) -- �P���`���ʰѥ[����
		GiveBodyItem( OwnerID() , 242093 , 1 ) -- ���ֺ���§��
		GiveBodyItem( OwnerID() , 240747 , 1 ) -- ��������
		SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_10]"   )  --���\�I����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   )  -- �A�ҫ������~�ƶq����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --�^��W�@�h
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_206308( Option ) --��o�Ʋz�a��§��
	local PlayerID = OwnerID()
	local PackageID = 2063080		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724883 	-- ������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_206309( Option ) --���@����§��
	local PlayerID = OwnerID()
	local PackageID = 2063090		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724884 	-- ������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , 241480 , 15 ) -- 2012�s�W�`������
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_thanksday_Reset()
	SetFlag( OwnerID() , 543288 , 0 )
	SetFlag( OwnerID() , 543463 , 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Msg( Option )
	if ( Option == "CHECK" ) then

	ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_THANKSGIVING_24]", C_SYSTEM )		-- ���q�O�ݻŪ�
	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_THANKSGIVING_24]", C_SYSTEM )

	elseif ( Option == "USE" ) then

	ScriptMessage( OwnerID(), OwnerID(), 1 , "123", C_SYSTEM )

	end
end