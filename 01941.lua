---423348
----�ϥΪ��~ ��BUFF
function LuaS_423348_0()---�ϥΪ��~��BUFF507169�C
	AddBuff( OwnerID(),507169,1,60)
end
--�����d��@�� 115851 ������BUFF �H�ΨSBUFF ��BUFF ���P �X��
function LuaS_423348_1()---115851--544253
 	SetPlot( OwnerID() , "Range" , "LuaS_423348_2" , 150 )
end
function LuaS_423348_2()
	if(CheckAcceptQuest( OwnerID() , 423348 ) == true ) and (CheckFlag(OwnerID(),544253)==false) and (CheckBuff( OwnerID() , 507169)==true) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_1]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_1]" , 0 )---
		SetFlag(OwnerID() ,544253, 1 )--
	end
	if(CheckAcceptQuest( OwnerID() , 423348 ) == true ) and (CheckFlag(OwnerID(),544253)==false) and (CheckBuff( OwnerID() , 507169)==false) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_2]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_2]" , 0 )---
	end
end
---------------------
---�a���]�k�}  �d��@�� ���ǰl���C
function LuaS_423348_3()---115852--544254
 	SetPlot( OwnerID() , "Range" , "LuaS_423348_4" , 150)
end
function LuaS_423348_4()
	if	CheckAcceptQuest(OwnerID(),423348)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 and  (CheckFlag(OwnerID(),544254)==false) and (CheckBuff( OwnerID() , 507169)==true)then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 77)
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_3]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_3]" , 0 )---�o�Ӧa�誺���ɤ����A���O���h�O�q�A���A�x�X���~�C
		BeginPlot( TargetID() , "LuaS_423348_5" , 0 )
		SetFlag(OwnerID() ,544254, 1 )--
	end
	if	CheckAcceptQuest(OwnerID(),423348)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 and  (CheckFlag(OwnerID(),544254)==false) and (CheckBuff( OwnerID() , 507169)==false)then
	---	WriteRoleValue( TargetID() , EM_RoleValue_Register , 77 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_2]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_2]" , 0 )---
	end
	if	CheckAcceptQuest(OwnerID(),423348)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 and  (CheckFlag(OwnerID(),544254)==false) and (CheckBuff( OwnerID() , 507169)==true)then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_8]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_8]" , 0 )---�o�Ӧa�誺���ɤ����A���O���h�O�q�A���A�x�X���~�C

	end

end

function LuaS_423348_5()
		local Obj = Role:new( TargetID()  )
		local BaseX = Obj :X()		
		local BaseY = Obj :Y();		
		local BaseZ = Obj :Z();		
		local BaseDir = Obj:Dir();		
		local DD= CreateObj(104080, BaseX+80, BaseY, BaseZ+80, BaseDir, 1 )        
		local CC= CreateObj(104080, BaseX+50, BaseY, BaseZ+50, BaseDir, 1 )  
		local KK= CreateObj(104080, BaseX+75, BaseY, BaseZ+75, BaseDir, 1 )  		      
		AddToPartition( DD,0)    
		AddToPartition( CC,0)
		AddToPartition( KK,0)  
		SetAttack( DD , TargetID()  )     
		SetAttack( CC , TargetID()  ) 
		SetAttack( KK , TargetID()  )
		Yell(  DD , "[SC_423348_4]" , 3 )---�۳N�A��L���G�_���F�����C
		sleep(10)
   		Yell(  CC , "[SC_423348_5]" , 3 )---���򪽱��F���L�a     
		BeginPlot(DD,"LuaQ_421177_Sui",0)
		BeginPlot(CC,"LuaQ_421177_Sui",0)
		BeginPlot(KK,"LuaQ_421177_Sui",0)
		for i=1, 180, 1 do
			if (CheckID( DD) == true   or  CheckID( KK) == true or  CheckID(CC)==true)    and  i==180  then
				Delobj( DD ) 
				Delobj( CC)
				Delobj( KK)
				break
			end
			if (CheckID( DD) == false   and  CheckID( KK) == false or  CheckID(CC)==false)   then
				break
			end
			sleep(10)
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end
---------------------------
---�����]�k�}�C
function LuaS_423348_6()
 	SetPlot( OwnerID() , "Range" , "LuaS_423348_7" , 150)
end
function LuaS_423348_7()
	if	CheckAcceptQuest(OwnerID(),423348)==true   and  (CheckFlag(OwnerID(),544255)==false) and (CheckBuff( OwnerID() , 507169)==true) and  (CheckFlag(OwnerID(),544254)==true) and  (CheckFlag(OwnerID(),544253)==true)  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_6]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_6]" , 0 )---[115854]�K�_�F���Y�A�`���۲��e�Q�}�a�����ɡC
		SetFlag(OwnerID() ,544255, 1 )--
	end
	if	(CheckAcceptQuest( OwnerID() , 423348 ) == true ) and (CheckFlag(OwnerID(),544255)==false) and (CheckBuff( OwnerID() , 507169)==false) and  (CheckFlag(OwnerID(),544254)==true) and  (CheckFlag(OwnerID(),544253)==true)  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_7]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_7]" , 0 )---[115854]�a�ۼ~�{���ݵ۫e��A�γ\�A�Өϥ�[207699]�ݬݵ��ɨ쩳�o�ͤF����ơH
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------
---------423349
---------423349
function LuaS_423349_0()---�Q�γo��780546 �X�l
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423349)==true )and  (CheckFlag(OwnerID(),544256)==false )then
 		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423349_1]","LuaS_423349_2",0)--- ���F�ܡH
		end
		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 1 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423349_1]","LuaS_423349_1",0)--- ���F�ܡH
		end
	end
end
function LuaS_423349_1()---���H�b�t���ɡA�ҥX�{����ܡC
	SetSpeakDetail(OwnerID(),"[SC_423349_2]")---
end

function LuaS_423349_2()---�S���H�t���A�n�}�t�C
	CloseSpeak( OwnerID() )
--	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
	if (CheckAcceptQuest(OwnerID(),423349)==true )and  (CheckFlag(OwnerID(),544256)==false )then
		BeginPlot( TargetID() , "LuaS_423349_3" , 0 )
	end
end
function LuaS_423349_3()---�إX�Ⱖ�t���C KK�O���p���b�� MT�O�w�S�Jù 115857  ---
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,1) 
 	AddBuff(TargetID(),507170,1,60)
	local KK = Lua_DW_CreateObj("flag" ,115972,780546,0,0 )---
	SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,false) -----------�q�X�Y����
	SetModeEx(KK ,EM_SetModeType_HideName ,true) -----------�q�X�W��
	WriteRoleValue (OwnerID()  , EM_RoleValue_Register9,TargetID() )
	WriteRoleValue (KK , EM_RoleValue_Register9,TargetID() )
	WriteRoleValue (OwnerID()  , EM_RoleValue_Register7,KK  )
	BeginPlot(OwnerID(),"LuaS_423349_owner",0)	
	BeginPlot(KK,"LuaS_423349_4",0)	
end
function LuaS_423349_4()---
	local TargetID = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)--	
	local KK = Lua_DW_CreateObj("flag" ,115856,780546,0,1 )---
	WriteRoleValue (OwnerID(),EM_RoleValue_Register1,KK )
	DisableQuest( KK ,true )
	local MT = Lua_DW_CreateObj("flag" ,115857,780546,1,0 )---
	WriteRoleValue (OwnerID(),EM_RoleValue_Register3,MT )
	DisableQuest( MT ,true )
----	local DD = Lua_DW_CreateObj("flag" ,115921,780546,22,0 )---	local KK = Lua_DW_CreateObj("flag" ,115921,80546,0,1 )---115921 115972,
	local DD = Lua_DW_CreateObj("flag" ,115903,780546,22,0 )---
	WriteRoleValue (OwnerID(),EM_RoleValue_Register2,DD )
	Lua_ObjDontTouch( DD ) ----�������a�ݨ�
	DisableQuest( DD ,true )
	SAY(KK,"[SC_423349_3]")---
	sleep(10)
	ScriptMessage(TargetID ,TargetID , 0, "[SC_422897_8]" , 0 )---
	ScriptMessage(TargetID ,TargetID , 2, "[SC_422897_8]" , 0 )---
	BeginPlot(OwnerID(),"LuaS_423349_KK",0)
	AddToPartition( MT,0)   
	DW_MoveToFlag(MT ,780546,2, 0,1)
	SAY(KK,"[SC_423349_4]")	---��A�S�O�ۼv...�O�H���άۦP���y�աA�N���F�o�˧ڡC
	SetDefIdleMotion(OwnerID(), ruFUSION_MIME_ATTACK_1H )
---shield_bash
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	DW_MoveToFlag(KK ,780546,3, 0,1)
--�ʧ@ ��� unarmed_attack04
--	PlayMotionEX( YA , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
PlayMotion( KK ,   ruFUSION_ACTORSTATE_ATTACK_1H)
--�w�S�Jù���ʧ@�^�� 
	PlayMotion( MT,    ruFUSION_ACTORSTATE_BUFF_SP01)
	CastSpell( MT, MT,495920)
---PlayMotion(MT ,ruFUSION_ACTORSTATE_CAST_LOOP)
	sleep(25)
----�w�S cast01 continuous_cast
	SAY(MT,"[SC_423349_5]")---[115858]�A�ڭ̦��h�֦~�S�����H
	sleep(25)
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_ATTACK_1H)	
	SAY(KK,"[SC_423349_6]")
	sleep(25)
--�ʰ� ���
	SAY(KK,"[SC_423349_7]")--�A�o�Ǫ��Q���ڤW��A�O���藍�i�઺�C
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	SAY(MT,"[SC_423349_8]")---[115858]�A�ٰO�o�t�����G�ܡH���ɧڭ���J�F�o�ӡA�ިӤF���n��������A�ٰO�o�a�H
---�k�N
	CastSpell( MT, MT,492664)
	AddToPartition( DD,0)   
	---SetModeEx(DD ,EM_SetModeType_ShowRoleHead ,false) -----------���Y����
	---SetModeEx(DD ,EM_SetModeType_HideName ,true) -----------���W��-
	AddBuff( DD , 505464  , 0 , -1 )----580921	505464 
	SetDefIdleMotion(KK,ruFUSION_MIME_IDLE_STAND)
	sleep(50)	
	SAY(KK,"[SC_423349_9]")---���i��...�o���i��H�o�O���F�t���������ܡH
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	sleep(30)
	SAY(MT,"[SC_423349_10]")---[115858]�A�ڥѤj�a���d���L�ӡC
	PlayMotion( MT ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	if 	CheckID(TargetID)== true  and CheckAcceptQuest(  TargetID,423349 ) == true and GetDistance(TargetID , OwnerID() ) < 250 and CheckBuff(TargetID , 507170 )== true  	 then
		SetFlag(TargetID , 544256 , 1 )
		CancelBuff( TargetID , 507170)
	end
	if 	CheckID(TargetID)== true  and CheckAcceptQuest(  TargetID,423349 ) == true and GetDistance(TargetID , OwnerID() ) > 250	and CheckBuff(TargetID , 507170 )== true   then
			CancelBuff( TargetID() , 507170)
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
	end
	sleep(10)
	delobj(DD)
	delobj(KK)
	delobj(MT)
	delobj(OwnerID())
---	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0) 
end

function LuaS_423349_owner()
	local KK = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	while true do
		if 	CheckID( KK)== false	then
			WriteRoleValue( OwnerID(),  EM_RoleValue_Register+1   ,0) 
			break
		end
	sleep(10)
	end
end
function LuaS_423349_KK()--�ˬd��
	local KK = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)--
	local MT= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local DD=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	for i=1,60,1 do
		sleep(10)
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423349)==false) then

				break
		end
		if 	CheckID( player)== true  and CheckAcceptQuest(   player,423349 ) == true and GetDistance( player , OwnerID() ) > 250	then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			ScriptMessage( player , player , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				break
		end
	end
	if CheckID( player)== true then
		CancelBuff( player, 507170)
	end
	if 	CheckID( DD)== true then
			delobj(DD)
	end
	if 	CheckID( MT)== true then
					delobj(MT)
	end
	if 	CheckID( KK)== true then
			delobj(KK)
	end
	delobj(OwnerID())	
end
--------------------------------------
function LuaS_423350_0()--115860�w�S�Jù���ǰe�@���C �ϥκX�l780697�C
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544247)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423007_4]","LuaS_423350_1",0)--- �o�O����N��H
	end
end

function LuaS_423350_1()	
	CloseSpeak( OwnerID() )	
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544247)==false ) and 	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1	then
		BeginPlot( OwnerID(), "LuaS_423350_2", 0)
	end
end
function LuaS_423350_2()
	if  	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1	then
		SetPosByFlag( OwnerID(), 780697 , 0)
		SetFlag( OwnerID() , 544257, 1 )
	end
end
-----
--�g�J������ܼ@���C115862
function LuaS_423350_3()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544258)==false) then
 		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423350_1]","LuaS_423350_5",0)--- (�V[115862]��i���ɪ������Ʃy�C)
		end
		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 1 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423350_1]","LuaS_423350_4",0)--- ���F�ܡH
		end
	end
end
function LuaS_423350_4()
	SetSpeakDetail(OwnerID(),"[SC_423350_2]")---
end

function LuaS_423350_5()---
	CloseSpeak( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544258)==false) then
		WriteRoleValue( TargetID(), EM_RoleValue_Register+1 ,1) 
		BeginPlot( TargetID() , "LuaS_423350_6" , 0 )
	end
end

function LuaS_423350_6()---
	local KK = Lua_DW_CreateObj("flag" ,115923,780697,1,1 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	----SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,false) -----------	
	---SetModeEx(KK ,EM_SetModeType_HideName ,true) -----------
	WriteRoleValue( KK, EM_RoleValue_Register7 ,TargetID()) 
	BeginPlot( KK , "LuaS_423350_7" , 0 )
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 ,0) 
		break
		end
	end
end

function LuaS_423350_7()---�⪱�a�T�w�_�ӡC�ϥ�BUFF507171  115867�w�SMT 115866�㨩AB 115865�g�JNK 115864 ���p-TT
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	SetPosByFlag(  player ,780697 , 23)
	AddBuff(player,507171,1,60)
	local MT = Lua_DW_CreateObj("flag" ,115867,780697,1,1 )---
	local AB = Lua_DW_CreateObj("flag" ,115866,780697,2,1 )---
	local NK = Lua_DW_CreateObj("flag" ,115865,780697,3,1 )---
	local TT = Lua_DW_CreateObj("flag" ,115864,780697,4,1 )---
	DisableQuest( MT ,true )
	DisableQuest( AB ,true )
	DisableQuest( NK ,true )
	DisableQuest( TT ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,MT) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,AB) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,NK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,TT) 
	BeginPlot(OwnerID() , "LuaS_423350_8" , 0 )
	SAY(NK,"[SC_423350_3]")---���ɪG�M�Q�}�a�F��b�A�����}��A�ڭ̨���¼v��ŧ���A�ҩ����F���{���@�ϤF�ڭ̡C
	sleep(35)
	SAY(AB,"[SC_423350_4]")---���F��[115859]�H�z���˻����G�������ܹL�A�P�ڦb�Ѥ��ݨ����϶H�@�Ҥ@�ˡC
---emote_salute02   ruFUSION_ACTORSTATE_EMOTE_SALUTE
PlayMotion(AB ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	AdjustFaceDir( AB , MT , 0 )
	sleep(35)
	AdjustFaceDir( TT , MT , 0 )
	SAY(TT,"[SC_423350_5]")---�ڤ��A�ڥ����i�D�A�@�ӨI�h���ƹ�A�b�A�I�Ϊ��o�q��l�A�ڱڼZ�J�F�`�I���·t��
PlayMotionEX( TT  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(30)
	AdjustFaceDir( MT , TT , 0 )
	SAY(TT,"[SC_423350_6]")--�ڦðd�F�A���ػP���t�C�A�L�k�½æ�ڱڪ��aģ�C
	sleep(25)
	SAY(MT,"[SC_423350_7]")---[115858]�A�o�ä��O�A�����A�ӬO���F�t���������շҡC
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(25)
	SAY(MT,"[SC_423350_8]")---�ٰO�o���H�X�B�U������۵M�ӥ͡A����ߤ����ܪ��H���H
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(25)
	SAY(TT,"[SC_423350_9]")--���A�ڤ��S�����w�H��...���aģ�m��...
	sleep(25)
	SAY(NK,"[SC_423350_10]")--�������]�\�O�ڡA���F���C�p�G���O�ڥѴ˪L���l���ͩR���O�Ƭ��۵M���O�A�γ\�o�Ǻ��F�N���|�p�����D�۵M���O�C
	sleep(40)
	AdjustFaceDir( MT , NK , 0 )
	SAY(MT,"[SC_423350_11]")--�ͩR�̴`�ۦۧڪ��y�D�A�۵M���ɤ����ڨӨ�F�o�A�ᦱ����q�b�˪L�����A�{�b�ݭn�����O�����˪L���˵h�C
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
--PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
---PlayMotion(MT ,  ruFUSION_MIME_EMOTE_HEAD_SHAKE )
	sleep(30)
	SAY(MT,"[SC_423350_12]")--�ͩR�̴`�ۦۧڪ��y�D�A�۵M���ɤ����ڨӨ�F�o�A�ᦱ����q�b�˪L�����A�{�b�ݭn�����O�����˪L���˵h�C
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	SAY(AB,"[SC_423350_13]")--�γ\�ٰ����¼v���v�T�H���j�����F���C�z�ٰO�o�z���S�̺��F��[112852]�ܡH�ڥN��[112852]���ǦӨ�...
-------emote_speak01
PlayMotion(AB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(50)
	AdjustFaceDir( MT , AB , 0 )
	SAY(AB,"[SC_423350_14]")--�b�z�ʤ�B�o�Ǩƫe�A�O�_��бz�Ȯɲ�ť�ڱڪ��G�ƻP�ШD�O�H
PlayMotion(AB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
---emote_speak01
	sleep(40)

	SAY(AB,"[SC_423350_15]")--�b�z�ʤ�B�o�Ǩƫe�A�O�_��бz�Ȯɲ�ť�ڱڪ��G�ƻP�ШD�O�H
----emote_beg
PlayMotion(AB , ruFUSION_ACTORSTATE_EMOTE_BEG)
	sleep(30)
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423350 ) == true and	CheckBuff(player , 507171 )== true then
		SetFlag(player ,544258, 1 ) 
		CancelBuff( player , 507171)
	end
	sleep(20)
	delobj(MT)
	delobj(AB)
	delobj(NK)
	delobj(TT)
	delobj(OwnerID())
end

function LuaS_423350_8()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	local MT =ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local AB =ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	local NK =ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	local TT =ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	for i=1,60,1 do
		sleep(10)
		if 	CheckID( player)== false  or (CheckAcceptQuest(player,423350)==false) then
			break
		end
	end
	if CheckID( player)== true then
		CancelBuff( player, 507171)
	end
	if 	CheckID(MT)== true then
		delobj(MT)
	end
	if 	CheckID(AB)== true then
		delobj(AB)
	end
	if 	CheckID(NK)== true then
		delobj(NK)
	end
	if 	CheckID(TT)== true then
		delobj(TT)
	end
	delobj(OwnerID())
end
--------------423351--------�ϥ�780432
---�ȱ����۸O����
function LuaS_207702()--
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_207702]")
	ShowBorder( OwnerID(), 0, "[207702]", "ScriptBorder_Texture_Paper" );
end
---�I�����Y���@��  �����Y �M�p���F  ��o��Y�ӪF��NCLIENT
function LuaS_423351_USECHECK()
	if	  CountBodyItem( OwnerID(), 207704 )<1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423351_1]", 0 )--�ʥF[207704]�A[115899]�S���_���󪺤����C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423351_1]", 0 )--�ʥF[207704]�A[115899]�S���_���󪺤����C
		return -1
	elseif	 CountBodyItem( OwnerID(), 207704 )>=1 and CountBodyItem( OwnerID(), 207705 )<5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423351_2]", 0 )--�ʥF[<S>207705]�A[115899]�S���_���󪺤����C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423351_2]", 0 )--�ʥF[<S>207705]�A[115899]�S���_���󪺤����C
		return -1
	else	
		return 1
	end
end
function LuaS_423351_USEOK()
	if	(CheckAcceptQuest(OwnerID(),423351)==true )and   CountBodyItem( OwnerID(), 207705 )>=5 then 
		DelBodyItem( OwnerID() , 207705 , 5)
		BeginPlot( TargetID(),"LuaS_423351_1", 0)
		return 1
	else
		return -1
	end
end
function LuaS_423351_1()
	Hide(OwnerID())
	local COCO = Lua_DW_CreateObj("flag" ,115900,780432,1,1 )---
	DisableQuest( COCO ,true )
	SAY(COCO,"[SC_423351_3]")--���A�p�٦n�ܡH
	sleep(20)
	SAY(COCO,"[SC_423351_4]")--���O���A�O��㪺����H
	sleep(20)
	if 	CheckID( TargetID())== false or CheckAcceptQuest(TargetID(),423351)==false	then
		delobj(COCO)
		Show(OwnerID(),0)
		LuaFunc_ResetObj( OwnerID() )
	end
	SAY(COCO,"[SC_423351_5]")---��㪺�F��A�ڦ��n�n���O�ް_�ӤF�C
----	CastSpell( OwnerID(), OwnerID(), 494493)
	local BAG = Lua_DW_CreateObj("flag" ,115898,780432,2,1 )
	sleep(10)
	SAY(COCO,"[SC_423351_6]")---�{�b�N���֧⥦�a���a�I
	sleep(20)
	if 	CheckID( TargetID())== false or CheckAcceptQuest(TargetID(),423351)==false then
		delobj(COCO)
		Show(OwnerID(),0)
		LuaFunc_ResetObj( OwnerID() )
	end
	SAY(COCO,"[SC_423351_7]")--�ڤ]�n��ۧA�A�^���㨭��C
	DW_MoveToFlag(COCO ,780432,2, 0,1)
	sleep(20)
----	CastSpell( OwnerID(), OwnerID(), 494493)
	delobj(COCO)
	SetPlot( BAG,"touch","LuaS_423351_BAG", 20)
	BeginPlot( BAG,"LuaS_423351_BAG_1" ,0)
	for i=1,18,1 do
		if CheckID( BAG)== false then
			break	 
		end
		sleep(10)
	end
	Show(OwnerID(),0)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_423351_BAG()
	if CountBodyItem ( OwnerID(), 207703 ) == 0 then
		GiveBodyItem(OwnerID(),207703,1)
	end
end
function LuaS_423351_BAG_1()
	Group = SearchRangePlayer(OwnerID() , 250)
	for i=1,15,1 do
	sleep(10)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423351 ) == true	and
				CountBodyItem( Group[i] , 207703 ) ==0	then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		if	 i==13 then
			for i=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[i],  423351)==true and CountBodyItem( Group[i] , 207703 ) ==0 then
					ScriptMessage( Group[i], Group[i], 0, "[SC_423351_8]", 0 )--�ѩ�A�w�C���ʧ@�A��[115900]�P�줣�@�СA�o�N[115898]���F�_�ӡA�äS���^���ɤ����C
					ScriptMessage( Group[i], Group[i], 1, "[SC_423351_8]", 0 )--�ѩ�A�w�C���ʧ@�A��[115900]�P�줣�@�СA�o���F�_�ӡA�äS���^�F���ɤ����C
				end
			end	
		break
		end
	end
	delobj(OwnerID())
end

----------------�������t��507172 �R�� AB �w�SMT 780432 4
function LuaS_423351_complete()
	AddBuff(TargetID(),507172,1,50)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MT = Lua_DW_CreateObj("flag" ,115901,780697,1,1 )---
	local AB = Lua_DW_CreateObj("flag" ,115902,780697,2,1 )---
	DisableQuest( MT ,true )
	DisableQuest( AB ,true )
	DW_MoveToFlag(AB ,780432,4, 0,1)
	SAY(AB,"[SC_423351_9]")---���F���A���F�N��ڤ���z���q�N�A�ڤ��O�ڱa���ݩ�L�h���H���A�]�N�O���F��[112852]���P�z�@�P�ϥιL���t�C��~�U���C
PlayMotionEX( AB  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(25)
	SAY(AB,"[SC_423351_18]")---���F���A���F�N��ڤ���z���q�N�A�ڤ��O�ڱa���ݩ�L�h���H���A�]�N�O���F��[112852]���P�z�@�P�ϥιL���t�C��~�U���C
	sleep(25)
	SAY(AB,"[SC_423351_10]")---�t�~�٦��Ӱȥ��бz���U���F��A�o�O[ZONE_THE GREEN TOWER]���ѰU�ڥ�I���z���t�g�C
	sleep(30)
	SAY(MT,"[SC_423351_11]")
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(25)
	SAY(AB,"[SC_423351_12]")---
	sleep(25)
	SAY(MT,"[SC_423351_13]")---�A�̪��߷N�A�ڳ��P����F�C
PlayMotion( MT , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(25)
	SAY(AB,"[SC_423351_14]")--�t�~�A�ڤ��ѰJ���ƾ��z��^�����A�оɩҦ����F�󰪶������F�ԧޡA�ä@�Ԥd�~�Ӫ��ɥ��C
	sleep(30)
	SAY(AB,"[SC_423351_15]")--��M�o�ӵ��СA�ä����@�ɡA�{�b�󭫭n���O�ѱϦb�����ڤH�A���L�̦A�׫�_���F���ơC
	sleep(30)
	SAY(AB,"[SC_423351_16]")--�ڤ]�|�ɤ@�v���O�A�����A�̪��U��A�Ʊ�A�̯౵���o�Ӵ�ĳ�C
	sleep(30)
	SAY(MT,"[SC_423351_17]")--�ک��թp���߷N�A���򱵤U�ӴN���ҧA�̤F�C
PlayMotion( MT , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	if 	CheckID( TargetID() ) == true  then
		CancelBuff( TargetID() , 507172)
	end
	sleep(10)
	delobj(MT)
	delobj(AB)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
