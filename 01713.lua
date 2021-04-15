----�ȩ]���U��s�X�ȩ]
function LuaS_114770()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,422981 ) == true	then
		if	CheckAcceptQuest( OwnerID() ,423024 ) == true	or
			CheckAcceptQuest( OwnerID() ,423025 ) == true	then
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_114770]" , "LuaS_114770_1", 0 )	--�аݦ���ȩ]�b�ܡH
		elseif	CheckCompleteQuest( OwnerID() ,423025 ) == false	and
			CheckCompleteQuest( OwnerID() ,423024 ) == true	then
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_114770]" , "LuaS_114770_1", 0 )	--�аݦ���ȩ]�b�ܡH
		else
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_114770]" , "LuaS_114770_0", 0 )		--�аݦ���ȩ]�b�ܡH
		end
	end
end

function LuaS_114770_0()	
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_114770_Show" , 0 )
end

function LuaS_114770_show()	
	local MN = Lua_DW_CreateObj("flag" , 114592 ,780578 , 1 )		--�إX�ȩ]	
	MoveToFlagEnabled( MN , false )
	Say( MN , "[SC_114770_3]")				--��p���ܡH�K�K�K�K��
	LuaFunc_MoveToFlag( MN , 780578 , 2 ,  0 )
	sleep(600)
	Say( MN , "[SC_114770_4]")				--�p�������}�@�U....
	LuaFunc_MoveToFlag( MN , 780578 , 1 ,  0 )
	Delobj( MN )
	DisableQuest(OwnerID() ,false )
end

function LuaS_114770_1()	
	SetSpeakDetail(OwnerID(),"[SC_114770_2]")		--����L���b���I���Ƨ�L�еy���C	
end



------�򥢪��u�ȦⲴ�y�v
function LuaS_114763()	--���s���o���c�l
	LoadQuestOption( OwnerID() )
	if	CheckCompleteQuest( OwnerID() ,422965 ) == true	and
		CheckCompleteQuest( OwnerID() ,423160 ) == false	and
		CountBodyItem( OwnerID(), 206813 )<1		then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_114763]" , "LuaS_114763_1", 0 )	--�аݧA���D�s�]���󪺡u�ȦⲴ�y�v����h�F�ܡH 
	end
end

function LuaS_114763_1()	
	GiveBodyItem( OwnerID(), 206813, 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_206813()
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 423160, 1 ));
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 423160,str ,"ScriptBorder_Texture_Paper" )	
end	


------�򥢪��u�ȦⲴ�y�v
function LuaS_422965_1()	--�ܾK����
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_1_Answer", 0 )	--�аݧA���D�s�]���󪺡u�ȦⲴ�y�v����h�F�ܡH 
	end
end
	
function LuaS_422965_1_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_1]")	--�������I�A�������u�ȦⲴ�y�v�����F�ڡH...�СI
	SetFlag(OwnerID() , 543664 , 1 )
end

function LuaS_422965_2()	--�a�A���R
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_2_Answer", 0 )	--�аݧA���D�s�]���󪺡u�ȦⲴ�y�v����h�F�ܡH 
	end
end

function LuaS_422965_2_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_2]")	--���A���s�]���󪺡u�ȦⲴ�y�v�����F�r��
	SetFlag(OwnerID() , 543665 , 1 )
end

function LuaS_422965_3()	--���z�i�̭�N
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_3_Answer", 0 )	--�аݧA���D�s�]���󪺡u�ȦⲴ�y�v����h�F�ܡH 
	end
end

function LuaS_422965_3_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_3]")	--��I�o�ٻݭn���ܡH�@�w�O�����M�h�ή������I
	SetFlag(OwnerID() , 543666 , 1 )
end

function LuaS_422965_4()	--�Ѽ��i���w
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_4_Answer", 0 )	--�аݧA���D�s�]���󪺡u�ȦⲴ�y�v����h�F�ܡH 
	end
end

function LuaS_422965_4_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_4]")	--�������y�|�Q�s�ڥi�O�@�I�]���N�~
	SetFlag(OwnerID() , 543667 , 1 )
end

function LuaS_422965_5()	--�ܼ}�H
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true		and
		CheckFlag(OwnerID() , 543668 ) == false 		then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_5]" , "LuaS_422965_5_Answer", 0 )	--�[�T�H�H
	end
end

function LuaS_422965_5_Answer()	
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422965_5_Show" , 0 )
end

function LuaS_422965_5_Show()
	Say(OwnerID() , "[SC_422965_6]")	--�A������H�[�T�H�H	
	sleep(30)
	Say(OwnerID() , "[SC_422965_7]")	--�o�O���̨Ӫ��m�ڨСH
	sleep(10)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_SP01)	--�]�ܼ}�H���H�^
	AddBuff( TargetID() , 505965 , 1 , 120 )			--�����a�w�tBUFF2����
	SetFlag(TargetID() , 543668 , 1 )
	DisableQuest( OwnerID() , false )
end

function LuaS_422965_5_Show_1()
	local R = Rand( 2 ) 
	if	R == 1	then
		AddBuff( OwnerID() , 505967 , 1 , 6 )		--�w6��	
	end
end


------422976���͸�����汵


function LuaS_422976_Complete()

	local John = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114512 , 100 )		--���o����
	DisableQuest( John ,true )
	DisableQuest( OwnerID() ,true )
	BeginPlot( John , "LuaS_422976_Complete_John" , 0 )
end

function LuaS_422976_Complete_John()
	local KO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114508 , 100 )	--���o�쥻������
	local KK = LuaFunc_CreateObjByOBj( 114533 , KO )		--�إX��Ӫ�����
	MoveToFlagEnabled( KK , false )
	local Ni = Lua_DW_CreateObj("flag" , 114511 ,780541 , 2 )		--�إX��Z�g	
	MoveToFlagEnabled( Ni , false )
	LuaFunc_MoveToFlag( Ni , 780541 , 3 ,  0 )

	SetDefIdleMotion( Ni, ruFUSION_MIME_EMOTE_SPEAK)
	SetDefIdleMotion( KK, ruFUSION_MIME_EMOTE_SPEAK)


	Say( Ni , "[SC_422976_1]")			--�͡A���W�A�F�A���U�Ӫ��V�m�u�@�A�N�浹�����a�I
	sleep(30)
	Say( KK , "[SC_422976_2]")			--���M�ܱˤ��o�o�ǥi�R���ǥ̡ͭA���L�A�����A�ڴN��L�̥浹�A�F�I�ڪ��D�A�|�n�n�R�@�L�̡A�оɥL�̪��C
	sleep(30)
	SetDefIdleMotion( KK, ruFUSION_MIME_NONE)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
	Say( OwnerID() , "[SC_422976_3]")		--�͡A�S���Y���A�p�G�Aı�o�ˤ��o�A�o�Ǿǥ��٬O�ѧA�ӱоɦn�F...
	sleep(20)
	Say( Ni , "[SC_422976_4]")			--�O�Q�A�����d��...
	sleep(30)
	Say( OwnerID() , "[SC_422976_5]")		--�n�n�n�A�O�ͮ�...
	sleep(30)
	Say( Ni , "[SC_422976_6]")			--��......�����A�ک��էA���N��...
	sleep(20)
	Say( OwnerID() , "[SC_422976_7]")		--�y...�y....����...�ɶ����h�A�ڭ̶}�l�i��V�m�ҵ{�a�I
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)
	sleep(30)
	Say( KK , "[SC_422976_8]")			--�ڥi�R���ǥ̡ͭ�...
	sleep(30)

	SetDefIdleMotion( Ni, ruFUSION_MIME_NONE)
	
	

	BeginPlot( Ni , "LuaS_422976_Complete_Cancel" , 0 )
	BeginPlot( KK , "LuaS_422976_Complete_Cancel" , 0 )
	DisableQuest( OwnerID() , false )
	DisableQuest( KO , false )
end

function LuaS_422976_Complete_Cancel()
	LuaFunc_MoveToFlag( OwnerID() , 780541 , 4 ,  0 )
	Delobj( OwnerID() )
end

------�w����{�ȩ]�����A�����G114534
function LuaS_422978_John()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422978 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422978_1]" , "LuaS_422978_1", 0 )	--�o�򦳽쪺�a��ڡH���ڭ̻��ֶi�h�a�I
	end

	if	CheckAcceptQuest( OwnerID() ,422979 ) == true	and
		CountBodyItem( OwnerID(), 206930 )<1	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422979_1]" , "LuaS_422979_1", 0 )	--�аݧڳQ���t�h���լd�H
	end
end

function LuaS_422978_1()
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422978_2" , 0 )
	Hide( TargetID() )
end

function LuaS_422978_2()
	local John = LuaFunc_CreateObjByOBj( 114950 , OwnerID() )
	local MN = Lua_DW_CreateObj("flag" , 114717 ,780567 , 1 )		--�إX�ȩ]	
	MoveToFlagEnabled( MN , false )
	MoveToFlagEnabled( John , false )
	WriteRoleValue(John , EM_RoleValue_IsWalk, 1 )	
	Hide( John )
	Show( John ,0)
	Lua_Drama_Radar( John ,422978)
	LuaFunc_MoveToFlag( John , 780567 , 5 ,  0 )
	LuaFunc_MoveToFlag( John , 780567 , 2 ,  0 )
	AdjustFaceDir( John , MN, 0 )
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( MN , "[SC_422978_2]")				--�w����{���N�Ұ���h�A�p�����Աz�h�ɰա�
	PlayMotion( MN , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( John , "[SC_422978_3]")			--�ڻ�������������D�`���L�A�`���b���̡A���C���ڨӪ��ɭԡA�����`�O�b�a�O�H
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_4]")				--�N�ҰҮa�`�O�|�a�����H�եؤ@�s�����N�~�A��p���Ө��i�O�Q�ȭ�I�K�K�K�K....
	PlayMotion( MN , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_5]")				--�p�B�A�z���W���o����������A�p���i�O�j�ѻ��N�D��F��
	sleep(30)
	Say( John , "[SC_422978_6]")			--����������ڡ�q������Q���g��������f��ť��o�˪����g�A�u�O���ڡu���d�Y��v�O�I
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false and Lua_Check_Drama_Statu( MN ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( MN , "[SC_422978_7]")				--�K�K�K�K....��h�e�X�Ѱe�Ӫ��u���N�~�v�A���N�O�ӤW���n�f�A���p���i�O�R������A��]�S�ΡA���P�u�L�v����O��
	PlayMotion(  MN ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say( John , "[SC_422978_8]")			--��㦳����X���򵲪G�ܡH
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_9]")				--�p���b�u�L�v�����y���@�@���H�����������D......
	sleep(30)
	Say( MN , "[SC_422978_10]")			--�K�K�K�K��o�ب�F�ȳ~���I�ɩҴ�{�����ۡA�i�O�H���̬��R���ꪺ�@��ڡI
	sleep(30)
	Say( John , "[SC_422978_11]")			--�@�@���H���������D�H....�@�ӹF�ԥ������C�����W�X�{�j�q�������A�o�i�u�O��@�H�M�����Ʊ�......
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( John , "[SC_422978_12]")			--�٦���L���o�{�ܡH
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_13]")			--�p���٦b�u�L�v�餺�o�{�@�دS���Ĥ��ݯd�A�����o�{�@�D���R���s�A�M���C
	sleep(30)
	Say( John , "[SC_422978_14]")			--�M���H�o�{�u�L�v���a��i�S����j�q���A�Ʀܳs�u�L�v����A�W���S���g��b�w��o�I�o�O���^��......
	sleep(30)
	Say( MN , "[SC_422978_15]")			--�O�ڡ㨭��b�٬��^�ø��ɳQ���}�A�o�S���y�X�b�w��A�p���]�O�Ĥ@���ݨ��o�˪����p�A�u�O���Ħa�Τ��۰ڡ�K�K�K�K.....
	PlayMotion( MN , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_16]")			--�p���q���A�o�ز{�H�A�γ\�򨺯S���Ĥ������Y�A�����b�F�ԥ������̡A�٦�����_�Ǫ��Ʊ����|�o�ͩO�H
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( John , "[SC_422978_17]")			--�o�˰�.....���ڥi�o�n�n�լd�@�f���°աI�C���P�A���|���`�O�o��u����v......
	sleep(30)
	Say( MN , "[SC_422978_18]")			--�p���]�O�D�`��������N�Ұ���h�ۻE�ڡ�b�z�����`�O���\�h�}���öQ�����N�~�X�{�A�p���o�a���A�i�O�û�����h�z���}�j��...���L�z�a�Ӫ��o�Ǥp�B�ͭ�......
	sleep(30)
	Say( MN , "[SC_422978_19]")			--�o�a���̪��u�Q���v��b�����w���H�`�N�L�̪��F��r�㤣�ެO�β����άO�u���ʤ�I���@�ˡA�K�K�K�K......		
	
	local Star = Lua_DW_CreateObj("flag" , 114718 ,780567 , 3 )		--�إX��P	
	MoveToFlagEnabled( Star , false )
	LuaFunc_MoveToFlag( Star , 780567 , 4 ,  0 )

	Say( Star , "[SC_422978_20]")			--���n���|�k�ʡA�B�͡A�۷S�`�F��A�Q�������Y���h�F�C		
	sleep(30)
	PlayMotion(Star , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say( Star , "[SC_422978_21]")			--�ڬݨ�Y�ǥ��~�|���A�f����·t�����C
	sleep(30)
	Say( Star , "[SC_422978_22]")			--�ȩ]�A�ݨӱ��U�ӬY�Ǥp�B�ʹN�n�����A���u�Q���v�F�C
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		DelObj( Star )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end	
	Say( John , "[SC_422978_23]")			--�y.....��......�ڭ̥����}�F......
	sleep(30)
	Say( MN , "[SC_422978_24]")			--�K�K�K�K......�N�Ұ���h�A�A�i�D�z�@��ơA�u�L�v���c�l�W�g���@�ǯS��d�g�A�o�i�O�F�ԥ��������u���Ӧa��v�~������I	
	PlayMotion(  MN ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say( John , "[SC_422978_25]")			--��A�ڷ|�h���̽լd��....�@�z.....�u�ͷN�����v...�c��ڷQ�A�o�򻡥i���F�ԥ��������O��n�ưڡI	
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_26]")			--�H�H�I	
	BeginPlot( MN , "LuaS_422978_MNDead" , 0 )
	BeginPlot( Star , "LuaS_422978_StarDead" , 0 )
	
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 422978 ) == true and
 			CheckFlag(Party[i] , 543736 ) == false and
			GetDistance(Party[i] , OwnerID() ) < 200 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
			SetFlag(Party[i] , 543736 , 1 )
		end
	end
	sleep(20)
	LuaFunc_MoveToFlag( John , 780567 , 5 ,  0 )
	LuaFunc_MoveToFlag( John , 780567 , 6 ,  0 )
	Delobj( John )
	sleep(20)
	Show( OwnerID() ,0)
	DisableQuest(OwnerID() ,false )
end

function LuaS_422978_MNDead()
	sleep(50)
	Delobj( OwnerID() )
end

function LuaS_422978_StarDead()
	sleep(50)
	Delobj( OwnerID() )
end


-------�i�}�լd
function LuaS_422979_1()
	SetSpeakDetail(OwnerID(),"[SC_422979_2]")	
end

function LuaS_422979_2()

	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
			BeginPlot( TargetID(), "LuaS_422979_3" , 0 )
			return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--�ؼЦ��L��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
		return false
	end
end


function LuaS_422979_3()
	writerolevalue( OwnerID(), EM_RoleValue_PID , 1 )

	local Star = CreateObjByFlag( 114722 , 780573 , 1 , 0 )		--��P
	AddToPartition( Star , 0 )
	local Tony = CreateObjByFlag( 114719 , 780573 , 2 , 0 )		--����
	AddToPartition( Tony , 0 )
	MoveToFlagEnabled( Star , false )
	MoveToFlagEnabled( Tony , false )

	
	LuaFunc_MoveToFlag( Tony , 780573 , 4 ,  0 )
	Say(Tony , "[SC_422979_3]")					--�o���ڤ@�w�n����...�c......�����ӤH�@�B�d�X�u�ۡI
	LuaFunc_MoveToFlag( Star , 780573 , 3 ,  0 )
	sleep(30)
	Say(Tony , "[SC_422979_4]")					--�x�H���H�I
	PlayMotion( Tony , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Say(Tony , "[SC_422979_5]")					--�V�|�I���|�������M�h�b�o�̡A�n�O�Q�o�{�ڰ��ȥX��......	
	sleep(30)
	AdjustFaceDir( Tony , Star, 0 )
	Say(Tony , "[SC_422979_6]")					--���§A���ڨ��o�@��A���L�A�ڷQ�ڱߤ@�I�A�L�Ӧn�F......	
	PlayMotion( Tony , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	LuaFunc_MoveToFlag( Tony , 780573 , 2 ,  0 )
	Delobj( Tony )
	LuaFunc_MoveToFlag( Star , 780573 , 1 ,  0 )
	Delobj( Star )

	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_422983()
	SetSpeakDetail(OwnerID(),"[SC_422983_1]")		--�A���ݭn�h���ĭz�A�Ҧ����L�{�ڳ�ť[114534]���i�L�F�I
	SetFlag(OwnerID() , 543739 , 1 )			
end

----------�h�a�̪��ޥ����s780577

function LuaS_114752()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422967 ) == true	and
		CheckFlag( OwnerID() , 543789) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422967_12]" , "LuaS_114752_1", 0 )	--��[114507]���F���X�ӡI
	end	
end

function LuaS_114752_1()
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_114752_Fight" , 0 )
end

function LuaS_114752_Fight()

	local NPC1 = LuaFunc_CreateObjByOBj( 103168 , OwnerID() )
	local NPC2 = Lua_DW_CreateObj("flag" , 103168 ,780577 , 1 )	
	local NPC3 = Lua_DW_CreateObj("flag" , 103168 ,780577 , 2 )	
	AddToPartition( NPC1 , 0 )
	AddToPartition( NPC2 , 0 )
	AddToPartition( NPC3 , 0 )
	SetAttack(NPC1,TargetID())
	SetAttack(NPC2,TargetID())
	SetAttack(NPC3,TargetID())

	BeginPlot( NPC1 , "LuaS_114752_2" , 0 )
	BeginPlot( NPC2 , "LuaS_114752_2" , 0 )
	BeginPlot( NPC3 , "LuaS_114752_2" , 0 )
	Hide(OwnerID())
	for i = 0 , 100 , 1 do
		if	CheckID(NPC1) == false	and	
			CheckID(NPC2) == false	and
			CheckID(NPC3) == false	then
			break
		end
		sleep( 30 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
end

function LuaS_114752_2()

	SetPlot(OwnerID(),"dead","LuaS_114752_3",0 )	--�Ǧ�����Ĳ�o���`�@��

	while true do
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	and 
			CheckID( OwnerID() ) == true				then  --�ˬd�O�_���}�԰�
			Sleep( 20 )
		else
			if CheckID( OwnerID() ) == true	then	
				DelObj( OwnerID() )	
			end 
			break
		end
	end
end

function LuaS_114752_3()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422967 ) == true	then
			SetFlag( Player   , 543789, 1 )
		end	
	end	
	return true
end












