
function LuaS_Anter99999999_0()
	AddBuff( OwnerID(),  505463 , 0 , -1 )
	AddBuff( OwnerID(),  505453 , 0 , -1 )		--�S�ĩ�j3
end

function LuaS_Anter99999999_1()
	AddBuff( OwnerID() ,  505462, 0 , -1 )
	AddBuff( OwnerID() ,  505453 , 0 , -1 )		--�S�ĩ�j3
end


function LuaS_Anter99999999_2()
	AddBuff( OwnerID() , 505471  , 0 , -1 )
	AddBuff( OwnerID() , 505454  , 0 , -1 )		--�S�ĩ�j3
end

function LuaS_Anter99999999_3()
	AddBuff( OwnerID() ,  505464  , 0 , -1 )
	AddBuff( OwnerID() ,  505454  , 0 , -1 )	--�S�ĩ�j3
end


--�һݽs���G
function LuaS_422867_0()  --�ˬd�I���~				
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register )  ~= 0	then		--target �K�F����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422867_5]" , 0 )	 --�ؼХ��b���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422867_5]" , 0 ) 
		return true 
	end
	
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0	and
		(CheckAcceptQuest(OwnerID(),422867)== true ) and 	
		(CheckFlag( OwnerID(), 543478 )==true)			then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422867_4]" , 0 )	--�L�h���w�ְO�Чϩ��ٴݦs���e��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422867_4]" , 0 ) 
		return true 
	end
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0	and		----TargetID�O����
		(CheckAcceptQuest(OwnerID(),422867)== true ) 		 	and
		(CheckFlag( OwnerID(), 543478 )==false)			then	
		beginplot( TargetID() , "LuaS_422867_1" , 0 )
		return true 
	end
end

function LuaS_422867_1()  --���\�I����
										--TargetID�O���a						
	writerolevalue( OwnerID() , EM_RoleValue_Register , 1 )				--����g�JRegister�A����O�H�A�s	--TargetID�O���a
	--local Player = {}
	local BodoA = {}
	local BodoB = {}
	for i=1,3,1 do
		BodoA[i] = CreateObjByFlag( 114068 , 780451 , i , 0 ) 			--3�����Ԫ�
		AddToPartition( BodoA[i] , 0 )
		MoveToFlagEnabled( BodoA[i] , false )
		WriteRoleValue( BodoA[i] , EM_RoleValue_Register+1 , i+3 )
	end
	for j=1,3,1 do
		BodoB[j] = CreateObjByFlag( 114067 , 780452 , j , 0 ) 			--3������
		AddToPartition( BodoB[j] , 0 )
		MoveToFlagEnabled( BodoB[j] , false )
		WriteRoleValue( BodoB[j] , EM_RoleValue_Register+1 , j+3 )
	end
	
	local Sa = CreateObjByFlag( 114069 , 780480 , 1 , 0 )  				--�ĺ� <���ʡB����>
	AddToPartition( Sa , 0 )
	DisableQuest( Sa , true )		--�������
	MoveToFlagEnabled(Sa , false )	--��������
	
	local Wood = CreateObjByFlag( 114066 , 780480 , 3 , 0 )  				--����� 
	Lua_ObjDontTouch( Wood ) 
	AddToPartition( Wood , 0 )

	local Ball	  = CreateObjByFlag( 114073 , 780480 , 3 , 0 )  				--���βy	
	Lua_ObjDontTouch( Ball ) 		
	AddToPartition( Ball , 0 )

	sleep(20)
	local An = CreateObjByFlag( 113731, 780480 , 2 , 0 )  				--�w�S�Jù
	AddToPartition( An , 0 )
	DisableQuest( An , true )		--�������
	MoveToFlagEnabled(An , false )	--��������

	sleep(10)
	yell( BodoA[1] , "[SC_422867_0]",2 ) 						 --  �n���F�I
	PlayMotion( BodoA[1] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoA[2] , "[SC_422867_0]",2 )    
	PlayMotion( BodoA[2] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoA[3] , "[SC_422867_0]",2 )    
	PlayMotion( BodoA[3] , ruFUSION_ACTORSTATE_CAST_BEGIN)	     	   	
	sleep(10)
	yell( BodoB[1] , "[SC_422867_1]",2 )   
	PlayMotion( BodoB[1] , ruFUSION_ACTORSTATE_CAST_SP01)	
	yell( BodoB[2] , "[SC_422867_1]",2 )   
	PlayMotion( BodoB[2] , ruFUSION_ACTORSTATE_CAST_SP01)	
	yell( BodoB[3] , "[SC_422867_1]",2 )     					 --  �n���F��
	PlayMotion( BodoB[3] , ruFUSION_ACTORSTATE_CAST_SP01)   	       	
	sleep(10)
	PlayMotion( BodoB[1] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoB[2] , "[SC_422867_1]",2 )   
	PlayMotion( BodoB[2] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoB[3] , "[SC_422867_1]",2 )     
	PlayMotion( BodoB[3] , ruFUSION_ACTORSTATE_CAST_BEGIN)

	for i = 1, 3 , 1 do
		WriteRoleValue( BodoA[i] , EM_RoleValue_Register , 0 )
		beginplot( BodoA[i] , "LuaS_422867_2" , 0 )
	end

	for j = 1, 3 , 1 do
		WriteRoleValue( BodoB[j] , EM_RoleValue_Register , 0 )
		beginplot( BodoB[j] , "LuaS_422867_3" , 0 )
	end

	LuaFunc_MoveToFlag( An , 780480 , 4 ,  0 )						--�w���i
	
	if	CheckID( TargetID() )== false		then					--�T�{TargetID() �O���O���a
		DelObj( BodoA[1] )
		DelObj( BodoA[2] )
		DelObj( BodoA[3] )
		DelObj( BodoB[1] )
		DelObj( BodoB[2] )
		DelObj( BodoB[3] )
		DelObj( Sa )
		DelObj( An )
		DelObj( Wood )
		DelObj( Ball )
		writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	end
	PlayMotionEX(An   ,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	--�w�ʧ@

	AddBuff( Wood ,  505471 , 0 , -1 )--BUFF �����U��
	AddBuff( Ball ,  505488 , 0 , -1 )--
	AddBuff( Ball ,  505454 , 0 , -1 )--��j4��

	sleep(10)
	yell( BodoA[1] , "[SC_422867_2]",2 )  					--�z�I
	PlayMotion( BodoA[1]  , ruFUSION_ACTORSTATE_CAST_SP01)			
	yell( BodoA[2] , "[SC_422867_2]",2 )   	
	PlayMotion( BodoA[2]  , ruFUSION_ACTORSTATE_CAST_SP01)
	yell( BodoA[3] , "[SC_422867_2]",2 )   	
	PlayMotion( BodoA[3]  , ruFUSION_ACTORSTATE_CAST_SP01)
	
	sleep(15)	
	yell( BodoB[1] , "[SC_422867_3]",2 )   				--�z�I	
	PlayMotion( BodoB[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	yell( BodoB[2] , "[SC_422867_3]",2 )   	
	PlayMotion( BodoB[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE1)			
	yell( BodoB[3] , "[SC_422867_3]",2 )   --�n���F��n���F��
	PlayMotion( BodoB[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(25)
--	PlayMotion( An , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	PlayMotion( BodoA[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoA[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
--	PlayMotion( An , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	PlayMotion( BodoA[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
--	PlayMotion( An , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	--�i�hA�BB���X���R�ʧ@
	PlayMotion(An,ruFUSION_ACTORSTATE_CAST_END)	
	sleep(30)
	PlayMotion( BodoA[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoA[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoA[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion(  An   ,  ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )

	for i = 1, 3 , 1 do
		WriteRoleValue(BodoA[i] , EM_RoleValue_Register , 1 )
		beginplot(BodoA[i]  , "LuaS_422867_2" , 0 )
	end
	for j = 1, 3 , 1 do
		WriteRoleValue( BodoB[j]  , EM_RoleValue_Register , 1 )
		beginplot( BodoB[j]  , "LuaS_422867_3" , 0 )
	end
	
	DelObj( Sa )
	DelObj( An )
	DelObj( Wood )
	DelObj( Ball )

	--�ˬd���󵹧������ȺX��
	if	CheckAcceptQuest(TargetID(), 422867 ) == true	and	CheckFlag( TargetID() , 543478 ) == false	then   
		SetFlag(TargetID(), 543478 , 1)
	end

	writerolevalue( OwnerID() , EM_RoleValue_Register , 0 )				--�⯾�誺�ȼg�^�h
end

function LuaS_422867_2()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0	then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
		LuaFunc_MoveToFlag(OwnerID(), 780451 , Flag,  0 )
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0	then
		DelObj( OwnerID() )
	end
end

function LuaS_422867_3()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0	then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
		LuaFunc_MoveToFlag(OwnerID(), 780452 , Flag,  0 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0 	then
		DelObj( OwnerID() )
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422869 �J��N��<���>

function LuaS_422869_10()  --�c�����Ԫ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_11",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_11()  
	SetSpeakDetail(OwnerID(),"[SC_422869_0]")					--�A�I�N�O�A����[113301]�`��D�ܦ��o�ˡI��[113301]�٦^�ӡ�
	SetFlag( OwnerID() , 543483 , 1 )						--���X��
end

function LuaS_422869_20()  --�U�k���y��
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_21",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_21()  
	SetSpeakDetail(OwnerID(),"[SC_422869_1]")					--�X�i�h�٨S�����A���e�֨��a��
	SetFlag( OwnerID() , 543484 , 1 )						--���X��
end
	
function LuaS_422869_30()  --�M�l�b�ƪ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_31",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_31()  
	SetSpeakDetail(OwnerID(),"[SC_422869_2]")					--�p�G�����{�b�^�ӡA�L�N��a���ڭ̸ѨM��k�F��u�a�ө_�ݪ��i�h�v�A�L�q�S���ڭ̥���L�I
	SetFlag( OwnerID() , 543485 , 1 )						--���X��
end

function LuaS_422869_40()  --�M�l�ĺ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_41",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_41()  
	SetSpeakDetail(OwnerID(),"[SC_422869_3]")					--[113288]�ĺ��ܨ��W�A�������b���O�L���U�j�a��s�o�����a�����n�L�O�ߡA�گ����W���򦣡H
	SetFlag( OwnerID() , 543479 , 1 )						--���X��
end

function LuaS_422869_50()  --�U�k�ĺ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_51",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_51()  
	SetSpeakDetail(OwnerID(),"[SC_422869_4]")					--�O�X���H�a�H�L�̬ݨ��ڭ̤@�B�@�B�����a���A��O�S�A�@���U��K
	SetFlag( OwnerID() , 543480 , 1 )						--���X��
end

function LuaS_422869_60()  --�P�٩��Ԫ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_61",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_61()  
	SetSpeakDetail(OwnerID(),"[SC_422869_5]")					--���F�ͮ�F�I�ҥH���F�����ܤF�I�I
	SetFlag( OwnerID() , 543486 , 1 )						--���X��
end


function LuaS_422869_70()  --�c���ĺ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_71",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_71()  
	SetSpeakDetail(OwnerID(),"[SC_422869_6]")					--�j�楴�}[ZONE_THE GREAT BARRIER]�K�ڥ��N�O�ӿ��~�C
	SetFlag( OwnerID() , 543481 , 1 )						--���X��
end

function LuaS_422869_80()  --�P���ĺ�
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_81",0) 	--�A��o�����F�V�æ�����N���H
	end
end

function LuaS_422869_81()  
	SetSpeakDetail(OwnerID(),"[SC_422869_7]")					--ť���H�e�O�a�ܦh���Ƨ�[ZONE_THE GREAT BARRIER]�ʰ_��
	
	SetFlag( OwnerID() , 543482 , 1 )						--���X��
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--����

function LuaS_114070_0()	--�X�ͼ@��--���������Q�ب�C���W�ɡA���إX5���i�h--��CLIENT�צ�

	local Bodo1 = CreateObjByFlag( 114179 , 780453 , 1 , 1 )	 	
	AddToPartition(  Bodo1 , 0 )
	DisableQuest( Bodo1 , true )					--�������
	MoveToFlagEnabled(Bodo1 , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1,Bodo1 )	--�N�i�h1���g�i����������

	local Bodo2 = CreateObjByFlag( 114180,780453,2,1 )
	AddToPartition(  Bodo2 , 0 )
	DisableQuest( Bodo2 , true )					--�������
	MoveToFlagEnabled(Bodo2 , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2,Bodo2 )	--�N�i�h2���g�i����������

	local Bodo3 = CreateObjByFlag( 114270,780453,3 ,1)
	AddToPartition(  Bodo3 , 0 )
	DisableQuest( Bodo3 , true )					--�������
	MoveToFlagEnabled(Bodo3 , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,Bodo3 )	--�N�i�h3���g�i����������

	local Bodo4 =CreateObjByFlag( 114271,780453,4,1)	
	AddToPartition(  Bodo4 , 0 )
	DisableQuest( Bodo4 , true )					--�������
	MoveToFlagEnabled(Bodo4 , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4,Bodo4 )	--�N�i�h4���g�i����������

	local Bodo5 =CreateObjByFlag( 114178,780453,5,1 )	
	AddToPartition(  Bodo5 , 0 )
	DisableQuest( Bodo5 , true )					--�������
	MoveToFlagEnabled(Bodo5 , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5,Bodo5 )	--�N�i�h5���g�i����������
end


function LuaS_422870_0()  --���᱾�촣���������W
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422870)== true )and( CheckCompleteQuest( OwnerID(),422870)== false) and 
		ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) == 0 					and
		(CheckFlag( OwnerID(), 543498 )==false)								then
		SetFlag( OwnerID() , 543500  , 0 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422870_0]","LuaS_422870_98",0) 		--�ڥi�H��������H
	end
	if	(CheckAcceptQuest(OwnerID(),422870)== true )and( CheckCompleteQuest( OwnerID(),422870)== false)	and
		 ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) ~= 0					and
		(CheckFlag( OwnerID(), 543498 )==false)								then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422870_0]","LuaS_422870_99",0) 	--�ڥi�H��������H
	end
	
end

function LuaS_422870_99()
	SetSpeakDetail(OwnerID(),"[SC_422869_99]")						--(���������ĺ����G�b��ұq��B�}�l�C)
end

function LuaS_422870_98()
	CloseSpeak( OwnerID() )	
	BeginPlot(TargetID(),"LuaS_422870_1",0)	
end

function LuaS_422870_1()
										--target�O���a
	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 1 )
	say(OwnerID(),"[SC_422870_1]")					--�ݷ|�A�u�n�K
	local Bodo = CreateObjByFlag( 114020 , 780453 , 10 , 0 )	 		--���B���i�h
	AddToPartition(  Bodo , 0 )
	DisableQuest( Bodo , true )						--�������
	MoveToFlagEnabled(Bodo , false )					--��������.
	PlayMotion(  Bodo   ,  ruFUSION_ACTORSTATE_BUFF_SP01 )
	yell( Bodo , "[SC_422870_2]",2 )   					--�O�����I�����^�ӤF�I
	sleep(20)
	PlayMotion(  Bodo   ,  ruFUSION_ACTORSTATE_BUFF_SP01 )
	local Bodo1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	WriteRoleValue(Bodo1, EM_RoleValue_IsWalk, 0 )
	yell( Bodo1 , "[SC_422870_3]",3 ) 					--�֡K�֡I�ְk�K���n�C
	sleep(10)
	local Bodo2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) 
	WriteRoleValue(Bodo2, EM_RoleValue_IsWalk, 0 )
	yell( Bodo2 , "[SC_422870_4]",2 ) 					--�����K�O�B�O�����K
	sleep(20)

	local Bodo3=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	WriteRoleValue(Bodo3, EM_RoleValue_IsWalk, 0 )
	yell( Bodo3 , "[SC_422870_5]",2 )					--�O�򭩪����u��W�I
	sleep(10)
	local Bodo4=ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) 
	WriteRoleValue(Bodo4, EM_RoleValue_IsWalk, 0 )	
	yell( Bodo4 , "[SC_422870_6]",2 )					--��A���n�A�Q�L�˦Q��W���O�K���D��Q�F�I
	sleep(10)
	local Bodo5=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) 
	WriteRoleValue(Bodo5, EM_RoleValue_IsWalk, 0 )
	yell( Bodo5 , "[SC_422870_7]",2 )					--�O�����I�u�a�ө_�ݪ��i�h�v�ڡI���Ʊ�F�I
	sleep(20)

		BeginPlot(Bodo1,"LuaS_422870_2",0)				--�ಾ4���i�h
		BeginPlot(Bodo2,"LuaS_422870_3",0)	
		BeginPlot(Bodo3,"LuaS_422870_4",0)	
		BeginPlot(Bodo4,"LuaS_422870_5",0)	
	
		SetFlag( TargetID() , 543500  , 1 )				--��X��543500�����a�A�ݨ��t�~CLIENT���n���i�h�A�쥻���W4������
	
	local HWALIYA = CreateObjByFlag( 114276 , 780453 , 11 , 0 )		--����--�t���M����
	AddToPartition(  HWALIYA , 0 )
	WriteRoleValue(HWALIYA , EM_RoleValue_IsWalk, 1 )
	DisableQuest( HWALIYA , true )					--�������
	MoveToFlagEnabled( HWALIYA, false)
	sleep(30)
	BeginPlot(HWALIYA ,"LuaS_422870_6",0)	
	sleep(30)
	yell( HWALIYA , "[SC_422870_8]",2 )					--���������C
	sleep(20)
	--���������ʧ@
	yell( OwnerID() , "[SC_422870_9]",2 )					--�P�´�D���z�ٰO�o�^�������C
	sleep(20)
	yell( HWALIYA , "[SC_422870_10]",2 )				--�@�}�l�����A�A�Ǩ�H�����s�����ܤ覡�F�A��ª��A�Q�ð_�ӤF�H
	sleep(20)
	yell( OwnerID() , "[SC_422870_11]",2 )				--�u�n���̪��i�h��O����l��´N�n�C
	sleep(20)
	PlayMotion(  HWALIYA   ,  ruFUSION_ACTORSTATE_PARRY_UNARMED )
	yell( HWALIYA , "[SC_422870_12]",2 )				--��K�n���F�����S���A�ڪ����ܤ��w���Ҧ����d������A���W�K
	sleep(20)
	yell( OwnerID() , "[SC_422870_13]",2 )				--�K�����H�z��軡�H
	sleep(20)
	PlayMotion(  HWALIYA   ,  ruFUSION_ACTORSTATE_HURT_CRITICAL )
	yell( HWALIYA , "[SC_422870_14]",2 )				--���A�S�����]�����n�F�n�Y�^
	sleep(20)
	PlayMotion(  HWALIYA   ,  ruFUSION_ACTORSTATE_BUFF_SP01 )
	yell( HWALIYA , "[SC_422870_15]",2 )				--�K��j�a���T�ܭW�y��������㯫�F�̭�n��X���|�n�n�𮧤��]�ܦn�H
	sleep(20)
		if	CheckID( TargetID() )== true	and	(CheckFlag( TargetID(), 543498 )==false)		then
		SetFlag( TargetID() , 543498  , 1 )
		writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	end
	DelObj(Bodo)
	DelObj(HWALIYA)

	while true do
		sleep(10)
		if CheckID(TargetID())==false then			
			writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
			break
		end
	end
end

function LuaS_422870_2()
	LuaFunc_MoveToFlag( OwnerID(),780453,6,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 1)	
end

function LuaS_422870_3()
	LuaFunc_MoveToFlag( OwnerID(),780453,7,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 2)	
end

function LuaS_422870_4()
	LuaFunc_MoveToFlag( OwnerID(),780453,8,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 3 )	
end

function LuaS_422870_5()
	LuaFunc_MoveToFlag( OwnerID(),780453,9,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 4)	
end

function LuaS_422870_6()
	LuaFunc_MoveToFlag( OwnerID(),780453,12,0)
end

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--422871 �b�������q�e��<�j���t��>	�X�l�G(780454 1-)

function LuaS_422871_0()
	LoadQuestOption( OwnerID() )
		writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	if	(CheckAcceptQuest(OwnerID(),422871)== true )and( CheckCompleteQuest( OwnerID(),422871)== false) and 
		ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 					and
		(CheckFlag( OwnerID(), 543499 )==false)								then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422871_0]","LuaS_422871_1",0) 		--���ӪF��n���ڬݡH
	end
	if	(CheckAcceptQuest(OwnerID(),422871)== true )and( CheckCompleteQuest( OwnerID(),422871)== false)	and
		 ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) ~= 0					and
		(CheckFlag( OwnerID(), 543499 )==false)								then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422871_0]","LuaS_422871_99",0) 		--���ӪF��n���ڬݡH
	end
end

function LuaS_422871_99()
	SetSpeakDetail(OwnerID(),"[SC_422871_99]")							--��A���ڭn�b����������ʫe����L�����@�U��
end

function LuaS_422871_1()
												--OwnerID�O���a
	--SetSpeakDetail(OwnerID(),"[SC_422871_1]")							--��A�d�~�e�ʦL���Ԫ��䤤�@���A�]���t�۫�������C
	--sleep(30)
 	writerolevalue( TargetID() , EM_RoleValue_Register+1 , 1 )
	BeginPlot( TargetID() , "LuaS_422871_2" , 0 )	
end

function LuaS_422871_2()
	CloseSpeak( TargetID() )									--OwnerID�O�M����	
	Addbuff( TargetID() , 505465 , 0 , 90 )		
	local HWA= Lua_DW_CreateObj("flag" ,114171,780454,1 ) 					--�إX�t���μM�����A�쥻��client����
	DisableQuest( HWA , true )									--�������
	MoveToFlagEnabled(HWA , false )								--��������

	say(HWA,"[SC_422871_2]")									--��ڨӡ�
	LuaFunc_MoveToFlag( HWA,780454,4,0)							--����
	say(HWA,"[SC_422871_3]")									--�o�O�Ԫ����q�ʦL�T������ɨ��
	LuaFunc_MoveToFlag( HWA,780454,2,0)


 	local Anter = Lua_DW_CreateObj("flag" ,114176,780454,3 ) 			--�إX�w�S�Jù
	DisableQuest( Anter , true )		--�������
	MoveToFlagEnabled(Anter , false )	--��������

	local Bodo  = Lua_DW_CreateObj("flag" ,114172,780454,5 ) 			--�إX�i�h����
	DisableQuest( Bodo , true )		--�������
	MoveToFlagEnabled(Bodo , false )	--��������

	local Human  = Lua_DW_CreateObj("flag" ,114175,780454,6 ) 			--�إX�j�H��
	DisableQuest( Human , true )		--�������
	MoveToFlagEnabled(Human , false )	--��������

	local ancient1 = Lua_DW_CreateObj("flag" ,114173,780454,7 ) 			--�إX�j���F1��
	DisableQuest( ancient1 , true )		--�������
	MoveToFlagEnabled(ancient1 , false )	--��������

	local ancient2 = Lua_DW_CreateObj("flag" ,114174,780454,8 ) 			--�إX�j���F2��
	DisableQuest( ancient2 , true )		--�������
	MoveToFlagEnabled(ancient2 , false )	--��������
	sleep(20)
	PlayMotionEX(Anter,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	PlayMotionEX(ancient1,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	PlayMotionEX(ancient2,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	sleep( 10 )
--���J�ˬd
	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		AddBuff( Anter , 504936 , 0 , 5 )
		AddBuff( Anter , 505179 , 0 , 10 )
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

	sleep(10)
	local TTRR= Lua_DW_CreateObj("flag" ,114073,780454,14 ) 			--�إX�I�k�����βy
	Lua_ObjDontTouch( TTRR )
	
	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		CastSpell( ancient1 , TTRR, 494801)
		CastSpell( ancient2 , TTRR, 494801)
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(TTRR)	--�R�����βy
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end
	
	sleep(10)
	local BALL= Lua_DW_CreateObj("flag" ,114073,780454,13 ) 			--�إX�I�k�����βy
	Lua_ObjDontTouch( BALL)
	DisableQuest( ancient1 , true )		--�������
	MoveToFlagEnabled(ancient1 , false )	--��������

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		CastSpell( TTRR, TTRR, 494800)
			
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(TTRR)	--�R�����βy
		DelObj(BALL)	--�R�����βy
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

						
	sleep(30)
	PlayMotion(ancient1,ruFUSION_ACTORSTATE_CHANNEL_END)
	PlayMotion(ancient2,ruFUSION_ACTORSTATE_CHANNEL_END)
	yell( Bodo ,"[SC_422871_4]",2 )						--�i�h�����G�ɶ���F...�F���\�S����Ӥ@�}�l�����h���K
	PlayMotion(Anter,ruFUSION_ACTORSTATE_CHANNEL_END)			--�w��U��
	sleep(20)	
	PlayMotion(Human ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)		--<�n�Y>
	yell( Human ,"[SC_422871_5]",2 )						--�j�H���G�ݼˤl�A�̭����Ԫp�O�w�������}�x�����ΡC
	sleep(20)
	yell( ancient1 , "[SC_422871_7]",2 )
	sleep(20)
	yell( Anter ,"[SC_422871_6]",2 )						--�w�S�Jù�G���ڨӧa�A�u�n�ڧⲦ�ͪ��O�q���[�Ѧb�T����W�C
	sleep(20)

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		AdjustFaceDir( ancient1 , Anter, 0 )
           	    	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		yell( ancient1 , "[SC_422871_8]",2 )						--�j���F�G���F���I�o�˱z�|�K�Ӻɦ۵M���O�����F�S���s���U�Ӫ�		
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(TTRR)	--�R�����βy
		DelObj(BALL)	--�R�����βy
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end	      
	AdjustFaceDir( ancient2 , Anter, 0 )
               	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(20)
	PlayMotion(  Anter, ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	yell( Anter ,  "[SC_422871_9]",2 )						--�w�S�Jù�G���ɦ���A�o�O�ߤ@�B�̧֪��覡�A�Χڪ��O�q���N�۵M���ۡAĹ�o�ԨƳӧQ�~��u����o��í�C
	sleep(30)
	AdjustFaceDir( Bodo  , Anter, 0 )
	yell( Bodo  ,  "[SC_422871_10]",2 )						--�i�h�����G���F���K
	sleep(20)
	yell( Anter ,"[SC_422871_16]",2 )						--�w�S�Jù�G�ѤU���ƥ浹�A�̧����F�C
	sleep(20)
	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	yell( ancient1 ,  "[SC_422871_17]",2 )						--�Կ�ڤ����N�I
	yell( ancient2 ,  "[SC_422871_17]",2 )						--�Կ�ڤ����N�I
	sleep(20)
	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_CROUCH_END)
	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_CROUCH_END)
	AdjustFaceDir( ancient1 , TTRR, 0 )
	AdjustFaceDir( ancient2 , TTRR, 0 )
	PlayMotionEX(Anter,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)		--�w�I�k�ʧ@

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		AddBuff( Anter , 504936 , 0 , 5 )
		AddBuff( Anter , 505179 , 0 , 5 )
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(TTRR)	--�R�����βy
		DelObj(BALL)	--�R�����βy
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

	PlayMotionEX(ancient1 ,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	
	PlayMotionEX(ancient2 ,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	
	sleep(10)
	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		CastSpell( Anter, BALL, 494799)
		CastSpell( ancient1 , BALL, 494803)
		CastSpell( ancient2 , BALL, 494803)
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(TTRR)	--�R�����βy
		DelObj(BALL)	--�R�����βy
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

	sleep(20)
	local EE= Lua_DW_CreateObj("flag" ,114283,780454,13 ) 							--�إX����
	sleep(20)
	PlayMotion(Anter,ruFUSION_ACTORSTATE_CAST_END)							--�����I�k
	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_CAST_END)		
	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_CAST_END)

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() �O���a
		AddBuff( Anter , 505486, 0 , 5 )
	else
		DelObj(HWA)	--�R���t���M����
		DelObj(EE)	--����
		DelObj(TTRR)	--�R�����βy
		DelObj(BALL)	--�R�����βy
		DelObj(Anter)	--�R���w�S�Jù
		DelObj(Bodo)	--�R���i�h����
		DelObj(Human)	--�R���j�H��
		DelObj(ancient1)	--�R���j���F1��
		DelObj(ancient2)	--�R���j���F2��
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end
			
	sleep(10)
	SetDefIdleMotion( Anter, ruFUSION_MIME_DEATH_DOWN)						--�w�ˤU
	WriteRoleValue(Bodo, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(Human, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(ancient1 , EM_RoleValue_IsWalk, 0 )
	sleep(10)
	yell( ancient1 ,  "[SC_422871_13]",2 )									--�j���F�G���I 
	BeginPlot(ancient2,"LuaS_422871_3",0)
	sleep(5)
	LuaFunc_MoveToFlag(  ancient1,780454,10,0)								--���F1���ͫe
	BeginPlot(Bodo,"LuaS_422871_4",0)
	BeginPlot(Human,"LuaS_422871_5",0)
	PlayMotion(ancient1,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(20)
	
	if	(CheckAcceptQuest(TargetID(),422871)==true )	and	(CheckFlag( TargetID(), 543499 )==false)	and
		CheckBuff( TargetID() , 505465 ) == true							then
		SetFlag( TargetID() , 543499  , 1 )
		writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	end
	sleep(10)
	DelObj(TTRR)						--�R�����βy
	DelObj(BALL)						--�R�����βy
	DelObj(EE)						--�R������
	DelObj(Anter)						--�R���w�S�Jù
	DelObj(Bodo)						--�R���i�h����
	DelObj(Human)						--�R���j�H��
	DelObj(ancient1)						--�R���j���F1��
	DelObj(ancient2)						--�R���j���F2��
	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	yell( HWA ,"[SC_422871_15]",2 )	
	LuaFunc_MoveToFlag( HWA ,780454,11,0)
	DelObj(HWA)						--�R���t���M����
	CancelBuff_NoEvent( TargetID() , 505465 )		
end

function LuaS_422871_3()
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 0 )
	LuaFunc_MoveToFlag( OwnerID() ,780454,12,0)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	yell( OwnerID() ,  "[SC_422871_14]",2 )	--�j���F2���G���F���I
end

function LuaS_422871_4()
	LuaFunc_MoveToFlag( OwnerID() ,780454,16,0)
	yell( OwnerID() ,  "[SC_422871_14]",2 )	--�j���F2���G���F���I
end

function LuaS_422871_5()
	LuaFunc_MoveToFlag( OwnerID() ,780454,15,0)
	yell( OwnerID() ,  "[SC_422871_14]",2 )	--�j���F2���G���F���I
end

function LuaI_422871_6() --�����ȮɧR��BUFF			
	
	if (CheckAcceptQuest(OwnerID(),422871)==false)and(CheckCompleteQuest(OwnerID(),422871)==false) then
	
		SetFlag( OwnerID() , 543499  , 0 )
		CancelBuff( OwnerID() , 505465 )
	end
end
