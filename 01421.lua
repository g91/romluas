Function Lua_Hao_GoblinOpenDoor()

	-- 2013.07.31 ���E�G�ץ����a������L�q�|����n�I�W�C�魫�m�ɶ��ɡA����L�k�}���_�c�P�����L�����ܪ����D�C
	local Open =  CheckFlag( OwnerID() , 542689 )--�ˬd�D�Ը��
	--
	if Open == true then  --�w�T�w�D��
		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_12]"   ) -- �ӹL�F
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "Lua_Hao_GoblinOpenDoor_End01", 0 ) --�ڭn���}
	else
		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_01]"   ) --���I�A�O[112651]���ШӪ��r�I�ڪ��D�F�A�u�n����30�T�����ťN���A�ڴN���A��˨ð���i�h�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "Lua_Hao_GoblinOpenDoor_01", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_23]" , "Lua_Hao_GoblinOpenDoor_End01", 0 ) --���A�ڥ��������}�o�̡C
	end

end

--���}�ܻ��r��
Function Lua_Hao_GoblinOpenDoor_00()

		CloseSpeak( OwnerID() ) --������ܼҪ�
--		LuaDan_HitShrew_CheckOK(3,3,0) --�˼�3��i��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GOBLINARENA_11]" ,0 ) --�ǰe�^���r��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GOBLINARENA_11]" ,0 ) 
		sleep(10)
		ChangeZone( OwnerID(), 4, 0, -5852.6, 572.2, 3326.3, 149.5 ) --�e�����r��

end

Function Lua_Hao_GoblinOpenDoor_01()

		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_22] "   ) -- �T�w�n�D�ԤF�ܡH�@����ܬD��,���骺�C���ɶ��N�|�}�l�˼ơA�Y�S���b�ɭ��������D�ԡA�Y�����ѡC

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "Lua_Hao_GoblinOpenDoor_02", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_34]" , "Lua_Hao_itemshop_Openthegate", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_03]" , "Lua_Hao_GoblinOpenDoor_03", 0 ) --���A�ڤ�����o�򰵡C

end

function Lua_Hao_itemshop_Openthegate() --�[�J�w�g���X��

	local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --�P�_OwnerID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC
	local Npc = TargetID()
	local RoomID = ReadRoleValue( Npc ,EM_RoleValue_RoomID) 
	CloseSpeak( OwnerID() )  
	for i = 1 , PlayerTeam[0] do
		-- 2013.07.31 ���E�G�ץ����a������L�q�|����n�I�W�C�魫�m�ɶ��ɡA����L�k�}���_�c�P�����L�����ܪ����D�C
		local Open =  CheckFlag( PlayerTeam[i] , 542689 )--�ˬd�D�Ը��
		--
		local MoneyFlag =  CheckFlag( PlayerTeam[i] , 542905 )	-- ���޲z��
		if MoneyFlag == false then
			if Open == false then  --�|���D�ԹL
				if CountBodyItem( PlayerTeam[i]  , 203038 ) >= 30 and CountBodyItem( OwnerID()  , 202904 ) >= 1 then                            --�����ťN��
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 , "[SC_GOBLINARENA_02]" ,0 ) -- �N�A�O�o���n���ܡA���ꦨ�o�����Ӭݤ��X�O�H���F�a�H
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 , "[SC_GOBLINARENA_02]" ,0 ) 
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 2, "[SC_GOBLINARENA_35]" , C_SYSTEM )
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0, "[SC_GOBLINARENA_35]" , C_SYSTEM ) -- �u�n����40���H�W�����ΡA�ĤG���d���j���N�|�}�ҡA�j�B�e�i�a�I
					-- 2013.07.31 ���E�G�ץ����a������L�q�|����n�I�W�C�魫�m�ɶ��ɡA����L�k�}���_�c�P�����L�����ܪ����D�C					
					SetFlag( PlayerTeam[i]  , 542689 , 1 )--�����D�Ը��
					SetFlag( PlayerTeam[i]  , 542743 , 1 )--�����_�c�}�Ҹ��
					SetFlag( PlayerTeam[i]  , 542905 , 1 )--�������FLAG
		--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --�ܨ�
				--	ClockOpen( PlayerTeam[i]  ,EM_ClockCheckValue_5,1800,1800,0,"Lua_Clockending","Lua_Hao_GoblinOpenDoor_End03") --�˼ƭp�ɾ� (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
					SetPosByFlag( PlayerTeam[i] , 780235 , 0 )--�ǰe�� X ���X�l
		--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --�ܨ�
					-- 2013.03.21 �ץ����a�H2�H�H�W�H�ƶi�J�����L�v��(Zone 352)�ɡA���a�٦bŪ���e���ɡA�N����L���a���U���W�A�ɭP�Ӫ��a�bŪ���e��������A���|�ܨ��������L�����D�C
					SysCastSpellLv( PlayerTeam[i] , PlayerTeam[i] , 493476 , 1 )
					--
					DelBodyItem( PlayerTeam[i]  , 203038 , 30 )--���N��
					DelBodyItem( OwnerID()  , 202904 , 1 )--���N��
					DesignLog( PlayerTeam[i] , 1126511 , "Accept challenge" )	-- �i�J�ƥ���A��ܤ�I30�T�����ťN���P1�Ӷǰe���Ť�ɡA�O���U�����a�M��
					-- 2013.09.13 �ץ��}�ҳ̫����d���j������P���ܰT�����ŦX���q�|�����Ǫ��ƶq�����v�j�T�W�[�����D�C
--					if ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
					if i == 1 and ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
						WriteRoleValue( Npc , EM_RoleValue_PID , 1 );
						Lua_Hao_GoblinACT_ALLBegin( Npc , PlayerTeam[i] );
					end
					--
				elseif CountBodyItem( PlayerTeam[i]  , 203038 ) < 30 or CountBodyItem( OwnerID()  , 202904 ) == 0 then                            --�����ťN��
				--	ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��
				--	ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��				
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_112503_NO]" ,0  )--�A�S�������������ťN��
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_112503_NO]" ,0  )--�A�S�������������ťN��					
				end
			end
		else
			ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_GOBLINARENA_37]" ,0  )--�A�w�g���LNPC
			ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_GOBLINARENA_37]" ,0  )--�A�w�g���LNPC
		end		
	end
end

--�}��
Function Lua_Hao_GoblinOpenDoor_02()

	-- 2012.12.27 �s�W DesignLog
	
	local Player = OwnerID()
	local Npc = TargetID()
	--
	local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --�P�_OwnerID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC
	local RoomID = ReadRoleValue( Npc ,EM_RoleValue_RoomID) 
	CloseSpeak( OwnerID() )  

	DebugMsg( 0 , RoomID , "--Lua_Hao_GoblinOpenDoor_02--  ");
	DebugMsg( 0 , RoomID , "roomid="..RoomID );

	for i = 1 , PlayerTeam[0] do
		-- 2013.07.31 ���E�G�ץ����a������L�q�|����n�I�W�C�魫�m�ɶ��ɡA����L�k�}���_�c�P�����L�����ܪ����D�C
		local Open =  CheckFlag( PlayerTeam[i] , 542689 )--�ˬd�D�Ը��
		--
		if Open == false then  --�|���D�ԹL
			if CountBodyItem( PlayerTeam[i]  , 203038 ) >= 30 then                            --�����ťN��
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 , "[SC_GOBLINARENA_02]" ,0 ) -- �N�A�O�o���n���ܡA���ꦨ�o�����Ӭݤ��X�O�H���F�a�H
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 , "[SC_GOBLINARENA_02]" ,0 ) 
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 2, "[SC_GOBLINARENA_13]" , C_SYSTEM )
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0, "[SC_GOBLINARENA_13]" , C_SYSTEM ) -- �u�n����40���H�W�����ΡA�ĤG���d���j���N�|�}�ҡA�j�B�e�i�a�I
				SetFlag( PlayerTeam[i]  , 542689 , 1 )--�����D�Ը��
				SetFlag( PlayerTeam[i]  , 542743 , 1 )--�����_�c�}�Ҹ��
	--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --�ܨ�
			--	ClockOpen( PlayerTeam[i]  ,EM_ClockCheckValue_5,1800,1800,0,"Lua_Clockending","Lua_Hao_GoblinOpenDoor_End03") --�˼ƭp�ɾ� (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
				SetPosByFlag( PlayerTeam[i] , 780235 , 0 )--�ǰe�� X ���X�l
	--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --�ܨ�
				-- 2013.03.21 �ץ����a�H2�H�H�W�H�ƶi�J�����L�v��(Zone 352)�ɡA���a�٦bŪ���e���ɡA�N����L���a���U���W�A�ɭP�Ӫ��a�bŪ���e��������A���|�ܨ��������L�����D�C
				SysCastSpellLv( PlayerTeam[i] , PlayerTeam[i] , 493476 , 1 )
				--
				DelBodyItem( PlayerTeam[i]  , 203038 , 30 )--���N��
				DesignLog( PlayerTeam[i] , 112651 , "Accept challenge" )	-- �i�J�ƥ���A��ܤ�I30�T�����ťN���ɡA�O���U�����a�M��
				-- 2013.09.13 �ץ��}�ҳ̫����d���j������P���ܰT�����ŦX���q�|�����Ǫ��ƶq�����v�j�T�W�[�����D�C
--				if ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
				if i == 1 and ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
					WriteRoleValue( Npc , EM_RoleValue_PID , 1 )
					Lua_Hao_GoblinACT_ALLBegin( Npc , Player )
				end
				--
			elseif CountBodyItem( PlayerTeam[i]  , 203038 ) < 30 then                            --�����ťN��
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��
			end
		end
	end

end

--�C������ɶ�
Function Lua_Hao_GoblinOpenDoor_03()

	CloseSpeak( OwnerID() )    
end

--�T�w���
Function Lua_Hao_GoblinOpenDoor_End01()

	SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_04]"   ) -- �A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "Lua_Hao_GoblinOpenDoor_End02", 0 ) --�T�w


end

Function Lua_Hao_GoblinOpenDoor_End02()
	CloseSpeak( OwnerID() )  
	BeginPlot( OwnerID() , "Lua_Hao_GoblinOpenDoor_00" , 0 ) 

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function Lua_Hao_GoblinEnter_00()

		PlayMotion( TargetID(), 85) --Cast��t

		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_05]"   ) -- �Q�ѥ[�����L�v�ɶܡH�ڦ������I�u�n�A�֥I30�������ťN���I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_30]" , "Lua_Hao_GoblinEnter_01", 0 ) --�ڭn���W
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_09]" , "Lua_Hao_GoblinEnter_story", 0 ) --��������L�v��
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINTITLE08]" , "LuaN_mika_goblintitle00", 0 ) --�I���ٸ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "Lua_na_GoblinTitle0", 0 ) --�I�����y(2014.08.22 �`�`��s 6.1.1���X

end

Function Lua_Hao_GoblinEnter_story()

		PlayMotion( TargetID(), 85) --Cast��t

		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_10]"   ) -- �����L�v�ɬO�����L�U�ڶ����ǲ��ɨ�....
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_Hao_GoblinEnter_00", 0 )--�^�W�@��

end

function Lua_Hao_GoblinEnter_01()
	-- 2013.07.31 ���E�G�ץ����a������L�q�|����n�I�W�C�魫�m�ɶ��ɡA����L�k�}���_�c�P�����L�����ܪ����D�C
	local Open =  CheckFlag( OwnerID()  , 542689 )--�ˬd�D�Ը��
	--
	if Open == true then  --�w�T�w�D��

		PlayMotion( TargetID() , 107 ) --�n�Y
		SetSpeakDetail( OwnerID() , "[SC_GOBLINARENA_12]" ) -- �P�@�Ѥ��A������i���z���A�Q�o�{�����I�Ӱ��F�A�ЧA���ѦA�ӧa�C

	else

		CloseSpeak( OwnerID() )    

--		BeginPlot( TargetID() , "LuaYU_111813_5" , 0 )  
				

		local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --�P�_OwnerID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC

		for i = 1 , PlayerTeam[0] do
			-- 2013.07.31 ���E�G�ץ����a������L�q�|����n�I�W�C�魫�m�ɶ��ɡA����L�k�}���_�c�P�����L�����ܪ����D�C
			local OpenOK =  CheckFlag( PlayerTeam[i]  , 542689 )--�ˬd�O�_�㦳�D�Ը��
			--
			if OpenOK == false then

				if CountBodyItem( PlayerTeam[i]  , 203038 ) >= 30 then                            --�����ťN��

					BeginPlot( PlayerTeam[i] , "Lua_Hao_GoblinEnter_02" , 0 )  

				else
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��  (  *  ���ӴN�����r��   )
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��
				end

			end
		end
	end

end


function Lua_Hao_GoblinEnter_02()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GOBLINARENA_31]") --�A�������ܽЧA�i�J�ƥ�
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--��ưe�X�����D
			return
		end
		for i = 0 , 1000 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 1000 then
				if ( SelectID == 0 ) then--�T�{
					Beginplot( OwnerID() ,"Lua_Hao_GoblinEnter_Go", 0 )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF	
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 1000 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break

			elseif ( SelectID == -1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )	
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Lua_Hao_GoblinEnter_Go()

	ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_GOBLINARENA_08]" ,0 ) -- ���n�֡I��ڨӧa��
	ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_GOBLINARENA_08]" ,0 ) -- ���n�֡I��ڨӧa��
	sleep(10)
	BeginPlot( OwnerID() , "Lua_Hao_GoblinEnter_Go2" , 0 )  
end

function Lua_Hao_GoblinEnter_Go2()

	if ChangeZone( OwnerID(), 352 , -1 , 1904.7, 308.0 , 2230.2, 358.1) then   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),352," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
	end

end

function Lua_Hao_GoblinEnter_03()

	PlayMotion( TargetID(), 85) --Cast��t
	sleep(20)
	PlayMotion( TargetID(), 161) --Cast01��t
	sleep(15)
	PlayMotion( TargetID(), 165) --Cast02��t
end

function Lua_Hao_GoblinEnter_04()--�T�w�D�ԫ᪺�����L��t

	SetPlot( OwnerID(),"range","Lua_Hao_GoblinEnter_03",50 )                                             

end