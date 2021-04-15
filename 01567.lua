-----�೽�H���`�@���A�����v�֤T�}�Y�X��543439

function LuaS_102797()  
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	GetDistance(Party[i] , TargetID() ) < 200 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
				SetFlag(Party[i] , 543439 , 1)	
		end
	end
	return true
end


--422775�ѱϥj����	�һݽs���G�j����113634	�F�Դ�113635	�u���ľ�206140
function LuaI_113634_0()
	SetPlot( OwnerID() , "range" , "LuaI_113634_1" , 120 )
end

function LuaI_113634_1()
	if CheckFlag( OwnerID() , 543439 ) == false then
		if LuaFunc_SearchNPCbyOrgID( TargetID() ,102797, 50 ) ~= -1 then
			Tell( OwnerID() , TargetID() , "[SC_422775_PRE]" )
		end
	end
end

function LuaS_422775_0()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422775)== true )and( CheckCompleteQuest( OwnerID(),422775)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422775_0]","LuaS_422775_1",0) 	--�ݭn�����A���򦣡H�j�����C
	end

	if (CheckAcceptQuest(OwnerID(),422775)== true )and( CheckCompleteQuest( OwnerID(),422775)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422775_2]","LuaS_422775_2",0)		 --�j�����A�A���󤣥��ϥάu���ľ��Ӫv���ۤv���}�H	
	end


end

function LuaS_422775_1()
	SetSpeakDetail(OwnerID(),"[SC_422775_1]")						--�j�������n��u���ľ��e�h���F�Դ��A�L�N�b���L�W�W�誺ĵ�ƾn����a��
	if	CountBodyItem( OwnerID(), 206140)<1	then
		GiveBodyItem( OwnerID(), 206140, 1 )	
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113495_16]","LuaS_422775_0",0)		--�߰ݨ�L���D
end


function LuaS_422775_2()
	SetSpeakDetail(OwnerID(),"[SC_422775_3]")						--�j�n�H�A���§A���j�����۷Q�A�A�G�u�O�Ӥj�n�H�I
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422776
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------���몺§���H	
--422776 ���몺§���H	�һݽs���G�Z��R��ĵ�ƶ���113641	�Z��R��ĵ�ƶ���113642	��T����c113662	�u���ľ�113644	�X�l780451(1-4)	780452(1-3)

function LuaS_422776_CHECK()  		--���b�I�����~��<113662��T����c>�A���\�A���������X�СA�޵o����@��

	if ReadRoleValue( TargetID() ,EM_RoleValue_Register  ) == 0 then
		if (CheckAcceptQuest(OwnerID(),422776)==true )and( CheckCompleteQuest( OwnerID(),422776)==false)	then
			if (CountBodyItem( OwnerID(),206140) >0) and(CheckFlag( OwnerID(), 543382 )==false)	then
				return true	
			end
			if (CountBodyItem( OwnerID(),206140) <1) and(CheckFlag( OwnerID(), 543382 )==false)		then
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_0]" , 0 )		--�A�S���u���ľ�206140
				return false
			end
			if CheckFlag( OwnerID(),543382 )== true	  	then	
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_1]" , 0 )		--�A�w�g��L�u���ľ�206140
				return false
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_TARGETBUSY_DW]" , 0 )			--�ؼа���@�����I
		return false
	end
end

function LuaS_422776_0()  
	DelBodyItem( OwnerID(), 206140, 1 )
	AddBuff( OwnerID() , 505033 , 10 , -1 )
	SetFlag( OwnerID() , 543382  , 1 )
	if ReadRoleValue( TargetID() ,EM_RoleValue_Register  ) == 0 then
		BeginPlot( TargetID() , "LuaS_422776_1" , 0 )				--���涤������@��
	end
	return true
end	
-----------------

function LuaS_422776_1()  									--OwnerID�O��c.TargetID�O���a
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register , 1 )		
	local Aa = Lua_DW_CreateObj("flag" ,113641,780451,2 ) 					--�إX����(�S���X�Ӫ��ܦAaddtopartition(XX,0))
	local Bb = Lua_DW_CreateObj("flag" ,113642,780452,1 ) 					--�إX���A
	WriteRoleValue ( Aa  , EM_RoleValue_PID, Bb)						--����A��PID�g�i���ҡA��K�H����a���A	
	MoveToFlagEnabled(Aa , false )							--��������<�q�{�b�}�l�A���Ҫ���ʳ��b�X�l�x����>
	WriteRoleValue( Aa ,EM_RoleValue_IsWalk , 1 )						--�Ψ���
	MoveToFlagEnabled(Bb , false )	
	WriteRoleValue( Bb ,EM_RoleValue_IsWalk , 0 )
	LuaFunc_MoveToFlag( Aa,780451,3,0)							--����<���Ҩ���c�l�e>
	PlayMotion(  Aa ,ruFUSION_ACTORSTATE_EMOTE_POINT)		
	Yell( Aa , "[SC_113641_0]" , 3 )							--���Ҹ���A�}�l����(���i��ĵ�ƶ���...)															--�֨ӬݡI�S���ĤS�X�{�F�I
	LuaFunc_MoveToFlag( Bb,780452,2,0)							--���A�i�H�ߤ@�I����c�l�e<�p�]�B�H>
	sleep(20)												
	AdjustFaceDir( Bb , OwnerID() , 0 )
	Yell( Bb , "[SC_113642_0]" , 3 )							--���ӯu�_�ǡA�C���u�n�������V�W���ǯf�A�o�ĴN�|�X�{�C
	sleep(30)
	AdjustFaceDir( Aa , Bb , 0 )
	PlayMotion(  Aa ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Aa , "[SC_113641_1]" , 3 )							--�O�ڡI�N���o�̪��~���ǻ����C
	sleep(30)
	PlayMotion(  Bb ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Bb , "[SC_113642_1]" , 3 )							--�A���e�Ī��˪L����ܡH�ڭ�ť���٤��۫H�A�{�b�˦��Iı�o�O�u���C
	sleep(30)
	PlayMotion(  Aa ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Aa , "[SC_113641_2]" , 3 )							--�ӥB�o���īD�`���ġA��b�O���F�j���C	
	sleep(30)	
	PlayMotion(  Bb ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Bb , "[SC_113642_2]" , 3 )							--�쩳�O�ְe�Ӫ��H�u�Q�ݬݥL�̡K�K
	sleep(30)
	Yell( Aa , "[SC_113641_3]" , 3 )							--�֡A�ݭn���Ī��H�٦b���ۡA�ڭ̧֧��İe�L�h�a�I
	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID() , 505033 )
	end
	PlayMotion(Aa,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	PlayMotion(Aa,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(20)
	PlayMotion(Aa,ruFUSION_ACTORSTATE_CRAFTING_END)
	PlayMotion(Aa,ruFUSION_ACTORSTATE_PARRY_1H)
	sleep(30)
	BeginPlot(Aa,"LuaS_422776_2",0)							--���A�}�l�ǳƭn�e���U�@�Ӧa��N��...
	LuaFunc_MoveToFlag( Aa,780451,4,0)							
	DelObj (Aa)									--�R������
	writerolevalue( OwnerID() , EM_RoleValue_Register  , 0 )	
end

function LuaS_422776_2() 
	Local Bb = ReadRoleValue(OwnerID(),EM_RoleValue_PID)					--Ū�����e�s�b���Ҩ��W��PID
	LuaFunc_MoveToFlag( Bb,780452,3,0)
	DelObj (Bb)									--�R�����A
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422777
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�h�d���]�ݭn��	
--422777 �h�d���]�ݭn��	

function LuaS_422777_CHECK()  		--���b�I�����~��<113663�~�������m���d>�A���\�A���������X�СA�޵o����@��

	if ReadRoleValue( TargetID() ,EM_RoleValue_Register  ) == 0 then
		if (CheckAcceptQuest(OwnerID(),422777)==true )and( CheckCompleteQuest( OwnerID(),422777)==false)	then
			if (CountBodyItem( OwnerID(),206140) >0) and(CheckFlag( OwnerID(), 543392 )==false)	then
				return true	
			end
			if (CountBodyItem( OwnerID(),206140) <1) and(CheckFlag( OwnerID(), 543392 )==false)		then
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_0]" , 0 )		--�A�S���u���ľ�206140
				return false
			end
			if CheckFlag( OwnerID(),543392 )== true	  	then	
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_1]" , 0 )		--�A�w�g��L�u���ľ�206140
				return false
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_TARGETBUSY_DW]" , 0 )			--�ؼа���@�����I
		return false
	end
end




function LuaS_422777_0()  		--���b�I�����~��<113663�~�������m���d>�A���\�A���������X�СA�޵o����@��
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )	
	AddBuff( OwnerID() , 505033 , 10 , -1 )
	SetFlag( OwnerID() , 543392  , 1 )					--���X��
	DelBodyItem( OwnerID(), 206140, 1 )
	BeginPlot( TargetID() , "LuaS_422777_1" , 0 )																
	return true
end


function LuaS_422777_99()	--���b�m���d��l�@��
	local GI = Lua_DW_CreateObj("flag" ,113636,780454,2 )	--�m���d�X�͡A�s�y�~����
	PlayMotionEX( GI, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID,GI )	--�NOwnerID()<�m���d>�g�iGI�~������
	WriteRoleValue ( GI , EM_RoleValue_PID, OwnerID())
end

function LuaS_422777_1()
	local BOT = Lua_DW_CreateObj("flag" ,113640,780454,3 )					--�f�S�X��
	local GI = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	DisableQuest(GI ,true )
	MoveToFlagEnabled(BOT , false )							--��������<�q�{�b�}�l�A���l�f�S����ʳ��b�X�l�x����>
	WriteRoleValue( BOT ,EM_RoleValue_IsWalk , 1 )					--�Ψ���
	LuaFunc_MoveToFlag( BOT,780454,4,0)						--����<���l�����į�v���e>
	say(BOT,"[SC_422777_0]")								--�A......�O�~���������ѶܡH�۱q�L�V�F�f�A�N���h�F�۫H�A�L���O���u�q�����Įv�C
	sleep(20)
--	say(TargetID(),"[SC_422777_1]")							--TargetID�O���a--���A�ڬO���H���U�A�n�e�ľ������Įv�~�������C
	sleep(20)
	say(GI ,"[SC_422777_2]")								--��......�ڨS��......
	sleep(20)
	say(BOT,"[SC_422777_3]")								--���@�U�A�o��_�I�̡A�A���Ӫ��O�˪L���몺�ľ��ܡH
	sleep(20)			
	PlayMotion( BOT,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)				
	say(BOT,"[SC_422777_4]")							--�S���C						
	sleep(20)
	PlayMotion(BOT, ruFUSION_ACTORSTATE_EMOTE_CRY)
	say(BOT,"[SC_422777_5]")								--�~�������ϤF�I
	CancelBuff( TargetID() , 505033 )
	sleep(20)
	PlayMotion(BOT, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(20)
	AdjustFaceDir( BOT,GI , 0 ) 
	PlayMotion(BOT, ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep(10)
	PlayMotion(BOT,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	PlayMotion(BOT,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(20)
	PlayMotion(BOT,ruFUSION_ACTORSTATE_CROUCH_END)				--�f�S�N�ľ����~�����ܤU�C
	sleep(20)
	PlayMotion( GI  ,ruFUSION_MIME_SLEEP_UP)
	sleep(10)
	PlayMotion( GI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	say(GI ,"[SC_422777_6]")								--��A���¦n�ߪ��˪L����ڡI
	sleep(20)	
	PlayMotion( GI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	say(GI ,"[SC_422777_7]")								--���¦n�ߪ��˪L����A��L�ͯf���H�]���ϤF�A�f�S�A�ЧA�N�Ĥ��e���f�H�a�I
	sleep(15)
	PlayMotion(BOT, ruFUSION_ACTORSTATE_EMOTE_EAT)
	say(BOT,"[SC_422777_8]")
	sleep(20)
	say(BOT,"[SC_422777_9]")								--[113636]�A��d�_�A�٬O���U�h�𮧤@�|��a�I
	sleep(20)
	say(GI ,"[SC_422777_10]")							--�n
	sleep(20)
	PlayMotionEX( GI, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(20)
	LuaFunc_MoveToFlag( BOT,780454,5,0)						--����<���l������u�~>	
	DelObj (BOT)
	--PlayMotion( GI  ,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
	writerolevalue( OwnerID() , EM_RoleValue_Register  , 0 )	
	DisableQuest(GI ,false )
end




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422778
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�˪L����ǻ�
--422778 �˪L����ǻ�	�~����113636	�F�Դ�113635

function LuaS_422778_0()  
	--say(OwnerID(),"O..O")
	--say(TargetID(),"T_T")
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422778)== true )and( CheckCompleteQuest( OwnerID(),422778)== false) 	then
		--say(OwnerID(),"O..O")
		--say(TargetID(),"T_T")
--		PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--		PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422778_0]","LuaS_422778_1",0)		 --��......��򻡩O�H�O�@���Y�j�j���B���ֽ����p�å뵹�ڪ��C
		
	end	
end

function LuaS_422778_1()
	SetSpeakDetail(OwnerID(),"[SC_422778_1]")						--�o......�c�A��ڷQ�������˪L���뤣�ӬۦP�ڡI�O�o���٤p���ɭԡA�ڥ��˴N��...				
--	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--	PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
				
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422778_2]","LuaS_422778_2",0) 		--����˪��ǻ��A�i�H�i�D�ڶܡH�]�Aı�o�F�Դ��γ\�|��o�ӡ��ǻ��G�ơ��P����^
end

function LuaS_422778_2()
	SetSpeakDetail(OwnerID(),"[SC_422778_3]")						--��M�A�ګַܼN�o�򰵡C���ٰO�o�ڥ��ˬO�o��i�D�ڪ��w�w�ܤ[�ܤ[�H�e...	
	SetFlag( OwnerID() , 543393 , 1 )							--���X��
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422779
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------���Įv���·N
--422779 ���Įv���·N

function LuaS_422779()
	playmotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_idle)
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422780
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�e�Ĩ�w�ȥd
--422780 �e�Ĩ�w�ȥd

function LuaS_422780_0()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422780)== true )and( CheckCompleteQuest( OwnerID(),422780)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422780_0]","LuaS_422780_1",0) 	--�n�ڡA�ڷQ�Q�~�����O��򻡪��C��A�b�ܤ[�ܤ[�H�e�K�K(�A�@���@�Q����z�~�����i�D�A���G��)
	end	
end

function LuaS_422780_1()
	SetSpeakDetail(OwnerID(),"[SC_422780_1]")						--�ګ��I�F�Դ��N�����ǤH���²ª��a�A�e�ľ����L�̪��~���O�˪L����A�F�Դ��O�L���A�L��I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422780_2]","LuaS_422780_2",0) 		--�A�̬O�L��K�K�M�˪L����O�K�K�H
end


function LuaS_422780_2()
	SetSpeakDetail(OwnerID(),"[SC_422780_3]")						--�A�O�n�H�A���B���B������I�F�Դ��N���O�@�ǧ���Q���i�D�A�a�I									
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422780_4]","LuaS_422780_3",0) 		--�F�Դ��A�A�̪L��u�O�F���_�A����A����~�����������L�V�f����ó��~�A�A���D�Ǥ���ܡH
end


function LuaS_422780_3()
	SetSpeakDetail(OwnerID(),"[SC_422780_5]")						--�F���_���O���R�����աI
	SetFlag( OwnerID() , 543400 , 1 )							--���X��
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422781
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�b�Ʀ�©
--422781 �b�Ʀ�©		�һݽs���G�X�l780453 (1-2)	������113637	�}����113638

function LuaS_422781_0()  --�������ȫ����
	WriteRoleValue( OwnerID(), EM_RoleValue_PID , TargetID() )
	BeginPlot( OwnerID() , "LuaS_422781_1" , 0 )						--�����ˬd<OwnerID�O������>
	local DIR = Lua_DW_CreateObj("flag" ,113638,780453,1 ) 					--�إX�}����
	Yell( DIR , "[SC_422781_0]" , 3 )							--������...
	PlayMotion(  DIR ,ruFUSION_ACTORSTATE_CAST_BEGIN)
	MoveToFlagEnabled(DIR , false )							--��������
	WriteRoleValue( DIR ,EM_RoleValue_IsWalk, 1  )					--�Ψ���
	LuaFunc_MoveToFlag( DIR,780453,2,0)						--����<�}�������쫢�������e>
	PlayMotion(  DIR ,ruFUSION_ACTORSTATE_CAST_LOOP)
	AdjustFaceDir( DIR,OwnerID()  , 0 ) 
	Yell( DIR , "[SC_422781_3]" , 3 )							--���......�����~�B�����~�r�}����......�n���Ƴ�......
	sleep(20)
	Yell( OwnerID() , "[SC_422781_4]" , 3 )						--�O������~�H
	AdjustFaceDir( OwnerID(),DIR  , 0 ) 
	sleep(20)
	PlayMotion(  DIR  ,ruFUSION_ACTORSTATE_CAST_END)
	sleep(10)
	PlayMotion(  DIR  ,ruFUSION_ACTORSTATE_CAST_SP02)
	Yell( DIR , "[SC_422781_5]" , 3 )							--����o......���~�B���~���L�ڤj�j���A�����n�y�A�}�����٨S�ݲM���N�Q�r�F�@�f�A�n�h�n�h��......���ϱϭ}�����A�}�������Q��......
	sleep(40)
	SetDefIdleMotion( DIR, ruFUSION_MIME_DEATH_LOOP)					--�ˤU�ʧ@
	--PlayMotion(  DIR ,ruFUSION_ACTORSTATE_DEATH)
	Yell( DIR , "[SC_422781_1]" , 3 )							--������...������...
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_HURT_NORMAL)	
	Yell( OwnerID() , "[SC_422781_2]" , 3 )						--�}�����A���F�H�A���n�~�������ڡI						sleep(10)					
	Yell( OwnerID() , "[SC_422781_6]" , 3 )						--�}�����I
	sleep(20)
	AdjustFaceDir( OwnerID(),TargetID()  , 0 ) 
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_HURT_NORMAL)
	Yell( OwnerID() , "[SC_422781_7]" , 3 )						--�}�������L�h�F�A�����D�L�O�Q����F������A�n���٤��r�F�I
	sleep(50)							
	DelObj (DIR)									--�R���}����	
end

--�ˬd�G<���a�b�~�t�U�h> 

function LuaS_422781_1()	
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_PID )						
	for i = 1, 30 , 1 do								--��ưt�X�@���վ�
		if  CheckID( TargetID()) == false	then
			break
		end
		sleep(10)
	end
end

function LuaS_422781_2()
	if (CheckAcceptQuest(OwnerID(),422781)==true )and(CheckFlag( OwnerID(), 543396)==false) then	
		if	(CountBodyItem( OwnerID(),206141) >0)  then
			DelBodyItem( OwnerID(), 206141, 1 )
			CastSpell(TargetID(),TargetID(),494399)	--�I�k�S��
			SetFlag( OwnerID() , 543396, 1 )
			return true
		else
			ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422781_9]" , 0 )		--�A�ʤ�[206141]�I
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422781_8]" , 0 )		--�A�w�g�I�i�L[206141]�I
		return false
	end
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422782
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------������ū
--422782 ������ū		�һݽs���G�X�l780455(1-10)	�b�z���ժ�113678	�t���οժ�113679	�}����113638	�絵�_ 	�ˬd��BUFF�G504952

function LuaS_422782_0()  --�������ȫ����
	WriteRoleValue( OwnerID(), EM_RoleValue_PID , TargetID() )
	BeginPlot( OwnerID() , "LuaS_422782_1" , 0 )						--�����ˬd<OwnerID�O�絵�_>	<��a�ؤ@��780455��1���X�l>
	Addbuff(TargetID() ,504952 ,0 ,-1)						--��ƽվ�
	local DIR = Lua_DW_CreateObj("flag" ,113638,780455,2 ) 					--�إX�}����
	SetDefIdleMotion( DIR, ruFUSION_MIME_DEATH_LOOP)					--�ˤU�ʧ@
	DisableQuest( OwnerID() , true )							--�������
	MoveToFlagEnabled(OwnerID() , false )							--��������
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1 )					--�Ψ���
	LuaFunc_MoveToFlag( OwnerID(),780455,3,0)						--����<�絵�_����n�l�ꪺ�a��-�^�����Ӫ��D�F�e>
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)				--�ϥΪ��~���ʧ@
	sleep(30)	
	--PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_LOOP)				--�l�ꪺ�ʧ@
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)						
	sleep(30)
	--���u�a�W�_�_								--�S��
	local NO = Lua_DW_CreateObj("flag" ,113733,780455,4 ) 					--���ͦ������ժܨ��v<�æb���u����<�Ҽ{�b�z��>>
	CastSpell(NO,NO,494506)
	--AdjustFaceDir( NO ,OwnerID()  , 0 ) 
	sleep(50)
										--�����S��
	delobj(NO)									--�R�����u�����ժ�
	local NOF = Lua_DW_CreateObj("flag" ,113679,780455,4) 					--�P�˪��I���ͷs���ժ�	
	AddBuff(NOF,505067,1,4)
--	AddBuff(NOF,505073,1,8)
	DisableQuest( NOF , true )								--�������
	MoveToFlagEnabled(NOF , false )							--��������
	LuaFunc_MoveToFlag( NOF,780455,5,0)						--�ժܲ���
	ScriptMessage( TargetID() , TargetID(), 1, "[SC_422782_0]" , 0 )				--�����{�F�A�o�²b�������V�A�ݨӡC
	sleep(20)	
	Yell( OwnerID() , "[SC_422782_1]" , 3 )						--�ժܤj�H�A�бz�ϱϭ}�����a�C	
	sleep(20)
	Yell( NOF , "[SC_422782_2]" , 3 )							--�}�������ˤF�H�O�W�i�A�a�ڥh�ݬݥL�C	
	sleep(10)			
	LuaFunc_MoveToFlag( OwnerID(),780455,6,0)						--�絵�_����
	LuaFunc_MoveToFlag( NOF,780455,7,0)						--�ժܲ���
	Yell( NOF , "[SC_422782_3]" , 3 )							--�i�����}�����K�K
	sleep(20)						
	Castspell(NOF,DIR,494518)								--�ժܬI�k�S��
	sleep(50)
	Yell( DIR , "[SC_422782_4]" , 3 )							--���R�����ϱϭ}�����I
	sleep(20)
	Yell( OwnerID() , "[SC_422782_5]" , 3 )						--�³J�A�ժܤj�H���N�b�A���e�A�A�w�g�������n�F�C
	sleep(20)
	DelObj (DIR)
	local DIR2 = Lua_DW_CreateObj("flag" ,113638,780455,2 ) 	
	MoveToFlagEnabled(DIR2 , false )	
--	SetDefIdleMotion(  DIR ,ruFUSION_MIME_IDLE_STAND)
--	Hide( DIR )
--	Show( DIR ,0)
	LuaFunc_MoveToFlag( DIR2,780455,8,0)						--�}�����]��
--	PlayMotion(  DIR2 ,ruFUSION_ACTORSTATE_JUMP)					--�}�������_��
	Yell( DIR2 , "[SC_422782_6]" , 3 )							--�@��SAY���¬��R�����A���R�����̦n�F�I
	LuaFunc_MoveToFlag( DIR2,780455,9,0)
	sleep(20)
	Yell( NOF , "[SC_422782_7]" , 3 )							--�n�F�A�}�����A�A���˭�n�A�n�O�o�h�𮧡A�絵�_�A�A�a�}�����^�h�a�C
	SetFollow(DIR2 , OwnerID() )						--�}�������H
	sleep(20)
	Yell( OwnerID() , "[SC_422782_8]" , 3 )						--�n���A�ګַܼN��ӱz���@��h���C
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)				--???�絵�_���`???			
	LuaFunc_MoveToFlag( OwnerID(),780455,10,0)						--�絵�_����

	DelObj (NOF)									--�ժ�NOF����
	if	CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543430 , 1 )						--���ݨ��ժ�2���X��---client SCRIPT �ժܥX�{  �i�٥��Ȫ�113633
		CancelBuff( TargetID(), 504952 )
	end										
	LuaFunc_ResetObj( OwnerID() )							--���m�絵�_
	DelObj (DIR2)									--�}��������
	DelObj (NOF)								
end

--�ˬd�G
function LuaS_422782_1()								--��ưt�X�@���վ�

	local player =ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	for i = 1, 30 , 1 do
		if  CheckID( player ) == false	then
			break
		end
		sleep(10)
	end
end

function LuaS_422782_2()	--NPC���d��@���G�ˬd���񪱮a�A���������Ȫ��o�S���X��<�ݨ�ժ�113633���X��>�A���X��
	SetPlot(OwnerID(),"range","LuaS_422782_3",250)				--�վ�d��
end

function LuaS_422782_3()

	if ( CheckCompleteQuest(OwnerID(),422782)== true )and 	CheckBuff( OwnerID() , 504952)==false 	and	CheckFlag( OwnerID(), 543430 )==false	then
		SetFlag( OwnerID() , 543430 , 1 )
	end
	
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422783
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------���Ͽժ�
--422783 ���Ͽժ�		�һݽs���G�ժ�113633	�X��543394

function LuaS_422783_0()  
	LoadQuestOption( OwnerID() )

	if	CheckAcceptQuest( OwnerID() , 422828 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422828) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422828_0]","LuaS_422828_0",0)	--�����ӫ��F�H[113686]����|�ܦ��A�大���C
	end


	if 	(CheckAcceptQuest(OwnerID(),422783)==true )and( CheckCompleteQuest( OwnerID(),422783)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422783_0]","LuaS_422783_1",0) 	--��P����ͬO�ڪ��a���C
	end

	if	 (CheckAcceptQuest(OwnerID(),422783)==true )and( CheckCompleteQuest( OwnerID(),422783)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422783_2]","LuaS_422783_2",0) 	--�ëD�G�N�_�Ǳz�A���٦������ͦ�����ƭn�B�z......
	end

 	if 	(CheckAcceptQuest(OwnerID(),422807)==true )and  (CheckFlag(OwnerID(),543420)==false )then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422807_1]","LuaS_422807_1",0)---[113633]��[113633]�K�K[113633]�H
	end
		
	if 	(CheckAcceptQuest(OwnerID(),422812)==true )and (CheckFlag(OwnerID(),543447)==false )and(ReadRoleValue( TargetID() ,  EM_RoleValue_Register )==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422812_1",0)----�ڷǳƦn�F�A�ڭ̨��a�I 
	end
	if	 (CheckAcceptQuest(OwnerID(),422812)==true )and (CheckFlag(OwnerID(),543447)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_Register )==1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422812_2",0) ----�ڷǳƦn�F�A�ڭ̨��a�I
	end

	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	then
		 if	 CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_6]","LuaS_422821_1",0) 	--�p���e�����b�ơB�v�����ǨƱ��u�����O�F�ڪ��H
		end
	end
	
	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	 then
		if	CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false 	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_7]","LuaS_422821_2",0) 	--�ڴ��g�۫H�L�p�K�S�Q��p�O�o�ؤH�K
		end
	end

	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	then
		if	CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543436) == false	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_8]","LuaS_422821_3",0)	 	--�ڬݨ�^�����ӥ~���@�ǡK�p�����L�D���æìV���J�o�~�C
		end
	end
	
	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	then 	
		if	CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false 	 	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_9]","LuaS_422821_4",0)		 --�p�b�ڲ��e�b�ƹL�J�o�~�A���e�̤j�����O�k���ή����K�{�b�^�����ӥ~�S���@��ͪ��K
		end
	end

	if	( CheckCompleteQuest( OwnerID(),422783)==true) and  CheckAcceptQuest( OwnerID() ,422784 ) == true  and CountBodyItem( OwnerID(), 206156 )<1	then
		if	( CheckCompleteQuest( OwnerID(),422784)==false) or	( CheckCompleteQuest( OwnerID(),422785)==false)	or
			( CheckCompleteQuest( OwnerID(),422786)==false) or	( CheckCompleteQuest( OwnerID(),422787)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422784_10]","LuaS_422784_1",0)		--�е��ڤ@��[206156]�C
		end
	end

end

function LuaS_422783_1()
	SetSpeakDetail(OwnerID(),"[SC_422783_1]")						--�٧ڬ��ժܧa�A�o���O�ڪ��W�r�C�L��̤@����ڬ����A���ڥu�O���Z���H���A�N���A�@�ˡC							
	SetFlag( OwnerID() , 543394 , 1 )							--���X��
end	

function LuaS_422783_2()
	SetSpeakDetail(OwnerID(),"[SC_422783_3]")						--�n�a�A�|���d�U�Ӫ��۷|���d�A�Q�n���h���}�B�A�ڤ��|���d�C
end

function LuaS_422783_3()
	CloseSpeak( OwnerID() )
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422784
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�æ媺�ܲ�
--422784 �æ媺�ܲ�	�һݽs���G�H�v�F��206156	�b�z���ժ�113678	�������`102792	��õJ�o102793	�X�СG543398

--function LuaS_422784_0()	--�ժܨ��W�h�]�w�@�򥢱H�v�F�ۡ@�h�n�@���ﶵ
--	LoadQuestOption( OwnerID() )
--	if	( CheckCompleteQuest( OwnerID(),422783)==true) 	then
--		if	( CheckCompleteQuest( OwnerID(),422784)==false) or	( CheckCompleteQuest( OwnerID(),422785)==false)	or
--			( CheckCompleteQuest( OwnerID(),422786)==false) or	( CheckCompleteQuest( OwnerID(),422787)==false)	then
--			if	CountBodyItem( OwnerID(), 206156 )<1	then
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422784_0]","LuaS_422784_1",0)		--�ЦA���ڤ@��[206156]�C
--			end
--		end
--	end
--end

function LuaS_422784_1()
	GiveBodyItem( OwnerID(), 206156, 1 )
	CloseSpeak( OwnerID() )
end


function LuaS_422784_2()
	if		CountBodyItem( TargetID(), 206156 )<1	then
			GiveBodyItem( TargetID(), 206156, 1 )
	end
end

--�H�v�F�ۨϥ��ˬd
function LuaI_206156_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_0]" , 0 ) --�A���b�԰�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205535_0]" , 0 ) 
		return false
	end
	if CheckBuff( OwnerID() , 504953 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206156_1]" , 0 ) --[113678]���믫����w�g�b����C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206156_1]" , 0 ) 
		return false
	end
	if	Lua_ObjAreaCheck(OwnerID() , 574) ==false  then
--	if	Lua_ObjAreaCheck(OwnerID() , 1) ==false  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_206156_2]", 0 ) --�A�����b[ZONE_POOL OF BLOOD]�l��[113678]�C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_206156_2]", 0 )
		return false
	end
	return true
end

--�H�v�F�۪��ϥ�
function LuaI_206156_Use()
	local NOFF = Lua_CreateObjByDir( OwnerID()  , 113678, 25 , 0 ) 
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	AddToPartition( NOFF , 0 )
	AddBuff( OwnerID() , 504953 , 1 , -1 )							
	WriteRoleValue( NOFF , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue( NOFF , EM_RoleValue_Register , DBID )
	BeginPlot( NOFF , "LuaI_206156_0" , 0 )
end

function LuaI_206156_0()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )				--OwnerID�O�ժܡAPlayer �O���a
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	CastSpell( OwnerID() , OwnerID() , 493776 )						--493776 �X�����I�k�S��
	--SetFollow( OwnerID() ,Player )
	if CheckAcceptQuest( Player , 422784 ) == true and CheckFlag( Player , 543398 ) == false and  CheckCompleteQuest( Player ,422784)== false	then
		BeginPlot( OwnerID(), "LuaI_206156_1" , 0 )
	end
	for i = 0 , 36  , 1 do
		if CheckID( Player  ) == false or ReadRoleValue( Player , EM_RoleValue_DBID ) ~= DBID then
			break
		end
		if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or CheckBuff( Player , 504953) == false then
			break
		end
		if GetDistance( OwnerID(), Player  )>400 then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1) > 0 then
			sleep(300)
			break
		end
		sleep( 50 )
	end
	if CheckID( Player ) == true and CheckBuff( Player  , 504953) == true and ReadRoleValue( Player , EM_RoleValue_DBID ) == DBID	then
		CancelBuff_NoEvent( Player , 504953 )
	end
	CastSpell( OwnerID() , OwnerID() , 493776  )
	sleep( 15 )
	DelObj( OwnerID() )
end

--�b422784�s�X��,�T�{���a�S����,�}�l����U�@�q��Ѣ�עޢ�
function LuaI_206156_1()
	local BLOOD = 0
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )				--OwnerID�O�ժܡAPlayer �O���a
	local Forg  = {}
	if CheckAcceptQuest( Player , 422784 ) == true and CheckFlag( Player , 543398 ) == false and  CheckCompleteQuest( Player ,422784)== false	then	
		DisableQuest( OwnerID() , true )
		AdjustFaceDir( OwnerID(),Player  , 0 ) 						--���V���a
		sleep(10)
		tell(Player ,OwnerID(),"[SC_422784_0]")					--�и�ڨӡA�ڱa�A�h�ݦ�ê����Y�A���W�|�J��g�V��ê��ܲ��ͪ��A�@�w�n�p�ߡC
		DW_MoveToFlag( OwnerID() , 780479 , DW_Rand(12) ,70 , 1  )
		sleep(30)
		say(OwnerID(),"[SC_422784_1]")						--�쥻�o�̪��ͪ����ܷŹ��A�q�e���������`�O���󬰥͡A�߷R�˪�H�����K�K	
		sleep(30)
	end

	if CheckID(Player  ) == true and  CheckAcceptQuest( Player , 422784 ) == true and  CheckCompleteQuest( Player ,422784)== false	and CheckFlag( Player , 543398 ) == false  then
		Forg[1] = Lua_CreateObjByDir( OwnerID()  , 102792, 100 , 0 ) 			--�إX�Ⱖ�G���������`
		AddToPartition( Forg[1] , 0 )
		Forg[2] = Lua_CreateObjByDir( OwnerID()  , 102792, 75, 0 ) 
		AddToPartition( Forg[2] , 0 )	
		sleep(10)
		--SetAttack( Forg[1] , Player  )
		SetFollow( Forg[1] , Player  )						--�]�V���aPlayer  
		SetFollow( Forg[2] , Player  )		
		ScriptMessage( Player   , Player   , 1 , "[SC_422784_2]" , 0 ) 	--�������`�ֳt����A�A���O�ǳƧ����I
		ScriptMessage( Player    , Player   , 0 , "[SC_422784_2]" , 0 ) 
	else
		if CheckID( Player ) == true and CheckBuff( Player  , 504953) == true then
			CancelBuff_NoEvent( Player , 504953 )
		end
		DelObj(Forg[1] )
		DelObj(Forg[2] )
		DelObj(OwnerID())
		return	
	end	
					
		tell(Player   ,OwnerID(),"[SC_422784_3]")					--�Ф��n�ˮ`�e�̡A���ڥ����e�̨���÷P�V���ߡC
		AdjustFaceDir( OwnerID(),Forg[1], 0 ) 		
		sleep(10)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)	
		sleep(30)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)	
		--�ժܬI�k�o�X�b�Ƥ���
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
		AddBuff(Forg[1]  , 500980 , 10 , -1 )  						--�������`���Y���}
		AddBuff(Forg[2] , 500980 , 10 , -1 ) 
		sleep(50)									
		DelObj(Forg[1] )	
		DelObj(Forg[2])
		sleep(10)	
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
		ScriptMessage( Player , Player , 1, "[SC_422784_4]" , 0 )				--�ժܫ��h�B�W�����A�y�⦳�ǻa�աC
		sleep(20)
		DW_MoveToFlag( OwnerID() , 780479 , DW_Rand(5) ,40 , 1  )
		sleep(10)

	if CheckID(Player  ) == true and  CheckAcceptQuest( Player , 422784 ) == true and  CheckCompleteQuest( Player ,422784)== false	and CheckFlag( Player , 543398 ) == false  then
		BLOOD = Lua_CreateObjByDir( OwnerID()  , 102793, 100 , 0 ) 			-- �إX�@����õJ�o�~
		AddToPartition( BLOOD , 0 )
		sleep(10)
		SetFollow( BLOOD, Player    )							--�]�V���a
	else
		if CheckID( Player ) == true and CheckBuff( Player  , 504953) == true then
			CancelBuff_NoEvent( Player , 504953 )
		end
		DelObj(BLOOD)
		DelObj(OwnerID())
		return	
	end		
	
		tell(Player   ,OwnerID(),"[SC_422784_5]")					--�J�o�~���O�ȥͪ��A�e�̳̱`�I�b�h�A���H�i���]�R��w�A�P�@�L�����ͬ��C
		sleep(30)	
		AddBuff(Player    , 503994 , 10 , -1)--���a���W�Т�Ԣԡ@�@����
		AdjustFaceDir( OwnerID(),BLOOD , 0 ) 
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)	
		sleep(30)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)	
		--�ժܹ����~�I�k
		AddBuff(BLOOD , 500980 , 10 , -1 )  						--����~�]�}
		sleep(50)
		DelObj(BLOOD)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		sleep(20)
		ScriptMessage( Player     , Player    , 1, "[SC_422784_6]" , 0 )			--�ժܷL�L�ݮ��A���e��a�դF�C
		sleep(20)
		tell(Player    ,OwnerID(),"[SC_422784_7]")					--�L���A�ڳ̪񰵤F�Ӧh�b�Ƥu��M�ľ��A�𮧤@�|�N�n�C
		sleep(20)
		playMotion(  OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
		--�ժܯ��_
		DW_MoveToFlag( OwnerID() , 780479 , DW_Rand(5) ,40 , 1  )
		sleep(10)
		tell(Player    ,OwnerID(),"[SC_422784_8]")--�o�̬O��ä����A�P����F�ܡH���a��⪺�������պ����t����q�A�o�A�����Ӧۤ@���]�C�K�K
		sleep(20)
		--�ժܹ�����I�k
		--�S�ĵۭ��b�����y�ʡB�ե�
		tell(Player    ,OwnerID(),"[SC_422784_9]")--Pe-ertei Tista-antei�i�b�ơj�K�K�C�P���C���^���w�H�A�ɥ��p�y�u�A�^�K�K�~���F����A�S�v¡�F����H
		sleep(30)
		DisableQuest( OwnerID() ,false )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 777 )
	if	CheckID(Player    ) == true then
		SetFlag( Player     , 543398 , 1 )
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422785
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- �b�ƵJ�o�~
--422785 �b�ƵJ�o�~	�һݽs���G543399�����b�ƵJ�o�~ 	206142�b�ƥ�

--�ϥΪ��~�ˬd
function LuaS_206142_0()	
	if	CheckAcceptQuest( OwnerID() , 422785 ) == true then
		if	CheckFlag( OwnerID() , 543399 ) == true	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_0]" , 0 ) 		--�A�w�g�b�Ʀ��\�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_0]" , 0 ) 
			return false
		end

		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422202_4]" , 0 ) 		--�ؼФw�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422202_4]" , 0 )
			return false
		end

		local XX =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 101795 , 60 )
		if Type(XX) == "number" and CheckID(XX) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_1]" , 0 ) 		--�A�����a���õJ�o�ϥβb�ƥۡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_1]" , 0 ) 
			return false 
		end

		if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	> 0.5	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101614_2]" ,  C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_2]" , 0 )		--��õJ�o�ĤO��ܡI
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_2]" , 0 ) 		
			return false
		else			
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_3]" , 0 )		--��õJ�o����ܦ��G�ܮz�F�A���ֶX���b�ơI
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_3]" , 0 ) 
			return true
		end
	end
			return false 
end

--���\�ϥ�
function LuaS_206142_2()
	if CheckID( TargetID() ) == true then
		SetFlag( OwnerID() , 543399 , 1 )						--���X��
	end
	sleep(10)
	CallPlot( TargetID(), "LuaFunc_ResetObj", TargetID() )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_4]" , 0 )				--��_���R���J�o�~�I�������d���F�C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_4]" , 0 ) 

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422787
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�b�ƨ������`
--422787 �b�ƨ������`		�һݽs���G206143���b��s���ﵷ��

--�����ȫ�
--function LuaS_422787_0() 
	--���ժܤƬ����]�ƴ��S��
--	setflag(OwnerID(),543401,1)					--�����a�X��543401�Aclient script���ժܤ���
--end
	
function LuaS_206143_0()	--�ϥΪ��~�ˬd
	if	CheckAcceptQuest( OwnerID() , 422787 ) == true then
		if	(CountBodyItem( OwnerID(),206144) >0)  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206143_0]" , 0 )		 --�A�w�g�����F�@���������`�A���ֱa�h���絵�_�b�ơC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206143_0]" , 0 ) 
			return false
		end

		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422202_4]" , 0 ) 		--�ؼФw�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422202_4]" , 0 )
			return false
		end

		local XX =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 101796 , 50 )
		if Type(XX) == "number" and CheckID(XX) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206143_1]" , 0 ) 		--�A���������񨪬����`�~��ϥΤ�s���ﵷ��
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206143_1]" , 0 ) 
			return false 
		else		
			return true	
		end
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422625_0]" , 0 ) 		--�A�ثe���ݭn�o��
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422625_0]" , 0 ) 
 	return false
end



--���~���\�ϥ�
function LuaS_206143_1()
	if	CheckID( TargetID() ) == true then
		if	(CountBodyItem( OwnerID(),206144) <1)  then	
			CallPlot( TargetID(), "LuaFunc_ResetObj", TargetID() )
			GiveBodyItem( OwnerID(),206144, 1 )
		end
	end
end

--�������ȫ�
function LuaS_206143_2()
	if	 CountBodyItem( TargetID(), 206156)>0	 then 
		 DelBodyItem( TargetID(), 206156, 1 )
	end
end