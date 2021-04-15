function LuaI_114495_0()
	local Count = 0
	local Nick =  Lua_CreateObjByDir( OwnerID() , 114496 , 20 , 0 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	SetModeEX( Nick , EM_SetModeType_Mark , false )
	AddToPartition( Nick , RoomID )
	SetPlot( OwnerID() , "touch" , "LuaI_114495_1" , 30 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Nick )
	SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)	
	SetIdleMotion( Nick,ruFUSION_MIME_SIT_CHAIR_LOOP)		
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
			if Count == 4 then
				Yell( OwnerID() , "[SC_422966_0]" , 2 ) --��軡����̤F�H��F�I�A�W���Чڳܪ��s�@�I���D�]�S���I�٬O�o��[114497]���l�I
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_EAT )
			end
			if Count == 8 then
				Yell( Nick , "[SC_422966_1]" , 2 ) --����ܰs�ڡ�O�n�ܰs�����D���A���A�o�سܪk��������աI
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 12 then
				Yell( OwnerID() , "[SC_422966_2]" , 2 ) --�ܰs�N�O�n�j�f���ܰڡ㹳�ӮQ�̦����ܪk�~�O���檺�ڡI
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 16 then
				Yell( Nick , "[SC_422966_3]" , 2 ) --�A�o�����ަ����ܪk......�����~�����ǵs��@�ˤU�y�I����
				PlayMotion( Nick ,  ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 20 then
				Yell( OwnerID() , "[SC_422966_4]" , 2 ) --�s��b���H�O�b���䪺���ڳå�ܡH�Ѥl�n��X�ӵs��ӤU�s�ڡI
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 24 then
				Yell( Nick , "[SC_422966_5]" , 2 ) --��...�O�x�F...�A�������L���ڤH�ڡH����I�L�̦n��ť��F�A�H�H......
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_EAT  )
			end
			if Count == 28 then
				Yell( OwnerID() , "[SC_422966_6]" , 2 ) --�Ѥl�~���ȡA���L���ѦѤl�߱��n......�N�ǤF�L�̡I
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
		else
			local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
			if CheckID( Player ) == true then
				AdjustFaceDir( OwnerID(), Player, 0 )
				Yell( OwnerID() , "[SC_422966_7]" , 2 ) --�ޡI�o�̬O�ܰs�Y�����a��A�ڤj�n���ܦ����򤣦檺�I
				sleep( 10 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SHIELD_BASH )
				sleep( 20 )
				AdjustFaceDir( Nick, Player, 0 )
				Yell( Nick , "[SC_422966_8]" , 2 ) --��......�H�H......�S�Ϊ��աI�o�å�O���|�w�R�U�Ӫ��C
				sleep( 10 )
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
				sleep( 20 )
				Yell( OwnerID() , "[SC_422966_9]" , 2 ) --�S���I�s�S�ܧ��Ѥl�O���|���}���I
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
				sleep( 30 )
				Yell( Nick , "[SC_422966_10]" , 2 ) --����o�ӥD�N�n�I�p�G�A�⨺�@�j����s�ܥ��A�o�å�N�D�����i�F�I
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				sleep( 30 )
				AdjustFaceDir( OwnerID(), Nick, 0 )	
				Yell( OwnerID() , "[SC_422966_11]" , 2 ) --��㤣����Ѥl���s�N���@�n�A�Ѥl���ѴN��L�A�աI
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
				sleep( 30 )
				AdjustFaceDir(  Nick, OwnerID(), 0 )
				Yell( Nick , "[SC_422966_12]" , 2 ) --[114495]�I�O�p�ݧ�......���I
				PlayMotion( Nick , ruFUSION_ACTORSTATE_ATTACK_UNARMED )			
				sleep( 30 )
				Yell( OwnerID() , "[SC_422966_13]" , 2 ) --������p�G���@�j��s�u���Q���å�ܥ����ܡA�ڤ]�u����L�a���s�ܤF��
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )	
				sleep( 30 )
				SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)	
				SetIdleMotion( Nick,ruFUSION_MIME_SIT_CHAIR_LOOP)
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		end
		sleep( 10 )
		Count = Count + 1
		if Count > 30 then
			Count = 0
		end
	end 
end

function LuaI_114495_1()
	local Buff = 506100 --�ܰs����Buff
	local Keyitem = 543743 --����ܰs���X��
	local Keyitem2 = 543744--�����ܰs���X��
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 or ReadRoleValue( TargetID() , EM_RoleValue_Register ) == OwnerID() then
		if CheckAcceptQuest( OwnerID() , 422966 ) == true then --��������
			if CheckFlag( OwnerID() , KeyItem ) == false and CheckBuff( OwnerID() , Buff ) == false then --�٨S�ܰs�ɪ��B�z
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_14]" , 1 ) --�A�չϨ��L�̪��j�n���
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_14]" , 1 )
				SetFlag(  OwnerID() , Keyitem , 1 ) --��������ܰs���X��		
				if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
					WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
				end
				return
			end
			if CheckFlag( OwnerID() , KeyItem ) == true and CheckBuff( OwnerID() , Buff ) == false then --�i�H�ܰs�ɪ��B�z		
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_15]" , 1 ) --�ݼˤl�o��H�������Q�z�|�A�A���D���@�����s�u���Q�A�ܥ�......
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_15]" , 1 )
				return
			end	
			if CheckBuff( OwnerID() , Buff ) == true and CheckFlag( OwnerID() , KeyItem2 ) == false then --�ܧ��s���B�z
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_16]" , 1 ) --�A���F�����䪺�Űs��A��L�̥ܷN�A�ܧ��F
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_16]" , 1 )
				SetFlag(  OwnerID() , Keyitem2 , 1 ) --�����������Ȫ��X��
				SetFlag(  OwnerID() , Keyitem , 0 ) --�R���i�H�ܰs���X��
				BeginPlot( TargetID() , "LuaI_114495_2" , 0 )
				return
			end		
		else
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_17]" , 1 ) --�o�ǤH�ݰ_�Ӥw�g�ܾK�F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_17]" , 1 ) --�o�ǤH�ݰ_�Ӥw�g�ܾK�F�C	
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_18]" , 1 ) --�L�̦��G�S�Ųz�A�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_18]" , 1 ) --�L�̦��G�S�Ųz�A�C
	end
end

function LuaI_114495_2()
	local Flag = 780557
	local Nick = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Hide( Nick )
	Hide( OwnerID() )
	local Dummy1 = CreateObjByObj( 114687 , OwnerID() )
	local Dummy2 = CreateObjByObj( 114688 , Nick )
	MoveToflagEnabled( Dummy1 , false )
	MoveToflagEnabled( Dummy2 , false )
	Hide( Dummy1 )
	Hide( Dummy2 )
	WriteRoleValue( Dummy1 , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Dummy2 , EM_RoleValue_IsWalk , 1 )
	Show( Dummy1 , RoomID )
	Show( Dummy2 , RoomID )
	WriteRoleValue( Dummy1 , EM_RoleValue_LiveTime , 20 )
	WriteRoleValue( Dummy2 , EM_RoleValue_LiveTime , 20 )
	SetPlot( Dummy1 , "touch" , "LuaFunc_Obj_BUSY" , 30 )
	SetPlot( Dummy2 , "touch" , "LuaFunc_Obj_BUSY" , 30 )
	Yell( Dummy1 , "[SC_422966_19]" , 2 ) --�ڪY��A�I�{�b��ڭn�h��L�a���s�F......
	BeginPlot( Dummy1 , "LuaI_114495_Move" , 0 )
	sleep( 20 )
	Yell( Dummy2 , "[SC_422966_20]" , 2 ) --�z�I�A�ٯu��ܡA�n�a�B�n�a�A�ڭ̳o�N����
	BeginPlot( Dummy2 , "LuaI_114495_Move_1" , 0 )
	sleep( 300 )
	Show( OwnerID() , RoomID )
	Show( Nick , RoomID )
end

function LuaI_114495_Move()
	local Flag = 780579
	local FlagNum = GetMoveFlagCount( Flag )
	for i = 1 , FlagNum - 1 , 1 do
		LuaFunc_MoveToFlag( OwnerID() , Flag , i , 0 )
	end
	DelObj( OwnerID() )
end

function LuaI_114495_Move_1()
	local Flag = 780350
	local FlagNum = GetMoveFlagCount( Flag )
	for i = 1 , FlagNum - 1 , 1 do
		LuaFunc_MoveToFlag( OwnerID() , Flag , i , 0 )
	end
	DelObj( OwnerID() )
end


function LuaI_114497_0() --�s��
	Setplot( OwnerID() , "touch" , "LuaI_114497_1" , 30 )
end

function LuaI_114497_1()
	local KeyItem = 543743 --�i�H�ܰs���X��
	local KeyItem2 = 543744 --�ܧ��s���X��
	local Buff = 506099 --�p��ܰs��buff
	local Buff2 = 506100 --�s�K��buff
	if CheckFlag( OwnerID() , KeyItem ) == true and CheckBuff( OwnerID() , Buff2 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_21]" , 1 ) --�B�ʡ�A��U�@�j�f[114497]......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_21]" , 1 ) --�B�ʡ�A��U�@�j�f[114497]......
		AddBuff( OwnerID() , Buff , 0 , -1 )
		local BuffPos = Lua_BuffPosSearch(OwnerID() , Buff )
		local OrgLv = BuffInfo( OwnerID() , BuffPos , EM_BuffInfoType_Power ) +1
		if OrgLv == 3 then
--			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_22]" , 1 ) --�A�}�lı�o�Q�R......
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_22]" , 1 ) --�A�}�lı�o�Q�R......
		end
		if OrgLv == 4 then
--			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_23]" , 1 ) --��l���G�֨���...���G...
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_23]" , 1 ) --��l���G�֨���...���G...
		end
		if OrgLv == 5 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_27]" , 1 ) --�{�b�i�H�h��[114497]�n�n�ͽͤF
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_24]" , 1 ) --��...�ܧ��F...
			CancelBuff( OwnerID() , Buff )
			AddBuff( OwnerID() , Buff2 , 0 , 27 )
		end
	elseif CheckBuff( OwnerID() , Buff2 ) == true or CheckFlag( OwnerID() , 543744 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_25]" , 1 ) --�̭����s�w�g�Q�A�ܧ��F		
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_26]" , 1 ) --�o�O�@�j��@�P��[114497]	
	end
end

function LuaI_114545_0() --�O�s�̰s�a�����A
	local Count = 0
	local Barnight =  Lua_CreateObjByDir( OwnerID() , 114544 , 20 , 0 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	AddToPartition( Barnight , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Barnight )
	SetPlot( OwnerID() , "range" , "LuaI_114545_1" , 70 )
	SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)
	SetIdleMotion( Barnight,ruFUSION_MIME_SIT_CHAIR_LOOP)

end
function LuaI_114545_1() --�O�s�̰s�a�����A
	if CheckCompleteQuest( OwnerID() , 423014 ) == false and CheckCompleteQuest( OwnerID() , 422966 ) == true and CheckFlag( OwnerID() , 543746 ) == false then
		if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
			BeginPlot( TargetID() , "LuaI_114545_2" , 0 )
		end
	end
end
function LuaI_114545_2() --�O�s�̰s�a�����A
	local Barnight = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	SetIdleMotion( OwnerID(),ruFUSION_MIME_NONE)	
	SetIdleMotion( Barnight,ruFUSION_MIME_NONE)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	for i = 1 , 20 , 1 do
			if i == 2 then
				Yell( Barnight , "[SC_423014_C_0]" , 2 ) --���@����C�]���X�����A�ݧA����ɭԳQ���s�S�̬�F�I
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_EMOTE_POINT )
			end
			if i == 4 then
				Yell( OwnerID() , "[SC_423014_C_1]" , 2 ) --��I�ڦV�d���R���C��˳���A���@��j�A��ߦn�F�A�A���F�ڦA�Фȩ]���A���͡�
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SHIELD_BASH )
			end
			if i == 6 then
				Yell( Barnight , "[SC_423014_C_2]" , 2 ) --�d���H�R�@��C�ٰO�o�檺�H�O�֡H�u�p���v�N�O�u�p���v�C
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
			end
			if i == 8 then
				Yell( OwnerID() , "[SC_423014_C_3]" , 2 ) --���|�a�H�A�����D�d���O�֡H�N�O���@�ӥd���D�������ڡA�¥��Z���Ӫ��s�Y�A�s�L�������D�A�A�u�O�ղV�F
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			end
			if i == 10 then
				Yell( OwnerID() , "[SC_423014_C_4]" , 2 ) --���f�I��h�a�̪����ٲ¡A���A�o�ح����A���ǧA�̤]�����ˡC
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )			
			end
			if i == 12 then
				Yell( Barnight , "[SC_423014_C_5]" , 2 ) --��������ڧ̡H�L��A�̨��ظ��b���̪��z���n�Ӧh�F��
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_EMOTE_POINT )
			end
			if i == 14 then
				Yell( OwnerID() , "[SC_423014_C_6]" , 2 ) --�A�I
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_DODGE )
			end
			if i == 16 then
				Yell( Barnight , "[SC_423014_C_7]" , 2 ) --��������H�s�A�̮��@��_�P�d���檺��C�h��ڧ̨M���A�ڰe�L���_�C����|���PĹ�A���Ӯz���̧̡I
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_SHIELD_BASH )
			end
			if i == 18 then
				Yell( OwnerID() , "[SC_423014_C_8]" , 2 ) --��N��A�A�|�ᮬ���Ѧðd�F�ڧ̩M�u�]���v�d���I
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
				local Ball = Lua_CreateObjByDir( OwnerID() , 114040 , 1 , 0) 
				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				WriteRoleValue( Ball , EM_RoleValue_LiveTime , 2 )
				Lua_ObjDontTouch( Ball ) 
				AddToPartition( Ball , RoomID )
				SetPlot( Ball , "Range" , "LuaI_114545_Range" , 100 )
			end
		sleep( 10 )
	end 
	SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)	
	SetIdleMotion( Barnight,ruFUSION_MIME_SIT_CHAIR_LOOP)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114545_Range() --�O�s�̰s�a�����A
	if CheckCompleteQuest( OwnerID() , 423014 ) == false and CheckCompleteQuest( OwnerID() , 422966 ) == true and CheckFlag( OwnerID() , 543746 ) == false then
		SetFlag( OwnerID() , 543746 , 1 )
	end
end

function LuaS_114546_0()
	if CheckAcceptQuest( OwnerID() , 423014 ) == true then
		local Ring = CountBodyItem( OwnerID() , 206814 )
		local MoneyBeg = CountBodyItem( OwnerID() , 206815 )
		local Sword = CountBodyItem( OwnerID() , 203464 )
		if Sword > 0 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_8]" ) -- �¥����W�x�O��������A�R�����褧���N�S���������p�A�A��z�ѧa�H�z�Ѫ��ܴN�֨��}�I
		elseif Ring < 1 and MoneyBeg < 1 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_0]" ) -- ���H�����^�^���A�Q��ڭɿ��H
		elseif Ring > 0 and MoneyBeg < 1 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_1]" ) -- �@�H�o�T�٫��A�q����˨Ӫ��H�p�G�A���@�ǿ��A�ڭ̥i�H���I�O���Ʊ���
		elseif Ring < 1 and MoneyBeg > 0 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_2]" ) -- ��H�o���U�n�e�ڡH
		else
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_3]" ) --�٫�...�A�n�䪺�H�{�b���b�o�̡A��ڤ]�O�@�˪��N��C
			AddSpeakOption(  OwnerID(), TargetID(),"[SC_423014_T_4]" ,  "LuaS_423014_1",  0 );  --�ڷQ�T�{�@�U�A�A�O���O...
		end
	else
		LoadQuestOption( OwnerID() )
	end
	if	( CheckCompleteQuest( OwnerID(),423014)==true)	and	(CheckAcceptQuest(OwnerID(),422981)==true )	and
		( CheckCompleteQuest( OwnerID(),422981)==false)	and	(CountBodyItem( OwnerID(),206816) >0)	and
		CheckFlag( OwnerID() , 543708 ) == false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_91]","LuaS_114546_100",0)	--�Q�ЧA���Ӧ��C
	end
	
end

function LuaS_423014_1()
		local Ring = CountBodyItem( OwnerID() , 206814 )
		local MoneyBeg = CountBodyItem( OwnerID() , 206815 )
		SetSpeakDetail (  OwnerID() ,"[SC_423014_T_5]" ) 
		--[114546]�A�u�]���v�d�����U��C
		--([114546] �L�L�ɨ����t½�}�I�ߡA�@�����b��Ŧ������G�{�L�_�S��S.S.S.E�r�ˡC)
		--�A�a�Ӫ��٫��쥻���Ӧb�@�Ӹ��|�G��̡A��...�A���W�g�L����{���S�]�t�L�A�L�U�A�����L�R�Z���A�O�a�H
		if Ring > 0 and MoneyBeg > 0 and  CheckAcceptQuest( OwnerID() , 423014 ) == true then
			AddSpeakOption(  OwnerID(), TargetID(),"[SC_423014_T_6]" ,  "LuaS_423014_2",  0 );  --���T�A�L�ݭn�@��C�C
		end
end

function LuaS_423014_2()
		local Ring = CountBodyItem( OwnerID() , 206814 )
		local MoneyBeg = CountBodyItem( OwnerID() , 206815 )
		SetSpeakDetail (  OwnerID() ,"[SC_423014_T_7]" ) 
		--([114546]�i�F�i���U���q�C)
		--�n�F�A�N�o��A���A��ȳf��W�A�C���C
		if Ring > 0 and MoneyBeg > 0 and  CheckAcceptQuest( OwnerID() , 423014 ) == true then
			if 	GiveBodyItem( OwnerID() , 203464 , 1 ) then
				DelBodyItem( OwnerID() , 206814 , Ring )
				DelBodyItem( OwnerID() , 206815 , MoneyBeg )
			end
		end
end


Function LuaP_RidingDatanieeSL()
	if CheckBuff( OwnerID() , 506264) == false then
		AddBuff( OwnerID() , 506264, 0 , -1 )
	end
		SetModeEx(114817,EM_SetModeType_Obstruct,true) 

end

Function LuaP_RidingDatanieeSLsit()
		SetModeEx(OwnerID(),EM_SetModeType_Obstruct,true) 
end


function LuaArea_IronCastal_KeepOut() --�C����ˬd�@���A�⤣�Ӷi�J�����a�X���X�h--�b���f�����F�@�ӽc�l
	local Player
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AreaID = 756
	local  X , Y , Z, Dir = -8902 , -150 , 7930 , 270
	while 1 do
		Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if  Lua_ObjAreaCheck( ID , AreaID ) == true then
				if CheckAcceptQuest( ID , 422996 ) == false and CheckCompleteQuest( ID , 422996 ) == false and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_Y ) > -150 then
					SetPos( ID , X , Y , Z, Dir )
					ScriptMessage( ID , ID , 1 , "[SC_IRONCASTAL_KEEPOUT]" , 0 ) --�A����o�i�J��Ϋ����\�i
					ScriptMessage( ID , ID , 0 , "[SC_IRONCASTAL_KEEPOUT]" , 0 )
				end
			end
		end		
		sleep( 20 )
	end
end

function LuaI_IronCastal_GateGuard()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Keeper = {}
	for i = 1 , 2 , 1 do
		Keeper[i] = Lua_CreateObjByDir( OwnerID() , 114504 , 40-80*(i-1) , 90 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + i , Keeper[i] )
		AddToPartition( Keeper[i] , RoomID )
	end
	SetPlot( OwnerID() , "Range" , "LuaI_IronCastal_GateGuard_1" , 100 )
end

function LuaI_IronCastal_GateGuard_1()
	if CheckAcceptQuest( OwnerID() , 422996 ) == false and CheckCompleteQuest( OwnerID() , 422996 ) == false then
		BeginPlot( TargetID() , "LuaI_IronCastal_GateGuard_2" , 0 )
	end
end

function LuaI_IronCastal_GateGuard_2()
	local Keeper1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local Keeper2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	Yell(  Keeper1 , "[SC_422991_KEEPOUT_1]" , 3 ) --��B�I
	SetIdleMotion( Keeper1 , ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	SetIdleMotion( Keeper2 , ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	BeginPlot( Keeper1 , "LuaI_IronCastal_GateGuard_3" , 0 )
	BeginPlot( Keeper2 , "LuaI_IronCastal_GateGuard_3" , 0 )	
	sleep( 20 )
	Yell(  Keeper2 , "[SC_422991_KEEPOUT_2]" , 3 ) --��Τ��\�~�H�i�J�I
	if CheckID( TargetID() )== true and CheckAcceptQuest( TargetID() , 422991 ) == true then
		sleep( 20 )
		Yell(  Keeper1 , "[SC_422991_KEEPOUT_3]" , 3 ) --�A�]��ƫe�ӡH
	end
end

function LuaI_IronCastal_GateGuard_3()
	sleep( 150 )
	SetIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
end

function LuaS_IronCastal_GateGuard_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422991 ) == true then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422991_0]" ,  "LuaS_IronCastal_GateGuard_1",  0 );  --�ڬO�Ӧ۹F�ԥ��������ϸ`�A�Q����D�Ǵ��D���J���ҡC
	end
end

function LuaS_IronCastal_GateGuard_1()
	SetSpeakDetail (  OwnerID() ,"[SC_422991_1]" ) --�Ӧ۹F�ԥ��������ϸ`�H�o�K�N��A�Q���Ǵ��D���J���Ҥj�H�A�L�w�g���b��Ϋ����ܤ[�F�K
	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422991_2]" ,  "LuaS_IronCastal_GateGuard_2",  0 );  --�o�O����N��H
end

function LuaS_IronCastal_GateGuard_2()
	SetSpeakDetail (  OwnerID() ,"[SC_422991_3]" ) --�Ǵ��D���J���Ҥj�H�b�X�~�e�X���A��b��Ϊ��񪺥��ԧ��A�j�H�L�K�����ڭ̺٥L����D...
	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422991_4]" ,  "LuaS_IronCastal_GateGuard_3",  0 );  --������H
end

function LuaS_IronCastal_GateGuard_3()
	SetSpeakDetail (  OwnerID() ,"[SC_422991_5]" ) 
	--�Բӭ�]�ڤ��M���A�J�M�A�O�Ӧ۹F�ԥ��������ϸ`�A�ЧA�����h���ԧ���j�H�a�I
	--���۹D�����A�A�N��ݨ����l�F�A�]�\�@���N�ಣ�ͧ��ܤ]�����w�K
end

--function LuaS_114366_0()
--	LoadQuestOption( OwnerID() )
--	if CheckAcceptQuest( OwnerID() , 422992 ) == true then
--		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_0]" ,  "LuaS_422992_0",  0 );  --�F�ԥ������譱�Q�F�ѡA�o���|�檺��D��|ĳ�A�A�]�������]�S���N���ΥX�u�H
--	end
--end

--function LuaS_422992_0()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_1]" ) 
	--��ΨS���X�u��D��|ĳ�H�I....�ګܩ�p�A�o�ͳo�بƱ����Z��j�a�A�����z���W�e�ӡC
	--��Υ��ѧڪ��̧̭̪v�z�A�ڬ۫H�L�̤@�w������������]�~�|�S���X�u�A�u���ܩ�p�C
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_2]" ,  "LuaS_422992_1",  0 );  --�̧̡̭H
--end

--function LuaS_422992_1()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_3]" ) 
	--��A�Һ��D���J���ҡB�ǿաD���J���ҬO�ڪ��̧̡A��O���D�`�u�q�C
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_4]" ,  "LuaS_422992_2",  0 );  --���O�A�v�z��ΡK��������A�|�d�b���ԧ��H
--end

--function LuaS_422992_2()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_5]" ) 
	--���}��ΡA���������p�~���¤@�I�A����j�ڭ̬ݨ��Һ��M�ǿժ��v�z��O�A�L�̷|���O������C
	--�ӥB�b���ԧ��̡A�ڥi�H�������̪��ר�Bŧ���������s��A�o�O�ڥi�H���쪺�Ʊ��A�ڷQ�n�u�@�j�a�C
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_6]" ,  "LuaS_422992_3",  0 );  --�������Ϊ���~�H�i�J�H
--end

--function LuaS_422992_3()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_7]" ) 
	--�Һ��M�ǿչ塚�����ǻ~�|�A���ɭԦ��]�|�޵o�@�ǯɪ��A�Ȯɧ��Ϋʫ��A�i�H�קK�i�Ψ�~���C
	--�L�̥��ʳ����a�A���~�|�Ѷ}�A�@���N��^�_�쪬�F�A�o�ǳ��u�O�Ȯɪ��Ӥw�C
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_6]" ,  "LuaS_114366_0",  0 );  --�������
--end

function LuaS_114513_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423006 ) == true and CheckFlag( OwnerID() , 543745 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_423006_Q1]" ,  "LuaS_114513_1",  0 );  --�ڭn��������H
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	then		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_0]","LuaS_423007_2",0)	--���������O�����E���Q���Q�Ѷ}��Ψ����l�������~�|�A��Ӥ��Y�i�檺�ɭԡA�L���n�˦ۥh�����h���Ȥ��m�C	
	end
end

function LuaS_114513_1()
	CloseSpeak( OwnerID() )
	local Buff = {506138,506139,506140,506141,506142,506143,506144}
	Tell( OwnerID() ,TargetID() , "[SC_423006_Q2]" ) --�u�n�Ӥp�������h���N�n�o��
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID())
	AddBuff( OwnerID() , Buff[DW_Rand(7)] , 0 , 15 )
end

function LuaM_423006_MSG()
	local BuffID = {506138,506139,506140,506141,506142,506143,506144}
	local String
	local StringA
	local StringB
	local Buff = 0
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 114513 then
		Target = TargetID()
	end
	local StringC = {"SC_423006_F0" , "SC_423006_F1"}

	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	
	if Buff == 0 then
		return
	end
	
	local BuffPos = Lua_BuffPosSearch(OwnerID() , BuffID[Buff] )
	local Time = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Time )
	String = "["..BuffID[Buff].."]"
	if Time == 14 then
		StringA = "[SC_423006_A][$SETVAR1="..String.."]"
		ScriptMessage( OwnerID() , OwnerID() , 0 , StringA , "0xFFFFFFFF" )
	end
	if Time == 13 then
		StringB = "[SC_423006_B][$SETVAR1="..String.."]"
		ScriptMessage( OwnerID() , OwnerID() , 2 , StringB , 0 )
	end
	if Time == 5 then
		Tell( OwnerID() ,Target , "["..StringC[DW_Rand(2)].."]" )
	end
end
function LuaM_423006_Failed()
	local BuffID = {506138,506139,506140,506141,506142,506143,506144}
	local Success = 506145
	for pry , obj in pairs(BuffID) do
		CancelBuff_NoEvent( OwnerID() , obj )
	end
	CancelBuff_NoEvent( OwnerID() , Success )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 114513 then
		Target = TargetID()
	end
	Tell( OwnerID() ,Target , "[SC_423006_F2]" )	--�u�u��ݼˤl�n���ӤF��

end

function LuaI_423006_OBJ()
	AddBuff( OwnerID() , 502546 , 0 , -1 )
	SetPlot( OwnerID() , "Touch" , "LuaI_423006_OBJ2" , 30 )
end

function LuaI_423006_OBJ2()
	if CheckAcceptQuest( OwnerID() , 423006 ) == true then
		local BuffID = {506138,506139,506140,506141,506142,506143,506144}
		local Buff = 0

		for pry , obj in pairs(BuffID) do
			if CheckBuff( OwnerID() , Obj ) == true then
				Buff = pry
				break
			end
		end
		
		if Buff == 0 then
			return
		end	
		BeginPlot( TargetID() , "LuaI_423006_OBJ3" , 0 )
	end
end

function LuaI_423006_OBJ3()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Thing = {[114518] = 206825 , [114516] = 206826 , [114520] = 206827 , [114515] = 206828 , [114521] = 206829 , [114517] = 206830 , [114519] = 206869 }
	GiveBodyItem( TargetID() , Thing[OrgID] , 1 )
	Hide( OwnerID() )
	sleep( 50 )
	Show( OwnerID() , RoomID )
end

function LuaI_114514_0()
	SetPlot( OwnerID() , "Touch" , "LuaI_114514_1" , 30 )
end

function LuaI_114514_1()
	local BuffID = {506138,506139,506140,506141,506142,506143,506144}
	local ObjID = {206825,206826,206827,206828,206829,206830,206869}
	local Success = 506145
	local Buff = 0
	local KeyItem = 543745
	local Count = 0
		
	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	if Buff ~= 0 then 
		Count = CountBodyItem( OwnerID() , ObjID[Buff] )	
		--���ު��a������L�ӡA�����^���I
		for pry , obj in pairs(ObjID) do
				local Num = CountBodyItem( OwnerID() , Obj )
				if Num > 0 then
					DelBodyItem( OwnerID() , obj , Num )
				end
		end
	end
	--�p�G���W�S���ݭn�����~�ɪ��P�_
	if Count < 1 then
		Tell(OwnerID() ,TargetID() , "[SC_423006_Q3]" ) --�M�h�j�H�A�A���Ӫ����O�ڭn���F��ڡI
		return
	end				
	--�p�G���W���ݭn�����~�ɪ��P�_
	if  Count > 0 then
		AddBuff( OwnerID() , Success , 0 , -1 )
		local String = {"SC_423006_C0" , "SC_423006_C1" , "SC_423006_C2" , "SC_423006_C3" , "SC_423006_C4" , "SC_423006_C5" , "SC_423006_C6" , "SC_423006_C7" , "SC_423006_C8" , "SC_423006_C9"}
		local BuffPos = Lua_BuffPosSearch(OwnerID() , Success )	
		local LV = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Power  ) + 1
		Tell(OwnerID() ,TargetID() , "["..String[LV].."]" )
		if LV >= 10 then --�P�_�O�_�w�g���\
			for pry , obj in pairs(BuffID) do
				CancelBuff_NoEvent( OwnerID() , obj )
			end
			CancelBuff_NoEvent( OwnerID() , Success )
			if CheckAcceptQuest( OwnerID() , 423006 ) == true then
				SetFlag( OwnerID() , KeyItem , 1 )
			end
		else
			CancelBuff_NoEvent( OwnerID() , BuffID[Buff] )
		 	local Num = DW_Rand(7) --�קK���o�M�e�@���ۦP�����~
		 	if Num == Buff then
		 		Num = Num + 1
		 	end
		 	if Num > 7 then
		 		Num = 1
		 	end
			AddBuff( OwnerID() , BuffID[Num] , 0 , 15 )
		end
	end
end

function LuaS_114510_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422974 ) == true and CheckFlag( OwnerID() , 780535 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422974_0]" ,  "LuaS_114510_1",  0 );  --�ڷǳƦn�F�C
	end
end

function LuaS_114510_1()
	SetSpeakDetail (  OwnerID() ,"[SC_422974_1]" ) --�u���H���߳��b�̡�Ρ㪬�A�F�H��A[$playername]�A�ګܴ��ݧA�A�׮i�S��쪺���Z����C�ҿת��`�N�ƶ��N�O���H���H�a���O����O�����A�e�����q�I���աH
	if CheckAcceptQuest( OwnerID() , 422974 ) == true and CheckFlag( OwnerID() , 780535 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422974_2]" ,  "LuaS_114510_2",  0 );  --�K���դF�C
	end
end

function LuaS_114510_2()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		SetSpeakDetail (  OwnerID() ,"[SC_422974_3]" ) --�����@�U�A[114499]�H��[114500]�٨S����A�p�G�ڭ̥���ʪ��ܵ���O�߱�F�L�̡A�ڵL�k�Ԩ��߱�٦�o�بƱ��ڡI
	else
		CloseSpeak( OwnerID() )
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot( TargetID() , "LuaI_114510_0" , 0 )
	end
end

function LuaI_114510_0()
	local Student = {}
	local Bandit = {}
	local Flag = 780535
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tag = Role:new( OwnerID() )
	local Xi , Yi , Zi , Diri = Tag:X() , Tag:Y() , Tag:Z() , Tag:Dir()
	local Master = LuaFunc_CreateObjbyObj( 103445 , OwnerID() )
	local Goal = CreateObjByFlag( 114040 , Flag , 1 , 1) --�X�� 1 �O���I
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local KeyItem = 543747
	local Result = "YES"
	
	Hide( OwnerID() )
	
	AddBuff( Player , 506212, 0 , 60 )
	Lua_ObjDontTouch( Goal ) 
	MoveToFlagEnabled( Master , false )
	WriteRoleValue( Master , EM_RoleValue_IsWalk , 1 )
	SetRoleCamp( Master , "Visitor" )
	AddToPartition(  Master , RoomID )
	AddToPartition(  Goal , RoomID )

	SetPlot( Master , "dead" , "LuaI_114510_NoDead" , 0 )	
	
	Student[1] = CreateObj( 103446 , Xi , Yi , Zi+50 , Diri , 1 )
	Student[2] = CreateObj( 103497 , Xi , Yi , Zi-50 , Diri , 1 )

	for i = 1 , 2 , 1 do
		WriteRoleValue( Student[i] , EM_RoleValue_IsWalk , 0 )
		WriteRoleValue( Student[i] , EM_RoleValue_PID , Master )
		WriteRoleValue( Student[i] , EM_RoleValue_Register , i+1 )
		WriteRoleValue( Master , EM_RoleValue_Register + i  , Student[i] )
		SetRoleCamp( Student[i] , "Visitor" )
		AddToPartition(  Student[i] , RoomID )
		MoveToflagEnabled( Student[i]  , False )
		SetPlot( Student[i] , "dead" , "LuaI_114510_NoDead" , 0 )
		Yell( Student[i] , "[SC_422974_4]" , 3 ) --�v�d�I�ڭ̨ӤF�I
		BeginPlot( Student[i] , "LuaI_114510_FlagMove" , 0)
	end
	
	AdjustFaceDir( Master , Goal , 180 )
	sleep( 50 )
	Yell( Master , "[SC_422974_5]" , 3 ) --�D�`�n�I�J�M������F�I����ڨ��a�I
	AdjustFaceDir( Master , Goal , 0 )
	sleep( 10 )
	PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_POINT )
	AdjustFaceDir( Student[1] , Master , 0 )
	AdjustFaceDir( Student[2] , Master , 0 )	
	sleep( 20 )
	Yell( Student[1] , "[SC_422974_6]" , 3 ) --�v�d�A�ڭ̭n������H
	PlayMotion( Student[1] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 20 )
	Yell( Master , "[SC_422974_7]" , 3 ) --�������I��M�O�e�����q�աI
	PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	sleep( 20 )
	AdjustFaceDir( Student[1] , Student[2] , 0 )
	sleep( 5 )
	AdjustFaceDir( Student[2] , Student[1] , 0 )
	PlayMotion( Student[1] , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 20 )
	PlayMotion( Student[2] , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	
	SetRoleCamp( Master , "SNPC" )
	WriteRoleValue( Master , EM_RoleValue_Register , 4 )
	BeginPlot( Master , "LuaI_114510_FlagMove" , 0)
	for i = 1 , 2 , 1 do
		Hide(  Student[i] )
		WriteRoleValue( Student[i] , EM_RoleValue_IsWalk , 1 )
		SetRoleCamp( Student[i] , "SNPC" )
		Show(  Student[i] , RoomID )
		WriteRoleValue( Student[i] ,  EM_RoleValue_Register , i+4 )
	end	
	
	local FlagNum = 4
	local Stage = FlagNum
	local Count = 0 
		
	while 1 do	
		if FlagNum >= 7 and ( CheckID( Player ) == false or ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or GetDistance( Player , Master ) > 500 or CheckAcceptQuest( Player , 422974 ) == false ) then
			if CheckID( Player ) == true then
				if CheckAcceptQuest( Player , 422974 ) == true then
					ScriptMessage( Player , Player , 1 , "[SC_422974_FAILED]" , 0 ) --���ȥ��ѡA�Э��s�A��
					ScriptMessage( Player , Player , 0 , "[SC_422974_FAILED]" , 0 )
				end
				CancelBuff( Player   , 506212)
				Result = "NO"
			end
			break
		end
	
		local X , Y , Z
		local Me = Role:new( Master )
		X = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_X )
		Y = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Y )
		Z = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Z )	
		if ( X-Me:X() ) ^2 + ( Y-Me:Y() ) ^2 + ( Z-Me:Z() ) ^2 < 400 then
			FlagNum = FlagNum + 3
		end

		if FlagNum >= 7 then
			Count = Count + 1
		end
		
		if FlagNum ~= Stage then
			WriteRoleValue( Master , EM_RoleValue_Register , FlagNum )	
			for i = 1 , 2 , 1 do
				WriteRoleValue( Student[i] ,  EM_RoleValue_Register , i+FlagNum )
			end	
			if FlagNum == 7 then
				Show( OwnerID() , RoomID)
			end
			if FlagNum == 10 then
				for i = 1 , 10 , 1 do
					local OrgID = 103303
					if i == 1 then	OrgID = 103302 end
					Bandit[i] = CreateObjByFlag( OrgID , Flag , 15 + i , 1 )
					MoveToflagEnabled( Bandit[i] , false )
					WriteRoleValue( Bandit[i] , EM_RoleValue_Register , 25 + i )
					WriteRoleValue( Bandit[i] , EM_RoleValue_IsWalk , 1 )
					SetRoleCamp( Bandit[i] , "Visitor" )
					AddToPartition( Bandit[i] , RoomID )
					WriteRoleValue( Bandit[i] , EM_RoleValue_Register + 1 , Master )
					AddBuff( Bandit[i] , 500675 , 55 , -1 )
					if OrgID == 103302 then
						SetPlot( Bandit[i] , "dead" , "LuaI_114510_NoDead" , 0 )
						BeginPlot( Bandit[i] , "LuaI_114510_SOB" , 0)
					else
						WriteRoleValue( Bandit[i] , EM_RoleValue_PID , Bandit[1] )
						BeginPlot( Bandit[i] , "LuaI_114510_Bandit" , 0)
					end
				end
			end
			if FlagNum == 13 then	
				Yell( Student[1]  , "[SC_422974_13]" , 3 ) --�Ѯv......
				sleep( 30 )
				ScriptMessage( Player , Player , 0 , "[SC_422974_14]" , 0 ) --[114498]�w�F�w���A�ܷN[114499]�y�w��ļ
				ScriptMessage( Player , Player , 2 , "[SC_422974_14]" , 0 ) --[114498]�w�F�w���A�ܷN[114499]�y�w��ļ
				sleep( 30 )
				Yell( Student[2]  , "[SC_422974_15]" , 3 ) --�ƶq�ٯu�h�C
				sleep( 30 )
				WriteRoleValue( Master , EM_RoleValue_PID , 777 ) 
				Yell( Bandit[3] , "[SC_422974_16]" , 3 ) --�Q�L�̵o�{�F�I
				Yell( Bandit[7] , "[SC_422974_17]" , 3 ) --�j�٨�W�ڡI
				sleep( 20 )
				Yell( Master  , "[SC_422974_18]" , 3 ) --�ӤF��ӤF��
				sleep( 20 )
				Yell( Master  , "[SC_422974_19]" , 3 ) --�������q������a�I
				SetAttack( Master , Bandit[DW_Rand(table.getn(Bandit))] )
				SetAttack( Student[1] , Bandit[DW_Rand(table.getn(Bandit))] )
				SetAttack( Student[2] , Bandit[DW_Rand(table.getn(Bandit))] )
			end
			Stage = FlagNum
		end
		
		if Count == 1 then
			Yell( Student[1]  , "[SC_422974_8]" , 3 ) --�K�Ѯv�A�ڭ̳o�򪽱��S���Y�ܡH
		end
		if Count == 3 then
			Yell( Student[1]  , "[SC_422974_9]" , 3 ) --�������ðΦ��ܡH
		end	
		if Count == 7 then
			Yell( Master  , "[SC_422974_10]" , 3 ) --�ðΦ��ܡH�ݭn�ܡH
		end	
		if Count == 9 then
			Yell( Student[2]  , "[SC_422974_11]" , 3 ) --���ȥL�̥��o��H�H
		end
		if Count == 11 then
			Yell( Master  , "[SC_422974_12]" , 3 ) --�L�̥��X�⪺�ܡA�ڭ̥u�n�����N��ѨM�F�I
		end	
		if FlagNum > 13 and ReadRoleValue( Bandit[1] , EM_RoleValue_PID ) > 0 then
			Lua_CancelAllBuff( Master ) 
			SetStopAttack(Master )
			SetRoleCamp( Master , "Visitor" )
			for i = 1 , 2 , 1 do
				Lua_CancelAllBuff( Student[i] ) 
				SetStopAttack(Student[i] )
				SetRoleCamp( Student[i], "Visitor" )
			end
			PlayMotionEX( Master , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
			Yell( Master  , "[SC_422974_20]" , 3 ) --�x�A���F�@���h���H
			sleep( 30 )
			PlayMotion( Master , ruFUSION_ACTORSTATE_CROUCH_END)
			Yell( Master  , "[SC_422974_21]" , 3 ) --�ڬݬݡA��......��F�W�r......[114501]......
			sleep( 20 )
			AdjustFaceDir( Bandit[1] , Master, 0 )
			AdjustFaceDir( Student[1] , Master, 0 )
			AdjustFaceDir( Student[2] , Master, 0 )
			sleep( 5 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_CROUCH_END) 
			Yell( Bandit[1]   , "[SC_422974_22]" , 3 ) --�O�ΧA�����I���I
			sleep( 10 )
			FaceObj(  Master, Bandit[1]  )
			sleep( 10 )
			Yell( Master  , "[SC_422974_23]" , 3 ) --�ڪ�......���H......[114501]�A�A�O�o����l�H
			sleep( 20 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE) 
			Yell( Bandit[1]   , "[SC_422974_24]" , 3 ) --�A�{�ѧڪ����ˡH
			sleep( 20 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_EMOTE_POINT) 
			Yell( Bandit[1]   , "[SC_422974_25]" , 3 ) --���I�A��o���F����H
			FaceObj(  Student[1], Bandit[1]  )
			FaceObj(  Student[2], Bandit[1]  )
			sleep( 50 )
			Yell( Master  , "[SC_422974_26]" , 3 ) --�ڥΧڪ��R�P�ʦo�A�o�ܾ�ߧA�A�ӡA��ڭ̦^�h�a��
			PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			sleep( 30 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_SHIELD_BASH) 
			Yell( Bandit[1]   , "[SC_422974_27]" , 3 ) --���I�ڬ�����n�۫H�A�H
			sleep( 20 )
			PlayMotion( Master , ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP) 
			Yell( Master   , "[SC_422974_28]" , 3 ) --�����h���A�A�N�˨��P���R���O�q�a�I
			Delobj( Bandit[1] )
			sleep( 30 )
			
			ScriptMessage( Player , Player , 0 , "[SC_422974_29]" , 0 ) --[114498]�N[103302]���w�ᴣ�b��W
			ScriptMessage( Player , Player , 2 , "[SC_422974_29]" , 0 ) --[114498]�N[103302]���w�ᴣ�b��W
			Hide( Master )
			WriteRoleValue( Master , EM_RoleValue_IsWalk , 1 )
			Show( Master , RoomID )
			WriteRoleValue( Master , EM_RoleValue_Register , 4 )
			BeginPlot( Master , "LuaI_114510_FlagMove" , 0)
			sleep( 30 )


			for i = 1 , 2 , 1 do
				Hide(  Student[i] )
				WriteRoleValue( Student[i] , EM_RoleValue_IsWalk , 1 )
				Show(  Student[i] , RoomID )
				WriteRoleValue( Student[i] ,  EM_RoleValue_Register , i+4 )
				BeginPlot( Student[i] , "LuaI_114510_FlagMove" , 0)				
			end	
			
			Yell( Master   , "[SC_422974_30]" , 3 ) --�n�F�I���P�ѨM��i�R���A�̰O�o��W�o��
			PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_WAVE) 
			CancelBuff( Player   , 505457)
			sleep( 100 )
			break
		end	
		if FlagNum > 13 then
			if CheckID( Bandit[1] ) == false or ReadRoleValue( Bandit[1] , EM_RoleValue_OrgID ) ~= 103302 then
				Result = "NO"
				break
			end
		end
		sleep( 10 )
	end
	--���m
	DelObj( Master )
	CancelBuff( Player   , 506212)
	for pry , obj in pairs( Student ) do
		DelObj( obj )
	end
	for pry , obj in pairs( Bandit ) do
		local OrgID = ReadRoleValue( obj , EM_RoleValue_OrgID)
		if CheckID( Obj ) == true and ( OrgID == 103302 or OrgID == 103303 ) then
			DelObj( obj )
		end
	end
	if CheckID( Player ) == true and CheckAcceptQuest( Player , 422974 ) == true and Result == "YES" then
		SetFlag( Player , KeyItem , 1 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114510_FlagMove()
	local Flag = 780535
	local FlagNum 
	local X , Y , Z
	local Helper = {}
	local Time = 10
	local Me = Role:new( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 114498 then
		Helper[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
		Helper[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	else
		Helper[1] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		Helper[2] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	end
	while 1 do
		FlagNum = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
		if FlagNum == 0 or FlagNum > 15 then
			break
		end
		if HateListCount( OwnerID() ) > 0 then
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
				for i = 1 , 2 , 1 do
					if HateListCount( Helper[i] ) == 0 then
						local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
						SetAttack(Helper[i] , AttackTarget )
					end
				end
			end
			sleep( 10 )
		else
			if FlagNum > 3 then
				WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
			end
			X = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_X )
			Y = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Y )
			Z = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Z )
			if ( X-Me:X() ) ^2 + ( Y-Me:Y() ) ^2 + ( Z-Me:Z() ) ^2 > 400 then
				Time = Move( OwnerID() , X , Y , Z )
			else
				Time = 10
			end
			sleep( Time )
		end
	end
end

function LuaI_114510_NoDead()
	return false
end

function LuaI_114510_SOB()
	local Master = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Flag = 780535
	local Result = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Fight = 0 
	local Count = 0
	
	LuaFunc_MoveToFlag( OwnerID() , Flag , Num , 0 )
	
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP ) < ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) * 20 / 100 then
			Result = 1
			break
		end
		if CheckID( Master ) == false then
			break
		end
		if  HateListCount( OwnerID() ) < 1 and Fight == 1 and Count > 30 then
			break
		end
		if ReadRoleValue( Master , EM_RoleValue_PID ) > 0 and Fight == 0 then
			SetRoleCamp( OwnerID() , "Monster" )
			SetAttack( OwnerID() , Master )
			Fight = 1
		end
		sleep( 10 )
		Count = Count + 1	
	end
	if Result == 0 then
		DelObj( OwnerID() )
	else
		Lua_CancelAllBuff( OwnerID() ) 
		SetStopAttack(OwnerID() )
		SetRoleCamp( OwnerID() , "Visitor" )
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 777 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
	end
end

function LuaI_114510_Bandit()
	local Master = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local SOB = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Flag = 780535
	local Result = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Fight = 0 
	local Count = 0
	
	LuaFunc_MoveToFlag( OwnerID() , Flag , Num , 0 )

	while 1 do
		if CheckID( Master ) == false then
			break
		end
		if  CheckID( SOB ) == false then
			break
		end
		if  HateListCount( OwnerID() ) < 1 and Fight == 1 and Count > 30 then
			break
		end
		if ReadRoleValue( SOB , EM_RoleValue_PID ) > 0 then
			Result = 1
			break
		end
		if ReadRoleValue( Master , EM_RoleValue_PID ) > 0 and Fight == 0 then
			SetRoleCamp( OwnerID() , "Monster" )
			SetAttack( OwnerID() , Master )
			Fight = 1
		end
		sleep( 10 )
		Count = Count + 1
	end
	
	if Result == 0 then
		DelObj( OwnerID() )
	else
		Hide( OwnerID() )
		Lua_CancelAllBuff( OwnerID() ) 
		SetStopAttack(OwnerID() )
		SetRoleCamp( OwnerID() , "Visitor" )
		WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 3 )
		Show( OwnerID() , RoomID )
		LuaFunc_MoveToFlag( OwnerID() , Flag , Num + 10 , 0 )
	end
end