---------------------------------------------------------------------------------
-----------423624-------�d��@��
---1.�˹���񪱮a�O�_��������423624�A�����ܵ�BUFF�A�}�t�C
---2.��b�t�������q�A�s�W�@�ӽd��@���C�Ш�L���a�b���Ӧa��y���@�U�C�Q�Φr��I780748
function LuaS_423624()
	SetPlot( OwnerID(),"range","LuaS_423624_1",200)
end

function LuaS_423624_1()
	if	CheckAcceptQuest(OwnerID(),423624)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423624_2" , 0 )
	end
end
---1.�إX�V�@�]���˹� �ƼƸ�
---2.����BUFF �n�Ƽ�
--3.���� SCRIPT MESSAGE �n���n�üơH
----CLIENT ��BUFF 508042  �X�� 544591
function LuaS_423624_2()
	SetPlot( OwnerID(),"range","",200)
	local KK = Lua_DW_CreateObj("flag" ,116187,780749,0,0 )---�إX�@�Ӵx��������NPC���]���C
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition(KK, 0 )
	BeginPlot( KK , "LuaS_423624_4" , 0 )
	local Player = SearchRangePlayer( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( player[i] , 423624 ) == true  and CheckFlag( player[i],544591)==false and CheckBuff( player[i]  ,508042)==false  then
			AddBuff(player[i] ,508042,1,80)
			BeginPlot(  KK , "LuaS_423624_3" , 0 )
		end
	end	
	sleep(10)
---	if 	ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
--		BeginPlot(  KK , "LuaS_423624_3" , 0 )
--		say(KK,"111111111111111")
--	end
	Callplot( OwnerID(), "LuaS_423624_1_sub",KK)
end
function LuaS_423624_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register ,0) 
					SetPlot( OwnerID(),"range","LuaS_423624_1",200)
			break
		end
	end
end
-----�����S���ѥ[�쪺���a�T�� BUFF����20��@�� �[�J�üƹ��
function LuaS_423624_3()
	SetPlot( OwnerID(),"range","LuaS_423624_78",250)
end
function LuaS_423624_78()
	sleep(20)
	local Player = SearchRangePlayer( OwnerID() , 201 )
	for k=1,100,1 do
		sleep(10)
		for i=0,table.getn(Player)-1 do
			if	CheckAcceptQuest( player[i] , 423624 ) == true  and CheckFlag( player[i],544591)==false and  CheckBuff( player[i]  ,508042)==false and CheckBuff( player[i]  ,508043)==false  then
					AddBuff(player[i] ,508043,1,15)
					ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_0]" , 0) --����Ǩө_�Ǫ��n�T�C		
					ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_0]" , 0) 
					sleep(20)
					local QQ = DW_Rand(100)
					if QQ < 25   then
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_1]" , 0) --�����G�M�h�I���Ȯɦb���ݵۡI�ݷ|��A�ڭ̴N�|�L�h�F�I		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_1]" , 0) 		
						elseif QQ>=25 and QQ<50 then
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_2]" , 0) --�d�����G���r�r��@�ӤH���S���H�Ĥl�A�A�����a�I�ڥ������¶¶�I 		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_2]" , 0) 
						elseif QQ>=50 and QQ<75 then
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_3]" , 0)--��P�G�P�����z�A�ڦ��Ѥ��n���w�P�A�d�����A�Х��b���̵��ݡI 		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_3]" , 0) 
						else
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_4]" , 0)---����J�G���b�o�ݵۡA�P�L�̷|�X�I�o���񪺤������Ǥ�í�w�A�ڥ��L�h�B�z�C		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_4]" , 0) 
					end	
			end
		end	
	end
end
------------------------------------------
--�N�Ҧ����a �ǰe��T�w�Ѥl  780749   �B�����a�H�Ψ䥦NPC ����Q���˪��ʧ@  �����a���� �W�L�� �j���a�C
--���a��q�C��30�w  ����1�w   ���a��q����50�w �h���� 10�w  ����ĳ���n����  
--�s��  ��i�G116802 �d�G116803 ���G116804 ���G116805  �N�G116566 �ҡG116567  �Ԫk�����G116569    ��Z�g�G116568

function LuaS_423624_4()
---�ҫk �M�N�������
	local Group = {}
	Group = SearchRangePlayer(OwnerID(), 200)
	local STAR = Lua_DW_CreateObj("flag" ,116802,780749,1,1 )
	local CS   = Lua_DW_CreateObj("flag" ,116803,780749,2,1 )
	local TONY = Lua_DW_CreateObj("flag" ,116804,780749,3,1 )
	local MORK = Lua_DW_CreateObj("flag" ,116805,780749,4,1 )
	local GILL = Lua_DW_CreateObj("flag" ,116566,780749,5,0 )
	local LB   = Lua_DW_CreateObj("flag" ,116567,780749,6,0 )
	local LAF  = Lua_DW_CreateObj("flag" ,116569,780749,7,0 )	
	local ETN  = Lua_DW_CreateObj("flag" ,116568,780749,8,0 )
	MoveToFlagEnabled( ETN , false )
	DisableQuest(  STAR , true )
	DisableQuest(  CS , true )
	DisableQuest(  TONY , true )
	DisableQuest(  MORK , true )
	DisableQuest(  GILL , true )
	DisableQuest(  LB , true )
	DisableQuest(  LAF , true )
	DisableQuest(  ETN , true )
---	���ܰ���
	SetModeEx(GILL,EM_SetModeType_Gravity,false) 
	WriteRoleValue(GILL,EM_RoleValue_Y,850)	
	SetModeEx(LB,EM_SetModeType_Gravity,false) 
	WriteRoleValue(LB,EM_RoleValue_Y,850)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register ,  STAR) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,CS)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,TONY)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4,MORK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,GILL)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register6 ,LB)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register7 ,LAF) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register8 ,ETN) 
	WriteRoleValue(ETN ,EM_RoleValue_IsWalk , 0  )
	BeginPlot( OWNERID() , "LuaS_423624_5" , 0 )
	sleep(20)
	Yell(TONY,"[SC_423624_5]",3)--�M�h�A�A�ש��F�H
	SLEEP(30)
	Yell(CS,"[SC_423624_6]",3)--�A��ı�o�o�̥��R�즳�Ǹ޲��ܡH
	SLEEP(30)
	Yell(MORK,"[SC_423624_7]",3)--��....�Pı...
	SLEEP(30)
---��P�e�i  ���X���@���ʧ@ DW_MoveToFlag( OwnerID(),780749,14, 0,1) ruFUSION_ACTORSTATE_ATTACK_1H
PlayMotion(STAR, ruFUSION_ACTORSTATE_ATTACK_1H)
 	Yell(STAR,"[SC_423624_8]",3)----�M�I�I�p�ߡI	
---�R�O���a�ۤv�I�� ���G���k�N  �Ϊ̺إX�@�����βy�I��k�N  496477
BeginPlot( STAR , "LuaS_423624_CRY" , 0 )
BeginPlot( TONY , "LuaS_423624_CRY" , 0 )
BeginPlot( CS , "LuaS_423624_CRY" , 0 )
BeginPlot( MORK , "LuaS_423624_CRY" , 0 )
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag(  Group[i],544591)==false and CheckBuff(  Group[i]  ,508042)==true  then 
			CastSpell( Group[i], Group[i],496477)---���G
		end
	end	
---���M�������a�U�� DW_CancelTypeBuff(68, player[i] )
	SLEEP(10)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag(  Group[i],544591)==false and CheckBuff(  Group[i]  ,508042)==true  then 
			DW_CancelTypeBuff(68,  Group[i] )
	--------		CastSpell( Group[i], Group[i],491276)---���G
		end
	end
---�b�벴���k�N  �I�i��  �� LAF �PETN �@�P���X   ���Ҧ��H�]�t���a�Q����	�åB�Q����  �WBUFF   508044
	AddToPartition( LAF , 0)
	AddToPartition( ETN , 0)
---�����a���^�˰ʧ@  �[����
	SLEEP(10)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag( Group[i],544591)==false   and CheckBuff( Group[i]  ,508042)==true  then 
			PlayMotion( Group[i] , ruFUSION_ACTORSTATE_HURT_NORMAL )
			AddBuff(Group[i] ,508044,1,20)
		end
	end
	SLEEP(40)
	AddBuff(TONY ,508044,1,20)
	AddBuff(MORK ,508044,1,20)
	AddBuff(CS ,508044,1,20)
	AddBuff(STAR ,508044,1,20)
	Yell(LAF,"[SC_423624_9]",3)--�p�³���o�@�����ȳ~����ܡH
	sleep(35)
	Yell(LAF,"[SC_423624_10]",3)----����ۧ�ù�����Pı�����a�H
	sleep(30)
---�Ԩ��� ��P
	BeginPlot( LAF , "LuaS_423624_LAF" , 0 )
	Yell(LAF,"[SC_423624_11]",3)---���ڧ�A���٦��m���D�H�a�I
	sleep(30)
	AdjustFaceDir( LAF , STAR, 0 )
	Yell(LAF,"[SC_423624_12]",3)---�A�h�W�������A�O�ڳ̹ڴK�H�D������A
	sleep(30)
	Yell(LAF,"[SC_423624_13]",3)---����̱Z���I�٤����֨ӪA�͡A�ڭ̴L�Q���H���H
------idle02 ruFUSION_ACTORSTATE_EMOTE_IDLE2
PlayMotion(LAF, ruFUSION_ACTORSTATE_EMOTE_IDLE2)	
	sleep(30)
	Yell(LAF,"[SC_423624_14]",4)--��R���Ȥj�H�A�i�O�ǳƤF�@�s�ꪺ�C���ө۫ݧڭ̳o��L�Q���ȤH�O�I
---��Z�g ������H���CDW_MoveToFlag( MM,780749,9, 0,1)  496580
	SysCastSpellLv(ETN,TONY,496580,1)
	SLEEP(10)
	BeginPlot( ETN, "LuaS_423624_ETN" , 0 )
	AddToPartition( GILL , 0)
	AddToPartition( LB , 0)
	BeginPlot( LB , "LuaS_423624_LB" , 0 )
	BeginPlot( GILL , "LuaS_423624_GILL" , 0 )
	SLEEP(40)
	Yell(LB,"[SC_423624_15]",5)---���L�̻��@�I�I�a�H�I
	sleep(10)
CastSpell( LAF , LAF ,496485)
----	AdjustFaceDir( ETN , TONY, 0 )
	sleep(20)
	Yell(LAF,"[SC_423624_16]",3)---���r���Ӥp�³��ٯd���@��A�C���۵M�n�p���~�঳��I
	sleep(30)
	Yell(LAF,"[SC_423624_17]",3)---
	sleep(30)
	CastSpell( ETN , LAF ,496484)
	Yell(LAF,"[SC_423624_18]",3)---���a�A�̶ʩg
	CastSpell( LAF , LAF ,491276)
	sleep(20)
	delobj(ETN)
	delobj(LAF)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag( Group[i],544591)==false and CheckBuff(Group[i] ,508042)==true  then 
			ScriptMessage(	Group[i] , Group[i] , 1 , "[SC_423624_19]" , 0)---����p�³��A�A�i�O���ڤӥ���C
			ScriptMessage( 	Group[i] , Group[i] , 0 , "[SC_423624_19]" , 0)
		end
	end
	sleep(30)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag(Group[i] ,544591)==false and CheckBuff(Group[i] ,508042)==true  then 
			ScriptMessage(	Group[i] , Group[i] , 1 , "[SC_423624_20]" , 0)---�U��A�D�H�w�g�]�U�߮b�A�ڷ|�b��Ԥҥj�����ݧA�̪��j�{�C
			ScriptMessage( 	Group[i] , Group[i] , 0 , "[SC_423624_20]" , 0)
			CancelBuff( Group[i], 508044)
		end
	end
	sleep(30)
---�d�������B
PlayMotion(CS, ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	Yell(CS,"[SC_423624_21]",4)--�i�c�I�S�Q�\�F�@�D�C
	sleep(10)
	yell(Star,"[SC_423624_22]",4)---����...
	BeginPlot( star , "LuaS_423624_star" , 0 )
	sleep(30)
	yell(TONY,"[SC_423624_23]",4)---�����I[116585]�I	
	BeginPlot( CS , "LuaS_423624_ALL" , 0 )
	BeginPlot( GILL , "LuaS_423624_FLAY" , 0 )
	BeginPlot(MORK , "LuaS_423624_ALL" , 0 )
	BeginPlot( LB , "LuaS_423624_FLAY" , 0 )
	DW_MoveToFlag( TONY,780749,10, 0,1)
	sleep(20)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624) == true ) and CheckFlag( Group[i],544591)==false and CheckBuff(  Group[i]  ,508042)==true  then 
			SetFlag( Group[i], 544591, 1 )
			CancelBuff( Group[i], 508042)
		end
	end
	delobj(STAR)
	delobj(CS)
	delobj(TONY)
	delobj(MORK)
	delobj(GILL)
	delobj(LB)
	delobj(LAF)
	delobj(ETN)
	delobj(ownerID())
end	
function LuaS_423624_ALL()
	sleep(10)	
	move(OwnerID(),-5336.4+rand(35) , 769.4 , 45335.6+rand(35)  )
end
function LuaS_423624_FLAY()
	sleep(10)	
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_RUN_FORWARD )
	move(OwnerID(),-5336.4+rand(50) , 769.4 , 45335.6+rand(50)  )
end

function LuaS_423624_star()	
	DW_MoveToFlag( OwnerID(),780749,12, 0,1)
end

function LuaS_423624_LAF()	
	DW_MoveToFlag( OwnerID(),780749,13, 0,1)
end

function LuaS_423624_ETN()	
	DW_MoveToFlag( OwnerID(),780749,14, 0,1)
end

function LuaS_423624_LB()	
	AdjustDir(OwnerID() ,280)
	MoveToFlagEnabled( OwnerID(), false )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_RUN_FORWARD )
	MoveDirect(OwnerID()  , -5366.3 , 769.7 , 45430.8)
	AdjustDir(OwnerID() ,360)
	SLEEP(100)
	PlayMotion(OwnerID() , ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_IDLE_STAND )
----	AdjustDir(OwnerID() ,180)
end
	
function LuaS_423624_GILL()	
	AdjustDir(OwnerID() ,280)
	MoveToFlagEnabled( OwnerID(), false )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_RUN_FORWARD )
	MoveDirect(OwnerID()  , -5411.3 , 769.4 , 45390.5)
	AdjustDir(OwnerID() ,360)
	SLEEP(100)
	PlayMotion(OwnerID() , ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_IDLE_STAND )
----	AdjustDir(OwnerID() ,180)
end
	
function LuaS_423624_CRY()
 	CastSpell( OwnerID(),  OwnerID(), 496477)
	SLEeP(10)
	PlayMotion(  OwnerID(),   ruFUSION_ACTORSTATE_HURT_NORMAL )
end
function LuaS_423624_5()
	local STAR = ReadRoleValue(OwnerID(),EM_RoleValue_Register)--
	local CS   = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local TONY = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local GILL = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local LB   = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)--
	local LAF  = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	local ETN  = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)--
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 200)
	for i=1, 80, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423624 ) == true	and  CheckFlag( Group[K], 544591) == false     and   CheckBuff(  Group[K]  ,508042)==true   and GetDistance( Group[K] , OwnerID() ) < 200  	then
				Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423624 ) == true	and
				CheckFlag( Group[K], 544591) == false and GetDistance( Group[K] , OwnerID() ) >200		then
				ScriptMessage( Group[K], Group[K], 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				CancelBuff( Group[K], 508042)		
							if	CheckBuff(Group[K],  508042)==true  then
								CancelBuff(Group[K] , 508042)
							end
							if	CheckBuff( Group[K]  ,508044)==true  then
								CancelBuff( Group[K], 508044)

							end
			end
			if  	CheckAcceptQuest( Group[K], 423624 ) == false	and CheckFlag( Group[K], 544591) == false     then
					if  CheckBuff(Group[K],  508042)==true then
						CancelBuff( Group[K], 508042)
					end
					if  CheckBuff(Group[K],  508044)==true then
						CancelBuff( Group[K], 508044)
					end
			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(STAR)
	delobj(CS)
	delobj(TONY)
	delobj(MORK)
	delobj(GILL)
	delobj(LB)
	delobj(LAF)
	delobj(ETN)
	delobj(ownerID())
end