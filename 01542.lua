
------�Ŵ����y
function LuaS_113459()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422700 ) == true and CheckFlag(OwnerID(),543299) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_1]","LuaS_113459_1",0) --�ڭ̬O�ӹ��A�@�Y���s�~......
	end
	if CheckAcceptQuest( OwnerID() ,422701 ) == false and CheckAcceptQuest( OwnerID() ,422704 ) == false and  CheckFlag(OwnerID(),543327) == true and CheckFlag(OwnerID(),543302) == false  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_9]","LuaS_113459_3",0) --�ڤϮ��F�I�Q�󴫹��A���s�~���覡......
	end

end

function LuaS_113459_1()

	SetSpeakDetail(OwnerID(),"[SC_422700_2]") --���A�@�Y���s�~�I�ڦ��S��ť���H�o�i�~�F�ڦn�j�@���I......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_3]","LuaS_113459_2",0) --�p�G�i�H�M�ۨe�V�L�D�H���x��ĵ�ٴN�A�n���L�F!
end

function LuaS_113459_2()

	SetSpeakDetail(OwnerID(),"[SC_422700_4]") --�o�O���F�Х��D�H�A�Ҷi�檺�p�e�O�a�H��......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_5]","LuaS_113459_3",0) --�ڭ̸Ӧp��}�l�H
end

function LuaS_113459_3()

	SetSpeakDetail(OwnerID(),"[SC_422700_6]") --�����A�ڥ������D�A�A�Q��ܦ�ؤ覡���A�o�Ƿ��s�~�H
	SetFlag(OwnerID() , 543301 , 0 )
	SetFlag(OwnerID() , 543300 , 0 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_7]","LuaS_113459_4",0) --�ڷQ�M���a�P���s�~�إߥ�����Y
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_8]","LuaS_113459_5",0) --�ڷQ�i�{�O�q�A�����s�~�ڪA���
end

function LuaS_113459_4()

	SetFlag(OwnerID() , 543327 , 1 )
	SetFlag(OwnerID() , 543299 , 1 )
	SetFlag(OwnerID() , 543301 , 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_113459_5()

	SetFlag(OwnerID() , 543327 , 1 )
	SetFlag(OwnerID() , 543299 , 1 )
	SetFlag(OwnerID() , 543300 , 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_113459_Check()

	SetFlag(TargetID() , 543302 , 1 )
end



--------�������s�~
function LuaM_422701_Check()
	if CheckAcceptQuest( OwnerID() , 422701 ) == false or CountBodyItem(OwnerID() , 205906) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102533 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , 0 ) --�o���O�A�n�a�^�h����H
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_1]" , 0 ) --[102533]�w�g���F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID()  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_2]" , 0 ) --�A��������[102533]�`�N��A�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_2]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) >  ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/2  then
		SetAttack( TargetID() , OwnerID() )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_3]" , 0 ) --[102232]�x�j����ܵ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_3]" , 0 ) 
		return false
	end
	return true
end

function LuaM_422701_Effect()
	BeginPlot( TargetID() , "LuaM_422701_Reset" , 0 )
	GiveBodyItem( OwnerID() , 205906 , 1 )
--	UseItemDestroy()
	BeginPlot( OwnerID() , "LuaM_422701_Del" , 0 )
end

function LuaM_422701_Reset()
	LuaFunc_ResetObj( OwnerID() ) 
end

function LuaM_422701_Del()
	sleep(10)
	DelBodyItem ( OwnerID(),205913 , 1 )
end

---�X�l�G780436
function LuaS_422701_Check() --�����s���ȧ�����t�@��
	SetFlag(TargetID() , 543302 , 1 )

	local NPC = CreateObjByFlag( 113509 , 780436 , 1 , 0 )  --�Q���������s
	AddToPartition( NPC , 0 )

	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422701_4]" , 0 ) --[113509]�o�X�F�@�n�y�U���s�n�I
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422701_4]" , 0 ) 

	sleep(30)

	local NPC1 = CreateObjByFlag( 102534 , 780436 , 2 , 0 )  --�۷��s
	AddToPartition( NPC1 , 0 )
	local NPC2 = CreateObjByFlag( 102534 , 780436 , 3 , 0 )  --�۷��s
	AddToPartition( NPC2 , 0 )
	SetAttack( NPC1 , TargetID() )
	SetAttack( NPC2 , TargetID() )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422701_5]" , 0 ) --�۷��sť��s�n�A�Q�I��L�ӡI
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422701_5]" , 0 ) 
	sleep(30)
	CastSpell( OwnerID() , NPC1 , 492224 )
	Say( OwnerID() , "[SC_422138_8]" ) --���}�I�֨��}�I
	sleep(30)
	CastSpell( OwnerID() , NPC2 , 492224 )	
	sleep(30)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422701_6]" , 0 ) --�����s�Q�Ϩ��F......
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422701_6]" , 0 ) 
	Delobj( NPC )
	Delobj( NPC1)
	Delobj( NPC2)
	Say( OwnerID() , "[SC_422701_7]" )--�I��u�O�ӥi�ȤF�I
end

------�ɫ���s�~���`�@��
function LuaS_422702() 
	local PlayerNum = HateListCount( OwnerID() ) -1
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CountBodyItem( PPL , 205925 ) == 0  and CheckAcceptQuest( PPL , 422702 ) == true and CheckFlag(OwnerID(),543327) == false and GetDistance( OwnerID() , PPL ) < 300 then
			ScriptMessage( PPL , PPL , 0 , "[SC_422702]" , 0 ) --�A�N�@�Y[205925]��i�ۤv���I�]�̡I
			ScriptMessage( PPL , PPL, 1 , "[SC_422702]" , 0 ) --0�O���U��ܮءA1�|��԰��T�����d�A2�|�M���ȧ����T�����d
			GiveBodyItem( PPL , 205925  , 1 )
		end
	end 
	return true
end

-----��^���s�~�����`�@��

function LuaS_102536() 
	local PlayerNum = HateListCount( OwnerID() ) -1
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( PPL , 422703) == true and GetDistance( OwnerID() , PPL ) < 300 then
			ScriptMessage( PPL , PPL , 0 , "[SC_102536]" , 0 ) --���s�~�][102536]�Q���ѦӷP�켫��I
			ScriptMessage( PPL , PPL, 2 , "[SC_102536]" , 0 )
		end
	end
	
	--�s�X���s�~
	for i =1, 3, 1 do
		local j = CreateObjByFlag( 102535 , 780438 , i , 0 )  
--		WriteRoleValue( j  , EM_RoleValue_LiveTime , 120 ) --�ɶ��H��p
		CallPlot( j , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( j , 0 )
	end
 
	return true
end




---��m����
function LuaS_422702_check() --���~�ˬd

	if	CheckBuff(OwnerID(),503980)	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422702_1]", 0 ) --�A�w��m�F�@�Y[205925]�I
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422702_1]", 0 )
		return false
	end

	if	HateListCount(OwnerID()) > 0	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112093_0]", 0 ) --�A����b�԰����ϥ�
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 )
		return false
	end

	if	Lua_ObjAreaCheck(OwnerID() , 732 ) ==false then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422702_3]", 0 ) --�A�u���m�b[ZONE_TOWER OF RAGE]�I
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422702_3]", 0 )
		return false
	end
	return true
end

function LuaS_422702_1() --�ϥΪ��~

	local obj = LuaFunc_CreateObjByObj ( 113485 , OwnerID() )
	SetDefIdleMotion(obj,ruFUSION_MIME_DEATH_LOOP)
	AddToPartition( obj , 0 )
	AddBuff(OwnerID(),503980,1,-1)
	WriteRoleValue(obj,EM_RoleValue_PID,OwnerID())
	BeginPlot(obj,"LuaS_422702_2",0)--�ͦs
	BeginPlot(obj,"LuaS_422702_3",0)--�@����t
end

function LuaS_422702_2() 
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(10)
		if	not CheckID(Master)	then
			DelObj(OwnerID())
		end
		if	ReadRoleValue(Master,EM_RoleValue_IsDead) == 1	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
		if	not	CheckDistance( OwnerID(), Master , 300 )	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
	end
end

function LuaS_422702_3() -- �j�M�ީǪ�����
	local NPC,Tar
	local Monster = 102534
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(20)
		NPC = SearchRangeNPC (OwnerID(),150)
		for i=0,table.getn(NPC)	do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Monster and ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode) == 0 and ReadRoleValue( NPC[i] , EM_RoleValue_IsDead ) == 0  then
				Tar = NPC[i]		
				AddBuff(Tar,504728,1,-1)
				ScriptMessage( Master, Master, 0, "[SC_422702_2]", 0 ) --�۷��s�]���A���|�ʷP�켫��I
				ScriptMessage( Master, Master, 1, "[SC_422702_2]", 0 )
				SetAttack( Tar , Master )
				SetFlag(Master , 543304 , 1 )
				CancelBuff(Master,503980)
				BeginPlot(OWNERid(),"LuaS_422702_4",0)
				return
			end
		end
	end
end

function LuaS_422702_4() -- �j�M�ީǪ�����
	sleep(5)
	DelObj(OwnerID())
end

----���Ѻ�^���s

function LuaS_422703() 
	SetFlag(TargetID() , 543303 , 1 )
end
















