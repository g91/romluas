function LuaS_422740()------
             	LoadQuestOption( OwnerID() )
                if (CheckAcceptQuest(OwnerID(),422740)==true )and  (CheckFlag(OwnerID(),543305)==false )then
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422740_1]","LuaS_422740_1",0)        ---�צ̦h��
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422740_2]","LuaS_422740_2",0)------�ۤv
               end
               if (CheckAcceptQuest(OwnerID(),422741)==true )and  (CheckFlag(OwnerID(),543307)==false ) then   ---���}�R��
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422741_1",0)-------.�o�ͤ���ơH
              end

	if CheckAcceptQuest( OwnerID() ,422698 ) == true and CheckCompleteQuest( OwnerID() , 422698) == false then --�M�D�F���\����U����
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422698]","LuaS_422698",0) --�����A�бz�����ڭ̨�U�C
	end

end

function LuaS_422740_1()-----FLAG 433 �t���Ϊ��צ� 113441
             CloseSpeak( OwnerID() )
             CallPlot( OwnerID(),"LuaS_422740_5",TargetID())
end

function LuaS_422740_2()-----FLAG 433 �t���Ϊ��צ� 113441
             CloseSpeak( OwnerID() )
             CallPlot( OwnerID(),"LuaS_422740_6",TargetID())
end
function LuaS_422740_5(LY)-----
             DisableQuest( LY,  true)
             local KK = Lua_DW_CreateObj("flag" ,113432,780433,0,1 )
             DisableQuest( KK , true )
             --PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
             SAY( LY, "[SC_422740_1_1]" ) ----��A�ڪ��D�F�I����A�]���D�o�s���r�ܡH
             Sleep(30)
             PlayMotion( LY,ruFUSION_ACTORSTATE_CAST_INSTANT)
             SAY( LY,"[SC_422740_1_2]" )----�o�����i��O[113442]�ǳƪ��C
             sleep(30)
             --PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
             SAY( LY, "[SC_422740_1_3]" )------[113432]�A�h�s[113442]�L�ӡI
             Sleep(10)
             DW_MoveToFlag( KK,780433, 1 , 0,1)
             SAY( KK, "[SC_422740_1_4]" )----�O���I
             DW_MoveToFlag( KK,780433,2, 0,1)
	DW_MoveToFlag( KK,780433,8, 0,1)
	DW_MoveToFlag( Kk,780433,7, 0,1)
	DW_MoveToFlag( KK,780433,6, 0,1)
	DW_MoveToFlag( KK,780433,5, 0,1)
	DW_MoveToFlag( Kk,780433,4, 0,1)
	DW_MoveToFlag( KK,780433,3, 0,1)
             SAY( LY , "[SC_422740_1_5]" )----
             DelObj(KK)
             SLEEP(25)
            BeginPlot( LY,"LuaS_422740_3", 0)
end

function LuaS_422740_6(LY)-----
	DisableQuest( LY,  true)
	local KK = Lua_DW_CreateObj("flag" ,113432,780433,0 ,1)
	DisableQuest( KK , true )
	PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( LY, "[SC_422740_2_1]" ) ----��A�ڪ��D�F�I�s�O�A�ǳƪ�.......����s�̪��r�@�w�]�O�A�U���藍��H
	Sleep(30)
	PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( LY,"[SC_422740_2_2]" )----�A�P���ٱ��F�u�@�ۧڭ̤��Q�D�H�Iŧ�����s�~�K�K
	sleep(30)
	--PlayMotion( LY,ruFUSION_ACTORSTATE_BOW_PARRY)
	SAY( LY, "[SC_422740_2_3]" )------�~�Ӫ̡A�o��O�b��[ZONE_DIMARKA]���D�]�Ϊ�.......�O�žԫe���ܫ¡H���F�I��[ZONE_DIMARKA]�e���Ǧ��H
	sleep(30)
	SAY( TargetID(), "[SC_422740_2_4]" )------���㤣�O�ڡI�O[113442]�I�O�L�n�ڰe�o�ǪF��Ӫ��I
	sleep(30)
	PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( LY, "[SC_422740_2_5]" )---�Aı�o�ڷ|�۫H�A�H�٬O�|�H���L�H
	Sleep(20)
	SAY( LY, "[SC_422740_2_6]" )---���㤣�L���٬O�|���A���|�I
	Sleep(20)
	SAY( LY, "[SC_422740_1_3]" )---[113432]�A�h��[113442]�L�ӡI
	Sleep(20)
	DW_MoveToFlag( KK,780433,1, 0,1)
	SAY( KK, "[SC_422740_1_4]" )----�O���I
	DW_MoveToFlag( KK,780433,2, 0,1)
	DW_MoveToFlag( KK,780433,8, 0,1)
	DW_MoveToFlag( KK,780433,7, 0,1)
	DW_MoveToFlag( KK,780433,6, 0,1)
	DW_MoveToFlag( KK,780433,5, 0,1)
	DW_MoveToFlag( KK,780433,4, 0,1)
	DW_MoveToFlag( KK,780433,3, 0,1)
             	SAY( LY , "[SC_422740_1_5]" )----
             	DelObj(KK)
             	SLEEP(25)
            	BeginPlot( LY,"LuaS_422740_3", 0)
end
--------------------------------------------------------------------


function LuaS_422740_3()----�צ̥X�{
             local CC = Lua_DW_CreateObj("flag" ,113441,780433,3,1)
	DisableQuest( CC , true )
	DW_MoveToFlag( CC,780433,4, 0,1)
	DW_MoveToFlag( CC,780433,5, 0,1)
	DW_MoveToFlag( CC,780433,6, 0,1)
	DW_MoveToFlag( CC,780433,7, 0,1)
	SAY( CC, "[SC_422741_21]"  )----�A��ڰڡH[113443]�H
	sleep(10)
	DW_MoveToFlag( CC,780433,8, 0,1)
	SAY( CC, "[SC_422729_1]"  )----���F�ܡH
	sleep(10)
	DW_MoveToFlag( CC,780433,9, 0,1)
	AdjustFaceDir( CC , OwnerID(), 0 )
             sleep(10)
	SAY( CC, "[SC_422741_1]"  )----[113443]�A�o�O���^�ơH�n�I������^�C
	sleep(10)
	PlayMotion(  OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( OwnerID()  ,  "[SC_422740_1_6]" )-----�o�~�Ӫ̻��A�A�n�L�N�o�r�s�M���s�~���浹�ڡH 
	sleep(30)
	PlayMotion(  CC ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( CC , "[SC_422740_1_7]"  )-----�r�s�H�ګ��i��o�˹�A�H���`���s�~���N�󤣥����F�I
	sleep(30)      
	PlayMotion(  CC  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( CC , "[SC_422740_1_8]")-----�e�̬O�u�@[ZONE_DIMARKA]���Q�D�H���Z���۵M���u�A�ګ��i��|���X�o�بƨӡH	
	sleep(30)      
	PlayMotion(  CC  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	SAY( CC , "[SC_422740_1_9]"  )-----�ѰڡI�ڱq�S�Q�L�o�ǥ~�Ӫ̤߾��o��`�A�L�̤@�w�O�Q�D�_[ZONE_DIMARKA]�����áA�n�X����������C
	sleep(30)  
	PlayMotion(  CC  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)    	
	SAY( CC , "[SC_422740_1_10]" )---[113443]�A�ڥ����V�A�P�p�A�ڤ��e�٤�ť�A���R�O�t�������o�ǥ~�Ӫ̡C                                                         	
	sleep(30)         	
	PlayMotion(  OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( CC , "[SC_422740_1_16]" )---�{�b�ڹ������鮩��o�ǥ~�Ӫ̪��i�ȡA�L�̭ӭӳ����h���y�A�Q�n�I��[ZONE_DIMARKA]�A�@�w�n�n�n�B�z�L�̤~��I	
	sleep(30)    
	SAY( OwnerID(), "[SC_422740_1_11]"  )---�ڪ��D�F.......�o�ӤH�ڷ|�B�̡A�A���h���A���a�I
	sleep(30)         	
	SAY( CC , "[SC_422740_1_12]"  )---�J�M�A�o�򻡡A����ڴN�����F�I�u���L[113443]�A�A�ۤv�@�w�n�p�ߤ@�I�C
            	BeginPlot( CC,"LuaS_422740_11", 0)
	sleep(10)
             SAY( OwnerID() , "[SC_422740_1_13]"  )---[$PLAYERNAME]�A�{�b�A�٦�����ܦn�����H
             sleep(30)
             SAY( OwnerID(), "[SC_422740_1_14]" )---�ĨġA�Q�����a�I
             PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_POINT)
             CastSpell(TargetID(),OwnerID(),491276)
             AddBuff( TargetID(), 504669,1,35)-----�̫�@�ӬO���
	sleep(80)
             if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID(),  422740) == true then
             SetFlag( TargetID(),543305,1)  
	end
             Tell(  TargetID(),OwnerID() , "[SC_422740_1_15]")------
             DisableQuest( OwnerID() , false )
END


function LuaS_422740_11()-----
             sleep(20)
	DW_MoveToFlag( OwnerID() ,780433,8, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,7, 0,1)
	sleep(10)
	DW_MoveToFlag( OwnerID() ,780433,6, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,5, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,4, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,3, 0,1)
             DelObj(OwnerID()) 
end

----------------------------------------------------------------
function LuaS_422741_1()
             	SetSpeakDetail(OwnerID(),"[SC_422741_2]")      
	            SetFlag(OwnerID(),543307,1)
end