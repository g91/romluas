---------------------------------------------------------------------------
--�ʧ@��
-----------------------------------------------------------------------------
function LuaP_117280_01()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)  ----�u�@��
	sleep(30)
	NPCSAY(OwnerID(),"[SC_117280_02]") ----�o�ӥ[�o�ӡK�K���ӥ[���ӡK�K
	sleep(30)
	NPCSAY(OwnerID(),"[SC_117280_01]")   ----�i�c�I�S���ѤF�I
	sleep(30)	
end

-----------------------------------------------------------------------------
function LuaP_117281_01()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_emote_head_shake)    ----�n�Y
	Sleep(40)
end

-----------------------------------------------------------------------------
function LuaP_117278_01()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)    ----�ۤU
	Sleep(40)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_LOOP)    
	Sleep(40)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)    
	Sleep(40)
end

-----------------------------------------------------------------------------
function LuaP_117374_01()
	AdjustFaceDir( TargetID(),OwnerID(), 0 )    ----���V	
end

function LuaP_117396_01()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Sleep(25)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE4)
	Sleep(25)
end

-----------------------------------------------------------------------------
function LuaPG_SIT_CHAIR()   ----���Ȥl�ϯ��_
	while 1 do
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN)
	sleep(50)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_CHAIR_END )
	sleep(50)
	end	
end

-----------------------------------------------------------------------------
function LuaPG_STRETCH()   ----�����i�y
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	sleep(30)
end

-----------------------------------------------------------------------------
function LuaPG_FEAR()   ----��{�X���߷P
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_head_shake)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_CRY)
	sleep(30)
end

-----------------------------------------------------------------------------
function LuaPG_applause()   ----���
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_applause)
end

-----------------------------------------------------------------------------
function LuaPG_angry()    ----�ͮ�A�Ϊ̤��@��
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
end

-----------------------------------------------------------------------------
function LuaPG_GUICKKILL()
	local Owner=OwnerID()
	local Target=TargetID()
	
	if Target~=nil then
		if   ReadRoleValue(Target,EM_RoleValue_OrgID)==102548 then
			KillID(Owner,Target)
		end
	end
end

-----------------------------------------------------------------------------
function LuaPG_GUICKKILL_01(wanttokill)
	local Owner=OwnerID()
	local wanttokill=TargetID()
	
	if wanttokill~=nil then
		if   ReadRoleValue(Target,EM_RoleValue_OrgID)==wanttokill then
			Sleep(5)
			KillID(Owner,wanttokill)
		end
	end
end

-----------------------------------------------------------------------------
function LuaPG_SURRENDER()    
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
end

-----------------------------------------------------------------------------

function LuaPG_STRANGE_VILLAGER_01()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	Sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)
	Sleep(20)
	NPCSAY(OwnerID(),"[SC_STRANGE_VILLAGER_01]")
end

-----------------------------------------------------------------------------
function LuaPG_LAUGH()  ----��
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
end

-----------------------------------------------------------------------------
function Lua_practice() ----�m�M
	CastSpell(OwnerID(),OwnerID(),497558)
end

-----------------------------------------------------------------------------
function Lua_PG_Gather()	----�@���u�@
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_GATHER_BEGIN)
----	FA_FindError()
end
-----------------------------------------------------------------------------
function Lua_PG_Gun_Channel()	----�j���w�ưʧ@
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_ATTACK_GUN_BEGIN)
end


-----------------------------------------------------------------------------
function Lua_PG_matrix()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 6
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(118593,Matrix,2,-1 )
--	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
--	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_PG_matrix" , 0 )
end

function Lua_PG_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_PG_matrix" , 0 )
end

------------------------------------------------------
function Lua_PG_BOYS()
	NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_01]")   
	Sleep(20)
end

function Lua_PG_BOYS_01()
	NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_03]")   
	Sleep(20)
end

function Lua_PG_BOYS_02()
	SetModeEx( OwnerID() , EM_SetModeType_HideName , true )		-- �W��
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )		-- ���i�аO

	while true do
		Sleep(30)
		NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_02]")   
		Sleep(130)
		NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_04]")   		
	end
end

------------------------------------------------------
function Lua_PG_Pit()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_2H)
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Find_Book()
	NPCSAY(OwnerID(),"[SC_FIND_BOOK]")
	Sleep(20)
	NPCSAY(OwnerID(),"[SC_FIND_BOOK_02]")
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Drink_and_Dance()	--�ܰs�g�w����
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_AMAZED)
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_08]")
	Sleep(10)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_09]")
end

------------------------------------------------------
function Lua_PG_Point()		--���V�e��
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	Sleep(30)
end

------------------------------------------------------
function Lua_PG_Think()		--���
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_THINK)
	Sleep(30)
end
------------------------------------------------------
function Lua_PG_Ask()			--���u�G�H�洫�����
	NPCSAY(OwnerID(),"[SC_ASK_01]")
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(30)
end

function Lua_PG_Ask_01()		--���u�G�H�洫�����
	NPCSAY(OwnerID(),"[SC_ASK_02]")
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Yell()		--BUFF
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(10)
end
------------------------------------------------------
function Lua_PG_Government()		--���u�x�������
	NPCSAY(OwnerID(),"[SC_GOVERNMENT]")
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(10)
end

function Lua_PG_Government_01()	--���u�x�������
	NPCSAY(OwnerID(),"[SC_GOVERNMENT_02]")
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_SPEAK)
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Buff()			--�G�H�u�@�P
	PlayMotionEX(OwnerID(),ruFUSION_MIME_BUFF_INSTANT,ruFUSION_MIME_BUFF_INSTANT)
	Sleep(10)
end


-----------------------------------------------------------------------------
function Lua_PG_forest_leader()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105842,Matrix,2,-1 )
	SetModeEx( ObjMatrix[1], EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105842,Matrix,2, 1 )
	SetModeEx( ObjMatrix[2], EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105842,Matrix,2, 0 )
	SetModeEx( ObjMatrix[3], EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_PG_forest_leader" , 0 )
end


-----------------------------------------------------------------------------
function Lua_PG_dodge()		
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
end

-----------------------------------------------------------------------------
function Lua_PG_NPC_01()		--�Ҫ����ưӤH
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_01]")
end

function Lua_PG_NPC_02()		--�a�W�p��
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_02]")
	Sleep(50)
end

function Lua_PG_NPC_03()		--�ͽװw�k
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_03]")
	Sleep(30)
end

function Lua_PG_NPC_04()		--�ͽװw�k
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_04]")
	Sleep(30)
end


function Lua_PG_NPC_05()		--�͸ܪ��G�H�L
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_06]")
	Sleep(50)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_07]")
end

function Lua_PG_NPC_06()		--�͸ܪ��G�H�L
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_05]")
	Sleep(30)
end

function Lua_PG_NPC_07()		--��f�����G�H
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_10]")
	Sleep(30)
end

function Lua_PG_NPC_08()		--��Z�����G�H
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_11]")
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_12]")
	Sleep(30)
end

function Lua_PG_NPC_09()		--�Q���ٻ����ӤH
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_13]")
	Sleep(30)
end

function Lua_PG_NPC_10()		--�Q���ٻ����ӤH
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_THINK)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_14]")
end

function Lua_PG_NPC_11()		--�W�o�����v
	PlayMotion( OwnerID(), ruFUSION_MIME_BUFF_INSTANT)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_15]")
	Sleep(30)
end

function Lua_PG_Yell_02()			--���R�h�𪺸G�H
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_16]")	
	Sleep(10)
end