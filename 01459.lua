------------------- 113203 �i�ơE�R�w���[ ��ܼ@�� -----------------------------
function LuaS_113203_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422493 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422493_0]" ,"LuaS_422493_1", 0 ) --�A�ݰ_�ӬO�@�W��̤������k�v�K
	end
	if CheckAcceptQuest( OwnerID() , 422492 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422492_0]" ,"LuaS_422492_1", 0 ) --�W�Y�ټg�Ǥ���ܡH
	end
	if CheckAcceptQuest( OwnerID() , 422497 ) == true and CheckFlag( OwnerID() , 542881 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422497_0]" ,"LuaS_422497_1", 0 ) --�ڷǳƦn�F�I�}�l�i�����a�C
	end
end

----------------------- 422493 �γ\���Өӳo�� ---------------------------------------
function LuaS_422493_1()
	SetSpeakDetail( OwnerID(),  "[SC_422493_1]" ) --�O���A�ڪ��W�r�s��[113203]�A�ѩ�Y�ǭ�]�A�e�Ǥ�l�H�۽�̤����P���`�M�h�ΨӨ�[ZONE_SAVAGE LANDS]�A�a�ϭ쥻���u�@�w�g���ڭ̦��o�J�Y���B�A���o�@�����o���רK��q���޲��a���A�٬O�l�޵ۧڡA���ڤ��o����U���䪺�u�@�Ө�o�̤@���s���C
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422493_2]" ,"LuaS_422493_2", 0 ) --�o�Ӧa���ݰ_�ӽT��ܩ_�ǡK

end

function LuaS_422493_2()
	SetSpeakDetail( OwnerID(),  "[SC_422493_3]" ) --�L�ݰ_�ӬO�Ѥ@�ѫD�۵M�����j�O�q�ҳy���A����Ѫ��O�A�b½�M�Ҧ��j�N�ݦs������A���o�Ӧa���A�u���O���ۥL���W�r�u[ZONE_DEMONSCAR]�v�A��ƬO�p���}�֡A�H�P��ڭ̥u��j�x�q���A�o�Ӧa�����Φ��A�γ\�P[ZONE_THE GREAT BARRIER]�������s�C
	if CheckAcceptQuest( OwnerID() , 422493 ) == true then
		SetFlag( OwnerID() , 542880 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422493_4]" ,"LuaS_113203_0", 0 ) --�oť�_�Ӭ۷��N��A���§A�i�D�ڳo�ǡC
end

---------------------- 422497 ���H�m�H������ -----------------------------------------------
--�M�κX�l 780382 �]�n�ء^
-- 1�G�i�ơE�R�w���[�n���ʨ쪺�a��
-- 2�A3 �A4�G�Ĥ@�i�Ǫ��X�{�I
-- 5�G�ĤG�i�Ǫ��X�{�I

function LuaS_422497_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_422497_2" , 0 )
end

function LuaS_422497_2()
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	sleep( 10 )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )

	local Me = Role:new( OwnerID() )
	local Pos ={ ["X"] = Me:X() , ["Y"] = Me:Y() , ["Z"] = Me:Z() , ["Dir"] = Me:Dir()}
	local MonsterID = {102248 , 102250 , 102252 }
	local  CheckState= "Done"

	DW_MoveToFlag( OwnerID() , 780382 , 1 , 0 )
	local EnergyBall = Lua_CreateObjByDir( OwnerID() , 113204 , 20 , 0)
	Lua_ObjDontTouch( EnergyBall ) 
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_422497_1]" , 3 )--�ڱN�o���R���a�����઺��q�y��m�b�o�̡A�J���[��U�ӵo�ͪ��{�H�K
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	AdjustFaceDir( OwnerID(), EnergyBall , 0 )
	sleep( 5)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 10 )
	AddToPartition( EnergyBall , 0 )
	sleep( 10 )
	AddBuff( OwnerID() , 501094 , 1 , 90000)
	AddBuff( EnergyBall , 500900 , 1 , 90000 )

	local FirstWave = {}
	for i = 1 , 3 , 1 do
		FirstWave[i] = CreateObjByFlag( MonsterID[DW_Rand(3)] , 780382 , i+1 , 1 )
		SetRoleCamp( FirstWave[i] , "Visitor" )
		AddToPartition( FirstWave[i] , 0 )
		MoveToFlagEnabled( FirstWave[i] , false )
		WriteRoleValue( FirstWave[i] , EM_RoleValue_IsWalk ,  1 )
		WriteRoleValue( FirstWave[i] , EM_RoleValue_Register ,  EnergyBall )
		WriteRoleValue( FirstWave[i] , EM_RoleValue_PID , TargetID() )
		BeginPlot( FirstWave[i] ,"LuaS_422497_3" , 0 )
	end
	
	sleep( 30 )

	Yell( OwnerID() , "[SC_422497_2]" , 3 )--�@�A�o�ǥͪ��Q��q�l�ަӨӡK
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)

	for i = 1 , 60 , 1 do

		for j = 1 , 3 , 1 do
			FirstWave[j] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + j )
		end

		if FirstWave[1] ~= 0 and FirstWave[2] ~= 0 and FirstWave[3] ~= 0 then
			break
		end

		sleep( 10 )
	end

	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 0 )
	sleep( 30 )	

	while 1 do
		local Check = "STOP"

		for i = 1 , 3 , 1 do
			if CheckID( FirstWave[i] ) == true and ReadRoleValue( FirstWave[i] , EM_RoleValue_IsDead ) == 0 then
				Check = "DO"
				break
			end
		end
		
		if Check == "STOP" then
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) < 3 then
				CheckState= "Reset"
			end
			break
		end
		sleep( 10 )
		if CheckID( TargetID() ) == true then
			AdjustFaceDir( OwnerID(), TargetID(), 0 )
		end
	end

	if CheckState== "Reset" then
		LuaS_422497_Reset( Pos , EnergyBall )
		return
	end

	local LastWave = CreateObjByFlag( MonsterID[DW_Rand(3)] , 780382 , 5 , 1 )
	SetRoleCamp( LastWave, "Visitor" )
	AddToPartition( LastWave, 0 )
	MoveToFlagEnabled( LastWave , false )
	WriteRoleValue( LastWave , EM_RoleValue_IsWalk ,  1 )
	local Ball_Role = Role:new(EnergyBall)
	Move( LastWave , Ball_Role:X() , Ball_Role:Y() , Ball_Role:Z() ) 
	sleep( 30 )
	AdjustFaceDir( OwnerID(), LastWave , 0 )
	sleep(5)
	Yell( OwnerID() , "[SC_422497_6]" , 3 )--�����I�S���ͪ��Q�l�ޤF�K
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	SetModeEX( LastWave, EM_SetModeType_Move , false )
	Hide( LastWave )
	Show(LastWave, 0)
	CancelBuff_NoEvent( EnergyBall , 500900 )
	CastSpell( LastWave, LastWave, 491921 )
	sleep( 20 )
	local LastMonster = LuaFunc_CreateObjByObj( 102323 , LastWave )
	Delobj(  LastWave )
	WriteRoleValue( LastMonster  , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue( LastMonster  , EM_RoleValue_Register ,EnergyBall)
	SetPlot( LastMonster , "dead" , "LuaS_422497_Dead_B" , 0 )
	BeginPlot( LastMonster  , "LuaS_422497_Suicide" , 0 )
	SetAttack( LastMonster  , TargetID() )

	while 1 do		
		if CheckID( LastMonster ) == false or ReadRoleValue(LastMonster , EM_RoleValue_IsDead ) == 1  then
			if ReadRoleValue(OwnerID() , EM_RoleValue_PID ) < 999 then
				CheckState= "Reset"
			end
			break
		end
		sleep( 10 )
		AdjustFaceDir( OwnerID(), TargetID(), 0 )
	end

	if CheckState== "Reset" then
		LuaS_422497_Reset( Pos , EnergyBall )
		return
	end
	AdjustFaceDir( OwnerID(), EnergyBall , 0 )
	sleep( 5 )
	Yell( OwnerID() , "[SC_422497_8]" , 3 )--����w�g���F......���ڭ̵����a�I
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 10 )
	CancelBuff_NoEvent( OwnerID() , 501094  )
	Delobj( EnergyBall )

	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if CheckAcceptQuest( Party[i] , 422497 ) == true and GetDistance( Party[i] , OwnerID()) < 300 then
			SetFlag( Party[i] , 542881 , 1 )
		end
	end

	WriteRoleValue( OwnerID() , EM_Rolevalue_IsWalk  , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +1 , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +2 , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +3 , 0 )

	DW_WaitMoveTo( OwnerID()  , Pos["X"]  ,Pos["Y"]  , Pos["Z"]  )
	sleep(10)
	SetDir( OwnerID() , Pos["Dir"]   )
	sleep(10)
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() , false )
end

function LuaS_422497_Reset( table , Obj )
	if CheckID( Obj  ) == true then
		DelObj( Obj )
	end

	Yell( OwnerID() , "[SC_422497_7]" , 3 ) --�V�|......�ڳ̦n�����}�o�̡I[202903]�����ٰ��a......
	CancelBuff_NoEvent( OwnerID() , 501094  )
	sleep( 10 )
	CastSpell( OwnerID() , OwnerID() ,491922 )
	sleep( 30)

	Hide( OwnerID() )
	sleep( 150 )
	Show( OwnerID() , 0 )
	SetPos( OwnerID() ,  table["X"]  , table["Y"]  , table["Z"]  , table["Dir"] )

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +1 , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +2 , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +3 , 0 )
	
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() , false )
end

function LuaS_422497_3()
	local Ball =ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Ball_Role = Role:new( Ball )
	Move( OwnerID(), Ball_Role:X() , Ball_Role:Y() , Ball_Role:Z() ) 
	sleep( 30 )
	for i = 1 , 10  , 1 do
		if GetDistance( OwnerID() , Ball ) < 50 then
			break
		end
		sleep( 10 )
	end
	SetModeEX( OwnerID(), EM_SetModeType_Move , false )
	Hide( OwnerID() )
	Show(OwnerID(), 0)
	CancelBuff_NoEvent( Ball , 500900 )
	CastSpell( OwnerID() ,  OwnerID() , 491921 )
	sleep( 20 )
	local Monster = LuaFunc_CreateObjByObj( 102273 , OwnerID() )
	WriteRoleValue( Monster , EM_RoleValue_PID , TargetID() )
	WriteRoleValue( Monster , EM_RoleValue_Register , Ball  )
	SetPlot( Monster , "dead" , "LuaS_422497_Dead_A" , 0 )
	BeginPlot( Monster , "LuaS_422497_Suicide" , 0 )
	SetAttack( Monster , Player )
	Hide( OwnerID() )

	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register  , 1 )
		AdjustFaceDir(  TargetID() ,OwnerID(), 0 )
		sleep( 10 )
		Yell( TargetID() , "[SC_422497_3]" , 3 )--��ߡI�ͪ��l����q��A�ܱo�ƨg�F�I
		PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_Register +1 ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register +1 , Monster )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register +2 ) == 0  then
		WriteRoleValue( TargetID() , EM_RoleValue_Register +2 , Monster )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register +3 ) == 0  then
		WriteRoleValue( TargetID() , EM_RoleValue_Register +3 , Monster )
	end

	Delobj( OwnerID() )
end

function LuaS_422497_Suicide()
	LuaFunc_Obj_Suicide(100)
end

function LuaS_422497_Dead_A()
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local EnergyBall = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( EnergyBall , EM_RoleValue_OrgID ) == 113204 then
		ScriptMessage( OwnerID() , 0 , 1 , "[SC_422497_4]" , 0 ) --��q�y�]���l�����񪺦�G�A��q�ܱo��[�רK
		ScriptMessage( OwnerID()  , 0 , 0 , "[SC_422497_4]" , 0 )
		AddBuff( EnergyBall , 500900 , 1 , 90000 )
	end
	if ReadRoleValue( NPC , EM_RoleValue_OrgID  ) == 113203 then
		local Check = ReadRoleValue( NPC , EM_RoleValue_PID) +1
		WriteRoleValue( NPC , EM_RoleValue_PID , Check )
		if ReadRoleValue(NPC, EM_RoleValue_Register ) == 0 then
			Yell( NPC , "[SC_422497_5]" , 3 )--�o�ǲ���A�b�l����G����A�S��_��쥻���רK���A......
			PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
			WriteRoleValue( NPC , EM_RoleValue_Register  , 1 )
		end
	end
	return true
end

function LuaS_422497_Dead_B()
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local EnergyBall = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( NPC , EM_RoleValue_OrgID  ) == 113203 then
		WriteRoleValue( NPC , EM_RoleValue_PID , 999 )
	end
	if ReadRoleValue( EnergyBall , EM_RoleValue_OrgID ) == 113204 then
		ScriptMessage( OwnerID() , 0 , 1 , "[SC_422497_4]" , 0 ) --��q�y�]���l�����񪺦�G�A��q�ܱo��[�רK
		ScriptMessage( OwnerID()  , 0 , 0 , "[SC_422497_4]" , 0 )
		AddBuff( EnergyBall , 500900 , 1 , 90000 )
	end
	return true
end

---------------------- 422490 �����۪O ----------------------------------------
function LuaI_422490_Dead() --��b 102316 102317 �H�� 102318 �����`�@���̭�
	local PlayerNum = HateListCount( OwnerID() ) -1
	local Stone = {[102316] = 205393 ,[102317] = 205394 , [102318] = 205395 }
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CountBodyItem( PPL , Stone[OrgID] ) == 0 and CountBodyItem( PPL , 205396 ) == 0 and CheckCompleteQuest( PPL , 422490 ) == false and GetDistance( OwnerID() , PPL ) < 300 then
			ScriptMessage( PPL , PPL , 0 , "[SC_422490_0]" , 0 ) --�A�b����U��o�{�F�@���۪�
			ScriptMessage( PPL , PPL, 2 , "[SC_422490_0]" , 0 )
			GiveBodyItem( PPL , Stone[OrgID]  , 1 )
		end
	end 
	return true
end

function LuaI_205396_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail(422490, 1 ) )
	ShowBorder( OwnerID(), 422490,str , "ScriptBorder_Texture_Paper" )	
end

function LuaI_422490_0()
	BeginPlot( OwnerID() , "LuaI_422490_1" , 0 )
end

function LuaI_422490_1()
	if CountBodyItem( OwnerID() , 205393 ) > 0 and CountBodyItem( OwnerID() , 205394 ) > 0  and CountBodyItem( OwnerID() , 205395 ) > 0  then
		sleep(1)
		DelBodyItem( OwnerID() , 205393 , 1)
		DelBodyItem( OwnerID() , 205394 , 1)
		DelBodyItem( OwnerID() , 205395 , 1)
		sleep(1)
		ScriptMessage(  OwnerID()  ,  OwnerID()  , 0 , "[SC_422490_1]" , 0 ) --�A�N�T���۪����F�_��
		ScriptMessage(  OwnerID()  ,  OwnerID() , 2 , "[SC_422490_1]" , 0 )
		GiveBodyItem( OwnerID() , 205396 , 1)
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422490_2]" , 0 ) --�o�ӥ۪��ݰ_�Ӧ��G�Ӧ۩�Y�ӧ�j���۪�
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422490_2]" , 0 )
	end
end
---------------------- 422492 �m���̯u�����B�� -----------------------------
function LuaS_422492_1()
	SetSpeakDetail( OwnerID(),  "[SC_422492_1]" ) --�O���A�o�W�Y�ټg��²�u���@�y�ܡu�ڪ����͡A�w�w�Ĵ��A���v�󦹡C�v
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422492_2]" ,"LuaS_422492_2", 0 ) --�w�w�Ĵ��H�I
end

function LuaS_422492_2()
	SetSpeakDetail( OwnerID(),  "[SC_422492_3]" ) --�A���D�w�w�Ĵ��H�n�O�ڨS�O�����ܡA�w�w�Ĵ��i�O����ۥd�ĩi�ϧ��]�ڪ��@�W�j�N�A�]�O�L�̿˱K���B�͡C���L�A�p�G�o�Ӧa���u�p�۪O�һ��A�O�w�w�Ĵ��������B�A���|�֦��p�����j����q�H���o�̨쩳�o�͹L����ơK�K
	if CheckAcceptQuest( OwnerID() , 422492 ) == true then
		SetFlag( OwnerID() , 542882 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422492_4]" ,"LuaS_113203_0", 0 ) --��ӥ۪��W�g�F�o�ǡA���§A�i�D�ڡC
end

----------�ݦL�n�d
function LuaI_113233() 

	if CountBodyItem( OwnerID(), 205554 )>0  then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_113233]" , C_SYSTEM ) -- �A�ʤ֩ݦL�n�d�I
		return false
	end
end

function LuaI_113233_1() 

	DelBodyItem( OwnerID(), 205554 , 1 )
	return true
end









