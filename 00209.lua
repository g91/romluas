------------------------------------------�H�U����l�@���A���|�w�F�H���X�{------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
function LuaI_110177_0()

	Local LuoPartition = Rand(4)
	local Luo = CreateObjByFlag(110177,780019,LuoPartition,1)
	AddToPartition( Luo , 0 )
	SetIdleMotion( Luo,ruFUSION_ACTORSTATE_SLEEP_LOOP )
	Sleep (30)
end
--------------------------------------------------�H�U����ܬ������@��----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_0()

	SetSpeakDetail( OwnerID(), GetString( "ST_110177_0" )  );--/*�O���ڡ���٭n�ܡ�

--	if CheckFlag( OwnerID(),540330 ) == true and CheckFlag(OwnerID(),540331) == false then  --�ˬd�O�_�������Ȫ��e�b�q
	if CheckFlag(OwnerID(),540331) == false and CheckAcceptQuest( OwnerID(), 420220 ) == true then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_1" ) , "LuaS_110177_1", 0 ) 
		--/*�|�w�F���͡A�бz�_�ӡA�b�o��η|�P�_���I

	end
	
--	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_0" ) , "LuaS_110177_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_1()

	SetSpeakDetail( OwnerID(), GetString( "ST_110177_1" )   );
	--/*�A�O�ְڡH�ڤS�b���̡K�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_2" ) , "LuaS_110177_2", 0 ) 
	--/*�|�w�F���͡A�Oĳ���n�ڨӧ�z���A�бz����^�h�C

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_2()

	SetSpeakDetail( OwnerID(), GetString( "ST_110177_2" )  );
	--/*�O�o�˰�...�ګ��S�ܾK�F...�Y�h���n�R...�@�w�O�Q���Ӭ��ߪ��s�a���󵹺L��...
	--  �o�˪��ɺA���A�ݨ��u���n�N��A�ڲ{�b���W�N�^�h�C
	--  ���§A�ڡA�~���H��
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_3" ) , "LuaS_110177_3", 0 ); --/*�^�h�ɽФp�ߡC

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_3()

	CloseSpeak( OwnerID() );	--������ܵ���
--	SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40)
	DisableQuest( TargetID() , true )
	SetFlag( OwnerID(), 540331, 1 ); --�����������Ȫ��X��
	BeginPlot( TargetID(),"LuaS_110177_4",10)	--�I�s��L�禡

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_4()	--/*�n�t�@�q��
	Sleep (5)
	PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_SLEEP_End ) -- ���|�w�F�_��
	Sleep (15)
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	-- ��K�~�W�r�令�|�w�F�A���檺�ܴN�令�m��NPC���覡�A���K�~�����A�l��|�w�F�Ӷi��ʧ@
	for n = 1 , 3 do  -- ���L�b����è��@�}�l
		Func_rand_walker(OwnerID(), 5 , 30 )
		Say ( OwnerID() , GetString("SAY_110177_0")) --/* ĳ�|�O������H
		Sleep (30)

	end

	Say ( OwnerID() , GetString("SAY_110177_1")) --/* ��F�A�O�����Ӥ�V...
	Move( OwnerID() , 4346 ,53 , -604) --�� NPC �¤@�өT�w��V�e�i�A�����Ψ�w�I
	sleep (30) -- �ɶ���N���m NPC
	Local LuoPartition = Rand(4)
	Hide( OwnerID()) --���������
	sleep(300)
	Show( OwnerID(), 0 )  --������X�{
	SetPosByFlag( OwnerID() , 780019, LuoPartition )--�N���Ⲿ�ʨ���w���X����m
	PlayMotionEX(  OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN ,ruFUSION_ACTORSTATE_SLEEP_LOOP )
	sleep( 30 )
--	SetPlot( OwnerID(),"touch","",40)
	DisableQuest( OwnerID() , false )
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end