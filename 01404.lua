function LuaN_mika_goblintitle00()--6.1.2�}�l��s�t�@�Ӫ��������y�A�Ш�703204(�`)
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- �ˬd�O�_�� �I�����~
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- �ˬd�O�_�� �ٸ�1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- �ˬd�O�_�� �ٸ�2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- �ˬd�O�_�� �ٸ�3 

	if title1 == 1 and title2 == 1 then
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE01]" )--�@��A�֦��@�w�ƶq��<CP>[205037]</CP>�ɡA�A�i�H�����H�U�ٸ�
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE02]", "LuaN_mika_goblintitle01", 0) --��10��<CM>[205037]</CM>�����ٸ�<CP>�u�����L�i�h�v</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE03]", "LuaN_mika_goblintitle02", 0) --��100��<CM>[205037]</CM>�����ٸ�<CP>�u½�u�a�A�����L�I�v</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE04]", "LuaN_mika_goblintitle03", 0) --��250��<CM>[205037]</CM>�����ٸ�<CP>�u���_�ݡv</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_GoblinEnter_00", 0 ) --�^��W�@�h
	else
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE14]" )--�@��A�֦��@�w�ƶq��<CP>[205037]</CP>�ɡA�A�i�H�����H�U�ٸ�
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE02]", "LuaN_mika_goblintitle01", 0) --��10��<CM>[205037]</CM>�����ٸ�<CP>�u�����L�i�h�v</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE03]", "LuaN_mika_goblintitle02", 0) --��100��<CM>[205037]</CM>�����ٸ�<CP>�u½�u�a�A�����L�I�v</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_GoblinEnter_00", 0 ) --�^��W�@�h
	end
end

function LuaN_mika_goblintitle01()
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- �ˬd�O�_�� �I�����~
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- �ˬd�O�_�� �ٸ�1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- �ˬd�O�_�� �ٸ�2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- �ˬd�O�_�� �ٸ�3 

	if title1 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE05]" )--�A�w�g�֦����ٸ��C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
	else
		if item1 >= 10 then  --�ƶq���w
			GiveBodyItem(OwnerID(), 530375 , 1 )  --���ٸ�
			DelBodyItem(OwnerID(), 205037 , 10 ) --�����~ X10
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE06]" )--�i�h�A�A���i���A�w�g�o��F�q���L�s���g��C���ߧA���o���ٸ��I
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
		else 
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--�A�S��������<CP>[205037]</CP>
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
		end		
	end
end 

function LuaN_mika_goblintitle02()
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- �ˬd�O�_�� �I�����~
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- �ˬd�O�_�� �ٸ�1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- �ˬd�O�_�� �ٸ�2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- �ˬd�O�_�� �ٸ�3 

	if title2 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE05]" )--�A�w�g�֦����ٸ��C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
	else
		if title1 == 0 then
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE11]" )--�A�S���ٸ� <CB>�u[530375]�v</CB>��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
		else
			if item1 >= 100 and title1 == 1 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530376 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205037 , 100 ) --�����~ X100
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE09]" )-- �u���j�������h�A�~�����֦��o���Y�ΡC���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--�A�S��������<CP>[205037]</CP>
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
			end	
		end	
	end
end 

function LuaN_mika_goblintitle03()
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- �ˬd�O�_�� �I�����~
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- �ˬd�O�_�� �ٸ�1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- �ˬd�O�_�� �ٸ�2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- �ˬd�O�_�� �ٸ�3 

	if title3 == 1 then --�p�G�w�g���ٸ� 
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE05]" )--�A�w�g���o�Ӻٸ��o
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
	else
		if title1 == 0 and title2 == 0 then 
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE13]" )--�A�S���ٸ� <CB>�u[530375]�v</CB>�P <CB>�u[530376]�v</CB>��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
		elseif title1 == 1 and title2 == 0 then
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE12]" )--�A�S���ٸ� <CB>�u[530376]�v</CB>��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
		elseif title1 == 0 and title2 == 1 then
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE11]" )--�A�S���ٸ� <CB>�u[530375]�v</CB>��C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
		elseif 	title1 == 1 and title2 == 1 then		
			if item1 >= 250 then  --�ƶq���w
				GiveBodyItem(OwnerID(), 530377 , 1 )  --���ٸ�
				DelBodyItem(OwnerID(), 205037 , 250 ) --�����~ X250
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE06]" )--�L�e�m�áA�A�w�M�O�̳��y���s�b�A���ߧA���o���ٸ��I
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
			else 
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--�A�S��������<CP>[205037]</CP>
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --�^��W�@�h
			end
		end		
	end
end

function Lua_Hao_GoblindelAll()	

	Delbodyitem(OwnerID(), 530375 , 1 ) 
	Delbodyitem(OwnerID(), 530376 , 1 ) 
	Delbodyitem(OwnerID(), 530377 , 1 ) 
	Setflag(OwnerID(), 542742 , 0 ) 
	Setflag(OwnerID(), 542743 , 0 ) 
	Setflag(OwnerID(), 542869 , 0 ) 
	Setflag(OwnerID(), 542870 , 0 ) 
	Setflag(OwnerID(), 542875 , 0 ) 
	Setflag(OwnerID(), 542876 , 0 ) 
	Setflag(OwnerID(), 542877 , 0 ) 
	Setflag(OwnerID(), 542878 , 0 ) 
	Setflag(OwnerID(), 542904 , 0 )
	Setflag(OwnerID(), 542905 , 0 )
	Setflag(OwnerID(), 542689 , 0 ) --2014/11/18�W�[�D�Ը��X�Э��m
	GiveBodyItem(OwnerID(), 203038 , 30)
end

Function Lua_Hao_Goblinbox_51()   --Lv20~29�_�cScript&������

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_52" , 50 );

	end	

Function Lua_Hao_Goblinbox_52()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					GiveBodyItem( OwnerID() , 724511 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_52",50 )

		end
	end

end


Function Lua_Hao_Goblinbox_53()   --Lv30~39�_�cScript&������

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_54" , 50 );

	end	

Function Lua_Hao_Goblinbox_54()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					GiveBodyItem( OwnerID() , 724513 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_54",50 )

		end
	end

end

Function Lua_Hao_Goblinbox_55()   --Lv40~49�_�cScript&������

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_56" , 50 );

	end	

Function Lua_Hao_Goblinbox_56()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					GiveBodyItem( OwnerID() , 724515 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_56",50 )

		end
	end

end

Function Lua_Hao_Goblinbox_57()   --50�_�cScript&������

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_58" , 50 );

	end	

Function Lua_Hao_Goblinbox_58()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					GiveBodyItem( OwnerID() , 724517 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_58",50 )

		end
	end

end