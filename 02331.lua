----------------------�ĤG����
function cl_136_105305_P2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��  ---�X�Хi�ϥΨ�8��
	local hp = 0
	local skill = 0
	local Rand_Num = 0
	local Rand_flag = 0
	local flag = 0
	local open = 0
	local open_door = 0
	local flag_table = {5,6,7,8}
	SetPlot( OwnerID(), "range","cl_136_giveitem_range", 100 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	---local delnpc
	local door = CreateObjByFlag( 117547 , 780873 , 4 , 1 )  ---��
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( door , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( door , EM_RoleValue_PID, OwnerID() )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register3 , door )
	BeginPlot( door,"cl_117547",0)
	local door2 = CreateObjByFlag( 105314 , 780873 , 16 , 1 )  ---��
	SetModeEx (door2 , EM_SetModeType_Obstruct, false) 		---����(�O)
	SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door2 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door2 , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( door2 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( door , EM_RoleValue_Register7 , door2 )
	SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------�����ʧ@
	flag = table.getn(flag_table)
	Rand_flag = DW_Rand(flag)
	local woeman = CreateObjByFlag( 117550 , 780873 , flag_table[Rand_flag] , 1 )  ---�k�ͪ�����
	SetModeEx( woeman , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( woeman , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( woeman , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( woeman , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( woeman , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
	SetModeEx( woeman , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx( woeman , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( woeman , RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot( woeman,"LuaP_Dead",0)
	table.remove ( flag_table , Rand_flag )
	flag = table.getn(flag_table)
	for i = 1 , 3 , 1 do
		Rand_flag = DW_Rand(flag)
		local delnpc = CreateObjByFlag ( 117555 , 780873 , flag_table[Rand_flag] , 1) --�H���r���P��ͩ�
		SetModeEx( delnpc, EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( delnpc , EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( delnpc , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( delnpc , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( delnpc , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( delnpc , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		SetModeEx( delnpc , EM_SetModeType_Fight, false) ---�i���(�O)
		AddToPartition ( delnpc , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( delnpc , EM_RoleValue_HP , hp )
		Addbuff (  delnpc , 508120 , 0 ,-1 ) ---
		BeginPlot( delnpc ,"LuaP_Dead",0)
		table.remove ( flag_table , Rand_flag )
		flag = table.getn(flag_table)
	end
	cl_105305mots()
	while 1 do
		sleep ( 30 )
		--say ( OwnerID() , "in")
		local mots = ReadRoleValue ( OwnerID() , EM_RoleValue_Register6 )
		local player_table = {}
		local play_table = SearchRangePlayer ( OwnerID() , 260 )
		local play_number = table.getn(play_table)
		local player_number = 0
		--say ( OwnerID() , "play_number="..play_number)
		if play_number >= 1 then
			for i = 0 , play_number , 1 do
				if ReadRoleValue ( play_table[i] , EM_RoleValue_VOC ) ~= 0 then
					if ReadRoleValue ( play_table[i] ,EM_RoleValue_IsDead ) ~= 1 then
						table.insert ( player_table , play_table[i] )
					end
				end
			end
			player_number = table.getn(player_table)
			if player_number >= 1 then
				if open == 0 then
					open = 1
				end
				if open == 1 then
					if open_door == 0 then
						sleep ( 30 )
						--PlayMotionex ( door2 , ruFUSION_ACTORSTATE_ACTIVATE_LOOP , ruFUSION_ACTORSTATE_ACTIVATE_END )
						--sleep ( 20 )
						SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------�����ʧ@
						SetModeEx (door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
						--SetIdleMotion( door ,  ruFUSION_ACTORSTATE_ACTIVATE_END)
						ScriptMessage( OwnerID() , -1 , 2 ,"[SC_CORD_P2_16]" , 2 )----worderwotine(ť�����o�s�y)
						open_door = 1
					end
				end
			elseif player_number <= 0 then
				if open == 1 then
					open = 2
				end
				if open == 2 then
					--PlayMotionex ( door2 , ruFUSION_MIME_IDLE_STAND , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
					sleep ( 20 )
					SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
					SetModeEx (door2 , EM_SetModeType_Obstruct, false) 		---����(�O)
					sleep ( 15 )
					SetIdleMotion( door2 ,  ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					open_door = 0
					player_table = {}
					open = 0
				end
			end
		elseif play_number <= 0 then
			sleep ( 50 )
			if open == 1 then
				open = 2
			end
			if open == 2 then
				--PlayMotionex ( door2 , ruFUSION_MIME_IDLE_STAND , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
				sleep ( 20 )
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				SetModeEx (door2 , EM_SetModeType_Obstruct, false) 		---����(�O)
				sleep ( 15 )
				SetIdleMotion( door2 ,  ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				open_door = 0
				player_table = {}
				open = 0
			end
			open_door = 0
			open = 0
		end
	end
end
function cl_136_giveitem_range()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��  ---�X�Хi�ϥΨ�8��
	local door = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��  ---�X�Хi�ϥΨ�8��
	WriteRoleValue (  door , EM_RoleValue_Register9 , 1 )
end
function cl_136_117550()----
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption( Obj )
	AddSpeakOption( Obj,Target, "[SC_CORD_P2_01]", "cl_117550_P2", 0 )
	AddSpeakOption( Obj,Target, "[SC_CORD_P2_02]", "cl_117550_P3", 0 )
end
function cl_136_117550_del()----
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption( Obj )
	AddSpeakOption( Obj,Target, "[SC_CORD_P2_01]", "cl_117550_P2_del", 0 )
	AddSpeakOption( Obj,Target, "[SC_CORD_P2_02]", "cl_117550_P3_del", 0 )
end
function cl_117550_P2()
	local Obj = OwnerID()
	local Target = TargetID()
	SetSpeakDetail(Obj,GetString("SC_CORD_P2_03"))
	AddSpeakOption( Obj,Target, "[SC_CORD_P2_02]", "cl_117550_P3", 0 )
end
function cl_117550_P2_del()
	local Obj = OwnerID()
	local Target = TargetID()
	SetSpeakDetail(Obj,GetString("SC_CORD_P2_03"))
	AddSpeakOption( Obj,Target, "[SC_CORD_P2_02]", "cl_117550_P3_del", 0 )
end
function cl_117550_P3()
	local Obj = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	ScriptMessage( Obj , -1 , 2 ,"[SC_CORD_P2_04]" , 2 )
	CloseSpeak( Obj )
	local x = ReadRoleValue ( Target, EM_RoleValue_X)
	local y = ReadRoleValue ( Target, EM_RoleValue_Y)
	local z = ReadRoleValue ( Target, EM_RoleValue_Z)
	local lmstnpc = CreateObj ( 105309 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	AddToPartition ( lmstnpc , RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot( lmstnpc,"cl_105309",0)
	delobj ( Target )
end
function cl_117550_P3_del()
	local Obj = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	ScriptMessage( Obj , -1 , 2 ,"[SC_CORD_P2_04]" , 2 )
	CloseSpeak( Obj )
	local x = ReadRoleValue ( Target, EM_RoleValue_X)
	local y = ReadRoleValue ( Target, EM_RoleValue_Y)
	local z = ReadRoleValue ( Target, EM_RoleValue_Z)
	local lmstnpc = CreateObj ( 105309 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	AddToPartition ( lmstnpc , RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot( lmstnpc,"cl_105309_del",0)
	delobj ( Target )
end
function cl_105309()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	SetPlot( OwnerID(), "dead","cl_105309_dead", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_105309_del()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	SetPlot( OwnerID(), "dead","cl_105309del_dead", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_105309_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local hp = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local delnpc = CreateObj ( 117551 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	SetModeEx( delnpc , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( delnpc , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( delnpc , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( delnpc , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( delnpc , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
	SetModeEx( delnpc , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx( delnpc , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( delnpc , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( delnpc , EM_RoleValue_HP , hp )
	Addbuff (  delnpc , 508120 , 0 ,-1 ) ---
	BeginPlot( delnpc,"cl_117551_1",0)
	delobj ( OwnerID() )
end
function cl_105309del_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local hp = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local delnpc = CreateObj ( 117551 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	SetModeEx( delnpc , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( delnpc , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( delnpc , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( delnpc , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( delnpc , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
	SetModeEx( delnpc , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx( delnpc , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( delnpc , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( delnpc , EM_RoleValue_HP , hp )
	Addbuff (  delnpc , 508120 , 0 ,-1 ) ---
	BeginPlot( delnpc,"cl_117551_1del",0)
	delobj ( OwnerID() )
end
function cl_117551_1()
	LuaP_Dead()
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local skill = 0
	SetPlot( OwnerID(), "touch","cl_117551_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 30 then
			local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
			local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
			local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
			local lmstnpc = CreateObj ( 105309 , x , y , z , 0 , 1) --�H���r���P��ͩ�
			AddToPartition ( lmstnpc , RoomID ) ----����[�J����,�Ҧ椽��
			BeginPlot( lmstnpc,"cl_105309",0)
			delobj ( OwnerID() )
		end
	end
end
function cl_117551_1del()
	LuaP_Dead()
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local skill = 0
	SetPlot( OwnerID(), "touch","cl_117551del_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 30 then
			local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
			local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
			local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
			local lmstnpc = CreateObj ( 105309 , x , y , z , 0 , 1) --�H���r���P��ͩ�
			AddToPartition ( lmstnpc , RoomID ) ----����[�J����,�Ҧ椽��
			BeginPlot( lmstnpc,"cl_105309_del",0)
			delobj ( OwnerID() )
		end
	end
end
function cl_117551_touch()
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	if CountBodyItem( OwnerID(), 209103 ) ~= 0 then 
		if	BeginCastBarEvent( player , headgear , "[SC_CORD_P2_05]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_117551give") ~=1	then
			ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	elseif CountBodyItem( OwnerID(), 209103 ) == 0 then --���Ѫ��A
		ScriptMessage( player, player, 1,"[SC_CORD_P2_06]", 0 );
	end
end
function cl_117551del_touch()
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	if CountBodyItem( OwnerID(), 209103 ) ~= 0 then 
		if	BeginCastBarEvent( player , headgear , "[SC_CORD_P2_05]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_117551givedel") ~=1	then
			ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	elseif CountBodyItem( OwnerID(), 209103 ) == 0 then --���Ѫ��A
		ScriptMessage( player, player, 1,"[SC_CORD_P2_06]", 0 );
	end
end
function cl_136_117551give(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		BeginPlot( TargetID() , "cl_117551_giveitem" , 0)
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_117551givedel(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		BeginPlot( TargetID() , "cl_117551_giveitemdel" , 0)
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_117551_giveitem()
	DelBodyItem( TargetID(), 209103, 1 )
	GiveBodyItem ( TargetID(), 209120, 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local delnpc = CreateObj ( 105310 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	SetModeEx( delnpc , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( delnpc , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( delnpc , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( delnpc , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( delnpc , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( delnpc , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx( delnpc , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( delnpc , RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot( delnpc,"cl_105310_1",0)
	delobj ( OwnerID() )
end
function cl_117551_giveitemdel()
	DelBodyItem( TargetID(), 209103, 1 )
	GiveBodyItem ( TargetID(), 209123, 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local delnpc = CreateObj ( 105310 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	SetModeEx( delnpc , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( delnpc , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( delnpc , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( delnpc , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( delnpc , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( delnpc , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx( delnpc , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( delnpc , RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot( delnpc,"cl_105310_1",0)
	delobj ( OwnerID() )
end
function cl_105310_1()  ---
	CastSpelllv ( OwnerID() , OwnerID() , 497041 , 0 )
	sleep ( 50 )
	delobj ( OwnerID() )
end
function cl_117553()
	SetPlot( OwnerID(), "touch","cl_117553_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_117553_touch()
	if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CORD_P2_07]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_136_117553ok") ~=1	then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end
function cl_136_117553ok(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		BeginPlot( TargetID() , "cl_136_117553give" , 0)
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_117553give()
	GiveBodyItem ( TargetID(), 209121, 1 )
end
function cl_117552() ---����W�����K
	SetPlot( OwnerID(), "touch","cl_117552_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_117552_touch()
	if CountBodyItem( OwnerID(), 209121 ) ~= 0 then 
		local oo = GetDistance( OwnerID() , TargetID() );
		local YY = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
		local YY2 = ReadRoleValue ( TargetID(), EM_RoleValue_Y)
		yy_yy2 = YY2 - YY
		if oo <= 20 then 
			if yy_yy2 <= 20 then
				if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CORD_P2_08]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_136_117552ok") ~=1	then
					ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				end
			end
		end
	elseif CountBodyItem( OwnerID(), 209121 ) == 0 then 
		Addbuff (  OwnerID() , 508833 , 0 , 2 ) ---
	end
end
function cl_136_117552ok(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if	Result > 0 then --���\���A
		local oo = GetDistance( OwnerID() , TargetID() );
		local YY = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
		local YY2 = ReadRoleValue ( TargetID(), EM_RoleValue_Y)
		yy_yy2 = YY2 - YY
		if oo <= 20 then ----------------------------------------------------------------------------------------------------------�n�ק�^20
			if yy_yy2 <= 20 then
				EndCastBar(Executer,Result)--�M���I�k��
				BeginPlot( TargetID() , "cl_136_117552give" , 0)
			else
				EndCastBar(Executer,-1)--�M���I�k��
			end
		else
			EndCastBar(Executer,-1)--�M���I�k��
		end
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_117552give()
	local oo = GetDistance( OwnerID() , TargetID() );
	local YY = ReadRoleValue ( TargetID(), EM_RoleValue_Y)
	local YY2 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	yy_yy2 = YY2 - YY
	if oo <= 20 then
		if yy_yy2 <= 20 then
			DelBodyItem( TargetID(), 209121, 1 )
			GiveBodyItem ( TargetID(), 209103, 1 )
		end
	end
end
function cl_117554()----�i�h�����j��c
	SetPlot( OwnerID(), "touch","cl_117554_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_117554_touch()
	if CountBodyItem( OwnerID(), 209122 ) == 0 then 
		if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CORD_P2_09]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_117554ok") ~=1	then
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	elseif CountBodyItem( OwnerID(), 209122 ) == 1 then 
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_CORD_P2_10]", 0 );	---�o�c�l�ӭ��F�A�A�@���u���o�ʤ@��
	end
end
function cl_136_117554ok(Executer,Result) ---
	if	Result > 0 then --���\���A
		local oo = GetDistance( OwnerID() , TargetID() );
		if oo <= 15 then ----------------------------------------------------------------------------------------------------------�n�ק�^20
			EndCastBar(Executer,Result)--�M���I�k��
			BeginPlot( TargetID() , "cl_136_117554give" , 0)
		else
			EndCastBar(Executer,-1)--�M���I�k��
		end
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_117554give()
	GiveBodyItem ( TargetID(), 209122, 1 )
	delobj ( OwnerID() )
end
function cl_209122()
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local box = kg_GetPosRX( OwnerID()  ,117554 , 10 )
	SetModeEx ( box , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( box , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( box , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( box , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( box , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( box , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( box , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( box , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	SetModeEx( box , EM_SetModeType_AlignToSurface , false ) ---���Q
	AddToPartition ( box , RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot( box,"cl_117554",0)
end
function cl_117547() ---�}��
	local skilltime = 0
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register8 , 0 )
	SetPlot( OwnerID(), "touch","cl_117547_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		local skill = ReadRoleValue ( OwnerID() , EM_RoleValue_Register9 )
		if skill == 1 then
			skilltime = skilltime + 1
			if skilltime >= 300 then
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register8 , 1 )
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register9 , 2 )
			end
		end
	end
end
function cl_117547_touch()
	if ReadRoleValue ( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		if CountBodyItem( OwnerID(), 209120 ) ~= 0 or
			CountBodyItem( OwnerID(), 209123 ) ~= 0 then	
			if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CORD_P2_11]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_136_117547ok") ~=1	then
				ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			end
		elseif CountBodyItem( OwnerID(), 209120 ) == 0 or
			CountBodyItem( OwnerID(), 209123 ) == 0 then	
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_CORD_P2_12]", 0 );		--�ؼЦ��L��
		end
	elseif ReadRoleValue ( OwnerID() , EM_RoleValue_VOC ) == 0 then
		BeginPlot( TargetID() , "cl_136_GMopendoor" , 0)
	end
end
function cl_136_117547ok(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if	Result > 0 then --���\���A
		if CountBodyItem( OwnerID(), 209120 ) ~= 0 then 
			EndCastBar(Executer,Result)--�M���I�k��
			BeginPlot( TargetID() , "cl_136_117547give" , 0)
			ScriptMessage( OwnerID() , -1 , 2 ,"[SC_CORD_P2_13]" , 2 )----SHOW TIME �I��t�}�l�I
		else
			if CountBodyItem( OwnerID(), 209123 ) ~= 0 then 
				EndCastBar(Executer,-1)--�M���I�k��
				--say ( OwnerID() , "SC_CORD_P2_14" )
				--ScriptMessage( OwnerID() , -1 , 2 ,"[SC_CORD_P2_14]" , 2 )----SHOW TIME �I��t�}�l�I
				ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_CORD_P2_14]", 0 );		--�ؼЦ��L��
			end
		end
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_GMopendoor()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local door2 = ReadRoleValue ( OwnerID() , EM_RoleValue_Register7 )
	local skill = ReadRoleValue ( OwnerID() , EM_RoleValue_Register8 )
	delobj ( door2 )
	delobj ( OwnerID() )
	delobj ( AI )
end
function cl_136_117547give()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local door2 = ReadRoleValue ( OwnerID() , EM_RoleValue_Register7 )
	local skill = ReadRoleValue ( OwnerID() , EM_RoleValue_Register8 )
	DelBodyItem ( TargetID(), 209120, 1 )
	if skill == 0 then
		local PPL = SetSearchAllPlayer(RoomID )
		for i = 1 , PPL , 1 do  
			local ID = GetSearchResult()
			if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
				if CountBodyItem ( ID, 530674 ) == 0 then
					GiveBodyItem( ID, 530674, 1 )
				end
			end	
		end
	end
	delobj ( door2 )
	delobj ( OwnerID() )
	delobj ( AI )
end
function cl_105305mots() ---9~14
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local door = ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 )
	local play = 0
	local play2 = 0
	local Rand_Num = 0
	local play2_table = {}
	for i = 1 , 3 , 1 do
		local mots = CreateObjByFlag ( 105313 , 780873 , i+8 , 1) --�H���r���P��ͩ�
		AddToPartition ( mots , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( mots , EM_RoleValue_PID , OwnerID() )
		WriteRoleValue ( mots , EM_RoleValue_Register3 , door )
		BeginPlot( mots , "cl_105313_del" , 0)
		sleep ( 1 )
	end
	for i = 1 , 3 , 1 do
		local mots2 = CreateObjByFlag ( 105312 , 780873 , i+11 , 1) --�H���r���P��ͩ�
		AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( mots2 , EM_RoleValue_PID , OwnerID() )
		WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
		BeginPlot( mots2 , "cl_105312_del" , 0)
		sleep ( 1 )
	end
end
function cl_105312_del()
	local play = ReadRoleValue ( OwnerID() , EM_RoleValue_Register2 )
	SetAttack( OwnerID() , play )
	SetPlot( OwnerID(), "dead","cl_105312_deldead", 30 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_105312_deldead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local door = ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 )
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local mots2 = CreateObj ( 105312 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	SetModeEx( mots2 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( mots2 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( mots2 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( mots2 , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( mots2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( mots2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	SetModeEx( mots2 , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( mots2 , EM_RoleValue_PID , AI )
	WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
	WriteRoleValue ( mots2 ,EM_RoleValue_Register2 , TargetID() )
	BeginPlot( mots2 , "cl_105312fulltime" , 0)
	delobj ( OwnerID() )
end
function cl_105313_del()
	local play = ReadRoleValue ( OwnerID() , EM_RoleValue_Register2 )
	SetAttack( OwnerID() , play )
	SetPlot( OwnerID(), "dead","cl_105313_deldead", 30 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_105313_deldead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local door = ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 )
	local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	local mots2 = CreateObj ( 105313 , x , y , z , 0 , 1) --�H���r���P��ͩ�
	SetModeEx( mots2 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( mots2 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( mots2 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( mots2 , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( mots2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( mots2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	SetModeEx( mots2 , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( mots2 , EM_RoleValue_PID , AI )
	WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
	WriteRoleValue ( mots2 ,EM_RoleValue_Register2 , TargetID() )
	BeginPlot( mots2 , "cl_105313fulltime" , 0)
	delobj ( OwnerID() )
end
function cl_105313fulltime()
	LuaP_Dead()
	local skill = 0
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local play = ReadRoleValue ( OwnerID() , EM_RoleValue_Register2 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local door = ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 )
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 30 then
			if CheckID( door )  == true then ---�ˬdGID
				local oo = GetDistance( OwnerID() , AI );
				if oo >= 276 then
					local mots2 = CreateObjByFlag( 105313 , 780873 , 16 , 1 )  ---��
					AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
					WriteRoleValue ( mots2 , EM_RoleValue_PID , AI )
					WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
					BeginPlot( mots2 , "cl_105313_del" , 0)
					delobj ( OwnerID() )
				elseif oo <= 275 then
					local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
					local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
					local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
					local mots2 = CreateObj ( 105313 , x , y , z , 0 , 1) --�H���r���P��ͩ�
					AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
					WriteRoleValue ( mots2 , EM_RoleValue_PID , AI )
					WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
					BeginPlot( mots2 , "cl_105313_del" , 0)
					delobj ( OwnerID() )
				end
			else
				delobj ( OwnerID() )
			end
		end
	end
end
function cl_105312fulltime()
	LuaP_Dead()
	local skill = 0
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local door = ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 )
	local play = ReadRoleValue ( OwnerID() , EM_RoleValue_Register2 )
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 30 then
			if CheckID( door )  == true then  ---�ˬdGID
				local oo = GetDistance( OwnerID() , AI );
				if oo >= 276 then
					local mots2 = CreateObjByFlag( 105312 , 780873 , 16 , 1 )  ---��
					AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
					WriteRoleValue ( mots2 , EM_RoleValue_PID , AI )
					WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
					BeginPlot( mots2 , "cl_105312_del" , 0)
					delobj ( OwnerID() )
				elseif oo <= 275 then
					local x = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
					local y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
					local z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
					local mots2 = CreateObj ( 105312 , x , y , z , 0 , 1) --�H���r���P��ͩ�
					AddToPartition ( mots2 , RoomID ) ----����[�J����,�Ҧ椽��
					WriteRoleValue ( mots2 , EM_RoleValue_PID , AI )
					WriteRoleValue ( mots2 , EM_RoleValue_Register3 , door )
					BeginPlot( mots2 , "cl_105312_del" , 0)
					delobj ( OwnerID() )
				end
			else
				delobj ( OwnerID() )
			end
		end
	end	
end
-----��v�ľ�
function cl_209124card()
	local cordcar = { 209105 , 209106 , 209107 , 209108 , 209109 ,209110 , 209111 , 209112 , 209113 , 209114 }
	local cordshowcard = { 209125 , 209126 , 209127 , 209128 , 209129 , 209140 , 209141 , 209142 , 209143 , 209144 }
	local no1 = 0
	no1=table.getn(cordcar)
	for i = 1 , no1 , 1 do
		if CountBodyItem( OwnerID(), cordcar[i] ) ~= 0 then 
			GiveBodyItem ( TargetID(), cordshowcard[i], 1 )
			DelBodyItem( TargetID(), cordcar[i], 1 )
		end
	end
end
function cl_209124chitem()
	local cordcar = { 209105 , 209106 , 209107 , 209108 , 209109 ,209110 , 209111 , 209112 , 209113 , 209114 }
	local no1 = 0
	local tab = 0
	no1=table.getn(cordcar)
	for i = 1 , no1 , 1 do
		if CountBodyItem( OwnerID(), cordcar[i] ) ~= 0 then 
			tab = tab + 1
		end
	end
	if tab >= 1 then
		cl_209124card()
	elseif tab == 0 then
		GiveBodyItem ( TargetID(), 209124, 1 )
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_CORDNOC_13]", 0 );		--�ؼЦ��L��
	end
end