------------------423352
---�b�ƾ���
function LuaS_423352_USECHECK()
	if	CountBodyItem( OwnerID(), 207738 )<1	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423352_1]", 0 )--�S��[207739]�A�L�k�b�ơC
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423352_1]", 0 )--
		return -1
	elseif	 CountBodyItem( OwnerID(), 207739 )>=5  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423352_2]", 0 )--�γ\�A�ӺɧֱN�A���b�Ʀ��G�A�i�����F���C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423352_2]", 0 )--
		return -1
	else	
		return 1
	end
end
function LuaS_423352_USEOK()
	IF  CountBodyItem( OwnerID(), 207738 )>=1   and CheckAcceptQuest( OwnerID() , 423352 ) == true then
		DelBodyItem( OwnerID() , 207738 , 1)
		GiveBodyItem( OwnerID() ,  207739 , 1 ) 
		BeginPlot( TargetID(),"LuaS_207738_1", 0)
		return 1
	else
		return -1
	end
end
function LuaS_207738_1()
	Hide( OwnerID())
	local KK = LuaFunc_CreateObjByOBj(115905 ,  OwnerID() )
--�I��k�N
	BeginPlot(  OwnerID(), "LuaS_207738_2" , 0 )
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423352_3]", 0 ); -------�o��[115904]�Q�z�b�ƤF�C
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423352_3]", 0 )
end

function LuaS_207738_2()
	sleep(300)
	LuaFunc_ResetObj( OwnerID() )
end
----�ϥ�BUFF 507173  �إX MT(115906) KK(115907)
function LuaS_423352_complete()
	AddBuff(TargetID(),507173,1,30)	
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MT = Lua_DW_CreateObj("flag" ,115906,780697,1,1 )---
	local KK = Lua_DW_CreateObj("flag" ,115907,780697,4,1 )---	
	DisableQuest( MT ,true )
	DisableQuest( KK ,true )
	AdjustFaceDir( KK , MT , 0 )
	AdjustFaceDir( MT , KK , 0 )
	SAY(MT,"[SC_423352_4]")--���U�ӡA�ڥ���P���m�����C�����N�A�o�̴N���浹�A�F�C
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	SAY(MT,"[SC_423352_5]")--���n��~�B���ߡA�@������b�ӸѡA�ڭ̷|�w�M�׹L���F�t�����շҡC
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	PlayMotion( KK , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	SAY(KK,"[SC_423352_6]")---�ڪ��D�F...����Q�������P��H�e�A�A�����੿���o�@�I�C
	PlayMotion( KK, ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(30)
	SAY(MT,"[SC_423352_7]")--�ک��աA�g�J���P�㨩���g���B[$PLAYERNAME]�A�N�浹�A�F�C
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	SAY(MT,"[SC_423352_8]")--�԰O�کҶD����...���U���^�k��l�C
	PlayMotion( MT ,  ruFUSION_ACTORSTATE_EMOTE_POINT)	
--���S�ġC���� �����C
 	sleep(10)
	DW_MoveToFlag(MT ,780697,25, 0,1)--�n�b�[�ʧ@
	delobj(MT)
	sleep(30)
	SAY(KK,"[SC_423352_9]")--
	sleep(20)
--	ScriptMessage( TargetID(), TargetID(), 0 , "[SC_423352_9]" , 0 )
	local Player = SearchRangePlayer ( OwnerID() , 500 )
	for i=0,table.getn(Player)-1 do
		if (CheckCompleteQuest( player[i], 423352 )==true) and	(CheckAcceptQuest( player[i] , 423353 ) == false ) and CheckFlag( player[i],544291)==false and CheckBuff(player[i] , 507173 )== true  then
			SetFlag(player[i],544291,1)
		end
	end
	if 	CheckID( TargetID() ) == true  then
		CancelBuff( TargetID() , 507173)
	end
	delobj(KK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
end

----------------------------------------------------------------------------------------
----------------423353

function LuaS_423353_1()
	SetSpeakDetail(OwnerID(),"[SC_423353_2]")---
 	if	CheckAcceptQuest( OwnerID() , 423353 ) == true	and	CheckFlag( OwnerID(),544259) == false and	CountBodyItem( OwnerID(), 207740)>=1 and ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423353_3]","LuaS_423353_2",0)
	end
end

function LuaS_423353_2()	
	CloseSpeak( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423353 ) == true	and	CheckFlag( OwnerID(),544259) == false and	 CountBodyItem( OwnerID(), 207740)>=1  and ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 	then
		DelBodyItem( OwnerID() , 207740 , 1)
		BeginPlot( TargetID(), "LuaS_423353_3", 0)
	end
end
function LuaS_423353_3()
	DisableQuest(OwnerID(),true)	
---	Hide(OwnerID())
	SetModeEx(OwnerID(),EM_SetModeType_ShowRoleHead ,false) -----------	
	SetModeEx(OwnerID(),EM_SetModeType_HideName ,true) -----------
	SetModeEx(OwnerID(),EM_SetModeType_Show,false) 

--�إ߾԰��δ��� &����԰���d�s�����D &���w�ؼ� &��������
	local NPC = Lua_DW_CreateObj("obj",104078,OwnerID())
--	local MM = Lua_DW_CreateObj("obj",115972,OwnerID())
	SetRoleCamp( NPC  , "Visitor" ) 
	Say(NPC,"[SC_423353_4]")--�u�}�I�ֳ�����������Ƥj�a���𮧡A���F���F...���F�ͦs...��ê�b�ڭ��e���A���o��...
	sleep(30)
	Say(NPC,"[SC_423353_5]")---�A��ڰ��F����H�n�h�W...
	SetRoleCamp( NPC  , "Monster" ) 
	SetPlot(NPC,"dead","LuaS_423353_4",0)
	BeginPlot(NPC,"LuaS_Discowood_CheckPeace",0)
	SetAttack(NPC,TargetID())	
--�ˬd����S�����a������ �S���F���q�@�� �άO�g�J�����F?
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 350)
---	Group = SearchRangePlayer(MM, 350)
	for i=1, 360, 1 do
		for K=0,table.getn(Group)-1 do

			if	CheckAcceptQuest( Group[K], 423353 ) == true	and
				CheckFlag( Group[K], 544259) == false	then
				Num = Num + 1
			end
		end
		if	Num == 0 or CheckID(NPC)==false or ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 1 then
				if  ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 1 then
					AddBuff(OwnerID() , 507173,1,40)	
				end
			break
		end
		if CheckID( NPC ) == true and i==360 then
			for M=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[M], 423353 ) == true	and
					CheckFlag( Group[M], 544259) == false	then
					ScriptMessage(Group[M], Group[M],  1 , "[SC_423353_6]" , 0 ) --�W�X�ɶ��A�@�����_�C
					ScriptMessage( Group[M], Group[M], 0 , "[SC_423353_6]" , 0 )

				end
			end
			break
		end
		sleep(10)
	end
---	Delobj( MM)
	Delobj( NPC )
---	Show(OwnerID(),0)
	SetModeEx(OwnerID(),EM_SetModeType_ShowRoleHead ,true) -----------	
	SetModeEx(OwnerID(),EM_SetModeType_HideName ,false) -----------
	SetModeEx(OwnerID(),EM_SetModeType_Show,true) 
	sleep(20)
	if  CheckBuff( OwnerID() , 507173) ==true then
		Yell(OwnerID(),"[SC_423353_7]",6)--���Y���{�e�A���O�V�ѤF�ǡA��H���q�b�Ť����y�ۡC
		sleep(30)
		Yell(OwnerID(),"[SC_423353_8]",6)--�O�A�H[$PLAYERNAME]�A�ڴ��g���L�A�C
		sleep(30)
		Yell(OwnerID(),"[SC_423353_9]",6)---���b�g�ħA���@���A�ڪ��D�A...
		sleep(30)
		Lua_CancelAllBuff( OwnerID() ) 
	end
	sleep(20)
	DisableQuest(OwnerID(),false)
end


function LuaS_423353_4() --���`�@�� �������X��
	local Tar
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,423353)	and
			CheckFlag(Tar,544259)==false	then
			SetFlag(Tar,544259,1)
		end
	end	
	DelObj(OwnerID())
	return true
end
-------------------------------------------------------------------------------------------------------------
--------------423354
---function LuaS_423354_1()---544260���L  �ϥΪ�BUFF507174�T�{
--	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423354_1]" , 0 ) --�ڤw�b�A���W�L�W���O�C
--	ScriptMessage(TargetID() , TargetID() , 0 ,  "[SC_423354_1]" , 0 )
--	SetFlag(TargetID(),444260,1)
----end

---
function LuaS_423354_2()
	LoadQuestOption( OwnerID() )		--
	if	CheckAcceptQuest( OwnerID() , 423354 ) == true	and	CountBodyItem( OwnerID(), 207741 )>=1 and	CheckFlag( OwnerID(),544289) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 and	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423354_2]","LuaS_423354_4",0)	--(��J[207741]�C)
	end
	if	CheckAcceptQuest( OwnerID() , 423354 ) == true	and	CountBodyItem( OwnerID(), 207741 )>=1  and	CheckFlag( OwnerID(),544289) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 1 and	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423354_2]","LuaS_423354_3",0)	--(��J[207741]�C)
	end
end

function LuaS_423354_3()
	SetSpeakDetail(OwnerID(),"[SC_423354_3]")---�A�oı[207741]�A�o�X�F���˪����~�A�γ\�A�ӵy���@�|��A�J���[��[207741]�Ϊ�[115920]�A�o�ͤF���򲧪��C
end

function LuaS_423354_4()---�I��k�N ���P�D�� �������ȩ|����544289�����a �WBUFF�C �ϥ�780698 �����v�� EZ �̧Q����  MT �w�S
	CloseSpeak( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423354 ) == true	and	CheckFlag( OwnerID(),544289) == false    and	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 then	
		WriteRoleValue( TargetID(), EM_RoleValue_Register ,1) 
		BeginPlot( TargetID(), "LuaS_423354_5", 0)
	end
end

function LuaS_423354_5()
--	CastSpell( OwnerID(), OwnerID(), 495913)
	DelBodyItem( TargetID(), 207741 , 1 )
	local Player = SearchRangePlayer( OwnerID() , 400 )
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false   and CheckBuff( player[i]  , 507174)==false   then
			local BUFF = { 507175, 507197, 507198}
			local Num = DW_Rand( 3 )--math.floor�G�����
------			if Num ~=nil then debugmsg( 0,0, "Num = "..Num) end
			DW_CancelTypeBuff(68, player[i] )
			AddBuff( player[i] , BUFF[Num] , 1, 60)
		end
	end
	sleep(10)
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false and CheckBuff( player[i]  , 507174)==false  then
			DW_CancelTypeBuff(68, player[i] )
			AddBuff(player[i] ,507174,1,60)
		end
	end

----	CastSpell( OwnerID(), OwnerID(), 495914)
	local KK = Lua_DW_CreateObj("flag" ,115921,780698,1,1 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK ) ----
--	SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,false) -----------	
--	SetModeEx(KK ,EM_SetModeType_HideName ,true) -----------
	WriteRoleValue( KK, EM_RoleValue_Register7 ,TargetID()) 
	BeginPlot( KK, "LuaS_423354_6", 0)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue( OwnerID(), EM_RoleValue_Register ,0) 
			break
		end
	end
end
function LuaS_423354_6()
	local EZ = Lua_DW_CreateObj("flag" ,115636,780698,1,1 )---
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,EZ) 
	DisableQuest( EZ ,true )
	local MT = Lua_DW_CreateObj("flag" ,115922,780698,0,1 ,0)---
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,MT) 
	---Hide(MT)
	DisableQuest( MT ,true )
	BeginPlot( OwnerID(), "LuaS_423354_7" , 0 )
	DW_MoveToFlag(EZ ,780698,4, 0,1)--
	Say(EZ ,"[SC_423354_15]")---��...�w�g�L�F�d�~�F...
	sleep(25)
	Say(EZ ,"[SC_423354_16]")---��...�w�g�L�F�d�~�F...
	sleep(30)
	Say(EZ ,"[SC_423354_17]")---��...�w�g�L�F�d�~�F...
	AddToPartition( MT , 0 )
	DW_MoveToFlag(MT ,780698,2, 0,1)--
	sleep(20)
	Say(MT,"[SC_423354_4]")---��Q����...
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	AdjustFaceDir( EZ , MT , 0 )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423354_1]" , 0 ) --[115636]�ݵ۲��e�K�_�F���Y�C
	ScriptMessage(TargetID() , TargetID() , 0 ,  "[SC_423354_1]" , 0 )
	Say(EZ,"[SC_423354_5]")--�S�O�ۼv�H
	PlayMotion(EZ ,  ruFUSION_ACTORSTATE_CAST_BEGIN )
--PlayMotion(EZ , ruFUSION_ACTORSTATE_BUFF_BEGIN )
	sleep(20)
	Say(EZ,"[SC_423354_6]")--��A�ڤ��|�A�Q�A�Ұg�b�A�L�h���g���٤����G�ܡH�H�A�̳o�ǵL�����ͪ��A�ٷQ�I�ǽ��ڱڡH
	PlayMotion( EZ ,  ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(30)
	Say(MT,"[SC_423354_7]")--�O�ڡA�p���{�o�F�ܡH�ٰO�o���F�t�����л��a�H
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(EZ,"[SC_423354_8]")--�O�H���\�X�P�˪��A�״N��g�b�ڡA�L�ä��O�A�o�إu�|�Ƭ��ۼv�g�b�L�H���C���ͪ��A�ү������
	PlayMotion( EZ ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
	Say(EZ,"[SC_423354_9]")--�a�ۧA�������A�^�k�󳱷t�����h�a�I���ڦb���A�e���o�A�~��a���c�P��u�@�B�C
	PlayMotion( EZ ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
	Say(MT,"[SC_423354_4]")---��Q����...
	CastSpell( EZ, MT, 495954)
	sleep(10)
	CastSpell( MT, MT, 495920)
	sleep(10)
	local Player = SearchRangePlayer( OwnerID() , 300 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false then
			CastSpell( EZ,  player[i], 495954)
			--CastSpell( player[i], player[i], 494493)
			if	CheckBuff(player[i]  ,  507175)==true  then
				CastSpell( player[i], player[i], 495955)
				CancelBuff( player[i] , 507175)
			end
			if	CheckBuff( player[i]  ,  507197)==true  then
				CastSpell( player[i], player[i], 495955)
				CancelBuff( player[i] , 507197)
			end
			if	CheckBuff( player[i]  ,  507198)==true  then
				CastSpell( player[i], player[i], 495955)
				CancelBuff( player[i] , 507198)
			end
		end
	end
	Say(EZ,"[SC_423354_10]")---���i��......�A���i���٬��ۡC
	PlayMotion( EZ ,  ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
	AddBuff(MT ,507271,1,10)
	Say(EZ,"[SC_423354_11]")---�ڷ|���o��h���O�q���h�A�A�A...�̦n��ܰ��W���h�C
	PlayMotion( EZ ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	DW_MoveToFlag(EZ ,780698,5, 0,1)--
---	CastSpell( EZ, EZ, 494839)
	CastSpell( EZ, EZ, 495980)
--�ਭ���}�C495980
	sleep(20)
	delobj(EZ)
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false and CheckBuff( player[i]  , 507174)==true  then
			SetFlag(player[i],544289,1)
			CancelBuff( player[i], 507174)
			ScriptMessage( player[i] ,player[i] , 1 , "[SC_423354_12]" , 0 ) --�w�S�Jù���W�����A�L�L�Į��C
			ScriptMessage(player[i] , player[i] , 0 ,  "[SC_423354_12]" , 0 )---
		end
	end
	CancelBuff( MT  ,  507197)
	PlayMotion( MT ,  ruFUSION_ACTORSTATE_EMOTE_IDLE2   )
	Say(MT,"[SC_423354_13]")---�G�M�٬O�A..����[115635]...
	sleep(30)
end

function LuaS_423354_7()
	local MT = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local EZ = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423354 ) == true	and
				CheckFlag( Group[K], 544289) == false and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423354 ) == true	and
				CheckFlag( Group[K], 544289) == false and GetDistance( Group[K] , OwnerID() ) >300		then
				ScriptMessage( Group[K], Group[K], 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				CancelBuff( Group[K], 507174)		
							if	CheckBuff(Group[K],  507175)==true  then
								CancelBuff(Group[K] , 507175)
							end
							if	CheckBuff( Group[K]  ,  507197)==true  then
								CancelBuff( Group[K], 507197)

							end
							if	CheckBuff( Group[K],  507198)==true  then
								CancelBuff( Group[K], 507198)
							end
			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(OwnerID())
	delobj(MT)
	delobj(EZ)

end

function LuaS_423354_8()
	if	CheckAcceptQuest( targetID(), 423354 )==true	and	CheckFlag(  targetID(), 544289) == flase  then
 --BuffTypeNum ��J�Q�Ѱ���buff ����
--68 �M��
--58 �ܨ�
--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� IDNum
--��1 �h�w�]�� TargetID()
		DW_CancelTypeBuff(68, targetID())
		return true
	end
	return false
end


-----------------------
function Lua_ObjAreaCheck_507236_0() --���˰����a�I
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false  then
		CancelBuff_NoEvent( OwnerID() , 507175 )
		CancelBuff_NoEvent( OwnerID() , 507174 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423354_14]", 0 ) --�л\�A���W����������z�C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423354_14]", 0 )
	end
end
function Lua_ObjAreaCheck_507237_0() --���˰����a�I
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false then
		CancelBuff_NoEvent( OwnerID() , 507197 )
		CancelBuff_NoEvent( OwnerID() , 507174 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423354_14]", 0 ) --�л\�A���W����������z�C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423354_14]", 0 )
	end
end
function Lua_ObjAreaCheck_507238_0() --���˰����a�I
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false  then
		CancelBuff_NoEvent( OwnerID() , 507198 )
		CancelBuff_NoEvent( OwnerID() , 507174 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423354_14]", 0 ) --�л\�A���W����������z�C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423354_14]", 0 )
	end
end
function Lua_ObjAreaCheck_507174_0() --���˰����a�I
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false  then
		CancelBuff_NoEvent( OwnerID() , 507174 )
	end
end