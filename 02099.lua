--======================================================================================================================================
--======================================================================================================================================
--���u
--======================================================================================================================================
function LuaS_116449()							---�ԥd�J�D�O�����
	if	ZONE18_PE01_Phase < 2	then
		LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116449_1]","LuaS_116449_1",0)	--�A�b�o�̰�����H
	else
		SetSpeakDetail(OwnerID(),"[SC_116449_3]")	---�]�W�ӷF���I���o�򰪨S�ݨ�Ȱ�B�w�g���L�ӤF�ܡH�٤��h�����I�H
	end
end

function LuaS_116449_1()
	SetSpeakDetail(OwnerID(),"[SC_116449_2]")			---�@�ݴN���D�A�ڦb�ʵ��P�򪺪��p�A���K���y�H���T���A���M���Ǧb�F�z���y���٦�̥i�O�|�Q�Ȱ�B�L�n�L�����@�f�Y���I
end
--======================================================================================================================================
function LuaS_116451()							---�Z�}�D�������
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if	ZONE18_PE01_Phase > 1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_1]","LuaS_116451_1",0)	--�A���h�����ܡH
	end
end

function LuaS_116451_1()
	SetSpeakDetail(OwnerID(),"[SC_116451_2]")			---�}���򪱯��H��ż�F�o�����ҫ���H�A�߱o�_�ܡH
								---��߰աI�u�n�ڭ̦b���L�W���s���Τ]�`�󤣤F�ڭ̡I
end
--======================================================================================================================================
function LuaS_116453()							---��ˡD���w�Թ��
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if	ZONE18_PE01_Phase > 1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_1]","LuaS_116453_1",0)	--�A���h�����ܡH		
	end	
end

function LuaS_116453_1()
	SetSpeakDetail(OwnerID(),"[SC_116453_1]")			---���M�ګܷQ...�i�O�ڸ}�W���˥i���o��Q...
end
--======================================================================================================================================
function LuaS_116455()							---ͺ�g��D�O�����
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if	ZONE18_PE01_Phase > 1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_1]","LuaS_116455_1",0)	--�A���h�����ܡH		
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_3]","LuaS_116455_2",0)	--�A���h�����ܡH		
	end
end

function LuaS_116455_1()
	SetSpeakDetail(OwnerID(),"[SC_116455_1]")			---�ڦn���ݨ�F...���𤤦��Ǽv�l�C
end
function LuaS_116455_2()
	SetSpeakDetail(OwnerID(),"[SC_116455_4]")			---�ڦn���ݨ�F...���𤤦��Ǽv�l�C
end
--======================================================================================================================================
function LuaS_116458()
	if	ZONE18_PE01_Phase < 2	then
		LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116458_1]","LuaS_116458_1",0)	--�A�b�o�̰�����H
	else
		SetSpeakDetail(OwnerID(),"[SC_116458_3]")	---
	end	
end

function LuaS_116458_1()
	SetSpeakDetail(OwnerID(),"[SC_116458_2]")			---�ڦn���ݨ�F...���𤤦��Ǽv�l�C
end

--======================================================================================================================================
function LuaS_116461()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116461_1]","LuaS_116461_1",0)	--��L�I
end

function LuaS_116461_1()
	if	ZONE18_PE01_Phase < 2	then	
		SetSpeakDetail(OwnerID(),"[SC_116461_2]")			---(�������~���ˤl)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116461_3]","LuaS_116461_2",0)	--(�߰ݦb�����䪺�欰)
	else
		SetSpeakDetail(OwnerID(),"[SC_116461_5]")			---�p�n�I...���M�|�Q���s[116402]ť��A�L�̥i�O�s���u�����Ȫ��ƨg�å�A�u�O���I
	end	
end

function LuaS_116461_2()
	SetSpeakDetail(OwnerID(),"[SC_116461_4]")			---���I�ڦb�N�����I
end
--======================================================================================================================================
function LuaS_116594()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116594_1]","LuaS_116594_1",0)	--���ǨS���������å�O����H
end

function LuaS_116594_1()
	SetSpeakDetail(OwnerID(),"[SC_116594_2]")			---
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116594_3]","LuaS_116594_2",0)	--���ǨS���������å�O����H
end

function LuaS_116594_2()
	SetSpeakDetail(OwnerID(),"[SC_116594_4]")			---
end
--======================================================================================================================================
function LuaP_116454()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
	while 1 do
		sleep(rand(150)+150)
		NPCSAY(OwnerID(),"[SC_116454_1]")
	end
end

function LuaP_116449()
	while 1 do
		sleep(rand(150)+150)
		if	ZONE18_PE01_Phase < 2	then
			NPCSAY(OwnerID(),"[SC_116449_4]")
		else
			NPCSAY(OwnerID(),"[SC_116449_5]")
		end
	end
end

function LuaP_116458()
	SetPlot( OwnerID() , "range" , "LuaP_116458_1" , 150 );
	while 1 do
		sleep(rand(150)+150)
		if	ZONE18_PE01_Phase < 2	and	ReadRoleValue( OwnerID() , EM_RoleValue_Register1) ~= 0	then
			AdjustFaceDir( OwnerID(), ReadRoleValue( OwnerID() , EM_RoleValue_Register1) , 0 )
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
			NPCSAY(OwnerID(),"[SC_116458_4]")
		end		
	end

end

function LuaP_116458_1()
	WriteRoleValue( TargetID() , EM_RoleValue_Register1 , OwnerID() )
end

function LuaP_116597()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	While	1	do

		sleep(10)
		if	ZONE18_PE01_Phase < 2	then
			Show( OwnerID(),0 )
		else	
			Hide(OwnerID())			
		end
	end
end

function LuaP_116600()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	While	1	do

		sleep(10)
		if	ZONE18_PE01_Phase < 2	then
			Show( OwnerID(),0 )
		else	
			Hide(OwnerID())			
		end
	end
end

function LuaP_116602()
	While	1	do
		sleep(10)
		if	ZONE18_PE01_Phase < 2	then
			Show( OwnerID(),0 )
		else	
			Hide(OwnerID())			
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) < 0.3	then
			WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_HP)*3)
		end
	end
end

function LuaS_DeadVisitor()
	SetRoleCamp( OwnerID() , "Visitor" )	
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
end

function LuaS_PociCall()
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
end


function LuaS_continuous_buff()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_BUFF_LOOP)
end


function Lua_disert_Attack()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
end
--======================================================================================================================================
--======================================================================================================================================
---��w
--======================================================================================================================================
function LuaS_116636()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116636_1]","LuaS_116636_1",0)	--
end

function LuaS_116636_1()
	SetSpeakDetail(OwnerID(),"[SC_116636_2]")			---	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116636_3]","LuaS_116636_2",0)	--
end

function LuaS_116636_2()
	SetSpeakDetail(OwnerID(),"[SC_116636_4]")			---	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116636_5]","LuaS_116636_3",0)	--
end

function LuaS_116636_3()
	SetSpeakDetail(OwnerID(),"[SC_116636_6]")			---	
end

function LuaS_116640()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116640_1]","LuaS_116640_1",0)	--
end

function LuaS_116640_1()
	SetSpeakDetail(OwnerID(),"[SC_116640_2]")			---
	setflag(OwnerID(),544571,1)		
end

function LuaS_116642()
	While 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DODGE )
		sleep(20)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2)		
		sleep(140)
	end
end

function LuaS_116678_Start()
	local red = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116677  , 1000 , 0)	
	while	1	do
		AdjustFaceDir( OwnerID() ,red,0 )	
		AdjustFaceDir( red ,OwnerID(),0 )		
		NPCsay(red ,"[SC_116678_0]")
		sleep(30)
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(5)
		NPCsay(OwnerID() ,"[SC_116678_1]")
		sleep(30)
		PlayMotion(red,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		NPCsay(red ,"[SC_116678_2]")	
		sleep(30)
		NPCsay(OwnerID() ,"[SC_116678_3]")
		sleep(30)
		AdjustFaceDir( red ,OwnerID(),180 )
		NPCsay(red ,"[SC_116678_4]")
		sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2)		
		NPCsay(OwnerID() ,"[SC_116678_5]")
		sleep(2000)
	end
end

function LuaS_116445()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116445_1]","LuaS_116445_1",0)			--(�߰����󶼥Τ�)
end

function LuaS_116445_1()
	SetPosByFlag( OwnerID(), 780774 , 1 )
	SetSpeakDetail(OwnerID(),"[SC_116445_2]")						---�A�����L�ӧڦA�i�D�A�C
												---�ڱo�n�n�i�D�A�A�K�o�A�S��W�������D���Ӫ��~���H�@�˼��q�@�n���U�h�C
												---�ڭ̳o�̤j�������u�����O�S���A�ӥB�j���~��۷Ŭu�t�A���M�N�O���ǨS���a���Ȱ�B�@�Ѹ������i�h�A�ڥ��N����ܡI
												---�ҥH���@�Ӱ��b���u���O�h��öQ���I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_1166445_3]","LuaS_116445_2",0)	--		---(�߰�������u)
end

function LuaS_116445_2()
	SetSpeakDetail(OwnerID(),"[SC_116445_4]")						---�p�G�A�n�ݼ��u���ܡA�q�o���~�򩹦�訫�N��F�A�\�h�y�H���b���䬼�y���񪺰ʪ��A���M�g�`ť�L�̻�[116402]���ӷ|���X�_�ӧ����L�̡A���`�O����L�I�C
												---�p�G������N�ۤv�h�ݬݧa�C
end

function LuaS_116680()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116680_1]","LuaS_116680_1",0)			--(�߰ݦp�����[116402])	
end

function LuaS_116680_1()
	SetSpeakDetail(OwnerID(),"[SC_116680_2]")			---�A�Ӥ��|�H���@�M�@�M��a�I
									---�������I�O���ڡ�A��M�i�H�o�򰵡A���ڷ|��ĳ���o��[116402]�h�w�w�����A�L�̨��W���w�߷|�ܳn�A�n��A�i�H�@�f�r�U�h���ɭԡA�_�F�L�̴N���]�f���@�ˮe����
end

function LuaS_116681()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
end

function LuaS_116682()
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116445  , 1000 , 0)		
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	setplot(OwnerID(),"range","LuaS_116682_1",47)
end

function LuaS_116682_1()
	local cookie = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)	
	sleep(5)
	if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( cookie ,OwnerID(),0 )		
		PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
		sleep(5)
		NPCsay(cookie ,"[SC_116445_5]")	
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
	end
	sleep(30)
	if	GetDistance( OwnerID() , TargetID() ) < 50	then
		SetPosByFlag( OwnerID(), 780774 , 1 )	
		if	ReadRoleValue( cookie, EM_RoleValue_Register+2 ) == 0	then
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
			AdjustFaceDir( cookie ,OwnerID(),0 )		
			PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			NPCsay(cookie ,"[SC_116445_6]")			
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
		end
	end
end

function LuaS_116682_2()
	callplot(OwnerID(),"Lua_MK_423574_Quest_Checker" )
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116445  , 1000 , 0)		
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	setplot(OwnerID(),"range","LuaS_116682_3",13)
end

function LuaS_116682_3()
	local cookie = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)	
	sleep(5)
	if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( cookie ,OwnerID(),0 )		
		PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
		sleep(5)
		NPCsay(cookie ,"[SC_116445_5]")	
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
	end
	sleep(30)
	if	GetDistance( OwnerID() , TargetID() ) < 13	then
		SetPosByFlag( OwnerID(), 780774 , 1 )	
		if	ReadRoleValue( cookie, EM_RoleValue_Register+2 ) == 0	then
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
			AdjustFaceDir( cookie ,OwnerID(),0 )		
			PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			NPCsay(cookie ,"[SC_116445_6]")			
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
		end
	end
end

function LuaS_116636_motion()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
end

function LuaS_Gray1()
	setplot(OwnerID(),"dead","LuaS_Gray2",100)
end

function LuaS_Gray2()
	SetRoleCamp( OwnerID() , "Visitor" );
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	Lua_ObjDontTouch( OwnerID() )
	Say(OwnerID(),"My god! i dead!!")
	return false
end
--============================================================================================
function LuaS_MK_423570_accept()
	SetFlag(TargetID(),544682,1)
end

function LuaS_MK_423570_complete()
	SetFlag(TargetID(),544682,0)
	if	CheckAcceptQuest( TargetID() , 423571 ) == false	and
		CheckFlag ( TargetID() , 544682 ) == false	and
		CheckFlag ( TargetID() , 544683 ) == false	and	
		CheckCompleteQuest( TargetID(), 423516 ) == true	then
		AddBuff(TargetID(),508317,0,-1)
		local inf = Lua_DW_CreateObj( "obj" , 117170 , OwnerID() , 1 , 1 )
		Lua_ObjDontTouch( inf  )
		NPCSAY(inf,"[SC_116724_9]")
		PlayMotion(inf,ruFUSION_ACTORSTATE_USE	)	--��cookie����	
		sleep(20)
		CastSpell(inf,inf,495735)
		sleep(10)
		delobj(inf)
		sleep(20)
		CancelBuff(TargetID(),508317)
	end
end

function LuaS_MK_423571_accept()
	SetFlag(TargetID(),544683,1)
end

function LuaS_MK_423571_complete()
	SetFlag(TargetID(),544683,0)
	if	CheckAcceptQuest( TargetID() , 423570 ) == false	and
		CheckFlag ( TargetID() , 544682 ) == false	and
		CheckFlag ( TargetID() , 544683 ) == false	and	
		CheckCompleteQuest( TargetID(), 423516 ) == true	then
		AddBuff(TargetID(),508317,0,-1)
		local inf = Lua_DW_CreateObj( "obj" , 117170 , OwnerID() , 1 , 1 )
		Lua_ObjDontTouch( inf  )
		NPCSAY(inf,"[SC_116724_9]")
		PlayMotion(inf,ruFUSION_ACTORSTATE_USE	)	--��cookie����	
		sleep(20)
		CastSpell(inf,inf,495735)
		sleep(10)
		delobj(inf)
		sleep(20)
		CancelBuff(TargetID(),508317)
	end
end

function Lua_MK_423574_Quest_Checker()
	while	true	do
		sleep(30)
		local HowManyPlayer = SetSearchAllPlayer(0)
		local player
		for i = 1,HowManyPlayer,1 do
			Player = GetSearchResult()
			if	CheckCompleteQuest( player , 423570 ) == true	or	CheckAcceptQuest( player , 423570 ) == false	then
				setflag(player,544682,0)
			end
			if	CheckCompleteQuest( player , 423571 ) == true	or	CheckAcceptQuest( player , 423571 ) == false	then
				setflag(player,544683,0)
			end
		end
	end

end