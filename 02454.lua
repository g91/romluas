function LuaS_dr424509_start()						--424509�R�ݤH�����
	local Tar=TargetID()	--player
	--say(Tar,"i am target")
	--say(OwnerID(),"i am owner")
	AddBuff(Tar,620662,0,-1)
	local horn=Lua_DW_CreateObj( "flag" , 119017 , 780996 , 0 , 1 , 1 )
	local bow=Lua_DW_CreateObj( "flag" , 119020 , 780996 , 1 , 1 , 1 )
	local king=Lua_DW_CreateObj( "flag" , 119021 , 780996 , 2 , 1 , 1 )
	DW_MoveDirectToFlag( king , 780996 , 3 , 1  )
	local shied=Lua_DW_CreateObj( "flag" , 119016 , 780996 , 4 , 1 , 1 )
	DW_MoveDirectToFlag( shied , 780996 , 5 , 1  )
	PlayMotion(king,112)
	Say(king,"[SC_424509_0]")
	sleep(30)
	PlayMotion(horn,112)
	Say(horn,"[SC_424509_1]")
	sleep(40)
	PlayMotion(horn,112)
	Say(horn,"[SC_424509_2]")
	sleep(40)
	PlayMotion(king,112)
	Say(king,"[SC_424509_3]")
	sleep(30)
	PlayMotion(bow,112)
	Say(bow,"[SC_424509_4]")
	Sleep(10)
	DelObj(king)
	DelObj(shied)
	DelObj(horn)
	DelObj(bow)
	CancelBuff(Tar, 620662)
end

function LuaS_dr424510_end()						--424510�s���M��
	local Tar=TargetID()	--player
	AddBuff(Tar,620668,0,-1)
	local horn=Lua_DW_CreateObj( "flag" , 119115 , 780997 , 0 , 1 , 1 )
	local bow=Lua_DW_CreateObj( "flag" , 119116 , 780997 , 1 , 1 , 1 )
	local king=Lua_DW_CreateObj( "flag" , 119113 , 780997 , 2 , 1 , 1 )
	local shied=Lua_DW_CreateObj( "flag" , 119114 , 780997 , 3 , 1 , 1 )
	local dog=Lua_DW_CreateObj( "flag" , 119119 , 780997 , 4 , 1 , 1 )
	local cat=Lua_DW_CreateObj( "flag" , 119118 , 780997 , 5 , 1 , 1 )
	PlayMotion(king,112)
	Say(king,"[SC_424510_0]")
	sleep(20)
	PlayMotion(cat,112)
	Say(cat,"[SC_424510_1]")
	sleep(10)
	PlayMotion(dog,112)
	Say(dog,"[SC_424510_2]")
	sleep(10)
	DW_MoveDirectToFlag( cat , 780997 , 7 , 1  )
	DW_MoveDirectToFlag( dog , 780997 , 6 , 1  )
	Sleep(20)
	DelObj(cat)
	DelObj(dog)
	PlayMotion(king,112)
	Say(king,"[SC_424510_3]")
	sleep(20)
	PlayMotion(bow,112)
	Say(bow,"[SC_424510_4]")
	Sleep(20)
	PlayMotion(king,112)
	Say(king,"[SC_424510_5]")
	sleep(10)
	PlayMotion(shied,112)
	Say(shied,"[SC_424510_6]")
	sleep(20)
	PlayMotion(king,101)
	Say(king,"[SC_424510_7]")
	sleep(20)
	DW_MoveDirectToFlag( king , 780997 , 8 , 1  )
	DW_MoveDirectToFlag( horn , 780997 , 9 , 1  )
	DW_MoveDirectToFlag( shied , 780997 , 10 , 1  )
	Sleep(20)
	DelObj(king)
	DelObj(shied)
	DelObj(horn)
	DelObj(bow)
	CancelBuff(Tar, 620668)
end

function LuaS_dr424511_start()						--424511�i�}�լd
	local Tar=TargetID()	--player
	--say(Tar,"i am target")
	--say(OwnerID(),"i am OWN")
	AddBuff(Tar,620669,0,-1)
	local bow=Lua_DW_CreateObj( "flag" , 119025 , 780999 , 0 , 1 , 1 )
	DW_MoveDirectToFlag( bow , 780999 , 1 , 1  )
	Say(bow,"[SC_423705_01]")
	Sleep(20)
	DelObj(bow)
	callplot(tar,"Lua_Zone21_Assassinate_Plot",tar,15)
	CancelBuff(Tar, 620669)
end

function LuaS_dr424512_start()						--424512�ĺ��h���K��
	local Tar=TargetID()	--player
	AddBuff(Tar,620671,0,-1)
	local mor=Lua_DW_CreateObj( "flag" , 119042 , 780999 , 2 , 1 , 1 )
	local ji=Lua_DW_CreateObj( "flag" , 119028 , 780999 , 3 , 1 , 1 )
	local ro=Lua_DW_CreateObj( "flag" , 119029 , 780999 , 4 , 1 , 1 )
	DW_MoveDirectToFlag( mor ,780999 , 5 , 1  )
	DW_MoveDirectToFlag(ji , 780999, 6 , 1  )
	DW_MoveDirectToFlag(ro , 780999 , 7 , 1  )
	PlayMotion(mor,112)
	Say(mor,"[SC_424512_0]")
	sleep(20)
	PlayMotion(ro,112)
	Say(ro,"[SC_424512_1]")
	sleep(20)
	PlayMotion(ro,112)
	Say(ji,"[SC_424512_2]")
	Sleep(20)
	DelObj(mor)
	DelObj(ji)
	DelObj(ro)
	CancelBuff(Tar, 620671)
end

function LuaQ_424512_End()							--424512���ȧ�����H�����K�y&��t
	local own=OwnerID()	--player
	local Tar=TargetID()	--npc
	Tell(Tar,own,"[SC_424512_3]")
	AddBuff(Tar,620662,0,-1)
	Sleep(10)
	local woman=Lua_DW_CreateObj( "flag" , 118972 , 780999 , 8 , 1 , 1 )
	DW_MoveDirectToFlag( woman ,780999 , 9 , 1  )
	Sleep(20)
	Say(woman,"[SC_424512_4]")					 --��...�o�ǤH�O�A���P��ܡH��...����...�i�H�·ЧA��ڮa�ܡH���|�����z�Ӧh�ɶ�...
	PlayMotion(woman,112)
	Sleep(40)
	Sleep(10)
	DW_MoveDirectToFlag( woman ,780999 , 10 , 1  )
	Sleep(20)
	DelObj(woman)
	CancelBuff(Tar, 620662)
end

function LuaS_dr424516_end()						--424516�y�������x
	local Tar=TargetID()	--player
	AddBuff(Tar,620662,0,-1)
	local rebel=Lua_DW_CreateObj( "flag" , 119013 , 781000 , 2 , 1 , 1 )
	local Alton=Lua_DW_CreateObj( "flag" , 119015 , 781000 , 3 , 1 , 1 )
	local Hifu=Lua_DW_CreateObj( "flag" , 119014 , 781000 , 4 , 1 , 1 )
	DW_MoveDirectToFlag( rebel , 781000 , 5 , 1  )
	Sleep(50)
	PlayMotion(rebel,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(rebel,"[SC_424516_001]")
	Sleep(30)
	DW_MoveDirectToFlag( rebel , 781000 , 6 , 1  )
	Sleep(10)
	DelObj(rebel)
	PlayMotion(Alton,101)
	Say(Alton,"[SC_424516_002]")
	AdjustFaceDir(Alton,Hifu , 0 )
	sleep(20)
	PlayMotion(Alton,112)
	Say(Alton,"[SC_424516_003]")
	sleep(20)
	AdjustFaceDir( Hifu, Alton, 0 )
	PlayMotion(Hifu,112)
	Say(Hifu,"[SC_424516_004]")
	sleep(20)
	PlayMotion(Hifu,112)
	Say(Hifu,"[SC_424516_005]")
	sleep(20)
	DW_MoveDirectToFlag( Hifu , 781000 , 7 , 1  )
	sleep(20)
	DelObj(Hifu)
	Say(Alton,"[SC_424516_006]")
	PlayMotion(Alton,101)
	sleep(10)
	DelObj(Alton)
	CancelBuff(Tar, 620662)
	Lua_ZonePE_3th_GetScore(100)
end

function LuaS_424433_MISSION_END()				--���ͩǪ�
	local ctrl = OwnerID()
	local RoomID = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
	local frog = Lua_CreateObjByDir( ctrl , 106157 , 100 , 0)
	local OldX,OldY,OldZ,OldDir = Lua_GetPostion(frog);
	local dis = 60
	local Cal1 = math.rad(OldDir)
	local Cal2 = Cal1+math.pi*2*(4/10);
	local Cal3 = Cal1+math.pi*2*(6/10);
	local snake1 = CreateObj( 106156, OldX-dis*math.cos(Cal2),OldY ,OldZ +dis*math.sin(Cal2),OldDir , 1 )
	local snake2 = CreateObj( 106156, OldX- dis*math.cos(Cal3),OldY ,OldZ +dis*math.sin(Cal3),OldDir , 1 )
	AdjustFaceDir( snake1, frog, 0 )
	AdjustFaceDir( snake2, frog, 0 )
	AddToPartition(frog,RoomID)
	AddToPartition(snake1,RoomID)
	AddToPartition(snake2,RoomID)
	SetAttack( snake1 , frog ) 
	SetAttack( snake2 , frog ) 
	sleep(40)
	NPCDead(frog ,snake1) 
	sleep(10)
	NPCDead(snake1,snake1) 
	sleep(10)
	NPCDead(snake2,snake2) 
	sleep(20)
	DelObj(frog)
	DelObj(snake1)
	DelObj(snake2)
end

function LuaQ_Z21COMEHERE_0()						--�ǥX��
		SetPlot(OwnerID(),"range","LuaQ_Z21COMEHERE_1",45)
end

function LuaQ_Z21COMEHERE_1()
	local npc = TargetID()
	local player =  OwnerID()
	If CheckFlag(player ,545594)==false THEN
		SetPos(player,-25383.7,162.7,35005.7,268.8)
		CallPlot(npc ,"LuaQ_Z21COMEHERE_2",npc ,player)
	else
		return
	end
end

function LuaQ_Z21COMEHERE_2(npc ,player )
	AddBuff(player,620953,0,-1)
	NPCsay(npc ,"[SC_Z21COME_01]")		--�K�I���䪺�L�ӡI
	--AdjustFaceDir(OwnerID(),TargetID() , 0 )
	PlayMotion( npc , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)
	NPCsay(npc ,"[SC_Z21COME_02]")		--�A���S���ݨ�ƻ�i�äH���A�̦n�Ѧѹ�ꪺ?�X�ӡI
	PlayMotion(npc ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(20)
	NPCsay(npc ,"[SC_Z21COME_03]")		--�n�O���äϧܭx�o�i�O���o�I
	PlayMotion(npc ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(20)
	NPCsay(npc ,"[SC_Z21COME_04]")		--�n�F�I�A�i�H���F�I
	SetFlag(player,545594,1)
	CancelBuff(player,620953)
end

function LuaQ_Z21_bloodeffect()
	addbuff(ownerID(),620954,0,-1)
end


function LuaS_DRNPC_SHOW()
	local obj = OwnerID()
	SetModeEx(obj,EM_SetModeType_Show,true)
	SetModeEx(obj,EM_SetModeType_MARK,false)
end

function LuaS_DRNPC_HIDE()
	local obj = OwnerID()
	SetModeEx(obj,EM_SetModeType_Show,false)
	SetModeEx(obj,EM_SetModeType_MARK,false)
end

function LuaM_Z21Lechif_matrix()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 13
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106064,Matrix,1, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106064,Matrix,1, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106064,Matrix,1, -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106064,Matrix,2, 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106064,Matrix,2, 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106064,Matrix,2, -1)
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaM_Z21Lechif_matrix" , 0 )
end

function LuaM_Z21Lechif_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_Z21Lechif_matrix" , 0 )
end
