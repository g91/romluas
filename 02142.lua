function LuaS_423635()
		SetPlot( OwnerID(),"range","LuaS_423635_1",150)
end


function LuaS_423635_1()

	if	CheckAcceptQuest(OwnerID(),423635)==true  and CheckFlag( OwnerID(),544598)==false  and  ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423635_2" , 0 )
	end
end
function LuaS_423635_2()----104332
	local KK = Lua_DW_CreateObj("flag" ,116904,780807,1,1 )---�إX�@�Ӵx��������NPC���]���C
	SetPlot( OwnerID(),"range","",150)
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition( KK, 0 )
	BeginPlot( KK , "LuaS_423635_3" , 0 )
	Callplot( OwnerID(), "LuaS_423635_1_sub",KK)
end
function LuaS_423635_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue(OwnerID() , EM_RoleValue_Register , 0 )
				SetPlot( OwnerID(),"range","LuaS_423635_1",150)
			break
		end
	end
end

function LuaS_423635_3()
---1.�إX�ҫk�D��J�� LB  104941      ��i�D������ STAR   104942  �d�����D�h��w 104943  ����  104944 �N��D��J�� 104945 ��Z�g�D�N���S 104946   ����J�D��L�S  104947 ��R����   104948  �Ԫk�J���D���J�w 104954
	local LB  = Lua_DW_CreateObj("flag" ,104941 ,780807,1,1 )
	local STAR= Lua_DW_CreateObj("flag" ,104942,780807,2,1 )
	local CS  = Lua_DW_CreateObj("flag" ,104943,780807,3,1 )
	local TONY= Lua_DW_CreateObj("flag" ,104944,780807,4,1 )
	local GILL= Lua_DW_CreateObj("flag" ,104945,780807,5,1 )
	local ENT = Lua_DW_CreateObj("flag" ,104946,780807,6,1 )
	local MORK= Lua_DW_CreateObj("flag" ,104947,780807,7,1 )
	SetPlot( GILL,"touch","",0)
	SetPlot( STAR,"touch","",0)
	SetPlot( CS,"touch","",0)
	SetPlot( MORK,"touch","",0)
	SetPlot( TONY,"touch","",0)
	SetPlot( ENT,"touch","",0)
	SetPlot( LB,"touch","",0)
	MoveToFlagEnabled( LB , false )
	MoveToFlagEnabled( STAR , false )
	MoveToFlagEnabled( CS , false )
	MoveToFlagEnabled( TONY , false )
	MoveToFlagEnabled( GILL , false )
	MoveToFlagEnabled( ENT , false )
	MoveToFlagEnabled( MORK , false )
	SetPlot( GILL , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( TONY , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( STAR , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( MORK , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( LB , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( CS , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( ENT , "dead" , "LuaS_423612_LOVE" , 0 )
---�}����  �b���Y�N�J���Ҧ��H 
	Yell(ENT,"[SC_423635_1]",2)---�ַ�...�A���Ө�o�F�H
	PlayMotion(ENT ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
---�إX����
----	local MON = {}---�Ǫ��}�C

----	for t=1 , 5 , 1 do
----		MON[t]= Lua_DW_CreateObj("flag",104955,780807,9+t,1)
---		SetRoleCamp( MON[t] , "Visitor" )	
---	end
	local player  = {}
	player= SearchRangePlayer(OwnerID(), 300)
	for S=0,table.getn(Player)-1 do
		if (CheckAcceptQuest( player[S] , 423635 ) == true ) and CheckFlag( player[S],544598)==false and GetDistance( player[S] , OwnerID() ) < 250    then
			ScriptMessage(  player[S],  player[S], 0, "[SC_423635_2]", 0 )----����Ԫk�����I�o�ӹC���u�n���I
			ScriptMessage(  player[S],  player[S], 1, "[SC_423635_2]", 0 )----����Ԫk�����I�o�ӹC���u�n���I
		end
	end
	sleep(30)
	----AddtoPartition(LAF, 0 )
	for j=0,table.getn(Player)-1 do
		if (CheckAcceptQuest( player[j] , 423635 ) == true ) and CheckFlag( player[j],544598)==false  and GetDistance( player[j] , OwnerID() ) < 250    then
			ScriptMessage(  player[j],  player[j], 0, "[SC_423635_3]", 0 )----�O���A��R���Ȥj�H�A�����������L�O�߮b���C�����@�����C
			ScriptMessage(  player[j],  player[j], 1, "[SC_423635_3]", 0 )----�O���A��R���Ȥj�H�A�����������L�O�߮b���C�����@�����C
		end
	end
	sleep(30)
	for e=0,table.getn(Player)-1 do
		if (CheckAcceptQuest( player[e] , 423635 ) == true ) and CheckFlag( player[e],544598)==false  and GetDistance( player[e], OwnerID() ) < 250    then
			ScriptMessage(  player[e],  player[e], 0, "[SC_423635_20]", 0 )----��~
			ScriptMessage(  player[e],  player[e], 1, "[SC_423635_20]", 0 )----��~
		end
	end
	sleep(30)
	local ANY = Lua_DW_CreateObj("flag" ,104948,780807,8,1 )
	local LAF = Lua_DW_CreateObj("flag" ,104954,780807,9,1)
	SetRoleCamp( ANY , "Visitor" )
	SetRoleCamp( LAF , "Visitor" )
	BeginPlot( ANY  , "LuaS_423635_ANY" , 0 )
	BeginPlot( LAF  , "LuaS_423635_LAF" , 0 )
	local MON1= Lua_DW_CreateObj("flag",104955,780807,10,1)
	local MON2= Lua_DW_CreateObj("flag",104955,780807,11,1)
	local MON3= Lua_DW_CreateObj("flag",104955,780807,12,1)
	local MON4= Lua_DW_CreateObj("flag",104955,780807,13,1)
	local MON5= Lua_DW_CreateObj("flag",104955,780807,14,1)
	SetRoleCamp( MON1 , "Visitor" ) 
	SetRoleCamp( MON2 , "Visitor" ) 
	SetRoleCamp( MON3 , "Visitor" ) 
	SetRoleCamp( MON4 , "Visitor" ) 
	SetRoleCamp( MON5 , "Visitor" ) 
	Callplot( OwnerID(), "LuaS_423635_99",LB,STAR,CS,TONY,GILL,ENT,MORK,ANY,LAF,MON1,MON2,MON3,MON4,MON5)	
	Yell(ANY,"[SC_423635_21]",2)---�o���������͡A�����b�᪺�C���A�u�n���I�A�ݬݥL�̤@�ӭӪ��M�������I
PlayMotion(ANY , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(40)
	Yell(ANY,"[SC_423635_4]",2)---�o���������͡A�����b�᪺�C���A�u�n���I�A�ݬݥL�̤@�ӭӪ��M�������I
	sleep(50)
	Yell(LAF,"[SC_423635_5]",2)----�ڤ]�S�ƨ��Z�g�p�j�|�o��J���A�o�����h���F��Z�g�p�j�A���˦��Q���b���Ҽ�...
PlayMotion(LAF ,  ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(50)
	Yell(ANY,"[SC_423635_6]",2)	----����������o��b�O�Ӧ���F�I
PlayMotion(ANY , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
----ruFUSION_ACTORSTATE_EMOTE_LAUGH
	sleep(50)
	Yell(ANY,"[SC_423635_7]",2)	
---�Ԫk���� �Ϊ� ��R�Q��  ���ʧ@ ��Ҧ��h�L�ۨ�
----	AddToPartition( MON[T], 0 )
	SetRoleCamp( MON1 , "Monster"  )
	SetRoleCamp( MON2 , "Monster"  )
	SetRoleCamp( MON3 , "Monster"  )
	SetRoleCamp( MON4 , "Monster"  )
	SetRoleCamp( MON5 , "Monster"  )
	SetRoleCamp( ANY  , "Monster"  )
	SetRoleCamp( LAF , "Monster"  )
	BeginPlot(MON1,"LuaS_Discowood_CheckPeace",0) 
	BeginPlot(MON2,"LuaS_Discowood_CheckPeace",0) 
	BeginPlot(MON3,"LuaS_Discowood_CheckPeace",0) 
	BeginPlot(MON4,"LuaS_Discowood_CheckPeace",0) 
	BeginPlot(MON5,"LuaS_Discowood_CheckPeace",0) 
---	BeginPlot(ANY,"LuaS_Discowood_CheckPeace",0) 
---	BeginPlot(LAF,"LuaS_Discowood_CheckPeace",0) 
	SysCastSpellLv(ANY,GILL,495751,1)
	SysCastSpellLv(ANY,STAR,495751,1)
	SysCastSpellLv(ANY,LB,495751,1)
	SysCastSpellLv(ANY,GILL,495751,1)
	SysCastSpellLv(ANY,MORK,495751,1)
	SysCastSpellLv(ANY,TONY,495751,1)
	SysCastSpellLv(ANY,ENT,495751,1)
	SysCastSpellLv(ANY,CS,495751,1)
	SysCastSpellLv(LAF,GILL,495751,1)
	SysCastSpellLv(LAF,STAR,495751,1)
	SysCastSpellLv(LAF,LB,495751,1)
	SysCastSpellLv(LAF,GILL,495751,1)
	SysCastSpellLv(LAF,MORK,495751,1)
	SysCastSpellLv(LAF,TONY,495751,1)
	SysCastSpellLv(LAF,ENT,495751,1)
	SysCastSpellLv(LAF,CS,495751,1)
	SetPlot( ANY , "dead" , "LuaS_423635_ANY_0" , 0 )
---���n���Ԫk������ �A�]�n�ݩԪk�ں�����q�C	
	SetPlot( LAF , "dead" , "LuaS_423635_LAF_0" , 0 )
----LuaS_423612_LOVE
sleep(20)
	SetAttack(MON1,LB)	
	SetAttack(MON2,STAR)	
	SetAttack(MON3,ENT)	
	SetAttack(MON4,TONY)	
	SetAttack(MON5,GILL)	
	SetAttack(LAF,MORK)
	SetAttack(ANY,MORK)
	SetAttack(MORK,ANY)
	SetAttack(CS,LAF)
	SetAttack(LB  ,MON1)	
	SetAttack(STAR,MON2)	
	SetAttack(ENT ,MON3)	
	SetAttack(TONY,MON4)	
	SetAttack(GILL,MON5)		
	for tk=0,table.getn( player  )-1 do
		if(CheckAcceptQuest(  player[tk] , 423635) == true ) and CheckFlag(  player[tk],544598)==false  and GetDistance( player[tk], OwnerID() ) < 250     then
			ScriptMessage(  player[tk],  player  [tk], 1 , "[SC_423635_22]" , 0 ) 
			Tell( player[tk],CS , "[SC_423635_22]")---�ڭ̥����u�@��[104334]�A�P�ɥ�������[104332]�A�o�O�@���w�ԡC
		end
	end
----���R���Ȥp���q20%�ɡA�����s�Ԫk�����@�P�ԤU�Ӥ@�P��	
	local Num = 0	
	local TT=ReadRoleValue(ANY,EM_RoleValue_MaxHP)
	local EE = ReadRoleValue(ANY,EM_RoleValue_HP)
---�Ԫ���q���  �˦�	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	local LL =ReadRoleValue(LAF,EM_RoleValue_MaxHP)
	local FF = ReadRoleValue(LAF,EM_RoleValue_HP)
	local Death = 0
	for i=1, 180, 1 do
		EE = ReadRoleValue(ANY,EM_RoleValue_HP)
		FF = ReadRoleValue(LAF,EM_RoleValue_HP)
		for K=0,table.getn(player)-1 do
			if	CheckAcceptQuest( player[K], 423635 ) == true	and
				CheckFlag( player[K],544598 ) == false	then
				Num = Num + 1
			end
		end
		if	Num == 0  then
			break
		end
		if FF/LL <0.5 and Death == 0 then
			SetDefIdleMotion(LAF,ruFUSION_MIME_DEATH_LOOP)
			WriteRoleValue ( LAF , EM_RoleValue_HP, 10 )
			SetModeEx(LAF , EM_SetModeType_Move,false)
				SetRoleCamp( LAF , "Visitor" )
				AddBuff(LAF , 502707 ,1,-1)
				death = 1
		end	
		if EE/TT <0.7 then
			break
		end
		if 	   i==180 then
			for M=0,table.getn(player)-1 do
				if	CheckAcceptQuest( player[M], 423635 == true	)and
					CheckFlag( player[M], 544598) == false	then
					ScriptMessage(player[M], player[M],  1 , "[SC_423353_6]" , 0 ) --�W�X�ɶ��A�@�����_�C
					ScriptMessage(player[M], player[M], 0 , "[SC_423353_6]" , 0 )
							
				end
			end
			break
		end	
		sleep(10)
	end	
	BeginPlot( ANY ,  "LuaS_423635_ANY_0" , 0)	
	SLEEP(30)
	SetStopAttack( ANY )
	SetStopAttack( LAF )
	SetStopAttack( TONY )
	SetStopAttack( GILL)
	SetStopAttack( MORK)
	SetStopAttack( LB )
	SetStopAttack( STAR )	
	SetStopAttack( ENT )
	SetStopAttack( CS )
	if	CheckID( MON1) == true then
		SetStopAttack( MON1 )
	end
	if	CheckID( MON2) == true then
		SetStopAttack( MON2 )
	end
	if	CheckID( MON3) == true then
		SetStopAttack( MON3 )
	end	
	if	CheckID( MON4) == true then
		SetStopAttack( MON4 )
	end
	if	CheckID( MON5) == true then
		SetStopAttack( MON5 )
	end					
	if FF/LL <0.5 then
	sleep(20)
	---	SetDefIdleMotion(LAF,ruFUSION_MIME_DEATH_LOOP)
	---	WriteRoleValue ( LAF , EM_RoleValue_HP, 10 )
		Yell(ANY,"[SC_423635_9]",2)----����ڶ}�l���ݳ������b�|�F�I
		sleep(30)
		SetRoleCamp( ANY , "Visitor" )
		SetRoleCamp( LAF , "Visitor" )
		SetRoleCamp( TONY , "Visitor" )
		SetRoleCamp( GILL , "Visitor" )
		SetRoleCamp( MORK , "Visitor" )
		SetRoleCamp( LB , "Visitor" )
		SetRoleCamp( STAR , "Visitor" )
		SetRoleCamp( ENT , "Visitor" )
		SetRoleCamp( CS , "Visitor" )
		Yell(ANY,"[SC_423635_10]",2)---�Ԫk�����A�_�ӧa�I�O�b���F�I
--------��R�Q�ȬI��k�N	�i��n�t��S��    496573  495712    496574
		SysCastSpellLV( ANY, LAF,  496573 , 1 )	
		WriteRoleValue ( LAF ,   EM_RoleValue_HP,  LL )
		WriteRoleValue ( ANY ,   EM_RoleValue_HP, TT )
		PlayMotion(LAF,   ruFUSION_ACTORSTATE_KNOCKDOWN_RECOVER )	
SetDefIdleMotion(LAF,  ruFUSION_ACTORSTATE_NORMAL )			
		Yell(LAF,"[SC_423635_11]",2)-----�O���A�ڪ��D�H�I
		sleep(30)
		Yell(ANY,"[SC_423635_12]",2)----���U�ӭn���Ǥ���n�O�H���g�öܡH��~������յۧ��ڧa�H
----	��R���ȬI��k�N
---		CastSpellLV(  ANY ,  ANY , 495712 , 1 )	
---		CastSpellLV( LAF, LAF, 495712 , 1 )	
		CastSpell( ANY ,  ANY , 491276)
		sleep(20)
		for Q=0,table.getn(Player)-1 do
			if (CheckAcceptQuest( player[Q] , 423635 ) == true ) and CheckFlag( player[Q],544598)==true   then
				ScriptMessage(  player[Q],  player[Q], 0, "[SC_423635_19]", 0 )----�ڷ|�b�j�������ݳo���C�����}�l�I
			end
			if (CheckAcceptQuest( player[Q] , 423635 ) == true ) and CheckFlag( player[Q],544598)==false  then
						ScriptMessage(player[Q], player[Q],  1 , "[SC_423612_19]" , 0 ) 
						ScriptMessage( player[Q], player[Q], 0 , "[SC_423612_19]" , 0 )
			end
		end
		local Num = 0
		for MH=1, 1, 1 do
			Num = 0
			for K=0,table.getn(player)-1 do
				if	CheckAcceptQuest( player[K], 423635 ) == true	and CheckFlag( player[K],544598)==true   	then
						Num = Num + 1
				end
			end
			if	Num == 0  then
				DW_CheckThenDel(MON1)
				DW_CheckThenDel(MON2)
				DW_CheckThenDel(MON3)
				DW_CheckThenDel(MON4)
				DW_CheckThenDel(MON5)
				DW_CheckThenDel(LB)
				DW_CheckThenDel(STAR)
				DW_CheckThenDel(CS)
				DW_CheckThenDel(GILL)
				DW_CheckThenDel(MORK)
				DW_CheckThenDel(ANY)
				DW_CheckThenDel(LAF)
				DW_CheckThenDel(TONY)
				DW_CheckThenDel(ENT)			
				delobj( OwnerID())
			end
			sleep(10)
		end
		delobj(ANY)
		delobj(LAF)
		AdjustFaceDir( ENT , TONY, 0 )
		Yell(ENT,"[SC_423635_13]",1)----�����K�ַݡA�T�M�e�i�L��M�I�A�а��U�z���}�B�C
		PlayMotion(ENT ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(30)
		Yell(STAR,"[SC_423635_14]",1)---�P�������A�������U�ӽХ�ѧڨӸѨM�A�o�h�~�Ӫ�����C
		sleep(30)
		YELL(ENT,"[SC_423635_15]",1)---�ַݡA�o���O�ӻ��ܪ��n�a��A���ڭ̥���h�ܪ��񪺼o��Ŧa�a�I
		PlayMotion(ENT ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(40)
		for H=0,table.getn(Player)-1 do
			if (CheckAcceptQuest( player[H] , 423635 ) == true ) and CheckFlag( player[H],544598)==true  then
					Setposbyflag(player[H]  , 780807, 20 ) 	
			end
		end
		DW_CheckThenDel(MON1)
		DW_CheckThenDel(MON2)
		DW_CheckThenDel(MON3)
		DW_CheckThenDel(MON4)
		DW_CheckThenDel(MON5)
		DW_CheckThenDel(LB)
		DW_CheckThenDel(STAR)
		DW_CheckThenDel(CS)
		DW_CheckThenDel(GILL)
		DW_CheckThenDel(MORK)
		DW_CheckThenDel(ANY)
		DW_CheckThenDel(LAF)
		DW_CheckThenDel(TONY)
		DW_CheckThenDel(ENT)			
		delobj(  OwnerID())
	elseif FF/LL >=0.5 then
		WriteRoleValue ( LAF ,   EM_RoleValue_HP,  ReadRoleValue( LAF,EM_RoleValue_MaxHP))
		WriteRoleValue ( ANY ,   EM_RoleValue_MaxHP,ReadRoleValue( ANY,EM_RoleValue_MaxHP) )
		sleep(30)
		Yell(ANY,"[SC_423635_16]",4)----����Ԫk�����A�t�@�����b�t���h�ǳƦn�F�a�H
-------		sleep(30)
		SetRoleCamp( ANY , "Visitor" )
		SetRoleCamp( LAF , "Visitor" )
		SetRoleCamp( TONY , "Visitor" )
		SetRoleCamp( GILL , "Visitor" )
		SetRoleCamp( MORK , "Visitor" )
		SetRoleCamp( LB , "Visitor" )
		SetRoleCamp( STAR , "Visitor" )
		SetRoleCamp( ENT , "Visitor" )
		SetRoleCamp( CS , "Visitor" )
--------��R�Q�ȬI��k�N	�i��n�t��S��
-----		CastSpellLV( ANY, LAF, 495712 , 1 )			
		Yell(LAF,"[SC_423635_17]",4)-----�O���A�D�H�I�w�g�ǳƱo�t���h�F�I
		sleep(30)
		Yell(ANY,"[SC_423635_18]",4)----���㨺�򱵤U�ӧ�g�ê��C���I�A�̤��n���ڥ���I
		sleep(40)		
----	��R���ȬI��k�N
		for Q=0,table.getn(Player)-1 do
			if (CheckAcceptQuest( player[Q] , 423635 ) == true ) and CheckFlag( player[Q],544598)==true   then
				ScriptMessage(  player[Q],  player[Q], 0, "[SC_423635_19]", 0 )----�ڷ|�b�j�������ݳo���C�����}�l�I
			end
			if (CheckAcceptQuest( player[Q] , 423635 ) == true ) and CheckFlag( player[Q],544598)==false  then
						ScriptMessage(player[Q], player[Q],  1 , "[SC_423612_19]" , 0 ) 
						ScriptMessage( player[Q], player[Q], 0 , "[SC_423612_19]" , 0 )
			end

		end
----		CastSpellLV( ANY, ANY, 495712 , 1 )	
----		CastSpellLV( LAF, LAF, 495712 , 1 )	
		CastSpell( ANY ,  ANY , 491276)
		sleep(20)
		local Num = 0
		for MH=1, 1, 1 do
			Num = 0
			for K=0,table.getn(player)-1 do
				if	CheckAcceptQuest( player[K], 423635 ) == true	and CheckFlag( player[K],544598)==true   	then
						Num = Num + 1
				end
			end
			if	Num == 0  then
				DW_CheckThenDel(MON1)
				DW_CheckThenDel(MON2)
				DW_CheckThenDel(MON3)
				DW_CheckThenDel(MON4)
				DW_CheckThenDel(MON5)
				DW_CheckThenDel(LB)
				DW_CheckThenDel(STAR)
				DW_CheckThenDel(CS)
				DW_CheckThenDel(GILL)
				DW_CheckThenDel(MORK)
				DW_CheckThenDel(ANY)
				DW_CheckThenDel(LAF)
				DW_CheckThenDel(TONY)
				DW_CheckThenDel(ENT)			
				delobj( OwnerID())
			end
			sleep(10)
		end
		DW_CheckThenDel(ANY)
		DW_CheckThenDel(LAF)
		AdjustFaceDir( ENT , TONY, 0 )
		Yell(ENT,"[SC_423635_13]",1)----�����K�ַݡA�T�M�e�i�L��M�I�A�а��U�z���}�B�C
		sleep(30)
		Yell(STAR,"[SC_423635_14]",1)---�P�������A�������U�ӽХ�ѧڨӸѨM�A�o�h�~�Ӫ�����C
		sleep(30)
		YELL(ENT,"[SC_423635_15]",1)---�ַݡA�o���O�ӻ��ܪ��n�a��A���ڭ̥���h�ܪ��񪺼o��Ŧa�a�I
		sleep(30)
		for H=0,table.getn(Player)-1 do
			if (CheckAcceptQuest( player[H] , 423635 ) == true ) and CheckFlag( player[H],544598)==true  then					
				Setposbyflag(player[H]  , 780807, 20 ) 

			end
		end
		DW_CheckThenDel(MON1)
		DW_CheckThenDel(MON2)
		DW_CheckThenDel(MON3)
		DW_CheckThenDel(MON4)
		DW_CheckThenDel(MON5)
		DW_CheckThenDel(LB)
		DW_CheckThenDel(STAR)
		DW_CheckThenDel(CS)
		DW_CheckThenDel(GILL)
		DW_CheckThenDel(MORK)
		DW_CheckThenDel(ANY)
		DW_CheckThenDel(LAF)
		DW_CheckThenDel(TONY)
		DW_CheckThenDel(ENT)			
		delobj(  OwnerID())
	end
end				
function LuaS_423635_ANY()
	DW_MoveToFlag( OwnerID(),780807,15,1)
---	AdjustDir(OwnerID() ,270)
end
function LuaS_423635_LAF()
	DW_MoveToFlag( OwnerID(),780807, 16,1)
---	AdjustDir(OwnerID() ,270)
end

function LuaS_423635_ANY_0()
	local TempID
	local LL =ReadRoleValue(OwnerID(), EM_RoleValue_MaxHP)
	local FF = ReadRoleValue(OwnerID(), EM_RoleValue_HP)
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID )----
		if	CheckAcceptQuest( TempID , 423635)==true  	then
			SetFlag(TempID  ,544598, 1 )
		end
	end
	WriteRoleValue(OwnerID(), FF, LL)
	return false
end
function LuaS_423635_LAF_0()
	local LL =ReadRoleValue(OwnerID(), EM_RoleValue_MaxHP)
	local FF = ReadRoleValue(OwnerID(), EM_RoleValue_HP)
	WriteRoleValue(OwnerID(), FF, LL)
	return false
end

function LuaS_423635_99(LB , STAR , CS , TONY , GILL , ENT , MORK , ANY , LAF , MON1 , MON2 , MON3 , MON4 , MON5 )
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 400)
	for i=1, 180, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423635 ) == true	and GetDistance( Group[K] , OwnerID() ) < 300  	then
					Num = Num + 1
			end
		end
		if	Num == 0  then
			DW_CheckThenDel(MON1)
			DW_CheckThenDel(MON2)
			DW_CheckThenDel(MON3)
			DW_CheckThenDel(MON4)
			DW_CheckThenDel(MON5)
			DW_CheckThenDel(LB)
			DW_CheckThenDel(STAR)
			DW_CheckThenDel(CS)
			DW_CheckThenDel(GILL)
			DW_CheckThenDel(MORK)
			DW_CheckThenDel(ANY)
			DW_CheckThenDel(LAF)
			DW_CheckThenDel(TONY)
			DW_CheckThenDel(ENT)			
			delobj( OwnerID())
		end
	sleep(10)
	end
end


function LuaS_423635_22()
		SetPlot( OwnerID(),"range","LuaS_423635_33",100)
end

function LuaS_423635_33()

	if	CheckAcceptQuest(OwnerID(),423635)==true  and CheckFlag( OwnerID(),544598)==true  and     CheckBuff( OwnerID(), 508049)==false  then
		ScriptMessage(OwnerID(),  OwnerID(),   1 , "[SC_423635_23]" , 0 ) --�W�X�ɶ��A�@�����_�C
		ScriptMessage(OwnerID(),  OwnerID(),  0,   "[SC_423635_23]" , 0 )
		AddBuff(OwnerID(), 508049,1,15)		
	end
end
