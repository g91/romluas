function LuaI_114478_0()

	local Flag = 780557
	local GuestID = {114968,114969,114970,114971,114972}
	local Guest = {}
	local FlagNum = 2
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X , Y , Z , Dir
	
	for pry , obj in pairs(GuestID) do
		X = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_X )
		Y = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_Y )
		Z = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_Z )
		Dir = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_Dir )			
		Guest[FlagNum-1] = CreateObj( obj , X , Y , Z , Dir , 1 )
		WriteRoleValue( Guest[FlagNum-1] , EM_RoleValue_IsWalk , 1 )
		AddToPartition( Guest[FlagNum-1] , RoomID )
--		SetDefIdleMotion( Guest[FlagNum-1]  , ruFUSION_MIME_SIT_CHAIR_LOOP )
--		PlayMotionEX( Guest[FlagNum-1]  , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP	)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + FlagNum -1 , Guest[FlagNum-1] )
		DisableQuest( Guest[FlagNum-1] , true )
		FlagNum = FlagNum + 1
	end	
	
end
function LuaQ_422966_Complete()

	local Buff = 504004
	AddBuff(TargetID() , Buff , 0 , 60 )
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		Tell( TargetID() , OwnerID() , "[SC_422967_0]" ) --����S���Q�ڤS�ӥ��U�F�A���_�ӯu���A�C���L�ӳo�ɳ��|�o�ͨƱ�......
	else
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID() )
		BeginPlot( OwnerID() , "LuaS_422967_Begin" , 0 )
	end
	
	Tell( TargetID() , OwnerID() , "[SC_422967_1]" ) --�p�G�Q���I�~�֡A�N�h��������S���Q�ڧa�I
	
end

function LuaS_422967_Begin()

	local Flag = 780557
	local Mark = CreateObjByFlag( 114507 , Flag , 1 , 1 )
	local Service = CreateObjByFlag( 114506 , Flag , 7 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Guest = {}
		
	for i = 1 , 5 , 1 do
		Guest[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
		MoveToFlagEnabled( Guest[i] , false ) --�������
	end
	
	WriteRoleValue( Mark , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Service , EM_RoleValue_IsWalk , 1 )	
	AddToPartition( Mark , RoomID )
	AddToPartition( Service , RoomID )
	MovetoFlagEnabled( Mark , false )
	MovetoFlagEnabled( Service , false )	
	
	Yell( Mark , "[SC_422967_2]" , 3 ) --�𦺧ڤF�I���M�|���o���۱i���s��A�����N�L�ڦb���Ǭ~�T���H�I
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 20 )
	CallPlot( Service , "LuaS_422967_Move" , 9 )
	LuaFunc_MoveToFlag( Mark , Flag , 8 , 0 )
	sleep( 5 )
	AdjustFaceDir( Mark , Service , 0 )
	sleep( 5 )
	AdjustFaceDir( Service , Mark , 0 )
	Yell( Mark , "[SC_422967_3]" , 3 ) --���ǳf�����M���Ȥ�����A���O�o�@�f���ڥi�]���U�ڡI
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 20 )	
	AdjustFaceDir( Mark , OwnerID() , 0 )	
	AdjustFaceDir( Service , OwnerID() , 0 )
	Yell( Mark , "[SC_422967_4]" , 3 ) --�j�ať�ۡI�p�G���H�i�H�h�����ǵs��@�I�аV�A���ڧ�f�����^�ӡA�ڴN���L�@���׫p������C
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 10 )
	
	for i = 1 , 5 , 1 do
		AdjustFaceDir( Guest[i] , Mark , 0 )
	end
	
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )	
	sleep( 30 )
--	SetDefIdleMotion( Guest[1]  , ruFUSION_MIME_NONE )
--	PlayMotion( Guest[1] , ruFUSION_ACTORSTATE_SIT_CHAIR_END )
	sleep( 20 )
	Move( Guest[1] , GetMoveFlagValue( Flag , 10 , EM_RoleValue_X ) , GetMoveFlagValue( Flag , 10 , EM_RoleValue_Y ) , GetMoveFlagValue( Flag , 10 , EM_RoleValue_Z ) )
	sleep( 10 )
	SetDir( Mark ,GetMoveFlagValue( Flag , 8 , EM_RoleValue_Dir ) )	
	SetDir( Service , GetMoveFlagValue( Flag , 9 , EM_RoleValue_Dir ) )
	Yell( Guest[1] , "[SC_422967_5]" , 3 ) --������ڡI�o�U���T�ܰs���F�I...�СI�p�l�A�A�ˬO�����ݬO���̪��s��H�����A...�СI
	for i = 2 , 5 , 1 do
--		PlayMotion( Guest[i] , ruFUSION_ACTORSTATE_SIT_CHAIR_END )
--		SetDefIdleMotion( Guest[i]  , ruFUSION_MIME_NONE )
		if i == 2 or i == 4 then
			AdjustFaceDir( Guest[i] ,Guest[i+1]  , 0 )	
		else
			AdjustFaceDir( Guest[i] ,Guest[i-1]  , 0 )	
		end
	end
	sleep( 30 )	
	for i = 2 , 5 , 1 do
		PlayMotion( Guest[i] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end	
	sleep( 30 )
	for i = 2 , 5 , 1 do
		if i == 2 or i == 3 then
			AdjustFaceDir( Guest[i] ,Guest[i+2]  , 0 )	
		else
			AdjustFaceDir( Guest[i] ,Guest[i-2]  , 0 )	
		end
		PlayMotion( Guest[i] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end
	sleep( 30 )
	Yell( Mark , "[SC_422967_6]" , 3 ) --�L�̴N�b�~�Y�����s�������ǡA�j�f�f�����b���ǳܰs�C
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	for i = 2 , 5 , 1 do
		AdjustFaceDir( Guest[i] , Mark , 0 )
	end
	sleep( 10 )
	Yell( Guest[4] , "[SC_422967_7]" , 3 ) --�~�Y������...�x�I����...���O....���O���s...���s�S��....�s��Ϊ���U�ܡH
	PlayMotion( Guest[4] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
	sleep( 30 )
	Yell( Guest[1] , "[SC_422967_8]" , 3 ) --���s....���s�S�̰�...�����F�I....�S�차�s�S��...�N�⦳���R�s�A�ȨS�R�ܰ�....��ڭ�褰�򳣨S��...
	AddBuff( Guest[1] , 500235 , 0 , 1 ) 
	sleep( 30 )
	LuaFunc_MoveToFlag( Guest[1] , Flag , 2 , 0 )
	Yell( Mark , "[SC_422967_9]" , 3 ) --��I......�٦��H�@�N���U�o�өe�U�ܡH
	AdjustFaceDir( Mark , OwnerID() , 0 )	
	AdjustFaceDir( Service , OwnerID() , 0 )
	sleep( 10 )
	for i = 1 , 5 , 1 do
		local Dir = GetMoveFlagValue( Flag , i+1 , EM_RoleValue_Dir )
--		if i == 1 then
--			local X = GetMoveFlagValue( Flag , i+1, EM_RoleValue_X )
--			local Y = GetMoveFlagValue( Flag , i+1, EM_RoleValue_Y )
--			local Z = GetMoveFlagValue( Flag , i+1, EM_RoleValue_Z )
--			SetPos(  Guest[i] , X , Y , Z , Dir )
--			sleep( 5 )
--		end
		SetDir( Guest[i] , Dir )
--		PlayMotionEX( Guest[i]  , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP	)
--		SetDefIdleMotion( Guest[i]  , ruFUSION_MIME_SIT_CHAIR_LOOP )
	end	
	sleep( 10 )
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 10 )
	Yell( Mark , "[SC_422967_10]" , 3 ) --�ɡI���s�S�̵s��Φ��o��i�ȶܡH�ݨ�A�̳o�ҼˡA�]���ǥL�̷|�p���۱i�I
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )
	Yell( Mark , "[SC_422967_11]" , 3 ) --�S���Y�I�ڬ۫H�٬O�|�����q�i�����H�X�{�A�ڴN�b�o�s�]���ۡA���ܥD�N�n�����e�U���H�H�ɥi�H�L�ӧ�ڡH

	CallPlot( Service , "LuaS_422967_Move" , 11 )	
	LuaFunc_MoveToFlag( Mark , Flag , 10 , 0 )
	sleep( 5 )
	local Dir = GetMoveFlagValue( Flag , 10 , EM_RoleValue_Dir ) 
	Setdir( Mark , Dir )	
	sleep( 5 )
	SetPlot( Mark , "range" , "LuaS_422967_RangeCancelBuff" , 500 )
	sleep( 10 )
	DelObj( Mark )
	DelObj( Service )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	
end

function LuaS_422967_Move( FlagNum )
	local Flag = 780557 
	LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
	if FlagNum > 9 then
		local Dir = GetMoveFlagValue( Flag , FlagNum  , EM_RoleValue_Dir ) 
		Setdir( OwnerID() , Dir )
	end
end

function LuaS_422967_RangeCancelBuff()
	local Buff = 504004
	CancelBuff( OwnerID() , Buff )
end

function LuaS_114509_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422969 ) == true then
	 	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422969_0]", "LuaS_114509_1", 0 )  --��ť�����M�h���`�N�ƶ�
	end
end

function LuaS_114509_1()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		 	SetSpeakDetail( OwnerID(), "[SC_422969_1]") --�][114509]�w�g�}�l�t���F�^
	else
		CloseSpeak( OwnerID() )
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot( TargetID() , "LuaS_114509_Play" , 0 )
	end
end

function LuaS_114509_Play()
	local Flag = 780558
	local Schoolar = {}
	local Lance = CreateObjByflag( 114913 , Flag , 1 , 1 )
	local Ytrinel = CreateObjByflag( 114914 , Flag , 2 , 1 )
	local John = CreateObjByflag( 114915 , Flag , 3 , 1 )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ball = CreateObjByFlag(114357 , Flag  , 12 , 1 ) --�t�d�����a�X�Ъ�
	Lua_ObjDontTouch( Ball ) 
	WriteRoleValue( Lance , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Ytrinel , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( John , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( Lance , false )
	MoveToFlagEnabled( Ytrinel , false )
	MoveToFlagEnabled( John , false )
	if CheckID( TargetID() ) == true then
		SetPosByFlag( TargetID() , Flag , 12 )
		AddBuff( TargetID() , 503977 , 0 , 180 )
	end
	for i = 1 , 2 , 1 do
		local ID
		if i == 1 then ID = 114916 else ID = 114922 end
		Schoolar[i] = CreateObjByFlag( ID , Flag , 3 + i , 1 )
		WriteRoleValue(  Schoolar[i] , EM_RoleValue_IsWalk , 1 )
		MoveToFlagEnabled( Schoolar[i]  , false ) 
	end
	Yell( OwnerID() , "[SC_422969_2]" , 3 ) --�Ҧ��o���[�J�������M�h�̡A�Ш��t�L�Ӷ��X�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	sleep( 10 )
	for i = 1 , 2 , 1 do
		AddToPartition( Schoolar[i] , RoomID )
		CallPlot( Schoolar[i] , "LuaS_114509_Move" , 5 + i , 0 )
	end
	sleep( 50 )
	AdjustFaceDir(Schoolar[1] , OwnerID()  , 0 )
	AdjustFaceDir(Schoolar[2] , OwnerID()  , 0 )
	sleep( 20 )
	PlayMotion( Schoolar[1] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Schoolar[2] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 30 )
	for i = 1 , 2 , 1 do
		SetIdleMotion( Schoolar[i] ,ruFUSION_MIME_EMOTE_IDLE)
	end
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_422969_3]" , 3 ) --�����M�h�̡A�J��ť�M���F�I�����A�w��j�a�[�J����M�h�ΡA�ڬO�A�̪��M�h�v�d�A�͡E�ͦ]���A�t�d�V�m�j�a�C
	sleep( 30 )
	Yell( OwnerID() , "[SC_422969_4]" , 3 ) --�b����M�h�θ̡A�n�԰O�U�C�X�I...
	sleep( 20 )
	Yell( OwnerID() , "[SC_422969_5]" , 3 ) --�Ĥ@�I�A�M�h�ιΪ��A�j�N�x�����һ����ܭn����A�q�I
	sleep( 20 )
	Yell( OwnerID() , "[SC_422969_6]" , 3 ) --�ĤG�I�A�ƹΪ���Z�g���R�O�]�n����A�q�I
	AddToPartition( Ytrinel , RoomID )
	AddToPartition( John , RoomID )
	AdjustFaceDir( John , OwnerID() ,  0 )
	AdjustFaceDir( Ytrinel , OwnerID() , 0 )
	sleep( 10 )
	CallPlot( Ytrinel , "LuaS_114509_Move" , 8 , 0 )
	CallPlot( John , "LuaS_114509_Move" , 9 , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_422969_7]" , 3 ) --�ĤT�I�A�Ҧ��p�������R�O�A�]�n����A�q�I
	sleep( 20 )
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_NONE)
	sleep( 10 )
	Yell( OwnerID() , "[SC_422969_8]" , 3 ) --�y....�H�W�T�I�A�j�a���b�߸̤����q��X�M�A����n�O�U�ӡI
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	AdjustFaceDir( John , OwnerID() ,  0 )
	AdjustFaceDir( Ytrinel , OwnerID() , 0 )
	sleep( 20 )
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 10 )
	Yell(John , "[SC_422969_9]" , 3 ) --�o���Y�¡A�i�O�|��j�a�~�]����I�ͦѮv��A�������O�H
	sleep( 10 )
	AdjustFaceDir( OwnerID() , John , 0 )
	AdjustFaceDir( Ytrinel , OwnerID() , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_422969_10]" , 3 ) --�u���ܡH�i�O�M�h�v�d���O�Ӧ��M�h�v�d���Ҽ�......�n�{�u�B�Y��......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Yell(John , "[SC_422969_11]" , 3 ) --���ӧA�����ʥh���N���o��
	sleep( 20 )
	Yell( OwnerID() , "[SC_422969_12]" , 3 ) --�I��Ӧn�F�I�y�y��
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	sleep( 30 )
	SetDir( OwnerID() , Dir )
	sleep( 5 )
	Yell( OwnerID() , "[SC_422969_13]" , 3 ) --�U��A�ڥi�R���ǥ̡ͭ�Ч���ڻ����ܳ��ѰO�a�I���ڭ̭��s�}�l��
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	sleep( 30 )	
	Yell( OwnerID() , "[SC_422969_14]" , 3 ) --�b����M�h�θ̡A�u�n�԰O�@�I�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )	
	Yell( OwnerID() , "[SC_422969_15]" , 3 ) --���N�O�Ϊ���ƹΪ����O�D�`�Mħ�i�˪��H�A�p�����̥H�Χڳ��|�n�n�a��j�a�A���U�j�a�A�A�̥u�n���X�����P�īl�A���H���q���}�B�e�i�A�����M�h�η��ۤv���ɪ��a�A�έ��̳��O����ۧA�̪��a�H�A�o�˴N�i�H�F��
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 50 )	
	Yell( OwnerID() , "[SC_422969_16]" , 3 ) --��I���j�a�@�I�ɶ��A�C�C�~�|�A�Τߥh�P������M�h�αa���j�a���ŷx�a�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_THREATEN )
	sleep( 20 )	
	AdjustFaceDir( Ytrinel , John , 0 )
	sleep( 10 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Ytrinel , "[SC_422969_17]" , 3 ) --�����A�A�i�D�ͭn�Y�¡A�u�O�Q�ݥL�������ˤl�a�H
	sleep( 10 )
	AdjustFaceDir(  John , Ytrinel ,0 )
	AdjustFaceDir( OwnerID() , John , 0 )
	sleep( 10 )
	PlayMotion( John  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( John , "[SC_422969_18]" , 3 ) --�����A�ګ��|�o�˷Q�O�H�o�i�O�ڸ�ͼW�i�P�����覡�O�I
	sleep( 30 )
	PlayMotion( OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( Ytrinel , "[SC_422969_19]" , 3 ) --�ׯ�O�A�A�T��O�ӥi�ت��H�A�����A���O�p�G������ܧA�����@�������A�סA�A�|�����@�ӧ󦳹�O���H���C
	sleep( 30 )
	PlayMotion( John  , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	AdjustFaceDir( OwnerID() , Ytrinel , 0 )
	Yell( John , "[SC_422969_20]" , 3 ) --�N��ڪ���O�A���n�A�]�񤣤W�ƹΪ��p�A���\�O�Q�L�٬��u�K�����v���H�O�I
	sleep( 30 )
	AddToPartition( Lance , RoomID )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Ytrinel , "[SC_422969_21]" , 3 ) --���ݭn��A���M�ᨥ���y�Φb�ڨ��W�A�����A��߫��b�{�u���ƤW�a�I
	sleep( 30 )
	LuaFunc_MoveToFlag( Lance , Flag , 10 , 0 )
	Yell( Lance , "[SC_422969_22]" , 3 ) --�o�ǤH�O....�H
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	AdjustFaceDir( OwnerID() , Lance , 0 )	
	AdjustFaceDir( Ytrinel , Lance , 0 )	
	AdjustFaceDir( John , Lance , 0 )	
	sleep( 10 )
	AdjustFaceDir( Lance , Ytrinel , 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SALUTE )	
	sleep( 20 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Ytrinel , "[SC_422969_23]" , 3 ) --�o�O�ͩұ��ˡA��[�J�������M�h�̡C
	sleep( 10 )	
	for i = 1 , 2 , 1 do
		PlayMotion( Schoolar[i] ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	end
	AdjustFaceDir( Lance , Ball  , 0 )
	sleep( 10 )
	Yell( Lance , "[SC_422969_24]" , 3 ) --�̪񪺨����M�h���G���I�h......
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	AdjustFaceDir( Lance , Ytrinel , 0 )
	Yell( Lance , "[SC_422969_25]" , 3 ) --���L�J�M�O�ͩұ��ˡA�S����Z�g�p���a��A�ڤ���ߡC
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	AdjustFaceDir( Lance , Ball  , 0 )
	AdjustFaceDir( Ytrinel , Ball, 0 )	
	AdjustFaceDir( John , Ball , 0)	
	SetDir( OwnerID() , Dir )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Lance , "[SC_422969_26]" , 3 ) --�����M�h�̡A���X��O���ҩ��A�̦ۤv�a�I....�Ʊ�U�����춥�M�h���ʨ�§�W�A�٬ݱo��A�̡C
	sleep( 30 )
	LuaFunc_MoveToFlag( Lance , Flag , 11 , 0 )
	sleep( 10 )
	AdjustFaceDir( Lance , Ytrinel , 0 )	
	AdjustFaceDir( OwnerID() , Ytrinel , 0 )	
	AdjustFaceDir( Ytrinel , Lance , 0 )	
	AdjustFaceDir( John , Ytrinel , 0 )	
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	Yell( Lance , "[SC_422969_27]" , 3 ) --�H�p���V����ɤ~��A���L�̧֨Ǹ�W�M�h�Ϊ��}�B�a�C
	sleep( 20 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Yell( Ytrinel , "[SC_422969_28]" , 3 ) --�O...�O���A�ڷ|�V�O�C
	sleep( 20 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 30 )
	CallPlot( Lance , "LuaS_114509_Move" , 1 , 1 )
	sleep( 20 )
	CallPlot( Ytrinel , "LuaS_114509_Move" , 2 , 1 )
	CallPlot( John , "LuaS_114509_Move" , 3 , 1 )
	sleep( 20 )
	SetDir( OwnerID() , Dir )
	sleep( 10 )	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	for i = 1 , 2 , 1 do
		CallPlot( Schoolar[i] , "LuaS_114509_Move" , 3 + i , 1 )
	end
	AddToPartition( Ball,RoomID )
	SetPlot( Ball , "Range" , "LuaS_114509_Range" , 300 )
	sleep( 10 )
	DelObj( Ball )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_114509_Move( FlagNum , State )
	local Flag = 780558
	LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
	if State == 1 then
		Delobj( OwnerID() )
	end
end

function LuaS_114509_Range()
	local Flag = 543749
	CancelBuff_NoEvent( OwnerID() , 503977 )
	if CheckAcceptQuest( OwnerID() , 422969 ) == true then
		SetFlag( OwnerID() , Flag , 1 )
	end
end
--�n�b�j�N�x�������W����ܼ@���[�ﶵ
function LuaS_422990_1()
	CloseSpeak( OwnerID() )
	local Buff = 506186-- client �@���ˬd��
	AddBuff( OwnerID() , Buff , 0 , 180 )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422990_1]" , 0 ) --��D��|ĳ�w�g�}�l�F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422990_1]" , 0 ) --��D��|ĳ�w�g�}�l�F
	else
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID())
		BeginPlot( TargetID() , "LuaS_422990_Play" , 0 )
	end
end

function LuaQ_422990_Accept()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422990_1]" , 0 ) --��D��|ĳ�w�g�}�l�F
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422990_1]" , 0 ) --��D��|ĳ�w�g�}�l�F
	end
end
--�w���b���a�W�شӥ� client script ���ê��Q�ڡB�Q���@�åH�ΥK�k
function LuaS_422990_Play()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780559
	local Lance = CreateObjByFlag( 114911 , Flag , 1 , 1 )
	local Douny = CreateObjByFlag( 114742 , Flag , 5 , 1 )
	local Ytrinel = CreateObjByFlag( 114912 , Flag , 6 , 1 )
	local Gavy = CreateObjByFlag( 114743 , Flag , 4 , 1 )
	local Guard = {}
	
	WriteRoleValue( Lance , EM_RoleValue_Register+1 , 0 )	
	for i = 1 , 2 , 1 do
		Guard[i] = CreateObjByFlag( 114959 , Flag , 4+i , 1 )
		WriteRoleValue( Guard[i] , EM_RoleValue_IsWalk , 1 )
	end
	
	Lua_Drama_Radar( Lance , 422990 )
	Lua_Drama_Radar( Ytrinel , 422990 )	
	--Hide( OwnerID() )
	WriteRoleValue( Lance , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Gavy , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Douny , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Ytrinel , EM_RoleValue_IsWalk , 1 )
	AddToPartition( Lance , RoomID )
--	SetDefIdleMotion( Douny, ruFUSION_MIME_EMOTE_SPEAK)
--	SetDefIdleMotion( Ytrinel, ruFUSION_MIME_EMOTE_SPEAK)
	MoveToFlagEnabled( Lance , false )
	MoveToFlagEnabled( Douny , false )
	MoveToFlagEnabled( Ytrinel , false )
	
	AddToPartition( Douny , RoomID )
	AddToPartition( Ytrinel , RoomID )
	sleep( 10 )
	Yell( Douny , "[SC_422990_13]" , 3 ) --��D��|ĳ�N�n�}�l�A��{�b�٨S���b�ӻ�D�X�u�A�o�U�i�V�|�F�I
	sleep( 20 )
	Yell( Ytrinel , "[SC_422990_14]" , 3 ) --�O�W�i�A����o��Ʊ��V�����Ϊ����i�C	
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	CallPlot( Ytrinel , "LuaS_422990_MoveFlag" , 3 , 0 )
	LuaFunc_MoveToFlag( Douny , Flag , 2 , 0 )
	LuaFunc_MoveToFlag( Lance , Flag , 8 , 0 )
	if Lua_Check_Drama_Statu( Lance ) == false and Lua_Check_Drama_Statu( Ytrinel ) == false then
		SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
		sleep( 10 )
		Delobj( Ytrinel )
		Delobj( Douny )
		Delobj( Lance )
		Delobj( Gavy )
		Delobj( Guard[1] )
		Delobj( Guard[2] )
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	sleep( 10 )
	AdjustFaceDir( Lance , Douny, 0 )
	AdjustFaceDir(  Douny, Lance ,  0 )
	AdjustFaceDir(  Ytrinel, Lance ,  0 )
	sleep( 10 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 15 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 15 )	
	Yell( Lance , "[SC_422990_2]" , 3 ) --[114742]�A�o�O���^�ơH
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Douny , "[SC_422990_3]" , 3 ) --�j....�N�x....���ܪ���D��....��ثe����...���S�H�X�u....
	sleep( 10 )
	AdjustFaceDir(   Lance , Ytrinel, 0 )
	sleep( 10 )
	Yell( Lance , "[SC_422990_4]" , 3 ) --��ΩO�H�s��γ��S���H�ӡH
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 10 )
	AdjustFaceDir( Lance , Douny, 0 )
	sleep( 10 )
	if Lua_Check_Drama_Statu( Lance ) == false and Lua_Check_Drama_Statu( Ytrinel ) == false then
		SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
		sleep( 10 )
		Delobj( Ytrinel )
		Delobj( Douny )
		Delobj( Lance )
		Delobj( Gavy )
		Delobj( Guard[1] )
		Delobj( Guard[2] )
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	AddToPartition( Gavy , RoomID )
	MovetoFlagEnabled( Gavy , false )
	for i = 1 , 2 , 1 do
		AddToPartition( Guard[i] , RoomID )
		MovetoFlagEnabled( Guard[i]  , false )
	end
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Douny , "[SC_422990_5]" , 3 ) --�O...�O��...
	sleep( 10 )
	Yell( Gavy , "[SC_422990_6]" , 3 ) --�@�@�A�o�O���򪬪p�A��D��|ĳ�A���M�S���b�ӻ�D�X�u�I
	for i = 1 , 2 , 1 do
		CallPlot( Guard[i]  , "LuaS_422990_MoveFlag" , 9+i , 0 )
	end
	LuaFunc_MoveToFlag( Gavy , Flag , 9 , 0 )
	AdjustFaceDir(  Douny, Lance ,  0 )
	AdjustFaceDir(  Ytrinel, Lance ,  0 )
	AdjustFaceDir(  Lance , Gavy , 0 )
	sleep( 10 )
	AdjustFaceDir(  Gavy, Lance ,  0 ) 
	sleep( 10 )
	Yell( Gavy , "[SC_422990_7]" , 3 )--�A���ӫD�`���լ���|�p���a�A�j��N��x��
	PlayMotion( Gavy , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	Yell( Lance , "[SC_422990_8]" , 3 )--�ڷ|���H�h��ΰݩ��խ�]�C
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	sleep( 20 )	
	Yell( Gavy , "[SC_422990_9]" , 3 )--�ٻݭn�ݶܡH�o�@�����O�]���A�z�w���ǹB�@�A���H�����«H���M�L�s�A�~�|�s���j��D��A�ƦܬO��ΡA�����@�N�X�u��D��|ĳ�I
	PlayMotion( Gavy , ruFUSION_ACTORSTATE_EMOTE_POINT )
	for i = 1 , 2 , 1 do
		PlayMotion( Guard[i] , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	end
	sleep( 10 )
	Yell( Lance , "[SC_422990_10]" , 3 )--......
	sleep( 10 )
	Yell( Ytrinel , "[SC_422990_11]" , 3 )--�N�Ұ���h�A�A�~�|�����j�N�x�F�I�L���O���F����.....
	PlayMotion( Ytrinel  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 10 )	
	AdjustFaceDir(  Douny, Ytrinel ,  0 )
	AdjustFaceDir(  Gavy , Ytrinel, 0 )
	AdjustFaceDir(  Lance , Ytrinel , 0 )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	AdjustFaceDir(  Douny, Lance ,  0 )
	AdjustFaceDir(  Ytrinel , Lance, 0 )
	AdjustFaceDir(  Lance , Gavy , 0 )
	Yell( Gavy , "[SC_422990_12]" , 3 )--��I�����A���M�ڲ{�b�٧䤣��A�Ѯ`�����A�X���ܨ����v���ҾڡA���@�ѡA�ڤ@�w�|���S�A������������C
	sleep( 20 )
	for i = 1 , 2 , 1 do
		CallPlot( Guard[i]  , "LuaS_422990_MoveFlag" , 4+i , 1 )
	end
	LuaFunc_MoveToFlag( Gavy , Flag , 4 , 0 )
	Delobj( Gavy )
	if Lua_Check_Drama_Statu( Lance ) == false and Lua_Check_Drama_Statu( Ytrinel ) == false then
		SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
		sleep( 10 )
		Delobj( Ytrinel )
		Delobj( Douny )
		Delobj( Lance )
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	sleep( 10 )
	AdjustFaceDir(  Lance , Ytrinel , 0 )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 20 )
	CallPlot( Ytrinel  , "LuaS_422990_MoveFlag" , 5 , 1 )
	CallPlot( Douny  , "LuaS_422990_MoveFlag" , 6 , 1 )
	LuaFunc_MoveToFlag( Lance , Flag , 12 , 0 )
	sleep( 10 )
	local Dir = GetMoveFlagValue( Flag , 12 , EM_RoleValue_Dir )
	SetDir( Lance , Dir )
	WriteRoleValue( Lance , EM_RoleValue_Register+1 , 777 )
	SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
	sleep( 10 )
	Delobj( Lance )
	Show( OwnerID() , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422990_MoveFlag( FlagNum , Del)
	local Flag = 780559
	if Del == 1 then
		Sleep( 30 )
	end
	LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
	if Del == 1 then
		DelObj( OwnerID() )
	end
end

function LuaS_422990_Range()
	local KeyItem = 543750
	CancelBuff_NoEvent( OwnerID() , 506186 )
	if CheckAcceptQuest( OwnerID() , 422990 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) > 0 then
		SetFlag( OwnerID() , KeyItem , 1 )
	end
end

--�n�b�Ǵ����J���Ҩ��W����ܼ@���[�ﶵ
function LuaS_422993_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422993_1]" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422993_1]" , 0 ) 
	else
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID())
		BeginPlot( TargetID() , "LuaS_422993_Play" , 0 )
	end
end

function LuaS_422993_Play()
	local Flag = 780575
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local NPC_ID = {114676,114677,114678,114679}
	local Obj , Obj2
	local OrgDir , OrgDir2
	local Jazz = CreateObjbyObj( 114675 , OwnerID()  )
	local Player =ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	Hide( OwnerID() )
	Hide( Jazz)
	WriteRoleValue( Jazz , EM_RoleValue_IsWalk , 1 )
	Show( Jazz , RoomID )
	MoveToflagEnabled( Jazz , false )
	Lua_Drama_Radar( Jazz , 422993 )
	LuaFunc_MoveToFlag( Jazz , Flag , 1 , 0 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	Obj = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[1] , 100 )
	OrgDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	sleep( 5 )
	AdjustFaceDir(  Jazz, Obj ,  0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	Yell( Jazz , "[SC_422993_2]" , 3 ) --�����A�o��O�q�F�ԥ������Ӧ�Ϊ��ϸ`�A�O�ڪ��B�͡A��Ө쥬�ԧ��@�ȡC
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 15 )
	AdjustFaceDir(  Jazz , Player , 0 )
	sleep( 5 )
	AdjustFaceDir(  Obj , Player , 0 )	
	sleep( 5 )
	Yell(  Obj , "[SC_422993_3]" , 3 ) --�w����w���z���B�ʹN�O�ڭ̥��ԧ����B�͡A���n�N��S������F��n�۫ݡA������ݭn�������A�бz�ȥ��i�D�ڡC
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )	
	sleep( 25 )
	AdjustFaceDir(  Jazz, Obj ,  0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep( 20 )
	Yell( Jazz , "[SC_422993_4]" , 3 ) --���~��a�ϸ`�h�}�}�A���I�A�^�ӧ�z��ѡC
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	Yell(  Obj, "[SC_422993_5]" , 3 ) --������n�A�S���D�I
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	sleep( 20 )
	SetDir( Obj , OrgDir )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	LuaFunc_MoveToFlag( Jazz , Flag , 2 , 0 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	Obj = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[2] , 300 )
	OrgDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	sleep( 5 )
	AdjustFaceDir( Obj , Jazz, 0 )
	sleep( 5 )	
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )	
	Yell( Obj , "[SC_422993_6]" , 3 ) --�ֹL�ӡI�Ǵ��p�l�C
	sleep( 10 )
	Yell( Jazz , "[SC_422993_7]" , 3 ) --�ڨӤF�C
	LuaFunc_MoveToFlag( Jazz , Flag , 3 , 0 ) 
	sleep( 5 )
	AdjustFaceDir(  Jazz, Obj , 0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	Yell( Obj , "[SC_422993_8]" , 3 ) --�|�|�ڭ��C�n���s�A���D�٦n�ܡH
	sleep( 20 )
	PlayMotion( jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( jazz , "[SC_422993_9]" , 3 ) --�n�ܡI�ݨӫݷ|�઺�E�|�i�H�Z���@�f�F�I
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_LAUGH )	
	Yell( Obj , "[SC_422993_10]" , 3 ) --��������.....�x�H�o��O�H
	sleep( 15 )
	AdjustFaceDir(  Jazz, Player , 0 )
	AdjustFaceDir(  Obj , Player , 0 )
	sleep( 5 )
	PlayMotion( jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	Yell( jazz , "[SC_422993_11]" , 3 ) --�o�O�q�F�ԥ������Ӧ�Ϊ��̡A�o��O�起�ؤҤH�C
	sleep( 20 )
	PlayMotion( Obj, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	Yell( Obj , "[SC_422993_12]" , 3 ) --�w���ݷ|��@�_�Ӱѥ[�E�|�a�I
	sleep( 15 )
	AdjustFaceDir(  Jazz, Obj , 0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	Yell( Jazz , "[SC_422993_13]" , 3 ) --�ڷ|�a�L�L�Ӫ��A�������A���~��a�ϸ`�h�}�}�C
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_LAUGH )	
	Yell( Obj , "[SC_422993_14]" , 3 ) --�n�A���ݷ|�ਣ�o�I������
	sleep( 10 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	LuaFunc_MoveToFlag( Jazz , Flag , 4 , 0 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	SetDir( Obj , OrgDir )
	Obj = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[3] , 100 )
	Obj2 = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[4] , 100 )
	OrgDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	OrgDir2 = ReadRoleValue( Obj2 , EM_RoleValue_Dir )
	sleep( 5 )
	AdjustFaceDir(  Obj , Jazz , 0 )
	AdjustFaceDir( Obj2 , Jazz , 0 )
	sleep( 5 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )	
	Yell( Obj , "[SC_422993_15]" , 3 ) --[114675]��D�A��w�C
	sleep( 10 )
	Yell( Jazz , "[SC_422993_16]" , 3 ) --�K�I���L�ܦh���F�A����٦b�s�ڻ�D�H
	LuaFunc_MoveToFlag( Jazz , Flag , 5 , 0 )
	sleep( 5 )
	AdjustFaceDir(  Jazz , Obj ,0 )
	AdjustFaceDir(  Obj , Jazz , 0 )
	AdjustFaceDir(  Obj2 , Jazz , 0 )
	sleep( 5 )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_SALUTE )	
	Yell(Obj2 , "[SC_422993_17]" , 3 ) --�b�ڭ̤ߤ��A�A�û��O��Ϊ���D�A�u���A��O�@�ڭ̡A�a��ڭ̡C
	AdjustFaceDir(  Jazz , Obj2 ,0 )
	sleep( 20 )	
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	
	Yell( Jazz , "[SC_422993_18]" , 3 ) --�ڨS���A�̻�������n�C
	sleep( 20 )	
	AdjustFaceDir(  Jazz , Obj ,0 )
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_POINT )	
	Yell( Jazz , "[SC_422993_19]" , 3 ) --��診�Y�L�ڪ��s��A�٦���������H�ܡH
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( Obj , "[SC_422993_20]" , 3 ) --�ȮɨS���C
	AdjustFaceDir(  Jazz , Obj ,0 )
	sleep( 20 )	
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( Jazz , "[SC_422993_21]" , 3 ) --��A�~����ӧڧi�D�A�̪��覡���áC
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Yell( Obj , "[SC_422993_22]" , 3 ) --�O�A�Ǵ���D�I
	sleep( 20 )		
	Yell( Jazz , "[SC_422993_23]" , 3 ) --�A....�u�O���C
	sleep( 20 )
	AdjustFaceDir(  Obj2 , Player , 0 )
	Yell( obj2 , "[SC_422993_24]" , 3 ) --�o��O....�H
	sleep( 5 )
	AdjustFaceDir(  Jazz , Player , 0 )
	AdjustFaceDir(  Obj2 , Player , 0 )
	sleep( 10 )
	Yell( Jazz , "[SC_422993_25]" , 3 ) --�o��O�ڪ��B�͡A�q�F�ԥ������Ӧ�Ϊ��ϸ`�C
	AdjustFaceDir(  Obj , Player , 0 )
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	Yell( Obj2 , "[SC_422993_26]" , 3 ) --�w��A�Ө쥬�ԧ��A�Ǵ����B�ʹN�O�ڭ̪��B�͡A�ݷ|��@�_�ӳܰs�g�w�a�I
	sleep( 15 )
	AdjustFaceDir(  Jazz , Obj2 ,0 )
	sleep( 5 )
	Yell( Jazz , "[SC_422993_27]" , 3 ) --�ڷ|�a�L�L�Ӫ��C
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	sleep( 10 )
	AdjustFaceDir(  Obj , Jazz , 0 )
	AdjustFaceDir(  Obj2 , Jazz , 0 )
	sleep( 10 )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( Obj2 , "[SC_422993_28]" , 3 ) --���ݷ|�ਣ�o�I
	sleep( 20 )
	AdjustFaceDir(  Jazz , Player , 0 )
	Yell( Jazz , "[SC_422993_29]" , 3 ) --�ڭ̦^�h�a�C
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 10 )
	SetDir( Obj , OrgDir )
	SetDir( Obj2 , OrgDir2 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	LuaFunc_MoveToFlag( Jazz , Flag , 6 , 0 )
	sleep( 5 )
	SetDir( Jazz ,Dir )
	sleep( 5 )
	SetPlot( Jazz , "range" , "LuaS_422993_Range" , 300 )
	sleep( 10 )
	DelObj( Jazz)
	Show( OwnerID() , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422993_Range()
	local KeyItem = 543751
	if CheckAcceptQuest( OwnerID() , 422993 ) == true then
		SetFlag( OwnerID() , KeyItem , 1)
	end
end

function LuaI_114700_0_A()
	sleep( 30 )
	local Flag = 780576
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Owl = CreateObjByFlag( 114701 , Flag , 1 , 1 )
	local Wall = LuaFunc_SearchRoomNPCbyOrgID( OwnerID() , 114771 )
	local Queen = CreateObjByFlag( 103304, Flag , 2 , 1 )
	local Guard = {}
	local ChangeBuff  = 506187--���m���ܨ�buff	
	
	for i = 1 , 4 , 1 do
		Guard[i] = CreateObjByFlag( 103305 , Flag , 5+i , 1 )
		AddToPartition( Guard[i] , RoomID )
		SetRoleCamp(Guard[i] , "Visitor" )
		SetIdleMotion( Guard[i] , ruFUSION_MIME_EMOTE_IDLE )
	end
	
	AddToPartition( Queen , RoomID )
	SetRoleCamp( Queen , "Visitor" )
	AddBuff( Queen , ChangeBuff , 0 , -1 )

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , Wall )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+8 , Queen )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7 , Guard[4] )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6 , Guard[3] )	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , Guard[2] )	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Guard[1] )	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Owl )
	AddToPartition( Owl , RoomID )
	SetPlot( OwnerID() , "range" , "LuaI_114700_1" , 100 )
	sleep(30)
	SetIdleMotion( Queen , ruFUSION_MIME_SIT_CHAIR_LOOP )
end

function LuaS_114700_0_A()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423009 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423009_0]", "LuaS_114700_1_A", 0 ) --�X�o�a�I
	end
end

function LuaS_114700_1_A()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage ( OwnerID()  ,  OwnerID()  , 1 , "[SC_423009_1]" , 0 ) --[114700]�w�g���@�B�X�o�F�C
		ScriptMessage ( OwnerID()  ,  OwnerID()  , 0 , "[SC_423009_1]" , 0 )
	else
		BeginPlot( TargetID() , "LuaQ_423009_PLAY" , 0 )
	end
end

function LuaQ_423009_Accept()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage ( TargetID()  ,  TargetID()  , 1 , "[SC_423009_1]" , 0 ) --[114700]�w�g���@�B�X�o�F�C
		ScriptMessage ( TargetID()  ,  TargetID()  , 0 , "[SC_423009_1]" , 0 )
	else
		BeginPlot( OwnerID() , "LuaQ_423009_PLAY" , 0 )
	end
end

function LuaQ_423009_PLAY()
	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID() )	
	local Wall = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Owl = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Midnight = CreateObjByObj( 103442 , OwnerID() )
	local Flag = 780576
	local Owl_2 = CreateObjByFlag( 103443, Flag , 1 , 1 )
	local Queen = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 )
	local Rowl = CreateObjByFlag( 103441 , Flag , 3 , 1 )
	local Gino = CreateObjByFlag( 103440 , Flag , 4 , 1 )
	local Jazz = CreateObjByFlag( 103306 , Flag , 5 , 1 )
	local Guard = {}
	local ChangeBuff  = 506187--���m���ܨ�buff
	local Magic  = 492668 --���m�H�Τh�L�ܨ����S��
	local Zone , Room , X , Y , Z , Dir = 15 , 0 , -9440 , -160 , 11473 , 295 --�n�ǰe�L�h����m
	local NoAttackBuff = 502550
	local ArgoBuff = 506189
	local Area = 1 --�ȩw
	local KeyItem = 543740
	local TimeOver = 0
	WriteRoleValue( Midnight , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Owl_2 , EM_RoleValue_IsWalk , 1 )	
	
	Hide( Owl )
	Hide( OwnerID() )
	AddToPartition( Owl_2 , RoomID )
	AddToPartition( Midnight , RoomID )	

	SetPlot( Owl_2 , "dead" , "LuaQ_423009_dead" , 0 )
	SetPlot( Midnight , "dead" , "LuaQ_423009_dead" , 0 )
	AddBuff( Owl_2 , 506276 , 0 , -1 )
	AddBuff( Midnight , 506275 , 0 , -1 )
	MoveToFlagEnabled( Owl_2 , false )
	MoveToFlagEnabled( Midnight , false )
	SetRoleCamp( Owl_2 , "Visitor" )
	SetRoleCamp( Midnight , "Visitor" )	
		
	if CheckID( Wall ) == true then
		SetModeEX( Wall , EM_SetModeType_Obstruct , false)
	end
	
	for i = 1 , 4 , 1 do
		Guard[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3+i )
		if CheckID( Guard[i] ) == false then 
			Guard[i] = CreateObjByFlag( 103305 , Flag , 5+i , 1 )
			AddToPartition( Guard[i] , RoomID )
			SetRoleCamp(Guard[i] , "Visitor" )
			SetIdleMotion( Guard[i] , ruFUSION_MIME_EMOTE_IDLE )
		end
	end

	if CheckID( Queen ) == false then
		Queen = CreateObjByFlag( 103304, Flag , 2 , 1 )
		AddToPartition( Queen , RoomID )
		SetRoleCamp( Queen , "Visitor" )
		AddBuff( Queen , ChangeBuff , 0 , -1 )
		sleep( 30 )
		SetIdleMotion( Queen , ruFUSION_MIME_SIT_CHAIR_LOOP )
	end

	CallPlot( Owl_2 , "LuaQ_423009_Move" , 10 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 11 , 0 )
	AdjustFaceDir(  Guard[1] , Owl_2 , 0 )
	AdjustFaceDir(  Guard[2] , Owl_2 , 0 )
	sleep( 5 )
	AdjustFaceDir(  Guard[1] , Guard[2] , 0 )
	AdjustFaceDir(  Guard[2] , Guard[1] , 0 )
	sleep( 10 )
	CallPlot( Owl_2 , "LuaQ_423009_Move" , 12 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 13 , 0 )	
	Yell( Guard[1] , "[SC_423009_2]" , 3 ) --���M���o�򰪤j���ͤk�H
	sleep( 20 )
	Yell( Guard[2] , "[SC_423009_3]" , 3 ) --�A�u��§�A�����O�ܺ}�G���k�ʡA�ר�O���v������A²���O����ڡ�
	sleep( 10 )
	AdjustFaceDir(Owl_2 ,  Guard[2] , 0 )
	sleep( 10 )
	ScriptMessage( Midnight ,  0 , 2 , "[SC_423009_4]" , 0 ) --[103442]���C���q���n�a��...
	ScriptMessage( Midnight ,  0 , 0 , "[SC_423009_4]" , 0 ) --[103442]���C���q���n�a��...
	Yell( Midnight , "[SC_423009_5]" , 2 ) --�O�B�O�İʡA�o�̬O�Ǵ�����a�C
	sleep( 20 )
	ScriptMessage( Owl_2 ,  0 , 2 , "[SC_423009_6]" , 0 ) --[103443]�׼L�A�j�j�P�}���򪺮��Y
	ScriptMessage( Owl_2 ,  0 , 0 , "[SC_423009_6]" , 0 ) --[103443]�׼L�A�j�j�P�}���򪺮��Y
	AdjustFaceDir(Owl_2 ,  Guard[3] , 0 )
	sleep( 10 )
	Yell( Midnight , "[SC_423009_7]" , 2 ) --�I��
	CallPlot( Owl_2 , "LuaQ_423009_Move" , 14 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 15 , 0 )	
	AdjustFaceDir(  Guard[3] , Owl_2 , 0 )
	AdjustFaceDir(  Guard[4] , Midnight , 0 )
	sleep( 10 )	
	Yell( Guard[3] , "[SC_423009_8]" , 3 ) --�x�H�ڨS���L�o�X��I
	FaceObj( Owl_2 , Guard[3] )
	sleep( 20 )
	SetDefIdleMotion( Guard[3] , ruFUSION_MIME_IDLE_COMBAT_2H )
	SetDefIdleMotion( Guard[4] , ruFUSION_MIME_IDLE_COMBAT_2H )
	Yell( Guard[4] , "[SC_423009_9]" , 3 ) --�j�x�I�������_
	PlayMotion( Owl_2 , ruFUSION_ACTORSTATE_ATTACK_1H_SP )
	sleep( 10 )
	PlayMotionEX( Guard[3] , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD )
	AdjustFaceDir(  Guard[4] , Owl_2 , 0 )
	FaceObj( Owl_2 , Guard[4] )
	sleep( 10 )
	PlayMotion( Owl_2 , ruFUSION_ACTORSTATE_SP_SPINKICK )
	sleep( 10 )
	PlayMotionEX( Guard[4] , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD )
	sleep( 10 )
	Yell( Midnight , "[SC_423009_10]" , 2 ) --�u�A�o��H�u�O��
	PlayMotion( Midnight , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 20 )
	Yell( Owl_2 , "[SC_423009_11]" , 2 ) --�ɡA�ڧԫܤ[�F...
	CallPlot( Owl_2 , "LuaQ_423009_Move" , 16 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 17 , 0 )	
	sleep( 10 )
	Yell( Midnight , "[SC_423009_12]" , 3 ) --�S�Q��u���o�بơA�|���ʪ��u����v����[103304]���m�C	
	CallPlot( Guard[1] , "LuaQ_423009_Move" , 1, 1 )
	CallPlot( Guard[2] , "LuaQ_423009_Move" , 1, 1 )
	PlayMotion( Midnight , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE	)
	sleep( 20 )
	Yell( Queen , "[SC_423009_13]" , 3 ) --��I���������ߡA�A�̪��U���u���@�ӡI
	sleep( 20 )
	SetIdleMotion( Queen , ruFUSION_MIME_NONE )	
	CastSpell( Queen ,Queen ,Magic )
	CancelBuff( Queen , ChangeBuff )
	CancelBuff( Owl_2 , 506276 )
	CancelBuff( Midnight , 506275 )
	SetRoleCamp( Queen , "Monster" )
	--SetRoleCamp( Midnight , "SNPC" )
	SetRoleCamp( Owl_2 , "SNPC" )
	if CheckID( TargetID() ) == true then
		SetAttack( Queen , TargetID() )
	end
	--SetAttack( Midnight , Queen )
	SetAttack( Owl_2 , Queen )
	local result = 0
	for i = 1 , 240 , 1 do
		local Check = 0
		if CheckID( TargetID() ) == true and ReadRoleValue( Queen , EM_RoleValue_IsPlayer ) ~= 1 then
			SetAttack( Queen , TargetID() )
		end
		for i = 1 , HateListCount(Queen ) , 1 do
			local ID = HateListInfo(Queen ,i-1 , EM_HateListInfoType_GItemID )
			if ReadRoleValue( ID , EM_RoleValue_IsPlayer ) == 1 then
				Check = 1
			end
		end
		if CheckID( Queen ) == false or ReadRoleValue( Queen , EM_RoleValue_IsDead ) == 1 then
			result = 1
			break
		end
		if Check == 0 and result == 0 and i > 60  then
			break
		end
		if i == 240 then
			TimeOver = 1
		end
		sleep( 10 )	
	end
	if result == 1 then
		TimeOver = 0
		WriteRoleValue( Rowl , EM_RoleValue_IsWalk ,0 )
		WriteRoleValue( Gino , EM_RoleValue_IsWalk ,0 )
		AddToPartition( Rowl , RoomID )
		AddToPartition( Gino , RoomID )
		MoveToFlagEnabled( Rowl , false )
		MoveToFlagEnabled( Gino , false )
		SetPlot( Rowl , "dead" , "LuaQ_423009_dead" , 0 )
		SetPlot( Gino , "dead" , "LuaQ_423009_dead" , 0 )
		Yell(Rowl , "[SC_423009_14]" , 3 ) --���ˤj�H�I
		Yell(Gino , "[SC_423009_15]" , 3 ) --�o�ͤ���ƤF�H
		FaceObj( Rowl , Queen )
		FaceObj( Gino , Queen )
		SetFightMode( Rowl , 0 , 0 , 0 , 1 )
		SetFightMode( Gino , 0 , 0 , 0 , 1 )
		ScriptMessage( Owl_2 , -1 , 2 , "[SC_423009_16]" , 0 ) --�������a�ڪ�����I�S���Y�A���٦��Ⱖ�i�H��I�A�̡�
		ScriptMessage( Owl_2 , -1 , 0 , "[SC_423009_16]" , 0 ) --�������a�ڪ�����I�S���Y�A���٦��Ⱖ�i�H��I�A�̡�
		sleep( 30 )
		PlayMotion( Guard[3] , ruFUSION_ACTORSTATE_REVIVING	)
		PlayMotion( Guard[4] , ruFUSION_ACTORSTATE_REVIVING	)
		CastSpell( Guard[3] , Guard[3] ,Magic )
		CastSpell( Guard[4] , Guard[4] ,Magic )
		sleep( 10 )
		AdjustFaceDir(  Rowl , Guard[3] , 0 )		
		AdjustFaceDir(  Gino , Guard[4] , 0 )
		AdjustFaceDir(  Midnight , Guard[4] , 0 )
		AdjustFaceDir(  Owl_2 , Guard[3] , 0 )	
		sleep( 20 )
		WriteRoleValue( Jazz , EM_RoleValue_IsWalk ,0 )
		AddToPartition( Jazz , RoomID )
		SetPlot( Jazz , "dead" , "LuaQ_423009_dead" , 0 )
		MoveToFlagEnabled( Jazz , false )
		Yell( Jazz , "[SC_423009_17]" , 3 ) --�Һ��B�ǿաI
		SetRoleCamp( Guard[3] , "Monster" )
		SetRoleCamp( Guard[4] , "Monster" )
		SetAttack( Guard[3] ,  Rowl )
		SetAttack( Guard[4] ,  Gino )
		SetFightMode( Rowl , 0 , 1 , 0 , 1 )
		SetFightMode( Gino , 0 , 1 , 0 , 1 )
		SetFightMode( Jazz , 0 , 1 , 0 , 1 )
		AddBuff( Rowl , NoAttackBuff , 0 , -1 )
		AddBuff( Gino , NoAttackBuff , 0 , -1 )
		AddBuff( Jazz, NoAttackBuff , 0 , -1 )	
		LuaFunc_MoveToFlag( Jazz , Flag , 20 , 0 )
		sleep( 5 )
		AdjustFaceDir( Jazz , OwnerID() , 0 )
		AddBuff( Jazz, ArgoBuff , 0 , -1 )	
		CallPlot( Rowl , "LuaQ_423009_Move_2" , 18 , Jazz)
		CallPlot( Gino , "LuaQ_423009_Move_2" , 19 , Jazz)

		for i = 1 , 240 , 1 do
			result = 0
			local Check = 0
			for j = 3 , 4 , 1 do
				if CheckID( Guard[j] ) == false or ReadRoleValue(Guard[j] , EM_RoleValue_OrgID ) ~= 103305 or ReadRoleValue(Guard[j] ,EM_RoleValue_IsDead) == 1 then
					result = result + 1
				end
				for k = 1 , HateListCount(Guard[j]) , 1 do
					local ID = HateListInfo(Guard[j] ,k-1 , EM_HateListInfoType_GItemID )
					if ReadRoleValue( ID , EM_RoleValue_IsPlayer ) == 1 then
						Check = 1
					end
				end
			end
			if result >= 2 then
				break
			end
			if Check == 0 and result < 2 and i > 60 then
				break
			end
			if i == 240 then
				TimeOver = 1
			end
			sleep( 10 )
		end
		local Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if  Lua_ObjAreaCheck( ID , Area ) == true then
				if CheckAcceptQuest( ID , 423009 ) == true and result >= 2 and ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 then
					SetFlag( ID , KeyItem , 1 )
				else
					if result < 2 then
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 and TimeOver == 0 then

						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 and TimeOver == 0 then
							ScriptMessage( ID , ID , 1 , "[SC_423009_19]" , 0 ) --�ѩ�A�å��ѻP�԰��ɭP���ȥ��ѡI�Э��s�D�ԡI
							ScriptMessage( ID , ID , 0 , "[SC_423009_19]" , 0 )
						else
							ScriptMessage( ID , ID , 1 , "[SC_423009_20]" , 0 ) --�ѩ�԰��ɶ��L���ɭP���ȥ��ѡI�Э��s�D�ԡI
							ScriptMessage( ID , ID , 0 , "[SC_423009_20]" , 0 )						
						end
					end
				end
				ChangeZone( ID , Zone , Room , X , Y , Z, Dir )
			end
		end	
	else
		local Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if  Lua_ObjAreaCheck( ID , Area ) == true then
				if ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 and TimeOver == 0 then
					ScriptMessage( ID , ID , 1 , "[SC_423009_18]" , 0 ) --�ѩ�A�L�k�i��԰��ɭP���ȥ��ѡI�Э��s�D�ԡI
					ScriptMessage( ID , ID , 0 , "[SC_423009_18]" , 0 )
				elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 and TimeOver == 0 then
					ScriptMessage( ID , ID , 1 , "[SC_423009_19]" , 0 ) --�ѩ�A�å��ѻP�԰��ɭP���ȥ��ѡI�Э��s�D�ԡI
					ScriptMessage( ID , ID , 0 , "[SC_423009_19]" , 0 )
				else
					ScriptMessage( ID , ID , 1 , "[SC_423009_20]" , 0 ) --�ѩ�԰��ɶ��L���ɭP���ȥ��ѡI�Э��s�D�ԡI
					ScriptMessage( ID , ID , 0 , "[SC_423009_20]" , 0 )						
				end
				ChangeZone( ID , Zone , Room , X , Y , Z, Dir )
			end
		end		
	end
	if CheckID( Queen ) == true and ReadRoleValue(Queen , EM_RoleValue_OrgID ) == 103304 and ReadRoleValue(Queen ,EM_RoleValue_IsDead) == 0 then
		CastSpell( Queen ,Queen ,Magic )
		sleep( 5 )
		DelObj( Queen )
	end
	for i = 1 , 4 , 1 do
		if CheckID( Guard[i] ) == true and ReadRoleValue(Guard[i] , EM_RoleValue_OrgID ) == 103305 and ReadRoleValue(Guard[i] ,EM_RoleValue_IsDead) == 0 then
			CastSpell( Guard[i] ,Guard[i] ,Magic )
			sleep( 5 )
			Delobj( Guard[i] )
		end
	end
	Delobj( Rowl )
	DelObj( Gino )
	DelObj( Jazz )
	DelObj( Owl_2 )
	DelObj( Midnight )
	Show( OwnerID()  , RoomID )
	Show( Owl , RoomID )
	if CheckID( Wall ) == true then
		SetModeEX( Wall , EM_SetModeType_Obstruct , true)
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaQ_423009_Move(Flagnum, Del)
	local Flag = 780576
	LuaFunc_MoveToFlag( OwnerID() , Flag , Flagnum , 0 )
	if Del == 1 then
		DelObj( OwnerID() )
	end
end

function LuaQ_423009_Move_2(Flagnum , Jazz)
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	local Flag = 780576
	LuaFunc_MoveToFlag( OwnerID() , Flag , Flagnum , 0 )
	AdjustFaceDir(  OwnerID() , Jazz , 0 )
	sleep( 10 )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	if FlagNum == 18 then
		SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_UNARMED )
	else
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )	
	end
end

function LuaQ_423009_dead()
	return false
end

function LuaI_114700_1()
--	if CheckAcceptQuest( OwnerID() , 423008 ) == true or CheckAcceptQuest( OwnerID() , 423009 ) == true then
		if CheckBuff( OwnerID() , 506188 ) == false then
			AddBuff( OwnerID() , 506188 , 0 , -1 )
		end 
--	end
end

function LuaI_423008_Transport_0()
	SetPlot( OwnerID()  , "collision", "LuaI_423008_Transport_1" , 30 )
end

function LuaI_423008_Transport_1()
	local Zone = 253
	local Room = -1
	local X , Y , Z ,Dir = 544 , 1 , 695 , 270
	if CheckAcceptQuest( OwnerID() , 423008 ) == true or CheckAcceptQuest( OwnerID() , 423009 ) == true or ( CheckCompleteQuest( OwnerID() , 423008 ) == true and CheckCompleteQuest( OwnerID() , 423009 ) == false ) then
		ChangeZone( OwnerID() , Zone , Room , X , Y, Z , Dir )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0  , "[SC_423008_NOT_READY]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1  , "[SC_423008_NOT_READY]" , 0 )
	end
end

function LuaI_423008_Transport_2()
	SetPlot( OwnerID()  , "range", "LuaI_423008_Transport_3" , 30 )
end

function LuaI_423008_Transport_3()
	local Zone = 15
	local Room = 0
	local X , Y , Z ,Dir = -9027 , -129 , 9875 , 360
	ChangeZone( OwnerID() , Zone , Room , X , Y, Z , Dir )
end

function LuaM_506190_0()
	local Zone_i = 253 
	local Area = 1
	local Zone_f = 15
	local Room = 0
	local X , Y , Z ,Dir = -9075 , -114 , 9871 , 180
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == Zone_i and Lua_ObjAreaCheck( OwnerID() , Area ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_423009_18]" , 0 ) --�ѩ�A�L�k�i��԰��ɭP���ȥ��ѡI�Э��s�D�ԡI
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_423009_18]" , 0 )
		ChangeZone( OwnerID() , Zone_f , Room , X , Y, Z , Dir )
	end
end